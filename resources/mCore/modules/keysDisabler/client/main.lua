---@author Pablo Z.
---@version 1.0
--[[
  This file is part of AzoKi RolePlay.
  
  File [main.lua] created at [11/06/2021 13:07]

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiCKeysDisabler = {}

AzoKiCKeysDisabler.disableKey = function(key)
    AzoKiCKeysDisabler[key] = true
end

AzoKiCKeysDisabler.enableKey = function(key)
    AzoKiCKeysDisabler[key] = nil
    Wait(150)
    EnableControlAction(0, key, true)
end

AzoKi.netHandle("esxloaded", function()
    AzoKi.newThread(function()
        while true do
            for k,v in pairs(AzoKiCKeysDisabler) do
                DisableControlAction(0, k, true)
            end
            Wait(0)
        end
    end)
end)