local var = Config.FrameWork == "ESX" and "owned_vehicles" or "player_vehicles"
local owner = Config.FrameWork == "ESX" and "owner" or "citizenid"

function getImpoundedVehicles(identifier, typeValue) -- car, boat, plane, helicopter, all
    if typeValue and typeValue ~= "all" then
        query = 'SELECT * FROM ' .. var .. ' WHERE ' .. owner ..
                    ' = ? AND type = ? AND state = 0'
        params = {identifier, typeValue}
    else
        query = 'SELECT * FROM ' .. var .. ' WHERE ' .. owner ..
                    ' = ? AND state = 0'
        params = {identifier}
    end

    MySQL.query(query, params, function(data) cb(data) end)
end
exports('getImpoundedVehicles', getImpoundedVehicles)

function getNotImpoundedVehicles(identifier, typeValue) -- car, boat, plane, helicopter, all

    if typeValue and typeValue ~= "all" then
        query = 'SELECT * FROM ' .. var .. ' WHERE ' .. owner ..
                    ' = ? AND type = ? AND state = 1'
        params = {identifier, typeValue}
    else
        query = 'SELECT * FROM ' .. var .. ' WHERE ' .. owner ..
                    ' = ? AND state = 1'
        params = {identifier}
    end

    MySQL.query(query, params, function(data) cb(data) end)
end
exports('getNotImpoundedVehicles', getNotImpoundedVehicles)
