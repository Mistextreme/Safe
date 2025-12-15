function CanUseWorkshop(player, workshop)
    local xPlayer = ESX.GetPlayerFromId(player)
    local job = xPlayer.getJob()

    if not workshop.playerWorkshop then
        if job.name ~= workshop.jobWorkshop or job.grade < workshop.permissions.swapJobGrade then
            TriggerClientEvent('kq_engineswaps:notify', player, L('~r~You do not have the permission to do this'))
            return false
        end
    end

    return true
end

function CanUsePurchaseEngines(player, workshop)
    local xPlayer = ESX.GetPlayerFromId(player)
    local job = xPlayer.getJob()

    if not workshop.playerWorkshop and (job.name ~= workshop.jobWorkshop or job.grade < workshop.permissions.purchaseEngineJobGrade) then
        TriggerClientEvent('kq_engineswaps:notify', player, L('~r~You do not have the permission to do this'))
        return false
    end

    return true
end

function ChargeForEngine(player, engineKey, workshop)
    local xPlayer = ESX.GetPlayerFromId(player)
    local engine = Config.Engines[engineKey]

    local canContinue = nil

    if workshop.useSharedAccount then
        TriggerEvent('esx_addonaccount:getSharedAccount', workshop.sharedAccount, function(account)
            if account.money >= engine.price then
                account.removeMoney(engine.price)
                canContinue = true
            else
                TriggerClientEvent('kq_engineswaps:purchasePopup', player, L('YOUR SHARED ACCOUNT DOES NOT HAVE ENOUGH MONEY'))
                canContinue = false
            end
        end)
    else
        if xPlayer.getAccount('bank').money >= engine.price then
            xPlayer.removeAccountMoney('bank', engine.price)
            canContinue = true
        else
            TriggerClientEvent('kq_engineswaps:purchasePopup', player, L('YOU CAN NOT AFFORD THIS PURCHASE'))
            canContinue = false
        end
    end

    return canContinue
end


function _GetPlayerIdentifier(player)
    local xPlayer = ESX.GetPlayerFromId(player)

    return xPlayer.identifier
end