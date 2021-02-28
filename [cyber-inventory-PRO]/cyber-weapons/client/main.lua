ESX = nil

local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    ESX.PlayerData = ESX.GetPlayerData()
    
    TriggerServerEvent("cyber_weapons:server:LoadWeaponAmmo")
end)

RegisterNetEvent("cyber_weapons:client:LoadedWeaponAmmo")
AddEventHandler("cyber_weapons:client:LoadedWeaponAmmo", function()
    Citizen.CreateThread(function() 
        while true do
            TriggerServerEvent("cyber_weapons:server:SaveWeaponAmmo")
            Citizen.Wait((1000 * 60)*2)
        end
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if IsPedShooting(GetPlayerPed(-1)) then
            local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
            local ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon)
            TriggerServerEvent("cyber_weapons:server:UpdateWeaponAmmo", Config.Weapons[weapon]["ammotype"], tonumber(ammo))
        end
    end 
end)

RegisterNetEvent('weapon:client:AddAmmo')
AddEventHandler('weapon:client:AddAmmo', function(type, amount)
    local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
    if Config.Weapons[weapon] ~= nil and Config.Weapons[weapon]["ammotype"] == type:upper() then
        local total = (GetAmmoInPedWeapon(GetPlayerPed(-1), weapon) + amount)
        local _, maxAmmo = GetMaxAmmo(GetPlayerPed(-1), weapon)

        if total < maxAmmo then
            TaskReloadWeapon(GetPlayerPed(-1))
            SetPedAmmo(GetPlayerPed(-1), weapon, total)
        else
        exports['mythic_notify']:DoHudText('inform', 'You cant load more ammo.', 5000, { ['background-color'] = '#e31515', ['color'] = '#FFFFFF' })
        end
        
    end
    TriggerServerEvent("cyber_weapons:server:AddWeaponAmmo", type, amount)
    TriggerServerEvent("cyber_weapons:server:SaveWeaponAmmo")
end)


----------- ATTACHMENTS



supp1 = {-2084633992, -1357824103, 2132975508, -494615257}
supp2 = {-1716589765, 324215364, -270015777, -1074790547, -1063057011, -1654528753, 984333226}
supp3 = {1593441988, -771403250, 584646201, 137902532, 736523883}
supp4 = {487013001}

flash1 = {453432689, 1593441988, 584646201, -1716589765, -771403250, 324215364}
flash2 = {736523883, -270015777, 171789620, -1074790547, -2084633992, -1357824103, -1063057011, 2132975508, 487013001, -494615257, -1654528753, 984333226}

grip1 = {171789620, -1074790547, -2084633992, -1063057011, 2132975508, 2144741730, -494615257, -1654528753, 984333226}

scope1 = {-2084633992}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)


RegisterCommand("cleanweapon", function()
local ped = PlayerPedId()
local SilahHash = GetSelectedPedWeapon(ped)
TriggerServerEvent('cyber_weapons:cleanweapon', SilahHash)
	exports['mythic_notify']:DoHudText('inform', 'All attachments have been removed.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
TriggerEvent('cyber-inventory:removeCurrentWeapon')
end)

RegisterNetEvent('cyber_weapons:suppressor')
AddEventHandler('cyber_weapons:suppressor', function()

    local ped = PlayerPedId()
    local SilahHash = GetSelectedPedWeapon(ped)
	
	ESX.TriggerServerCallback('cyber-inventory:getAmmoCount', function(ammoCount, suppressor, light, grip, goldtint, sight)
	if suppressor ~= 1 then
    if SilahHash == GetHashKey("WEAPON_PISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))
        exports['mythic_notify']:DoHudText('inform', 'You put a suppressor on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('cyber_weapons:suppressorIn', SilahHash)
    elseif table.includes(supp1, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0x837445AA)
        exports['mythic_notify']:DoHudText('inform', 'You put a suppressor on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('cyber_weapons:suppressorIn', SilahHash)
    elseif table.includes(supp2, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xA73D4664)
        exports['mythic_notify']:DoHudText('inform', 'You put a suppressor on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('cyber_weapons:suppressorIn', SilahHash)
    elseif table.includes(supp3, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xC304849A)
        exports['mythic_notify']:DoHudText('inform', 'You put a suppressor on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('cyber_weapons:suppressorIn', SilahHash)
    elseif table.includes(supp4, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xE608B35E)
        exports['mythic_notify']:DoHudText('inform', 'You put a suppressor on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('cyber_weapons:suppressorIn', SilahHash)
    else
        exports['mythic_notify']:DoHudText('inform', 'This weapon cannot carry a suppressor!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
    end
	else	
	    exports['mythic_notify']:DoHudText('inform', 'Your soul already has a suppressor.', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end
	end, SilahHash)
end)


RegisterNetEvent('cyber_weapons:light')
AddEventHandler('cyber_weapons:light', function() 
    local ped = PlayerPedId()
    local SilahHash = GetSelectedPedWeapon(ped)
    ESX.TriggerServerCallback('cyber-inventory:getAmmoCount', function(ammoCount, suppressor, light, grip, goldtint, sight)
	if light ~= 1 then
    if table.includes(flash1, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0x359B7AAE)
        exports['mythic_notify']:DoHudText('inform', 'You put a flashlight on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('cyber_weapons:lightIn', SilahHash)
    elseif table.includes(flash2, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0x7BC4CDDC)
        exports['mythic_notify']:DoHudText('inform', 'You put a flashlight on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('cyber_weapons:lightIn', SilahHash)
    else
        exports['mythic_notify']:DoHudText('inform', 'This weapon cannot carry a flashlight!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
    end
	else	
	    exports['mythic_notify']:DoHudText('inform', 'Your soul already has a flashlight.', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end
	end, SilahHash)
end)


RegisterNetEvent('cyber_weapons:grip')
AddEventHandler('cyber_weapons:grip', function()
    local ped = PlayerPedId()
    local SilahHash = GetSelectedPedWeapon(ped) 
	
	ESX.TriggerServerCallback('cyber-inventory:getAmmoCount', function(ammoCount, suppressor, light, grip, goldtint, sight)
	if grip ~= 1 then
    if table.includes(grip1, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xC164F53)
        exports['mythic_notify']:DoHudText('inform', 'You put a grip on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('cyber_weapons:gripIn', SilahHash)
    else
        exports['mythic_notify']:DoHudText('inform', 'This weapon cannot carry a grip!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
    end	
	else	
	    exports['mythic_notify']:DoHudText('inform', 'Your soul already has a grip.', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end
	end, SilahHash)
end)

RegisterNetEvent('cyber_weapons:goldtint')
AddEventHandler('cyber_weapons:goldtint', function()
    local ped = PlayerPedId()
    local mevcutSilahHash = GetSelectedPedWeapon(ped)
	ESX.TriggerServerCallback('cyber-inventory:getAmmoCount', function(ammoCount, suppressor, light, grip, goldtint, sight)
	if goldtint ~= 1 then
        if mevcutSilahHash == GetHashKey("WEAPON_PISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You painted your weapon with pure gold!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:goldtintIn', mevcutSilahHash)
        
        elseif mevcutSilahHash == GetHashKey("WEAPON_PISTOL50") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You painted your weapon with pure gold!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:goldtintIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_APPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You painted your weapon with pure gold!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:goldtintIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You painted your weapon with pure gold!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:goldtintIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You painted your weapon with pure gold!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:goldtintIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You painted your weapon with pure gold!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:goldtintIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You painted your weapon with pure gold!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:goldtintIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You painted your weapon with pure gold!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:goldtintIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))
            exports['mythic_notify']:DoHudText('inform', 'You painted your weapon with pure gold!', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:goldtintIn', mevcutSilahHash)
        else
            exports['mythic_notify']:DoHudText('inform', 'You cannot paint this weapon.', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
        end
	else	
	        exports['mythic_notify']:DoHudText('inform', 'Your gun is already painted.', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end	
    end, mevcutSilahHash)
end)

RegisterNetEvent('cyber_weapons:sight')
AddEventHandler('cyber_weapons:sight', function()
    local ped = PlayerPedId()
    local SilahHash = GetSelectedPedWeapon(ped) 
	
	ESX.TriggerServerCallback('cyber-inventory:getAmmoCount', function(ammoCount, suppressor, light, grip, goldtint, sight)
	if sight ~= 1 then
    if table.includes(scope1, SilahHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), SilahHash, 0xA0D89C42)
        exports['mythic_notify']:DoHudText('inform', 'You put a sight on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
		TriggerServerEvent('cyber_weapons:sightIn', SilahHash)
    else
        exports['mythic_notify']:DoHudText('inform', 'This weapon cannot carry a sight!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
    end	
	else	
	    exports['mythic_notify']:DoHudText('inform', 'Your soul already has a sight.', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end
	end, SilahHash)
end)

RegisterNetEvent('cyber_weapons:extended')
AddEventHandler('cyber_weapons:extended', function()
    local ped = PlayerPedId()
    local mevcutSilahHash = GetSelectedPedWeapon(ped)
	ESX.TriggerServerCallback('cyber-inventory:getAmmoCount', function(ammoCount, suppressor, light, grip, goldtint, sight, extended)
	if extended ~= 1 then
        if mevcutSilahHash == GetHashKey("WEAPON_PISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_02"))
            exports['mythic_notify']:DoHudText('inform', 'You put a extended on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:extendedIn', mevcutSilahHash)
        
        elseif mevcutSilahHash == GetHashKey("WEAPON_PISTOL50") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_02"))
            exports['mythic_notify']:DoHudText('inform', 'You put a extended on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:extendedIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_APPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_02"))
            exports['mythic_notify']:DoHudText('inform', 'You put a extended on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:extendedIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02"))
            exports['mythic_notify']:DoHudText('inform', 'You put a extended on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:extendedIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_02"))
            exports['mythic_notify']:DoHudText('inform', 'You put a extended on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:extendedIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_02"))
            exports['mythic_notify']:DoHudText('inform', 'You put a extended on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:extendedIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02"))
            exports['mythic_notify']:DoHudText('inform', 'You put a extended on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:extendedIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"))
            exports['mythic_notify']:DoHudText('inform', 'You put a extended on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:extendedIn', mevcutSilahHash)

        elseif mevcutSilahHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_02"))
            exports['mythic_notify']:DoHudText('inform', 'You put a extended on your weapon.', 3000, { ['background-color'] = '#336600', ['color'] = '#FFFFFF' })
			TriggerServerEvent('cyber_weapons:extendedIn', mevcutSilahHash)
        else
            exports['mythic_notify']:DoHudText('inform', 'This weapon cannot carry a extended!', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
        end
	else	
	        exports['mythic_notify']:DoHudText('inform', 'Your soul already has a extended.', 6000, { ['background-color'] = '#CC0000', ['color'] = '#FFFFFF' })
	end	
    end, mevcutSilahHash)
end)


function table.includes(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end


------- Bulletproof

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('esx_armour:armour')
AddEventHandler('esx_armour:armour', function()
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
		SetPedArmour(playerPed, 100)
		end)
end)