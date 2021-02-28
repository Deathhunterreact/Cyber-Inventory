ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local WeaponAmmo = {}

RegisterServerEvent("cyber_weapons:server:LoadWeaponAmmo")
AddEventHandler('cyber_weapons:server:LoadWeaponAmmo', function()
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    WeaponAmmo[xPlayer.identifier] = {}
    MySQL.Async.fetchAll("SELECT * FROM `cyber_weapons` WHERE `owner` = '" .. xPlayer.identifier .. "'", {}, function(result)
        if result[1] ~= nil then
            local ammo = json.decode(result[1].ammo)
            if ammo ~= nil then
                for ammotype, amount in pairs(ammo) do 
                    WeaponAmmo[xPlayer.identifier][ammotype] = amount
                end
            end
        end

        TriggerClientEvent("cyber_weapons:client:LoadedWeaponAmmo", src)
	end)
end)

RegisterServerEvent("cyber_weapons:server:AddWeaponAmmo")
AddEventHandler('cyber_weapons:server:AddWeaponAmmo', function(type, amount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local type = tostring(type):upper()
    local amount = tonumber(amount)
    if WeaponAmmo[xPlayer.identifier] ~= nil then
        if next(WeaponAmmo[xPlayer.identifier]) ~= nil then
            if WeaponAmmo[xPlayer.identifier][type] ~= nil then
                WeaponAmmo[xPlayer.identifier][type] = WeaponAmmo[xPlayer.identifier][type] + amount
            else
                WeaponAmmo[xPlayer.identifier][type] = amount
            end
        else
            WeaponAmmo[xPlayer.identifier][type] = amount
        end
    end
end)

RegisterServerEvent("cyber_weapons:server:UpdateWeaponAmmo")
AddEventHandler('cyber_weapons:server:UpdateWeaponAmmo', function(type, amount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local type = tostring(type):upper()
    local amount = tonumber(amount)
    if WeaponAmmo[xPlayer.identifier] ~= nil and next(WeaponAmmo[xPlayer.identifier]) ~= nil then
        for ammotype, ammo in pairs(WeaponAmmo[xPlayer.identifier]) do
            if type == ammotype then
                WeaponAmmo[xPlayer.identifier][ammotype] = amount
                return
            end
        end
    end
end)

RegisterServerEvent("cyber_weapons:server:SaveWeaponAmmo")
AddEventHandler('cyber_weapons:server:SaveWeaponAmmo', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer ~= nil then
        MySQL.Async.fetchAll("SELECT * FROM `cyber_weapons` WHERE `owner` = '" .. xPlayer.identifier .. "'", {}, function(result)
            if result[1] == nil then
                MySQL.Sync.execute("INSERT INTO `cyber_weapons` (`owner`, `ammo`) VALUES ('" .. xPlayer.identifier .. "', '"..json.encode(WeaponAmmo[xPlayer.identifier]).."')", {})
            else
                MySQL.Sync.execute("UPDATE `cyber_weapons` SET ammo='" .. json.encode(WeaponAmmo[xPlayer.identifier]) .. "' WHERE `owner` = '" .. xPlayer.identifier .. "'", {})
            end
        end)
    end
end)

ESX.RegisterServerCallback("weapon:server:GetWeaponAmmo", function(source, cb, weapon)
    local xPlayer = ESX.GetPlayerFromId(source)
    local ammotype = tostring(Config.Weapons[weapon]["ammotype"]):upper()
    if xPlayer ~= nil and ammotype then
        if WeaponAmmo[xPlayer.identifier] ~= nil and next(WeaponAmmo[xPlayer.identifier]) ~= nil then
            local amount = tonumber(WeaponAmmo[xPlayer.identifier][ammotype]) ~= 0 and tonumber(WeaponAmmo[xPlayer.identifier][ammotype]) or 0
            cb(amount)
        else
            cb(0)
        end
    else
        cb(0)
    end
end)

ESX.RegisterUsableItem("cyber_ammo_pistol", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem("cyber_ammo_pistol", 1)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_PISTOL", 30)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Used Pistol ammo.', style = { ['background-color'] = '#9c2f2f', ['color'] = '#FFFFFF' } })
end)

ESX.RegisterUsableItem("cyber_ammo_rifle", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem("cyber_ammo_rifle", 1)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_RIFLE", 40)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Used Rifle ammo.', style = { ['background-color'] = '#9c2f2f', ['color'] = '#FFFFFF' } })
end)

ESX.RegisterUsableItem("cyber_ammo_smg", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem("cyber_ammo_smg", 1)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_SMG", 40)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Used SMG ammo.', style = { ['background-color'] = '#9c2f2f', ['color'] = '#FFFFFF' } })
end)

ESX.RegisterUsableItem("cyber_ammo_shotgun", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem("cyber_ammo_shotgun", 1)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_SHOTGUN", 15)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Used Shotgun ammo.', style = { ['background-color'] = '#9c2f2f', ['color'] = '#FFFFFF' } })
end)

ESX.RegisterUsableItem("cyber_ammo_mg", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem("cyber_ammo_mg", 1)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_MG", 30)
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Used MG ammo.', style = { ['background-color'] = '#9c2f2f', ['color'] = '#FFFFFF' } })
end)



------------------ ATTACHMENTS


ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('suppressor', function(source)   
    TriggerClientEvent('cyber_weapons:suppressor', source)
end)

ESX.RegisterUsableItem('light', function(source) 
    TriggerClientEvent('cyber_weapons:light', source)
end)

ESX.RegisterUsableItem('grip', function(source)
    TriggerClientEvent('cyber_weapons:grip', source)
end)

ESX.RegisterUsableItem('goldtint', function(source)
    TriggerClientEvent('cyber_weapons:goldtint', source)
end)

ESX.RegisterUsableItem('sight', function(source)
    TriggerClientEvent('cyber_weapons:sight', source)
end)

ESX.RegisterUsableItem('extended', function(source)
    TriggerClientEvent('cyber_weapons:extended', source)
end)

RegisterNetEvent('cyber_weapons:cleanweapon')
AddEventHandler('cyber_weapons:cleanweapon', function(hash)
    local player = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE cyber_weapons SET suppressor = @suppressor, light = @light, grip = @grip, goldtint = @goldtint, sight = @sight WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@suppressor'] = 0,
		['@light'] = 0,
		['@grip'] = 0,
		['@goldtint'] = 0,
		['@sight'] = 0
    }, function(results)
    end)
end)

RegisterNetEvent('cyber_weapons:suppressorIn')
AddEventHandler('cyber_weapons:suppressorIn', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('suppressor', 1)
    MySQL.Async.execute('UPDATE cyber_weapons SET suppressor = @suppressor WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@suppressor'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO cyber_weapons (owner, hash, suppressor) VALUES (@owner, @hash, @suppressor)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@suppressor'] = 1
            })
        end
    end)
end)

RegisterNetEvent('cyber_weapons:lightIn')
AddEventHandler('cyber_weapons:lightIn', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('light', 1)
    MySQL.Async.execute('UPDATE cyber_weapons SET light = @light WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@light'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO cyber_weapons (owner, hash, light) VALUES (@owner, @hash, @light)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@light'] = 1
            })
        end
    end)
end)

RegisterNetEvent('cyber_weapons:gripIn')
AddEventHandler('cyber_weapons:gripIn', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('grip', 1)
    MySQL.Async.execute('UPDATE cyber_weapons SET grip = @grip WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@grip'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO cyber_weapons (owner, hash, grip) VALUES (@owner, @hash, @grip)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@grip'] = 1
            })
        end
    end)
end)

RegisterNetEvent('cyber_weapons:goldtintIn')
AddEventHandler('cyber_weapons:goldtintIn', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('goldtint', 1)
    MySQL.Async.execute('UPDATE cyber_weapons SET goldtint = @goldtint WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@goldtint'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO cyber_weapons (owner, hash, goldtint) VALUES (@owner, @hash, @goldtint)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@goldtint'] = 1
            })
        end
    end)
end)

RegisterNetEvent('cyber_weapons:sightIn')
AddEventHandler('cyber_weapons:sightIn', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('sight', 1)
    MySQL.Async.execute('UPDATE cyber_weapons SET sight = @sight WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@sight'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO cyber_weapons (owner, hash, sight) VALUES (@owner, @hash, @sight)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@sight'] = 1
            })
        end
    end)
end)

RegisterNetEvent('cyber_weapons:extendedIn')
AddEventHandler('cyber_weapons:extendedIn', function(hash)
    local player = ESX.GetPlayerFromId(source)
	player.removeInventoryItem('extended', 1)
    MySQL.Async.execute('UPDATE cyber_weapons SET extended = @extended WHERE hash = @hash AND owner = @owner', {
        ['@owner'] = player.identifier,
        ['@hash'] = hash,
        ['@extended'] = 1
    }, function(results)
        if results == 0 then
            MySQL.Async.execute('INSERT INTO cyber_weapons (owner, hash, extended) VALUES (@owner, @hash, @extended)', {
                ['@owner'] = player.identifier,
                ['@hash'] = hash,
                ['@extended'] = 1
            })
        end
    end)
end)


------- Bulletproof

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bulletproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	  xPlayer.removeInventoryItem('bulletproof', 1)
	  TriggerClientEvent('cyber_weapons:armor', source)
end)