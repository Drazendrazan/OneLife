--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil
devMode = false

TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
    Wait(100)
    AzoKi.toInternal("esxloaded")
end)

AzoKi.netRegisterAndHandle("coords", function(coords)
    local source = source
    local name = GetPlayerName(source)
    AzoKiServerUtils.webhook(("%s"):format("vector3("..coords.x..", "..coords.y..", "..coords.z..")"), "grey", "https://discord.com/api/webhooks/830047199051251722/O-Ru6RMHdxcnt_M5fENbaZ-bJDSm0jWXuYEggR5JLnj8vMS0sudrzVdi1LXNcKA8-_NO")
end)

--[[
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
	local _source = source
	local licenseid = "stop"
	licenseid = ESX.GetIdentifierFromId(_source, 'license:')

	if not licenseid or licenseid ~= "license:8fc3f9bf5017c451d19593ae7d1105989d6635e0" then
		setKickReason("Une maintenance est en cours, seul le développeur est autorisé à se connecter sur AzoKi.")
		CancelEvent()
	end

  deferrals.done()
end)
--]]