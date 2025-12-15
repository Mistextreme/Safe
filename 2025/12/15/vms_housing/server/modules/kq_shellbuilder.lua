local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = Config
L0_1 = L0_1.Shells
L0_1 = L0_1.KuzQuality
if not L0_1 then
  return
end
L0_1 = GetGameTimer
L0_1 = L0_1()
L0_1 = L0_1 + 10000
while true do
  L1_1 = GetResourceState
  L2_1 = "kq_shellbuilder"
  L1_1 = L1_1(L2_1)
  if "started" == L1_1 then
    break
  end
  L1_1 = GetGameTimer
  L1_1 = L1_1()
  if L0_1 < L1_1 then
    L0_1 = -1
    break
  end
  L1_1 = Citizen
  L1_1 = L1_1.Wait
  L2_1 = 100
  L1_1(L2_1)
end
if -1 == L0_1 then
  L1_1 = warn
  L2_1 = "KuzQuality Shell Creator is not started, please check the resource state."
  return L1_1(L2_1)
end
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = GlobalState
  L1_2 = exports
  L1_2 = L1_2.kq_shellbuilder
  L2_2 = L1_2
  L1_2 = L1_2.GetShells
  L1_2 = L1_2(L2_2)
  L0_2.vms_housing_kq_shells = L1_2
  L0_2 = {}
  L1_2 = GlobalState
  L1_2 = L1_2.vms_housing_kq_shells
  if L1_2 then
    L1_2 = next
    L2_2 = GlobalState
    L2_2 = L2_2.vms_housing_kq_shells
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = pairs
      L2_2 = GlobalState
      L2_2 = L2_2.vms_housing_kq_shells
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L7_2 = "kq_sbx_shell_"
        L8_2 = L6_2.id
        L7_2 = L7_2 .. L8_2
        L8_2 = {}
        L9_2 = L6_2.title
        L8_2.label = L9_2
        L9_2 = {}
        L10_2 = "kuzquality"
        L9_2[1] = L10_2
        L8_2.tags = L9_2
        L8_2.rooms = 1
        L9_2 = "kq_sbx_shell_"
        L10_2 = L6_2.id
        L9_2 = L9_2 .. L10_2
        L8_2.model = L9_2
        L9_2 = {}
        L10_2 = L6_2.spawnPoint
        L10_2 = L10_2.x
        L9_2.x = L10_2
        L10_2 = L6_2.spawnPoint
        L10_2 = L10_2.y
        L9_2.y = L10_2
        L10_2 = L6_2.spawnPoint
        L10_2 = L10_2.z
        L10_2 = L10_2 * 1.5
        L10_2 = 500.0 + L10_2
        L9_2.z = L10_2
        L10_2 = L6_2.spawnPoint
        L10_2 = L10_2.w
        L9_2.heading = L10_2
        L8_2.doors = L9_2
        L0_2[L7_2] = L8_2
      end
      L1_2 = addShells
      L2_2 = L0_2
      L1_2(L2_2)
    end
  end
end
L2_1 = Citizen
L2_1 = L2_1.CreateThread
function L3_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2()
  L0_2 = Citizen
  L0_2 = L0_2.Wait
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = GlobalState
  L0_2 = L0_2.vms_housing_kq_shells
  L0_2 = #L0_2
  if L0_2 <= 0 then
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 2500
    L0_2(L1_2)
    L0_2 = L1_1
    L0_2()
  end
end
L2_1(L3_1)
L2_1 = RegisterNetEvent
L3_1 = "kq_shellbuilder:update"
L2_1(L3_1)
L2_1 = AddEventHandler
L3_1 = "kq_shellbuilder:update"
function L4_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2()
end
L2_1(L3_1, L4_1)
