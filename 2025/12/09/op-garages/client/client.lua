local CurrentGarage = nil
local isLoaded = false
local isTranslatedConfirmed = false
local CreatedZones = {}
local CreatedZonesPeds = {}
local vehicles = {}
local CurrentVehicle = nil
local CurrentTemporaryCoords = nil
local CurrentTemporaryHeading = nil
local cam = nil
local isTowing = false
local isInGarage = false
local ped = {}

local jobName = nil
local jobGrade = nil
local PlayerData = {}
local oldJobName = nil
local oldJobGrade = nil

local JobBlips = {}

local ableToOpenGarage = false
local isPressFuncAdded = false
local isHidingVehAdded = false
local HintInMarkerOption = false

local cooldown = false

---------------------------------------------------
-- LANG AND LOADING OF ZONES
---------------------------------------------------

Citizen.CreateThread(function()
    updateBlips(false)
end)

function updateBlips(forJob)
    if forJob then
        for _, blip in pairs(JobBlips) do
            SetBlipDisplay(blip, 0)
            RemoveBlip(blip)
        end
        JobBlips = {}
    end

    for _, garage in pairs(Config.Garages) do
        if garage.DisplayBlip ~= false then
            local shouldCreateBlip = true

            if garage.Owner then
                if garage.Job ~= jobName or garage.Grade > jobGrade then
                    shouldCreateBlip = false
                end

                if shouldCreateBlip and forJob then
                    local blip = AddBlipForCoord(garage.CenterOfZone)
                    local cfg = Config.Misc.Blips[garage.Type]
                    local blipName = garage.BlipName or cfg.BlipLabel
    
                    if garage.Owner then
                        table.insert(JobBlips, blip)
                    end
    
                    SetBlipSprite(blip, cfg.BlipId)
                    SetBlipDisplay(blip, 4)
                    SetBlipScale(blip, cfg.BlipSize)
                    SetBlipColour(blip, cfg.BlipColor)
                    SetBlipAsShortRange(blip, true)
    
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentSubstringPlayerName(blipName)
                    EndTextCommandSetBlipName(blip)
                end
            end

            if shouldCreateBlip and not forJob then
                local blip = AddBlipForCoord(garage.CenterOfZone)
                local cfg = Config.Misc.Blips[garage.Type]
                local blipName = garage.BlipName or cfg.BlipLabel

                if garage.Owner then
                    table.insert(JobBlips, blip)
                end

                SetBlipSprite(blip, cfg.BlipId)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, cfg.BlipSize)
                SetBlipColour(blip, cfg.BlipColor)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(blipName)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end

---------------------------------------------------
-- LANG AND LOADING OF ZONES
---------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Wait(1)
        if not isTranslatedConfirmed then
            SendNUIMessage({
                action = "setLang",
                lang = string.lower(Config.Locale),
                url = Config.FontAwesomeUrl,
                repairToggle = Config.Misc.ToggleRepairFunction
            })
            debugLog('Language set to: ', Config.Locale)
            debugLog('Fontawesome url set to: ', Config.FontAwesomeUrl)
            Wait(2000)
        else
            return
        end
    end
end)

RegisterNUICallback('uiTranslated', function(data, cb)
    cb('ok')
    debugLog('UI Translation confirmed by frontend.')
    isTranslatedConfirmed = true
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    if not isLoaded then
        while not isTranslatedConfirmed do Wait(0) end
        loadGarages()
        isLoaded = true
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    deletePed("all")
    debugLog('Script has been stopped')
end)

Citizen.CreateThread(function()
    while Framework == nil do Wait(5) end
    RegisterNetEvent(Fr.PlayerLoaded)
    AddEventHandler(Fr.PlayerLoaded, function()
        PlayerData = Fr.GetPlayerData()
        if not isLoaded then
            while not isTranslatedConfirmed do Wait(0) end
            loadGarages()
            isLoaded = true
        end
    end)
end)

---------------------------------------------------
-- JOBS
---------------------------------------------------

CreateThread(function()
    while (Framework == nil) do
		Wait(100)
    end
    
    while (Fr.GetPlayerData() == nil or Fr.GetPlayerData().job == nil or Fr.GetPlayerData().job.name == nil) do
		Wait(100)
	end

    PlayerData = Fr.GetPlayerData()
    oldJobGrade = jobGrade
    oldJobName = jobName
    jobName = getJobName()
    jobGrade = getJobGrade()

    updateBlips(true)
end)

function noAllowed()
    if CurrentGarage then
        if CurrentGarage.data.Job then
            hideHint(true)
            ableToOpenGarage = false
        end
    end

    for k, v in pairs(Config.Garages) do
        if v.Type ~= "Vehicle" then
            if v.Owner ~= nil then
                if v.Job == oldJobName then
                    remTarget2(k)
                end
            end
        end
    end

    for k, v in pairs(Config.Garages) do
        if v.Type ~= "Vehicle" then
            local doit = true
            if v.Owner ~= nil then
                if v.Job == jobName then
                    if v.Grade > jobGrade then
                        doit = false
                    end
                else
                    doit = false
                end

                if doit then
                    local coords = vec3(v.AccessCoords.x, v.AccessCoords.y,
                    v.AccessCoords.z + 1.0)
                    debugLog("Adding target zone for garage",
                            {name = k .. "_ped", coords = coords})
                    CreatedZonesPeds[k] = addTargetTyped(k .. "_ped", coords, vec3(2.0, 2.0, 2.0),
                                Config.Misc.Icons[v.Type],
                                TranslateIt('garage_open_target_' .. v.Type),
                                function()
                        CurrentGarage = {name = k, data = v}
                        openGarage()
                    end)
                end
            end
        end
    end
end

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    oldJobGrade = jobGrade
    oldJobName = jobName
    jobName = getJobName()
    jobGrade = getJobGrade()
    updateBlips(true)
    noAllowed()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    oldJobGrade = jobGrade
    oldJobName = jobName
    jobName = getJobName()
    jobGrade = getJobGrade()
    updateBlips(true)    
    noAllowed()
end)

function getJobName()
    if (PlayerData ~= nil and PlayerData.job ~= nil and PlayerData.job.name ~= nil) then
        return PlayerData.job.name
	end
	return nil
end

function getJobGrade() 
    if (PlayerData ~= nil and PlayerData.job ~= nil and PlayerData.job.grade ~= nil) then
        return type(PlayerData.job.grade) == "table" and PlayerData.job.grade.level or PlayerData.job.grade
	end
	return nil
end

---------------------------------------------------
-- LOAD GARAGES FUNCTIONS
---------------------------------------------------

Citizen.CreateThread(function()
    debugLog("Creating thread to handle peds")
    while not isTranslatedConfirmed do Wait(0) end
    if Config.Misc.Peds.Toggle then
        while true do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            for k, v in pairs(Config.Garages) do
                if (v.Type ~= "Vehicle" or v.OneSpawn and v.Type == "Vehicle") and v.DisablePed ~= true then
                    local ableToDo = true
                    if v.Owner ~= nil then
                        if v.Job == jobName then
                            if v.Grade > jobGrade then
                                
                                ableToDo = false
                            end
                        else
                            ableToDo = false
                        end
                    end
                    
                    if not ableToDo then
                        if ped[k] then
                            if ped[k].generated then
                                debugLog("Deleting ped", k)
                                deletePed(k)
                            end
                        end
                    else
                        local dist = #(playerCoords - v.AccessCoords.xyz)
                        local options = {
                            PedName = k,
                            Coords = v.AccessCoords.xyz,
                            Heading = v.AccessCoords.w,
                            Model = Config.Misc.Peds[v.Type].Model,
                            Gender = Config.Misc.Peds[v.Type].Gender,
                            Marker = Config.Misc.Peds[v.Type].Marker,
                            Animation = Config.Misc.Peds[v.Type].Animation
                        }
                        if dist < 45.0 then
                            if ped[k] then
                                if not ped[k].generated then
                                    debugLog("Spawning ped", options)
                                    spawnPed(k, options)
                                end
                            else
                                ped[k] = {}
                                ped[k].generated = false
                                debugLog("Spawning new ped", options)
                                spawnPed(k, options)
                            end
                        else
                            if ped[k] then
                                if ped[k].generated then
                                    debugLog("Deleting ped", k)
                                    deletePed(k)
                                end
                            end
                        end
                    end
                end
            end
            Wait(1000)
        end
    end
end)

local inMarkerOf = nil

function removeTarget(target)
    debugLog("Removing target", target)
    if Config.Misc.Target == "ox-target" then
        exports.ox_target:removeZone(target)
    elseif Config.Misc.Target == "qb-target" then
        exports['qb-target']:RemoveZone(target)
    end
end

function addTargetTyped(name, coords, size, icon, label, onselect)
    debugLog("Adding target", {
        name = name,
        coords = coords,
        size = size,
        icon = icon,
        label = label
    })
    if Config.Misc.Target == "ox-target" then
        return exports.ox_target:addBoxZone({
            name = name,
            coords = coords,
            size = size,
            options = {
                {
                    icon = icon,
                    label = label,
                    onSelect = function() onselect() end
                }
            }
        })
    elseif Config.Misc.Target == "qb-target" then
        exports['qb-target']:AddCircleZone(name, coords, size.x,
                                           {name = name, debugPoly = false}, {
            options = {
                {icon = icon, label = label, action = function()
                    onselect()
                end}
            }
        })
        return name
    end
end

Citizen.CreateThread(function()
    debugLog("Creating thread for target zones")
    while not isTranslatedConfirmed do Wait(0) end
    if Config.Misc.Target ~= "none" then
        for k, v in pairs(Config.Garages) do
            if (v.Type ~= "Vehicle" or v.OneSpawn and v.Type == "Vehicle") and v.DisablePed ~= true then
                local doit = true
                if v.Owner ~= nil then
                    if v.Job == jobName then
                        if v.Grade > jobGrade then
                            doit = false
                        end
                    else
                        doit = false
                    end
                end
                
                if doit then
                    local coords = vec3(v.AccessCoords.x, v.AccessCoords.y,
                    v.AccessCoords.z + 1.0)
                    debugLog("Adding target zone for garage",
                            {name = k .. "_ped", coords = coords})
                    CreatedZonesPeds[k] = addTargetTyped(k .. "_ped", coords, vec3(2.0, 2.0, 2.0),
                                Config.Misc.Icons[v.Type],
                                TranslateIt('garage_open_target_' .. v.Type),
                                function()
                        CurrentGarage = {name = k, data = v}
                        openGarage()
                    end)
                end
            end
        end
        local coords = Config.ShowRoom.EntranceCoords.xyz
        debugLog("Adding target zone for showroom", {
            name = "_showroom",
            coords = vec3(coords.x, coords.y, coords.z + 1.0)
        })
        addTargetTyped("_showroom", vec3(coords.x, coords.y, coords.z + 1.0),
                       vec3(4.0, 4.0, 4.0), Config.ShowRoom.Marker.Icon,
                       TranslateIt('showroom_leave'),
                       function() leaveShowRoom() end)
    else
        while true do
            local sleep = 1000
            for k, v in pairs(Config.Garages) do
                local dist
                if (v.Type ~= "Vehicle" or v.OneSpawn and v.Type == "Vehicle") and v.DisablePed ~= true then
                    local ableToShow = true
                    if v.Owner ~= nil then
                        if v.Job == jobName then
                            if v.Grade > jobGrade then
                                ableToShow = false
                            end
                        else
                            ableToShow = false
                        end
                    end

                    if ableToShow then
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        dist = #(playerCoords - v.AccessCoords.xyz)
                        if dist < 50 then
                            sleep = 0
                            local coords = v.AccessCoords.xyz
                            local forward = nil
                            if ped[k] then
                                if ped[k].pedForward then
                                    forward = ped[k].pedForward
                                end
                            end
                            if Config.Misc.Peds.Toggle and forward ~= nil then
                                coords = vector3(coords.x + (forward.x * 1.2),
                                                 coords.y + (forward.y * 1.2),
                                                 coords.z)
                            end
                            DrawMarker(6, coords, 0.0, 0.0, 0.0, -90, 0, -90,
                                       Config.Misc.Peds[v.Type].Marker.ZoneSize.x,
                                       Config.Misc.Peds[v.Type].Marker.ZoneSize.y,
                                       Config.Misc.Peds[v.Type].Marker.ZoneSize.z,
                                       Config.Misc.Peds[v.Type].Marker.Color.r,
                                       Config.Misc.Peds[v.Type].Marker.Color.g,
                                       Config.Misc.Peds[v.Type].Marker.Color.b, 100,
                                       false, false, 2, false, false, false, false)
                            if dist < Config.Misc.Peds[v.Type].Marker.ZoneSize.y +
                                1.0 then
                                sleep = 0
                                if inMarkerOf ~= k then
                                    inMarkerOf = k
                                    showHint(
                                        TranslateIt("press_to_open_" .. v.Type),
                                        true)
                                end
    
                                CurrentGarage = {name = k, data = v}
    
                                if IsControlJustReleased(0, 38) then
                                    debugLog("Control pressed to open garage", k)
                                    openGarage()
                                end
                            else
                                if inMarkerOf == k then
                                    inMarkerOf = nil
                                    hideHint(true, TranslateIt(
                                                 "press_to_open_" .. v.Type))
                                end
                            end
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end
end)

local vehTypes = {
    automobile = "Vehicle",
    bike = "Vehicle",
    boat = "Boat",
    heli = "Helicopter",
    plane = "Plane",
    submarine = "boat",
    trailer = "Vehicle",
    train = "Vehicle"
}

function loadGarages()
    debugLog("Loading garages")
    for k, v in pairs(Config.Garages) do

        if true then

            debugLog("Configuring garage", {name = k, data = v})
            Config.Garages[k].ZoneCreated = v.Zone()

            Config.Garages[k].ZoneCreated:onPointInOut(PolyZone.getPlayerPosition,
                                                    function(isPointInside, point)
                debugLog("PointInOut callback triggered",
                        {isPointInside = isPointInside, point = point})

                if v.Owner ~= nil then
                    if v.Job == jobName then
                        if v.Grade > jobGrade then
                            return
                        end
                    else
                        return
                    end
                end

                if isPointInside then
                    debugLog("Player is inside the garage zone", {garage = k})
                    CurrentGarage = {name = k, data = v}
                    local playerPed = PlayerPedId()
                    local playerveh = GetVehiclePedIsUsing(playerPed)
                    local playerVehType = GetVehicleType(playerveh)

                    if ableToOpenGarage == false then
                        debugLog("Able to open garage check", {
                            ableToOpenGarage = ableToOpenGarage,
                            playerVehType = playerVehType,
                            garageType = v.Type
                        })
                        if IsPedInAnyVehicle(playerPed) then
                            if (v.Type == "Vehicle" and not v.OneSpawn) and vehTypes[playerVehType] ==
                                v.Type then
                                showHint(TranslateIt("press_to_hide_" .. v.Type),
                                        false)
                                debugLog("Showing hint to hide vehicle", {
                                    hint = TranslateIt("press_to_hide_" .. v.Type)
                                })
                            elseif vehTypes[playerVehType] == v.Type then
                                local doIt2 = not (v.OneSpawn and Config.Misc.Target ~= "none")
                                if doIt2 then
                                    local hintMessage = TranslateIt("press_to_hide_" .. v.Type)
                                    showHint(hintMessage, true)
                                    debugLog("Showing hint to hide vehicle", { hint = hintMessage })
                                end
                            end
                        else
                            if v.Type == "Vehicle" and not v.OneSpawn then
                                showHint(TranslateIt("press_to_open_" .. v.Type),
                                        false)
                                debugLog("Showing hint to open vehicle", {
                                    hint = TranslateIt("press_to_open_" .. v.Type)
                                })
                            end
                        end
                    end

                    if not isHidingVehAdded then
                        debugLog(
                            "Registering key mapping and command for hiding vehicle")
                        isHidingVehAdded = true
                        RegisterKeyMapping("hideveh", "op-garages", "KEYBOARD", "E")
                        RegisterCommand('hideveh', function()
                            if ableToOpenGarage then
                                debugLog("Hiding vehicle command triggered")
                                hideVeh()
                            end
                        end)
                    end
                    ableToOpenGarage = true

                    if Config.Misc.Target ~= "none" then
                        debugLog("Adding target for garage",
                                {garage = k, type = v.Type})
                        if v.Type == "Vehicle" then
                            if not v.OneSpawn then addTarget(v, k) else addTarget2(v, k) end
                            Citizen.CreateThread(function()
                                while ableToOpenGarage do
                                    local playerPed = PlayerPedId()
                                    local isInVeh = IsPedInAnyVehicle(playerPed)
                                    if CreatedZones[k .. "_type"] then
                                        if not v.OneSpawn then
                                            if CreatedZones[k .. "_type"] == "notVeh" and isInVeh then
                                                addTarget(v, k)
                                            elseif CreatedZones[k .. "_type"] == "inVeh" and not isInVeh then
                                                addTarget(v, k)
                                            end
                                        else
                                            if CreatedZones[k .. "_type"] == "notVeh" and isInVeh then
                                                addTarget2(v, k)
                                            end
                                        end
                                    end
                                    Wait(200)
                                end
                            end)
                        else
                            if IsPedInAnyVehicle(playerPed) then
                                addTarget(v, k)
                            end
                        end
                    elseif not isPressFuncAdded then
                        debugLog("Adding press function")
                        pressFunction()
                    end
                else
                    debugLog("Player is outside the garage zone", {garage = k})
                    if ableToOpenGarage == true then
                        local playerPed = PlayerPedId()
                        if v.Type == "Vehicle" and not v.OneSpawn then
                            if IsPedInAnyVehicle(playerPed) then
                                hideHint(true, TranslateIt('press_to_hide_Vehicle'))
                                debugLog("Hiding hint for vehicle", {
                                    hint = TranslateIt('press_to_hide_Vehicle')
                                })
                            else
                                hideHint(true, TranslateIt('press_to_open_Vehicle'))
                                debugLog("Hiding hint for vehicle", {
                                    hint = TranslateIt('press_to_open_Vehicle')
                                })
                            end
                        else
                            Wait(50)
                            if IsPedInAnyVehicle(playerPed) then
                                hideHint(true)
                                debugLog("Hiding hint as player is in vehicle", {
                                    hint = TranslateIt('press_to_open_' .. v.Type)
                                })
                            end
                        end
                    end
                    if Config.Misc.Target ~= "none" then
                        if (v.Type ~= "Vehicle" or v.OneSpawn and v.Type == "Vehicle") and v.DisablePed ~= true then hideHint() end
                        debugLog("Removing target", {target = k})
                        remTarget(k)
                    end
                    ableToOpenGarage = false
                end
            end)
        end
    end
end

---------------------------------------------------
-- TARGET FUNCTIONS
---------------------------------------------------

function remTarget2(name)
    debugLog("Removing target", {name = name})
    if Config.Misc.Target ~= "none" then
        local t = CreatedZonesPeds[name]
        if t then
            debugLog("Removing target zone", {target = t})
            removeTarget(t)
        end
        CreatedZonesPeds[name] = nil
        debugLog("Cleared created zones for target", {name = name})
    end
end

function remTarget(name)
    debugLog("Removing target", {name = name})
    if Config.Misc.Target ~= "none" then
        local t = CreatedZones[name]
        if t then
            debugLog("Removing target zone", {target = t})
            removeTarget(t)
        end
        CreatedZones[name .. "_type"] = nil
        CreatedZones[name] = nil
        debugLog("Cleared created zones for target", {name = name})
    end
end

function addTarget2(target, name)
    debugLog("Adding target", {target = target, name = name})
    if Config.Misc.Target ~= "none" then
        if target.Type == "Vehicle" then
            local playerPed = PlayerPedId()
            if CreatedZones[name .. "_type"] ~= nil then
                debugLog("Removing existing target for type", {
                    existingType = CreatedZones[name .. "_type"],
                    name = name
                })
                removeTarget(CreatedZones[name])
            end

            if IsPedInAnyVehicle(playerPed) and
                
                (CreatedZones[name .. "_type"] == "notVeh" or
                    CreatedZones[name .. "_type"] == nil) then
                CreatedZones[name .. "_type"] = "inVeh"
                CreatedZones[name] = addTargetTyped("garage_" .. name, vec3(
                                                        target.CenterOfZone.x,
                                                        target.CenterOfZone.y,
                                                        target.CenterOfZone.z),
                                                    vec3(70.0, 70.0, 70.0),
                                                    Config.Misc.Icons[target.Type],
                                                    TranslateIt(
                                                        'garage_hide_target_' ..
                                                            target.Type),
                                                    function()
                    debugLog("Hide vehicle action triggered")
                    hideVeh()
                end)
                debugLog("Added target for vehicle in garage",
                         {name = name, type = "inVeh"})
            else 
                CreatedZones[name .. "_type"] = "notVeh"
            end
        end
    end
end

function addTarget(target, name)
    debugLog("Adding target", {target = target, name = name})
    if Config.Misc.Target ~= "none" then
        if target.Type == "Vehicle" then
            local playerPed = PlayerPedId()
            if CreatedZones[name .. "_type"] ~= nil then
                debugLog("Removing existing target for type", {
                    existingType = CreatedZones[name .. "_type"],
                    name = name
                })
                removeTarget(CreatedZones[name])
            end

            if IsPedInAnyVehicle(playerPed) and
                (CreatedZones[name .. "_type"] == "notVeh" or
                    CreatedZones[name .. "_type"] == nil) then
                CreatedZones[name .. "_type"] = "inVeh"
                CreatedZones[name] = addTargetTyped("garage_" .. name, vec3(
                                                        target.CenterOfZone.x,
                                                        target.CenterOfZone.y,
                                                        target.CenterOfZone.z),
                                                    vec3(70.0, 70.0, 70.0),
                                                    Config.Misc.Icons[target.Type],
                                                    TranslateIt(
                                                        'garage_hide_target_' ..
                                                            target.Type),
                                                    function()
                    debugLog("Hide vehicle action triggered")
                    hideVeh()
                end)
                debugLog("Added target for vehicle in garage",
                         {name = name, type = "inVeh"})
            elseif not IsPedInAnyVehicle(playerPed) and
                (CreatedZones[name .. "_type"] == "inVeh" or
                    CreatedZones[name .. "_type"] == nil) then
                CreatedZones[name .. "_type"] = "notVeh"
                CreatedZones[name] = addTargetTyped("garage_" .. name, vec3(
                                                        target.CenterOfZone.x,
                                                        target.CenterOfZone.y,
                                                        target.CenterOfZone.z),
                                                    vec3(70.0, 70.0, 70.0),
                                                    Config.Misc.Icons[target.Type],
                                                    TranslateIt(
                                                        'garage_open_target_' ..
                                                            target.Type),
                                                    function()
                    debugLog("Open garage action triggered")
                    openGarage()
                end)
                debugLog("Added target for vehicle outside garage",
                         {name = name, type = "notVeh"})
            end
        else
            if CreatedZones[name] == nil then
                CreatedZones[name] = addTargetTyped(target.Type .. name, vec3(
                                                        target.CenterOfZone.x,
                                                        target.CenterOfZone.y,
                                                        target.CenterOfZone.z +
                                                            5.0),
                                                    vec3(70.0, 70.0, 70.0),
                                                    Config.Misc.Icons[target.Type],
                                                    TranslateIt(
                                                        'garage_hide_target_' ..
                                                            target.Type),
                                                    function()
                    debugLog("Hide vehicle action triggered")
                    hideVeh()
                end)
                debugLog("Added non-vehicle target", {name = name})
            end
        end
    end
end

function pressFunction()
    debugLog("Configuring press function")
    if Config.Misc.Target == "none" then
        if not isPressFuncAdded then
            isPressFuncAdded = true
            RegisterKeyMapping("garage", "op-garages", "KEYBOARD", "E")
            RegisterCommand('garage', function()
                if ableToOpenGarage and (CurrentGarage.data.Type == "Vehicle" and not CurrentGarage.data.OneSpawn) then
                    debugLog("Open garage command triggered")
                    openGarage()
                end
            end)
            debugLog("Registered key mapping and command for garage")
        end
    end
end

---------------------------------------------------
-- OPEN GARAGE AND HIDE VEH FUNCTIONS
---------------------------------------------------

function hideVeh()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(playerPed)
    if IsPedInAnyVehicle(playerPed) then
        if GetEntitySpeed(vehicle) < 1.0 then
            debugLog("hideVeh: Player is in a vehicle with speed less than 1.0")
            hideCurrentVehicle()
        else
            debugLog("hideVeh: Vehicle speed is above 1.0")
            sendNotify(TranslateIt('stop_veh'), "error", 5000)
        end
    else
        debugLog("hideVeh: Player is not in a vehicle")
    end
end

function openGarage()

    if cooldown then return end

    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(playerPed)

    debugLog("openGarage function called")
    debugLog("PlayerPedId:", playerPed)
    debugLog("IsPedInAnyVehicle:", IsPedInAnyVehicle(playerPed))

    if not IsPedInAnyVehicle(playerPed) then
        debugLog("Player is not in a vehicle")

        Fr.TriggerServerCallback('op-garages:getVehicles', function(d)
            debugLog("Callback triggered with data:", json.encode(d))

            if #d < 1 then
                sendNotify(TranslateIt('novehicles'), "error", 5000)
                debugLog("No vehicles found for the player")
                return
            end

            hideHint()
            isInGarage = true
            hudToggle(false)

            local counter = {imp = 0, gar = 0}
            local vehiclesConfig = Config.Vehicles
            local categoriesConfig = Config.VehiclesCategories

            debugLog("Vehicle Configurations:", vehiclesConfig)
            debugLog("Categories Configurations:", categoriesConfig)

            for i = 1, #d do
                if not d[i] then
                    debugLog("Vehicle cannot be processed")
                else
                    local vehicleData = d[i]
                    local vehicle = Config.FrameWork == "ESX" and
                                        json.decode(vehicleData.vehicle) or
                                        json.decode(vehicleData.mods)
                    local displayName, model

                    if Config.FrameWork == "ESX" then
                        if vehicle and vehicle.model then
                            model = tostring(vehicle.model)
                            displayName =
                                GetDisplayNameFromVehicleModel(vehicle.model)
                        else
                            debugLog(
                                "Invalid vehicle data detected. Skipping it.")
                        end
                    else
                        if vehicleData.vehicle and vehicleData.hash then
                            model = tostring(vehicleData.vehicle)
                            displayName =
                                GetDisplayNameFromVehicleModel(
                                    vehicleData.vehicle)
                        else
                            debugLog(
                                "Invalid vehicle data detected. Skipping it.")
                        end
                    end

                    if model ~= nil and displayName ~= nil then
                        debugLog("Processing vehicle", i)
                        debugLog("Model:", model)
                        debugLog("Display Name:", displayName)

                        local vehicleConfig =
                            vehiclesConfig[model] or vehiclesConfig[displayName] or
                                vehiclesConfig[string.lower(displayName)]

                        if vehicleConfig then
                            vehicleData.label =
                                vehicleConfig.label or displayName
                            vehicleData.bg = vehicleConfig.image
                            local brand = vehicleConfig.brand

                            if categoriesConfig[brand] then
                                vehicleData.logo = categoriesConfig[brand].logo
                                vehicleData.brand = brand
                            else
                                debugLog("Brand not found in categoriesConfig:",
                                         brand)
                                vehicleData.logo = nil
                                vehicleData.brand = "Unknown"
                            end
                        else
                            vehicleData.label = displayName
                            debugLog(
                                "No specific vehicle config found, using display name")
                        end

                        if vehicleData.state == 0 then
                            counter.gar = counter.gar + 1
                        else
                            counter.imp = counter.imp + 1
                        end

                        debugLog("Updated Counter - Gar:", counter.gar, "Imp:",
                                 counter.imp)
                    else
                        debugLog('Ignoring veh with data: '..DisplayName .. " / " .. model .. " / " .. json.decode(vehicleData))
                    end
                end
            end

            vehicles = d

            debugLog("Final vehicles data:", vehicles)

            if #d > 0 then
                selectCar(d[1].plate)
                debugLog("Selected first car with plate:", d[1].plate)
            end

            if Config.PlayerAnimation.Toggle then
                playAnim(Config.PlayerAnimation.Dict,
                         Config.PlayerAnimation.Lib, "player",
                         Config.PlayerAnimation.Prop, 1)
                debugLog("Player animation played")
            end

            SendNUIMessage({
                action = "openGarage",
                label = TranslateIt("garage_header_" .. CurrentGarage.data.Type),
                icon = Config.Misc.Icons[CurrentGarage.data.Type],
                data = d,
                counter = counter,
                type = CurrentGarage.data.Type,
                owner = CurrentGarage.data.Owner
            })

            debugLog("Sent NUI message with garage data")

            SetNuiFocus(true, true)
            debugLog("Set NUI focus to true")
        end, CurrentGarage.data.Type, CurrentGarage.data.Owner)
    else
        debugLog("Player is in a vehicle, cannot open garage")
    end

    cooldown = true
    Citizen.SetTimeout(2000, function()
        cooldown = false
    end)
end

function hideCurrentVehicle()
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    local vehicleProps = Fr.GetVehicleProperties(vehicle)
    local plate = vehicleProps.plate
    local playerVehType = GetVehicleType(vehicle)
    local vehfuel = getFuel(vehicle)
    print(vehfuel)
    vehicleProps.fuelLevel = vehfuel

    debugLog("hideCurrentVehicle function called")
    debugLog("PlayerPedId:", playerPed)
    debugLog("Vehicle:", vehicle)
    debugLog("Vehicle Properties:", vehicleProps)
    debugLog("Plate:", plate)
    debugLog("Player Vehicle Type:", playerVehType)
    debugLog("Current Garage Type:", CurrentGarage.data.Type)
    debugLog("Vehicle fuel level:", vehfuel)

    if vehTypes[playerVehType] ~= CurrentGarage.data.Type then
        debugLog("Vehicle type does not match current garage type")
        return
    end

    Fr.TriggerServerCallback('op-garages:checkIfVehicleIsOwned',
                             function(owned)
        debugLog("Ownership check result:", owned)

        if owned ~= nil then
            if Config.Misc.Target ~= "none" then
                debugLog("Hiding hint")
                hideHint(true)
            else
                debugLog("Showing hint:", TranslateIt(
                             "press_to_open_" .. CurrentGarage.data.Type))
                showHint(
                    TranslateIt("press_to_open_" .. CurrentGarage.data.Type),
                    false)
            end

            removeKeys(vehicle, vehicleProps.model, plate)

            if CurrentGarage.data.Type == "Vehicle" and not CurrentGarage.data.OneSpawn then
                debugLog("Processing for vehicle type")
                TaskLeaveVehicle(playerPed, vehicle, 1)
                Wait(1000)
                debugLog("Fading out entity")
                fadeOutEntity(vehicle, false)
                debugLog("Deleting vehicle")
                Fr.DeleteVehicle(vehicle)
            else
                debugLog("Processing for non-vehicle type")
                DoScreenFadeOut(300)
                Wait(400)
                local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
                for seat = -1, maxSeats - 1 do
                    local pedVeh = GetPedInVehicleSeat(vehicle, seat)
                    local coords = CurrentGarage.data.AccessCoords.xyz
                    local forward = nil
                    local k = CurrentGarage.name
                    if ped[k] then
                        if ped[k].pedForward then
                            forward = ped[k].pedForward
                        end
                    end

                    if Config.Misc.Peds.Toggle and forward ~= nil then
                        coords = vector3(coords.x + (forward.x * 1.2),
                                         coords.y + (forward.y * 1.2), coords.z)
                    end

                    if pedVeh and pedVeh ~= 0 then
                        debugLog("Setting entity coordinates for pedVeh")
                        SetEntityCoords(pedVeh, coords, false, false, false,
                                        true)
                    end
                end
                debugLog("Deleting vehicle")
                Fr.DeleteVehicle(vehicle)
                Wait(300)
                debugLog("Screen fade in")
                DoScreenFadeIn(300)
            end
        else
            debugLog("Not the vehicle owner")
            sendNotify(TranslateIt('not_owner'), "error", 5000)
        end
    end, vehicleProps.plate, vehicleProps, CurrentGarage.data.Owner)
end

---------------------------------------------------
-- SHOWING VEHICLE IN GARAGE UI FUNCTION
---------------------------------------------------

function selectCar(plate)
    if isInGarage then
        local found = false
        if CurrentVehicle ~= nil then
            debugLog("Deleting current vehicle")
            Fr.DeleteVehicle(CurrentVehicle.spawned)
            CurrentVehicle = nil
        end

        for k, v in pairs(vehicles) do
            if v.plate == plate then
                found = true
                CurrentVehicle = v
                debugLog("Found vehicle with plate:", plate)
            end
        end

        local vehicleEncode = Config.FrameWork == "ESX" and json.decode(CurrentVehicle.vehicle) or json.decode(CurrentVehicle.mods)

        if found then
            
            local playerPed = PlayerPedId()

            if cam == nil then
                if CurrentGarage.data.Type == "Vehicle" and not CurrentGarage.data.OneSpawn then
                    local playerPos = GetEntityCoords(playerPed)
                    local playerHeading = GetEntityHeading(playerPed) + 40.0
                    local offsetAngle = 360.0
                    local offsetDistance = 2.0

                    local angleRad = math.rad(playerHeading + offsetAngle)
                    local coords = vector3(
                                       playerPos.x + offsetDistance *
                                           math.cos(angleRad), playerPos.y +
                                           offsetDistance * math.sin(angleRad),
                                       playerPos.z - 1)
                    CurrentTemporaryCoords = coords
                    CurrentTemporaryHeading = playerHeading
                    debugLog("Temporary coords set for vehicle spawn:", coords)
                else
                    CurrentTemporaryCoords = vec3(
                                                 CurrentGarage.data.SpawnCoords
                                                     .x, CurrentGarage.data
                                                     .SpawnCoords.y,
                                                 CurrentGarage.data.SpawnCoords
                                                     .z)
                    CurrentTemporaryHeading = CurrentGarage.data.SpawnCoords.w
                    debugLog("Temporary coords set for non-vehicle spawn:",
                             CurrentTemporaryCoords)
                end
            end

            Fr.SpawnVehicle(vehicleEncode.model, CurrentTemporaryCoords,
                            CurrentTemporaryHeading, false, function(vehicle)
                debugLog("Vehicle spawned with model:", vehicleEncode.model)
                SetEntityAlpha(vehicle, 0, false)
                SetEntityHeading(vehicle, CurrentTemporaryHeading)
                Fr.SetVehicleProperties(vehicle, vehicleEncode)
                CurrentVehicle.spawned = vehicle
                CurrentVehicle.networkid =
                    NetworkGetNetworkIdFromEntity(vehicle)
                if CurrentGarage.data.Type ~= "Boat" then
                    FreezeEntityPosition(vehicle, true)
                end
                SetEntityCompletelyDisableCollision(vehicle, false)

                if cam == nil then
                    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                    local offset
                    if CurrentGarage.data.Type == "Vehicle" then
                        offset = GetOffsetFromEntityInWorldCoords(vehicle, 9.0,
                                                                  9.0, 0.4)
                    else
                        offset = GetOffsetFromEntityInWorldCoords(vehicle, 19.0,
                                                                  19.0, 0.4)
                    end
                    local boneIndex = GetEntityBoneIndexByName(vehicle,
                                                               "wheel_rr")
                    local CamCoords = CurrentTemporaryCoords
                    if boneIndex ~= -1 then
                        CamCoords = GetWorldPositionOfEntityBone(vehicle,
                                                                 boneIndex)
                    end

                    local rightOffset = 1.50
                    local vehicleHeading = GetEntityHeading(vehicle)
                    local angleRad = math.rad(vehicleHeading)

                    local targetX = CamCoords.x + rightOffset *
                                        math.cos(angleRad + math.pi / 2)
                    local targetY = CamCoords.y + rightOffset *
                                        math.sin(angleRad + math.pi / 2)
                    local targetZ = CamCoords.z

                    SetCamActive(cam, true)
                    SetCamCoord(cam, offset.x, offset.y, offset.z)
                    PointCamAtCoord(cam, targetX, targetY, targetZ + 1.0)
                    RenderScriptCams(true, true, 1000, true, true)
                    SetCamFov(cam, 20.0)
                    debugLog("Camera setup with coords:", offset,
                             "and point at:", targetX, targetY, targetZ + 1.0)
                end

                if CurrentVehicle.state == 0 then
                    debugLog("Fading in vehicle with state 0")
                    fadeInEntity(vehicle, false)
                else
                    debugLog("Fading in vehicle with state 1")
                    fadeInEntity(vehicle, true)
                end
            end)
        else
            debugLog("Vehicle with plate not found:", plate)
        end
    end
end

---------------------------------------------------
-- SPAWNING VEHICLE
---------------------------------------------------

function spawnCar(plate)
    local found = false
    if CurrentVehicle ~= nil then
        debugLog("Deleting current vehicle")
        Fr.DeleteVehicle(CurrentVehicle.spawned)
        CurrentVehicle = nil
    end

    for k, v in pairs(vehicles) do
        if v.plate == plate then
            found = true
            CurrentVehicle = v
            debugLog("Found vehicle with plate:", plate)
        end
    end

    if (CurrentGarage.data.Type ~= "Vehicle" or CurrentGarage.data.OneSpawn and CurrentGarage.data.Type == "Vehicle") then
        showHint(TranslateIt("press_to_hide_" .. CurrentGarage.data.Type))
    else
        showHint(TranslateIt("press_to_hide_" .. CurrentGarage.data.Type), false)
    end

    if found then
        local vehicleEncode = Config.FrameWork == "ESX" and json.decode(CurrentVehicle.vehicle) or json.decode(CurrentVehicle.mods)
        if CurrentVehicle.state == 0 then
            
            local spawnCoords = CurrentTemporaryCoords

            if CurrentGarage.data.Type ~= "Vehicle" or CurrentGarage.data.OneSpawn then
                spawnCoords = getCoordsToSpawn()
            end

            debugLog("Spawning vehicle at coords:", spawnCoords,
                     "with heading:", CurrentTemporaryHeading)
            Fr.SpawnVehicle(vehicleEncode.model, spawnCoords.xyz,
                            CurrentTemporaryHeading, true, function(vehicle)
                local playerPed = PlayerPedId()
                SetEntityHeading(vehicle, CurrentTemporaryHeading)
                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                setFuel(vehicle, vehicleEncode.fuelLevel)
                giveKeys(vehicle, vehicleEncode.model, vehicleEncode.plate)
                Fr.SetVehicleProperties(vehicle, vehicleEncode)

                if Config.FrameWork == "QBCORE" then
                    TriggerServerEvent(
                        'qb-vehiclekeys:server:AcquireVehicleKeys',
                        vehicleEncode.plate)
                    TriggerServerEvent('qb-vehiclekeys:server:setVehLockState',
                                       NetworkGetNetworkIdFromEntity(vehicle), 1)
                    debugLog("QBCORE: Set vehicle lock state for plate:",
                             vehicleEncode.plate)
                end

                local networkid = NetworkGetNetworkIdFromEntity(vehicle)
                TriggerServerEvent("op-garages:removeCarFromParking", plate,
                                   networkid)
                debugLog("Removed car from parking with plate:", plate,
                         "and network ID:", networkid)
            end)
        end
    else
        debugLog("Vehicle with plate not found:", plate)
    end
end

function getCoordsToSpawn()
    if CurrentGarage.data.AlternativeSpawnCoords then
        local found = false
        local Count = 0 
        for k, v in pairs(CurrentGarage.data.AlternativeSpawnCoords) do
            if not IsAnyVehicleNearPoint(v.x, v.y, v.z, 4.0) then
                found = true
                return v
            end
        end
        if found == false then
            return CurrentGarage.data.SpawnCoords
        end
    else
        return CurrentGarage.data.SpawnCoords
    end
end

---------------------------------------------------
-- NUI CALLBACKS
---------------------------------------------------

RegisterNUICallback('closeGarage', function(data, cb)
    cb('ok')
    debugLog("Closing garage")
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 1000, true, true)
    cam = nil
    isInGarage = false
    SetNuiFocus(false, false)
    hudToggle(true)
    stopPlayerAnim()
    fadeOutEntity(CurrentVehicle.spawned)
    showHint(TranslateIt("press_to_open_" .. CurrentGarage.data.Type), false)
    debugLog("Deleting current vehicle")
    Fr.DeleteVehicle(CurrentVehicle.spawned)
end)

RegisterNUICallback('enterShowroom', function(data, cb)
    cb('ok')
    debugLog("Entering showroom")
    enterShoowRoom()
end)

RegisterNUICallback('takeCar', function(data, cb)
    cb('ok')
    debugLog("Taking car with plate:", data.plate)
    spawnCar(data.plate)
    hudToggle(true)
    SetCamActive(cam, false)
    stopPlayerAnim()
    RenderScriptCams(false, true, 1000, true, true)
    cam = nil
    SetNuiFocus(false, false)
end)

RegisterNUICallback('repairCar', function(data, cb)
    debugLog("Repairing car with plate:", data.plate)
    Fr.TriggerServerCallback('op-garages:repairVehicle', function(d)
        if d ~= false then
            SendNUIMessage({action = "repairStart", plate = data.plate})
            Wait(Config.Misc.RepairTime * 1000)
            updateVehicle(data.plate, d)
            SendNUIMessage({action = "repairEndSuccess", plate = data.plate})
            sendNotify(TranslateIt('repairEndSuccess', data.plate), "success",
                       5000)
        elseif d == nil then
            SendNUIMessage({action = "repairNoMoney", plate = data.plate})
        else
            SendNUIMessage({action = "repairNoMoney", plate = data.plate})
            sendNotify(TranslateIt('repairNoMoney'), "error", 5000)
        end
    end, data.plate)
    cb('ok')
end)

RegisterNUICallback('impoundCar', function(data, cb)
    cb('ok')
    if not isTowing then
        debugLog("Impounding car with plate:", data.plate)
        Fr.TriggerServerCallback('op-garages:towVehicle', function(id)
            SendNUIMessage({action = "startImpounding", plate = data.plate})
            isTowing = true
            if id == "no founds" then
                Citizen.Wait(3000)
                SendNUIMessage({
                    action = "impoundEnd",
                    plate = data.plate,
                    state = false
                })
                sendNotify(TranslateIt('no_money'), "error", 5000)
            else
                if id ~= nil then
                    local entity = NetworkGetEntityFromNetworkId(tonumber(id))
                    sendNotify(TranslateIt('checking_veh'), "info", 5000)
                    Citizen.Wait(Config.Misc.TowingTime * 1000)
                    if entity == 0 then
                        TriggerServerEvent('op-garages:updateState', data.plate)
                        isTowing = false
                        SendNUIMessage({
                            action = "impoundEnd",
                            plate = data.plate,
                            state = true
                        })
                        changeState(data.plate)
                        if CurrentVehicle.plate == data.plate then
                            selectCar(data.plate)
                        end
                        sendNotify(TranslateIt('veh_impounded', data.plate),
                                   "success", 5000)
                    elseif entity ~= 0 and GetVehicleNumberOfPassengers(entity) >
                        0 then
                        sendNotify(TranslateIt('cant_impound'), "error", 5000)
                        SendNUIMessage({
                            action = "impoundEnd",
                            plate = data.plate,
                            state = false
                        })
                        isTowing = false
                    else
                        TriggerServerEvent('op-garages:updateState', data.plate)
                        sendNotify(TranslateIt('veh_impounded', data.plate),
                                   "success", 5000)
                        if entity ~= 0 then
                            Fr.DeleteVehicle(entity)
                        end
                        changeState(data.plate)
                        SendNUIMessage({
                            action = "impoundEnd",
                            plate = data.plate,
                            state = true
                        })
                        isTowing = false
                        if CurrentVehicle.plate == data.plate then
                            selectCar(data.plate)
                        end
                    end
                else
                    sendNotify(TranslateIt('checking_veh'), "info", 5000)
                    Citizen.Wait(Config.Misc.TowingTime * 1000)
                    TriggerServerEvent('op-garages:updateState', data.plate)
                    isTowing = false
                    SendNUIMessage({
                        action = "impoundEnd",
                        plate = data.plate,
                        state = true
                    })
                    if CurrentVehicle.plate == data.plate then
                        selectCar(data.plate)
                    end
                    changeState(data.plate)
                    sendNotify(TranslateIt('veh_impounded', data.plate),
                               "success", 5000)
                end
            end
        end, data.plate, CurrentGarage.data.Owner)
    end
end)

RegisterNUICallback('selectCar', function(data, cb)
    cb('ok')
    debugLog("Selecting car with plate:", data.plate)
    selectCar(data.plate)
end)

---------------------------------------------------
-- UTILS
---------------------------------------------------

local isHintShowedNow = false
local currentTextOnHint = nil

function showHint(text, force, text2)
    debugLog("showHint called with text: " .. text .. ", force: " ..
                 tostring(force))
    if Config.Misc.Target == "none" or force then
        if currentTextOnHint ~= text then
            isHintShowedNow = true
            currentTextOnHint = text
            SendNUIMessage({action = "showHintNow", data = text})
            debugLog("Hint shown: " .. text)
        else
            debugLog("Ignoring showHint: same text as current.")
        end
    else
        debugLog("Ignoring showHint: target is not 'none' and force is false.")
    end
end

function hideHint(force, withSpecific)
    debugLog("hideHint called with force: " .. tostring(force) ..
                 ", withSpecific: " .. tostring(withSpecific))
    if Config.Misc.Target == "none" or force then
        if isHintShowedNow then
            if withSpecific then
                if withSpecific == currentTextOnHint then
                    isHintShowedNow = false
                    currentTextOnHint = "none"
                    SendNUIMessage({action = "hideHint"})
                    debugLog("Specific hint hidden: " .. withSpecific)
                end
            else
                isHintShowedNow = false
                currentTextOnHint = "none"
                SendNUIMessage({action = "hideHint"})
                debugLog("Hint hidden: no specific hint provided.")
            end
        end
    end
end

function updateVehicle(plate, vehicle)
    debugLog("updateVehicle called with plate: " .. plate)
    for k, v in pairs(vehicles) do
        if v.plate == plate then
            vehicles[k].vehicle = vehicle
            if CurrentVehicle.plate == plate then selectCar(plate) end
            debugLog("Vehicle updated: " .. plate)
        end
    end
end

function changeState(plate)
    debugLog("changeState called with plate: " .. plate)
    for k, v in pairs(vehicles) do
        if v.plate == plate then
            vehicles[k].state = 0
            debugLog("Vehicle state changed to 0 for plate: " .. plate)
        end
    end
end

function fadeOutEntity(entity, half)
    if DoesEntityExist(entity) then
        debugLog("fadeOutEntity called for entity: " .. tostring(entity) ..
                     ", half: " .. tostring(half))
        if not half then
            for i = 0, 85 do
                local alpha = 255 - (i * 3)
                SetEntityAlpha(entity, alpha, false)
                Citizen.Wait(1)
            end
        else
            for i = 0, 180 do
                local alpha = 255 - i
                SetEntityAlpha(entity, alpha, false)
                Citizen.Wait(1)
            end
        end
        debugLog("Entity faded out.")
    else
        debugLog("Entity does not exist.")
    end
end

function fadeInEntity(entity, half)
    if DoesEntityExist(entity) then
        debugLog("fadeInEntity called for entity: " .. tostring(entity) ..
                     ", half: " .. tostring(half))
        if not half then
            for i = 0, 85 do
                local alpha = math.min(i * 3, 255)
                SetEntityAlpha(entity, alpha, false)
                Citizen.Wait(1)
            end
            SetEntityAlpha(entity, 255, false)
            ResetEntityAlpha(entity)
        else
            for i = 0, 180 do
                local alpha = i
                SetEntityAlpha(entity, alpha, false)
                Citizen.Wait(1)
            end
        end
        debugLog("Entity faded in.")
    else
        debugLog("Entity does not exist.")
    end
end

function spawnPed(name, data)
    debugLog("spawnPed called with name: " .. name .. ", data: " ..
                 json.encode(data))
    local genderNum = 0
    local model = GetHashKey(data.Model)
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(1) end

    if data.Gender == 'male' then
        genderNum = 4
    elseif data.Gender == 'female' then
        genderNum = 5
    else
        debugLog("No gender provided! Check your configuration!")
    end

    local CreatedPed = CreatePed(genderNum, model, data.Coords, data.Heading,
                                 false, true)

    ped[name].ped = CreatedPed
    ped[name].pedForward = GetEntityForwardVector(CreatedPed)
    ped[name].generated = true
    ped[name].name = name

    FreezeEntityPosition(CreatedPed, true)
    SetEntityInvincible(CreatedPed, true)
    SetBlockingOfNonTemporaryEvents(CreatedPed, true)
    SetPedDefaultComponentVariation(CreatedPed)

    if data.Weapon then
        local hash = data.Weapon
        GiveWeaponToPed(CreatedPed, hash, 1, false, true)
        SetCurrentPedWeapon(CreatedPed, hash, true)
        debugLog("Weapon given to ped: " .. hash)
    end

    if data.Animation then
        playAnim(data.Animation.Dict, data.Animation.Lib, name,
                 data.Animation.Prop, 1)
    end
end

local playerAnim = nil

function playAnim(dict, lib, pedName, prop, movement)
    debugLog("playAnim called with dict: " .. dict .. ", lib: " .. lib ..
                 ", pedName: " .. pedName)
    local playerped = nil

    if pedName == "player" then
        playerped = PlayerPedId()
        playerAnim = {}
    else
        playerped = ped[pedName].ped
    end

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Citizen.Wait(1) end

    TaskPlayAnim(playerped, dict, lib, 1.0, 1.0, -1, movement, 1.0, false,
                 false, false)
    RemoveAnimDict(dict)
    debugLog("Animation played: " .. dict .. " - " .. lib)

    if prop then
        PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(
                                                                   prop.PropPlacement)
        local GenProp = CreateObject(GetHashKey(prop.Prop), 0, 0, 0, true, true,
                                     true)
        AttachEntityToEntity(GenProp, playerped,
                             GetPedBoneIndex(playerped, prop.PropBone), PropPl1,
                             PropPl2, PropPl3, PropPl4, PropPl5, PropPl6, true,
                             true, false, true, 1, true)
        SetModelAsNoLongerNeeded(GenProp)
        if pedName ~= "player" then
            ped[pedName].prop = GenProp
        else
            playerAnim.prop = GenProp
        end
        debugLog("Prop created and attached: " .. prop.Prop)
    end
end

function stopPlayerAnim()
    debugLog("stopPlayerAnim called")
    local playerped = PlayerPedId()

    ClearPedTasks(playerped)

    if playerAnim then
        if playerAnim.prop then
            DetachEntity(playerAnim.prop, true, true)
            DeleteObject(playerAnim.prop)
            playerAnim.prop = nil
            debugLog("Player anim stopped and prop deleted.")
        end
    end
end

function deletePed(name)
    debugLog("deletePed called with name: " .. name)
    if name == "all" then
        for k, v in pairs(ped) do
            if v.generated then
                DeletePed(v.ped)
                ped[v.name].generated = false
                DeleteObject(ped[v.name].prop)
                ped[v.name].prop = nil
                debugLog("Deleted all peds and props.")
            end
        end
    else
        if ped[name].generated then
            DeletePed(ped[name].ped)
            DeleteObject(ped[name].prop)
            ped[name].prop = nil
            ped[name].generated = false
            debugLog("Deleted ped and prop: " .. name)
        end
    end
end

function getFuel(veh)
    if Config.FuelDependency == "cdn-fuel" then
        return exports['cdn-fuel']:GetFuel(veh)
    elseif Config.FuelDependency == "ox-fuel" then
        return Entity(veh).state.fuel
    elseif Config.FuelDependency == "none" then
        return GetVehicleFuelLevel(veh, level)
    elseif Config.FuelDependency == "LegacyFuel" then
        return exports["LegacyFuel"]:GetFuel(veh)
    elseif Config.FuelDependency == "qs-fuel" then
        return exports['qs-fuelstations']:GetFuel(veh)
    elseif Config.FuelDependency == "rcore-fuel" then
        return exports["rcore_fuel"]:GetVehicleFuelPercentage(veh)
    elseif Config.FuelDependency == "codem-xfuel" then
        return exports['x-fuel']:GetFuel(veh)
    end
end

function setFuel(veh, level)
    if level == nil then
        level = 50.0
    end

    if Config.FuelDependency == "cdn-fuel" then
        exports['cdn-fuel']:SetFuel(veh, level)
    elseif Config.FuelDependency == "ox-fuel" then
        Entity(veh).state.fuel = level
        SetVehicleFuelLevel(veh, level)
    elseif Config.FuelDependency == "none" then
        SetVehicleFuelLevel(veh, level)
    elseif Config.FuelDependency == "LegacyFuel" then
        exports["LegacyFuel"]:SetFuel(veh, level)
    elseif Config.FuelDependency == "qs-fuel" then
        exports['qs-fuelstations']:GetFuel(veh)
    elseif Config.FuelDependency == "rcore-fuel" then
        exports["rcore_fuel"]:SetVehicleFuel(veh, level)
    elseif Config.FuelDependency == "codem-xfuel" then
        exports['x-fuel']:SetFuel(veh, level)
    end
end

function giveKeys(vehicle, model, plate)
    if Config.KeysDependency == "qs-keys" then
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    elseif Config.KeysDependency == "qb-keys" or Config.KeysDependency ==
        "sna-vehiclekeys" then
        TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
    elseif Config.KeysDependency == "wasabi_carlock" then
        exports.wasabi_carlock:GiveKey(plate)
    end
end

function removeKeys(vehicle, model, plate)
    if Config.KeysDependency == "qs-keys" then
        exports['qs-vehiclekeys']:RemoveKeys(plate, model)
    elseif Config.KeysDependency == "qb-keys" or Config.KeysDependency ==
        "sna-vehiclekeys" then
        TriggerServerEvent('qb-vehiclekeys:server:RemoveKey', plate)
    elseif Config.KeysDependency == "wasabi_carlock" then
        exports.wasabi_carlock:RemoveKey(plate)
    end
end

-- SHOW ROOM 

local carsInShowRoom = {}
local CurrentGarageBeforeEnteringShoowroom = nil
local isInShowRoom = false

function enterShoowRoom()
    debugLog("enterShoowRoom called")

    CurrentGarageBeforeEnteringShoowroom = CurrentGarage
    isInShowRoom = true

    debugLog("Setting camera and rendering script cams")
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 1000, true, true)

    cam = nil
    isInGarage = false

    SetNuiFocus(false, false)
    hudToggle(true)
    stopPlayerAnim()
    fadeOutEntity(CurrentVehicle.spawned)
    Fr.DeleteVehicle(CurrentVehicle.spawned)

    DoScreenFadeOut(400)
    Wait(1000)
    TriggerServerEvent('op-garages:soloSession')

    local playerped = PlayerPedId()
    debugLog("Teleporting player to showroom entrance",
             Config.ShowRoom.EntranceCoords)
    SetEntityCoords(playerped, Config.ShowRoom.EntranceCoords.xyz, false, false,
                    false, true)
    SetEntityHeading(playerped, Config.ShowRoom.EntranceCoords.w)
    carsInShowRoom = {}

    Fr.TriggerServerCallback('op-garages:getVehicles', function(d)
        local MaxVehiclesInGarage = #Config.ShowRoom.ParkingSlots
        local spawnCount = math.min(MaxVehiclesInGarage, #d)
        debugLog("Received vehicles data, spawning " .. spawnCount ..
                     " vehicles")
        for i = 1, spawnCount do
            local vehicle2 = Config.FrameWork == "ESX" and json.decode(d[i].vehicle) or json.decode(d[i].mods)
            debugLog("Spawning vehicle", vehicle2)
            spawnVehInShowRoom(vehicle2, Config.ShowRoom.ParkingSlots[i].Coords,
                               d[i].state, d[i])
        end
        vehicles = d
        Wait(500)
        showHint(TranslateIt("showroom_leave_marker"), false)
    end, "Vehicle")

    DoScreenFadeIn(400)

    if Config.Misc.Target == "none" then
        while isInShowRoom do
            local PlayerPed = PlayerPedId()
            local coords = Config.ShowRoom.EntranceCoords.xyz
            local sleep = 600

            local dist = #(coords - GetEntityCoords(PlayerPed))

            if dist < 15.0 then
                sleep = 0
                local cfg = Config.ShowRoom.Marker
                DrawMarker(6, coords, 0.0, 0.0, 0.0, -90, 0, -90,
                           cfg.ZoneSize.x, cfg.ZoneSize.y, cfg.ZoneSize.z,
                           cfg.Color.r, cfg.Color.g, cfg.Color.b, 100, false,
                           false, 2, false, false, false, false)
                if dist < 2.0 then
                    if inMarkerOf ~= "showroom" then
                        inMarkerOf = "showroom"
                        showHint(TranslateIt("showroom_leave_marker"), false)
                    end
                    if IsControlJustReleased(0, 38) then
                        debugLog("Control pressed to leave showroom")
                        leaveShowRoom()
                    end
                else
                    if inMarkerOf == "showroom" then
                        inMarkerOf = nil
                        hideHint(false, TranslateIt("showroom_leave_marker"))
                    end
                end
            end
            Wait(sleep)
        end
    end
end

function spawnVehInShowRoom(vehicle, coords, state, Vehdata)
    debugLog("spawnVehInShowRoom called",
             {vehicle = vehicle, coords = coords, state = state})

    Fr.SpawnVehicle(vehicle.model, coords.xyz, coords.w, true, function(spawned)
        Fr.SetVehicleProperties(spawned, vehicle)
        SetEntityHeading(spawned, coords.w)
        SetEntityAlpha(spawned, 0, false)
        SetVehicleOnGroundProperly(spawned)
        SetVehicleDoorsLocked(spawned, 2)

        local isUnlocked = state == 0
        fadeInEntity(spawned, not isUnlocked)

        if Config.FrameWork == "QBCORE" then
            if isUnlocked then
                debugLog("Unlocking vehicle", vehicle.plate)
                TriggerServerEvent('qb-vehiclekeys:server:setVehLockState',
                                   NetworkGetNetworkIdFromEntity(spawned), 1)
            else
                debugLog("Locking vehicle", vehicle.plate)
                TriggerServerEvent('qb-vehiclekeys:server:setVehLockState',
                                   NetworkGetNetworkIdFromEntity(spawned), 2)
            end
        end

        table.insert(carsInShowRoom, spawned)

        local displayName, vehicleConfig
        if Config.FrameWork == "QBCORE" then
            displayName = GetDisplayNameFromVehicleModel(Vehdata.vehicle)
            vehicleConfig = Config.Vehicles[Vehdata.hash] or Config.Vehicles[displayName]
        else
            displayName = GetDisplayNameFromVehicleModel(vehicle.model)
            vehicleConfig = Config.Vehicles[vehicle.model] or Config.Vehicles[displayName]
        end

        local label = vehicleConfig and vehicleConfig.label or displayName
        local logo = vehicleConfig and
                         Config.VehiclesCategories[vehicleConfig.brand] and
                         Config.VehiclesCategories[vehicleConfig.brand].logo or
                         nil

        CreateThread(function()
            debugLog("Creating DUI for vehicle",
                     {plate = vehicle.plate, label = label, logo = logo})
            createVehicleDUI(spawned, vehicle.plate, label, logo)
        end)
    end)
end

function leaveShowRoom(plate)
    debugLog("leaveShowRoom called with plate: " .. tostring(plate))
    DoScreenFadeOut(400)
    Wait(1000)
    isInShowRoom = false
    for k, v in pairs(carsInShowRoom) do
        debugLog("Deleting vehicle", v)
        Fr.DeleteVehicle(v)
    end
    TriggerServerEvent("op-garages:soloSessionLeave")
    
    local backCoords = CurrentGarageBeforeEnteringShoowroom.data.CenterOfZone
    if CurrentGarage.data.OneSpawn then
        local forward = nil
        local k = CurrentGarage.name
        if ped[k] then
            if ped[k].pedForward then
                forward = ped[k].pedForward
            end
        end

        backCoords = CurrentGarage.data.AccessCoords
        if Config.Misc.Peds.Toggle and forward ~= nil then
            backCoords = vector3(backCoords.x + (forward.x * 1.2),backCoords.y + (forward.y * 1.2), backCoords.z)
        end
    end
    SetEntityCoords(PlayerPedId(),backCoords,false, false, false, true)
    if plate then
        CurrentGarage = CurrentGarageBeforeEnteringShoowroom
        CurrentTemporaryCoords = CurrentGarage.data.CenterOfZone
        debugLog("Spawning car in previous garage", plate)
        spawnCar(plate)
    end
    Wait(500)
    DoScreenFadeIn(400)
end

-- DUI

local duiUrl = string.format("https://cfx-nui-%s/ui/dui.html",
                             GetCurrentResourceName())
local screenWidth = math.floor(1920)
local screenHeight = math.floor(1080)
local Duis = {}

function getVehicleRoofCoords(vehicle)
    local min, max = GetModelDimensions(GetEntityModel(vehicle))
    local vehicleCoords = GetEntityCoords(vehicle)
    local roofCoords = vector3(vehicleCoords.x, vehicleCoords.y,
                               vehicleCoords.z + max.z)
    return roofCoords
end

function createVehicleDUI(vehicle, plate, label, logo)
    debugLog("createVehicleDUI called for plate: " .. plate .. ", label: " ..
                 tostring(label) .. ", logo: " .. tostring(logo))
    plate = string.gsub(plate, " ", "_")
    Duis[plate] = {}
    Duis[plate].duiObject = CreateDui(duiUrl, screenWidth, screenHeight)
    Duis[plate].duiHandle = GetDuiHandle(Duis[plate].duiObject)
    Duis[plate].logoConfirmed = false

    local txd = CreateRuntimeTxd('dui_texture_' .. plate)
    local duiTex = CreateRuntimeTextureFromDuiHandle(txd,
                                                     'dui_render_' .. plate,
                                                     Duis[plate].duiHandle)

    local todo = 100

    while DoesEntityExist(vehicle) do
        local sleep = 100
        local positionAboveCar = getVehicleRoofCoords(vehicle) +
                                     vector3(0.0, 0.0, 0.5)
        local onScreen, screenX, screenY =
            GetScreenCoordFromWorldCoord(positionAboveCar.x, positionAboveCar.y,
                                         positionAboveCar.z)
        local playerPed = PlayerPedId()
        local camCoord = GetGameplayCamCoord()
        local distance = #(positionAboveCar - camCoord)
        local playercoords = GetEntityCoords(PlayerPedId())
        local vehiclecoords = GetEntityCoords(vehicle)
        local distance2 = #(playercoords - vehiclecoords)
        local scale = math.max(0.1, 7.0 / distance)

        if distance2 < 10.0 then
            sleep = 0
            DrawSprite('dui_texture_' .. plate, 'dui_render_' .. plate, screenX,
                       screenY, scale, scale, 0.0, 255, 255, 255, 255)
        end

        if todo > 0 then
            todo = todo - 1
            SendDuiMessage(Duis[plate].duiObject, json.encode(
                               {action = "addInfo", label = label, logo = logo}))
        end

        Wait(sleep)
    end

    DestroyDui(Duis[plate].duiObject)
    Duis[plate].duiObject = nil
    Duis[plate].duiHandle = nil
    Duis[plate].logoConfirmed = nil
    debugLog("Destroyed DUI for plate: " .. plate)
end

RegisterKeyMapping("takeveh", "op-garages", "KEYBOARD", "W")
RegisterCommand('takeveh', function()
    if isInShowRoom then
        local playerped = PlayerPedId()
        if IsPedInAnyVehicle(playerped) then
            local vehicle = GetVehiclePedIsUsing(playerped)
            local plate = GetVehicleNumberPlateText(vehicle)
            debugLog("Take vehicle command executed with plate: " .. plate)
            leaveShowRoom(plate)
        end
    end
end)

Citizen.SetTimeout(5000, function()
    TriggerEvent('chat:removeSuggestion', '/hideveh')
    TriggerEvent('chat:removeSuggestion', '/garage')
    TriggerEvent('chat:removeSuggestion', '/takeveh')
end)

function debugLog(message, data)
    if Config.DebugMode then
        if data ~= nil then
            print("[DEBUG] " .. tostring(message) .. ": " .. tostring(data))
        else
            print("[DEBUG] " .. tostring(message))
        end
    end
end
