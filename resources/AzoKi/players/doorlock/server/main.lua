TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(
    function()
        for k, v in pairs(doorlockconfig) do
            if #v.entityToLock == 2 then
                local diffX = v.entityToLock[1].pos.x - v.entityToLock[2].pos.x
                local diffY = v.entityToLock[1].pos.y - v.entityToLock[2].pos.y
                local diffZ = v.entityToLock[1].pos.z - v.entityToLock[2].pos.z

                local newPos = (v.entityToLock[1].pos + v.entityToLock[2].pos) / 2

                v.posToDisplay = newPos
            elseif #v.entityToLock == 1 then
                v.posToDisplay = vector3(v.entityToLock[1].pos.xyz)
            end
        end
    end
)

AddEventHandler('playerSpawned', function()
    TriggerClientEvent("door:SyncDoorLock", -1, index)
end)

RegisterNetEvent("door:SyncDoorLock")
AddEventHandler("door:SyncDoorLock",
    function(index)
        local self = doorlockconfig[index]
        self.status = not self.status
        TriggerClientEvent("door:SyncDoorLock", -1, index)
    end
)

RegisterNetEvent("door:GetFirstSync")
AddEventHandler("door:GetFirstSync",
    function()
        TriggerClientEvent("door:GetFirstSync", source, doorlockconfig)
    end
)
