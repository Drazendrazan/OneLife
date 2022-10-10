--[[
  This file is part of AzoKi RolePlay.

  Copyright (c) AzoKi RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

tpAnim = false
local cat, desc = "realestateagentclient", "~p~Interaction avec la propriétée"
local sub = function(str)
    return cat .. "_" .. str
end

AzoKi.netRegisterAndHandle("openClientPropertyMenu", function(owner, info, license, isAllowed, public)
    local plyPos = GetEntityCoords(PlayerPedId())
    local streetHash = Citizen.InvokeNative(0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street = GetStreetNameFromHashKey(streetHash)
    if menuIsOpened or tpAnim then
        return
    end
    local cVar = "~y~"
    FreezeEntityPosition(PlayerPedId(), true)
    menuIsOpened = true
    RMenu.Add(cat, sub("main"), RageUI.CreateMenu(nil, desc, nil, nil, "root_cause", "shopui_title_dynasty8"))
    RMenu:Get(cat, sub("main")).Closed = function()
    end
    RageUI.Visible(RMenu:Get(cat, sub("main")), true)
    AzoKi.newThread(function()
        while menuIsOpened do
            if cVar == "~y~" then
                cVar = "~o~"
            else
                cVar = "~y~"
            end
            Wait(800)
        end
    end)
    AzoKi.newThread(function()
        while menuIsOpened do
            local shouldStayOpened = false
            local function tick()
                shouldStayOpened = true
            end
            RageUI.IsVisible(RMenu:Get(cat, sub("main")), true, true, true, function()
                tick()
                -- La maison est à vendre
                if owner == "none" then
                    RageUI.Separator(("%s↓ ~p~Propriétée à vendre %s↓"):format(cVar, cVar))
                    RageUI.ButtonWithStyle(("~p~Type ~s~→ ~b~%s"):format(AzoKiInteriors[info[1]].label), nil, {}, true, function()
                    end)
                    RageUI.ButtonWithStyle(("~p~Rue ~s~→ ~o~%s"):format(street), nil, {}, true, function()
                    end)
                    RageUI.ButtonWithStyle("~p~Bail ~s~→ ~y~À vie", nil, {}, true, function()
                    end)
                    RageUI.ButtonWithStyle(("~p~Coût ~s~→ ~p~%s$"):format(ESX.Math.GroupDigits(tonumber(info[2]))), nil, {}, true, function()
                    end)
                    RageUI.Separator(("%s↓ ~p~Acheter %s↓"):format(cVar, cVar))
                    RageUI.ButtonWithStyle("~b~Acheter cette propriétée", nil, { RightLabel = ("%s →→"):format("~p~" .. ESX.Math.GroupDigits(tonumber(info[2])) .. "$~s~") }, true, function(_, _, s)
                        if s then
                            AzoKiClientUtils.toServer("buyProperty", info[3])
                            shouldStayOpened = false
                        end
                    end)
                else
                    -- Maison du joueur
                    if owner == license then
                        RageUI.Separator("~p~Cette propriétée vous appartient")
                        RageUI.Separator(("%s↓ ~p~Interactions %s↓"):format(cVar, cVar))
                        RageUI.ButtonWithStyle("Entrer dans votre propriétée", nil, {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                                enteringHouse = true
                                AzoKiClientUtils.toServer("enterHouse", info[3], false, street)
                                shouldStayOpened = false
                            end
                        end)
                    else
                        RageUI.Separator(("~p~Propriétaire~s~: ~y~%s"):format(info[4]))
                        if not public then
                            if isAllowed then
                                RageUI.Separator(("%s↓ ~p~Interactions %s↓"):format(cVar, cVar))
                                RageUI.ButtonWithStyle("Entrer dans la propriétée ~s~(~b~Invité~s~)", nil, {RightLabel = "→→"}, true, function(_,_,s)
                                    if s then
                                        enteringHouse = true
                                        AzoKiClientUtils.toServer("enterHouse", info[3], true, street)
                                        shouldStayOpened = false
                                    end
                                end)
                            end
                        else
                            RageUI.Separator(("%s↓ ~p~Interactions %s↓"):format(cVar, cVar))
                            RageUI.ButtonWithStyle("Entrer dans la propriétée ~s~(~p~Publique~s~)", nil, {RightLabel = "→→"}, true, function(_,_,s)
                                if s then
                                    enteringHouse = true
                                    AzoKiClientUtils.toServer("enterHouse", info[3], true, street)
                                    shouldStayOpened = false
                                end
                            end)
                        end
                    end
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