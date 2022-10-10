--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiServerUtils = {}

AzoKiServerUtils.toClient = function(eventName, targetId, ...)
    TriggerClientEvent("AzoKi:" .. AzoKi.hash(eventName), targetId, ...)
end

AzoKiServerUtils.toAll = function(eventName, ...)
    TriggerClientEvent("AzoKi:" .. AzoKi.hash(eventName), -1, ...)
end

AzoKiServerUtils.registerConsoleCommand = function(command, func)
    RegisterCommand(command, function(source,args)
        if source ~= 0 then return end
        func(source, args)
    end, false)
end

AzoKiServerUtils.getLicense = function(source)
    for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return v
        end
    end
    return ""
end

AzoKiServerUtils.trace = function(message, prefix)
    print("[^4AzoKi^7] (" .. prefix .. "^7) " .. message .. "^7")
end

local webhookColors = {
    ["red"] = 16711680,
    ["green"] = 56108,
    ["grey"] = 8421504,
    ["orange"] = 16744192
}

AzoKiServerUtils.getIdentifiers = function(source)
    if (source ~= nil) then
        local identifiers = {}
        local playerIdentifiers = GetPlayerIdentifiers(source)
        for _, v in pairs(playerIdentifiers) do
            local before, after = playerIdentifiers[_]:match("([^:]+):([^:]+)")
            identifiers[before] = playerIdentifiers[_]
        end
        return identifiers
    end
end

AzoKiServerUtils.webhook = function(message, color, url)
    local DiscordWebHook = url
    local embeds = {
        {
            ["title"] = message,
            ["type"] = "rich",
            ["color"] = webhookColors[color],
            ["footer"] = {
                ["text"] = "AzoKi Logs",
            },
        }
    }
    PerformHttpRequest(DiscordWebHook, function(err, text, headers)
    end, 'POST', json.encode({ username = "OneLife Logs", embeds = embeds }), { ['Content-Type'] = 'application/json' })
end

AzoKi.newRepeatingTask(function()
    local restrictedZones, publicZones = 0, 0
    local restrictedBlips, publicBlips = 0, 0
    local restrictedNpcs, publicNpcs = 0, 0
    ---@param zone Zone
    for _, zone in pairs(AzoKiSZonesManager.list) do
        if zone:isRestricted() then
            restrictedZones = restrictedZones + 1
        else
            publicZones = publicZones + 1
        end
    end
    ---@param blip Blip
    for _, blip in pairs(AzoKiSBlipsManager.list) do
        if blip:isRestricted() then
            restrictedBlips = restrictedBlips + 1
        else
            publicBlips = publicBlips + 1
        end
    end
    ---@param npc Npc
    for _, npc in pairs(AzoKiSNpcsManager.list) do
        if npc:isRestricted() then
            restrictedNpcs = restrictedNpcs + 1
        else
            publicNpcs = publicNpcs + 1
        end
    end
    AzoKiServerUtils.trace(("Zones: %s%i%s (+%s%i%s) | Blips: %s%i%s (+%s%i%s) | Npcs: %s%i%s (+%s%i%s)"):format(
            "^2",
            publicZones,
            "^7",
            "^3",
            restrictedZones,
            "^7",
            "^2",
            publicBlips,
            "^7",
            "^3",
            restrictedBlips,
            "^7",
            "^2",
            publicNpcs,
            "^7",
            "^3",
            restrictedNpcs,
            "^7"
    ), AzoKiPrefixes.dev)
end, nil, 0, AzoKi.second(30))