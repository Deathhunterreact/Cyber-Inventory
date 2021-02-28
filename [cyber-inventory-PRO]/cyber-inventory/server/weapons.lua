Citizen.CreateThread(function()
    Citizen.Wait(0)
    MySQL.Async.fetchAll('SELECT * FROM items WHERE LCASE(name) LIKE \'%weapon_%\'', {}, function(results)
        for k, v in pairs(results) do
            ESX.RegisterUsableItem(v.name, function(source)
                TriggerClientEvent('cyber-inventory:useWeapon', source, v.name)
            end)
        end
    end)
end)

RegisterServerEvent('cyber-inventory:updateAmmoCount')
AddEventHandler('cyber-inventory:updateAmmoCount', function(hash, count)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE cyber_weapons SET count = @count WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@count'] = count
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO cyber_weapons (owner, hash, count) VALUES (@owner, @hash, @count)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@count'] = count
            })
        end
    end)
end)

ESX.RegisterServerCallback('cyber-inventory:getAmmoCount', function(source, cb, hash)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM cyber_weapons WHERE owner = @owner and hash = @hash', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash
    }, function(results)
        if #results == 0 then
            cb(nil)
        else
            cb(results[1].count, results[1].suppressor, results[1].light, results[1].grip, results[1].goldtint, results[1].sight, results[1].extended, ammoCount, suppressor, light, grip, goldtint, sight, extended)
        end
    end)
end)


