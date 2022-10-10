local webhookColors = {
    ["red"] = 16711680,
    ["green"] = 56108,
    ["grey"] = 8421504,
    ["orange"] = 16744192
}
local function getLicense(source)
    if (source ~= nil) then
        local identifiers = {}
        local playerIdentifiers = GetPlayerIdentifiers(source)
        for _, v in pairs(playerIdentifiers) do
            local before, after = playerIdentifiers[_]:match("([^:]+):([^:]+)")
            identifiers[before] = playerIdentifiers
        end
        return identifiers
    end
end

function sendWebhook(message,color,url)
    local DiscordWebHook = url
    local embeds = {
        {
            ["title"]=message,
            ["type"]="rich",
            ["color"] =webhookColors[color],
            ["footer"]=  {
                ["text"]= "Admin Menu for OneLife",
            },
        }
    }
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = "Admin Menu",embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscordStaff(name,message,color,url)
    local DiscordWebHook = "https://discord.com/api/webhooks/983839105072918528/oB8juvaZa8v_9mbgItq7rb02WA-DzmoTF5aobhLHuN_WgVDOMr0VSQm8t6EZF4_WseTo"
	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
			["text"]= "Admin Menu for OneLife",
			},
		}
	}
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end