if Config.framework ~= "qbx" then
	return
end

function GetPlayer(source)
	if type(source) == "string" then
		source = tonumber(source)
	end

	local player = exports.qbx_core:GetPlayer(source)
	return player
end

function GetIdentifier(player)
	if player then
		return player.PlayerData.citizenid
	end
end

-- fix for qb core
-- --- Get the source from an identifier
-- --- @param identifier string
-- --- @return number
function GetSourceFromIdentifier(identifier)
	return exports.qbx_core:GetPlayerByCitizenId(identifier)?.PlayerData?.source
end

function GetPlayerFromIdentifier(identifier)
	local player = exports.qbx_core:GetPlayerByCitizenId(identifier)
	return player
end

function RemoveBankMoney(player, amount)
	exports.qbx_core:RemoveMoney(player.PlayerData.citizenid, "bank", amount, "Unknown")
end

function RemoveCashMoney(player, amount)
	exports.qbx_core:RemoveMoney(player.PlayerData.citizenid, "cash", amount, "Unknown")
end

function AddCashMoney(player, amount)
	exports.qbx_core:AddMoney(player.PlayerData.citizenid, "cash", amount, "Unknown")
end

function AddBankMoney(player, amount)
	exports.qbx_core:AddMoney(player.PlayerData.citizenid, "bank", amount, "Unknown")
end

function GetBankMoney(player)
	return exports.qbx_core:GetMoney(player.PlayerData.citizenid, "bank")
end

function GetCashMoney(player)
	return exports.qbx_core:GetMoney(player.PlayerData.citizenid, "cash")
end

function GetCharacterName(player)
	if not player then
		return "Name not found"
	end

	local name = player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname
	return name or "Name not found"
end

function SetCharacterName(player, firstname, lastname)
	local charInfo = player.PlayerData.charinfo

	if not charInfo then
		charInfo = {}
	end

	charInfo.firstname = firstname
	charInfo.lastname = lastname
	exports.qbx_core:SetCharInfo(player.PlayerData.citizenid, "charinfo", charInfo)
end

QBCore = exports["qb-core"]:GetCoreObject()

--- Get the Item Label
---@param item string
---@return string
function GetItemLabel(item)
	local itemLabel = QBCore.Shared.Items[item] and QBCore.Shared.Items[item]["label"] or item
	return itemLabel
end

---@param plate string
---@return table | boolean
function FrameworkGetSpecificVehicleInDB(plate)
	local query = ("SELECT *, {garage} AS garage FROM {vehicle_table} WHERE {plate} = ?")
		:gsub("{plate}", Queries.Vehicles.plate)
		:gsub("{vehicle_table}", Queries.Vehicles.table)
		:gsub("{garage}", Queries.Vehicles.garage)

	local vehicle = MySQL.single.await(query, { plate })

	if not vehicle then
		return false
	end

	local retVehicle = {}

	local vehEntity = FindVehicleEntityByPlate(vehicle.plate)

	if vehEntity and vehEntity?.value then
		retVehicle.entity = vehEntity?.value
		retVehicle.coords = GetEntityCoords(vehEntity?.value)
	end

	retVehicle.identifier = retVehicle.citizenid

	local vehData = json.decode(vehicle.mods)

	retVehicle.primaryColor = vehData.color1
	retVehicle.secondaryColor = vehData.color2
	retVehicle.model = vehData.vehicle
	retVehicle.plate = vehicle.plate
	retVehicle.type = vehicle.type
	retVehicle.garage = vehicle.garage or "Impounded"

	return retVehicle
end

---@return table
function FrameworkGetAllPlayers(page, filter)
	local query = ("SELECT license, {name} AS `name`, {identifier} AS identifier, {bank} AS `bank`, {cash} AS `cash` FROM {users_table} {where} LIMIT 10 OFFSET @offset")
		:gsub("{name}", Queries.Users.name)
		:gsub("{identifier}", Queries.Users.identifier)
		:gsub("{bank}", Queries.Users.bank)
		:gsub("{cash}", Queries.Users.cash)
		:gsub("{users_table}", Queries.Users.table)

	local where = ""

	if filter and (filter.identifier or filter.name) then
		where = "WHERE "
		if filter.identifier then
			where = where .. Queries.Users.identifier .. " LIKE @identifier "
		end

		if filter.name then
			if where ~= "WHERE " then
				if filter["or"] then
					where = where .. "OR "
				else
					where = where .. "AND "
				end
			end
			where = where .. Queries.Users.name .. " LIKE @name "
		end
	end

	query = query:gsub("{where}", where)

	local result = MySQL.query.await(query, {
		["@offset"] = (page - 1) * 10,
		["@identifier"] = filter and filter.identifier and "%" .. filter.identifier .. "%",
		["@name"] = filter and filter.name and "%" .. filter.name .. "%",
	})

	local players = {}

	for i = 1, #result do
		players[i] = {}
		local player = GetPlayerFromIdentifier(result[i].identifier)
		local license = result[i].license:gsub("license:", ""):gsub("license2:", "")
		local licenses =
			MySQL.single.await("SELECT * FROM electus_admin_licenses WHERE license = ?", { players[i].license })
		players[i].name = licenses?.name or "Unknown Player"
		players[i].discord = licenses?.discord or "Unknown Discord"
		players[i].ip = licenses?.ip or "Unknown IP"
		players[i].steam = licenses?.steam or "Unknown Steam"

		if player then
			players[i].playerId = player.PlayerData.source
			players[i].name = GetPlayerName(player.PlayerData.source)
		end

		players[i].inGameName = result[i].name
		players[i].identifier = result[i].identifier
		players[i].license = license

		players[i].bank = result[i].bank
		players[i].money = result[i].cash
	end

	return players
end

--- Gets all online players
--- @return table
function FrameworkGetOnlinePlayers()
	local players = exports.qbx_core:GetQBPlayers()
	local onlinePlayers = {}

	for i, v in pairs(players) do
		local license = GetOnlineLicense(players[i].PlayerData.source):gsub("license:", ""):gsub("license2:", "")

		local licenses = MySQL.single.await("SELECT * FROM electus_admin_licenses WHERE license = ?", { license })

		onlinePlayers[#onlinePlayers + 1] = {
			playerId = players[i].PlayerData.source,
			inGameName = players[i].PlayerData.charinfo.firstname .. " " .. players[i].PlayerData.charinfo.lastname,
			identifier = players[i].PlayerData.citizenid,
			license = license,
			bank = players[i].PlayerData.money.bank,
			money = players[i].PlayerData.money.cash,
			name = licenses?.name or "Unknown Player",
		}
	end

	return onlinePlayers
end

---@param identifier string
---@return table | nil
function FrameworkGetExtendedPlayer(identifier)
	local query = ("SELECT *, {name} AS `name`, {identifier} AS identifier, {bank} AS `bank`, {cash} AS `cash` FROM {users_table} WHERE {identifier} = ?")
		:gsub("{name}", Queries.Users.name)
		:gsub("{identifier}", Queries.Users.identifier)
		:gsub("{bank}", Queries.Users.bank)
		:gsub("{cash}", Queries.Users.cash)
		:gsub("{users_table}", Queries.Users.table)

	local result = MySQL.single.await(query, { identifier })
	local player = {}

	if result then
		local onlinePlayer = GetPlayerFromIdentifier(identifier)

		if onlinePlayer then
			local playerData = onlinePlayer.PlayerData
			local source = playerData.source

			player.playerId = source
			player.job = {
				name = playerData.job.name,
				label = playerData.job.label,
				grade = playerData.job.grade.level,
				gradeLabel = playerData.job.grade.name,
			}
			player.ping = GetPlayerPing(source)
			player.health = GetEntityHealth(GetPlayerPed(source))
		end

		local charData = json.decode(result.charinfo)

		local job = json.decode(result.job)

		player.inGameName = charData.firstname .. " " .. charData.lastname
		player.identifier = identifier

		player.license = result.license:gsub("license:", ""):gsub("license2:", "")
		local licenses =
			MySQL.single.await("SELECT * FROM electus_admin_licenses WHERE license = ?", { player.license })

		player.name = licenses?.name or "Unknown Player"
		player.discord = licenses?.discord or "Unknown Discord"
		player.ip = licenses?.ip or "Unknown IP"
		player.steam = licenses?.steam or "Unknown Steam"

		player.bank = result.bank
		player.money = result.cash
		player.notes = GetNotes(player.identifier)

		player.dateofbirth = charData.dateofbirth
		player.isBanned = IsBanned(player.license, nil, nil)
		player.numWarns = GetNumWarns(player.license)
		player.height = nil -- doesnt exist?
		player.sex = (charData.gender == 0 and "Male") or "Female"
		player.job = { name = job.name, label = job.label, grade = job.grade.level, gradeLabel = job.grade.name }
		player.createdAt = nil -- doesnt exist?
		player.lastLogin = result.last_updated -- same as last seen? idk

		return player
	end

	return nil
end

function CollectJob()
	local statistics = {}

	for i = 1, #Config.statistics.jobs do
		local job = Config.statistics.jobs[i]
		local players =
			MySQL.query.await("SELECT COUNT(*) as count FROM players WHERE JSON_EXTRACT(job, '$.name') = ?", { job })

		statistics[#statistics + 1] = { job = job, count = players[1].count }
	end

	return statistics
end

function GetJobsLabels()
	local jobs = exports.qbx_core:GetJobs()
	local availableJobs = {}

	for k, v in pairs(jobs) do
		availableJobs[k] = { label = v.label, name = k }
	end

	return availableJobs
end

function GetJobGrade(job)
	local jobs = exports.qbx_core:GetJobs()

	local availableGrades = jobs[job]?.grades

	if not availableGrades then
		return nil
	end

	local grades = {}

	for k, v in pairs(availableGrades) do
		grades[#grades + 1] = { name = v.name, label = v.name, grade = k, id = k }
	end

	return grades
end

function SetJobOnline(player, job, grade)
	if player then
		exports.qbx_core:SetJob(player.PlayerData.citizenid, job, grade)
	end
end

function SetJobDatabase(identifier, job, grade)
	if not exports.qbx_core:GetJob(job)[job] then
		return false
	end

	local newJob = {}

	local gradeKey = grade or 1

	local jobGradeInfo = exports.qbx_core:GetJob(job).grades[grade]

	if jobGradeInfo then
		newJob.grade.name = jobGradeInfo.name
		newJob.grade.level = tonumber(gradeKey)
		newJob.grade.payment = jobGradeInfo.payment
		newJob.grade.isboss = jobGradeInfo.isboss or false
		newJob.isboss = jobGradeInfo.isboss or false
	else
		newJob.grade.name = "No Grades"
		newJob.grade.level = 0
		newJob.grade.payment = 30
		newJob.grade.isboss = false
		newJob.isboss = false
	end

	MySQL.update.await("UPDATE players SET job = @job WHERE citizenid = @citizenid", {
		["@job"] = json.encode({
			name = job,
			label = exports.qbx_core:GetJob(job).label,
			onduty = exports.qbx_core:GetJob(job).defaultDuty,
			type = exports.qbx_core:GetJob(job).type or "none",
			grade = newJob.grade,
		}),
		["@citizenid"] = identifier,
	})
end

function SetCashMoneyDatabase(identifier, amount)
	local query = ("SELECT money FROM {users_table} WHERE {identifier} = @identifier")
		:gsub("{identifier}", Queries.Users.identifier)
		:gsub("{users_table}", Queries.Users.table)

	local accounts = MySQL.scalar.await(query, {
		["@identifier"] = identifier,
	})

	if accounts then
		local money = json.decode(accounts)

		if money.cash < amount then
			AddCashMoneyDatabase(identifier, amount - money.cash)
		elseif money.cash > amount then
			RemoveCashMoneyDatabase(identifier, money.cash - amount)
		end
	end
end

function SetBankMoneyDatabase(identifier, amount)
	local query = ("SELECT money FROM {users_table} WHERE {identifier} = @identifier")
		:gsub("{identifier}", Queries.Users.identifier)
		:gsub("{users_table}", Queries.Users.table)

	local accounts = MySQL.scalar.await(query, {
		["@identifier"] = identifier,
	})

	if accounts then
		local money = json.decode(accounts)

		if money.bank < amount then
			AddBankMoneyDatabase(identifier, amount - money.bank)
		elseif money.bank > amount then
			RemoveBankMoneyDatabase(identifier, money.bank - amount)
		end
	end
end

function GetPlayersWithMinItem(item, amount)
	local users = GetItemPlayersDatabase(item)

	local userCheck = {}

	for i = 1, #users do
		if userCheck[users[i].identifier] == nil then
			userCheck[users[i].identifier] = users[i]
		else
			userCheck[users[i].identifier].count = userCheck[users[i].identifier].count + users[i].count
		end
	end

	local retUsers = {}

	for k, v in pairs(userCheck) do
		if v.count < amount then
			retUsers[#retUsers + 1] = v
		end
	end

	return retUsers
end

exports("GetJobsLabels", GetJobsLabels)
exports("GetJobGrades", GetJobGrade)
