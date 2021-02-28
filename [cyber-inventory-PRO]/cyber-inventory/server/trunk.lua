Citizen.CreateThread(function()
    for k,v in pairs(Config.VehicleSlot) do
        TriggerEvent('cyber-inventory:RegisterInventory', {
            name = 'trunk-' .. k,
            label = 'Trunk',
            slots = 25,
            weight = 50
        })
    end
end)