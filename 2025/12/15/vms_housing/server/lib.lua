local L0_1, L1_1, L2_1, L3_1
L0_1 = false
L1_1 = {}
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = Config
  L2_2 = L2_2.Debug
  if not L2_2 then
    return
  end
  if A1_2 then
    if "error" == A1_2 then
      L2_2 = error
      L3_2 = A0_2
      L2_2(L3_2)
    elseif "warn" == A1_2 then
      L2_2 = warn
      L3_2 = A0_2
      L2_2(L3_2)
    end
  else
    L2_2 = print
    L3_2 = A0_2
    L2_2(L3_2)
  end
end
L1_1.Debug = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = json
  L1_2 = L1_2.encode
  L2_2 = A0_2
  L3_2 = {}
  L3_2.indent = true
  return L1_2(L2_2, L3_2)
end
L1_1.Dump = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2 or nil
  if not A1_2 then
    L2_2 = 0
  end
  L3_2 = 10
  L2_2 = L3_2 ^ L2_2
  L3_2 = math
  L3_2 = L3_2.floor
  L4_2 = A0_2 * L2_2
  L4_2 = L4_2 + 0.5
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 / L2_2
  return L3_2
end
L1_1.Round = L2_1
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = TriggerClientEvent
  L5_2 = "vms_housing:notification"
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L1_1.Notification = L2_1
function L2_1(A0_2, A1_2, ...)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = Config
  L2_2 = L2_2.Core
  if "ESX" == L2_2 then
    L2_2 = Core
    L2_2 = L2_2.RegisterServerCallback
    L3_2 = A0_2
    L4_2 = A1_2
    L5_2 = ...
    L2_2(L3_2, L4_2, L5_2)
  else
    L2_2 = Config
    L2_2 = L2_2.Core
    if "QB-Core" == L2_2 then
      L2_2 = Core
      L2_2 = L2_2.Functions
      L2_2 = L2_2.CreateCallback
      L3_2 = A0_2
      L4_2 = A1_2
      L5_2 = ...
      L2_2(L3_2, L4_2, L5_2)
    end
  end
end
L1_1.RegisterCallback = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SV
  L1_2 = L1_2.GetPlayerJob
  L2_2 = A0_2
  L3_2 = "name"
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = Config
  L2_2 = L2_2.HousingCreator
  if L2_2 then
    L2_2 = L2_2.RequiredJob
  end
  L2_2 = L1_2 == L2_2
  return L2_2
end
L1_1.HasCreatorPermissions = L2_1
function L2_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = tonumber
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_10
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_10::
  L1_2 = math
  L1_2 = L1_2.random
  L1_2 = L1_2()
  L1_2 = L1_2 * 100
  L2_2 = A0_2 > L1_2
  return L2_2
end
L1_1.DrawChance = L2_1
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L4_2 = Properties
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = Config
  L5_2 = L5_2.UseKeysOnItem
  if L5_2 then
    L5_2 = SV
    L5_2 = L5_2.GetPlayer
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    if A3_2 then
      L6_2 = string
      L6_2 = L6_2.match
      L7_2 = A3_2
      L8_2 = "^(.-)%-(.+)$"
      L6_2, L7_2 = L6_2(L7_2, L8_2)
      L8_2 = tostring
      L9_2 = A2_2
      L8_2 = L8_2(L9_2)
      L9_2 = tostring
      L10_2 = L6_2
      L9_2 = L9_2(L10_2)
      if L8_2 ~= L9_2 then
        L8_2 = false
        return L8_2
      end
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = L4_2.keys
      L10_2 = L7_2
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 then
        L8_2 = SV
        L8_2 = L8_2.GetItem
        L9_2 = A0_2
        L10_2 = L5_2
        L11_2 = "house_key"
        L12_2 = {}
        L12_2.keySerialNumber = A3_2
        L13_2 = "key"
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
        if L8_2 then
          L8_2 = true
          return L8_2
        end
      end
    else
      L6_2 = json
      L6_2 = L6_2.decode
      L7_2 = L4_2.keys
      L6_2 = L6_2(L7_2)
      L7_2 = 1
      L8_2 = #L6_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = SV
        L11_2 = L11_2.GetItem
        L12_2 = A0_2
        L13_2 = L5_2
        L14_2 = "house_key"
        L15_2 = {}
        L16_2 = L6_2[L10_2]
        L15_2.keySerialNumber = L16_2
        L16_2 = "key"
        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
        if L11_2 then
          L11_2 = true
          return L11_2
        end
      end
    end
  else
    L5_2 = L4_2.owner
    if L5_2 == A1_2 then
      L5_2 = true
      return L5_2
    end
    L5_2 = L4_2.renter
    if L5_2 == A1_2 then
      L5_2 = true
      return L5_2
    end
    L5_2 = L4_2.keys
    if L5_2 then
      L5_2 = string
      L5_2 = L5_2.find
      L6_2 = L4_2.keys
      L7_2 = A1_2
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 then
        L5_2 = true
        return L5_2
      end
    end
    L5_2 = false
    return L5_2
  end
end
L1_1.HasKeys = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = Config
  L1_2 = L1_2.UseKeysOnItem
  if not L1_2 then
    return
  end
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3
    L0_3 = {}
    L1_3 = "A"
    L2_3 = "B"
    L3_3 = "C"
    L4_3 = "D"
    L5_3 = "E"
    L6_3 = "F"
    L7_3 = "G"
    L8_3 = "H"
    L9_3 = "I"
    L10_3 = "J"
    L11_3 = "K"
    L12_3 = "L"
    L13_3 = "M"
    L14_3 = "N"
    L15_3 = "O"
    L16_3 = "P"
    L17_3 = "Q"
    L18_3 = "R"
    L19_3 = "S"
    L20_3 = "T"
    L21_3 = "U"
    L22_3 = "V"
    L23_3 = "W"
    L24_3 = "X"
    L25_3 = "Y"
    L26_3 = "Z"
    L0_3[1] = L1_3
    L0_3[2] = L2_3
    L0_3[3] = L3_3
    L0_3[4] = L4_3
    L0_3[5] = L5_3
    L0_3[6] = L6_3
    L0_3[7] = L7_3
    L0_3[8] = L8_3
    L0_3[9] = L9_3
    L0_3[10] = L10_3
    L0_3[11] = L11_3
    L0_3[12] = L12_3
    L0_3[13] = L13_3
    L0_3[14] = L14_3
    L0_3[15] = L15_3
    L0_3[16] = L16_3
    L0_3[17] = L17_3
    L0_3[18] = L18_3
    L0_3[19] = L19_3
    L0_3[20] = L20_3
    L0_3[21] = L21_3
    L0_3[22] = L22_3
    L0_3[23] = L23_3
    L0_3[24] = L24_3
    L0_3[25] = L25_3
    L0_3[26] = L26_3
    L1_3 = math
    L1_3 = L1_3.random
    L2_3 = #L0_3
    L1_3 = L1_3(L2_3)
    L1_3 = L0_3[L1_3]
    return L1_3
  end
  L2_2 = A0_2
  L3_2 = "-"
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = 1000
  L6_2 = 9999
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L1_2
  L5_2 = L5_2()
  L6_2 = L1_2
  L6_2 = L6_2()
  L7_2 = L1_2
  L7_2 = L7_2()
  L8_2 = math
  L8_2 = L8_2.random
  L9_2 = 100
  L10_2 = 999
  L8_2 = L8_2(L9_2, L10_2)
  L2_2 = L2_2 .. L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2
  L3_2 = string
  L3_2 = L3_2.find
  L4_2 = json
  L4_2 = L4_2.encode
  L5_2 = Properties
  L5_2 = L5_2[A0_2]
  L5_2 = L5_2.keys
  L4_2 = L4_2(L5_2)
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = library
    L3_2 = L3_2.GenerateKeySerialNumber
    L4_2 = A0_2
    return L3_2(L4_2)
  end
  return L2_2
end
L1_1.GenerateKeySerialNumber = L2_1
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = RegisterStorage
  if L1_2 then
    L1_2 = RegisterStorage
    L2_2 = A0_2
    L1_2(L2_2)
  else
    L1_2 = L0_1
    if not L1_2 then
      L1_2 = true
      L0_1 = L1_2
      L1_2 = warn
      L2_2 = "Compatible Inventory is missing!"
      L1_2(L2_2)
      L1_2 = print
      L2_2 = "Adjust it on ^5vms_housing/integration/[inventory]^7"
      L1_2(L2_2)
    end
  end
end
L1_1.RegisterStorage = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L2_2 = Config
  L2_2 = L2_2.UseServiceBills
  if not L2_2 then
    return
  end
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = L2_2.metadata
  if not L3_2 then
    L3_2 = {}
  end
  L4_2 = L3_2.lightState
  if L4_2 then
    L4_2 = L3_2.lightStartTime
    if L4_2 then
      goto lbl_24
    end
  end
  do return end
  ::lbl_24::
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L5_2 = L3_2.lightStartTime
  L6_2 = tonumber
  L7_2 = os
  L7_2 = L7_2.date
  L8_2 = "%m"
  L9_2 = L4_2
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L7_2(L8_2, L9_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
  L7_2 = tonumber
  L8_2 = os
  L8_2 = L8_2.date
  L9_2 = "%Y"
  L10_2 = L4_2
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L8_2(L9_2, L10_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
  L8_2 = tonumber
  L9_2 = os
  L9_2 = L9_2.date
  L10_2 = "%m"
  L11_2 = L5_2
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L9_2(L10_2, L11_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
  L9_2 = tonumber
  L10_2 = os
  L10_2 = L10_2.date
  L11_2 = "%Y"
  L12_2 = L5_2
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L10_2(L11_2, L12_2)
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
  if L6_2 == L8_2 and L7_2 == L9_2 then
    return
  end
  L10_2 = os
  L10_2 = L10_2.time
  L11_2 = {}
  L11_2.day = 1
  L11_2.month = L6_2
  L11_2.year = L7_2
  L11_2.hour = 0
  L11_2.min = 0
  L11_2.sec = 0
  L10_2 = L10_2(L11_2)
  if L5_2 >= L10_2 then
    return
  end
  L11_2 = L10_2 - L5_2
  if L11_2 <= 0 then
    return
  end
  L12_2 = L6_2 - 1
  L13_2 = L7_2
  if L12_2 <= 0 then
    L12_2 = 12
    L13_2 = L13_2 - 1
  end
  L14_2 = string
  L14_2 = L14_2.format
  L15_2 = "%02d:%04d"
  L16_2 = L12_2
  L17_2 = L13_2
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L15_2 = L2_2.bills
  if not L15_2 then
    L15_2 = {}
  end
  L16_2 = nil
  L17_2 = 1
  L18_2 = #L15_2
  L19_2 = 1
  for L20_2 = L17_2, L18_2, L19_2 do
    L21_2 = L15_2[L20_2]
    L21_2 = L21_2.period
    if L21_2 == L14_2 then
      L21_2 = L15_2[L20_2]
      L21_2 = L21_2.type
      if "services" == L21_2 then
        L16_2 = L15_2[L20_2]
        break
      end
    end
  end
  if L16_2 then
    L17_2 = json
    L17_2 = L17_2.decode
    L18_2 = L16_2.details
    if not L18_2 then
      L18_2 = "{}"
    end
    L17_2 = L17_2(L18_2)
    L18_2 = Config
    L18_2 = L18_2.Regions
    L19_2 = L2_2.region
    L18_2 = L18_2[L19_2]
    if not L18_2 then
      L18_2 = Config
      L18_2 = L18_2.NoRegion
    end
    L19_2 = L17_2.electricityUsage
    if not L19_2 then
      L19_2 = 0
    end
    L19_2 = L19_2 + L11_2
    L17_2.electricityUsage = L19_2
    L19_2 = L17_2.electricity
    if not L19_2 then
      L19_2 = 0
    end
    L20_2 = L18_2.electricity
    L20_2 = L20_2.rate
    L20_2 = L11_2 * L20_2
    L19_2 = L19_2 + L20_2
    L17_2.electricity = L19_2
    L19_2 = L17_2.electricity
    if not L19_2 then
      L19_2 = 0
    end
    L20_2 = L17_2.water
    if not L20_2 then
      L20_2 = 0
    end
    L19_2 = L19_2 + L20_2
    L20_2 = L17_2.internet
    if not L20_2 then
      L20_2 = 0
    end
    L19_2 = L19_2 + L20_2
    L16_2.total = L19_2
    L19_2 = json
    L19_2 = L19_2.encode
    L20_2 = L17_2
    L19_2 = L19_2(L20_2)
    L16_2.details = L19_2
    L19_2 = MySQL
    L19_2 = L19_2.update
    L19_2 = L19_2.await
    L20_2 = "UPDATE houses_bills SET details = ?, total = ? WHERE id = ? AND type = ?"
    L21_2 = {}
    L22_2 = json
    L22_2 = L22_2.encode
    L23_2 = L17_2
    L22_2 = L22_2(L23_2)
    L23_2 = L16_2.total
    L24_2 = L16_2.id
    L25_2 = "services"
    L21_2[1] = L22_2
    L21_2[2] = L23_2
    L21_2[3] = L24_2
    L21_2[4] = L25_2
    L19_2(L20_2, L21_2)
  end
  L3_2.lightStartTime = L10_2
end
L1_1.HandleLightStateMonthOverlap = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = Config
  L2_2 = L2_2.UseServiceBills
  if not L2_2 then
    return
  end
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = L2_2.metadata
  if not L3_2 then
    L3_2 = {}
  end
  L4_2 = L3_2.waterUsage
  if not L4_2 then
    L4_2 = 0
  end
  L5_2 = Config
  L5_2 = L5_2.Regions
  L6_2 = L2_2.region
  L5_2 = L5_2[L6_2]
  if not L5_2 then
    L5_2 = Config
    L5_2 = L5_2.NoRegion
  end
  L6_2 = 0
  L7_2 = L5_2.water
  L7_2 = L7_2.rate
  L7_2 = L4_2 * L7_2
  L8_2 = L5_2.internet
  L8_2 = L8_2.flatRate
  L9_2 = L6_2 + L7_2
  L9_2 = L9_2 + L8_2
  L10_2 = {}
  L10_2.electricityUsage = 0
  L10_2.electricity = L6_2
  L10_2.waterUsage = L4_2
  L10_2.water = L7_2
  L10_2.internet = L8_2
  L11_2 = {}
  L12_2 = library
  L12_2 = L12_2.Round
  L13_2 = L5_2.electricity
  L13_2 = L13_2.rate
  L14_2 = 5
  L12_2 = L12_2(L13_2, L14_2)
  L11_2.electricity = L12_2
  L12_2 = library
  L12_2 = L12_2.Round
  L13_2 = L5_2.water
  L13_2 = L13_2.rate
  L14_2 = 5
  L12_2 = L12_2(L13_2, L14_2)
  L11_2.water = L12_2
  L12_2 = library
  L12_2 = L12_2.Round
  L13_2 = L5_2.internet
  L13_2 = L13_2.flatRate
  L14_2 = 5
  L12_2 = L12_2(L13_2, L14_2)
  L11_2.internet = L12_2
  L10_2.rateInfo = L11_2
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L10_2
  L11_2 = L11_2(L12_2)
  L12_2 = pcall
  function L13_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = MySQL
    L0_3 = L0_3.insert
    L0_3 = L0_3.await
    L1_3 = [[
                INSERT INTO houses_bills (house_id, period, type, total, paid, details)
                VALUES (?, ?, ?, ?, ?, ?)
            ]]
    L2_3 = {}
    L3_3 = tonumber
    L4_3 = A0_2
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L5_3 = "services"
    L6_3 = L9_2
    L7_3 = 0
    L8_3 = L11_2
    L2_3[1] = L3_3
    L2_3[2] = L4_3
    L2_3[3] = L5_3
    L2_3[4] = L6_3
    L2_3[5] = L7_3
    L2_3[6] = L8_3
    return L0_3(L1_3, L2_3)
  end
  L12_2, L13_2 = L12_2(L13_2)
  if L12_2 and L13_2 then
    L3_2.waterUsage = 0
    L14_2 = {}
    L14_2.id = L13_2
    L14_2.house_id = A0_2
    L14_2.period = A1_2
    L14_2.type = "services"
    L14_2.total = L9_2
    L14_2.paid = 0
    L14_2.paid_at = nil
    L14_2.details = L11_2
    return L14_2
  else
    L14_2 = MySQL
    L14_2 = L14_2.single
    L14_2 = L14_2.await
    L15_2 = [[
                SELECT * FROM houses_bills WHERE house_id = ? AND period = ? AND type = ?
            ]]
    L16_2 = {}
    L17_2 = tonumber
    L18_2 = A0_2
    L17_2 = L17_2(L18_2)
    L18_2 = A1_2
    L19_2 = "services"
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L14_2 = L14_2(L15_2, L16_2)
    return L14_2
  end
end
L1_1.GenerateMonthlyBill = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = GetProperty
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = L3_2.renter
    if L4_2 then
      goto lbl_11
    end
  end
  L4_2 = nil
  do return L4_2 end
  ::lbl_11::
  L4_2 = L3_2.rental
  if L4_2 then
    L4_2 = L3_2.rental
    L4_2 = L4_2.price
    if L4_2 then
      goto lbl_19
    end
  end
  L4_2 = 0
  ::lbl_19::
  if L4_2 <= 0 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = {}
  L5_2.rent = L4_2
  L6_2 = json
  L6_2 = L6_2.encode
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = pcall
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = MySQL
    L0_3 = L0_3.insert
    L0_3 = L0_3.await
    L1_3 = [[
 
                INSERT INTO houses_bills (house_id, period, type, total, paid, details)
                VALUES (?, ?, ?, ?, ?, ?)
            ]]
    L2_3 = {}
    L3_3 = tonumber
    L4_3 = A0_2
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L5_3 = "rent"
    L6_3 = L4_2
    L7_3 = A2_2
    if nil ~= L7_3 then
      L7_3 = A2_2
      if L7_3 then
        goto lbl_20
      end
    end
    L7_3 = 0
    ::lbl_20::
    L8_3 = L6_2
    L2_3[1] = L3_3
    L2_3[2] = L4_3
    L2_3[3] = L5_3
    L2_3[4] = L6_3
    L2_3[5] = L7_3
    L2_3[6] = L8_3
    return L0_3(L1_3, L2_3)
  end
  L7_2, L8_2 = L7_2(L8_2)
  if L7_2 and L8_2 then
    L9_2 = {}
    L9_2.id = L8_2
    L9_2.house_id = A0_2
    L9_2.period = A1_2
    L9_2.type = "rent"
    L9_2.total = L4_2
    L10_2 = A2_2 or L10_2
    if nil == A2_2 or not A2_2 then
      L10_2 = 0
    end
    L9_2.paid = L10_2
    if nil ~= A2_2 then
      L10_2 = os
      L10_2 = L10_2.time
      L10_2 = L10_2()
      if L10_2 then
        goto lbl_58
      end
    end
    L10_2 = nil
    ::lbl_58::
    L9_2.paid_at = L10_2
    L9_2.details = L6_2
    return L9_2
  else
    L9_2 = MySQL
    L9_2 = L9_2.single
    L9_2 = L9_2.await
    L10_2 = [[
 
                SELECT * FROM houses_bills WHERE house_id = ? AND period = ? AND type = ?
            ]]
    L11_2 = {}
    L12_2 = tonumber
    L13_2 = A0_2
    L12_2 = L12_2(L13_2)
    L13_2 = A1_2
    L14_2 = "rent"
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L11_2[3] = L14_2
    L9_2 = L9_2(L10_2, L11_2)
    return L9_2
  end
end
L1_1.GenerateRentBill = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = {}
    return L3_2
  end
  L3_2 = library
  L3_2 = L3_2.HandleLightStateMonthOverlap
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = os
  L3_2 = L3_2.date
  L4_2 = "%m:%Y"
  L3_2 = L3_2(L4_2)
  L4_2 = GetWeekPeriod
  L4_2 = L4_2()
  L5_2 = L2_2.rental
  if L5_2 then
    L5_2 = L2_2.rental
    L5_2 = L5_2.cycle
    if "weekly" == L5_2 and L4_2 then
      goto lbl_29
      L5_2 = L4_2 or L5_2
    end
  end
  L5_2 = L3_2
  ::lbl_29::
  L6_2 = false
  L7_2 = false
  L8_2 = ipairs
  L9_2 = L2_2.bills
  if not L9_2 then
    L9_2 = {}
  end
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = L13_2.period
    if L14_2 == L3_2 then
      L14_2 = L13_2.type
      if "services" == L14_2 then
        L6_2 = true
      end
    end
    L14_2 = L13_2.period
    if L14_2 == L5_2 then
      L14_2 = L13_2.type
      if "rent" == L14_2 then
        L14_2 = L2_2.renter
        if L14_2 then
          L7_2 = true
        end
      end
    end
  end
  if not L6_2 then
    L8_2 = library
    L8_2 = L8_2.GenerateMonthlyBill
    L9_2 = A0_2
    L10_2 = L3_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 then
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = L2_2.bills
      L11_2 = 1
      L12_2 = L8_2
      L9_2(L10_2, L11_2, L12_2)
      L9_2 = L8_2.period
      if L9_2 ~= L3_2 then
        L9_2 = L2_2.unpaidBills
        if not L9_2 then
          L9_2 = 0
        end
        L9_2 = L9_2 + 1
        L2_2.unpaidBills = L9_2
      end
    end
  end
  if not L7_2 then
    L8_2 = library
    L8_2 = L8_2.GenerateRentBill
    L9_2 = A0_2
    L10_2 = L5_2
    L11_2 = A1_2
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    if L8_2 then
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = L2_2.bills
      L11_2 = 1
      L12_2 = L8_2
      L9_2(L10_2, L11_2, L12_2)
      if not A1_2 then
        L9_2 = L2_2.unpaidRentBills
        if not L9_2 then
          L9_2 = 0
        end
        L9_2 = L9_2 + 1
        L2_2.unpaidRentBills = L9_2
      end
    end
  end
  L8_2 = L2_2.bills
  return L8_2
end
L1_1.GetOrCreateBills = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = Config
  L3_2 = L3_2.UseServiceBills
  if not L3_2 then
    return
  end
  L3_2 = GetProperty
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = L3_2.metadata
  L4_2 = L4_2.lightState
  if L4_2 then
    L4_2 = L3_2.metadata
    L4_2 = L4_2.lightStartTime
    if L4_2 then
      goto lbl_23
    end
  end
  L4_2 = false
  do return L4_2 end
  ::lbl_23::
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L5_2 = L3_2.metadata
  L5_2 = L5_2.lightStartTime
  L6_2 = L4_2 - L5_2
  if L6_2 <= 0 then
    L7_2 = false
    return L7_2
  end
  L7_2 = os
  L7_2 = L7_2.date
  L8_2 = "%m:%Y"
  L9_2 = L4_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = Config
  L8_2 = L8_2.Regions
  L9_2 = L3_2.region
  L8_2 = L8_2[L9_2]
  if not L8_2 then
    L8_2 = Config
    L8_2 = L8_2.NoRegion
  end
  L9_2 = L8_2.electricity
  L9_2 = L9_2.rate
  L10_2 = nil
  L11_2 = ipairs
  L12_2 = L3_2.bills
  if not L12_2 then
    L12_2 = {}
  end
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = L16_2.period
    if L17_2 == L7_2 then
      L17_2 = L16_2.type
      if "services" == L17_2 then
        L10_2 = L16_2
        break
      end
    end
  end
  if not L10_2 then
    L11_2 = library
    L11_2 = L11_2.GenerateMonthlyBill
    L12_2 = A0_2
    L13_2 = L7_2
    L11_2 = L11_2(L12_2, L13_2)
    L10_2 = L11_2
    L11_2 = table
    L11_2 = L11_2.insert
    L12_2 = L3_2.bills
    L13_2 = 1
    L14_2 = L10_2
    L11_2(L12_2, L13_2, L14_2)
  end
  L11_2 = json
  L11_2 = L11_2.decode
  L12_2 = L10_2.details
  if not L12_2 then
    L12_2 = "{}"
  end
  L11_2 = L11_2(L12_2)
  L12_2 = L11_2.electricityUsage
  if not L12_2 then
    L12_2 = 0
  end
  L12_2 = L12_2 + L6_2
  L11_2.electricityUsage = L12_2
  L12_2 = library
  L12_2 = L12_2.Round
  L13_2 = L11_2.electricity
  if not L13_2 then
    L13_2 = 0
  end
  L14_2 = L6_2 * L9_2
  L13_2 = L13_2 + L14_2
  L14_2 = 6
  L12_2 = L12_2(L13_2, L14_2)
  L11_2.electricity = L12_2
  L12_2 = L11_2.electricity
  if L12_2 then
    L12_2 = library
    L12_2 = L12_2.Round
    L13_2 = L11_2.electricity
    L14_2 = 3
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      goto lbl_121
    end
  end
  L12_2 = 0
  ::lbl_121::
  L13_2 = L11_2.water
  if L13_2 then
    L13_2 = library
    L13_2 = L13_2.Round
    L14_2 = L11_2.water
    L15_2 = 3
    L13_2 = L13_2(L14_2, L15_2)
    if L13_2 then
      goto lbl_132
    end
  end
  L13_2 = 0
  ::lbl_132::
  L12_2 = L12_2 + L13_2
  L13_2 = L11_2.internet
  if L13_2 then
    L13_2 = library
    L13_2 = L13_2.Round
    L14_2 = L11_2.internet
    L15_2 = 3
    L13_2 = L13_2(L14_2, L15_2)
    if L13_2 then
      goto lbl_145
    end
  end
  L13_2 = 0
  ::lbl_145::
  L12_2 = L12_2 + L13_2
  L10_2.total = L12_2
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  L10_2.details = L12_2
  L12_2 = MySQL
  L12_2 = L12_2.update
  L12_2 = L12_2.await
  L13_2 = "UPDATE houses_bills SET details = ?, total = ? WHERE id = ? AND type = ?"
  L14_2 = {}
  L15_2 = L10_2.details
  L16_2 = L10_2.total
  L17_2 = L10_2.id
  L18_2 = "services"
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L14_2[4] = L18_2
  L12_2(L13_2, L14_2)
  L12_2 = L3_2.metadata
  L12_2.lightStartTime = A1_2
  if A2_2 then
    L12_2 = MySQL
    L12_2 = L12_2.update
    L12_2 = L12_2.await
    L13_2 = "UPDATE houses SET metadata = ? WHERE id = ?"
    L14_2 = {}
    L15_2 = json
    L15_2 = L15_2.encode
    L16_2 = L3_2.metadata
    L15_2 = L15_2(L16_2)
    L16_2 = tonumber
    L17_2 = A0_2
    L16_2, L17_2, L18_2 = L16_2(L17_2)
    L14_2[1] = L15_2
    L14_2[2] = L16_2
    L14_2[3] = L17_2
    L14_2[4] = L18_2
    L12_2(L13_2, L14_2)
  end
  L12_2 = true
  return L12_2
end
L1_1.ApplyCurrentLightUsage = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = Config
  L2_2 = L2_2.UseServiceBills
  if not L2_2 then
    return
  end
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  if not A1_2 or A1_2 <= 0 then
    L3_2 = false
    return L3_2
  end
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L4_2 = os
  L4_2 = L4_2.date
  L5_2 = "%m:%Y"
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = Config
  L5_2 = L5_2.Regions
  L6_2 = L2_2.region
  L5_2 = L5_2[L6_2]
  if not L5_2 then
    L5_2 = Config
    L5_2 = L5_2.NoRegion
  end
  L6_2 = L5_2.water
  L6_2 = L6_2.rate
  L7_2 = nil
  L8_2 = ipairs
  L9_2 = L2_2.bills
  if not L9_2 then
    L9_2 = {}
  end
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = L13_2.period
    if L14_2 == L4_2 then
      L7_2 = L13_2
      break
    end
  end
  if not L7_2 then
    L8_2 = library
    L8_2 = L8_2.GenerateMonthlyBill
    L9_2 = A0_2
    L10_2 = L4_2
    L8_2 = L8_2(L9_2, L10_2)
    L7_2 = L8_2
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L2_2.bills
    L10_2 = 1
    L11_2 = L7_2
    L8_2(L9_2, L10_2, L11_2)
  end
  L8_2 = json
  L8_2 = L8_2.decode
  L9_2 = L7_2.details
  if not L9_2 then
    L9_2 = "{}"
  end
  L8_2 = L8_2(L9_2)
  L9_2 = A1_2 / 1000
  L10_2 = L8_2.waterUsage
  if not L10_2 then
    L10_2 = 0
  end
  L10_2 = L10_2 + L9_2
  L8_2.waterUsage = L10_2
  L10_2 = library
  L10_2 = L10_2.Round
  L11_2 = L8_2.water
  if not L11_2 then
    L11_2 = 0
  end
  L12_2 = L9_2 * L6_2
  L11_2 = L11_2 + L12_2
  L12_2 = 6
  L10_2 = L10_2(L11_2, L12_2)
  L8_2.water = L10_2
  L10_2 = L8_2.electricity
  if L10_2 then
    L10_2 = library
    L10_2 = L10_2.Round
    L11_2 = L8_2.electricity
    L12_2 = 3
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 then
      goto lbl_108
    end
  end
  L10_2 = 0
  ::lbl_108::
  L11_2 = L8_2.water
  if L11_2 then
    L11_2 = library
    L11_2 = L11_2.Round
    L12_2 = L8_2.water
    L13_2 = 3
    L11_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      goto lbl_119
    end
  end
  L11_2 = 0
  ::lbl_119::
  L10_2 = L10_2 + L11_2
  L11_2 = L8_2.internet
  if L11_2 then
    L11_2 = library
    L11_2 = L11_2.Round
    L12_2 = L8_2.internet
    L13_2 = 3
    L11_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      goto lbl_132
    end
  end
  L11_2 = 0
  ::lbl_132::
  L10_2 = L10_2 + L11_2
  L7_2.total = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L8_2
  L10_2 = L10_2(L11_2)
  L7_2.details = L10_2
  L10_2 = MySQL
  L10_2 = L10_2.update
  L10_2 = L10_2.await
  L11_2 = "UPDATE houses_bills SET details = ?, total = ? WHERE id = ? AND type = ?"
  L12_2 = {}
  L13_2 = L7_2.details
  L14_2 = L7_2.total
  L15_2 = L7_2.id
  L16_2 = "services"
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L12_2[4] = L16_2
  L10_2(L11_2, L12_2)
  L10_2 = true
  return L10_2
end
L1_1.ApplyWaterUsage = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = GetProperty
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2
  if L4_2 then
    L4_2 = L4_2.owner
  end
  L4_2 = L4_2 == A1_2
  if L4_2 then
    L5_2 = true
    return L5_2
  end
  L5_2 = L3_2
  if L5_2 then
    L5_2 = L5_2.permissions
  end
  if L5_2 then
    L5_2 = L5_2[A1_2]
  end
  if L5_2 then
    L6_2 = L5_2[A2_2]
    if L6_2 then
      L6_2 = true
      return L6_2
    end
  end
  L6_2 = false
  return L6_2
end
L1_1.HasPermissions = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  if L3_2 then
    L3_2 = L3_2.owner
  end
  L3_2 = L3_2 == A1_2
  if L3_2 then
    L4_2 = true
    return L4_2
  end
  L4_2 = L2_2
  if L4_2 then
    L4_2 = L4_2.permissions
  end
  if L4_2 then
    L4_2 = L4_2[A1_2]
  end
  if L4_2 then
    L5_2 = true
    return L5_2
  end
  L5_2 = false
  return L5_2
end
L1_1.HasAnyPermission = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.Regions
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.zone
    if L7_2 then
      L7_2 = isPointInPolygon
      L8_2 = A0_2
      L9_2 = L6_2.zone
      L7_2 = L7_2(L8_2, L9_2)
      if L7_2 then
        return L5_2
      end
    end
  end
  L1_2 = nil
  return L1_2
end
L1_1.GetCurrentRegion = L2_1
library = L1_1
L1_1 = exports
L2_1 = "HasKeys"
L3_1 = library
L3_1 = L3_1.HasKeys
L1_1(L2_1, L3_1)
L1_1 = exports
L2_1 = "GenerateKeySerialNumber"
L3_1 = library
L3_1 = L3_1.GenerateKeySerialNumber
L1_1(L2_1, L3_1)
L1_1 = exports
L2_1 = "HasPermissions"
L3_1 = library
L3_1 = L3_1.HasPermissions
L1_1(L2_1, L3_1)
L1_1 = exports
L2_1 = "HasAnyPermission"
L3_1 = library
L3_1 = L3_1.HasAnyPermission
L1_1(L2_1, L3_1)
