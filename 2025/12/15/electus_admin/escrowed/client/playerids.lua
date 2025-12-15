local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = false
L1_1 = {}
L2_1 = RegisterFontFile
L3_1 = "lato"
L2_1 = L2_1(L3_1)
L3_1 = RegisterFontId
L4_1 = "lato"
L3_1 = L3_1(L4_1)
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 then
    return
  end
  L2_2 = GetScreenCoordFromWorldCoord
  L3_2 = A0_2.x
  L4_2 = A0_2.y
  L5_2 = A0_2.z
  L5_2 = L5_2 + 1.0
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 and L3_2 and L4_2 then
    L5_2 = SetTextScale
    L6_2 = 0.35
    L7_2 = 0.35
    L5_2(L6_2, L7_2)
    L5_2 = SetTextFont
    L6_2 = 4
    L5_2(L6_2)
    L5_2 = SetTextProportional
    L6_2 = true
    L5_2(L6_2)
    L5_2 = SetTextColour
    L6_2 = 255
    L7_2 = 255
    L8_2 = 255
    L9_2 = 215
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = SetTextDropshadow
    L6_2 = 0
    L7_2 = 0
    L8_2 = 0
    L9_2 = 0
    L10_2 = 255
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    L5_2 = SetTextEdge
    L6_2 = 1
    L7_2 = 0
    L8_2 = 0
    L9_2 = 0
    L10_2 = 255
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    L5_2 = SetTextDropShadow
    L5_2()
    L5_2 = SetTextOutline
    L5_2()
    L5_2 = SetTextEntry
    L6_2 = "STRING"
    L5_2(L6_2)
    L5_2 = SetTextCentre
    L6_2 = true
    L5_2(L6_2)
    L5_2 = AddTextComponentString
    L6_2 = "# 1"
    L5_2(L6_2)
    L5_2 = EndTextCommandDisplayText
    L6_2 = L3_2
    L7_2 = L4_2
    L5_2(L6_2, L7_2)
  end
end
Draw3DText = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  while true do
    L0_2 = L0_1
    if not L0_2 then
      break
    end
    L0_2 = GetActivePlayers
    L0_2 = L0_2()
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = GetEntityCoords
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = {}
    L1_1 = L3_2
    L3_2 = ipairs
    L4_2 = L0_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = GetPlayerPed
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      L10_2 = GetEntityCoords
      L11_2 = L9_2
      L10_2 = L10_2(L11_2)
      L11_2 = L2_2 - L10_2
      L11_2 = #L11_2
      if L11_2 < 50.0 then
        L12_2 = L1_1
        L12_2 = #L12_2
        L13_2 = L12_2 + 1
        L12_2 = L1_1
        L14_2 = {}
        L14_2.player = L8_2
        L12_2[L13_2] = L14_2
      end
    end
    L3_2 = Wait
    L4_2 = 2000
    L3_2(L4_2)
  end
end
HandleClosestPlayers = L4_1
function L4_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  while true do
    L0_2 = L0_1
    if not L0_2 then
      break
    end
    L0_2 = ipairs
    L1_2 = L1_1
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = GetPlayerPed
      L7_2 = L5_2.player
      L6_2 = L6_2(L7_2)
      L7_2 = GetEntityCoords
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      L8_2 = GetScreenCoordFromWorldCoord
      L9_2 = L7_2.x
      L10_2 = L7_2.y
      L11_2 = L7_2.z
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L9_2 = Draw3DText
      L10_2 = L7_2
      L11_2 = L5_2.player
      L9_2(L10_2, L11_2)
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
end
DrawIdOnClosestPlayers = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = not L0_2
  L0_1 = L0_2
  L0_2 = Notify
  L1_2 = L0_1
  if L1_2 then
    L1_2 = "Player IDs enabled"
    if L1_2 then
      goto lbl_12
    end
  end
  L1_2 = "Player IDs disabled"
  ::lbl_12::
  L0_2(L1_2)
  L0_2 = L0_1
  if L0_2 then
    L0_2 = CreateThread
    L1_2 = HandleClosestPlayers
    L0_2(L1_2)
    L0_2 = CreateThread
    L1_2 = DrawIdOnClosestPlayers
    L0_2(L1_2)
  end
end
TogglePlayerIds = L4_1
