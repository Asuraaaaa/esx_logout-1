ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx_logout:save")
AddEventHandler("esx_logout:save", function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	local money = xPlayer.getMoney()
	local bank = xPlayer.getAccount('bank').money
	
	print(money)
	print(bank)
	
	ESX.SavePlayer(xPlayer)
		MySQL.Async.execute('UPDATE users SET `money` = @money, `bank` = @bank WHERE identifier = @identifier', {
			['@money']   = xPlayer.getMoney(),
			['@bank']   = xPlayer.getAccount('bank').money,
			['@identifier'] = xPlayer.identifier
		})
end)

ESX.RegisterServerCallback('esx_logout:getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		local playerGroup = xPlayer.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb(nil)
        end
	else
		cb(nil)
	end
end)
