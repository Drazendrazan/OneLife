ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("fuel:pay")
AddEventHandler("fuel:pay", function(amount)
    local xPlayer = ESX.GetPlayerFromId(source);

    xPlayer.removeAccountMoney('cash', amount);
    xPlayer.addWeapon('WEAPON_PETROLCAN', 250)
    TriggerClientEvent("esx:showNotification", source, "Vous venez de faire un plein pour " .. amount .." €")
end)