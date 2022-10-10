--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

Jobs.list["realestateagent"].onChange = function()
end

AzoKi.netRegisterAndHandle("enterHouse", function(coords)
    SetEntityInvincible(PlayerPedId(), true)
    FreezeEntityPosition(PlayerPedId(), true)
    SetCanAttackFriendly(PlayerPedId(), false, false)
    DoScreenFadeOut(750)
    AzoKiClientSoundsManager.playSound("AzoKi_door_enter", 0.9)
    Wait(1500)
    SetEntityCoords(PlayerPedId(), coords.position, false, false, false, false)
    SetEntityHeading(PlayerPedId(), coords.heading)
    DoScreenFadeIn(750)
    FreezeEntityPosition(PlayerPedId(), false)
    tpAnim = false
end)

AzoKi.netRegisterAndHandle("exitHouse", function(coords)
    tpAnim = true
    FreezeEntityPosition(PlayerPedId(), true)
    DoScreenFadeOut(750)
    Wait(750)
    AzoKiClientSoundsManager.playSound("AzoKi_door_shut", 0.75)
    Wait(750)
    SetCanAttackFriendly(PlayerPedId(), true, false)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, false)
    SetEntityInvincible(PlayerPedId(), false)
    DoScreenFadeIn(750)
    FreezeEntityPosition(PlayerPedId(), false)
    tpAnim = false
end)