ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Garages = {
    my_garage = {
        VehiclesList = {}
    },
    fuels = {}
}

GaragesVehiclesId = {}

RegisterCommand("addv", function(source, args, rawCommand)
    local source = source
    if not args[1] or not args[2] then
        TriggerClientEvent('esx:showNotification', source, "Usage: /addv [id] [model]")
        return
    end

    local targetId = tonumber(args[1])
    local model = args[2]
    local targetPlayer = ESX.GetPlayerFromId(targetId)

    if not targetPlayer then
        TriggerClientEvent('esx:showNotification', source, "Joueur non trouvé")
        return
    end

    TriggerClientEvent('garage:spawnAndRegisterVehicle', targetId, model)
end)

ESX.RegisterServerCallback('Loumout:GetPersonalVehicles', function(source, cb, garageType)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_ewen WHERE owner = ? AND type = ?', {
        identifier,
        garageType
    }, function(result)
        if result and #result > 0 then
            for i=1, #result do
                if result[i].garage == nil then
                    result[i].garage = "Parking Central"
                end
            end
            cb(result)
        else
            cb({})
        end
    end)
end)

function getPersonnalVehicles(source)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    GaragePersonal = {}

    TriggerClientEvent('esx:showNotification', source, 'Récupération des vos véhicules en cours...')

    Wait(400)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_ewen WHERE owner = @owner AND type = @type', { ['@owner'] = xPlayer.identifier, ["@type"] = currentGarageType }, function(result)
        for k, v in pairs(result) do
            table.insert(GaragePersonal, {
                plate = v.plate,
                model = v.model,
                owner = v.owner,
                garage = v.garage,
                state = v.state,
                boutique = v.boutique,
                type = v.type,
                label = v.label
            })
        end
        return GaragePersonal
    end)
end

ESX.RegisterServerCallback("Loumout:GetSocietyVehicles", function(source, cb, currentGarageType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerJob = xPlayer.getJob().name
    GarageSociety = {}

    TriggerClientEvent('esx:showNotification', source, 'Récupération des véhicules de la société en cours...')

    Wait(400)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_ewen WHERE owner = @owner AND type = @type', { ['@owner'] =  xPlayerJob, ["@type"] = currentGarageType}, function(result)
        for k, v in pairs(result) do
            table.insert(GarageSociety, {
                plate = v.plate,
                model = v.model,
                owner = v.owner,
                garage = v.garage,
                state = v.state,
                boutique = v.boutique,
                type = v.type
            })
        end
        cb(GarageSociety)
    end)
end)

ESX.RegisterServerCallback("Loumout:GetOrgaVehicles", function(source, cb, currentGarageType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayerJob2 = xPlayer.getJob2()
    GarageOrga = {}

    TriggerClientEvent('esx:showNotification', source, 'Récupération des véhicules de l\'organisation en cours...')

    Wait(400)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_ewen WHERE owner = @owner AND type = @type', { ['@owner'] =  xPlayerJob2, ["@type"] = currentGarageType}, function(result)
        for k, v in pairs(result) do
            table.insert(GarageOrga, {
                plate = v.plate,
                model = v.model,
                owner = v.owner,
                garage = v.garage,
                state = v.state,
                boutique = v.boutique,
                type = v.type
            })
        end
        cb(GarageOrga)
    end)
end)

ESX.RegisterServerCallback('garages:getSpawnsPoint', function(source, cb, garageName, garageType)
    if not config.list[garageType] or not config.list[garageType][garageName] then
        return cb(false)
    end
    cb(config.list[garageType][garageName].spawns)
end)

RegisterNetEvent("garage:attributeToEnterprise")
AddEventHandler("garage:attributeToEnterprise", function(plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE owned_vehicles_ewen SET owner = @owner WHERE plate = @plate', {
        ['@owner'] = xPlayer.getJob().name,
        ['@plate'] = plate
    }, function(rowsChanged)
        if rowsChanged > 0 then
            TriggerClientEvent('esx:showNotification', source, "Véhicule attribué à la société avec succès")
            TriggerClientEvent("garage:refreshVehicles", source)
        else
            TriggerClientEvent('esx:showNotification', source, "Erreur lors de l'attribution du véhicule à la société")
        end
    end)
end)

RegisterNetEvent("garage:attributeToOrganisation")
AddEventHandler("garage:attributeToOrganisation", function(plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE owned_vehicles_ewen SET owner = @owner WHERE plate = @plate', {
        ['@owner'] = xPlayer.getJob2().name,
        ['@plate'] = plate
    }, function(rowsChanged)
        if rowsChanged > 0 then
            TriggerClientEvent('esx:showNotification', source, "Véhicule attribué à l'organisation avec succès")
            TriggerClientEvent("garage:refreshVehicles", source)
        else
            TriggerClientEvent('esx:showNotification', source, "Erreur lors de l'attribution du véhicule à l'organisation")
        end
    end)
end)    

RegisterNetEvent("garage:store")
AddEventHandler("garage:store", function(plate, garageName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerLicense = xPlayer.identifier
    
    plate = string.gsub(plate, "%s+", "")

    MySQL.query('SELECT owner FROM owned_vehicles_ewen WHERE plate = ?', {plate}, function(result)
        if result[1] then
            
            if result[1].owner == playerLicense then
                MySQL.update('UPDATE owned_vehicles_ewen SET garage = ?, state = 1 WHERE plate = ?', 
                    {garageName, plate}, 
                    function(affectedRows)
                        TriggerClientEvent('esx:showNotification', source, "Véhicule rangé dans " .. garageName)
                    end
                )
            else
                TriggerClientEvent('esx:showNotification', source, "Ce véhicule ne vous appartient pas")
            end
        else
            TriggerClientEvent('esx:showNotification', source, "Véhicule non trouvé dans la base de données")
        end
    end)
end)

RegisterNetEvent("garage:takeOut")
AddEventHandler("garage:takeOut", function(plate, spawnPoint)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles_ewen WHERE plate = @plate", {
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            local vehicleProperties = json.decode(result[1].tuning)
            local position = spawnPoint.pos
            local heading = spawnPoint.heading
            
            TriggerClientEvent('garage:spawnVehicleWithPlate', source, {
                model = result[1].model,
                plate = plate,
                props = vehicleProperties,
                position = position,
                heading = heading
            })
        end
    end)
end)


function Garages:CreateVeh(src, nameSpawn, plate, vehicleProperties, position, heading)

    local failed = false

    local vehicleId = CreateVehicle(nameSpawn, position.x , position.y, position.z, heading, true, false)

     if DoesEntityExist(vehicleId) then
         ESX.toConsole(('Failed to spawn %s %s %s %s %s'):format(nameSpawn, plate, vehicleProperties, position, heading))
         return
     end

    local failedAttempt = 0
    while not DoesEntityExist(vehicleId) do
        Citizen.Wait(200) 
        failedAttempt = failedAttempt + 1
        if failedAttempt > 20 then
             ESX.toConsole(('Failed to spawn %s %s %s %s %s'):format(nameSpawn, plate, vehicleProperties, position, heading))

            return
        end

        failed = true
    end

    TaskWarpPedIntoVehicle(src, vehicleId, -1)

    return vehicleId, NetworkGetNetworkIdFromEntity(vehicleId)
end

RegisterNetEvent("garage:locateVehicle")
AddEventHandler("garage:locateVehicle", function(plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local position = GetNetworkIdPosition(GaragesVehiclesId[plate])
    TriggerClientEvent("garage:setLocation", source, position)
end)

function GetNetworkIdPosition(networkId)
    local entity = NetworkGetEntityFromNetworkId(networkId)
    local position = GetEntityCoords(entity)
    return position
end

RegisterNetEvent("garage:renameVehicle")
AddEventHandler("garage:renameVehicle", function(plate, newName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('UPDATE owned_vehicles_ewen SET label = @label WHERE plate = @plate', {
        ['@label'] = newName,
        ['@plate'] = plate
    }, function(rowsChanged)
        if rowsChanged > 0 then
            TriggerClientEvent('esx:showNotification', source, "Véhicule renommé avec succès")
            TriggerClientEvent("garage:refreshVehicles", source)
        else
            TriggerClientEvent('esx:showNotification', source, "Erreur lors du renommage du véhicule")
        end
    end)
end)

ESX.RegisterServerCallback('Loumout:GetVehicleData', function(source, cb, plate)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_ewen WHERE plate = ?', {
        plate
    }, function(result)
        if result and #result > 0 then
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)

RegisterNetEvent('Loumout:ChangeState')
AddEventHandler('Loumout:ChangeState', function(plate, state, garage)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    MySQL.Async.execute('UPDATE owned_vehicles_ewen SET state = ?, garage = ? WHERE plate = ?', {
        state,
        garage,
        plate
    })
end)

RegisterCommand('checkvehicles', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_ewen WHERE owner = @owner', {
        ['@owner'] = xPlayer.identifier
    }, function(result)
        if result and #result > 0 then
            for _, vehicle in ipairs(result) do
                TriggerClientEvent('esx:showNotification', source, "Véhicule: " .. vehicle.model .. " - Plaque: " .. vehicle.plate)
            end
        else
            TriggerClientEvent('esx:showNotification', source, "Aucun véhicule trouvé")
        end
    end)
end)

RegisterNetEvent('ewengarage:returnPlate')
AddEventHandler('ewengarage:returnPlate', function(plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local vehicule = {
        plate = plate,
        model = currentModel,
        owner = xPlayer.identifier,
        garage = "Parking Central",
        state = 1,
        boutique = false,
        type = "car"
    }

    MySQL.Async.execute('INSERT INTO owned_vehicles_ewen (plate, model, owner, garage, state, boutique, type) VALUES (@plate, @model, @owner, @garage, @state, @boutique, @type)', {
        ['@plate'] = vehicule.plate,
        ['@model'] = vehicule.model,
        ['@owner'] = vehicule.owner,
        ['@garage'] = vehicule.garage,
        ['@state'] = vehicule.state,
        ['@boutique'] = vehicule.boutique,
        ['@type'] = vehicule.type
    })
end)

RegisterCommand('addv', function(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if args[1] then
        local model = args[1]
        TriggerClientEvent('garage:spawnAndRegisterVehicle', source, model)
    else
        TriggerClientEvent('esx:showNotification', source, "Utilisation: /addv [modèle]")
    end
end)

RegisterNetEvent('garage:sendVehiclePlate')
AddEventHandler('garage:sendVehiclePlate', function(plate, model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    
    MySQL.insert('INSERT INTO owned_vehicles_ewen (owner, plate, model, type, garage, state) VALUES (?, ?, ?, ?, ?, ?)',
    {
        xPlayer.identifier,
        plate,         
        model,
        'car',
        'Parking Central',
        1
    }, function(id)
        if id then
            TriggerClientEvent('esx:showNotification', source, "Véhicule ajouté avec la plaque: " .. plate)
        end
    end)
end)

function GeneratePlate()
    local plate = ""
    local possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    plate = plate .. string.char(math.random(65, 90))
    for i = 1, 3 do
        plate = plate .. math.random(0, 9)
    end
    for i = 1, 2 do
        plate = plate .. string.char(math.random(65, 90))
    end
    plate = plate .. math.random(0, 9) 
    
    return plate
end

ESX.RegisterServerCallback('garage:checkVehicleOwner', function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles_ewen WHERE plate = @plate AND owner = @owner', {
        ['@plate'] = plate,
        ['@owner'] = xPlayer.identifier
    }, function(result)
        cb(result[1] ~= nil)
    end)
end)