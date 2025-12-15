local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "kq_engineswaps:setStock"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "kq_engineswaps:setStock"
function L2_1(A0_2, A1_2)
  local L2_2
  L2_2 = stocks
  L2_2[A0_2] = A1_2
  L2_2 = SetNUIStock
  L2_2()
  L2_2 = InsertNUIEngines
  L2_2()
end
L0_1(L1_1, L2_1)
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = currentWorkshop
  if L0_2 then
    L0_2 = "player"
    L1_2 = currentWorkshop
    L1_2 = L1_2.playerWorkshop
    if not L1_2 then
      L1_2 = currentWorkshop
      L0_2 = L1_2.storageName
    end
    L1_2 = stocks
    L1_2 = L1_2[L0_2]
    if not L1_2 then
      L1_2 = TriggerServerEvent
      L2_2 = "kq_engineswaps:requestStock"
      L3_2 = L0_2
      L1_2(L2_2, L3_2)
    else
      L1_2 = SendNUIMessage
      L2_2 = {}
      L2_2.event = "clearStock"
      L1_2(L2_2)
      L1_2 = pairs
      L2_2 = stocks
      L2_2 = L2_2[L0_2]
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L7_2 = Config
        L7_2 = L7_2.Engines
        L8_2 = L6_2.part
        L7_2 = L7_2[L8_2]
        if L7_2 then
          L7_2 = Config
          L7_2 = L7_2.Engines
          L8_2 = L6_2.part
          L7_2 = L7_2[L8_2]
          L8_2 = SendNUIMessage
          L9_2 = {}
          L9_2.event = "insertStock"
          L9_2.key = L5_2
          L10_2 = L7_2.name
          L9_2.name = L10_2
          L10_2 = L7_2.image
          if not L10_2 then
            L10_2 = "missing.png"
          end
          L9_2.image = L10_2
          L10_2 = L6_2.available_at
          L9_2.available_at = L10_2
          L10_2 = time
          L9_2.time = L10_2
          L8_2(L9_2)
        end
      end
    end
  end
end
SetNUIStock = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.event = "orderPopup"
  L2_2.message = A0_2
  L1_2(L2_2)
end
ShowOrderPopup = L0_1
L0_1 = RegisterNetEvent
L1_1 = "kq_engineswaps:purchasePopup"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "kq_engineswaps:purchasePopup"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = ShowOrderPopup
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = currentWorkshop
  L1_2 = L1_2.playerWorkshop
  if L1_2 then
    L1_2 = stocks
    L1_2.player = nil
  else
    L1_2 = stocks
    L2_2 = currentWorkshop
    L2_2 = L2_2.storageName
    L1_2[L2_2] = nil
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "kq_engineswaps:resetStock"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "kq_engineswaps:resetStock"
function L2_1(A0_2)
  local L1_2
  L1_2 = stocks
  L1_2[A0_2] = nil
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "PurchaseEngine"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.engine
  L3_2 = currentWorkshopKey
  if L3_2 then
    L3_2 = TriggerServerEvent
    L4_2 = "kq_engineswaps:purchaseEngine"
    L5_2 = L2_2
    L6_2 = currentWorkshopKey
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = A1_2
  L4_2 = true
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
