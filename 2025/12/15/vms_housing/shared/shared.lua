local L0_1, L1_1
L0_1 = {}
AvailableShells = L0_1
L0_1 = {}
AvailableIPLS = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = next
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = pairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = AvailableShells
    L7_2 = L7_2[L5_2]
    if not L7_2 then
      L7_2 = AvailableShells
      L7_2[L5_2] = L6_2
    else
      L7_2 = warn
      L8_2 = "Duplicated shell "
      L9_2 = L5_2
      L10_2 = "! (CANCELED ACTION)"
      L8_2 = L8_2 .. L9_2 .. L10_2
      L7_2(L8_2)
    end
  end
end
addShells = L0_1
function L0_1()
  local L0_2, L1_2, L2_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "Reload"
  L2_2 = AvailableShells
  L1_2.availableShells = L2_2
  L0_2(L1_2)
end
reloadShells = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = next
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = pairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = AvailableIPLS
    L7_2 = L7_2[L5_2]
    if not L7_2 then
      L7_2 = AvailableIPLS
      L7_2[L5_2] = L6_2
    else
      L7_2 = warn
      L8_2 = "Duplicated IPL "
      L9_2 = L5_2
      L10_2 = "! (CANCELED ACTION)"
      L8_2 = L8_2 .. L9_2 .. L10_2
      L7_2(L8_2)
    end
  end
end
addIPLS = L0_1
