local L0_1, L1_1, L2_1, L3_1
L0_1 = RegisterNUICallback
L1_1 = "executeAction"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = A0_2.action
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "electus_admin:hasPermission"
  L5_2 = false
  L6_2 = A0_2.permission
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = {}
    L5_2.error = "permission"
    return L4_2(L5_2)
  end
  if "teleportToPlayer" == L2_2 then
    L4_2 = GetEntityCoords
    L5_2 = GetPlayerPed
    L6_2 = GetPlayerFromServerId
    L7_2 = A0_2.playerId
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L5_2 = SetEntityCoords
    L6_2 = PlayerPedId
    L6_2 = L6_2()
    L7_2 = L4_2.x
    L8_2 = L4_2.y
    L9_2 = L4_2.z
    L5_2(L6_2, L7_2, L8_2, L9_2)
  elseif "teleportToCoords" == L2_2 then
    L4_2 = SetEntityCoords
    L5_2 = PlayerPedId
    L5_2 = L5_2()
    L6_2 = tonumber
    L7_2 = A0_2.coords
    L7_2 = L7_2.x
    L6_2 = L6_2(L7_2)
    L6_2 = L6_2 + 0.0
    L7_2 = tonumber
    L8_2 = A0_2.coords
    L8_2 = L8_2.y
    L7_2 = L7_2(L8_2)
    L7_2 = L7_2 + 0.0
    L8_2 = tonumber
    L9_2 = A0_2.coords
    L9_2 = L9_2.z
    L8_2 = L8_2(L9_2)
    L8_2 = L8_2 + 0.0
    L4_2(L5_2, L6_2, L7_2, L8_2)
  elseif "teleportToWaypoint" == L2_2 then
    L4_2 = GetFirstBlipInfoId
    L5_2 = 8
    L4_2 = L4_2(L5_2)
    L5_2 = 0.0
    L6_2 = 0.0
    if 0 ~= L4_2 then
      L7_2 = GetBlipCoords
      L8_2 = L4_2
      L7_2 = L7_2(L8_2)
      L5_2 = L7_2.x
      L6_2 = L7_2.y
    end
    L7_2 = GetGroundZFor_3dCoord
    L8_2 = L5_2
    L9_2 = L6_2
    L10_2 = 1000.0
    L11_2 = 0
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    L8_2 = SetEntityCoords
    L9_2 = PlayerPedId
    L9_2 = L9_2()
    L10_2 = L5_2
    L11_2 = L6_2
    L12_2 = L7_2
    L8_2(L9_2, L10_2, L11_2, L12_2)
  elseif "spawnVehicle" == L2_2 then
  elseif "deleteVehicle" == L2_2 then
    L4_2 = DeleteVehicle
    L4_2()
  elseif "repairVehicle" == L2_2 then
    L4_2 = RepairVehicle
    L4_2()
  elseif "revivePlayer" == L2_2 then
    L4_2 = TriggerEvent
    L5_2 = "hospital:client:Revive"
    L6_2 = PlayerId
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2()
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L4_2 = TriggerEvent
    L5_2 = "esx_ambulancejob:revive"
    L6_2 = PlayerId
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2()
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L4_2 = TriggerEvent
    L5_2 = "hospital:client:Revive"
    L6_2 = PlayerId
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2()
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  elseif "godMode" == L2_2 then
    L4_2 = ToggleGodMode
    L4_2()
  elseif "boostVehicle" == L2_2 then
    L4_2 = BoostVehicle
    L4_2()
  elseif "entityDebugger" == L2_2 then
    L4_2 = ToggleEntityDebugger
    L4_2()
  elseif "playerIds" == L2_2 then
    L4_2 = TogglePlayerIds
    L4_2()
  elseif "noClip" == L2_2 then
    L4_2 = ToggleNoClipMode
    L4_2()
  elseif "copyCoordsVector3" == L2_2 then
    L4_2 = GetEntityCoords
    L5_2 = PlayerPedId
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2()
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L5_2 = string
    L5_2 = L5_2.format
    L6_2 = "vector3(%.2f, %.2f, %.2f)"
    L7_2 = L4_2.x
    L8_2 = L4_2.y
    L9_2 = L4_2.z
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L6_2 = A1_2
    L7_2 = L5_2
    L6_2(L7_2)
    return
  elseif "copyCoordsVector4" == L2_2 then
    L4_2 = GetEntityCoords
    L5_2 = PlayerPedId
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2()
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L5_2 = GetEntityHeading
    L6_2 = PlayerPedId
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2()
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = "vector4(%.2f, %.2f, %.2f, %.2f)"
    L8_2 = L4_2.x
    L9_2 = L4_2.y
    L10_2 = L4_2.z
    L11_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
    L7_2 = A1_2
    L8_2 = L6_2
    L7_2(L8_2)
    return
  end
  L4_2 = A1_2
  L5_2 = {}
  L6_2 = {}
  L5_2.data = L6_2
  L6_2 = {}
  L6_2.ok = true
  L6_2.message = "done"
  L5_2.meta = L6_2
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)
function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  while true do
    L0_2 = OnlineMenu
    if L0_2 then
      L0_2 = UIVisible
      if L0_2 then
        L0_2 = IsControlJustPressed
        L1_2 = 0
        L2_2 = 175
        L0_2 = L0_2(L1_2, L2_2)
        if L0_2 then
          L0_2 = SendReactMessage
          L1_2 = "actionsSwitch"
          L2_2 = {}
          L2_2.right = true
          L0_2(L1_2, L2_2)
        else
          L0_2 = IsControlJustPressed
          L1_2 = 0
          L2_2 = 174
          L0_2 = L0_2(L1_2, L2_2)
          if L0_2 then
            L0_2 = SendReactMessage
            L1_2 = "actionsSwitch"
            L2_2 = {}
            L2_2.right = false
            L0_2(L1_2, L2_2)
          else
            L0_2 = IsControlJustPressed
            L1_2 = 0
            L2_2 = 172
            L0_2 = L0_2(L1_2, L2_2)
            if L0_2 then
              L0_2 = SendReactMessage
              L1_2 = "catergoriesSwitch"
              L2_2 = {}
              L2_2.up = true
              L0_2(L1_2, L2_2)
            else
              L0_2 = IsControlJustPressed
              L1_2 = 0
              L2_2 = 173
              L0_2 = L0_2(L1_2, L2_2)
              if L0_2 then
                L0_2 = SendReactMessage
                L1_2 = "catergoriesSwitch"
                L2_2 = {}
                L2_2.up = false
                L0_2(L1_2, L2_2)
              else
                L0_2 = IsControlJustPressed
                L1_2 = 0
                L2_2 = 176
                L0_2 = L0_2(L1_2, L2_2)
                if L0_2 then
                  L0_2 = SendReactMessage
                  L1_2 = "executeAction"
                  L0_2(L1_2)
                else
                  L0_2 = IsControlJustPressed
                  L1_2 = 0
                  L2_2 = Config
                  L2_2 = L2_2.keys
                  L3_2 = Config
                  L3_2 = L3_2.keyActions
                  L3_2 = L3_2.cancel
                  L2_2 = L2_2[L3_2]
                  L2_2 = L2_2.key
                  L0_2 = L0_2(L1_2, L2_2)
                  if L0_2 then
                    L0_2 = ToggleNuiFrame
                    L1_2 = false
                    L0_2(L1_2)
                  end
                end
              end
            end
          end
        end
      end
    end
    L0_2 = Wait
    L1_2 = 1
    L0_2(L1_2)
  end
end
HandleOnlineMenu = L0_1
L0_1 = CreateThread
L1_1 = HandleOnlineMenu
L0_1(L1_1)
L0_1 = false
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = L0_1
  L0_2 = not L0_2
  L0_1 = L0_2
  L0_2 = Notify
  L1_2 = L0_1
  if L1_2 then
    L1_2 = L
    L2_2 = "online_menu.god_mode_enabled"
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_16
    end
  end
  L1_2 = L
  L2_2 = "online_menu.god_mode_disabled"
  L1_2 = L1_2(L2_2)
  ::lbl_16::
  L0_2(L1_2)
  L0_2 = SetEntityInvincible
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = L0_1
  L0_2(L1_2, L2_2)
end
ToggleGodMode = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = GetVehiclePedIsIn
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = DoesEntityExist
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = Notify
    L2_2 = L
    L3_2 = "online_menu.vehicle_not_found"
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    return L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  L1_2 = SetVehicleFixed
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = SetVehicleDeformationFixed
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = SetVehicleUndriveable
  L2_2 = L0_2
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = SetVehicleEngineOn
  L2_2 = L0_2
  L3_2 = true
  L4_2 = true
  L5_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = Notify
  L2_2 = L
  L3_2 = "online_menu.vehicle_repaired"
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
RepairVehicle = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = GetVehiclePedIsIn
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = DoesEntityExist
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = Notify
    L2_2 = L
    L3_2 = "online_menu.vehicle_not_found"
    L2_2, L3_2 = L2_2(L3_2)
    return L1_2(L2_2, L3_2)
  end
  L1_2 = DeleteEntity
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = Notify
  L2_2 = L
  L3_2 = "online_menu.vehicle_deleted"
  L2_2, L3_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2)
end
DeleteVehicle = L1_1
L1_1 = RegisterNUICallback
L2_1 = "hasPermission"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = lib
  L2_2 = L2_2.callback
  L2_2 = L2_2.await
  L3_2 = "electus_admin:hasPermission"
  L4_2 = false
  L5_2 = A0_2.permission
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    L3_2 = A1_2
    L4_2 = true
    L3_2(L4_2)
  else
    L3_2 = A1_2
    L4_2 = false
    L3_2(L4_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "getVehicleModels"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = GetAllVehicleModels
  L2_2 = L2_2()
  L3_2 = 1
  L4_2 = #L2_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = {}
    L8_2 = L2_2[L6_2]
    L7_2.name = L8_2
    L8_2 = GetLabelText
    L9_2 = GetDisplayNameFromVehicleModel
    L10_2 = L2_2[L6_2]
    L9_2, L10_2 = L9_2(L10_2)
    L8_2 = L8_2(L9_2, L10_2)
    L7_2.label = L8_2
    L2_2[L6_2] = L7_2
  end
  L3_2 = A1_2
  L4_2 = {}
  L4_2.models = L2_2
  L3_2(L4_2)
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = GetEntityCoords
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = GetEntityHeading
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = RequestModel
  L5_2 = A0_2
  L4_2(L5_2)
  while true do
    L4_2 = HasModelLoaded
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = Wait
    L5_2 = 0
    L4_2(L5_2)
  end
  L4_2 = CreateVehicle
  L5_2 = A0_2
  L6_2 = L2_2
  L7_2 = L3_2
  L8_2 = true
  L9_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L5_2 = SetPedIntoVehicle
  L6_2 = L1_2
  L7_2 = L4_2
  L8_2 = -1
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = SetEntityAsNoLongerNeeded
  L6_2 = L4_2
  L5_2(L6_2)
  L5_2 = SetModelAsNoLongerNeeded
  L6_2 = A0_2
  L5_2(L6_2)
  L5_2 = Notify
  L6_2 = L
  L7_2 = "online_menu.vehicle_spawned"
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  L5_2(L6_2, L7_2, L8_2, L9_2)
end
SpawnVehicle = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = GetVehiclePedIsIn
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = DoesEntityExist
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = Notify
    L2_2 = L
    L3_2 = "online_menu.vehicle_not_found"
    L2_2, L3_2 = L2_2(L3_2)
    return L1_2(L2_2, L3_2)
  end
  L1_2 = SetVehicleEnginePowerMultiplier
  L2_2 = L0_2
  L3_2 = 100.0
  L1_2(L2_2, L3_2)
  L1_2 = Notify
  L2_2 = L
  L3_2 = "online_menu.vehicle_boosted"
  L2_2, L3_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2)
end
BoostVehicle = L1_1
L1_1 = RegisterNetEvent
L2_1 = "electus_admin:notification"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = SendReactMessage
  L2_2 = "notification"
  L3_2 = {}
  L4_2 = A0_2.message
  L3_2.message = L4_2
  L1_2(L2_2, L3_2)
end
L1_1(L2_1, L3_1)
