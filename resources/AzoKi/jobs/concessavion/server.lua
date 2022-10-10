ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'planeshop', 'alerte planeshop', true, true)

TriggerEvent('esx_society:registerSociety', 'planeshop', 'Concessionnaire', 'society_planeshop', 'society_planeshop', 'society_planeshop', {type = 'public'})


ESX.RegisterServerCallback('dok_concessavion:recuperercategorievehicule', function(source, cb)
    local catevehi = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(result)
        for i = 1, #result, 1 do
            table.insert(catevehi, {
                name = result[i].name,
                label = result[i].label
            })
        end

        cb(catevehi)
    end)
end)

ESX.RegisterServerCallback('dok_concessavion:recupererlistevehicule', function(source, cb, categorievehi)
    local catevehi = categorievehi
    local listevehi = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicles WHERE category = @category', {
        ['@category'] = catevehi
    }, function(result)
        for i = 1, #result, 1 do
            table.insert(listevehi, {
                name = result[i].name,
                model = result[i].model,
                price = result[i].price
            })
        end

        cb(listevehi)
    end)
end)

ESX.RegisterServerCallback('dok_concessavion:verifierplaquedispo', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)

RegisterServerEvent('dok_concessavion:vendrevoiturejoueur')
AddEventHandler('dok_concessavion:vendrevoiturejoueur', function (playerId, vehicleProps, prix, nom)
    local xPlayer = ESX.GetPlayerFromId(playerId) 
	local levendeur = ESX.GetPlayerFromId(source)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_planeshop', function (account)
            account.removeMoney(prix)
    end)
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', 
    {
        
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = vehicleProps.plate,
        ['@vehicle'] = json.encode(vehicleProps),
        ['@type']   = aircraft

    }, function (rowsChanged)
    TriggerClientEvent('esx:showNotification', xPlayer.source, "Tu as reçu l'avion ~p~"..nom.."~s~ immatriculé ~p~"..vehicleProps.plate.." pour ~p~" ..prix.. "$")
    end)
end)

RegisterServerEvent('shop:vehicule')
AddEventHandler('shop:vehicule', function(vehicleProps, prix, nom)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_planeshop', function (account)
        account.removeMoney(prix)
    end)
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', 
    {
    
    ['@owner']   = xPlayer.identifier,
    ['@plate']   = vehicleProps.plate,
    ['@vehicle'] = json.encode(vehicleProps),
    ['@type']   = aircraft

    }, function(rowsChange)
        TriggerClientEvent('esx:showNotification', xPlayer, "Tu as reçu l'avion ~p~"..json.encode(vehicleProps).."~s~ immatriculé ~p~"..vehicleProps.plate.." pour ~p~" ..prix.. "$")
    end)
end)

ESX.RegisterServerCallback('dok_concessavion:verifsousconcess', function(source, cb, prixavion)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_planeshop', function (account)
        if account.money >= prixavion then
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterServerEvent('dConcessAvion:Ouvert')
AddEventHandler('dConcessAvion:Ouvert', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if xPlayer.job.name == 'planeshop' then
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Concessionnaire Avion', 'Publicité', 'Le Concessionnaire Avion est désormais ~p~ouvert~s~ !', 'CHAR_FCONCESS', 8)
        end
    end
end)

RegisterServerEvent('dConcessAvion:Fermer')
AddEventHandler('dConcessAvion:Fermer', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if xPlayer.job.name == 'planeshop' then
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Concessionnaire Avion', 'Publicité', 'Le Concessionnaire Avion est désormais ~p~fermé~s~ !', 'CHAR_FCONCESS', 8)
        end
    end
end)

RegisterServerEvent('dConcessAvion:Recrutement')
AddEventHandler('dConcessAvion:Recrutement', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if xPlayer.job.name == 'planeshop' then
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Concessionnaire Avion', 'Publicité', 'Le Concessionnaire Avion ~p~recrute~s~ !', 'CHAR_FCONCESS', 8)
        end
    end
end)
