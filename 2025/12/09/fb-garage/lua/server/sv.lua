ESX = exports["es_extended"]:getSharedObject()

local vehicleSpawnCooldown = {}

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        MySQL.execute([[
            CREATE TABLE IF NOT EXISTS `garages` (
                `name` VARCHAR(255) NOT NULL,
                `garageCoords` TEXT NOT NULL,
                `spawnCoords` TEXT NOT NULL,
                `rangerCoords` TEXT NOT NULL,
                `jobs` TEXT NOT NULL,
                `isImpound` BOOLEAN DEFAULT FALSE
            );
        ]], {}, function()
            print("^2[MySQL]^7 Table 'garages' checked/created successfully.")
            
            MySQL.execute("SELECT COUNT(*) as count FROM `garages`", {}, function(result)
                if result[1].count == 0 then
                    local defaultGarages = {
                        {
                            name = "Central Garage",
                            garageCoords = {x = 216.685715, y = -809.775818, z = 30.712036},
                            spawnCoords = {x = 219.890106, y = -785.195618, z = 30.779541},
                            rangerCoords = {x = 214.123456, y = -815.654321, z = 30.712036},
                            jobs = {"police", "mecano"}
                        },
                        {
                            name = "Ambulance Garage",
                            garageCoords = {x = 231.837372, y = -786.870300, z = 30.644653},
                            spawnCoords = {x = 225.613190, y = -765.876892, z = 30.796387},
                            rangerCoords = {x = 235.123456, y = -790.654321, z = 30.644653},
                            jobs = {"ambulance"}
                        }
                    }
                    
                    for _, garage in pairs(defaultGarages) do
                        MySQL.execute("INSERT INTO `garages` (name, garageCoords, spawnCoords, rangerCoords, jobs) VALUES (?, ?, ?, ?, ?)", {
                            garage.name,
                            json.encode(garage.garageCoords),
                            json.encode(garage.spawnCoords),
                            json.encode(garage.rangerCoords),
                            json.encode(garage.jobs)
                        })
                    end
                    print("^2[FB-Garage]^7 Default garages added to the database")
                else
                    print("^2[FB-Garage]^7 " .. result[1].count .. " garages found in the database")
                end
            end)
        end)

        MySQL.execute([[
            CREATE TABLE IF NOT EXISTS `garage_vehicles` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `owner` VARCHAR(255) NOT NULL,
                `plate` VARCHAR(255) NOT NULL UNIQUE,
                `model` VARCHAR(255) NOT NULL,
                `garage_name` VARCHAR(255) NOT NULL,
                `vehicle_data` LONGTEXT NOT NULL,
                `state` INT DEFAULT 1,
                `fuel` INT DEFAULT 100,
                `engine` INT DEFAULT 1000,
                `body` INT DEFAULT 1000,
                `stored` BOOLEAN DEFAULT TRUE,
                `location` VARCHAR(255) DEFAULT 'Company',
                `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            );
        ]], {}, function()
            print("^2[MySQL]^7 Table 'garage_vehicles' checked/created successfully.")
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)
        local currentTime = os.time()
        for identifier, timestamp in pairs(vehicleSpawnCooldown) do
            if (currentTime - timestamp) > 300 then
                vehicleSpawnCooldown[identifier] = nil
            end
        end
    end
end)

ESX.RegisterServerCallback("fb_garage:getGarages", function(source, cb)
    MySQL.execute("SELECT * FROM `garages`", {}, function(garages)
        local processedGarages = {}
        for i, garage in ipairs(garages) do
            local garageData = {
                id = i,
                name = garage.name,
                garage = json.decode(garage.garageCoords),
                spawn = json.decode(garage.spawnCoords),
                ranger = json.decode(garage.rangerCoords) or {},
                jobs = json.decode(garage.jobs),
                isImpound = garage.isImpound or false
            }
            table.insert(processedGarages, garageData)
        end
        cb(processedGarages)
    end)
end)

ESX.RegisterServerCallback("fb_garage:getVehicles", function(source, cb, garageName, isImpound)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return cb({}) end
    
    if isImpound then
        local query = "SELECT * FROM `garage_vehicles` WHERE `owner` = ? AND `stored` = 0 AND `location` = 'Personal'"
        MySQL.execute(query, {xPlayer.identifier}, function(vehicles)
            local processedVehicles = {}
            for _, vehicle in ipairs(vehicles) do
                local vehicleData = {
                    id = vehicle.id,
                    plate = vehicle.plate,
                    model = vehicle.model,
                    garage_name = vehicle.garage_name,
                    vehicle_data = json.decode(vehicle.vehicle_data),
                    state = vehicle.state,
                    fuel = vehicle.fuel,
                    engine = vehicle.engine,
                    body = vehicle.body,
                    stored = vehicle.stored,
                    location = "Impound"
                }
                table.insert(processedVehicles, vehicleData)
            end
            print(string.format("^3[FB-Garage Impound]^7 %d vehicles found for %s", #processedVehicles, xPlayer.getName()))
            cb(processedVehicles)
        end)
        return
    end
    
    local query = "SELECT * FROM `garage_vehicles` WHERE `owner` = ?"
    local params = {xPlayer.identifier}
    
    if garageName then
        query = query .. " AND `garage_name` = ?"
        table.insert(params, garageName)
    end
    
    MySQL.execute(query, params, function(vehicles)
        local processedVehicles = {}
        for _, vehicle in ipairs(vehicles) do
            local vehicleData = {
                id = vehicle.id,
                plate = vehicle.plate,
                model = vehicle.model,
                garage_name = vehicle.garage_name,
                vehicle_data = json.decode(vehicle.vehicle_data),
                state = vehicle.state,
                fuel = vehicle.fuel,
                engine = vehicle.engine,
                body = vehicle.body,
                stored = vehicle.stored,
                location = vehicle.location or "Company"
            }
            table.insert(processedVehicles, vehicleData)
        end
        cb(processedVehicles)
    end)
end)

RegisterNetEvent("fb_garage:addGarage")
AddEventHandler("fb_garage:addGarage", function(garageData)
    local source = source
    MySQL.execute("INSERT INTO `garages` (name, garageCoords, spawnCoords, rangerCoords, jobs, isImpound) VALUES (?, ?, ?, ?, ?, ?)", {
        garageData.name,
        json.encode(garageData.garage),
        json.encode(garageData.spawn),
        json.encode(garageData.ranger or {}),
        json.encode(garageData.jobs),
        false
    }, function(result)
        if result then
            TriggerClientEvent("fb_garage:refreshGarages", -1)
            print("^2[FB-Garage]^7 New garage added: " .. garageData.name)
        end
    end)
end)

RegisterNetEvent("fb_garage:addImpound")
AddEventHandler("fb_garage:addImpound", function(impoundData)
    local source = source
    MySQL.execute("INSERT INTO `garages` (name, garageCoords, spawnCoords, rangerCoords, jobs, isImpound) VALUES (?, ?, ?, ?, ?, ?)", {
        impoundData.name,
        json.encode(impoundData.garage),
        json.encode(impoundData.spawn),
        json.encode({}),
        json.encode({}),
        true
    }, function(result)
        if result then
            TriggerClientEvent("fb_garage:refreshGarages", -1)
            print("^2[FB-Garage]^7 New impound added: " .. impoundData.name)
        end
    end)
end)

RegisterNetEvent("fb_garage:updateImpound")
AddEventHandler("fb_garage:updateImpound", function(impoundData)
    local source = source
    MySQL.execute("UPDATE `garages` SET garageCoords = ?, spawnCoords = ? WHERE name = ?", {
        json.encode(impoundData.garage),
        json.encode(impoundData.spawn),
        impoundData.name
    }, function(result)
        if result then
            TriggerClientEvent("fb_garage:refreshGarages", -1)
            print("^2[FB-Garage]^7 Impound updated: " .. impoundData.name)
        end
    end)
end)

RegisterNetEvent("fb_garage:storeVehicle")
AddEventHandler("fb_garage:storeVehicle", function(vehicleData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    MySQL.execute("SELECT * FROM `owned_vehicles` WHERE `plate` = ? AND `owner` = ?", {
        vehicleData.plate,
        xPlayer.identifier
    }, function(ownedResult)
        local location = "Company"
        
        if ownedResult and #ownedResult > 0 then
            location = "Personal"
            print(string.format("^2[FB-Garage]^7 Personal vehicle detected: %s", vehicleData.plate))
        else
            print(string.format("^3[FB-Garage]^7 Company vehicle: %s", vehicleData.plate))
        end
        
        MySQL.execute("UPDATE `garage_vehicles` SET `vehicle_data` = ?, `state` = ?, `fuel` = ?, `engine` = ?, `body` = ?, `stored` = 1, `garage_name` = ?, `location` = ? WHERE `plate` = ? AND `owner` = ?", {
            json.encode(vehicleData.vehicle_data),
            vehicleData.state or 1,
            vehicleData.fuel or 100,
            vehicleData.engine or 1000,
            vehicleData.body or 1000,
            vehicleData.garage_name,
            location,
            vehicleData.plate,
            xPlayer.identifier
        }, function(result)
            if result.affectedRows > 0 then
                TriggerClientEvent("fb_garage:notify", source, "Vehicle successfully stored in " .. location, "success")
                print(string.format("^2[FB-Garage]^7 Vehicle %s stored in %s", vehicleData.plate, location))
            else
                MySQL.execute("INSERT INTO `garage_vehicles` (owner, plate, model, garage_name, vehicle_data, state, fuel, engine, body, stored, location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", {
                    xPlayer.identifier,
                    vehicleData.plate,
                    vehicleData.model or "unknown",
                    vehicleData.garage_name,
                    json.encode(vehicleData.vehicle_data),
                    vehicleData.state or 1,
                    vehicleData.fuel or 100,
                    vehicleData.engine or 1000,
                    vehicleData.body or 1000,
                    1,
                    location
                }, function(insertResult)
                    if insertResult.insertId then
                        TriggerClientEvent("fb_garage:notify", source, "Vehicle added and stored in " .. location, "success")
                        print(string.format("^2[FB-Garage]^7 New vehicle %s added to %s", vehicleData.plate, location))
                    else
                        TriggerClientEvent("fb_garage:notify", source, "Error while storing", "error")
                    end
                end)
            end
        end)
    end)
end)

RegisterNetEvent("fb_garage:takeoutVehicle")
AddEventHandler("fb_garage:takeoutVehicle", function(vehicleId, spawnCoords)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    local playerIdentifier = xPlayer.identifier
    if vehicleSpawnCooldown[playerIdentifier] and (os.time() - vehicleSpawnCooldown[playerIdentifier]) < 3 then
        TriggerClientEvent("fb_garage:notify", source, "Please wait before taking out another vehicle", "error")
        print(string.format("^1[FB-Garage]^7 Cooldown active for %s", xPlayer.getName()))
        return
    end
    
    MySQL.execute("SELECT * FROM `garage_vehicles` WHERE `id` = ? AND `owner` = ? AND `stored` = 1", {vehicleId, xPlayer.identifier}, function(result)
        if result[1] then
            local vehicle = result[1]
            
            MySQL.execute("UPDATE `garage_vehicles` SET `stored` = 0 WHERE `id` = ?", {vehicleId})
            
            vehicleSpawnCooldown[playerIdentifier] = os.time()
            
            TriggerClientEvent("fb_garage:spawnVehicle", source, {
                model = vehicle.model,
                plate = vehicle.plate,
                vehicle_data = json.decode(vehicle.vehicle_data),
                fuel = vehicle.fuel,
                engine = vehicle.engine,
                body = vehicle.body,
                spawnCoords = spawnCoords
            })
            
            print(string.format("^2[FB-Garage]^7 Vehicle %s (ID: %s) taken out by %s", vehicle.model, vehicleId, xPlayer.getName()))
        else
            TriggerClientEvent("fb_garage:notify", source, "Vehicle not found or already out", "error")
            print(string.format("^1[FB-Garage]^7 Attempt to take out an invalid vehicle (ID: %s) by %s", vehicleId, xPlayer.getName()))
        end
    end)
end)

RegisterNetEvent("fb_garage:retrieveFromImpound")
AddEventHandler("fb_garage:retrieveFromImpound", function(vehicleId, plate, spawnCoords)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    local playerIdentifier = xPlayer.identifier
    if vehicleSpawnCooldown[playerIdentifier] and (os.time() - vehicleSpawnCooldown[playerIdentifier]) < 3 then
        TriggerClientEvent("fb_garage:notify", source, "Please wait before taking out another vehicle", "error")
        return
    end
    
    MySQL.execute("SELECT * FROM `garage_vehicles` WHERE `id` = ? AND `owner` = ? AND `stored` = 0", {vehicleId, xPlayer.identifier}, function(result)
        if result[1] then
            local vehicle = result[1]
            
            vehicleSpawnCooldown[playerIdentifier] = os.time()
            
            TriggerClientEvent("fb_garage:deleteVehicleByPlate", source, {
                plate = plate,
                vehicleData = {
                    model = vehicle.model,
                    plate = vehicle.plate,
                    vehicle_data = json.decode(vehicle.vehicle_data),
                    fuel = vehicle.fuel,
                    engine = vehicle.engine,
                    body = vehicle.body,
                    spawnCoords = spawnCoords
                }
            })
            
            print(string.format("^2[FB-Garage]^7 Vehicle %s retrieved from the impound by %s (remains out, stored=0)", vehicle.model, xPlayer.getName()))
        else
            TriggerClientEvent("fb_garage:notify", source, "Vehicle not found", "error")
            print(string.format("^1[FB-Garage]^7 Invalid retrieval attempt (ID: %s) by %s", vehicleId, xPlayer.getName()))
        end
    end)
end)

RegisterNetEvent("fb_garage:addVehicle")
AddEventHandler("fb_garage:addVehicle", function(vehicleData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    MySQL.execute("INSERT INTO `garage_vehicles` (owner, plate, model, garage_name, vehicle_data, state, fuel, engine, body, stored) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", {
        xPlayer.identifier,
        vehicleData.plate,
        vehicleData.model,
        vehicleData.garage_name,
        json.encode(vehicleData.vehicle_data),
        vehicleData.state or 1,
        vehicleData.fuel or 100,
        vehicleData.engine or 1000,
        vehicleData.body or 1000,
        vehicleData.stored or 1
    }, function(result)
        if result.insertId then
            TriggerClientEvent("fb_garage:notify", source, "Vehicle added successfully", "success")
            TriggerClientEvent("fb_garage:refreshVehicles", source)
        else
            TriggerClientEvent("fb_garage:notify", source, "Error while adding", "error")
        end
    end)
end)

RegisterNetEvent("fb_garage:deleteGarage")
AddEventHandler("fb_garage:deleteGarage", function(garageName)
    local source = source
    MySQL.execute("DELETE FROM `garages` WHERE name = ?", {garageName}, function(result)
        if result then
            TriggerClientEvent("fb_garage:refreshGarages", -1)
            print("^2[FB-Garage]^7 Garage deleted: " .. garageName)
        end
    end)
end)

RegisterNetEvent("fb_garage:updateGarage")
AddEventHandler("fb_garage:updateGarage", function(garageData)
    local source = source
    MySQL.execute("UPDATE `garages` SET garageCoords = ?, spawnCoords = ?, rangerCoords = ?, jobs = ? WHERE name = ?", {
        json.encode(garageData.garage),
        json.encode(garageData.spawn),
        json.encode(garageData.ranger or {}),
        json.encode(garageData.jobs),
        garageData.name
    }, function(result)
        if result.affectedRows > 0 then
            TriggerClientEvent("fb_garage:refreshGarages", -1)
            print("^2[FB-Garage]^7 Garage updated: " .. garageData.name)
        end
    end)
end)

RegisterCommand("givevehicle", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    if #args < 1 then
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"[FB-Garage]", "Usage: /givevehicle [model] [garage_name] [location]"}
        })
        return
    end
    
    local model = args[1]
    local garageName = args[2] or "Central Garage"
    local location = args[3] or "Company"
    
    local function generatePlate()
        local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        local plate = ""
        for i = 1, 8 do
            local rand = math.random(#chars)
            plate = plate .. chars:sub(rand, rand)
        end
        return plate
    end
    
    local plate = generatePlate()
    
    local defaultVehicleData = {
        model = GetHashKey(model),
        plate = plate,
        plateIndex = 0,
        bodyHealth = 1000.0,
        engineHealth = 1000.0,
        tankHealth = 1000.0,
        fuelLevel = 100.0,
        dirtLevel = 0.0,
        color1 = 0,
        color2 = 0,
        pearlescentColor = 0,
        wheelColor = 0,
        wheels = 0,
        windowTint = 0,
        xenonColor = 8,
        customPrimaryColor = {},
        customSecondaryColor = {},
        smokeColor = {},
        livery = -1,
        tyreBurst = {},
        windowsBroken = {},
        doorsBroken = {},
        extras = {},
        neonEnabled = {[0] = false, [1] = false, [2] = false, [3] = false},
        neonColor = {},
        interiorColor = 0,
        dashboardColor = 0,
        modSpoilers = -1,
        modFrontBumper = -1,
        modRearBumper = -1,
        modSideSkirt = -1,
        modExhaust = -1,
        modFrame = -1,
        modGrille = -1,
        modHood = -1,
        modFender = -1,
        modRightFender = -1,
        modRoof = -1,
        modEngine = -1,
        modBrakes = -1,
        modTransmission = -1,
        modHorns = -1,
        modSuspension = -1,
        modArmor = -1,
        modTurbo = false,
        modSmokeEnabled = false,
        modXenon = false,
        modFrontWheels = -1,
        modBackWheels = -1,
        modPlateHolder = -1,
        modVanityPlate = -1,
        modTrimA = -1,
        modOrnaments = -1,
        modDashboard = -1,
        modDial = -1,
        modDoorSpeaker = -1,
        modSeats = -1,
        modSteeringWheel = -1,
        modShifterLeavers = -1,
        modAPlate = -1,
        modSpeakers = -1,
        modTrunk = -1,
        modHydrolic = -1,
        modEngineBlock = -1,
        modAirFilter = -1,
        modStruts = -1,
        modArchCover = -1,
        modAerials = -1,
        modTrimB = -1,
        modTank = -1,
        modWindows = -1,
        modLivery2 = -1
    }
    
    MySQL.execute("INSERT INTO `garage_vehicles` (owner, plate, model, garage_name, vehicle_data, state, fuel, engine, body, stored, location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", {
        xPlayer.identifier,
        plate,
        model,
        garageName,
        json.encode(defaultVehicleData),
        1,
        100,
        1000,
        1000,
        1,
        location
    }, function(result)
        if result.insertId then
            TriggerClientEvent("chat:addMessage", source, {
                color = {0, 255, 0},
                multiline = true,
                args = {"[FB-Garage]", string.format("Vehicle %s added with plate %s in %s (%s)", model, plate, garageName, location)}
            })
            
            print(string.format("^2[FB-Garage]^7 Vehicle %s given to %s (plate: %s, garage: %s, location: %s)", model, xPlayer.getName(), plate, garageName, location))
        else
            TriggerClientEvent("chat:addMessage", source, {
                color = {255, 0, 0},
                multiline = true,
                args = {"[FB-Garage]", "Error while adding the vehicle to the database"}
            })
        end
    end)
    
end, false)

RegisterCommand("giveveh2", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    if #args < 1 then
        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 0, 0},
            multiline = true,
            args = {"[FB-Garage]", "Usage: /giveveh2 [model] [garage_name]"}
        })
        return
    end
    
    local model = args[1]
    local garageName = args[2] or "Central Garage"
    
    local function generatePlate()
        local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        local plate = ""
        for i = 1, 8 do
            local rand = math.random(#chars)
            plate = plate .. chars:sub(rand, rand)
        end
        return plate
    end
    
    local plate = generatePlate()
    
    local defaultVehicleData = {
        model = GetHashKey(model),
        plate = plate,
        plateIndex = 0,
        bodyHealth = 1000.0,
        engineHealth = 1000.0,
        tankHealth = 1000.0,
        fuelLevel = 100.0,
        dirtLevel = 0.0,
        color1 = 0,
        color2 = 0,
        pearlescentColor = 0,
        wheelColor = 0,
        wheels = 0,
        windowTint = 0,
        xenonColor = 8,
        customPrimaryColor = {},
        customSecondaryColor = {},
        smokeColor = {},
        livery = -1,
        tyreBurst = {},
        windowsBroken = {},
        doorsBroken = {},
        extras = {},
        neonEnabled = {[0] = false, [1] = false, [2] = false, [3] = false},
        neonColor = {},
        interiorColor = 0,
        dashboardColor = 0,
        modSpoilers = -1,
        modFrontBumper = -1,
        modRearBumper = -1,
        modSideSkirt = -1,
        modExhaust = -1,
        modFrame = -1,
        modGrille = -1,
        modHood = -1,
        modFender = -1,
        modRightFender = -1,
        modRoof = -1,
        modEngine = -1,
        modBrakes = -1,
        modTransmission = -1,
        modHorns = -1,
        modSuspension = -1,
        modArmor = -1,
        modTurbo = false,
        modSmokeEnabled = false,
        modXenon = false,
        modFrontWheels = -1,
        modBackWheels = -1,
        modPlateHolder = -1,
        modVanityPlate = -1,
        modTrimA = -1,
        modOrnaments = -1,
        modDashboard = -1,
        modDial = -1,
        modDoorSpeaker = -1,
        modSeats = -1,
        modSteeringWheel = -1,
        modShifterLeavers = -1,
        modAPlate = -1,
        modSpeakers = -1,
        modTrunk = -1,
        modHydrolic = -1,
        modEngineBlock = -1,
        modAirFilter = -1,
        modStruts = -1,
        modArchCover = -1,
        modAerials = -1,
        modTrimB = -1,
        modTank = -1,
        modWindows = -1,
        modLivery2 = -1
    }
    
    MySQL.execute("INSERT INTO `owned_vehicles` (owner, plate, vehicle, type, job, stored, parking, pound, glovebox, trunk) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", {
        xPlayer.identifier,
        plate,
        json.encode(defaultVehicleData),
        'car',
        'unemployed',
        1,
        garageName,
        0,
        '[]',
        '[]'
    }, function(ownedResult)
        if ownedResult.insertId then
            MySQL.execute("INSERT INTO `garage_vehicles` (owner, plate, model, garage_name, vehicle_data, state, fuel, engine, body, stored, location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", {
                xPlayer.identifier,
                plate,
                model,
                garageName,
                json.encode(defaultVehicleData),
                1,
                100,
                1000,
                1000,
                1,
                "Personal"
            }, function(garageResult)
                if garageResult.insertId then
                    TriggerClientEvent("chat:addMessage", source, {
                        color = {0, 255, 0},
                        multiline = true,
                        args = {"[FB-Garage]", string.format("Personal vehicle %s added with plate %s in %s", model, plate, garageName)}
                    })
                    
                    print(string.format("^2[FB-Garage]^7 Personal vehicle %s given to %s (plate: %s, garage: %s)", model, xPlayer.getName(), plate, garageName))
                else
                    TriggerClientEvent("chat:addMessage", source, {
                        color = {255, 165, 0},
                        multiline = true,
                        args = {"[FB-Garage]", "Vehicle added to owned_vehicles but error in garage_vehicles"}
                    })
                end
            end)
        else
            TriggerClientEvent("chat:addMessage", source, {
                color = {255, 0, 0},
                multiline = true,
                args = {"[FB-Garage]", "Error while adding the vehicle to the database"}
            })
        end
    end)
    
end, false)