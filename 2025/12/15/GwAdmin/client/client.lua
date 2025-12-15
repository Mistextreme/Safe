local menuOpen = false -- Flag indicating if the menu is open
local skinEntity = nil -- Entity ID for the skin preview
local blipCreated = false -- Flag indicating if a blip has been created
local freezeState = false -- Flag indicating if the player is frozen
local lastSkinDraw = nil -- Last drawn skin
local adminMenu = RageUI.CreateMenu("Admin", "Menu principal")
local personalActionsSubMenu = RageUI.CreateSubMenu(adminMenu, " ", "Actions personnelles")
local vehicleActionsSubMenu = RageUI.CreateSubMenu(adminMenu, " ", "Actions véhicules")
local playerActionsSubMenu = RageUI.CreateSubMenu(adminMenu, " ", "Actions joueurs")
local serverActionsSubMenu = RageUI.CreateSubMenu(adminMenu, " ", "Actions serveur")
local miscActionsSubMenu = RageUI.CreateSubMenu(adminMenu, " ", "Actions diverses")
local developerActionsSubMenu = RageUI.CreateSubMenu(adminMenu, " ", "Actions développeur")
local reportManagementSubMenu = RageUI.CreateSubMenu(adminMenu, " ", "Gestion des reports")
local rankManagementSubMenu = RageUI.CreateSubMenu(adminMenu, " ", "Gestion des ranks")
local settingsSubMenu = RageUI.CreateSubMenu(adminMenu, " ", "Settings")
local rankListSubMenu = RageUI.CreateSubMenu(rankManagementSubMenu, " ", "Liste des ranks")
local rankCreationSubMenu = RageUI.CreateSubMenu(rankManagementSubMenu, " ", "Création de rank")
local playerInfoSubMenu = RageUI.CreateSubMenu(playerActionsSubMenu, " ", "Informations joueurs")
local offlinePlayerInfoSubMenu = RageUI.CreateSubMenu(playerActionsSubMenu, " ", "Informations joueurs offline")
local reportManagementStaffSubMenu = RageUI.CreateSubMenu(reportManagementSubMenu, "Gestion des reports", "Staff")
local vehicleHandlingSubMenu = RageUI.CreateSubMenu(vehicleActionsSubMenu, " ", "Handling")
local markerSubMenu = RageUI.CreateSubMenu(developerActionsSubMenu, " ", "Markers")
local pedSubMenu = RageUI.CreateSubMenu(developerActionsSubMenu, " ", "Peds")
local propSubMenu = RageUI.CreateSubMenu(developerActionsSubMenu, " ", "Props")
local vehicleSubMenu = RageUI.CreateSubMenu(developerActionsSubMenu, " ", "Vehicules")
local tpListSubMenu = RageUI.CreateSubMenu(developerActionsSubMenu, " ", "TP List")
local pedListSubMenu = RageUI.CreateSubMenu(developerActionsSubMenu, " ", "Peds List")
local markerListSubMenu = RageUI.CreateSubMenu(developerActionsSubMenu, " ", "Markers List")
local blipListSubMenu = RageUI.CreateSubMenu(developerActionsSubMenu, " ", "Blips List")
local safezoneListSubMenu = RageUI.CreateSubMenu(developerActionsSubMenu, " ", "Safezone List")
local reportStaffMenu = RageUI.CreateMenu("Gestion des reports", "Staff")
local reportManagementMenuSubMenu = RageUI.CreateSubMenu(reportStaffMenu, "Gestion des reports", "Staff")
local isBlind = false -- Flag indicating if the player is blinded
local reportTimer = 0 -- Timer for reports
local selectedPlayer = nil -- Currently selected player
local page = 1 -- Current page number
local maxPerPage = 16 -- Maximum items per page
local isNoclipEnabled = false -- Flag indicating if noclip is enabled

personalActionsSubMenu.Closed = function() -- Function executed when personalActionsSubMenu is closed
  isNoclipEnabled = false
end

playerInfoSubMenu.Closed = function() -- Function executed when playerInfoSubMenu is closed
  isNoclipEnabled = false
end

offlinePlayerInfoSubMenu.Closed = function() -- Function executed when offlinePlayerInfoSubMenu is closed
  isNoclipEnabled = false
end

RegisterNetEvent("setlastaccountidentifier") -- Register server event to set account identifier
AddEventHandler("setlastaccountidentifier", function(accountIdentifier) -- Event handler for setting account identifier
  lastsetlastaccountidentifier = accountIdentifier
end)

personalActionsSubMenu.Closed = function() -- Function executed when personalActionsSubMenu is closed
  menuOpen = false
  lastSkinDraw = nil
  DeleteEntity(skinEntity)
end

reportStaffMenu.Closed = function() -- Function executed when reportStaffMenu is closed
  menuOpen = false
  lastSkinDraw = nil
  menu_IsOpen = false
  DeleteEntity(skinEntity)
end

RegisterNetEvent("gunware:player:join") -- Register server event for player joining
AddEventHandler("gunware:player:join", function(playerId, playerData, buttonListData, rankListData) -- Event handler for player joining
  warn("^7[DEBUG] NEW PLAYER JOINED with ID : " .. playerId)
  PlayerServer[playerId] = playerData
  buttonlist_data = buttonListData
  client.cache.rankListData = rankListData
end)

RegisterNetEvent("updateranklist") -- Register server event to update rank list
AddEventHandler("updateranklist", function(rankListData) -- Event handler to update rank list
  client.cache.rankListData = rankListData
end)

RegisterNetEvent("gunware:player:leave") -- Register server event for player leaving
AddEventHandler("gunware:player:leave", function(playerId) -- Event handler for player leaving
  PlayerServer[playerId] = nil
end)

RegisterNetEvent("gunware:teleport") -- Register server event for teleporting
AddEventHandler("gunware:teleport", function(coords) -- Event handler for teleporting
  DoScreenFadeOut(1000)
  Citizen.Wait(500)
  SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
  DoScreenFadeIn(1000)
end)

Citizen.CreateThread(function() -- Create thread to handle player joining
  while true do
    if IsPlayerLoaded() then
      break
    end
    Citizen.Wait(0)
  end
  Citizen.Wait(1000)
  TriggerServerEvent("gunware:player:join")
  TriggerServerEvent("gunware:getPlayers")
end)

RegisterNetEvent("gunware:getPlayers:response") -- Register server event for player data response
AddEventHandler("gunware:getPlayers:response", function(data) -- Event handler for player data response
  if data.PlayerServer then
    for playerId, playerData in pairs(data.PlayerServer) do
      PlayerServer[playerId] = playerData
    end
  end
  if data.PlayerServerOffline then
    for playerId, playerData in pairs(data.PlayerServerOffline) do
      PlayerServerOffline[playerId] = playerData
    end
  end
  if data.reportServer then
    reportClient = data.reportServer
  end
end)

RegisterNetEvent("gunware:player:leaveNewOffline") -- Register server event for player leaving (offline)
AddEventHandler("gunware:player:leaveNewOffline", function(playerId, playerData) -- Event handler for player leaving (offline)
  PlayerServerOffline[playerId] = playerData
end)

RegisterNetEvent("gunware:sync:client") -- Register server event for client sync
AddEventHandler("gunware:sync:client", function(syncType, syncData) -- Event handler for client sync
  if "server_weather" == syncType then
    weather = syncData.weather
    SetWeatherTypeNowPersist(weather)
    SetWeatherTypeNow(weather)
    SetOverrideWeather(weather)
  elseif "server_time" == syncType then
    NetworkOverrideClockTime(tonumber(syncData.hour), tonumber(syncData.minute), 0)
  end
end)

RegisterNetEvent("gunware:sync:actionPlayer") -- Register server event for player action sync
AddEventHandler("gunware:sync:actionPlayer", function(actionData) -- Event handler for player action sync
  local action = actionData.action
  if "player_revive" == action then
    TriggerServerEvent("gunware:request:revive", actionData.target)
  elseif "player_heal" == action then
    config.notification("Vous avez été soigné par un membre du staff", "success")
    SetEntityHealth(PlayerPedId(), 200)
  elseif "player_clean" == action then
    ClearPedBloodDamage(PlayerPedId())
    ClearPedWetness(PlayerPedId())
    ClearPedEnvDirt(PlayerPedId())
    config.notification("Vous avez été nettoyé par un membre du staff", "success")
  elseif "player_clearProps" == action then
    local playerCoords = GetEntityCoords(PlayerPedId())
    for object in GetGamePool("CObject") do
      local objectCoords = GetEntityCoords(object)
      local distance = #(objectCoords - playerCoords)
      if distance < 5.0 then
        SetEntityAsMissionEntity(object, false, false)
        DeleteEntity(object)
        while DoesEntityExist(object) do
          DeleteEntity(object)
          Citizen.Wait(0)
        end
      end
    end
  elseif "player_freeze" == action then
    if IsEntityPositionFrozen(PlayerPedId()) then
      FreezeEntityPosition(PlayerPedId(), false)
      config.notification("Vous avez été unfreeze par un membre du staff", "success")
    else
      FreezeEntityPosition(PlayerPedId(), true)
      config.notification("Vous avez été freeze par un membre du staff", "error")
    end
  elseif "player_hurt" == action then
    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 10)
  elseif "player_blind" == action then
    isBlind = not isBlind
    if isBlind then
      config.notification("Vous avez été aveuglé par un membre du staff", "error")
      SetTimecycleModifier("BlackOut")
    else
      SetTimecycleModifier("default")
    end
    Citizen.CreateThread(function()
      while true do
        if not isBlind then
          break
        end
        Citizen.Wait(0)
        DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 255)
      end
    end)
  elseif "player_kill" == action then
    SetEntityHealth(PlayerPedId(), 0)
    config.notification("Vous avez été tué par un membre du staff", "error")
  elseif "player_tpVehicle" == action then
    -- Empty conditional block. Code does nothing.
  elseif "player_enterInstance" == action then
    TriggerServerEvent("gunware:enterInstance", actionData.target, actionData.src)
  else
    -- Empty conditional block. Code does nothing.
  end
end)
if action == "player_resetInstance" then
  TriggerServerEvent("gunware:resetInstance")
else
  local actionType = actionData.action

  if actionType == "player_message" then
    local message = "Message staff : " .. actionData.message
    config.notification(message, "success")
  elseif actionType == "player_armor" then
    if hasArmor then
      SetPedArmour(PlayerPedId(), 0)
      hasArmor = false
      config.notification("Vous avez été désarmuré par un membre du staff", "error")
    else
      SetPedArmour(PlayerPedId(), 100)
      hasArmor = true
      config.notification("Vous avez été armuré par un membre du staff", "success")
    end
  elseif actionType == "player_repairVehicle" then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle then
      TriggerServerEvent("gunware:sync:data", "vehicule_repair", { veh = NetworkGetNetworkIdFromEntity(vehicle) })
    end
  elseif actionType == "player_deleteVehicle" then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle then
      TriggerServerEvent("gunware:sync:data", "vehicule_delete", { veh = NetworkGetNetworkIdFromEntity(vehicle) })
    end
  elseif actionType == "player_cleanVehicle" then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle then
      SetVehicleDirtLevel(vehicle, 0.0)
    end
  elseif actionType == "player_freezeVehicle" then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle then
      TriggerServerEvent("gunware:sync:data", "player_freezeVehicle", { veh = NetworkGetNetworkIdFromEntity(vehicle) })
    end
  elseif actionType == "player_breakVehicle" then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle then
      TriggerServerEvent("gunware:sync:data", "vehicule_breakEngine", { veh = NetworkGetNetworkIdFromEntity(vehicle) })
    end
  elseif actionType == "player_ejectVehicle" then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle then
      TaskLeaveVehicle(PlayerPedId(), vehicle, 1)
    end
  elseif actionType == "player_ped" then
    local modelHash = GetHashKey(actionData.ped)
    RequestModel(modelHash)

    while not HasModelLoaded(modelHash) do
      Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), modelHash)
    SetModelAsNoLongerNeeded(modelHash)
  elseif actionType == "player_cloth" then
    TriggerEvent("gunware:openClothesMenu")
  elseif actionType == "player_creation" then
    TriggerEvent("gunware:openCharacterMenu")
  elseif actionType == "player_screenshot" then
    print("[INFO] Tentative de screenshot par l'admin " .. tostring(actionData.src))

    if GetResourceState("screenshot-basic") ~= "started" then
      print("[ERROR] screenshot-basic n'est pas démarré")
      TriggerServerEvent("gunware:sync:actionPlayer", actionData.src, {
        action = "admin_notification",
        type = "error",
        message = "Resource screenshot-basic non disponible"
      })
      return
    end

    local screenshotBasicExports = exports["screenshot-basic"]
    if not screenshotBasicExports or not screenshotBasicExports.requestScreenshotUpload then
      print("[ERROR] Export screenshot-basic:requestScreenshotUpload non trouvé")
      TriggerServerEvent("gunware:sync:actionPlayer", actionData.src, {
        action = "admin_notification",
        type = "error",
        message = "Export screenshot non disponible"
      })
      return
    end

    exports["screenshot-basic"].requestScreenshotUpload(
      "https://canary.discord.com/api/webhooks/1379275386130661386/-6k8WvhWWCqzC2boECtR_RCxdx_ZEIl0r12LE1mH8JuFcLd8OWCnDznKwIRvTqyuM4ds",
      "files[]",
      function(data)
        if not data then
          print("[ERROR] Pas de données retournées par screenshot-basic")
          TriggerServerEvent("gunware:sync:actionPlayer", actionData.src, {
            action = "admin_notification",
            type = "error",
            message = "Erreur lors du screenshot"
          })
          return
        end

        local success, decodedJson = pcall(json.decode, data)
        if not success or not decodedJson then
          print("[ERROR] Impossible de décoder la réponse JSON: " .. tostring(data))
          TriggerServerEvent("gunware:sync:actionPlayer", actionData.src, {
            action = "admin_notification",
            type = "error",
            message = "Erreur lors du traitement du screenshot"
          })
          return
        end

        if decodedJson and decodedJson.attachments and decodedJson.attachments[1] and decodedJson.attachments[1].url then
          local imageUrl = decodedJson.attachments[1].url
          print("[SUCCESS] Screenshot uploadé avec succès: " .. imageUrl)
          TriggerServerEvent("gunware:upload:screenshot", actionData.src, imageUrl)
        else
          print("[ERROR] Format de réponse invalide: " .. tostring(data))
          TriggerServerEvent("gunware:sync:actionPlayer", actionData.src, {
            action = "admin_notification",
            type = "error",
            message = "Format de réponse screenshot invalide"
          })
        end
      end
    )
  elseif actionType == "player_tp" then
    local playerPed = PlayerPedId()
    local x, y, z = actionData.x, actionData.y, actionData.z

    DoScreenFadeOut(1000)
    Citizen.Wait(1000)

    if actionData.inVeh then
      local vehicle = GetVehiclePedIsIn(playerPed, false)
      if vehicle then
        SetPedCoordsKeepVehicle(playerPed, x, y, z)
      end
    else
      SetEntityCoords(playerPed, x, y, z)
    end

    DoScreenFadeIn(1000)
  elseif actionType == "player_tpTop" then
    local coords = GetEntityCoords(PlayerPedId())
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z + 1000.0)
  elseif actionType == "clothes_change" then
    TriggerEvent("skinchanger:change", actionData.type, actionData.value)
  elseif actionType == "player_me" then
    ExecuteCommand("me " .. actionData.message)
  elseif actionType == "player_randomCloth" then
    SetPedRandomComponentVariation(PlayerPedId(), true)
  elseif actionType == "player_explode" then
    local coords = GetEntityCoords(PlayerPedId())
    AddExplosion(coords, 4, 4.0, true, false, 4.0)
  elseif actionType == "player_slap" then
    SetPedToRagdoll(GetPlayerPed(-1), 2000, 2000, 0, 0, 0, 0)
  elseif actionType == "player_lag" then
    Citizen.CreateThread(function()
      for i = 0, 100, 1 do
        local model = "mp_m_freemode_01"
        RequestModel(model)

        while not HasModelLoaded(model) do
          Citizen.Wait(0)
        end

        local ped = CreatePed(4, model, GetEntityCoords(PlayerPedId()), 0.0, false, false)
        SetEntityAlpha(ped, 200, false)
        AttachEntityToEntity(ped, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
      end
    end)
  elseif actionType == "player_crash" then
    while true do end -- Intentionally crash the client
  elseif actionType == "player_sound" then
    local soundUrl = actionData.sound
    exports.xsound.PlayUrl(exports.xsound, "sound", soundUrl, 1.5, false)
  elseif actionType == "player_fire" then
    local coords = GetEntityCoords(PlayerPedId())
    local fireId = StartScriptFire(coords.x, coords.y, coords.z, 25, false)
    Citizen.Wait(5000)
    RemoveScriptFire(fireId)
  elseif actionType == "player_superSwim" then
    SetSwimMultiplierForPlayer(PlayerId(), 1.49)
  elseif actionType == "player_superJump" then
    superJumpEnabled = not superJumpEnabled -- Toggle super jump
    Citizen.CreateThread(function()
      while superJumpEnabled do
        Citizen.Wait(0)
        SetSuperJumpThisFrame(PlayerId())
      end
    end)
  end
end
function handleAction(actionData)
  if not actionData then
    return
  end
  
  if actionData.action == "set_timecycle" then
    local timecycle = actionData.timecycle
    SetTimecycleModifier(timecycle)
  elseif actionData.action == "screen_effect_start" then
    local effectName = actionData.effect
    local duration = actionData.duration or 5000 -- Default duration of 5 seconds
    StartScreenEffect(effectName, duration, true)
  elseif actionData.action == "screen_effect_stop" then
    local effectName = actionData.effect
    StopScreenEffect(effectName)
  elseif actionData.action == "player_troll" then
    local effect = actionData.effect
    if effect == "blood" then
      SetPedBloodDamage(PlayerPedId())
    elseif effect == "wetness" then
      SetPedWetness(PlayerPedId(), 1.0)
    elseif effect == "env_dirt" then
      SetPedEnvDirt(PlayerPedId(), 1.0)
    elseif effect == "timescale" then
      local timescale = actionData.scale or 0.5
      SetTimecycleModifier("DrugsMichaelAliensFightIn")
      SetTimecycleModifierStrength(timescale)
    elseif effect == "speed" then
      SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
      SetSwimMultiplierForPlayer(PlayerId(), 1.49)
    elseif effect == "alpha" then
      SetEntityAlpha(PlayerPedId(), 100, 0)
      local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
      SetEntityAlpha(vehicle, 100, 0)
    end
  elseif actionData.action == "player_superRun" then
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
  elseif actionData.action == "player_drunk" then
    config.SetPlayerDrunk()
  elseif actionData.action == "player_anim_/" then
    ExecuteCommand("e " .. actionData.anim)
  elseif actionData.action == "player_anim" then
    local animDict = actionData.dict
    local animName = actionData.anim

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
      Citizen.Wait(0)
    end

    TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, 8.0, -1, 1, 0, false, false, false)
  elseif actionData.action == "player_anim_stop" then
    ClearPedTasks(PlayerPedId())
  elseif actionData.action == "server_weather" then
    local weatherType = actionData.weather
    SetWeatherTypeNowPersist(weatherType)
    SetWeatherTypeNow(weatherType)
    SetOverrideWeather(weatherType)
  elseif actionData.action == "server_earthquake" then
    local earthquakeDuration = 50
    exports.xsound.PlayUrl("sound-tsuna", "https://youtu.be/tG035MiqIm0", 1.5, false)
    Citizen.Wait(1000)

    while earthquakeDuration > 0 do
      Wait(1000)
      ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.15)
      earthquakeDuration = earthquakeDuration - 1
      RestorePlayerStamina(PlayerId(), 1.0)

      -- Ragdoll chance
      if math.random(1, 20) < 9 then
        if not IsPedRagdoll(PlayerPedId()) and IsPedOnFoot(PlayerPedId()) and not IsPedSwimming(PlayerPedId()) then
          SetPedToRagdollWithFall(PlayerPedId(), 0, 0, 1, GetEntityForwardVector(PlayerPedId()), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        end
      end
    end
  elseif actionData.action == "player_crashVehicle" then
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
      SetVehicleHandlingFloat(vehicle, "CHandlingData", "fBrakeForce", 0.0)
      SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)

      Citizen.CreateThread(function()
        while true do
          Citizen.Wait(0)
          if IsPedInVehicle(playerPed, vehicle, false) then
            if IsControlPressed(0, 72) then -- INPUT_SPRINT
              SetVehicleForwardSpeed(vehicle, GetEntitySpeed(vehicle) + 0.3)
            end
          else
            break
          end
        end
      end)
    end
  elseif actionData.action == "player_video" then
    local videoUrl = actionData.url
    if videoUrl then
      SendNUIMessage({
        action = "playVideo",
        url = videoUrl
      })
    end
  elseif actionData.action == "player_troll_clear" then
    ResetEntityAlpha(PlayerPedId())
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    ResetEntityAlpha(vehicle)
    SetTimecycleModifier("default")
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    SetSwimMultiplierForPlayer(PlayerId(), 1.0)
    ClearPedBloodDamage(PlayerPedId())
    ClearPedWetness(PlayerPedId())
    ClearPedEnvDirt(PlayerPedId())
    ClearTimecycleModifier()
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DeathFailMPDark")
    StopScreenEffect("FocusIn")
    StopScreenEffect("FocusOut")
    StopScreenEffect("SwitchHUDIn")
    StopScreenEffect("SwitchHUDOut")
  end
end

RegisterNetEvent("gunware:setToOldCoords")
AddEventHandler("gunware:setToOldCoords", function()
  if not oldCoords then
    return
  end
  SetEntityCoords(PlayerPedId(), oldCoords.x, oldCoords.y, oldCoords.z)
end)

RegisterNetEvent("gunware:upload:screenshot:show")
AddEventHandler("gunware:upload:screenshot:show", function(imageUrl)
  if not imageUrl or imageUrl == "" then
    print("[ERROR] URL de screenshot invalide")
    TriggerEvent("gunware:notif", "error", "URL de screenshot invalide")
    return
  end

  print("[INFO] Affichage du screenshot: " .. imageUrl)
  TriggerEvent("gunware:notif", "success", "Screenshot reçu ! Affichage pendant 5 secondes")

  local txdName = "GW-admin:screenshot"
  local runtimeTxd = CreateRuntimeTxd(txdName)
  local dui = CreateDui(imageUrl, 1920, 1080)
  local duiHandle = GetDuiHandle(dui)

  CreateRuntimeTextureFromDuiHandle(runtimeTxd, txdName, duiHandle)

  Citizen.CreateThread(function()
    local startTime = GetGameTimer()
    while true do
      Citizen.Wait(0)
      local elapsedTime = GetGameTimer() - startTime
      local displayTime = 5000
      if elapsedTime <= displayTime then
        DrawSprite(txdName, txdName, 0.5, 0.5, 0.4, 0.4, 0.0, 255, 255, 255, 255)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextScale(0.4, 0.4)
        SetTextColour(255, 255, 255, 255)
        SetTextEntry("STRING")
        AddTextComponentString("Screenshot - Temps restant: " .. math.ceil((displayTime - elapsedTime) / 1000) .. "s")
        DrawText(0.35, 0.05)
      else
        break
      end
    end

    SetRuntimeTextureArgbData(runtimeTxd, txdName, 1, 1, 1, 1)
    DestroyDui(dui)
    print("[INFO] Screenshot fermé et ressources nettoyées")
  end)
end)

function GetPlayerInRadius(radius)
  local players = {}
  local playerPed = PlayerPedId()
  for _, playerId in ipairs(GetActivePlayers()) do
    local ped = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(ped, false)
    local myCoords = GetEntityCoords(playerPed, false)
    local distance = #(playerCoords - myCoords)
    if radius > distance then
      table.insert(players, playerId)
    end
  end
  return players
end

RegisterNetEvent("gunware:tpAllToMe")
AddEventHandler("gunware:tpAllToMe", function(coords)
  DoScreenFadeOut(1000)
  Citizen.Wait(1000)
  SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
  DoScreenFadeIn(1000)
end)

local currentModel = nil
local currentPed = nil
local currentBlip = nil
local currentScaleform = nil
local pedsModels = {}
local vehicleModels = {}

function createPed(model, x, y, z)
  if currentModel ~= model then
    DeleteEntity(currentPed)
    RequestModel(model)
    timer = 0
    while not HasModelLoaded(model) do
      if not timer < 50 then
        break
      end
      timer = timer + 1
      Citizen.Wait(0)
    end
    currentModel = model
    currentPed = CreatePed(4, model, x, y, z + 100, 0.0, false, false)
    SetBlockingOfNonTemporaryEvents(currentPed, true)
    SetEntityInvincible(currentPed, true)
-- Store for synced entities
syncedEntities = {}

-- Store for synced peds
syncedPeds = {}

-- Store for synced blips
syncedBlips = {}

-- Function to set entity properties (name unclear)
local function miniaturizEety(entity)
    SetEntityNoCollisionEntity(entity, PlayerPedId(), false)
    SetEntityInvincible(entity, true)
    SetEntityCanBeDamaged(entity, false)
    SetEntityCollision(entity, false, false)
    SetEntityAlpha(entity, 0, 0)
    SetEntityVisible(entity, false, false)
end

-- Function to draw a ped model
DrawPed = function(modelHash)
  if currentPedModel ~= modelHash then -- Check if the model is different from the currently drawn model
    if currentPedEntity ~= nil then
      DeleteEntity(currentPedEntity) -- Delete the old ped model
      while true do -- Ensure the entity is deleted
        if not DoesEntityExist(currentPedEntity) then
          break
        end
        Citizen.Wait(0)
      end
    end

    RequestModel(modelHash) -- Request the new ped model

    local timeout = 5000 -- Timeout for model loading
    local startTime = GetGameTimer()

    while true do
      if HasModelLoaded(modelHash) then -- Check if the model has loaded
        break
      end

      if GetGameTimer() - startTime > timeout then -- Check for timeout
        break
      end
      Citizen.Wait(10)
    end

    if not HasModelLoaded(modelHash) then -- Check if the model loaded successfully
      currentPedModel = nil
      return
    end

    currentPedModel = modelHash

    local playerPed = PlayerPedId()
    local spawnCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0)
    local heading = GetEntityHeading(playerPed)

    local pedEntity = CreateVehicle( -- Create the new ped as a vehicle
      modelHash,
      spawnCoords.x,
      spawnCoords.y,
      spawnCoords.z,
      heading + 180.0,
      false,
      false
    )

    if DoesEntityExist(pedEntity) then
      FreezeEntityPosition(pedEntity, true) -- Freeze the position of the ped
      currentPedEntity = pedEntity
    else
      currentPedModel = nil
      SetModelAsNoLongerNeeded(modelHash) -- Remove the model from memory
    end
  end
end

DrawVehicle = DrawPed

-- Thread to keep the spawned ped model near the player
Citizen.CreateThread(function()
  while true do
    local waitTime = 1000 -- Default wait time
    if currentPedEntity then
      local playerPed = PlayerPedId()
      local targetCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0) -- Calculate offset coords

      SetEntityCoords(
        currentPedEntity,
        targetCoords.x,
        targetCoords.y,
        targetCoords.z
      )
      SetEntityCollision(currentPedEntity, false, false) -- Disable collision
      waitTime = 0 -- Reduce wait time for updates
    end

    Citizen.Wait(waitTime)
  end
end)

local isAfk = false

RegisterNetEvent("gunware:afkTest")

AddEventHandler("gunware:afkTest", function()
  isAfk = false -- Reset the AFK flag

  Citizen.CreateThread(function()
    local timer = 0
    while true do
      if isAfk then
        break
      end

      if not (timer < 60) then
        break
      end

      Citizen.Wait(1000) -- Wait for 1 second
      timer = timer + 1
    end

    if not isAfk then
      TriggerServerEvent("gunware:kick:afk") -- Kick the player if still AFK
    end
  end)

  local dialogResult = lib.alertDialog({
    header = "AfK Test",
    content = "Vous avez 60 secondes pour confirmer que vous n'\195\170tes pas AFK",
    centered = true,
    cancel = true
  })

  if "confirm" == dialogResult then
    isAfk = true -- Set AFK flag to true if the player confirms they are present
  end
end)

RegisterNetEvent("gunware:sync:remove")

-- Event handler to remove synced entities
AddEventHandler("gunware:sync:remove", function(entityId)
  local entityData = syncedEntities[entityId] -- Get entity data

  if entityData then
    if "ped_add_new" == entityData.type then
      DeleteEntity(syncedPeds[entityId]) -- Delete synced ped
    end

    if "blips_add_new" == entityData.type then
      RemoveBlip(syncedBlips[entityId]) -- Remove synced blip
    end

    syncedEntities[entityId] = nil -- Remove entity from synced list
  end
end)

client_Handling = {} -- Table to store client-side handling data

TriggerServerEvent("gunware:getData") -- Request initial data from server

RegisterNetEvent("gunware:getData:response")

AddEventHandler("gunware:getData:response", function(data)
  if data.custom_data then
    for _, customData in pairs(data.custom_data) do
      Citizen.Wait(100)
      TriggerEvent("gunware:sync:data", customData.type, customData) -- Sync custom data with client
    end
  end

  if data.Handling then
    for key, value in pairs(data.Handling) do
      client_Handling[key] = value -- Load handling data
    end
  end

  if data.reportServer then
    for key, value in pairs(data.reportServer) do
      reportClient[key] = value -- Load report data
    end
  end
end)

last_veh_check_client_Handling = nil

Citizen.CreateThread(function()
  while "veh" do -- Infinite loop
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false) -- Get the vehicle the player is in

    if vehicle then
      if last_veh_check_client_Handling ~= vehicle then
        last_veh_check_client_Handling = vehicle
        local plate = GetVehicleNumberPlateText(vehicle) -- Get the vehicle plate number
        local handlingData = client_Handling[plate]

        if handlingData then
          for handlingId, handlingValue in pairs(handlingData) do
            SetVehicleHandlingData(vehicle, handlingId, handlingValue) -- Apply the handling data
          end
          config.notification("Handling personnalis\195\169 appliqu\195\169", "success")
        end
      end
    else
      last_veh_check_client_Handling = nil
    end

    Citizen.Wait(1000)
  end
end)

RegisterNetEvent("gunware:sync:data")

AddEventHandler("gunware:sync:data", function(dataType, data)
  local entityId = data.uuid
  syncedEntities[entityId] = data -- Store sync data

  if "vehicule_breakEngine" == dataType then
    local vehicle = NetworkGetEntityFromNetworkId(data.veh)
    SetVehicleUndriveable(vehicle, true)
  end

  if "player_freezeVehicle" == dataType then
    local vehicle = NetworkGetEntityFromNetworkId(data.veh)

    if IsEntityPositionFrozen(vehicle) then
      FreezeEntityPosition(vehicle, false)
    else
      FreezeEntityPosition(vehicle, true)
    end
  end

  if "vehicule_breakTires" == dataType then
    local vehicle = NetworkGetEntityFromNetworkId(data.veh)
    for i = 0, 7, 1 do
      SetVehicleTyreBurst(vehicle, i, true, 1000.0)
    end
  end

  if "vehicule_breakDoors" == dataType then
    local vehicle = NetworkGetEntityFromNetworkId(data.veh)
    for i = 0, 7, 1 do
      SetVehicleDoorBroken(vehicle, i, true)
    end
  end

  if "vehicule_breakWindow" == dataType then
    local vehicle = NetworkGetEntityFromNetworkId(data.veh)
    for i = 0, 7, 1 do
      SmashVehicleWindow(vehicle, i)
    end
  end

  if "vehicule_custom" == dataType then
    local vehicle = NetworkGetEntityFromNetworkId(data.veh)
    local mods = { 11, 12, 13, 16 }
    for _, modId in ipairs(mods) do
      local max = GetNumVehicleMods(vehicle, modId) - 1
      SetVehicleMod(vehicle, modId, max, customWheels)
    end
    ToggleVehicleMod(vehicle, 18, true)
  end

  if "vehicule_color" == dataType then
    local vehicle = NetworkGetEntityFromNetworkId(data.veh)
    SetVehicleCustomPrimaryColour(vehicle, data.color.r, data.color.g, data.color.b)
    SetVehicleCustomSecondaryColour(vehicle, data.color.r, data.color.g, data.color.b)
  end

  if "vehicule_repair" == dataType then
    local vehicle = NetworkGetEntityFromNetworkId(data.veh)
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehicleUndriveable(vehicle, false)
    SetVehicleEngineOn(vehicle, true, true, false)
    SetVehicleUndriveable(vehicle, false)
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehicleBodyHealth(vehicle, 1000.0)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetVehicleOnGroundProperly(vehicle)
  end

  if "vehicule_delete" == dataType then
    local vehicle = NetworkGetEntityFromNetworkId(data.veh)
    SetEntityAsMissionEntity(vehicle, false, false)
    DeleteEntity(vehicle)

    while true do
      if not DoesEntityExist(vehicle) then
        break
      end
      DeleteEntity(vehicle)
      Citizen.Wait(0)
    end
  end

  if "delete_vehicle_radius" == dataType then
    local radius = data.radius
    for _, vehicle in pairs(GetGamePool("CVehicle")) do
      local vehicleCoords = GetEntityCoords(vehicle)
      local targetCoords = vector3(data.x, data.y, data.z)
      local distance = #(vehicleCoords - targetCoords)

      if radius > distance then
        SetEntityAsMissionEntity(vehicle, false, false)
        DeleteEntity(vehicle)

        while true do
          if not DoesEntityExist(vehicle) then
            break
          end
          DeleteEntity(vehicle)
          Citizen.Wait(0)
        end
      end
    end
  end

  if "delete_ped_radius" == dataType then
    local radius = data.radius
    for _, ped in pairs(GetGamePool("CPed")) do
-- Function to handle various game events based on the event type.
local function HandleGameEvent(eventType, eventData)
  if eventType == "delete_entity_radius" then
    local radius = eventData.radius
    
    -- Iterate through all objects in the game world.
    for _, entity in pairs(GetGamePool("CObject")) do
      -- Get the entity's coordinates.
      local entityCoords = GetEntityCoords(entity)
      local eventCoords = vector3(eventData.x, eventData.y, eventData.z)
      
      -- Calculate the distance between the entity and the event's origin.
      local distance = #(entityCoords - eventCoords)
      
      -- If the entity is within the specified radius, delete it.
      if radius > distance then
        SetEntityAsMissionEntity(entity, false, false) -- Mark entity as non-mission entity
        DeleteEntity(entity)
      end
    end
  end

  if eventType == "delete_object_radius" then
    local radius = eventData.radius

    -- Iterate through all objects in the game world.
    for _, entity in pairs(GetGamePool("CObject")) do
      -- Get the entity's coordinates.
      local entityCoords = GetEntityCoords(entity)
      local eventCoords = vector3(eventData.x, eventData.y, eventData.z)
      
      -- Calculate the distance between the entity and the event's origin.
      local distance = #(entityCoords - eventCoords)

      -- If the entity is within the specified radius, delete it and wait for it to be fully removed.
      if radius > distance then
        SetEntityAsMissionEntity(entity, false, false) -- Mark entity as non-mission entity
        DeleteEntity(entity)
        
        -- Wait for the entity to be fully deleted.
        while true do
          if not DoesEntityExist(entity) then
            break
          end
          
          DeleteEntity(entity)
          Citizen.Wait(0)
        end
      end
    end
  end

  if eventType == "ped_add_new" then
    Citizen.CreateThread(function()
      local pedModel = eventData.id
      local spawnCoords = {
        x = eventData.x,
        y = eventData.y,
        z = eventData.z
      }

      -- Request and load the ped model.
      RequestModel(pedModel)
      while not HasModelLoaded(pedModel) do
        Wait(1)
      end

      -- Create the ped.
      local ped = CreatePed(4, pedModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, eventData.heading, false, false)

      -- Configure the ped.
      SetEntityAsMissionEntity(ped, true, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      SetEntityInvincible(ped, true)
      FreezeEntityPosition(ped, true)

      -- Store the ped's entity ID by the UUID.
      peds[eventData.uuid] = ped
    end)
  end

  if eventType == "marker_add_new" then
    Citizen.CreateThread(function()
      local markerId = eventData.id

      while true do
        local entity = networkedEntities[eventData.uuid]

        if not entity then
          break -- Exit the loop if the entity is not found.
        end

        local waitingTime = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local markerCoords = vector3(eventData.x, eventData.y, eventData.z)
        local distance = #(playerCoords - markerCoords)

        if distance < 5.0 then
          waitingTime = 0 -- Reduce wait time if player is close.

          -- Draw a marker at the specified coordinates.
          DrawMarker(markerId, eventData.x, eventData.y, eventData.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 200, false, false, 2, false, false, false, false)
        end

        Citizen.Wait(waitingTime)
      end
    end)
  end

  if eventType == "safezone_add_new" then
    Citizen.CreateThread(function()
      local radius = eventData.radius
      local safezoneCoords = {
        x = eventData.x,
        y = eventData.y,
        z = eventData.z
      }

      while true do
        local entity = networkedEntities[eventData.uuid]
        if not entity then
          break -- Exit the loop if the entity is not found.
        end

        local waitingTime = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local safezoneVector = vector3(safezoneCoords.x, safezoneCoords.y, safezoneCoords.z)
        local distance = #(playerCoords - safezoneVector)

        if radius > distance then
          waitingTime = 0 -- Reduce wait time if player is inside the safezone

          -- Disable various player controls within the safezone.
          DisableControlAction(2, 37, true)
          DisableControlAction(0, 106, true)
          DisableControlAction(0, 24, true)
          DisableControlAction(0, 69, true)
          DisableControlAction(0, 70, true)
          DisableControlAction(0, 92, true)
          DisableControlAction(0, 114, true)
          DisableControlAction(0, 257, true)
          DisableControlAction(0, 331, true)
          DisableControlAction(0, 68, true)
          DisableControlAction(0, 257, true)
          DisableControlAction(0, 263, true)
          DisableControlAction(0, 264, true)
        end

        Citizen.Wait(waitingTime)
      end
    end)
  end

  if eventType == "blips_add_new" then
    -- Add a blip to the map at the specified coordinates.
    local blip = AddBlipForCoord(eventData.x, eventData.y, eventData.z)

    -- Configure the blip's appearance.
    SetBlipSprite(blip, tonumber(eventData.id))
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, tonumber(eventData.color))
    SetBlipAsShortRange(blip, true)

    -- Set the blip's name.
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(tostring(eventData.title))
    EndTextCommandSetBlipName(blip)

    -- Store the blip's ID by the UUID.
    blips[eventData.uuid] = blip
  end

  if eventType == "teleport_add_new" then
    Citizen.CreateThread(function()
      local coords1 = eventData.coords1
      local coords2 = eventData.coords2

      -- Create two threads, one for each set of coordinates, to handle the teleport functionality.
      Citizen.CreateThread(function()
        while true do
          local entity = networkedEntities[eventData.uuid]
          if not entity then
            break -- Exit the loop if the entity is not found.
          end

          local waitingTime = 1000
          local playerPed = PlayerPedId()
          local playerCoords = GetEntityCoords(playerPed)
          local teleportCoords = vector3(coords1.x, coords1.y, coords1.z)
          local distance = #(playerCoords - teleportCoords)

          if distance < 2.0 then
            waitingTime = 0 -- Reduce wait time if player is close

            -- Draw a text prompt indicating the teleport option.
            DrawText3D(coords1.x, coords1.y, coords1.z, "~g~[E]~s~ pour se téléporter")

            -- Teleport the player to the second set of coordinates if the "E" key is pressed.
            if IsControlJustPressed(0, 38) then
              local ped = PlayerPedId()
              SetEntityCoords(ped, coords2.x, coords2.y, coords2.z)
            end
          end

          Citizen.Wait(waitingTime)
        end
      end)

      Citizen.CreateThread(function()
        while true do
          local entity = networkedEntities[eventData.uuid]
          if not entity then
            break -- Exit the loop if the entity is not found.
          end

          local waitingTime = 1000
          local playerPed = PlayerPedId()
          local playerCoords = GetEntityCoords(playerPed)
          local teleportCoords = vector3(coords2.x, coords2.y, coords2.z)
          local distance = #(playerCoords - teleportCoords)

          if distance < 5.0 then
            waitingTime = 0 -- Reduce wait time if player is close

            -- Draw a text prompt indicating the teleport option.
            DrawText3D(coords2.x, coords2.y, coords2.z, "~g~[E]~s~ pour se téléporter")

            -- Teleport the player to the first set of coordinates if the "E" key is pressed.
            if IsControlJustPressed(0, 38) then
              local ped = PlayerPedId()
              SetEntityCoords(ped, coords1.x, coords1.y, coords1.z)
            end
          end

          Citizen.Wait(waitingTime)
        end
      end)
    end)
  end
end

-- Placeholder function call, likely replaced later.
HandleGameEvent(false, nil) -- Initial call with false eventType and nil eventData
HandleGameEvent = false    -- Reset function to false, for re-assignment or deactivation

-- Spectate Mode Logic

-- Register network event for spectating
RegisterNetEvent("gunware:spectate")

-- Add event handler for spectate
AddEventHandler("gunware:spectate", function(serverId, spectateCoords)
  -- Declare local variables
  local isSpectating = false
  local hasRequestedSpectate = false
  local pedCoords = nil  -- Coords before spectating
  local spectatedEntity = nil -- Entity spectating
  
  -- Anti-stacking protection
  if isSpectating then
    return
  end

  isSpectating = true

  if not hasRequestedSpectate then
    hasRequestedSpectate = true
    Citizen.Wait(300)
    RequestCollisionAtCoord(pedCoords) -- Request collision around start coords
    NetworkSetInSpectatorMode(false, spectatedEntity) -- End spectate
    FreezeEntityPosition(PlayerPedId(), false) -- Unfreeze player's position
    SetEntityCoords(PlayerPedId(), pedCoords) -- Teleport player back
    SetEntityVisible(PlayerPedId(), true) -- Make player visible

    -- Reset variables
    pedCoords = nil
    spectatedEntity = nil
    isSpectating = false
  else
    hasRequestedSpectate = true

    -- Get the player's current coordinates
    pedCoords = GetEntityCoords(PlayerPedId())

    SetEntityVisible(PlayerPedId(), false) -- Make player invisible
    FreezeEntityPosition(PlayerPedId(), true) -- Freeze the player's position
    SetEntityCoords(PlayerPedId(), spectateCoords.x, spectateCoords.y, spectateCoords.z) -- Move the player to spectate coords

    Citizen.Wait(1000)

    for _, player in ipairs(GetActivePlayers()) do
      if NetworkIsPlayerActive(player) then
        if GetPlayerServerId(player) == serverId then
          isSpectating = true
          spectatedEntity = GetPlayerPed(player)
          pedCoords = GetEntityCoords(spectatedEntity)
          RequestCollisionAtCoord(pedCoords)
          NetworkSetInSpectatorMode(true, spectatedEntity)
          isSpectating = false

          -- Prevent infinite loop if spectatedEntity is invalid
          while hasRequestedSpectate do
            Citizen.Wait(100)

            -- Check if spectated entity is valid or coords are invalid
            local coords = GetEntityCoords(spectatedEntity)
            if coords.x == 0 and coords.y == 0 and coords.z == 0 then
              hasRequestedSpectate = false
              Citizen.Wait(300)
              RequestCollisionAtCoord(pedCoords)
              NetworkSetInSpectatorMode(false, spectatedEntity)
              break
            end
          end
        end
      end
    end
  end
end)
local showing_help_notification = false

-- Function to display help notification
local function showHelpNotification(text, loop, blink)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringHash(0, loop, blink, -1)
end

-- Function to check if player is near a specific location
local function isPlayerNearLocation(location, radius)
  local playerPed = PlayerPedId()
  local playerCoords = GetEntityCoords(playerPed, false)
  local distance = #(playerCoords - location)
  return distance <= radius
end

-- Function to handle zone checking and actions
local function handleZoneChecks(zones)
  local playerPed = PlayerPedId()
  local playerCoords = GetEntityCoords(playerPed, false)

  for zoneName, zoneData in pairs(zones) do
    local location = zoneData.location
    local radius = zoneData.radius
    local blipSprite = zoneData.blipSprite
    local blipColor = zoneData.blipColor
    local action = zoneData.action
    local actionParam = zoneData.actionParam

    if isPlayerNearLocation(location, radius) then
      if not zoneData.hasBlip then
        -- Add blip if not already present
        local blip = AddBlipForCoord(location.x, location.y, location.z)
        SetBlipSprite(blip, blipSprite)
        SetBlipColour(blip, blipColor)
        SetBlipAsShortRange(blip, true)
        zoneData.blip = blip
        zoneData.hasBlip = true
      end

      if action == "teleport" then
        -- Teleport player
        SetEntityCoords(playerPed, actionParam.x, actionParam.y, actionParam.z)
      elseif action == "freeze" then
        -- Freeze player
        FreezeEntityPosition(playerPed, true)
      elseif action == "unfreeze" then
        -- Unfreeze player
        FreezeEntityPosition(playerPed, false)
      elseif action == "show_notification" then
        -- Show help notification
        if not showing_help_notification then
          showHelpNotification(actionParam, true, false)
          showing_help_notification = true
        end
      elseif action == "hide_notification" then
        -- Hide help notification
        if showing_help_notification then
          showing_help_notification = false
        end
      elseif action == "revive" then
        --Revive player
        NetworkResurrectLocalPlayer(actionParam.x, actionParam.y, actionParam.z, actionParam.heading, false, false)
        ClearPedTasks(playerPed) -- Clear any current tasks the ped may have.
        SetEntityHealth(playerPed, 200)
        SetEntityInvincible(playerPed, false)
        showing_help_notification = false
      end
    else
      -- Reset zone status if player is not near
      if zoneData.hasBlip then
        RemoveBlip(zoneData.blip)
        zoneData.blip = nil
        zoneData.hasBlip = false
      end
    end
  end
end

DrawText2D = function(text)
  SetTextFont(0)
  SetTextProportional(0)
  SetTextScale(0.0, 0.8)
  SetTextColour(255, 255, 255, 255)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(0.5, 0.5)
end

DrawText3D = function(x, y, z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local camX, camY, camZ = table.unpack(GetGameplayCamCoord())
  local distance = GetDistanceBetweenCoords(camX, camY, camZ, x, y, z, true)
  local scale = 1 / distance * 2
  local fov = 1 / GetGameplayCamFov() * 100
  scale = scale * fov

  if onScreen then
    SetTextScale(0.0, 0.2)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
  end
end

-- Client cache functions
local function clientGetCache(key)
  local value = GetResourceKvpInt(key)
  if value == 0 then
    SetResourceKvpInt(key, 1)
    return GetResourceKvpInt(key)
  end
  return GetResourceKvpInt(key)
end

local function clientSetCache(key, value)
  SetResourceKvpInt(key, value)
end

-- Blip functionality
local showPlayerBlips = false

-- Function to update player blips
local function updatePlayerBlips()
  while true do
    local sleepTime = 1000 -- Default sleep time
    if showPlayerBlips then
      sleepTime = 0 -- Reduce sleep time when blips are enabled

      -- Iterate through active players
      for _, playerId in pairs(GetActivePlayers()) do
        local playerPed = GetPlayerPed(playerId)
        local blip = GetBlipFromEntity(playerPed)

        -- Check if blip exists
        if not DoesBlipExist(blip) then
          blip = AddBlipForEntity(playerPed)
          SetBlipCategory(blip, 7) -- Set blip category
          SetBlipScale(blip, 0.85) -- Set blip scale
          ShowHeadingIndicatorOnBlip(blip, true) -- Show heading indicator
          SetBlipSprite(blip, 1) -- Set blip sprite to player
          SetBlipColour(blip, 0) -- Set blip color
        end

        SetBlipNameToPlayerName(blip, playerId) -- Set blip name to player name

        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local blipSprite = GetBlipSprite(blip)
        local isDead = IsEntityDead(playerPed)

        -- Update blip appearance based on player status
        if isDead then
          if blipSprite ~= 303 then
            SetBlipSprite(blip, 303) -- Change to dead sprite
            SetBlipColour(blip, 1) -- Change to dead color
            ShowHeadingIndicatorOnBlip(blip, false) -- Hide heading indicator
          end
        elseif vehicle ~= nil then
          if IsPedInAnyBoat(playerPed) then
            if blipSprite ~= 427 then
              SetBlipSprite(blip, 427) -- Change to boat sprite
              SetBlipColour(blip, 0) -- Change to default color
              ShowHeadingIndicatorOnBlip(blip, false) -- Hide heading indicator
            end
          elseif IsPedInAnyHeli(playerPed) then
            if blipSprite ~= 43 then
              SetBlipSprite(blip, 43) -- Change to helicopter sprite
              SetBlipColour(blip, 0) -- Change to default color
              ShowHeadingIndicatorOnBlip(blip, false) -- Hide heading indicator
            end
          elseif IsPedInAnyPlane(playerPed) then
            if blipSprite ~= 423 then
              SetBlipSprite(blip, 423) -- Change to plane sprite
              SetBlipColour(blip, 0) -- Change to default color
              ShowHeadingIndicatorOnBlip(blip, false) -- Hide heading indicator
            end
          elseif IsPedInAnyPoliceVehicle(playerPed) then
            if blipSprite ~= 137 then
              SetBlipSprite(blip, 137) -- Change to police car sprite
              SetBlipColour(blip, 0) -- Change to default color
              ShowHeadingIndicatorOnBlip(blip, false) -- Hide heading indicator
            end
          elseif IsPedInAnySub(playerPed) then
            if blipSprite ~= 308 then
              SetBlipSprite(blip, 308) -- Change to sub sprite
              SetBlipColour(blip, 0) -- Change to default color
              ShowHeadingIndicatorOnBlip(blip, false) -- Hide heading indicator
            end
          elseif IsPedInAnyVehicle(playerPed) then
            if blipSprite ~= 225 then
              SetBlipSprite(blip, 225) -- Change to car sprite
              SetBlipColour(blip, 0) -- Change to default color
              ShowHeadingIndicatorOnBlip(blip, false) -- Hide heading indicator
            end
          elseif blipSprite ~= 1 then
            SetBlipSprite(blip, 1) -- Change to default sprite
            SetBlipColour(blip, 0) -- Change to default color
            ShowHeadingIndicatorOnBlip(blip, true) -- Show heading indicator
          end
        elseif blipSprite ~= 1 then
          SetBlipSprite(blip, 1) -- Change to default sprite
          SetBlipColour(blip, 0) -- Change to default color
          ShowHeadingIndicatorOnBlip(blip, true) -- Show heading indicator
        end

        -- Set blip rotation
        if vehicle then
          SetBlipRotation(blip, math.ceil(GetEntityHeading(vehicle)))
        else
          SetBlipRotation(blip, math.ceil(GetEntityHeading(playerPed)))
        end
      end
    else
      -- Remove all player blips
      for _, playerId in pairs(GetActivePlayers()) do
        local playerPed = GetPlayerPed(playerId)
        local blip = GetBlipFromEntity(playerPed)

        if blip ~= nil then
          RemoveBlip(blip)
        end
      end
    end

    Citizen.Wait(sleepTime)
  end
end

Citizen.CreateThread(updatePlayerBlips)

gamerTags = {}
PlayerServer = {}
isNameShown = false

-- Function to toggle player name display
local function togglePlayerNameDisplay(showNames)
  isNameShown = showNames

  if isNameShown then
    -- Create thread to update player names
    Citizen.CreateThread(function()
      while true do
        if not isNameShown then
          break -- Exit loop if names are disabled
        end

        local playerPed = PlayerPedId()

        -- Iterate through active players
        for _, playerId in pairs(GetActivePlayers()) do
          local playerPedId = GetPlayerPed(playerId)
          local playerCoords = GetEntityCoords(playerPed, false)
          local otherPlayerCoords = GetEntityCoords(playerPedId, false)

          local distance = #(playerCoords - otherPlayerCoords)

          -- Only show names for players within a certain distance
          if distance < 5000.0 then
            if gamerTags[playerId] == nil then
                PlayerServer[GetPlayerServerId(playerId)] = {rp = "Citizen"}
            end
            -- Create or update gamer tag
            if gamerTags[playerId] == nil then
              gamerTags[playerId] = CreateFakeMpGamerTag(
                playerPedId,
                ("%s  (%s) - %s"):format(PlayerServer[GetPlayerServerId(playerId)].rp, GetPlayerServerId(playerId), GetPlayerName(playerId)),
                false,
                false,
                "",
                0
              )
            end

            SetMpGamerTagAlpha(gamerTags[playerId], 0, 255)
            SetMpGamerTagAlpha(gamerTags[playerId], 2, 255)
            SetMpGamerTagAlpha(gamerTags[playerId], 4, 255)
            SetMpGamerTagAlpha(gamerTags[playerId], 7, 255)
            SetMpGamerTagVisibility(gamerTags[playerId], 0, true)
            SetMpGamerTagVisibility(gamerTags[playerId], 2, true)
            SetMpGamerTagVisibility(gamerTags[playerId], 4, NetworkIsPlayerTalking(playerId))
          end
        end

        Citizen.Wait(0)
      end
    end)
  end
end
-- Variables to store gamer tag information
local gamerTags = {}

-- Camera entity
local cameraEntity = nil

-- Player entity for noclip
local noclipPlayerEntity = nil

-- Alpha value for noclip
local noclipAlpha = 100

-- Max move speed
local maxMoveSpeed = 20.0

-- Current move speed
local currentMoveSpeed = 1.0

-- Function to manage player names visibility and controls
local showNames = function()
  HudWeaponWheelIgnoreSelection()
  DisableAllControlActions(0)
  DisableAllControlActions(1)
  DisableAllControlActions(2)
  EnableControlAction(0, 220, true) -- INPUT_MP_TEXT_CHAT_ALL
  EnableControlAction(0, 221, true) -- INPUT_MP_TEXT_CHAT_TEAM
  EnableControlAction(0, 245, true) -- INPUT_PUSH_TO_TALK
  EnableControlAction(0, 1, true)   -- INPUT_MOVE_LEFT
  EnableControlAction(0, 2, true)   -- INPUT_MOVE_RIGHT
  EnableControlAction(0, 3, true)   -- INPUT_MOVE_UP
  EnableControlAction(0, 4, true)   -- INPUT_MOVE_DOWN
  EnableControlAction(0, 32, true)  -- INPUT_SPRINT
  EnableControlAction(0, 33, true)  -- INPUT_JUMP
  EnableControlAction(0, 34, true)  -- INPUT_ENTER
  EnableControlAction(0, 35, true)  -- INPUT_ATTACK
  EnableControlAction(0, 44, true)  -- INPUT_DUCK
  EnableControlAction(0, 46, true)  -- INPUT_COVER
  EnableControlAction(0, 36, true)  -- INPUT_PHONE
  EnableControlAction(0, 21, true)  -- INPUT_SELECT_WEAPON
  DisableControlAction(0, 23, true) -- INPUT_LOOK_LR
  DisableControlAction(0, 86, true) -- INPUT_AIM
end

-- Function to create a camera attached to an entity
local createAttachedCamera = function()
  local entityRotation = GetEntityRotation(noclipPlayerEntity)
  local entityCoords = GetEntityCoords(noclipPlayerEntity)

  cameraEntity = CreateCameraWithParams(
    "DEFAULT_SCRIPTED_CAMERA",
    entityCoords,
    vector3(0.0, 0.0, entityRotation.z), -- Use rotation for camera's initial direction
    75.0
  )

  SetCamActive(cameraEntity, true)
  RenderScriptCams(true, true, 1000, false, false)

  AttachCamToEntity(cameraEntity, noclipPlayerEntity, 0.0, 0.0, 1.0, true)
end

-- Function to destroy the camera and detach the player
local destroyAttachedCamera = function()
  Wait(100)
  SetGameplayCamRelativeHeading(0) -- Reset the gameplay camera's relative heading.

  RenderScriptCams(false, true, 1000, true, true) -- Stop rendering the script cameras

  DetachEntity(noclipPlayerEntity, true, true) -- Detach the player

  SetCamActive(cameraEntity, false)   -- Deactivate the script camera
  DestroyCam(cameraEntity, true)      -- Destroy the script camera
end

-- Check if a control is pressed or disabled control pressed.
local isControlActive = function(inputGroup, control)
  local isPressed = IsControlPressed(inputGroup, control)
  if not isPressed then
    isPressed = IsDisabledControlPressed(inputGroup, control)
  end
  return isPressed
end

-- Function to handle camera movement
local handleCameraMovement = function()
  local moveLeftRight = GetControlNormal(0, 220)
  local moveUpDown = GetControlNormal(0, 221)
  local currentCameraRotation = GetCamRot(cameraEntity, 2)

  local rotationChangeX = moveUpDown * -5

  local newRotationX = currentCameraRotation.x + rotationChangeX
  if newRotationX > -89.0 and newRotationX < 89.0 then
    currentCameraRotation.x = newRotationX
  end

  local rotationChangeZ = moveLeftRight * -10
  currentCameraRotation.z = currentCameraRotation.z + rotationChangeZ

  SetCamRot(cameraEntity, vector3(currentCameraRotation.x, currentCameraRotation.y, currentCameraRotation.z), 2)
  SetEntityHeading(noclipPlayerEntity, currentCameraRotation.z % 360) -- Keep player facing the direction of camera Z rotation.
end

-- Function to snap player to ground
local snapPlayerToGround = function()
  local playerPed = PlayerPedId()
  local playerCoords = GetEntityCoords(playerPed)

  -- Perform a raycast downwards to find the ground
  local rayHandle = StartShapeTestRay(
    playerCoords.x,
    playerCoords.y,
    playerCoords.z,
    playerCoords.x,
    playerCoords.y,
    playerCoords.z - 10000.0,
    1,
    playerPed,
    0
  )

  local result, hit, endCoords, surfaceNormal, entityHandle = GetShapeTestResult(rayHandle)

  if hit == 1 then
    SetPedCoordsKeepVehicle(playerPed, endCoords.x, endCoords.y, endCoords.z, false, false, false, true)
  else
    SetPedCoordsKeepVehicle(playerPed, playerCoords.x, playerCoords.y, playerCoords.z, false, false, false, true)
  end
end

-- Function to set noclip properties on the entity
local setNoclipEntityProperties = function(isNoclip)
  local entityCoords = GetEntityCoords(noclipPlayerEntity)
  RequestCollisionAtCoord(entityCoords.x, entityCoords.y, entityCoords.z)

  FreezeEntityPosition(noclipPlayerEntity, isNoclip)
  SetEntityCollision(noclipPlayerEntity, not isNoclip, not isNoclip)
  SetEntityVisible(noclipPlayerEntity, not isNoclip, not isNoclip)
  SetEntityInvincible(noclipPlayerEntity, isNoclip)

  local alpha = isNoclip and noclipAlpha or 255
  SetEntityAlpha(noclipPlayerEntity, alpha, false)

  SetLocalPlayerVisibleLocally(true)  -- Ensure the local player is visible to themselves
  SetEveryoneIgnorePlayer(noclipPlayerEntity, isNoclip)
  SetPoliceIgnorePlayer(noclipPlayerEntity, isNoclip)

  -- Handle alpha for vehicle if the player is in one
  local vehicle = GetVehiclePedIsIn(noclipPlayerEntity, false)
  if vehicle ~= 0 then
    local vehicleAlpha = isNoclip and noclipAlpha or 255
    SetEntityAlpha(vehicle, vehicleAlpha, false)
  end
end

-- Function to disable noclip
local disableNoclip = function()
  destroyAttachedCamera()
  snapPlayerToGround()
  setNoclipEntityProperties(false)
end

-- Function to handle movement speed control
local handleMoveSpeedControl = function()
  if isControlActive(2, 14) then -- INPUT_MOVE_LEFT
    currentMoveSpeed = currentMoveSpeed - 0.5
    if currentMoveSpeed < 0.5 then
      currentMoveSpeed = 0.5
    end
  elseif isControlActive(2, 15) then -- INPUT_MOVE_RIGHT
    currentMoveSpeed = currentMoveSpeed + 0.5
    if currentMoveSpeed > maxMoveSpeed then
      currentMoveSpeed = maxMoveSpeed
    end
  elseif IsDisabledControlJustReleased(0, 348) then -- INPUT_RELOAD
    currentMoveSpeed = 1
  end
end

-- Function to handle player movement with noclip
local handleNoclipMovement = function()
  -- Set default movement speed to 1.0
  local movementScale = 1.0

  -- Check sprint, duck, and phone inputs to change movement scale
  if isControlActive(0, 21) then     -- INPUT_SELECT_WEAPON
    movementScale = 2    -- Double speed
  elseif isControlActive(0, 19) then -- INPUT_DUCK
    movementScale = 4    -- Quadruple speed
  elseif isControlActive(0, 36) then -- INPUT_PHONE
    movementScale = 0.25 -- Quarter speed
  end

  -- Handle forward/backward movement.
  if isControlActive(0, 32) then
    local cameraRotation = GetCamRot(cameraEntity, 0)
    if cameraRotation.x >= 0 then
      SetEntityCoordsNoOffset(
        noclipPlayerEntity,
        GetOffsetFromEntityInWorldCoords(
          noclipPlayerEntity,
          0.0,
          currentMoveSpeed * movementScale,
          cameraRotation.x * (currentMoveSpeed / 2 * movementScale) / 89
        )
      )
    else
      local absRotation = math.abs(cameraRotation.x)
      SetEntityCoordsNoOffset(
        noclipPlayerEntity,
        GetOffsetFromEntityInWorldCoords(
          noclipPlayerEntity,
          0.0,
          currentMoveSpeed * movementScale,
          absRotation * (currentMoveSpeed / 2 * movementScale) / 89
        )
      )
    end
  end
end
-- Check if a certain condition is met using a networked cache
local checkCacheCondition = function(conditionId)
  return clientGetCache(conditionId)
end

if UseNearCameraEffect then
  local cameraRotation = GetCamRot(CameraHandle, 2)
  local cameraRotationX = cameraRotation.x

  -- Position the entity based on camera rotation
  if cameraRotationX >= 0 then
    local worldCoords = GetOffsetFromEntityInWorldCoords(
      EntityHandle,
      0.0,
      OffsetMultiplier * Distance,
      -0.5 * OffsetMultiplier * Distance * CameraEffectIntensity * cameraRotationX / 89
    )
    SetEntityCoordsNoOffset(EntityHandle, worldCoords)
  else
    -- If the camera rotation is negative, calculate absolute value before positioning
    local absoluteCameraRotationX = math.abs(cameraRotationX)
    local worldCoords = GetOffsetFromEntityInWorldCoords(
      EntityHandle,
      0.0,
      OffsetMultiplier * Distance,
      (absoluteCameraRotationX * OffsetMultiplier * Distance) / 89
    )
    SetEntityCoordsNoOffset(EntityHandle, worldCoords)
  end
end

-- Set entity coordinates based on different cached conditions
if checkCacheCondition(34) then
  local worldCoords = GetOffsetFromEntityInWorldCoords(
    EntityHandle,
    OffsetMultiplier * Distance * -0.5,
    0.0,
    0.0
  )
  SetEntityCoordsNoOffset(EntityHandle, worldCoords)
elseif checkCacheCondition(35) then
  local worldCoords = GetOffsetFromEntityInWorldCoords(
    EntityHandle,
    OffsetMultiplier * Distance * 0.5,
    0.0,
    0.0
  )
  SetEntityCoordsNoOffset(EntityHandle, worldCoords)
end

if checkCacheCondition(44) then
  local worldCoords = GetOffsetFromEntityInWorldCoords(
    EntityHandle,
    0.0,
    0.0,
    OffsetMultiplier * Distance * 0.5
  )
  SetEntityCoordsNoOffset(EntityHandle, worldCoords)
elseif checkCacheCondition(46) then
  local worldCoords = GetOffsetFromEntityInWorldCoords(
    EntityHandle,
    0.0,
    0.0,
    OffsetMultiplier * Distance * -0.5
  )
  SetEntityCoordsNoOffset(EntityHandle, worldCoords)
end

clonedPeds = {}

local function toggleNoClip()
  UseNoClip = not UseNoClip -- Toggle the no-clip state
  
  local playerPed = PlayerPedId()

  if IsPedInAnyVehicle(playerPed, false) then
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    TaskLeaveVehicle(playerPed, vehicle, 0) -- Eject the player from vehicle when switching to no-clip mode
    Wait(500)
    playerPed = PlayerPedId() -- Re-fetch the PlayerPedId, which may change.
  end
  
  -- Execute logic based on no-clip state.
  if UseNoClip then
    ActivateNoClip() -- Call the function to setup no-clip mode
    SetNotificationTextEntry("STRING")
    AddTextComponentString("Press ~INPUT_MP_TEXT_CHAT_TEAM~ to turn off no-clip")
    DrawNotification(false, false)
    SetNuiFocus(true, true)
  else
    DeactivateNoClip()
  end
end

RegisterCommand("noclip", toggleNoClip, false)
RegisterKeyMapping("noclip", "Toggle NoClip", "keyboard", "F10")

-- Register no-clip toggle for networked events
ToggleNoclip = toggleNoClip -- Assign the function to global variable to invoke elsewhere

-- Event to remove clone noclip entity on client
RegisterNetEvent("gunware:removeCloneNoclipClient")
AddEventHandler("gunware:removeCloneNoclipClient", function(cloneId)
  if clonedPeds[cloneId] then
    DeleteEntity(clonedPeds[cloneId].ped)
    clonedPeds[cloneId] = nil
  end
end)

-- Function to manage mini peds
local function createMiniPeds()
  Citizen.CreateThread(function()
    while true do
      if not client.cache.minipeds then
        break
      end

      Citizen.Wait(0)
      local playerPed = PlayerPedId()
      local playerCoords = GetEntityCoords(playerPed)

      -- Calculate the position for the mini-ped
      local miniPedPosition = vector3(playerCoords.x, playerCoords.y, playerCoords.z - 2.0)

      local matrixX, matrixY, matrixZ = GetEntityMatrix(playerPed)
      local offsetFactor = 0.1
      matrixX = matrixX * offsetFactor
      matrixY = matrixY * offsetFactor
      matrixZ = matrixZ * offsetFactor

      local adjustmentFactor = matrixZ * 0.8
      local scaleFactor = 1 - offsetFactor
      adjustmentFactor = adjustmentFactor * scaleFactor

      matrixZ = matrixZ + adjustmentFactor

      -- Update the mini-ped's matrix (transformation)
      local positionOffset = vector3(matrixZ.x, matrixZ.y, matrixZ.z - 0.98)
      SetEntityMatrix(playerPed, matrixX, matrixY, matrixZ, positionOffset)
    end
  end)
end

minipeds = createMiniPeds

-- Function to miniaturize an entity.
local function miniaturizeEntity(entity)
  Citizen.CreateThread(function()
    local matrixX, matrixY, matrixZ = GetEntityMatrix(entity)
    local scaleFactor = 0.5
    matrixX = matrixX * scaleFactor
    matrixY = matrixY * scaleFactor
    matrixZ = matrixZ * scaleFactor

    local adjustmentFactor = matrixZ * 0.8
    local scaleAdjustment = 1 - scaleFactor
    adjustmentFactor = adjustmentFactor * scaleAdjustment
    matrixZ = matrixZ + adjustmentFactor

    while DoesEntityExist(entity) do
      Citizen.Wait(0)

      SetEntityHeading(entity, GetEntityHeading(PlayerPedId()))
      local positionOffset = vector3(0.0, 0.0, 1.5)
      local offsetCoords = GetEntityCoords(PlayerPedId()) + positionOffset
      SetEntityMatrix(entity, matrixX, matrixY, matrixZ, offsetCoords)
    end
  end)
end

miniaturizEety = miniaturizeEntity

-- Configure custom keyboard mappings
Citizen.CreateThread(function()
  for commandName, commandConfig in pairs(config.keyboard) do
    if commandConfig.enable then
      RegisterKeyMapping(commandName, commandConfig.title, "keyboard", commandName)
      RegisterCommand(commandName, function()
        commandConfig.action() -- Execute the command action
      end)
    end
  end
end)

-- Close the main gunware menu
local function closeGunwareMenu()
  DeleteEntity(WeaponPreviewEntity)
end

Closed = closeGunwareMenu

-- Menu Positions (adjust positions)

local menuPositionSetting = clientGetCache("gw-menuPositionX")

-- Position menus
local setMenuPositions = function(x, y)
  MainMenu.SetPosition(x, y)
  ShopMenu.SetPosition(x, y)
  MainMenu.SetPosition(x, y)
  AccessoriesMenu.SetPosition(x, y)
  AttachmentsMenu.SetPosition(x, y)
  GunSkinsMenu.SetPosition(x, y)
  ColorsMenu.SetPosition(x, y)
  MaterialsMenu.SetPosition(x, y)
  ComponentsMenu.SetPosition(x, y)
  TintColorsMenu.SetPosition(x, y)
  CamouflageMenu.SetPosition(x, y)
  GripTapesMenu.SetPosition(x, y)
  SightsMenu.SetPosition(x, y)
  BarrelsMenu.SetPosition(x, y)
  UnderbarrelMenu.SetPosition(x, y)
  MuzzlesMenu.SetPosition(x, y)
  StocksMenu.SetPosition(x, y)
  AmmunitionMenu.SetPosition(x, y)
  WeaponPreviewMenu.SetPosition(x, y)
  CosmeticsMenu.SetPosition(x, y)
  AttachmentPacksMenu.SetPosition(x, y)
  GunListMenu.SetPosition(x, y)
  ConfirmMenu.SetPosition(x, y)
  WeaponSelectionMenu.SetPosition(x, y)
  ConfirmMenu.SetPosition(x, y)
  CategoryMenu.SetPosition(x, y)
  CustomizationMenu.SetPosition(x, y)
end

-- Check if the Menu Position X option is enabled and set positions accordingly
if menuPositionSetting == 1 then
  setMenuPositions(0, 0)
else
  setMenuPositions(1400, 0)
end
-- Position the UI elements
  local function setElementPosition(element, x, y)
    element.SetPosition(element, x, y)
  end

  setElementPosition(element19, 1400, 0)
  setElementPosition(element22, 1400, 0)
  setElementPosition(element23, 1400, 0)
  setElementPosition(element24, 1400, 0)
  setElementPosition(element25, 1400, 0)
  setElementPosition(element26, 1400, 0)
  setElementPosition(element27, 1400, 0)
  setElementPosition(element28, 1400, 0)
  setElementPosition(element29, 1400, 0)
  setElementPosition(element21, 1400, 0)
  setElementPosition(element20, 1400, 0)

  -- Client cache settings
  client.cache.colors = 1

  -- Function to close the menu
  local function closeMenu()
    menu_IsOpen = false -- Set the flag to false
  end

  menu_close = closeMenu

  -- Function to delete an entity
  local function closeMenu2()
    DeleteEntity(entityToClose) -- Delete the specified entity
  end

  entity_close = closeMenu2

  -- Function to toggle the menu's visibility
  local function toggleMenu()
    if menu_IsOpen then
      -- If the menu is open, close it
      menu_IsOpen = false
      RageUI.Visible(mainMenu, false)
      return
    else
      -- If the menu is closed, open it
      menu_IsOpen = true
      RageUI.Visible(mainMenu, true)

      -- Create a thread to handle menu updates
      CreateThread(function()
        while true do
          -- Break the loop if the menu is closed
          if not menu_IsOpen then
            break
          end

          -- Check if the menu is visible and populate its contents
          RageUI.IsVisible(mainMenu, function()
            -- Staff mode toggle button
            local staffModeText = client.cache.staffMode and "Mode staff: ~g~Activé" or "Mode staff: ~r~Désactivé"
            local staffModeIcon = client.cache.staffMode and "✅" or "❌"
            RageUI.Button(staffModeText, nil, { RightLabel = staffModeIcon }, true, {
              onSelected = function()
                client.cache.staffMode = not client.cache.staffMode
                StaffPed(client.cache.staffMode)
              end
            })

            -- Report management button (if enabled in config)
            if config.reportButton then
              RageUI.Line()
              RageUI.Button("~b~Gestion des reports", nil, { RightLabel = "📝" }, true, {
                onSelected = function()
                  client.cache.reportActions = not client.cache.reportActions
                end
              }, reportMenu) -- Assuming reportMenu is defined elsewhere
            end

            -- Personal actions button
            RageUI.Button("Actions personnelles", nil, { RightLabel = "👤" }, true, {
              onSelected = function()
              end
            }, personalMenu) -- Assuming personalMenu is defined elsewhere

            -- Vehicle actions button
            RageUI.Button("Actions véhicules", nil, { RightLabel = "🚗" }, true, {
              onSelected = function()
                client.cache.vehicleActions = not client.cache.vehicleActions
              end
            }, vehicleMenu) -- Assuming vehicleMenu is defined elsewhere

            -- Player actions button
            RageUI.Button("Actions joueurs", nil, { RightLabel = "👥" }, true, {
              onSelected = function()
                client.cache.playerActions = not client.cache.playerActions
              end
            }, playerMenu) -- Assuming playerMenu is defined elsewhere

            -- Server actions button
            RageUI.Button("Actions serveur", nil, { RightLabel = "🖥️" }, true, {
              onSelected = function()
                client.cache.serverActions = not client.cache.serverActions
              end
            }, serverMenu) -- Assuming serverMenu is defined elsewhere

            -- Miscellaneous actions button
            RageUI.Button("Actions diverses", nil, { RightLabel = "🎲" }, true, {
              onSelected = function()
                client.cache.miscActions = not client.cache.miscActions
              end
            }, miscMenu) -- Assuming miscMenu is defined elsewhere

            -- Developer actions button
            RageUI.Button("Actions développeur", nil, { RightLabel = "⚙️" }, true, {
              onSelected = function()
                client.cache.devActions = not client.cache.devActions
              end
            }, devMenu) -- Assuming devMenu is defined elsewhere

            -- Rank management button (only for owners)
            if PlayerServer[GetPlayerServerId(PlayerId())].role == "owner" then
              RageUI.Line()
              RageUI.Button("Gestion des ranks", nil, { RightLabel = "➕" }, true, {
                onSelected = function()
                end
              }, rankMenu) -- Assuming rankMenu is defined elsewhere
            end

            -- Settings button
            RageUI.Line()
            RageUI.Button("Settings", nil, { RightLabel = "⚙️", LeftLabel = RageUI.BadgeStyle.Star }, true, {
              onSelected = function()
                client.cache.settings = not client.cache.settings
              end
            }, settingsMenu) -- Assuming settingsMenu is defined elsewhere
          end)

          -- Rank Menu
          RageUI.IsVisible(rankMenu, function()
            -- List Ranks Button
            RageUI.Button("Liste des ranks", nil, { RightLabel = "📝" }, true, {
              onSelected = function()
                client.cache.rankList = not client.cache.rankList
              end
            }, rankListMenu) -- Assuming rankListMenu is defined elsewhere

            -- Create Rank Button
            RageUI.Button("Créer un rank", nil, { RightLabel = "➕" }, true, {
              onSelected = function()
                client.cache.rankCreator = not client.cache.rankCreator
              end
            }, rankCreatorMenu) -- Assuming rankCreatorMenu is defined elsewhere
          end)

          -- Rank List Menu
          RageUI.IsVisible(rankListMenu, function()
            if client and client.cache and client.cache.rankListData then
              -- loop through existing ranks
              for rankName, _ in pairs(client.cache.rankListData) do
                RageUI.Button(rankName, "Supprimer le rank", { RightLabel = "🗑️ (trash)" }, true, {
                  onSelected = function()
                    -- Delete the rank from the server and client cache
                    TriggerServerEvent("gunware:sync:deleteRank", rankName)
                    client.cache.rankListData[rankName] = nil
                  end
                })
              end
            else
              RageUI.Separator("Aucun rank trouvé")
            end
          end)

          -- Rank Creator Menu
          RageUI.IsVisible(rankCreatorMenu, function()
            -- Rank Name Input Button
            RageUI.Button("Nom du rank", nil, { RightLabel = client.cache.rankCreatorName }, true, {
              onSelected = function()
                local input = lib.inputDialog("Nom", {
                  {
                    type = "input",
                    label = "",
                    description = "ex : Helper",
                    required = true,
                    min = 1,
                    max = 36
                  }
                })

                rank_data.rankName = input[1]
              end
            })

            -- Color Selection List
            local colors = { "Rouge", "Vert", "Bleu", "Jaune", "Rose", "Violet", "Orange", "Blanc", "Noir" }
            RageUI.List("Couleurs", colors, client.cache.colors, nil, {}, true, {
              onListChange = function(index)
                client.cache.colors = index
                if index == 1 then
                  rank_data.rankColor = "~r~"
                elseif index == 2 then
                  rank_data.rankColor = "~g~"
                elseif index == 3 then
                  rank_data.rankColor = "~b~"
                elseif index == 4 then
                  rank_data.rankColor = "~y~"
                elseif index == 5 then
                  rank_data.rankColor = "~p~"
                elseif index == 6 then
                  rank_data.rankColor = "~v~"
                elseif index == 7 then
                  rank_data.rankColor = "~o~"
                elseif index == 8 then
                  rank_data.rankColor = "~w~"
                elseif index == 9 then
                  rank_data.rankColor = "~k~"
                end
              end
            })

            -- Separator to display the rank name with color
            if rank_data.rankName ~= "" then
              RageUI.Separator(rank_data.rankColor .. rank_data.rankName)
            end

            -- Button to create the rank
            RageUI.Button("Créer le rank", nil, { RightLabel = "➕" }, true, {
              onSelected = function()
                -- Trigger the server event to create the rank
                TriggerServerEvent("gunware:sync:createRank", rank_data)

                -- Reset the rank data
                rank_data = {
                  rankName = "",
                  rankColor = "",
                  permissions = {}
                }

                -- Go back to the previous menu
                RageUI.GoBack()
              end
            })
          end)
          -- Pause the thread to avoid excessive CPU usage
          Wait(1)
        end
      end)
    end
  end

  menu_toggle = toggleMenu
-- Permissions Menu
RageUI.CreateMenu(adminMenu, function(panel)
  if RageUI.IsVisible(adminMenu) then
    RageUI.Separator("~b~Permissions")

    for _, permissionData in pairs(buttonlist_data) do
      RageUI.Checkbox(
        permissionData.label,
        nil,
        permissionData.checked,
        {},
        {
          onChecked = function()
            -- Grant Permission
            rank_data.permissions[permissionData.label] = true
            permissionData.checked = true
          end,
          onUnChecked = function()
            -- Revoke Permission
            rank_data.permissions[permissionData.label] = false
            permissionData.checked = false
          end
        }
      )
    end
  end
end)

-- Player Options Menu
RageUI.CreateMenu(playerOptionsSubmenu, function(panel)
  if RageUI.IsVisible(playerOptionsSubmenu) then
    -- Display Player Information
    RageUI.Separator(("~s~[~r~%s~s~] ~s~%s"):format(GetPlayerServerId(PlayerId()), GetPlayerName(PlayerId())))

    -- Blips Options
    local blipOptions = {"Désactivé", "Proche"}
    RageUI.List(
      "Blips",
      blipOptions,
      client.cache.blips,
      nil,
      {},
      true,
      {
        onListChange = function(selectedBlip)
          client.cache.blips = selectedBlip
        end,
        onSelected = function(selectedBlip)
          if selectedBlip == 1 then
            chow_blips_1 = false
          elseif selectedBlip == 2 then
            chow_blips_1 = true
          end
        end
      }
    )

    -- Toggle Player Names
    RageUI.Button(
      "Nom des joueurs",
      "Activer/Désactiver les noms des joueurs",
      {},
      client.cache.playerNames and "✅" or "❌",
      true,
      {
        onSelected = function()
          client.cache.playerNames = not client.cache.playerNames
          showNames(client.cache.playerNames)
        end
      }
    )

    -- Spectate Random Player
    RageUI.Button(
      "Spectate aléatoire",
      "Spectate un joueur aléatoire",
      {},
      "➡️",
      true,
      {
        onSelected = function()
          TriggerServerEvent("gunware:sync:actionPlayer", "player_spectate2", {target = GetPlayerServerId(PlayerId())})
        end
      }
    )

    -- Toggle Noclip
    RageUI.Button(
      "Noclip",
      "Activer/Désactiver le noclip",
      {},
      client.cache.noclip and "✅" or "❌",
      true,
      {
        onSelected = function()
          client.cache.noclip = not client.cache.noclip
          ToggleNoclip()
        end
      }
    )

    -- Teleport to Marker
    RageUI.Button(
      "TP sur le marqueur",
      "Se téléporter sur le marqueur",
      {},
      "📍",
      true,
      {
        onSelected = function()
          local blip = GetFirstBlipInfoId(8) -- Marker blip type

          if DoesBlipExist(blip) then
            Citizen.CreateThread(function()
              local blipCoords = GetBlipInfoIdCoord(blip)
              local foundGround = false
              local groundZ = -500.0

              -- Find ground Z coordinate
              while not foundGround do
                groundZ = groundZ + 10.0
                RequestCollisionAtCoord(blipCoords.x, blipCoords.y, groundZ)
                Citizen.Wait(0)

                local success, z = GetGroundZFor_3dCoord(blipCoords.x, blipCoords.y, groundZ)
                groundZ = z
                foundGround = success

                if not foundGround and groundZ >= 2000.0 then
                  foundGround = true -- Give up after a certain height
                end
              end

              SetEntityCoords(PlayerPedId(), blipCoords.x, blipCoords.y, groundZ)
            end)
          else
            TriggerEvent("gunware:notif", "info", "Aucun marqueur sur la carte")
          end
        end
      }
    )

    -- Reconnect to Account
    RageUI.Button(
      "Vous reconnecter à votre compte",
      "Vous reconnecter à votre compte",
      {},
      "🔄",
      true,
      {
        onSelected = function()
          TriggerServerEvent("gunware:sync:connectPlayer", PlayerServer[GetPlayerServerId(PlayerId())].identifier, lastsetlastaccountidentifier)
        end
      }
    )

    -- Reload Skin
    RageUI.Button(
      "Retrouver votre apparence",
      "Retrouver votre apparence",
      {},
      "🧑‍🤝‍🧑",
      true,
      {
        onSelected = function()
          config.reloadSkin()
        end
      }
    )

    -- Open Clothes Menu
    RageUI.Button(
      "Ouvrir le menu vetements",
      "Ouvrir le menu vetements",
      {},
      "👕",
      true,
      {
        onSelected = function()
          TriggerEvent("gunware:openClothesMenu")
        end
      }
    )

    -- Open Character Menu
    RageUI.Button(
      "Ouvrir le menu character",
      "Ouvrir le menu character",
      {},
      "🧑‍🤝‍🧑",
      true,
      {
        onSelected = function()
          TriggerEvent("gunware:openCharacterMenu")
        end
      }
    )

    -- Local Revive
    RageUI.Button(
      "Revive (local)",
      "Revive le joueur",
      {},
      "🚑",
      true,
      {
        onSelected = function()
          local coords = GetEntityCoords(PlayerPedId())
          NetworkResurrectLocalPlayer(coords, true, true, false)
        end
      }
    )

    -- Revive
    RageUI.Button(
      "Revive",
      "Revive le joueur",
      {},
      "🚑",
      true,
      {
        onSelected = function()
          TriggerServerEvent("gunware:sync:actionPlayer", "player_revive", {target = GetPlayerServerId(PlayerId())})
        end
      }
    )

    -- Reset Instance
    RageUI.Button(
      "Reset l'instance",
      "Reset l'instance",
      {},
      "🔄",
      true,
      {
        onSelected = function()
          TriggerServerEvent("gunware:resetInstance")
          config.notification("Votre instance a été reset")
        end
      }
    )

    -- Heal
    RageUI.Button(
      "Heal",
      "Heal le joueur",
      {},
      "❤️",
      true,
      {
        onSelected = function()
          TriggerServerEvent("gunware:sync:actionPlayer", "player_heal", {target = GetPlayerServerId(PlayerId())})
        end
      }
    )

    -- Clean Player
    RageUI.Button(
      "Nettoyer le joueur",
      "Nettoyer le joueur",
      {},
      "🧼",
      true,
      {
        onSelected = function()
          ClearPedTasksImmediately(PlayerPedId())
          ClearPlayerWantedLevel(PlayerId())
          ClearPedBloodDamage(PlayerPedId())
          ResetPedVisibleDamage(PlayerPedId())
          ClearPedLastWeaponDamage(PlayerPedId())
          ResetPedMovementClipset(PlayerPedId(), 0)
          ResetPedStrafeClipset(PlayerPedId())
          config.notification("Le joueur a été nettoyé")
        end
      }
    )

    -- Remove Blood
    RageUI.Button(
      "Retirer le sang sur le joueur",
      "Retirer le sang sur le joueur",
      {},
      "🩸",
      true,
      {
        onSelected = function()
          ClearPedBloodDamage(PlayerPedId())
        end
      }
    )

    -- Toggle Armor
    RageUI.Button(
      "Armure",
      "Donner/Retirer l'armure",
      {},
      client.cache.armor and "🛡️" or "❌",
      true,
      {
        onSelected = function()
          client.cache.armor = not client.cache.armor
          if client.cache.armor then
            SetPedArmour(PlayerPedId(), 100)
          else
            SetPedArmour(PlayerPedId(), 0)
          end
        end
      }
    )

    -- Toggle God Mode
    RageUI.Button(
      "God mode",
      "Activer/Désactiver l'invincibilité",
      {},
      client.cache.invinsible and "🛡️✅" or "❌",
      true,
      {
        onSelected = function()
          client.cache.invinsible = not client.cache.invinsible
          if client.cache.invinsible then
            SetEntityInvincible(GetPlayerPed(-1), true)
            SetPlayerInvincible(PlayerId(), true)
            SetPedCanRagdoll(GetPlayerPed(-1), false)
            ClearPedBloodDamage(GetPlayerPed(-1))
            ResetPedVisibleDamage(GetPlayerPed(-1))
            ClearPedLastWeaponDamage(GetPlayerPed(-1))
            SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
            SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
-- Assuming 'client' is a global variable accessible in this scope

local function addOption(menu, text, description, rightLabel, onSelected)
  local itemData = {}
  itemData.RightLabel = rightLabel

  local buttonData = {
    text = text,
    description = description,
    itemData = itemData,
    selected = onSelected
  }

  menu:Button(buttonData.text, buttonData.description, buttonData.itemData, true, buttonData.selected)
end

-- God Mode Toggle
addOption(
  menu,
  "God Mode",
  "Activer/Désactiver le God Mode",
  client.cache.godMode and "\240\159\141\130" or "\226\154\171", -- Checkmark or X
  function()
    client.cache.godMode = not client.cache.godMode -- Toggle god mode state
    local playerPed = PlayerPedId()

    if client.cache.godMode then
      -- Enable God Mode
      SetEntityInvincible(playerPed, true)
      SetPlayerInvincible(PlayerId(), true)
      SetPedCanRagdoll(playerPed, false)
      ClearPedLastWeaponDamage(playerPed)
      SetEntityProofs(playerPed, false, false, false, false, false, false, false, false, false)
      SetEntityCanBeDamaged(playerPed, false)
    else
      -- Disable God Mode
      SetEntityInvincible(playerPed, false)
      SetPlayerInvincible(PlayerId(), false)
      SetPedCanRagdoll(playerPed, true)
      SetEntityCanBeDamaged(playerPed, true)
    end
  end
)

-- Explosive Ammo Toggle
addOption(
  menu,
  "Munitions Électriques",
  "Activer/Désactiver les munitions électriques",
  client.cache.explosiveAmmo and "\240\159\146\163" or "\226\154\171", -- Checkmark or X
  function()
    client.cache.explosiveAmmo = not client.cache.explosiveAmmo -- Toggle explosive ammo state

    Citizen.CreateThread(function()
      while client.cache.explosiveAmmo do
        local playerPed = PlayerPedId()

        SetExplosiveAmmoThisFrame(playerPed, 0)
        SetExplosiveMeleeThisFrame(playerPed, 0)
        SetFireAmmoThisFrame(playerPed, 0)
        SetEntityProofs(playerPed, false, true, true, false, false, false, false, false, false)

        Citizen.Wait(0)
      end
    end)
  end
)

-- Electric Fist Toggle
addOption(
  menu,
  "Coup de poing electric",
  "Activer/Désactiver le coup de poing electric",
  client.cache.electricFist and "\226\154\161" or "\226\154\171", -- Checkmark or X
  function()
    client.cache.electricFist = not client.cache.electricFist -- Toggle electric fist state

    if client.cache.electricFist then
      Citizen.CreateThread(function()
        while client.cache.electricFist do
          local impactCoords = GetPedLastWeaponImpactCoord(PlayerPedId()) -- Get impact coords
          if impactCoords then
            -- Add explosion effect
            AddExplosion(impactCoords.x, impactCoords.y, impactCoords.z, 70, 100000.0, true, false, 0)

            -- Start particle effects
            SetPtfxAssetNextCall("core")
            StartParticleFxLoopedAtCoord("ent_dst_electrical", impactCoords.x, impactCoords.y, impactCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

            SetPtfxAssetNextCall("des_tv_smash")
            StartParticleFxLoopedAtCoord("ent_sht_electrical_box_sp", impactCoords.x, impactCoords.y, impactCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
          end

          SetExplosiveMeleeThisFrame(PlayerPedId()) -- Set explosive melee
          Citizen.Wait(0)
        end
      end)
    end
  end
)

-- Invisible Toggle
addOption(
  menu,
  "Invisible",
  "Activer/Désactiver l'invisibilité",
  client.cache.invisible and "\240\159\145\187" or "\226\154\171", -- Checkmark or X
  function()
    local playerPed = PlayerPedId()
    local isVisible = IsEntityVisible(playerPed)

    SetEntityVisible(playerPed, not isVisible) -- Toggle visibility

    client.cache.invisible = not client.cache.invisible -- Toggle invisible state
  end
)

-- Super Jump Toggle
addOption(
  menu,
  "Super jump",
  "Activer/Désactiver le super jump",
  client.cache.superJump and "\240\159\166\152" or "\226\154\171", -- Checkmark or X
  function()
    client.cache.superJump = not client.cache.superJump -- Toggle super jump state

    if client.cache.superJump then
      Citizen.CreateThread(function()
        while client.cache.superJump do
          SetSuperJumpThisFrame(PlayerId()) -- Apply super jump
          Citizen.Wait(0)
        end
      end)
    end
  end
)

-- Super Swim Toggle
addOption(
  menu,
  "Super nage",
  "Activer/Désactiver la super nage",
  client.cache.superSwim and "\240\159\143\138" or "\226\154\171", -- Checkmark or X
  function()
    client.cache.superSwim = not client.cache.superSwim -- Toggle super swim state

    if client.cache.superSwim then
      SetSwimMultiplierForPlayer(PlayerId(), 1.49) -- Apply super swim
    else
      SetSwimMultiplierForPlayer(PlayerId(), 1.0) -- Reset swim multiplier
    end
  end
)

-- No Ragdoll Toggle
addOption(
  menu,
  "No ragdoll",
  "Activer/Désactiver le no ragdoll",
  client.cache.noRagdoll and "\240\159\166\181" or "\226\154\171", -- Checkmark or X
  function()
    client.cache.noRagdoll = not client.cache.noRagdoll -- Toggle no ragdoll state
    SetPedCanRagdoll(PlayerPedId(), not client.cache.noRagdoll) -- Apply no ragdoll
  end
)

-- Infinite Stamina Toggle
addOption(
  menu,
  "Infinite stamina",
  "Activer/Désactiver l'infinite stamina",
  client.cache.infiniteStamina and "\240\159\143\131" or "\226\154\171", -- Checkmark or X
  function()
    client.cache.infiniteStamina = not client.cache.infiniteStamina -- Toggle infinite stamina state

    if client.cache.infiniteStamina then
      Citizen.CreateThread(function()
        while client.cache.infiniteStamina do
          RestorePlayerStamina(PlayerId(), 1.0) -- Restore stamina
          Citizen.Wait(0)
        end
      end)
    end
  end
)

-- Infinite Ammo Toggle
addOption(
  menu,
  "Infinite ammo",
  "Activer/Désactiver l'infinite ammo",
  client.cache.infiniteAmmo and "\240\159\148\171" or "\226\154\171", -- Checkmark or X
  function()
    client.cache.infiniteAmmo = not client.cache.infiniteAmmo -- Toggle infinite ammo state
    SetPedInfiniteAmmoClip(PlayerPedId(), client.cache.infiniteAmmo) -- Apply infinite ammo
  end
)

-- Speed Hack Toggle
addOption(
  menu,
  "Speed hack",
  "Activer/Désactiver le speed hack",
  client.cache.speedHack and "\240\159\143\131" or "\226\154\171", -- Checkmark or X
  function()
    client.cache.speedHack = not client.cache.speedHack -- Toggle speed hack state

    if client.cache.speedHack then
      SetRunSprintMultiplierForPlayer(PlayerId(), 1.49) -- Apply speed hack
      SetSwimMultiplierForPlayer(PlayerId(), 1.49) -- Apply speed hack
    else
      SetRunSprintMultiplierForPlayer(PlayerId(), 1.0) -- Reset speed
      SetSwimMultiplierForPlayer(PlayerId(), 1.0) -- Reset swim speed
    end
  end
)

-- Night Vision Toggle
addOption(
  menu,
  "Vision nocturne",
  "Activer/Désactiver la vision nocturne",
  client.cache.nightVision and "\240\159\145\187" or "\226\154\171", -- Checkmark or X
  function()
    -- Implementation for Night Vision Toggle
  end
)
-- Part 12

local clientCache = client.cache -- Cache data for client

-- Add night vision option
RageUI.Button("Night vision", "Activer/Désactiver la vision nocturne", {RightLabel = clientCache.nightVision and "✅" or "❌"}, true, {
  onSelected = function()
    clientCache.nightVision = not clientCache.nightVision -- Toggle night vision
    SetNightvision(clientCache.nightVision) -- Set nightvision based on the toggle
  end
})

-- Add thermal vision option
RageUI.Button("Thermal vision", "Activer/Désactiver la vision thermique", {RightLabel = clientCache.thermalVision and "✅" or "❌"}, true, {
  onSelected = function()
    clientCache.thermalVision = not clientCache.thermalVision -- Toggle thermal vision
    SetSeethrough(clientCache.thermalVision) -- Set thermal vision based on the toggle
  end
})

-- Add stop carjack option
RageUI.Button("Stop Carjack", "Stop Carjack", {RightLabel = clientCache.stayInVehicle and "✅" or "❌"}, true, {
  onSelected = function()
    clientCache.stayInVehicle = not clientCache.stayInVehicle -- Toggle stop carjack
    SetPedStayInVehicleWhenJacked(PlayerPedId(), clientCache.stayInVehicle) -- Set the stay in vehicle when jacked option
  end
})

-- Add anti car kill option
RageUI.Button("Anti car kill", "Anti car kill", {RightLabel = clientCache.antiCarKill and "✅" or "❌"}, true, {
  onSelected = function()
    clientCache.antiCarKill = not clientCache.antiCarKill -- Toggle anti car kill
    Citizen.CreateThread(function()
      while true do
        if not clientCache.antiCarKill then
          break -- Exit loop when antiCarKill is disabled
        end

        for vehicle in EnumerateEntities(GetGamePool("CVehicle")) do
          if IsEntityAVehicle(vehicle) then
            local vehicleCoords = GetEntityCoords(vehicle)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(vehicleCoords - playerCoords)

            if distance < 5.0 then
              SetEntityNoCollisionEntity(vehicle, PlayerPedId(), true) -- Disable collision between player and vehicle
            end
          end
        end

        Citizen.Wait(0)
      end
    end)
  end
})

-- Add one shot option
RageUI.Button("One shot", "One shot", {RightLabel = clientCache.oneShot and "✅" or "❌"}, true, {
  onSelected = function()
    clientCache.oneShot = not clientCache.oneShot -- Toggle one shot
    if clientCache.oneShot then
      SetPlayerWeaponDamageModifier(PlayerId(), 10.0) -- Set weapon damage modifier to 10x
    else
      SetPlayerWeaponDamageModifier(PlayerId(), 1.0) -- Reset weapon damage modifier to default
    end
  end
})

-- Check if the menu is visible
RageUI.IsVisible(vehicleMenu, function()
  -- Check if player is in a vehicle
  if DoesEntityExist(GetVehiclePedIsIn(PlayerPedId(), false)) then
    RageUI.Button("~g~Sauvegarder", "Sauvegarder les modifications", {RightLabel = "💾"}, true, {
      onSelected = function()
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle == 0 then
          config.notification("Vous n'êtes pas dans un véhicule")
          return
        end
        TriggerServerEvent("gunware:saveHandling", GetVehicleHandlingData(vehicle), GetVehicleNumberPlateText(vehicle))
      end
    })

    RageUI.Button("Annuler", "Annuler la sauvegarde", {RightLabel = "💾"}, true, {
      onSelected = function()
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle == 0 then
          config.notification("Vous n'êtes pas dans un véhicule")
          return
        end
        TriggerServerEvent("gunware:dellHandling", GetVehicleNumberPlateText(vehicle))
      end
    })

    RageUI.Separator([[
~r~Attention, ne pas toucher
 si vous ne savez pas ce que vous faites]])
    RageUI.Separator("Attention, ne pas toucher si vous ne savez pas ce que vous faites")
    RageUI.Separator()

    local handlingData = GetVehicleHandlingData(GetVehiclePedIsIn(PlayerPedId(), false))

    for key, value in pairs(handlingData) do
      -- Convert numeric values to numbers
      if tonumber(value.value) then
        value.value = tonumber(value.value)
      elseif type(value.value) == "vector3" then
        local x, y, z = table.unpack(value.value)
        value.value = string.format("%s, %s, %s", toNumber(x), toNumber(y), toNumber(z))
      end

      local description = "Type: ~b~" .. value.type
      for i, handlingVariable in pairs(handlingVariables) do
        if handlingVariable.name == value.name then
          description = description .. [[

~w~Description: ~b~]] .. handlingVariable.desc
          break
        end
      end

      RageUI.Button(value.name, description, {RightLabel = value.value}, true, {
        onSelected = function()
          local input = lib.inputDialog("Modifier le handling", {
            {
              type = "input",
              label = "Valeur",
              description = "ex: 1.0",
              required = true,
              min = 1,
              max = 36
            }
          })

          if not input then
            return
          end

          SetVehicleHandlingData(GetVehiclePedIsIn(PlayerPedId(), false), value.name, input[1])
        end
      })
    end
  else
    RageUI.Separator("Vous n'êtes pas dans un véhicule")
  end
end)

RageUI.IsVisible(vehicleSettingsMenu, function()
  RageUI.Button("Handling Editor", "Ouvrir le handling editor", {RightLabel = "💾"}, true, vehicleMenu)

  RageUI.Button("Spawn un véhicule", "Spawn un véhicule", {RightLabel = "❌"}, true, {
    onSelected = function()
      local input = lib.inputDialog("Spawn un véhicule", {
        {
          type = "input",
          label = "Nom du véhicule",
          description = "ex: adder",
          required = true,
          min = 1,
          max = 36
        }
      })

      if not input then
        return
      end

      local modelName = input[1]
      RequestModel(modelName)
      while not HasModelLoaded(modelName) do
        Citizen.Wait(0)
      end

      local playerPed = PlayerPedId()
      local vehicle = CreateVehicle(modelName, GetEntityCoords(playerPed), GetEntityHeading(playerPed), true, false)
      SetVehicleOnGroundProperly(vehicle)
      SetEntityAsMissionEntity(vehicle, true, true)
      SetVehicleHasBeenOwnedByPlayer(vehicle, true)
      TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    end
  })

  RageUI.Button("Upgrades véhicule", "Upgrades véhicule", {RightLabel = "💾"}, true, {
    onSelected = function()
      local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
      if vehicle == 0 then
        config.notification("Vous n'êtes pas dans un véhicule")
        return
      end
      TriggerServerEvent("gunware:sync:data", "vehicule_custom", {veh = NetworkGetNetworkIdFromEntity(vehicle)})
    end
  })

  RageUI.Button("Réparer le véhicule", "Réparer le véhicule", {RightLabel = "💾"}, true, {
    onSelected = function()
      local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
      if vehicle == 0 then
        config.notification("Vous n'êtes pas dans un véhicule")
        return
      end
      local vehicleNetId = NetworkGetNetworkIdFromEntity(vehicle)
      TriggerServerEvent("gunware:fixVehicle", vehicleNetId)
    end
  })
end)
-- Repair vehicle button
RageUI.Button("R\195\169parer le v\195\169hicule", "R\195\169parer le v\195\169hicule", { RightLabel = "\226\157\172" }, true, {
  onSelected = function()
    local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if playerVehicle == 0 then
      config.notification("Vous n'\195\170tes pas dans un v\195\169hicule")
      return
    end
    -- Trigger server event to repair the vehicle
    TriggerServerEvent("gunware:sync:data", "vehicule_repair", { veh = NetworkGetNetworkIdFromEntity(playerVehicle) })
  end
})

-- Delete vehicle button
RageUI.Button("Supprimer le v\195\169hicule", "Supprimer le v\195\169hicule", { RightLabel = "\226\173\149" }, true, {
  onSelected = function()
    local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if playerVehicle == 0 then
      config.notification("Vous n'\195\170tes pas dans un v\195\169hicule")
      return
    end
    -- Trigger server event to delete the vehicle
    TriggerServerEvent("gunware:sync:data", "vehicule_delete", { veh = NetworkGetNetworkIdFromEntity(playerVehicle) })
  end
})

-- Vehicle color list
RageUI.List("Couleur du v\195\169hicule", {
  "Al\195\169atoire",
  "Noir",
  "Blanc",
  "Gris",
  "Argent",
  "Rouge",
  "Bleu",
  "Jaune",
  "Vert",
  "Rose"
}, client.cache.vehicleColor, nil, {
  onListChange = function(selectedIndex, listItem)
    client.cache.vehicleColor = selectedIndex
  end,
  onSelected = function(selectedIndex, listItem)
    local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if playerVehicle == 0 then
      config.notification("Vous n'\195\170tes pas dans un v\195\169hicule")
      return
    end

    local color = { r = 0, g = 0, b = 0 }

    if selectedIndex == 1 then
      -- Random color
      color = { r = math.random(0, 255), g = math.random(0, 255), b = math.random(0, 255) }
    elseif selectedIndex == 2 then
      -- Black
      color = { r = 0, g = 0, b = 0 }
    elseif selectedIndex == 3 then
      -- White
      color = { r = 255, g = 255, b = 255 }
    elseif selectedIndex == 4 then
      -- Gray
      color = { r = 128, g = 128, b = 128 }
    elseif selectedIndex == 5 then
      -- Silver
      color = { r = 192, g = 192, b = 192 }
    elseif selectedIndex == 6 then
      -- Red
      color = { r = 255, g = 0, b = 0 }
    elseif selectedIndex == 7 then
      -- Blue
      color = { r = 0, g = 0, b = 255 }
    elseif selectedIndex == 8 then
      -- Yellow
      color = { r = 255, g = 255, b = 0 }
    elseif selectedIndex == 9 then
      -- Green
      color = { r = 0, g = 255, b = 0 }
    elseif selectedIndex == 10 then
      -- Pink
      color = { r = 255, g = 192, b = 203 }
    end

    -- Trigger server event to change vehicle color
    TriggerServerEvent("gunware:sync:data", "vehicule_color", { veh = NetworkGetNetworkIdFromEntity(playerVehicle), color = color })
  end
}, true)

-- Break windows button
RageUI.Button("Casser les fen\195\170tres", "Casser les fen\195\170tres", { RightLabel = "\240\159\170\159" }, true, {
  onSelected = function()
    local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if playerVehicle == 0 then
      config.notification("Vous n'\195\170tes pas dans un v\195\169hicule")
      return
    end
    -- Trigger server event to break vehicle windows
    TriggerServerEvent("gunware:sync:data", "vehicule_breakWindow", { veh = NetworkGetNetworkIdFromEntity(playerVehicle) })
  end
})

-- Break engine button
RageUI.Button("Casser le moteur", "Casser le moteur", { RightLabel = "\240\159\148\167" }, true, {
  onSelected = function()
    local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if playerVehicle == 0 then
      config.notification("Vous n'\195\170tes pas dans un v\195\169hicule")
      return
    end
    -- Trigger server event to break the vehicle engine
    TriggerServerEvent("gunware:sync:data", "vehicule_breakEngine", { veh = NetworkGetNetworkIdFromEntity(playerVehicle) })
  end
})

-- Break tires button
RageUI.Button("Crever les pneus", "Crever les pneus", { RightLabel = "\240\159\148\167" }, true, {
  onSelected = function()
    local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if playerVehicle == 0 then
      config.notification("Vous n'\195\170tes pas dans un v\195\169hicule")
      return
    end
    -- Trigger server event to break vehicle tires
    TriggerServerEvent("gunware:sync:data", "vehicule_breakTires", { veh = NetworkGetNetworkIdFromEntity(playerVehicle) })
  end
})

-- Break doors button
RageUI.Button("Casser les portes", "Casser les portes", { RightLabel = "\240\159\148\167" }, true, {
  onSelected = function()
    local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if playerVehicle == 0 then
      config.notification("Vous n'\195\170tes pas dans un v\195\169hicule")
      return
    end
    -- Trigger server event to break vehicle doors
    TriggerServerEvent("gunware:sync:data", "vehicule_breakDoors", { veh = NetworkGetNetworkIdFromEntity(playerVehicle) })
  end
})

-- Freeze/Unfreeze vehicle button
local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
local isFrozen = IsEntityPositionFrozen(playerVehicle)
local freezeText = isFrozen and "\240\159\167\138" or "\226\154\171"

RageUI.Button("Freeze / Unfreeze le v\195\169hicule", "Freeze / Unfreeze le v\195\169hicule", { RightLabel = freezeText }, true, {
  onSelected = function()
    local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if playerVehicle == 0 then
      config.notification("Vous n'\195\170tes pas dans un v\195\169hicule")
      return
    end
    -- Trigger server event to freeze/unfreeze the vehicle
    TriggerServerEvent("gunware:sync:data", "player_freezeVehicle", { veh = NetworkGetNetworkIdFromEntity(playerVehicle) })
  end
})


-- Player Management Menu
RageUI.IsVisible(playerManagementMenu, function()
  local function countTable(tableToCount)
    local count = 0
    for _ in pairs(tableToCount) do
      count = count + 1
    end
    return count
  end

  local function isIn(identifier, playerList)
    for _, player in pairs(playerList) do
      if player.identifier == identifier then
        return true
      end
    end
    return false
  end

  -- List of online/offline players
  RageUI.List("Gestion des joueurs", { "Joueurs en ligne", "Joueurs hors ligne" }, client.cache.playerList, nil, {
    onListChange = function(selectedIndex, listItem)
      client.cache.playerList = selectedIndex
    end,
    onActive = function()
      if DoesEntityExist(pedModel) then
        lastskindraw = nil
        DeleteEntity(pedModel)
      end
    end
  }, true)

  -- Show online players
  if client and client.cache and client.cache.playerList == 1 then
    RageUI.Separator("Nombre de joueurs ~b~ (%s)".format(countTable(PlayerServer)))

    for _, player in pairs(PlayerServer) do
      RageUI.Button("[%s] %s | ~b~%s~s~ [%s]".format(player.source, player.rp, player.name, player.roleColor .. player.role .. "~s~"), nil, { RightLabel = "\240\159\145\164" }, true, {
        onSelected = function()
          client.cache.playerSelected = player
          createPeds(player.skin)
          local playerData = "ID: %s\nNom RP: %s\nNom Steam: %s\nR\195\180le: %s\nPING: %s\nToken: %s \nDiscord: %s"
          lib.setClipboard(playerData.format(player.source, player.rp, player.name, player.roleColor .. player.role, player.ping, player.token, player.discord))
        end,
        onActive = function()
          showPlayerInfo = true
          RageUI.Info("Player informations \240\159\147\138", {
            "ID ~b~" .. player.source,
            "~s~Nom RP  ~b~" .. player.rp,
            "~s~Nom Steam ~b~" .. player.name,
            "~s~R\195\180le  ~b~" .. player.roleColor .. player.role .. "~s~",
            "~s~PING ~b~" .. player.ping,
            "~s~Discord ~b~" .. player.discord,
            "Les informations seront copi\195\169es dans\nle presse-papier si vous appuyez sur ~b~ENTR\195\137E"
          }, {})
          createPeds(player.skin)
        end
      }, showPlayerMenu)
    end
  else
    -- Show offline players
    RageUI.Separator("Joueurs hors ligne")
    for _, player in pairs(PlayerServerOffline) do
      if not isIn(player.identifier, PlayerServer) then
        RageUI.Button("%s %s".format(player.firstname, player.lastname), nil, { RightLabel = player.lastconnection }, true, {
          onSelected = function()
            client.cache.playerSelected = player
            createPeds(player.skin)
          end,
          onActive = function()
            showPlayerInfo = true
            RageUI.Info("Player informations \240\159\147\138", {
              "~s~Nom complet ~b~" .. player.firstname .. " " .. player.lastname,
              "~s~Derni\195\168re connexion  ~b~" .. player.lastconnection,
            }, {})
            createPeds(player.skin)
          end
        }, showPlayerMenu)
      end
    end
  end
end)
-- Handle player management options
if RageUI.IsVisible(playerListMenu) then
  RageUI.GoOver(playerListMenu, function()
    -- Iterate through connected players
    for i = 1, #playerList do
      local playerData = playerList[i]
      RageUI.Button(playerData.name, nil, { RightLabel = "→" }, true, {
        onSelected = function()
          -- Store selected player data in client cache
          client.cache.playerSelected = playerData
        end,
      })
    end
  end)
end

if RageUI.IsVisible(playerManagementMenu) then
  RageUI.GoOver(playerManagementMenu, function()
    -- Separator for player management section
    RageUI.Separator("Gestion de | ~b~Joueur~s~")

    -- Display all skins
    for i = 1, #skinList do
      local skinData = skinList[i]

      -- Button for each skin
      RageUI.Button(skinData.firstname .. " " .. skinData.lastname, e, { RightLabel = "→" }, true, {
        onSelected = function()
          -- Update cached player skin selection
          client.cache.playerSelected2 = skinData
          -- Load the selected ped
          createPeds(skinData.skin)
        end,
        onActive = function()
          --Load the selected ped
          createPeds(skinData.skin)
        end,
      })
    end
  end)
end

if RageUI.IsVisible(offlinePlayerManagementMenu) then
  RageUI.GoOver(offlinePlayerManagementMenu, function()
    -- Check if the player is online before attempting offline management
    if not IsIn(client.cache.playerSelected2.identifier, PlayerServer) then
      -- Separator for offline player management
      RageUI.Separator("Gestion Offline de | [~b~%s %s~s~]", client.cache.playerSelected2.firstname, client.cache.playerSelected2.lastname)
      RageUI.Line()

      -- Button to connect the player to their account
      RageUI.Button("Se connecter à son compte", "Se connecter à son compte", { RightLabel = "→" }, true, {
        onSelected = function()
          -- Trigger server event to connect the player
          TriggerServerEvent("gunware:sync:connectPlayer", client.cache.playerSelected2.identifier)
        end,
      })

      -- Button to change the player's spawn position
      RageUI.Button("Changer sa position de spawn", "Changer sa position de spawn", { RightLabel = "→" }, true, {
        onSelected = function()
          -- Get the current player ped coordinates
          local coords = GetEntityCoords(PlayerPedId())

          -- Trigger server event to change the spawn position
          TriggerServerEvent("changespawn:coords", {
            target = client.cache.playerSelected2.identifier,
            position = {
              x = coords.x,
              y = coords.y,
              z = coords.z,
              heading = GetEntityHeading(PlayerPedId()),
            },
          })
        end,
      })

      -- Button to teleport to the player
      RageUI.Button("Tp sur le joueur", "Tp sur le joueur", { RightLabel = "→" }, true, {
        onSelected = function()
          -- Trigger server event to teleport to the player
          TriggerServerEvent("gunware:sync:actionPlayer", "player_tp", {
            target = GetPlayerServerId(PlayerId()),
            x = client.cache.playerSelected2.position.x,
            y = client.cache.playerSelected2.position.y,
            z = client.cache.playerSelected2.position.z,
          })
        end,
      })
    end
  end)
end

-- Handle selected player management options
if RageUI.IsVisible(selectedPlayerManagementMenu) then
  RageUI.GoOver(selectedPlayerManagementMenu, function()
    local selectedPlayer = PlayerServer[client.cache.playerSelected.source]

    if selectedPlayer then
      -- Separator for selected player management
      RageUI.Separator("Gestion de [%s] %s | ~b~%s~s~", client.cache.playerSelected.source, client.cache.playerSelected.rp, client.cache.playerSelected.name)
      RageUI.Line()

      -- Button to view player information
      RageUI.Button("Informations", "Informations sur le joueur", { RightLabel = "→" }, true, {
        onActive = function()
          local player = client.cache.playerSelected
          -- Display player information
          RageUI.Info("Player informations", {
            "ID ~b~" .. player.source,
            "Nom RP  ~b~" .. player.rp,
            "Nom Steam ~b~" .. player.name,
            "Rôle  ~b~" .. player.roleColor .. player.role .. "~s~",
            "PING ~b~" .. player.ping,
            "Discord ~b~" .. player.discord,
            "Les informations seront copiées dans\nle presse-papier si vous appuyez sur ~b~ENTRÉE",
          }, {})
        end,
      })

      -- Button to remove the staff rank from the player
      RageUI.Button("Retirer le rank staff", nil, { RightLabel = "→" }, true, {
        onSelected = function()
          -- Trigger server event to remove the role
          TriggerServerEvent("gunware:sync:role", "remove", {
            target = client.cache.playerSelected.source,
            role = player.role,
          })
        end,
      })

      -- Button to add a rank to the player
      RageUI.Button("Ajouter un rank", nil, { RightLabel = "→" }, true, {
        onSelected = function()
          -- Open input dialog to get the rank name
          local input = lib.inputDialog("Ajouter un rank", {
            {
              type = "input",
              label = "Nom du rank",
              description = "ex: admin",
              required = true,
              min = 1,
              max = 36,
            },
          })

          -- Trigger server event to add the role
          TriggerServerEvent("gunware:sync:role", "add", {
            target = client.cache.playerSelected.source,
            role = input[1],
          })
        end,
      })

      -- Button to revive the player
      RageUI.Button("Revive", "Revive le joueur", { RightLabel = "→" }, true, {
        onSelected = function()
          -- Trigger server event to revive the player
          TriggerServerEvent("gunware:sync:actionPlayer", "player_revive", { target = client.cache.playerSelected.source })
        end,
      })

      -- Button to heal the player
      RageUI.Button("Heal", "Heal le joueur", { RightLabel = "→" }, true, {
        onSelected = function()
          -- Trigger server event to heal the player
          TriggerServerEvent("gunware:sync:actionPlayer", "player_heal", { target = client.cache.playerSelected.source })
        end,
      })

      -- Button to clean the player
      RageUI.Button("Nettoyer", "Nettoyer le joueur", { RightLabel = "→" }, true, {
        onSelected = function()
          -- Trigger server event to clean the player
          TriggerServerEvent("gunware:sync:actionPlayer", "player_clean", { target = client.cache.playerSelected.source })
        end,
      })

      -- Button to clear stuck props on the player
      RageUI.Button("Clear stuck props", "Clear stuck props", { RightLabel = "→" }, true, {
        onSelected = function()
          -- Trigger server event to clear stuck props
          TriggerServerEvent("gunware:sync:actionPlayer", "player_clearProps", { target = client.cache.playerSelected.source })
        end,
      })

      -- Button to teleport to the player
      RageUI.Button("Goto", "Se téléporter sur le joueur", { RightLabel = "→" }, true, {
        onSelected = function()
          -- Trigger server event to teleport to the player
          TriggerServerEvent("gunware:sync:actionPlayer", "player_goto", {
            target = client.cache.playerSelected.source,
            src = GetPlayerServerId(PlayerId()),
          })
        end,
      })

      -- Button to teleport the player to your waypoint
      RageUI.Button("Téléporter sur mon waypoint", "Téléporter le joueur sur votre waypoint", { RightLabel = "→" }, true, {
        onSelected = function()
          local blip = GetFirstBlipInfoId(8) -- Get the first waypoint blip

          if DoesBlipExist(blip) then
            Citizen.CreateThread(function()
              local blipCoords = GetBlipInfoIdCoord(blip)
              local foundGround = false
              local groundZ = -500.0
              local increment = 0.0

              -- Find the ground Z coordinate at the waypoint
              while not foundGround do
                increment = increment + 10.0
                RequestCollisionAtCoord(blipCoords.x, blipCoords.y, groundZ)
                Citizen.Wait(0)

                local success, z = GetGroundZFor_3dCoord(blipCoords.x, blipCoords.y, groundZ)
                groundZ = z
                foundGround = success

                if not foundGround then
                  if increment >= 2000.0 then
                    foundGround = true
                  end
                end
                groundZ = groundZ + increment
              end

              -- Trigger server event to teleport the player to the waypoint
              TriggerServerEvent("gunware:sync:actionPlayer", "player_tp", {
                target = client.cache.playerSelected.source,
                x = blipCoords.x,
                y = blipCoords.y,
                z = groundZ,
                inVeh = true,
              })
            end)
          else
            TriggerEvent("gunware:notif", "info", "Aucun marqueur sur la carte")
          end
        end,
      })

      -- Button to teleport the player to your waypoint (in their vehicle)
      RageUI.Button("Téléporter sur mon waypoint (dans son véhicule)", "Téléporter le joueur sur votre waypoint dans son véhicule", { RightLabel = "→" }, true, {
        onSelected = function()
          local blip = GetFirstBlipInfoId(8) -- Get the first waypoint blip

          if DoesBlipExist(blip) then
            Citizen.CreateThread(function()
              local blipCoords = GetBlipInfoIdCoord(blip)
              local foundGround = false
              local groundZ = -500.0
              local increment = 0.0

              -- Find the ground Z coordinate at the waypoint
              while not foundGround do
                increment = increment + 10.0
                RequestCollisionAtCoord(blipCoords.x, blipCoords.y, groundZ)
                Citizen.Wait(0)

                local success, z = GetGroundZFor_3dCoord(blipCoords.x, blipCoords.y, groundZ)
                groundZ = z
                foundGround = success

                if not foundGround then
                  if increment >= 2000.0 then
                    foundGround = true
                  end
                end
                groundZ = groundZ + increment
              end

              -- Trigger server event to teleport the player to the waypoint
              TriggerServerEvent("gunware:sync:actionPlayer", "player_tp", {
                target = client.cache.playerSelected.source,
                x = blipCoords.x,
                y = blipCoords.y,
                z = groundZ,
                inVeh = true,
              })
            end)
          else
            TriggerEvent("gunware:notif", "info", "Aucun marqueur sur la carte")
          end
        end,
      })
    end
  end)
end
local TriggerEvent = TriggerEvent
local notificationEvent = "gunware:notif"
local notificationType = "info"
local noMarkerMessage = "Aucun marqueur sur la carte"

-- Display notification if no marker is present.
TriggerEvent(notificationEvent, notificationType, noMarkerMessage)

-- Teleport player randomly button
local teleportRandomButton = RageUI.Button
local teleportRandomText = "Téléporter aléatoirement"
local teleportRandomDescription = "Téléporter le joueur aléatoirement"
local teleportRandomOptions = { RightLabel = "→" }
local teleportRandomEnabled = true
local teleportRandomEvents = {}

function teleportRandomEvents.onSelected()
  local randomX = math.random(-1000, 1000)
  local randomY = math.random(-1000, 1000)
  local randomPosition = vector2(randomX, randomY)
  local foundGround = false
  local groundZ = -500.0
  local groundHeight = 0.0

  -- Find ground Z coordinate
  while not foundGround do
    groundZ = groundZ + 10.0
    RequestCollisionAtCoord(randomPosition.x, randomPosition.y, groundZ)
    Citizen.Wait(0)
    local success, zCoord = GetGroundZFor_3dCoord(randomPosition.x, randomPosition.y, groundZ)
    groundHeight = zCoord
    foundGround = success

    if not foundGround then
      if groundZ >= 2000.0 then
        foundGround = true
      end
    end
  end

  -- Trigger server event to teleport the player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_tp", {
    target = targetPlayer,
    x = randomPosition.x,
    y = randomPosition.y,
    z = groundHeight
  })
end

teleportRandomEvents.onSelected = teleportRandomEvents.onSelected
teleportRandomButton(teleportRandomText, teleportRandomDescription, teleportRandomOptions, teleportRandomEnabled, teleportRandomEvents)

-- Bring player to you button
local bringPlayerButton = RageUI.Button
local bringPlayerText = "Bring"
local bringPlayerDescription = "Téléporter le joueur sur vous"
local bringPlayerOptions = { RightLabel = "→" }
local bringPlayerEnabled = true
local bringPlayerEvents = {}

function bringPlayerEvents.onSelected()
  -- Trigger server event to teleport target player to the admin
  local targetPlayer = client.cache.playerSelected.source
  local playerPed = PlayerPedId()
  local playerCoords = GetEntityCoords(playerPed)

  TriggerServerEvent("gunware:sync:actionPlayer", "player_tp", {
    target = targetPlayer,
    x = playerCoords.x,
    y = playerCoords.y,
    z = playerCoords.z
  })
end

bringPlayerEvents.onSelected = bringPlayerEvents.onSelected
bringPlayerButton(bringPlayerText, bringPlayerDescription, bringPlayerOptions, bringPlayerEnabled, bringPlayerEvents)

-- Bring back player to original position button
local bringBackPlayerButton = RageUI.Button
local bringBackPlayerText = "Bring back"
local bringBackPlayerDescription = "Téléporter le joueur à sa position"
local bringBackPlayerOptions = { RightLabel = "→" }
local bringBackPlayerEnabled = true
local bringBackPlayerEvents = {}

function bringBackPlayerEvents.onSelected()
  -- Trigger server event to bring the target player back to their original position.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_bringBack", { target = targetPlayer })
end

bringBackPlayerEvents.onSelected = bringBackPlayerEvents.onSelected
bringBackPlayerButton(bringBackPlayerText, bringBackPlayerDescription, bringBackPlayerOptions, bringBackPlayerEnabled, bringBackPlayerEvents)

-- Freeze/Unfreeze player button
local freezePlayerButton = RageUI.Button
local freezePlayerText = "Freeze / Unfreeze"
local freezePlayerDescription = "Freeze / Unfreeze le joueur"
local freezePlayerOptions = { RightLabel = "→" }
local freezePlayerEnabled = true
local freezePlayerEvents = {}

function freezePlayerEvents.onSelected()
  -- Trigger server event to freeze or unfreeze the selected player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_freeze", { target = targetPlayer })
end

freezePlayerEvents.onSelected = freezePlayerEvents.onSelected
freezePlayerButton(freezePlayerText, freezePlayerDescription, freezePlayerOptions, freezePlayerEnabled, freezePlayerEvents)

-- Hurt player button
local hurtPlayerButton = RageUI.Button
local hurtPlayerText = "Blesser"
local hurtPlayerDescription = "Blesser le joueur"
local hurtPlayerOptions = { RightLabel = "→" }
local hurtPlayerEnabled = true
local hurtPlayerEvents = {}

function hurtPlayerEvents.onSelected()
  -- Trigger server event to hurt the selected player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_hurt", { target = targetPlayer })
end

hurtPlayerEvents.onSelected = hurtPlayerEvents.onSelected
hurtPlayerButton(hurtPlayerText, hurtPlayerDescription, hurtPlayerOptions, hurtPlayerEnabled, hurtPlayerEvents)

-- Blind player button
local blindPlayerButton = RageUI.Button
local blindPlayerText = "Aveugler"
local blindPlayerDescription = "Aveugler le joueur"
local blindPlayerOptions = { RightLabel = "→" }
local blindPlayerEnabled = true
local blindPlayerEvents = {}

function blindPlayerEvents.onSelected()
  -- Trigger server event to blind the selected player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_blind", { target = targetPlayer })
end

blindPlayerEvents.onSelected = blindPlayerEvents.onSelected
blindPlayerButton(blindPlayerText, blindPlayerDescription, blindPlayerOptions, blindPlayerEnabled, blindPlayerEvents)

-- Kill player button
local killPlayerButton = RageUI.Button
local killPlayerText = "Kill"
local killPlayerDescription = "Kill le joueur"
local killPlayerOptions = { RightLabel = "→" }
local killPlayerEnabled = true
local killPlayerEvents = {}

function killPlayerEvents.onSelected()
  -- Trigger server event to kill the selected player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_kill", { target = targetPlayer })
end

killPlayerEvents.onSelected = killPlayerEvents.onSelected
killPlayerButton(killPlayerText, killPlayerDescription, killPlayerOptions, killPlayerEnabled, killPlayerEvents)

-- Spectate player button
local spectatePlayerButton = RageUI.Button
local spectatePlayerText = "Spectate"
local spectatePlayerDescription = "Spectate le joueur"
local spectatePlayerOptions = { RightLabel = "→" }
local spectatePlayerEnabled = true
local spectatePlayerEvents = {}

function spectatePlayerEvents.onSelected()
  -- Trigger server event to spectate the selected player.
  local targetPlayer = client.cache.playerSelected.source
  local sourcePlayerId = GetPlayerServerId(PlayerId())
  TriggerServerEvent("gunware:sync:actionPlayer", "player_spectate", { target = targetPlayer, src = sourcePlayerId })
end

spectatePlayerEvents.onSelected = spectatePlayerEvents.onSelected
spectatePlayerButton(spectatePlayerText, spectatePlayerDescription, spectatePlayerOptions, spectatePlayerEnabled, spectatePlayerEvents)

-- Warn player button
local warnPlayerButton = RageUI.Button
local warnPlayerText = "Warn"
local warnPlayerDescription = "Warn le joueur"
local warnPlayerOptions = { RightLabel = "→" }
local warnPlayerEnabled = true
local warnPlayerEvents = {}

function warnPlayerEvents.onSelected()
  -- Open input dialog to get warn reason
  lib.inputDialog("Warn", {
    {
      type = "input",
      label = "Raison",
      description = "ex: Insulte",
      required = true,
      min = 1,
      max = 36
    }
  })
  local input = lib.inputDialog("Warn", {
    {
      type = "input",
      label = "Raison",
      description = "ex: Insulte",
      required = true,
      min = 1,
      max = 36
    }
  })

  if not input then
    return
  end

  -- Trigger server event to warn the selected player.
  local targetPlayer = client.cache.playerSelected.source
  local sourcePlayerId = GetPlayerServerId(PlayerId())
  TriggerServerEvent("gunware:sync:actionPlayer", "player_warn", { target = targetPlayer, reason = input[1], src = sourcePlayerId })
end

warnPlayerEvents.onSelected = warnPlayerEvents.onSelected
warnPlayerButton(warnPlayerText, warnPlayerDescription, warnPlayerOptions, warnPlayerEnabled, warnPlayerEvents)

-- Kick player button
local kickPlayerButton = RageUI.Button
local kickPlayerText = "Kick"
local kickPlayerDescription = "Kick le joueur"
local kickPlayerOptions = { RightLabel = "→" }
local kickPlayerEnabled = true
local kickPlayerEvents = {}

function kickPlayerEvents.onSelected()
  -- Open input dialog to get kick reason
  lib.inputDialog("Kick", {
    {
      type = "input",
      label = "Raison",
      description = "ex: Insulte",
      required = true,
      min = 1,
      max = 36
    }
  })
  local input = lib.inputDialog("Kick", {
    {
      type = "input",
      label = "Raison",
      description = "ex: Insulte",
      required = true,
      min = 1,
      max = 36
    }
  })
  if not input then
    return
  end

  -- Trigger server event to kick the selected player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_kick", { target = targetPlayer, reason = input[1] })
end

kickPlayerEvents.onSelected = kickPlayerEvents.onSelected
kickPlayerButton(kickPlayerText, kickPlayerDescription, kickPlayerOptions, kickPlayerEnabled, kickPlayerEvents)

-- Ban player button
local banPlayerButton = RageUI.Button
local banPlayerText = "Ban"
local banPlayerDescription = "Ban le joueur"
local banPlayerOptions = { RightLabel = "→" }
local banPlayerEnabled = true
local banPlayerEvents = {}

function banPlayerEvents.onSelected()
  -- Open input dialog to get ban time and reason.
  lib.inputDialog("Ban", {
    {
      type = "input",
      label = "Durée",
      description = "1",
      required = true,
      min = 1,
      max = 36
    },
    {
      type = "input",
      label = "Raison",
      description = "ex: Insulte",
      required = true,
      min = 1,
      max = 36
    }
  })
  local input = lib.inputDialog("Ban", {
    {
      type = "input",
      label = "Durée",
      description = "1",
      required = true,
      min = 1,
      max = 36
    },
    {
      type = "input",
      label = "Raison",
      description = "ex: Insulte",
      required = true,
      min = 1,
      max = 36
    }
  })

  if not input then
    return
  end

  -- Trigger server event to ban the selected player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_ban", { target = targetPlayer, time = input[1], reason = input[2] })
end

banPlayerEvents.onSelected = banPlayerEvents.onSelected
banPlayerButton(banPlayerText, banPlayerDescription, banPlayerOptions, banPlayerEnabled, banPlayerEvents)

-- Wipe player button
local wipePlayerButton = RageUI.Button
local wipePlayerText = "Wipe"
local wipePlayerDescription = "Wipe le joueur"
local wipePlayerOptions = { RightLabel = "→" }
local wipePlayerEnabled = true
local wipePlayerEvents = {}

function wipePlayerEvents.onSelected()
  -- Trigger server event to wipe the selected player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_wipe", { target = targetPlayer })
end

wipePlayerEvents.onSelected = wipePlayerEvents.onSelected
wipePlayerButton(wipePlayerText, wipePlayerDescription, wipePlayerOptions, wipePlayerEnabled, wipePlayerEvents)

RageUI.Line()

-- Teleport player to position button
local teleportToPositionButton = RageUI.Button
local teleportToPositionText = "Téléporter à une position"
local teleportToPositionDescription = "Téléporter le joueur à une position"
local teleportToPositionOptions = { RightLabel = "→" }
local teleportToPositionEnabled = true
local teleportToPositionEvents = {}

function teleportToPositionEvents.onSelected()
  -- Open input dialog to get X, Y, and Z coordinates.
  lib.inputDialog("Téléporter à une position", {
    {
      type = "input",
      label = "X",
      description = "ex: 0.0",
      required = true,
      min = 1,
      max = 36
    },
    {
      type = "input",
      label = "Y",
      description = "ex: 0.0",
      required = true,
      min = 1,
      max = 36
    },
    {
      type = "input",
      label = "Z",
      description = "ex: 0.0",
      required = true,
      min = 1,
      max = 36
    }
  })
  local input = lib.inputDialog("Téléporter à une position", {
    {
      type = "input",
      label = "X",
      description = "ex: 0.0",
      required = true,
      min = 1,
      max = 36
    },
    {
      type = "input",
      label = "Y",
      description = "ex: 0.0",
      required = true,
      min = 1,
      max = 36
    },
    {
      type = "input",
      label = "Z",
      description = "ex: 0.0",
      required = true,
      min = 1,
      max = 36
    }
  })

  if not input then
    return
  end

  -- Trigger server event to teleport the selected player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_tp", {
    target = targetPlayer,
    x = input[1],
    y = input[2],
    z = input[3]
  })
end

teleportToPositionEvents.onSelected = teleportToPositionEvents.onSelected
teleportToPositionButton(teleportToPositionText, teleportToPositionDescription, teleportToPositionOptions, teleportToPositionEnabled, teleportToPositionEvents)

-- Teleport player to top button
local teleportToTopButton = RageUI.Button
local teleportToTopText = "Téléporter tout en haut (troll)"
local teleportToTopDescription = "Téléporter le joueur tout en haut"
local teleportToTopOptions = { RightLabel = "→" }
local teleportToTopEnabled = true
local teleportToTopEvents = {}

function teleportToTopEvents.onSelected()
  -- Trigger server event to teleport the selected player to the top.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_tpTop", { target = targetPlayer })
end

teleportToTopEvents.onSelected = teleportToTopEvents.onSelected
teleportToTopButton(teleportToTopText, teleportToTopDescription, teleportToTopOptions, teleportToTopEnabled, teleportToTopEvents)

-- Enter player instance button
local enterPlayerInstanceButton = RageUI.Button
local enterPlayerInstanceText = "Entrer dans l'instance"
local enterPlayerInstanceDescription = "Entrer dans l'instance du joueur"
local enterPlayerInstanceOptions = { RightLabel = "→" }
local enterPlayerInstanceEnabled = true
local enterPlayerInstanceEvents = {}

function enterPlayerInstanceEvents.onSelected()
  -- Trigger server event to enter the instance of the selected player.
  local targetPlayer = client.cache.playerSelected.source
  local sourcePlayerId = GetPlayerServerId(PlayerId())
  TriggerServerEvent("gunware:sync:actionPlayer", "player_enterInstance", { target = targetPlayer, src = sourcePlayerId })
end

enterPlayerInstanceEvents.onSelected = enterPlayerInstanceEvents.onSelected
enterPlayerInstanceButton(enterPlayerInstanceText, enterPlayerInstanceDescription, enterPlayerInstanceOptions, enterPlayerInstanceEnabled, enterPlayerInstanceEvents)

-- Reset player instance button
local resetPlayerInstanceButton = RageUI.Button
local resetPlayerInstanceText = "Reset l'instance"
local resetPlayerInstanceDescription = "Reset l'instance du joueur"
local resetPlayerInstanceOptions = { RightLabel = "→" }
local resetPlayerInstanceEnabled = true
local resetPlayerInstanceEvents = {}

function resetPlayerInstanceEvents.onSelected()
  -- Trigger server event to reset the instance of the selected player.
  local targetPlayer = client.cache.playerSelected.source
  TriggerServerEvent("gunware:sync:actionPlayer", "player_resetInstance", { target = targetPlayer })
end

resetPlayerInstanceEvents.onSelected = resetPlayerInstanceEvents.onSelected
resetPlayerInstanceButton(resetPlayerInstanceText, resetPlayerInstanceDescription, resetPlayerInstanceOptions, resetPlayerInstanceEnabled, resetPlayerInstanceEvents)

RageUI.Line()

-- Send message button
local sendMessageButton = RageUI.Button
local sendMessageText = "Envoyer un message"
local sendMessageDescription = "Envoyer un message au joueur"
local sendMessageOptions = { RightLabel = "→" }
local sendMessageEnabled = true
local sendMessageEvents = {}

function sendMessageEvents.onSelected()
  -- Open input dialog to get message.
  lib.inputDialog("Envoyer un message", {
    {
      type = "input",
      label = "Message",
      description = "ex: Bonjour",
      required = true,
      min = 1,
      max = 36
    }
  })
  local input = lib.inputDialog("Envoyer un message", {
    {
      type = "input",
      label = "Message",
      description = "ex: Bonjour",
      required = true,
      min = 1,
      max = 36
    }
  })

  if not input then
    return
  end

  -- Trigger server event to send the message to the selected player.
  local targetPlayer = client.cache.playerSelected.source
-- Player Management Options

-- Ban player
RageUI.Button("Ban", "Ban le joueur", {RightLabel = "\240\159\146\166"}, true, {
  onSelected = function()
    local inputText = lib.inputDialog("Ban", {
      {
        type = "input",
        label = "Reason",
        description = "Raison du ban",
        required = true,
        min = 1,
        max = 36
      }
    })

    if not inputText then return end

    TriggerServerEvent("gunware:sync:actionPlayer", "player_ban", {
      target = client.cache.playerSelected.source,
      reason = inputText[1]
    })
  end
})

-- Kick player
RageUI.Button("Kick", "Kick le joueur", {RightLabel = "\240\159\146\166"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_kick", {target = client.cache.playerSelected.source})
  end
})

-- God mode
RageUI.Button("God mode", "God mode", {RightLabel = "\240\159\149\184"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_godmode", {target = client.cache.playerSelected.source})
  end
})

-- Invisibility
RageUI.Button("Invisible", "Invisible", {RightLabel = "\240\159\147\142"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_invisibility", {target = client.cache.playerSelected.source})
  end
})

-- Freeze player
RageUI.Button("Freeze", "Freeze", {RightLabel = "\240\159\143\150"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_freeze", {target = client.cache.playerSelected.source})
  end
})

-- Spectate
RageUI.Button("Spectate", "Spectate", {RightLabel = "\240\159\141\171"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_spectate", {target = client.cache.playerSelected.source})
  end
})

-- Warp to player
RageUI.Button("Warp to player", "Se t\195\169l\195\169porter au joueur", {RightLabel = "\240\159\148\184"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_warpTo", {target = client.cache.playerSelected.source})
  end
})

-- Go to coords
RageUI.Button("Go to coords", "Se t\195\169l\195\169porter aux coordonn\195\169es du joueur", {RightLabel = "\240\159\148\184"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_goToCoords", {target = client.cache.playerSelected.source})
  end
})

-- Screenshot
RageUI.Button("Screenshot", "Prendre un screenshot du joueur", {RightLabel = "\240\159\147\184"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_screenshot", {
      target = client.cache.playerSelected.source,
      src = GetPlayerServerId(PlayerId())
    })
  end
})

-- Open inventory
RageUI.Button("Ouvrir l'inventaire", "Ouvrir l'inventaire du joueur", {RightLabel = "\240\159\142\146"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:openInventory", client.cache.playerSelected.source)
  end
})

-- Set/Remove armor
RageUI.Button("Mettre/Retirer armure", "Mettre/Retirer l'armure du joueur", {RightLabel = "\240\159\166\186"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_armor", {target = client.cache.playerSelected.source})
  end
})

RageUI.Line()

-- Repair vehicle
RageUI.Button("R\195\169parer le v\195\169hicule", "R\195\169parer le v\195\169hicule du joueur", {RightLabel = "\240\159\148\167"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_repairVehicle", {target = client.cache.playerSelected.source})
  end
})

-- Delete vehicle
RageUI.Button("Supprimer le v\195\169hicule", "Supprimer le v\195\169hicule du joueur", {RightLabel = "\226\173\149"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_deleteVehicle", {target = client.cache.playerSelected.source})
  end
})

-- Clean vehicle
RageUI.Button("Nettoyer le v\195\169hicule", "Nettoyer le v\195\169hicule du joueur", {RightLabel = "\240\159\167\188"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_cleanVehicle", {target = client.cache.playerSelected.source})
  end
})

-- Freeze/Unfreeze vehicle
RageUI.Button("Freeze / Unfreeze le v\195\169hicule", "Freeze le v\195\169hicule du joueur", {RightLabel = "\240\159\167\138"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_freezeVehicle", {target = client.cache.playerSelected.source})
  end
})

-- Break vehicle
RageUI.Button("Casser le v\195\169hicule", "Casser le v\195\169hicule du joueur", {RightLabel = "\240\159\148\167"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_breakVehicle", {target = client.cache.playerSelected.source})
  end
})

-- Eject from vehicle
RageUI.Button("Ejecter du v\195\169hicule", "Ejecter du v\195\169hicule du joueur", {RightLabel = "\240\159\148\167"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_ejectVehicle", {target = client.cache.playerSelected.source})
  end
})

RageUI.Line()

-- Transform into ped
RageUI.Button("Transformer en ped", "Transformer le joueur en ped", {RightLabel = "\240\159\145\164"}, true, {
  onSelected = function()
    local inputText = lib.inputDialog("Peds", {
      {
        type = "input",
        label = "Ped",
        description = "ex: a_m_m_skater_01",
        required = true,
        min = 1,
        max = 36
      }
    })

    if not inputText then return end

    TriggerServerEvent("gunware:sync:actionPlayer", "player_ped", {
      target = client.cache.playerSelected.source,
      ped = inputText[1]
    })
  end
})

-- Set job
RageUI.Button("Setjob", "Setjob le joueur", {RightLabel = "\240\159\145\148"}, true, {
  onSelected = function()
    local inputText = lib.inputDialog("Setjob", {
      {
        type = "input",
        label = "Job",
        description = "ex: policier",
        required = true,
        min = 1,
        max = 36
      },
      {
        type = "input",
        label = "Grade",
        description = "ex: 1",
        required = true,
        min = 1,
        max = 36
      }
    })

    if not inputText then return end

    TriggerServerEvent("gunware:sync:actionPlayer", "player_setJob", {
      target = client.cache.playerSelected.source,
      job = inputText[1],
      grade = inputText[2]
    })
  end
})

-- Give money (money / bank / dirty)
RageUI.Button("Give argent (money / bank / dirty)", "Give argent au joueur", {RightLabel = "\240\159\146\176"}, true, {
  onSelected = function()
    local inputText = lib.inputDialog("Give argent", {
      {
        type = "input",
        label = "Montant",
        description = "ex: 1000",
        required = true,
        min = 1,
        max = 36
      },
      {
        type = "input",
        label = "Type",
        description = "money / bank / dirty",
        required = true,
        min = 1,
        max = 36
      }
    })

    if not inputText then return end

    TriggerServerEvent("gunware:sync:actionPlayer", "player_giveMoney", {
      target = client.cache.playerSelected.source,
      amount = tonumber(inputText[1]),
      type = inputText[2]
    })
  end
})

-- Give item
RageUI.Button("Give item", "Give item au joueur", {RightLabel = "\240\159\142\129"}, true, {
  onSelected = function()
    local inputText = lib.inputDialog("Give item", {
      {
        type = "input",
        label = "Item",
        description = "ex: bread",
        required = true,
        min = 1,
        max = 36
      },
      {
        type = "input",
        label = "Quantit\195\169",
        description = "ex: 10",
        required = true,
        min = 1,
        max = 36
      }
    })

    if not inputText then return end

    TriggerServerEvent("gunware:sync:actionPlayer", "player_giveItem", {
      target = client.cache.playerSelected.source,
      item = inputText[1],
      amount = tonumber(inputText[2])
    })
  end
})

-- Clothing menu
RageUI.Button("Menu v\195\170tement", "Menu v\195\170tement du joueur", {RightLabel = "\240\159\145\149"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_cloth", {target = client.cache.playerSelected.source})
  end
})

-- Creation menu
RageUI.Button("Menu de cr\195\169ation", "Menu de cr\195\169ation du joueur", {RightLabel = "\240\159\145\164"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_creation", {target = client.cache.playerSelected.source})
  end
})

RageUI.Line()

-- Troll Options
RageUI.Separator("Troll options \240\159\152\138")

-- Play video
RageUI.Button("Jouer une vid\195\169o", "url youtube (xuP4g7IDgDM)", {RightLabel = "\240\159\148\138"}, true, {
  onSelected = function()
    local inputText = lib.inputDialog("Jouer une vid\195\169o", {
      {
        type = "input",
        label = "Son",
        description = "ex: url YT (xuP4g7IDgDM)",
        required = true,
        min = 1,
        max = 50
      }
    })

    TriggerServerEvent("gunware:sync:actionPlayer", "player_video", {
      target = client.cache.playerSelected.source,
      url = inputText[1]
    })
  end
})

-- Replace brake with accelerator
RageUI.Button("Remplacer le frein par l\226\128\153acc\195\169l\195\169rateur", "Remplacer le frein par l\226\128\153acc\195\169l\195\169rateur", {RightLabel = "\240\159\148\151"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_crashVehicle", {target = client.cache.playerSelected.source})
  end
})

-- Make drunk
RageUI.Button("Rendre bourr\195\169", "Rendre le joueur bourr\195\169", {RightLabel = "\240\159\141\186"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_drunk", {target = client.cache.playerSelected.source})
  end
})

-- Super jump
RageUI.Button("Super jump", "Super jump", {RightLabel = "\240\159\166\152"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_superJump", {target = client.cache.playerSelected.source})
  end
})

-- Super run
RageUI.Button("Super run", "Super run", {RightLabel = "\240\159\143\131"}, true, {
  onSelected = function()
    TriggerServerEvent("gunware:sync:actionPlayer", "player_superRun", {target = client.cache.playerSelected.source})
  end
})
-- Super Swim button
RageUI.Button("Super nage", "Super nage", { RightLabel = "\240\159\143\138" }, true, {
  onSelected = function()
    -- Trigger server event to enable super swim for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_superSwim", { target = client.cache.playerSelected.source })
  end
})

-- Set on Fire button
RageUI.Button("Mettre en feu", "Mettre le joueur en feu", { RightLabel = "\240\159\148\165" }, true, {
  onSelected = function()
    -- Trigger server event to set the selected player on fire
    TriggerServerEvent("gunware:sync:actionPlayer", "player_fire", { target = client.cache.playerSelected.source })
  end
})

-- Play Sound button
RageUI.Button("Jouer un son", "Jouer un son au joueur", { RightLabel = "\240\159\148\138" }, true, {
  onSelected = function()
    -- Get sound URL from input dialog
    local input = lib.inputDialog("Jouer un son", { { type = "input", label = "Son", description = "ex: url", required = true, min = 1, max = 50 } })
    if not input then return end

    -- Trigger server event to play sound for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_sound", { target = client.cache.playerSelected.source, sound = input[1] })
  end
})

-- Crash Player button
RageUI.Button("Faire crash", "Faire un crash au joueur", { RightLabel = "\240\159\148\165" }, true, {
  onSelected = function()
    -- Trigger server event to crash the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_crash", { target = client.cache.playerSelected.source })
  end
})

-- Lag Player button
RageUI.Button("Faire lag", "Faire lag le joueur (n\195\169cessite une deco-reco)", { RightLabel = "\240\159\147\161" }, true, {
  onSelected = function()
    -- Trigger server event to lag the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_lag", { target = client.cache.playerSelected.source })
  end
})

-- Ragdoll Player button
RageUI.Button("Ragdoll", "Ragdoll le joueur", { RightLabel = "\240\159\145\139" }, true, {
  onSelected = function()
    -- Trigger server event to ragdoll the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_slap", { target = client.cache.playerSelected.source })
  end
})

-- Explode Player button
RageUI.Button("Explode", "Explode le joueur", { RightLabel = "\240\159\146\165" }, true, {
  onSelected = function()
    -- Trigger server event to explode the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_explode", { target = client.cache.playerSelected.source })
  end
})

-- Random Outfit button
RageUI.Button("Tenue al\195\169atoire", "Mettre une tenue al\195\169atoire au joueur", { RightLabel = "\240\159\145\148" }, true, {
  onSelected = function()
    -- Trigger server event to give the selected player a random outfit
    TriggerServerEvent("gunware:sync:actionPlayer", "player_randomCloth", { target = client.cache.playerSelected.source })
  end
})

-- Play /me button
RageUI.Button("Faire jouer un /me", "Faire jouer un /me au joueur", { RightLabel = "\240\159\147\162" }, true, {
  onSelected = function()
    -- Get /me message from input dialog
    local input = lib.inputDialog("Faire jouer un /me", { { type = "input", label = "Message", description = "ex: se gratte les couilles", required = true, min = 1, max = 36 } })
    if not input then return end

    -- Trigger server event to play /me for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_me", { target = client.cache.playerSelected.source, message = input[1] })
  end
})

-- Play Animation (/e) button
RageUI.Button("Faire jouer une animation /e", "Faire jouer une animation au joueur", { RightLabel = "\240\159\149\186" }, true, {
  onSelected = function()
    -- Get animation name from input dialog
    local input = lib.inputDialog("Faire jouer une animation", { { type = "input", label = "/e", description = "ex: sit", required = true, min = 1, max = 36 } })
    if not input then return end

    -- Trigger server event to play animation for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_anim_/", { target = client.cache.playerSelected.source, anim = input[1] })
  end
})

-- Play Custom Animation button
RageUI.Button("Faire jouer une animation (custom)", "Faire jouer une animation au joueur", { RightLabel = "\240\159\149\186" }, true, {
  onSelected = function()
    -- Get animation dictionary and name from input dialog
    local input = lib.inputDialog("Faire jouer une animation", {
      { type = "input", label = "Dict", description = "ex: anim@heists@ornate_bank@hack", required = true, min = 1, max = 36 },
      { type = "input", label = "Anim", description = "ex: hack_loop", required = true, min = 1, max = 36 }
    })
    if not input then return end

    -- Trigger server event to play custom animation for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_anim", { target = client.cache.playerSelected.source, dict = input[1], anim = input[2] })
  end
})

-- Clear Animations button
RageUI.Button("Clear les animations", "Clear les animations du joueur", { RightLabel = "\240\159\149\186" }, true, {
  onSelected = function()
    -- Trigger server event to stop all animations for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_anim_stop", { target = client.cache.playerSelected.source })
  end
})

-- Clear Troll Actions button
RageUI.Button("Clear les actions trolls", "Clear les actions trolls du joueur", { RightLabel = "\240\159\167\185" }, true, {
  onSelected = function()
    -- Trigger server event to clear all troll actions for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "player_troll_clear", { target = client.cache.playerSelected.source })
  end
})

RageUI.Line()
RageUI.Separator("Options utiles")

-- Change Mask list
RageUI.List("Changer le mask", indextableskin, client.cache.mask, nil, {}, true, {
  onListChange = function(selectedValue, index)
    client.cache.mask = selectedValue
    -- Trigger server event to change mask for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "clothes_change", { target = client.cache.playerSelected.source, type = "mask_1", value = selectedValue - 1 })
  end,
  onSelected = function(selectedValue, index)
  end
})

-- Change T-Shirt list
RageUI.List("Changer le tshirt", indextableskin, client.cache.tshirt, nil, {}, true, {
  onListChange = function(selectedValue, index)
    client.cache.tshirt = selectedValue
    -- Trigger server event to change t-shirt for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "clothes_change", { target = client.cache.playerSelected.source, type = "tshirt_1", value = selectedValue })
  end,
  onSelected = function(selectedValue, index)
  end
})

-- Change Torso list
RageUI.List("Changer le torse", indextableskin, client.cache.torso, nil, {}, true, {
  onListChange = function(selectedValue, index)
    client.cache.torso = selectedValue
    -- Trigger server event to change torso for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "clothes_change", { target = client.cache.playerSelected.source, type = "torso_1", value = selectedValue })
  end,
  onSelected = function(selectedValue, index)
  end
})

-- Change Pants list
RageUI.List("Changer le bas", indextableskin, client.cache.pant, nil, {}, true, {
  onListChange = function(selectedValue, index)
    client.cache.pant = selectedValue
    -- Trigger server event to change pants for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "clothes_change", { target = client.cache.playerSelected.source, type = "pants_1", value = selectedValue })
  end,
  onSelected = function(selectedValue, index)
  end
})

-- Change Shoes list
RageUI.List("Changer les chaussures", indextableskin, client.cache.shoes, nil, {}, true, {
  onListChange = function(selectedValue, index)
    client.cache.shoes = selectedValue
    -- Trigger server event to change shoes for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "clothes_change", { target = client.cache.playerSelected.source, type = "shoes_1", value = selectedValue })
  end,
  onSelected = function(selectedValue, index)
  end
})

-- Reload Skin button
RageUI.Button("Reload skin", "Recharger la tenue du joueur", { RightLabel = "\240\159\145\149" }, true, {
  onSelected = function()
    -- Trigger server event to reload clothes for the selected player
    TriggerServerEvent("gunware:sync:actionPlayer", "clothes_reload", { target = client.cache.playerSelected.source })
  end
})

RageUI.Separator("Options pour le RP")
-- Change Player Options Menu
local function ChangePlayerName(playerSource)
  local dialogData = {}
  dialogData[1] = {
    type = "input",
    label = "Nom",
    description = "ex: John",
    required = true,
    min = 1,
    max = 36
  }
  dialogData[2] = {
    type = "input",
    label = "Prénom",
    description = "ex: Doe",
    required = true,
    min = 1,
    max = 36
  }

  local inputResult = lib.inputDialog("Changer le nom", dialogData) -- Show input dialog
  if not inputResult then
    return -- Exit if the player cancels
  end

  -- Trigger server event to update player name
  TriggerServerEvent("gunware:sync:actionPlayer", "player_name", {
    target = playerSource,
    firstname = inputResult[1],
    lastname = inputResult[2]
  })
end

local function ChangePlayerScale(playerSource)
  local dialogData = {}
  dialogData[1] = {
    type = "input",
    label = "Taille",
    description = "ex: 180",
    required = true,
    min = 1,
    max = 36
  }

  local inputResult = lib.inputDialog("Changer la taille", dialogData) -- Show input dialog
  if not inputResult then
    return -- Exit if the player cancels
  end

  -- Trigger server event to update player scale
  TriggerServerEvent("gunware:sync:actionPlayer", "player_scale", {
    target = playerSource,
    scale = inputResult[1]
  })
end

local function ChangePlayerBirthdate(playerSource)
  local dialogData = {}
  dialogData[1] = {
    type = "input",
    label = "Date",
    description = "ex: 01/01/2000",
    required = true,
    min = 1,
    max = 36
  }

  local inputResult = lib.inputDialog("Changer la date de naissance", dialogData) -- Show input dialog
  if not inputResult then
    return -- Exit if the player cancels
  end

  -- Trigger server event to update player birthdate
  TriggerServerEvent("gunware:sync:actionPlayer", "player_birth", {
    target = playerSource,
    birth = inputResult[1]
  })
end

local function ChangePlayerSex(playerSource)
  local dialogData = {}
  dialogData[1] = {
    type = "input",
    label = "Sexe",
    description = "ex: m / f",
    required = true,
    min = 1,
    max = 36
  }

  local inputResult = lib.inputDialog("Changer le sexe", dialogData) -- Show input dialog
  if not inputResult then
    return -- Exit if the player cancels
  end

  -- Trigger server event to update player sex
  TriggerServerEvent("gunware:sync:actionPlayer", "player_sex", {
    target = playerSource,
    sex = inputResult[1]
  })
end

RageUI.Button(
  "Changer le nom",
  "Changer le nom du joueur",
  {},
  true,
  {
    onSelected = function()
      local playerSource = client.cache.playerSelected.source
      ChangePlayerName(playerSource)
    end
  }
)

RageUI.Button(
  "Changer la taille",
  "Changer la taille du joueur",
  { RightLabel = "↕" },
  true,
  {
    onSelected = function()
      local playerSource = client.cache.playerSelected.source
      ChangePlayerScale(playerSource)
    end
  }
)

RageUI.Button(
  "Changer la date de naissance",
  "Changer la date de naissance du joueur",
  { RightLabel = "📅" },
  true,
  {
    onSelected = function()
      local playerSource = client.cache.playerSelected.source
      ChangePlayerBirthdate(playerSource)
    end
  }
)

RageUI.Button(
  "Changer le sexe",
  "Changer le sexe du joueur",
  { RightLabel = "⚤" },
  true,
  {
    onSelected = function()
      local playerSource = client.cache.playerSelected.source
      ChangePlayerSex(playerSource)
    end
  }
)

-- Server Actions Menu
local function ServerActionsMenu()
  RageUI.Button(
    "Faire un restart",
    "Redémarrer le serveur",
    { RightLabel = "⟳" },
    true,
    {
      onSelected = function()
        local alertDialogData = {
          header = "Restart serveur",
          content = "Êtes-vous sûr de vouloir redémarrer le serveur ? cette action est irréversible",
          centered = true,
          cancel = true
        }
        local result = lib.alertDialog(alertDialogData)
        if result == "confirm" then
          TriggerServerEvent("gunware:restartServer")
        end
      end
    }
  )

  RageUI.Button(
    "Kick all",
    "Expulser tous les joueurs",
    { RightLabel = "🚷" },
    true,
    {
      onSelected = function()
        local alertDialogData = {
          header = "Kick tous les joueurs",
          content = "Êtes-vous sûr de vouloir expulser tous les joueurs ? cette action est irréversible",
          centered = true,
          cancel = true
        }
        local result = lib.alertDialog(alertDialogData)
        if result == "confirm" then
          TriggerServerEvent("gunware:kickAll")
        end
      end
    }
  )

  RageUI.Button(
    "Faire une annonce",
    "Faire une annonce",
    { RightLabel = "📢" },
    true,
    {
      onSelected = function()
        local dialogData = {}
        dialogData[1] = {
          type = "input",
          label = "Annonce",
          description = "Reboot dans 1h",
          required = true,
          min = 1,
          max = 36
        }

        local inputResult = lib.inputDialog("Annonce", dialogData)
        if not inputResult then
          return
        end

        if inputResult then
          TriggerServerEvent("gunware:sendAnnonce", inputResult[1])
        end
      end
    }
  )

  RageUI.Button(
    "Faire crasher tous les joueurs",
    "Provoquer un crash pour tous les joueurs (⚠)",
    { RightLabel = "💣" },
    true,
    {
      onSelected = function()
        local alertDialogData = {
          header = "Crasher tous les joueurs",
          content = "Êtes-vous sûr de vouloir faire crasher tous les joueurs ? Cette action est irréversible.",
          centered = true,
          cancel = true
        }
        local result = lib.alertDialog(alertDialogData)
        if result == "confirm" then
          TriggerServerEvent("gunware:crashServer")
        end
      end
    }
  )

  RageUI.Button(
    "Wipe tous les véhicules des joueurs",
    "Supprimer tous les véhicules",
    { RightLabel = "🗄" },
    true,
    {
      onSelected = function()
        local alertDialogData = {
          header = "Wipe tous les véhicules",
          content = "Êtes-vous sûr de vouloir supprimer tous les véhicules des joueurs ? cette action est irréversible",
          centered = true,
          cancel = true
        }
        local result = lib.alertDialog(alertDialogData)
        if result == "confirm" then
          TriggerServerEvent("gunware:wipeVehicles")
        end
      end
    }
  )

  RageUI.Button(
    "⚠Wipe tous les joueurs du serveur ⚠",
    "Supprimer tous les joueurs du serveur",
    { RightLabel = "💣" },
    true,
    {
      onSelected = function()
        local alertDialogData = {
          header = "Wipe tous les joueurs",
          content = "Êtes-vous sûr de vouloir supprimer tous les joueurs du serveur ? cette action est irréversible",
          centered = true,
          cancel = true
        }
        local result = lib.alertDialog(alertDialogData)
        if result == "confirm" then
          TriggerServerEvent("gunware:wipePlayers")
        end
      end
    }
  )

  RageUI.Button(
    "Vider le cache du serveur",
    "Vider le cache du serveur et redémarrer (server non windows)",
    { RightLabel = "🗂" },
    true,
    {
      onSelected = function()
        TriggerServerEvent("gunware:clearCache")
      end
    }
  )

  RageUI.Button(
    "Lancer un scan de potentielles backdoors",
    "Lancer un scan pour détecter d'éventuelles backdoors",
    { RightLabel = "🕵" },
    true,
    {
      onSelected = function()
        TriggerServerEvent("gunware:scanBackdoor")
      end
    }
  )

  RageUI.Button(
    "Lancer un test AFK",
    "Ouvrir un menu AFK. Tous les joueurs qui ne répondent pas seront expulsés après 60 secondes",
    { RightLabel = "😴" },
    true,
    {
      onSelected = function()
        TriggerServerEvent("gunware:afkTest")
      end
    }
  )

  RageUI.Button(
    "Retirer tous les véhicules de la fourrière",
    "Retirer tous les véhicules de la fourrière",
    { RightLabel = "🗄" },
    true,
    {
      onSelected = function()
        TriggerServerEvent("gunware:deleteAllImpound")
      end
    }
  )
end

-- Revive/Heal Menu
local function ReviveHealMenu()
  local reviveDistances = { "10m", "50m", "100m", "1000m", "ALL" }
  client.cache.revive = client.cache.revive or 1 -- Initialize if nil
  local dist_selected

  RageUI.List(
    "Revive (zones)",
    reviveDistances,
    client.cache.revive,
    nil,
    {},
    true,
    {
      onListChange = function(selectedIndex, listItem)
        client.cache.revive = selectedIndex -- Update selected revive index
      end,
      onActive = function(selectedIndex, listItem)
        if client.cache.revive == 1 then
          dist_selected = 10.0
        elseif client.cache.revive == 2 then
          dist_selected = 50.0
        elseif client.cache.revive == 3 then
          dist_selected = 100.0
        elseif client.cache.revive == 4 then
          dist_selected = 1000.0
        end

        if client.cache.revive ~= 5 then
          local playerPed = PlayerPedId()
          local playerCoords = GetEntityCoords(playerPed)
          DrawMarker(
            25,
            playerCoords.x,
            playerCoords.y,
            playerCoords.z,
            0.0,
            0.0,
            0.0,
            0,
            0.0,
            0.0,
            dist_selected,
            dist_selected,
            dist_selected,
            255,
            0,
            0,
            200,
            false,
            false,
            2,
            false,
            false,
            false,
            false
          )
        end
      end,
      onSelected = function(selectedIndex, listItem)
        if client.cache.revive == 5 then
          TriggerServerEvent("gunware:reviveAll")
          return
        else
          if client.cache.revive == 1 then
            dist_selected = 10.0
          elseif client.cache.revive == 2 then
            dist_selected = 50.0
          elseif client.cache.revive == 3 then
            dist_selected = 100.0
          elseif client.cache.revive == 4 then
            dist_selected = 1000.0
          end
        end

        local playersInRadius = GetPlayerInRadius(dist_selected)

        for _, player in pairs(playersInRadius) do
          local serverId = GetPlayerServerId(player)
          if serverId > 0 then
            TriggerServerEvent("gunware:revive", serverId)
          end
        end
      end
    }
  )

  -- Heal Functionality
  local healDistances = { "10m", "50m", "100m", "1000m", "ALL" }
  client.cache.heal = client.cache.heal or 1 -- Initialize if nil
  RageUI.List(
    "Heal (zones)",
    healDistances,
    client.cache.heal,
    nil,
    {},
    true,
    {
      onListChange = function(selectedIndex, listItem)
        client.cache.heal = selectedIndex
      end,
      onActive = function(selectedIndex, listItem)
        if client.cache.heal == 1 then
          dist_selected = 10.0
        elseif client.cache.heal == 2 then
          dist_selected = 50.0
        elseif client.cache.heal == 3 then
          dist_selected = 100.0
        elseif client.cache.heal == 4 then
          dist_selected = 1000.0
        end

        if client.cache.heal ~= 5 then
          local playerPed = PlayerPedId()
          local playerCoords = GetEntityCoords(playerPed)
          DrawMarker(
            25,
            playerCoords.x,
            playerCoords.y,
            playerCoords.z,
            0.0,
            0.0,
            0.0,
            0,
            0.0,
            0.0,
            dist_selected,
            dist_selected,
            dist_selected,
            0,
            255,
            0,
            200,
            false,
            false,
            2,
            false,
            false,
            false,
            false
          )
        end
      end,
      onSelected = function(selectedIndex, listItem)
        if client.cache.heal == 5 then
          TriggerServerEvent("gunware:healAll")
          return
        else
          if client.cache.heal == 1 then
            dist_selected = 10.0
          elseif client.cache.heal == 2 then
            dist_selected = 50.0
          elseif client.cache.heal == 3 then
            dist_selected = 100.0
          elseif client.cache.heal == 4 then
            dist_selected = 1000.0
          end
        end

        local playersInRadius = GetPlayerInRadius(dist_selected)
        for _, player in pairs(playersInRadius) do
          local serverId = GetPlayerServerId(player)
          if serverId > 0 then
            TriggerServerEvent("gunware:heal", serverId)
          end
        end
      end
    }
  )
end

-- Check if each menu should be displayed
RageUI.IsVisible(adminMenu, function()
  ServerActionsMenu()
end)

RageUI.IsVisible(reviveMenu, function()
  ReviveHealMenu()
end)
-- Sets up admin menu options

local function SetupAdminMenu(menu)
  local function AddButton(text, description, rightLabel, enabled, callbacks)
    RageUI.Button(text, description, { RightLabel = rightLabel }, enabled, callbacks)
  end

  local function AddList(text, items, selectedIndex, listChangeCallback, selectedCallback)
    RageUI.List(text, items, selectedIndex, nil, { onListChange = listChangeCallback, onSelected = selectedCallback })
  end

  AddButton("Heal Player", "Heal a player in radius", { RightLabel = "\240\159\148\138" }, true, {
    onActive = function()
      -- Draw a marker around the player
      local healDistance = 10.0 -- Default heal distance

      -- Adjust heal distance based on client cache settings
      if client.cache.heal == 1 then
        healDistance = 10.0
      elseif client.cache.heal == 2 then
        healDistance = 50.0
      elseif client.cache.heal == 3 then
        healDistance = 100.0
      elseif client.cache.heal == 4 then
        healDistance = 1000.0
      end

      -- Draw a marker to show the heal radius if not set to heal all
      if client.cache.heal ~= 5 then
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        DrawMarker(
          25, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
          healDistance, healDistance, healDistance, 255, 0, 0, 200,
          false, false, 2, false, false, false, false
        )
      end
    end,
    onSelected = function()
      -- Heal players in radius
      if client.cache.heal == 5 then
        -- Heal all players
        TriggerServerEvent("gunware:healAll")
        return
      end

      local healDistance = 10.0 -- Default heal distance

      -- Adjust heal distance based on client cache settings
      if client.cache.heal == 1 then
        healDistance = 10.0
      elseif client.cache.heal == 2 then
        healDistance = 50.0
      elseif client.cache.heal == 3 then
        healDistance = 100.0
      elseif client.cache.heal == 4 then
        healDistance = 1000.0
      end

      local playersInRadius = GetPlayerInRadius(healDistance)

      -- Iterate through players in radius and heal them
      for _, player in pairs(playersInRadius) do
        local serverId = GetPlayerServerId(player)
        if serverId > 0 then
          TriggerServerEvent("gunware:heal", serverId)
        end
      end
    end
  })

  AddButton("Play Sound", "Play a sound to all players", { RightLabel = "\240\159\148\138" }, true, {
    onSelected = function()
      -- Opens an input dialog to get the sound URL
      local input = lib.inputDialog("Play Sound", { { type = "input", label = "Sound", description = "ex: url", required = true, min = 1, max = 50 } })

      if not input then
        return
      end

      -- Trigger server event to play the sound
      TriggerServerEvent("gunware:sync:actionPlayer", "player_sound", { target = -1, sound = input[1] })
    end
  })

  AddButton("Play Video (Everyone)", "Youtube URL (xuP4g7IDgDM)", { RightLabel = "\240\159\148\138" }, true, {
    onSelected = function()
      -- Opens an input dialog to get the YouTube video URL
      local input = lib.inputDialog("Play Video", { { type = "input", label = "Video", description = "ex: url YT (xuP4g7IDgDM)", required = true, min = 1, max = 50 } })

      -- Trigger server event to play the video
      TriggerServerEvent("gunware:sync:actionPlayer", "player_video", { target = -1, url = input[1] })
    end
  })

  AddButton("Play Animation /e", "Play animation for all players", { RightLabel = "\240\159\149\186" }, true, {
    onSelected = function()
      -- Opens an input dialog to get the animation name
      local input = lib.inputDialog("Play Animation", { { type = "input", label = "/e", description = "ex: sit", required = true, min = 1, max = 36 } })

      if not input then
        return
      end

      -- Trigger server event to play the animation
      TriggerServerEvent("gunware:sync:actionPlayer", "player_anim_/", { target = -1, anim = input[1] })
    end
  })

  AddButton("Ragdoll", "Ragdoll all players", { RightLabel = "\240\159\145\139" }, true, {
    onSelected = function()
      -- Trigger server event to ragdoll all players
      TriggerServerEvent("gunware:sync:actionPlayer", "player_slap", { target = -1 })
    end
  })

  AddButton("Reload Skin", "Reload all players clothing", { RightLabel = "\240\159\145\149" }, true, {
    onSelected = function()
      -- Trigger server event to reload players clothing
      TriggerServerEvent("gunware:sync:actionPlayer", "clothes_reload", { target = -1 })
    end
  })

  AddButton("TP ALL to Me", "Teleport all players to you", { RightLabel = "\240\159\154\182" }, true, {
    onSelected = function()
      -- Get the player's coordinates
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)

      -- Trigger server event to teleport all players to the admin
      TriggerServerEvent("gunware:tpAllToMe", { x = coords.x, y = coords.y, z = coords.z })
    end
  })

  AddButton("TP ALL to Marker", "Teleport all players to the marker", { RightLabel = "\226\156\168" }, true, {
    onSelected = function()
      -- Get the blip ID for the marker
      local blip = GetFirstBlipInfoId(8)

      -- Check if the blip exists
      if DoesBlipExist(blip) then
        Citizen.CreateThread(function()
          -- Get the marker coordinates
          local blipCoords = GetBlipInfoIdCoord(blip)

          -- Find the ground Z coordinate
          local foundGround = false
          local groundZ = -500.0

          while not foundGround do
            groundZ = groundZ + 10.0
            RequestCollisionAtCoord(blipCoords.x, blipCoords.y, groundZ)
            Citizen.Wait(0)

            local found, z = GetGroundZFor_3dCoord(blipCoords.x, blipCoords.y, groundZ)
            groundZ = z
            foundGround = found

            if not foundGround then
              if groundZ >= 2000.0 then
                foundGround = true
              end
            end
          end

          -- Trigger server event to teleport all players to the marker
          TriggerServerEvent("gunware:tpAllToMe", { x = blipCoords.x, y = blipCoords.y, z = groundZ })
        end)
      else
        -- Notify the admin that there is no marker on the map
        TriggerEvent("gunware:notif", "info", "No marker on the map")
      end
    end
  })

  AddButton("Change Time", "Change server time", { RightLabel = "\240\159\149\146" }, true, {
    onSelected = function()
      -- Opens an input dialog to get the time
      local input = lib.inputDialog("Change Time", {
        { type = "input", label = "Hour", description = "ex: 12", required = true, min = 1, max = 36 },
        { type = "input", label = "Minute", description = "ex: 00", required = true, min = 1, max = 36 }
      })

      if not input then
        return
      end

      -- Trigger server event to change the server time
      TriggerServerEvent("gunware:sync:actionServer", "server_time", { hour = input[1], minute = input[2] })
    end
  })

  -- Weather list
  local weatherOptions = {
    "EXTRA_SUNNY", "CLEAR", "CLOUDS", "SMOG", "FOGGY", "OVERCAST", "RAIN", "THUNDER", "CLEARING", "NEUTRAL", "SNOW", "BLIZZARD", "SNOWLIGHT", "XMAS"
  }

  AddList(
    "Change Weather", weatherOptions, client.cache.weather,
    function(index, item) -- onListChange
      client.cache.weather = index
    end,
    function(index, item) -- onSelected
      -- Trigger server event to change the server weather
      TriggerServerEvent("gunware:sync:actionServer", "server_weather", { weather = item })
    end
  )

  AddButton("Admin Trash", "Admin Trash", { RightLabel = "\240\159\151\145\239\184\143" }, true, {
    onSelected = function()
      -- Execute the trash command
      ExecuteCommand("trash")
    end
  })

  AddButton("Search Items", "Search items", { RightLabel = "\240\159\148\141" }, true, {
    onSelected = function()
      -- Opens an input dialog to get the item name
      local input = lib.inputDialog("Search Items", { { type = "input", label = "Item", description = "ex: bread", required = true, min = 1, max = 36 } })

      if not input then
        return
      end

      -- Execute the searchitems command
      ExecuteCommand("searchitems " .. input[1])
    end
  })

  AddButton("Item List", "List Items", { RightLabel = "\240\159\147\156" }, true, {
    onSelected = function()
      -- Execute the allitems command
      ExecuteCommand("allitems")
    end
  })
end

RageUI.IsVisible(menuIdentifier, function()
  SetupAdminMenu(menuIdentifier)

  -- Display coordinates toggle button
  RageUI.Button(
    "Show Coordinates", "Show player coordinates", { RightLabel = client.cache.showCoords and "\240\159\147\141" or "\226\154\171" }, true,
    {
      onSelected = function()
        -- Copy the coordinates to the clipboard and toggle the display of coordinates
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        lib.setClipboard("vector3(%s,%s,%s)", coords.x, coords.y, coords.z)
        client.cache.showCoords = not client.cache.showCoords

        -- Continuously display the coordinates if enabled
        if client.cache.showCoords then
          Citizen.CreateThread(function()
            while true do
              if not client.cache.showCoords then
                break
              end

              local playerPed = PlayerPedId()
              local coords = GetEntityCoords(playerPed)
              local heading = GetEntityHeading(playerPed)
            end
          end)
        end
      end
    }
  )
end)
local RageUI = RageUI -- Assuming RageUI is defined elsewhere
local lib = lib -- Assuming lib is defined elsewhere

-- Function to draw 3D text at a given location
local function DrawText3D(x, y, z, text)
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  SetDrawOrigin(x, y, z, 0)
  DrawText(0.0, 0.0)
  ClearDrawOrigin()
end

if ESX then
  ESX = nil
end

-- Add buttons to the menu

-- Button to display player coordinates
RageUI.Button("Afficher mes coordonn\195\169es", "Afficher mes coordonn\195\169es", {}, true, {
  onSelected = function()
    local showCoords = not client.cache.showCoords
    client.cache.showCoords = showCoords

    if showCoords then
      -- Create a thread to continuously display coordinates
      Citizen.CreateThread(function()
        while client.cache.showCoords do
          local playerPed = PlayerPedId()
          local playerCoords = GetEntityCoords(playerPed)
          local playerHeading = GetEntityHeading(playerPed)

          -- Format the coordinates and heading
          local coordsText = string.format("X: %s Y: %s Z: %s H: %s", playerCoords.x, playerCoords.y, playerCoords.z, playerHeading)

          -- Display the coordinates in a text UI
          lib.showTextUI(coordsText, {
            position = "top-center",
            icon = "location-dot",
            style = {
              borderRadius = 0,
              backgroundColor = "#104175",
              color = "white"
            },
            iconAnimation = "fade"
          })

          Citizen.Wait(0)
        end

        lib.hideTextUI() -- Hide the text UI when the loop is stopped
      end)
    end
  end
})

-- Button to toggle display of prop information
RageUI.Button("Afficher infos props", "Afficher les infos des props", {}, client.cache.showProps and "\240\159\143\160" or "\226\154\171", {
  onSelected = function()
    local showProps = not client.cache.showProps
    client.cache.showProps = showProps

    if showProps then
      -- Create a thread to display prop information
      Citizen.CreateThread(function()
        while client.cache.showProps do
          -- Iterate through all objects in the game
          local objects = GetGamePool("CObject")
          for _, prop in pairs(objects) do
            local propCoords = GetEntityCoords(prop)
            local propModel = GetEntityModel(prop)
            local propHash = GetHashKey(propModel)
            local propArchetype = GetEntityArchetypeName(prop)

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - propCoords)

            -- Display prop information if within a certain distance
            if distance < 10 then
              local text = string.format("~r~Model: ~s~%s\n~g~Hash: ~s~%s\n~b~Archetype: ~s~%s\n~y~Distance: ~s~%s", propModel, propHash, propArchetype, distance)
              DrawText3D(propCoords.x, propCoords.y, propCoords.z + 0.98, text)
            end
          end

          Citizen.Wait(0)
        end
      end)
    end
  end
})

-- Button to toggle display of vehicle information
RageUI.Button("Afficher infos vehicules", "Afficher les infos des vehicules", {}, client.cache.showVehicles and "\240\159\154\152" or "\226\154\171", {
  onSelected = function()
    local showVehicles = not client.cache.showVehicles
    client.cache.showVehicles = showVehicles

    if showVehicles then
      -- Create a thread to display vehicle information
      Citizen.CreateThread(function()
        while client.cache.showVehicles do
          -- Iterate through all vehicles in the game
          local vehicles = GetGamePool("CVehicle")
          for _, vehicle in pairs(vehicles) do
            local vehicleCoords = GetEntityCoords(vehicle)
            local vehicleModel = GetEntityModel(vehicle)
            local vehicleHash = GetHashKey(vehicleModel)
            local vehicleArchetype = GetEntityArchetypeName(vehicle)
            local vehicleFuelLevel = GetVehicleFuelLevel(vehicle)

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - vehicleCoords)

            -- Display vehicle information if within a certain distance
            if distance < 10 then
              local text = string.format("~r~Model: ~s~%s\n~b~Archetype: ~s~%s\n~o~Fuel: ~s~%sL", vehicleModel, vehicleArchetype, vehicleFuelLevel)
              DrawText3D(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.98, text)
            end
          end

          Citizen.Wait(0)
        end
      end)
    end
  end
})

-- Button to toggle display of ped information
RageUI.Button("Afficher infos peds", "Afficher les infos des peds", {}, client.cache.showPeds and "\240\159\145\165" or "\226\154\171", {
  onSelected = function()
    local showPeds = not client.cache.showPeds
    client.cache.showPeds = showPeds

    if showPeds then
      -- Create a thread to display ped information
      Citizen.CreateThread(function()
        while client.cache.showPeds do
          -- Iterate through all peds in the game
          local peds = GetGamePool("CPed")
          for _, ped in pairs(peds) do
            local pedCoords = GetEntityCoords(ped)
            local pedModel = GetEntityModel(ped)
            local pedHash = GetHashKey(pedModel)
            local pedArchetype = GetEntityArchetypeName(ped)
            local pedScript = GetEntityScript(ped)
            if not pedScript then
              pedScript = "Aucun"
            end

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - pedCoords)

            -- Display ped information if within a certain distance
            if distance < 10 then
              local text = string.format("~r~Model: ~s~%s\n~b~Archetype: ~s~%s\n~y~Script: ~s~%s\n~y~Distance: ~s~%s", pedModel, pedArchetype, pedScript, distance)
              DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z + 0.98, text)
            end
          end

          Citizen.Wait(0)
        end
      end)
    end
  end
})

-- Button to create a safe zone (session)
RageUI.Button("Cr\195\169er une zones safe (session)", "Cr\195\169er une zones safe", {}, "\240\159\154\167", {
  onSelected = function()
    -- Prompt the user for the safe zone radius
    local input = lib.inputDialog("Cr\195\169er une zones safe", {
      {type = "input", label = "Radius", description = "Exemple: 10.0", required = true, min = 1, max = 100}
    })

    if not input then
      return
    end

    local radius = tonumber(input[1])
    if not radius then
      TriggerEvent("gunware:notif", "error", "Veuillez entrer un nombre")
      return
    end

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Create the safe zone data
    local safeZoneData = {
      x = playerCoords.x,
      y = playerCoords.y,
      z = playerCoords.z,
      radius = radius + 1.0
    }

    -- Trigger a server event to add the safe zone
    TriggerServerEvent("gunware:sync:data", "safezone_add_new", safeZoneData)
  end
})

-- Button to create a safe zone (permanent)
RageUI.Button("Cr\195\169er une zones safe (permanent)", "Cr\195\169er une zones safe", {}, "\240\159\154\167", {
  onSelected = function()
    -- Prompt the user for the safe zone radius
    local input = lib.inputDialog("Cr\195\169er une zones safe", {
      {type = "input", label = "Radius", description = "Exemple: 10", required = true, min = 1, max = 100}
    })

    if not input then
      return
    end

    local radius = tonumber(input[1])
    if not radius then
      TriggerEvent("gunware:notif", "error", "Veuillez entrer un nombre")
      return
    end

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Create the safe zone data
    local safeZoneData = {
      x = playerCoords.x,
      y = playerCoords.y,
      z = playerCoords.z,
      radius = radius + 1.0
    }

    -- Trigger a server event to save the safe zone data
    TriggerServerEvent("gunware:save:data", "safezone_add_new", safeZoneData)
  end
})

-- Button to list safe zones
RageUI.Button("Liste des zones safe", "Liste des zones safe", {}, "\240\159\154\167", {
  onSelected = function()
    -- TODO: Implement functionality to list safe zones
  end
})

-- Button to create a blip (session)
RageUI.Button("Cr\195\169er un blips (session)", "Cr\195\169er un blips", {}, "\226\156\168", {
  onSelected = function()
    -- Get the player's coordinates
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Prompt the user for blip information
    local input = lib.inputDialog("Dialog title", {
      {type = "number", label = "Sprite", description = "Exemple: 1", required = true, min = 1, max = 162},
      {type = "number", label = "Color", description = "Exemple: 1", required = true, min = 1, max = 162},
      {type = "input", label = "Nom", description = "Exemple: GunWare", required = true, min = 4, max = 16}
    })

    if not input then
      return
    end

    -- Create the blip data
    local blipData = {
      x = playerCoords.x,
      y = playerCoords.y,
      z = playerCoords.z,
      id = input[1],
      colour = input[2],
      title = input[3]
    }

    -- Trigger a server event to add the blip
    TriggerServerEvent("gunware:sync:data", "blips_add_new", blipData)
  end
})

-- Button to create a blip (permanent)
RageUI.Button("Cr\195\169er un blips (permanent)", "Cr\195\169er un blips", {}, "\226\156\168", {
  onSelected = function()
    -- Get the player's coordinates
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- Prompt the user for blip information
    local input = lib.inputDialog("Information du blips", {
      {type = "number", label = "Sprite", description = "Exemple: 1", required = true, min = 1, max = 162},
      {type = "number", label = "Color", description = "Exemple: 1", required = true, min = 1, max = 162},
      {type = "input", label = "Nom", description = "Exemple: GunWare", required = true, min = 4, max = 16}
    })

    if not input then
      return
    end

    -- Create the blip data
    local blipData = {
      x = playerCoords.x,
      y = playerCoords.y,
      z = playerCoords.z,
      id = input[1],
      colour = input[2],
      title = input[3]
    }

    -- Trigger a server event to save the blip data
    TriggerServerEvent("gunware:save:data", "blips_add_new", blipData)
  end
})
-- Blips Submenu
RageUI = RageUI or {}

-- Button: List of Created Blips
RageUI.Button(
  "List of Created Blips", -- Label
  "List of blips", -- Description
  { RightLabel = "->" }, -- Options
  true, -- Enabled
  {}, -- Object
  listBlips -- Function from another part of the code
)

-- Button: Create Teleport (Session)
RageUI.Button(
  "Create Teleport (Session)", -- Label
  "Create a teleport between two points", -- Description
  { RightLabel = "A+" }, -- Options
  true, -- Enabled
  {}, -- Object
  function()
    local firstPointCreated = false
    local coords1
    local coords2
    while true do
      Citizen.Wait(0)
      local playerPed = PlayerPedId()
      local playerCoords = GetEntityCoords(playerPed)

      -- Draw marker at player's position
      DrawMarker(
        1,
        playerCoords.x,
        playerCoords.y,
        playerCoords.z,
        0,
        0,
        0,
        0,
        0,
        0,
        1.0,
        1.0,
        1.0,
        255,
        0,
        0,
        255,
        false,
        false,
        2,
        false,
        false,
        false,
        false
      )

      config.HelpText("Press ~r~E~s~ to create the teleport points")

      if IsControlJustPressed(0, 51) then -- Check for 'E' key press
        if not firstPointCreated then
          -- First Point
          firstPointCreated = true
          coords1 = playerCoords
          config.notification("First teleport point created")
        else
          -- Second Point
          firstPointCreated = false
          coords2 = playerCoords
          config.notification("Second teleport point created")

          -- Create teleport data table
          local teleportData = {}
          teleportData.coords1 = coords1
          teleportData.coords2 = coords2

          -- Trigger server event to add the new teleport
          TriggerServerEvent("gunware:sync:data", "teleport_add_new", teleportData)
          config.notification("Teleport created")
          break -- Exit the loop
        end
      end
    end
  end
)

-- Button: Create Teleport (Permanent)
RageUI.Button(
  "Create Teleport (Permanent)", -- Label
  "Create a teleport between two points", -- Description
  { RightLabel = "A+" }, -- Options
  true, -- Enabled
  {}, -- Object
  function()
    local firstPointCreated = false
    local coords1
    local coords2
    while true do
      Citizen.Wait(0)
      local playerPed = PlayerPedId()
      local playerCoords = GetEntityCoords(playerPed)

      -- Draw marker at player's position
      DrawMarker(
        1,
        playerCoords.x,
        playerCoords.y,
        playerCoords.z,
        0,
        0,
        0,
        0,
        0,
        0,
        1.0,
        1.0,
        1.0,
        255,
        0,
        0,
        255,
        false,
        false,
        2,
        false,
        false,
        false,
        false
      )

      config.HelpText("Press ~r~E~s~ to create the teleport points")

      if IsControlJustPressed(0, 51) then -- Check for 'E' key press
        if not firstPointCreated then
          -- First Point
          firstPointCreated = true
          coords1 = playerCoords
          config.notification("First teleport point created")
        else
          -- Second Point
          firstPointCreated = false
          coords2 = playerCoords
          config.notification("Second teleport point created")

          -- Create teleport data table
          local teleportData = {}
          teleportData.coords1 = coords1
          teleportData.coords2 = coords2

          -- Trigger server event to save the new teleport data
          TriggerServerEvent("gunware:save:data", "teleport_add_new", teleportData)
          config.notification("Teleport created")
          break -- Exit the loop
        end
      end
    end
  end
)

-- Button: List of Created Teleports
RageUI.Button(
  "List of Created Teleports", -- Label
  "List of teleports", -- Description
  { RightLabel = "A+" }, -- Options
  true, -- Enabled
  {}, -- Object
  listTeleports -- Function from another part of the code
)

-- Button: Create Marker (Session)
RageUI.Button(
  "Create Marker (Session)", -- Label
  "Create a marker", -- Description
  { RightLabel = "" }, -- Options
  true, -- Enabled
  {}, -- Object
  function()
    local playerCoords = GetEntityCoords(PlayerPedId())

    -- Get marker type input from player
    local input = lib.inputDialog("Type of marker", { { type = "number", label = "Type", description = "Example: 1", required = true, min = 1, max = 36 } })

    -- Create marker data table
    local markerData = {}
    markerData.id = input[1]
    markerData.x = playerCoords.x
    markerData.y = playerCoords.y
    markerData.z = playerCoords.z - 0.98

    -- Trigger server event to add the new marker
    TriggerServerEvent("gunware:sync:data", "marker_add_new", markerData)
  end
)

-- Button: Create Marker (Permanent)
RageUI.Button(
  "Create Marker (Permanent)", -- Label
  "Create a marker", -- Description
  { RightLabel = "" }, -- Options
  true, -- Enabled
  {}, -- Object
  function()
    local playerCoords = GetEntityCoords(PlayerPedId())

    -- Get marker type input from player
    local input = lib.inputDialog("Type of marker", { { type = "number", label = "Type", description = "Example: 1", required = true, min = 1, max = 36 } })

    -- Create marker data table
    local markerData = {}
    markerData.id = input[1]
    markerData.x = playerCoords.x
    markerData.y = playerCoords.y
    markerData.z = playerCoords.z - 0.98

    -- Trigger server event to save the new marker data
    TriggerServerEvent("gunware:save:data", "marker_add_new", markerData)
  end
)

-- Button: List of Created Markers
RageUI.Button(
  "List of Created Markers", -- Label
  "List of markers", -- Description
  { RightLabel = "" }, -- Options
  true, -- Enabled
  {}, -- Object
  listMarkers -- Function from another part of the code
)

-- Button: Create Ped (Session)
RageUI.Button(
  "Create Ped (Session)", -- Label
  "Create a ped", -- Description
  { RightLabel = "" }, -- Options
  true, -- Enabled
  {}, -- Object
  function()
    local playerCoords = GetEntityCoords(PlayerPedId())

    -- Get ped model input from player
    local input = lib.inputDialog("Type of ped", { { type = "input", label = "Model", description = "mp_m_freemode_01", required = true } })

    -- Create ped data table
    local pedData = {}
    pedData.id = input[1]
    pedData.x = playerCoords.x
    pedData.y = playerCoords.y
    pedData.z = playerCoords.z - 0.98

    -- Trigger server event to add the new ped
    TriggerServerEvent("gunware:sync:data", "ped_add_new", pedData)
  end
)

-- Button: Create Ped (Permanent)
RageUI.Button(
  "Create Ped (Permanent)", -- Label
  "Create a ped", -- Description
  { RightLabel = "" }, -- Options
  true, -- Enabled
  {}, -- Object
  function()
    local playerCoords = GetEntityCoords(PlayerPedId())

    -- Get ped model input from player
    local input = lib.inputDialog("Type of ped", { { type = "input", label = "Model", description = "mp_m_freemode_01", required = true } })

    -- Create ped data table
    local pedData = {}
    pedData.id = input[1]
    pedData.x = playerCoords.x
    pedData.y = playerCoords.y
    pedData.z = playerCoords.z - 0.98

    -- Trigger server event to save the new ped data
    TriggerServerEvent("gunware:save:data", "ped_add_new", pedData)
  end
)

-- Button: List of Created Peds
RageUI.Button(
  "List of Created Peds", -- Label
  "List of peds", -- Description
  { RightLabel = "" }, -- Options
  true, -- Enabled
  {}, -- Object
  listPeds -- Function from another part of the code
)

-- List: Delete Vehicles (radius)
RageUI.List(
  "Delete Vehicles (radius)", -- Label
  { "10m", "100m", "200m", "500m", "1000m" }, -- Items
  client.cache.deleteVehicleRadius or 1, -- Index
  nil, -- Description
  {}, -- Object
  true, -- Enabled
  {
    onListChange = function(index, item)
      client.cache.deleteVehicleRadius = index
    end,
    onSelected = function(index, item)
      local radius = 0
      if index == 1 then
        radius = 50
      elseif index == 2 then
        radius = 100
      elseif index == 3 then
        radius = 200
      elseif index == 4 then
        radius = 500
      elseif index == 5 then
        radius = 1000
      end

      local playerCoords = GetEntityCoords(PlayerPedId())

      local data = {}
      data.radius = radius
      data.x = playerCoords.x
      data.y = playerCoords.y
      data.z = playerCoords.z

      TriggerServerEvent("gunware:sync:data", "delete_vehicle_radius", data)
    end
  }
)

-- List: Delete Peds (radius)
RageUI.List(
  "Delete Peds (radius)", -- Label
  { "50m", "100m", "200m" }, -- Items
  client.cache.deletePedRadius or 1, -- Index
  nil, -- Description
  {}, -- Object
  true, -- Enabled
  {
    onListChange = function(index, item)
      client.cache.deletePedRadius = index
    end,
    onSelected = function(index, item)
      local radius = 0
      if index == 1 then
        radius = 50
      elseif index == 2 then
        radius = 100
      elseif index == 3 then
        radius = 200
      elseif index == 4 then
        radius = 500
      elseif index == 5 then
        radius = 1000
      end

      local playerCoords = GetEntityCoords(PlayerPedId())

      local data = {}
      data.radius = radius
      data.x = playerCoords.x
      data.y = playerCoords.y
      data.z = playerCoords.z

      TriggerServerEvent("gunware:sync:data", "delete_ped_radius", data)
    end
  }
)

-- List: Delete Props (radius)
RageUI.List(
  "Delete Props (radius)", -- Label
  { "50m", "100m", "200m" }, -- Items
  client.cache.deletePropRadius or 1, -- Index
  nil, -- Description
  {}, -- Object
  true, -- Enabled
  {
    onListChange = function(index, item)
      client.cache.deletePropRadius = index
    end,
    onSelected = function(index, item)
      local radius = 0
      if index == 1 then
        radius = 50
      elseif index == 2 then
        radius = 100
      elseif index == 3 then
        radius = 200
      elseif index == 4 then
        radius = 500
      elseif index == 5 then
        radius = 1000
      end

      local playerCoords = GetEntityCoords(PlayerPedId())

      local data = {}
      data.radius = radius
      data.x = playerCoords.x
      data.y = playerCoords.y
      data.z = playerCoords.z

      TriggerServerEvent("gunware:sync:data", "delete_object_radius", data)
    end
  }
)
local L6_5 = {}

L6_5.radius = L2_5

local function SpawnMarker(markerType, x, y, z)
    DrawMarker(markerType, x, y, z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 255, false, false, 2, false, false, false, false)
end

L7_4.onSelected = function()
    -- Get player's current coordinates
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local x = playerCoords.x
    local y = playerCoords.y
    local z = playerCoords.z

    -- Set the radius for the marker
    L6_5.x = x
    L6_5.y = y
    L6_5.z = z
    L3_5(L4_5, L5_5, L6_5) -- Call function to handle marker creation
end

L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)

-- Ped catalogue button
local pedCatalogueButton = RageUI.Button
local pedCatalogueTitle = "Catalogue des peds"
local pedCatalogueDescription = "Liste des peds"
local pedCatalogueOptions = {}
pedCatalogueOptions.RightLabel = "\240\159\145\165"
local pedCatalogueEnabled = true
local pedCatalogueEvents = {}
pedCatalogueEvents.onSelected = function()
  -- Empty function
end
pedCatalogueButton(pedCatalogueTitle, pedCatalogueDescription, pedCatalogueOptions, pedCatalogueEnabled, pedCatalogueEvents, L23_1)

-- Vehicle catalogue button
local vehicleCatalogueButton = RageUI.Button
local vehicleCatalogueTitle = "Catalogue des v\195\169hicules"
local vehicleCatalogueDescription = "Liste des v\195\169hicules"
local vehicleCatalogueOptions = {}
vehicleCatalogueOptions.RightLabel = "\240\159\154\152"
local vehicleCatalogueEnabled = true
local vehicleCatalogueEvents = {}
vehicleCatalogueEvents.onSelected = function()
  -- Empty function
end
vehicleCatalogueButton(vehicleCatalogueTitle, vehicleCatalogueDescription, vehicleCatalogueOptions, vehicleCatalogueEnabled, vehicleCatalogueEvents, L25_1)

-- Marker catalogue button
local markerCatalogueButton = RageUI.Button
local markerCatalogueTitle = "Catalogue des markers"
local markerCatalogueDescription = "Liste des markers"
local markerCatalogueOptions = {}
markerCatalogueOptions.RightLabel = "\240\159\140\128"
local markerCatalogueEnabled = true
local markerCatalogueEvents = {}
markerCatalogueEvents.onSelected = function()
  -- Empty function
end
markerCatalogueButton(markerCatalogueTitle, markerCatalogueDescription, markerCatalogueOptions, markerCatalogueEnabled, markerCatalogueEvents, L22_1)

-- Check if the marker menu is visible
RageUI.IsVisible(L22_1, function()
  for i = 1, 43, 1 do -- Loop through marker options
    local buttonTitle = "Marker: " .. i
    local buttonOptions = {}
    buttonOptions.RightLabel = ""
    local buttonEnabled = true
    local buttonEvents = {}
    buttonEvents.onActive = function()
      -- Get player position and direction
      local playerPed = PlayerPedId()
      local playerCoords = GetEntityCoords(playerPed)
      local playerForwardVector = GetEntityForwardVector(playerPed) * 2 -- Extend the direction vector

      -- Calculate marker position in front of player
      local markerX = playerCoords.x + playerForwardVector.x
      local markerY = playerCoords.y + playerForwardVector.y
      local markerZ = playerCoords.z + playerForwardVector.z

      -- Draw the marker
      SpawnMarker(i, markerX, markerY, markerZ)
    end
    RageUI.Button(buttonTitle, nil, buttonOptions, buttonEnabled, buttonEvents)
  end
end)

-- Check if teleport menu is visible
RageUI.IsVisible(L26_1, function()
  -- Loop through saved teleport actions
  for _, tpAction in pairs(L39_1) do
    if tpAction.type == "teleport_add_new" then
      -- Create teleport option in the list
      local listTitle = "T\195\169l\195\169portation"
      local listItems = {"Tp", "Supprimer"}
      local currentTpActions = client.cache.tpActions
      local listOptions = {}
      local listEnabled = true
      local listEvents = {}

      listEvents.onActive = function()
        -- Get player position and direction
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerForwardVector = GetEntityForwardVector(playerPed) * 2 -- Extend the direction vector

        -- Calculate marker position in front of player
        -- Draw first marker
        local marker1X = tpAction.coords1.x
        local marker1Y = tpAction.coords1.y
        local marker1Z = tpAction.coords1.z - 0.98
        SpawnMarker(1, marker1X, marker1Y, marker1Z)

        -- Draw second marker
        local marker2X = tpAction.coords2.x
        local marker2Y = tpAction.coords2.y
        local marker2Z = tpAction.coords2.z - 0.98
        SpawnMarker(1, marker2X, marker2Y, marker2Z)
      end

      listEvents.onListChange = function(newTpActions)
        client.cache.tpActions = newTpActions
      end

      listEvents.onSelected = function(selectedItemIndex)
        if selectedItemIndex == 1 then -- Teleport option selected
          -- Teleport player to destination coordinates
          local playerPed = PlayerPedId()
          local destX = tpAction.coords2.x
          local destY = tpAction.coords2.y
          local destZ = tpAction.coords2.z
          SetEntityCoords(playerPed, destX, destY, destZ)
        elseif selectedItemIndex == 2 then -- Delete option selected
          -- Trigger server event to remove the teleport
          TriggerServerEvent("gunware:sync:remove", tpAction.uuid)
        end
      end
      RageUI.List(listTitle, listItems, currentTpActions, nil, listOptions, listEnabled, listEvents)
    end
  end
end)

-- Check if ped menu is visible
RageUI.IsVisible(L27_1, function()
  -- Loop through saved ped actions
  for _, pedAction in pairs(L39_1) do
    if pedAction.type == "ped_add_new" then
      -- Create ped option in the list
      local listTitle = "Ped: " .. pedAction.type
      local listItems = {"Tp", "Supprimer"}
      local currentTpActions = client.cache.tpActions
      local listOptions = {}
      local listEnabled = true
      local listEvents = {}

      listEvents.onActive = function()
        -- Get player position and direction
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerForwardVector = GetEntityForwardVector(playerPed) * 2 -- Extend the direction vector

        -- Calculate marker position in front of player
        local pedType = pedAction.type
        local pedX = playerCoords.x + playerForwardVector.x
        local pedY = playerCoords.y + playerForwardVector.y
        local pedZ = playerCoords.z + playerForwardVector.z

        DrawPed(pedType, pedX, pedY, pedZ)
      end

      listEvents.onListChange = function(newTpActions)
        client.cache.tpActions = newTpActions
      end

      listEvents.onSelected = function(selectedItemIndex)
        if selectedItemIndex == 1 then -- Teleport option selected
          -- Teleport player to destination coordinates
          local playerPed = PlayerPedId()
          local destX = pedAction.x
          local destY = pedAction.y
          local destZ = pedAction.z
          SetEntityCoords(playerPed, destX, destY, destZ)
        elseif selectedItemIndex == 2 then -- Delete option selected
          -- Trigger server event to remove the ped
          TriggerServerEvent("gunware:sync:remove", pedAction.uuid)
        end
      end
      RageUI.List(listTitle, listItems, currentTpActions, nil, listOptions, listEnabled, listEvents)
    end
  end
end)

-- Check if marker menu is visible
RageUI.IsVisible(L28_1, function()
  -- Loop through saved marker actions
  for _, markerAction in pairs(L39_1) do
    if markerAction.type == "marker_add_new" then
      -- Create marker option in the list
      local listTitle = "Marker: " .. markerAction.type
      local listItems = {"Tp", "Supprimer"}
      local currentTpActions = client.cache.tpActions
      local listOptions = {}
      local listEnabled = true
      local listEvents = {}

      listEvents.onActive = function()
        -- Get player position and direction
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerForwardVector = GetEntityForwardVector(playerPed) * 2 -- Extend the direction vector

        -- Calculate marker position in front of player
        local markerType = markerAction.type
        local markerX = markerAction.x
        local markerY = markerAction.y
        local markerZ = markerAction.z - 0.98

        SpawnMarker(markerType, markerX, markerY, markerZ)
      end

      listEvents.onListChange = function(newTpActions)
        client.cache.tpActions = newTpActions
      end

      listEvents.onSelected = function(selectedItemIndex)
        if selectedItemIndex == 1 then -- Teleport option selected
          -- Teleport player to destination coordinates
          local playerPed = PlayerPedId()
          local destX = markerAction.x
          local destY = markerAction.y
          local destZ = markerAction.z
          SetEntityCoords(playerPed, destX, destY, destZ)
        elseif selectedItemIndex == 2 then -- Delete option selected
          -- Trigger server event to remove the marker
          TriggerServerEvent("gunware:sync:remove", markerAction.uuid)
        end
      end
      RageUI.List(listTitle, listItems, currentTpActions, nil, listOptions, listEnabled, listEvents)
    end
  end
end)

-- Check if blips menu is visible
RageUI.IsVisible(L29_1, function()
  -- Loop through saved blips actions
  for _, blipsAction in pairs(L39_1) do
    if blipsAction.type == "blips_add_new" then
      -- Create blips option in the list
      local listTitle = "Blips: " .. blipsAction.title
      local listItems = {"Tp", "Supprimer"}
      local currentTpActions = client.cache.tpActions
      local listOptions = {}
      local listEnabled = true
      local listEvents = {}

      listEvents.onListChange = function(newTpActions)
        client.cache.tpActions = newTpActions
      end

      listEvents.onSelected = function(selectedItemIndex)
        if selectedItemIndex == 1 then -- Teleport option selected
          -- Teleport player to destination coordinates
          local playerPed = PlayerPedId()
          local destX = blipsAction.x
          local destY = blipsAction.y
          local destZ = blipsAction.z
          SetEntityCoords(playerPed, destX, destY, destZ)
        elseif selectedItemIndex == 2 then -- Delete option selected
          -- Trigger server event to remove the blip
          TriggerServerEvent("gunware:sync:remove", blipsAction.uuid)
        end
      end
      RageUI.List(listTitle, listItems, currentTpActions, nil, listOptions, listEnabled, listEvents)
    end
  end
end)

-- Check if ped list menu is visible
RageUI.IsVisible(L23_1, function()
  -- Loop through the list of peds
  for _, pedName in pairs(pedslistclient) do
    -- Create a list item for each ped
    local listTitle = "Ped: " .. pedName
    local listItems = {"Prendre l'apparence", "Cr\195\169er un ped (session)", "Cr\195\169er un ped (permanent)"}
    local currentPedActions = client.cache.pedActions
    local listOptions = {}
    local listEnabled = true
    local listEvents = {}

    listEvents.onActive = function()
      -- Get player position and direction
      local playerPed = PlayerPedId()
      local playerCoords = GetEntityCoords(playerPed)
      local playerForwardVector = GetEntityForwardVector(playerPed) * 2 -- Extend the direction vector

      -- Calculate ped position in front of player
      local pedX = playerCoords.x + playerForwardVector.x
      local pedY = playerCoords.y + playerForwardVector.y
      local pedZ = playerCoords.z + playerForwardVector.z

      DrawPed(pedName, pedX, pedY, pedZ)
    end

    listEvents.onListChange = function(newPedActions)
      client.cache.pedActions = newPedActions
    end

    listEvents.onSelected = function(selectedItemIndex)
      if selectedItemIndex == 1 then -- "Prendre l'apparence" selected
        -- Change the player's model
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

        -- Request the model
        RequestModel(pedName)
        while not HasModelLoaded(pedName) do
          Citizen.Wait(0)
        end

        -- Set the player model
        SetPlayerModel(PlayerId(), pedName)
        SetModelAsNoLongerNeeded(pedName)

        -- If the player was in a vehicle, put them back in
        if vehicle ~= 0 then
          TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        end

      elseif selectedItemIndex == 2 then -- "Cr\195\169er un ped (session)" selected
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
-- This chunk seems to handle UI elements and their interactions.

-- ... (Previous code)

                    safezoneData = {}
                safezoneData.type = safezoneType
                safezoneData.x = entityCoords.x
                safezoneData.y = entityCoords.y
                safezoneData.z = entityCoords.z - 0.98 -- Adjust Z coordinate
                
                TriggerServerEvent("gunware:sync:data", "ped_add_new", safezoneData)
              elseif 3 == actionIndex then
                -- Save safezone data
                local playerPed = PlayerPedId()
                local entityCoords = GetEntityCoords(playerPed)

                safezoneData = {}
                safezoneData.type = safezoneType
                safezoneData.x = entityCoords.x
                safezoneData.y = entityCoords.y
                safezoneData.z = entityCoords.z

                TriggerServerEvent("gunware:save:data", "ped_add_new", safezoneData)
              end
            end
            listItem.onSelected = listItemOnSelected
            RageUI.List(listItemTitle, listItems, listCurrentIndex, listIndexNil, listObjectNil, listBoolTrue, listItem)
          end
        end
        RageUI.Display(menuTitle, menuFunction)
        RageUI_IsVisible = RageUI.IsVisible
        menuToDisplay = Config.SafezoneMenu
        function menuFunction()
          local pairIterator = pairs
          local safezoneDataList = Config.TpActions

          for safezoneIndex, safezoneData in pairsIterator(safezoneDataList) do
            local safezoneType = safezoneData.type
            if "safezone_add_new" == safezoneType then
              local safezoneList = RageUI.List
              local listTitle = "Safezone"
              local listActions = {}
              local teleportAction = "Tp"
              local deleteAction = "Supprimer"
              listActions[1] = teleportAction
              listActions[2] = deleteAction

              local currentIndex = client.cache.tpActions
              local listIndexNil = nil
              local listItem = {}
              local listBoolTrue = true

              -- Function to draw a marker for the safezone.
              local function onSafezoneActive()
                DrawMarker(
                  1, -- markerType
                  safezoneData.x,
                  safezoneData.y,
                  safezoneData.z,
                  0, -- dirX
                  0, -- dirY
                  0, -- dirZ
                  0, -- rotX
                  0, -- rotY
                  0, -- rotZ
                  safezoneData.radius,
                  safezoneData.radius,
                  safezoneData.radius,
                  255, -- red
                  0, -- green
                  0, -- blue
                  255, -- alpha
                  false, -- bobUpAndDown
                  false, -- faceCamera
                  2, -- textureDict
                  false, -- rotate
                  false, -- drawOnEnts
                  false -- reserved
                )
              end
              listItem.onActive = onSafezoneActive

              -- Function to handle list changes.
              local function onListChange(selectedIndex, item)
                client.cache.tpActions = selectedIndex
              end
              listItem.onListChange = onListChange

              -- Function to handle the selection of an item from the list.
              local function onItemSelected(selectedIndex, item)
                if 1 == selectedIndex then
                  -- Teleport player to safezone
                  local setEntityCoords = SetEntityCoords
                  local playerPed = PlayerPedId()
                  local safezoneX = safezoneData.x
                  local safezoneY = safezoneData.y
                  local safezoneZ = safezoneData.z
                  setEntityCoords(playerPed, safezoneX, safezoneY, safezoneZ)
                elseif 2 == selectedIndex then
                  -- Remove safezone
                  TriggerServerEvent("gunware:sync:remove", safezoneData.uuid)
                end
              end
              listItem.onSelected = onItemSelected
              safezoneList(listTitle, listActions, currentIndex, listIndexNil, listItem, listBoolTrue, listItem)
            end
          end
        end
        RageUI.Display(menuTitle, menuFunction)
        RageUI_IsVisible = RageUI.IsVisible
        menuToDisplay = Config.VehicleMenu
        function menuFunction()
          local pairIterator = pairs
          local vehicleList = Vehicles

          for vehicleIndex, vehicleModel in pairIterator(vehicleList) do
            local vehicleButton = RageUI.Button
            local buttonTitle = "Véhicule: " .. vehicleModel
            local rightLabelNil = nil
            local buttonOptions = {}
            buttonOptions.RightLabel = ""
            local buttonBoolTrue = true
            local buttonItem = {}

            -- Function to draw vehicle model.
            local function onVehicleActive()
              DrawVehicle(vehicleModel)
            end
            buttonItem.onActive = onVehicleActive

            -- Function to handle vehicle spawn when selected.
            local function onVehicleSelected()
              local playerPedCoords = GetEntityCoords(PlayerPedId())
              local vehicleData = {}
              vehicleData.type = vehicleModel
              vehicleData.x = playerPedCoords.x
              vehicleData.y = playerPedCoords.y
              vehicleData.z = playerPedCoords.z

              RequestModel(vehicleModel)
              while true do
                if HasModelLoaded(vehicleModel) then
                  break
                end
                Citizen.Wait(0)
              end

              local vehicle = CreateVehicle(
                vehicleModel,
                playerPedCoords.x,
                playerPedCoords.y,
                playerPedCoords.z,
                GetEntityHeading(PlayerPedId()), -- heading
                true, -- isNetworked
                true -- thisScriptCheck
              )

              SetVehicleOnGroundProperly(vehicle)
              SetModelAsNoLongerNeeded(vehicleModel)
              TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
              SetVehicleNumberPlateText(vehicle, "GunWare")
            end
            buttonItem.onSelected = onVehicleSelected
            vehicleButton(buttonTitle, rightLabelNil, buttonOptions, buttonBoolTrue, buttonItem)
          end
        end
        RageUI.Display(menuTitle, menuFunction)
        RageUI_IsVisible = RageUI.IsVisible
        menuToDisplay = Config.ReportMenu
        function menuFunction()
          local reportSeparator = RageUI.Separator
          reportSeparator("Gestion des reports")
          reportSeparator("Pris en charge (~b~" .. countReport(true) .. "~s~) Non pris en charge (~b~" .. countReport(false) .. "~s~)")

          local reportList = RageUI.List
          local listTitle = "Reports"
          local listItems = {}
          listItems[1] = "Pris en charge"
          listItems[2] = "Non pris en charge"

          local currentIndex = client.cache.reportActionsidx
          local listIndexNil = nil
          local listItem = {}
          local listBoolTrue = true

          -- Function to handle the list change.
          local function onListChange(selectedIndex, item)
            client.cache.reportActionsidx = selectedIndex
          end
          listItem.onListChange = onListChange

          -- Empty function to handle selected event (no action needed).
          local function onSelected(selectedIndex, item)
          end
          listItem.onSelected = onSelected

          reportList(listTitle, listItems, currentIndex, listIndexNil, listItem, listBoolTrue, listItem)

          -- Function to count elements in a table
          local function countTableElements(tableToCount)
            local count = 0
            for _, _ in pairs(tableToCount) do
              count = count + 1
            end
            return count
          end
          local count_table = countTableElements -- Assign to global variable

          -- Handle reports based on selected index.
          local selectedReportIndex = client.cache.reportActionsidx
          if 1 == selectedReportIndex then
            -- Display taken reports
            local reportCount = count_table(reportClient)
            if reportCount > 0 then
              for reportIndex, reportData in pairs(reportClient) do
                if reportData.take then
                  local reportButton = RageUI.Button
                  local buttonTitle = "Report de " .. reportData.name
                  local rightLabelNil = nil
                  local buttonOptions = {}
                  buttonOptions.RightLabel = "✅"
                  local buttonBoolTrue = true
                  local buttonItem = {}

                  -- Function called when the report is selected.
                  local function onReportSelected()
                    lastreporttake = reportData.id -- Store the selected report ID
                  end
                  buttonItem.onSelected = onReportSelected

                  -- Function called when the report is active.
                  local function onReportActive()
                    local reportInfo = RageUI.Info
                    local infoTitle = "Report de " .. reportData.name
                    local infoMessages = {}

                    infoMessages[1] = "<B>Créateur: </B>" .. reportData.name
                    infoMessages[2] = "<B>Date: </B>" .. reportData.time
                    infoMessages[3] = "--------------------------"
                    infoMessages[4] = "<B>Status: ~g~Pris en charge~s~</B>"
                    infoMessages[5] = "<B>Pris en charge par: </B>~b~" .. reportData.staff .. "~s~"
                    infoMessages[6] = "<B>Date de prise en charge: </B>~b~" .. reportData.takenTime .. "~s~"
                    infoMessages[7] = reportData.message

                    local infoOptions = {}
                    reportInfo(infoTitle, infoMessages, infoOptions)
                  end
                  buttonItem.onActive = onReportActive
                  local reportLocationMenu = Config.reportLocationMenu
                  reportButton(buttonTitle, rightLabelNil, buttonOptions, buttonBoolTrue, buttonItem, reportLocationMenu)
                end
              end
            end
          else
            -- Display non-taken reports
            local reportCount = count_table(false)
            if 0 == reportCount then
              reportSeparator("")
              reportSeparator("Aucun report non pris en charge")
              reportSeparator("")
            else
              for reportIndex, reportData in pairs(reportClient) do
                if not reportData.take then
                  local reportButton = RageUI.Button
                  local buttonTitle = "Report de " .. reportData.name
                  local rightLabelNil = nil
                  local buttonOptions = {}
                  buttonOptions.RightLabel = "❌"
                  local buttonBoolTrue = true
                  local buttonItem = {}

                  -- Function to take the report.
                  local function onTakeReport()
                    TriggerServerEvent("gunware:report:take", reportData.id)
                    lastreporttake = reportData.id
                  end
                  buttonItem.onSelected = onTakeReport

                  -- Function to display report info.
                  local function onReportActive()
                    local reportInfo = RageUI.Info
                    local infoTitle = "Report de " .. reportData.name
                    local infoMessages = {}

                    infoMessages[1] = "<B>Créateur:</B> " .. reportData.name
                    infoMessages[2] = "<B>Date:</B> " .. reportData.time
                    infoMessages[3] = "<B>Status:</B> ~r~Non pris en charge~s~"
                    infoMessages[4] = "--------------------------"
                    infoMessages[5] = reportData.message

                    local infoOptions = {}
                    reportInfo(infoTitle, infoMessages, infoOptions)
                  end
                  buttonItem.onActive = onReportActive
                  reportButton(buttonTitle, rightLabelNil, buttonOptions, buttonBoolTrue, buttonItem)
                end
              end
            end
          end
        end
        RageUI.Display(menuTitle, menuFunction)
        RageUI_IsVisible = RageUI.IsVisible
        menuToDisplay = Config.MenuPositionMenu
        function menuFunction()
          local menuList = RageUI.List
          local listTitle = "Position du menu"
          local listItems = {}
          listItems[1] = "Gauche"
          listItems[2] = "Droite"

          local currentIndex = clientGetCache("gw-menuPositionX")
          if not currentIndex then
            currentIndex = 1
          end

          local listIndexNil = nil
          local listItem = {}
          local listBoolTrue = true

          -- Function to set menu position based on selection
          local function onMenuPositionChange(selectedIndex, item)
            clientSetCache("gw-menuPositionX", selectedIndex)

            if 1 == selectedIndex then
              -- Set menu to left position
              Config.WeaponShopMenu.SetPosition(0, 0)
              Config.MenuPositionMenu.SetPosition(0, 0)
              Config.WeaponShopMenu.SetPosition(0, 0)
              Config.WeaponShopMenu.SetPosition(0, 0)
              Config.LicenseMenu.SetPosition(0, 0)
              Config.ClothShopMenu.SetPosition(0, 0)
              Config.SkinMenu.SetPosition(0, 0)
              Config.VehicleShopMenu.SetPosition(0, 0)
              Config.BankMenu.SetPosition(0, 0)
              Config.AdminMenu.SetPosition(0, 0)
              Config.SafezoneMenu.SetPosition(0, 0)
              Config.GarageMenu.SetPosition(0, 0)
              Config.MenuPositionMenu.SetPosition(0, 0)
              Config.Config.reportLocationMenu.SetPosition(0, 0)
              Config.ReportMenu.SetPosition(0, 0)
              Config.SettingsMenu.SetPosition(0, 0)
              Config.OtherMenu.SetPosition(0, 0)
              Config.SettingsMenu.SetPosition(0, 0)
              Config.GarageMenu.SetPosition(0, 0)
              Config.Stonk.SetPosition(0, 0)
              Config.ClothShopMenu.SetPosition(0, 0)
              Config.SkinMenu.SetPosition(0, 0)
              Config.VehicleShopMenu.SetPosition(0, 0)
              Config.WeaponShopMenu.SetPosition(0, 0)
              Config.ATM.SetPosition(0, 0)
            else
              -- Set menu to right position
              Config.WeaponShopMenu.SetPosition(1400, 0)
-- Sets position of UI elements on the screen
local function setElementPosition(element, x, y)
  element:SetPosition(element, x, y)
end

-- Event handler for when the client connects
RegisterNetEvent("gunware:clientConnected")
AddEventHandler("gunware:clientConnected", function(playerData)
  PlayerServer[playerData.id] = playerData -- Store player data in a table

  -- Set initial cache values if they don't exist.  These calls are to the client cache.
  if clientGetCache("gw-pedPreview-") == nil then
    clientSetCache("gw-pedPreview-", 1)
  end
  if clientGetCache("gw-gunNotif-") == nil then
    clientSetCache("gw-gunNotif-", 1)
  end
  if clientGetCache("gw-reportNotif-") == nil then
    clientSetCache("gw-reportNotif-", 1)
  end
  if clientGetCache("gw-connectNotif-") == nil then
    clientSetCache("gw-connectNotif-", 1)
  end
  if clientGetCache("gw-disconnectNotif-") == nil then
    clientSetCache("gw-disconnectNotif-", 1)
  end
end)

-- Function to open the client menu
local function openClientMenu()
  local mainMenu = RageUI.CreateMenu("GunWare", "Menu") -- Create the main menu

  -- Add menu items to the main menu
  RageUI.CreateSubMenu(mainMenu, playerListMenu, "Joueurs", "Liste des joueurs")
  RageUI.CreateSubMenu(mainMenu, settingsMenu, "Param\195\168tres", "Configuration du menu")
  RageUI.CreateSubMenu(mainMenu, reportMenu, "Reports", "Liste des reports")

  -- Function to update player list in the player list menu
  local function updatePlayerList(menu)
    menu:Clear() -- Clear the menu

    for playerId, playerData in pairs(PlayerServer) do -- Iterate over player data
      local playerName = playerData.name
      local playerPing = playerData.ping
      local playerRole = playerData.role
      local buttonLabel = playerName .. " | Ping: " .. playerPing .. " | Role: " .. playerRole

      -- Add player buttons to the menu
      RageUI.Button(buttonLabel, nil, {RightLabel = "\240\159\145\164"}, true, {
        onSelected = function()
          isPlayerSelected = true
          client.cache.playerSelected = playerData
          createPeds(playerData.skin) -- Create ped preview
        end,
      }, playerListMenu)
    end
  end

  -- Handle player selection in the player list menu
  RageUI.IsVisible(playerListMenu, function()
    updatePlayerList(playerListMenu) -- Update player list
    Wait(1) -- Wait for 1ms
  end)

  -- Function for creating ped previews
  local function createPeds(skin)
    if ped then
      DeleteEntity(ped) -- Delete existing ped
      ped = nil
    end

    RequestModel(skin.Hash) -- Request model
    while not HasModelLoaded(skin.Hash) do
      Wait(0) -- Wait for model to load
    end

    -- Create the ped
    ped = CreatePed(2, skin.Hash, 1400.0, 0.0, 0.0, 0.0, true, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)

    -- Position the peds
    setElementPosition(ped, 1400, 0)
    SetEntityHeading(ped, 0.0)
  end

  -- Handle player page
  RageUI.IsVisible(playerPage, function()
    if isPlayerSelected and client.cache.playerSelected then
      RageUI.Separator(client.cache.playerSelected.name)

      -- Teleport options.
      RageUI.Button("TP vers le joueur", nil, {RightLabel = "\240\159\145\164"}, true, {
        onSelected = function()
          TriggerServerEvent("gunware:sync:actionPlayer", "player_tp", {target = client.cache.playerSelected.id, x = 0, y = 0, z = 0})
        end,
      }, playerPage)
      RageUI.Button("Bring le joueur vers vous", nil, {RightLabel = "\240\159\145\164"}, true, {
        onSelected = function()
          TriggerServerEvent("gunware:sync:actionPlayer", "player_bring", {target = client.cache.playerSelected.id, x = 0, y = 0, z = 0})
        end,
      }, playerPage)

      -- Ban, kick, and report menu
      RageUI.Button("Kick le joueur", nil, {RightLabel = "\240\159\148\146"}, true, {
        onSelected = function()
          TriggerServerEvent("gunware:sync:actionPlayer", "player_kick", {target = client.cache.playerSelected.id, x = 0, y = 0, z = 0})
        end,
      }, playerPage)
      RageUI.Button("Ban le joueur", nil, {RightLabel = "\240\159\148\146"}, true, {
        onSelected = function()
          TriggerServerEvent("gunware:sync:actionPlayer", "player_ban", {target = client.cache.playerSelected.id, x = 0, y = 0, z = 0})
        end,
      }, playerPage)
      RageUI.Button("Report le joueur", nil, {RightLabel = "\240\159\148\146"}, true, {
        onSelected = function()
          reportMenuOpen = true
        end,
      }, playerPage)
    end
    Wait(1) -- Wait for 1ms
  end)

  -- Handle settings menu.
  RageUI.IsVisible(settingsMenu, function()
    -- List of menu themes
    local themesList = {"Menu 1", "Menu 2", "Menu 3", "Menu 4", "Menu 5", "Menu 6", "Menu 7", "Menu 8", "Menu 9", "Menu 10", "Menu 11", "Menu 12"}

    -- Function to handle menu theme selection
    local function onThemeSelected(index)
      local themeNumber = index -- Selected index corresponds to theme number
      TriggerServerEvent("gunware:updateTheme", themeNumber) -- Trigger server event to update theme
    end

    -- List item for selecting the menu theme
    RageUI.List("Choix du th\195\168me", nil, themesList, 0, {}, {
      onListChange = function(index)
        onThemeSelected(index) -- Call theme selection function on list change
      end,
    }, settingsMenu)

    -- Checkbox to enable/disable report notifications
    RageUI.Checkbox("Notifications des reports", nil, clientGetCache("gw-reportNotif-") == 2, {}, {
      onChecked = function()
        clientSetCache("gw-reportNotif-", 2)
      end,
      onUnChecked = function()
        clientSetCache("gw-reportNotif-", 1)
      end,
    })

    -- Checkbox to enable/disable disconnection notifications
    RageUI.Checkbox("Notifications des d\195\169connexions", nil, clientGetCache("gw-disconnectNotif-") == 2, {}, {
      onChecked = function()
        clientSetCache("gw-disconnectNotif-", 2)
      end,
      onUnChecked = function()
        clientSetCache("gw-disconnectNotif-", 1)
      end,
    })

    -- Checkbox to enable/disable connection notifications
    RageUI.Checkbox("Notifications des connexions", nil, clientGetCache("gw-connectNotif-") == 2, {}, {
      onChecked = function()
        clientSetCache("gw-connectNotif-", 2)
      end,
      onUnChecked = function()
        clientSetCache("gw-connectNotif-", 1)
      end,
    })

    -- Checkbox to enable/disable gun fire notifications
    RageUI.Checkbox("Notifications des coup de feu", "Vous serrez notifi\195\169 lorsqu'un joueur tire", clientGetCache("gw-gunNotif-") == 2, {}, {
      onChecked = function()
        clientSetCache("gw-gunNotif-", 2)
      end,
      onUnChecked = function()
        clientSetCache("gw-gunNotif-", 1)
      end,
    })

    -- Button to clear bullet tracers
    RageUI.Button("Clear les tirs", "Clear les tirs", {RightLabel = "\240\159\148\171"}, true, {
      onSelected = function()
        bullets = {} -- Clear bullet table
        TriggerEvent("gunware:notif", "success", "Les tirs ont \195\169t\195\169 clear") -- Trigger notification
      end,
    })

    -- Checkbox to enable/disable peds preview
    RageUI.Checkbox("Peds preview", "Affiche un peds sur le cot\195\169 du menu (page joueur) pour voir le skin", clientGetCache("gw-pedPreview-") == 2, {}, {
      onChecked = function()
        clientSetCache("gw-pedPreview-", 2)
      end,
      onUnChecked = function()
        clientSetCache("gw-pedPreview-", 1)
      end,
    })
  end)

  -- Display the report menu
  RageUI.IsVisible(reportMenu, function()
    -- Display available report options if a report is selected
    RageUI.IsVisible(playerReportMenu, function()
      if reportClient[lastreporttake] then -- Report from the client.
        local report = reportClient[lastreporttake]

        if report.reportedPlayer then
          -- Go to reported player button
          RageUI.Button("Acc\195\169der \195\160 la page du joueur signal\195\169", nil, {RightLabel = "\240\159\145\164"}, true, {
            onSelected = function()
              isPlayerSelected = true
              client.cache.playerSelected = PlayerServer[report.reportedPlayer] -- Get the player who was reported from the server data and store in the playerSelected client.cache
            end,
          }, playerReportMenu)
        end

        -- Go to reporting player button
        RageUI.Button("Acc\195\169der \195\160 la page du joueur signalant", nil, {RightLabel = "\240\159\145\164"}, true, {
          onSelected = function()
            isPlayerSelected = true
            client.cache.playerSelected = PlayerServer[report.target]
            createPeds(PlayerServer[report.target].skin) -- Create ped preview
          end,
        }, playerReportMenu)

        if report.reportedPlayer then
          -- Bring both players button
          RageUI.Button("Bring les deux joueurs sur vous", nil, {RightLabel = "\240\159\145\164"}, true, {
            onSelected = function()
              local playerPed = PlayerPedId()
              local playerCoords = GetEntityCoords(playerPed)

              -- Teleport the reported player to the current player
              TriggerServerEvent("gunware:sync:actionPlayer", "player_tp", {target = report.reportedPlayer, x = playerCoords.x, y = playerCoords.y, z = playerCoords.z})
              -- Teleport the reporting player to the current player
              TriggerServerEvent("gunware:sync:actionPlayer", "player_tp", {target = report.target, x = playerCoords.x, y = playerCoords.y, z = playerCoords.z})
            end,
          }, playerReportMenu)

          -- Bring back both players button
          RageUI.Button("Bring back les deux joueurs", nil, {RightLabel = "\240\159\145\164"}, true, {
            onSelected = function()
              TriggerServerEvent("gunware:sync:actionPlayer", "player_bringBack", {target = report.reportedPlayer}) -- Bring back the reported player
              TriggerServerEvent("gunware:sync:actionPlayer", "player_bringBack", {target = report.target}) -- Bring back the reporting player
            end,
          }, playerReportMenu)
        end

        -- Close report button
        RageUI.Button("Fermer le report", nil, {RightLabel = "\240\159\148\146"}, true, {
          onSelected = function()
            TriggerServerEvent("gunware:report:close", report.id) -- Trigger server event to close report
          end,
        }, playerReportMenu)
      else
        RageUI.Separator("Report ferm\195\169") -- Display message if report is closed
      end
    end)
    Wait(1) -- Wait for 1ms
  end)
end
clientOpenMenu = openClientMenu

-- Event handler for new reports
RegisterNetEvent("gunware:report:new")
AddEventHandler("gunware:report:new", function(reportData)
  -- Check to see if the client has report actions.
  if client.cache.reportActions then
    -- See if the client wants to have report notifications enabled.
    if clientGetCache("gw-reportNotif-") == 2 then
      config.notification("Nouveau report de " .. reportData.name) -- Display notification
    end
  end
  reportClient[reportData.id] = reportData -- Store report data
end)

-- Event handler for when a report is taken
RegisterNetEvent("gunware:report:take")
AddEventHandler("gunware:report:take", function(reportData, adminName)
  local playerId = PlayerId()
  local playerServerId = GetPlayerServerId(playerId)
  local player = PlayerServer[playerServerId]

  if not player then
    return
  end

  if player.role == "user" then
    TriggerEvent("gunware:notif", "error", "Vous n'avez pas la permission d'utiliser la t\195\169l\195\169portation au marqueur")
    return
  end

  if not reportData or not reportData.id then
    return
  end

  reportClient[reportData.id] = reportData -- Store report data

  if clientGetCache("gw-reportNotif-") == 2 then
    config.notification("Le report " .. reportData.id .. " a \195\169t\195\169 pris en charge par " .. adminName) -- Display notification
  end
end)

-- Event handler for when a report is closed
RegisterNetEvent("gunware:report:close")
AddEventHandler("gunware:report:close", function(reportId, adminName)
  local playerServerId = GetPlayerServerId(PlayerId())
  local player = PlayerServer[playerServerId]

  if player.role == "user" then
    return
  end

  local report = reportClient[reportId]

  if clientGetCache("gw-reportNotif-") == 2 then
    config.notification("Le report de " .. report.id .. " a \195\169t\195\169 ferm\195\169 par " .. adminName) -- Display notification
  end
  reportClient[reportId] = nil -- Remove report from client
end)

-- Event handler for when a player disconnects
RegisterNetEvent("gunware:playerDrop")
AddEventHandler("gunware:playerDrop", function(playerId, playerName)
  local playerServerId = GetPlayerServerId(PlayerId())
  local player = PlayerServer[playerServerId]

  if player.role == "user" then
    return
  end

  -- If the client wants to have disconnect notifications enabled.
  if client.cache.reportActions then
    if clientGetCache("gw-disconnectNotif-") == 2 then
      config.notification(playerName .. " s'est d\195\169connect\195\169") -- Display disconnect notification
    end
  end
  PlayerServer[playerId] = nil -- Remove player from PlayerServer
end)
-- Handle player disconnect notification.
if client and client.cache and client.cache.staffMode then
  local disconnectNotification = clientGetCache("gw-disconnectNotif-")
  if disconnectNotification == 2 then
    local notificationConfig = config.notification
    local message = "Un joueur vient de se déconnecter (" .. A0_2 .. ")\nRaison: " .. A1_2
    notificationConfig(message)
  end
end

-- Register event for player connection.
RegisterNetEvent("gunware:playerConnect")

-- Add event handler for player connection.
AddEventHandler("gunware:playerConnect", function(playerName)
  Citizen.Wait(4000) -- Wait 4 seconds.

  -- Get player role from server data.
  local playerServerId = GetPlayerServerId(PlayerId())
  local playerRole = PlayerServer[playerServerId].role

  -- If the player is a regular user, exit.
  if playerRole == "user" then
    return
  end

  -- If staff mode is enabled, send a connection notification.
  if client and client.cache and client.cache.staffMode then
    local connectNotification = clientGetCache("gw-connectNotif-")
    if connectNotification == 2 then
      local notificationConfig = config.notification
      local message = "Un joueur vient de se connecter (" .. playerName .. ")"
      notificationConfig(message)
    end
  end
end)

-- Register event for opening menu.
RegisterNetEvent("gunware:openMenu")

-- Add event handler for opening menu.
AddEventHandler("gunware:openMenu", function(menuData)
  if not IsPlayerLoaded() then
    return
  end
  clientOpenMenu(menuData)
end)

-- Register event for force reviving a player (admin command).
RegisterNetEvent("gunware:admin:forceRevive")

-- Add event handler for force reviving a player.
AddEventHandler("gunware:admin:forceRevive", function()
  local playerPed = PlayerPedId()
  local playerCoords = GetEntityCoords(playerPed)

  -- Restore player health.
  SetEntityHealth(playerPed, 200)

  -- Revive the player if dead or dying.
  if IsPedDeadOrDying(playerPed, true) or IsPedFatallyInjured(playerPed) then
    NetworkResurrectLocalPlayer(playerCoords.x, playerCoords.y, playerCoords.z, 0.0, true, false)
  end

  -- Restore player armor.
  SetPedArmour(playerPed, 100)

  -- Clear damage effects.
  ClearPedBloodDamage(playerPed)
  ClearPedWetness(playerPed)
  ClearPedEnvDirt(playerPed)
  ClearPedTasks(playerPed)

  -- Notify the player.
  local notificationConfig = config.notification
  notificationConfig("Vous avez été réanimé par un administrateur", "success")

  print("[INFO] gunware:admin:forceRevive - Revive de secours appliqué avec succès")
end)

-- Register event for force healing a player (admin command).
RegisterNetEvent("gunware:admin:forceHeal")

-- Add event handler for force healing a player.
AddEventHandler("gunware:admin:forceHeal", function()
  local playerPed = PlayerPedId()

  -- Restore player health and armor.
  SetEntityHealth(playerPed, 200)
  SetPedArmour(playerPed, 100)

  -- Clear damage effects.
  ClearPedBloodDamage(playerPed)
  ClearPedWetness(playerPed)
  ClearPedEnvDirt(playerPed)

  -- Notify the player.
  local notificationConfig = config.notification
  notificationConfig("Vous avez été soigné par un administrateur", "success")

  print("[INFO] gunware:admin:forceHeal - Heal de secours appliqué avec succès")
end)

-- Register event for setting the weather (admin command).
RegisterNetEvent("gunware:weather:standalone")

-- Add event handler for setting the weather.
AddEventHandler("gunware:weather:standalone", function(weatherType)
  local validWeatherTypes = {
    "EXTRASUNNY", "CLEAR", "CLOUDS", "SMOG", "FOGGY", "OVERCAST", "RAIN", "THUNDER",
    "CLEARING", "NEUTRAL", "SNOW", "BLIZZARD", "SNOWLIGHT", "XMAS"
  }

  local isValidWeather = false
  for _, validType in ipairs(validWeatherTypes) do
    if weatherType == validType then
      isValidWeather = true
      break
    end
  end

  -- Validate the weather type.
  if not isValidWeather then
    print(string.format("[ERROR] gunware:weather:standalone - Type météo invalide: %s", weatherType))
    return
  end

  -- Set the weather.
  SetWeatherTypeNowPersist(weatherType)
  SetWeatherTypeNow(weatherType)
  SetOverrideWeather(weatherType)

  -- Set rain or snow level if applicable.
  if weatherType == "RAIN" or weatherType == "THUNDER" then
    SetRainLevel(1.0)
  elseif weatherType == "SNOW" or weatherType == "BLIZZARD" or weatherType == "SNOWLIGHT" then
    SetSnowLevel(1.0)
  else
    SetRainLevel(0.0)
    SetSnowLevel(0.0)
  end

  -- Notify the player.
  print(string.format("[SUCCESS] gunware:weather:standalone - Météo changée vers: %s", weatherType))
  local notificationConfig = config.notification
  notificationConfig("Météo changée vers " .. weatherType, "success")
end)

-- Register event for setting the time (admin command).
RegisterNetEvent("gunware:time:standalone")

-- Add event handler for setting the time.
AddEventHandler("gunware:time:standalone", function(hour, minute)
  -- Validate the time.
  if not (hour and minute) or hour < 0 or hour > 23 or minute < 0 or minute > 59 then
    print(string.format("[ERROR] gunware:time:standalone - Heure invalide: %s:%s", tostring(hour), tostring(minute)))
    return
  end

  -- Set the time.
  NetworkOverrideClockTime(hour, minute, 0)

  -- Notify the player.
  print(string.format("[SUCCESS] gunware:time:standalone - Heure changée vers: %02d:%02d", hour, minute))
  local notificationConfig = config.notification
  notificationConfig(string.format("Heure changée vers %02d:%02d", hour, minute), "success")
end)

-- Function to get closest players within a distance.
local function getClosestAllPlayer(coords, maxDistance)
  local closestPlayers = {}

  for _, player in ipairs(GetActivePlayers()) do
    local playerPed = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(playerPed)
    local distance = #(coords - playerCoords)

    if distance < maxDistance then
      table.insert(closestPlayers, {
        playerId = player,
        serverId = GetPlayerServerId(player),
        distance = distance
      })
    end
  end

  return closestPlayers
end

--[[
-- Function to get closest players within a distance.
-- This declaration is redundant because it is already defined above
function L63_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = GetActivePlayers
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L4_2()
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = GetPlayerPed
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    L10_2 = GetEntityCoords
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    L11_2 = A0_2 - L10_2
    L11_2 = #L11_2
    if A1_2 > L11_2 then
      L12_2 = table
      L12_2 = L12_2.insert
      L13_2 = L2_2
      L14_2 = {}
      L14_2.playerId = L8_2
      L15_2 = GetPlayerServerId
      L16_2 = L8_2
      L15_2 = L15_2(L16_2)
      L14_2.serverId = L15_2
      L14_2.distance = L11_2
      L12_2(L13_2, L14_2)
    end
  end
  return L2_2
end
--]]

-- Assign getClosestAllPlayer function
getClosestAllPlayer = getClosestAllPlayer

-- Client report menu
local function clientReportMenu()
  -- Set title of the menus.
  L31_1:SetTitle(PlayerServer[GetPlayerServerId(PlayerId())].rp)
  L32_1:SetTitle("Liste des players")

  -- Toggle the visibility of the menu.
  if menu_IsOpen then
    menu_IsOpen = false
    RageUI.Visible(L31_1, false)
    return
  else
    menu_IsOpen = true
    RageUI.Visible(L31_1, true)

    -- Create a thread to handle menu updates and visibility.
    CreateThread(function()
      while true do
        if not menu_IsOpen then
          break
        end

        -- Main menu.
        RageUI.IsVisible(L31_1, function()
          RageUI.Separator("Gestion des reports")

          -- Create Report button.
          RageUI.Button("Créer un report", nil, {RightLabel = "\240\159\147\157"}, true, {
            onSelected = function()
              lib.inputDialog("Créer un report", {
                {
                  type = "input",
                  label = "Raison",
                  description = "Raison du report",
                  required = true,
                  min = 4,
                  max = 500
                }
              }, function(data)
                if data then --Ensure input has value
                  local message = "<B>Auteur :</B> [~b~" .. PlayerServer[GetPlayerServerId(PlayerId())].name ..
                                  "~s~]\n<B>Raison :</B> " .. data[1]
                  TriggerServerEvent("gunware:report", message, false)
                end
              end)
            end
          })

          -- Report a Player button.
          RageUI.Button("Report un joueur", nil, {RightLabel = "\240\159\145\164"}, true, {
            onSelected = function()
              -- No action needed here
            end
          }, L32_1) -- navigate to the player report menu.
        end)

        -- Player Report Menu.
        RageUI.IsVisible(L32_1, function()
          local playerCoords = GetEntityCoords(PlayerPedId())
          local nearbyPlayers = getClosestAllPlayer(playerCoords, 150) -- Find nearby players.

          -- For each player, create a button to report them.
          for _, playerInfo in pairs(nearbyPlayers) do
            RageUI.Button("Report | " .. PlayerServer[playerInfo.serverId].rp, nil, {RightLabel = "\240\159\145\164"}, true, {
              onSelected = function()
                lib.inputDialog("Créer un report", {
                  {
                    type = "input",
                    label = "Raison",
                    description = "Raison du report",
                    required = true,
                    min = 4,
                    max = 60
                  }
                }, function(data)
                  if data then
                    local message = "<B>Auteur :</B> [~b~" .. PlayerServer[GetPlayerServerId(PlayerId())].name ..
                                    "~s~]\n<B>Joueur signalé :</B> [~b~" .. PlayerServer[playerInfo.serverId].rp ..
                                    "~s~]\n<B>Raison :</B> " .. data[1]
                    TriggerServerEvent("gunware:report", message, playerInfo.serverId)
                  end
                end)
              end,
              onActive = function()
                createPeds(PlayerServer[playerInfo.serverId].skin)
              end
            })
          end
        end)

        Citizen.Wait(1)
      end
    end)
  end
end

clientReportMenu = clientReportMenu

-- Export a function to set a waypoint.
exports("setToWaypoint", function()
  local blip = GetFirstBlipInfoId(8) -- Get the first waypoint blip.

  -- Check if the blip exists.
  if DoesBlipExist(blip) then
    CreateThread(function()
      local blipCoords = GetBlipInfoIdCoord(blip) -- Get the coordinates of the blip.

      -- Find the ground Z coordinate.
      local foundGround = false
      local groundZ = -500.0
      local tempZ = 0.0

      while not foundGround do
        tempZ = tempZ + 10.0
        RequestCollisionAtCoord(blipCoords.x, blipCoords.y, tempZ) -- Request collision.
        Citizen.Wait(0)

        local success, zCoord = GetGroundZFor_3dCoord(blipCoords.x, blipCoords.y, tempZ)
        groundZ = zCoord
        foundGround = success
      end
    end)
  end
end)
if not HasAlreadyTeleported then
  local markerPosition = GetFirstBlipInfo(8) -- Get position of the first waypoint

  if markerPosition then
    local teleportDistance = 2000.0

    -- Check if player is far enough to teleport
    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), markerPosition.x, markerPosition.y, GetEntityCoords(PlayerPedId()).z, true) >= teleportDistance then
      HasAlreadyTeleported = true
    end
    
    -- Teleport player to waypoint
    SetEntityCoords(PlayerPedId(), markerPosition.x, markerPosition.y, GetSafeCoordZ(markerPosition.x, markerPosition.y, 1000.0, true))
  
    TriggerEvent("gunware:notif", "info", "Téléportation au marqueur.")
  else
    -- Notify player if no marker is on the map
    TriggerEvent("gunware:notif", "info", "Aucun marqueur sur la carte")
  end
end

-- Export function to toggle noclip
exports("setNoClip", function()
  ToggleNoclip()
end)

-- Export function to toggle staff mode
exports("setStaffMode", function()
  local staffMode = not client.cache.staffMode -- Toggle staff mode
  clientSetCache("gw-staffMode", staffMode)

  -- Trigger server event to sync staff mode
  TriggerServerEvent("gunware:staffMode", staffMode)

  -- Notify player of staff mode change
  local notificationType = "success"
  local notificationMessage = staffMode and "Mode staff activé" or "Mode staff désactivé"
  TriggerEvent("gunware:notif", notificationType, notificationMessage)
end)

-- Export function to open report menu
exports("reportMenu", function()
  clientReportMenu()
end)

-- Export function to create a report
exports("createReport", function(A0_2, playerId)
  local reportText = "<B>Auteur :</B> [~b~" .. PlayerServer[playerId].name .. [[~s~]
<B>Raison :</B> ]] .. input[1]
  
  -- Trigger server event to create the report
  TriggerServerEvent("gunware:report", reportText, false)
end)

-- Export function to create a report for a specific player
exports("createReportPlayer", function(A0_2, reportingPlayerId, reportedPlayerId)
  local reportText = "<B>Auteur :</B> [~b~" .. PlayerServer[reportingPlayerId].name .. "~s~]\n<B>Joueur signalé :</B> [~b~" .. PlayerServer[reportedPlayerId].rp .. [[~s~]
<B>Raison :</B> ]] .. input[1]

  -- Trigger server event to create the report for a specific player
  TriggerServerEvent("gunware:report", reportText, reportedPlayerId)
end)

-- Export function to warn a player
exports("warnPlayer", function(targetPlayerId, reason, sourcePlayerId)
  TriggerServerEvent("gunware:sync:actionPlayer", "player_warn", {
    target = targetPlayerId,
    reason = reason,
    src = sourcePlayerId
  })
end)

-- Export function to blind a player
exports("Aveugler", function(targetPlayerId)
  TriggerServerEvent("gunware:sync:actionPlayer", "player_blind", { target = targetPlayerId })
end)

-- Export function to spectate a player
exports("Spectate", function(A0_2, sourcePlayerId)
  TriggerServerEvent("gunware:sync:actionPlayer", "player_spectate", {
    target = client.cache.playerSelected.source,
    src = sourcePlayerId
  })
end)

-- Export function to ban a player
exports("Ban", function(targetPlayerId, banTime, reason)
  TriggerServerEvent("gunware:sync:actionPlayer", "player_ban", {
    target = targetPlayerId,
    time = banTime,
    reason = reason
  })
end)

-- Export function to take a screenshot of a player
exports("Screenshot", function(targetPlayerId, sourcePlayerId)
  TriggerServerEvent("gunware:sync:actionPlayer", "player_screenshot", {
    target = targetPlayerId,
    src = sourcePlayerId
  })
end)

-- Export function to perform a /me action on a player
exports("player_me", function(targetPlayerId, message)
  TriggerServerEvent("gunware:sync:actionPlayer", "player_me", {
    target = targetPlayerId,
    message = message
  })
end)

-- Export function to toggle player names visibility
exports("showPlayerName", function()
  client.cache.playerNames = not client.cache.playerNames
  showNames(client.cache.playerNames)
end)

-- Export function to toggle blips visibility
exports("showBlips", function()
  chow_blips_1 = not chow_blips_1
end)

-- Create a thread to detect shooting and send the data to the server
Citizen.CreateThread(function()
  while true do
    local playerPed = PlayerPedId()
    local isArmed = IsPedArmed(playerPed, 4)

    local waitTime = 1000 -- Default wait time

    if isArmed then
      waitTime = 0

      if IsPedShooting(playerPed) then
        local weaponHash = GetSelectedPedWeapon(playerPed)
        local startPosition = GetEntityCoords(playerPed)
        local cameraRotation = GetGameplayCamRot(2)
        local direction = RotationToDirection(cameraRotation)

        local endPosition = vector3(
          startPosition.x + direction.x * 1000.0,
          startPosition.y + direction.y * 1000.0,
          startPosition.z + direction.z * 1000.0
        )

        -- Perform a raycast to detect what was hit
        local rayHandle = StartShapeTestRay(
          startPosition.x, startPosition.y, startPosition.z,
          endPosition.x, endPosition.y, endPosition.z,
          -1, playerPed, 0
        )

        local hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)

        local hitEntityType = "surface" -- Default hit type

        if hit then
          if entityHit > 0 then
            if IsEntityAPed(entityHit) then
              hitEntityType = "ped"
            elseif IsEntityAVehicle(entityHit) then
              hitEntityType = "vehicle"
            elseif IsEntityAnObject(entityHit) then
              hitEntityType = "object"
            else
              hitEntityType = "unknown"
            end
          end

          -- Send the weapon data to the server
          TriggerServerEvent("addweaponshoot", {
            shooter = GetPlayerServerId(PlayerId()),
            weapon = weaponHash,
            startPosition = startPosition,
            impactPosition = endCoords,
            hitEntity = entityHit > 0 and entityHit or nil,
            hitEntityType = hitEntityType
          })
        end
      end
    end

    Citizen.Wait(waitTime)
  end
end)

RegisterNetEvent("gunware:addweaponshootClient")
AddEventHandler("gunware:addweaponshootClient", function(shootData)
  -- Get config for gunshot notifications
  local gunNotifConfig = clientGetCache("gw-gunNotif-", 1)

  if 2 == gunNotifConfig then
    TriggerEvent("gunware:notif", "info", "Un joueur a tiré, marqueur ajouté Y pour vous téléporter")
    table.insert(bullets, shootData) -- Add to bullets table for drawing

    AddBlipForArea(
      shootData.impactPosition.x,
      shootData.impactPosition.y,
      shootData.impactPosition.z,
      5.0,
      1
    )

    -- Give the option to teleport for user roles only.
    if "user" ~= PlayerServer[GetPlayerServerId(PlayerId())].role then
      table.insert(bullets, shootData)
      
      -- Teleport code
      local i = 1
      while i < 100 do
        if IsControlJustPressed(0, 246) then
          SetEntityCoords(
            PlayerPedId(),
            shootData.startPosition.x,
            shootData.startPosition.y,
            shootData.startPosition.z
          )
          break
        end
        i = i + 1
        Citizen.Wait(0)
      end
    end
  end
end)

-- Draw lines and debug info when a gun is shot
Citizen.CreateThread(function()
  while true do
    local waitTime = 3500
    local gunNotifConfig = clientGetCache("gw-gunNotif-", 1)
    
    if 2 == gunNotifConfig then
      waitTime = 0

      -- Loop through all the shots
      for _, shotData in ipairs(bullets) do
        if shotData.startPosition and shotData.impactPosition then
          -- Draw line between the impact and shot position.
          DrawLine(
            shotData.startPosition.x,
            shotData.startPosition.y,
            shotData.startPosition.z,
            shotData.impactPosition.x,
            shotData.impactPosition.y,
            shotData.impactPosition.z,
            255,
            0,
            0,
            255
          )

          -- Display debugging info
          local impactText = string.format(
            "Position d'impact: %s\nArme: %s\nType d'entité touchée: %s",
            GetPlayerName(PlayerId()),
            shotData.weapon,
            shotData.hitEntityType or "None"
          )

          Draw3DText(
            shotData.impactPosition.x,
            shotData.impactPosition.y,
            shotData.impactPosition.z + 0.2,
            impactText
          )

          local shotPositionText = string.format("Position de tir: %s", GetPlayerName(PlayerId()))
          
          Draw3DText(
            shotData.startPosition.x,
            shotData.startPosition.y,
            shotData.startPosition.z + 0.2,
            shotPositionText
          )
        end
      end
    end

    Citizen.Wait(waitTime)
  end
end)

-- Draw 3D text function
Draw3DText = function(x, y, z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)

  local scale = 0.35
  if onScreen then
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
  end
end

-- Rotation to Direction function
RotationToDirection = function(rotation)
  local z = math.rad(rotation.z)
  local x = math.rad(rotation.x)
  local absX = math.abs(math.cos(x))

  return vector3(
    -math.sin(z) * absX,
    math.cos(z) * absX,
    math.sin(x)
  )
end