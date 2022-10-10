--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiSHousesManager = {}

AzoKiSHousesManager.instanceRange = 1000
AzoKiSHousesManager.list = {}

local function addHouse(info, needDecode)
    ---@type House
    local house
    if needDecode then
        house = House(info.id, info.owner, json.decode(info.infos), info.ownerInfo, json.decode(info.inventory), info.street)
    else
        house = House(info.id, info.owner, info.infos, info.ownerInfo, info.inventory, info.street)
    end
    house:initMarker()
    house:initBlips()
    AzoKiSHousesManager.list[house.houseId] = house
end

local function loadHouses()
    MySQL.Async.fetchAll("SELECT * FROM AzoKi_houses", {}, function(houses)
        local tot = 0
        for id, info in pairs(houses) do
            tot = tot + 1
            addHouse(info, true)
        end
        print(AzoKi.prefix(AzoKiPrefixes.house, ("%i maisons importées depuis la db"):format(tot)))
    end)
end

local function createHouse(data, author, street, announce)
    MySQL.Async.insert("INSERT INTO AzoKi_houses (owner, ownerInfo, infos, inventory, createdAt, createdBy, street) VALUES(@a, @b, @c, @d, @e, @f, @g)", {
        ['a'] = "none",
        ['b'] = "none",
        ['c'] = json.encode(data),
        ['d'] = json.encode({}),
        ['e'] = os.time(),
        ['f'] = AzoKiServerUtils.getLicense(author),
        ['g'] = street
    }, function(insertId)
        addHouse({ id = insertId, owner = "none", infos = data, ownerInfo = "none", inventory = {}, street }, false)
        AzoKiServerUtils.toClient("addAvailableHouse", -1, { id = insertId, coords = data.entry })
        TriggerClientEvent("esx:showNotification", author, "~p~Création de la propriétée effectuée !")
        if announce then AzoKiServerUtils.toAll("advancedNotif", "~y~Agence immobilière", "~b~Nouvelle propriétée", ("Une nouvelle propriétée ~s~(~o~%s~s~) est disponible à ~p~%s ~s~pour la somme de ~p~%s$"):format(AzoKiInteriors[data.selectedInterior].label, street, ESX.Math.GroupDigits(tonumber(data.price))), "CHAR_MINOTAUR", 1) end
    end)
end

AzoKi.netHandle("esxloaded", function()
    loadHouses()
end)

AzoKi.netHandle("openPropertyMenu", function(source, propertyID)
    -- TODO -> (AntiCheat) Check la distance
    ---@type House
    local identifier = ESX.GetIdentifierFromId(source)
    local isAllowed = false
    local house = AzoKiSHousesManager.list[propertyID]
    for _,v in pairs(house.allowedPlayers) do 
        if v == identifier then
            isAllowed = true
        end
    end
    AzoKiServerUtils.toClient("openClientPropertyMenu", source, house.ownerLicense, { house.info.selectedInterior, house.info.price, propertyID, house.ownerInfo }, AzoKiServerUtils.getLicense(source), isAllowed, house.public)
end)

AzoKi.netRegisterAndHandle("saveProperty", function(info, street, announce)
    -- TODO -> (AntiCheat) Check le job de la source
    local source = source
    createHouse(info, source, street, announce)
end)

AzoKi.netRegisterAndHandle("enterHouse", function(houseId, isGuest, from)
    if not AzoKiSHousesManager.list[houseId] then
        return
    end
    local source = source
    local identifier = ESX.GetIdentifierFromId(source)
    ---@type House
    local house = AzoKiSHousesManager.list[houseId]
    -- TODO -> Faire le système de clés (autoriser d'autres joueurs)
    if not house.public then
        if not isGuest then
            if identifier ~= house.ownerLicense then
                return
            end
        else
            local isAllowed = false
            for _,v in pairs(house.allowedPlayers) do
                if v == identifier then
                    isAllowed = true
                end
            end 
            if not isAllowed then
                return
            end
        end
    end
    house:enter(source, identifier ~= house.ownerLicense, from)
end)

AzoKi.netRegisterAndHandle("buyProperty", function(houseId)
    if not AzoKiSHousesManager.list[houseId] then
        return
    end
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local bank = xPlayer.getAccount("bank").money
    ---@type House
    local house = AzoKiSHousesManager.list[houseId]
    if house.ownerLicense ~= "none" then
        TriggerClientEvent("esx:showNotification", source, "~b~Cette maison a déjà été achetée !")
        return
    end
    local price = tonumber(house.info.price)
    if bank >= price then
        xPlayer.removeAccountMoney("bank", price)
        --local license = AzoKiServerUtils.getLicense(source)
        local identifier = ESX.GetIdentifierFromId(source)
        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @a", {
            ['a'] = identifier
        }, function(res)
            if res[1] then
                MySQL.Async.execute("UPDATE AzoKi_houses SET owner = @a, ownerInfo = @b WHERE id = @c", {
                    ['a'] = identifier,
                    ['b'] = res[1].firstname.." "..res[1].lastname,
                    ['c'] = houseId
                }, function(done)
                    AzoKiSHousesManager.list[houseId].ownerLicense = identifier
                    AzoKiSHousesManager.list[houseId].ownerInfo = res[1].firstname.." "..res[1].lastname
                    AzoKiServerUtils.toClient("addOwnedHouse", source, {id = houseId, coords = house.info.entry})
                    AzoKiServerUtils.toClient("advancedNotif", source, "~y~Agence immobilière", "~b~Achat de propriétée", "~p~Félicitations ~s~! Cette propriétée est désormais la votre ! Profitez-en bien.", "CHAR_MINOTAUR", 1)
                    AzoKiServerUtils.toAll("houseNoLongerAvailable", houseId)
                end)
            end
        end)

    else
        AzoKiServerUtils.toClient("advancedNotif", source, "~y~Agence immobilière", "~b~Achat de propriétée", "Vous n'avez pas assez d'argent en banque pour acheter cette propriétée !", "CHAR_MINOTAUR", 1)
    end
end)

AzoKi.netRegisterAndHandle("requestAvailableHouses", function()
    local source = source
    local identifier = AzoKiServerUtils.getLicense(source)
    local allowed = {}
    local available = {}
    local owned = {}
    ---@param house House
    for houseID, house in pairs(AzoKiSHousesManager.list) do
        if house.ownerLicense == "none" then
            available[houseID] = house.info.entry
        else
            if house.ownerLicense == identifier then
                owned[houseID] = house.info.entry
            else
                for _,allowedLicense in pairs(house.allowedPlayers) do
                    if identifier == allowedLicense then
                        allowed[houseID] = {coords = house.info.entry, name = house.ownerInfo}
                    end
                end
            end
        end
    end
    AzoKiServerUtils.toClient("cbAvailableHouses", source, available, owned, allowed)
end)

AzoKi.netRegisterAndHandle("setHouseAlloweds", function(houseId, allowedTable, isPublic)
    if not AzoKiSHousesManager.list[houseId] then
        return
    end
    local newHouseAllowedTable = {}
    local source = source
    local license = AzoKiServerUtils.getLicense(source)
    ---@type House
    local house = AzoKiSHousesManager.list[houseId]
    if not house:isOwner(source) then 
        return
    end
    house.allowedPlayers = {}
    for k,v in pairs(allowedTable) do
        if v.can == true then
            table.insert(newHouseAllowedTable, k)
        end
    end
    house.public = isPublic
    house.allowedPlayers = newHouseAllowedTable
    AzoKiSHousesManager.list[houseId] = house
    TriggerClientEvent("esx:showNotification", source, "~p~Modification appliquées")
end)

AzoKi.netRegisterAndHandle("AzoKi:Ouvert", function()
    TriggerClientEvent("esx:showNotification", -1, "~s~Votre ~p~Agent Imo ~s~est désormais ~p~ouvert ~s~!")
end)

AzoKi.netRegisterAndHandle("AzoKi:Fermée", function()
    TriggerClientEvent("esx:showNotification", -1, "~s~Votre ~p~Agent Imo ~s~est désormais ~b~fermé ~s~!")
end)