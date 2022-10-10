
nbPlayerTotal = 0
RegisterNetEvent('xr_core:updatePlayerCount')
AddEventHandler('xr_core:updatePlayerCount', function(nbPlayer)
    nbPlayerTotal = nbPlayer
end)

-- Rich presence ↓
Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(928419689745510401)
		SetDiscordRichPresenceAsset('onelife')
		SetRichPresence(GetPlayerName(PlayerId()) .." ["..GetPlayerServerId(PlayerId()).."] "  .. nbPlayerTotal .. "/300")

		SetDiscordRichPresenceAction(0, "Rejoindre le Discord !", "https://discord.gg/onelife")
        SetDiscordRichPresenceAction(1, "Rejoins le serveur !", "https://cfx.re/join/2b88dl")
		Citizen.Wait(5000)
	end
end)

-- Pause menu ↓
Citizen.CreateThread(function()
    while true do
        AddTextEntry('PM_SCR_MAP', '~p~Carte de Los Santos')
        AddTextEntry('PM_SCR_GAM', '~p~Prendre l\'avion')
        AddTextEntry('PM_SCR_INF', '~p~Logs')
        AddTextEntry('PM_SCR_SET', '~p~Configuration')
        AddTextEntry('PM_SCR_STA', '~p~Statistiques')
        AddTextEntry('PM_SCR_GAL', '~p~Galerie')
        AddTextEntry('PM_SCR_RPL', '~p~Éditeur ∑')
        AddTextEntry('PM_PANE_CFX', '~p~OneLife')
        AddTextEntry('FE_THDR_GTAO', "~p~OneLife~w~ | ~p~discord.gg/onelife~w~ | ~p~ID : ~w~".. GetPlayerServerId(PlayerId()) .." | ~p~".. nbPlayerTotal .. "~w~/~p~300 ~w~joueurs ~p~en ligne")
        AddTextEntry('PM_PANE_LEAVE', '~p~Se déconnecter de OneLife')
        AddTextEntry('PM_PANE_QUIT', '~p~Quitter FiveM')
        Citizen.Wait(5000)
    end
end)