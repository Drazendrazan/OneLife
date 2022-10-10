ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local isJailedG = false
local jailTimeG = 0

local courtCase = false
local muted = false
local notifyCourtHouseIn = false
local notifyCourtHouseOut = false


RegisterNetEvent("authentic:goprison")
AddEventHandler('authentic:goprison', function()
  local x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( GetPlayerFromServerId(source) ), true ) )
  local x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( GetPlayerFromServerId(targetPedId) ), true ) )
  local distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
    if tonumber(jailTime) < 0 then
      return TriggerEvent("chatMessage", "^1Temps invalide, tu dois mettre un montant supérieur à 0.")
    else
      if (distance < 10) then 
        TriggerServerEvent("authentic:goprison", targetPedId, jailTime)
      else
        TriggerEvent('chatMessage', "^1ERREUR: Le Joueur est trop loin de vous")
      end 
    end
end)

RegisterNetEvent("authentic:goprison")
AddEventHandler("authentic:goprison", function(jailArray)
  local targetPed = PlayerPedId()
  local jailTime = jailArray[1]
  RemoveAllPedWeapons(targetPed, true)
  SetEntityInvincible(GetPlayerPed(targetPed), true)
  SetEntityCoords(targetPed, JailConfig.prisonLocation.x, JailConfig.prisonLocation.y, JailConfig.prisonLocation.z, 0.0, 0.0, 0.0, false)
  isJailedG = true
  jailTimeG = jailTime
end)

RegisterNetEvent("authentic:godehors")
AddEventHandler("authentic:godehors", function()
  local targetPed = PlayerPedId()
  jailTimeG = 0
  isJailedG = false
  SetEntityInvincible(GetPlayerPed(targetPed), false)
  SetEntityCoords(targetPed, JailConfig.prisonEntraceLocation.x, JailConfig.prisonEntraceLocation.y, JailConfig.prisonEntraceLocation.z, 0.0, 0.0, 0.0, false)
  ESX.ShowNotification("On veux plus te revoir en prison, stop les conneries !")
end)

RegisterNetEvent("authentic:TpPrison")
AddEventHandler("authentic:TpPrison", function(pmuted, vector)
  local targetPed = PlayerPedId()
  RemoveAllPedWeapons(targetPed, true)
  SetEntityCoords(targetPed, vector.x, vector.y, vector.z, 0.0, 0.0, 0.0, false)
  SetEntityHeading(targetPed, vector.h)
  FreezeEntityPosition(targetPed, true)
  if pmuted then
    muted = true
  else
    muted = false
    DisableControlAction(0, 245, false)
    DisableControlAction(0, 249, false)
  end
end)

RegisterNetEvent("authentic:TpDehors")
AddEventHandler("authentic:TpDehors", function(vector)
  local targetPed = PlayerPedId()
  SetEntityCoords(targetPed, vector.x, vector.y, vector.z, 0.0, 0.0, 0.0, false)
  FreezeEntityPosition(targetPed, false)
  muted = false
  DisableControlAction(0, 245, false)
  DisableControlAction(0, 249, false)
end)

  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if muted then
        DisableControlAction(0, 245, true)
        DisableControlAction(0, 249, true)
      end
    end
  end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isJailedG then
      local playerPed = PlayerPedId()
      if GetDistanceBetweenCoords(GetEntityCoords(playerPed), JailConfig.prisonLocation.x, JailConfig.prisonLocation.y, JailConfig.prisonLocation.z) > 15 then
        SetEntityCoords(playerPed, JailConfig.prisonLocation.x, JailConfig.prisonLocation.y, JailConfig.prisonLocation.z, 0.0, 0.0, 0.0, false)
      end
      Citizen.Wait(1000)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isJailedG then
      if jailTimeG == 0 then
        isJailedG = false
        TriggerServerEvent("authentic:godehors", GetPlayerServerId(PlayerId()))
      end
      Citizen.Wait(1000 * 1)
      jailTimeG = jailTimeG - 1
      TriggerServerEvent("authentic:updateJailTime", jailTimeG)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if jailTimeG > 0 then
      SetTextFont(4)
      SetTextScale(0.45, 0.45)
      SetTextColour(255, 255, 255, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      if isJailedG then
        AddTextComponentString("il vous reste ~b~" .. tostring(jailTimeG) .. "~w~ secondes avant de sortir de prison")
      else
        AddTextComponentString("il vous reste ~b~" .. tostring(jailTimeG) .. "~w~ secondes avant de sortir de prison - pause")
      end
      DrawText(0.175, 0.955)
    end
  end
end)



AddEventHandler("playerSpawned", function(spawnInfo)
  TriggerServerEvent("authentic:RetourPrison")
end)  