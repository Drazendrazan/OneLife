---@class Client
local Client = {} or {};

---@type table Content category menu
local category = {} or {};

---@type table All items
local items = {} or {};

---@type table History activity
local history = {} or {};

---@type table Selected items

---@type number Current players points
local points = 0;
local id = 0;

local label = 0;

---@type table Shared object
ESX = {};

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(10)
    end
end)

local sBoutique = {}

function Client:onRetrieveItem(categoryId)
    ESX.TriggerServerCallback('tebex:retrieve-items', function(result)
        items = result;
    end, categoryId)
end

function Client:onRetrieveCategory()
    ESX.TriggerServerCallback('tebex:retrieve-category', function(result)
        category = result;
    end)
end

function Client:onRetrievePoints()
    ESX.TriggerServerCallback('tebex:retrieve-points', function(result)
        points = result
    end)
end

function Client:onRetrieveId()
    ESX.TriggerServerCallback('tebex:retrieve-id', function(result)
        id = result
    end)
end

function Client:onRetrieveHistory()
    ESX.TriggerServerCallback('tebex:retrieve-history', function(result)
        history = result;
    end)
end

function Client:RequestPtfx(assetName)
    RequestNamedPtfxAsset(assetName)
    if not (HasNamedPtfxAssetLoaded(assetName)) then
        while not HasNamedPtfxAssetLoaded(assetName) do
            Citizen.Wait(1.0)
        end
        return assetName;
    else
        return assetName;
    end
end

function OpenBoutiqueMenuAzoKiUIMenu()

    if sBoutique.Menu then 
        sBoutique.Menu = false 
        AzoKiUI.Visible(RMenu:Get('boutique', 'main'), false)
        return
    else
        RMenu.Add('boutique', 'main', AzoKiUI.CreateMenu("", ""))
        RMenu.Add('boutique', 'history', AzoKiUI.CreateSubMenu(RMenu:Get("boutique", "main"),"", "Boutique de ~p~OneLife"))
        RMenu.Add('boutique', 'itemmenu', AzoKiUI.CreateSubMenu(RMenu:Get("boutique", "main"),"", "Boutique de ~p~OneLife"))
        --RMenu.Add('boutique', 'custom', AzoKiUI.CreateSubMenu(RMenu:Get("boutique", "main"),"", "Boutique de ~p~OneLife"))
        RMenu:Get('boutique', 'main'):SetSubtitle("Boutique de ~p~OneLife")
        RMenu:Get('boutique', 'main').EnableMouse = false
        RMenu:Get('boutique', 'main').Closed = function()
            sBoutique.Menu = false
        end
        sBoutique.Menu = true 
        AzoKiUI.Visible(RMenu:Get('boutique', 'main'), true)
        Citizen.CreateThread(function()
			while sBoutique.Menu do
                AzoKiUI.IsVisible(RMenu:Get('boutique', 'main'), true, true, true, function()

                    AzoKiUI.Separator('~p~↓ Vos Informations ↓')

                    if id == 0 then
                        AzoKiUI.Separator("Votre ~p~ID Boutique~s~ : ~p~Compte FiveM non lié")
                    else
                        AzoKiUI.Separator("Votre ~p~ID Boutique~s~ : "..id)
                    end

                    AzoKiUI.Separator("Vos ~p~OneLife~w~Coins~s~ : "..points)

                    local viptext = GetVIP() == 1 or GetVIP() == true and '~o~Premium' or 'Aucun'
                    AzoKiUI.Separator('VIP : '..viptext)

                    AzoKiUI.Separator('~p~↓ Nos catégories ↓')
                    
                    AzoKiUI.ButtonWithStyle("Transactions", "Historique de vos achats sur la boutique en jeux", {RightLabel = "→ ~p~Regarder "}, true, function(h,a,s)
                        if s then
                            Client:onRetrieveHistory()
                        end
                    end,RMenu:Get("boutique","history"))

                    if (#category > 0) then
                        for i, v in pairs(category) do
                            AzoKiUI.ButtonWithStyle(v.name, v.descriptions, {RightLabel = "→ ~p~Acheter "}, true, function(h,a,s)
                                if s then
                                    Client:onRetrieveItem(v.id)
                                end
                            end,RMenu:Get("boutique","itemmenu"))
                        end
                    else
                        AzoKiUI.Separator("Aucune package disponible.")
                    end

                    --AzoKiUI.ButtonWithStyle("Custom", "Pour customisé tous se que tu veux BG", {RightLabel = "→ ~p~Regarder "}, true, function()
                    --end,RMenu:Get("boutique","custom"))

                end)

                AzoKiUI.IsVisible(RMenu:Get('boutique', 'itemmenu'), true, true, true, function()
                    if (#items > 0) then
                        for i, v in pairs(items) do
                            if v.category == 1 then
                                AzoKiUI.ButtonWithStyle(v.name, 'Ce n\'est pas des armes PERM', { RightLabel = string.format("~p~%s", v.price)}, true, function(h,a,s)
                                    if s then
                                        if not (points >= v.price) then
                                            Subtitle("~p~Vous ne posséder pas les points nécessaire", 5000)
                                        end
                                        if (points >= v.price) then
                                            AzoKiUI.GoBack()
                                            TriggerServerEvent("boutique:buyWeapon", v.action, v.price, v.name)
                                            Wait(150)
                                            Client:onRetrievePoints();
                                            --TriggerServerEvent("roue:buyTicket", "type_money_irl", action.roue[1].name)
                                            ESX.ShowNotification(string.format("~p~Félicitation vous avez acheté %s", v.name))
                                        end
                                    end
                                    --if a then
                                        --AzoKiUI.RenderWeapon("global", v.name)
                                    --end
                                end)
                            elseif v.category == 2 then
                                AzoKiUI.ButtonWithStyle(v.name, nil, { RightLabel = string.format("~p~%s", v.price) }, true, function(h,a,s)
                                    if s then
                                        if not (points >= v.price) then
                                            Subtitle("~p~Vous ne posséder pas les points nécessaire", 5000)
                                        end
                                        if (points >= v.price) then
                                            AzoKiUI.GoBack()
                                            TriggerServerEvent('kalyps:ONAJOUTELENOUVEAU', v.descriptions, v.price, v.model)
                                            print('Boutique', v.descriptions, v.price, v.name)
                                            Wait(150)
                                            Client:onRetrievePoints();
                                            ESX.ShowNotification(string.format("~p~Félicitation vous avez acheté une %s", v.name))
                                        end
                                    end
                                    if a then
                                        local action = json.decode(v.action)
                                        if (action.vehicles ~= nil) then
                                            for i, v in pairs(action.vehicles) do
                                                AzoKiUI.RenderVehicle("global", v.name)
                                            end  
                                        end
                                    end
                                end)
                            elseif v.category == 3 then
                                AzoKiUI.ButtonWithStyle(v.name, nil, { RightLabel = string.format("~p~%s", v.price)}, true, function(h,a,s)
                                    if s then
                                       if not (points >= v.price) then
                                           Subtitle("~p~Vous ne posséder pas les points nécessaire", 5000)
                                       end
                                       if (points >= v.price) then
                                           AzoKiUI.CloseAll()
                                           sBoutique.Menu = false
                                           if not HasStreamedTextureDictLoaded("case") then
                                               RequestStreamedTextureDict("case", true)
                                           end
                                           local action = json.decode(v.action)
                                           TriggerServerEvent('SunRise:process_checkout_case',action.case[1].type)
                                           Wait(150)
                                           Client:onRetrievePoints();
                                           ESX.ShowNotification(string.format("~p~Félicitation vous avez acheté une %s", v.name))
                                       end
                                    end
                                    if a then
                                        local action = json.decode(v.action)
                                        if (action.case ~= nil) then
                                            for i, v in pairs(action.case) do
                                                AzoKiUI.RenderCaisse("case", v.name)
                                            end  
                                        end
                                    end
                                end)
                            elseif v.category == 4 then
                                AzoKiUI.ButtonWithStyle("Pack Entreprise ( Farm )", "En achetant ce pack vous bénéficiez de  :                      - 1 Entreprise affiché sur la map                                    - 1 Gestion d'entreprise                                                                         - 1 run entier ( Récolte, Traitement, Vente)", { RightLabel = string.format("~p~%s", 3500)}, true, function(h,a,s)
                                    if s then
                                        if not (points >= 3500) then
                                            Subtitle("~p~Vous ne posséder pas les points nécessaire", 3500)
                                        end
                                        if (points >= 3500) then
                                            TriggerServerEvent('sunrise:buyentreprise')
                                            Wait(150)
                                            Client:onRetrievePoints();
                                            AzoKiUI.GoBack()
                                            ESX.ShowNotification('~p~OneLife~s~Félicitation vous avez achetez le pack Entreprise de Farm, Faites un ticket sur discord')
                                        end
                                    end
                                    if a then
                                        AzoKiUI.RenderPackEntreprise("global", "entreprise")
                                    end
                                end)

                                AzoKiUI.ButtonWithStyle("Pack Groupe Illégal", "En achetant ce pack vous bénéficiez d'un groupe Illégal, ( Coffre de stockage d'objet, argents, garage )", { RightLabel = string.format("~p~%s", 3500)}, true, function(h,a,s)
                                    if s then
                                        if not (points >= 3500) then
                                            Subtitle("~p~Vous ne posséder pas les points nécessaire", 3500)
                                        end
                                        if (points >= 3500) then
                                            TriggerServerEvent('sunrise:buygang')
                                            Wait(150)
                                            Client:onRetrievePoints();
                                            AzoKiUI.GoBack()
                                            ESX.ShowNotification('~p~OneLife~s~Félicitation vous avez achetez le pack Groupe Illégal, Faites un ticket sur discord')
                                        end
                                    end
                                    if a then
                                        AzoKiUI.RenderPackIllegal("global", "gang")
                                    end
                                end)
                            elseif v.category == 5 then
                                AzoKiUI.ButtonWithStyle(v.name, nil, { RightLabel = string.format("~p~%s", v.price) }, true, function(h,a,s)
                                    if s then
                                        if not (points >= v.price) then
                                            Subtitle("~p~Vous ne posséder pas les points nécessaire", 5000)
                                        end
                                        if (points >= v.price) then
                                            AzoKiUI.GoBack()
                                            TriggerServerEvent('kalyps:ONAJOUTELENOUVEAU', v.descriptions, v.price, v.model)
                                            print('Boutique', v.descriptions, v.price, v.name)
                                            Wait(150)
                                            Client:onRetrievePoints();
                                            ESX.ShowNotification(string.format("~p~Félicitation vous avez acheté une %s", v.name))
                                        end
                                    end
                                    if a then
                                        local action = json.decode(v.action)
                                        if (action.vehicles ~= nil) then
                                            for i, v in pairs(action.vehicles) do
                                                AzoKiUI.RenderVehicle("global", v.name)
                                            end  
                                        end
                                    end
                                end)
                            end
                        end
                    else
                        AzoKiUI.Separator("Aucun package disponible.")
                    end
                end)

                --[[AzoKiUI.IsVisible(RMenu:Get('boutique', 'custom'), true, true, true, function()
                    AzoKiUI.ButtonWithStyle("Full custom vehicule", "Cette option customise à 100% les performances de votre vehicule, attention, celui-ci s'applique dans le véhicule dans le quelle vous vous trouvez", { RightLabel = "~p~500" }, IsPedSittingInAnyVehicle(PlayerPedId()), function(h,a,s)
                        if s then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false);
                            if (points >= 500) then
                                TriggerServerEvent('tebex:on-process-checkout-fullcustom')
                                Client:VehicleCustom(NetworkGetNetworkIdFromEntity(vehicle))
                            end
                            if not (points >= 500) then
                                ESX.ShowNotification('~p~Vous ne procédé pas les points nécessaire.')
                            end
                        end
                    end)
                end)]]



                AzoKiUI.IsVisible(RMenu:Get('boutique', 'history'), true, false, true, function()
                    if (#history > 0) then
                        AzoKiUI.Separator("↓ ~p~Votre historique~s~ ↓")
                        for i, v in pairs(history) do
                            local label;
                            if (tonumber(v.price) == 0) then
                                label = string.format("%s ", v.points)
                            else
                                label = string.format("%s (%s%s) ", v.points, v.price, v.currency);
                            end
                            AzoKiUI.ButtonWithStyle(v.transaction, nil, {RightLabel = label}, true, function()
                            end)
        
                        end
                    else
                        AzoKiUI.Separator("")
                        AzoKiUI.Separator("~c~Aucune transactions effectues.")
                        AzoKiUI.Separator("")
                    end
                end)
				Wait(0)
			end
		end)
	end
end

function Subtitle(text, time)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(time and math.ceil(time) or 0, true)
end

Keys.Register('F2','F2', 'Boutique ~p~OneLife', function()
    if sBoutique.Menu then 
        return 
    end
    if not toucheBloqueKadir then
        Client:onRetrieveCategory();
        Client:onRetrievePoints();
        Client:onRetrieveId();
        OpenBoutiqueMenuAzoKiUIMenu()
    end
end)

--[[function Client:VehicleCustom(vehNetId)
    local vehicle = NetworkGetEntityFromNetworkId(vehNetId)
    if GetVehicleModKit(vehicle) ~= 0 then
        SetVehicleModKit(vehicle, 0)
    end
    SetVehicleNumberPlateTextIndex(vehicle, 1)
    SetVehicleWindowTint(vehicle, 1)
    ToggleVehicleMod(vehicle, 18, true)
    ToggleVehicleMod(vehicle, 20, true)
    ToggleVehicleMod(vehicle, 22, true)
    local max11 = GetNumVehicleMods(vehicle, 11)
    SetVehicleMod(vehicle, 11, (max11 > 0 and max11 - 1 or 0), false)
    local max12 = GetNumVehicleMods(vehicle, 12)
    SetVehicleMod(vehicle, 12, (max12 > 0 and max12 - 1 or 0), false)
    local max13 = GetNumVehicleMods(vehicle, 13)
    SetVehicleMod(vehicle, 13, (max13 > 0 and max13 - 1 or 0), false)
    local max15 = GetNumVehicleMods(vehicle, 15)
    SetVehicleMod(vehicle, 15, (max15 > 0 and max15 - 1 or 0), false)
    local max16 = GetNumVehicleMods(vehicle, 16)
    SetVehicleMod(vehicle, 16, (max16 > 0 and max16 - 1 or 0), false)
    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
    TriggerServerEvent('esx_lscustom:refreshOwnedVehicle', vehicleProps)
    ESX.ShowNotification("~p~Nous avons appliqué une personnalisation complète des performances de votre véhicule.")
end]]