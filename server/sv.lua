local ESX = exports['extendedmode']:getSharedObject()

ESX.RegisterServerCallback('ex_coke:CheckItem', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local quantity = xPlayer.getInventoryItem(item).count
    cb(quantity)
end)

RegisterServerEvent('ex_coke:GiveKey')
AddEventHandler('ex_coke:GiveKey', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('cokelab_key', 1) -- Klyuch
    xPlayer.removeInventoryItem('weed20g', 1)
end)

RegisterServerEvent('ex_coke:GiveItem', function(item, am)
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addInventoryItem(item, am)
end)

RegisterServerEvent('ex_coke:RemoveItem', function(item, am)
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeInventoryItem(item, am)
end)
RegisterServerEvent('ex_coke:RemoveCleanLeaves', function(item, am)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local lvQtty = xPlayer.getInventoryItem('clean_leaves').count
    if lvQtty > 0 then
        xPlayer.removeInventoryItem('clean_leaves', lvQtty)
        xPlayer.addInventoryItem('pure_coke', lvQtty)
    end
end)

-- Използване на предмет за разцепване
CreateThread(function()
	for k,v in pairs(Config.DrugConversion) do 
		ESX.RegisterUsableItem(v.UsableItem, function(source)
			local xPlayer = ESX.GetPlayerFromId(source)
			local itemLabel = ESX.GetItemLabel(v.UsableItem)
			local drugOutput
			local requiredItems
			
			local scale = xPlayer.getInventoryItem(v.hqscale).count >= 1
			if v.HighQualityScale then
				if scale then
					drugOutput = v.RewardAmount.b
					requiredItems = v.RequiredItemAmount.d
				else
					drugOutput = v.RewardAmount.a
					requiredItems = v.RequiredItemAmount.c
				end
			else
				drugOutput = v.RewardAmount
				requiredItems = v.RequiredItemAmount
			end
				
			local reqItems = xPlayer.getInventoryItem(v.RequiredItem).count >= requiredItems
			if not reqItems then
				local reqItemLabel = ESX.GetItemLabel(v.RequiredItem)
				TriggerClientEvent('Eotix:Alert', source, 'error', "Нямаш достатъчно "..reqItemLabel)
                return
			end
			
			if xPlayer.getInventoryItem(v.RewardItem).count <= v.MaxRewardItemInv.f or (not scale and xPlayer.getInventoryItem(v.RewardItem).count <= v.MaxRewardItemInv.e) then				xPlayer.removeInventoryItem(v.UsableItem,1)
				xPlayer.removeInventoryItem(v.RequiredItem,requiredItems)
				TriggerClientEvent("ex_coke:RazcepiKokata",source,k,v)
				Wait(v.ConversionTime)
				xPlayer.addInventoryItem(v.RewardItem,drugOutput)
			else
                TriggerClientEvent('Eotix:Alert', source, 'error', "Нямаш достатъчно място за повече "..itemLabel)
			end
		end)
	end
end)

ESX.RegisterUsableItem('lab_location', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('ex_coke:OpenSMS', source)

end)



-- Добавен фентанил и кофеин - diluted_coke
-- пликчета - drugbags
-- черни чували - black_bags
-- тухла - coke_brick : нужно - black_bags
-- 10g - coke10g
-- 1 g - coke1g
-- Везна - hqscale 
-- чист кокаин - pure_coke
-- Телефона на наско - lab_location
-- clean_leaves - Плик чисти кокаинови листа
