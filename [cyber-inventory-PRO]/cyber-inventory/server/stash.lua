Citizen.CreateThread(function()
    TriggerEvent('cyber-inventory:RegisterInventory', {
        name = 'stash',
        label = 'Depo',
        slots = 100
    })
end)

Citizen.CreateThread(function()
    TriggerEvent('cyber-inventory:RegisterInventory', {
        name = 'motel',
        label = 'Dolap',
        slots = 80
    })
end)

Citizen.CreateThread(function()
    TriggerEvent('cyber-inventory:RegisterInventory', {
        name = 'motelbed',
        label = 'Yatak Altı',
        slots = 80
    })
end)
Citizen.CreateThread(function()
    TriggerEvent('cyber-inventory:RegisterInventory', {
        name = 'cekmece',
        label = "Dolap",
        slots = 40
    })
end)

Citizen.CreateThread(function()
    TriggerEvent('cyber-inventory:RegisterInventory', {
        name = 'yatak',
        label = "Yatak Altı",
        slots = 40
    })
end)

Citizen.CreateThread(function()
    TriggerEvent('cyber-inventory:RegisterInventory', {
        name = 'utk',
        label = "Motel Çekmecesi",
        slots = 80
    })
end)