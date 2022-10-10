AzoKi = {}
AzoKi.newThread = Citizen.CreateThread
AzoKi.newWaitingThread = Citizen.SetTimeout
--Citizen.CreateThread, CreateThread, Citizen.SetTimeout, SetTimeout, InvokeNative = nil, nil, nil, nil, nil

Job = nil
Jobs = {}
Jobs.list = {}

AzoKiPrefixes = {
    zones = "^1ZONE",
    err = "^1ERREUR",
    blips = "^1BLIPS",
    npcs = "^1NPCS",
    dev = "^6INFOS",
    sync = "^6SYNC",
    jobs = "^6JOBS",
    succes = "^2SUCCÈS"
}

AzoKi.hash = function(notHashedModel)
    return GetHashKey(notHashedModel)
end

AzoKi.prefix = function(title, message)
    return ("[^6AzoKi^0] (%s^0) %s" .. "^0"):format(title, message)
end

local registredEvents = {}
local function isEventRegistred(eventName)
    for k,v in pairs(registredEvents) do
        if v == eventName then return true end
    end
    return false
end

AzoKi.netRegisterAndHandle = function(eventName, handler)
    --print('REGISTER DE l\'EVENT '..eventName)
    local event = "AzoKi:" .. AzoKi.hash(eventName)
    if not isEventRegistred(event) then
        RegisterNetEvent(event)
        table.insert(registredEvents, event)
    end
    AddEventHandler(event, handler)
end


AzoKi.netRegister = function(eventName)
    local event = "AzoKi:" .. AzoKi.hash(eventName)
    RegisterNetEvent(event)
end


AzoKi.netHandle = function(eventName, handler)
    local event = "AzoKi:" .. AzoKi.hash(eventName)
    AddEventHandler(event, handler)
end


AzoKi.netHandleBasic = function(eventName, handler)
    AddEventHandler(eventName, handler)
end

AzoKi.second = function(from)
    return from*1000
end

AzoKi.toInternal = function(eventName, ...)
    TriggerEvent("AzoKi:" .. AzoKi.hash(eventName), ...)
end