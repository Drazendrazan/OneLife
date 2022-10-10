ESX = nil

local playerCars = {}

dok_conc_moto = {
	catevehi = {},
	listecatevehi = {},
}

local dernieremotosorti = {}
local sortirmotoacheter = {}
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
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_motoshop', ('Concessionnaire'), montant)
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
                        TriggerServerEvent('dConcessMoto:Ouvert')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Annonces de fermeture",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessMoto:Fermer')
                    end
                end)

                AzoKiUI.ButtonWithStyle("Annonces de recrutement",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessMoto:Recrutement')
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
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'motoshop' then
    	MenuF6ConcessAvion()
	end
end)
]]

function MenuConcessMoto()
    local MConcessMoto = AzoKiUI.CreateMenu("", "Concessionnaire")
    local MConcessMotoSub = AzoKiUI.CreateSubMenu(MConcessMoto, "", "Concessionnaire")
    local MConcessMotoSub1 = AzoKiUI.CreateSubMenu(MConcessMoto, "", "Concessionnaire")
    local MConcessMotoSub2 = AzoKiUI.CreateSubMenu(MConcessMoto, "", "Concessionnaire")
    MConcessMotoSub2.Closed = function()
        supprimermotoconcess()
    end
    AzoKiUI.Visible(MConcessMoto, not AzoKiUI.Visible(MConcessMoto))
    while MConcessMoto do
        Wait(0)
            AzoKiUI.IsVisible(MConcessMoto, true, true, true, function()

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
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_motoshop', ('Concessionnaire'), montant)
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
                        TriggerServerEvent('dConcessMoto:Ouvert')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Annonces de fermeture",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessMoto:Fermer')
                    end
                end)

                AzoKiUI.ButtonWithStyle("Annonces de recrutement",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessMoto:Recrutement')
                    end
                end)

                AzoKiUI.Separator("↓ Actions véhicules ↓")

                AzoKiUI.ButtonWithStyle("Liste des véhicules", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MConcessMotoSub)

			end, function()
			end)

            	AzoKiUI.IsVisible(MConcessMotoSub, true, true, true, function()
                
					for i = 1, #dok_conc_moto.catevehi, 1 do
                        AzoKiUI.ButtonWithStyle("Catégorie - "..dok_conc_moto.catevehi[i].label, nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                                nomcategorie = dok_conc_moto.catevehi[i].label
                                categorievehi = dok_conc_moto.catevehi[i].name
                                ESX.TriggerServerCallback('dok_concess:recupererlistevehicule', function(listevehi)
                                        dok_conc_moto.listecatevehi = listevehi
                                end, categorievehi)
                            end
                        end, MConcessMotoSub1)
                        end
                        end, function()
                        end)

                AzoKiUI.IsVisible(MConcessMotoSub1, true, true, true, function()
			

                    AzoKiUI.Separator("↓ Catégorie : "..nomcategorie.." ↓")
            
                        for i2 = 1, #dok_conc_moto.listecatevehi, 1 do
                        AzoKiUI.ButtonWithStyle(dok_conc_moto.listecatevehi[i2].name, "Pour acheter ce véhicule", {RightLabel = dok_conc_moto.listecatevehi[i2].price.."$"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                                nommoto = dok_conc_moto.listecatevehi[i2].name
                                prixmoto = dok_conc_moto.listecatevehi[i2].price
                                modelemoto = dok_conc_moto.listecatevehi[i2].model
                                supprimermotoconcess()
                                chargementmoto(modelemoto)
            
                                ESX.Game.SpawnVehicle(modelemoto, {x = 961.21, y = -123.72, z = 74.35}, 230.31, function (vehicle)
                                table.insert(dernieremotosorti, vehicle)
                                FreezeEntityPosition(vehicle, true)
                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                SetModelAsNoLongerNeeded(modelemoto)
                                end)
                            end
                        end, MConcessMotoSub2)
                        
                        end
                        end, function()
                        end)

                        AzoKiUI.IsVisible(MConcessMotoSub2, true, true, true, function()

                            AzoKiUI.Separator("~p~↓ Vendre le véhicule au joueur le plus proche ↓")

                            AzoKiUI.ButtonWithStyle("Vendre le véhicule", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                                if (Selected) then    
                                        ESX.TriggerServerCallback('dok_concessmoto:verifsousconcess', function(suffisantsous)
                                        if suffisantsous then
                        
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        
                                        if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Personne autour')
                                        else
                                        supprimermotoconcess()
                                        chargementmoto(modelemoto)
                        
                                        ESX.Game.SpawnVehicle(modelemoto, {x = 961.21, y = -123.72, z = 74.35}, 230.31, function (vehicle)
                                        table.insert(sortirmotoacheter, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                        SetModelAsNoLongerNeeded(modelemoto)
                                        local plaque     = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(sortirmotoacheter[#sortirmotoacheter])
                                        vehicleProps.plate = plaque
                                        SetVehicleNumberPlateText(sortirmotoacheter[#sortirmotoacheter], plaque)
                                        FreezeEntityPosition(sortirmotoacheter[#sortirmotoacheter], false)
                        
                                        TriggerServerEvent('dok_concessmoto:vendrevoiturejoueur', GetPlayerServerId(closestPlayer), vehicleProps, prixmoto, nommoto)
                                        ESX.ShowNotification('Le véhicule '..nommoto..' avec la plaque '..vehicleProps.plate..' a été vendu à '..GetPlayerName(closestPlayer))
                                        --TriggerServerEvent('esx_vehiclelock:registerkey', vehicleProps.plate, GetPlayerServerId(closestPlayer))
                                        end)
                                        end
                                        else
                                            ESX.ShowNotification('La société n\'as pas assez d\'argent pour ce véhicule!')
                                        end
                        
                                    end, prixmoto)
                                        end
                                    end)

                                    AzoKiUI.Separator("~p~↓ Acheter le véhicule avec l'argent de la societé ↓")

                                    AzoKiUI.ButtonWithStyle("Acheter le véhicule", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                                        if (Selected) then   
                                            ESX.TriggerServerCallback('dok_concessmoto:verifsousconcess', function(suffisantsous)
                                            if suffisantsous then
                                            supprimermotoconcess()
                                            chargementmoto(modelemoto)
                                            ESX.Game.SpawnVehicle(modelemoto, {x = 961.21, y = -123.72, z = 74.35}, 230.31, function (vehicle)
                                            table.insert(sortirmotoacheter, vehicle)
                                            FreezeEntityPosition(vehicle, true)
                                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                            SetModelAsNoLongerNeeded(modelemoto)
                                            local plaque     = GeneratePlate()
                                            local vehicleProps = ESX.Game.GetVehicleProperties(sortirmotoacheter[#sortirmotoacheter])
                                            vehicleProps.plate = plaque
                                            SetVehicleNumberPlateText(sortirmotoacheter[#sortirmotoacheter], plaque)
                                            FreezeEntityPosition(sortirmotoacheter[#sortirmotoacheter], false)
                        
                                            TriggerServerEvent('shop:vehicule', vehicleProps, prixmoto, nommoto)
                                            ESX.ShowNotification('Le véhicule '..nommoto..' avec la plaque '..vehicleProps.plate..' a été vendu à '..GetPlayerName(PlayerId()))
                                            --TriggerServerEvent('esx_vehiclelock:registerkey', vehicleProps.plate, GetPlayerServerId(closestPlayer))
                                            end)
                        
                                            else
                                                ESX.ShowNotification('La société n\'as pas assez d\'argent pour ce véhicule!')
                                            end
                            
                                        end, prixmoto)
                                            end
                                        end)

                        end, function()
                        end)

              if not AzoKiUI.Visible(MConcessMoto) and not AzoKiUI.Visible(MConcessMotoSub) and not AzoKiUI.Visible(MConcessMotoSub1) and not AzoKiUI.Visible(MConcessMotoSub2) then
              MConcessMoto = RMenu:DeleteType("MConcessMoto", true)
        end
    end
end


Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'motoshop' or ESX.PlayerData.job2 and ESX.PlayerData.job2.name == 'motoshop' then  
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, ConcessMoto.pos.menu.position.x, ConcessMoto.pos.menu.position.y, ConcessMoto.pos.menu.position.z)
            if jobdist <= 10.0 and ConcessMoto.jeveuxmarker then
                Timer = 0
                DrawMarker(20, ConcessMoto.pos.menu.position.x, ConcessMoto.pos.menu.position.y, ConcessMoto.pos.menu.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        AzoKiUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au menu", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                            ESX.TriggerServerCallback('dok_concess:recuperercategorievehicule', function(catevehi)
                                dok_conc_moto.catevehi = catevehi
                            end)
                            MenuConcessMoto()
                    end   
                end
            end 
        Citizen.Wait(Timer)   
    end
end)


function supprimermotoconcess()
	while #dernieremotosorti > 0 do
		local vehicle = dernieremotosorti[1]

		ESX.Game.DeleteVehicle(vehicle)
		table.remove(dernieremotosorti, 1)
	end
end

function chargementmoto(modelHash)
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