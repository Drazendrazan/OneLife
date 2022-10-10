--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AzoKiClientUtils = {}

AzoKiClientUtils.toServer = function(eventName, ...)
    TriggerServerEvent("AzoKi:" .. AzoKi.hash(eventName), ...)
end