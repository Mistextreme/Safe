config = {}

config.type = {
    CAR = "car",
    AIRCRAFT = "aircraft",
    BOAT = "boat"
}

config.list = {
    [config.type.CAR] = {
        ["Parking Central"] = {
            name = "Parking Central",
            position = vector3(-103.987717, 91.091492, 71.662743),
            spawns = {
                { pos = vector3(-97.914032, 84.110107, 71.536346), heading = 327.04510498046875}
            },
            delete = vector3(-91.893570, 95.217522, 72.362122),
            blip = true,
            type = config.type.CAR,
            canDelete = false
        }
    },
}

config.doesTypeExist = function (type)
    return config.list[type] ~= nil
end

config.doesGarageExistWithName = function (garageType, garageName)
    if not config.doesTypeExist(garageType) then
        return true
    end

    if config.list[garageType][garageName] then
        return true
    end

    return false
end

config.addGarage = function (garage)
    if not config.doesTypeExist(garage.type) then return end

    config.list[garage.type][garage.name] = garage
end

config.removeGarage = function (type, name)
    if not config.doesTypeExist(type) then return end

    config.list[type][name] = nil
end

config.getGarage = function (type, name)
    if not config.doesTypeExist(type) then return end

    return config.list[type][name]
end

config.getGarages = function ()
    return config.list
end

config.getGaragesNamesByType = function (type)
    if not config.doesTypeExist(type) then return end

    local list = {}
    local garages = config.list[type]
    if ESX.Table.SizeOf(garages) == 0 then
        return {}
    end

    for k, v in pairs(garages) do
        table.insert(list, k)
    end

    return list
end

return config