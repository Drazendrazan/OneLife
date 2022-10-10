--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiSNpcsManager = {}
AzoKiSNpcsManager.list = {}

AzoKiSNpcsManager.createPublic = function(model, ai, frozen, position, animation, onCreate)
    local npc = Npc(model, ai, frozen, position, animation, false)
    npc:setOnCreate(onCreate or function() end)
    AzoKiServerUtils.toAll("newNpc", npc)
    return npc
end

AzoKiSNpcsManager.createPrivate = function(model, ai, frozen, position, animation, baseAllowed, onCreate)
    local npc = Npc(model, ai, frozen, position, animation, true, baseAllowed)
    local players = ESX.GetPlayers()
    for k, v in pairs(players) do
        if npc:isAllowed(v) then
            AzoKiServerUtils.toClient("newNpc", v, npc)
        end
    end
    return npc
end

AzoKiSNpcsManager.addAllowed = function(npcId, playerId)
    if not AzoKiSNpcsManager.list[npcId] then
        return
    end
    ---@type Npc
    local npc = AzoKiSNpcsManager.list[npcId]
    if npc:isAllowed(playerId) then
        print(AzoKi.prefix(AzoKiPrefixes.npcs,("Tentative d'ajouter l'ID %s au npc %s alors qu'il est déjà autorisé"):format(playerId, npcId)))
        return
    end
    npc:addAllowed(playerId)
    AzoKiServerUtils.toClient("newNpc", playerId, npc)
    AzoKiSNpcsManager.list[npcId] = npc
end

AzoKiSNpcsManager.removeAllowed = function(npcId, playerId)
    if not AzoKiSNpcsManager.list[npcId] then
        return
    end
    ---@type Npc
    local npc = AzoKiSNpcsManager.list[npcId]
    if not npc:isAllowed(playerId) then
        print(AzoKi.prefix(AzoKiPrefixes.npcs,("Tentative de supprimer l'ID %s au blip %s alors qu'il n'est déjà pas autorisé"):format(playerId, npcId)))
        return
    end
    npc:removeAllowed(playerId)
    AzoKiServerUtils.toClient("delNpc", playerId, npcId)
    AzoKiSNpcsManager.list[npcId] = npc
end

AzoKiSNpcsManager.updateOne = function(source)
    local npcs = {}
    ---@param npc Npc
    for npcId, npc in pairs(AzoKiSNpcsManager.list) do
        if npc:isRestricted() then
            if npc:isAllowed(source) then
                npcs[npcId] = npc
            end
        else
            npcs[npcId] = npc
        end
    end
    AzoKiServerUtils.toClient("cbNpcs", source, npcs)
end

AzoKi.netRegisterAndHandle("requestPredefinedNpcs", function()
    local source = source
    AzoKiSNpcsManager.updateOne(source)
end)

