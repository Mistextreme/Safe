ESX = exports["es_extended"]:getSharedObject()

local main_menu = RageUI.CreateMenu("Garage Builder", "Main menu")
local edit_menu = RageUI.CreateSubMenu(main_menu, "Garage Builder", "Main menu")
local edit_menu_list_jobs = RageUI.CreateSubMenu(edit_menu, "Garage Builder", "Main menu")
local create_menu = RageUI.CreateSubMenu(main_menu, "Garage Builder", "Main menu")
local create_menu_list_jobs = RageUI.CreateSubMenu(create_menu, "Garage Builder", "Main menu")

local create_impound_menu = RageUI.CreateSubMenu(main_menu, "Garage Builder", "Create an impound")
local edit_impound_menu = RageUI.CreateSubMenu(main_menu, "Garage Builder", "Edit an impound")

local visible, ed, indexPosGarage, indexPosSpawn, indexPosRanger, currentCreation, currentImpoundCreation = false, nil, 1, 1, 1, {
    name = "",
    garage = { x = 0, y = 0, z = 0 },
    spawn = { x = 0, y = 0, z = 0 },
    ranger = { x = 0, y = 0, z = 0 },
    jobs = {}
}, {
    name = "",
    garage = { x = 0, y = 0, z = 0 },
    spawn = { x = 0, y = 0, z = 0 }
}

local serverGarages = {}

function OpenMenu()
    visible = not visible
    if visible then
        RefreshServerGarages()
    end
    RageUI.Visible(main_menu, visible)
end

function RefreshServerGarages()
    ESX.TriggerServerCallback("fb_garage:getGarages", function(garages)
        serverGarages = garages or {}
        print("^2[FB-Garage Menu]^7 " .. #serverGarages .. " garages loaded")
        
        if #serverGarages > 0 then
            local firstGarage = serverGarages[1]
            print("^3[DEBUG]^7 First garage:", json.encode(firstGarage))
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if visible then
            if not next(serverGarages) then
                RefreshServerGarages()
            end

            RageUI.IsVisible(main_menu, function()
                RageUI.Button("Create a garage", nil, {}, true, {}, create_menu)
                RageUI.Button("Create an impound", nil, {}, true, {}, create_impound_menu)
                RageUI.Separator("~p~Available garages~s~")

                if serverGarages and next(serverGarages) then
                    for _, v in pairs(serverGarages) do
                        local isImpound = v.isImpound or false
                        
                        RageUI.Button(v.name, isImpound and "~o~[IMPOUND]" or nil, {}, true, {
                            onSelected = function()
                                ed = v
                                if not ed.garage then ed.garage = {x = 0, y = 0, z = 0} end
                                if not ed.spawn then ed.spawn = {x = 0, y = 0, z = 0} end
                                if not ed.jobs then ed.jobs = {} end
                                if not ed.ranger then ed.ranger = {x = 0, y = 0, z = 0} end
                            end
                        }, isImpound and edit_impound_menu or edit_menu)
                    end
                else
                    RageUI.Button("No garage available", nil, {}, false, {})
                end
            end)

            RageUI.IsVisible(edit_menu, function()
                if ed ~= nil then
                    if not ed.jobs then
                        ed.jobs = {}
                    end
                    
                    RageUI.Button("Garage name", nil, { RightLabel = ed.name }, true, {
                        onSelected = function()
                            local name = KeyBoard("Garage name", ed.name, 30)
                            ed.name = name
                        end
                    })

                    RageUI.List("Garage position", { "Go", "Modify" }, indexPosGarage, nil, {}, true, {
                        onListChange = function(Index)
                            indexPosGarage = Index
                        end,
                        onSelected = function(Index)
                            if Index == 1 then
                                if ed.garage and ed.garage.x and ed.garage.y and ed.garage.z then
                                    SetEntityCoordsNoOffset(PlayerPedId(), ed.garage.x, ed.garage.y, ed.garage.z, false,
                                        false, false)
                                else
                                    print("^1[FB-Garage]^7 Error: Garage position not set")
                                end
                            elseif Index == 2 then
                                local playerCoords = GetEntityCoords(PlayerPedId())
                                if not ed.garage then
                                    ed.garage = {}
                                end
                                ed.garage.x, ed.garage.y, ed.garage.z = playerCoords.x, playerCoords.y, playerCoords.z
                                print("^2[FB-Garage]^7 Garage position updated")
                            end
                        end
                    })
                    
                    if ed.garage and ed.garage.x and ed.garage.y and ed.garage.z then
                        RageUI.Button("Garage coords:", string.format("%.2f, %.2f, %.2f", ed.garage.x, ed.garage.y, ed.garage.z), {}, false, {})
                    else
                        RageUI.Button("Garage coords:", "~r~Not set", {}, false, {})
                    end

                    RageUI.List("Spawn position", { "Go", "Modify" }, indexPosSpawn, nil, {}, true, {
                        onListChange = function(Index)
                            indexPosSpawn = Index
                        end,
                        onSelected = function(Index)
                            if Index == 1 then
                                if ed.spawn and ed.spawn.x and ed.spawn.y and ed.spawn.z then
                                    SetEntityCoordsNoOffset(PlayerPedId(), ed.spawn.x, ed.spawn.y, ed.spawn.z, false,
                                        false, false)
                                else
                                    print("^1[FB-Garage]^7 Error: Spawn position not set")
                                end
                            elseif Index == 2 then
                                local playerCoords = GetEntityCoords(PlayerPedId())
                                if not ed.spawn then
                                    ed.spawn = {}
                                end
                                ed.spawn.x, ed.spawn.y, ed.spawn.z = playerCoords.x, playerCoords.y, playerCoords.z
                                print("^2[FB-Garage]^7 Spawn position updated")
                            end
                        end
                    })
                    
                    if ed.spawn and ed.spawn.x and ed.spawn.y and ed.spawn.z then
                        RageUI.Button("Spawn coords:", string.format("%.2f, %.2f, %.2f", ed.spawn.x, ed.spawn.y, ed.spawn.z), {}, false, {})
                    else
                        RageUI.Button("Spawn coords:", "~r~Not set", {}, false, {})
                    end

                    RageUI.List("Storage position", { "Go", "Modify" }, indexPosRanger, nil, {}, true, {
                        onListChange = function(Index)
                            indexPosRanger = Index
                        end,
                        onSelected = function(Index)
                            if Index == 1 then
                                if ed.ranger and ed.ranger.x and ed.ranger.y and ed.ranger.z then
                                    SetEntityCoordsNoOffset(PlayerPedId(), ed.ranger.x, ed.ranger.y, ed.ranger.z, false,
                                        false, false)
                                else
                                    print("^1[FB-Garage]^7 Error: Storage position not set")
                                end
                            elseif Index == 2 then
                                local playerCoords = GetEntityCoords(PlayerPedId())
                                if not ed.ranger then
                                    ed.ranger = {}
                                end
                                ed.ranger.x, ed.ranger.y, ed.ranger.z = playerCoords.x, playerCoords.y, playerCoords.z
                                print("^2[FB-Garage]^7 Storage position updated")
                            end
                        end
                    })
                    
                    if ed.ranger and ed.ranger.x and ed.ranger.y and ed.ranger.z then
                        RageUI.Button("Storage coords:", string.format("%.2f, %.2f, %.2f", ed.ranger.x, ed.ranger.y, ed.ranger.z), {}, false, {})
                    else
                        RageUI.Button("Storage coords:", "~r~Not set", {}, false, {})
                    end

                    RageUI.Separator("~p~Accessibility")
                    RageUI.Button("Add a job", nil, {}, true, {}, edit_menu_list_jobs)

                    if ed.jobs and type(ed.jobs) == "table" then
                        for _, v in pairs(ed.jobs) do
                            RageUI.List(v, { "Delete" }, 1, nil, {}, true, {
                                onListChange = function(Index)
                                end,
                                onSelected = function(Index)
                                    if Index == 1 then
                                        table.remove(ed.jobs, Index)
                                    end
                                end
                            })
                        end
                    end

                    RageUI.Separator("~r~Dangerous actions")
                    RageUI.Button("~g~Save changes", nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("fb_garage:updateGarage", ed)
                            RefreshServerGarages()
                        end
                    })
                    RageUI.Button("~r~Delete this garage", nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("fb_garage:deleteGarage", ed.name)
                            RefreshServerGarages()
                            RageUI.GoBack()
                        end
                    })
                end
            end)

            RageUI.IsVisible(edit_menu_list_jobs, function()
                if ed and ed.jobs then
                    for _, v in pairs(Config.Command.jobs) do
                        local found = false
                        for _, job in pairs(ed.jobs) do
                            if job == v then
                                found = true
                                break
                            end
                        end
                        if not found then
                            RageUI.Button(v, nil, {}, true, {
                                onSelected = function()
                                    table.insert(ed.jobs, v)
                                    RageUI.GoBack()
                                end
                            })
                        end
                    end
                else
                    RageUI.Button("Error: No garage selected", nil, {}, false, {})
                end
            end)

            RageUI.IsVisible(create_menu, function()
                RageUI.Button("Garage name", nil, { RightLabel = currentCreation.name }, true, {
                    onSelected = function()
                        local name = KeyBoard("Garage name", "", 30)
                        currentCreation.name = name
                    end
                })

                RageUI.Button("Garage position", nil, {}, true, {
                    onSelected = function()
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        currentCreation.garage.x, currentCreation.garage.y, currentCreation.garage.z = playerCoords.x, playerCoords.y, playerCoords.z
                    end
                })

                RageUI.Button("Spawn position", nil, {}, true, {
                    onSelected = function()
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        currentCreation.spawn.x, currentCreation.spawn.y, currentCreation.spawn.z = playerCoords.x, playerCoords.y, playerCoords.z
                    end
                })

                RageUI.Button("Storage position", nil, {}, true, {
                    onSelected = function()
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        currentCreation.ranger.x, currentCreation.ranger.y, currentCreation.ranger.z = playerCoords.x, playerCoords.y, playerCoords.z
                    end
                })

                RageUI.Separator("~b~Positions set")
                
                if currentCreation.garage.x ~= 0 or currentCreation.garage.y ~= 0 or currentCreation.garage.z ~= 0 then
                    RageUI.Button("✓ Garage:", string.format("%.2f, %.2f, %.2f", currentCreation.garage.x, currentCreation.garage.y, currentCreation.garage.z), {}, false, {})
                else
                    RageUI.Button("✗ Garage:", "~r~Not set", {}, false, {})
                end
                
                if currentCreation.spawn.x ~= 0 or currentCreation.spawn.y ~= 0 or currentCreation.spawn.z ~= 0 then
                    RageUI.Button("✓ Spawn:", string.format("%.2f, %.2f, %.2f", currentCreation.spawn.x, currentCreation.spawn.y, currentCreation.spawn.z), {}, false, {})
                else
                    RageUI.Button("✗ Spawn:", "~r~Not set", {}, false, {})
                end
                
                if currentCreation.ranger.x ~= 0 or currentCreation.ranger.y ~= 0 or currentCreation.ranger.z ~= 0 then
                    RageUI.Button("✓ Storage:", string.format("%.2f, %.2f, %.2f", currentCreation.ranger.x, currentCreation.ranger.y, currentCreation.ranger.z), {}, false, {})
                else
                    RageUI.Button("✗ Storage:", "~r~Not set", {}, false, {})
                end

                RageUI.Separator("~p~Accessibility")
                RageUI.Button("Add a job", nil, {}, true, {}, create_menu_list_jobs)

                if currentCreation.jobs and type(currentCreation.jobs) == "table" then
                    for _, v in pairs(currentCreation.jobs) do
                        RageUI.List(v, { "Delete" }, 1, nil, {}, true, {
                            onListChange = function(Index)
                            end,
                            onSelected = function(Index)
                                if Index == 1 then
                                    table.remove(currentCreation.jobs, Index)
                                end
                            end
                        })
                    end
                end


                RageUI.Button("Confirm", nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent("fb_garage:addGarage", currentCreation)
                        
                        currentCreation = {
                            name = "",
                            garage = { x = 0, y = 0, z = 0 },
                            spawn = { x = 0, y = 0, z = 0 },
                            ranger = { x = 0, y = 0, z = 0 },
                            jobs = {}
                        }
                        
                        RefreshServerGarages()
                        RageUI.GoBack()
                    end
                })
            end)

            RageUI.IsVisible(create_menu_list_jobs, function()
                if currentCreation.jobs then
                    for _, v in pairs(Config.Command.jobs) do
                        local found = false
                        for _, job in pairs(currentCreation.jobs) do
                            if job == v then
                                found = true
                                break
                            end
                        end
                        if not found then
                            RageUI.Button(v, nil, {}, true, {
                                onSelected = function()
                                    table.insert(currentCreation.jobs, v)
                                    RageUI.GoBack()
                                end
                            })
                        end
                    end
                else
                    RageUI.Button("Error: Jobs not initialized", nil, {}, false, {})
                end
            end)

            RageUI.IsVisible(create_impound_menu, function()
                RageUI.Button("Impound name", nil, { RightLabel = currentImpoundCreation.name }, true, {
                    onSelected = function()
                        local name = KeyBoard("Impound name", "", 30)
                        currentImpoundCreation.name = name
                    end
                })

                RageUI.Button("Garage position", nil, {}, true, {
                    onSelected = function()
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        currentImpoundCreation.garage.x, currentImpoundCreation.garage.y, currentImpoundCreation.garage.z = playerCoords.x, playerCoords.y, playerCoords.z
                    end
                })

                RageUI.Button("Spawn position", nil, {}, true, {
                    onSelected = function()
                        local playerCoords = GetEntityCoords(PlayerPedId())
                        currentImpoundCreation.spawn.x, currentImpoundCreation.spawn.y, currentImpoundCreation.spawn.z = playerCoords.x, playerCoords.y, playerCoords.z
                    end
                })

                RageUI.Separator("~o~Positions set")
                
                if currentImpoundCreation.garage.x ~= 0 or currentImpoundCreation.garage.y ~= 0 or currentImpoundCreation.garage.z ~= 0 then
                    RageUI.Button("✓ Garage:", string.format("%.2f, %.2f, %.2f", currentImpoundCreation.garage.x, currentImpoundCreation.garage.y, currentImpoundCreation.garage.z), {}, false, {})
                else
                    RageUI.Button("✗ Garage:", "~r~Not set", {}, false, {})
                end
                
                if currentImpoundCreation.spawn.x ~= 0 or currentImpoundCreation.spawn.y ~= 0 or currentImpoundCreation.spawn.z ~= 0 then
                    RageUI.Button("✓ Spawn:", string.format("%.2f, %.2f, %.2f", currentImpoundCreation.spawn.x, currentImpoundCreation.spawn.y, currentImpoundCreation.spawn.z), {}, false, {})
                else
                    RageUI.Button("✗ Spawn:", "~r~Not set", {}, false, {})
                end

                RageUI.Button("~g~Confirm", nil, {}, true, {
                    onSelected = function()
                        TriggerServerEvent("fb_garage:addImpound", currentImpoundCreation)
                        
                        currentImpoundCreation = {
                            name = "",
                            garage = { x = 0, y = 0, z = 0 },
                            spawn = { x = 0, y = 0, z = 0 }
                        }
                        
                        RefreshServerGarages()
                        RageUI.GoBack()
                    end
                })
            end)

            RageUI.IsVisible(edit_impound_menu, function()
                if ed ~= nil then
                    RageUI.Button("Impound name", nil, { RightLabel = ed.name }, true, {
                        onSelected = function()
                            local name = KeyBoard("Impound name", ed.name, 30)
                            ed.name = name
                        end
                    })

                    RageUI.List("Garage position", { "Go", "Modify" }, indexPosGarage, nil, {}, true, {
                        onListChange = function(Index)
                            indexPosGarage = Index
                        end,
                        onSelected = function(Index)
                            if Index == 1 then
                                if ed.garage and ed.garage.x and ed.garage.y and ed.garage.z then
                                    SetEntityCoordsNoOffset(PlayerPedId(), ed.garage.x, ed.garage.y, ed.garage.z, false, false, false)
                                else
                                    print("^1[FB-Garage]^7 Error: Garage position not set")
                                end
                            elseif Index == 2 then
                                local playerCoords = GetEntityCoords(PlayerPedId())
                                if not ed.garage then
                                    ed.garage = {}
                                end
                                ed.garage.x, ed.garage.y, ed.garage.z = playerCoords.x, playerCoords.y, playerCoords.z
                                print("^2[FB-Garage]^7 Garage position updated")
                            end
                        end
                    })
                    
                    if ed.garage and ed.garage.x and ed.garage.y and ed.garage.z then
                        RageUI.Button("Garage coords:", string.format("%.2f, %.2f, %.2f", ed.garage.x, ed.garage.y, ed.garage.z), {}, false, {})
                    else
                        RageUI.Button("Garage coords:", "~r~Not set", {}, false, {})
                    end

                    RageUI.List("Spawn position", { "Go", "Modify" }, indexPosSpawn, nil, {}, true, {
                        onListChange = function(Index)
                            indexPosSpawn = Index
                        end,
                        onSelected = function(Index)
                            if Index == 1 then
                                if ed.spawn and ed.spawn.x and ed.spawn.y and ed.spawn.z then
                                    SetEntityCoordsNoOffset(PlayerPedId(), ed.spawn.x, ed.spawn.y, ed.spawn.z, false, false, false)
                                else
                                    print("^1[FB-Garage]^7 Error: Spawn position not set")
                                end
                            elseif Index == 2 then
                                local playerCoords = GetEntityCoords(PlayerPedId())
                                if not ed.spawn then
                                    ed.spawn = {}
                                end
                                ed.spawn.x, ed.spawn.y, ed.spawn.z = playerCoords.x, playerCoords.y, playerCoords.z
                                print("^2[FB-Garage]^7 Spawn position updated")
                            end
                        end
                    })
                    
                    if ed.spawn and ed.spawn.x and ed.spawn.y and ed.spawn.z then
                        RageUI.Button("Spawn coords:", string.format("%.2f, %.2f, %.2f", ed.spawn.x, ed.spawn.y, ed.spawn.z), {}, false, {})
                    else
                        RageUI.Button("Spawn coords:", "~r~Not set", {}, false, {})
                    end

                    RageUI.Separator("~r~Dangerous actions")
                    RageUI.Button("~g~Save changes", nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("fb_garage:updateImpound", ed)
                            RefreshServerGarages()
                        end
                    })
                    RageUI.Button("~r~Delete this impound", nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent("fb_garage:deleteGarage", ed.name)
                            RefreshServerGarages()
                            RageUI.GoBack()
                        end
                    })
                end
            end)

            if not RageUI.Visible(main_menu) and not RageUI.Visible(edit_menu) and not RageUI.Visible(edit_menu_list_jobs) and not RageUI.Visible(create_menu) and not RageUI.Visible(create_menu_list_jobs) and not RageUI.Visible(create_impound_menu) and not RageUI.Visible(edit_impound_menu) then
                visible = false
            end
        else
            Citizen.Wait(500)
        end
    end
end)

RegisterCommand("rageui", function()
    OpenMenu()
end, false)

RegisterNetEvent("fb_garage:refreshGarages")
AddEventHandler("fb_garage:refreshGarages", function()
    RefreshServerGarages()
end)

CreateThread(function()
    Wait(1000)
    RefreshServerGarages()
end)