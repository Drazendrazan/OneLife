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
local mainMenu = RageUI.CreateMenu('~p~Boss Action', '~p~interaction')
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end


function OpenMenuBossBurgerShot()
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
            RageUI.Separator("↓ ~p~  Panel de comptabilité  ~s~↓")

            RageUI.Button('Retirer de l\'argent.', " ", {RightLabel = ">"}, true, {onSelected = function()
                local money = KeyboardInput('Combien voulez vous retirer :', '', 10)
                TriggerServerEvent("burgershot:withdrawMoney","society_"..ESX.PlayerData.job.name ,money)
                RefreshburgershotMoney()
            end});   

            RageUI.Button('Déposer de l\'argent.', " ", {RightLabel = ">"}, true, {onSelected = function()
                local money = KeyboardInput('Combien voulez vous retirer :', '', 10)
                TriggerServerEvent("burgershot:depositMoney","society_"..ESX.PlayerData.job.name ,money)
                RefreshburgershotMoney()
            end});  

            
            RageUI.Separator("↓ ~p~  Management  ~s~↓")

            RageUI.Button("Gestion de l'entreprise", nil, {RightLabel = "→"}, true , {
               onSelected = function()
                   BossBurgerShot()
                   RageUI.CloseAll()
               end
           })

		   end)
		 Wait(0)
		end
	 end)
  end
end

function BossBurgerShot()
  TriggerEvent('esx_society:openBossMenu', 'burgershot', function(data, menu)
      menu.close()
  end, {wash = false})
end


function RefreshburgershotMoney()
    if ESX.PlayerData.job == 'burgershot' and ESX.PlayerData.job.grade_name == 'boss' then
        ESX.TriggerServerCallback('burgershot:getSocietyMoney', function(money)
          societyburgershotmoney = money
        end, "society_"..ESX.PlayerData.job.name)
    end
end


function UpdateSocietyburgershotMoney(money)
    societyburgershotmoney = ESX.Math.GroupDigits(money)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
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

----OUVRIR LE MENU------------

local position = {
    {x = -1192.44, y = -902.33, z = 14.0} 
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' and ESX.PlayerData.job.grade_name == 'boss' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(22, -1192.44, -902.33, 14.0, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 79, 255, true, true, p19, true)  

        
            if dist <= 2.0 then
               wait = 0
                Visual.Subtitle("Appuyez sur [~p~E~w~] pour accéder a l'ordinateur", 1) 
                if IsControlJustPressed(1,51) then
                  OpenMenuBossBurgerShot()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)