ESX = nil

local playerCars = {}

dok_conc_avion = {
	catevehi = {},
	listecatevehi = {},
}

local dernieravionsorti = {}
local sortiravionacheter = {}
local CurrentAction, CurrentActionMsg, LastZone, currentDisplayVehicle, CurrentVehicleData
local CurrentActionData, Vehicles, Categories = {}, {}, {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

--[[
function MenuF6ConcessAvion()
    local f6concessAvion = AzoKiUI.CreateMenu("", "Interactions")
    AzoKiUI.Visible(f6concessAvion, not AzoKiUI.Visible(f6concessAvion))
    while f6concessAvion do
        Citizen.Wait(0)
            AzoKiUI.IsVisible(f6concessAvion, true, true, true, function()

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
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_planeshop', ('Concessionnaire'), montant)
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
                        TriggerServerEvent('dConcessAvion:Ouvert')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Annonces de fermeture",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessAvion:Fermer')
                    end
                end)

                AzoKiUI.ButtonWithStyle("Annonces de recrutement",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessAvion:Recrutement')
                    end
                end)

                end, function() 
                end)
    
                if not AzoKiUI.Visible(f6concessAvion) then
                    f6concessAvion = RMenu:DeleteType("Concessionnaire", true)
        end
    end
end


Keys.Register('F6', 'Concess', 'Ouvrir le menu Concessionnaire', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'planeshop' then
    	MenuF6ConcessAvion()
	end
end)
]]

function MenuConcessAvion()
    local MConcessAvion = AzoKiUI.CreateMenu("", "Concessionnaire")
    local MConcessAvionSub = AzoKiUI.CreateSubMenu(MConcessAvion, "", "Concessionnaire")
    local MConcessAvionSub1 = AzoKiUI.CreateSubMenu(MConcessAvion, "", "Concessionnaire")
    local MConcessAvionSub2 = AzoKiUI.CreateSubMenu(MConcessAvion, "", "Concessionnaire")
    MConcessAvionSub2.Closed = function()
        supprimeravionconcess()
    end
    AzoKiUI.Visible(MConcessAvion, not AzoKiUI.Visible(MConcessAvion))
    while MConcessAvion do
        Wait(0)
            AzoKiUI.IsVisible(MConcessAvion, true, true, true, function()

                AzoKiUI.Separator("~p~"..ESX.PlayerData.job.grade_label.." - "..GetPlayerName(PlayerId()))

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
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_planeshop', ('Concessionnaire'), montant)
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
                        TriggerServerEvent('dConcessAvion:Ouvert')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Annonces de fermeture",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessAvion:Fermer')
                    end
                end)

                AzoKiUI.ButtonWithStyle("Annonces de recrutement",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessAvion:Recrutement')
                    end
                end)

                AzoKiUI.Separator("↓ Actions véhicules ↓")

                AzoKiUI.ButtonWithStyle("Liste des véhicules", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MConcessAvionSub)

			end, function()
			end)

            	AzoKiUI.IsVisible(MConcessAvionSub, true, true, true, function()
                
					for i = 1, #dok_conc_avion.catevehi, 1 do
                        AzoKiUI.ButtonWithStyle("Catégorie - "..dok_conc_avion.catevehi[i].label, nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                                nomcategorie = dok_conc_avion.catevehi[i].label
                                categorievehi = dok_conc_avion.catevehi[i].name
                                ESX.TriggerServerCallback('dok_concess:recupererlistevehicule', function(listevehi)
                                        dok_conc_avion.listecatevehi = listevehi
                                end, categorievehi)
                            end
                        end, MConcessAvionSub1)
                        end
                        end, function()
                        end)

                AzoKiUI.IsVisible(MConcessAvionSub1, true, true, true, function()
			

                    AzoKiUI.Separator("↓ Catégorie : "..nomcategorie.." ↓")
            
                        for i2 = 1, #dok_conc_avion.listecatevehi, 1 do
                        AzoKiUI.ButtonWithStyle(dok_conc_avion.listecatevehi[i2].name, "Pour acheter ce véhicule", {RightLabel = dok_conc_avion.listecatevehi[i2].price.."$"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                                nomavion = dok_conc_avion.listecatevehi[i2].name
                                prixavion = dok_conc_avion.listecatevehi[i2].price
                                modeleavion = dok_conc_avion.listecatevehi[i2].model
                                supprimeravionconcess()
                                chargementavion(modeleavion)
            
                                ESX.Game.SpawnVehicle(modeleavion, {x = -962.09, y = -2969.76, z = 13.95}, 322.02, function (vehicle)
                                table.insert(dernieravionsorti, vehicle)
                                FreezeEntityPosition(vehicle, true)
                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                SetModelAsNoLongerNeeded(modeleavion)
                                end)
                            end
                        end, MConcessAvionSub2)
                        
                        end
                        end, function()
                        end)

                        AzoKiUI.IsVisible(MConcessAvionSub2, true, true, true, function()

                            AzoKiUI.Separator("~p~↓ Vendre le véhicule au joueur le plus proche ↓")

                            AzoKiUI.ButtonWithStyle("Vendre le véhicule", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                                if (Selected) then    
                                        ESX.TriggerServerCallback('dok_concessavion:verifsousconcess', function(suffisantsous)
                                        if suffisantsous then
                        
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        
                                        if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Personne autour')
                                        else
                                        supprimeravionconcess()
                                        chargementavion(modeleavion)
                        
                                        ESX.Game.SpawnVehicle(modeleavion, {x = -962.09, y = -2969.76, z = 13.95}, 322.02, function (vehicle)
                                        table.insert(sortiravionacheter, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                        SetModelAsNoLongerNeeded(modeleavion)
                                        local plaque     = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(sortiravionacheter[#sortiravionacheter])
                                        vehicleProps.plate = plaque
                                        SetVehicleNumberPlateText(sortiravionacheter[#sortiravionacheter], plaque)
                                        FreezeEntityPosition(sortiravionacheter[#sortiravionacheter], false)
                        
                                        TriggerServerEvent('dok_concessavion:vendrevoiturejoueur', GetPlayerServerId(closestPlayer), vehicleProps, prixavion, nomavion)
                                        ESX.ShowNotification('Le véhicule '..nomavion..' avec la plaque '..vehicleProps.plate..' a été vendu à '..GetPlayerName(closestPlayer))
                                        --TriggerServerEvent('esx_vehiclelock:registerkey', vehicleProps.plate, GetPlayerServerId(closestPlayer))
                                        end)
                                        end
                                        else
                                            ESX.ShowNotification('La société n\'as pas assez d\'argent pour ce véhicule!')
                                        end
                        
                                    end, prixavion)
                                        end
                                    end)

                                    AzoKiUI.Separator("~p~↓ Acheter le véhicule avec l'argent de la societé ↓")

                                    AzoKiUI.ButtonWithStyle("Acheter le véhicule", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                                        if (Selected) then   
                                            ESX.TriggerServerCallback('dok_concessavion:verifsousconcess', function(suffisantsous)
                                            if suffisantsous then
                                            supprimeravionconcess()
                                            chargementavion(modeleavion)
                                            ESX.Game.SpawnVehicle(modeleavion, {x = -962.09, y = -2969.76, z = 13.95}, 322.02, function (vehicle)
                                            table.insert(sortiravionacheter, vehicle)
                                            FreezeEntityPosition(vehicle, true)
                                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                            SetModelAsNoLongerNeeded(modeleavion)
                                            local plaque     = GeneratePlate()
                                            local vehicleProps = ESX.Game.GetVehicleProperties(sortiravionacheter[#sortiravionacheter])
                                            vehicleProps.plate = plaque
                                            SetVehicleNumberPlateText(sortiravionacheter[#sortiravionacheter], plaque)
                                            FreezeEntityPosition(sortiravionacheter[#sortiravionacheter], false)
                        
                                            TriggerServerEvent('shop:vehicule', vehicleProps, prixavion, nomavion)
                                            ESX.ShowNotification('Le véhicule '..nomavion..' avec la plaque '..vehicleProps.plate..' a été vendu à '..GetPlayerName(PlayerId()))
                                            --TriggerServerEvent('esx_vehiclelock:registerkey', vehicleProps.plate, GetPlayerServerId(closestPlayer))
                                            end)
                        
                                            else
                                                ESX.ShowNotification('La société n\'as pas assez d\'argent pour ce véhicule!')
                                            end
                            
                                        end, prixavion)
                                            end
                                        end)

                        end, function()
                        end)

              if not AzoKiUI.Visible(MConcessAvion) and not AzoKiUI.Visible(MConcessAvionSub) and not AzoKiUI.Visible(MConcessAvionSub1) and not AzoKiUI.Visible(MConcessAvionSub2) then
              MConcessAvion = RMenu:DeleteType("MConcessAvion", true)
        end
    end
end


Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'planeshop' or ESX.PlayerData.job2 and ESX.PlayerData.job2.name == 'planeshop' then  
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, ConcessAvion.pos.menu.position.x, ConcessAvion.pos.menu.position.y, ConcessAvion.pos.menu.position.z)
            if jobdist <= 10.0 and ConcessAvion.jeveuxmarker then
                Timer = 0
                DrawMarker(20, ConcessAvion.pos.menu.position.x, ConcessAvion.pos.menu.position.y, ConcessAvion.pos.menu.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        AzoKiUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au menu", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                            ESX.TriggerServerCallback('dok_concess:recuperercategorievehicule', function(catevehi)
                                dok_conc_avion.catevehi = catevehi
                            end)
                            MenuConcessAvion()
                    end   
                end
            end 
        Citizen.Wait(Timer)   
    end
end)


function supprimeravionconcess()
	while #dernieravionsorti > 0 do
		local vehicle = dernieravionsorti[1]

		ESX.Game.DeleteVehicle(vehicle)
		table.remove(dernieravionsorti, 1)
	end
end

function chargementavion(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		BeginTextCommandBusyString('STRING')
		AddTextComponentSubstringPlayerName('Chargement du véhicule')
		EndTextCommandBusyString(4)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
			DisableAllControlActions(0)
		end

		RemoveLoadingPrompt()
	end
end