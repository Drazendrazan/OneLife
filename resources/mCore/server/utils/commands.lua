---@author Pablo Z.
---@version 1.0
--[[
  This file is part of AzoKi RolePlay.
  
  File [commands] created at [12/05/2021 00:28]

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

RegisterCommand("dev", function(source)
    if source ~= 0 then
        return
    end
    devMode = not devMode
    local byState = { [true] = "Mode développement activé", [false] = "Mode développement désactivé" }
    AzoKiServerUtils.trace(byState[devMode], AzoKiPrefixes.dev)
end)

RegisterCommand("dev_tpCo", function(source, args)
    if source == 0 or not devMode then
        return
    end
    local x,y,z = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
    AzoKiServerUtils.toClient("teleport", source, x,y,z)
end)
