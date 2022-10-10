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

function Menuf6Tequila()
    local fTequilaf6 = AzoKiUI.CreateMenu("", "Interactions")
    fTequilaf6:SetRectangleBanner(153, 50, 204)
    AzoKiUI.Visible(fTequilaf6, not AzoKiUI.Visible(fTequilaf6))
    while fTequilaf6 do
        Citizen.Wait(0)
            AzoKiUI.IsVisible(fTequilaf6, true, true, true, function()

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
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_Tequila', ('tequila'), montant)
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
                        TriggerServerEvent('fTequila:Ouvert')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Annonces de fermeture",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('fTequila:Fermer')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Personnalisé", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local msg = KeyboardInput("Message", "", 100)
                        TriggerServerEvent('fTequila:Perso', msg)
                    end
                end)
                end, function() 
                end)
    
                if not AzoKiUI.Visible(fTequilaf6) then
                    fTequilaf6 = RMenu:DeleteType("Tequila", true)
        end
    end
end

Keys.Register('F6', 'tequila', 'Ouvrir le menu Tequila', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tequila' then
    	Menuf6Tequila()
	end
end)

function OpenPrendreMenu()
    local PrendreMenu = AzoKiUI.CreateMenu("", "Nos produits")
    PrendreMenu:SetRectangleBanner(153, 50, 204)
        AzoKiUI.Visible(PrendreMenu, not AzoKiUI.Visible(PrendreMenu))
    while PrendreMenu do
        Citizen.Wait(0)
            AzoKiUI.IsVisible(PrendreMenu, true, true, true, function()
            for k,v in pairs(TequilaBar.item) do
            AzoKiUI.ButtonWithStyle(v.Label.. ' Prix: ' .. v.Price .. '€', nil, { }, true, function(Hovered, Active, Selected)
              if (Selected) then
                  TriggerServerEvent('fTequila:bar', v.Name, v.Price)
                end
            end)
        end
                end, function() 
                end)
    
                if not AzoKiUI.Visible(PrendreMenu) then
                    PrendreMenu = RMenu:DeleteType("Tequila", true)
        end
    end
end


Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tequila' then
        local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
        local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Tequila.pos.MenuPrendre.position.x, Tequila.pos.MenuPrendre.position.y, Tequila.pos.MenuPrendre.position.z)
        if dist3 <= 7.0 and Tequila.jeveuxmarker then
            Timer = 0
            DrawMarker(20, Tequila.pos.MenuPrendre.position.x, Tequila.pos.MenuPrendre.position.y, Tequila.pos.MenuPrendre.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 153, 50, 204, 255, 0, 1, 2, 0, nil, nil, 0)
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



function CoffreTequila()
    local CTequila = AzoKiUI.CreateMenu("", "Tequila")
    CTequila:SetRectangleBanner(153, 50, 204)
        AzoKiUI.Visible(CTequila, not AzoKiUI.Visible(CTequila))
            while CTequila do
            Citizen.Wait(0)
            AzoKiUI.IsVisible(CTequila, true, true, true, function()

                AzoKiUI.Separator("↓ Objet / Arme ↓")

                    AzoKiUI.ButtonWithStyle("Retirer",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            TequilaRetirerobjet()
                            AzoKiUI.CloseAll()
                        end
                    end)
                    
                    AzoKiUI.ButtonWithStyle("Déposer",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            TequilaDeposerobjet()
                            AzoKiUI.CloseAll()
                        end
                    end)
                end, function()
                end)
            if not AzoKiUI.Visible(CTequila) then
            CTequila = RMenu:DeleteType("CTequila", true)
        end
    end
end

Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tequila' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Tequila.pos.coffre.position.x, Tequila.pos.coffre.position.y, Tequila.pos.coffre.position.z)
            if jobdist <= 10.0 and Tequila.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Tequila.pos.coffre.position.x, Tequila.pos.coffre.position.y, Tequila.pos.coffre.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 153, 50, 204, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        AzoKiUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au coffre", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                        CoffreTequila()
                    end   
                end
            end 
        Citizen.Wait(Timer)   
    end
end)


-- Garage

function GarageTequila()
  local GTequila = AzoKiUI.CreateMenu("", "Tequila")
  GTequila:SetRectangleBanner(153, 50, 204)
    AzoKiUI.Visible(GTequila, not AzoKiUI.Visible(GTequila))
        while GTequila do
            Citizen.Wait(0)
                AzoKiUI.IsVisible(GTequila, true, true, true, function()
                    AzoKiUI.ButtonWithStyle("Ranger la voiture", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                        local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                        if dist4 < 4 then
                            DeleteEntity(veh)
                            AzoKiUI.CloseAll()
                            end 
                        end
                    end) 

                    for k,v in pairs(GTequilavoiture) do
                    AzoKiUI.ButtonWithStyle(v.nom, nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                        Citizen.Wait(1)  
                            spawnuniCarTequila(v.modele)
                            AzoKiUI.CloseAll()
                            end
                        end)
                    end
                end, function()
                end)
            if not AzoKiUI.Visible(GTequila) then
            GTequila = RMenu:DeleteType("Garage", true)
        end
    end
end

Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tequila' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Tequila.pos.garage.position.x, Tequila.pos.garage.position.y, Tequila.pos.garage.position.z)
            if dist3 <= 10.0 and Tequila.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Tequila.pos.garage.position.x, Tequila.pos.garage.position.y, Tequila.pos.garage.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 153, 50, 204, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if dist3 <= 3.0 then
                Timer = 0   
                    AzoKiUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au garage", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        GarageTequila()
                    end   
                end
            end 
        Citizen.Wait(Timer)
     end
end)

function spawnuniCarTequila(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, Tequila.pos.spawnvoiture.position.x, Tequila.pos.spawnvoiture.position.y, Tequila.pos.spawnvoiture.position.z, Tequila.pos.spawnvoiture.position.h, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local newPlate = GenerateSocietyPlate('tequila')
    SetVehicleNumberPlateText(vehicle, newPlate)
    TriggerServerEvent('garage:RegisterNewKey', 'no', newPlate)
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
end



itemstock = {}
function TequilaRetirerobjet()
    local StockTequila = AzoKiUI.CreateMenu("", "Tequila")
    StockTequila:SetRectangleBanner(153, 50, 204)
    ESX.TriggerServerCallback('fTequila:getStockItems', function(items) 
    itemstock = items
   
    AzoKiUI.Visible(StockTequila, not AzoKiUI.Visible(StockTequila))
        while StockTequila do
            Citizen.Wait(0)
                AzoKiUI.IsVisible(StockTequila, true, true, true, function()
                        for k,v in pairs(itemstock) do 
                            if v.count > 0 then
                            AzoKiUI.ButtonWithStyle(v.label, nil, {RightLabel = v.count}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local count = KeyboardInput("Combien ?", "", 2)
                                    TriggerServerEvent('fTequila:getStockItem', v.name, tonumber(count))
                                    TequilaRetirerobjet()
                                end
                            end)
                        end
                    end
                end, function()
                end)
            if not AzoKiUI.Visible(StockTequila) then
            StockTequila = RMenu:DeleteType("Coffre", true)
        end
    end
     end)
end

local PlayersItem = {}
function TequilaDeposerobjet()
    local StockPlayer = AzoKiUI.CreateMenu("", "Tequila")
    StockPlayer:SetRectangleBanner(153, 50, 204)
    ESX.TriggerServerCallback('fTequila:getPlayerInventory', function(inventory)
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
                                            TriggerServerEvent('fTequila:putStockItems', item.name, tonumber(count))
                                            TequilaDeposerobjet()
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