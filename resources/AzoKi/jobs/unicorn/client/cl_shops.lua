Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('Unicorn', '~p~Frigo') 
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

function ShopUnicorn()
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

			RageUI.Separator("~p~↓ Boissons Sans Alcools ↓")

			RageUI.Button("Eau", nil, {RightLabel = "~p~3$"}, true , {
				onSelected = function()
					TriggerServerEvent('dokunicorn:BuyEau')
				end
			})

			RageUI.Button("Ice Tea", nil, {RightLabel = "~p~6$"}, true , {
				onSelected = function()
					TriggerServerEvent('dokunicorn:BuyIceTea')
				end
			})

			RageUI.Button("Limonade", nil, {RightLabel = "~p~7$"}, true , {
				onSelected = function()
					TriggerServerEvent('dokunicorn:BuyLimonade')
				end
			})

            RageUI.Button("Coca", nil, {RightLabel = "~p~7$"}, true , {
				onSelected = function()
					TriggerServerEvent('dokunicorn:BuyCoca')
				end
			})

			RageUI.Button("Fanta", nil, {RightLabel = "~p~10$"}, true , {
				onSelected = function()
					TriggerServerEvent('dokunicorn:BuyFanta')
				end
			})

			RageUI.Separator("~p~↓ Boissons Alcoolisée ↓")

			RageUI.Button("Vin", nil, {RightLabel = "~p~20$"}, true , {
				onSelected = function()
					TriggerServerEvent('dokunicorn:BuyVine')
				end
			})

			RageUI.Button("Whisky Coca", nil, {RightLabel = "~p~15$"}, true , {
				onSelected = function()
					TriggerServerEvent('dokunicorn:BuyWhiskycoca')
				end
			})

			RageUI.Button("Mojito", nil, {RightLabel = "~p~10$"}, true , {
				onSelected = function()
					TriggerServerEvent('dokunicorn:BuyMojito')
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
	{x = 129.67, y = -1284.93, z = 29.26}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unicorn' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(22, 129.67, -1284.93, 29.26, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour intéragir", 1) 
                if IsControlJustPressed(1,51) then
					ShopUnicorn()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)