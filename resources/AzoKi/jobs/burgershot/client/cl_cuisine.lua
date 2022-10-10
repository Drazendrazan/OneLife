

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


-- MENU FUNCTION --

local open = false 
local tacosMain5 = RageUI.CreateMenu('BurgerShot', '~p~Interaction')
tacosMain5.Display.Header = true 
tacosMain5.Closed = function()
  open = false
end


function OpenCuisine()
	if open then 
		open = false
		RageUI.Visible(tacosMain5, false)
		return
	else
		open = true 
		RageUI.Visible(tacosMain5, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(tacosMain5,function() 

        RageUI.Separator("~p~↓ BurgerShot ↓")

			RageUI.Button("Préparer un Burger", "~r~Requis : ~w~Pain + Viande + Garnitures + Cornichons", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(6500)
                    TriggerServerEvent('craftburgerclassique')
                    ClearPedTasksImmediately(playerPed)
                end
			})

      RageUI.Button("Préparer un Double Burger", "~r~Requis : ~w~Pain + Viande + Viande + Garnitures + Cornichons", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                    Citizen.Wait(6500)
                    TriggerServerEvent('craftdoubleburgerclassique')
                    ClearPedTasksImmediately(playerPed)
                end
			})

      --RageUI.Separator(" ~r~Ceci est un exemple ")
			
    
        end)			
		Wait(0)
	   end
	end)
 end
end

        ----OUVRIR LE MENU------------
  local position = {
     {x = -1199.3, y = -898.95, z = 14.0}
    }

        Citizen.CreateThread(function()
          while true do
      
            local wait = 750
      
              for k in pairs(position) do
              if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then 
                  local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                  local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
      
                  if dist <= 5.0 then
                  wait = 0
                  DrawMarker(22, -1199.3, -898.95, 14.0, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  
      
              
                  if dist <= 1.0 then
                     wait = 0
                      Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour intéragir", 1) 
                      if IsControlJustPressed(1,51) then
                OpenCuisine()
                  end
              end
          end
          end
          Citizen.Wait(wait)
          end
      end
      end)