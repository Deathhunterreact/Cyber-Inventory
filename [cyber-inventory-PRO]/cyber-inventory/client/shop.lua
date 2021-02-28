local shopSecondaryInventory = {
    type = 'shop',
    owner = ''
}

Citizen.CreateThread(function()
    for k, v in pairs(Config.Shops) do
        if v.enableBlip then
            for val, coords in pairs(v.coords) do
                local blip = {
                    name = k,
                    coords = coords,
                    colour = v.blipColour or 3,
                    scale = v.blipScale or 0.65,
                    sprite = v.blipSprite or 52
                }
                TriggerEvent('cyber-inventory:registerBlip', blip)
            end
        end
    end
end)

------------------------------- PARA CREAR NUEVAS TIENDAS ---------------------------------
Citizen.CreateThread(function()
    for k, v in pairs(Config.Shops) do
        if v.weaponBlip then
            for val, coords in pairs(v.coords) do
                local blip = {
                    name = k,
                    coords = coords,
                    colour = v.blipColour or 1,
                    scale = v.blipScale or 0.65,
                    sprite = v.blipSprite or 110
                }
                TriggerEvent('cyber-inventory:registerBlip', blip)
            end
        end
    end
end)

----------------------------------------------------------------------------

Citizen.CreateThread(function()
    while not ESXLoaded do
        Citizen.Wait(1000)
    end
    for k, v in pairs(Config.Shops) do
        for val, coords in pairs(v.coords) do
            local marker = {
                name = k .. val,
                coords = coords,
                type = v.markerType or 1,
                colour = v.markerColour or { r = 55, b = 255, g = 55 },
                size = v.size or vector3(1.0, 1.0, 1.0),
                action = function()
                    shopSecondaryInventory.owner = k
                    openInventory(shopSecondaryInventory)
                end,
                shouldDraw = function()
                    return ESX.PlayerData.job.name == v.job or v.job == 'all'
                end,
                msg = v.msg or _U('keyshop'),
                show3D = v.show3D or false,
            }
            TriggerEvent('cyber-inventory:registerMarker', marker)
        end
    end
end)

RegisterNetEvent('cyber-inventory:shop')
AddEventHandler('cyber-inventory:shop', function(ow)
    local Shop = { type = 'shop', owner = ow }
    openInventory(Shop)
end)
