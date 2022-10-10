Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('BurgerShot', '~p~Frigo') 
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function ShopBurgerShot()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu,function() 

			RageUI.Separator("~r~↓ Cuisine ↓")

			RageUI.Button("Pain", nil, {RightLabel = "~p~3$"}, true , {
				onSelected = function()
					TriggerServerEvent('burgershot:BuyPainBurger')
				end
			})

			RageUI.Button("Viande", nil, {RightLabel = "~p~5$"}, true , {
				onSelected = function()
					TriggerServerEvent('burgershot:BuyViande')
				end
			})

			RageUI.Button("Garnitures", nil, {RightLabel = "~p~2$"}, true , {
				onSelected = function()
					TriggerServerEvent('burgershot:BuyGarnitures')
				end
			})

			RageUI.Button("Cornichons", nil, {RightLabel = "~p~1$"}, true , {
				onSelected = function()
					TriggerServerEvent('burgershot:BuyCornichons')
				end
			})

			RageUI.Button("Salades", nil, {RightLabel = "~p~3$"}, true , {
				onSelected = function()
					TriggerServerEvent('burgershot:BuySalades')
				end
			})

			RageUI.Button("Tomates", nil, {RightLabel = "~p~2$"}, true , {
				onSelected = function()
					TriggerServerEvent('burgershot:BuyTomates')
				end
			})

			RageUI.Separator("~p~↓ Frites ↓")

			RageUI.Button("Frite", nil, {RightLabel = "~p~2$"}, true , {
				onSelected = function()
					TriggerServerEvent('burgershot:BuyFrites')
				end
			})


			RageUI.Separator("~r~↓ Boissons ↓")

            RageUI.Button("Coca", nil, {RightLabel = "~p~3$"}, true , {
				onSelected = function()
					TriggerServerEvent('burgershot:BuyCoca')
				end
			})

			RageUI.Button("Orangina", nil, {RightLabel = "~p~3$"}, true , {
				onSelected = function()
					TriggerServerEvent('burgershot:BuyOrangina')
				end
			})
		end)			
		Wait(0)
	   end
	end)
 end
end
		-------------------------------------------------------------------------------------------------------

----OUVRIR LE MENU------------
local position = {
	{x = -1197.1, y = -893.95, z = 14.0}
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
            DrawMarker(22, -1197.1, -893.95, 14.0, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour intéragir", 1) 
                if IsControlJustPressed(1,51) then
					ShopBurgerShot()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)