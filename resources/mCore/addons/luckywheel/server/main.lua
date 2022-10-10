---@author Pablo Z.
---@version 1.0
--[[
  This file is part of AzoKi RolePlay.
  
  File [main] created at [21/04/2021 21:01]

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local availableRewards = {
    "visione",
}

local vendorNpc, vendorZone
local currentVehicle = availableRewards[math.random(1, #availableRewards)]

local currentlyAwaitingTurnPlayers = {}
local timedPlayers = {}

local paidTurns = {}

function CFXID(source)
    if (source ~= nil) then
        local identifiers = {}
        local playerIdentifiers = GetPlayerIdentifiers(source)
        for _, v in pairs(playerIdentifiers) do
            local before, after = playerIdentifiers[_]:match("([^:]+):([^:]+)")
            identifiers[before] = playerIdentifiers[_]
        end
        return identifiers
    else
        error("source is nil")
    end
end


AzoKi.netHandle("addPaidTurn", function(license)
    if not paidTurns[license] then
        paidTurns[license] = 0
        MySQL.Async.insert("INSERT INTO AzoKi_luckwheel_paid (license) VALUES(@a)", {
            ['a'] = license
        })
    else
        paidTurns[license] = paidTurns[license] + 1
        MySQL.Async.execute("UPDATE AzoKi_luckwheel_paid SET ammount = ammount + 1 WHERE license = @a", {
            ['a'] = license
        })
    end
end)

AzoKi.netHandle("removePaidTurn", function(license)
    if not paidTurns[license] then
        return
    end
    local final = (paidTurns[license] - 1)
    if final <= 0 then
        paidTurns[license] = nil
        MySQL.Async.execute("DELETE FROM AzoKi_luckwheel_paid WHERE license = @a", {
            ['a'] = license
        })
    else
        paidTurns[license] = final
        MySQL.Async.execute("UPDATE AzoKi_luckwheel_paid SET ammount = ammount - 1 WHERE license = @a", {
            ['a'] = license
        })
    end
end)

local function countPaidTurns(license)
    return paidTurns[license] or 0
end

local function recomp(str, source, color)
    AzoKiServerUtils.webhook(("Le joueur %s a gagné: %s"):format(GetPlayerName(source), str), color, "https://discord.com/api/webhooks/830047199051251722/O-Ru6RMHdxcnt_M5fENbaZ-bJDSm0jWXuYEggR5JLnj8vMS0sudrzVdi1LXNcKA8-_NO")
end

AzoKiServerUtils.registerConsoleCommand("luckywheelSetCar", function(source, args)
    currentVehicle = args[1]
    AzoKiServerUtils.trace("Véhicule de la roue changée !", AzoKiPrefixes.succes)
    AzoKiServerUtils.toAll("luckywheelVehicleChange", args[1])
end)

AzoKiSPlayersManager.registerEventOverrider(PLAYER_EVENT_TYPE.LEAVING, function(source)
    currentlyAwaitingTurnPlayers[source] = nil
end)

AzoKi.netRegisterAndHandle("luckywheelRequestFinalPrice", function(vehicleProps)
    print("Received event")
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    ---@type Player
    local AzoKiPlayer = AzoKiSPlayersManager.getPlayer(source)
    if currentlyAwaitingTurnPlayers[source] == nil then
        return
    end
    if currentlyAwaitingTurnPlayers[source] == "free" then
        currentlyAwaitingTurnPlayers[source] = nil
        local ran = math.random(1, 30)
        if ran == 5 then
            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state) VALUES (@owner, @plate, @vehicle, @type, 1)', {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = vehicleProps.plate,
                ['@vehicle'] = json.encode(vehicleProps),
                ['@type'] = "car"
            })
            AzoKiServerUtils.toClient("advancedNotif", source, "~b~OneLife", "~y~Roue de la chance", "~p~Félicitations ~s~! Vous avez gagné la ~b~voiture ~s~!", "CHAR_SEALIFE", 1)
            recomp("car", source, "red")
            return
        end
        --if ran <= 10 then
            --local expRandom = math.random(900, 1900)
            --AzoKiPlayer:setAddonCache("exp", (AzoKiPlayer:getAddonCache("exp") + expRandom), true)
            --AzoKiServerUtils.toClient("advancedNotif", source, "~b~OneLife", "~y~Roue de la chance", ("~p~Félicitations ~s~! Vous avez gagné ~b~%s EXP ~s~AzoKi RP !"):format(expRandom), "CHAR_SEALIFE", 1)
            --recomp(("%s exp"):format(expRandom), source, "orange")
            --return
        --end
        if ran <= 20 then
            local moneyRandom = math.random(5000, 13500)
            xPlayer.addAccountMoney('cash', moneyRandom)
            AzoKiServerUtils.toClient("advancedNotif", source, "~b~OneLife", "~y~Roue de la chance", ("~p~Félicitations ~s~! Vous avez gagné ~p~%s$ ~s~!"):format(moneyRandom), "CHAR_SEALIFE", 1)
            recomp(("%s$"):format(moneyRandom), source, "green")
            return
        end
        AzoKiServerUtils.toClient("advancedNotif", source, "~b~OneLife", "~y~Roue de la chance", "~b~Dommage ~s~! Vous n'avez rien gagné... Revenez une prochaine fois !", "CHAR_SEALIFE", 1)
        recomp("rien", source, "grey")
        return
    elseif currentlyAwaitingTurnPlayers[source] == "paid" then
        currentlyAwaitingTurnPlayers[source] = nil
        local ran, plate = math.random(1, 30), AzoKiGameUtils.GeneratePlate()
        if ran == 5 then
            -- INSERT INTO tebex_players_wallet (identifiers, transaction, price, currency, points) VALUES ('{id}', '{transaction}', '{packagePrice}', '{currency}', '1500')
            local identifier = AzoKiServerUtils.getIdentifiers(source);
            if (identifier['fivem']) then
                local before, after = identifier['fivem']:match("([^:]+):([^:]+)")
                MySQL.Async.execute("INSERT INTO tebex_players_wallet (identifiers, transaction, price, currency, points) VALUES (@a, 'Roue', '0', 'EUR', '1500')", {
                    ['a'] = after
                })
            end
            AzoKiServerUtils.toClient("advancedNotif", source, "~b~OneLife", "~y~Roue de la chance", "~p~Félicitations ~s~! Vous avez gagné la ~b~1500 Pultions~s~!", "CHAR_SEALIFE", 1)
            return
        end
        if ran <= 10 then
            MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state) VALUES (@owner, @plate, @vehicle, @type, 1)', {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = vehicleProps.plate,
                ['@vehicle'] = "{\"model\":"..AzoKi.hash("sultanrs")..",\"plate\":\""..plate.."\"}",
                ['@type'] = "car"
            })
            AzoKiServerUtils.toClient("advancedNotif", source, "~b~OneLife", "~y~Roue de la chance", "~p~Félicitations ~s~! Vous avez gagné la ~b~Sultan RS ~s~!", "CHAR_SEALIFE", 1)
            return
        end
        if ran <= 20 then
            local moneyRandom = 250000
            xPlayer.addAccountMoney('cash', moneyRandom)
            AzoKiServerUtils.toClient("advancedNotif", source, "~b~OneLife", "~y~Roue de la chance", ("~p~Félicitations ~s~! Vous avez gagné ~p~%s$ ~s~!"):format(moneyRandom), "CHAR_SEALIFE", 1)
            return
        end
        AzoKiServerUtils.toClient("advancedNotif", source, "~b~OneLife", "~y~Roue de la chance", "~b~Dommage ~s~! Vous n'avez rien gagné... Revenez une prochaine fois !", "CHAR_SEALIFE", 1)
        recomp("rien", source, "grey")
        return
    end
    -- @TODO -> Faire une variante pour les payantes
end)

AzoKi.netRegisterAndHandle("luckywheelRequestFreeTurn", function()
    local source = source
    local license = AzoKiServerUtils.getLicense(source)
    local time = os.time()
    local cd = time + ((60 * 60) * 24)
    if timedPlayers[license] ~= nil then
        return
    end
    MySQL.Async.fetchAll("INSERT INTO AzoKi_luckywheel (license,time) VALUES(@a,@b)", { ['a'] = license, ['b'] = cd })
    currentlyAwaitingTurnPlayers[source] = "free"
    timedPlayers[license] = cd
    AzoKiServerUtils.toClient("luckywheelCbTurn", source)
end)

AzoKi.netRegisterAndHandle("luckywheelRequestPaidTurn", function()
    local source = source
    local license = AzoKiServerUtils.getLicense(source)
    if countPaidTurns(license) <= 0 then
        return
    end
    AzoKi.toInternal("removePaidTurn", license)
    currentlyAwaitingTurnPlayers[source] = "paid"
    AzoKiServerUtils.toClient("luckywheelCbTurn", source)
end)

AzoKi.netRegisterAndHandle("luckywheelRequestCurrentVehicle", function()
    local source = source
    AzoKiServerUtils.toClient("luckywheelCbCurrentVehicle", source, currentVehicle)
end)

AzoKi.netHandle("esxloaded", function()
    MySQL.Async.fetchAll("SELECT * FROM AzoKi_luckwheel_paid", {}, function(result)
        for k,v in pairs(result) do
            paidTurns[v.license] = v.ammount
        end
    end)
    vendorNpc = AzoKiSNpcsManager.createPublic("a_m_y_stbla_02", false, true, { coords = vector3(218.1947479248, -868.87200927734, 30.492116928101), heading = 255.41 }, "WORLD_HUMAN_HIKER_STANDING", nil)
    vendorNpc:setInvincible(true)
    vendorNpc:setFloatingText("Si tu veux faire tourner la roue ~b~OneLife~s~, c'est par ici !", 8.5)

    vendorZone = AzoKiSZonesManager.createPublic(vector3(220.05, -869.4, 30.49), 22, { r = 3, g = 157, b = 252, a = 255 }, function(source)
        vendorNpc:playSpeechForPlayer("GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL_CLEAR", source)
        local license = AzoKiServerUtils.getLicense(source)
        if timedPlayers[license] ~= nil then
            local time = os.time()
            if timedPlayers[license] <= time then
                timedPlayers[license] = nil
                MySQL.Async.execute("DELETE FROM AzoKi_luckywheel WHERE license = @a", { ['a'] = license })
                AzoKiServerUtils.toClient("luckywheelOpenMenu", source, true, countPaidTurns(license))
            else
                AzoKiServerUtils.toClient("luckywheelOpenMenu", source, false, countPaidTurns(license))
            end
        else
            AzoKiServerUtils.toClient("luckywheelOpenMenu", source, true, countPaidTurns(license))
        end
    end, "Appuyez sur ~INPUT_CONTEXT~ pour parler au vendeur de tickets", 15.0, 1.0)

    AzoKiSBlipsManager.createPublic(vector3(220.05, -869.4, 30.49), 266, 27, 0.8, "Roue de la chance", true)

    local time = os.time()
    MySQL.Async.fetchAll("SELECT * FROM AzoKi_luckywheel", {}, function(result)
        for k, v in pairs(result) do
            if v.time <= time then
                MySQL.Async.execute("DELETE FROM AzoKi_luckywheel WHERE license = @a", { ['a'] = v.license })
            else
                timedPlayers[v.license] = v.time
            end
        end
    end)
end)

AzoKi.netRegisterAndHandle("luckywheelPaidTurn", function()
    local source = source
    local price = 1500
    local license = AzoKiServerUtils.getLicense(source)
    local identifier = CFXID(source);
    if (identifier['fivem']) then
        local before, after = identifier['fivem']:match("([^:]+):([^:]+)")
        MySQL.Async.fetchAll("SELECT SUM(points) FROM tebex_players_wallet WHERE identifiers = @identifiers", {
            ['@identifiers'] = after
        }, function(result)
            local current = tonumber(result[1]["SUM(points)"]);
            if (current ~= nil) then
                if (current >= price) then
                    MySQL.Async.execute('INSERT INTO tebex_players_wallet (identifiers, transaction, price, currency, points) VALUES (@identifiers, @transaction, @price, @currency, @points)', {
                        ["@identifiers"] = after,
                        ["@transaction"] = "Achat d'un tour de roue de la fortune",
                        ["@price"] = '0',
                        ["@currency"] = 'Points',
                        ["@points"] = -500,
                    }, function(result)
                        AzoKi.toInternal("addPaidTurn", license)
                        AzoKiServerUtils.toClient("luckywheelPaidCbTurn", source)
                    end);
                else
                    AzoKiServerUtils.toClient("advancedNotif", source, "Roue de la fortune", "~b~OneLife", "Vous ne procédez pas les points nécessaires pour un tour de roue de la fortune.", "CHAR_SEALIFE", 1)
                    AzoKiServerUtils.toClient("luckywheelPaidNotCbTurn", source)
                end
            else
                AzoKiServerUtils.toClient("advancedNotif", source, "Roue de la fortune", "~b~OneLife",  "~b~Dommage~s~, Vous n'avez pas lié votre compte (~p~forum.cfx.re~s~) à fivem !", "CHAR_SEALIFE", 1)
                AzoKiServerUtils.toClient("luckywheelPaidNotCbTurn", source)
            end
        end);
    else
        AstraServerUtils.toClient("advancedNotif", source, "Roue de la fortune", "~b~OneLife",  "~b~Dommage~s~, Vous n'avez pas lié votre compte (~p~forum.cfx.re~s~) à fivem !", "CHAR_SEALIFE", 1)
        AstraServerUtils.toClient("luckywheelPaidNotCbTurn", source)
    end
end)