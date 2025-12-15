local L0_1, L1_1, L2_1
L0_1 = {}
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = rawget
  L3_2 = A0_2.enums
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    return A1_2
  end
end
L0_1.__index = L1_1
L1_1 = RageUI
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = {}
  L1_2.enums = A0_2
  L2_2 = setmetatable
  L3_2 = L1_2
  L4_2 = L0_1
  return L2_2(L3_2, L4_2)
end
L1_1.Enum = L2_1
