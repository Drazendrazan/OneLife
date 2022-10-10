AzoKiClientUtils = {}

AzoKiClientUtils.toServer = function(eventName, ...)
    TriggerServerEvent("AzoKi:" .. AzoKi.hash(eventName), ...)
end