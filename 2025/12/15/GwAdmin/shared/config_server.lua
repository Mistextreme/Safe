master = {
    "license:85e8a0d527388cfe3a3adaa286bd74ac8d0273c3",
}

---@type table
ESX = exports['es_extended']:getSharedObject()

---@type table
QBCore = nil
if GetResourceState("qb-core") == "started" then
    QBCore = exports['qb-core']:GetCoreObject()
end

---@type table
config = {}

---@param src number
---@return boolean
function IsMaster(src)
    local identifiers = GetPlayerIdentifiers(src)
    if identifiers then
        local masterTable = master or _G.master
        if masterTable then
            for _, id in ipairs(identifiers) do
                if IsInTable(masterTable, id) then
                    return true
                end
            end
        end
    end
    return false
end

---@param src number
---@return string
function getPlayersRole(src)
    if IsMaster(src) then
        return "owner"
    end
    local identifier = getIdentifiant(src)
    if not identifier then
        return "user"
    end
    -- Vérifier si ranksServer est disponible (peut être nil au démarrage)
    local ranks = ranksServer or _G.ranksServer
    if ranks then
        for k, v in pairs(ranks) do
            if v.players then
                for _, playerIdentifier in pairs(v.players) do
                    if playerIdentifier == identifier then
                        return v.label
                    end
                end
            end
        end
    end
    return "user"
end

---@param role string
---@param src number
---@return table | string
function getRolesPermissions(role, src)
    if IsMaster(src) then
        return "all"
    end
    local ranks = ranksServer or _G.ranksServer
    if ranks and ranks[role] then
        return ranks[role].permissions
    end
    return {}
end

---@param role string
---@return string
function getRoleColor(role)
    if role == "owner" then
        return "(*)~r~"
    end
    local ranks = ranksServer or _G.ranksServer
    if ranks and ranks[role] and ranks[role].rankColor then
        return ranks[role].rankColor
    end
    return "~w~"
end

---@param table table
---@param value any
---@return boolean
function IsInTable(table, value)
    if not table then return false end
    for _, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

config.getRPname = function(src)
    if GetResourceState("es_extended") == "started" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer then
            return 'John Doe'
        end
        local licence = xPlayer.identifier
        local result = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier",
            { ['@identifier'] = licence })
        if #result == 0 then
            return 'John Doe'
        else
            local name = result[1].firstname or "John"
            local lastname = result[1].lastname or "Doe"
            return name .. " " .. lastname
        end
    end
    return 'John Doe'
end

---@param target number
---@param source number|nil
config.revive = function(target, source)
    if not target or type(target) ~= "number" then
        print(("[ERROR] config.revive - Target invalide: %s"):format(tostring(target)))
        return false
    end
    
    local targetName = GetPlayerName(target)
    if not targetName then
        print(("[ERROR] config.revive - Joueur %d n'est pas en ligne"):format(target))
        return false
    end
    
    print(("[INFO] config.revive - Tentative de revive du joueur %d (%s)"):format(target, targetName))
    
    local frameworkPlayer = nil
    if GetResourceState("es_extended") == "started" then
        frameworkPlayer = ESX.GetPlayerFromId(target)
        if not frameworkPlayer then
            print(("[ERROR] config.revive - Impossible de récupérer xPlayer ESX pour %d"):format(target))
            return false
        end
    elseif GetResourceState("qb-core") == "started" then
        frameworkPlayer = QBCore.Functions.GetPlayer(target)
        if not frameworkPlayer then
            print(("[ERROR] config.revive - Impossible de récupérer player QBCore pour %d"):format(target))
            return false
        end
    end
    
    local reviveEvents = {
        "esx_ambulancejob:revive",
        "ambulancejob:revive", 
        "esx_basicneeds:healPlayer",
        "ars_ambulancejob:revive",
        "qb-ambulancejob:client:Revive",
        "hospital:client:Revive", 
        "wasabi_ambulance:revive",
        "visn_are:resetHealthBuffer",
        "mythic_hospital:client:revive",
        "paramedic:revive",
        "medical:revive"
    }
    
    local eventsTriggered = 0
    for _, event in ipairs(reviveEvents) do
        TriggerClientEvent(event, target)
        eventsTriggered = eventsTriggered + 1
    end
    
    TriggerClientEvent("gunware:admin:forceRevive", target)
    
    local adminName = source and GetPlayerName(source) or "CONSOLE"
    print(("[SUCCESS] config.revive - Joueur %d (%s) revive par %s - %d événements déclenchés"):format(
        target, targetName, adminName, eventsTriggered))
    
    return true
end

---@param target number
---@param source number|nil
config.heal = function(target, source)
    if not target or type(target) ~= "number" then
        print(("[ERROR] config.heal - Target invalide: %s"):format(tostring(target)))
        return false
    end
    
    local targetName = GetPlayerName(target)
    if not targetName then
        print(("[ERROR] config.heal - Joueur %d n'est pas en ligne"):format(target))
        return false
    end
    
    print(("[INFO] config.heal - Tentative de heal du joueur %d (%s)"):format(target, targetName))
    
    local frameworkPlayer = nil
    if GetResourceState("es_extended") == "started" then
        frameworkPlayer = ESX.GetPlayerFromId(target)
        if not frameworkPlayer then
            print(("[ERROR] config.heal - Impossible de récupérer xPlayer ESX pour %d"):format(target))
            return false
        end
    elseif GetResourceState("qb-core") == "started" then
        frameworkPlayer = QBCore.Functions.GetPlayer(target)
        if not frameworkPlayer then
            print(("[ERROR] config.heal - Impossible de récupérer player QBCore pour %d"):format(target))
            return false
        end
    end
    
    local healEvents = {
        "esx_ambulancejob:heal",
        "ambulancejob:heal",
        "esx_basicneeds:healPlayer",
        "qb-ambulancejob:client:Heal",
        "hospital:client:Heal",
        "wasabi_ambulance:heal",
        "mythic_hospital:client:heal",
        "paramedic:heal",
        "medical:heal"
    }
    
    local eventsTriggered = 0
    for _, event in ipairs(healEvents) do
        TriggerClientEvent(event, target)
        eventsTriggered = eventsTriggered + 1
    end
    
    TriggerClientEvent("gunware:admin:forceHeal", target)
    
    local adminName = source and GetPlayerName(source) or "CONSOLE"
    print(("[SUCCESS] config.heal - Joueur %d (%s) soigné par %s - %d événements déclenchés"):format(
        target, targetName, adminName, eventsTriggered))
    
    return true
end

---@param source number
---@param time number
---@param reason string
config.banPlayer = function(source, time, reason)
end

---@param source number
config.reloadskin = function(source)
    TriggerClientEvent("illenium-appearance:client:reloadSkin", source)
end

---@param weatherType string
---@param source number|nil
function config.changerWeather(weatherType, source)
    if not weatherType or type(weatherType) ~= "string" then
        print(("[ERROR] config.changerWeather - WeatherType invalide: %s"):format(tostring(weatherType)))
        return false
    end
    
    print(("[INFO] config.changerWeather - Changement météo vers: %s"):format(weatherType))
    
    local weatherMethods = {
        {
            resource = "vSync",
            method = function()
                ExecuteCommand("weather " .. weatherType)
                return true
            end
        },
        {
            resource = "Renewed-Weathersync", 
            method = function()
                TriggerEvent("Renewed-Weathersync:server:setWeather", weatherType)
                return true
            end
        },
        {
            resource = "qb-weathersync",
            method = function()
                TriggerEvent("qb-weathersync:server:setWeather", weatherType)
                return true
            end
        },
        {
            resource = "cd_easytime",
            method = function()
                TriggerClientEvent("cd_easytime:SyncWeather", -1, {
                    weather = weatherType,
                    instantweather = true,
                })
                return true
            end
        },
        {
            resource = "WeatherSync",
            method = function()
                TriggerEvent("WeatherSync:setWeather", weatherType)
                return true
            end
        },
        {
            resource = "vSyncR",
            method = function()
                ExecuteCommand("weather " .. weatherType)
                return true
            end
        },
        {
            resource = "WeatherCycle",
            method = function()
                TriggerEvent("WeatherCycle:setWeather", weatherType)
                return true
            end
        },
        {
            resource = "FiveM-WeatherSync",
            method = function()
                ExecuteCommand("weather " .. weatherType)
                return true
            end
        }
    }
    
    local success = false
    local methodsUsed = {}
    
    for _, weatherScript in ipairs(weatherMethods) do
        if GetResourceState(weatherScript.resource) == "started" then
            local scriptSuccess = weatherScript.method()
            if scriptSuccess then
                success = true
                table.insert(methodsUsed, weatherScript.resource)
            end
        end
    end

    if not success then
        print("[INFO] config.changerWeather - Aucun script météo détecté, utilisation du système standalone")
        TriggerClientEvent("gunware:weather:standalone", -1, weatherType)
        success = true
        table.insert(methodsUsed, "standalone")
    end
    
    TriggerClientEvent("gunware:sync:client", -1, "server_weather", {weather = weatherType})
    
    local adminName = source and GetPlayerName(source) or "CONSOLE"
    print(("[SUCCESS] config.changerWeather - Météo changée vers '%s' par %s - Méthodes utilisées: %s"):format(
        weatherType, adminName, table.concat(methodsUsed, ", ")))
    
    return success
end

---@param hour number
---@param minute number
---@param source number|nil
function config.changerTime(hour, minute, source)
    if not hour or type(hour) ~= "number" or hour < 0 or hour > 23 then
        print(("[ERROR] config.changerTime - Heure invalide: %s"):format(tostring(hour)))
        return false
    end
    
    if not minute then minute = 0 end
    if type(minute) ~= "number" or minute < 0 or minute > 59 then
        print(("[ERROR] config.changerTime - Minute invalide: %s"):format(tostring(minute)))
        return false
    end
    
    print(("[INFO] config.changerTime - Changement heure vers: %02d:%02d"):format(hour, minute))
    
    local timeMethods = {
        {
            resource = "vSync",
            method = function()
                ExecuteCommand("time " .. hour .. " " .. minute)
                return true
            end
        },
        {
            resource = "Renewed-Weathersync",
            method = function()
                TriggerEvent("Renewed-Weathersync:server:setTime", hour, minute, 0)
                return true
            end
        },
        {
            resource = "qb-weathersync", 
            method = function()
                TriggerEvent("qb-weathersync:server:setTime", hour, minute)
                return true
            end
        },
        {
            resource = "cd_easytime",
            method = function()
                TriggerClientEvent("cd_easytime:SyncTime", -1, {
                    hours = hour,
                    mins = minute,
                })
                return true
            end
        },
        {
            resource = "WeatherSync",
            method = function()
                TriggerEvent("WeatherSync:setTime", hour, minute, 0)
                return true
            end
        },
        {
            resource = "vSyncR",
            method = function()
                ExecuteCommand("time " .. hour .. " " .. minute)
                return true
            end
        },
        {
            resource = "WeatherCycle",
            method = function()
                TriggerEvent("WeatherCycle:setTime", hour, minute, 0)
                return true
            end
        },
        {
            resource = "FiveM-WeatherSync",
            method = function()
                ExecuteCommand("time " .. hour .. " " .. minute)
                return true
            end
        }
    }
    
    local success = false
    local methodsUsed = {}
    
    for _, timeScript in ipairs(timeMethods) do
        if GetResourceState(timeScript.resource) == "started" then
            local scriptSuccess = timeScript.method()
            if scriptSuccess then
                success = true
                table.insert(methodsUsed, timeScript.resource)
            end
        end
    end
    
    if not success then
        print("[INFO] config.changerTime - Aucun script temps détecté, utilisation du système standalone")
        TriggerClientEvent("gunware:time:standalone", -1, hour, minute)
        success = true
        table.insert(methodsUsed, "standalone")
    end
    
    TriggerClientEvent("gunware:sync:client", -1, "server_time", {hour = hour, minute = minute})
    
    local adminName = source and GetPlayerName(source) or "CONSOLE"
    print(("[SUCCESS] config.changerTime - Heure changée vers %02d:%02d par %s - Méthodes utilisées: %s"):format(
        hour, minute, adminName, table.concat(methodsUsed, ", ")))
    
    return success
end

RegisterNetEvent("gunware:sync:actionServer")
AddEventHandler("gunware:sync:actionServer", function(action, data)
    local src = source
    print(("[INFO] gunware:sync:actionServer - Action %s demandée par %d"):format(action, src))
    
    local adminPlayer = GetFrameWorkPlayer(src)
    if not adminPlayer then
        print(("[ERROR] gunware:sync:actionServer - Impossible de récupérer le joueur admin %d"):format(src))
        return
    end
    
    if action == "server_weather" then
        if data and data.weather then
            local success = config.changerWeather(data.weather, src)
            if success then
                TriggerClientEvent("gunware:notif", src, "success", "Météo changée avec succès")
            else
                TriggerClientEvent("gunware:notif", src, "error", "Erreur lors du changement de météo")
            end
        else
            print(("[ERROR] gunware:sync:actionServer - Données météo manquantes"))
            TriggerClientEvent("gunware:notif", src, "error", "Données météo invalides")
        end
        
    elseif action == "server_time" then
        if data and data.hour and data.minute then
            local hour = tonumber(data.hour)
            local minute = tonumber(data.minute)
            local success = config.changerTime(hour, minute, src)
            if success then
                TriggerClientEvent("gunware:notif", src, "success", "Heure changée avec succès")
            else
                TriggerClientEvent("gunware:notif", src, "error", "Erreur lors du changement d'heure")
            end
        else
            print(("[ERROR] gunware:sync:actionServer - Données temps manquantes"))
            TriggerClientEvent("gunware:notif", src, "error", "Données temps invalides")
        end
        
    else
        print(("[WARNING] gunware:sync:actionServer - Action inconnue: %s"):format(action))
        TriggerClientEvent("gunware:notif", src, "error", "Action inconnue")
    end
end)

RegisterNetEvent("gunware:sync:openInventory")
AddEventHandler("gunware:sync:openInventory", function(player)
    local src = source
    if GetResourceState("ox_inventory") == "started" then
        exports.ox_inventory:forceOpenInventory(src, 'player', player)
    end

    if GetResourceState("qs-inventory") == "started" then
        TriggerClientEvent("qs-openPlayerInventory", src, player)
    end
end)

RegisterNetEvent("gunware:request:revive")
AddEventHandler("gunware:request:revive", function(target)
    local src = source
    print(("[INFO] gunware:request:revive - Demande de revive de %d vers %d"):format(src, target))
    
    local adminPlayer = GetFrameWorkPlayer(src)
    if not adminPlayer then
        print(("[ERROR] gunware:request:revive - Impossible de récupérer le joueur admin %d"):format(src))
        return
    end
    
    local success = config.revive(target, src)
    if success then
        TriggerClientEvent("gunware:notif", src, "success", "Joueur revive avec succès")
    else
        TriggerClientEvent("gunware:notif", src, "error", "Erreur lors du revive")
    end
end)

RegisterNetEvent("gunware:request:heal")
AddEventHandler("gunware:request:heal", function(target)
    local src = source
    print(("[INFO] gunware:request:heal - Demande de heal de %d vers %d"):format(src, target))
    
    local adminPlayer = GetFrameWorkPlayer(src)
    if not adminPlayer then
        print(("[ERROR] gunware:request:heal - Impossible de récupérer le joueur admin %d"):format(src))
        return
    end
    
    local success = config.heal(target, src)
    if success then
        TriggerClientEvent("gunware:notif", src, "success", "Joueur soigné avec succès")
    else
        TriggerClientEvent("gunware:notif", src, "error", "Erreur lors du heal") 
    end
end)



RegisterNetEvent("gunware:sendAnnonce")
AddEventHandler("gunware:sendAnnonce", function(msg)
    TriggerClientEvent("gunware:sendAnnonce", -1, msg)
end)

RegisterNetEvent("gunware:wipeVehicles")
AddEventHandler("gunware:wipeVehicles", function()
    MySQL.Async.execute("DELETE FROM owned_vehicles", {}, function()
        TriggerClientEvent("gunware:notify", -1, "success", "All vehicles have been wiped")
    end)
end)

RegisterNetEvent("gunware:wipePlayers")
AddEventHandler("gunware:wipePlayers", function()
end)

lib.addCommand('allitems', {
    help = 'Tous les items',
    params = {},
    restricted = 'group.admin',
}, function(source, args)
    local ox_inventory = exports.ox_inventory
    local allitems = ox_inventory:Items()
    local table = {}
    local maxWeight = 0
    for name, item in pairs(allitems) do
        if name and item then
            table[#table+1] = {name, 500000}
            maxWeight = maxWeight + (item.weight * 500000)
        end
    end
    local stash = ox_inventory:CreateTemporaryStash({
        label = 'Tous les items',
        slots = #table,
        maxWeight = maxWeight,
        items = table
    })
    TriggerClientEvent('ox_inventory:openInventory', source, 'stash', stash)
end)

lib.addCommand('searchitems', {
    help = 'Rechercher un item',
    params = {
        { name = 'pattern', type = 'string', help = 'Pattern of name or label item' },
    },
    restricted = 'group.admin',
}, function(source, args)
    local ox_inventory = exports.ox_inventory
    local allitems = ox_inventory:Items()
    local table = {}
    local maxWeight = 0
    for name, item in pairs(allitems) do
        if name and item and (
            args.pattern:lower() == 'item' and 
            (not string.find(name:lower(), ('weapon_'):lower()) and 
             not string.find(name:lower(), ('ammo-'):lower()) and 
             not string.find(name:lower(), ('at_'):lower()))
            ) or 
            string.find(name:lower(), args.pattern:lower()) or 
            string.find(item.label:lower(), args.pattern:lower()) 
        then
            table[#table+1] = {name, 500000}
            maxWeight = maxWeight + (item.weight * 500000)
        end
    end
    local stash = ox_inventory:CreateTemporaryStash({
        label = 'Item pattern: ' .. args.pattern,
        slots = #table,
        maxWeight = maxWeight,
        items = table
    })
    TriggerClientEvent('ox_inventory:openInventory', source, 'stash', stash)
end)

lib.addCommand('trash', {
    help = 'Poubelle',
    params = {},
    restricted = 'group.admin',
}, function(source, args)
    local ox_inventory = exports.ox_inventory
    local stash = ox_inventory:CreateTemporaryStash({
        label = 'Poubelle',
        slots = 1000000,
        maxWeight = 1000000 * 1000000,
        items = {}
    })
    TriggerClientEvent('ox_inventory:openInventory', source, 'stash', stash)
end)

lib.addCommand('testscreenshot', {
    help = 'Tester le système de screenshot',
    params = {
        { name = 'target', type = 'playerId', help = 'ID du joueur à screenshot' },
    },
    restricted = 'group.admin',
}, function(source, args)
    local target = args.target
    
    if not target or not GetPlayerName(target) then
        TriggerClientEvent("gunware:notif", source, "error", "Joueur invalide")
        return
    end
    
    print(("[INFO] Test screenshot - Admin %d demande screenshot de %d"):format(source, target))
    
    -- Vérifier si screenshot-basic est disponible
    if GetResourceState("screenshot-basic") ~= "started" then
        TriggerClientEvent("gunware:notif", source, "error", "Resource screenshot-basic non démarré")
        print("[ERROR] screenshot-basic n'est pas démarré")
        return
    end
    
    -- Déclencher le screenshot
    TriggerClientEvent("gunware:sync:actionPlayer", target, {
        action = "player_screenshot",
        target = target,
        src = source
    })
    
    TriggerClientEvent("gunware:notif", source, "info", "Commande screenshot envoyée à " .. GetPlayerName(target))
end)



config.impoundAll = function()
    MySQL.Async.execute("UPDATE owned_vehicles SET stored = 1 WHERE stored = 0", {}, function(affectedRows)
        if affectedRows > 0 then
            TriggerClientEvent("gunware:notif", source, "success", "Tous les véhicules en fourrière ont été supprimés")
        else
            TriggerClientEvent("gunware:notif", source, "error", "Il n'y a pas de véhicules en fourrière")
        end
    end)
end

---@param src number
---@return string
function getDiscordId(src)
    local identifiers = GetPlayerIdentifiers(src)
    if identifiers then
        for _, id in pairs(identifiers) do
            if string.match(id, "^discord:") then
                return string.gsub(id, "discord:", "")
            end
        end
    end
    return "N/A"
end

---@param src number
---@return string
function getRPname(src)
    if GetResourceState("es_extended") == "started" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer then
            return 'John Doe'
        end

        local licence = xPlayer.identifier
        local result = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier",
            { ['@identifier'] = licence })
        if #result == 0 then
            return 'John Doe'
        else
            local name = result[1].firstname or "John"
            local lastname = result[1].lastname or "Doe"
            return name .. " " .. lastname
        end
    else
        local player = QBCore.Functions.GetPlayer(src)
        if not player then
            return 'John Doe'
        end
        return player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname
    end
end

---@param name string
---@param cb function
function RegisterServerCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

AddEventHandler('playerDropped', function(reason)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then
        return
    end
    PlayerServer[src] = nil
    TriggerClientEvent("gunware:player:leave", -1, src)
    if not PlayerServerOffline[xPlayer.identifier] then
        PlayerServerOffline[xPlayer.identifier] = xPlayer
        TriggerClientEvent("gunware:player:leaveNewOffline", -1, src, PlayerServerOffline[xPlayer.identifier])
    end
end)

RegisterNetEvent("gunware:player:join")
AddEventHandler("gunware:player:join", function()
    local src = source
    Citizen.Wait(1000)
    if GetResourceState("es_extended") == "started" then
        local xPlayer = ESX.GetPlayerFromId(src)

        if not xPlayer then
            return
        end

        local perm = getRolesPermissions(getPlayersRole(src), src)

        GetPlayerSkin(xPlayer, function(skin)
            PlayerServer[src] = {
                source = src,
                identifier = xPlayer.identifier,
                name = GetPlayerName(src),
                rp = getRPname(src),
                skin = skin,
                role = getPlayersRole(src),
                roleColor = getRoleColor(getPlayersRole(src)),
                ping = GetPlayerPing(src),
                ip = GetPlayerEndpoint(src),
                token = "token",
                discord = getDiscordId(src),
                permission = perm
            }
            
            -- Envoyer les données complètes seulement aux joueurs staff pour éviter les lags
            local staffPlayers = GetOnlineStaff()
            for _, playerId in ipairs(staffPlayers) do
                TriggerClientEvent("gunware:player:join", playerId, src, PlayerServer[src], serverButtonFunds, ranksServer)
            end
            -- Envoyer seulement la notification de connexion à tous les joueurs
            TriggerClientEvent("gunware:playerConnect", -1, GetPlayerName(src) .. " " .. PlayerServer[src].rp)
        end)
    else
        local player = QBCore.Functions.GetPlayer(src)
        if not player then
            return
        end

        local perm = getRolesPermissions(getPlayersRole(src), src)

        GetPlayerSkin(player, function(skin)
            PlayerServer[src] = {
                source = src,
                identifier = player.PlayerData.citizenid,
                name = GetPlayerName(src),
                rp = getRPname(src),
                skin = skin,
                role = getPlayersRole(src),
                roleColor = getRoleColor(getPlayersRole(src)),
                ping = GetPlayerPing(src),
                ip = GetPlayerEndpoint(src),
                token = "token",
                discord = getDiscordId(src),
                permission = perm
            }
            
            -- Envoyer les données complètes seulement aux joueurs staff pour éviter les lags
            local staffPlayers = GetOnlineStaff()
            for _, playerId in ipairs(staffPlayers) do
                TriggerClientEvent("gunware:player:join", playerId, src, PlayerServer[src], serverButtonFunds, ranksServer)
            end
            -- Envoyer seulement la notification de connexion à tous les joueurs
            TriggerClientEvent("gunware:playerConnect", -1, GetPlayerName(src) .. " " .. PlayerServer[src].rp)
        end)
    end
end)

---@param source number
---@return string
function getIdentifiant(source)
    if GetResourceState("es_extended") == "started" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then
            return
        end
        return xPlayer.identifier
    else
        local player = QBCore.Functions.GetPlayer(source)
        if not player then
            return
        end
        return player.PlayerData.citizenid
    end
end

---@param source number
---@return table
function getCoords(source)
    if GetResourceState("es_extended") == "started" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then
            return
        end
        return xPlayer.getCoords(true)
    else
        local player = QBCore.Functions.GetPlayer(source)
        if not player then
            return
        end
        return player.PlayerData.metadata.location
    end
end

---@param source number
---@param job string
---@param grade number
config.setJob = function(source, job, grade)
    if not source or not job or not grade then
        print("[ERROR] config.setJob - Paramètres manquants: source=" .. tostring(source) .. ", job=" .. tostring(job) .. ", grade=" .. tostring(grade))
        return false
    end
    
    local targetName = GetPlayerName(source)
    if not targetName then
        print("[ERROR] config.setJob - Joueur " .. source .. " n'est pas en ligne")
        return false
    end
    
    print("[INFO] config.setJob - Changement job pour " .. source .. " (" .. targetName .. ") vers " .. job .. " grade " .. grade)
    
    if GetResourceState("es_extended") == "started" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then
            print("[ERROR] config.setJob - Impossible de récupérer xPlayer ESX pour " .. source)
            return false
        end
        xPlayer.setJob(job, grade)
        print("[SUCCESS] config.setJob - Job ESX changé avec succès")
        return true
    elseif GetResourceState("qb-core") == "started" then
        local player = QBCore.Functions.GetPlayer(source)
        if not player then
            print("[ERROR] config.setJob - Impossible de récupérer player QBCore pour " .. source)
            return false
        end
        player.Functions.SetJob(job, grade)
        print("[SUCCESS] config.setJob - Job QBCore changé avec succès")
        return true
    else
        print("[ERROR] config.setJob - Aucun framework détecté (ESX/QBCore)")
        return false
    end
end

---@param source number
---@return table
function GetFrameWorkPlayer(source)
    if GetResourceState("es_extended") == "started" then
        return ESX.GetPlayerFromId(source)
    else
        return QBCore.Functions.GetPlayer(source)
    end
end



config.Wipe = function(target)
    DropPlayer(target, "You have been wiped")
end