local doorlockconfig = {}
local PlayerData = {}

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	PlayerData.job2 = job2
end)

local registeredDoors = {}
function LoockDoor(index, owner)
    local self = doorlockconfig[index]
    if PlayerData.job ~= nil then
        TriggerServerEvent("door:SyncDoorLock", index)
        TaskPlayAnim(PlayerPedId(), "anim@mp_player_intmenu@key_fob@", "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
    end
end

local inCooldown = false
local function DoorCooldown()
    Citizen.CreateThread(function()
        inCooldown = true
        Wait(2000)
        inCooldown = false
    end)
end

Citizen.CreateThread(function()
    TriggerServerEvent("door:GetFirstSync")
    while true do
        local pPed = PlayerPedId()
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(doorlockconfig) do
            local dst = GetDistanceBetweenCoords(pCoords, v.posToDisplay.xyz, true)
            while dst <= v.dstToDisplay do

                pCoords = GetEntityCoords(pPed)
                dst = GetDistanceBetweenCoords(pCoords, v.posToDisplay.xyz, true)
                DrawLine(pCoords, v.posToDisplay.xyz, 255, 255, 255, 255)

                if not inCooldown then
                    if v.status then
                        DrawText3DoK(v.posToDisplay, "Fermé", 0.7, 0)
                        if PlayerData.job ~= nil then
                            local pos = vector3(v.posToDisplay.x, v.posToDisplay.y, v.posToDisplay.z - 0.1)
                            --DrawText3DoK(pos, "~o~Tu n'as pas les bonnes clés", 0.5, 0)
                        end
                    else
                        DrawText3DoK(v.posToDisplay, "Ouvert", 0.7, 0)
                    end
                else
                    DrawText3DoK(v.posToDisplay, "En attente ...", 0.7, 0)
                end

                if IsControlJustReleased(0, 38) and not inCooldown then
                    DoorCooldown()
                    LoockDoor(k, true)
                end 

                Wait(1)
            end
        end 
        Wait(500)
    end
end)


Citizen.CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(doorlockconfig) do
            for i,j in pairs(v.entityToLock) do
                local door = GetClosestObjectOfType(j.pos.xyz, 1.0, j.hash, false, false, false)
                FreezeEntityPosition(door, v.status)
            end
        end 
        Wait(1000)
    end
end)


RegisterNetEvent("door:SyncDoorLock")
AddEventHandler("door:SyncDoorLock", function(index)
    
    local self = doorlockconfig[index]
    self.status = not self.status
    for k,v in pairs(self.entityToLock) do
        local door = GetClosestObjectOfType(v.pos.xyz, 1.0, v.hash, false, false, false)

        if registeredDoors[v.hash] == nil then
            AddDoorToSystem(v.hash, v.hash, v.pos.xyz, 0, false, true)
        end

        FreezeEntityPosition(door, self.status)
        if self.status then
            SetEntityHeading(door, v.pos.w) 
            SetEntityCoordsNoOffset(door, v.pos.xyz, 0.0, 0.0, 0.0)
            -- DoorSystemSetDoorState(v.hash, 1, true, true)
            -- DoorSystemSetOpenRatio(v.hash, 0.001, true, false)
        else
            -- DoorSystemSetDoorState(v.hash, 0, true, true)
            -- DoorSystemSetHoldOpen(v.hash, false)
            -- DoorSystemSetOpenRatio(v.hash, 0.0, true, false)
        end
    end
end)

RegisterNetEvent("door:GetFirstSync")
AddEventHandler("door:GetFirstSync", function(doorSync)
    doorlockconfig = doorSync
end)

function DrawText3DoK(coords, text, size, font)
	coords = vector3(coords.x, coords.y, coords.z)

	local camCoords = GetGameplayCamCoords()
	local distance = #(coords - camCoords)

	if not size then size = 1 end
	if not font then font = 0 end

	local scale = (size / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	scale = scale * fov

	SetTextScale(0.0 * scale, 0.55 * scale)
	SetTextFont(font)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	SetDrawOrigin(coords, 0)
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end