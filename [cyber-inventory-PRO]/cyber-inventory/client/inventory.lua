secondInventory = nil

RegisterNUICallback('MoveToEmpty', function(data, cb)
    TriggerServerEvent('cyber-inventory:MoveToEmpty', data)
    TriggerEvent('cyber-inventory:MoveToEmpty', data)
    cb('OK')
end)

RegisterNUICallback('EmptySplitStack', function(data, cb)
    TriggerServerEvent('cyber-inventory:EmptySplitStack', data)
    TriggerEvent('cyber-inventory:EmptySplitStack', data)
    cb('OK')
end)

RegisterNUICallback('SplitStack', function(data, cb)
    TriggerServerEvent('cyber-inventory:SplitStack', data)
    TriggerEvent('cyber-inventory:SplitStack', data)
    cb('OK')
end)

RegisterNUICallback('CombineStack', function(data, cb)
    TriggerServerEvent('cyber-inventory:CombineStack', data)
    TriggerEvent('cyber-inventory:CombineStack', data)
    cb('OK')
end)

RegisterNUICallback('TopoffStack', function(data, cb)
    TriggerServerEvent('cyber-inventory:TopoffStack', data)
    TriggerEvent('cyber-inventory:TopoffStack', data)
    cb('OK')
end)

RegisterNUICallback('SwapItems', function(data, cb)
    TriggerServerEvent('cyber-inventory:SwapItems', data)
    TriggerEvent('cyber-inventory:SwapItems', data)
    cb('OK')
end)

RegisterNUICallback('GiveItem', function(data, cb)
    TriggerServerEvent('cyber-inventory:GiveItem', data)
    cb('OK')
    closeInventory()
    Citizen.Wait(500)
    openInventory()
end)

RegisterNUICallback('GiveCash', function(data, cb)
    TriggerServerEvent('cyber-inventory:GiveCash', data)
    cb('OK')
end)

RegisterNUICallback('CashStore', function(data, cb)
    TriggerServerEvent('cyber-inventory:CashStore', data)
    cb('OK')
end)

RegisterNUICallback('CashTake', function(data, cb)
    TriggerServerEvent('cyber-inventory:CashTake', data)
    cb('OK')
end)

RegisterNUICallback('GetNearPlayers', function(data, cb)
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
    local foundPlayers = false
    local nearplayers = {}
    local elements = {}

    for i = 1, #players, 1 do
        if players[i] ~= PlayerId() then
            foundPlayers = true
            table.insert(nearplayers, {id = GetPlayerServerId(players[i])})
        end
    end

    ESX.TriggerServerCallback("getplayers", function(playerss)
        if data.action == 'give' then
            SendNUIMessage({
                action = "nearPlayersGive",
                players = playerss,
                originItem = data.originItem
            })
        end
        if data.action == 'pay' then
            SendNUIMessage({
                action = "nearPlayersPay",
                players = playerss,
                originItem = data.originItem
            })
        end
        cb('OK')
    end, nearplayers)
end)

function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 2.0)

    local nearplayers = {}
    local found_players = false

    for i = 1, #players, 1 do
        if players[i] ~= PlayerId() then
            foundPlayers = true
            table.insert(nearplayers, {id = GetPlayerServerId(players[i])})
        end
    end
    return nearplayers
end

RegisterNetEvent('cyber-inventory:refreshInventory')
AddEventHandler('cyber-inventory:refreshInventory', function()
    Citizen.Wait(10)
    refreshPlayerInventory()
    if secondInventory ~= nil then
        refreshSecondaryInventory()
    end
    SendNUIMessage({
        action = "unlock"
    })
end)

function refreshPlayerInventory()
    ESX.TriggerServerCallback('cyber-inventory:getPlayerInventory', function(data)
    	ESX.TriggerServerCallback('GetCharacterNameServer', function(playerss)
        	local playerss = playerss ..  "  ("  .. GetPlayerServerId(GetPlayerIndex()) .. ")"
        	SendNUIMessage(
                { action = "setItems",
                  itemList = data.inventory,
                  invOwner = data.invId,
				  LabelName = data.labeln,
                  CharName = data.charn,
                  QualityList = data.listq,
                  SerialList = data.lists,
                  invTier = data.invTier,
                  plyId = playerss,
                  money = {
                      cash = data.cash,
                      bank = data.bank,
                      black_money = data.black_money
                  	}
                }
        	)
        	TriggerServerEvent('cyber-inventory:openInventory', {
            	type = 'player',
            	owner = ESX.GetPlayerData().identifier
        	})
        end)
    end, 'player', ESX.GetPlayerData().identifier)
end

function refreshSecondaryInventory()
    ESX.TriggerServerCallback('cyber-inventory:canOpenInventory', function(canOpen)
        if true or secondInventory.type == 'shop' then
            ESX.TriggerServerCallback('cyber-inventory:getSecondaryInventory', function(data)
                SendNUIMessage(
                        { action = "setSecondInventoryItems",
                          itemList = data.inventory,
                          invOwner = data.invId,
                          invTier = data.invTier,
                          money = {
                              cash = data.cash,
                              black_money = data.black_money
                          }
                        }
                )
                SendNUIMessage(
                        {
                            action = "show",
                            type = 'secondary'
                        }
                )
                TriggerServerEvent('cyber-inventory:openInventory', secondInventory)
            end, secondInventory.type, secondInventory.owner)
        else
            SendNUIMessage(
                    {
                        action = "hide",
                        type = 'secondary'
                    }
            )
        end
    end, secondInventory.type, secondInventory.owner)
end

function closeInventory()
    isInInventory = false
    SendNUIMessage({ action = "hide", type = 'primary' })
    SetNuiFocus(false, false)
    TriggerServerEvent('cyber-inventory:closeInventory', {
        type = 'player',
        owner = ESX.GetPlayerData().identifier
    })
    if secondInventory ~= nil then
        TriggerServerEvent('cyber-inventory:closeInventory', secondInventory)
    end
end

RegisterNetEvent('cyber-inventory:openInventory')
AddEventHandler('cyber-inventory:openInventory', function(sI)
    openInventory(sI)
end)

function openInventory(_secondInventory)
    isInInventory = true
    refreshPlayerInventory()
    SendNUIMessage({
        action = "display",
        type = "normal"
    })
    if _secondInventory ~= nil then
        secondInventory = _secondInventory
        refreshSecondaryInventory()
        SendNUIMessage({
            action = "display",
            type = 'secondary'
        })
        if _secondInventory.seize then
            SendNUIMessage({
                action = "showSeize"
            })
        end
        if _secondInventory.steal then
            SendNUIMessage({
                action = "showSteal"
            })
        end
    end
    SetNuiFocus(true, true)
end

RegisterNetEvent("cyber-inventory:MoveToEmpty")
AddEventHandler("cyber-inventory:MoveToEmpty", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent("cyber-inventory:EmptySplitStack")
AddEventHandler("cyber-inventory:EmptySplitStack", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent("cyber-inventory:TopoffStack")
AddEventHandler("cyber-inventory:TopoffStack", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent("cyber-inventory:SplitStack")
AddEventHandler("cyber-inventory:SplitStack", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent("cyber-inventory:CombineStack")
AddEventHandler("cyber-inventory:CombineStack", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent("cyber-inventory:SwapItems")
AddEventHandler("cyber-inventory:SwapItems", function(data)
    playPickupOrDropAnimation(data)
    playStealOrSearchAnimation(data)
end)

RegisterNetEvent('cyber-inventory:bag')
AddEventHandler('cyber-inventory:bag', function()
    ESX.TriggerServerCallback('cyber-inventory:GetLastSlot', function(slot)
        ESX.TriggerServerCallback('cyber-inventory:getUniq', function(uniq)
            TriggerEvent('cyber-inventory:openInventory', {
                type = 'bag',
                owner = uniq,
                slots = 20,
            })
        end, slot) 
    end) 
end)

function playPickupOrDropAnimation(data)
    if data.originTier.name == 'drop' or data.destinationTier.name == 'drop' then
        local playerPed = GetPlayerPed(-1)
        if not IsEntityPlayingAnim(playerPed, 'random@domestic', 'pickup_low', 3) then
            ESX.Streaming.RequestAnimDict('random@domestic', function()
                TaskPlayAnim(playerPed, 'random@domestic', 'pickup_low', 8.0, -8, -1, 48, 0, 0, 0, 0)
            end)
        end
    end
end

function playStealOrSearchAnimation(data)
    if data.originTier.name == 'player' and data.destinationTier.name == 'player' then
        local playerPed = GetPlayerPed(-1)
        if not IsEntityPlayingAnim(playerPed, 'random@mugging4', 'agitated_loop_a', 3) then
            ESX.Streaming.RequestAnimDict('random@mugging4', function()
            end)
        end
    end
end


