local L0_1, L1_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L0_2 = Cache
  L1_2 = "mapData"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    L1_2 = {}
    L2_2 = {}
    L3_2 = ipairs
    L4_2 = GetPlayers
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L4_2()
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = GetPlayerPed
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      L10_2 = GetVehiclePedIsIn
      L11_2 = L9_2
      L12_2 = false
      L10_2 = L10_2(L11_2, L12_2)
      L11_2 = GetPlayer
      L12_2 = L8_2
      L11_2 = L11_2(L12_2)
      if 0 ~= L10_2 then
        L12_2 = GetVehicleNumberPlateText
        L13_2 = L10_2
        L12_2 = L12_2(L13_2)
        L13_2 = false
        L14_2 = 1
        L15_2 = #L2_2
        L16_2 = 1
        for L17_2 = L14_2, L15_2, L16_2 do
          L18_2 = L2_2[L17_2]
          L18_2 = L18_2.plate
          if L18_2 == L12_2 then
            L18_2 = GetEntityCoords
            L19_2 = L10_2
            L18_2 = L18_2(L19_2)
            L19_2 = L2_2[L17_2]
            L19_2 = L19_2.players
            L20_2 = L2_2[L17_2]
            L20_2 = L20_2.players
            L20_2 = #L20_2
            L20_2 = L20_2 + 1
            L21_2 = {}
            L21_2.playerId = L8_2
            L22_2 = GetIdentifier
            L23_2 = L11_2
            L22_2 = L22_2(L23_2)
            L21_2.identifier = L22_2
            L22_2 = GetCharacterName
            L23_2 = L11_2
            L22_2 = L22_2(L23_2)
            L21_2.inGameName = L22_2
            L22_2 = {}
            L23_2 = L18_2.x
            L22_2.x = L23_2
            L23_2 = L18_2.y
            L22_2.y = L23_2
            L23_2 = L18_2.z
            L22_2.z = L23_2
            L21_2.coords = L22_2
            L19_2[L20_2] = L21_2
            L13_2 = true
            break
          end
        end
        if not L13_2 then
          L14_2 = GetEntityCoords
          L15_2 = L10_2
          L14_2 = L14_2(L15_2)
          L15_2 = #L2_2
          L15_2 = L15_2 + 1
          L16_2 = {}
          L16_2.plate = L12_2
          L17_2 = GetEntityModel
          L18_2 = L10_2
          L17_2 = L17_2(L18_2)
          L16_2.model = L17_2
          L17_2 = {}
          L18_2 = L14_2.x
          L17_2.x = L18_2
          L18_2 = L14_2.y
          L17_2.y = L18_2
          L18_2 = L14_2.z
          L17_2.z = L18_2
          L16_2.coords = L17_2
          L17_2 = {}
          L18_2 = {}
          L18_2.playerId = L8_2
          L19_2 = GetIdentifier
          L20_2 = L11_2
          L19_2 = L19_2(L20_2)
          L18_2.identifier = L19_2
          L19_2 = GetCharacterName
          L20_2 = L11_2
          L19_2 = L19_2(L20_2)
          L18_2.inGameName = L19_2
          L19_2 = {}
          L18_2.coords = L19_2
          L17_2[1] = L18_2
          L16_2.players = L17_2
          L2_2[L15_2] = L16_2
        end
      else
        L12_2 = GetEntityCoords
        L13_2 = L9_2
        L12_2 = L12_2(L13_2)
        L13_2 = #L1_2
        L13_2 = L13_2 + 1
        L14_2 = {}
        L14_2.playerId = L8_2
        L15_2 = GetIdentifier
        L16_2 = L11_2
        L15_2 = L15_2(L16_2)
        L14_2.identifier = L15_2
        L15_2 = GetCharacterName
        L16_2 = L11_2
        L15_2 = L15_2(L16_2)
        L14_2.inGameName = L15_2
        L15_2 = {}
        L16_2 = L12_2.x
        L15_2.x = L16_2
        L16_2 = L12_2.y
        L15_2.y = L16_2
        L16_2 = L12_2.z
        L15_2.z = L16_2
        L14_2.coords = L15_2
        L1_2[L13_2] = L14_2
      end
    end
    L3_2 = CacheSet
    L4_2 = "mapData"
    L5_2 = {}
    L5_2.players = L1_2
    L5_2.vehicles = L2_2
    L6_2 = 5
    L3_2(L4_2, L5_2, L6_2)
  end
  L1_2 = Cache
  L2_2 = "mapData"
  return L1_2(L2_2)
end
GetMapData = L0_1
