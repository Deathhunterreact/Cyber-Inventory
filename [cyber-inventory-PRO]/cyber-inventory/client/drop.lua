local serverDrops = {}
local drops = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k, v in pairs(serverDrops) do
            local dropCoords = getCoordsFromOwner(k)
            if GetDistanceBetweenCoords(dropCoords.x, dropCoords.y, dropCoords.z, coords.x, coords.y, coords.z, true) < 20 then
                if drops[k] then
                    drops[k].active = true
                else
                    drops[k] = {
                        name = k,
                        coords = dropCoords,
                        active = true
                    }
                end
            end
        end

        for k, v in pairs(drops) do
            if v.active then
                local x, y, z = table.unpack(v.coords)
                local marker = {
                    name = v.name .. '_drop',
                    type = 2,
                    coords = vector3(x, y, z + 0.5),
                    rotate = false,
                    colour = { r = 255, b = 0, g = 0 },
                    size = vector3(0.2, 0.2, 0.2),
                }
                drops[k].active = false
                TriggerEvent('cyber-inventory:registerMarker', marker)
            else
                TriggerEvent('cyber-inventory:removeMarker', v.name .. '_drop')
                drops[v.name] = nil
            end
        end
    end
end)

RegisterNetEvent('cyber-inventory:updateDrops')
AddEventHandler('cyber-inventory:updateDrops', function(newDrops)
    serverDrops = newDrops
end)