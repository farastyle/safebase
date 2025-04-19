
local ped

RegisterCommand('createCharacter', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'open' })

    ped = PlayerPedId()
end, false)

RegisterNUICallback('saveCharacter', function(data, cb)
    TriggerServerEvent('saveCharacterData', data)
    cb('ok')
    SetNuiFocus(false, false)
end)

RegisterNUICallback('changeCharacter', function(data, cb)
    local playerPed = ped
    if data.cabelo then
        SetPedComponentVariation(playerPed, 2, data.cabelo, 0, 2)
    end
    if data.olhos then
        SetPedEyeColor(playerPed, data.olhos)
    end
    if data.peso then
        SetEntityHealth(playerPed, 100 + data.peso)
    end
    if data.altura then
        SetEntityScale(playerPed, data.altura)
    end
    cb('ok')
end)

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)
