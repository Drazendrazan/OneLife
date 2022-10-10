TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'burgershot', 'alerte burgershot', true, true)

TriggerEvent('esx_society:registerSociety', 'burgershot', 'burgershot', 'society_burgershot', 'society_burgershot', 'society_burgershot', {type = 'public'})

RegisterServerEvent('Ouvre:burgershot')
AddEventHandler('Ouvre:burgershot', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BurgerShot', '~p~Annonce', '~p~Le BurgerShot est actuellement ouvert !', 'CHAR_BURGERSHOT', 8)
	end
end)

RegisterServerEvent('Ferme:burgershot')
AddEventHandler('Ferme:burgershot', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BurgerShot', '~p~Annonce', '~r~Le BurgerShot est fermé !', 'CHAR_BURGERSHOT', 8)
	end
end)

RegisterServerEvent('Recru:burgershot')
AddEventHandler('Recru:burgershot', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BurgerShot', '~p~Annonce', '~p~Recrutement en cours, rendez-vous au BurgerShot !', 'CHAR_BURGERSHOT', 8)
	end
end)


RegisterCommand('burg', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "burgershot" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetPlayerName(source)
            local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BurgerShot', '~b~Annonce', '' ..msg.. '', 'CHAR_BURGERSHOT', 0)
        end
        -- Possible de logs
    else
        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~r~Erreur' , '~p~Tu n\'es pas membre de cette entreprise', 'CHAR_BURGERSHOT', 0)
    end
else
    TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~r~Erreur' , '~p~Tu n\'es pas membre de cette entreprise', 'CHAR_BURGERSHOT', 0)
end
end, false)



-- Coffre 

ESX.RegisterServerCallback('burgershot:playerinventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
	local all_items = {}
	
	for k,v in pairs(items) do
		if v.count > 0 then
			table.insert(all_items, {label = v.label, item = v.name,nb = v.count})
		end
	end

	cb(all_items)

	
end)


ESX.RegisterServerCallback('burgershot:getStockItems', function(source, cb)
	local all_items = {}
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

RegisterServerEvent('burgershot:putStockItems')
AddEventHandler('burgershot:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item_in_inventory = xPlayer.getInventoryItem(itemName).count

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot', function(inventory)
		if item_in_inventory >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- ~p~Dépot\n~s~- ~p~Item ~s~: "..itemName.."\n~s~- ~o~Quantitée ~s~: "..count.."")
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, "~r~Vous n'en avez pas assez sur vous")
		end
	end)
end)

RegisterServerEvent('burgershot:takeStockItems')
AddEventHandler('burgershot:takeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_burgershot', function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- ~r~Retrait\n~s~- ~p~Item ~s~: "..itemName.."\n~s~- ~o~Quantitée ~s~: "..count.."")
	end)
end)


-- Logs

RegisterServerEvent('burgershot:withdrawMoney')
AddEventHandler('burgershot:withdrawMoney', function(society, amount, money_soc)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local pName = GetPlayerName(_src)

    TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
      if account.money >= tonumber(amount) then
          xPlayer.addMoney(amount)
          account.removeMoney(amount)
          TriggerClientEvent("esx:showNotification", _src, "- ~o~Retiré \n~s~- ~p~Somme : "..amount.."€")
      else
          TriggerClientEvent("esx:showNotification", _src, "- ~r~L'entreprise \n~s~- ~p~Pas assez d'argent")
      end
    end)

  end)



RegisterServerEvent('burgershot:depositMoney')
AddEventHandler('burgershot:depositMoney', function(society, amount)

    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local pName = GetPlayerName(_src)
    local money = xPlayer.getAccount('cash').money

    TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
      if money >= tonumber(amount) then
          xPlayer.removeMoney(amount)
          account.addMoney(amount)
          TriggerClientEvent("esx:showNotification", _src, "- ~o~Déposé \n~s~- ~p~Somme : "..amount.."€")
      else
          TriggerClientEvent("esx:showNotification", _src, "- ~r~Erreur \n~s~- ~p~Pas assez d'argent")
      end
    end)

end)

ESX.RegisterServerCallback('burgershot:getSocietyMoney', function(source, cb, soc)
	local money = nil
		MySQL.Async.fetchAll('SELECT * FROM addon_account_data WHERE account_name = @society ', {
			['@society'] = soc,
		}, function(data)
			for _,v in pairs(data) do
				money = v.money
			end
			cb(money)
		end)
end)

--- Farms 

--[[
RegisterNetEvent('recoltepainburger')
AddEventHandler('recoltepainburger', function()
    local item = "painburger"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)

RegisterNetEvent('recoltegarnitures')
AddEventHandler('recoltegarnitures', function()
    local item = "garnitures"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count
    

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de place dans ton inventaire!")
        recoltepossible = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte en cours...")
		return
    end
end)
]]

-- Cuisine 


RegisterNetEvent('craftburgerclassique')
AddEventHandler('craftburgerclassique', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local garnitures = xPlayer.getInventoryItem('garnitures').count
	local cornichons = xPlayer.getInventoryItem('cornichons').count
    local viandeburger = xPlayer.getInventoryItem('viande').count
    local painburger = xPlayer.getInventoryItem('painburger').count
	local burger = xPlayer.getInventoryItem('burger').count

    if burger > 50 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite maximum')
    elseif garnitures < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus garnitures pour faire ceci')
	elseif cornichons < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de cornichons pour faire ceci')
    elseif viandeburger < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de viandes pour faire ceci')
	elseif painburger < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de painburger pour faire ceci')
    else
        xPlayer.removeInventoryItem('garnitures', 1)
		xPlayer.removeInventoryItem('cornichons', 1)
		xPlayer.removeInventoryItem('painburger', 1)
        xPlayer.addInventoryItem('burger', 1)    
    end
end)

RegisterNetEvent('craftdoubleburgerclassique')
AddEventHandler('craftdoubleburgerclassique', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local garnitures = xPlayer.getInventoryItem('garnitures').count
	local cornichons = xPlayer.getInventoryItem('cornichons').count
    local viandeburger = xPlayer.getInventoryItem('viande').count
    local painburger = xPlayer.getInventoryItem('painburger').count
	local burger = xPlayer.getInventoryItem('burger').count

    if burger > 50 then
        TriggerClientEvent('esx:showNotification', source, '~r~Tu à ateint la limite maximum')
    elseif garnitures < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus garnitures pour faire ceci')
	elseif cornichons < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de cornichons pour faire ceci')
    elseif viandeburger < 2 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de viandes pour faire ceci')
	elseif painburger < 1 then
        TriggerClientEvent('esx:showNotification', source, '~r~tu n\'as plus de painburger pour faire ceci')
    else
        xPlayer.removeInventoryItem('garnitures', 1)
		xPlayer.removeInventoryItem('cornichons', 1)
        xPlayer.removeInventoryItem('viande', 2)
		xPlayer.removeInventoryItem('painburger', 1)
        xPlayer.addInventoryItem('burger', 2)    
    end
end)


--- Shops

RegisterNetEvent('burgershot:BuyPainBurger')
AddEventHandler('burgershot:BuyPainBurger', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 3
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
        societyAccount = account
        end)
        ----xPlayer.removeMoney(price)
        xPlayer.removeAccountMoney('cash', price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('painburger', 1)
        TriggerClientEvent('esx:showNotification', source, "~p~Achats~w~ effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('burgershot:BuyViande')
AddEventHandler('burgershot:BuyViande', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 5
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
        societyAccount = account
        end)
        ----xPlayer.removeMoney(price)
        xPlayer.removeAccountMoney('cash', price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('viande', 1)
        TriggerClientEvent('esx:showNotification', source, "~p~Achats~w~ effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('burgershot:BuyCornichons')
AddEventHandler('burgershot:BuyCornichons', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
        societyAccount = account
        end)
        ----xPlayer.removeMoney(price)
        xPlayer.removeAccountMoney('cash', price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('cornichons', 1)
        TriggerClientEvent('esx:showNotification', source, "~p~Achats~w~ effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('burgershot:BuySalades')
AddEventHandler('burgershot:BuySalades', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 3
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
        societyAccount = account
        end)
        --xPlayer.removeMoney(price)
        xPlayer.removeAccountMoney('cash', price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('salade', 1)
        TriggerClientEvent('esx:showNotification', source, "~p~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('burgershot:BuyTomates')
AddEventHandler('burgershot:BuyTomates', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 2
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
        societyAccount = account
        end)
        --xPlayer.removeMoney(price)
        xPlayer.removeAccountMoney('cash', price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('tomate', 1)
        TriggerClientEvent('esx:showNotification', source, "~p~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('burgershot:BuyFrites')
AddEventHandler('burgershot:BuyFrites', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 2
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
        societyAccount = account
        end)
        --xPlayer.removeMoney(price)
        xPlayer.removeAccountMoney('cash', price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('frites', 1)
        TriggerClientEvent('esx:showNotification', source, "~p~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


RegisterNetEvent('burgershot:BuyCoca')
AddEventHandler('burgershot:BuyCoca', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 3
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
        societyAccount = account
        end)
        --xPlayer.removeMoney(price)
        xPlayer.removeAccountMoney('cash', price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('coca', 1)
        TriggerClientEvent('esx:showNotification', source, "~p~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)



RegisterNetEvent('burgershot:BuyOrangina')
AddEventHandler('burgershot:BuyOrangina', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 3
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
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

RegisterNetEvent('burgershot:BuyGarnitures')
AddEventHandler('burgershot:BuyGarnitures', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 2
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_burgershot', function(account)
        societyAccount = account
        end)
        ----xPlayer.removeMoney(price)
        xPlayer.removeAccountMoney('cash', price)
        societyAccount.addMoney (price)
        xPlayer.addInventoryItem('garnitures', 1)
        TriggerClientEvent('esx:showNotification', source, "~p~Achats~w~ effectué !")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)
