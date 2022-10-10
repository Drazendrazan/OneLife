ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'boatshop', 'alerte boatshop', true, true)

TriggerEvent('esx_society:registerSociety', 'boatshop', 'Concessionnaire', 'society_boatshop', 'society_boatshop', 'society_boatshop', {type = 'public'})


ESX.RegisterServerCallback('dok_concessbateau:recuperercategorievehicule', function(source, cb)
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

ESX.RegisterServerCallback('dok_concessbateau:recupererlistevehicule', function(source, cb, categorievehi)
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

ESX.RegisterServerCallback('dok_concessbateau:verifierplaquedispo', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)

RegisterServerEvent('dok_concessbateau:vendrevoiturejoueur')
AddEventHandler('dok_concessbateau:vendrevoiturejoueur', function (playerId, vehicleProps, prix, nom)
    local xPlayer = ESX.GetPlayerFromId(playerId) 
	local levendeur = ESX.GetPlayerFromId(source)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatshop', function (account)
            account.removeMoney(prix)
    end)
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)',
    {
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = vehicleProps.plate,
        ['@vehicle'] = json.encode(vehicleProps),
        ['@type']   = boat

    }, function (rowsChanged)
    TriggerClientEvent('esx:showNotification', xPlayer.source, "Tu as reçu le bateau ~p~"..nom.."~s~ immatriculé ~p~"..vehicleProps.plate.." pour ~p~" ..prix.. "$")
    end)
end)

RegisterServerEvent('shop:vehicule')
AddEventHandler('shop:vehicule', function(vehicleProps, prix, nom)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatshop', function (account)
        account.removeMoney(prix)
end)
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (@owner, @plate, @vehicle, @type)', 
    {
        
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = vehicleProps.plate,
        ['@vehicle'] = json.encode(vehicleProps),
        ['@type']   = boat

    }, function(rowsChange)
        TriggerClientEvent('esx:showNotification', xPlayer, "Tu as reçu le bateau ~p~"..json.encode(vehicleProps).."~s~ immatriculé ~p~"..vehicleProps.plate.." pour ~p~" ..prix.. "$")
    end)
end)

ESX.RegisterServerCallback('dok_concessbateau:verifsousconcess', function(source, cb, prixavion)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_boatshop', function (account)
        if account.money >= prixavion then
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterServerEvent('dConcessBateau:Ouvert')
AddEventHandler('dConcessBateau:Ouvert', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if xPlayer.job.name == 'boatshop' then
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Concessionnaire Bateau', 'Publicité', 'Le Concessionnaire Bateau est désormais ~p~ouvert~s~ !', 'CHAR_FCONCESS', 8)
        end
    end
end)

RegisterServerEvent('dConcessBateau:Fermer')
AddEventHandler('dConcessBateau:Fermer', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if xPlayer.job.name == 'boatshop' then
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Concessionnaire Bateau', 'Publicité', 'Le Concessionnaire Bateau est désormais ~p~fermé~s~ !', 'CHAR_FCONCESS', 8)
        end
    end
end)

RegisterServerEvent('dConcessBateau:Recrutement')
AddEventHandler('dConcessBateau:Recrutement', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if xPlayer.job.name == 'boatshop' then
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Concessionnaire Bateau', 'Publicité', 'Le Concessionnaire Bateau ~p~recrute~s~ !', 'CHAR_FCONCESS', 8)
        end
    end
end)
