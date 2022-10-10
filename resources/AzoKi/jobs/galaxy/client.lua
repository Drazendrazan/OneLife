ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

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

function Menuf6GalaxyClub()
    local fGalaxyClubf6 = AzoKiUI.CreateMenu("", "Interactions")
    fGalaxyClubf6:SetRectangleBanner(153, 50, 204)
    AzoKiUI.Visible(fGalaxyClubf6, not AzoKiUI.Visible(fGalaxyClubf6))
    while fGalaxyClubf6 do
        Citizen.Wait(0)
            AzoKiUI.IsVisible(fGalaxyClubf6, true, true, true, function()

                AzoKiUI.Separator("↓ Facture ↓")

                AzoKiUI.ButtonWithStyle("Facture",nil, {RightLabel = "→"}, true, function(_,_,s)
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if s then
                        local raison = ""
                        local montant = 0
                        AddTextEntry("FMMC_MPM_NA", "Objet de la facture")
                        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Donnez le motif de la facture :", "", "", "", "", 30)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0)
                            Wait(0)
                        end
                        if (GetOnscreenKeyboardResult()) then
                            local result = GetOnscreenKeyboardResult()
                            if result then
                                raison = result
                                result = nil
                                AddTextEntry("FMMC_MPM_NA", "Montant de la facture")
                                DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Indiquez le montant de la facture :", "", "", "", "", 30)
                                while (UpdateOnscreenKeyboard() == 0) do
                                    DisableAllControlActions(0)
                                    Wait(0)
                                end
                                if (GetOnscreenKeyboardResult()) then
                                    result = GetOnscreenKeyboardResult()
                                    if result then
                                        montant = result
                                        result = nil
                                        if player ~= -1 and distance <= 3.0 then
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_GalaxyClub', ('galaxy'), montant)
                                            TriggerEvent('esx:showAdvancedNotification', 'Fl~p~ee~s~ca ~p~Bank', 'Facture envoyée : ', 'Vous avez envoyé une facture d\'un montant de : ~p~'..montant.. '$ ~s~pour cette raison : ~p~' ..raison.. '', 'CHAR_BANK_FLEECA', 9)
                                        else
                                            ESX.ShowNotification("~p~Probleme~s~: Aucuns joueurs proche")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)


                AzoKiUI.Separator("↓ Annonce ↓")



                AzoKiUI.ButtonWithStyle("Annonces d'ouverture",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then       
                        TriggerServerEvent('fGalaxyClub:Ouvert')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Annonces de fermeture",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('fGalaxyClub:Fermer')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Personnalisé", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local msg = KeyboardInput("Message", "", 100)
                        TriggerServerEvent('fGalaxyClub:Perso', msg)
                    end
                end)
                end, function() 
                end)
    
                if not AzoKiUI.Visible(fGalaxyClubf6) then
                    fGalaxyClubf6 = RMenu:DeleteType("GalaxyClub", true)
        end
    end
end

Keys.Register('F6', 'galaxy', 'Ouvrir le menu GalaxyClub', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'galaxy' then
    	Menuf6GalaxyClub()
	end
end)

function OpenPrendreMenu()
    local PrendreMenu = AzoKiUI.CreateMenu("", "Nos produits")
    PrendreMenu:SetRectangleBanner(153, 50, 204)
        AzoKiUI.Visible(PrendreMenu, not AzoKiUI.Visible(PrendreMenu))
    while PrendreMenu do
        Citizen.Wait(0)
            AzoKiUI.IsVisible(PrendreMenu, true, true, true, function()
            for k,v in pairs(GalaxyClubBar.item) do
            AzoKiUI.ButtonWithStyle(v.Label.. ' Prix: ' .. v.Price .. '€', nil, { }, true, function(Hovered, Active, Selected)
              if (Selected) then
                  TriggerServerEvent('fGalaxyClub:bar', v.Name, v.Price)
                end
            end)
        end
                end, function() 
                end)
    
                if not AzoKiUI.Visible(PrendreMenu) then
                    PrendreMenu = RMenu:DeleteType("GalaxyClub", true)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'galaxy' then
        local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
        local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, GalaxyClub.pos.MenuPrendre.position.x, GalaxyClub.pos.MenuPrendre.position.y, GalaxyClub.pos.MenuPrendre.position.z)
        if dist3 <= 7.0 and GalaxyClub.jeveuxmarker then
            Timer = 0
            DrawMarker(20, GalaxyClub.pos.MenuPrendre.position.x, GalaxyClub.pos.MenuPrendre.position.y, GalaxyClub.pos.MenuPrendre.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 153, 50, 204, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 2.0 then
                Timer = 0   
                        AzoKiUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au bar", time_display = 1 })
                        if IsControlJustPressed(1,51) then           
                            OpenPrendreMenu()
                    end   
                end
            end 
        Citizen.Wait(Timer)
    end
end)



function CoffreGalaxyClub()
    local CGalaxyClub = AzoKiUI.CreateMenu("", "GalaxyClub")
    CGalaxyClub:SetRectangleBanner(153, 50, 204)
        AzoKiUI.Visible(CGalaxyClub, not AzoKiUI.Visible(CGalaxyClub))
            while CGalaxyClub do
            Citizen.Wait(0)
            AzoKiUI.IsVisible(CGalaxyClub, true, true, true, function()

                AzoKiUI.Separator("↓ Objet / Arme ↓")

                    AzoKiUI.ButtonWithStyle("Retirer",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            GalaxyClubRetirerobjet()
                            AzoKiUI.CloseAll()
                        end
                    end)
                    
                    AzoKiUI.ButtonWithStyle("Déposer",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            GalaxyClubDeposerobjet()
                            AzoKiUI.CloseAll()
                        end
                    end)
                end, function()
                end)
            if not AzoKiUI.Visible(CGalaxyClub) then
            CGalaxyClub = RMenu:DeleteType("CGalaxyClub", true)
        end
    end
end

Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'galaxy' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, GalaxyClub.pos.coffre.position.x, GalaxyClub.pos.coffre.position.y, GalaxyClub.pos.coffre.position.z)
            if jobdist <= 10.0 and GalaxyClub.jeveuxmarker then
                Timer = 0
                DrawMarker(20, GalaxyClub.pos.coffre.position.x, GalaxyClub.pos.coffre.position.y, GalaxyClub.pos.coffre.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 153, 50, 204, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        AzoKiUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au coffre", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                        CoffreGalaxyClub()
                    end   
                end
            end 
        Citizen.Wait(Timer)   
    end
end)


-- Garage

function GarageGalaxyClub()
  local GGalaxyClub = AzoKiUI.CreateMenu("", "GalaxyClub")
  GGalaxyClub:SetRectangleBanner(153, 50, 204)
    AzoKiUI.Visible(GGalaxyClub, not AzoKiUI.Visible(GGalaxyClub))
        while GGalaxyClub do
            Citizen.Wait(0)
                AzoKiUI.IsVisible(GGalaxyClub, true, true, true, function()
                    AzoKiUI.ButtonWithStyle("Ranger la voiture", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                        local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                        if dist4 < 4 then
                            DeleteEntity(veh)
                            AzoKiUI.CloseAll()
                            end 
                        end
                    end) 

                    for k,v in pairs(GGalaxyClubvoiture) do
                    AzoKiUI.ButtonWithStyle(v.nom, nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                        Citizen.Wait(1)  
                            spawnuniCarGalaxyClub(v.modele)
                            AzoKiUI.CloseAll()
                            end
                        end)
                    end
                end, function()
                end)
            if not AzoKiUI.Visible(GGalaxyClub) then
            GGalaxyClub = RMenu:DeleteType("Garage", true)
        end
    end
end

Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'galaxy' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, GalaxyClub.pos.garage.position.x, GalaxyClub.pos.garage.position.y, GalaxyClub.pos.garage.position.z)
            if dist3 <= 10.0 and GalaxyClub.jeveuxmarker then
                Timer = 0
                DrawMarker(20, GalaxyClub.pos.garage.position.x, GalaxyClub.pos.garage.position.y, GalaxyClub.pos.garage.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 153, 50, 204, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist3 <= 3.0 then
                Timer = 0   
                    AzoKiUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au garage", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        GarageGalaxyClub()
                    end   
                end
            end 
        Citizen.Wait(Timer)
     end
end)

function spawnuniCarGalaxyClub(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, GalaxyClub.pos.spawnvoiture.position.x, GalaxyClub.pos.spawnvoiture.position.y, GalaxyClub.pos.spawnvoiture.position.z, GalaxyClub.pos.spawnvoiture.position.h, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local newPlate = GenerateSocietyPlate('galaxy')
    SetVehicleNumberPlateText(vehicle, newPlate)
    TriggerServerEvent('garage:RegisterNewKey', 'no', newPlate)
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
end



itemstock = {}
function GalaxyClubRetirerobjet()
    local StockGalaxyClub = AzoKiUI.CreateMenu("", "GalaxyClub")
    StockGalaxyClub:SetRectangleBanner(153, 50, 204)
    ESX.TriggerServerCallback('fGalaxyClub:getStockItems', function(items) 
    itemstock = items
   
    AzoKiUI.Visible(StockGalaxyClub, not AzoKiUI.Visible(StockGalaxyClub))
        while StockGalaxyClub do
            Citizen.Wait(0)
                AzoKiUI.IsVisible(StockGalaxyClub, true, true, true, function()
                        for k,v in pairs(itemstock) do 
                            if v.count > 0 then
                            AzoKiUI.ButtonWithStyle(v.label, nil, {RightLabel = v.count}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local count = KeyboardInput("Combien ?", "", 2)
                                    TriggerServerEvent('fGalaxyClub:getStockItem', v.name, tonumber(count))
                                    GalaxyClubRetirerobjet()
                                end
                            end)
                        end
                    end
                end, function()
                end)
            if not AzoKiUI.Visible(StockGalaxyClub) then
            StockGalaxyClub = RMenu:DeleteType("Coffre", true)
        end
    end
     end)
end

local PlayersItem = {}
function GalaxyClubDeposerobjet()
    local StockPlayer = AzoKiUI.CreateMenu("", "GalaxyClub")
    StockPlayer:SetRectangleBanner(153, 50, 204)
    ESX.TriggerServerCallback('fGalaxyClub:getPlayerInventory', function(inventory)
        AzoKiUI.Visible(StockPlayer, not AzoKiUI.Visible(StockPlayer))
    while StockPlayer do
        Citizen.Wait(0)
            AzoKiUI.IsVisible(StockPlayer, true, true, true, function()
                for i=1, #inventory.items, 1 do
                    if inventory ~= nil then
                         local item = inventory.items[i]
                            if item.count > 0 then
                                        AzoKiUI.ButtonWithStyle(item.label, nil, {RightLabel = item.count}, true, function(Hovered, Active, Selected)
                                            if Selected then
                                            local count = KeyboardInput("Combien ?", '', 8)
                                            TriggerServerEvent('fGalaxyClub:putStockItems', item.name, tonumber(count))
                                            GalaxyClubDeposerobjet()
                                        end
                                    end)
                                end
                            else
                                AzoKiUI.Separator('Chargement en cours')
                            end
                        end
                    end, function()
                    end)
                if not AzoKiUI.Visible(StockPlayer) then
                StockPlayer = RMenu:DeleteType("Coffre", true)
            end
        end
    end)
end