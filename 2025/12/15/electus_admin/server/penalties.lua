function GetBans()
	-- if Config.framework == "qb" then
	-- 	local result = MySQL.query.await("SELECT * FROM `bans`")

	-- 	local qbBans = {}
	-- 	for i = 1, #result do
	-- 		qbBans[i] = {}
	-- 		qbBans[i].id = result[i].id
	-- 		qbBans[i].license = result[i].license
	-- 		qbBans[i].discord = result[i].discord
	-- 		qbBans[i].ip = result[i].ip
	-- 		qbBans[i].reason = result[i].reason
	-- 		qbBans[i].expire = result[i].expire
	-- 		qbBans[i].banned_by = result[i].bannedby
	-- 	end
	-- else
	local result = MySQL.query.await("SELECT * FROM `electus_admin_bans`")

	return result
	-- end
end

function GetWarnings()
	local warnings = MySQL.query.await("SELECT * FROM `electus_admin_warnings`")

	return warnings
end

function IsBanned(license, discord, ip)
	local result = MySQL.single.await(
		"SELECT * FROM `electus_admin_bans` WHERE `license` = @license OR `discord` = @discord OR `ip` = @ip",
		{ ["@license"] = license, ["@discord"] = discord, ["@ip"] = ip }
	)

	if result?.expire and result?.permanent == 0 then
		local hasExpired = os.time() > (result?.expire / 1000)

		if hasExpired then
			MySQL.update.await(
				"DELETE FROM `electus_admin_bans` WHERE `license` = @license AND id = @id",
				{ ["@license"] = license, ["@id"] = result?.id }
			)

			return false
		end
	end

	return result
end

function GetNumWarns(license)
	local result = MySQL.query.await(
		"SELECT * FROM `electus_admin_warnings` WHERE `license` = @license",
		{ ["@license"] = license }
	)

	return #result
end

function GetPlayerByLicense(license)
	local players = GetPlayers()
	for i = 1, #players do
		if GetOnlineLicense(players[i]) == license then
			return players[i]
		end
	end
end

function Ban(username, license, reason, permanent, expire, bannedBy)
	local hasPermissions = HasPermission(username, "ban")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Banned " .. username .. " with license " .. license .. " for " .. reason)

	local online = GetPlayerByLicense(license)
	local discord = nil
	local ip = nil

	if type(expire) == "string" then
		local time = os.time()
		expire = tonumber(expire)

		if not expire or expire == 0 then
			expire = 0
		else
			expire = time + (expire * 3600 * 24)
		end
	end

	expire = os.date("%Y-%m-%d %H:%M:%S", expire)

	if online then
		DropPlayer(online, "You have been banned from the server. Reason: " .. reason)
		discord = GetPlayerIdentifierByType(online, "discord")
		ip = GetPlayerIdentifierByType(online, "ip")
	end

	if IsBanned(license, discord, ip) then
		return false
	end

	MySQL.insert.await(
		"INSERT INTO `electus_admin_bans` (`license`, `discord`, `ip`, `reason`, `expire`, `permanent`, `banned_by`) VALUES (@license, @discord, @ip, @reason, @expire, @permanent, @bannedby)",
		{
			["@license"] = license,
			["@discord"] = discord or "N/A",
			["@ip"] = ip or "N/A",
			["@reason"] = reason or "N/A",
			["@expire"] = expire or 0,
			["@permanent"] = (permanent and 1) or 0,
			["@bannedby"] = username,
		}
	)
end

function Warn(username, license, reason, warnedBy)
	local hasPermissions = HasPermission(username, "warn")

	if not hasPermissions then
		return false
	end

	local online = GetPlayerByLicense(license)
	local discord = nil
	local ip = nil

	if online then
		discord = GetPlayerIdentifierByType(online, "discord")
		ip = GetPlayerIdentifierByType(online, "ip")
	end

	AdminLog(-1, "info", "Warned " .. username .. " with license " .. license .. " for " .. reason)

	MySQL.Async.execute(
		"INSERT INTO `electus_admin_warnings` (`license`, `discord`, `ip`, `reason`, `warned_by`) VALUES (@license, @discord, @ip, @reason, @warnedby)",
		{
			["@license"] = license,
			["@discord"] = discord or "N/A",
			["@ip"] = ip or "N/A",
			["@reason"] = reason or "N/A",
			["@warnedby"] = username or "N/A",
		}
	)
end

function RemoveBan(username, license, id)
	local hasPermissions = HasPermission(username, "ban")

	if not hasPermissions then
		return false
	end

	AdminLog(-1, "info", "Removed ban for " .. license .. " by " .. username)

	MySQL.update.await(
		"DELETE FROM `electus_admin_bans` WHERE `license` = @license AND id = @id",
		{ ["@license"] = license, ["@id"] = id }
	)

	return true
end

function RemoveWarn(username, license, id)
	local hasPermissions = HasPermission(username, "warn")

	if not hasPermissions then
		return false
	end

	AdminLog(-1, "info", "Removed warn for " .. license .. " by " .. username)

	MySQL.update.await(
		"DELETE FROM `electus_admin_warnings` WHERE `license` = @license AND id = @id",
		{ ["@license"] = license, ["@id"] = id }
	)

	return true
end

function GetTotalBans()
	local result = MySQL.query.await("SELECT COUNT(*) as total FROM `electus_admin_bans`")
	return result[1].total
end

function GetTotalWarns()
	local result = MySQL.query.await("SELECT COUNT(*) as total FROM `electus_admin_warnings`")
	return result[1].total
end

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
	local src = source
	local license = GetPlayerIdentifierByType(src, "license"):gsub("license:", "")
	local discord = GetPlayerIdentifierByType(src, "discord")
	local ip = GetPlayerIdentifierByType(src, "ip")

	local ban = IsBanned(license, discord, ip)

	if ban then
		deferrals.done("You have been banned! Reason: " .. ban.reason)
	end
end)

exports("GetBans", GetBans)
exports("GetWarnings", GetWarnings)
exports("Ban", Ban)
exports("Warn", Warn)
exports("RemoveBan", RemoveBan)
exports("RemoveWarn", RemoveWarn)
exports("GetTotalBans", GetTotalBans)
exports("GetTotalWarns", GetTotalWarns)
