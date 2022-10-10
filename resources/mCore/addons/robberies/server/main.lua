---@author Pablo Z.
---@version 1.0
--[[
  This file is part of AzoKi RolePlay.
  
  File [main] created at [11/05/2021 20:34]

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiSRobberiesManager = {}
AzoKiSRobberiesManager.list = {}
AzoKiSRobberiesManager.players = {}

AzoKi.netHandle("esxloaded", function()
    for id, robberyInfos in pairs(AzoKiSharedRobberies) do
        ---@type Robbery
        local robbery = Robbery(id,robberyInfos)
        AzoKiSRobberiesManager.list[id] = robbery
    end
end)

AzoKi.netRegisterAndHandle("robberiesStart", function(id, xPlayers)
    local _src = source
	local xPlayer  = ESX.GetPlayerFromId(_src)
	local xPlayers = ESX.GetPlayers()
    ---@type Robbery
    local cops = 0
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            cops = cops + 1
        end
    end

    if not rob then
        if cops >= 1 then
            rob = true

            --[[for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                if xPlayer.job.name == 'police' then
                    --TriggerClientEvent('esx:showNotification', xPlayers[i], 'Robberie')
                    --TriggerClientEvent('robberies:setBlip', xPlayers[i], AzoKiSharedRobberies.entry)
                end
            end]]

                local robbery = AzoKiSRobberiesManager.list[id]
                robbery:handleStart(_src)
        else
			TriggerClientEvent('esx:showNotification', _src, 'Pas de policier !')
        end
    end
end)

AzoKi.netRegisterAndHandle("robberiesDiedDuring", function()
    local _src = source
    local xPlayers = ESX.GetPlayers()
	rob = false

	--for i=1, #xPlayers, 1 do
		--local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

            local robbery = AzoKiSRobberiesManager.list[AzoKiSRobberiesManager.players[_src].id]
            robbery:exitRobbery(_src, true)
            --TriggerClientEvent('robberies:killBlip', xPlayers[i])
    --end
end)

AzoKi.netRegisterAndHandle("robberiesAddItem", function(itemTable)
    local _src = source
    if not AzoKiSRobberiesManager.players[_src] then
        --@TODO -> Faire une liste d'error
        DropPlayer(_src, "Une erreur est survenue, contactez un staff, Erreur: 16489")
        return
    end
    table.insert(AzoKiSRobberiesManager.players[_src].bag, itemTable)
end)