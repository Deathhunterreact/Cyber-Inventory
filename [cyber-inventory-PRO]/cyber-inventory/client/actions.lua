isHotKeyCoolDown = false
local UsedItemSlot = nil
local SlotW  = nil
local iName = nil
local SlotQua = nil 
RegisterNUICallback('UseItem', function(data)
    UsedItemSlot = data.slot
    ESX.TriggerServerCallback('cyber-inventory:LastSlot', function(result)
        if result then
            if isWeapon(data.item.id) then
                currentWeaponSlot = data.slot
                SlotW = data.slot
                iName = data.item.id
            end
            TriggerServerEvent('cyber-inventory:notifyImpendingRemoval', data.item, 1)
            TriggerServerEvent("esx:useItem", data.item.id)
            TriggerEvent('cyber-inventory:refreshInventory')
            data.item.msg = _U('used')
            data.item.qty = 1
            TriggerEvent('cyber-inventory:showItemUse', {
                data.item
            })
        end
    end, UsedItemSlot)   
end)

RegisterNUICallback("PutIntoFast", function(data, cb)
    if data.slot ~= nil then
        fastWeapons[data.slot] = nil
    end
    fastWeapons[data.slot] = data.item.id
    loadPlayerInventory()
    cb("ok")
end)

RegisterNUICallback("TakeFromFast", function(data, cb)
    fastWeapons[data.slot] = nil
    if string.find(data.item.id, "WEAPON_", 1) ~= nil and GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(data.item.name) then
        closeInventory()
        RemoveWeapon(data.item.id)
    end
    loadPlayerInventory()
    cb("ok")
end)

local keys = {
    157, 158, 160, 164, 165
}

RegisterNetEvent('cyber-inventory:deleteSerial')
AddEventHandler('cyber-inventory:deleteSerial', function()
    Citizen.Wait(10)
    if SlotW ~= nil then
        if iName ~= nil then
            TriggerServerEvent("cyber-inventory:deleteSerial", SlotW, iName)
        end
    end
end)

RegisterNetEvent('cyber-inventory:repairqua')
AddEventHandler('cyber-inventory:repairqua', function(slot)
    Citizen.Wait(10)
    TriggerServerEvent("cyber-inventory:repair", slot)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        BlockWeaponWheelThisFrame()
        HideHudComponentThisFrame(19)
        HideHudComponentThisFrame(20)
        HideHudComponentThisFrame(17)
        DisableControlAction(0, 37, true) --Disable Tab
        for k, v in pairs(keys) do
            if IsDisabledControlJustReleased(0, v) then
                UseItem(k)
            end
        end
        if IsDisabledControlJustReleased(0, 37) then
            ESX.TriggerServerCallback('cyber-inventory:GetItemsInSlotsDisplay', function(items)
                SendNUIMessage({
                    action = 'showActionBar',
                    items = items
                })
            end)
        end
        if IsPedShooting(GetPlayerPed(-1)) then
            if SlotW ~= nil then
                if iName ~= nil then
                    ESX.TriggerServerCallback('cyber-inventory:CheckSlot', function(SlotQua)
                        if SlotQua.quality > 0 then
                            TriggerServerEvent("cyber-inventory:decrase", SlotW, iName)
                        else
                            RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(iName))
                        end
                    end, SlotW)
                end
            end
        end
    end
end)

RegisterNetEvent('cyber-inventory:bagskin')
AddEventHandler('cyber-inventory:bagskin', function(id)
    Citizen.Wait(0)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        TriggerEvent('skinchanger:change', "bags_1", 44)
        TriggerEvent('skinchanger:change', "bags_2", 0)
        TriggerServerEvent('esx_skin:save', skin)
        TriggerEvent('cyber-inventory:refreshInventory')
    end)
end)

function UseItem(slot)
    if isHotKeyCoolDown then
        return
    end
    Citizen.CreateThread(function()
        isHotKeyCoolDown = true
        Citizen.Wait(Config.HotKeyCooldown)
        isHotKeyCoolDown = false
    end)
    ESX.TriggerServerCallback('cyber-inventory:UseItemFromSlot', function(item)
        if item then
            UsedItemSlot = slot
            ESX.TriggerServerCallback('cyber-inventory:LastSlot', function()
                if isWeapon(item.id) then
                    currentWeaponSlot = slot
                    SlotW = slot
                    iName = item.id
                end
                if (item.qua > 0) then
                    TriggerServerEvent('cyber-inventory:notifyImpendingRemoval', item, 1)
                    TriggerServerEvent("esx:useItem", item.id)
                    item.msg = _U('used')
                    item.qty = 1
                    TriggerEvent('cyber-inventory:showItemUse', {
                        item,
                    })
                end
            end, UsedItemSlot)
        end
    end
    , slot)
end

RegisterNetEvent('cyber-inventory:showItemUse')
AddEventHandler('cyber-inventory:showItemUse', function(items)
    local data = {}
    for k, v in pairs(items) do
        table.insert(data, {
            item = {
                label = v.label,
                itemId = v.id
            },
            qty = v.qty,
            message = v.msg
        })
    end
    SendNUIMessage({
        action = 'itemUsed',
        alerts = data
    })
end)
