ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('gBank:deposer')
AddEventHandler('gBank:deposer', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = tonumber(amount)

	if amount == nil or amount <= 0 or amount > xPlayer.getAccount('cash').money then
		TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent~s~ !")
	else
		xPlayer.removeAccountMoney('cash', amount)
          TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'Banque', "Vous avez deposé ~g~"..amount.."$~s~ à la banque !", 'CHAR_BANK', 10)
		xPlayer.addAccountMoney('bank', tonumber(amount))
	end
end)

RegisterServerEvent('gBank:retirer')
AddEventHandler('gBank:retirer', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerBank = xPlayer.getAccount('bank').money
	amount = tonumber(amount)

	if amount == nil or amount <= 0 or amount > xPlayerBank then
		TriggerClientEvent('chatMessage', xPlayer.source, "Montant Invalide")
          TriggerClientEvent('esx:showNotification', source, "Vous n'avez pas assez ~r~d\'argent~s~ !")
	else
		xPlayer.removeAccountMoney('bank', amount)
          TriggerClientEvent('esx:showAdvancedNotification', source, 'Banque', 'Banque', "Vous avez retiré ~g~"..amount.."$~s~ de la banque !", 'CHAR_BANK', 10)
		xPlayer.addAccountMoney('cash', amount)
	end
end)


RegisterServerEvent("bank:solde") 
AddEventHandler("bank:solde", function(action, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getAccount('bank').money
    TriggerClientEvent("solde:argent", source, playerMoney)
end)

RegisterServerEvent('gBank:transfer')
AddEventHandler('gBank:transfer', function(target, amount)
	local sourcePlayer = ESX.GetPlayerFromId(source)
	local targetPlayer = ESX.GetPlayerFromId(target)
	amount = tonumber(amount)

	if targetPlayer then
		if sourcePlayer.source ~= targetPlayer.source then
			if type(amount) == 'number' and amount > 0 and sourcePlayer.getAccount('bank').money >= amount then
				local accountLabel = ESX.GetAccountLabel('bank')

				sourcePlayer.removeAccountMoney('bank', amount)
				targetPlayer.addAccountMoney('bank', amount)

				sourcePlayer.showAdvancedNotification("~p~OneLife", "~y~Fleeca Bank", ('Vous avez transféré ~g~$%s~s~ à ~y~%s~s~'):format(ESX.Math.GroupDigits(amount), targetPlayer.name), 'CHAR_BANK', 9)
				targetPlayer.showAdvancedNotification("~p~OneLife", "~y~Fleeca Bank", ('Vous avez reçu ~g~$%s~s~ de ~b~%s~s~'):format(ESX.Math.GroupDigits(amount), sourcePlayer.name), 'CHAR_BANK', 9)

				TriggerEvent("esx:giveaccountalert", sourcePlayer.name, targetPlayer.name, 'bank', amount)
			else
				sourcePlayer.showAdvancedNotification("~p~OneLife", "~y~Fleeca Bank", '~r~Action Impossible~s~ : Montant Invalide !', 'CHAR_BANK', 9)
			end
		else
			sourcePlayer.showAdvancedNotification("~p~OneLife", "~y~Fleeca Bank", '~r~Action Impossible~s~ : Vous ne pouvez pas transférer à vous même !', 'CHAR_BANK', 9)
		end
	else
		sourcePlayer.showAdvancedNotification("~p~OneLife", "~y~Fleeca Bank", '~r~Action Impossible~s~ : Compte cible invalide !', 'CHAR_BANK', 9)
	end
end)
