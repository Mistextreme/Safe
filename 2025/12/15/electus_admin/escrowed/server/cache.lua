local L0_1, L1_1
L0_1 = {}
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = os
    L1_2 = L1_2.time
    L1_2 = L1_2()
    L2_2 = L0_1
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.expires
    if not (L1_2 >= L2_2) then
      goto lbl_15
    end
  end
  L1_2 = nil
  do return L1_2 end
  ::lbl_15::
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
Cache = L1_1
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = L0_1
  L4_2 = {}
  L3_2[A0_2] = L4_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L3_2.value = A1_2
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L4_2 = L4_2 + A2_2
  L3_2.expires = L4_2
end
CacheSet = L1_1
function L1_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2[A0_2] = nil
end
CacheDelete = L1_1
