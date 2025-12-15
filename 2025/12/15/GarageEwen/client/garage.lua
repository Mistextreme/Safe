ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    PlayerData.job2 = job2
end)

local GarageFuntion = {}

local filterVehicle = {
    "Véhicules dans ce garage",
    "Véhicules dans un autre garage",
    "Véhicules en fourrière"
}

local tempTuning = {
    bodyHealth = true,
    engineHealth = true,
    tankHealth = true,
    fuelLevel = true,
    oilLevel = true,
    dirtLevel = true,
    windows = true,
    doors = true,
    tyres = true,
    bulletProofTyres = true
}

local function getVehiclePointClear (t)
    local point = nil

    for k, v in pairs(t) do
        if not ESX.Game.IsSpawnPointClear(vector3(v.pos.x, v.pos.y, v.pos.z), 2.0) then goto continue end

        point = v
        break

        ::continue::
    end

    return point
end

local tempHash = {}
Citizen.CreateThread(function()
    local vehiclesModelKey = GetAllVehicleModels()

    for i = 1, #vehiclesModelKey do
        local vehicleModelKey = vehiclesModelKey[i]
        local vehicleModel = GetHashKey(vehicleModelKey)

        tempHash[tostring(vehicleModel)] = vehicleModelKey
    end
end)

local function createCarTable(data, garageName, vehicleType)
    local tempData = {}
    for k,v in pairs(data) do
        local tempV = tostring(v.model)
        if (tempV) and tempHash[tempV] then
            v.model = tempHash[tostring(v.model)]
        end
        
        local isInThisGarage = (v.garage == garageName)
        table.insert(tempData, {
            id = k,
            name = v.label or v.model,
            inThisGarage = isInThisGarage,
            pound = not v.state,
            model = v.model,
            garage = v.garage or garageName,
            plate = v.plate,
            favorite = v.boutique,
            vehicleType = vehicleType,
            type = v.type or vehicleType
        })
    end
    return tempData
end

local currentGarage = nil
local currentGarageType = nil

AddEventHandler("ZgegFramework:garage:spawn", function(data)
    ESX.TriggerServerCallback("garages:getSpawnsPoint", function (pointData)
        if not data then return end

        local spawnPoint = getVehiclePointClear(pointData)
        if not spawnPoint then
            return ESX.ShowNotification("Le spawn du véhicule est bloqué")
        end 


        TriggerServerEvent("garage:takeOut", data.plate, spawnPoint)
        exports.fivem_ui:unloadApplication("garage", {})
    end, currentGarage, currentGarageType)
end)

RegisterNetEvent("ZgegFramework:garage:updateOneVehicle", function()
    exports.fivem_ui:emit("ZgegFramework:garage:updateVehicle", vehicles)
end)

local function openGarageMenu(garageName, garageType)
    
    local job = PlayerData.job and PlayerData.job.name or 'unemployed'
    local job2 = PlayerData.job2 and PlayerData.job2.name or 'unemployed2'

    currentGarage, currentGarageType = garageName, garageType

    exports.fivem_ui:loadApplication("garage", {
        color = "#FF00FF",
        societyCar = job ~= "unemployed",
        orgaCar = job2 ~= "unemployed2",
        vehHash = tempHash,
    })

    ESX.TriggerServerCallback("Loumout:GetPersonalVehicles", function(data)
        if data then
        local vehicles = createCarTable(data, currentGarage, "player")
        exports.fivem_ui:emit("ZgegFramework:garage:updateVehicle", vehicles)
        end
    end, currentGarageType)

    if job ~= "unemployed" then
        ESX.TriggerServerCallback("Loumout:GetSocietyVehicles", function(data)
            if data then
            local vehicles = createCarTable(data, currentGarage, "job")
            exports.fivem_ui:emit("ZgegFramework:garage:updateVehicleSociety", vehicles)
            end
        end, garageType)
    end

    if job2 ~= "unemployed2" then
        ESX.TriggerServerCallback("Loumout:GetOrgaVehicles", function(data)
            if data then
                local vehicles = createCarTable(data, currentGarage, "job2")
                exports.fivem_ui:emit("ZgegFramework:garage:updateVehicleOrga", vehicles)
            end
        end, garageType)
        ESX.TriggerServerCallback("Loumout:GetOrgaVehicles", function (data)
            if not data then return end
            local vehicles = createCarTable(data, currentGarage, "job2")

            exports.fivem_ui:emit("ZgegFramework:garage:updateVehicleOrga", vehicles)
        end, garageType)
    end

--[[
    local menu = RageUI.CreateMenu(nil, _("MENU_DESCRIPTION"))
    local menuPersonnal = RageUI.CreateSubMenu(menu, nil, _("MENU_DESCRIPTION"))
    local menuPersonnalSelected = RageUI.CreateSubMenu(menuPersonnal, nil, _("MENU_DESCRIPTION"))
    local menuEnterprise = RageUI.CreateSubMenu(menu, nil, _("MENU_DESCRIPTION"))
    local menuEnterpriseSelected = RageUI.CreateSubMenu(menuEnterprise, nil, _("MENU_DESCRIPTION"))
    local menuOrganisation = RageUI.CreateSubMenu(menu, nil, _("MENU_DESCRIPTION"))
    local menuOrganisationSelected = RageUI.CreateSubMenu(menuOrganisation, nil, _("MENU_DESCRIPTION"))

    local personnalVehicles = nil
    local enterpriseVehicles = nil
    local organisationVehicles = nil

    local currentIndexFilter = 1

    local selectedVehicle = nil

    local enterpriseCanDeleteVehicle = exports.EwenLeHir:societyHavePermission("deleteVehicle", job)
    local organisationCanDeleteVehicle = exports.EwenLeHir:societyHavePermission("deleteVehicle", job2)

    local colors = {
        r = ZGEG.config("r"),
        g = ZGEG.config("g"),
        b = ZGEG.config("b"),
    }

    RageUI.Visible(menu, true)

    Citizen.CreateThread(function ()
        while menu do
            RageUI.IsVisible(menu, function ()
                RageUI.Button(_("GARAGE_PERSONNAL_VEHICLE"), nil, {}, true, {
                    onSelected = function ()
                        if personnalVehicles then
                            RageUI.Visible(menuPersonnal, true)
                        else
                            ZGEG.TriggerServerCallback("garage:getPersonnalVehicles", function (data)
                                if not data then return end

                                personnalVehicles = data
                                RageUI.Visible(menuPersonnal, true)
                            end, garageType)
                        end
                    end
                })

                RageUI.Button(_("GARAGE_ENTERPRISE_VEHICLE"), nil, {}, job ~= "unemployed", {
                    onSelected = function ()
                        if enterpriseVehicles then
                            RageUI.Visible(menuEnterprise, true)
                        else
                            ZGEG.TriggerServerCallback("garage:getEnterprisesVehicles", function (data)
                                if not data then return end

                                enterpriseVehicles = data
                                RageUI.Visible(menuEnterprise, true)
                            end, garageType)
                        end
                    end
                })

                RageUI.Button(_("GARAGE_ORGANISATION_VEHICLES"), nil, {}, job2 ~= "unemployed2", {
                    onSelected = function ()
                        if organisationVehicles then
                            RageUI.Visible(menuOrganisation, true)
                        else
                            ZGEG.TriggerServerCallback("garage:getOrganisationVehicles", function (data)
                                if not data then return end

                                organisationVehicles = data
                                RageUI.Visible(menuOrganisation, true)
                            end, garageType)
                        end
                    end
                })
            end)

            RageUI.IsVisible(menuPersonnal, function ()
                if not personnalVehicles then
                    return RageUI.Separator(_("LOADING"))
                end

                RageUI.List(_("GARAGE_FILTER"), filterVehicle, currentIndexFilter, nil, {}, true, {
                    onListChange = function (index)
                        currentIndexFilter = index
                    end
                })

                RageUI.Line(colors.r, colors.g, colors.b, 255)

                for k, v in pairs(personnalVehicles) do
                    if currentIndexFilter == 1 then
                        if v.garage ~= garageName then goto continue end
                        if not v.state then goto continue end
                    end

                    if currentIndexFilter == 2 then
                        if v.garage == garageName then goto continue end
                        if not v.state then goto continue end
                    end

                    if currentIndexFilter == 3 then
                        if v.state then goto continue end
                    end

                    RageUI.Button(v.label or v.model, nil, {
                        RightBadge = v.boutique and RageUI.BadgeStyle.Star or nil
                    }, true, {
                        onActive = function ()
                            RageUI.Info(_("GARAGE_VEHICLE_INFO_TITLE"),
                                {
                                    _("GARAGE_VEHICLE_INFO_PLATE"),
                                    _("GARAGE_VEHICLE_INFO_GARAGE"),
                                    _("GARAGE_VEHICLE_INFO_NAME"),
                                    _("GARAGE_VEHICLE_INFO_MODEL")
                                },
                                {
                                    k,
                                    v.garage,
                                    v.label and v.label or _("GARAGE_VEHICLE_LABEL_NIL"),
                                    GetLabelText(
                                        GetDisplayNameFromVehicleModel(
                                            type(v.model) == "number" and v.model or GetHashKey(v.model)
                                        )
                                    )
                                }
                            )
                        end,
                        onSelected = function ()
                            selectedVehicle = k
                            RageUI.Visible(menuPersonnalSelected, true)
                        end
                    })

                    ::continue::
                end
            end)

            RageUI.IsVisible(menuPersonnalSelected, function ()
                if not personnalVehicles or not selectedVehicle then
                    return RageUI.Separator(_("LOADING"))
                end

                if
                    personnalVehicles[selectedVehicle].garage == garageName and
                    personnalVehicles[selectedVehicle].state
                then
                    RageUI.Button(_("GARAGE_RESTORE_VEHICLE"), nil, {}, true, {
                        onSelected = function ()
                            if not actionCooldown("vehicle_garage", 2500) then return end
                            if not IsModelValid(ZGEG.GetValidModel(personnalVehicles[selectedVehicle].model)) then return end

                            ZGEG.TriggerServerCallback("garages:getSpawnsPoint", function (data)
                                if not data then return end

                                local spawnPoint = getVehiclePointClear(data)
                                if not spawnPoint then
                                    return ZGEG.ShowNotification(_("VEHICLE_SPAWN_IS_BLOCKED"))
                                end

                                RageUI.CloseAll()

                                TriggerServerEvent("garage:restoreVehicle", selectedVehicle, spawnPoint)
                            end, garageName, garageType)
                        end
                    })
                end

                RageUI.Button(_("GARAGE_LOCATE_VEHICLE"), nil, {}, true, {
                    onSelected = function ()
                        if not actionCooldown("vehicle_locate_vehicle", 2500) then return end

                        RageUI.CloseAll()

                        TriggerServerEvent("garage:locateVehicle", selectedVehicle)
                    end
                })

                RageUI.Button(_("GARAGE_RENAME_VEHICLE"), nil, {}, true, {
                    onSelected = function ()
                        local input = ZGEG.GetTextInput(_("GARAGE_RENAME_VEHICLE"))
                        if not input then return end

                        RageUI.CloseAll()

                        TriggerServerEvent("garage:renameVehicle", selectedVehicle, input)
                    end
                })

                if job and job ~= "unemployed" then
                    RageUI.Button(_("GARAGE_ATTRIBUTE_ENTERPRISE"), _("GARAGE_ATTRIBUTE_ENTERPRISE_DESC"), {}, true, {
                        onSelected = function ()
                            local input = ZGEG.ConfirmDialog(_("CONFIRMATION"), _("GARAGE_ATTRIBUTE_ENTERPRISE_CONFIRM"))
                            if not input then return end

                            RageUI.CloseAll()

                            TriggerServerEvent("garage:attributeToEnterprise", selectedVehicle)
                        end
                    })
                end

                if job2 and job2 ~= "unemployed2" then
                    RageUI.Button(_("GARAGE_ATTRIBUTE_ORGANISATION"), _("GARAGE_ATTRIBUTE_ORGANISATION_DESC"), {}, true, {
                        onSelected = function ()
                            local input = ZGEG.ConfirmDialog(_("CONFIRMATION"), _("GARAGE_ATTRIBUTE_ORGANISATION_CONFIRM"))
                            if not input then return end

                            RageUI.CloseAll()

                            TriggerServerEvent("garage:attributeToOrganisation", selectedVehicle)
                        end
                    })
                end
            end)

            RageUI.IsVisible(menuEnterprise, function ()
                if not enterpriseVehicles then
                    return RageUI.Separator(_("LOADING"))
                end

                RageUI.List(_("GARAGE_FILTER"), filterVehicle, currentIndexFilter, nil, {}, true, {
                    onListChange = function (index)
                        currentIndexFilter = index
                    end
                })

                for k, v in pairs(enterpriseVehicles) do
                    if currentIndexFilter == 1 then
                        if v.garage ~= garageName then goto continue end
                        if not v.state then goto continue end
                    end

                    if currentIndexFilter == 2 then
                        if v.garage == garageName then goto continue end
                        if not v.state then goto continue end
                    end

                    if currentIndexFilter == 3 then
                        if v.state then goto continue end
                    end

                    RageUI.Button(v.label or v.model, nil, {
                        RightBadge = v.boutique and RageUI.BadgeStyle.Star or nil
                    }, true, {
                        onActive = function ()
                            RageUI.Info(_("GARAGE_VEHICLE_INFO_TITLE"),
                                {
                                    _("GARAGE_VEHICLE_INFO_PLATE"),
                                    _("GARAGE_VEHICLE_INFO_GARAGE"),
                                    _("GARAGE_VEHICLE_INFO_NAME"),
                                    _("GARAGE_VEHICLE_INFO_MODEL")
                                },
                                {
                                    k,
                                    v.garage,
                                    v.label or _("GARAGE_VEHICLE_LABEL_NIL"),
                                    GetLabelText(
                                        GetDisplayNameFromVehicleModel(
                                            type(v.model) == "number" and v.model or GetHashKey(v.model)
                                        )
                                    )
                                }
                            )
                        end,
                        onSelected = function ()
                            selectedVehicle = k
                            RageUI.Visible(menuEnterpriseSelected, true)
                        end
                    })

                    ::continue::
                end
            end)

            RageUI.IsVisible(menuEnterpriseSelected, function ()
                if not enterpriseVehicles or not selectedVehicle then
                    return RageUI.Separator(_("LOADING"))
                end

                if
                    enterpriseVehicles[selectedVehicle].garage == garageName and
                    enterpriseVehicles[selectedVehicle].state
                then
                    RageUI.Button(_("GARAGE_RESTORE_VEHICLE"), nil, {}, true, {
                        onSelected = function ()
                            if not actionCooldown("vehicle_garage", 2500) then return end
                            if not IsModelValid(ZGEG.GetValidModel(enterpriseVehicles[selectedVehicle].model)) then return end

                            ZGEG.TriggerServerCallback("garages:getSpawnsPoint", function (data)
                                if not data then return end

                                local spawnPoint = getVehiclePointClear(data)
                                if not spawnPoint then
                                    return ZGEG.ShowNotification(_("VEHICLE_SPAWN_IS_BLOCKED"))
                                end

                                RageUI.CloseAll()

                                TriggerServerEvent("garage:restoreVehicle", selectedVehicle, spawnPoint)
                            end, garageName, garageType)
                        end
                    })
                end

                RageUI.Button(_("GARAGE_RENAME_VEHICLE"), nil, {}, true, {
                    onSelected = function ()
                        local input = ZGEG.GetTextInput(_("GARAGE_RENAME_VEHICLE"))
                        if not input then return end

                        RageUI.CloseAll()

                        TriggerServerEvent("garage:renameVehicle", selectedVehicle, input)
                    end
                })

                if enterpriseCanDeleteVehicle then
                    RageUI.Button(_("GARAGE_DELETE_VEHICLE"), _("GARAGE_DELETE_VEHICLE_DESC"), {}, true, {
                        onSelected = function ()
                            local input = ZGEG.ConfirmDialog(_("CONFIRMATION"), _("GARAGE_DELETE_VEHICLE_CONFIRM"))
                            if not input then return end

                            RageUI.CloseAll()

                            TriggerServerEvent("garages:removeVehicle", selectedVehicle)
                        end
                    })
                end
            end)

            RageUI.IsVisible(menuOrganisation, function ()
                if not organisationVehicles then
                    return RageUI.Separator(_("LOADING"))
                end

                RageUI.List(_("GARAGE_FILTER"), filterVehicle, currentIndexFilter, nil, {}, true, {
                    onListChange = function (index)
                        currentIndexFilter = index
                    end
                })

                for k, v in pairs(organisationVehicles) do
                    if currentIndexFilter == 1 then
                        if v.garage ~= garageName then goto continue end
                        if not v.state then goto continue end
                    end

                    if currentIndexFilter == 2 then
                        if v.garage == garageName then goto continue end
                        if not v.state then goto continue end
                    end

                    if currentIndexFilter == 3 then
                        if v.state then goto continue end
                    end

                    RageUI.Button(v.label or v.model, nil, {
                        RightBadge = v.boutique and RageUI.BadgeStyle.Star or nil
                    }, true, {
                        onActive = function ()
                            RageUI.Info(_("GARAGE_VEHICLE_INFO_TITLE"),
                                {
                                    _("GARAGE_VEHICLE_INFO_PLATE"),
                                    _("GARAGE_VEHICLE_INFO_GARAGE"),
                                    _("GARAGE_VEHICLE_INFO_NAME"),
                                    _("GARAGE_VEHICLE_INFO_MODEL")
                                },
                                {
                                    k,
                                    v.garage,
                                    v.label or _("GARAGE_VEHICLE_LABEL_NIL"),
                                    GetLabelText(
                                        GetDisplayNameFromVehicleModel(
                                            type(v.model) == "number" and v.model or GetHashKey(v.model)
                                        )
                                    )
                                }
                            )
                        end,
                        onSelected = function ()
                            selectedVehicle = k
                            RageUI.Visible(menuOrganisationSelected, true)
                        end
                    })

                    ::continue::
                end
            end)

            RageUI.IsVisible(menuOrganisationSelected, function ()
                if not organisationVehicles or not selectedVehicle then
                    return RageUI.Separator(_("LOADING"))
                end

                if
                    organisationVehicles[selectedVehicle].garage == garageName and
                    organisationVehicles[selectedVehicle].state
                then
                    RageUI.Button(_("GARAGE_RESTORE_VEHICLE"), nil, {}, true, {
                        onSelected = function ()
                            if not actionCooldown("vehicle_garage", 2500) then return end
                            if not IsModelValid(ZGEG.GetValidModel(organisationVehicles[selectedVehicle].model)) then return end

                            ZGEG.TriggerServerCallback("garages:getSpawnsPoint", function (data)
                                if not data then return end

                                local spawnPoint = getVehiclePointClear(data)
                                if not spawnPoint then
                                    return ZGEG.ShowNotification(_("VEHICLE_SPAWN_IS_BLOCKED"))
                                end

                                RageUI.CloseAll()

                                TriggerServerEvent("garage:restoreVehicle", selectedVehicle, spawnPoint)
                            end, garageName, garageType)
                        end
                    })
                end

                RageUI.Button(_("GARAGE_RENAME_VEHICLE"), nil, {}, true, {
                    onSelected = function ()
                        local input = ZGEG.GetTextInput(_("GARAGE_RENAME_VEHICLE"))
                        if not input then return end

                        RageUI.CloseAll()

                        TriggerServerEvent("garage:renameVehicle", selectedVehicle, input)
                    end
                })

                if organisationCanDeleteVehicle then
                    RageUI.Button(_("GARAGE_DELETE_VEHICLE"), _("GARAGE_DELETE_VEHICLE_DESC"), {}, true, {
                        onSelected = function ()
                            local input = ZGEG.ConfirmDialog(_("CONFIRMATION"), _("GARAGE_DELETE_VEHICLE_CONFIRM"))
                            if not input then return end

                            RageUI.CloseAll()

                            TriggerServerEvent("garages:removeVehicle", selectedVehicle)
                        end
                    })
                end
            end)

            if
                not RageUI.Visible(menu) and
                not RageUI.Visible(menuPersonnal) and
                not RageUI.Visible(menuPersonnalSelected) and
                not RageUI.Visible(menuEnterprise) and
                not RageUI.Visible(menuEnterpriseSelected) and
                not RageUI.Visible(menuOrganisation) and
                not RageUI.Visible(menuOrganisationSelected)
            then
                menu = RMenu:DeleteType("menu", true)
            end

            Citizen.Wait(0)
        end
    end) ]]
end

--[[RegisterCommand("garage", function ()
    openGarageMenu("Garage 3", config.type.CAR)
end, false)]]

RegisterNetEvent("garage:init", function()
    Citizen.CreateThread(function()
        while true do
            local wait = 1000
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for garageName, garageData in pairs(config.list[config.type.CAR]) do
                local distanceToEntrance = #(playerCoords - garageData.position)
                if distanceToEntrance < 50.0 then
                    wait = 0
                    DrawMarker(25, 
                        garageData.position.x, 
                        garageData.position.y, 
                        garageData.position.z - 1.0, 
                        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
                        0.8, 0.8, 0.8, 
                        255, 0, 0, 100, 
                        false, true, 2, false, nil, nil, false
                    )

                    if distanceToEntrance < 2.0 then
                        DrawInstructionBarNotification(garageData.position.x, garageData.position.y, garageData.position.z, "Appuyez sur [~y~E~s~] pour ouvrir le garage")
                        if IsControlJustReleased(0, 38) then
                            openGarageMenu(garageName, garageData.type)
                        end
                    end
                end

                local distanceToDelete = #(playerCoords - garageData.delete)
                if distanceToDelete < 50.0 then
                    wait = 0
                    DrawMarker(36, 
                        garageData.delete.x, 
                        garageData.delete.y, 
                        garageData.delete.z, 
                        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
                        0.8, 0.8, 0.8, 
                        255, 0, 0, 100, 
                        false, true, 2, false, nil, nil, false
                    )

                    if distanceToDelete < 2.0 then
                        local vehicle = GetVehiclePedIsIn(playerPed, false)
                        if vehicle ~= 0 then
                            local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                            DrawInstructionBarNotification(garageData.delete.x, garageData.delete.y, garageData.delete.z, "Appuyez sur [~y~E~s~] pour ranger votre véhicule")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("garage:store", plate, garageName)
                                ESX.Game.DeleteVehicle(vehicle)
                            end
                        end
                    end
                end

                if garageData.blip and not garageData.blipCreated then
                    local blip = AddBlipForCoord(garageData.position)
                    SetBlipSprite(blip, 357)
                    SetBlipDisplay(blip, 4)
                    SetBlipScale(blip, 0.6)
                    SetBlipColour(blip, 26)
                    SetBlipAsShortRange(blip, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Garage Public")
                    EndTextCommandSetBlipName(blip)
                    garageData.blipCreated = true
                end
            end

            Citizen.Wait(wait)
        end
    end)
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    
    TriggerEvent('garage:init')
end)

RegisterNUICallback('spawnCar', function(data, cb)
    ESX.TriggerServerCallback('Loumout:GetVehicleData', function(vehicle)
        if vehicle then
            local model = GetValidModel(vehicle.model)
            if model then
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(10)
                end
                
                local garage = config.list[config.type.CAR][currentGarage]
                if garage and garage.spawns then
                    local spawnPoint = garage.spawns[1]
                    local veh = CreateVehicle(model, spawnPoint.pos.x, spawnPoint.pos.y, spawnPoint.pos.z, spawnPoint.heading, true, false)
                    
                    if vehicle.tuning then
                        ESX.Game.SetVehicleProperties(veh, json.decode(vehicle.tuning))
                    end
                    SetVehicleNumberPlateText(veh, vehicle.plate)
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerServerEvent('Loumout:ChangeState', vehicle.plate, 0, nil)
                    exports.fivem_ui:closeApplication("garage")
                    cb({ status = true })
                else
                    cb({ status = false, error = "Point de spawn non trouvé" })
                end
            else
                cb({ status = false, error = "Modèle de véhicule invalide" })
            end
        else
            cb({ status = false, error = "Véhicule non trouvé" })
        end
    end, data.plate)
end)

RegisterNetEvent("ZgegFramework:garage:updateVehicle")
AddEventHandler("ZgegFramework:garage:updateVehicle", function(vehicles)
    if currentGarage then
        local updatedVehicles = createCarTable(vehicles, currentGarage, "player")
        exports.fivem_ui:emit("ZgegFramework:garage:updateVehicle", updatedVehicles)
    end
end)

RegisterNetEvent('ewengarage:createTempVehicle')
AddEventHandler('ewengarage:createTempVehicle', function(model, cb)
    local hash = GetHashKey(model)
    
    if not IsModelInCdimage(hash) then
        TriggerEvent('esx:showNotification', "Modèle de véhicule invalide")
        return
    end

    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end

    local vehicle = CreateVehicle(hash, 0, 0, 0, 0, true, false)
    local plate = GetVehicleNumberPlateText(vehicle)
    DeleteEntity(vehicle)
    
    TriggerServerEvent('ewengarage:returnPlate', plate)
end)

RegisterNetEvent('garage:createVehicle')
AddEventHandler('garage:createVehicle', function(model)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    
    local vehicle = CreateVehicle(GetHashKey(model), coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
    
    while not DoesEntityExist(vehicle) do
        Wait(10)
    end
    
    local plate = GetVehicleNumberPlateText(vehicle)
    
    TriggerServerEvent('garage:sendVehiclePlate', plate, model)
    
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
end)

RegisterNetEvent('garage:spawnAndRegisterVehicle')
AddEventHandler('garage:spawnAndRegisterVehicle', function(model)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end
    
    local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
    
    while not DoesEntityExist(vehicle) do
        Wait(10)
    end
    
    Wait(100)
    
    local plate = GetVehicleNumberPlateText(vehicle)
    plate = string.gsub(plate, "%s+", "")
    
    
    TriggerServerEvent('garage:sendVehiclePlate', plate, model)
    
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    
    SetModelAsNoLongerNeeded(hash)
end)

RegisterNetEvent('garage:spawnVehicleWithPlate')
AddEventHandler('garage:spawnVehicleWithPlate', function(data)
    local hash = GetHashKey(data.model)
    
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end
    
    local vehicle = CreateVehicle(hash, data.position.x, data.position.y, data.position.z, data.heading, true, false)
    
    while not DoesEntityExist(vehicle) do
        Wait(10)
    end
    
    SetVehicleNumberPlateText(vehicle, data.plate)
    
    if data.props then
        ESX.Game.SetVehicleProperties(vehicle, data.props)
    end
    
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    
    TriggerServerEvent('Loumout:ChangeState', data.plate, 0, 'Pound')
    
    SetModelAsNoLongerNeeded(hash)
end)

local GarageManager = {
    ESX = nil,
    PlayerData = {},
    currentGarage = nil,
    currentGarageType = nil,
    vehicleModels = {},
    garageBlips = {},
    markerColors = {r = 255, g = 0, b = 0, a = 100},
    
    modelCache = setmetatable({}, {
        __index = function(t, k)
            local hash = GetHashKey(k)
            t[k] = hash
            return hash
        end
    }),

    init = function(self)
        while not self.ESX do
            TriggerEvent('esx:getSharedObject', function(obj) self.ESX = obj end)
            Wait(10)
        end
        
        self:registerEvents()
        self:initVehicleModels()
        self:createGarageBlips()
        self:startMainLoop()
    end,

    registerEvents = function(self)
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function(xPlayer)
            self.PlayerData = xPlayer
        end)

        RegisterNetEvent('esx:setJob')
        AddEventHandler('esx:setJob', function(job)
            self.PlayerData.job = job
        end)

        RegisterNetEvent('esx:setJob2')
        AddEventHandler('esx:setJob2', function(job2)
            self.PlayerData.job2 = job2
        end)
    end,

    initVehicleModels = function(self)
        local vehiclesModelKey = GetAllVehicleModels()
        for _, modelKey in ipairs(vehiclesModelKey) do
            local hash = GetHashKey(modelKey)
            self.vehicleModels[tostring(hash)] = modelKey
        end
    end,

    createGarageBlips = function(self)
        for garageName, garageData in pairs(config.list[config.type.CAR]) do
            if garageData.blip then
                local blip = AddBlipForCoord(garageData.position)
                SetBlipSprite(blip, 357)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 0.6)
                SetBlipColour(blip, 26)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Garage Public")
                EndTextCommandSetBlipName(blip)
                self.garageBlips[garageName] = blip
            end
        end
    end,

    startMainLoop = function(self)
        Citizen.CreateThread(function()
            while true do
                local wait = 1000
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local nearbyGarage = false

                for garageName, garageData in pairs(config.list[config.type.CAR]) do
                    local distanceToEntrance = #(playerCoords - garageData.position)
                    local distanceToDelete = #(playerCoords - garageData.delete)

                    if distanceToEntrance < 50.0 or distanceToDelete < 50.0 then
                        wait = 0
                        nearbyGarage = true
                        
                        if distanceToEntrance < 50.0 then
                            self:handleGarageEntrance(garageName, garageData, playerCoords, distanceToEntrance)
                        end

                        if distanceToDelete < 50.0 then
                            self:handleGarageStorage(garageName, garageData, playerPed, playerCoords, distanceToDelete)
                        end
                    end
                end

                if not nearbyGarage then
                    wait = 1500
                end

                Wait(wait)
            end
        end)
    end,

    handleGarageEntrance = function(self, garageName, garageData, playerCoords, distance)
        DrawMarker(25, 
            garageData.position.x, 
            garageData.position.y, 
            garageData.position.z - 1.0, 
            0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
            0.8, 0.8, 0.8, 
            self.markerColors.r, self.markerColors.g, self.markerColors.b, self.markerColors.a,
            false, true, 2, false, nil, nil, false
        )

        if distance < 0.1 then
            DrawInstructionBarNotification(
                garageData.position.x, 
                garageData.position.y, 
                garageData.position.z, 
                "Appuyez sur [~y~E~s~] pour ouvrir le garage"
            )
            
            if IsControlJustReleased(0, 38) then
                self:openGarageMenu(garageName, garageData.type)
            end
        end
    end,

    handleGarageStorage = function(self, garageName, garageData, playerPed, playerCoords, distance)
        DrawMarker(36, 
            garageData.delete.x, 
            garageData.delete.y, 
            garageData.delete.z, 
            0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
            0.8, 0.8, 0.8, 
            self.markerColors.r, self.markerColors.g, self.markerColors.b, self.markerColors.a,
            false, true, 2, false, nil, nil, false
        )

        if distance < 0.1 then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if vehicle ~= 0 then
                local plate = self.ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                DrawInstructionBarNotification(
                    garageData.delete.x, 
                    garageData.delete.y, 
                    garageData.delete.z, 
                    "Appuyez sur [~y~E~s~] pour ranger votre véhicule"
                )
                
                if IsControlJustReleased(0, 38) then
                    self:storeVehicle(vehicle, plate, garageName)
                end
            end
        end
    end,

    openGarageMenu = function(self, garageName, garageType)
        self.currentGarage = garageName
        self.currentGarageType = garageType

        exports.fivem_ui:loadApplication("garage", {
            color = "#FF0000",
            societyCar = self.PlayerData.job and self.PlayerData.job.name ~= "unemployed",
            orgaCar = self.PlayerData.job2 and self.PlayerData.job2.name ~= "unemployed2",
            vehHash = self.vehicleModels,
        })

        self:loadVehicles()
    end,

    loadVehicles = function(self)
        self.ESX.TriggerServerCallback("Loumout:GetPersonalVehicles", function(data)
            if data then
                local vehicles = self:createCarTable(data, self.currentGarage, "player")
                exports.fivem_ui:emit("ZgegFramework:garage:updateVehicle", vehicles)
            end
        end, self.currentGarageType)

        if self.PlayerData.job and self.PlayerData.job.name ~= "unemployed" then
            self.ESX.TriggerServerCallback("Loumout:GetSocietyVehicles", function(data)
                if data then
                    local vehicles = self:createCarTable(data, self.currentGarage, "job")
                    exports.fivem_ui:emit("ZgegFramework:garage:updateVehicleSociety", vehicles)
                end
            end, self.currentGarageType)
        end

        if self.PlayerData.job2 and self.PlayerData.job2.name ~= "unemployed2" then
            self.ESX.TriggerServerCallback("Loumout:GetOrgaVehicles", function(data)
                if data then
                    local vehicles = self:createCarTable(data, self.currentGarage, "job2")
                    exports.fivem_ui:emit("ZgegFramework:garage:updateVehicleOrga", vehicles)
                end
            end, self.currentGarageType)
        end
    end,

    createCarTable = function(self, data, garageName, vehicleType)
        local tempData = {}
        for k, v in pairs(data) do
            local model = tostring(v.model)
            if model and self.vehicleModels[model] then
                v.model = self.vehicleModels[model]
            end
            
            table.insert(tempData, {
                id = k,
                name = v.label or v.model,
                inThisGarage = (v.garage == garageName),
                pound = not v.state,
                model = v.model,
                garage = v.garage or garageName,
                plate = v.plate,
                favorite = v.boutique,
                vehicleType = vehicleType,
                type = v.type or vehicleType
            })
        end
        return tempData
    end,

    storeVehicle = function(self, vehicle, plate, garageName)
        TriggerServerEvent("garage:store", plate, garageName)
        self.ESX.Game.DeleteVehicle(vehicle)
    end
}

Citizen.CreateThread(function()
    GarageManager:init()
end)

exports('getGarageManager', function()
    return GarageManager
end)

print('Leak by MadeInLeak')
print('DISCORD.GG/MadeInLeak')
