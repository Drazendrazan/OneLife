TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'unicorn', 'alerte unicorn', true, true)

TriggerEvent('esx_society:registerSociety', 'unicorn', 'unicorn', 'society_unicorn', 'society_unicorn', 'society_unicorn', {type = 'public'})

RegisterServerEvent('Ouvre:unicorn')
AddEventHandler('Ouvre:unicorn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Vanilla Unicorn', '~r~Annonce', 'L\'Unicorn est désormais ~g~Ouvert~s~ !', 'CHAR_UNICORN', 8)
	end
end)

RegisterServerEvent('Ferme:unicorn')
AddEventHandler('Ferme:unicorn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Vanilla Unicorn', '~r~Annonce', 'L\'Unicorn est désormais ~r~Fermer~s~ !', 'CHAR_UNICORN', 8)
	end
end)

RegisterServerEvent('Recrutement:unicorn')
AddEventHandler('Recrutement:unicorn', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Vanilla Unicorn', '~g~Annonce', 'Les ~y~Recrutement~r~ en cours, rendez-vous au Vanilla Unicorn !', 'CHAR_UNICORN', 8)
	end
end)


RegisterServerEvent('esx_unicornjob:prendreitems')
AddEventHandler('esx_unicornjob:prendreitems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then

			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, 'Objet retiré', count, inventoryItem.label)
			end
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)


RegisterNetEvent('esx_unicornjob:stockitem')
AddEventHandler('esx_unicornjob:stockitem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', _source, "Objet déposé "..count..""..inventoryItem.label.."")
		else
			TriggerClientEvent('esx:showNotification', _source, "quantité invalide")
		end
	end)
end)

ESX.RegisterServerCallback('esx_unicornjob:inventairejoueur', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_unicornjob:prendreitem', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		cb(inventory.items)
	end)
end)

--Shop Unicorn 
RegisterNetEvent('dokunicorn:BuyEau')
AddEventHandler('dokunicorn:BuyEau', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 3
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('water', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('dokunicorn:BuyIceTea')
AddEventHandler('dokunicorn:BuyIceTea', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 6
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('icetea', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('dokunicorn:BuyLimonade')
AddEventHandler('dokunicorn:BuyLimonade', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 7
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('limonade', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('dokunicorn:BuyVine')
AddEventHandler('dokunicorn:BuyVine', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 20
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('vine', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('dokunicorn:BuyWhiskycoca')
AddEventHandler('dokunicorn:BuyWhiskycoca', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 15
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('whiskycoca', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('dokunicorn:BuyMojito')
AddEventHandler('dokunicorn:BuyMojito', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 10
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('mojito', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('dokunicorn:BuyCoca')
AddEventHandler('dokunicorn:BuyCoca', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 7
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('coca', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('dokunicorn:BuyFanta')
AddEventHandler('dokunicorn:BuyFanta', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 10
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('fanta', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

----Exemple Achat Boisson
--[[
RegisterNetEvent('dokunicorn:BuyOrangina')
AddEventHandler('dokunicorn:BuyOrangina', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_unicorn', function(account)
        societyAccount = account
        end)
        --xPlayer.removeMoney(price)
        xPlayer.removeAccountMoney('cash', price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('orangina', 1)
        TriggerClientEvent('esx:showNotification', source, "~p~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)
]]