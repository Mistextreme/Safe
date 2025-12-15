local L0_1, L1_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "manage_inventory"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = {}
    L5_2.error = "permission"
    return L5_2
  end
  L5_2 = AdminLog
  L6_2 = -1
  L7_2 = "info"
  L8_2 = "Removed item "
  L9_2 = A2_2
  L10_2 = " from all players by "
  L11_2 = A0_2
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
  L5_2(L6_2, L7_2, L8_2)
  if A1_2 then
    L5_2 = GetAllPlayers
    L5_2 = L5_2()
    L6_2 = L5_2
    if L6_2 then
      L6_2 = L6_2.value
    end
    if not L6_2 then
      L6_2 = {}
    end
    L7_2 = 1
    L8_2 = #L6_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L6_2[L10_2]
      L12_2 = L11_2.identifier
      L13_2 = IdentifierRemoveItemAmount
      L14_2 = A0_2
      L15_2 = L12_2
      L16_2 = A2_2
      L17_2 = A3_2
      L13_2(L14_2, L15_2, L16_2, L17_2)
    end
  else
    L5_2 = GetOnlinePlayers
    L5_2 = L5_2()
    L6_2 = L5_2
    if L6_2 then
      L6_2 = L6_2.value
    end
    if not L6_2 then
      L6_2 = {}
    end
    L7_2 = 1
    L8_2 = #L6_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L6_2[L10_2]
      L12_2 = L11_2.identifier
      L13_2 = IdentifierRemoveItemAmount
      L14_2 = A0_2
      L15_2 = L12_2
      L16_2 = A2_2
      L17_2 = A3_2
      L13_2(L14_2, L15_2, L16_2, L17_2)
    end
  end
  L5_2 = true
  return L5_2
end
RemoveCountFromAllPlayers = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "manage_inventory"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = {}
    L5_2.error = "permission"
    return L5_2
  end
  L5_2 = AdminLog
  L6_2 = -1
  L7_2 = "info"
  L8_2 = "Added item "
  L9_2 = A2_2
  L10_2 = " to all players by "
  L11_2 = A0_2
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
  L5_2(L6_2, L7_2, L8_2)
  if A1_2 then
    L5_2 = GetAllPlayers
    L5_2 = L5_2()
    L6_2 = L5_2
    if L6_2 then
      L6_2 = L6_2.value
    end
    if not L6_2 then
      L6_2 = {}
    end
    L7_2 = 1
    L8_2 = #L6_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L6_2[L10_2]
      L12_2 = L11_2.identifier
      L13_2 = IdentifierAddItem
      L14_2 = A0_2
      L15_2 = L12_2
      L16_2 = A2_2
      L17_2 = A3_2
      L13_2(L14_2, L15_2, L16_2, L17_2)
    end
  else
    L5_2 = GetOnlinePlayers
    L5_2 = L5_2()
    L6_2 = L5_2
    if L6_2 then
      L6_2 = L6_2.value
    end
    if not L6_2 then
      L6_2 = {}
    end
    L7_2 = 1
    L8_2 = #L6_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L6_2[L10_2]
      L12_2 = L11_2.identifier
      L13_2 = IdentifierAddItem
      L14_2 = A0_2
      L15_2 = L12_2
      L16_2 = A2_2
      L17_2 = A3_2
      L13_2(L14_2, L15_2, L16_2, L17_2)
    end
  end
  L5_2 = true
  return L5_2
end
AddItemCountToAllPlayers = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "manage_inventory"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = {}
    L5_2.error = "permission"
    return L5_2
  end
  L5_2 = AdminLog
  L6_2 = -1
  L7_2 = "info"
  L8_2 = "Set item "
  L9_2 = A2_2
  L10_2 = " to "
  L11_2 = A3_2
  L12_2 = " for all players by "
  L13_2 = A0_2
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L5_2(L6_2, L7_2, L8_2)
  if A1_2 then
    L5_2 = GetAllPlayers
    L5_2 = L5_2()
    L6_2 = L5_2
    if L6_2 then
      L6_2 = L6_2.value
    end
    if not L6_2 then
      L6_2 = {}
    end
    L7_2 = 1
    L8_2 = #L6_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L6_2[L10_2]
      L12_2 = L11_2.identifier
      L13_2 = IdentifierSetItem
      L14_2 = A0_2
      L15_2 = L12_2
      L16_2 = A2_2
      L17_2 = A3_2
      L13_2(L14_2, L15_2, L16_2, L17_2)
    end
  else
    L5_2 = GetOnlinePlayers
    L5_2 = L5_2()
    L6_2 = L5_2
    if L6_2 then
      L6_2 = L6_2.value
    end
    if not L6_2 then
      L6_2 = {}
    end
    L7_2 = 1
    L8_2 = #L6_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L6_2[L10_2]
      L12_2 = L11_2.identifier
      L13_2 = IdentifierSetItem
      L14_2 = A0_2
      L15_2 = L12_2
      L16_2 = A2_2
      L17_2 = A3_2
      L13_2(L14_2, L15_2, L16_2, L17_2)
    end
  end
  L5_2 = true
  return L5_2
end
SetItemCountForAllPlayers = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = Cache
  L1_2 = "items"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    L1_2 = GetItemsData
    L1_2 = L1_2()
    L2_2 = CacheSet
    L3_2 = "items"
    L4_2 = L1_2
    L5_2 = 3600
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L0_2 = L2_2
  end
  L1_2 = Cache
  L2_2 = "items"
  return L1_2(L2_2)
end
GetItems = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetItemPlayersDatabase
  L2_2 = A0_2
  return L1_2(L2_2)
end
GetItemPlayers = L0_1
