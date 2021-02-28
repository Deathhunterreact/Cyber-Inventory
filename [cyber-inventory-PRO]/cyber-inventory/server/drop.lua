local drops = {}
local bags = {}

Citizen.CreateThread(function()
    TriggerEvent('cyber-inventory:RegisterInventory', {
        name = 'drop',
        label = _U('drop'),
        slots = 100
    })
end)

MySQL.ready(function()
    if Config.DeleteDropsOnStart then
        MySQL.Async.execute('DELETE FROM cyber_inventory WHERE type = \'drop\'')
        checkBags()
    end
end)

function checkBags()
    MySQL.Async.fetchAll('SELECT * FROM cyber_inventory WHERE type = \'bag\'', {}, function(results)
        print('Bags ' .. tostring(#results))
        bags = {}
        for k, v in pairs(results) do
            if v.drop == '1' then
                MySQL.Sync.execute("DELETE FROM `cyber_inventory` WHERE owner = @owner AND type = @type", { 
                    ['@owner'] = v.owner,
                    ['@type'] = 'bag'
                })
            end
        end
    end)
end

function updateDrops()
    print('Fetching')
    MySQL.Async.fetchAll('SELECT * FROM cyber_inventory WHERE type = \'drop\'', {}, function(results)
        print('Fetched ' .. tostring(#results))
        drops = {}
        for k, v in pairs(results) do
            drops[v.owner] = json.decode(v.data)
        end
        table.print(drops)
        TriggerClientEvent('cyber-inventory:updateDrops', -1, drops)
    end)
end

Citizen.CreateThread(function()
    Citizen.Wait(5000)
    updateDrops()
end)

AddEventHandler('esx:playerLoaded', function(data)
    Citizen.Wait(0)
    updateDrops()
end)

RegisterServerEvent('cyber-inventory:modifiedInventory')
AddEventHandler('cyber-inventory:modifiedInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('cyber-inventory:updateDrops', -1, drops)
    end
end)

RegisterServerEvent('cyber-inventory:savedInventory')
AddEventHandler('cyber-inventory:savedInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('cyber-inventory:updateDrops', -1, drops)
    end
end)

RegisterServerEvent('cyber-inventory:createdInventory')
AddEventHandler('cyber-inventory:createdInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('cyber-inventory:updateDrops', -1, drops)
    end
end)

RegisterServerEvent('cyber-inventory:deletedInventory')
AddEventHandler('cyber-inventory:deletedInventory', function(identifier, type)
    if type == 'drop' then
        drops[identifier] = nil
        TriggerClientEvent('cyber-inventory:updateDrops', -1, drops)
    end
end)
