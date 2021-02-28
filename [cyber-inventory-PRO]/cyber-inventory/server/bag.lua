ESX = nil
local bags = {}

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterUsableItem(Config.BagItem, function(source)
    TriggerClientEvent('cyber-inventory:bag', source)
end)

Citizen.CreateThread(function()
    TriggerEvent('cyber-inventory:RegisterInventory', {
        name = 'bag',
        label = _U('Bag'),
        slots = 25,
        weight = 100
    })
end)

RegisterCommand(Config.BagSkinCommand, function(source)
    local _source = source
    TriggerClientEvent('cyber-inventory:bagskin', _source)
    TriggerClientEvent('cyber-inventory:refreshInventory', _source)
end)

