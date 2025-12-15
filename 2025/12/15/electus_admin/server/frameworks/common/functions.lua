---@param identifier string
---@return string
function GetIdentifierName(identifier)
	local query = ("SELECT {name} as `name` FROM {users} WHERE {identifier} = ?")
		:gsub("{name}", Queries.Users.name)
		:gsub("{users}", Queries.Users.table)
		:gsub("{identifier}", Queries.Users.identifier)

	local result = MySQL.single.await(query, { identifier })

	return result?.name or "Unknown"
end

---@return table
function FrameworkGetDBVehicles(page, filter)
	local query = ("SELECT {plate}, {owner} AS identifier, {type}, {hash}, {garage} AS garage FROM {vehicle_table} {where} LIMIT 10 OFFSET @offset")
		:gsub("{plate}", Queries.Vehicles.plate)
		:gsub("{owner}", Queries.Vehicles.owner)
		:gsub("{garage}", Queries.Vehicles.garage)
		:gsub("{vehicle_table}", Queries.Vehicles.table)
		:gsub("{type},", Config.framework == "esx" and "type," or "") -- esx specific
		:gsub("{hash},", Config.framework == "qb" and "hash," or "") -- qb specific

	local where = ""

	if filter and (filter.identifier or filter.plate) then
		where = "WHERE "
		if filter.identifier then
			where = where .. Queries.Vehicles.owner .. " LIKE @identifier "
		end

		if filter.plate then
			if where ~= "WHERE " then
				where = where .. "AND "
			end
			where = where .. Queries.Vehicles.plate .. " LIKE @plate "
		end
	end

	query = query:gsub("{where}", where)

	local vehicles = MySQL.query.await(query, {
		["@offset"] = (page - 1) * 10,
		["@identifier"] = filter and filter.identifier and "%" .. filter.identifier .. "%",
		["@plate"] = filter and filter.plate and "%" .. filter.plate .. "%",
	})

	if Config.framework ~= "esx" then
		for i = 1, #vehicles do
			vehicles[i].type = QBCore.Shared.VehicleHashes[vehicles[i].hash]?.type or "Type not found"
		end
	end

	return vehicles
end

---@param plate string
---@param newOwner string
---@return void
function FrameworkTransferVehicleOwnership(plate, newOwner)
	local query = ("UPDATE {vehicle_table} SET {owner} = ? WHERE {plate} = ?")
		:gsub("{plate}", Queries.Vehicles.plate)
		:gsub("{owner}", Queries.Vehicles.owner)
		:gsub("{vehicle_table}", Queries.Vehicles.table)

	MySQL.query.await(query, { newOwner, plate })

	return true
end

---@return number
function FrameworkGetTotalBank()
	local query = ("SELECT SUM({bank}) FROM {users_table}")
		:gsub("{bank}", Queries.Users.bank)
		:gsub("{users_table}", Queries.Users.table)

	local result = MySQL.scalar.await(query)

	return result or 0
end

--- Get the total cash in the server
---@return number
function FrameworkGetTotalCash()
	local query = ("SELECT SUM({cash}) FROM {users_table}")
		:gsub("{cash}", Queries.Users.cash)
		:gsub("{users_table}", Queries.Users.table)

	local result = MySQL.scalar.await(query)

	return result or 0
end

function RemoveVehicleFromDatabase(requestUsername, plate)
	local hasPerms = HasPermission(requestUsername, "manage_vehicles.erase")

	if not hasPerms then
		return { error = "permission" }
	end

	local query = ("DELETE FROM {vehicle_table} WHERE {plate} = ?")
		:gsub("{plate}", Queries.Vehicles.plate)
		:gsub("{vehicle_table}", Queries.Vehicles.table)

	MySQL.update.await(query, { plate })

	local vehicle = FindVehicleEntityByPlate(plate)?.value

	if vehicle then
		DeleteEntity(vehicle)
	end

	CacheDelete("dbVehicles")
	CacheDelete("dbVehicle:" .. plate)

	return true
end

function DeleteCharacter(requestUsername, identifier)
	local hasPerms = HasPermission(requestUsername, "manage_players.delete_character")

	if not hasPerms then
		return { error = "permission" }
	end

	local query = ("DELETE FROM {users_table} WHERE {identifier} = @identifier")
		:gsub("{users_table}", Queries.Users.table)
		:gsub("{identifier}", Queries.Users.identifier)

	MySQL.update.await(query, {
		["@identifier"] = identifier,
	})
end

function ChangeName(requestUsername, identifier, firstname, lastname)
	local hasPerms = HasPermission(requestUsername, "manage_players.change_name")

	if not hasPerms then
		return { error = "permission" }
	end

	if not identifier or not firstname or not lastname then
		return false
	end

	local player = GetPlayerFromIdentifier(identifier)

	if player then
		SetCharacterName(player, firstname, lastname)
	else
		local query = ("UPDATE {users_table} SET {firstname} = @firstname, {lastname} = @lastname WHERE {identifier} = @identifier")
			:gsub("{firstname}", Queries.Users.firstname)
			:gsub("{lastname}", Queries.Users.lastname)
			:gsub("{identifier}", Queries.Users.identifier)
			:gsub("{users_table}", Queries.Users.table)

		MySQL.update.await(query, {
			["@firstname"] = firstname,
			["@lastname"] = lastname,
			["@identifier"] = identifier,
		})
	end

	return true
end

function GetPlayersWithMinCash(minCash)
	local query = ("SELECT {identifier} AS identifier FROM {user_table} WHERE {cash} >= @minCash")
		:gsub("{user_table}", Queries.Users.table)
		:gsub("{cash}", Queries.Users.cash)
		:gsub("{identifier}", Queries.Users.identifier)

	local players = MySQL.query.await(query, {
		["@minCash"] = minCash,
	})

	return players
end

function GetPlayersWithMinBank(minBank)
	local query = ("SELECT {identifier} AS identifier FROM {user_table} WHERE {bank} >= @minBank")
		:gsub("{user_table}", Queries.Users.table)
		:gsub("{bank}", Queries.Users.bank)
		:gsub("{identifier}", Queries.Users.identifier)

	local players = MySQL.query.await(query, {
		["@minBank"] = minBank,
	})

	return players
end

function GetPlayersWithMinVehicles(amount)
	local query = ("SELECT {owner} AS identifier FROM {vehicles_table} GROUP BY {owner} HAVING COUNT(*) >= ?")
		:gsub("{owner}", Queries.Vehicles.owner)
		:gsub("{vehicles_table}", Queries.Vehicles.table)

	local players = MySQL.query.await(query, { amount })

	return players
end

function AddBankMoneyDatabase(identifier, amount)
	amount = tonumber(amount)

	local query = ("UPDATE {users_table} SET {accounts} = JSON_SET({accounts}, '$.{bank2}', JSON_EXTRACT({accounts}, '$.{bank2}') + @amount) WHERE {identifier} = @identifier")
		:gsub("{identifier}", Queries.Users.identifier)
		:gsub("{users_table}", Queries.Users.table)
		:gsub("{accounts}", Queries.Users.accounts)
		:gsub("{bank2}", Queries.Users.bank2)

	MySQL.update.await(query, {
		["@amount"] = amount,
		["@identifier"] = identifier,
	})
end

function RemoveBankMoneyDatabase(identifier, amount)
	amount = tonumber(amount)

	local query = ("UPDATE {users_table} SET {accounts} = JSON_SET({accounts}, '$.{bank2}', JSON_EXTRACT({accounts}, '$.{bank2}') - @amount) WHERE {identifier} = @identifier")
		:gsub("{identifier}", Queries.Users.identifier)
		:gsub("{users_table}", Queries.Users.table)
		:gsub("{accounts}", Queries.Users.accounts)
		:gsub("{bank2}", Queries.Users.bank2)

	MySQL.update.await(query, {
		["@amount"] = amount,
		["@identifier"] = identifier,
	})
end

function AddCashMoneyDatabase(identifier, amount)
	amount = tonumber(amount)

	local query = ("UPDATE {users_table} SET {accounts} = JSON_SET({accounts}, '$.{cash2}', JSON_EXTRACT({accounts}, '$.{cash2}') + @amount) WHERE {identifier} = @identifier")
		:gsub("{identifier}", Queries.Users.identifier)
		:gsub("{users_table}", Queries.Users.table)
		:gsub("{accounts}", Queries.Users.accounts)
		:gsub("{cash2}", Queries.Users.cash2)

	MySQL.update.await(query, {
		["@amount"] = amount,
		["@identifier"] = identifier,
	})
end

function RemoveCashMoneyDatabase(identifier, amount)
	amount = tonumber(amount)

	local query = ("UPDATE {users_table} SET {accounts} = JSON_SET({accounts}, '$.{cash2}', JSON_EXTRACT({accounts}, '$.{cash2}') - @amount) WHERE {identifier} = @identifier")
		:gsub("{identifier}", Queries.Users.identifier)
		:gsub("{users_table}", Queries.Users.table)
		:gsub("{accounts}", Queries.Users.accounts)
		:gsub("{cash2}", Queries.Users.cash2)

	MySQL.update.await(query, {
		["@amount"] = amount,
		["@identifier"] = identifier,
	})
end

exports("DeleteCharacter", DeleteCharacter)
exports("ChangeName", ChangeName)
