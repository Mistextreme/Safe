function TeleportToCoords(requestUsername, identifier, coords)
	local hasPermissions = HasPermission(requestUsername, "manage_players.teleport")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(
		-1,
		"info",
		"Teleported "
			.. identifier
			.. " to "
			.. coords.x
			.. ", "
			.. coords.y
			.. ", "
			.. coords.z
			.. " by "
			.. requestUsername
	)

	local source = GetSourceFromIdentifier(identifier)

	if source then
		-- SetEntityCoords(
		-- 	GetPlayerPed(source),
		-- 	tonumber(coords.x) + 0.0,
		-- 	tonumber(coords.y) + 0.0,
		-- 	tonumber(coords.z) + 0.0
		-- )
		TriggerClientEvent("elecuts_admin:teleportPlayer", source, coords)

		return true
	end

	return false
end

function TeleportToPlayer(requestUsername, identifier, targetPlayerId)
	local hasPermissions = HasPermission(requestUsername, "manage_players.teleport")

	if not hasPermissions then
		return { error = "permission" }
	end

	if targetPlayerId then
		AdminLog(-1, "info", "Teleported " .. identifier .. " to " .. targetPlayerId .. " by " .. requestUsername)
	end

	local source = GetSourceFromIdentifier(identifier)

	if source then
		if targetPlayerId then
			local targetCoords = GetEntityCoords(GetPlayerPed(targetPlayerId))

			SetEntityCoords(source, targetCoords.x, targetCoords.y, targetCoords.z + 0.5)

			return true
		end

		return false
	end
end

function ChangeJob(requestUsername, identifier, newJob, grade)
	local hasPermissions = HasPermission(requestUsername, "manage_players.manage_jobs")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(
		-1,
		"info",
		"Changed job for " .. identifier .. " to " .. newJob .. " with grade " .. grade .. " by " .. requestUsername
	)

	local player = GetPlayerFromIdentifier(identifier)

	if player then
		SetJobOnline(player, newJob, grade)
	else
		SetJobDatabase(identifier, newJob, grade)
	end

	return true
end

--- Kicks a player from the server
--- @param identifier string
--- @param reason string
function KickPlayer(requestUsername, identifier, reason)
	local hasPermissions = HasPermission(requestUsername, "kick_players")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Kicked " .. identifier .. " by " .. requestUsername .. " with reason " .. reason)

	local source = GetSourceFromIdentifier(identifier)

	if source then
		DropPlayer(source, reason or "Kicked by admin")
		return true
	end

	return false
end

function FreezePlayer(requestUsername, identifier)
	local hasPermissions = HasPermission(requestUsername, "manage_players.freeze")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Froze " .. identifier .. " by " .. requestUsername)

	local source = GetSourceFromIdentifier(identifier)

	FreezeEntityPosition(GetPlayerPed(source), true)
	return true
end

function UnfreezePlayer(requestUsername, identifier)
	local hasPermissions = HasPermission(requestUsername, "manage_players.freeze")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Unfroze " .. identifier .. " by " .. requestUsername)

	local source = GetSourceFromIdentifier(identifier)

	FreezeEntityPosition(GetPlayerPed(source), false)
end

function ScreenshotPlayer(playerId)
	local await = promise.new()

	exports["screenshot-basic"]:requestClientScreenshot(playerId, {
		fileName = "tempScreen",
	}, function(err, data)
		await:resolve(data)
	end)

	return await
end

function HealPlayer(requestUsername, identifier)
	local hasPermissions = HasPermission(requestUsername, "manage_players.heal")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Healed " .. identifier .. " by " .. requestUsername)

	local playerSrc = GetSourceFromIdentifier(identifier)

	if playerSrc then
		SetEntityHealth(GetPlayerPed(tonumber(playerSrc)), 200)
	end

	return true
end

function AdminGiveCash(requestUsername, identifier, amount)
	local hasPermissions = HasPermission(requestUsername, "manage_players.manage_money")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Gave cash " .. amount .. " to " .. identifier .. " by " .. requestUsername)

	amount = tonumber(amount)

	local player = GetPlayerFromIdentifier(identifier)

	if player then
		AddCashMoney(player, amount)
	else
		AddCashMoneyDatabase(identifier, amount)
	end

	return true
end

function AdminRemoveCash(requestUsername, identifier, amount)
	local hasPermissions = HasPermission(requestUsername, "manage_players.manage_money")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Removed cash " .. amount .. " from " .. identifier .. " by " .. requestUsername)

	amount = tonumber(amount)

	local player = GetPlayerFromIdentifier(identifier)

	if player then
		RemoveCashMoney(player, amount)
	else
		RemoveCashMoneyDatabase(identifier, amount)
	end

	return true
end

function AdminSetCash(requestUsername, identifier, amount)
	local hasPermissions = HasPermission(requestUsername, "manage_players.manage_money")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Set cash " .. amount .. " for " .. identifier .. " by " .. requestUsername)

	amount = tonumber(amount)

	local player = GetPlayerFromIdentifier(identifier)

	if player then
		local cash = GetCashMoney(player)

		if cash < amount then
			AddCashMoney(player, amount - cash)
		elseif cash > amount then
			RemoveCashMoney(player, cash - amount)
		end
	else
		SetCashMoneyDatabase(identifier, amount)
	end

	return true
end

function AdminGiveBank(requestUsername, identifier, amount)
	local hasPermissions = HasPermission(requestUsername, "manage_players.manage_money")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Gave bank " .. amount .. " to " .. identifier .. " by " .. requestUsername)

	amount = tonumber(amount)

	local player = GetPlayerFromIdentifier(identifier)

	if player then
		AddBankMoney(player, amount)
	else
		AddBankMoneyDatabase(identifier, amount)
	end

	return true
end

function AdminRemoveBank(requestUsername, identifier, amount)
	local hasPermissions = HasPermission(requestUsername, "manage_players.manage_money")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Removed bank " .. amount .. " from " .. identifier .. " by " .. requestUsername)

	amount = tonumber(amount)

	local player = GetPlayerFromIdentifier(identifier)

	if player then
		RemoveBankMoney(player, amount)
	else
		RemoveBankMoneyDatabase(identifier, amount)
	end

	return true
end

function AdminSetBank(requestUsername, identifier, amount)
	local hasPermissions = HasPermission(requestUsername, "manage_players.manage_money")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Set bank " .. amount .. " for " .. identifier .. " by " .. requestUsername)

	amount = tonumber(amount)

	local player = GetPlayerFromIdentifier(identifier)

	if player then
		local bank = GetBankMoney(player)

		if bank < amount then
			AddBankMoney(player, amount - bank)
		elseif bank > amount then
			RemoveBankMoney(player, bank - amount)
		end
	else
		SetBankMoneyDatabase(identifier, amount)
	end

	return true
end

function GetAllPlayers(page, filter)
	return FrameworkGetAllPlayers(page, filter)
	-- local cache = Cache("allPlayers")

	-- if not cache then
	-- 	local players = FrameworkGetAllPlayers()

	-- 	CacheSet("allPlayers", players, 30)
	-- end

	-- return Cache("allPlayers")
end

function GetOnlinePlayers()
	return FrameworkGetOnlinePlayers()
end

function KillPlayer(requestUsername, playerId)
	local hasPermissions = HasPermission(requestUsername, "manage_players")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Killed player " .. playerId .. " by " .. requestUsername)

	TriggerClientEvent("elecuts_admin:killPlayer", playerId)

	return true
end

function RevivePlayer(requestUsername, playerId)
	local hasPermissions = HasPermission(requestUsername, "manage_players.revive")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Revived player " .. playerId .. " by " .. requestUsername)

	TriggerClientEvent("hospital:client:Revive", playerId)
	TriggerClientEvent("esx_ambulancejob:revive", playerId)
	TriggerClientEvent("hospital:client:Revive", playerId)
	TriggerClientEvent("visn_are:resetHealthBuffer", playerId)

	return true
end

function GetExtendedPlayer(identifier)
	return FrameworkGetExtendedPlayer(identifier)
end

exports("TeleportToCoords", TeleportToCoords)
exports("TeleportToPlayer", TeleportToPlayer)
exports("ChangeJob", ChangeJob)
exports("KickPlayer", KickPlayer)
exports("FreezePlayer", FreezePlayer)
exports("UnfreezePlayer", UnfreezePlayer)
exports("ScreenshotPlayer", ScreenshotPlayer)
exports("HealPlayer", HealPlayer)
exports("AdminGiveCash", AdminGiveCash)
exports("AdminRemoveCash", AdminRemoveCash)
exports("AdminSetCash", AdminSetCash)
exports("AdminGiveBank", AdminGiveBank)
exports("AdminRemoveBank", AdminRemoveBank)
exports("AdminSetBank", AdminSetBank)
exports("KillPlayer", KillPlayer)
exports("RevivePlayer", RevivePlayer)
exports("GetExtendedPlayer", GetExtendedPlayer)
