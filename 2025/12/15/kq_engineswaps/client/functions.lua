local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "kq_engineswaps:setTime"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "kq_engineswaps:setTime"
function L2_1(A0_2)
  local L1_2
  time = A0_2
end
L0_1(L1_1, L2_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = 60000
    L1_2 = TriggerServerEvent
    L2_2 = "kq_engineswaps:getTime"
    L1_2(L2_2)
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L0_1(L1_1)
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = "unknown"
  if A1_2 then
    L3_2 = A1_2.playerWorkshop
    if L3_2 then
      L2_2 = "player"
    else
      L2_2 = A1_2.storageName
    end
    L3_2 = stocks
    L3_2 = L3_2[L2_2]
    if not L3_2 then
      L3_2 = false
      return L3_2
    end
    L3_2 = pairs
    L4_2 = stocks
    L4_2 = L4_2[L2_2]
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.part
      if L9_2 == A0_2 then
        L9_2 = L8_2.available_at
        L10_2 = time
        if L9_2 <= L10_2 then
          L9_2 = true
          return L9_2
        end
      end
    end
  end
  L3_2 = false
  return L3_2
end
IsEngineInStock = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = math
  L1_2 = L1_2.floor
  L2_2 = A0_2 * A0_2
  L2_2 = L2_2 * 1000
  return L1_2(L2_2)
end
CalculatePowerRating = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = math
  L1_2 = L1_2.floor
  L2_2 = A0_2 * 1.32
  return L1_2(L2_2)
end
CalculateSpeedRating = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = ClearAreaOfObjects
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = Config
  L4_2 = L4_2.StrictObjectDeletion
  if L4_2 then
    L4_2 = vector3
    L5_2 = A0_2
    L6_2 = A1_2
    L7_2 = A2_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = GetGamePool
    L6_2 = "CObject"
    L5_2 = L5_2(L6_2)
    L6_2 = 1
    L7_2 = #L5_2
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = L5_2[L9_2]
      L11_2 = GetEntityCoords
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      L12_2 = L11_2 - L4_2
      L12_2 = #L12_2
      if A3_2 >= L12_2 then
        L13_2 = Contains
        L14_2 = laptopObjects
        L15_2 = L10_2
        L13_2 = L13_2(L14_2, L15_2)
        if not L13_2 then
          L13_2 = crateObject
          if L10_2 ~= L13_2 then
            L13_2 = DeleteObject
            L14_2 = L10_2
            L13_2(L14_2)
            L13_2 = DoesEntityExist
            L14_2 = L10_2
            L13_2 = L13_2(L14_2)
            if L13_2 then
              L13_2 = NetworkRequestControlOfEntity
              L14_2 = L10_2
              L13_2(L14_2)
              L13_2 = 0
              while true do
                L14_2 = NetworkHasControlOfEntity
                L15_2 = L10_2
                L14_2 = L14_2(L15_2)
                if not (not L14_2 and L13_2 < 20) then
                  break
                end
                L14_2 = Citizen
                L14_2 = L14_2.Wait
                L15_2 = 10
                L14_2(L15_2)
                L13_2 = L13_2 + 1
              end
              L14_2 = DeleteObject
              L15_2 = L10_2
              L14_2(L15_2)
            end
          end
        end
      end
    end
  end
end
_ClearAreaOfObjects = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = vector3
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = GetGamePool
  L6_2 = "CVehicle"
  L5_2 = L5_2(L6_2)
  L6_2 = -1
  L7_2 = -1
  L8_2 = 1
  L9_2 = #L5_2
  L10_2 = 1
  for L11_2 = L8_2, L9_2, L10_2 do
    L12_2 = GetEntityCoords
    L13_2 = L5_2[L11_2]
    L12_2 = L12_2(L13_2)
    L13_2 = L12_2 - L4_2
    L13_2 = #L13_2
    if (-1 == L6_2 or L6_2 > L13_2) and A3_2 >= L13_2 then
      L7_2 = L5_2[L11_2]
      L6_2 = L13_2
    end
  end
  L8_2 = L7_2
  L9_2 = L6_2
  return L8_2, L9_2
end
GetNearestVehicle = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetEntityModel
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetModelDimensions
  L3_2 = L1_2
  L2_2, L3_2 = L2_2(L3_2)
  L4_2 = {}
  L5_2 = math
  L5_2 = L5_2.abs
  L6_2 = L2_2.x
  L7_2 = L3_2.x
  L6_2 = L6_2 - L7_2
  L5_2 = L5_2(L6_2)
  L4_2.x = L5_2
  L5_2 = math
  L5_2 = L5_2.abs
  L6_2 = L2_2.y
  L7_2 = L3_2.y
  L6_2 = L6_2 - L7_2
  L5_2 = L5_2(L6_2)
  L4_2.y = L5_2
  L5_2 = math
  L5_2 = L5_2.abs
  L6_2 = L2_2.z
  L7_2 = L3_2.z
  L6_2 = L6_2 - L7_2
  L5_2 = L5_2(L6_2)
  L4_2.z = L5_2
  return L4_2
end
GetVehicleDimensions = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = RequestAnimDict
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = 0
  while true do
    L4_2 = HasAnimDictLoaded
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = Citizen
    L4_2 = L4_2.Wait
    L5_2 = 100
    L4_2(L5_2)
    L3_2 = L3_2 + 1
    if L3_2 > 100 then
      return
    end
  end
  L4_2 = TaskPlayAnim
  L5_2 = PlayerPedId
  L5_2 = L5_2()
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = 4.0
  L9_2 = 8.0
  L10_2 = 5.0
  L11_2 = A2_2 or L11_2
  if not A2_2 then
    L11_2 = 1
  end
  L12_2 = 0
  L13_2 = true
  L14_2 = true
  L15_2 = false
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L4_2 = RemoveAnimDict
  L5_2 = A0_2
  L4_2(L5_2)
end
PlayAnim = L0_1
L0_1 = RegisterNetEvent
L1_1 = "kq_engineswaps:notify"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "kq_engineswaps:notify"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = ShowTooltip
  L2_2 = A0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = Config
  L1_2 = L1_2.Debug
  if L1_2 then
    L1_2 = print
    L2_2 = A0_2
    L1_2(L2_2)
  end
end
Debug = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if nil == A0_2 then
    A0_2 = parkedVehicle
  end
  L1_2 = GetWorldPositionOfEntityBone
  L2_2 = A0_2
  L3_2 = GetEntityBoneIndexByName
  L4_2 = A0_2
  L5_2 = "bonnet"
  L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = GetWorldPositionOfEntityBone
  L3_2 = A0_2
  L4_2 = GetEntityBoneIndexByName
  L5_2 = A0_2
  L6_2 = "engine"
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L3_2 = GetWorldPositionOfEntityBone
  L4_2 = A0_2
  L5_2 = GetEntityBoneIndexByName
  L6_2 = A0_2
  L7_2 = "boot"
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = GetDistanceBetweenCoords
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = GetDistanceBetweenCoords
  L6_2 = L2_2
  L7_2 = L1_2
  L5_2 = L5_2(L6_2, L7_2)
  if L4_2 < L5_2 then
    L4_2 = true
    return L4_2
  end
  L4_2 = false
  return L4_2
end
IsEngineInRear = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 == A1_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = false
  return L2_2
end
Contains = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = Citizen
  L1_2 = L1_2.CreateThread
  function L2_2()
    local L0_3, L1_3
    L0_3 = A0_2
    if L0_3 then
      L0_3 = DoesEntityExist
      L1_3 = A0_2
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = DeleteObject
        L1_3 = A0_2
        L0_3(L1_3)
      end
    end
  end
  L1_2(L2_2)
end
DeleteIfExists = L0_1
function L0_1()
  local L0_2, L1_2
  L0_2 = currentWorkshop
  if L0_2 then
    L0_2 = CanUsePurchaseEngines
    L1_2 = currentWorkshop
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = 2
      return L0_2
    end
    L0_2 = CanUseWorkshop
    L1_2 = currentWorkshop
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = 1
      return L0_2
    end
  end
  L0_2 = 0
  return L0_2
end
GetPermissions = L0_1
L0_1 = nil
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  while true do
    L0_2 = 2000
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = IsPedInAnyVehicle
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = GetEntityCoords
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L3_2 = GetGamePool
      L4_2 = "CVehicle"
      L3_2 = L3_2(L4_2)
      L4_2 = false
      L5_2 = 1
      L6_2 = #L3_2
      L7_2 = 1
      for L8_2 = L5_2, L6_2, L7_2 do
        L9_2 = L3_2[L8_2]
        L10_2 = GetEntityCoords
        L11_2 = L9_2
        L10_2 = L10_2(L11_2)
        L11_2 = GetDistanceBetweenCoords
        L12_2 = L10_2
        L13_2 = L2_2
        L11_2 = L11_2(L12_2, L13_2)
        if L11_2 <= 4.0 then
          L11_2 = upgradedCars
          L11_2 = L11_2[L9_2]
          if L11_2 then
            L11_2 = 4
            L12_2 = IsEngineInRear
            L13_2 = L9_2
            L12_2 = L12_2(L13_2)
            if L12_2 then
              L11_2 = 5
            end
            L12_2 = GetVehicleDoorAngleRatio
            L13_2 = L9_2
            L14_2 = L11_2
            L12_2 = L12_2(L13_2, L14_2)
            L13_2 = 0.4
            if L12_2 > L13_2 then
              L12_2 = GetWorldPositionOfEntityBone
              L13_2 = L9_2
              L14_2 = GetEntityBoneIndexByName
              L15_2 = L9_2
              L16_2 = "engine"
              L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2)
              L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
              L13_2 = GetDistanceBetweenCoords
              L14_2 = L12_2
              L15_2 = L2_2
              L13_2 = L13_2(L14_2, L15_2)
              L14_2 = 2.5
              if L13_2 <= L14_2 then
                L0_1 = L9_2
                L4_2 = true
                break
              end
            end
          end
        end
      end
      if not L4_2 then
        L5_2 = L0_1
        if L5_2 then
          L5_2 = nil
          L0_1 = L5_2
        end
      end
    else
      L2_2 = L0_1
      if L2_2 then
        L2_2 = nil
        L0_1 = L2_2
      end
    end
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = L0_2
    L2_2(L3_2)
  end
end
L1_1(L2_1)
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  while true do
    L0_2 = 2000
    L1_2 = L0_1
    if L1_2 then
      L0_2 = 0
      L1_2 = Config
      L1_2 = L1_2.Engines
      L2_2 = upgradedCars
      L3_2 = L0_1
      L2_2 = L2_2[L3_2]
      L1_2 = L1_2[L2_2]
      L2_2 = GetWorldPositionOfEntityBone
      L3_2 = L0_1
      L4_2 = GetEntityBoneIndexByName
      L5_2 = L0_1
      L6_2 = "engine"
      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L4_2(L5_2, L6_2)
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      L3_2 = Draw3DText
      L4_2 = L2_2.x
      L5_2 = L2_2.y
      L6_2 = L2_2.z
      L6_2 = L6_2 + 0.1
      L7_2 = "~y~"
      L8_2 = L1_2.name
      L7_2 = L7_2 .. L8_2
      L8_2 = 4
      L9_2 = 0.03
      L10_2 = 0.03
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L1_1(L2_1)
function L1_1(A0_2)
  local L1_2
  L1_2 = Locale
  if L1_2 then
    L1_2 = Locale
    L1_2 = L1_2[A0_2]
    if L1_2 then
      L1_2 = Locale
      L1_2 = L1_2[A0_2]
      return L1_2
    end
  end
  return A0_2
end
L = L1_1
