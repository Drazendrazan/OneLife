--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---toInternal
---@public
---@return void
AzoKi.toInternal = function(eventName, ...)
    TriggerEvent("AzoKi:" .. AzoKi.hash(eventName), ...)
end

local registredEvents = {}
local function isEventRegistred(eventName)
    for k,v in pairs(registredEvents) do
        if v == eventName then return true end
    end
    return false
end
---netRegisterAndHandle
---@public
---@return void
AzoKi.netRegisterAndHandle = function(eventName, handler)
    local event = "AzoKi:" .. AzoKi.hash(eventName)
    if not isEventRegistred(event) then
        RegisterNetEvent(event)
        table.insert(registredEvents, event)
    end
    AddEventHandler(event, handler)
end

---netRegister
---@public
---@return void
AzoKi.netRegister = function(eventName)
    local event = "AzoKi:" .. AzoKi.hash(eventName)
    RegisterNetEvent(event)
end

---netHandle
---@public
---@return void
AzoKi.netHandle = function(eventName, handler)
    local event = "AzoKi:" .. AzoKi.hash(eventName)
    AddEventHandler(event, handler)
end

---netHandleBasic
---@public
---@return void
AzoKi.netHandleBasic = function(eventName, handler)
    AddEventHandler(eventName, handler)
end

---hash
---@public
---@return any
AzoKi.hash = function(notHashedModel)
    return GetHashKey(notHashedModel)
end

---second
---@public
---@return number
AzoKi.second = function(from)
    return from*1000
end