local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "elecuts_admin:teleportPlayer"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = source
  if nil == L1_2 or 0 == L1_2 then
    return
  end
  L2_2 = tonumber
  L3_2 = A0_2.x
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A0_2.y
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = A0_2.z
  L4_2 = L4_2(L5_2)
  L5_2 = DoScreenFadeOut
  L6_2 = 500
  L5_2(L6_2)
  L5_2 = SetEntityCoords
  L6_2 = PlayerPedId
  L6_2 = L6_2()
  L7_2 = L2_2
  L8_2 = L3_2
  L9_2 = L4_2 + 0.5
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = FreezeEntityPosition
  L6_2 = PlayerPedId
  L6_2 = L6_2()
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = Wait
  L6_2 = 1000
  L5_2(L6_2)
  L5_2 = GetGroundZFor_3dCoord
  L6_2 = L2_2
  L7_2 = L3_2
  L8_2 = 800.0
  L9_2 = false
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L6_2 = L4_2
  end
  L7_2 = SetEntityCoords
  L8_2 = PlayerPedId
  L8_2 = L8_2()
  L9_2 = L2_2
  L10_2 = L3_2
  L11_2 = L6_2 + 0.5
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2 = FreezeEntityPosition
  L8_2 = PlayerPedId
  L8_2 = L8_2()
  L9_2 = false
  L7_2(L8_2, L9_2)
  L7_2 = DoScreenFadeIn
  L8_2 = 500
  L7_2(L8_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "elecuts_admin:killPlayer"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = source
  if nil == L0_2 or 0 == L0_2 then
    return
  end
  L1_2 = SetEntityHealth
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = 0
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
