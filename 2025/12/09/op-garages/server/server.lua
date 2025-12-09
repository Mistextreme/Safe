Citizen.CreateThread(function()
    while Framework == nil do Wait(5) end
    -----------------------------------------------
    -- FETCHING ALL PLAYER VEHICLES FUNC
    ---------------------------------------------------

    local var = Config.FrameWork == "ESX" and "owned_vehicles" or
                    "player_vehicles"
    local veh = Config.FrameWork == "ESX" and "vehicle" or "mods"
    local owner = Config.FrameWork == "ESX" and "owner" or "citizenid"

    Fr.RegisterServerCallback('op-garages:getVehicles',
                              function(source, cb, typeof, own)
        local xPlayer = Fr.getPlayerFromId(source)
        local identifier = own or xPlayer.identifier or xPlayer.PlayerData.citizenid

        local vehicleType = typeof:lower()

        local vehicleTypeMap = {
            Vehicle = "car",
            Boat = "boat",
            Plane = "plane",
            Helicopter = "helicopter"
        }

        local typeValue = vehicleTypeMap[typeof]

        if typeValue then
            MySQL.query('SELECT *, CAST(state AS UNSIGNED) AS state FROM ' .. var .. ' WHERE ' .. owner .. ' = ? AND type = ?', {identifier, typeValue},
            function(data)
                cb(data)
            end)
        else
            cb({})
        end
    end)

    ---------------------------------------------------
    -- REPAIRING VEH FUNCTION
    ---------------------------------------------------

    local doors = Config.FrameWork == "ESX" and "doorsBroken" or "doorStatus"
    local windows = Config.FrameWork == "ESX" and "windowsBroken" or
                        "windowStatus"

    Fr.RegisterServerCallback('op-garages:repairVehicle',
                              function(source, cb, plate)
        local xPlayer = Fr.getPlayerFromId(source)
        local bank_money = Fr.GetMoney(xPlayer, 'bank')
        local cash = Fr.GetMoney(xPlayer, 'money')
        local ableToFix = false

        if Config.Misc.RepairPrice <= cash then
            Fr.ManageMoney(xPlayer, "money", "remove", Config.Misc.RepairPrice)
            ableToFix = true
        elseif Config.Misc.RepairPrice <= bank_money then
            Fr.ManageMoney(xPlayer, "bank", "remove", Config.Misc.RepairPrice)
            ableToFix = true
        end

        if ableToFix then
            MySQL.query('SELECT *, CAST(state AS UNSIGNED) AS state FROM ' .. var .. ' WHERE plate = ?', {plate},
            function(data)
                if not data or #data == 0 then
                    print("No data found for plate: " .. plate)
                    cb(nil)
                else
                    local vehData = json.decode(data[1][veh])
                    if not vehData then
                        print("Failed to decode vehicle data")
                    else
                        for i = 0, 15 do
                            if vehData[doors][tostring(i)] == true or
                                vehData[doors][tostring(i)] == 1 then
                                vehData[doors][tostring(i)] = false
                            end
                            if vehData[windows][tostring(i)] == true or
                                vehData[windows][tostring(i)] == 1 then
                                vehData[windows][tostring(i)] = false
                            end
                        end
                    end

                    vehData.engineHealth = 1000.0
                    vehData.bodyHealth = 1000.0
                    vehData.dirtLevel = 0.0

                    MySQL.update('UPDATE ' .. var .. ' SET ' .. veh .. ' = ? WHERE plate = ?', {json.encode(vehData), plate})
                    cb(json.encode(vehData))
                end
            end)
        else
            cb(false)
        end
    end)

    ---------------------------------------------------
    -- REMOVING VEHICLE FROM PARKING WHEN TAKED OUT
    ---------------------------------------------------

    RegisterServerEvent('op-garages:removeCarFromParking')
    AddEventHandler('op-garages:removeCarFromParking',
                    function(plate, networkid)
        local xPlayer = Fr.getPlayerFromId(source)
        if plate ~= nil then
            MySQL.Async.execute('UPDATE ' .. var ..
                                    ' SET state = 1, vehicleid = @networkid WHERE plate = @plate',
                                {['@plate'] = plate, ['@networkid'] = networkid})
        end
    end)

    ---------------------------------------------------
    -- CHANGING STATE OF SELECTED VEHICLE
    ---------------------------------------------------

    RegisterServerEvent('op-garages:updateState')
    AddEventHandler('op-garages:updateState', function(plate)
        MySQL.Sync.execute('UPDATE ' .. var ..
                               ' SET state = 0, vehicleid = NULL WHERE plate = @plate',
                           {['@plate'] = plate})
    end)

    ---------------------------------------------------
    -- CHECK IF VEHICLE IS OWNED BY SOURCE
    ---------------------------------------------------

    Fr.RegisterServerCallback('op-garages:checkIfVehicleIsOwned',
                              function(source, cb, plate, vehicleProps, own)
        local xPlayer = Fr.getPlayerFromId(source)
        local identifier = own or xPlayer.identifier or xPlayer.PlayerData.citizenid
        local found = nil
        local vehicleData = nil

        MySQL.query('SELECT *, CAST(state AS UNSIGNED) AS state FROM ' .. var .. ' WHERE plate = ?', {plate},
                    function(data)
            local found = false

            for k, v in pairs(data) do
                if v[owner] == identifier then found = v end
            end

            if found ~= false then
                MySQL.Async.execute('UPDATE ' .. var .. ' SET ' .. veh ..
                                        ' = @vehicle, vehicleid = NULL, state = 0 WHERE plate = @plate',
                                    {
                    ['@vehicle'] = json.encode(vehicleProps),
                    ['@plate'] = vehicleProps.plate
                })
                cb(found)
            else
                cb(nil)
            end
        end)
    end)

    ---------------------------------------------------
    -- IMPOUND VEHICLE FUNCTION
    ---------------------------------------------------

    Fr.RegisterServerCallback('op-garages:towVehicle',
                              function(source, cb, plate, own)
        local _source = source
        local xPlayer = Fr.getPlayerFromId(_source)
        local identifier = own or xPlayer.identifier or xPlayer.PlayerData.citizenid

        local bank_money = Fr.GetMoney(xPlayer, 'bank')
        local cash = Fr.GetMoney(xPlayer, 'money')
        local ableToFix = false

        if Config.Misc.TowingPrice <= cash then
            Fr.ManageMoney(xPlayer, "money", "remove", Config.Misc.TowingPrice)
            ableToFix = true
        elseif Config.Misc.TowingPrice <= bank_money then
            Fr.ManageMoney(xPlayer, "bank", "remove", Config.Misc.TowingPrice)
            ableToFix = true
        end

        if ableToFix then
            MySQL.Async.fetchAll(
                "SELECT vehicleid FROM " .. var .. " WHERE " .. owner ..
                    "= @identifier AND plate = @plate",
                {['@identifier'] = identifier, ['@plate'] = plate}, function(
                    data)
                    if data[1] ~= nil then
                        cb(data[1].vehicleid)
                    end
                end)
        else
            cb('no founds')
        end

    end)

    ---------------------------------------------------
    -- WORLDS
    ---------------------------------------------------

    local busyBuckets = {}

    RegisterServerEvent('op-garages:soloSession')
    AddEventHandler('op-garages:soloSession', function()
        local newBucket = generateBucket()
        SetPlayerRoutingBucket(source, newBucket)
    end)

    RegisterServerEvent('op-garages:soloSessionLeave')
    AddEventHandler('op-garages:soloSessionLeave', function()
        local oldBucket = GetPlayerRoutingBucket(source)
        SetPlayerRoutingBucket(source, 0)
        busyBuckets[oldBucket] = nil
    end)

    function generateBucket()
        local bucketid = math.random(1, 7000)
        if busyBuckets[bucketid] then
            generateBucket()
        else
            table.insert(busyBuckets, bucketid)
            return bucketid
        end
    end

    ---------------------------------------------------
    -- AUTO SQL
    ---------------------------------------------------

    function ensureColumnExists(tableName, columnName, columnDefinition)
        local result = MySQL.query.await([[
            SELECT COUNT(*) AS columnExists
            FROM information_schema.COLUMNS
            WHERE TABLE_NAME = @tableName AND COLUMN_NAME = @columnName
        ]], {['@tableName'] = tableName, ['@columnName'] = columnName})

        if result[1].columnExists == 0 then
            MySQL.execute([[
                ALTER TABLE ]] .. tableName .. [[ ADD COLUMN ]] .. columnName ..
                              [[ ]] .. columnDefinition, {},
                          function(result) end)
            print("^2[Auto-sql]: ^0Column ^2'" .. columnName ..
                      "' ^0created successfully.")
        end
    end

    function createTableIfNotExists()
        local queries = {
            ESX = [[
                CREATE TABLE IF NOT EXISTS owned_vehicles (
                    `owner` varchar(46) DEFAULT NULL,
                    `plate` varchar(12) NOT NULL,
                    `vehicle` longtext,
                    `type` varchar(20) NOT NULL DEFAULT 'car',
                    `state` int(11) DEFAULT 0,
                    `vehicleid` int DEFAULT NULL,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                );
            ]],
            QBCORE = [[
                CREATE TABLE IF NOT EXISTS player_vehicles (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `license` varchar(50) DEFAULT NULL,
                `citizenid` varchar(50) DEFAULT NULL,
                `vehicle` varchar(50) DEFAULT NULL,
                `hash` varchar(50) DEFAULT NULL,
                `mods` longtext DEFAULT NULL,
                `plate` varchar(50) NOT NULL,
                `type` varchar(20) NOT NULL DEFAULT 'car',
                `vehicleid` int DEFAULT NULL,
                `fakeplate` varchar(50) DEFAULT NULL,
                `garage` varchar(50) DEFAULT NULL,
                `fuel` int(11) DEFAULT 100,
                `engine` float DEFAULT 1000,
                `body` float DEFAULT 1000,
                `state` int(11) DEFAULT 0,
                `depotprice` int(11) NOT NULL DEFAULT 0,
                `drivingdistance` int(50) DEFAULT NULL,
                `status` text DEFAULT NULL,
                `balance` int(11) NOT NULL DEFAULT 0,
                `paymentamount` int(11) NOT NULL DEFAULT 0,
                `paymentsleft` int(11) NOT NULL DEFAULT 0,
                `financetime` int(11) NOT NULL DEFAULT 0,
                PRIMARY KEY (`id`)
                );
            ]]
        }

        local checkColumns = {
            columns = {
                {name = "type", def = "varchar(20) NOT NULL DEFAULT 'car'"},
                {name = "vehicleid", def = "int DEFAULT NULL"},
                {name = "state", def = "int(11) DEFAULT 0"}
            },
            QBCORE = "player_vehicles",
            ESX = "owned_vehicles"
        }
        local query = queries[Config.FrameWork]
        if query then
            MySQL.execute(query, {}, function(result)
            end)
        else
            print("^1[Error:] ^0Unsupported framework specified in Config.FrameWork")
        end

        local tableName = checkColumns[Config.FrameWork]
        for _, column in ipairs(checkColumns.columns) do
            ensureColumnExists(tableName, column.name, column.def)
        end

        checkVersion()
    end

    MySQL.ready(function() createTableIfNotExists() end)

    function checkVersion()

        local currentVersion = "1.0.6"
        PerformHttpRequest("https://otherplanet.dev/api/VersionCheck?script=garages", function(errorCode, resultData, resultHeaders, errorData) 
            local data = json.decode(resultData)
            if currentVersion ~= data.version then
                print("^6[OTHERPLANET.DEV]: ^0Script is OutDated! Your version is ^1" .. currentVersion .. ". ^0The latest version and supported is: ^2".. data.version .. "^0")
            else
                print("^6[OTHERPLANET.DEV]: ^0Running on latest version: ^2" .. data.version .. "^0")
            end
        end)

    end    

end)
