local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('rz-core:blanchiement')
AddEventHandler('rz-core:blanchiement', function(argent)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local coords = GetEntityCoords(GetPlayerPed(source))
	local blanchi = vector3(1399.2, 1148.32, 108.14)
	local ZoneSize = 15.0

	local argent = ESX.Math.Round(tonumber(argent))

	if #(coords - blanchi) < ZoneSize / 2 then

		if argent > 0 and xPlayer.getAccount('dirtycash').money >= argent then
			xPlayer.removeAccountMoney('dirtycash', argent)
			TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Roberto', '~p~Blanchiement', 'Patiente ~p~10 secondes', 'CHAR_MP_ROBERTO', 8)
			Citizen.Wait(10000)
		
			TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Roberto', '~p~Blanchiement', 'Tu as reçu : ' .. ESX.Math.GroupDigits(argent) .. ' ~p~$', 'CHAR_MP_ROBERTO', 8)
			xPlayer.addAccountMoney('cash', argent)
		else
			TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Roberto', '~p~Blanchiement', '~p~Montant invalide', 'CHAR_MP_ROBERTO', 8)
		end
--[[	
	else
		DropPlayer(source, "Le cheat ... c'est mal !")
]]
	end
end)