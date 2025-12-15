function GetOnlineLicense(src)
	if Config.framework == "qbx" then
		local license = GetPlayerIdentifierByType(src, "license2")
		if license then
			return license:gsub("license2:", "")
		end

		license = GetPlayerIdentifierByType(src, "license")

		if license then
			return license:gsub("license:", "")
		end
	end

	return GetPlayerIdentifierByType(src, "license"):gsub("license:", ""):gsub("license2:", "")
end

function ReceivePlayers()
	local players = GetPlayers()
	local playersData = {}

	for i = 1, #players do
		local player = GetPlayer(players[i])
		local playerData = {
			id = player,
			name = GetCharacterName(player),
			identifier = GetIdentifier(player),
			bank = GetBankMoney(player),
			cash = GetCashMoney(player),
		}

		table.insert(playersData, playerData)
	end
	return playersData
end

function CheckStaff(license)
	local result =
		MySQL.single.await("SELECT * FROM electus_admin_staffs WHERE license=@license", { ["license"] = license })

	if result or ConfigServer.ownerLicense == license then
		return true
	else
		return false
	end
end

function IsAdmin(src)
	local license = GetOnlineLicense(src)
	local isAdmin = CheckStaff(license)

	if isAdmin then
		return true
	else
		return false
	end
end

lib.callback.register("electus_admin:isAdmin", function(src)
	local license = GetOnlineLicense(src)
	local isAdmin = CheckStaff(license)

	return isAdmin
end)

lib.callback.register("electus_admin:spawnVehicle", function(src, model)
	local license = GetOnlineLicense(src)
	local isAdmin = CheckStaff(license)

	if not isAdmin then
		return
	end

	AdminLog(src, "info", "Spawned vehicle " .. model .. " by " .. src)

	local playerPed = GetPlayerPed(src)
	local pos = GetEntityCoords(playerPed)
	local heading = GetEntityHeading(playerPed)
	local vehicleHash = GetHashKey(model)
	local currentVehicle = GetVehiclePedIsIn(playerPed, false)

	if currentVehicle and currentVehicle ~= 0 then
		DeleteEntity(currentVehicle)
	end

	-- RequestModel(vehicleHash)
	-- while not HasModelLoaded(vehicleHash) do
	-- 	Wait(500)
	-- end

	local spawnedVehicle = CreateVehicle(vehicleHash, pos.x, pos.y, pos.z, heading, true, false)

	TaskWarpPedIntoVehicle(playerPed, spawnedVehicle, -1)

	return NetworkGetNetworkIdFromEntity(spawnedVehicle)
end)

lib.callback.register("electus_admin:createAccount", function(src, username, password)
	local isAdmin = IsAdmin(src)

	if not isAdmin then
		return false
	end

	AdminLog(src, "info", "Created account for " .. username)

	local usernameExist = MySQL.scalar.await("SELECT * FROM electus_admin_staffs WHERE username=@username", {
		["username"] = username,
	})

	if usernameExist then
		return { error = L("login.username_exist"), usernameExist = true }
	end

	local license = GetOnlineLicense(src)

	if ConfigServer.ownerLicense == license then
		local insert = MySQL.update.await(
			"INSERT INTO electus_admin_staffs (username, password, license) VALUES (@username, @password, @license)",
			{
				["username"] = username,
				["password"] = GetPasswordHash(password),
				["license"] = ConfigServer.ownerLicense,
			}
		)

		return insert
	else
		local passHash = GetPasswordHash(password)

		local update = MySQL.update.await(
			"UPDATE electus_admin_staffs SET username=@username, password=@password WHERE license=@license",
			{
				["username"] = username,
				["password"] = passHash,
				["license"] = license,
			}
		)

		return update
	end
end)

lib.callback.register("electus_admin:getBaseUrl", function(src)
	local baseUrl = ("https://%s/%s"):format(GetConvar("web_baseUrl", ""), GetCurrentResourceName())

	return baseUrl
end)

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
	local src = source
	local license = GetOnlineLicense(src)

	local data = MySQL.single.await("SELECT * FROM electus_admin_licenses WHERE license=@license", {
		["license"] = license,
	})

	local discord = GetPlayerIdentifierByType(src, "discord")
	local ip = GetPlayerIdentifierByType(src, "ip")
	local steam = GetPlayerIdentifierByType(src, "steam")

	if discord then
		discord = discord:gsub("discord:", "")
	end

	if steam then
		steam = steam:gsub("steam:", "")
	end

	if ip then
		ip = ip:gsub("ip:", "")
	end

	if not data then
		MySQL.update.await(
			"INSERT INTO electus_admin_licenses (license, discord, ip, steam, name) VALUES (@license, @discord, @ip, @steam, @name)",
			{
				["license"] = license,
				["discord"] = discord,
				["ip"] = ip,
				["steam"] = steam,
				["name"] = name,
			}
		)
	end

	if data and data.name ~= name then
		MySQL.update.await("UPDATE electus_admin_licenses SET name=@name WHERE license=@license", {
			["name"] = name,
			["license"] = license,
		})
	end

	if data and data.ip ~= ip then
		MySQL.update.await("UPDATE electus_admin_licenses SET ip=@ip WHERE license=@license", {
			["ip"] = ip,
			["license"] = license,
		})
	end

	if data and data.steam ~= steam then
		MySQL.update.await("UPDATE electus_admin_licenses SET steam=@steam WHERE license=@license", {
			["steam"] = steam,
			["license"] = license,
		})
	end

	if data and data.discord ~= discord then
		MySQL.update.await("UPDATE electus_admin_licenses SET discord=@discord WHERE license=@license", {
			["discord"] = discord,
			["license"] = license,
		})
	end
end)

exports("ReceivePlayers", ReceivePlayers)
