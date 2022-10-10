ESX = nil

--[[Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)]]

local PlayerMoney = 0

RegisterNetEvent("solde:argent")
AddEventHandler("solde:argent", function(money, cash)
    PlayerMoney = tonumber(money)
end)

--- Blips Banque


Citizen.CreateThread(function()
    for i=1, #rBank.position, 1 do
       local blip = AddBlipForCoord(rBank.position[i].x, rBank.position[i].y, rBank.position[i].z)
       SetBlipSprite(blip, 207)
       SetBlipColour(blip, 69)
       SetBlipAsShortRange(blip, true)
       SetBlipScale(blip, 0.65)

       BeginTextCommandSetBlipName('STRING')
       AddTextComponentString("Banque")
       EndTextCommandSetBlipName(blip)
   end
end)

--- Blips ATM 

Citizen.CreateThread(function()
    if rBank.jeveuxblipsatm then
    for i=1, #rBank.posatm, 1 do
       local blip = AddBlipForCoord(rBank.posatm[i].x, rBank.posatm[i].y, rBank.posatm[i].z)
       SetBlipSprite(blip, 500)
       SetBlipColour(blip, 69)
       SetBlipAsShortRange(blip, true)
       SetBlipScale(blip, 0.40)

       BeginTextCommandSetBlipName('STRING')
       AddTextComponentString("ATM")
       EndTextCommandSetBlipName(blip)
   end
end
end)

---Menu Banque

function MenuBanque()
	local Mbank = AzoKiUI.CreateMenu("Banque", "Interagir avec votre banque")
    local MbankDepo = AzoKiUI.CreateSubMenu(Mbank, "Banque", "Déposer de l'argent")
    local MbankReti = AzoKiUI.CreateSubMenu(Mbank, "Banque", "Retirer de l'argent")
    FreezeEntityPosition(PlayerPedId(), true)
    Mbank:SetRectangleBanner(0, 0, 0, 0)
    MbankDepo:SetRectangleBanner(0, 255, 0, 255)
    MbankReti:SetRectangleBanner(255, 0, 0, 255)
        AzoKiUI.Visible(Mbank, not AzoKiUI.Visible(Mbank))
            while Mbank do
            Citizen.Wait(0)
            AzoKiUI.IsVisible(Mbank, true, true, true, function()
                AzoKiUI.Separator('~b~Bienvenue '..GetPlayerName(PlayerId()))
                AzoKiUI.ButtonWithStyle("Déposer de l'argent", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MbankDepo)
                AzoKiUI.ButtonWithStyle("Retirer de l'argent", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MbankReti)

                AzoKiUI.Separator("~r~↓ Virement bancaire ↓")

                AzoKiUI.ButtonWithStyle("Faire un virement", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local to = KeyboardInput("Quelle est l'ID de la personne", "", 5)
                        local amountt = KeyboardInput("Combien d'argent vous voulez lui donner", "", 30)
                        TriggerServerEvent('gBank:transfer', to, amountt)
                        rBank.GetPlayerMoney()
                    end
                end)
                AzoKiUI.Separator("~g~↓ Informations du Compte ↓")
                AzoKiUI.ButtonWithStyle("Propriétaire du Compte : ", nil, {RightLabel = GetPlayerName(PlayerId())},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                    end
                    end)
                AzoKiUI.ButtonWithStyle("Solde du compte : ", nil, {RightLabel = PlayerMoney.." $"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                    end)
                    
            end, function()
            end)
                AzoKiUI.IsVisible(MbankDepo, true, true, true, function()
                    AzoKiUI.ButtonWithStyle("Montant Personnalisé", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            saisiedepot()
                            rBank.GetPlayerMoney()
                        end
                        end)

                    AzoKiUI.Separator("↓ ~b~Montant Proposé ~w~↓")


                    AzoKiUI.ButtonWithStyle("Déposer - 100", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 100)
                            rBank.GetPlayerMoney()
                        end
                    end)

                    AzoKiUI.ButtonWithStyle("Déposer - 200", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 200)
                            rBank.GetPlayerMoney()
                        end
                    end)

                    AzoKiUI.ButtonWithStyle("Déposer - 500", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 500)
                            rBank.GetPlayerMoney()
                        end
                        end)

                    end, function()
                 end)

                 AzoKiUI.IsVisible(MbankReti, true, true, true, function()
                    AzoKiUI.ButtonWithStyle("Montant Personnalisé", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            saisieretrait()
                            rBank.GetPlayerMoney()
                        end
                        end)

                    AzoKiUI.Separator("↓ ~b~Montant Proposé ~w~↓")


                    AzoKiUI.ButtonWithStyle("Retirer - 100", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 100)
                            rBank.GetPlayerMoney()
                        end
                    end)

                    AzoKiUI.ButtonWithStyle("Retirer - 200", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 200)
                            rBank.GetPlayerMoney()
                        end
                    end)

                    AzoKiUI.ButtonWithStyle("Retirer - 500", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 500)
                            rBank.GetPlayerMoney()
                        end
                        end)

                end, function()
                end)
            if not AzoKiUI.Visible(Mbank) and not AzoKiUI.Visible(MbankDepo) and not AzoKiUI.Visible(MbankReti) then
            FreezeEntityPosition(PlayerPedId(), false)
            Mbank = RMenu:DeleteType("Banque", true)
        end
    end
end


---Menu ATM


function MenuATM()
	local Mbank = AzoKiUI.CreateMenu("Banque", "Interagir avec votre banque")
    local MbankDepo = AzoKiUI.CreateSubMenu(Mbank, "Banque", "Déposer de l'argent")
    local MbankReti = AzoKiUI.CreateSubMenu(Mbank, "Banque", "Retirer de l'argent")
    FreezeEntityPosition(PlayerPedId(), true)
    Mbank:SetRectangleBanner(0, 0, 0, 0)
    MbankDepo:SetRectangleBanner(0, 0, 0, 0)
    MbankReti:SetRectangleBanner(0, 0, 0, 0)
        AzoKiUI.Visible(Mbank, not AzoKiUI.Visible(Mbank))
            while Mbank do
            Citizen.Wait(0)
            AzoKiUI.IsVisible(Mbank, true, true, true, function()
                AzoKiUI.Separator('~b~Bienvenue '..GetPlayerName(PlayerId()))
                AzoKiUI.ButtonWithStyle("Déposer de l'argent", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MbankDepo)
                AzoKiUI.ButtonWithStyle("Retirer de l'argent", nil,  {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                end, MbankReti)

                AzoKiUI.Separator("~r~↓ Virement bancaire ↓")

                AzoKiUI.ButtonWithStyle("Faire un virement", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local to = KeyboardInput("Quelle est l'ID de la personne", "", 5)
                        local amountt = KeyboardInput("Combien d'argent vous voulez lui donner", "", 30)
                        TriggerServerEvent('gBank:transfer', to, amountt)
                        rBank.GetPlayerMoney()
                    end
                end)
                AzoKiUI.Separator("~g~↓ Informations du Compte ↓")
                AzoKiUI.ButtonWithStyle("Propriétaire du Compte : ", nil, {RightLabel = GetPlayerName(PlayerId())},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                    end
                    end)
                AzoKiUI.ButtonWithStyle("Solde du compte : ", nil, {RightLabel = PlayerMoney.." $"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                    end
                    end)
            end, function()
            end)
                AzoKiUI.IsVisible(MbankDepo, true, true, true, function()
                    AzoKiUI.ButtonWithStyle("Montant Personnalisé", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            saisiedepot()
                            rBank.GetPlayerMoney()
                        end
                        end)

                    AzoKiUI.Separator("↓ ~b~Montant Proposé ~w~↓")


                    AzoKiUI.ButtonWithStyle("Déposer - 100", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 100)
                            rBank.GetPlayerMoney()
                        end
                    end)

                    AzoKiUI.ButtonWithStyle("Déposer - 200", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 200)
                            rBank.GetPlayerMoney()
                        end
                    end)

                    AzoKiUI.ButtonWithStyle("Déposer - 500", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:deposer', 500)
                            rBank.GetPlayerMoney()
                        end
                        end)

                    end, function()
                 end)

                 AzoKiUI.IsVisible(MbankReti, true, true, true, function()
                    AzoKiUI.ButtonWithStyle("Montant Personnalisé", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            saisieretrait()
                            rBank.GetPlayerMoney()
                        end
                        end)

                    AzoKiUI.Separator("↓ ~b~Montant Proposé ~w~↓")


                    AzoKiUI.ButtonWithStyle("Retirer - 100", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 100)
                            rBank.GetPlayerMoney()
                        end
                    end)

                    AzoKiUI.ButtonWithStyle("Retirer - 200", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 200)
                            rBank.GetPlayerMoney()
                        end
                    end)

                    AzoKiUI.ButtonWithStyle("Retirer - 500", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('gBank:retirer', 500)
                            rBank.GetPlayerMoney()
                        end
                        end)

                end, function()
                end)
            if not AzoKiUI.Visible(Mbank) and not AzoKiUI.Visible(MbankDepo) and not AzoKiUI.Visible(MbankReti) then
            FreezeEntityPosition(PlayerPedId(), false)
            Mbank = RMenu:DeleteType("ATM", true)
        end
    end
end


function saisieretrait()
    local amount = KeyboardInput("Retrait banque", "", 15)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('gBank:retirer', amount)
        else
            ESX.ShowNotification("Vous n'avez pas saisi un montant")
        end
    end
end

function saisiedepot()
    local amount = KeyboardInput("Dépot banque", "", 15)

    if amount ~= nil then
        amount = tonumber(amount)

        if type(amount) == 'number' then
            TriggerServerEvent('gBank:deposer', amount)
        else
            ESX.ShowNotification("Vous n'avez pas saisi un montant")
        end
    end
end


function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

Citizen.CreateThread(function()
        while true do
            local Timer = 500
            for i=1, #rBank.position, 1 do
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, rBank.position[i].x, rBank.position[i].y, rBank.position[i].z)
            if jobdist <= 10.0 and rBank.jeveuxmarkerbanque then
                Timer = 0
                DrawMarker(rBank.Type, rBank.position[i].x, rBank.position[i].y, rBank.position[i].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, rBank.Size.x, rBank.Size.y, rBank.Size.z, rBank.Color.r, rBank.Color.g, rBank.Color.b, 100, false, true, 2, false, false, false, false)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        AzoKiUI.Text({ message = "Appuyez sur ~g~[E]~s~ pour parler avec le banquier", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                            playAnim('mp_common', 'givetake1_a', 2500)
                            Citizen.Wait(2500)
                            rBank.GetPlayerMoney()
                            MenuBanque()
        
                    end  
                end 
                end 
        Citizen.Wait(Timer)   
    end
end)


Citizen.CreateThread(function()
    while true do
        local Timer = 500
        for i=1, #rBank.posatm, 1 do
        local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
        local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, rBank.posatm[i].x, rBank.posatm[i].y, rBank.posatm[i].z)
        if jobdist <= 10.0 and rBank.jeveuxmarkeratm then
            Timer = 0
            DrawMarker(rBank.Type, rBank.posatm[i].x, rBank.posatm[i].y, rBank.posatm[i].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, rBank.Size.x, rBank.Size.y, rBank.Size.z, rBank.Color.r, rBank.Color.g, rBank.Color.b, 100, false, true, 2, false, false, false, false)
            end
            if jobdist <= 1.0 then
                Timer = 0
                    AzoKiUI.Text({ message = "Appuyez sur ~g~[E]~s~ pour accéder a l'ATM", time_display = 1 })
                    if IsControlJustPressed(1,51) then
                        playAnim('mp_common', 'givetake2_a', 2500)
                        Citizen.Wait(2500)
                        rBank.GetPlayerMoney()
                        MenuATM()
                end  
            end 
            end 
    Citizen.Wait(Timer)   
end
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end