--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKi = {}
AzoKi.newThread = Citizen.CreateThread
AzoKi.newWaitingThread = Citizen.SetTimeout
Citizen.CreateThread, CreateThread, Citizen.SetTimeout, SetTimeout, InvokeNative = nil, nil, nil, nil, nil

Job = nil
Jobs = {}
Jobs.list = {}

AzoKiPrefixes = {
    zones = "^4ZONE",
    err = "^4ERREUR",
    blips = "^4BLIPS",
    npcs = "^4NPCS",
    dev = "^4INFOS",
    sync = "^6SYNC",
    jobs = "^6JOBS",
    succes = "^2SUCCÈS"
}

AzoKi.prefix = function(title, message)
    return ("[^6AzoKi^6] (%s^6) %s" .. "^6"):format(title, message)
end