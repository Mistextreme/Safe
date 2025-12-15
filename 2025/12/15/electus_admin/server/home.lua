--- Get number of players in the server
--- @return number | nil
function GetPlayerCount()
	return GetNumPlayerIndices()
end

--- Get the total bank in the server
--- @return number | nil
function GetTotalBank()
	local cache = Cache("totalBank")

	if not cache then
		local totalBank = FrameworkGetTotalBank()

		CacheSet("totalBank", totalBank, 600)

		return totalBank
	end

	return cache.value
end

--- Get the total cash in the server
--- @return number | nil
function GetTotalCash()
	local cache = Cache("totalCash")

	if not cache then
		local totalCash = FrameworkGetTotalCash()

		CacheSet("totalCash", totalCash, 600)

		return totalCash
	end

	return cache.value
end

--- Get number of staffs in the server
--- @return number | nil
function GetStaffOnline()
	local cache = Cache("staffOnline")

	if not cache then
		local staffs = 0

		for i = 0, GetNumPlayerIndices() do
			local player = GetPlayerFromIndex(i)

			if player and IsAdmin(player) then
				staffs = staffs + 1
			end
		end

		CacheSet("staffOnline", staffs, 60)

		return staffs
	end

	return cache.value
end

local peakPlayers = GetNumPlayerIndices()
local day = os.date("%d")

AddEventHandler("playerJoining", function()
	local playerCount = GetNumPlayerIndices()

	if playerCount > peakPlayers then
		peakPlayers = playerCount
	end
end)

--- Get the peak players in the server
--- @return number | nil
function GetPeakPlayers()
	local currentDay = os.date("%d")

	if currentDay ~= day then
		day = currentDay
		peakPlayers = 0
	end

	return peakPlayers
end

--- Get all players in the server
--- @param message string
--- @return nil
function Announce(username, message)
	local hasPermissions = HasPermission(username, "manage_players.notify")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Announcement by " .. username .. " with message " .. message)

	TriggerClientEvent("electus_admin:notification", -1, { message = message })

	return true
end

function NotifyPlayer(username, playerId, message)
	local hasPermissions = HasPermission(username, "manage_players.notify")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Notification by " .. username .. " to " .. playerId .. " with message " .. message)

	TriggerClientEvent("electus_admin:notification", playerId, { message = message })

	return true
end

function KickAll(requestUsername)
	local hasPermissions = HasPermission(requestUsername, "kick_players")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Kicked all players", "Kicked all players by " .. requestUsername)

	for _, playerId in ipairs(GetPlayers()) do
		DropPlayer(playerId, "")
	end

	return true
end

function ReviveAll(requestUsername)
	local hasPermissions = HasPermission(requestUsername, "manage_players.revive")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Revived all players by " .. requestUsername)

	TriggerClientEvent("hospital:client:Revive", -1)
	TriggerClientEvent("esx_ambulancejob:revive", -1)
	TriggerClientEvent("visn_are:resetHealthBuffer", -1)
	TriggerClientEvent("hospital:client:Revive", -1)

	return true
end

function SetTime(time)
	if GetResourceState("weathersync") == "started" then
		exports.weathersync:setTime(time.h, time.m)
	elseif GetResourceState("qb-weathersync") == "started" then
		TriggerEvent("qb-weathersync:server:setTime", time.h, time.m)
	end

	return true
end

function SetWeather(weather)
	if GetResourceState("weathersync") == "started" then
		exports.weathersync:setWeather(weather)
	elseif GetResourceState("qb-weathersync") == "started" then
		TriggerEvent("qb-weathersync:server:setWeather", weather)
	end

	return true
end

function DeleteAllVehicles(requestUsername)
	local hasPermissions = HasPermission(requestUsername, "manage_vehicles.delete")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Deleted all vehicles by " .. requestUsername)

	local vehicles = GetGamePool("CVehicle")

	for i = 1, #vehicles do
		DeleteEntity(vehicles[i])
	end
end

function DeleteAllPeds(requestUsername)
	local hasPermissions = HasPermission(requestUsername, "manage_players.delete_peds")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Deleted all peds", "Deleted all peds by " .. requestUsername)

	local peds = GetGamePool("CPed")

	for i = 1, #peds do
		DeleteEntity(peds[i])
	end

	return true
end

function DeleteAllProps()
	local props = GetGamePool("CObject")

	AdminLog(-1, "info", "Deleted all props")

	for i = 1, #props do
		DeleteEntity(props[i])
	end

	return true
end

ServerLockState = false

function Lock()
	ServerLockState = true
end

function Unlock()
	ServerLockState = false
end

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
	local source = source
	local locked = GetLockState()
	local license = GetOnlineLicense(source)
	local isAdmin = GetStaffByLicense(license)

	if locked and not isAdmin then
		deferrals.done("Server is locked")
	end
end)

lib.callback.register("electus_admin:getLockState", function()
	return ServerLockState
end)

function GetLockState()
	return ServerLockState
end

function MuteAll(requestUsername)
	local hasPermissions = HasPermission(requestUsername, "manage_players.mute")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Muted all players by " .. requestUsername)

	for _, playerId in ipairs(GetPlayers()) do
		MumbleSetPlayerMuted(tonumber(playerId), true)
	end

	return true
end

function UnmuteAll(requestUsername)
	local hasPermissions = HasPermission(requestUsername, "manage_players.mute")

	if not hasPermissions then
		return { error = "permission" }
	end

	AdminLog(-1, "info", "Unmuted all players by " .. requestUsername)

	for _, playerId in ipairs(GetPlayers()) do
		MumbleSetPlayerMuted(tonumber(playerId), false)
	end

	return true
end

--- Freeze all players
--- @return nil
function FreezeAllPlayers(requestUsername)
	local hasPermissions = HasPermission(requestUsername, "manage_players.freeze")

	if not hasPermissions then
		return { error = "permission" }
	end

	for _, playerId in ipairs(GetPlayers()) do
		local ped = GetPlayerPed(playerId)
		FreezeEntityPosition(ped, true)
	end

	return true
end

function UnfreezeAllPlayers(requestUsername)
	local hasPermissions = HasPermission(requestUsername, "manage_players.freeze")

	if not hasPermissions then
		return { error = "permission" }
	end

	for _, playerId in ipairs(GetPlayers()) do
		local ped = GetPlayerPed(playerId)
		FreezeEntityPosition(ped, false)
	end

	return true
end

exports("MuteAll", MuteAll)
exports("UnmuteAll", UnmuteAll)
exports("FreezeAllPlayers", FreezeAllPlayers)
exports("UnfreezeAllPlayers", UnfreezeAllPlayers)
exports("Lock", Lock)
exports("Unlock", Unlock)
exports("DeleteAllVehicles", DeleteAllVehicles)
exports("DeleteAllPeds", DeleteAllPeds)
exports("DeleteAllProps", DeleteAllProps)
exports("NotifyPlayer", NotifyPlayer)
