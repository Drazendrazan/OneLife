--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil
menuIsOpened = false

AzoKi.newThread(function()
    Wait(1500)
    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)
        Wait(1)
    end
    ESX.PlayerData = ESX.GetPlayerData()
    while ESX.GetPlayerData().job == nil do
        Wait(1)
    end
    Job = ESX.PlayerData.job
    if Jobs.list[Job.name] ~= nil and Jobs.list[Job.name].onChange ~= nil then
        Jobs.list[Job.name].onChange()
    end
    AzoKi.toInternal("esxloaded")
    AzoKiClientUtils.toServer("jobInitiated", Job)
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    ESX.PlayerData = ESX.GetPlayerData()
    Job = ESX.PlayerData.job
    AzoKiClientUtils.toServer("jobUpdated", job)
end)

local antispam = false
RegisterCommand("co", function()
    if antispam then return end
    AzoKiClientUtils.toServer("coords", GetEntityCoords(PlayerPedId()))
    antispam = true
    AzoKi.newWaitingThread(500, function()
        antispam = false
    end)
end)