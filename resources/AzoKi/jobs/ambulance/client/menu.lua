RegisterCommand("ambulance_menu", function()
    if ESX.PlayerData.job.name == 'ambulance' then
        if IsInServiceEMS then
            AzoKi.Ambulance.OpenAmbulanceMenu()
        else
            ESX.ShowNotification('~p~OneLife~w~ Vous n\'êtes pas en service')
        end
    end
end, false)
RegisterKeyMapping('ambulance_menu', 'Menu Ambulance', 'keyboard', 'F6')


--[[
RegisterServerEvent('EMS:ambulance_appel')
AddEventHandler('EMS:ambulance_appel', function()
    if ESX.PlayerData.job.name == 'ambulance' then
        if IsInServiceEMS then
            OpenReportListEms()
        else
            ESX.ShowNotification('~p~OneLife~w~ Vous n\'êtes pas en service')
        end
    end
end, false)
]]

RegisterCommand("ambulance_appel", function()
    if ESX.PlayerData.job.name == 'ambulance' then
        if IsInServiceEMS then
            OpenReportListEms()
        else
            ESX.ShowNotification('~p~OneLife~w~ Vous n\'êtes pas en service')
        end
    end
end, false)
RegisterKeyMapping('ambulance_appel', 'Menu Appel EMS', 'keyboard', 'F3')