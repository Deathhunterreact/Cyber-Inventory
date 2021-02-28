Citizen.CreateThread(function()
    TriggerEvent('cyber-inventory:RegisterInventory', {
        name = 'glovebox',
        label = _U('glove'),
        slots = 5,
		weight = 15
    })
end)
