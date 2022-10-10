--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiSBlipsManager = {}
AzoKiSBlipsManager.list = {}

AzoKiSBlipsManager.createPublic = function(position, sprite, color, scale, text, shortRange)
    local blip = Blip(position, sprite, color, scale, text, shortRange, false)
    AzoKiServerUtils.toAll("newBlip", blip)
    return blip.blipId
end

AzoKiSBlipsManager.createPrivate = function(position, sprite, color, scale, text, shortRange, baseAllowed)
    local blip = Blip(position, sprite, color, scale, text, shortRange, true, baseAllowed)
    local players = ESX.GetPlayers()
    for k, v in pairs(players) do
        if blip:isAllowed(v) then
            AzoKiServerUtils.toClient("newBlip", v, blip)
        end
    end
    return blip.blipId
end

AzoKiSBlipsManager.addAllowed = function(blipID, playerId)
    if not AzoKiSBlipsManager.list[blipID] then
        return
    end
    ---@type Blip
    local blip = AzoKiSBlipsManager.list[blipID]
    if blip:isAllowed(playerId) then
        print(AzoKi.prefix(AzoKiPrefixes.blips,("Tentative d'ajouter l'ID %s au blip %s alors qu'il est déjà autorisé"):format(playerId,blipID)))
        return
    end
    blip:addAllowed(playerId)
    AzoKiServerUtils.toClient("newBlip", playerId, blip)
    AzoKiSBlipsManager.list[blipID] = blip
end

AzoKiSBlipsManager.removeAllowed = function(blipID, playerId)
    if not AzoKiSBlipsManager.list[blipID] then
        return
    end
    ---@type Blip
    local blip = AzoKiSBlipsManager.list[blipID]
    if not blip:isAllowed(playerId) then
        print(AzoKi.prefix(AzoKiPrefixes.blips,("Tentative de supprimer l'ID %s au blip %s alors qu'il n'est déjà pas autorisé"):format(playerId,blipID)))
        return
    end
    blip:removeAllowed(playerId)
    AzoKiServerUtils.toClient("delBlip", playerId, blipID)
    AzoKiSBlipsManager.list[blipID] = blip
end

AzoKiSBlipsManager.updateOne = function(source)
    local blips = {}
    ---@param blip Blip
    for blipID, blip in pairs(AzoKiSBlipsManager.list) do
        if blip:isRestricted() then
            if blip:isAllowed(source) then
                blips[blipID] = blip
            end
        else
            blips[blipID] = blip
        end
    end
    AzoKiServerUtils.toClient("cbBlips", source, blips)
end

AzoKiSBlipsManager.delete = function(blipID)
    if not AzoKiSBlipsManager.list[blipID] then
        return
    end
    ---@type Zone
    local blip = AzoKiSBlipsManager.list[blipID]
    if blip:isRestricted() then
        local players = ESX.GetPlayers()
        for k, playerId in pairs(players) do
            if blip:isAllowed(playerId) then
                AzoKiServerUtils.toClient("delBlip", playerId, blipID)
            end
        end
    else
        AzoKiServerUtils.toAll("delBlip", blipID)
    end
end

AzoKi.netRegisterAndHandle("requestPredefinedBlips", function()
    local source = source
    AzoKiSBlipsManager.updateOne(source)
end)