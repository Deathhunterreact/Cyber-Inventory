RegisterCommand('search', function(source, args, raw)
    TriggerClientEvent('cyber-inventory:search', source)
end)

RegisterCommand('steal', function(source, args, raw)
    TriggerClientEvent('cyber-inventory:steal', source)
end)

ESX.RegisterServerCallback('cyber-inventory:getIdentifier', function(source, cb, serverid)
    cb(ESX.GetPlayerFromId(serverid).identifier)
end)

RegisterServerEvent('cyber-inventory:StealCash')
AddEventHandler('cyber-inventory:StealCash', function(data)
    local player = ESX.GetPlayerFromId(source)
    local target = ESX.GetPlayerFromIdentifier(data.target)
    if player and target then
        if Config.Steal.cash then
            player.addMoney(target.getMoney())
            target.setMoney(0)
        end
        if Config.Steal.black_money then
            player.addAccountMoney('black_money', target.getAccount('black_money').money)
            target.setAccountMoney('black_money', 0)
        end
        local dctext = 'Üzerini aradı - ' .. target
        TriggerEvent('disc:discord_log', player, dctext)
        TriggerClientEvent('cyber-inventory:refreshInventory', source)
        TriggerClientEvent('cyber-inventory:refreshInventory', target.source)
    end
end)

RegisterServerEvent('cyber-inventory:SeizeCash')
AddEventHandler('cyber-inventory:SeizeCash', function(data)
    local player = ESX.GetPlayerFromId(source)
    local target = ESX.GetPlayerFromIdentifier(data.target)
    if player and target then
        if Config.Seize.cash then
            player.addMoney(target.getMoney())
            target.setMoney(0)
        end
        if Config.Seize.black_money then
            player.addAccountMoney('black_money', target.getAccount('black_money').money)
            target.setAccountMoney('black_money', 0)
        end
        local dctext = 'Üzerini aradı - ' .. target
        TriggerEvent('disc:discord_log', player, dctext)
        TriggerClientEvent('cyber-inventory:refreshInventory', source)
        TriggerClientEvent('cyber-inventory:refreshInventory', target.source)
    end
end)

RegisterServerEvent('cyber-inventory:steal')

AddEventHandler('cyber-inventory:steal', function(data)

    TriggerClientEvent('cyber-inventory:steal', source) 
end)

RegisterServerEvent('cyber-inventory:search')

AddEventHandler('cyber-inventory:search', function(data)

    TriggerClientEvent('cyber-inventory:steal', source) 

end)

RegisterServerEvent('cyber-inventory:bul')

AddEventHandler('cyber-inventory:bul', function(data)

    TriggerClientEvent('cyber-inventory:bul', source) 
end)