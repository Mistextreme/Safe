Framework = nil
Fr = {}

Citizen.CreateThread(function()
    if Config.FrameWork == "ESX" then
        Framework = exports["es_extended"]:getSharedObject()
        Fr.PlayerLoaded = 'esx:playerLoaded'
        Fr.TriggerServerCallback = function(...)
            return Framework.TriggerServerCallback(...)
        end
        Fr.GetVehicleProperties = function(vehicle) 
            return Framework.Game.GetVehicleProperties(vehicle)
        end
        Fr.DeleteVehicle = function(vehicle)
            return Framework.Game.DeleteVehicle(vehicle)
        end
        Fr.SetVehicleProperties = function(...) 
            return Framework.Game.SetVehicleProperties(...)
        end
        Fr.SpawnVehicle = function(model, coords, heading, networked, cb)
            return Framework.Game.SpawnVehicle(model, coords, heading, cb, networked)
        end
        Fr.GetPlayerData = function()
            return Framework.GetPlayerData()
        end
    elseif Config.FrameWork == "QBCORE" then
        Framework = exports['qb-core']:GetCoreObject()
        Fr.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded'
        Fr.TriggerServerCallback = function(...)
            return Framework.Functions.TriggerCallback(...)
        end
        Fr.GetVehicleProperties = function(vehicle) 
            return Framework.Functions.GetVehicleProperties(vehicle)
        end
        Fr.DeleteVehicle = function(vehicle)
            return Framework.Functions.DeleteVehicle(vehicle)
        end
        Fr.SetVehicleProperties = function(...) 
            return Framework.Functions.SetVehicleProperties(...)
        end
        Fr.SpawnVehicle = function(model, coords, heading, networked, cb)
            return Framework.Functions.SpawnVehicle(model, cb, coords, networked)
        end
        Fr.GetPlayerData = function()
            return Framework.Functions.GetPlayerData()
        end
    end
end)
