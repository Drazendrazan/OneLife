---@author Pablo Z.
---@version 1.0
--[[
  This file is part of AzoKi RolePlay.
  
  File [luckywheelMenu] created at [22/04/2021 06:57]

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local cat, desc = "luckywheel", "~p~Roue - OneLife RolePlay"
local isWaitingServerResponse = false
local sub = function(str)
    return cat .. "_" .. str
end

AzoKi.netRegisterAndHandle("luckywheelCbTurn", function()
    AzoKiGameUtils.advancedNotification("~p~OneLife", "~y~Roue de la chance","Vous pouvez désormais vous rendre vers la roue et la tourner ! Bonne chance !", "CHAR_SEALIFE", 1)
    isWaitingServerResponse = false
end)

AzoKi.netRegisterAndHandle("luckywheelPaidNotCbTurn", function()
    isWaitingServerResponse = false
end)

AzoKi.netRegisterAndHandle("luckywheelPaidCbTurn", function()
    AzoKiGameUtils.advancedNotification("Roue de la fortune", "~p~OneLife", "Vous avez reçus un tour de roue payant, merci c'est lors de votre prochaine reconnexion qu'il sera présent !", "CHAR_SEALIFE", 1)
    isWaitingServerResponse = false
end)

AzoKi.netRegisterAndHandle("luckywheelOpenMenu", function(canDoFreeTurn, paidTurnsCount)
    if menuIsOpened then
        return
    end

    if currentTurn then
        ESX.ShowNotification("~b~Vous avez un tour de roue en cours")
        return
    end

    if isWaitingServerResponse then
        ESX.ShowNotification("~b~Une transaction est encore en cours avec le serveur...")
        return
    end

    FreezeEntityPosition(PlayerPedId(), true)
    menuIsOpened = true

    RMenu.Add(cat, sub("main"), RageUI.CreateMenu(nil, desc, nil, nil, "casinoui_lucky_wheel", "casinoui_lucky_wheel"))
    RMenu:Get(cat, sub("main")).Closed = function()
    end

    RageUI.Visible(RMenu:Get(cat, sub("main")), true)

    AzoKi.newThread(function()
        while menuIsOpened do
            local shouldStayOpened = false
            local function tick()
                shouldStayOpened = true
            end

            RageUI.IsVisible(RMenu:Get(cat, sub("main")), true, true, true, function()
                tick()
                RageUI.Separator("↓ ~o~Tour gratuit ~s~↓")
                if canDoFreeTurn then
                    RageUI.ButtonWithStyle("~p~Obtenir mon tour gratuit", nil, {}, true, function(_,_,s)
                        if s then
                            shouldStayOpened = false
                            isWaitingServerResponse = true
                            AzoKiClientUtils.toServer("luckywheelRequestFreeTurn")
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("~b~Revenez plus tard", nil, {}, false, function()  end)
                end
                --[[RageUI.Separator("↓ ~b~Tours payants ~s~↓")
                if paidTurnsCount <= 0 then
                    RageUI.ButtonWithStyle(("Acheter un tour payant ~s~(~p~500 AzoKiCoins~s~)"), nil, {}, true, function(_,_,s)
                        if s then
                            shouldStayOpened = false
                            isWaitingServerResponse = true
                            AzoKiClientUtils.toServer("luckywheelPaidTurn")
                        end
                    end)
                else
                    RageUI.ButtonWithStyle(("~p~Utiliser un tour payant ~s~(~p~x%s~s~)"):format(paidTurnsCount), nil, {}, true, function(_,_,s)
                        if s then
                            shouldStayOpened = false
                            isWaitingServerResponse = true
                            AzoKiClientUtils.toServer("luckywheelRequestPaidTurn")
                        end
                    end)
                end]]

            end, function()
            end)

            if not shouldStayOpened and menuIsOpened then
                menuIsOpened = false
            end
            Wait(0)
        end
        FreezeEntityPosition(PlayerPedId(), false)
        RMenu:Delete(cat, sub("main"))
    end)
end)