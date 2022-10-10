Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--[[
local mainMenu = RageUI.CreateMenu('Récolte Pain', '~p~BurgerShot')

function OpenMenuRecolte()
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

			RageUI.Button("Commencer la Récolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecolte()
				end
			})

			RageUI.Button("Stopper la Récolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopRecolte()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end

--- FUNCTION RECOLTE ---
function StopRecolte()
    if recoltepossible then
    	recoltepossible = false
    end
end

function StartRecolte()
    if not recoltepossible then
        recoltepossible = true
    while recoltepossible do
        Citizen.Wait(2000)
        TriggerServerEvent('recoltepainburger')
    end
    else
        recoltepossible = false
    end
end

----OUVRIR LE MENU------------
local position = {
	{x = -702.87, y = -916.92, z = 19.21}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 20.0 then
            wait = 0
            DrawMarker(22, -702.87, -916.92, 19.21, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour récolter", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuRecolte()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


local mainMenu = RageUI.CreateMenu('Recolte Garnitures', 'BurgerShot')

function OpenMenuTraitement()
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

			RageUI.Button("Commencer la recolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					StartTraitement()
				end
			})

			RageUI.Button("Stopper la recolte", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopTraitement()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end

--- FUNCTION RECOLTE ---
function StopTraitement()
    if traitementpossible then
    	traitementpossible = false
    end
end

function StartTraitement()
    if not traitementpossible then
        traitementpossible = true
    while traitementpossible do
            Citizen.Wait(2000)
            TriggerServerEvent('recoltegarnitures')
    end
    else
        traitementpossible = false
    end
end

----OUVRIR LE MENU------------
local position = {
	{x = 583.9, y = 138.08, z = 99.47}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 20.0 then
            wait = 0
            DrawMarker(22, 583.9, 138.08, 99.47, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour recolter", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuTraitement()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)
]]
