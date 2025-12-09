Framework = nil
Fr = {}

Citizen.CreateThread(function()
    if Config.FrameWork == "ESX" then
        Framework = exports["es_extended"]:getSharedObject()
        Fr.RegisterServerCallback = function(...)
            return Framework.RegisterServerCallback(...)
        end
        Fr.getPlayerFromId = function(...)
            return Framework.GetPlayerFromId(...)
        end
        Fr.GetMoney = function(xPlayer, account)
            return xPlayer.getAccount(account).money
        end
        Fr.ManageMoney = function(xPlayer, account, action, amount)
            if action == "add" then
                return xPlayer.addAccountMoney(account, amount)
            else
                return xPlayer.removeAccountMoney(account, amount)
            end
        end
    elseif Config.FrameWork == "QBCORE" then
        Framework = exports['qb-core']:GetCoreObject()
        Fr.RegisterServerCallback = function(...)
            return Framework.Functions.CreateCallback(...)
        end
        Fr.getPlayerFromId = function(...)
            return Framework.Functions.GetPlayer(...)
        end
        Fr.GetMoney = function(Player, account)
            if account == "money" then account = "cash" end
            return Player.PlayerData.money[account]
        end
        Fr.ManageMoney = function(Player, account, action, amount)
            if account == "money" then account = "cash" end
            if action == "add" then
                return Player.Functions.AddMoney(account, amount)
            else
                return Player.Functions.RemoveMoney(account, amount)
            end
        end
    end
end)
