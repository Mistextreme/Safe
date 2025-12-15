local ServerButtonFunds = {} -- Stores server button funds
local PlayerServer = {} -- Stores player server data
local PlayerServerOffline = {} -- Stores offline player server data
local CustomData = {} -- Stores custom data
local ReportServer = {} -- Stores report server data
local RanksServer = {} -- Stores server ranks data
local Handling = {} -- Stores handling data
local SomeCounter = 0 -- A counter variable

local Config = config or {} -- Server configuration
local ESX = ESX -- ESX object
local QBCore = QBCore -- QBCore object
local MySQL = MySQL -- MySQL object
local WebhookList = webhookList or {} -- List of webhooks

local SomeTable = {} -- An unused table

-- Function to get player identifiers (license or steam)
local function GetPlayerIdentifier(playerSource)
  local identifiers = GetPlayerIdentifiers(playerSource)
  if identifiers then
    for _, identifier in ipairs(identifiers) do
      if string.match(identifier, "^license:") then
        return identifier
      elseif string.match(identifier, "^steam:") then
        return identifier
      end
    end
  end
  return nil
end
local GetIdentifier = GetPlayerIdentifier -- Alias for readability

-- Function to get player coordinates
local function GetPlayerCoordinates(playerSource)
  local ped = GetPlayerPed(playerSource)
  if DoesEntityExist(ped) then
    local coords = GetEntityCoords(ped)
    return { x = coords.x, y = coords.y, z = coords.z }
  end
  return nil
end
local GetCoordinates = GetPlayerCoordinates -- Alias for readability

-- Function to check if a value exists in a table
local function IsValueInTable(tableToCheck, valueToCheck)
  for _, value in pairs(tableToCheck) do
    if value == valueToCheck then
      return true
    end
  end
  return false
end
local IsInTable = IsValueInTable -- Alias for readability

-- Function to count the number of elements in a table
local function CountTableElements(tableToCount)
  local count = 0
  for _ in pairs(tableToCount) do
    count = count + 1
  end
  return count
end
local CountTable = CountTableElements -- Alias for readability

-- Function to send a message to a Discord webhook
local function SendWebhookMessage(webhookUrl, webhookData)
  local embeds = {}
  local embed = {}

  embed.title = webhookData.title or "Admin Action Log"
  embed.description = webhookData.description or "No description provided."
  embed.color = webhookData.color or 16711680

  if not webhookData.fields then
    webhookData.fields = {}
    local actionField = {}
    actionField.name = "Action"
    actionField.value = webhookData.action or "Unknown"
    actionField.inline = true

    local playerField = {}
    playerField.name = "Player"
    playerField.value = webhookData.playerName or "Unknown"
    playerField.inline = true

    local dateField = {}
    dateField.name = "Date"
    dateField.value = os.date("%Y-%m-%d %H:%M:%S")
    dateField.inline = false

    webhookData.fields[1] = actionField
    webhookData.fields[2] = playerField
    webhookData.fields[3] = dateField
  end

  embed.fields = webhookData.fields
  embed.timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
  embeds[1] = embed

  PerformHttpRequest(
    webhookUrl,
    function(statusCode, _, _)
      if 204 ~= statusCode then
      end
    end,
    "POST",
    json.encode({ username = webhookData.username or "Admin Bot", embeds = embeds }),
    { ["Content-Type"] = "application/json" }
  )
end

-- Function to log an admin action
local function LogAdminAction(logData)
  local webhookUrl = WebhookList[logData.webhook]
  if webhookUrl then
    SendWebhookMessage(webhookUrl, logData)
  end
end

-- Function to get a color code for a color name (unused)
local function GetColorCode(colorName)
  local colorCodes = {}
  colorCodes.red = "^1"
  colorCodes.green = "^2"
  colorCodes.yellow = "^3"
  colorCodes.blue = "^4"
  colorCodes.lightblue = "^5"
  colorCodes.purple = "^6"
  colorCodes.white = "^7"
  colorCodes.black = "^8"

  return colorCodes[colorName] or ""
end

-- Function to get a list of online staff player IDs
local function GetOnlineStaff()
  local staffList = {}
  for playerSource, playerData in pairs(PlayerServer) do
    if IsStaff(tonumber(playerSource)) then
      table.insert(staffList, tonumber(playerSource))
    end
  end
  return staffList
end

-- Function to check if a player is staff
local function IsStaff(playerSource)
  local playerName = GetPlayerName(playerSource)
  if not playerName then
    playerName = "Unknown"
  end

  -- Debug print
  print(string.format("[DEBUG] IsStaff check for player %d (%s)", playerSource, playerName))

  -- Check if IsMaster function exists and use it if it does
  if type(IsMaster) == "function" then
    if IsMaster(playerSource) then
      -- Debug print
      print(string.format("[DEBUG] Player %d (%s) is master", playerSource, playerName))
      return true
    end
  end

  -- Fallback if IsMaster is not available
  if not IsMaster then
    -- Debug print
    print("[DEBUG] IsMaster function not available, using fallback")

    local identifiers = GetPlayerIdentifiers(playerSource)
    if identifiers then
      -- Debug print
      print(string.format("[DEBUG] Checking %d identifiers against master list", #identifiers))

      for identifierIndex, identifier in ipairs(identifiers) do
        -- Debug print
        print(string.format("[DEBUG] Identifier %d: %s", identifierIndex, identifier))

        if master and IsInTable(master, identifier) then
          -- Debug print
          print(string.format("[DEBUG] Player %d (%s) is master via fallback check", playerSource, playerName))
          return true
        end
      end
    else
      -- Debug print
      print("[DEBUG] No identifiers or master table not available")
    end
  end

  -- Check PlayerServer data for the player's role
  local playerData = PlayerServer[playerSource]
  if not playerData then
    -- Debug print
    print(string.format("[DEBUG] IsStaff: Player %d (%s) not found in PlayerServer", playerSource, playerName))
    return false
  end

  -- Debug print
  print(string.format("[DEBUG] Player %d (%s) role: %s", playerSource, playerName, playerData.role or "nil"))

  if playerData.role then
    if playerData.role ~= "user" then
      -- Debug print
      print(string.format("[DEBUG] Player %d (%s) is staff with role: %s", playerSource, playerName, playerData.role))
      return true
    end
  end

  -- Debug print
  print(string.format("[DEBUG] Player %d (%s) is not staff", playerSource, playerName))
  return false
end

-- Function to check if a player is an owner
local function IsOwner(playerSource)
  local playerData = PlayerServer[playerSource]
  if playerData then
    return playerData.role == "owner"
  end
  return false
end

-- Function to generate a unique ID
local function GenerateID()
  local characters = "0123456789abcdef"
  local charactersLength = #characters

  math.randomseed(os.time())

  local uniqueID = ""
  for _ = 1, 8 do
    uniqueID = uniqueID .. string.sub(characters, math.random(1, charactersLength))
  end

  SomeCounter = SomeCounter + 1
  return uniqueID .. "-" .. SomeCounter
end
local GenerateUUID = GenerateID -- Alias for readability

-- Function to check if a rank exists
local function RankExists(rankName)
  return RanksServer[rankName] ~= nil
end

-- Function to set a player's role (rank)
local function SetPlayerRole(rankName, playerSource)
  local identifier = GetIdentifier(playerSource)
  if not identifier then
    return
  end

  if not RankExists(rankName) then
    return
  end

  -- Remove player from other ranks
  for existingRankName, rankData in pairs(RanksServer) do
    if existingRankName ~= "owner" and existingRankName ~= "user" then
      for playerIndex, playerIdentifier in ipairs(rankData.players) do
        if playerIdentifier == identifier then
          table.remove(RanksServer[existingRankName].players, playerIndex)
          break
        end
      end
    end
  end

  -- Add player to the new rank
  table.insert(RanksServer[rankName].players, identifier)
  SaveRanks()

  -- Update player data in PlayerServer
  if PlayerServer[playerSource] then
    PlayerServer[playerSource].role = rankName
    PlayerServer[playerSource].roleColor = GetRoleColor(rankName)
    PlayerServer[playerSource].permission = GetRolesPermissions(rankName, playerSource)
  end
end

-- Function to remove a player's role (set to user)
local function RemovePlayerRole(rankName, playerSource)
  local identifier = GetIdentifier(playerSource)
  if not identifier then
    return
  end

  if not RankExists(rankName) then
    return
  end

  -- Remove player from the rank
  for playerIndex, playerIdentifier in pairs(RanksServer[rankName].players) do
    if playerIdentifier == identifier then
      table.remove(RanksServer[rankName].players, playerIndex)
      break
    end
  end

  SaveRanks()

  -- Update player data in PlayerServer
  if PlayerServer[playerSource] then
    PlayerServer[playerSource].role = "user"
    PlayerServer[playerSource].roleColor = GetRoleColor("user")
    PlayerServer[playerSource].permission = GetRolesPermissions("user", playerSource)
  end
end

-- Function to save resource file
local function SaveResourceFileContent(resourceName, filename, content)
  local resourcePath = GetResourcePath(GetCurrentResourceName())
  local filePath = resourcePath .. "/" .. filename
  SaveResourceFile(GetCurrentResourceName(), filename, content, string.len(content))
end
-- Helper function to save data to a JSON file
local function saveDataToFile(data, filename)
  local filePath = filename
  local encodedData = json.encode(data, { indent = true }) -- Encode data to JSON with indentation

  -- Call the native function to write the file
  SaveResourceFile(GetCurrentResourceName(), filePath, encodedData, -1)
end

-- Helper function to load data from a JSON file
local function loadDataFromFile(filename)
  local filePath = filename
  local fileContent = LoadResourceFile(GetCurrentResourceName(), filePath) -- Load file content

  if fileContent then
    local decodedData = json.decode(fileContent) -- Decode JSON data
    if decodedData == nil then
      return {} -- Return empty table if decoding fails
    end
    return decodedData
  else
    return {} -- Return empty table if file loading fails
  end
end

-- Function to save custom data
local function saveCustomData()
  saveDataToFile(custom_data, "custom_data.json")
end
saveData = saveCustomData

-- Function to load custom data
local function loadCustomData()
  custom_data = loadDataFromFile("custom_data.json")
end
loadData = loadCustomData

-- Function to save ranks data
local function saveRanksData()
  saveDataToFile(ranksServer, "ranks.json")
  _G.ranksServer = ranksServer -- Update global variable

  local onlineStaff = GetOnlineStaff()
  for _, player in ipairs(onlineStaff) do
    TriggerClientEvent("updateranklist", player, ranksServer) -- Trigger client event to update rank list
  end
end
saveRanks = saveRanksData

-- Function to load ranks data
local function loadRanksData()
  ranksServer = loadDataFromFile("ranks.json")
  _G.ranksServer = ranksServer -- Update global variable
end
loadRanks = loadRanksData

-- Function to save handling data
local function saveHandlingData()
  saveDataToFile(Handling, "Handling.json")
end
saveHandling = saveHandlingData

-- Function to load handling data
local function loadHandlingData()
  Handling = loadDataFromFile("Handling.json")
end
loadHandling = loadHandlingData

-- Function to initialize a table of boolean options (likely for a menu)
local function initializeOptions()
  local options = {}

  options[1] = { label = "Remplacer le frein par l\226\128\153acc\195\169l\195\169rateur", checked = false }
  options[2] = { label = "Jouer une vid\195\169o", checked = false }
  options[3] = { label = "Jouer une vid\195\169o (tout le monde)", checked = false }
  options[4] = { label = "Retir\195\169 tout les vehicule de la fouriere", checked = false }
  options[5] = { label = "Acc\195\169der \195\160 la page du joueur signalant", checked = false }
  options[6] = { label = "Acc\195\169der \195\160 la page du joueur signal\195\169", checked = false }
  options[7] = { label = "Actions diverses", checked = false }
  options[8] = { label = "Actions d\195\169veloppeur", checked = false }
  options[9] = { label = "Actions joueurs", checked = false }
  options[10] = { label = "Actions personnelles", checked = false }
  options[11] = { label = "Actions serveur", checked = false }
  options[12] = { label = "Actions v\195\169hicules", checked = false }
  options[13] = { label = "Afficher coordonn\195\169es", checked = false }
  options[14] = { label = "Afficher infos peds", checked = false }
  options[15] = { label = "Afficher infos props", checked = false }
  options[16] = { label = "Afficher infos vehicules", checked = false }
  options[17] = { label = "Ajout\195\169 un rank", checked = false }
  options[18] = { label = "Annuler", checked = false }
  options[19] = { label = "Anti car kill", checked = false }
  options[20] = { label = "Armure", checked = false }
  options[21] = { label = "Aveugler", checked = false }
  options[22] = { label = "Ban", checked = false }
  options[23] = { label = "Blesser", checked = false }
  options[24] = { label = "Bring", checked = false }
  options[25] = { label = "Bring back", checked = false }
  options[26] = { label = "Bring back les deux joueurs", checked = false }
  options[27] = { label = "Bring les deux joueurs sur vous", checked = false }
  options[28] = { label = "Casser le moteur", checked = false }
  options[29] = { label = "Casser le v\195\169hicule", checked = false }
  options[30] = { label = "Casser les fen\195\170tres", checked = false }
  options[31] = { label = "Casser les portes", checked = false }
  options[32] = { label = "Catalogue des markers", checked = false }
  options[33] = { label = "Catalogue des peds", checked = false }
  options[34] = { label = "Catalogue des v\195\169hicules", checked = false }
  options[35] = { label = "Changer l'heure", checked = false }
  options[36] = { label = "Changer la date de naissance", checked = false }
  options[37] = { label = "Changer la taille", checked = false }
  options[38] = { label = "Changer le nom (rp)", checked = false }
  options[39] = { label = "Changer le sexe", checked = false }
  options[40] = { label = "Changer sa position de spawn", checked = false }
  options[41] = { label = "Clear les animations", checked = false }
  options[42] = { label = "Clear stuck props", checked = false }
  options[43] = { label = "Coup de poing electric", checked = false }
  options[44] = { label = "Crever les pneus", checked = false }
  options[45] = { label = "Cr\195\169e le rank", checked = false }
  options[46] = { label = "Cr\195\169er un blips (permanent)", checked = false }
  options[47] = { label = "Cr\195\169er un blips (session)", checked = false }
  options[48] = { label = "Cr\195\169er un marker (permanent)", checked = false }
  options[49] = { label = "Cr\195\169er un marker (session)", checked = false }
  options[50] = { label = "Cr\195\169er un ped (permanent)", checked = false }
  options[51] = { label = "Cr\195\169er un ped (session)", checked = false }
  options[52] = { label = "Cr\195\169er un rank", checked = false }
  options[53] = { label = "Cr\195\169er une t\195\169l\195\169portation (permanent)", checked = false }
  options[54] = { label = "Cr\195\169er une t\195\169l\195\169portation (session)", checked = false }
  options[55] = { label = "Cr\195\169er une zones safe (permanent)", checked = false }
  options[56] = { label = "Cr\195\169er une zones safe (session)", checked = false }
  options[57] = { label = "Ejecter du v\195\169hicule", checked = false }
  options[58] = { label = "Entrer dans l'instance", checked = false }
  options[59] = { label = "Envoyer un message", checked = false }
  options[60] = { label = "Explode", checked = false }
  options[61] = { label = "Faire accel\195\169rer le v\195\169hicule", checked = false }
  options[62] = { label = "Faire crash", checked = false }
  options[63] = { label = "Faire crash de tous les joueurs", checked = false }
  options[64] = { label = "Faire crash le v\195\169hicule", checked = false }
  options[65] = { label = "Faire jouer un /me", checked = false }
  options[66] = { label = "Faire jouer une animation (custom)", checked = false }
  options[67] = { label = "Faire jouer une animation /e", checked = false }
  options[68] = { label = "Faire lag", checked = false }
  options[69] = { label = "Faire un restart", checked = false }
  options[70] = { label = "Faire une annonce", checked = false }
  options[71] = { label = "Fermer le report", checked = false }
  options[72] = { label = "Freeze / Unfreeze", checked = false }
  options[73] = { label = "Freeze / Unfreeze le v\195\169hicule", checked = false }
  options[74] = { label = "Gestion des ranks", checked = false }
  options[75] = { label = "Give argent (money / bank / dirty)", checked = false }
  options[76] = { label = "Give item", checked = false }
  options[77] = { label = "God mode", checked = false }
  options[78] = { label = "Goto", checked = false }
  options[79] = { label = "Handling Editor", checked = false }
  options[80] = { label = "Heal", checked = false }
  options[81] = { label = "Heal", checked = false }
  options[82] = { label = "Infinite ammo", checked = false }
  options[83] = { label = "Infinite stamina", checked = false }
  options[84] = { label = "Informations", checked = false }
  options[85] = { label = "Invisible", checked = false }
  options[86] = { label = "Jouer un son", checked = false }
  options[87] = { label = "Jouer un son", checked = false }
  options[88] = { label = "Kick", checked = false }
  options[89] = { label = "Kick all", checked = false }
  options[90] = { label = "Kill", checked = false }
  options[91] = { label = "Lancer un scan de potentielles backdoors", checked = false }
  options[92] = { label = "Lancer un test AFK", checked = false }
  options[93] = { label = "List des joueurs potentiellement AFK", checked = false }
  options[94] = { label = "Liste des blips cr\195\169\195\169s", checked = false }
  options[95] = { label = "Liste des items", checked = false }
  options[96] = { label = "Liste des markers cr\195\169\195\169s", checked = false }
  options[97] = { label = "Liste des peds cr\195\169\195\169s", checked = false }
  options[98] = { label = "Liste des ranks", checked = false }
  options[99] = { label = "Liste des t\195\169l\195\169portations cr\195\169\195\169s", checked = false }
  options[100] = { label = "Liste des zones safe", checked = false }
  options[101] = { label = "Marker: ", checked = false }
  options[102] = { label = "Menu de cr\195\169ation", checked = false }
  options[103] = { label = "Menu vetment", checked = false }
  options[104] = { label = "Mettre en feu", checked = false }
  options[105] = { label = "Mettre/Retirer armure", checked = false }
  options[106] = { label = "Munitions \195\169lectriques", checked = false }
  options[107] = { label = "Nettoyer", checked = false }
  options[108] = { label = "Nettoyer le joueur", checked = false }
  options[109] = { label = "Nettoyer le v\195\169hicule", checked = false }
  options[110] = { label = "No ragdoll", checked = false }
  options[111] = { label = "Noclip", checked = false }
  options[112] = { label = "Nom des joueurs", checked = false }
  options[113] = { label = "Nom du rank", checked = false }
  options[114] = { label = "Notifications des connexions", checked = false }
  options[115] = { label = "Notifications des d\195\169connexions", checked = false }
  options[116] = { label = "Notifications des reports", checked = false }
  options[117] = { label = "One shot", checked = false }
  options[118] = { label = "Ouvrir l'inventaire", checked = false }
  options[119] = { label = "Ouvrir le menu character", checked = false }
  options[120] = { label = "Ouvrir le menu vetements", checked = false }
  options[121] = { label = "Poubelle admin", checked = false }
  options[122] = { label = "Ragdoll", checked = false }
  options[123] = { label = "Ragdoll", checked = false }
  options[124] = { label = "Rechercher un items", checked = false }
  options[125] = { label = "Reload skin", checked = false }
  options[126] = { label = "Reload skin", checked = false }
  options[127] = { label = "Rendre bourr\195\169", checked = false }
  options[128] = { label = "Report | ", checked = false }
  options[129] = { label = "Reset l'instance", checked = false }
  options[130] = { label = "Reset l\226\128\153instance", checked = false }
  options[131] = { label = "Retir\195\169 le rank staff", checked = false }
  options[132] = { label = "Retir\195\169 le sang sur le joueur", checked = false }
  options[133] = { label = "Retrouver votre apparence", checked = false }

  return options
end
-- Revive option
local reviveOption = {}
reviveOption.label = "Revive"
reviveOption.checked = false

-- Revive (local) option
local reviveLocalOption = {}
reviveLocalOption.label = "Revive (local)"
reviveLocalOption.checked = false

-- Repair vehicle option
local repairVehicleOption = {}
repairVehicleOption.label = "R\195\169parer le v\195\169hicule" -- Repair the vehicle
repairVehicleOption.checked = false

-- Screenshot option
local screenshotOption = {}
screenshotOption.label = "Screenshot"
screenshotOption.checked = false

-- Connect to account option
local connectToAccountOption = {}
connectToAccountOption.label = "Se connecter \195\160 son compte" -- Connect to your account
connectToAccountOption.checked = false

-- Set job option
local setJobOption = {}
setJobOption.label = "Setjob"
setJobOption.checked = false

-- Spawn vehicle option
local spawnVehicleOption = {}
spawnVehicleOption.label = "Spawn un v\195\169hicule" -- Spawn a vehicle
spawnVehicleOption.checked = false

-- Spectate option
local spectateOption = {}
spectateOption.label = "Spectate"
spectateOption.checked = false

-- Speed hack option
local speedHackOption = {}
speedHackOption.label = "Speed hack"
speedHackOption.checked = false

-- Stop carjack option
local stopCarjackOption = {}
stopCarjackOption.label = "Stop Carjack"
stopCarjackOption.checked = false

-- Super jump option
local superJumpOption = {}
superJumpOption.label = "Super jump"
superJumpOption.checked = false

-- Super swim option
local superSwimOption = {}
superSwimOption.label = "Super nage" -- Super swim
superSwimOption.checked = false

-- Super run option
local superRunOption = {}
superRunOption.label = "Super run"
superRunOption.checked = false

-- Delete vehicle option
local deleteVehicleOption = {}
deleteVehicleOption.label = "Supprimer le v\195\169hicule" -- Delete the vehicle
deleteVehicleOption.checked = false

-- Seizures option
local seizuresOption = {}
seizuresOption.label = "S\195\169ismes" -- Seizures
seizuresOption.checked = false

-- TP all to marker option
local tpAllToMarkerOption = {}
tpAllToMarkerOption.label = "TP ALL sur marqueur" -- TP all to marker
tpAllToMarkerOption.checked = false

-- TP all to self option
local tpAllToSelfOption = {}
tpAllToSelfOption.label = "TP ALL sur sois" -- TP all to self
tpAllToSelfOption.checked = false

local adminOptions = {} -- Renamed L0_2 to a more descriptive name
adminOptions[101] = tpToMarkerOption
adminOptions[102] = randomOutfitOption
adminOptions[103] = thermalVisionOption
adminOptions[104] = tpToPlayerOption
adminOptions[105] = transformToPedOption
adminOptions[106] = teleportRandomlyOption
adminOptions[107] = tpToWaypointOption
adminOptions[108] = tpToWaypointInVehicleOption
adminOptions[109] = tpToSkyOption
adminOptions[110] = tpToPositionOption
adminOptions[111] = upgradeVehicleOption
adminOptions[112] = clearServerCacheOption
adminOptions[113] = nightVisionOption
adminOptions[114] = reconnectToAccountOption
adminOptions[115] = vehicleOption
adminOptions[116] = warnOption
adminOptions[117] = wipeOption
adminOptions[118] = wipeAllPlayerVehiclesOption
adminOptions[119] = reportManagementOption
adminOptions[120] = saveOption
adminOptions[121] = wipeAllPlayersOption
adminOptions[134] = reviveOption
adminOptions[135] = reviveLocalOption
adminOptions[136] = repairVehicleOption
adminOptions[137] = screenshotOption
adminOptions[138] = connectToAccountOption
adminOptions[139] = setJobOption
adminOptions[140] = spawnVehicleOption
adminOptions[141] = spectateOption
adminOptions[142] = speedHackOption
adminOptions[143] = stopCarjackOption
adminOptions[144] = superJumpOption
adminOptions[145] = superSwimOption
adminOptions[146] = superRunOption
adminOptions[147] = deleteVehicleOption
adminOptions[148] = seizuresOption
adminOptions[149] = tpAllToMarkerOption
adminOptions[150] = tpAllToSelfOption
adminOptions[151] = tpToMarkerOption
adminOptions[152] = randomOutfitOption
adminOptions[153] = thermalVisionOption
adminOptions[154] = tpToPlayerOption
adminOptions[155] = transformToPedOption
adminOptions[156] = teleportRandomlyOption
adminOptions[157] = tpToWaypointOption
adminOptions[158] = tpToWaypointInVehicleOption
adminOptions[159] = tpToSkyOption
adminOptions[160] = tpToPositionOption
adminOptions[161] = upgradeVehicleOption
adminOptions[162] = clearServerCacheOption
adminOptions[163] = nightVisionOption
adminOptions[164] = reconnectToAccountOption
adminOptions[165] = vehicleOption
adminOptions[166] = warnOption
adminOptions[167] = wipeOption
adminOptions[168] = wipeAllPlayerVehiclesOption
adminOptions[169] = reportManagementOption
adminOptions[170] = saveOption
adminOptions[171] = wipeAllPlayersOption

tpToMarkerOption = {}
tpToMarkerOption.label = "TP sur le marqueur" -- TP to the marker
tpToMarkerOption.checked = false

randomOutfitOption = {}
randomOutfitOption.label = "Tenue al\195\169atoire" -- Random outfit
randomOutfitOption.checked = false

thermalVisionOption = {}
thermalVisionOption.label = "Thermal vision"
thermalVisionOption.checked = false

tpToPlayerOption = {}
tpToPlayerOption.label = "Tp sur le joueur" -- TP to the player
tpToPlayerOption.checked = false

transformToPedOption = {}
transformToPedOption.label = "Transformer en ped" -- Transform to ped
transformToPedOption.checked = false

teleportRandomlyOption = {}
teleportRandomlyOption.label = "T\195\169l\195\169porter al\195\169atoirement" -- Teleport randomly
teleportRandomlyOption.checked = false

tpToWaypointOption = {}
tpToWaypointOption.label = "T\195\169l\195\169porter sur mon waypoint" -- Teleport to my waypoint
tpToWaypointOption.checked = false

tpToWaypointInVehicleOption = {}
tpToWaypointInVehicleOption.label = "T\195\169l\195\169porter sur mon waypoint (dans son vehicule)" -- Teleport to my waypoint (in their vehicle)
tpToWaypointInVehicleOption.checked = false

tpToSkyOption = {}
tpToSkyOption.label = "T\195\169l\195\169porter tout en haut (troll)" -- Teleport to the top (troll)
tpToSkyOption.checked = false

tpToPositionOption = {}
tpToPositionOption.label = "T\195\169l\195\169porter \195\160 une position" -- Teleport to a position
tpToPositionOption.checked = false

upgradeVehicleOption = {}
upgradeVehicleOption.label = "Upgrades v\195\169hicule" -- Vehicle upgrades
upgradeVehicleOption.checked = false

clearServerCacheOption = {}
clearServerCacheOption.label = "Vider le cache du serveur" -- Clear the server cache
clearServerCacheOption.checked = false

nightVisionOption = {}
nightVisionOption.label = "Vision nocturne" -- Night vision
nightVisionOption.checked = false

reconnectToAccountOption = {}
reconnectToAccountOption.label = "Vous reconnecter \195\160 votre compte" -- Reconnect to your account
reconnectToAccountOption.checked = false

vehicleOption = {}
vehicleOption.label = "V\195\169hicule: " -- Vehicle:
vehicleOption.checked = false

warnOption = {}
warnOption.label = "Warn"
warnOption.checked = false

wipeOption = {}
wipeOption.label = "Wipe"
wipeOption.checked = false

wipeAllPlayerVehiclesOption = {}
wipeAllPlayerVehiclesOption.label = "Wipe tous les v\195\169hicules des joueurs" -- Wipe all player vehicles
wipeAllPlayerVehiclesOption.checked = false

reportManagementOption = {}
reportManagementOption.label = "~b~Gestion des reports" -- ~b~Report management
reportManagementOption.checked = false

saveOption = {}
saveOption.label = "~g~Sauvegarder" -- ~g~Save
saveOption.checked = false

wipeAllPlayersOption = {}
wipeAllPlayersOption.label = "\226\157\151Wipe tous les joueurs du serveur \226\157\151" --  Wipe all players from the server
wipeAllPlayersOption.checked = false

local reportSettings = {} -- L1_2
reportSettings["Cr\195\169er un report"] = true -- Create a report
reportSettings["Report un joueur"] = true -- Report a player
reportSettings.Report = true
reportSettings["Mode staff: ~g~Activ\195\169"] = true -- Staff mode: ~g~Active
reportSettings["Mode staff: ~r~D\195\169sactiv\195\169"] = true -- Staff mode: ~r~Inactive
reportSettings.Settings = true

serverButtonFunds = {} -- L2_2

-- Iterate through adminOptions and populate serverButtonFunds with missing labels from reportSettings
for _, option in ipairs(adminOptions) do
  if not reportSettings[option.label] then
    table.insert(serverButtonFunds, option)
  end
end

extraire_labels = extractLabels
master = master -- Keep master value
extractLabels = _G
_G.master = master
_G.ranksServer = ranksServer
_G.masterLicenses = masterLicenses

-- Call functions to load game data
extractLabels()
loadData()
loadRanks()
loadHandling()

_G.ranksServer = ranksServer

local onReady = L4_1.ready
function onReady() -- L11_1
  -- Fetch all users from the database
  local users = L4_1.Sync.fetchAll("SELECT * FROM users")

  -- Iterate through the users and load their data
  for _, userData in pairs(users) do
    -- Store user data in PlayerServerOffline table
    PlayerServerOffline[userData.identifier] = userData

    -- Decode skin data (if valid)
    local skinData = json.decode(userData.skin)
    if type(skinData) ~= "table" or not skinData then
      skinData = {}
    end
    PlayerServerOffline[userData.identifier].skin = skinData

    -- Decode position data (if valid)
    local positionData = json.decode(userData.position)
    if not userData.position then -- Default empty object in database
        positionData = "{}"
    end
    if type(positionData) ~= "table" or not positionData then
      positionData = {}
    end
    PlayerServerOffline[userData.identifier].position = positionData
  end

  print("[DEBUG] User data loaded successfully from database and objects fixed.")
end

onReady(onReady)

-- Function to trigger client events for staff members
function triggerStaffClientEvent(sourcePlayer, eventName, targetPlayer, notificationMessage, ...)
  -- Check if the source player is a staff member
  if not IsStaff(sourcePlayer) then
    -- Drop the player if they are not a staff member
    DropPlayer(sourcePlayer, "You are not allowed to use this resource")
    return
  end

  -- Trigger the client event for the target player
  TriggerClientEvent(eventName, targetPlayer, ...)

  -- Send a success notification to the source player
  TriggerClientEvent("gunware:notif", sourcePlayer, "success", notificationMessage)
end

-- Function to execute asynchronous database queries
function executeAsyncDatabaseQuery(sourcePlayer, query, parameters, actionData)
  -- Check if the database connection is available
  if not L4_1 then
    if actionData.targetPlayerId then
      TriggerClientEvent("gunware:notif", actionData.targetPlayerId, "error", "Database connection not available.")
    end
    return
  end

  -- Execute the asynchronous query
  L4_1.Async.execute(query, parameters, function(rowsAffected)
    -- Callback function after the query is executed
    if rowsAffected > 0 then
      -- Log the admin action if the query was successful
      local targetPlayerName = "Unknown"
      if actionData.targetPlayerId then
        targetPlayerName = GetPlayerName(actionData.targetPlayerId) or "Unknown"
        if not targetPlayerName then
            targetPlayerName = "Unknown"
        end
      end

      logAdminAction({
        action = actionData.action,
        playerName = targetPlayerName,
        description = actionData.description,
        color = 16711680,
        webhook = actionData.webhook
      })
    else
      -- Send an error notification to the target player if the query failed
      if actionData.targetPlayerId then
        TriggerClientEvent("gunware:notif", actionData.targetPlayerId, "error", "Failed to update database for player.")
      end
    end
  end)
end

-- Function to register a network event
function registerStaffNetEvent(eventName, handlerFunction, isStaffCheckFunction)
  -- Use default IsStaff function if none is provided
  if not isStaffCheckFunction then
    isStaffCheckFunction = IsStaff
  end

  -- Register the network event
  RegisterNetEvent(eventName)

  -- Add the event handler
  AddEventHandler(eventName, function(...)
    local sourcePlayer = source

    -- Check if the player is a staff member
    if not isStaffCheckFunction(sourcePlayer) then
      DropPlayer(sourcePlayer, "You are not allowed to use this resource.")
      return
    end

    -- Call the handler function
    handlerFunction(sourcePlayer, ...)
  end)
end

-- Function to trigger a client event and log the admin action
function triggerClientEventAndLog(sourcePlayer, targetPlayer, action, webhook, description, eventName, ...)
  local targetPed = GetPlayerPed(targetPlayer)
  if not targetPed then
    TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Target player not found or offline.")
    return
  end

  -- Trigger the client event for the target player
  TriggerClientEvent(eventName, targetPlayer, ...)

  -- Log the admin action
  logAdminAction({
    action = action,
    playerName = GetPlayerName(targetPlayer),
    description = description,
    color = 16711680,
    webhook = webhook
  })
end

-- Function to execute an ESX function and log the admin action
function executeESXFunctionAndLog(sourcePlayer, targetPlayer, action, webhook, description, esxFunction)
  if not L2_1 then
    TriggerClientEvent("gunware:notif", sourcePlayer, "error", "ESX framework not available.")
    return
  end

  -- Get the ESX player object
  local esxPlayer = L2_1.GetPlayerFromId(targetPlayer)
  if not esxPlayer then
    TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Player not found (ESX data).")
    return
  end

  -- Execute the ESX function
  esxFunction(esxPlayer)

  -- Log the admin action
  logAdminAction({
    action = action,
    playerName = GetPlayerName(targetPlayer),
    description = description,
    color = 16711680,
    webhook = webhook
  })
end

RegisterNetEvent("gunware:sync:actionPlayer")

AddEventHandler("gunware:sync:actionPlayer", function(actionName, actionData)
  local sourcePlayer = source
  local targetPlayer = actionData.target

  -- Check if the target player is valid
  if -1 ~= targetPlayer then
    local targetPed = GetPlayerPed(targetPlayer)
    if not targetPed then
      TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Target player not found.")
      return
    end
  end

  actionData.action = actionName
  local action = actionData.action

  -- Handle different actions
  if "player_setJob" == action then
    if L1_1 then
      if L1_1.setJob then
        -- Set the player's job
        local success = L1_1.setJob(actionData.target, actionData.job, actionData.grade)
        if success then
          -- Send a success notification
          TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Job chang\195\169 avec succ\195\168s vers " .. actionData.job .. " grade " .. actionData.grade) -- Job changed successfully to ... grade ...

          -- Log the admin action
          logAdminAction({
            action = "Set Job",
            playerName = GetPlayerName(actionData.target),
            description = "Set Job to " .. actionData.job .. " with grade " .. actionData.grade,
            webhook = "setjob"
          })
        else
          -- Send an error notification
          TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Erreur lors du changement de job") -- Error during job change
          print("[ERROR] \195\137chec du changement de job pour le joueur " .. actionData.target) -- Failure to change job for player ...
        end
      end
    else
      -- Handle the case where config.setJob is not defined
      print("[WARNING] config.setJob is not defined.")
      TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Fonction SetJob non disponible - v\195\169rifiez ESX/QBCore") -- SetJob function not available - check ESX/QBCore
    end
    return
  elseif "player_enterInstance" == action then
    local targetPed = GetPlayerPed(actionData.target)
    if targetPed then
      -- Set the player's routing bucket to enter the instance
      SetPlayerRoutingBucket(sourcePlayer, GetPlayerRoutingBucket(actionData.target))

      -- Log the admin action
      logAdminAction({
        action = "Enter Instance",
        playerName = GetPlayerName(sourcePlayer),
        description = "Entered the instance of " .. GetPlayerName(actionData.target),
        webhook = "instance"
      })
    else
      TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Target player is not online.")
    end
    return
  elseif "player_giveMoney" == action then
    local esxFunction = function(esxPlayer)
        esxPlayer.addMoney(actionData.amount)
    end
      executeESXFunctionAndLog(sourcePlayer, actionData.target, "Give Money", "giveMoney", "Gave " .. actionData.amount .. " to ".. actionData.type, esxFunction)
  end
end
-- Handles admin actions based on the provided data.
local function handleAdminAction(source, actionData)
  local playerId = source

  if actionData.action == "give_money" then
    local addAccountMoney = giveMoney -- Assuming giveMoney is a function to give money
    local accountType = actionData.type
    local amount = actionData.amount
    addAccountMoney(accountType, amount)

    logAdminAction({
      action = "Give Money",
      playerName = GetPlayerName(playerId),
      description = "Gave " .. amount .. " of type " .. accountType,
      webhook = "money"
    })
    return
  elseif actionData.action == "player_giveItem" then
    local addInventoryItem = giveItem -- Assuming giveItem is a function to give items
    local targetPlayerId = actionData.target
    local itemName = actionData.item
    local itemAmount = actionData.amount

    addInventoryItem(itemName, itemAmount)

    logAdminAction({
      action = "Give Item",
      playerName = GetPlayerName(playerId),
      description = "Gave " .. itemAmount .. " of " .. itemName .. " to " .. GetPlayerName(targetPlayerId),
      webhook = "item"
    })
    return
  elseif actionData.action == "player_kick" then
    local targetPlayerId = actionData.target
    local kickReason = actionData.reason

    DropPlayer(targetPlayerId, kickReason) -- Kick the player.

    logAdminAction({
      action = "Kick",
      playerName = GetPlayerName(targetPlayerId),
      description = "Kicked for " .. kickReason,
      webhook = "kick"
    })
    return
  elseif actionData.action == "player_wipe" then
    if Wipe then -- Check if Wipe functionality is available
      Wipe(actionData.target) -- Wipe the player's data.

      logAdminAction({
        action = "Wipe Player",
        playerName = GetPlayerName(actionData.target),
        description = "Wiped player data",
        webhook = "wipe"
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Wipe functionality not available.")
    end
    return
  elseif actionData.action == "player_goto" then
    local targetPlayerId = actionData.target
    local targetCoords = getCoords(targetPlayerId) -- Assuming getCoords is a function that returns player coords

    if targetCoords then
      TriggerClientEvent("gunware:teleport", playerId, targetCoords) -- Teleport player.

      logAdminAction({
        action = "Goto",
        playerName = GetPlayerName(playerId),
        description = "Teleported to " .. GetPlayerName(targetPlayerId),
        webhook = "goto"
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Could not get target player's coordinates.")
    end
    return
  elseif actionData.action == "player_bringBack" then
    local targetPlayerId = actionData.target
    teleportBack(playerId, targetPlayerId, "Bring Back", "gunware:setToOldCoords", "bringBack", "Teleported back")
    return
  elseif actionData.action == "player_sex" then
    local targetPlayerId = actionData.target
    local identifier = getIdentifiant(targetPlayerId)

    if identifier then
      performDatabaseQuery(identifier, "UPDATE users set sex = @sex WHERE identifier = @identifier", {
        ["@sex"] = actionData.sex,
        ["@identifier"] = identifier
      }, {
        action = "Change Sex",
        description = "Changed sex to " .. actionData.sex,
        webhook = "sex",
        targetPlayerId = targetPlayerId
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Could not get target player's identifier.")
    end
    return
  elseif actionData.action == "player_birth" then
    local targetPlayerId = actionData.target
    local identifier = getIdentifiant(targetPlayerId)

    if identifier then
      performDatabaseQuery(identifier, "UPDATE users set dateofbirth = @dateofbirth WHERE identifier = @identifier", {
        ["@dateofbirth"] = actionData.dateofbirth,
        ["@identifier"] = identifier
      }, {
        action = "Change Birth",
        description = "Changed birth to " .. actionData.dateofbirth,
        webhook = "birth",
        targetPlayerId = targetPlayerId
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Could not get target player's identifier.")
    end
    return
  elseif actionData.action == "player_scale" then
    local targetPlayerId = actionData.target
    local identifier = getIdentifiant(targetPlayerId)

    if identifier then
      performDatabaseQuery(identifier, "UPDATE users set height = @height WHERE identifier = @identifier", {
        ["@height"] = actionData.height,
        ["@identifier"] = identifier
      }, {
        action = "Change Scale",
        description = "Changed height to " .. actionData.height,
        webhook = "scale",
        targetPlayerId = targetPlayerId
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Could not get target player's identifier.")
    end
    return
  elseif actionData.action == "player_name" then
    local targetPlayerId = actionData.target
    local identifier = getIdentifiant(targetPlayerId)

    if identifier then
      performDatabaseQuery(identifier, "UPDATE users SET firstname = @firstname, lastname = @lastname WHERE identifier = @identifier", {
        ["@firstname"] = actionData.firstname,
        ["@lastname"] = actionData.lastname,
        ["@identifier"] = identifier
      }, {
        action = "Change Name",
        description = "Changed name to " .. actionData.firstname .. " " .. actionData.lastname,
        webhook = "name",
        targetPlayerId = targetPlayerId
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Could not get target player's identifier.")
    end
    return
  elseif actionData.action == "player_spectate" then
    local targetPlayerId = actionData.target

    local ped = GetPlayerPed(targetPlayerId)
    local targetCoords = GetEntityCoords(ped)
    TriggerClientEvent("gunware:spectate", playerId, targetPlayerId, targetCoords)
    return
  elseif actionData.action == "player_spectate2" then
    local function getRandomPlayerExcept(currentPlayer)
      local players = GetPlayers()
      local otherPlayers = {}
      for _, player in ipairs(players) do
        if player ~= currentPlayer then
          table.insert(otherPlayers, player)
        end
      end

      if #otherPlayers == 0 then
        return nil
      end

      local randomIndex = math.random(#otherPlayers)
      return otherPlayers[randomIndex]
    end

    local randomPlayer = getRandomPlayerExcept(playerId)

    if randomPlayer then
      local ped = GetPlayerPed(randomPlayer)
      local targetCoords = GetEntityCoords(ped)
      TriggerClientEvent("gunware:spectate", playerId, randomPlayer, targetCoords)
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "No other players online to spectate.")
    end
    return
  elseif actionData.action == "player_warn" then
    local targetPlayerId = actionData.target
    local warnReason = actionData.reason

    TriggerClientEvent("txcl:showWarning", targetPlayerId, GetPlayerName(playerId), warnReason)

    logAdminAction({
      action = "Warn",
      playerName = GetPlayerName(playerId),
      description = "Warned " .. GetPlayerName(targetPlayerId) .. " for " .. warnReason,
      webhook = "warn"
    })
    return
  elseif actionData.action == "player_revive" then
    if Revive then -- Check if revive functionality is available
      Revive(actionData.target) -- Revive the player.

      logAdminAction({
        action = "Revive",
        playerName = GetPlayerName(actionData.target),
        description = "Revived",
        webhook = "revive"
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Revive functionality not available.")
    end
    return
  elseif actionData.action == "player_heal" then
    if Heal then -- Check if heal functionality is available
      Heal(actionData.target) -- Heal the player.

      logAdminAction({
        action = "Heal",
        playerName = GetPlayerName(actionData.target),
        description = "Healed",
        webhook = "heal"
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Heal functionality not available.")
    end
    return
  elseif actionData.action == "player_ban" then
    if banPlayer then
      banPlayer(actionData.target, actionData.time, actionData.reason) -- Ban the player.

      logAdminAction({
        action = "Ban",
        playerName = GetPlayerName(actionData.target),
        description = "Banned for " .. actionData.time .. " seconds",
        webhook = "ban"
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Ban functionality not available.")
    end
    return
  elseif actionData.action == "clothes_reload" then
    if reloadskin then
      reloadskin(actionData.target) -- Reload the player's skin.

      logAdminAction({
        action = "Reload Clothes",
        playerName = GetPlayerName(actionData.target),
        description = "Reloaded clothes",
        webhook = "clothes_reload"
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Reload skin functionality not available.")
    end
    return
  elseif actionData.action == "player_mute" then
    if exports["pma-voice"] and exports["pma-voice"].toggleMutePlayer then
      exports["pma-voice"].toggleMutePlayer(exports["pma-voice"], actionData.target)

      logAdminAction({
        action = "Mute Player",
        playerName = GetPlayerName(actionData.target),
        description = "Muted player",
        webhook = "mute"
      })
    else
      TriggerClientEvent("gunware:notif", playerId, "error", "Voice mute functionality not available.")
    end
    return
  end

  if actionData.action == "player_screenshot" then
    print(string.format("[INFO] Screenshot demandée pour joueur %d par admin %d", actionData.target, playerId))
    TriggerClientEvent("gunware:sync:actionPlayer", actionData.target, actionData)

    logAdminAction({
      action = "Take Screenshot",
      playerName = GetPlayerName(actionData.target),
      description = "Screenshot taken",
      webhook = "screenshot"
    })
    return
  elseif actionData.action == "admin_notification" then
    if actionData.type and actionData.message then
      TriggerClientEvent("gunware:notif", actionData.target, actionData.type, actionData.message)
      print(string.format("[INFO] Notification admin envoyée à %d: %s - %s", actionData.target, actionData.type, actionData.message))
    end
    return
  end
end
-- Register net event for performing an action on a player
RegisterNetEvent("gunware:sync:actionPlayer")

-- Event handler for performing an action on a player
AddEventHandler("gunware:sync:actionPlayer", function(actionData)
  -- Get the source of the event (player who triggered it)
  local sourcePlayer = source

  -- Check if the action data and the target are valid
  if not actionData or not actionData.target then
    print("[ERROR] gunware:sync:actionPlayer - Invalid action data or target.")
    return
  end

  -- Trigger client event to sync the action data with the target player
  TriggerClientEvent("gunware:sync:actionPlayer", actionData.target, actionData)
end)

-- Register net event for uploading a screenshot
RegisterNetEvent("gunware:upload:screenshot")

-- Event handler for uploading a screenshot
AddEventHandler("gunware:upload:screenshot", function(targetPlayerId, screenshotData)
  -- Get the source of the event (player who took the screenshot)
  local sourcePlayerId = source

  -- Check if the parameters are valid
  if not targetPlayerId or not screenshotData then
    print("[ERROR] gunware:upload:screenshot - Missing parameters")
    return
  end

  -- Get player names
  local sourcePlayerName = GetPlayerName(sourcePlayerId)
  local targetPlayerName = GetPlayerName(targetPlayerId)

  -- Check if the player names were successfully retrieved
  if not sourcePlayerName or not targetPlayerName then
    print("[ERROR] gunware:upload:screenshot - Could not retrieve player names")
    return
  end

  -- Print a success message to the server console
  print(string.format("[SUCCESS] Screenshot de %s (%d) pris par %s (%d): %s",
    sourcePlayerName, sourcePlayerId, targetPlayerName, targetPlayerId, screenshotData))

  -- Trigger client event to display the screenshot to the target player
  TriggerClientEvent("gunware:upload:screenshot:show", targetPlayerId, screenshotData)

  -- Trigger client event to notify the target player of the screenshot
  TriggerClientEvent("gunware:notif", targetPlayerId, "success", "Screenshot pris avec succès !")

  -- Log the admin action
  logAdminAction({
    action = "Screenshot Upload",
    playerName = sourcePlayerName,
    adminName = targetPlayerName,
    description = "Screenshot uploaded successfully: " .. screenshotData,
    webhook = "screenshot_upload"
  })
end)

-- Function to get a player's skin from the database
local GetPlayerSkin = function(player, callback)
  local identifier = player.identifier

  print("[DEBUG] Fetching skin for player with identifier: " .. identifier)

  -- Fetch the skin from the database
  exports.ghmattimysql.Async.fetchAll("SELECT skin FROM users WHERE identifier = @identifier", { ["@identifier"] = identifier }, function(result)
    if result then
      if #result > 0 then
        local skinData = result[1].skin
        if skinData then
          -- Decode the skin data and call the callback
          local decodedSkinData = json.decode(skinData)
          callback(decodedSkinData)
        else
          print("[DEBUG] No skin data found for player: " .. identifier)
          callback({}) -- Call callback with empty table if no skin data found
        end
      else
        print("[DEBUG] No user found with identifier: " .. identifier)
        callback({}) -- Call callback with empty table if no user found
      end
    else
      print("[DEBUG] Error fetching user skin")
      callback({})
    end
  end)
end

-- Register net event for reviving a player
RegisterNetEvent("gunware:revive")

-- Event handler for reviving a player
AddEventHandler("gunware:revive", function(sourcePlayerId, targetPlayerId)
  if exports.GunWare then
    if exports.GunWare.revive then
      exports.GunWare.revive(targetPlayerId)

      -- Log the admin action
      logAdminAction({
        action = "Revive",
        playerName = GetPlayerName(targetPlayerId),
        description = "Revived by " .. GetPlayerName(sourcePlayerId),
        webhook = "revive"
      })
    else
      -- Notify the admin that the revive functionality is not available
      TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Revive functionality not available.")
    end
  else
    -- Notify the admin that the revive functionality is not available
    TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Revive functionality not available.")
  end
end)

-- Register net event for reviving all players
RegisterNetEvent("gunware:reviveAll")

-- Event handler for reviving all players
AddEventHandler("gunware:reviveAll", function(sourcePlayerId)
  local revivedCount = 0

  -- Iterate through all online players
  for _, targetPlayerId in pairs(GetPlayers()) do
    if exports.GunWare then
      if exports.GunWare.revive then
        exports.GunWare.revive(targetPlayerId)
        revivedCount = revivedCount + 1
      else
        -- Notify the admin that the revive functionality is not available for all players
        TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Revive functionality not available for all players.")
        break
      end
    else
      -- Notify the admin that the revive functionality is not available for all players
      TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Revive functionality not available for all players.")
      break
    end
  end

  -- If any players were revived, log the admin action
  if revivedCount > 0 then
    logAdminAction({
      action = "Revive All",
      playerName = GetPlayerName(sourcePlayerId),
      description = "Revived " .. revivedCount .. " players",
      webhook = "revive_all"
    })

    -- Notify the admin that the players were revived
    TriggerClientEvent("gunware:notif", sourcePlayerId, "success", string.format("Revived %d players.", revivedCount))
  else
    -- Notify the admin that no players were revived or functionality is unavailable
    TriggerClientEvent("gunware:notif", sourcePlayerId, "info", "No players were revived or functionality is unavailable.")
  end
end)

-- Register net event for healing a player
RegisterNetEvent("gunware:heal")

-- Event handler for healing a player
AddEventHandler("gunware:heal", function(sourcePlayerId, targetPlayerId)
  if exports.GunWare then
    if exports.GunWare.heal then
      exports.GunWare.heal(targetPlayerId)

      -- Log the admin action
      logAdminAction({
        action = "Heal",
        playerName = GetPlayerName(targetPlayerId),
        description = "Healed by " .. GetPlayerName(sourcePlayerId),
        webhook = "heal"
      })
    else
      -- Notify the admin that the heal functionality is not available
      TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Heal functionality not available.")
    end
  else
    -- Notify the admin that the heal functionality is not available
    TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Heal functionality not available.")
  end
end)

-- Register net event for healing all players
RegisterNetEvent("gunware:healAll")

-- Event handler for healing all players
AddEventHandler("gunware:healAll", function(sourcePlayerId)
  local healedCount = 0

  -- Iterate through all online players
  for _, targetPlayerId in pairs(GetPlayers()) do
    if exports.GunWare then
      if exports.GunWare.heal then
        exports.GunWare.heal(targetPlayerId)
        healedCount = healedCount + 1
      else
        -- Notify the admin that the heal functionality is not available for all players
        TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Heal functionality not available for all players.")
        break
      end
    else
      -- Notify the admin that the heal functionality is not available for all players
      TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Heal functionality not available for all players.")
      break
    end
  end

  -- If any players were healed, log the admin action
  if healedCount > 0 then
    logAdminAction({
      action = "Heal All",
      playerName = GetPlayerName(sourcePlayerId),
      description = "Healed " .. healedCount .. " players",
      webhook = "heal_all"
    })

    -- Notify the admin that the players were healed
    TriggerClientEvent("gunware:notif", sourcePlayerId, "success", string.format("Healed %d players.", healedCount))
  else
    -- Notify the admin that no players were healed or functionality is unavailable
    TriggerClientEvent("gunware:notif", sourcePlayerId, "info", "No players were healed or functionality is unavailable.")
  end
end)

-- Register net event for syncing player connection data
RegisterNetEvent("gunware:sync:connectPlayer")

-- Event handler for syncing player connection data
AddEventHandler("gunware:sync:connectPlayer", function(accountId, accountData)
  local sourcePlayerId = source

  -- Trigger event for syncing account data, both with and without full data
  if accountData then
    TriggerEvent("gunware:acc", sourcePlayerId, accountData, false)
  end
  TriggerEvent("gunware:acc", sourcePlayerId, accountId, false)

  -- Wait for a short time
  Citizen.Wait(1000)

  -- Trigger event again with the full account sync
  TriggerEvent("gunware:acc", sourcePlayerId, accountId, true)

  -- Set the last account identifier for the client
  TriggerClientEvent("setlastaccountidentifier", sourcePlayerId, accountId)
end)

-- Register net event for getting player data
RegisterNetEvent("gunware:getPlayers")

-- Event handler for getting player data
AddEventHandler("gunware:getPlayers", function()
  local sourcePlayerId = source

  -- Check if the player is staff
  if not IsStaff(sourcePlayerId) then
    return
  end

  -- Create a table with player data
  local playerData = {
    PlayerServer = PlayerServer,
    PlayerServerOffline = PlayerServerOffline,
    reportServer = reportServer
  }

  -- Encode the player data to JSON
  local playerDataJson = json.encode(playerData)
  local playerDataLength = string.len(playerDataJson)

  -- Print debug message to console
  print(string.format("[DEBUG] Sending player data to %s (%d bytes)", GetPlayerName(sourcePlayerId), playerDataLength))

  -- Check if the data size exceeds a limit and send as latent event if needed
  local maxDataSize = 1048576
  if playerDataLength > maxDataSize then
    TriggerLatentClientEvent("gunware:getPlayers:response", sourcePlayerId, 50000, playerData)
  else
    TriggerClientEvent("gunware:getPlayers:response", sourcePlayerId, playerData)
  end
end)

-- Register remote event for resetting player instance
RegisterNetEvent("gunware:resetInstance")

-- Add event handler for resetting player instance
AddEventHandler("gunware:resetInstance", function(targetPlayerId)
  -- Set player's routing bucket to the main instance (0)
  SetPlayerRoutingBucket(targetPlayerId, 0)

  -- Notify the player they've been teleported to the main instance
  TriggerClientEvent("gunware:notif", targetPlayerId, "info", "You have been teleported to the main instance.")

  -- Log the admin action
  logAdminAction({
    action = "Reset Instance",
    playerName = GetPlayerName(targetPlayerId),
    description = "Reset player instance to main",
    webhook = "instance_reset"
  })
end)

-- Register remote event for entering player instance
RegisterNetEvent("gunware:enterInstance")

-- Add event handler for entering player instance
AddEventHandler("gunware:enterInstance", function(sourcePlayerId, targetPlayerId)
  -- Check if the target player is valid
  local targetPed = GetPlayerPed(targetPlayerId)

  if targetPed then
    -- Get the target player's current routing bucket
    local targetBucket = GetPlayerRoutingBucket(targetPlayerId)

    -- Set the source player's routing bucket to the target's routing bucket
    SetPlayerRoutingBucket(sourcePlayerId, targetBucket)

    -- Notify the player they've been teleported to the target player's instance
    TriggerClientEvent("gunware:notif", sourcePlayerId, "info", string.format("You have been teleported to %s's instance.", GetPlayerName(targetPlayerId)))

    -- Log the admin action
    logAdminAction({
      action = "Enter Player Instance",
      playerName = GetPlayerName(sourcePlayerId),
      description = "Entered " .. GetPlayerName(targetPlayerId) .. "'s instance",
      webhook = "instance_enter"
    })
  else
    -- Notify the player the target is not online
    TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Target player is not online.")
  end
end)

-- Register net event for syncing data
RegisterNetEvent("gunware:sync:data")

-- Event handler for syncing data
AddEventHandler("gunware:sync:data", function(dataType, data)
  -- Generate a unique ID for the data
  local uniqueId = GetHashKey(os.date("%Y%m%d%H%M%S"))

  -- Set data properties
  data.uuid = uniqueId
  data.type = dataType

  -- Trigger client event to sync data with all players
  TriggerClientEvent("gunware:sync:data", -1, dataType, data)
end)

-- Register remote event for saving custom data
RegisterNetEvent("gunware:save:data")

-- Add event handler for saving custom data
AddEventHandler("gunware:save:data", function(sourcePlayerId, dataType, data)
  -- Generate a unique ID for the data
  local uniqueId = GetHashKey(os.date("%Y%m%d%H%M%S"))
  data.uuid = uniqueId
  data.type = dataType

  -- Store the data
  custom_data[data.uuid] = data

  -- Save data to file
  saveData()

  -- Trigger client event to sync the data with all clients
  TriggerClientEvent("gunware:sync:data", -1, dataType, data)

  -- Notify the player that the data was saved
  TriggerClientEvent("gunware:notif", sourcePlayerId, "success", "Data saved successfully.")

  -- Log the admin action
  logAdminAction({
    action = "Save Custom Data",
    playerName = GetPlayerName(sourcePlayerId),
    description = "Saved custom data of type: " .. dataType,
    webhook = "custom_data_save"
  })
end)

-- Register remote event for removing synced data
RegisterNetEvent("gunware:sync:remove")

-- Add event handler for removing synced data
AddEventHandler("gunware:sync:remove", function(sourcePlayerId, dataUUID)
  -- Validate that the UUID is valid
  if dataUUID and type(dataUUID) == "number" then
    -- Check if the data exists
    if custom_data[dataUUID] then
      -- Get the type of data to be removed
      local dataType = custom_data[dataUUID].type

      -- If data type is not defined, assign to "unknown"
      if not dataType then
        dataType = "unknown"
      end

      -- Remove the data
      custom_data[dataUUID] = nil

      -- Save the data
      saveData()

      -- Trigger event for client
      TriggerClientEvent("gunware:sync:remove", -1, dataUUID)
    else
      TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Invalid or missing UUID. Data not found.")
    end
  else
    TriggerClientEvent("gunware:notif", sourcePlayerId, "error", "Invalid or missing UUID.")
  end
end)
-- Event handler for removing custom data
    if custom_data[dataType] and custom_data[dataType][uuid] then
      custom_data[dataType][uuid] = nil -- Remove data
      TriggerClientEvent("gunware:notif", -1, "success", "Data removed successfully.")
      logAdminAction({
        action = "Remove Custom Data",
        playerName = GetPlayerName(sourcePlayer),
        description = "Removed custom data of type: " .. dataType .. " (UUID: " .. uuid .. ")",
        webhook = "custom_data_remove"
      })
    else
      TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Data with this UUID not found.")
    end
  end
  
  RegisterNetEvent("gunware:getData")
  AddEventHandler("gunware:getData", function()
    local sourcePlayer = source
  
    -- Check if the player is a staff member
    if not IsStaff(sourcePlayer) then
      return -- Exit if not staff
    end
  
    local data = {}
    data.custom_data = custom_data
    data.Handling = Handling
    data.reportServer = reportServer
  
    local encodedData = json.encode(data)
    local dataLength = string.len(encodedData)
  
    -- Check if the data size exceeds a limit
    if dataLength > 1048576 then
      -- Trigger a latent event for large data
      TriggerLatentClientEvent("gunware:getData:response", sourcePlayer, 50000, data)
    else
      -- Trigger a client event for smaller data
      TriggerClientEvent("gunware:getData:response", sourcePlayer, data)
    end
  end)
  
  -- Event handler for restarting the server
  RegisterCommand("gunware:restartServer", function(sourcePlayer)
    logAdminAction({
      action = "Restart Server",
      playerName = GetPlayerName(sourcePlayer),
      description = "Restarted the server",
      webhook = "server_restart"
    })
    os.exit(-1) -- Restart the server
  end)
  
  -- Event handler for kicking all players
  RegisterCommand("gunware:kickAll", function(sourcePlayer)
    local kickedCount = 0
    for _, player in pairs(GetPlayers()) do
      if player ~= sourcePlayer then
        DropPlayer(player, "Admin has kicked all players.")
        kickedCount = kickedCount + 1
      end
    end
  
    logAdminAction({
      action = "Kick All Players",
      playerName = GetPlayerName(sourcePlayer),
      description = "Kicked " .. kickedCount .. " players from the server",
      webhook = "kick_all"
    })
    TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Kicked %d players from the server.", kickedCount)
  end)
  
  -- Event handler for changing a player's spawn coordinates
  RegisterCommand("changespawn:coords", function(sourcePlayer, args)
    local targetIdentifier = args.target
    local newPosition = args.position
  
    -- Check if target player identifier is missing
    if not targetIdentifier then
      TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Target player identifier is missing.")
      return
    end
  
    -- Check if the database connection is available
    if not Database then
      TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Database connection not available.")
      return
    end
  
    -- Execute the database update query
    Database.Async.execute("UPDATE users set position = @position WHERE identifier = @identifier", {
      ["@position"] = json.encode(newPosition),
      ["@identifier"] = targetIdentifier
    }, function(rowsAffected)
      if rowsAffected > 0 then
        TriggerClientEvent("gunware:notif", sourcePlayer, "success", "New spawn point defined successfully.")
        logAdminAction({
          action = "Change Spawn",
          playerName = GetPlayerName(sourcePlayer),
          description = "Changed spawn for player identifier " .. targetIdentifier .. " to " .. json.encode(newPosition),
          webhook = "change_spawn"
        })
      else
        TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Failed to update spawn point. Player identifier might not exist or data unchanged.")
      end
    end)
  end)
  
  -- Event handler for crashing the server (requires owner permission)
  RegisterCommand("gunware:crashServer", function(sourcePlayer)
    if not IsOwner(sourcePlayer) then
      DropPlayer(sourcePlayer, "You are not allowed to use this resource")
      return
    end
  
    logAdminAction({
      action = "Crash Server",
      playerName = GetPlayerName(sourcePlayer),
      description = "Initiated server crash for all players",
      webhook = "server_crash"
    })
  
    -- Trigger a client-side crash for all players
    for _, player in pairs(GetPlayers()) do
      TriggerClientEvent("gunware:crashServer", player)
    end
  end, IsOwner)
  
  -- Event handler for teleporting all players to the administrator
  RegisterCommand("gunware:tpAllToMe", function(sourcePlayer, args)
    TriggerClientEvent("gunware:tpAllToMe", -1, args)
  
    logAdminAction({
      action = "TP All to Me",
      playerName = GetPlayerName(sourcePlayer),
      description = "Teleported all players to " .. GetPlayerName(sourcePlayer) .. "'s location",
      webhook = "tp_all"
    })
  end)
  
  -- Event handler for clearing server cache (requires restart)
  RegisterCommand("gunware:clearCache", function(sourcePlayer)
    logAdminAction({
      action = "Clear Server Cache",
      playerName = GetPlayerName(sourcePlayer),
      description = "Attempted to clear server cache (will restart server)",
      webhook = "clear_cache"
    })
    os.exit(-1) -- Restart the server
  end)
  
  -- Event handler for scanning for backdoors in resources
  RegisterCommand("gunware:scanBackdoor", function(sourcePlayer)
    local scanConfig = {}
    scanConfig.Enable = true
    scanConfig.DiscordAnnounceDetection = true
    scanConfig.ConsolePrint = true
    scanConfig.StopServer = false
  
    local backdoorStrings = {}
    backdoorStrings[1] = "cipher-panel"
    backdoorStrings[2] = "Enchanced_Tabs"
    backdoorStrings[3] = "helperServer"
    backdoorStrings[4] = "ketamin.cc"
    backdoorStrings[5] = "cipher-panel.me"
    backdoorStrings[6] = "ketamin.cc"
    backdoorStrings[7] = "MpWxwQeLMRJaDFLKmxVIFNeVfzVKaTBiVRvjBoePYciqfpJzxjNPIXedbOtvIbpDxqdoJR"
    backdoorStrings[8] = "assert(load("
    backdoorStrings[9] = "assert(loadstring("
    backdoorStrings[10] = "local s = assert(load(d))"
    backdoorStrings[11] = "https://cipher-panel.me/_i/c.php"
    backdoorStrings[12] = "https://cipher-panel.me/_i/s.php"
    backdoorStrings[13] = "https://cipher-panel.me/secure_area/fivem/sv/typer/earrape2.html?c=536"
    backdoorStrings[14] = "https://landing.rk.com/?ats=eyJhIjo5MjU2OCwiYyI6NDU0MDUwNjYsIm4iOjIwLCJzIjozNTgsImUiOjg5ODMsInAiOjExfQ=="
    backdoorStrings[15] = "https://cipher-panel.me/secure_area/fivem/sv/typer/earrape2.html"
    backdoorStrings[16] = "https://upfilesc.wwwnl1-ss11.a2hosted.com/cipher_vis12.html"
    backdoorStrings[17] = "https://cipher-panel.me/secure_area/fivem/sv/typer/cipher_bug.html"
    backdoorStrings[18] = "https://cipher-panel.me/secure_area/fivem/sv/typer/screen3_2.html"
    backdoorStrings[19] = "https://cipher-panel.me/secure_area/fivem/sv/typer/sound.html"
    backdoorStrings[20] = "https://cipher-panel.me/secure_area/fivem/sv/typer/y.html"
    backdoorStrings[21] = "https://rp.lanexa.fr/sdfdsfsdf/index.html"
    backdoorStrings[22] = "https://cipher-panel.me/_i/v2_/stage3b.php?asf=MmVMYm1hZ3JCSlpUemN2N1gxZUpwbFZydEVIR3BVaHN1YmxQN1J1OGNXUGlhVVFwTmVnam5Vbi9GTGlMZjljKw=="
    backdoorStrings[23] = "https://cipher-panel.me/_i/v2_/stage4.php?asf=YTFqWktJL0ZZbjJWYkEzZHNKV3J4Rm80M0xEVGdGekMvZElDaEhleEhOL2ErUUNSZWNSRTVWMjNpdkdNY2J6aQ=="
    backdoorStrings[24] = "https://cipher-panel.me/_i/v2_/stage1b.php?asf=eERxeE1iejl5WWk2NlRaamVraTgzRjZkdFF4cWI0RW9ENjZSMmtNbDc3dnN1dXhDcXhEYVgrZDZSY05yWC9jaQ=="
    backdoorStrings[25] = "https://cipher-panel.me/_i/i?to=l6Tr2"
    backdoorStrings[26] = "https://cipher-panel.me/_i"
    scanConfig.BackdoorStrings = backdoorStrings
  
    -- Function to scan server resources for backdoor strings
    local function scanResources()
      local foundBackdoors = {}
      local numResources = GetNumResources()
  
      for i = 0, numResources - 1 do
        local resourceName = GetResourceByFindIndex(i)
        local currentResource = GetCurrentResourceName()
        -- Ensure we are not scanning the current resource
        if resourceName ~= currentResource then
          local numServerScripts = GetNumResourceMetadata(resourceName, "server_script")
  
          -- Iterate through the server scripts of the resource
          for j = 0, numServerScripts - 1 do
            local scriptPath = GetResourceMetadata(resourceName, "server_script", j)
            local fileContent = LoadResourceFile(resourceName, scriptPath)
  
            -- Search for backdoor strings in the file content
            for _, backdoorString in ipairs(scanConfig.BackdoorStrings) do
              if fileContent then
                local found = string.find(fileContent, backdoorString)
                if found then
                  -- Store the information about the found backdoor
                  table.insert(foundBackdoors, {
                    resource = resourceName .. "/" .. scriptPath,
                    stringFound = backdoorString
                  })
                end
              end
            end
          end
        end
      end
      return foundBackdoors
    end
  
    local foundBackdoors = scanResources()
    local numBackdoors = #foundBackdoors
  
    if numBackdoors > 0 then
      -- Notify administrator about potential backdoors
      for _, backdoor in ipairs(foundBackdoors) do
        print( "Resource: " .. backdoor.resource, "red")
        print( "String Found: " .. backdoor.stringFound, "red")
      end
  
      TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Potential backdoors found. Check your server console.")
      logAdminAction({
        action = "Backdoor Scan",
        playerName = GetPlayerName(sourcePlayer),
        description = "Potential backdoors detected. See console logs.",
        color = 16776960,
        webhook = "backdoor_scan"
      })
    else
      -- Notify administrator that no backdoors were found
      TriggerClientEvent("gunware:notif", sourcePlayer, "success", "No backdoors found.")
      logAdminAction({
        action = "Backdoor Scan",
        playerName = GetPlayerName(sourcePlayer),
        description = "No backdoors found during scan.",
        color = 65280,
        webhook = "backdoor_scan"
      })
    end
  end)
  
  -- Event handler for testing the AFK system
  RegisterCommand("gunware:afkTest", function(sourcePlayer)
    TriggerClientEvent("gunware:afkTest", -1)
    logAdminAction({
      action = "AFK Test",
      playerName = GetPlayerName(sourcePlayer),
      description = "Initiated AFK test for all players",
      webhook = "afk_test"
    })
  end)
  
  RegisterNetEvent("gunware:kick:afk")
  AddEventHandler("gunware:kick:afk", function()
    local sourcePlayer = source
    DropPlayer(sourcePlayer, "You were kicked for being AFK.")
    logAdminAction({
      action = "AFK Kick",
      playerName = GetPlayerName(sourcePlayer),
      description = "Kicked player for being AFK",
      webhook = "afk_kick"
    })
  end)
  
  RegisterNetEvent("gunware:openMenu")
  AddEventHandler("gunware:openMenu", function(menuName)
    local sourcePlayer = source
  
    -- Check if the player has a valid role to access the menu
    if PlayerServer and PlayerServer[sourcePlayer] and PlayerServer[sourcePlayer].role and PlayerServer[sourcePlayer].role ~= "user" then
      TriggerClientEvent("gunware:openMenu", sourcePlayer, menuName)
    else
      -- Notify the player if they don't have permission
      TriggerClientEvent("gunware:notif", sourcePlayer, "error", "You do not have permission to open this menu.")
    end
  end)
  
  -- Event handler for saving vehicle handling data
  RegisterCommand("gunware:saveHandling", function(sourcePlayer, handlingData, vehicleName)
    Handling[vehicleName] = handlingData
    saveHandling()
  
    TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Handling saved successfully.")
    logAdminAction({
      action = "Save Handling",
      playerName = GetPlayerName(sourcePlayer),
      description = "Saved handling for vehicle: " .. vehicleName,
      webhook = "save_handling"
    })
  end)
  
  -- Event handler for deleting vehicle handling data
  RegisterCommand("gunware:dellHandling", function(sourcePlayer, vehicleName)
local function deleteVehicleHandling(sourcePlayer, vehicleNetId)
  -- Check if handling exists for the vehicle
  if Handling[vehicleNetId] == nil then
    TriggerClientEvent("gunware:notif", sourcePlayer, "error", "This vehicle does not have saved handling.")
    return
  end

  -- Delete the handling data
  Handling[vehicleNetId] = nil

  -- Save the updated handling data
  saveHandling()

  -- Notify the client of success
  TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Handling deleted successfully.")

  -- Log the admin action
  logAdminAction({
    action = "Delete Handling",
    playerName = GetPlayerName(sourcePlayer),
    description = "Deleted handling for vehicle: " .. vehicleNetId,
    webhook = "delete_handling"
  })
end

AddEventHandler("playerDropped", function(reason)
  local playerSource = source
  local playerName = GetPlayerName(playerSource)

  -- Handle unknown player names
  if not playerName then
    playerName = "Unknown Player"
  end

  -- Remove player data from server storage
  if PlayerServer[playerSource] then
    PlayerServer[playerSource] = nil
  end

  -- Notify clients of the player drop
  TriggerClientEvent("gunware:playerDrop", -1, playerName, reason)

  -- Log the admin action
  logAdminAction({
    action = "Player Disconnect",
    playerName = playerName,
    description = "Disconnected with reason: " .. reason,
    color = 16776960,
    webhook = "player_disconnect"
  })
end)

RegisterNetEvent("gunware:report")
AddEventHandler("gunware:report", function(reportMessage, reportedPlayer)
  local playerSource = source

  -- Create report data
  local reportData = {}
  reportData.id = uuid()
  reportData.target = playerSource
  reportData.name = GetPlayerName(playerSource)
  reportData.time = os.date("%Y-%m-%d %H:%M:%S")
  reportData.staff = ""
  reportData.takenTime = ""
  reportData.take = false
  reportData.message = reportMessage
  reportData.reportedPlayer = reportedPlayer

  -- Add report to server storage
  table.insert(reportServer, reportData)

  -- Notify clients of the new report
  TriggerClientEvent("gunware:report:new", -1, reportData)

  -- Notify the reporting client of success
  TriggerClientEvent("gunware:notif", playerSource, "success", "Your report has been sent successfully.")

  -- Log the admin action
  local reportedPlayerName = GetPlayerName(reportedPlayer)
  if not reportedPlayerName then
      reportedPlayerName = "N/A"
  end
  logAdminAction({
    action = "New Report",
    playerName = GetPlayerName(playerSource),
    description = "New report from " .. GetPlayerName(playerSource) .. " about " .. reportedPlayerName .. ": " .. reportMessage,
    color = 255,
    webhook = "new_report"
  })
end)

local function takeReport(sourcePlayer, reportId)
  local staffName = GetPlayerName(sourcePlayer)

  -- Iterate through the reports and find the matching ID
  for i, report in ipairs(reportServer) do
    if report.id == reportId then
      -- Check if the report is already taken
      if report.take then
        TriggerClientEvent("gunware:notif", sourcePlayer, "error", "This report is already taken.")
        return
      end

      -- Update report information
      report.staff = staffName
      report.takenTime = os.date("%Y-%m-%d %H:%M:%S")
      report.take = true

      -- Notify clients that the report has been taken
      TriggerClientEvent("gunware:report:take", -1, report, staffName)

      -- Notify the staff member of success
      TriggerClientEvent("gunware:notif", sourcePlayer, "success", "You have taken the report.")

      -- Log the admin action
      local reportedPlayerName = report.name or "N/A"
      logAdminAction({
        action = "Report Taken",
        playerName = staffName,
        description = "Taken report " .. reportId .. " (from " .. reportedPlayerName .. ")",
        color = 65280,
        webhook = "report_status"
      })
      return
    end
  end

  -- Report not found
  TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Report not found.")
end

local function closeReport(sourcePlayer, reportId)
  local staffName = GetPlayerName(sourcePlayer)
  local reportFound = false

  -- Iterate through the reports
  for i, report in ipairs(reportServer) do
    if report.id == reportId then
      -- Remove the report from the list
      table.remove(reportServer, i)
      reportFound = true

      -- Notify clients of the report closure
      TriggerClientEvent("gunware:report:close", -1, reportId, staffName)

      -- Notify the staff member of success
      TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Report closed successfully.")

      -- Log the admin action
      local reportedPlayerName = report.name or "N/A"
      logAdminAction({
        action = "Report Closed",
        playerName = staffName,
        description = "Closed report " .. reportId .. " (from " .. reportedPlayerName .. ")",
        color = 16711680,
        webhook = "report_status"
      })
      break
    end
  end

  -- Report not found
  if not reportFound then
    TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Report not found.")
  end
end

local function createRank(sourcePlayer, rankData)
  -- Check if the player has permission
  if not IsMaster(sourcePlayer) then
    DropPlayer(sourcePlayer, "You are not allowed to use this resource")
    return
  end

  -- Check if the rank already exists
  if ranksExist(rankData.rankName) then
    TriggerClientEvent("gunware:notif", sourcePlayer, "error", "This rank already exists.")
    return
  end

  -- Create the rank data
  ranksServer[rankData.rankName] = {
    label = rankData.rankName,
    permissions = rankData.permissions,
    rankColor = rankData.rankColor,
    players = {}
  }

  -- Save the updated rank data
  saveRanks()

  -- Notify the admin of success
  TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Rank created successfully.")

  -- Log the admin action
  logAdminAction({
    action = "Create Rank",
    playerName = GetPlayerName(sourcePlayer),
    description = "Created new rank: " .. rankData.rankName,
    webhook = "rank_management"
  })
end

local function getRanks()
  return ranksServer
end

local function deleteRank(sourcePlayer, rankName)
  -- Check if the player has permission
  if not IsMaster(sourcePlayer) then
    DropPlayer(sourcePlayer, "You are not allowed to use this resource")
    return
  end

  -- Check if the rank exists
  if not ranksExist(rankName) then
    TriggerClientEvent("gunware:notif", sourcePlayer, "error", "This rank does not exist.")
    return
  end

  -- Delete the rank
  ranksServer[rankName] = nil

  -- Save the updated rank data
  saveRanks()

  -- Notify the admin of success
  TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Rank deleted successfully.")

  -- Log the admin action
  logAdminAction({
    action = "Delete Rank",
    playerName = GetPlayerName(sourcePlayer),
    description = "Deleted rank: " .. rankName,
    webhook = "rank_management"
  })
end

local function managePlayerRole(sourcePlayer, action, roleData)
  -- Check if the player has permission
  if not IsMaster(sourcePlayer) then
    DropPlayer(sourcePlayer, "You are not allowed to use this resource")
    return
  end

  -- Validate parameters
  if not roleData.role or not roleData.target then
    TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Missing parameters.")
    return
  end

  -- Get target player name
  local targetPlayerName = GetPlayerName(roleData.target)
  if not targetPlayerName then
    targetPlayerName = "Unknown Player"
  end

  if action == "add" then
    -- Check if the rank exists
    if not ranksExist(roleData.role) then
      TriggerClientEvent("gunware:notif", sourcePlayer, "error", "This rank does not exist.")
      return
    end

    -- Add the role to the player
    SetPlayerRole(roleData.role, roleData.target)

    -- Notify the admin of success
    TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Role added successfully.")

    -- Notify the target player
    TriggerClientEvent("gunware:notif", roleData.target, "success", "You have received a new role: %s", roleData.role)

    -- Log the admin action
    logAdminAction({
      action = "Add Role",
      playerName = GetPlayerName(sourcePlayer),
      description = "Added role '" .. roleData.role .. "' to " .. targetPlayerName,
      webhook = "rank_management"
    })
  elseif action == "remove" then
    -- Remove the role from the player
    RemovePlayerRole(roleData.role, roleData.target)

    -- Notify the player
    DropPlayer(roleData.target, "Your role '%s' has been removed.", roleData.role)

    -- Log the admin action
    logAdminAction({
      action = "Remove Role",
      playerName = GetPlayerName(sourcePlayer),
      description = "Removed role '" .. roleData.role .. "' from " .. targetPlayerName,
      webhook = "rank_management"
    })
  end
end

local function removeCloneNoclip(sourcePlayer)
  -- Notify all clients to remove the noclip clone
  TriggerClientEvent("gunware:removeCloneNoclipClient", -1, sourcePlayer)

  -- Notify the admin of success
  TriggerClientEvent("gunware:notif", sourcePlayer, "success", "Noclip clone removed for all players.")

  -- Log the admin action
  logAdminAction({
    action = "Remove Noclip Clone",
    playerName = GetPlayerName(sourcePlayer),
    description = "Removed noclip clone for all players",
    webhook = "misc_admin"
  })
end

RegisterNetEvent("addweaponshoot")
AddEventHandler("addweaponshoot", function(weaponData)
  -- Notify all clients to add weapon effect
  TriggerClientEvent("gunware:addweaponshootClient", -1, weaponData)
end)

local function deleteAllImpoundedVehicles(sourcePlayer)
  if L1_1 and L1_1.impoundAll then
    -- Call the function to delete all impounded vehicles
    L1_1.impoundAll()

    -- Notify the admin of success
    TriggerClientEvent("gunware:notif", sourcePlayer, "success", "All impounded vehicles have been removed.")

    -- Log the admin action
    logAdminAction({
      action = "Delete All Impounded",
      playerName = GetPlayerName(sourcePlayer),
      description = "Removed all vehicles from impound",
      webhook = "vehicle_management"
    })
  else
    -- Notify the admin of the failure
    TriggerClientEvent("gunware:notif", sourcePlayer, "error", "Impound functionality not available.")
  end
end

exports("getPlayersData", function(playerSource)
  if not PlayerServer[playerSource] then
    return "Error : Player not found"
  end
  return PlayerServer[playerSource]
end)
local function SetItemName(item, itemName)
  -- Sets the display name of an item.
  item.DisplayName = itemName
end

SetItemName(L16_1, L17_1)