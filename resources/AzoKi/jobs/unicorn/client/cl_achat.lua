Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
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

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    
    blockinput = true 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "Somme", ExampleText, "", "", "", MaxStringLenght) 
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

--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('Achat', 'Unicorn DoK') 
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
  nomprenom = nil
  numero = nil
  heurerdv = nil
  rdvmotif = nil
end

--- FUNCTION OPENMENU ---

function OpenMenuAccueilUnicorn() 
    if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
        RageUI.IsVisible(mainMenu, function()

        RageUI.Button("~r~Acheter~s~ x1 Vin", nil, {RightLabel = "20$"}, not codesCooldown5 , {
			onSelected = function()
			TriggerServerEvent('dokunicorn:BuyVine')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
       end 
    })

        RageUI.Button("~r~Acheter~s~ x1 Mojito", nil, {RightLabel = "10$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('dokunicorn:BuyMojito')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~r~Acheter~s~ x1 Ice Tea", nil, {RightLabel = "8$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('dokunicorn:BuyIceTea')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~r~Acheter~s~ x1 Eau", nil, {RightLabel = "7$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('dokunicorn:BuyEau')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~r~Acheter~s~ x1 Whisky-coca", nil, {RightLabel = "12$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('dokunicorn:BuyWhiskycoca')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~r~Acheter~s~ x1 Coca", nil, {RightLabel = "6$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('dokunicorn:BuyCoca')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~r~Acheter~s~ x1 Limonade", nil, {RightLabel = "7$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('dokunicorn:BuyLimonade')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

    RageUI.Button("~r~Acheter~s~ x1 Fanta", nil, {RightLabel = "10$"}, not codesCooldown5 , {
        onSelected = function()
        TriggerServerEvent('dokunicorn:BuyFanta')	
        Citizen.SetTimeout(5000, function() codesCooldown5 = false end)
        end 
    })

		end)			
		Wait(0)
	   end
	end)
 end
end



--[[
local npc = {
    {hash="a_m_y_business_02", x = 980.89, y = -1705.84, z = 31.12, a = 81.84},
}

Citizen.CreateThread(function()
    for _, item2 in pairs(npc) do
        local hash = GetHashKey(item2.hash)
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped2 = CreatePed("PED_TYPE_CIVFEMALE", item2.hash, item2.x, item2.y, item2.z-0.92, item2.a, false, true)
        SetBlockingOfNonTemporaryEvents(ped2, true)
        FreezeEntityPosition(ped2, true)
        SetEntityInvincible(ped2, true)
    end
end)  
]]

--- FUNCTION OPENMENU ---

function ShopUnicornAchat()
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



local positionachat = {
    {x = 129.67, y = -1284.93, z = 29.26}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(positionachat) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unicorn' then 
            local plyCoords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionachat[k].x, positionachat[k].y, positionachat[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(22, 129.67, -1284.93, 29.26, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour intéragir", 1) 
                if IsControlJustPressed(1,51) then
					ShopUnicornAchat()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


