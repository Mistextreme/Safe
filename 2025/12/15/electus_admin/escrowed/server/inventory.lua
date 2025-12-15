local L0_1, L1_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetPlayerFromIdentifier
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = GetSourceFromIdentifier
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = GetInventory
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    return L3_2
  else
    L2_2 = GetInventoryDatabase
    L3_2 = A0_2
    L4_2 = false
    L2_2 = L2_2(L3_2, L4_2)
    return L2_2
  end
end
IdentifierGetInventory = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
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
  L10_2 = " to "
  L11_2 = A1_2
  L12_2 = " by "
  L13_2 = A0_2
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = GetPlayerFromIdentifier
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = GetSourceFromIdentifier
    L7_2 = A1_2
    L6_2 = L6_2(L7_2)
    L7_2 = AddInventoryItem
    L8_2 = L6_2
    L9_2 = A2_2
    L10_2 = A3_2
    L7_2(L8_2, L9_2, L10_2)
  else
    L6_2 = AddInventoryItemDatabase
    L7_2 = A1_2
    L8_2 = A2_2
    L9_2 = A3_2
    L6_2(L7_2, L8_2, L9_2)
  end
  L6_2 = true
  return L6_2
end
IdentifierAddItem = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
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
  L10_2 = " from "
  L11_2 = A1_2
  L12_2 = " by "
  L13_2 = A0_2
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = GetPlayerFromIdentifier
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = GetSourceFromIdentifier
    L7_2 = A1_2
    L6_2 = L6_2(L7_2)
    L7_2 = RemoveInventoryItem
    L8_2 = L6_2
    L9_2 = A2_2
    L10_2 = A3_2
    L7_2(L8_2, L9_2, L10_2)
  else
    L6_2 = RemoveInventoryItemDatabase
    L7_2 = A1_2
    L8_2 = A2_2
    L9_2 = A3_2
    L6_2(L7_2, L8_2, L9_2)
  end
  L6_2 = true
  return L6_2
end
IdentifierRemoveItemAmount = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "manage_inventory"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = {}
    L5_2.error = "permission"
    return L5_2
  end
  L5_2 = GetPlayerFromIdentifier
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = GetInventoryCount
    L7_2 = L5_2
    L8_2 = A2_2
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = A3_2 - L6_2
    if L7_2 > 0 then
      L8_2 = AddInventoryItem
      L9_2 = L5_2
      L10_2 = A2_2
      L11_2 = L7_2
      L8_2(L9_2, L10_2, L11_2)
    elseif L7_2 < 0 then
      L8_2 = RemoveInventoryItem
      L9_2 = L5_2
      L10_2 = A2_2
      L11_2 = math
      L11_2 = L11_2.abs
      L12_2 = L7_2
      L11_2, L12_2 = L11_2(L12_2)
      L8_2(L9_2, L10_2, L11_2, L12_2)
    end
  else
    L6_2 = GetItemCountDatabase
    L7_2 = A1_2
    L8_2 = A2_2
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = A3_2 - L6_2
    if L7_2 > 0 then
      L8_2 = AddInventoryItemDatabase
      L9_2 = A1_2
      L10_2 = A2_2
      L11_2 = L7_2
      L8_2(L9_2, L10_2, L11_2)
    elseif L7_2 < 0 then
      L8_2 = RemoveInventoryItemDatabase
      L9_2 = A1_2
      L10_2 = A2_2
      L11_2 = math
      L11_2 = L11_2.abs
      L12_2 = L7_2
      L11_2, L12_2 = L11_2(L12_2)
      L8_2(L9_2, L10_2, L11_2, L12_2)
    end
  end
  L6_2 = true
  return L6_2
end
IdentifierSetItem = L0_1
