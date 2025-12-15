-- ============================================
-- More exclusive content you will find here:
-- Cleaned and working - hot scripts and more.
--
-- https://unlocknow.net/releases
-- https://discord.gg/unlocknoww
-- ============================================



function IsResourceOnServer(resourceName)
    if GetResourceState(resourceName) == "started" or GetResourceState(resourceName) == "starting" then
        return true
    end
    return false
end
if Config == nil then
    Config = {}
end
if Config.MysqlType == nil then
    if IsResourceOnServer("oxmysql") then
        local OxMySQLVersion = GetResourceMetadata("oxmysql", "version"):gsub("%D+", "")
        OxMySQLVersion = tonumber(OxMySQLVersion)
        if OxMySQLVersion <= 189 then
            Config.MysqlType = 0
        else
            Config.MysqlType = 2
        end
    elseif IsResourceOnServer("mysql-async") then
        Config.MysqlType = 2
    elseif IsResourceOnServer("ghmattimysql") then
        Config.MysqlType = 1
    end
end
if Config.MysqlType == 0 then
    MySQL = {}
    MySQL.Sync = {}
    MySQL.Async = {}
    function MySQL.Sync.fetchAll(query, table_, cb)
        return exports['oxmysql']:executeSync(query, table_, cb)
    end
    function MySQL.Async.fetchAll(query, table_, cb)
        return exports['oxmysql']:execute(query, table_, cb)
    end
    function MySQL.Sync.execute(query, table_, cb)
        return exports['oxmysql']:executeSync(query, table_, cb)
    end
    function MySQL.Sync.fetchScalar(query, table_, cb)
        return exports['oxmysql']:scalar(query, table_, cb)
    end
    function MySQL.Sync.insert(query, table_, cb)
        return exports['oxmysql']:insert(query, table_, cb)
    end
    function MySQL.Async.execute(query, table_, cb)
        return exports['oxmysql']:execute(query, table_, cb)
    end
end
if Config.MysqlType == 1 then
    MySQL = {}
    MySQL.Sync = {}
    MySQL.Async = {}
    MySQL.Async.fetchAll = function(query, table_, cb)
        return exports['ghmattimysql']:execute(query, table_, cb)
    end
    MySQL.Sync.fetchAll = function(query, table_, cb)
        return exports['ghmattimysql']:executeSync(query, table_, cb)
    end
    MySQL.Async.execute = function(query, table_, cb)
        return exports['ghmattimysql']:execute(query, table_, cb)
    end
    MySQL.Sync.insert = function(query, table_, cb)
        return exports['ghmattimysql']:executeSync(query, table_, cb)
    end
    MySQL.Sync.execute = function(query, table_, cb)
        return exports['ghmattimysql']:executeSync(query, table_, cb)
    end
    MySQL.Async.fetchScalar = function(query, table_, cb)
        return exports['ghmattimysql']:scalar(query, table_, cb)
    end
    MySQL.Sync.fetchScalar = function(query, table_, cb)
        return exports['ghmattimysql']:scalarSync(query, table_, cb)
    end
end
