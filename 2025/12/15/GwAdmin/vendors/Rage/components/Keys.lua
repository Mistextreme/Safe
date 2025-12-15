local L0_1, L1_1
L0_1 = {}
Keys = L0_1
L0_1 = Keys
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = {}
  L4_2.CONTROLS = A0_2
  L5_2 = RegisterKeyMapping
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "rageui-%s"
  L8_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = A2_2
  L8_2 = "keyboard"
  L9_2 = A0_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = RegisterCommand
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "rageui-%s"
  L8_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2)
  function L7_2(A0_3, A1_3)
    local L2_3
    L2_3 = A3_2
    if nil ~= L2_3 then
      L2_3 = A3_2
      L2_3()
    end
  end
  L8_2 = false
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = setmetatable
  L6_2 = L4_2
  L7_2 = Keys
  return L5_2(L6_2, L7_2)
end
L0_1.Register = L1_1
L0_1 = Keys
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.CONTROLS
  if L2_2 == A1_2 then
    L2_2 = true
    if L2_2 then
      goto lbl_8
    end
  end
  L2_2 = false
  ::lbl_8::
  return L2_2
end
L0_1.Exists = L1_1
