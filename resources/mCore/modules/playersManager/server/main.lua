---@author Pablo Z.
---@version 1.0
--[[
  This file is part of AzoKi RolePlay.
  
  File [main] created at [19/04/2021 23:51]

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiSPlayersManager = {}
AzoKiSPlayersManager.eventOverrider = {}
AzoKiSPlayersManager.addonCache = {}
AzoKiSPlayersManager.list = {}

AzoKiSPlayersManager.registerAddonCache = function(index, onConnect, onDisconnect, onChange)
    AzoKiServerUtils.trace(("Enregistrement d'un cache joueur: ^3%s"):format(index), AzoKiPrefixes.dev)
    AzoKiSPlayersManager.addonCache[index] = { onConnect, onDisconnect, onChange }
end

AzoKiSPlayersManager.registerEventOverrider = function(type, func)
    AzoKiSPlayersManager.eventOverrider[(#AzoKiSPlayersManager.eventOverrider + 1)] = { on = type, handle = func }
end

AzoKiSPlayersManager.exists = function(source)
    return AzoKiSPlayersManager.list[source] ~= nil
end

AzoKiSPlayersManager.createPlayer = function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local steam, license = xPlayer.identifier, AzoKiServerUtils.getLicense(source)
    AzoKiSPlayersManager.list[source] = Player(source, steam, license)
end

AzoKiSPlayersManager.getPlayer = function(source)
    return AzoKiSPlayersManager.list[source]
end

AzoKiSPlayersManager.removePlayer = function(source)
    AzoKiSPlayersManager.list[source] = nil
end

AzoKi.netHandleBasic("playerDropped", function(reason)
    local source = source
    if not AzoKiSPlayersManager.exists(source) then
        return
    end
    AzoKiServerUtils.trace(("Déconnexion de %s"):format(GetPlayerName(source)), AzoKiPrefixes.dev)
    for _, eventOverriderInfos in pairs(AzoKiSPlayersManager.eventOverrider) do
        if eventOverriderInfos.on == PLAYER_EVENT_TYPE.LEAVING then
            eventOverriderInfos.handle(source)
        end
    end
    for _, handlers in pairs(AzoKiSPlayersManager.addonCache) do
        handlers[2](AzoKiSPlayersManager.list[source])
    end
    AzoKiSPlayersManager.removePlayer(source)
end)

AzoKi.netHandleBasic('esx:playerLoaded', function(source, xPlayer)
    local source = source
    AzoKiServerUtils.trace(("Connexion de %s"):format(GetPlayerName(source)), AzoKiPrefixes.dev)
    AzoKiSPlayersManager.createPlayer(source)
    for _, eventOverriderInfos in pairs(AzoKiSPlayersManager.eventOverrider) do
        if eventOverriderInfos.on == PLAYER_EVENT_TYPE.CONNECTED then
            eventOverriderInfos.handle(source)
        end
    end
    for _, handlers in pairs(AzoKiSPlayersManager.addonCache) do
        handlers[1](AzoKiSPlayersManager.list[source])
    end
end)

AzoKi.newRepeatingTask(function()
    ---@param player Player
    for _, player in pairs(AzoKiSPlayersManager.list) do
        player:incrementSessionTimePlayed()
    end
end, nil, 0, AzoKi.second(60))