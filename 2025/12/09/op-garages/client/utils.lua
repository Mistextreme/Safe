---------------------------------
-- Notifications & Progressbar --
---------------------------------

RegisterNetEvent('op-garages:sendNotify')
AddEventHandler('op-garages:sendNotify', function(title, type, time)
    sendNotify(title, type, time)
end)

Citizen.CreateThread(function()
    sendNotify = function(title, type, time)
        -- Time in miliseconds 
        if Config.Misc.Notify == "esx" then
            Framework.ShowNotification(title, type, time)
        elseif Config.Misc.Notify == "qbcore" then
            Framework.Functions.Notify(title, type, time)
        elseif Config.Misc.Notify == "op-hud" then
            TriggerEvent('op-hud:showNotification', type, time, title) 
        end
    end
end)

----------------
-- HUD TOGGLE --
----------------

function hudToggle(state)
    TriggerEvent('op-hud:tglHud', state)
end