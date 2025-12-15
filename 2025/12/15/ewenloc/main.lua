local locactu = nil
local pedcreer = {}

ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end
end)

function carrentalmenu(locationName)
    local rentalSpot = config.list[locationName]
    if not rentalSpot then return end

    locactu = {
        name = locationName,
        data = rentalSpot
    }

    local availableVehicles = {}
    for _, vehicleName in pairs(rentalSpot.vehicles) do
        table.insert(availableVehicles, {
            name = vehicleName,
            price = config.vehicles[vehicleName].price,
            image = ("https://docs.fivem.net/vehicles/%s.webp"):format(vehicleName)
        })
    end

    exports.fivem_ui:loadApplication("carrental", {
        serverName = "RedSide",
        color = {255, 255, 255},
        cars = availableVehicles
    })
end

function createPed(name, data)
    if pedcreer[name] then
        DeleteEntity(pedcreer[name])
        pedcreer[name] = nil
    end

    local hash = GetHashKey(data.model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end

    local ped = CreatePed(4, hash, data.pos.x, data.pos.y, data.pos.z - 1.0, data.heading, false, true)
    SetEntityHeading(ped, data.heading)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    if data.scenario and data.scenario.active then
        TaskStartScenarioInPlace(ped, data.scenario.name, 0, true)
    end

    pedcreer[name] = ped
    return ped
end

AddEventHandler("onClientResourceStart", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    for locationName, locationData in pairs(config.list) do
        if locationData.ped then
            createPed(locationName, {
                model = locationData.ped.model,
                pos = locationData.ped.pos,
                heading = locationData.ped.heading,
                scenario = {
                    active = true,
                    name = "WORLD_HUMAN_CLIPBOARD",
                    count = 0
                },
                weapon = {active = false},
                floatingText = {
                    active = true,
                    color = 4
                }
            })
        end
    end
end)

CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local sleep = 1000

        for locationName, locationData in pairs(config.list) do
            local markerCoords = vector3(locationData.marker.x, locationData.marker.y, locationData.marker.z)
            local distance = #(playerCoords - markerCoords)

            if distance < 10.0 then
                sleep = 0
                DrawMarker(25,
                    markerCoords.x, markerCoords.y, markerCoords.z - 1.0,
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0,
                    0.8, 0.8, 0.8,
                    255, 0, 0, 100,
                    false, false, 2, false, nil, nil, false)

                if distance < 1.5 then
                    if IsControlJustPressed(0, 38) then 
                        carrentalmenu(locationName)
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

AddEventHandler("ZgegFramework:carRental:rent", function(data)
    exports.fivem_ui:unloadApplication("carrental")

    if not locactu then return end
    
    local spawnPoint = getAvailableSpawnPoint(locactu.data.spawns)
    if not spawnPoint then
        return ESX.ShowNotification(_("RENT_NO_SPAWN_AVAILABLE"))
    end

    TriggerServerEvent("rent:rentVehicle", locactu.name, data.name, 1, spawnPoint)
    locactu = nil
end)

function pedsuppr(name)
    if pedcreer[name] then
        DeleteEntity(pedcreer[name])
        pedcreer[name] = nil
    end
end

AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    for name, _ in pairs(pedcreer) do
        pedsuppr(name)
    end
end)

print('LEAK BY MADEINLEAK')
print('DISCORD.GG/MADEINLEAK')