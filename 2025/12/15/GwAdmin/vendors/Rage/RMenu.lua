local L0_1, L1_1, L2_1
L0_1 = {}
RageUI = L0_1
L0_1 = RageUI
L1_1 = {}
L0_1.Item = L1_1
L0_1 = RageUI
L1_1 = {}
L0_1.Panel = L1_1
L0_1 = RageUI
L1_1 = {}
L0_1.Window = L1_1
L0_1 = setmetatable
L1_1 = {}
L2_1 = RMenu
L0_1 = L0_1(L1_1, L2_1)
RMenu = L0_1
L0_1 = {}
L1_1 = RMenu
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = RMenu
  L3_2 = L3_2[A0_2]
  if nil ~= L3_2 then
    L3_2 = RMenu
    L3_2 = L3_2[A0_2]
    L4_2 = {}
    L4_2.Menu = A2_2
    L3_2[A1_2] = L4_2
  else
    L3_2 = RMenu
    L4_2 = {}
    L3_2[A0_2] = L4_2
    L3_2 = RMenu
    L3_2 = L3_2[A0_2]
    L4_2 = {}
    L4_2.Menu = A2_2
    L3_2[A1_2] = L4_2
  end
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L0_1
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L1_1.Add = L2_1
L1_1 = RMenu
function L2_1(A0_2, A1_2, A2_2)
  local L3_2
  L3_2 = A0_2[A1_2]
  if nil ~= L3_2 then
    L3_2 = A0_2[A1_2]
    L3_2 = L3_2[A2_2]
    if nil ~= L3_2 then
      L3_2 = A0_2[A1_2]
      L3_2 = L3_2[A2_2]
      L3_2 = L3_2.Menu
      return L3_2
    end
  end
end
L1_1.Get = L2_1
L1_1 = RMenu
function L2_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2[A1_2]
  if nil ~= L2_2 then
    L2_2 = A0_2[A1_2]
    return L2_2
  end
end
L1_1.GetType = L2_1
L1_1 = RMenu
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2
  if nil ~= A4_2 then
    L5_2 = A0_2[A1_2]
    L5_2 = L5_2[A2_2]
    L5_2[A3_2] = A4_2
  else
    L5_2 = A0_2[A1_2]
    L5_2 = L5_2[A2_2]
    L5_2 = L5_2[A3_2]
    return L5_2
  end
end
L1_1.Settings = L2_1
L1_1 = RMenu
function L2_1(A0_2, A1_2, A2_2)
  local L3_2
  L3_2 = A0_2[A1_2]
  L3_2[A2_2] = nil
  L3_2 = collectgarbage
  L3_2()
end
L1_1.Delete = L2_1
L1_1 = RMenu
function L2_1(A0_2, A1_2)
  local L2_2
  A0_2[A1_2] = nil
  L2_2 = collectgarbage
  L2_2()
end
L1_1.DeleteType = L2_1
