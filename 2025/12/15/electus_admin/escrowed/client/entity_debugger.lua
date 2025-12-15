local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = false
L1_1 = 0
L2_1 = 50.0
L3_1 = 100.0
function L4_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetEntityType
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if 1 == L1_2 then
    L2_2 = "PED"
    return L2_2
  elseif 2 == L1_2 then
    L2_2 = "VEHICLE"
    return L2_2
  elseif 3 == L1_2 then
    L2_2 = "OBJECT"
    return L2_2
  else
    L2_2 = "UNKNOWN"
    return L2_2
  end
end
GetEntityTypeName = L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "(%.2f, %.2f, %.2f)"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2)
end
FormatVector3 = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = DoesEntityExist
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 or 0 == A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = {}
  L1_2.handle = A0_2
  L2_2 = GetEntityTypeName
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2.type = L2_2
  L2_2 = GetEntityArchetypeName
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2.arcName = L2_2
  L2_2 = GetEntityModel
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2.model = L2_2
  L2_2 = math
  L2_2 = L2_2.round
  L3_2 = GetEntityCoords
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.x
  L2_2 = L2_2(L3_2)
  L3_2 = ", "
  L4_2 = math
  L4_2 = L4_2.round
  L5_2 = GetEntityCoords
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2.y
  L4_2 = L4_2(L5_2)
  L5_2 = ", "
  L6_2 = math
  L6_2 = L6_2.round
  L7_2 = GetEntityCoords
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2.z
  L6_2 = L6_2(L7_2)
  L2_2 = L2_2 .. L3_2 .. L4_2 .. L5_2 .. L6_2
  L1_2.pos = L2_2
  L2_2 = math
  L2_2 = L2_2.round
  L3_2 = GetEntityHeading
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  L1_2.heading = L2_2
  L2_2 = GetEntityHealth
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2.health = L2_2
  L2_2 = IsEntityPositionFrozen
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = "Yes"
    if L2_2 then
      goto lbl_70
    end
  end
  L2_2 = "No"
  ::lbl_70::
  L1_2.frozen = L2_2
  L2_2 = GetEntityType
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if 2 == L2_2 then
    L2_2 = math
    L2_2 = L2_2.round
    L3_2 = GetEntitySpeed
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L3_2 = L3_2 * 3.6
    L2_2 = L2_2(L3_2)
    L1_2.speed = L2_2
  end
  return L1_2
end
GetEntityDebugInfo = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = GetGameplayCamCoord
  L1_2 = L1_2()
  L2_2 = GetGameplayCamRot
  L3_2 = 2
  L2_2 = L2_2(L3_2)
  L3_2 = RotationToDirection
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = L3_1
  L4_2 = L3_2 * L4_2
  L4_2 = L1_2 + L4_2
  L5_2 = StartShapeTestRay
  L6_2 = L1_2.x
  L7_2 = L1_2.y
  L8_2 = L1_2.z
  L9_2 = L4_2.x
  L10_2 = L4_2.y
  L11_2 = L4_2.z
  L12_2 = -1
  L13_2 = L0_2
  L14_2 = 0
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L6_2 = GetShapeTestResult
  L7_2 = L5_2
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2)
  if 1 == L7_2 then
    L11_2 = IsEntityAnObject
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    if not L11_2 then
      L11_2 = IsEntityAVehicle
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      if not L11_2 then
        L11_2 = IsEntityAPed
        L12_2 = L10_2
        L11_2 = L11_2(L12_2)
        if not L11_2 then
          goto lbl_48
        end
      end
    end
    return L10_2
  end
  ::lbl_48::
  L11_2 = nil
  return L11_2
end
GetTargetedEntity = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = math
  L1_2 = L1_2.rad
  L2_2 = A0_2.z
  L1_2 = L1_2(L2_2)
  L2_2 = math
  L2_2 = L2_2.rad
  L3_2 = A0_2.x
  L2_2 = L2_2(L3_2)
  L3_2 = math
  L3_2 = L3_2.abs
  L4_2 = math
  L4_2 = L4_2.cos
  L5_2 = L2_2
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L4_2 = vector3
  L5_2 = math
  L5_2 = L5_2.sin
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  L5_2 = -L5_2
  L5_2 = L5_2 * L3_2
  L6_2 = math
  L6_2 = L6_2.cos
  L7_2 = L1_2
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2 * L3_2
  L7_2 = math
  L7_2 = L7_2.sin
  L8_2 = L2_2
  L7_2, L8_2 = L7_2(L8_2)
  return L4_2(L5_2, L6_2, L7_2, L8_2)
end
RotationToDirection = L4_1
function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = SetTextFont
  L5_2 = 0
  L4_2(L5_2)
  L4_2 = SetTextProportional
  L5_2 = true
  L4_2(L5_2)
  L4_2 = SetTextScale
  L5_2 = A3_2
  L6_2 = A3_2
  L4_2(L5_2, L6_2)
  L4_2 = SetTextColour
  L5_2 = 255
  L6_2 = 255
  L7_2 = 255
  L8_2 = 255
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = SetTextEntry
  L5_2 = "STRING"
  L4_2(L5_2)
  L4_2 = AddTextComponentString
  L5_2 = A2_2
  L4_2(L5_2)
  L4_2 = DrawText
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2(L5_2, L6_2)
end
DrawDebugText = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetEntityDebugInfo
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = SendReactMessage
  L3_2 = "receiveEntityData"
  L4_2 = {}
  L4_2.entityData = L1_2
  L2_2(L3_2, L4_2)
end
DrawEntityInfo = L4_1
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = Wait
    L1_2 = L1_1
    L0_2(L1_2)
    L0_2 = L0_1
    if L0_2 then
      L0_2 = GetTargetedEntity
      L0_2 = L0_2()
      L1_2 = DrawEntityInfo
      L2_2 = L0_2
      L1_2(L2_2)
      if L0_2 then
        L1_2 = DoesEntityExist
        L2_2 = L0_2
        L1_2 = L1_2(L2_2)
        if L1_2 then
          L1_2 = DrawEntityBoundingBox
          L2_2 = L0_2
          L1_2(L2_2)
        end
      end
    end
  end
end
L4_1(L5_1)
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L1_2 = GetModelDimensions
  L2_2 = GetEntityModel
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L2_2(L3_2)
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  L3_2 = {}
  L4_2 = vector3
  L5_2 = L1_2.x
  L6_2 = L1_2.y
  L7_2 = L1_2.z
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = vector3
  L6_2 = L1_2.x
  L7_2 = L2_2.y
  L8_2 = L1_2.z
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = vector3
  L7_2 = L2_2.x
  L8_2 = L2_2.y
  L9_2 = L1_2.z
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = vector3
  L8_2 = L2_2.x
  L9_2 = L1_2.y
  L10_2 = L1_2.z
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = vector3
  L9_2 = L1_2.x
  L10_2 = L1_2.y
  L11_2 = L2_2.z
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = vector3
  L10_2 = L1_2.x
  L11_2 = L2_2.y
  L12_2 = L2_2.z
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = vector3
  L11_2 = L2_2.x
  L12_2 = L2_2.y
  L13_2 = L2_2.z
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = vector3
  L12_2 = L2_2.x
  L13_2 = L1_2.y
  L14_2 = L2_2.z
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L11_2(L12_2, L13_2, L14_2)
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L3_2[7] = L10_2
  L3_2[8] = L11_2
  L3_2[9] = L12_2
  L3_2[10] = L13_2
  L3_2[11] = L14_2
  L3_2[12] = L15_2
  L3_2[13] = L16_2
  L3_2[14] = L17_2
  L3_2[15] = L18_2
  L3_2[16] = L19_2
  L3_2[17] = L20_2
  L3_2[18] = L21_2
  L3_2[19] = L22_2
  L3_2[20] = L23_2
  L3_2[21] = L24_2
  L4_2 = {}
  L5_2 = ipairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = GetOffsetFromEntityInWorldCoords
    L12_2 = A0_2
    L13_2 = L10_2.x
    L14_2 = L10_2.y
    L15_2 = L10_2.z
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
    L4_2[L9_2] = L11_2
  end
  L5_2 = {}
  L6_2 = {}
  L7_2 = 1
  L8_2 = 2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L7_2 = {}
  L8_2 = 2
  L9_2 = 3
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = {}
  L9_2 = 3
  L10_2 = 4
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = {}
  L10_2 = 4
  L11_2 = 1
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L10_2 = {}
  L11_2 = 5
  L12_2 = 6
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L11_2 = {}
  L12_2 = 6
  L13_2 = 7
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L12_2 = {}
  L13_2 = 7
  L14_2 = 8
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L13_2 = {}
  L14_2 = 8
  L15_2 = 5
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L14_2 = {}
  L15_2 = 1
  L16_2 = 5
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L15_2 = {}
  L16_2 = 2
  L17_2 = 6
  L15_2[1] = L16_2
  L15_2[2] = L17_2
  L16_2 = {}
  L17_2 = 3
  L18_2 = 7
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L17_2 = {}
  L18_2 = 4
  L19_2 = 8
  L17_2[1] = L18_2
  L17_2[2] = L19_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L5_2[7] = L12_2
  L5_2[8] = L13_2
  L5_2[9] = L14_2
  L5_2[10] = L15_2
  L5_2[11] = L16_2
  L5_2[12] = L17_2
  L6_2 = ipairs
  L7_2 = L5_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = L11_2[1]
    L12_2 = L4_2[L12_2]
    L13_2 = L11_2[2]
    L13_2 = L4_2[L13_2]
    L14_2 = DrawLine
    L15_2 = L12_2.x
    L16_2 = L12_2.y
    L17_2 = L12_2.z
    L18_2 = L13_2.x
    L19_2 = L13_2.y
    L20_2 = L13_2.z
    L21_2 = 255
    L22_2 = 0
    L23_2 = 0
    L24_2 = 255
    L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  end
end
DrawEntityBoundingBox = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L0_1
  L0_2 = not L0_2
  L0_1 = L0_2
  L0_2 = SendReactMessage
  L1_2 = "toggleEntityDebugger"
  L2_2 = {}
  L3_2 = L0_1
  L2_2.showDebugger = L3_2
  L0_2(L1_2, L2_2)
  L0_2 = L0_1
  if L0_2 then
    L0_2 = TriggerEvent
    L1_2 = "chat:addMessage"
    L2_2 = {}
    L3_2 = {}
    L4_2 = "Entity Debugger"
    L5_2 = "Enabled"
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L2_2.args = L3_2
    L0_2(L1_2, L2_2)
  else
    L0_2 = TriggerEvent
    L1_2 = "chat:addMessage"
    L2_2 = {}
    L3_2 = {}
    L4_2 = "Entity Debugger"
    L5_2 = "Disabled"
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L2_2.args = L3_2
    L0_2(L1_2, L2_2)
  end
end
ToggleEntityDebugger = L4_1
