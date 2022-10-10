-----------------------DoK--------------------
----Disable Auto Aim
--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if currentWeaponHash ~= -1569615261 then
        	SetPlayerLockon(PlayerId(), false)
        else
        	SetPlayerLockon(PlayerId(), true)
		end
	end
end)
]]

----Disable Coup de Crosse

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if IsPedArmed(ped, 6) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
		end
	end
end)

----Disable Drop Weapon Police Car
--[[
AddEventHandler("playerSpawned", function()
	if not isCop then
        disablePlayerVehicleRewards(-1);
    end
end)
]]

Citizen.CreateThread(function()
	while true do Citizen.Wait(100)
		if IsPedInAnyPoliceVehicle(GetPlayerPed(-1), -1) or IsPedInAnyHeli(GetPlayerPed(-1)) then
			DisablePlayerVehicleRewards(GetPlayerPed(-1))
		end
	end
end)