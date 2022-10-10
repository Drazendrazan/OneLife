--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

tpAnim = false
local cat, desc = "realestateagentlaundry", "~p~Interaction avec le dressing"
local sub = function(str)
    return cat .. "_" .. str
end

AzoKi.netRegisterAndHandle("openLaundryPropertyMenu", function(dress)
    if menuIsOpened or tpAnim then
        return
    end
    if not dress or dress == {} then
        ESX.ShowNotification("~b~Vous n'avez aucune tenue")
        return
    end
    FreezeEntityPosition(PlayerPedId(), true)
    menuIsOpened = true
    RMenu.Add(cat, sub("main"), RageUI.CreateMenu(nil, desc, nil, nil, "root_cause", "shopui_title_dynasty8"))
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
                RageUI.Separator("↓ ~p~Tenues disponibles ~s~↓")
                for _,value in pairs(dress) do
                    RageUI.ButtonWithStyle(("~y~→ ~s~Tenue \"~y~%s~s~\""):format(value.label), nil, {RightLabel = "~p~Changer ~s~→→"}, true, function(_,_,s)
                        if s then
                            TriggerEvent('skinchanger:loadSkin', value.skin)
                        end
                    end)
                end
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