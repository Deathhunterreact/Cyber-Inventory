ESX = nil
InvType = {
    ['unknown'] = { slots = 1, label = 'Unknown' },
}

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)


RegisterServerEvent('cyber-inventory:RegisterInventory')
AddEventHandler('cyber-inventory:RegisterInventory', function(inventory)
    if inventory.name == nil then
        print('Requires inv name')
        return
    end

    if inventory.slots == nil then
        inventory.slots = 4
    end

    if inventory.getInventory == nil then
        print('Registering Default getInventory')
        inventory.getInventory = function(identifier, cb)
            getInventory(identifier, inventory.name, cb)
        end
    end

    if inventory.applyToInventory == nil then
        print('Registering Default applyToInventory')
        inventory.applyToInventory = function(identifier, f)
            applyToInventory(identifier, inventory.name, f)
        end
    end

    if inventory.saveInventory == nil then
        print('Registering Default saveInventory')
        inventory.saveInventory = function(identifier, toSave)
            if table.length(toSave) > 0 then
                saveInventory(identifier, inventory.name, toSave)
            else
                deleteInventory(identifier, inventory.name)
            end
        end
    end

    if inventory.getDisplayInventory == nil then
        print('Registering Default getDisplayInventory')
        inventory.getDisplayInventory = function(identifier, cb, source)
            getDisplayInventory(identifier, inventory.name, cb, source)
        end
    end

    InvType[inventory.name] = inventory
    loadedInventories[inventory.name] = {}
end)

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback('cyber-inventory:doesInvTypeExists', function(source, cb, type)
    cb(InvType[type] ~= nil)
end)

RegisterCommand('envkontrol', function(source)
    local owner = ESX.GetPlayerFromId(source).identifier
    MySQL.Async.fetchAll('DELETE FROM cyber_inventory WHERE data = @data AND owner = @owner', { ['@data'] = "null", ['@owner'] = owner })
    ensureInventories(source)
end)

function ensureInventories(source)
    local player = ESX.GetPlayerFromId(source)
    ensurePlayerInventory(player)
    TriggerClientEvent('cyber-inventory:refreshInventory', source)
end

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        saveInventories()
    end
end)

AddEventHandler('esx:playerLoaded', function(data)
    local player = ESX.GetPlayerFromId(data)
    ensurePlayerInventory(player)
end)

Citizen.CreateThread(function()
    local players = ESX.GetPlayers()
    for k, v in ipairs(players) do
        ensurePlayerInventory(ESX.GetPlayerFromId(v))
    end
end)

AddEventHandler('esx:playerDropped', function(source)
    local player = ESX.GetPlayerFromId(source)
    saveInventory(player.identifier, 'player')
    closeAllOpenInventoriesForSource(source)
end)

ESX.RegisterServerCallback('GetCharacterNameServer', function(source, cb, player)
    local player = ESX.GetPlayerFromId(source)
    local result = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
        ['@identifier'] = player.identifier
    })

    local firstname = result[1].firstname
    local lastname  = result[1].lastname

    cb(''.. firstname .. ' ' .. lastname ..'')
end)

ESX.RegisterServerCallback("getplayers", function(source, cb, players)
    local names = {}

    for i = 1, #players do
        local xPlayer = ESX.GetPlayerFromId(players[i].id)
        local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        })
        local firstname = result[1].firstname
        local lastname = result[1].lastname

        table.insert(names, {label = ""..firstname.." "..lastname, player = players[i].id})
    end
    cb(names)
end)


ESX.RegisterServerCallback('cyber-inventory:buy', function(source, cb, price)
    local player = ESX.GetPlayerFromId(source)
    if player.getMoney() >= price then
        player.removeMoney(price)
        cb(1)
    else
        cb(0)
    end
end)

RegisterServerEvent('cyber-inventory:givePlayerItem')
AddEventHandler('cyber-inventory:givePlayerItem', function(item, count)
    local player = ESX.GetPlayerFromId(source)
    player.addInventoryItem(item, count)
end)

ESX.RegisterServerCallback('cyber-inventory:takePlayerItem', function(source, cb, item, count)
    local player = ESX.GetPlayerFromId(source)
    local invItem = player.getInventoryItem(item)
    if invItem.count - count < 0 then
        cb(false)
    else
        player.removeInventoryItem(item, count)
        cb(true)
    end
end)

RegisterServerEvent('cyber-inventory:givePlayerDirtyMoney')
AddEventHandler('cyber-inventory:givePlayerDirtyMoney', function(amount)
    local player = ESX.GetPlayerFromId(source)
    player.addAccountMoney('black_money', amount)
end)

RegisterServerEvent('cyber-inventory:givePlayerMoney')
AddEventHandler('cyber-inventory:givePlayerMoney', function(amount)
    local player = ESX.GetPlayerFromId(source)
    player.addMoney(amount)
end)

ESX.RegisterServerCallback('cyber-inventory:takePlayerMoney', function(source, cb, amount)
    local player = ESX.GetPlayerFromId(source)
    local money = player.getMoney()
    if money - amount < 0 then
        cb(false)
    else
        player.removeMoney(amount)
        cb(true)
    end
end)