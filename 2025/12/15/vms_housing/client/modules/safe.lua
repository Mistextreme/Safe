local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = nil
L1_1 = nil
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if not A0_2 or not A1_2 then
    return
  end
  L2_2 = SetNuiFocus
  L3_2 = true
  L4_2 = true
  L2_2(L3_2, L4_2)
  openedMenu = "Safe"
  L0_1 = A0_2
  L1_1 = A1_2
  L2_2 = L1_1.pin
  if L2_2 then
    L2_2 = L1_1.pin
    if "" ~= L2_2 then
      goto lbl_26
    end
  end
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "Safe"
  L3_2.actionName = "SetFirstTime"
  L2_2(L3_2)
  goto lbl_32
  ::lbl_26::
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "Safe"
  L3_2.actionName = "Open"
  L2_2(L3_2)
  ::lbl_32::
end
OpenSafe = L2_1
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "Safe"
  L1_2.actionName = "Close"
  L0_2(L1_2)
  openedMenu = nil
  L0_2 = nil
  L0_1 = L0_2
  L0_2 = nil
  L1_1 = L0_2
end
CloseSafe = L2_1
L2_1 = RegisterNuiCallback
L3_1 = "safe:verifyCode"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L1_1
  if L2_2 then
    L2_2 = L2_2.pin
  end
  L3_2 = A0_2.code
  if L2_2 == L3_2 then
    L2_2 = L1_1
    if L2_2 then
      L2_2 = L2_2.pin
    end
    if "" ~= L2_2 then
      L2_2 = A1_2
      L3_2 = true
      L2_2(L3_2)
      L2_2 = A0_2.isChanging
      if not L2_2 then
        L2_2 = SetNuiFocus
        L3_2 = false
        L4_2 = false
        L2_2(L3_2, L4_2)
        L2_2 = Citizen
        L2_2 = L2_2.CreateThread
        function L3_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3
          L0_3 = Citizen
          L0_3 = L0_3.Wait
          L1_3 = 1200
          L0_3(L1_3)
          L0_3 = CL
          L0_3 = L0_3.InteractableFurniture
          L1_3 = nil
          L2_3 = "storage"
          L3_3 = L0_1
          L4_3 = L1_1
          L0_3(L1_3, L2_3, L3_3, L4_3)
          L0_3 = nil
          L0_1 = L0_3
          L0_3 = nil
          L1_1 = L0_3
        end
        L2_2(L3_2)
      end
  end
  else
    L2_2 = A1_2
    L3_2 = false
    L2_2(L3_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "safe:changeCode"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.oldCode
  L3_2 = A0_2.newCode
  L4_2 = TriggerServerEvent
  L5_2 = "vms_housing:sv:changeSafePin"
  L6_2 = CurrentProperty
  if not L6_2 then
    L6_2 = GetCurrentPropertyId
    L6_2 = L6_2()
  end
  L7_2 = L0_1
  L8_2 = L3_2
  L9_2 = L2_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L2_1(L3_1, L4_1)
