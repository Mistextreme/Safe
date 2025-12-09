ESX = exports["es_extended"]:getSharedObject()

local serverVehicles = {}
local isSpawningVehicle = false
local isImpoundGarage = false

function RefreshVehicles(garageName, isImpound)
    print("^3[FB-Garage]^7 Requesting vehicles for garage:", garageName or "all", "- Impound:", isImpound or false)
    isImpoundGarage = isImpound or false
    
    ESX.TriggerServerCallback("fb_garage:getVehicles", function(vehicles)
        serverVehicles = vehicles
        print("^2[FB-Garage]^7 Vehicles received:", #serverVehicles)
        for i, v in pairs(serverVehicles) do
            local displayName = GetDisplayNameFromVehicleModel(v.model)
            v.name = GetLabelText(displayName) ~= "NULL" and GetLabelText(displayName) or displayName
            print("^3[FB-Garage]^7 Vehicle " .. i .. ":", v.plate, v.name, "- Origin garage:", v.garage_name)
        end
    end, garageName, isImpound)
end

CreateThread(function()
    RefreshVehicles()
end)

CreateThread(function()
    if Config.Command.use then
        RegisterCommand(Config.Command.commandName, function(source, args, rawCommand)
            TriggerEvent(Config.Command.event)
        end, false)
    end
end)

RegisterNetEvent(Config.Command.event, function()
    OpenGarage()
end)

function GetVehicleStats(modelHash)
  local maxSpeed = GetVehicleModelEstimatedMaxSpeed and GetVehicleModelEstimatedMaxSpeed(modelHash) or 0
  local acceleration = GetVehicleModelAcceleration and GetVehicleModelAcceleration(modelHash) or 0
  local braking = GetVehicleModelMaxBraking and GetVehicleModelMaxBraking(modelHash) or 0
  local traction = GetVehicleModelMaxTraction and GetVehicleModelMaxTraction(modelHash) or 0

  return {
    speed = maxSpeed * 1.25,
    accel = acceleration * 200,
    brake = braking * 100,
    susp = traction * 25
  }
end

function OpenGarage()
    if not selectedGarage then 
        print("^1[FB-Garage]^7 No garage selected, searching for the nearest garage...")
        
        local playerCoords = GetEntityCoords(PlayerPedId())
        local closestGarage = nil
        local closestDistance = 999999
        
        if garages and #garages > 0 then
            for _, garage in pairs(garages) do
                if garage and garage.garage then
                    local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, garage.garage.x, garage.garage.y, garage.garage.z)
                    if distance < closestDistance and distance < 10 then
                        closestDistance = distance
                        closestGarage = garage
                    end
                end
            end
        end
        
        if closestGarage then
            selectedGarage = closestGarage
            print("^2[FB-Garage]^7 Nearest garage found:", selectedGarage.name)
        else
            print("^1[FB-Garage]^7 No garage found nearby")
            return
        end
    end
    
    print("^2[FB-Garage]^7 Opening garage:", selectedGarage.name)
    
    local isImpound = selectedGarage.isImpound or false
    
    if isImpound then
        print("^3[FB-Garage]^7 IMPOUND mode activated - Retrieving all personal vehicles")
    end
    
    RefreshVehicles(selectedGarage.name, isImpound)
    
    Citizen.Wait(500)
    
    SetNuiFocus(true, true)

    local processedVehicles = {}
    for i, v in pairs(serverVehicles) do
        table.insert(processedVehicles, {
            id = v.id,
            name = v.name,
            model = v.model,
            plate = v.plate,
            fuel = v.fuel,
            engine = v.engine,
            body = v.body,
            stored = v.stored,
            location = v.location,
            garage_origin = v.garage_name,
            img = "https://img.flashfa.fr/file/vehicles/" .. v.model .. ".png",
            stats = GetVehicleStats(GetHashKey(v.model))
        })
    end

    print("^2[FB-Garage]^7 Number of vehicles:", #processedVehicles)

    local garageData = {
        name = selectedGarage.name,
        isImpound = isImpoundGarage,
        types = isImpoundGarage and {"Impound"} or {"Company", "Personal"}
    }

    SendNUIMessage({
        action = "open",
        vehicles = processedVehicles,
        garage = garageData
    })
end

RegisterNetEvent("fb_garage:takeout", function(id)
    if isSpawningVehicle then
        print("^1[fb_garage]^0 A vehicle is already being taken out, please wait")
        ESX.ShowNotification("~r~A vehicle is already being taken out")
        return
    end
    
    local vehicle = nil
    
    for _, v in pairs(serverVehicles) do
        if v.id == id then
            vehicle = v
            break
        end
    end
    
    if not vehicle then
        print("^1[fb_garage]^0 Vehicle not found for ID:", id)
        ESX.ShowNotification("~r~Vehicle not found")
        return
    end

    if vehicle.stored == 0 and not isImpoundGarage then
        print("^1[fb_garage]^0 Vehicle already out:", vehicle.plate)
        ESX.ShowNotification("~r~This vehicle is already out of the garage")
        return
    end

    isSpawningVehicle = true
    
    Citizen.SetTimeout(5000, function()
        if isSpawningVehicle then
            print("^3[fb_garage]^0 Automatic spawn unlock")
            isSpawningVehicle = false
        end
    end)
    
    if isImpoundGarage then
        print("^3[fb_garage]^0 Impound Mode: Searching for vehicle with plate:", vehicle.plate)
        TriggerServerEvent("fb_garage:retrieveFromImpound", id, vehicle.plate, selectedGarage.spawn)
    else
        print("^3[fb_garage]^0 Requesting vehicle takeout for ID:", id)
        TriggerServerEvent("fb_garage:takeoutVehicle", id, selectedGarage.spawn)
    end
end)

RegisterNetEvent("fb_garage:spawnVehicle")
AddEventHandler("fb_garage:spawnVehicle", function(vehicleData)
    local modelHash = GetHashKey(vehicleData.model)

    if not IsModelInCdimage(modelHash) or not IsModelAVehicle(modelHash) then
        print("^1[fb_garage]^0 Invalid model:", vehicleData.model)
        isSpawningVehicle = false
        return
    end

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(10)
    end

    local playerPed = PlayerPedId()
    local spawnCoords = vehicleData.spawnCoords
    
    local veh = CreateVehicle(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, true, false)

    if DoesEntityExist(veh) then
        SetVehicleProperties(veh, vehicleData.vehicle_data)
        SetVehicleNumberPlateText(veh, vehicleData.plate)
        SetVehicleFuelLevel(veh, vehicleData.fuel + 0.0)
        SetVehicleEngineHealth(veh, vehicleData.engine + 0.0)
        SetVehicleBodyHealth(veh, vehicleData.body + 0.0)
        SetVehicleEngineOn(veh, true, true, false)
        SetVehicleUndriveable(veh, false)
        SetPedIntoVehicle(playerPed, veh, -1)
        SetModelAsNoLongerNeeded(modelHash)

        print("^2[FB-Garage]^7 Vehicle spawned successfully:", vehicleData.model)
        
        RefreshVehicles(selectedGarage.name)
    else
        print("^1[fb_garage]^0 Error: the vehicle was not created.")
    end
    
    Citizen.SetTimeout(2000, function()
        isSpawningVehicle = false
    end)
end)

RegisterNetEvent("fb_garage:deleteVehicleByPlate")
AddEventHandler("fb_garage:deleteVehicleByPlate", function(data)
    local plate = data.plate
    local vehicleData = data.vehicleData
    
    print(string.format("^3[FB-Garage]^7 Searching for vehicle with plate: %s", plate))
    
    local vehicles = GetGamePool('CVehicle')
    local foundVehicle = nil
    
    for _, veh in ipairs(vehicles) do
        if DoesEntityExist(veh) then
            local vehPlate = GetVehicleNumberPlateText(veh)
            vehPlate = string.gsub(vehPlate, "^%s*(.-)%s*$", "%1")
            local searchPlate = string.gsub(plate, "^%s*(.-)%s*$", "%1")
            
            if vehPlate == searchPlate then
                foundVehicle = veh
                print(string.format("^2[FB-Garage]^7 Vehicle found! Entity: %s", veh))
                break
            end
        end
    end
    
    if foundVehicle then
        ESX.Game.DeleteVehicle(foundVehicle)
        print(string.format("^2[FB-Garage]^7 Vehicle %s removed from the map", plate))
        ESX.ShowNotification("~g~Vehicle retrieved from the impound")
    else
        print(string.format("^3[FB-Garage]^7 Vehicle %s not found on the map", plate))
        ESX.ShowNotification("~o~Vehicle not found on the map")
    end
    
    Citizen.Wait(500)
    TriggerEvent("fb_garage:spawnVehicleFromImpound", vehicleData)
end)

RegisterNetEvent("fb_garage:spawnVehicleFromImpound")
AddEventHandler("fb_garage:spawnVehicleFromImpound", function(vehicleData)
    local modelHash = GetHashKey(vehicleData.model)

    if not IsModelInCdimage(modelHash) or not IsModelAVehicle(modelHash) then
        print("^1[fb_garage]^0 Invalid model:", vehicleData.model)
        isSpawningVehicle = false
        return
    end

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(10)
    end

    local playerPed = PlayerPedId()
    local spawnCoords = vehicleData.spawnCoords
    
    local veh = CreateVehicle(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, true, false)

    if DoesEntityExist(veh) then
        SetVehicleProperties(veh, vehicleData.vehicle_data)
        SetVehicleNumberPlateText(veh, vehicleData.plate)
        SetVehicleFuelLevel(veh, vehicleData.fuel + 0.0)
        SetVehicleEngineHealth(veh, vehicleData.engine + 0.0)
        SetVehicleBodyHealth(veh, vehicleData.body + 0.0)
        SetVehicleEngineOn(veh, true, true, false)
        SetVehicleUndriveable(veh, false)
        SetPedIntoVehicle(playerPed, veh, -1)
        SetModelAsNoLongerNeeded(modelHash)

        print("^2[FB-Garage]^7 Vehicle spawned from impound:", vehicleData.model)
        
        RefreshVehicles(selectedGarage.name, isImpoundGarage)
    else
        print("^1[fb_garage]^0 Error: the vehicle was not created.")
    end
    
    Citizen.SetTimeout(2000, function()
        isSpawningVehicle = false
    end)
end)

RegisterNetEvent("fb_garage:notify")
AddEventHandler("fb_garage:notify", function(message, type)
    isSpawningVehicle = false
    
    if type == "error" then
        ESX.ShowNotification("~r~" .. message)
    else
        ESX.ShowNotification("~g~" .. message)
    end
    print("^2[FB-Garage]^7 " .. message)
end)


RegisterNuiCallback("close", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
    cb("ok")
end)

RegisterNuiCallback("takeout", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
    TriggerEvent("fb_garage:takeout", data.id)
    cb("ok")
end)

RegisterNetEvent("fb_garage:refreshVehicles")
AddEventHandler("fb_garage:refreshVehicles", function()
    RefreshVehicles()
end)

function ShowHelpNotification(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function Marker(type, posX, posY, posZ, text)
    DrawMarker(type, posX, posY, posZ - 0.98, 0.0, 0.0, 0.0, 90.0, 270.0, 360.0, 1.0, 1.0, 1.0, 0, 0, 0, 102)

    if text ~= nil then
        ShowHelpNotification(text)
    end
end

function KeyBoard(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end