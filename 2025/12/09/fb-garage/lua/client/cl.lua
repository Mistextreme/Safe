ESX = exports["es_extended"]:getSharedObject()

garages = {}
selectedGarage = nil

function RefreshGarages()
    ESX.TriggerServerCallback("fb_garage:getGarages", function(serverGarages)
        garages = serverGarages
        print("^2[FB-Garage]^7 " .. #garages .. " garages retrieved from the server")
    end)
end

CreateThread(function()
    while not ESX do
        Wait(100)
    end
    
    Wait(1000)
    RefreshGarages()
    
    while true do
        Wait(30000)
        if #garages == 0 then
            print("^1[FB-Garage]^7 No garages loaded, reloading...")
            RefreshGarages()
        end
    end
end)

RegisterNetEvent("fb_garage:refreshGarages")
AddEventHandler("fb_garage:refreshGarages", function()
    RefreshGarages()
end)

CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if garages and #garages > 0 then
            for _, garage in pairs(garages) do
                if garage and garage.garage then
                    local distanceGarage = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, garage.garage.x, garage.garage.y, garage.garage.z)
                    
                    local distanceRanger = 999
                    if garage.ranger and garage.ranger.x and garage.ranger.y and garage.ranger.z then
                        distanceRanger = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, garage.ranger.x, garage.ranger.y, garage.ranger.z)
                    end

                    if distanceGarage < 3 then
                        Marker(6, garage.garage.x, garage.garage.y, garage.garage.z, Config.Command.message)

                        if IsControlJustPressed(0, 38) then
                            selectedGarage = garage
                            print("^2[FB-Garage]^7 Garage selected:", selectedGarage.name)
                            TriggerEvent(Config.Command.event)
                        end
                    end

                    if distanceRanger < 3 then
                        if IsPedInAnyVehicle(playerPed, false) then
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
                            if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                                Marker(27, garage.ranger.x, garage.ranger.y, garage.ranger.z, "Press ~INPUT_PICKUP~ to store the vehicle")
                                
                                if IsControlJustPressed(0, 38) then
                                    StoreVehicle(vehicle, garage.name)
                                end
                            end
                        end
                    end
                end
            end
        else
            if GetGameTimer() % 5000 < 50 then
                if not garages then
                    print("^1[FB-Garage]^7 Garages variable is nil")
                elseif #garages == 0 then
                    print("^1[FB-Garage]^7 No garages loaded")
                end
            end
        end
        Wait(0)
    end
end)