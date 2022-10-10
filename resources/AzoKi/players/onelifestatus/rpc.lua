--[[
Citizen.CreateThread(function()
    while true do
        -- Replace the functions below with your own ID and asset-names
        -- This is the Application ID (Replace this with you own)
		-- Get from here https://discord.com/developers/applications
		SetDiscordAppId(919861434580619305)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('512x512')

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Oneline')
       
        -- Here you will have to put the image name for the "small" icon.
        --SetDiscordRichPresenceAssetSmall('512x512')

        -- Here you can add hover text for the "small" icon.
        --SetDiscordRichPresenceAssetSmallText('This is a lsmall icon with text')
        
        
        -- Amount of online players (Don't touch)
        local playerCount = #GetActivePlayers()

        -- Check for player or players
        if playerCount == 1 then
            player = "Joueur"
        else
            player = "Joueurs"
        end
        
        -- Your own playername (Don't touch)
        local playerName = GetPlayerName(PlayerId())

        -- Set here the amount of slots you have (Edit if needed)
        local maxPlayerSlots = GetConvarInt('sv_maxclients', 1024)

        -- Sets the string with variables as RichPresence (Don't touch)
        SetRichPresence(string.format("%s - %s %s", playerName, playerCount, player))
        
        -- It updates every 30 seconds.
		Citizen.Wait(30000)
	end
end)
]]