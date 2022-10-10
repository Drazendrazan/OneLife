ESX = nil

local playerCars = {}

dok_conc_bateau = {
	catevehi = {},
	listecatevehi = {},
}

local dernierbateausorti = {}
local sortirbateauacheter = {}
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
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_boatshop', ('Concessionnaire'), montant)
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
                        TriggerServerEvent('dConcessBateau:Ouvert')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Annonces de fermeture",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessBateau:Fermer')
                    end
                end)

                AzoKiUI.ButtonWithStyle("Annonces de recrutement",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessBateau:Recrutement')
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
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'boatshop' then
    	MenuF6ConcessAvion()
	end
end)
]]

function MenuConcessBateau()
    local MConcessBateau = AzoKiUI.CreateMenu("", "Concessionnaire")
    local MConcessBateauSub = AzoKiUI.CreateSubMenu(MConcessBateau, "", "Concessionnaire")
    local MConcessBateauSub1 = AzoKiUI.CreateSubMenu(MConcessBateau, "", "Concessionnaire")
    local MConcessBateauSub2 = AzoKiUI.CreateSubMenu(MConcessBateau, "", "Concessionnaire")
    MConcessBateauSub2.Closed = function()
        supprimerbateauconcess()
    end
    AzoKiUI.Visible(MConcessBateau, not AzoKiUI.Visible(MConcessBateau))
    while MConcessBateau do
        Wait(0)
            AzoKiUI.IsVisible(MConcessBateau, true, true, true, function()

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
                                            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_boatshop', ('Concessionnaire'), montant)
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
                        TriggerServerEvent('dConcessBateau:Ouvert')
                    end
                end)
        
                AzoKiUI.ButtonWithStyle("Annonces de fermeture",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessBateau:Fermer')
                    end
                end)

                AzoKiUI.ButtonWithStyle("Annonces de recrutement",nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then      
                        TriggerServerEvent('dConcessBateau:Recrutement')
                    end
                end)

                AzoKiUI.Separator("↓ Actions véhicules ↓")

                AzoKiUI.ButtonWithStyle("Liste des véhicules", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MConcessBateauSub)

			end, function()
			end)

            	AzoKiUI.IsVisible(MConcessBateauSub, true, true, true, function()
                
					for i = 1, #dok_conc_bateau.catevehi, 1 do
                        AzoKiUI.ButtonWithStyle("Catégorie - "..dok_conc_bateau.catevehi[i].label, nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                                nomcategorie = dok_conc_bateau.catevehi[i].label
                                categorievehi = dok_conc_bateau.catevehi[i].name
                                ESX.TriggerServerCallback('dok_concess:recupererlistevehicule', function(listevehi)
                                        dok_conc_bateau.listecatevehi = listevehi
                                end, categorievehi)
                            end
                        end, MConcessBateauSub1)
                        end
                        end, function()
                        end)

                AzoKiUI.IsVisible(MConcessBateauSub1, true, true, true, function()
			

                    AzoKiUI.Separator("↓ Catégorie : "..nomcategorie.." ↓")
            
                        for i2 = 1, #dok_conc_bateau.listecatevehi, 1 do
                        AzoKiUI.ButtonWithStyle(dok_conc_bateau.listecatevehi[i2].name, "Pour acheter ce véhicule", {RightLabel = dok_conc_bateau.listecatevehi[i2].price.."$"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                                nombateau = dok_conc_bateau.listecatevehi[i2].name
                                prixbateau = dok_conc_bateau.listecatevehi[i2].price
                                modelebateau = dok_conc_bateau.listecatevehi[i2].model
                                supprimerbateauconcess()
                                chargementbateau(modelebateau)
            
                                ESX.Game.SpawnVehicle(modelebateau, {x = -731.17, y = -1336.18, z = 0.94}, 227.35, function (vehicle)
                                table.insert(dernierbateausorti, vehicle)
                                FreezeEntityPosition(vehicle, true)
                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                SetModelAsNoLongerNeeded(modelebateau)
                                end)
                            end
                        end, MConcessBateauSub2)
                        
                        end
                        end, function()
                        end)

                        AzoKiUI.IsVisible(MConcessBateauSub2, true, true, true, function()

                            AzoKiUI.Separator("~p~↓ Vendre le véhicule au joueur le plus proche ↓")

                            AzoKiUI.ButtonWithStyle("Vendre le véhicule", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                                if (Selected) then    
                                        ESX.TriggerServerCallback('dok_concessbateau:verifsousconcess', function(suffisantsous)
                                        if suffisantsous then
                        
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        
                                        if closestPlayer == -1 or closestDistance > 3.0 then
                                        ESX.ShowNotification('Personne autour')
                                        else
                                        supprimerbateauconcess()
                                        chargementbateau(modelebateau)
                        
                                        ESX.Game.SpawnVehicle(modelebateau, {x = -731.17, y = -1336.18, z = 0.94}, 227.35, function (vehicle)
                                        table.insert(sortirbateauacheter, vehicle)
                                        FreezeEntityPosition(vehicle, true)
                                        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                        SetModelAsNoLongerNeeded(modelebateau)
                                        local plaque     = GeneratePlate()
                                        local vehicleProps = ESX.Game.GetVehicleProperties(sortirbateauacheter[#sortirbateauacheter])
                                        vehicleProps.plate = plaque
                                        SetVehicleNumberPlateText(sortirbateauacheter[#sortirbateauacheter], plaque)
                                        FreezeEntityPosition(sortirbateauacheter[#sortirbateauacheter], false)
                        
                                        TriggerServerEvent('dok_concessbateau:vendrevoiturejoueur', GetPlayerServerId(closestPlayer), vehicleProps, prixbateau, nombateau)
                                        ESX.ShowNotification('Le véhicule '..nombateau..' avec la plaque '..vehicleProps.plate..' a été vendu à '..GetPlayerName(closestPlayer))
                                        --TriggerServerEvent('esx_vehiclelock:registerkey', vehicleProps.plate, GetPlayerServerId(closestPlayer))
                                        end)
                                        end
                                        else
                                            ESX.ShowNotification('La société n\'as pas assez d\'argent pour ce véhicule!')
                                        end
                        
                                    end, prixbateau)
                                        end
                                    end)

                                    AzoKiUI.Separator("~p~↓ Acheter le véhicule avec l'argent de la societé ↓")

                                    AzoKiUI.ButtonWithStyle("Acheter le véhicule", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                                        if (Selected) then   
                                            ESX.TriggerServerCallback('dok_concessbateau:verifsousconcess', function(suffisantsous)
                                            if suffisantsous then
                                            supprimerbateauconcess()
                                            chargementbateau(modelebateau)
                                            ESX.Game.SpawnVehicle(modelebateau, {x = -731.17, y = -1336.18, z = 0.94}, 227.35, function (vehicle)
                                            table.insert(sortirbateauacheter, vehicle)
                                            FreezeEntityPosition(vehicle, true)
                                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                            SetModelAsNoLongerNeeded(modelebateau)
                                            local plaque     = GeneratePlate()
                                            local vehicleProps = ESX.Game.GetVehicleProperties(sortirbateauacheter[#sortirbateauacheter])
                                            vehicleProps.plate = plaque
                                            SetVehicleNumberPlateText(sortirbateauacheter[#sortirbateauacheter], plaque)
                                            FreezeEntityPosition(sortirbateauacheter[#sortirbateauacheter], false)
                        
                                            TriggerServerEvent('shop:vehicule', vehicleProps, prixbateau, nombateau)
                                            ESX.ShowNotification('Le véhicule '..nombateau..' avec la plaque '..vehicleProps.plate..' a été vendu à '..GetPlayerName(PlayerId()))
                                            --TriggerServerEvent('esx_vehiclelock:registerkey', vehicleProps.plate, GetPlayerServerId(closestPlayer))
                                            end)
                        
                                            else
                                                ESX.ShowNotification('La société n\'as pas assez d\'argent pour ce véhicule!')
                                            end
                            
                                        end, prixbateau)
                                            end
                                        end)

                        end, function()
                        end)

              if not AzoKiUI.Visible(MConcessBateau) and not AzoKiUI.Visible(MConcessBateauSub) and not AzoKiUI.Visible(MConcessBateauSub1) and not AzoKiUI.Visible(MConcessBateauSub2) then
              MConcessBateau = RMenu:DeleteType("MConcessBateau", true)
        end
    end
end


Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'boatshop' or ESX.PlayerData.job2 and ESX.PlayerData.job2.name == 'boatshop' then  
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, ConcessBateau.pos.menu.position.x, ConcessBateau.pos.menu.position.y, ConcessBateau.pos.menu.position.z)
            if jobdist <= 10.0 and ConcessBateau.jeveuxmarker then
                Timer = 0
                DrawMarker(20, ConcessBateau.pos.menu.position.x, ConcessBateau.pos.menu.position.y, ConcessBateau.pos.menu.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        AzoKiUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au menu", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                            ESX.TriggerServerCallback('dok_concess:recuperercategorievehicule', function(catevehi)
                                dok_conc_bateau.catevehi = catevehi
                            end)
                            MenuConcessBateau()
                    end   
                end
            end 
        Citizen.Wait(Timer)   
    end
end)


function supprimerbateauconcess()
	while #dernierbateausorti > 0 do
		local vehicle = dernierbateausorti[1]

		ESX.Game.DeleteVehicle(vehicle)
		table.remove(dernierbateausorti, 1)
	end
end

function chargementbateau(modelHash)
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