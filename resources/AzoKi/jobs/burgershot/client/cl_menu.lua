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

local function MarquerJoueur()
	local ped = GetPlayerPed(ESX.Game.GetClosestPlayer())
	local pos = GetEntityCoords(ped)
	local target, distance = ESX.Game.GetClosestPlayer()
	if distance <= 4.0 then
	DrawMarker(2, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 1, nil, nil, 0)
end
end

-- MENU FUNCTION --

local open = false 
local mainMenu8 = RageUI.CreateMenu('', 'BurgerShot - ~p~Interaction')
local subMenu8 = RageUI.CreateSubMenu(mainMenu8, "", "Annonces BurgerShot - ~p~Interaction")
local subMenu10 = RageUI.CreateSubMenu(mainMenu8, "", "Farm BurgerShot - ~p~Interaction")
mainMenu8.Display.Header = true 
mainMenu8.Closed = function()
  open = false
end

function OpenF6BurgerShot()
	if open then 
		open = false
		RageUI.Visible(mainMenu8, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu8, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu8,function() 

			RageUI.Separator("~r~↓ Annonce ↓")

			RageUI.Button("Annonces BurgerShot", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu8)

			RageUI.Separator("~r~↓ Facture ↓")

			RageUI.Button("Faire une Facture", nil, {RightLabel = "→"}, true , {
				onActive = function()
					if closestPlayer ~= -1 then
						MarquerJoueur()
					end
				end,
				onSelected = function()
					--OpenFactureBurgerShot()
                local montant = tonumber(KeyboardInput('', '', 100))
				if montant == nil or montant <= 0 then
					ESX.ShowNotification('Montant invalide')
				else
					RageUI.CloseAll()
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

					if closestPlayer == -1 or closestDistance > 3.0 then
						ESX.ShowNotification('Pas de joueurs proche')
					else
						local playerPed = PlayerPedId()

						Citizen.CreateThread(function()
							TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
							Citizen.Wait(5000)
							ClearPedTasks(playerPed)
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_burgershot', 'Burgershot', montant)
						end)
					end
				end
				end
			})
			
--[[
			RageUI.Separator("~r~↓ Farm ↓")

			RageUI.Button("Pour accéder au farms", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu10)
]]
			end)

			RageUI.IsVisible(subMenu8,function() 


			RageUI.Button("Annonce [~p~Ouvertures]", nil, {RightLabel = "→"}, not codesCooldown1, {
				onSelected = function()
					codesCooldown1 = true 
					TriggerServerEvent('Ouvre:burgershot')
					Citizen.SetTimeout(8000, function() codesCooldown1 = false end)
				end
			})

			RageUI.Button("Annonce [~r~Fermetures]", nil, {RightLabel = "→"}, not codesCooldown2, {
				onSelected = function()
					codesCooldown2 = true 
					TriggerServerEvent('Ferme:burgershot')
					Citizen.SetTimeout(8000, function() codesCooldown2 = false end)
				end
			})

			RageUI.Button("Annonce [~p~Recrutement]", nil, {RightLabel = "→"}, not codesCooldown3, {
				onSelected = function()
					codesCooldown3 = true 
					TriggerServerEvent('Recru:burgershot')
					Citizen.SetTimeout(8000, function() codesCooldown3 = false end)
				end
			})

--[[
			RageUI.Button("Annonce [~o~Personnalisé]", nil, {RightLabel = "→"}, not codesCooldown4, {
				onSelected = function()
					codesCooldown4 = true 
					local perso = KeyboardInput("Message", "", 100)
					ExecuteCommand("burg " ..perso)
					Citizen.SetTimeout(8000, function() codesCooldown4 = false end)
				end
			})
]]



		   end)


		   RageUI.IsVisible(subMenu10,function() 

			RageUI.Button("Obtenir le point de récolte Pain", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					SetNewWaypoint(-702.87, -916.92, 19.21)  
				end
			})

			RageUI.Button("Obtenir le point de récolte Garnitures", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					SetNewWaypoint(583.9, 138.08, 99.47) 
				end 
			})




			end)

		 Wait(0)
		end
	 end)
  end
end




-- FUNCTION BILLING --
--[[
function OpenFactureBurgerShot()

	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Facture"
	  },
	  function(data, menu)
	  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer()
  
		if player ~= -1 and distance <= 3.0 then
  
		  menu.close()
		  if amount == nil then
			  ESX.ShowNotification("~r~Problèmes~s~: Montant invalide")
		  else
			local playerPed        = GetPlayerPed(-1)
			TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
			Citizen.Wait(5000)
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_burgershot', ('BurgerShot'), amount)
			  Citizen.Wait(100)
			  ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
		  end
  
		else
		  ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
		end
  
	  end,
	  function(data, menu)
		  menu.close()
	  end)
end
]]
  

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end

-- OUVERTURE DU MENU --

Keys.Register('F6', 'burgershot', 'Ouvrir le menu burgershot', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
    	OpenF6BurgerShot()
	end
end)

