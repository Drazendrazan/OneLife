--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiSZonesManager = {}
AzoKiSZonesManager.list = {}

AzoKiSZonesManager.createPublic = function(location, type, color, onInteract, helpText, drawDist, itrDist)
    local zone = Zone(location, type, color, onInteract, helpText, drawDist, itrDist, false)
    local marker = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
    AzoKiServerUtils.toAll("newMarker", marker)
    return zone.zoneID
end

AzoKiSZonesManager.createPrivate = function(location, type, color, onInteract, helpText, drawDist, itrDist, baseAllowed)
    local zone = Zone(location, type, color, onInteract, helpText, drawDist, itrDist, true, baseAllowed)
    local marker = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
    local players = ESX.GetPlayers()
    for k, v in pairs(players) do
        if zone:isAllowed(v) then
            AzoKiServerUtils.toClient("newMarker", v, marker)
        end
    end
    return zone.zoneID
end

AzoKiSZonesManager.addAllowed = function(zoneID, playerId)
    if not AzoKiSZonesManager.list[zoneID] then
        return
    end
    ---@type Zone
    local zone = AzoKiSZonesManager.list[zoneID]
    if zone:isAllowed(playerId) then
        print(AzoKi.prefix(AzoKiPrefixes.zones,("Tentative d'ajouter l'ID %s à la zone %s alors qu'il est déjà autorisé"):format(playerId,zoneID)))
        return
    end
    zone:addAllowed(playerId)
    local marker = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
    AzoKiServerUtils.toClient("newMarker", playerId, marker)
    AzoKiSZonesManager.list[zoneID] = zone
end

AzoKiSZonesManager.removeAllowed = function(zoneID, playerId)
    if not AzoKiSZonesManager.list[zoneID] then
        return
    end
    ---@type Zone
    local zone = AzoKiSZonesManager.list[zoneID]
    if not zone:isAllowed(playerId) then
        print(AzoKi.prefix(AzoKiPrefixes.zones,("Tentative de supprimer l'ID %s à la zone %s alors qu'il n'est déjà pas autorisé"):format(playerId,zoneID)))
        return
    end
    zone:removeAllowed(playerId)
    AzoKiServerUtils.toClient("delMarker", playerId, zoneID)
    AzoKiSZonesManager.list[zoneID] = zone
end

AzoKiSZonesManager.updatePrivacy = function(zoneID, newPrivacy)
    if not AzoKiSZonesManager.list[zoneID] then
        return
    end
    ---@type Zone
    local zone = AzoKiSZonesManager.list[zoneID]
    local wereAllowed = {}
    local wasRestricted = zone:isRestricted()
    if zone:isRestricted() then
        wereAllowed = zone.allowed
    end
    zone.allowed = {}
    zone:setRestriction(newPrivacy)
    if zone:isRestricted() then
        local players = ESX.GetPlayers()
        if not wasRestricted then
            for _, playerId in pairs(players) do
                local isAllowedtoSee = false
                for _, allowed in pairs(wereAllowed) do
                    if allowed == playerId then
                        isAllowedtoSee = true
                    end
                end
                if not isAllowedtoSee then
                    AzoKiServerUtils.toClient("delMarker", playerId, zone.zoneID)
                end
            end
        end
    else
        if wasRestricted then
            for _, playerId in pairs(players) do
                local isAllowedtoSee = false
                for _, allowed in pairs(wereAllowed) do
                    if allowed == playerId then
                        isAllowedtoSee = true
                    end
                end
                if isAllowedtoSee then
                    local marker = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
                    AzoKiServerUtils.toClient("newMarker", playerId, marker)
                end
            end
        end
    end
    AzoKiSZonesManager.list[zoneID] = zone
end

AzoKiSZonesManager.delete = function(zoneID)
    if not AzoKiSZonesManager.list[zoneID] then
        return
    end
    ---@type Zone
    local zone = AzoKiSZonesManager.list[zoneID]
    if zone:isRestricted() then
        local players = ESX.GetPlayers()
        for k, playerId in pairs(players) do
            if zone:isAllowed(playerId) then
                AzoKiServerUtils.toClient("delMarker", playerId, zoneID)
            end
        end
    else
        AzoKiServerUtils.toAll("delMarker", zoneID)
    end
end

AzoKiSZonesManager.updateOne = function(source)
    local markers = {}
    ---@param zone Zone
    for zoneID, zone in pairs(AzoKiSZonesManager.list) do
        if zone:isRestricted() then
            if zone:isAllowed(source) then
                markers[zoneID] = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
            end
        else
            markers[zoneID] = { id = zone.zoneID, type = zone.type, color = zone.color, help = zone.helpText, position = zone.location, distances = { zone.drawDist, zone.itrDist } }
        end
    end
    AzoKiServerUtils.toClient("cbZones", source, markers)
end

AzoKi.netRegisterAndHandle("requestPredefinedZones", function()
    local source = source
    AzoKiSZonesManager.updateOne(source)
end)

AzoKi.netRegisterAndHandle("interactWithZone", function(zoneID)
    local source = source
    if not AzoKiSZonesManager.list[zoneID] then
        DropPlayer("[AzoKi] Tentative d'intéragir avec une zone inéxistante.")
        return
    end
    ---@type Zone
    local zone = AzoKiSZonesManager.list[zoneID]
    zone:interact(source)
end)