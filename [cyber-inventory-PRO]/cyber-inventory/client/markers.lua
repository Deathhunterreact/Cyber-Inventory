local markers = {}
local CurrentMarker = nil
local blips = {}

local HasAlreadyEnteredMarker


RegisterNetEvent('cyber-inventory:registerMarker')
AddEventHandler('cyber-inventory:registerMarker', function(marker)
    if marker.coords == nil then
        print('Needs Coords for marker')
        return
    end
    if marker.shouldDraw == nil then
        marker.shouldDraw = function()
            return true
        end
    end

    if marker.command then
        RegisterCommand(marker.command.key, function(src, args, raw)
            local command = marker.command.key
            if args and marker.command.args then
                command = command .. ' ' .. marker.command.args
            end
            if raw == command then
                TriggerEvent('cyber-inventory:triggerCurrentMarkerAction')
            end
        end)
    end

    if markers[marker.name] then
        markers[marker.name] = marker
    else
        markers[getOrElse(marker.name, #markers + 1)] = marker
    end

end)

RegisterNetEvent('cyber-inventory:removeMarker')
AddEventHandler('cyber-inventory:removeMarker', function(name)
    markers[name] = nil
end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local isInMarker = false
        local lastMarker
        for k, v in pairs(markers) do
            local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.coords.x, v.coords.y, v.coords.z, true)
            if distance < Config.DrawDistance and v.shouldDraw() then
                if v.show3D then
                    if distance < Config.Draw3DDistance then
                        DrawText3D(v.coords.x, v.coords.y, v.coords.z, v.msg)
                    end
                elseif v.type ~= -1 then
                    DrawMarker(v.type, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.size.x, v.size.y, v.size.z, v.colour.r, v.colour.g, v.colour.b, 100, getOrElse(v.bob, false), true, 2, getOrElse(v.rotate, true), false, false, false)
                end
                if distance < v.size.x then
                    if v.enableE then
                        EnableControlAction(0, 38)
                    end
                    isInMarker = true
                    lastMarker = v
                end
            end
        end

        if isInMarker and not HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = true
            TriggerEvent('cyber-inventory:hasEnteredMarker', lastMarker)
        end
        if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('cyber-inventory:hasExitedMarker')
        end
    end

end)

AddEventHandler('cyber-inventory:hasExitedMarker', function()
    CurrentMarker = nil
    ESX.UI.Menu.CloseAll()
end)

AddEventHandler('cyber-inventory:hasEnteredMarker', function(marker)
    if marker.show3D then
        PlaySound(GetSoundId(), "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    end
    CurrentMarker = marker
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if CurrentMarker and CurrentMarker.shouldDraw() then
            if not CurrentMarker.show3D and CurrentMarker.msg then
                ESX.ShowHelpNotification(CurrentMarker.msg)
            end

            if IsControlJustReleased(0, 38) then
                if CurrentMarker.action ~= nil then
                    CurrentMarker.action(CurrentMarker)
                end
            end
        end
    end
end)

RegisterNetEvent('cyber-inventory:triggerCurrentMarkerAction')
AddEventHandler('cyber-inventory:triggerCurrentMarkerAction', function()
    if CurrentMarker and CurrentMarker.action ~= nil then
        CurrentMarker.action(CurrentMarker)
    end
end)

RegisterNetEvent('cyber-inventory:registerBlip')
AddEventHandler('cyber-inventory:registerBlip', function(blip)

    if blip.coords == nil then
        print("Coords needed for Blip")
        return
    end

    local _blip = AddBlipForCoord(blip.coords)
    SetBlipSprite(_blip, getOrElse(blip.sprite, 1))
    SetBlipAsShortRange(_blip, true)
    SetBlipDisplay(_blip, getOrElse(blip.display, 4))

    if blip.scale then
        SetBlipScale(_blip, getOrElse(blip.scale, 0.5))
    end
    SetBlipColour(_blip, getOrElse(blip.colour, 1))
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(getOrElse(blip.name, "Blip Missing Name"))
    EndTextCommandSetBlipName(_blip)
    blips[getOrElse(blip.id, #blips + 1)] = {
        _blip = _blip,
        blip = blip
    }
end)

RegisterNetEvent('cyber-inventory:updateBlip')
AddEventHandler('cyber-inventory:updateBlip', function(blip, debug)
    if blip.id == nil or blips[blip.id] == nil then
        return
    end
    local _blip = blips[blip.id]._blip

    if blip.coords then

        if _blip and GetBlipCoords(_blip) ~= blip.coords then
            RemoveBlip(_blip)
            local tempBlip = blips[blip.id].blip
            blips[blip.id] = nil
            tempBlip.coords = blip.coords
            tempBlip.display = blip.display
            TriggerEvent('cyber-inventory:registerBlip', tempBlip)
            return
        end

    end

    if blip.sprite then
        SetBlipSprite(_blip, blip.sprite)
    end
    if blip.display then
        SetBlipDisplay(_blip, blip.display)
    end
    if blip.scale then
        SetBlipScale(_blip, getOrElse(blip.scale, 0.5))
    end
    if blip.colour then
        SetBlipScale(_blip, blip.colour)
    end
    if blip.name then
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blip.name)
        EndTextCommandSetBlipName(_blip)
    end
end)
