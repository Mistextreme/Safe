local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = false
L1_1 = {}
L2_1 = {}
L3_1 = {}
function L4_1(A0_2)
  local L1_2, L2_2
  L1_2 = Citizen
  L1_2 = L1_2.CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L0_3 = MySQL
    L0_3 = L0_3.Sync
    L0_3 = L0_3.fetchAll
    L1_3 = "SELECT * FROM kq_tuning WHERE 1 = 1"
    L2_3 = {}
    L0_3 = L0_3(L1_3, L2_3)
    L1_3 = 0
    L2_3 = pairs
    L3_3 = L0_3
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
      L1_3 = L1_3 + 1
      L8_3 = string
      L8_3 = L8_3.gsub
      L9_3 = L7_3.plate
      L10_3 = "%s+"
      L11_3 = ""
      L8_3 = L8_3(L9_3, L10_3, L11_3)
      L9_3 = L1_1
      L10_3 = L7_3.engine
      L9_3[L8_3] = L10_3
    end
    L2_3 = print
    L3_3 = "Loaded "
    L4_3 = L1_3
    L5_3 = " tuned cars"
    L3_3 = L3_3 .. L4_3 .. L5_3
    L2_3(L3_3)
    L2_3 = true
    L0_1 = L2_3
  end
  L1_2(L2_2)
end
GetSwappedCars = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = Citizen
    L0_3 = L0_3.Wait
    L1_3 = 500
    L0_3(L1_3)
    L0_3 = {}
    L2_1 = L0_3
    L0_3 = MySQL
    L0_3 = L0_3.Sync
    L0_3 = L0_3.fetchAll
    L1_3 = "SELECT * FROM kq_tuningparts WHERE 1 = 1"
    L2_3 = {}
    L0_3 = L0_3(L1_3, L2_3)
    L1_3 = pairs
    L2_3 = L0_3
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L8_3 = L6_3.storage
      L7_3 = L2_1
      L7_3 = L7_3[L8_3]
      if not L7_3 then
        L8_3 = L6_3.storage
        L7_3 = L2_1
        L9_3 = {}
        L7_3[L8_3] = L9_3
      end
      L7_3 = table
      L7_3 = L7_3.insert
      L9_3 = L6_3.storage
      L8_3 = L2_1
      L8_3 = L8_3[L9_3]
      L9_3 = L6_3
      L7_3(L8_3, L9_3)
    end
    L1_3 = true
    L0_1 = L1_3
  end
  L0_2(L1_2)
end
GetStocks = L4_1
L4_1 = Citizen
L4_1 = L4_1.CreateThread
function L5_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.Wait
  L1_2 = 5000
  L0_2(L1_2)
  L0_2 = GetSwappedCars
  L0_2()
  L0_2 = GetStocks
  L0_2()
end
L4_1(L5_1)
L4_1 = RegisterServerEvent
L5_1 = "kq_engineswaps:requestSync"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "kq_engineswaps:requestSync"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L0_1
  if L1_2 then
    L1_2 = string
    L1_2 = L1_2.gsub
    L2_2 = A0_2
    L3_2 = "%s+"
    L4_2 = ""
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    A0_2 = L1_2
    L1_2 = L1_1
    L1_2 = L1_2[A0_2]
    if L1_2 then
      L1_2 = TriggerClientEvent
      L2_2 = "kq_engineswaps:setVehicleEngine"
      L3_2 = source
      L4_2 = A0_2
      L5_2 = L1_1
      L5_2 = L5_2[A0_2]
      L1_2(L2_2, L3_2, L4_2, L5_2)
    else
      L1_2 = TriggerClientEvent
      L2_2 = "kq_engineswaps:setVehicleEngine"
      L3_2 = source
      L4_2 = A0_2
      L5_2 = false
      L1_2(L2_2, L3_2, L4_2, L5_2)
    end
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "kq_engineswaps:removeDoor"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "kq_engineswaps:removeDoor"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = ipairs
  L3_2 = GetPlayers
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L3_2()
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = TriggerClientEvent
    L9_2 = "kq_engineswaps:removeDoor"
    L10_2 = tonumber
    L11_2 = L7_2
    L10_2 = L10_2(L11_2)
    L11_2 = A0_2
    L12_2 = A1_2
    L8_2(L9_2, L10_2, L11_2, L12_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "kq_engineswaps:fixVehicle"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "kq_engineswaps:fixVehicle"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = ipairs
  L2_2 = GetPlayers
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L2_2()
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = TriggerClientEvent
    L8_2 = "kq_engineswaps:fixVehicle"
    L9_2 = tonumber
    L10_2 = L6_2
    L9_2 = L9_2(L10_2)
    L10_2 = A0_2
    L7_2(L8_2, L9_2, L10_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "kq_engineswaps:prepareVehicle"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "kq_engineswaps:prepareVehicle"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = NetworkGetEntityFromNetworkId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L3_1
  L2_2 = L2_2[L1_2]
  if L2_2 then
    L2_2 = GetPlayerName
    L3_2 = L3_1
    L3_2 = L3_2[L1_2]
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = L3_1
      L2_2 = L2_2[L1_2]
      L3_2 = source
      if L2_2 ~= L3_2 then
        goto lbl_22
      end
    end
    L2_2 = L3_1
    L2_2[L1_2] = nil
    goto lbl_30
    ::lbl_22::
    L2_2 = TriggerClientEvent
    L3_2 = "kq_engineswaps:notify"
    L4_2 = source
    L5_2 = L
    L6_2 = "~r~This vehicle is already being worked on by someone"
    L5_2, L6_2 = L5_2(L6_2)
    L2_2(L3_2, L4_2, L5_2, L6_2)
    return
  end
  ::lbl_30::
  L2_2 = TriggerClientEvent
  L3_2 = "kq_engineswaps:prepareVehicle"
  L4_2 = source
  L5_2 = A0_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = L3_1
  L3_2 = source
  L2_2[L1_2] = L3_2
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "kq_engineswaps:endSwap"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "kq_engineswaps:endSwap"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = NetworkGetEntityFromNetworkId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L3_1
  L2_2[L1_2] = nil
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "kq_engineswaps:setVehicleEngine"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "kq_engineswaps:setVehicleEngine"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = Config
  L3_2 = L3_2.Engines
  L3_2 = L3_2[A1_2]
  if L3_2 then
    L3_2 = SetVehicleEngine
    L4_2 = source
    L5_2 = A0_2
    L6_2 = A1_2
    L7_2 = A2_2
    L3_2(L4_2, L5_2, L6_2, L7_2)
  else
    L3_2 = print
    L4_2 = "Player: "
    L5_2 = source
    L6_2 = " attempted to set unexisting engine "
    L7_2 = A1_2
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
    L3_2(L4_2)
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterServerEvent
L5_1 = "kq_engineswaps:requestStock"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "kq_engineswaps:requestStock"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L0_1
  if L1_2 then
    if "player" == A0_2 then
      L1_2 = _GetPlayerIdentifier
      L2_2 = source
      L1_2 = L1_2(L2_2)
      L2_2 = L2_1
      L1_2 = L2_2[L1_2]
      if not L1_2 then
        L1_2 = _GetPlayerIdentifier
        L2_2 = source
        L1_2 = L1_2(L2_2)
        L2_2 = L2_1
        L3_2 = {}
        L2_2[L1_2] = L3_2
      end
      L1_2 = TriggerClientEvent
      L2_2 = "kq_engineswaps:setStock"
      L3_2 = source
      L4_2 = A0_2
      L5_2 = _GetPlayerIdentifier
      L6_2 = source
      L5_2 = L5_2(L6_2)
      L6_2 = L2_1
      L5_2 = L6_2[L5_2]
      L1_2(L2_2, L3_2, L4_2, L5_2)
    else
      L1_2 = L2_1
      L1_2 = L1_2[A0_2]
      if not L1_2 then
        L1_2 = L2_1
        L2_2 = {}
        L1_2[A0_2] = L2_2
      end
      L1_2 = TriggerClientEvent
      L2_2 = "kq_engineswaps:setStock"
      L3_2 = source
      L4_2 = A0_2
      L5_2 = L2_1
      L5_2 = L5_2[A0_2]
      L1_2(L2_2, L3_2, L4_2, L5_2)
    end
  end
end
L4_1(L5_1, L6_1)
L4_1 = RegisterServerEvent
L5_1 = "kq_engineswaps:getTime"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "kq_engineswaps:getTime"
function L6_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = TriggerClientEvent
  L1_2 = "kq_engineswaps:setTime"
  L2_2 = source
  L3_2 = GetTime
  L3_2 = L3_2()
  L0_2(L1_2, L2_2, L3_2)
end
L4_1(L5_1, L6_1)
function L4_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L4_2 = Config
  L4_2 = L4_2.Workshops
  L4_2 = L4_2[A3_2]
  L5_2 = _GetPlayerIdentifier
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = CanUseWorkshop
  L7_2 = A0_2
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    return
  end
  L6_2 = L5_2
  L7_2 = L4_2.playerWorkshop
  if not L7_2 then
    L6_2 = L4_2.storageName
  end
  L7_2 = false
  L8_2 = pairs
  L9_2 = L2_1
  L9_2 = L9_2[L6_2]
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = L13_2.part
    if L14_2 == A2_2 then
      L14_2 = L13_2.available_at
      L15_2 = GetTime
      L15_2 = L15_2()
      if L14_2 <= L15_2 then
        L7_2 = true
      end
    end
  end
  if not L7_2 then
    return
  end
  L8_2 = string
  L8_2 = L8_2.gsub
  L9_2 = A1_2
  L10_2 = "%s+"
  L11_2 = ""
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  A1_2 = L8_2
  L8_2 = L1_1
  L8_2[A1_2] = A2_2
  L8_2 = "DELETE FROM kq_tuning WHERE plate = @plate;"
  L9_2 = MySQL
  L9_2 = L9_2.Sync
  L9_2 = L9_2.execute
  L10_2 = L8_2
  L11_2 = {}
  L11_2["@plate"] = A1_2
  L9_2(L10_2, L11_2)
  L9_2 = "INSERT INTO kq_tuning (`plate`, `engine`, `tuned_by`) VALUES(@plate, @engine, @tuned_by);"
  L10_2 = MySQL
  L10_2 = L10_2.Sync
  L10_2 = L10_2.insert
  L11_2 = L9_2
  L12_2 = {}
  L12_2["@plate"] = A1_2
  L12_2["@engine"] = A2_2
  L12_2["@tuned_by"] = L5_2
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = "DELETE FROM kq_tuningparts WHERE storage = @storage AND part = @part LIMIT 1;"
  L12_2 = MySQL
  L12_2 = L12_2.Sync
  L12_2 = L12_2.execute
  L13_2 = L11_2
  L14_2 = {}
  L14_2["@storage"] = L6_2
  L14_2["@part"] = A2_2
  L12_2(L13_2, L14_2)
  L12_2 = GetStocks
  L12_2()
  L12_2 = ipairs
  L13_2 = GetPlayers
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L13_2()
  L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
    L18_2 = TriggerClientEvent
    L19_2 = "kq_engineswaps:setVehicleEngine"
    L20_2 = tonumber
    L21_2 = L17_2
    L20_2 = L20_2(L21_2)
    L21_2 = A1_2
    L22_2 = A2_2
    L18_2(L19_2, L20_2, L21_2, L22_2)
    if "player" ~= L6_2 then
      L18_2 = tonumber
      L19_2 = L17_2
      L18_2 = L18_2(L19_2)
      if L18_2 ~= A0_2 then
        L18_2 = TriggerClientEvent
        L19_2 = "kq_engineswaps:resetStock"
        L20_2 = tonumber
        L21_2 = L17_2
        L20_2 = L20_2(L21_2)
        L21_2 = L6_2
        L18_2(L19_2, L20_2, L21_2)
      end
    end
  end
end
SetVehicleEngine = L4_1
L4_1 = RegisterServerEvent
L5_1 = "kq_engineswaps:purchaseEngine"
L4_1(L5_1)
L4_1 = AddEventHandler
L5_1 = "kq_engineswaps:purchaseEngine"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = PurchaseEngine
  L3_2 = source
  L4_2 = A0_2
  L5_2 = Config
  L5_2 = L5_2.Workshops
  L5_2 = L5_2[A1_2]
  L2_2(L3_2, L4_2, L5_2)
end
L4_1(L5_1, L6_1)
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = _GetPlayerIdentifier
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = CanUsePurchaseEngines
  L5_2 = A0_2
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    return
  end
  L4_2 = Config
  L4_2 = L4_2.Engines
  L4_2 = L4_2[A1_2]
  L5_2 = L3_2
  L6_2 = A2_2.playerWorkshop
  if not L6_2 then
    L5_2 = A2_2.storageName
  end
  L6_2 = ChargeForEngine
  L7_2 = A0_2
  L8_2 = A1_2
  L9_2 = A2_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    return
  end
  L6_2 = L4_2.shipmentDuration
  if L6_2 <= 0 then
    L4_2.shipmentDuration = 1
  end
  L6_2 = "INSERT INTO kq_tuningparts (`storage`, `type`, `part`, `available_at`) VALUES(@storage, @type, @part, @available_at);"
  L7_2 = MySQL
  L7_2 = L7_2.Sync
  L7_2 = L7_2.insert
  L8_2 = L6_2
  L9_2 = {}
  L9_2["@storage"] = L5_2
  L9_2["@type"] = "engine"
  L9_2["@part"] = A1_2
  L10_2 = GetTime
  L10_2 = L10_2()
  L11_2 = L4_2.shipmentDuration
  L12_2 = math
  L12_2 = L12_2.random
  L13_2 = Config
  L13_2 = L13_2.ShipmentDurationMutator
  L13_2 = -L13_2
  L14_2 = Config
  L14_2 = L14_2.ShipmentDurationMutator
  L12_2 = L12_2(L13_2, L14_2)
  L11_2 = L11_2 + L12_2
  L11_2 = L11_2 * 60
  L10_2 = L10_2 + L11_2
  L9_2["@available_at"] = L10_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = TriggerClientEvent
  L9_2 = "kq_engineswaps:purchasePopup"
  L10_2 = A0_2
  L11_2 = L
  L12_2 = "YOUR ORDER HAS BEEN PLACED SUCCESSFULLY"
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L11_2(L12_2)
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L8_2 = GetStocks
  L8_2()
  L8_2 = ipairs
  L9_2 = GetPlayers
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L9_2()
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = TriggerClientEvent
    L15_2 = "kq_engineswaps:setVehicleEngine"
    L16_2 = tonumber
    L17_2 = L13_2
    L16_2 = L16_2(L17_2)
    L17_2 = plate
    L18_2 = L4_2
    L14_2(L15_2, L16_2, L17_2, L18_2)
    if "player" ~= L5_2 then
      L14_2 = tonumber
      L15_2 = L13_2
      L14_2 = L14_2(L15_2)
      if L14_2 ~= A0_2 then
        L14_2 = TriggerClientEvent
        L15_2 = "kq_engineswaps:resetStock"
        L16_2 = tonumber
        L17_2 = L13_2
        L16_2 = L16_2(L17_2)
        L17_2 = L5_2
        L14_2(L15_2, L16_2, L17_2)
      end
    end
  end
end
PurchaseEngine = L4_1
function L4_1()
  local L0_2, L1_2
  L0_2 = os
  L0_2 = L0_2.time
  return L0_2()
end
GetTime = L4_1
function L4_1(A0_2)
  local L1_2
  L1_2 = Locale
  if L1_2 then
    L1_2 = Locale
    L1_2 = L1_2[A0_2]
    if L1_2 then
      L1_2 = Locale
      L1_2 = L1_2[A0_2]
      return L1_2
    end
  end
  return A0_2
end
L = L4_1
