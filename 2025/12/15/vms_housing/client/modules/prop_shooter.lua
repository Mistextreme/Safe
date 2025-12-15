local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = {}
L1_1 = "prop_big_cin_screen"
L2_1 = 1
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = vector3
L10_1 = 500.0
L11_1 = 500.0
L12_1 = 350.0
L9_1 = L9_1(L10_1, L11_1, L12_1)
L10_1 = false
L11_1 = 3000
L12_1 = false
L13_1 = {}
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = vector3
  L3_2 = math
  L3_2 = L3_2.abs
  L4_2 = A1_2.x
  L5_2 = A0_2.x
  L4_2 = L4_2 - L5_2
  L3_2 = L3_2(L4_2)
  L4_2 = math
  L4_2 = L4_2.abs
  L5_2 = A1_2.y
  L6_2 = A0_2.y
  L5_2 = L5_2 - L6_2
  L4_2 = L4_2(L5_2)
  L5_2 = math
  L5_2 = L5_2.abs
  L6_2 = A1_2.z
  L7_2 = A0_2.z
  L6_2 = L6_2 - L7_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L3_2 = L2_2.x
  L4_2 = L2_2.y
  L3_2 = L3_2 * L4_2
  L4_2 = L2_2.z
  L3_2 = L3_2 * L4_2
  L4_2 = 0.3
  L5_2 = 1.0
  if L3_2 <= L4_2 then
    L6_2 = 1
    return L6_2
  elseif L3_2 <= L5_2 then
    L6_2 = 2
    return L6_2
  else
    L6_2 = 3
    return L6_2
  end
end
function L15_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L7_2 = SetTextFont
  L8_2 = 4
  L7_2(L8_2)
  L7_2 = SetTextProportional
  L8_2 = 1
  L7_2(L8_2)
  L7_2 = SetTextScale
  L8_2 = 0.0
  L9_2 = A3_2
  L7_2(L8_2, L9_2)
  L7_2 = SetTextColour
  L8_2 = A4_2
  L9_2 = A5_2
  L10_2 = A6_2
  L11_2 = 255
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2 = SetTextDropshadow
  L8_2 = 0
  L9_2 = 0
  L10_2 = 0
  L11_2 = 0
  L12_2 = 205
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  L7_2 = SetTextEdge
  L8_2 = 1
  L9_2 = 0
  L10_2 = 0
  L11_2 = 0
  L12_2 = 150
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  L7_2 = SetTextDropshadow
  L7_2()
  L7_2 = SetTextOutline
  L7_2()
  L7_2 = SetTextCentre
  L8_2 = 1
  L7_2(L8_2)
  L7_2 = BeginTextCommandDisplayText
  L8_2 = "STRING"
  L7_2(L8_2)
  L7_2 = AddTextComponentSubstringPlayerName
  L8_2 = A0_2
  L7_2(L8_2)
  L7_2 = EndTextCommandDisplayText
  L8_2 = A1_2
  L9_2 = A2_2
  L7_2(L8_2, L9_2)
end
drawText2D = L15_1
function L15_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = true
  L10_1 = L0_2
  L0_2 = 3000
  L11_1 = L0_2
  L0_2 = false
  L12_1 = L0_2
  while true do
    L0_2 = L10_1
    if not L0_2 then
      break
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 0
    L0_2(L1_2)
    L0_2 = L12_1
    if not L0_2 then
      L0_2 = L11_1
      L0_2 = L0_2 - 10
      L11_1 = L0_2
      L0_2 = drawText2D
      L1_2 = L11_1
      L2_2 = "ms"
      L1_2 = L1_2 .. L2_2
      L2_2 = 0.5
      L3_2 = 0.5
      L4_2 = 0.8
      L5_2 = 200
      L6_2 = 0
      L7_2 = 0
      L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
      L0_2 = drawText2D
      L1_2 = "Press SPACE to hold timer"
      L2_2 = 0.5
      L3_2 = 0.54
      L4_2 = 0.3
      L5_2 = 210
      L6_2 = 210
      L7_2 = 210
      L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
    else
      L0_2 = drawText2D
      L1_2 = L11_1
      L2_2 = "ms"
      L1_2 = L1_2 .. L2_2
      L2_2 = 0.5
      L3_2 = 0.5
      L4_2 = 0.8
      L5_2 = 200
      L6_2 = 200
      L7_2 = 0
      L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
      L0_2 = drawText2D
      L1_2 = "Press SPACE to resume timer"
      L2_2 = 0.5
      L3_2 = 0.54
      L4_2 = 0.3
      L5_2 = 210
      L6_2 = 210
      L7_2 = 210
      L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
    end
    L0_2 = drawText2D
    L1_2 = "Change FOV using SCROLL"
    L2_2 = 0.5
    L3_2 = 0.7
    L4_2 = 0.4
    L5_2 = 240
    L6_2 = 240
    L7_2 = 240
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
    L0_2 = drawText2D
    L1_2 = "Change HEIGHT using LMB/RMB"
    L2_2 = 0.5
    L3_2 = 0.73
    L4_2 = 0.4
    L5_2 = 240
    L6_2 = 240
    L7_2 = 240
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
    L0_2 = drawText2D
    L1_2 = "Change ROTATION using ARROWS"
    L2_2 = 0.5
    L3_2 = 0.76
    L4_2 = 0.4
    L5_2 = 240
    L6_2 = 240
    L7_2 = 240
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
    L0_2 = IsControlJustPressed
    L1_2 = 0
    L2_2 = 22
    L0_2 = L0_2(L1_2, L2_2)
    if L0_2 then
      L0_2 = L12_1
      L0_2 = not L0_2
      L12_1 = L0_2
    end
    L0_2 = IsControlPressed
    L1_2 = 0
    L2_2 = 24
    L0_2 = L0_2(L1_2, L2_2)
    if L0_2 then
      L0_2 = GetEntityCoords
      L1_2 = L3_1
      L0_2 = L0_2(L1_2)
      L1_2 = SetEntityCoords
      L2_2 = L3_1
      L3_2 = L0_2.x
      L4_2 = L0_2.y
      L5_2 = L0_2.z
      L5_2 = L5_2 + 0.01
      L1_2(L2_2, L3_2, L4_2, L5_2)
    end
    L0_2 = IsControlPressed
    L1_2 = 0
    L2_2 = 70
    L0_2 = L0_2(L1_2, L2_2)
    if L0_2 then
      L0_2 = GetEntityCoords
      L1_2 = L3_1
      L0_2 = L0_2(L1_2)
      L1_2 = SetEntityCoords
      L2_2 = L3_1
      L3_2 = L0_2.x
      L4_2 = L0_2.y
      L5_2 = L0_2.z
      L5_2 = L5_2 - 0.01
      L1_2(L2_2, L3_2, L4_2, L5_2)
    end
    L0_2 = IsControlPressed
    L1_2 = 0
    L2_2 = 174
    L0_2 = L0_2(L1_2, L2_2)
    if L0_2 then
      L0_2 = GetEntityHeading
      L1_2 = L3_1
      L0_2 = L0_2(L1_2)
      L0_2 = L0_2 + 1.0
      L0_2 = L0_2 % 360
      L1_2 = SetEntityHeading
      L2_2 = L3_1
      L3_2 = L0_2
      L1_2(L2_2, L3_2)
    end
    L0_2 = IsControlPressed
    L1_2 = 0
    L2_2 = 175
    L0_2 = L0_2(L1_2, L2_2)
    if L0_2 then
      L0_2 = GetEntityHeading
      L1_2 = L3_1
      L0_2 = L0_2(L1_2)
      L0_2 = L0_2 - 1.0
      L0_2 = L0_2 % 360
      if L0_2 < 0 then
        L0_2 = L0_2 + 360
      end
      L1_2 = SetEntityHeading
      L2_2 = L3_1
      L3_2 = L0_2
      L1_2(L2_2, L3_2)
    end
    L0_2 = IsControlPressed
    L1_2 = 0
    L2_2 = 180
    L0_2 = L0_2(L1_2, L2_2)
    if L0_2 then
      L0_2 = SetCamFov
      L1_2 = L7_1
      L2_2 = GetCamFov
      L3_2 = L7_1
      L2_2 = L2_2(L3_2)
      L2_2 = L2_2 + 2.0
      L0_2(L1_2, L2_2)
    end
    L0_2 = IsControlPressed
    L1_2 = 0
    L2_2 = 181
    L0_2 = L0_2(L1_2, L2_2)
    if L0_2 then
      L0_2 = SetCamFov
      L1_2 = L7_1
      L2_2 = GetCamFov
      L3_2 = L7_1
      L2_2 = L2_2(L3_2)
      L2_2 = L2_2 - 2.0
      L0_2(L1_2, L2_2)
    end
    L0_2 = L11_1
    if L0_2 <= 0 then
      L0_2 = false
      L10_1 = L0_2
    end
  end
  L0_2 = Citizen
  L0_2 = L0_2.Wait
  L1_2 = 1250
  L0_2(L1_2)
end
startCountdown = L15_1
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = OBJECTS_PHOTOS_TOOL_WEBHOOK
  if not L1_2 then
    L1_2 = library
    L1_2 = L1_2.Debug
    L2_2 = "Nie mo\197\188esz korzysta\196\135 z tej opcji. Nie ma skonfigurowanego webhooka."
    L3_2 = "warn"
    return L1_2(L2_2, L3_2)
  end
  L0_1 = A0_2
  L1_2 = {}
  L13_1 = L1_2
  L1_2 = 1
  L2_1 = L1_2
  L1_2 = GetEntityCoords
  L2_2 = PlayerPedId
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L2_2()
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L8_1 = L1_2
  L1_2 = Citizen
  L1_2 = L1_2.Wait
  L2_2 = 100
  L1_2(L2_2)
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = SetEntityCoords
  L3_2 = L1_2
  L4_2 = L9_1.x
  L5_2 = L9_1.y
  L6_2 = L9_1.z
  L6_2 = L6_2 + 15.0
  L7_2 = false
  L8_2 = false
  L9_2 = false
  L10_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L2_2 = FreezeEntityPosition
  L3_2 = L1_2
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = library
  L2_2 = L2_2.SpawnProp
  L3_2 = GetHashKey
  L4_2 = L1_1
  L3_2 = L3_2(L4_2)
  L4_2 = vector3
  L5_2 = L9_1.x
  L6_2 = L9_1.y
  L7_2 = L9_1.z
  L7_2 = L7_2 + 15.0
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = false
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L4_1 = L2_2
  L2_2 = FreezeEntityPosition
  L3_2 = L4_1
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = library
  L2_2 = L2_2.SpawnProp
  L3_2 = GetHashKey
  L4_2 = L1_1
  L3_2 = L3_2(L4_2)
  L4_2 = vector3
  L5_2 = L9_1.x
  L6_2 = L9_1.y
  L7_2 = L9_1.z
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = false
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L5_1 = L2_2
  L2_2 = FreezeEntityPosition
  L3_2 = L5_1
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = library
  L2_2 = L2_2.SpawnProp
  L3_2 = GetHashKey
  L4_2 = L1_1
  L3_2 = L3_2(L4_2)
  L4_2 = vector3
  L5_2 = L9_1.x
  L6_2 = L9_1.y
  L7_2 = L9_1.z
  L7_2 = L7_2 - 15.0
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = false
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L6_1 = L2_2
  L2_2 = FreezeEntityPosition
  L3_2 = L6_1
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = CL
  L2_2 = L2_2.Hud
  L2_2 = L2_2.Disable
  L2_2()
  L2_2 = Wait
  L3_2 = 1000
  L2_2(L3_2)
  while true do
    L2_2 = L2_1
    if 0 == L2_2 then
      break
    end
    L2_2 = spawnNextProp
    L2_2()
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = 1000
    L2_2(L3_2)
  end
  L2_2 = Citizen
  L2_2 = L2_2.Wait
  L3_2 = 750
  L2_2(L3_2)
  L2_2 = L3_1
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L3_1
    L2_2(L3_2)
  end
  L2_2 = L4_1
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L4_1
    L2_2(L3_2)
  end
  L2_2 = L5_1
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L5_1
    L2_2(L3_2)
  end
  L2_2 = L6_1
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L6_1
    L2_2(L3_2)
  end
  L2_2 = CL
  L2_2 = L2_2.Hud
  L2_2 = L2_2.Enable
  L2_2()
  L2_2 = FreezeEntityPosition
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = L8_1
  if L2_2 then
    L2_2 = L8_1.x
    if L2_2 then
      L2_2 = SetEntityCoords
      L3_2 = PlayerPedId
      L3_2 = L3_2()
      L4_2 = L8_1.x
      L5_2 = L8_1.y
      L6_2 = L8_1.z
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
  end
  L2_2 = DestroyCam
  L3_2 = L7_1
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = SetCamActive
  L3_2 = L7_1
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = RenderScriptCams
  L3_2 = false
  L4_2 = true
  L5_2 = 500
  L6_2 = true
  L7_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L2_2 = TriggerServerEvent
  L3_2 = "vms_housing:sv:addFurniture"
  L4_2 = L13_1
  L2_2(L3_2, L4_2)
end
RegisterFurniture = L15_1
function L15_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = L3_1
    L0_2(L1_2)
  end
  L1_2 = L2_1
  L0_2 = L0_1
  L0_2 = L0_2[L1_2]
  L1_2 = library
  L1_2 = L1_2.SpawnProp
  L2_2 = GetHashKey
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L3_2 = vector3
  L4_2 = L9_1.x
  L5_2 = L9_1.y
  L6_2 = L9_1.z
  L6_2 = L6_2 + 10.0
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = false
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L3_1 = L1_2
  L1_2 = DoesEntityExist
  L2_2 = L3_1
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = FreezeEntityPosition
    L2_2 = L3_1
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = SetEntityHeading
    L2_2 = L3_1
    L3_2 = 25.0
    L1_2(L2_2, L3_2)
    L1_2 = setupCamera
    L2_2 = L3_1
    L1_2(L2_2)
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 500
    L1_2(L2_2)
    L1_2 = startCountdown
    L1_2()
    L1_2 = takeScreenshot
    L2_2 = L0_2
    function L3_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
      L1_3 = DoesEntityExist
      L2_3 = L3_1
      L1_3 = L1_3(L2_3)
      if L1_3 then
        L2_3 = L0_2
        L1_3 = L13_1
        L3_3 = {}
        L4_3 = L14_1
        L5_3 = GetModelDimensions
        L6_3 = L0_2
        L5_3, L6_3 = L5_3(L6_3)
        L4_3 = L4_3(L5_3, L6_3)
        L3_3.deliverySize = L4_3
        L1_3[L2_3] = L3_3
      else
        L1_3 = print
        L2_3 = "Entity \""
        L3_3 = L0_2
        L4_3 = "\" does not exist"
        L2_3 = L2_3 .. L3_3 .. L4_3
        L1_3(L2_3)
      end
      L1_3 = L2_1
      L1_3 = L1_3 + 1
      L2_1 = L1_3
      L1_3 = L2_1
      L2_3 = L0_1
      L2_3 = #L2_3
      if L1_3 > L2_3 then
        L1_3 = 0
        L2_1 = L1_3
      end
    end
    L1_2(L2_2, L3_2)
  else
    L1_2 = print
    L2_2 = "Entity \""
    L3_2 = L0_2
    L4_2 = "\" does not exist"
    L2_2 = L2_2 .. L3_2 .. L4_2
    L1_2(L2_2)
    L1_2 = L2_1
    L1_2 = L1_2 + 1
    L2_1 = L1_2
    L1_2 = L2_1
    L2_2 = L0_1
    L2_2 = #L2_2
    if L1_2 > L2_2 then
      L1_2 = 0
      L2_1 = L1_2
    end
  end
end
spawnNextProp = L15_1
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = L7_1
  if L1_2 then
    L1_2 = DestroyCam
    L2_2 = L7_1
    L3_2 = false
    L1_2(L2_2, L3_2)
    L1_2 = SetCamActive
    L2_2 = L7_1
    L3_2 = false
    L1_2(L2_2, L3_2)
  end
  L1_2 = CreateCam
  L2_2 = "DEFAULT_SCRIPTED_CAMERA"
  L3_2 = true
  L1_2 = L1_2(L2_2, L3_2)
  L7_1 = L1_2
  L1_2 = GetEntityCoords
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetModelDimensions
  L3_2 = GetEntityModel
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L3_2(L4_2)
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = L3_2 - L2_2
  L5_2 = L4_2.x
  L6_2 = L4_2.z
  L7_2 = L4_2.y
  L8_2 = math
  L8_2 = L8_2.max
  L9_2 = L5_2
  L10_2 = L7_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = math
  L9_2 = L9_2.max
  L10_2 = 2.5
  L11_2 = L8_2 * 1.4
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = L1_2.x
  L11_2 = L1_2.y
  L11_2 = L11_2 - L9_2
  L12_2 = L1_2.z
  L13_2 = L6_2 * 1.2
  L12_2 = L12_2 + L13_2
  L13_2 = SetCamCoord
  L14_2 = L7_1
  L15_2 = L10_2
  L16_2 = L11_2
  L17_2 = L12_2
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = PointCamAtCoord
  L14_2 = L7_1
  L15_2 = L1_2.x
  L16_2 = L1_2.y
  L17_2 = L1_2.z
  L18_2 = L6_2 * 0.5
  L17_2 = L17_2 + L18_2
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = math
  L13_2 = L13_2.max
  L14_2 = 40.0
  L15_2 = math
  L15_2 = L15_2.min
  L16_2 = 70.0
  L17_2 = L8_2 * 3.0
  L18_2 = 65.0
  L17_2 = L18_2 - L17_2
  L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2(L16_2, L17_2)
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L14_2 = SetCamFov
  L15_2 = L7_1
  L16_2 = L13_2
  L14_2(L15_2, L16_2)
  L14_2 = SetCamActive
  L15_2 = L7_1
  L16_2 = true
  L14_2(L15_2, L16_2)
  L14_2 = RenderScriptCams
  L15_2 = true
  L16_2 = true
  L17_2 = 500
  L18_2 = true
  L19_2 = true
  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
end
setupCamera = L15_1
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = exports
  L2_2 = L2_2["screenshot-basic"]
  L3_2 = L2_2
  L2_2 = L2_2.requestScreenshot
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = SendNUIMessage
    L2_3 = {}
    L2_3.action = "ProcessImage"
    L3_3 = A0_2
    L2_3.fileName = L3_3
    L2_3.image = A0_3
    L1_3(L2_3)
    L1_3 = A1_2
    L2_3 = true
    L1_3(L2_3)
  end
  L2_2(L3_2, L4_2)
end
takeScreenshot = L15_1
