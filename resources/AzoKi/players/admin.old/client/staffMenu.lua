local isMenuOpened, cat = false, "adminmenu"
local prefix = "~p~[Admin]~s~"
local filterArray = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" }
local filter = 1
local creditsSent = false

local TARGET_INVENTORY = {}

IS_IN_STAFF = false

isDelgunEnabled = false

IN_SPECTATE = false

local hideTakenReports = false

local Items = {}     
local Armes = {}   
local ArgentSale = {} 
local ArgentCash = {}
local ArgentBank = {}

local allJobsServer = {}
local allGradeForJobSelected = {}

local function subCat(name)
    return cat .. name
end

local function msg(string)
    ESX.ShowNotification(string)
end

local function colorByState(bool)
    if bool then
        return "~p~"
    else
        return "~s~"
    end
end

local function statsSeparator()
    AzoKiUI.Separator("Connectés: ~p~" .. connecteds .. " ~p~|~s~ Staff en ligne: ~o~" .. staff)
end

local function generateTakenBy(reportID)
    if localReportsTable[reportID].taken then
        return "~s~ | Pris par: ~o~" .. localReportsTable[reportID].takenBy
    else
        return ""
    end
end

local ranksRelative = {
    ["user"] = 1,
    ["helper"] = 2,
    ["modo"] = 3,
    ["admin"] = 4,
    ["superadmin"] = 5,
    ["responsable"] = 6,
    ["_dev"] = 7
}

local ranksInfos = {
    [1] = { label = "Joueur", rank = "user" },
    [2] = { label = "Helper", rank = "helper" },
    [3] = { label = "Modérateur", rank = "modo" },
    [4] = { label = "Admin", rank = "admin" },
    [5] = { label = "Super Admin", rank = "superadmin" },
    [6] = { label = "Responsable Staff", rank = "responsable" },
    [7] = { label = "Fondateur", rank = "_dev" }
}

local function getRankDisplay(rank)
    local ranks = {
        ["_dev"] = "~p~[Fondateur] ~s~",
        ["responsable"] = "~p~[Responsable Staff] ~s~",
        ["superadmin"] = "~p~[S.Admin] ~s~",
        ["admin"] = "~p~[Admin] ~s~",
        ["modo"] = "~p~[Modérateur] ~s~",
        ["helper"] = "~p~[Helper] ~s~",
    }
    return ranks[rank] or ""
end

local function getIsTakenDisplay(bool)
    if bool then
        return ""
    else
        return "~p~[EN ATTENTE]~s~ "
    end
end

local function starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function getBaseSkin()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0
        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerEvent('esx:restoreLoadout')
            end)
        end)

    end)
end

RegisterCommand("+admin", function()
    if ESX.GetPlayerData()['group'] ~= 'user' then
        tcheckmoisa()
        openMenu()
    end
end, false)

RegisterKeyMapping('+admin', 'Menu d\'administration', 'keyboard', 'F10')

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)
RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	ESX.PlayerData.job2 = job2
end)

local function getPlayerInv(player)
    
    Items = {}
    Armes = {}
    ArgentSale = {}
    ArgentCash = {}
    ArgentBank = {}
    
    ESX.TriggerServerCallback('adminmenu:getOtherPlayerData', function(data)
    
    
        for i=1, #data.accounts, 1 do
            if data.accounts[i].name == 'bank' and data.accounts[i].money > 0 then
                table.insert(ArgentBank, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'bank',
                    itemType = 'item_bank',
                    amount   = data.accounts[i].money
                })
    
                break
            end
        end
    
    
        for i=1, #data.accounts, 1 do
            if data.accounts[i].name == 'money' and data.accounts[i].money > 0 then
                table.insert(ArgentCash, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'money',
                    itemType = 'item_cash',
                    amount   = data.accounts[i].money
                })
    
                break
            end
        end
    
        for i=1, #data.accounts, 1 do
            if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
                table.insert(ArgentSale, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'black_money',
                    itemType = 'item_account',
                    amount   = data.accounts[i].money
                })
    
                break
            end
        end
    
        for i=1, #data.weapons, 1 do
            table.insert(Armes, {
                label    = ESX.GetWeaponLabel(data.weapons[i].name),
                value    = data.weapons[i].name,
                right    = data.weapons[i].ammo,
                itemType = 'item_weapon',
                amount   = data.weapons[i].ammo
            })
        end
    
        for i=1, #data.inventory, 1 do
            if data.inventory[i].count > 0 then
                table.insert(Items, {
                    label    = data.inventory[i].label,
                    right    = data.inventory[i].count,
                    value    = data.inventory[i].name,
                    itemType = 'item_standard',
                    amount   = data.inventory[i].count
                })
            end
        end
    end, GetPlayerServerId(player))
end

function tcheckmoisa()
    ESX.TriggerServerCallback('finalmenuadmin:getAllItems', function(allItems)
        allItemsServer = allItems
    end)

    ESX.TriggerServerCallback('finalmenuadmin:getAllJobs', function(allJobs)
        allJobsServer = allJobs
    end)
end

function openMenu()
    if menuOpen then
        return
    end
    if permLevel == "user" then
        msg("~p~Vous n'avez pas accès à ce menu.")
        return
    end
    local selectedColor = 1
    local cVarLongC = { "~p~", "~p~", "~o~", "~y~", "~c~", "~p~", "~p~" }
    local cVar1, cVar2 = "~y~", "~p~"
    local cVarLong = function()
        return cVarLongC[selectedColor]
    end
    menuOpen = true

    RMenu.Add(cat, subCat("main"), AzoKiUI.CreateMenu("", "Menu administratif"))
    RMenu:Get(cat, subCat("main")).Closed = function()
    end

    RMenu.Add(cat, subCat("players"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("players")).Closed = function()
    end

    RMenu.Add(cat, subCat("reports"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("reports")).Closed = function()
    end

    RMenu.Add(cat, subCat("param"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("param")).Closed = function()
    end

    RMenu.Add(cat, subCat("reports_take"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("reports")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("reports_take")).Closed = function()
    end

    RMenu.Add(cat, subCat("playersManage"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("players")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("playersManage")).Closed = function()
    end

    RMenu.Add(cat, subCat("playersInventaire"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("playersInventaire")).Closed = function()
    end

    RMenu.Add(cat, subCat("setGroup"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("setGroup")).Closed = function()
    end

    RMenu.Add(cat, subCat("setjobMenu"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("setjobMenu")).Closed = function()
    end

    RMenu.Add(cat, subCat("setjobMenuSub"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("setjobMenu")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("setjobMenuSub")).Closed = function()
    end

    RMenu.Add(cat, subCat("items"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("items")).Closed = function()
    end

    RMenu.Add(cat, subCat("vehicle"), AzoKiUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("vehicle")).Closed = function()
    end

    AzoKiUI.Visible(RMenu:Get(cat, subCat("main")), true)
    Citizen.CreateThread(function()
        while menuOpen do
            Wait(800)
            if cVar1 == "~y~" then
                cVar1 = "~o~"
            else
                cVar1 = "~y~"
            end
            if cVar2 == "~p~" then
                cVar2 = "~s~"
            else
                cVar2 = "~p~"
            end
        end
    end)
    Citizen.CreateThread(function()
        while menuOpen do
            Wait(250)
            selectedColor = selectedColor + 1
            if selectedColor > #cVarLongC then
                selectedColor = 1
            end
        end
    end)
    Citizen.CreateThread(function()
        while menuOpen do
            local shouldStayOpened = false
            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("main")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()

                if isStaffMode then
                    AzoKiUI.ButtonWithStyle("~p~Désactiver le Staff Mode", nil, {}, not serverInteraction, function(_, _, s)
                        if s then
                            serverInteraction = true
                            IS_IN_STAFF = false
                            blipsActive = false
                            NoClip(false)
                            msg("~y~Désactivation du StaffMode...")
                            TriggerServerEvent("adminmenu:setStaffState", false)
                        end
                    end)
                else
                    AzoKiUI.ButtonWithStyle("~p~Activer le Staff Mode", nil, {}, not serverInteraction, function(_, _, s)
                        if s then
                            serverInteraction = true
                            IS_IN_STAFF = true
                            msg("~y~Activation du StaffMode...")
                            TriggerServerEvent("adminmenu:setStaffState", true)
                        end
                    end)
                end

                AzoKiUI.Separator("↓ ~p~Assistance ~s~↓")

                AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Gestion des reports (~p~" .. reportCount .. "~s~)", nil, { RightLabel = "→→" }, isStaffMode, function(_, _, s)
                end, RMenu:Get(cat, subCat("reports")))

                if isStaffMode then
                    AzoKiUI.Separator("↓ ~y~Modération ~s~↓")

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Gestion joueurs", nil, { RightLabel = "→→" }, true, function()
                    end, RMenu:Get(cat, subCat("players")))
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Gestion véhicules", nil, { RightLabel = "→→" }, canUse("vehicles2", permLevel), function()
                    end, RMenu:Get(cat, subCat("vehicle")))
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Personnel", nil, { RightLabel = "→→" }, true, function()
                    end, RMenu:Get(cat, subCat("param")))



                end
            end, function()
            end, 1)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("players")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                AzoKiUI.Checkbox(cVarLong() .. "→ " .. colorByState(showAreaPlayers) .. "Restreindre à ma zone", nil, showAreaPlayers, { Style = AzoKiUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    showAreaPlayers = Checked;
                end, function()
                end, function()
                end)
                AzoKiUI.Separator("↓ ~p~Joueurs ~s~↓")
                if not showAreaPlayers then
                    for source, player in pairs(localPlayers) do
                        AzoKiUI.ButtonWithStyle(getRankDisplay(player.rank) .. "~s~[~o~" .. source .. "~s~] " .. cVarLong() .. "→ ~s~" .. player.name or "<Pseudo invalide>" .. " (~p~" .. player.timePlayed[2] .. "h " .. player.timePlayed[1] .. "min~s~)", nil, { RightLabel = "→→" }, ranksRelative[permLevel] >= ranksRelative[player.rank] and source ~= GetPlayerServerId(PlayerId()), function(_, _, s)
                            if s then
                                selectedPlayer = source
                            end
                        end, RMenu:Get(cat, subCat("playersManage")))
                    end
                else
                    for _, player in ipairs(GetActivePlayers()) do
                        local sID = GetPlayerServerId(player)
                        if localPlayers[sID] ~= nil then
                            AzoKiUI.ButtonWithStyle(getRankDisplay(localPlayers[sID].rank) .. "~s~[~o~" .. sID .. "~s~] " .. cVarLong() .. "→ ~s~" .. localPlayers[sID].name or "<Pseudo invalide>" .. " (~p~" .. localPlayers[sID].timePlayed[2] .. "h " .. localPlayers[sID].timePlayed[1] .. "min~s~)", nil, { RightLabel = "→→" }, ranksRelative[permLevel] >= ranksRelative[localPlayers[sID].rank] and source ~= GetPlayerServerId(PlayerId()), function(_, _, s)
                                if s then
                                    selectedPlayer = sID
                                end
                            end, RMenu:Get(cat, subCat("playersManage")))
                        end
                    end
                end
            end, function()
            end, 1)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("reports")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                AzoKiUI.Separator("↓ ~p~Paramètres ~s~↓")
                AzoKiUI.Checkbox(colorByState(hideTakenReports) .. "Cacher les pris en charge", nil, hideTakenReports, { Style = AzoKiUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    hideTakenReports = Checked;
                end, function()
                end, function()
                end)
                AzoKiUI.Separator("↓ ~y~Reports ~s~↓")
                for sender, infos in pairs(localReportsTable) do
                    if infos.taken then
                        if hideTakenReports == false then
                            AzoKiUI.ButtonWithStyle(getIsTakenDisplay(infos.taken) .. "[~p~" .. infos.id .. "~s~] " .. cVarLong() .. "→ ~s~" .. infos.name, "~p~Créé il y a~s~: "..infos.timeElapsed[1].."m"..infos.timeElapsed[2].."h~n~~p~ID Unique~s~: #" .. infos.id .. "~n~~y~Description~s~: " .. infos.reason .. "~n~~o~Pris en charge par~s~: " .. infos.takenBy, { RightLabel = "→→" }, true, function(_, _, s)
                                if s then
                                    selectedReport = sender
                                end
                            end, RMenu:Get(cat, subCat("reports_take")))
                        end
                    else
                        AzoKiUI.ButtonWithStyle(getIsTakenDisplay(infos.taken) .. "[~p~" .. infos.id .. "~s~] " .. cVarLong() .. "→ ~s~" .. infos.name, "~p~Créé il y a~s~: "..infos.timeElapsed[1].."m"..infos.timeElapsed[2].."h~n~~p~ID Unique~s~: #" .. infos.id .. "~n~~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, true, function(_, _, s)
                            if s then
                                selectedReport = sender
                            end
                        end, RMenu:Get(cat, subCat("reports_take")))
                    end
                end
            end, function()
            end, 1)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("param")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                AzoKiUI.Separator("↓ ~p~Personnel ~s~↓")
                if ESX.GetPlayerData()['group'] ~= "user" then
                    AzoKiUI.Checkbox(cVarLong() .. "→ ~s~NoClip", "Vous permet de vous déplacer librement sur toute la carte sous forme de caméra libre, pour ~p~augmenter la vitesse de celui-ci~s~ utiliser la molette", isNoClip, { Style = AzoKiUI.CheckboxStyle.Tick, RightLabel = "" }, function(Hovered, Selected, Active, Checked)
                        isNoClip = Checked;
                    end, function()
                        NoClip(true)
                    end, function()
                        NoClip(false)
                    end)
                end
                if ESX.GetPlayerData()['group'] ~= "user" then
                    AzoKiUI.Checkbox(cVarLong() .. "→ ~s~Affichage des GamerTags", nil, isNameShown, { Style = AzoKiUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        isNameShown = Checked;
                    end, function()
                        showNames(true)
                    end, function()
                        showNames(false)
                    end)
                end
                if ESX.GetPlayerData()['group'] ~= "user" then
                    AzoKiUI.Checkbox(cVarLong() .. "→ ~s~Affichage des BLIPS", nil, blipsActive, { Style = AzoKiUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        blipsActive = Checked;
                    end, function()
                    end, function()
                    end)
                end
                if ESX.GetPlayerData()['group'] ~= "user" then
                    AzoKiUI.Checkbox(cVarLong() .. "→ ~s~Activé Delgun", nil, isDelgunEnabled, { Style = AzoKiUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        isDelgunEnabled = Checked;
                    end, function()
                    end, function()
                    end)
                end
                AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Vous téléportez sur un marker", nil, { RightLabel = "→→" }, true, function(_, _, s)
                    if s then
                        plyPed = PlayerPedId()
                        local waypointHandle = GetFirstBlipInfoId(8)

                        if DoesBlipExist(waypointHandle) then
                            Citizen.CreateThread(function()
                                local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
                                local foundGround, zCoords, zPos = false, -500.0, 0.0

                                while not foundGround do
                                    zCoords = zCoords + 10.0
                                    RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
                                    Citizen.Wait(0)
                                    foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)

                                    if not foundGround and zCoords >= 2000.0 then
                                        foundGround = true
                                    end
                                end
                                SetPedCoordsKeepVehicle(plyPed, waypointCoords.x, waypointCoords.y, zPos)
                                msg("Vous avez été TP")
                            end)
                        else
                            msg("Pas de marqueur sur la carte")
                        end
                    end
                end)
                if ESX.GetPlayerData()['group'] == "_dev" then
                    AzoKiUI.Separator("↓ ~p~Te changer ~s~↓")
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Normal", nil, { RightLabel = "→→" }, canUse("ped", permLevel), function(_, _, s)
                        if s then
                            getBaseSkin()
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Vous mettre en ped", nil, { RightLabel = "→→" }, canUse("ped", permLevel), function(_, _, s)
                        if s then
                            local j1 = PlayerId()
                            local newped = input("Ped", "", 100, false)
                            if newped ~= nil and newped ~= "" then
                                local p1 = GetHashKey(newped)
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                                msg('c\'est bon c\'est changer')
                            end
                        end
                    end)
                end
            end, function()
            end, 1)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("reports_take")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                if localReportsTable[selectedReport] ~= nil then
                    AzoKiUI.Separator("ID du Report: ~p~#" .. localReportsTable[selectedReport].uniqueId .. " ~s~| ID de l'auteur: ~y~" .. selectedReport .. generateTakenBy(selectedReport))
                    AzoKiUI.Separator("↓ ~p~Actions sur le report ~s~↓")
                    local infos = localReportsTable[selectedReport]
                    if not localReportsTable[selectedReport].taken then
                        AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Prendre en charge ce report", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, true, function(_, _, s)
                            if s then
                                TriggerServerEvent("adminmenu:takeReport", selectedReport)
                            end
                        end)
                    end
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Cloturer ce report", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:closeReport", selectedReport)
                        end
                    end)
                    AzoKiUI.Separator("↓ ~y~Actions rapides ~s~↓")
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Revive", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            msg("~y~Revive du joueur en cours...")
                            TriggerServerEvent("adminmenu:revive", selectedReport)
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Soigner", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            msg("~y~Heal du joueur en cours...")
                            TriggerServerEvent("adminmenu:heal", selectedReport)
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~TP sur lui", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:goto", selectedReport)
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~TP sur moi", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:bring", selectedReport, GetEntityCoords(PlayerPedId()))
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~TP Parking Central", "~y~Description~s~: " .. infos.reason, { RightLabel = "→→" }, canUse("tppc", permLevel), function(_, _, s)
                        if s then
                            msg("~y~Téléportation du joueur en cours...")
                            TriggerServerEvent("adminmenu:tppc", selectedReport)
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~y~Actions avancées", "~y~Description~s~: " .. infos.reason.."~n~~p~Attention~s~: Cette action vous fera changer de menu", { RightLabel = "→→" }, GetPlayerServerId(PlayerId()) ~= selectedReport, function(_, _, s)
                        if s then
                            selectedPlayer = selectedReport
                        end
                    end,RMenu:Get(cat,subCat("playersManage")))
                else
                    AzoKiUI.Separator("")
                    AzoKiUI.Separator(cVar2 .. "Ce report n'est plus valide")
                    AzoKiUI.Separator("")
                end
            end, function()
            end, 1)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("playersManage")), true, true, true, function()
                shouldStayOpened = true
                if not localPlayers[selectedPlayer] then
                    AzoKiUI.Separator("")
                    AzoKiUI.Separator(cVar2 .. "Ce joueur n'est plus connecté !")
                    AzoKiUI.Separator("")
                else
                    statsSeparator()
                    AzoKiUI.Separator("Gestion: ~y~" .. localPlayers[selectedPlayer].name .. " ~s~(~o~" .. selectedPlayer .. "~s~)")
                    AzoKiUI.Separator("↓ ~p~Téléportation ~s~↓")
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~S'y téléporter", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:goto", selectedPlayer)
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Téléporter sur moi", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:bring", selectedPlayer, GetEntityCoords(PlayerPedId()))
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~TP Parking Central", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            msg("~y~Téléportation du joueur en cours...")
                            TriggerServerEvent("adminmenu:tppc", selectedPlayer)
                        end
                    end)
                    AzoKiUI.Separator("↓ ~y~Modération ~s~↓")
                    if (IN_SPECTATE) then
                        AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Spectate", nil, { RightLabel = "~p~Activé" }, true, function(_, _, s)
                            if s then
                                if GetEntityCoords(GetPlayerFromServerId(selectedPlayer)).x == 0 then
                                    Wait(50)
                                    SPECTATE_PLAYER(GetPlayerFromServerId(selectedPlayer))
                                else
                                    SPECTATE_PLAYER(GetPlayerFromServerId(selectedPlayer))
                                end
                            end
                        end)
                    else
                        AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Spectate", nil, { RightLabel = "~p~Désactivé" }, true, function(_, _, s)
                            if s then
                                if GetEntityCoords(GetPlayerFromServerId(selectedPlayer)).x == 0 then
                                    Wait(50)
                                    oldCoords = GetEntityCoords(GetPlayerPed(-1))
                                    SPECTATE_PLAYER(GetPlayerFromServerId(selectedPlayer))
                                else
                                    oldCoords = GetEntityCoords(GetPlayerPed(-1))
                                    SPECTATE_PLAYER(GetPlayerFromServerId(selectedPlayer))
                                end
                            end
                        end)
                    end
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Voir l\'inventaire", nil, { RightLabel = "→→" }, canUse("permInventaire", permLevel), function(_, _, s)
                        if s then
                            getPlayerInv(GetPlayerFromServerId(selectedPlayer))
                        end
                    end,RMenu:Get(cat,subCat("playersInventaire")))
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Message", nil, { RightLabel = "→→" }, canUse("mess", permLevel), function(_, _, s)
                        if s then
                            local reason = input("Message", "", 100, false)
                            if reason ~= nil and reason ~= "" then
                                msg("~y~Envoie du message en cours...")
                                TriggerServerEvent("adminmenu:message", selectedPlayer, reason)
                            end
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Jail", nil, { RightLabel = "→→" }, canUse("jail", permLevel), function(_, _, s)
                        if s then
                            local temps = input("Jail", "", 100, false)
                            if temps ~= nil and temps ~= "" then
                                msg("~y~Jail du joueur en cours...")
                                TriggerServerEvent("adminmenu:Jail", selectedPlayer, temps * 60)
                            end
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~UnJail", nil, { RightLabel = "→→" }, canUse("unjail", permLevel), function(_, _, s)
                        if s then
                            msg("~y~UnJail du joueur en cours...")
                            TriggerServerEvent('esx_jail:unjail', selectedPlayer)
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Warn", nil, { RightLabel = "→→" }, canUse("warn", permLevel), function(_, _, s)
                        if s then
                            local reason = input("Warn", "", 100, false)
                            if reason ~= nil and reason ~= "" then
                                msg("~y~Envoie du warn en cours...")
                                TriggerServerEvent("adminmenu:warn", selectedPlayer, reason)
                            end
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Kick", nil, { RightLabel = "→→" }, canUse("kick", permLevel), function(_, _, s)
                        if s then
                            local reason = input("Raison", "", 80, false)
                            if reason ~= nil and reason ~= "" then
                                msg("~y~Application de la sanction en cours...")
                                TriggerServerEvent("adminmenu:kick", selectedPlayer, reason)
                            end
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Changer le groupe", nil, { RightLabel = "→→" }, canUse("setGroup", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("setGroup")))
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Changer le job", nil, { RightLabel = "→→" }, canUse("setJob", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("setjobMenu")))
                    AzoKiUI.Separator("↓ ~o~Personnage ~s~↓")

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Revive", nil, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            msg("~y~Revive du joueur en cours...")
                            TriggerServerEvent("adminmenu:revive", selectedPlayer)
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Soigner", nil, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            msg("~y~Heal du joueur en cours...")
                            TriggerServerEvent("adminmenu:heal", selectedPlayer)
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Donner un véhicule", nil, { RightLabel = "→→" }, canUse("vehicles", permLevel), function(Hovered, Active, Selected)
                        if Selected then
                            local veh = CustomString()
                            if veh ~= nil then
                                local model = GetHashKey(veh)
                                if IsModelValid(model) then
                                    RequestModel(model)
                                    while not HasModelLoaded(model) do
                                        Wait(1)
                                    end
                                    TriggerServerEvent("adminmenu:spawnVehicle", model, selectedPlayer)
                                else
                                    msg("Ce modèle n'existe pas")
                                end
                            end
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Clear inventaire", nil, { RightLabel = "→→" }, canUse("clearInventory", permLevel), function(_, _, s)
                        if s then
                            msg("~y~Clear de l'inventaire du joueur en cours...")
                            TriggerServerEvent("adminmenu:clearInv", selectedPlayer)
                        end
                    end)
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Clear armes", nil, { RightLabel = "→→" }, canUse("clearLoadout", permLevel), function(_, _, s)
                        if s then
                            msg("~y~Clear des armes du joueur en cours...")
                            TriggerServerEvent("adminmenu:clearLoadout", selectedPlayer)
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give un item", nil, { RightLabel = "→→" }, canUse("give", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("items")))

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give de l'argent (~p~liquide~s~)", nil, { RightLabel = "→→" }, canUse("giveMoney", permLevel), function(_, _, s)
                        if s then
                            local qty = input("Quantité", "", 20, true)
                            if qty ~= nil then
                                msg("~y~Don de l'argent au joueur...")
                                TriggerServerEvent("adminmenu:addMoney", selectedPlayer, qty)
                            end
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give de l'argent sale (~p~liquide~s~)", nil, { RightLabel = "→→" }, canUse("giveMoney", permLevel), function(_, _, s)
                        if s then
                            local qty = input("Quantité", "", 20, true)
                            if qty ~= nil then
                                msg("~y~Don de l'argent au joueur...")
                                TriggerServerEvent("adminmenu:addMoneysale", selectedPlayer, qty)
                            end
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Wipe", nil, { RightLabel = "→→" }, canUse("wipe", permLevel), function(_, _, s)
                        if s then
                            msg("~y~Wipe du joueur en cours...")
                            TriggerServerEvent("adminmenu:wipe", selectedPlayer)
                        end
                    end)

                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Wipe véhicules", nil, { RightLabel = "→→" }, canUse("clearvéhicules", permLevel), function(_, _, s)
                        if s then
                            msg("~y~Wipe des véhicules du joueur en cours...")
                            TriggerServerEvent("adminmenu:clearvéhicules", selectedPlayer)
                        end
                    end)

                end
            end, function()
            end, 1)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("playersInventaire")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                AzoKiUI.Separator("↓ ~p~Money ~s~↓")

                for k,v  in pairs(ArgentBank) do
                    AzoKiUI.ButtonWithStyle("Argent en banque :", nil, {RightLabel = v.label.."$"}, true, function(_, _, s)
                    end)
                end
    
                for k,v  in pairs(ArgentCash) do
                    AzoKiUI.ButtonWithStyle("Argent Liquide :", nil, {RightLabel = v.label.."$"}, true, function(_, _, s)
                    end)
                end
    
                for k,v  in pairs(ArgentSale) do
                    AzoKiUI.ButtonWithStyle("Argent sale :", nil, {RightLabel = v.label.."$"}, true, function(_, _, s)
                    end)
                end
        
                AzoKiUI.Separator("↓ ~p~Objets ~s~↓")

                for k,v  in pairs(Items) do
                    AzoKiUI.ButtonWithStyle(v.label, nil, {RightLabel = "~p~x"..v.right}, true, function(_, _, s)
                    end)
                end

                AzoKiUI.Separator("↓ ~o~Armes ~s~↓")
    
                for k,v  in pairs(Armes) do
                    AzoKiUI.ButtonWithStyle(v.label, nil, {RightLabel = "avec ~p~"..v.right.. " ~s~balle(s)"}, true, function(_, _, s)
                    end)
                end
            end, function()
            end, 1)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("items")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                AzoKiUI.Separator("Gestion: ~y~" .. localPlayers[selectedPlayer].name .. " ~s~(~o~" .. selectedPlayer .. "~s~)")
                AzoKiUI.List("Filtre:", filterArray, filter, nil, {}, true, function(_, _, _, i)
                    filter = i
                end)
                AzoKiUI.Separator("↓ ~p~Items disponibles ~s~↓")
                for id, itemInfos in pairs(items) do
                    if starts(itemInfos.label:lower(), filterArray[filter]:lower()) then
                        AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~" .. itemInfos.label, nil, { RightLabel = "~p~Donner ~s~→→" }, true, function(_, _, s)
                            if s then
                                local qty = input("Quantité", "", 20, true)
                                if qty ~= nil then
                                    msg("~y~Give de l'item...")
                                    TriggerServerEvent("adminmenu:give", selectedPlayer, itemInfos.name, qty)
                                end
                            end
                        end)
                    end
                end
            end, function()
            end, 1)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("setGroup")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                AzoKiUI.Separator("Gestion: ~y~" .. localPlayers[selectedPlayer].name .. " ~s~(~o~" .. selectedPlayer .. "~s~)")
                AzoKiUI.Separator("↓ ~p~Rangs disponibles ~s~↓")
                for i = 1, #ranksInfos do
                    AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~" .. ranksInfos[i].label, nil, { RightLabel = "~p~Attribuer ~s~→→" }, ranksRelative[permLevel] > i, function(_, _, s)
                        if s then
                            msg("~y~Application du rang...")
                            TriggerServerEvent("adminmenu:setGroup", selectedPlayer, ranksInfos[i].rank)
                        end
                    end)
                end
            end, function()
            end, 1)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("setjobMenu")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()

                AzoKiUI.Separator("↓ ~p~Jobs disponibles ~s~↓")
    
                for k,v in pairs(allJobsServer) do
                    AzoKiUI.ButtonWithStyle(v.LabelSociety, nil, {}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                        nameSo = v.NameSociety
                        LabelSo = v.LabelSociety
                        ESX.TriggerServerCallback('finalmenuadmin:getAllGrade', function(allGrade)
                            allGradeForJobSelected = allGrade
                        end, v.NameSociety)
                        end
                    end, RMenu:Get(cat, subCat("setjobMenuSub")))
                end

            end, function()
            end)
    
            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("setjobMenuSub")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()

                AzoKiUI.Separator("~y~Job sélectionner : "..LabelSo)
    
                for k,v in pairs(allGradeForJobSelected) do
                    AzoKiUI.ButtonWithStyle(v.gradeLabel, nil, {}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                        ESX.ShowNotification("~p~Setjob effectuer !")
                        ExecuteCommand("setjob "..selectedPlayer.." "..nameSo.." "..v.gradeJob)
                        end
                    end)
                end
            
            end, function()
            end)

            AzoKiUI.IsVisible(RMenu:Get(cat, subCat("vehicle")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                AzoKiUI.Separator("↓ ~p~Apparition ~s~↓")
                AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Spawn un véhicule", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        local veh = CustomString()
                        if veh ~= nil then
                            local model = GetHashKey(veh)
                            if IsModelValid(model) then
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(1)
                                end
                                TriggerServerEvent("adminmenu:spawnVehicle", model)
                            else
                                msg("Ce modèle n'existe pas")
                            end
                        end
                    end
                end)
                AzoKiUI.Separator("↓ ~y~Gestion ~s~↓")
                AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Supprimer le véhicule", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Active then
                        ClosetVehWithDisplay()
                    end
                    if Selected then
                        Citizen.CreateThread(function()
                            local veh = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                            NetworkRequestControlOfEntity(veh)
                            while not NetworkHasControlOfEntity(veh) do
                                Wait(1)
                            end
                            DeleteEntity(veh)
                            msg("~p~Véhicule supprimé")
                        end)
                    end
                end)
                AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Réparer le véhicule", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Active then
                        ClosetVehWithDisplay()
                    end
                    if Selected then
                        local veh = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        NetworkRequestControlOfEntity(veh)
                        while not NetworkHasControlOfEntity(veh) do
                            Wait(1)
                        end
                        SetVehicleFixed(veh)
                        SetVehicleDeformationFixed(veh)
                        SetVehicleDirtLevel(veh, 0.0)
                        SetVehicleEngineHealth(veh, 1000.0)
                        msg("~p~Véhicule réparé")
                    end
                end)

                AzoKiUI.ButtonWithStyle(cVarLong() .. "→ ~s~Upgrade le véhicule au max", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Active then
                        ClosetVehWithDisplay()
                    end
                    if Selected then
                        local veh = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        NetworkRequestControlOfEntity(veh)
                        while not NetworkHasControlOfEntity(veh) do
                            Wait(1)
                        end
                        ESX.Game.SetVehicleProperties(veh, {
                            modEngine = 3,
                            modBrakes = 3,
                            modTransmission = 3,
                            modSuspension = 3,
                            modTurbo = true
                        })
                        msg("~p~Véhicule amélioré")
                    end
                end)
            end, function()
            end, 1)

            if not shouldStayOpened and menuOpen then
                menuOpen = false
                RMenu:Delete(RMenu:Get(cat, subCat("main")))
                RMenu:Delete(RMenu:Get(cat, subCat("players")))
                RMenu:Delete(RMenu:Get(cat, subCat("reports")))
                RMenu:Delete(RMenu:Get(cat, subCat("reports_take")))
                RMenu:Delete(RMenu:Get(cat, subCat("vehicle")))
                RMenu:Delete(RMenu:Get(cat, subCat("playersInventaire")))
                RMenu:Delete(RMenu:Get(cat, subCat("setGroup")))
                RMenu:Delete(RMenu:Get(cat, subCat("items")))
                RMenu:Delete(RMenu:Get(cat, subCat("playersManage")))
            end
            Wait(0)
        end
    end)
end

SPECTATE_PLAYER = function(_player)
    local targetPed = GetPlayerPed(_player)

    IN_SPECTATE = not IN_SPECTATE

    if IN_SPECTATE then
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))
        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(true, targetPed)
        WHILE_SPECTATE()
    else
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))
        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(false, targetPed)
        SetEntityVisible(PlayerPedId(), true, 0)
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityCoords(PlayerPedId(), oldCoords, false)
        SetEntityCollision(PlayerPedId(), true, true)
    end
end

WHILE_SPECTATE = function()
    Citizen.CreateThread(function()
        while IN_SPECTATE do
            local p = GetPlayerFromServerId(selectedPlayer)
            local ped = GetPlayerPed(p)
            local coords = GetEntityCoords((ped), false)
            SetEntityVisible(PlayerPedId(), false, 0)
            FreezeEntityPosition(PlayerPedId(), false)
            SetEntityCoords(PlayerPedId(), coords + 0.5, false)
            FreezeEntityPosition(PlayerPedId(), true)
            SetEntityNoCollisionEntity(ped, GetPlayerPed(-1), true)
            Wait(10)
        end
    end)
end