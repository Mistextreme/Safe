local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = false
L1_1 = false
L2_1 = nil
L3_1 = nil
function L4_1()
  local L0_2, L1_2
  L0_2 = L2_1
  return L0_2
end
GetCurrentPropertyId = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = L3_1
  return L0_2
end
GetCurrentPropertyData = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = L1_1
  return L0_2
end
IsInsideMLO = L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_1 = A1_2
  while true do
    L3_2 = waitingForLoadAfterRestart
    if not L3_2 then
      break
    end
    L3_2 = Citizen
    L3_2 = L3_2.Wait
    L4_2 = 200
    L3_2(L4_2)
  end
  L3_2 = library
  L3_2 = L3_2.Debug
  L4_2 = "You entered the Property Zone: %s"
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = L2_1
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2, L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = Properties
  L4_2 = L2_1
  L3_2 = L3_2[L4_2]
  if not L3_2 then
    return
  end
  L3_1 = L3_2
  L4_2 = RefreshTargets
  L4_2()
  L4_2 = L3_1
  if L4_2 then
    L4_2 = L3_1.furniture
    if L4_2 then
      L4_2 = Property
      L5_2 = L4_2
      L4_2 = L4_2.LoadFurniture
      L6_2 = "outside"
      L7_2 = L3_1.furniture
      L8_2 = L2_1
      L4_2(L5_2, L6_2, L7_2, L8_2)
      L4_2 = L3_1.type
      if "mlo" == L4_2 then
        L4_2 = Property
        L5_2 = L4_2
        L4_2 = L4_2.LoadFurniture
        L6_2 = "inside"
        L7_2 = L3_1.furniture
        L8_2 = L2_1
        L4_2(L5_2, L6_2, L7_2, L8_2)
      end
    end
  end
  L4_2 = Citizen
  L4_2 = L4_2.CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    while true do
      L0_3 = L2_1
      if not L0_3 then
        break
      end
      L0_3 = L3_2.type
      if "motel" ~= L0_3 then
        L0_3 = L3_2.type
        if "mlo" ~= L0_3 then
          break
        end
      end
      L0_3 = L3_2.type
      if "motel" == L0_3 then
        L0_3 = Property
        L0_3 = L0_3.GetMotelRooms
        L1_3 = L3_1
        L0_3 = L0_3(L1_3)
        L1_3 = TargetPoints
        L1_3 = #L1_3
        L2_3 = 1
        L3_3 = -1
        for L4_3 = L1_3, L2_3, L3_3 do
          L5_3 = TargetPoints
          L5_3 = L5_3[L4_3]
          L5_3 = L5_3.type
          if "door" == L5_3 then
            L5_3 = CL
            L5_3 = L5_3.Target
            L6_3 = "remove-entity"
            L7_3 = TargetPoints
            L7_3 = L7_3[L4_3]
            L7_3 = L7_3.entity
            L5_3(L6_3, L7_3)
            L5_3 = table
            L5_3 = L5_3.remove
            L6_3 = TargetPoints
            L7_3 = L4_3
            L5_3(L6_3, L7_3)
          end
        end
        L1_3 = pairs
        L2_3 = L0_3
        L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
        for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
          L7_3 = L6_3.type
          if "mlo" == L7_3 then
            L7_3 = L6_3.owner
            if not L7_3 then
              L7_3 = L6_3.renter
              if not L7_3 then
                goto lbl_63
              end
            end
            L7_3 = Property
            L8_3 = L7_3
            L7_3 = L7_3.LoadDoors
            L9_3 = L6_3.metadata
            L9_3 = L9_3.doors
            L10_3 = tostring
            L11_3 = L6_3.id
            L10_3 = L10_3(L11_3)
            L11_3 = false
            L7_3(L8_3, L9_3, L10_3, L11_3)
            goto lbl_73
            ::lbl_63::
            L7_3 = Property
            L8_3 = L7_3
            L7_3 = L7_3.LoadDoors
            L9_3 = L6_3.metadata
            L9_3 = L9_3.doors
            L10_3 = tostring
            L11_3 = L6_3.id
            L10_3 = L10_3(L11_3)
            L11_3 = false
            L12_3 = true
            L7_3(L8_3, L9_3, L10_3, L11_3, L12_3)
          end
          ::lbl_73::
        end
      else
        L0_3 = Property
        L1_3 = L0_3
        L0_3 = L0_3.LoadDoors
        L2_3 = L3_1.metadata
        L2_3 = L2_3.doors
        L3_3 = nil
        L4_3 = true
        L5_3 = L3_1.owner
        L5_3 = nil == L5_3
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
      end
      L0_3 = Wait
      L1_3 = 1500
      L0_3(L1_3)
    end
  end
  L4_2(L5_2)
end
EnterZone = L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = library
  L3_2 = L3_2.Debug
  L4_2 = "You have left the Property Zone: %s"
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = L2_1
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2(L5_2, L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = nil
  L0_1 = L3_2
  L3_2 = nil
  L2_1 = L3_2
  L3_2 = nil
  L3_1 = L3_2
  L3_2 = Property
  L4_2 = L3_2
  L3_2 = L3_2.RemoveFurniture
  L3_2(L4_2)
  L3_2 = Property
  L3_2 = L3_2.EditingFurnitureObj
  if L3_2 then
    L3_2 = DoesEntityExist
    L4_2 = Property
    L4_2 = L4_2.EditingFurnitureObj
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = DeleteObject
      L4_2 = Property
      L4_2 = L4_2.EditingFurnitureObj
      L3_2(L4_2)
    end
    L3_2 = Property
    L3_2.EditingFurniture = false
    L3_2 = Property
    L3_2.EditingFurnitureObj = nil
    L3_2 = Property
    L4_2 = {}
    L3_2.EditingFurnitureData = L4_2
  end
  L3_2 = closeNUI
  L4_2 = true
  L3_2(L4_2)
  L3_2 = 1
  L4_2 = TargetPoints
  L4_2 = #L4_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = TargetPoints
    L7_2 = L7_2[L6_2]
    L7_2 = L7_2.type
    if "entity" ~= L7_2 then
      L7_2 = TargetPoints
      L7_2 = L7_2[L6_2]
      L7_2 = L7_2.type
      if "door" ~= L7_2 then
        goto lbl_65
      end
    end
    L7_2 = CL
    L7_2 = L7_2.Target
    L8_2 = "remove-entity"
    L9_2 = TargetPoints
    L9_2 = L9_2[L6_2]
    L9_2 = L9_2.entity
    L7_2(L8_2, L9_2)
    goto lbl_72
    ::lbl_65::
    L7_2 = CL
    L7_2 = L7_2.Target
    L8_2 = "remove-zone"
    L9_2 = TargetPoints
    L9_2 = L9_2[L6_2]
    L9_2 = L9_2.id
    L7_2(L8_2, L9_2)
    ::lbl_72::
  end
  L3_2 = {}
  TargetPoints = L3_2
  L3_2 = RefreshTargets
  L3_2()
end
ExitZone = L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = 0
  L4_2 = 0
  L5_2 = #A0_2
  L6_2 = 1
  L7_2 = L5_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = A0_2[L9_2]
    L10_2 = L10_2.x
    L3_2 = L3_2 + L10_2
    L10_2 = A0_2[L9_2]
    L10_2 = L10_2.y
    L4_2 = L4_2 + L10_2
  end
  L6_2 = vector3
  L7_2 = L3_2 / L5_2
  L8_2 = L4_2 / L5_2
  if A1_2 and A2_2 then
    L9_2 = A1_2 + A2_2
    L9_2 = L9_2 / 2
    if L9_2 then
      goto lbl_33
    end
  end
  L9_2 = 0.0
  ::lbl_33::
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  return L6_2
end
getZoneCenter = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = 0
  L2_2 = #A0_2
  L3_2 = 1
  L4_2 = #A0_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = A0_2[L2_2]
    L7_2 = L7_2.x
    L8_2 = A0_2[L6_2]
    L8_2 = L8_2.x
    L7_2 = L7_2 + L8_2
    L8_2 = A0_2[L2_2]
    L8_2 = L8_2.y
    L9_2 = A0_2[L6_2]
    L9_2 = L9_2.y
    L8_2 = L8_2 - L9_2
    L7_2 = L7_2 * L8_2
    L1_2 = L1_2 + L7_2
    L2_2 = L6_2
  end
  L3_2 = math
  L3_2 = L3_2.abs
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L1_2 = L3_2 / 2
  L3_2 = Config
  L3_2 = L3_2.AreaUnit
  if "ft2" == L3_2 then
    L1_2 = L1_2 * 10.7639
  end
  L3_2 = math
  L3_2 = L3_2.floor
  L4_2 = L1_2
  return L3_2(L4_2)
end
calculatePolygonArea = L4_1
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = 0
  L3_2 = #A1_2
  L4_2 = A0_2.x
  L5_2 = A0_2.y
  L6_2 = 1
  L7_2 = L3_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L9_2 % L3_2
    L10_2 = L10_2 + 1
    L11_2 = A1_2[L9_2]
    L12_2 = A1_2[L10_2]
    L13_2 = L11_2.y
    L13_2 = L5_2 < L13_2
    L14_2 = L12_2.y
    L14_2 = L5_2 < L14_2
    if L13_2 ~= L14_2 then
      L13_2 = L12_2.x
      L14_2 = L11_2.x
      L13_2 = L13_2 - L14_2
      L14_2 = L11_2.y
      L14_2 = L5_2 - L14_2
      L13_2 = L13_2 * L14_2
      L14_2 = L12_2.y
      L15_2 = L11_2.y
      L14_2 = L14_2 - L15_2
      L13_2 = L13_2 / L14_2
      L14_2 = L11_2.x
      L13_2 = L13_2 + L14_2
      if L4_2 < L13_2 then
        L2_2 = L2_2 + 1
      end
    end
  end
  L6_2 = L2_2 % 2
  L6_2 = 1 == L6_2
  return L6_2
end
isPointInPolygon = L4_1
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L7_2 = vector3
  L8_2 = A0_2.x
  L9_2 = A0_2.y
  L10_2 = A2_2
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = vector3
  L9_2 = A0_2.x
  L10_2 = A0_2.y
  L11_2 = A3_2
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = vector3
  L10_2 = A1_2.x
  L11_2 = A1_2.y
  L12_2 = A2_2
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = vector3
  L11_2 = A1_2.x
  L12_2 = A1_2.y
  L13_2 = A3_2
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = DrawPoly
  L12_2 = L7_2
  L13_2 = L8_2
  L14_2 = L9_2
  L15_2 = A4_2
  L16_2 = A5_2
  L17_2 = A6_2
  L18_2 = 70
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L11_2 = DrawPoly
  L12_2 = L8_2
  L13_2 = L10_2
  L14_2 = L9_2
  L15_2 = A4_2
  L16_2 = A5_2
  L17_2 = A6_2
  L18_2 = 70
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L11_2 = DrawPoly
  L12_2 = L9_2
  L13_2 = L10_2
  L14_2 = L8_2
  L15_2 = A4_2
  L16_2 = A5_2
  L17_2 = A6_2
  L18_2 = 70
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L11_2 = DrawPoly
  L12_2 = L9_2
  L13_2 = L8_2
  L14_2 = L7_2
  L15_2 = A4_2
  L16_2 = A5_2
  L17_2 = A6_2
  L18_2 = 70
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
end
_drawWall = L4_1
L4_1 = Citizen
L4_1 = L4_1.CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  while true do
    L0_2 = waitingForLoadAfterRestart
    if not L0_2 then
      break
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 200
    L0_2(L1_2)
  end
  while true do
    L0_2 = Config
    L0_2 = L0_2.DebugPolyZone
    if not L0_2 then
      break
    end
    L0_2 = pairs
    L1_2 = Properties
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = L5_2.metadata
      if L6_2 then
        L6_2 = L5_2.metadata
        L6_2 = L6_2.zone
        if L6_2 then
          L6_2 = L5_2.metadata
          L6_2 = L6_2.zone
          L6_2 = L6_2.points
          if L6_2 then
            L6_2 = 1
            L7_2 = L5_2.metadata
            L7_2 = L7_2.zone
            L7_2 = L7_2.points
            L7_2 = #L7_2
            L8_2 = 1
            for L9_2 = L6_2, L7_2, L8_2 do
              L10_2 = L5_2.metadata
              L10_2 = L10_2.zone
              L10_2 = L10_2.points
              L10_2 = #L10_2
              if L9_2 < L10_2 then
                L10_2 = _drawWall
                L11_2 = L5_2.metadata
                L11_2 = L11_2.zone
                L11_2 = L11_2.points
                L11_2 = L11_2[L9_2]
                L12_2 = L5_2.metadata
                L12_2 = L12_2.zone
                L12_2 = L12_2.points
                L13_2 = L9_2 + 1
                L12_2 = L12_2[L13_2]
                L13_2 = L5_2.metadata
                L13_2 = L13_2.zone
                L13_2 = L13_2.minZ
                L14_2 = L5_2.metadata
                L14_2 = L14_2.zone
                L14_2 = L14_2.maxZ
                L15_2 = 76
                L16_2 = 17
                L17_2 = 166
                L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
              end
              L10_2 = L5_2.metadata
              L10_2 = L10_2.zone
              L10_2 = L10_2.points
              L10_2 = #L10_2
              if L9_2 == L10_2 then
                L10_2 = _drawWall
                L11_2 = L5_2.metadata
                L11_2 = L11_2.zone
                L11_2 = L11_2.points
                L11_2 = L11_2[L9_2]
                L12_2 = L5_2.metadata
                L12_2 = L12_2.zone
                L12_2 = L12_2.points
                L12_2 = L12_2[1]
                L13_2 = L5_2.metadata
                L13_2 = L13_2.zone
                L13_2 = L13_2.minZ
                L14_2 = L5_2.metadata
                L14_2 = L14_2.zone
                L14_2 = L14_2.maxZ
                L15_2 = 76
                L16_2 = 17
                L17_2 = 166
                L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
              end
            end
            L6_2 = L5_2.metadata
            L6_2 = L6_2.interiorZone
            if L6_2 then
              L6_2 = 1
              L7_2 = L5_2.metadata
              L7_2 = L7_2.interiorZone
              L7_2 = L7_2.points
              L7_2 = #L7_2
              L8_2 = 1
              for L9_2 = L6_2, L7_2, L8_2 do
                L10_2 = L5_2.metadata
                L10_2 = L10_2.interiorZone
                L10_2 = L10_2.points
                L10_2 = #L10_2
                if L9_2 < L10_2 then
                  L10_2 = _drawWall
                  L11_2 = L5_2.metadata
                  L11_2 = L11_2.interiorZone
                  L11_2 = L11_2.points
                  L11_2 = L11_2[L9_2]
                  L12_2 = L5_2.metadata
                  L12_2 = L12_2.interiorZone
                  L12_2 = L12_2.points
                  L13_2 = L9_2 + 1
                  L12_2 = L12_2[L13_2]
                  L13_2 = L5_2.metadata
                  L13_2 = L13_2.interiorZone
                  L13_2 = L13_2.minZ
                  L14_2 = L5_2.metadata
                  L14_2 = L14_2.interiorZone
                  L14_2 = L14_2.maxZ
                  L15_2 = 114
                  L16_2 = 49
                  L17_2 = 212
                  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
                end
                L10_2 = L5_2.metadata
                L10_2 = L10_2.interiorZone
                L10_2 = L10_2.points
                L10_2 = #L10_2
                if L9_2 == L10_2 then
                  L10_2 = _drawWall
                  L11_2 = L5_2.metadata
                  L11_2 = L11_2.interiorZone
                  L11_2 = L11_2.points
                  L11_2 = L11_2[L9_2]
                  L12_2 = L5_2.metadata
                  L12_2 = L12_2.interiorZone
                  L12_2 = L12_2.points
                  L12_2 = L12_2[1]
                  L13_2 = L5_2.metadata
                  L13_2 = L13_2.interiorZone
                  L13_2 = L13_2.minZ
                  L14_2 = L5_2.metadata
                  L14_2 = L14_2.interiorZone
                  L14_2 = L14_2.maxZ
                  L15_2 = 114
                  L16_2 = 49
                  L17_2 = 212
                  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
                end
              end
            end
          end
        end
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1
    L0_2(L1_2)
  end
end
L4_1(L5_1)
L4_1 = Citizen
L4_1 = L4_1.CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  while true do
    L0_2 = waitingForLoadAfterRestart
    if not L0_2 then
      break
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 200
    L0_2(L1_2)
  end
  L0_2 = Config
  L0_2 = L0_2.DebugRegionsZone
  if L0_2 then
    L0_2 = RegisterCommand
    L1_2 = "getRegion"
    function L2_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      L0_3 = GetEntityCoords
      L1_3 = PlayerPedId
      L1_3, L2_3, L3_3, L4_3, L5_3 = L1_3()
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
      L1_3 = library
      L1_3 = L1_3.GetCurrentRegion
      L2_3 = L0_3.xyz
      L1_3 = L1_3(L2_3)
      if not L1_3 then
        L1_3 = "None"
      end
      L2_3 = print
      L3_3 = "Region: ^3%s"
      L4_3 = L3_3
      L3_3 = L3_3.format
      L5_3 = L1_3
      L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
      L2_3(L3_3, L4_3, L5_3)
    end
    L0_2(L1_2, L2_2)
  end
  while true do
    L0_2 = Config
    L0_2 = L0_2.DebugRegionsZone
    if not L0_2 then
      break
    end
    L0_2 = pairs
    L1_2 = Config
    L1_2 = L1_2.Regions
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = L5_2.zone
      if L6_2 then
        L6_2 = 1
        L7_2 = L5_2.zone
        L7_2 = #L7_2
        L8_2 = 1
        for L9_2 = L6_2, L7_2, L8_2 do
          L10_2 = L5_2.zone
          L10_2 = #L10_2
          if L9_2 < L10_2 then
            L10_2 = _drawWall
            L11_2 = L5_2.zone
            L11_2 = L11_2[L9_2]
            L12_2 = L5_2.zone
            L13_2 = L9_2 + 1
            L12_2 = L12_2[L13_2]
            L13_2 = -20.0
            L14_2 = 350.0
            L15_2 = L5_2.debugColor
            if L15_2 then
              L15_2 = L15_2.x
            end
            if not L15_2 then
              L15_2 = 76
            end
            L16_2 = L5_2.debugColor
            if L16_2 then
              L16_2 = L16_2.y
            end
            if not L16_2 then
              L16_2 = 17
            end
            L17_2 = L5_2.debugColor
            if L17_2 then
              L17_2 = L17_2.z
            end
            if not L17_2 then
              L17_2 = 166
            end
            L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
          end
          L10_2 = L5_2.zone
          L10_2 = #L10_2
          if L9_2 == L10_2 then
            L10_2 = _drawWall
            L11_2 = L5_2.zone
            L11_2 = L11_2[L9_2]
            L12_2 = L5_2.zone
            L12_2 = L12_2[1]
            L13_2 = -20.0
            L14_2 = 350.0
            L15_2 = L5_2.debugColor
            if L15_2 then
              L15_2 = L15_2.x
            end
            if not L15_2 then
              L15_2 = 76
            end
            L16_2 = L5_2.debugColor
            if L16_2 then
              L16_2 = L16_2.y
            end
            if not L16_2 then
              L16_2 = 17
            end
            L17_2 = L5_2.debugColor
            if L17_2 then
              L17_2 = L17_2.z
            end
            if not L17_2 then
              L17_2 = 166
            end
            L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
          end
        end
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 1
    L0_2(L1_2)
  end
end
L4_1(L5_1)
L4_1 = Citizen
L4_1 = L4_1.CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  while true do
    L0_2 = waitingForLoadAfterRestart
    if not L0_2 then
      break
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 200
    L0_2(L1_2)
  end
  L0_2 = true
  while true do
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = GetEntityCoords
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = vec2
    L4_2 = L2_2.x
    L5_2 = L2_2.y
    L3_2 = L3_2(L4_2, L5_2)
    L0_2 = true
    L4_2 = pairs
    L5_2 = Properties
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L9_2.metadata
      if L10_2 then
        L10_2 = L9_2.metadata
        L10_2 = L10_2.zone
        if L10_2 then
          L10_2 = L9_2.metadata
          L10_2 = L10_2.zone
          L10_2 = L10_2.points
          if L10_2 then
            L10_2 = isPointInPolygon
            L11_2 = L3_2
            L12_2 = L9_2.metadata
            L12_2 = L12_2.zone
            L12_2 = L12_2.points
            L10_2 = L10_2(L11_2, L12_2)
            if L10_2 then
              L10_2 = L2_2.z
              L11_2 = L9_2.metadata
              L11_2 = L11_2.zone
              L11_2 = L11_2.minZ
              if L10_2 >= L11_2 then
                L10_2 = L2_2.z
                L11_2 = L9_2.metadata
                L11_2 = L11_2.zone
                L11_2 = L11_2.maxZ
                if L10_2 <= L11_2 then
                  L10_2 = L0_1
                  if not L10_2 then
                    L10_2 = true
                    L0_1 = L10_2
                    L10_2 = EnterZone
                    L11_2 = true
                    L12_2 = L8_2
                    L10_2(L11_2, L12_2)
                    L10_2 = Citizen
                    L10_2 = L10_2.Wait
                    L11_2 = 150
                    L10_2(L11_2)
                  end
                  L10_2 = L9_2.metadata
                  L10_2 = L10_2.interiorZone
                  if L10_2 then
                    L10_2 = isPointInPolygon
                    L11_2 = L3_2
                    L12_2 = L9_2.metadata
                    L12_2 = L12_2.interiorZone
                    L12_2 = L12_2.points
                    L10_2 = L10_2(L11_2, L12_2)
                    if L10_2 then
                      L10_2 = L2_2.z
                      L11_2 = L9_2.metadata
                      L11_2 = L11_2.interiorZone
                      L11_2 = L11_2.minZ
                      if L10_2 >= L11_2 then
                        L10_2 = L2_2.z
                        L11_2 = L9_2.metadata
                        L11_2 = L11_2.interiorZone
                        L11_2 = L11_2.maxZ
                        if L10_2 <= L11_2 then
                          L10_2 = L1_1
                          if not L10_2 then
                            L10_2 = true
                            L1_1 = L10_2
                            L10_2 = Property
                            L11_2 = L10_2
                            L10_2 = L10_2.EnterPropertyInterior
                            L12_2 = L9_2
                            L10_2(L11_2, L12_2)
                          end
                        end
                      end
                    end
                  end
                  L0_2 = false
                  break
                end
              end
            end
          end
        end
      end
    end
    L4_2 = L2_1
    if L4_2 then
      L4_2 = L1_1
      if not L4_2 then
        L4_2 = L3_1.type
        if "motel" == L4_2 then
          L4_2 = pairs
          L5_2 = Properties
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
            L10_2 = L9_2.type
            if "mlo" == L10_2 then
              L10_2 = L9_2.object_id
              L11_2 = tonumber
              L12_2 = L2_1
              L11_2 = L11_2(L12_2)
              if L10_2 == L11_2 then
                L10_2 = L9_2.metadata
                L10_2 = L10_2.interiorZone
                if L10_2 then
                  L10_2 = isPointInPolygon
                  L11_2 = L3_2
                  L12_2 = L9_2.metadata
                  L12_2 = L12_2.interiorZone
                  L12_2 = L12_2.points
                  L10_2 = L10_2(L11_2, L12_2)
                  if L10_2 then
                    L10_2 = L2_2.z
                    L11_2 = L9_2.metadata
                    L11_2 = L11_2.interiorZone
                    L11_2 = L11_2.minZ
                    if L10_2 >= L11_2 then
                      L10_2 = L2_2.z
                      L11_2 = L9_2.metadata
                      L11_2 = L11_2.interiorZone
                      L11_2 = L11_2.maxZ
                      if L10_2 <= L11_2 then
                        L10_2 = true
                        L1_1 = L10_2
                        L10_2 = Property
                        L11_2 = L10_2
                        L10_2 = L10_2.EnterPropertyInterior
                        L12_2 = L9_2
                        L13_2 = L9_2.id
                        L10_2(L11_2, L12_2, L13_2)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L4_2 = L0_1
    if L4_2 then
      L4_2 = L2_1
      if L4_2 then
        L4_2 = L3_1
        if L4_2 then
          L4_2 = L1_1
          if L4_2 then
            L4_2 = CurrentPropertyData
            if L4_2 then
              L4_2 = CurrentPropertyData
              L4_2 = L4_2.metadata
              L4_2 = L4_2.interiorZone
              if L4_2 then
                L4_2 = isPointInPolygon
                L5_2 = L3_2
                L6_2 = CurrentPropertyData
                L6_2 = L6_2.metadata
                L6_2 = L6_2.interiorZone
                L6_2 = L6_2.points
                L4_2 = L4_2(L5_2, L6_2)
                if L4_2 then
                  L4_2 = L2_2.z
                  L5_2 = CurrentPropertyData
                  L5_2 = L5_2.metadata
                  L5_2 = L5_2.interiorZone
                  L5_2 = L5_2.minZ
                  if not (L4_2 < L5_2) then
                    L4_2 = L2_2.z
                    L5_2 = CurrentPropertyData
                    L5_2 = L5_2.metadata
                    L5_2 = L5_2.interiorZone
                    L5_2 = L5_2.maxZ
                    if not (L4_2 > L5_2) then
                      goto lbl_211
                    end
                  end
                end
                L4_2 = false
                L1_1 = L4_2
                L4_2 = Property
                L5_2 = L4_2
                L4_2 = L4_2.ExitPropertyInterior
                L4_2(L5_2)
              end
            end
          end
          ::lbl_211::
          L4_2 = isPointInPolygon
          L5_2 = L3_2
          L6_2 = L3_1.metadata
          L6_2 = L6_2.zone
          L6_2 = L6_2.points
          L4_2 = L4_2(L5_2, L6_2)
          if L4_2 then
            L4_2 = L2_2.z
            L5_2 = L3_1.metadata
            L5_2 = L5_2.zone
            L5_2 = L5_2.minZ
            if not (L4_2 < L5_2) then
              L4_2 = L2_2.z
              L5_2 = L3_1.metadata
              L5_2 = L5_2.zone
              L5_2 = L5_2.maxZ
              if not (L4_2 > L5_2) then
                goto lbl_243
              end
            end
          end
          L4_2 = false
          L0_1 = L4_2
          L4_2 = false
          L1_1 = L4_2
          L4_2 = ExitZone
          L5_2 = true
          L6_2 = L2_1
          L4_2(L5_2, L6_2)
          L4_2 = Citizen
          L4_2 = L4_2.Wait
          L5_2 = 150
          L4_2(L5_2)
        end
      end
    end
    ::lbl_243::
    L4_2 = Citizen
    L4_2 = L4_2.Wait
    if L0_2 then
      L5_2 = 800
      if L5_2 then
        goto lbl_251
      end
    end
    L5_2 = 100
    ::lbl_251::
    L4_2(L5_2)
  end
end
L4_1(L5_1)
