The provided code does not contain any comments, strings, or documentation that require translation. All human-readable elements are already in English. Therefore, the code remains unchanged.

function GetVehicleProperties(vehicle)
    if not DoesEntityExist(vehicle) then return nil end

    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
    local extras = {}

    for extraId = 0, 12 do
        if DoesExtraExist(vehicle, extraId) then
            local state = IsVehicleExtraTurnedOn(vehicle, extraId) == 1
            extras[tostring(extraId)] = state
        end
    end

    local modLivery = GetVehicleLivery(vehicle)
    if modLivery == -1 then
        modLivery = GetVehicleMod(vehicle, 48)
    end

    local damage = {
        tyres = {},
        windows = {},
        doors = {}
    }

    for i = 0, 7 do
        damage.tyres[i] = IsVehicleTyreBurst(vehicle, i, false)
    end

    for i = 0, 7 do
        damage.windows[i] = IsVehicleWindowIntact(vehicle, i) == false
    end

    for i = 0, 5 do
        damage.doors[i] = IsVehicleDoorDamaged(vehicle, i)
    end

    return {
        model = GetEntityModel(vehicle),
        plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)),
        plateIndex = GetVehicleNumberPlateTextIndex(vehicle),
        bodyHealth = ESX.Math.Round(GetVehicleBodyHealth(vehicle), 1),
        engineHealth = ESX.Math.Round(GetVehicleEngineHealth(vehicle), 1),
        tankHealth = ESX.Math.Round(GetVehiclePetrolTankHealth(vehicle), 1),
        fuelLevel = GetVehicleFuelLevel(vehicle),
        dirtLevel = GetVehicleDirtLevel(vehicle),
        color1 = colorPrimary,
        color2 = colorSecondary,
        pearlescentColor = pearlescentColor,
        wheelColor = wheelColor,
        wheels = GetVehicleWheelType(vehicle),
        windowTint = GetVehicleWindowTint(vehicle),
        xenonColor = GetVehicleXenonLightsColour(vehicle),
        customPrimaryColor = table.pack(GetVehicleCustomPrimaryColour(vehicle)),
        customSecondaryColor = table.pack(GetVehicleCustomSecondaryColour(vehicle)),
        smokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle)),
        livery = modLivery,
        tyreBurst = damage.tyres,
        windowsBroken = damage.windows,
        doorsBroken = damage.doors,
        extras = extras,
        neonEnabled = {
            [0] = IsVehicleNeonLightEnabled(vehicle, 0),
            [1] = IsVehicleNeonLightEnabled(vehicle, 1),
            [2] = IsVehicleNeonLightEnabled(vehicle, 2),
            [3] = IsVehicleNeonLightEnabled(vehicle, 3)
        },
        neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
        interiorColor = GetVehicleInteriorColor(vehicle),
        dashboardColor = GetVehicleDashboardColour(vehicle),
        modSpoilers = GetVehicleMod(vehicle, 0),
        modFrontBumper = GetVehicleMod(vehicle, 1),
        modRearBumper = GetVehicleMod(vehicle, 2),
        modSideSkirt = GetVehicleMod(vehicle, 3),
        modExhaust = GetVehicleMod(vehicle, 4),
        modFrame = GetVehicleMod(vehicle, 5),
        modGrille = GetVehicleMod(vehicle, 6),
        modHood = GetVehicleMod(vehicle, 7),
        modFender = GetVehicleMod(vehicle, 8),
        modRightFender = GetVehicleMod(vehicle, 9),
        modRoof = GetVehicleMod(vehicle, 10),
        modEngine = GetVehicleMod(vehicle, 11),
        modBrakes = GetVehicleMod(vehicle, 12),
        modTransmission = GetVehicleMod(vehicle, 13),
        modHorns = GetVehicleMod(vehicle, 14),
        modSuspension = GetVehicleMod(vehicle, 15),
        modArmor = GetVehicleMod(vehicle, 16),
        modTurbo = IsToggleModOn(vehicle, 18),
        modSmokeEnabled = IsToggleModOn(vehicle, 20),
        modXenon = IsToggleModOn(vehicle, 22),
        modFrontWheels = GetVehicleMod(vehicle, 23),
        modBackWheels = GetVehicleMod(vehicle, 24),
        modPlateHolder = GetVehicleMod(vehicle, 25),
        modVanityPlate = GetVehicleMod(vehicle, 26),
        modTrimA = GetVehicleMod(vehicle, 27),
        modOrnaments = GetVehicleMod(vehicle, 28),
        modDashboard = GetVehicleMod(vehicle, 29),
        modDial = GetVehicleMod(vehicle, 30),
        modDoorSpeaker = GetVehicleMod(vehicle, 31),
        modSeats = GetVehicleMod(vehicle, 32),
        modSteeringWheel = GetVehicleMod(vehicle, 33),
        modShifterLeavers = GetVehicleMod(vehicle, 34),
        modAPlate = GetVehicleMod(vehicle, 35),
        modSpeakers = GetVehicleMod(vehicle, 36),
        modTrunk = GetVehicleMod(vehicle, 37),
        modHydrolic = GetVehicleMod(vehicle, 38),
        modEngineBlock = GetVehicleMod(vehicle, 39),
        modAirFilter = GetVehicleMod(vehicle, 40),
        modStruts = GetVehicleMod(vehicle, 41),
        modArchCover = GetVehicleMod(vehicle, 42),
        modAerials = GetVehicleMod(vehicle, 43),
        modTrimB = GetVehicleMod(vehicle, 44),
        modTank = GetVehicleMod(vehicle, 45),
        modWindows = GetVehicleMod(vehicle, 46),
        modLivery2 = GetVehicleMod(vehicle, 47)
    }
end

function SetVehicleProperties(vehicle, props)
    if not DoesEntityExist(vehicle) then return end

    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)

    SetVehicleModKit(vehicle, 0)

    if props.plate then
        SetVehicleNumberPlateText(vehicle, props.plate)
    end

    if props.plateIndex then
        SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
    end

    if props.bodyHealth then
        SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0)
    end

    if props.engineHealth then
        SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0)
    end

    if props.tankHealth then
        SetVehiclePetrolTankHealth(vehicle, props.tankHealth + 0.0)
    end

    if props.fuelLevel then
        SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0)
    end

    if props.dirtLevel then
        SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0)
    end

    if props.color1 then
        if type(props.color1) == 'number' then
            ClearVehicleCustomPrimaryColour(vehicle)
            SetVehicleColours(vehicle, props.color1, colorSecondary)
        else
            SetVehicleCustomPrimaryColour(vehicle, props.color1[1], props.color1[2], props.color1[3])
        end
    end

    if props.color2 then
        if type(props.color2) == 'number' then
            ClearVehicleCustomSecondaryColour(vehicle)
            SetVehicleColours(vehicle, props.color1 or colorPrimary, props.color2)
        else
            SetVehicleCustomSecondaryColour(vehicle, props.color2[1], props.color2[2], props.color2[3])
        end
    end

    if props.pearlescentColor then
        SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
    end

    if props.wheelColor then
        SetVehicleExtraColours(vehicle, props.pearlescentColor or pearlescentColor, props.wheelColor)
    end

    if props.wheels then
        SetVehicleWheelType(vehicle, props.wheels)
    end

    if props.windowTint then
        SetVehicleWindowTint(vehicle, props.windowTint)
    end

    if props.neonEnabled then
        SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[0])
        SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[1])
        SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[2])
        SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[3])
    end

    if props.extras then
        for extraId, enabled in pairs(props.extras) do
            SetVehicleExtra(vehicle, tonumber(extraId), not enabled)
        end
    end

    if props.neonColor then
        SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
    end

    if props.xenonColor then
        SetVehicleXenonLightsColour(vehicle, props.xenonColor)
    end

    if props.modSmokeEnabled then
        ToggleVehicleMod(vehicle, 20, true)
    end

    if props.smokeColor then
        SetVehicleTyreSmokeColor(vehicle, props.smokeColor[1], props.smokeColor[2], props.smokeColor[3])
    end

    if props.modLivery then
        SetVehicleMod(vehicle, 48, props.modLivery, false)
        SetVehicleLivery(vehicle, props.modLivery)
    end

    if props.modLivery2 then
        SetVehicleMod(vehicle, 47, props.modLivery2, false)
    end

    if props.modSpoilers then SetVehicleMod(vehicle, 0, props.modSpoilers, false) end
    if props.modFrontBumper then SetVehicleMod(vehicle, 1, props.modFrontBumper, false) end
    if props.modRearBumper then SetVehicleMod(vehicle, 2, props.modRearBumper, false) end
    if props.modSideSkirt then SetVehicleMod(vehicle, 3, props.modSideSkirt, false) end
    if props.modExhaust then SetVehicleMod(vehicle, 4, props.modExhaust, false) end
    if props.modFrame then SetVehicleMod(vehicle, 5, props.modFrame, false) end
    if props.modGrille then SetVehicleMod(vehicle, 6, props.modGrille, false) end
    if props.modHood then SetVehicleMod(vehicle, 7, props.modHood, false) end
    if props.modFender then SetVehicleMod(vehicle, 8, props.modFender, false) end
    if props.modRightFender then SetVehicleMod(vehicle, 9, props.modRightFender, false) end
    if props.modRoof then SetVehicleMod(vehicle, 10, props.modRoof, false) end
    if props.modEngine then SetVehicleMod(vehicle, 11, props.modEngine, false) end
    if props.modBrakes then SetVehicleMod(vehicle, 12, props.modBrakes, false) end
    if props.modTransmission then SetVehicleMod(vehicle, 13, props.modTransmission, false) end
    if props.modHorns then SetVehicleMod(vehicle, 14, props.modHorns, false) end
    if props.modSuspension then SetVehicleMod(vehicle, 15, props.modSuspension, false) end
    if props.modArmor then SetVehicleMod(vehicle, 16, props.modArmor, false) end

    if props.modTurbo then
        ToggleVehicleMod(vehicle, 18, props.modTurbo)
    end

    if props.modXenon then
        ToggleVehicleMod(vehicle, 22, props.modXenon)
    end

    if props.modFrontWheels then SetVehicleMod(vehicle, 23, props.modFrontWheels, false) end
    if props.modBackWheels then SetVehicleMod(vehicle, 24, props.modBackWheels, false) end

    if props.tyreBurst then
        for tyreId, burst in pairs(props.tyreBurst) do
            if burst then
                SetVehicleTyreBurst(vehicle, tonumber(tyreId), true, 1000.0)
            end
        end
    end

    if props.windowsBroken then
        for windowId, broken in pairs(props.windowsBroken) do
            if broken then
                SmashVehicleWindow(vehicle, tonumber(windowId))
            end
        end
    end

    if props.doorsBroken then
        for doorId, broken in pairs(props.doorsBroken) do
            if broken then
                SetVehicleDoorBroken(vehicle, tonumber(doorId), true)
            end
        end
    end
end

function StoreVehicle(vehicle, garageName)
    if not DoesEntityExist(vehicle) then return false end
    
    local vehicleProps = GetVehicleProperties(vehicle)
    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
    
    local vehicleData = {
        plate = plate,
        garage_name = garageName,
        vehicle_data = vehicleProps,
        fuel = GetVehicleFuelLevel(vehicle),
        engine = GetVehicleEngineHealth(vehicle),
        body = GetVehicleBodyHealth(vehicle),
        state = 1
    }
    
    TriggerServerEvent("fb_garage:storeVehicle", vehicleData)
    DeleteVehicle(vehicle)
    
    return true
end