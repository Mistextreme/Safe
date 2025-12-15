local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:fetchData"
L5_1(L6_1)
L5_1 = AddEventHandler
L6_1 = "vms_housing:sv:fetchData"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = source
  L1_2 = SV
  L1_2 = L1_2.GetPlayer
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = 2500
    L2_2(L3_2)
    L2_2 = SV
    L2_2 = L2_2.GetPlayer
    L3_2 = L0_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  L2_2 = TriggerClientEvent
  L3_2 = "vms_housing:cl:loadProperties"
  L4_2 = L0_2
  L5_2 = json
  L5_2 = L5_2.encode
  L6_2 = Properties
  L5_2, L6_2 = L5_2(L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = TriggerClientEvent
  L3_2 = "vms_housing:cl:loadFurniture"
  L4_2 = L0_2
  L5_2 = json
  L5_2 = L5_2.encode
  L6_2 = Furniture
  L5_2, L6_2 = L5_2(L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = TriggerClientEvent
  L3_2 = "vms_housing:cl:fetchedData"
  L4_2 = L0_2
  L5_2 = Webhooks
  L5_2 = L5_2.OBJECTS_PHOTOS_TOOL
  L6_2 = Webhooks
  L6_2 = L6_2.MARKETPLACE_PHOTOS
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L5_1(L6_1, L7_1)
L5_1 = AddEventHandler
L6_1 = Config
L6_1 = L6_1.PlayerLogoutServer
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = Player
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = Player
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L1_2 = L1_2.state
    L1_2 = L1_2.currentProperty
  end
  if L1_2 then
    L2_2 = TriggerClientEvent
    L3_2 = "vms_housing:cl:playerDropped"
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
    L2_2 = SetPlayerRoutingBucket
    L3_2 = A0_2
    L4_2 = 0
    L2_2(L3_2, L4_2)
  end
  L2_2 = Properties
  L2_2 = L2_2[L1_2]
  if L2_2 then
    L2_2 = Properties
    L2_2 = L2_2[L1_2]
    L2_2 = L2_2.playersInside
    if L2_2 then
      L2_2 = 1
      L3_2 = Properties
      L3_2 = L3_2[L1_2]
      L3_2 = L3_2.playersInside
      L3_2 = #L3_2
      L4_2 = 1
      for L5_2 = L2_2, L3_2, L4_2 do
        L6_2 = Properties
        L6_2 = L6_2[L1_2]
        L6_2 = L6_2.playersInside
        L6_2 = L6_2[L5_2]
        if L6_2 == A0_2 then
          L6_2 = table
          L6_2 = L6_2.remove
          L7_2 = Properties
          L7_2 = L7_2[L1_2]
          L7_2 = L7_2.playersInside
          L8_2 = L5_2
          L6_2(L7_2, L8_2)
          break
        end
      end
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterCommand
L6_1 = "TebexProperty"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if 0 ~= A0_2 then
    return
  end
  L3_2 = A1_2[1]
  if L3_2 then
    L3_2 = A1_2[2]
    if L3_2 then
      goto lbl_14
    end
  end
  L3_2 = print
  L4_2 = "^1[TEBEX] ^7Missing arguments."
  do return L3_2(L4_2) end
  ::lbl_14::
  L3_2 = tonumber
  L4_2 = A1_2[1]
  L3_2 = L3_2(L4_2)
  L4_2 = tostring
  L5_2 = A1_2[2]
  L4_2 = L4_2(L5_2)
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L6_2 = library
    L6_2 = L6_2.Debug
    L7_2 = "^1[TEBEX] ^7The player making the purchase is offline."
    return L6_2(L7_2)
  end
  L6_2 = SV
  L6_2 = L6_2.GetIdentifier
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = GetProperty
  L8_2 = L4_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L8_2 = library
    L8_2 = L8_2.Debug
    L9_2 = "^1[TEBEX] ^7Property %s not found for SID %s"
    L10_2 = L9_2
    L9_2 = L9_2.format
    L11_2 = L4_2
    L12_2 = L3_2
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2, L11_2, L12_2)
    return L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  L8_2 = L7_2.owner
  if L8_2 then
    L8_2 = library
    L8_2 = L8_2.Debug
    L9_2 = "^1[TEBEX] ^7Property %s has owner (SID %s)"
    L10_2 = L9_2
    L9_2 = L9_2.format
    L11_2 = L4_2
    L12_2 = L3_2
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2, L11_2, L12_2)
    return L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  L8_2 = library
  L8_2 = L8_2.Debug
  L9_2 = "^2[TEBEX] ^7Successfully added Property %s to Owner %s"
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = L4_2
  L12_2 = L3_2
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2, L11_2, L12_2)
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L8_2 = Config
  L8_2 = L8_2.CityHallTaxes
  if L8_2 then
    L8_2 = L8_2.PropertyCadastralTax
  end
  if L8_2 then
    L8_2 = L8_2.Enabled
  end
  if L8_2 then
    L8_2 = L7_2.metadata
    L9_2 = os
    L9_2 = L9_2.date
    L10_2 = "%m:%Y"
    L11_2 = os
    L11_2 = L11_2.time
    L11_2, L12_2, L13_2, L14_2, L15_2 = L11_2()
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L8_2.lastCadastralPeriod = L9_2
    updateMetadata = true
  end
  L7_2.owner = L6_2
  L8_2 = SV
  L8_2 = L8_2.GetCharacterName
  L9_2 = L5_2
  L8_2 = L8_2(L9_2)
  L7_2.owner_name = L8_2
  L8_2 = L7_2.sale
  L8_2.active = false
  L8_2 = L7_2.rental
  L8_2.active = false
  L8_2 = library
  L8_2 = L8_2.GetOrCreateBills
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  L7_2.bills = L8_2
  L7_2.unpaidBills = 0
  L8_2 = "UPDATE houses SET owner = @owner, owner_name = @owner_name, sale = @sale, rental = @rental"
  L9_2 = updateMetadata
  if L9_2 then
    L9_2 = L8_2
    L10_2 = ", metadata = @metadata"
    L9_2 = L9_2 .. L10_2
    L8_2 = L9_2
  end
  L9_2 = L8_2
  L10_2 = " WHERE id = @id"
  L9_2 = L9_2 .. L10_2
  L8_2 = L9_2
  L9_2 = MySQL
  L9_2 = L9_2.update
  L9_2 = L9_2.await
  L10_2 = L8_2
  L11_2 = {}
  L12_2 = L7_2.owner
  L11_2["@owner"] = L12_2
  L12_2 = L7_2.owner_name
  L11_2["@owner_name"] = L12_2
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L7_2.metadata
  L12_2 = L12_2(L13_2)
  L11_2["@metadata"] = L12_2
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L7_2.sale
  L12_2 = L12_2(L13_2)
  L11_2["@sale"] = L12_2
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L7_2.rental
  L12_2 = L12_2(L13_2)
  L11_2["@rental"] = L12_2
  L12_2 = tonumber
  L13_2 = L4_2
  L12_2 = L12_2(L13_2)
  L11_2["@id"] = L12_2
  L9_2(L10_2, L11_2)
  L9_2 = TriggerClientEvent
  L10_2 = "vms_housing:cl:updateProperty"
  L11_2 = -1
  L12_2 = "newOwner"
  L13_2 = L4_2
  L14_2 = {}
  L15_2 = L7_2.owner
  L14_2.owner = L15_2
  L15_2 = L7_2.owner_name
  L14_2.owner_name = L15_2
  L15_2 = L7_2.sale
  L14_2.sale = L15_2
  L15_2 = L7_2.rental
  L14_2.rental = L15_2
  L15_2 = L7_2.bills
  L14_2.bills = L15_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
end
L8_1 = false
L5_1(L6_1, L7_1, L8_1)
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = Config
  L1_2 = L1_2.DeliveryType
  if 2 ~= L1_2 then
    L1_2 = Config
    L1_2 = L1_2.DeliveryType
    if 3 ~= L1_2 then
      goto lbl_120
    end
  end
  L1_2 = os
  L1_2 = L1_2.time
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = 0
  L4_2 = PendingDeliveries
  L4_2 = #L4_2
  L5_2 = 1
  L6_2 = -1
  for L7_2 = L4_2, L5_2, L6_2 do
    if A0_2 <= L3_2 then
      break
    end
    L8_2 = PendingDeliveries
    L8_2 = L8_2[L7_2]
    L9_2 = L8_2.deliveryTime
    if L1_2 >= L9_2 then
      L9_2 = tostring
      L10_2 = L8_2.propertyId
      L9_2 = L9_2(L10_2)
      L10_2 = Properties
      L10_2 = L10_2[L9_2]
      if L10_2 then
        L11_2 = L10_2.furniture
        if L11_2 then
          L11_2 = nil
          L12_2 = pairs
          L13_2 = L10_2.furniture
          L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
          for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
            L18_2 = L17_2.id
            L19_2 = L8_2.furnitureId
            if L18_2 == L19_2 then
              L11_2 = L16_2
              break
            end
          end
          if L11_2 then
            L12_2 = L10_2.furniture
            L12_2 = L12_2[L11_2]
            L13_2 = L12_2.metadata
            L13_2.deliveryTime = nil
            L13_2 = Config
            L13_2 = L13_2.DeliveryType
            if 3 == L13_2 then
              L13_2 = L10_2.metadata
              if L13_2 then
                L13_2 = L10_2.metadata
                L13_2 = L13_2.deliveryType
                if L13_2 then
                  L13_2 = L10_2.metadata
                  L13_2 = L13_2.delivery
                  if L13_2 then
                    L13_2 = L12_2.metadata
                    L13_2.delivered = true
                  end
                end
              end
            end
            L13_2 = MySQL
            L13_2 = L13_2.update
            L14_2 = "UPDATE `houses_furniture` SET `metadata` = ? WHERE `id` = ? AND `house_id` = ?"
            L15_2 = {}
            L16_2 = json
            L16_2 = L16_2.encode
            L17_2 = L12_2.metadata
            L16_2 = L16_2(L17_2)
            L17_2 = L8_2.furnitureId
            L18_2 = tonumber
            L19_2 = L8_2.propertyId
            L18_2, L19_2 = L18_2(L19_2)
            L15_2[1] = L16_2
            L15_2[2] = L17_2
            L15_2[3] = L18_2
            L15_2[4] = L19_2
            L13_2(L14_2, L15_2)
            L13_2 = L2_2[L9_2]
            if not L13_2 then
              L13_2 = {}
              L2_2[L9_2] = L13_2
            end
            L13_2 = table
            L13_2 = L13_2.insert
            L14_2 = L2_2[L9_2]
            L15_2 = L8_2.furnitureId
            L13_2(L14_2, L15_2)
            L13_2 = table
            L13_2 = L13_2.remove
            L14_2 = PendingDeliveries
            L15_2 = L7_2
            L13_2(L14_2, L15_2)
            L3_2 = L3_2 + 1
          end
        end
      end
    end
  end
  L4_2 = next
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = TriggerClientEvent
    L5_2 = "vms_housing:cl:updateProperty"
    L6_2 = -1
    L7_2 = "deliveredFurniture"
    L8_2 = nil
    L9_2 = L2_2
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  end
  ::lbl_120::
end
ProcessPendingDeliveries = L5_1
function L5_1(A0_2)
  local L1_2, L2_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = tostring
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = Properties
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = nil
    return L2_2
  end
  return L1_2
end
GetProperty = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = {}
  L2_2 = nil
  L3_2 = tonumber
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = SV
    L3_2 = L3_2.GetPlayer
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L4_2 = nil
      return L4_2
    end
    L4_2 = SV
    L4_2 = L4_2.GetIdentifier
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L5_2 = nil
      return L5_2
    end
    L2_2 = L4_2
  else
    L2_2 = A0_2
  end
  if L2_2 then
    L3_2 = pairs
    L4_2 = Properties
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.owner
      if L9_2 ~= L2_2 then
        L9_2 = L8_2.renter
        if L9_2 ~= L2_2 then
          goto lbl_45
        end
      end
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = L1_2
      L11_2 = L8_2
      L9_2(L10_2, L11_2)
      ::lbl_45::
    end
  end
  return L1_2
end
GetPlayerProperties = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Player
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = Properties
  L3_2 = tostring
  L4_2 = L1_2.state
  L4_2 = L4_2.currentProperty
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L1_2.state
  L2_2 = L2_2.currentProperty
  return L2_2
end
GetPlayerCurrentProperty = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.HousingUpgrades
  L1_2 = L1_2.furniture_limit
  if not L1_2 then
    L2_2 = Config
    L2_2 = L2_2.FurnitureLimit
    return L2_2
  end
  L2_2 = L1_2.metadata
  L2_2 = A0_2[L2_2]
  if not L2_2 then
    L3_2 = Config
    L3_2 = L3_2.FurnitureLimit
    return L3_2
  end
  L3_2 = Config
  L3_2 = L3_2.HousingUpgrades
  L3_2 = L3_2.furniture_limit
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.HousingUpgrades
    L3_2 = L3_2.furniture_limit
    if L3_2 then
      L3_2 = L3_2.levels
    end
    if L3_2 then
      L3_2 = L3_2[L2_2]
    end
    if L3_2 then
      L3_2 = Config
      L3_2 = L3_2.HousingUpgrades
      L3_2 = L3_2.furniture_limit
      L3_2 = L3_2.levels
      L3_2 = L3_2[L2_2]
      L3_2 = L3_2.limit
      return L3_2
    end
  end
end
GetFurnitureLimit = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = 1
  L3_2 = Properties
  L3_2 = L3_2[A1_2]
  L3_2 = L3_2.playersInside
  L3_2 = #L3_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = Properties
    L6_2 = L6_2[A1_2]
    L6_2 = L6_2.playersInside
    L6_2 = L6_2[L5_2]
    if L6_2 == A0_2 then
      L6_2 = true
      return L6_2
    end
  end
  L2_2 = false
  return L2_2
end
IsPlayerInProperty = L5_1
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = Config
  L3_2 = L3_2.PropertyRaids
  if L3_2 then
    L4_2 = L3_2.Enable
    if L4_2 then
      goto lbl_11
    end
  end
  L4_2 = false
  L5_2 = nil
  do return L4_2, L5_2 end
  ::lbl_11::
  L4_2 = L3_2.AntiBurglaryDoors
  if L4_2 then
    L4_2 = L3_2.AntiBurglaryDoors
    L4_2 = L4_2.AllowRaid
    if not L4_2 then
      L4_2 = A2_2.metadata
      if L4_2 then
        L4_2 = L4_2.upgrades
      end
      if L4_2 then
        L4_2 = L4_2.antiBurglaryDoors
      end
      if L4_2 then
        L4_2 = false
        L5_2 = "anti_burglary_doors"
        return L4_2, L5_2
      end
    end
  end
  L4_2 = L3_2.Jobs
  if L4_2 then
    L4_2 = false
    L5_2 = SV
    L5_2 = L5_2.GetPlayerJob
    L6_2 = A1_2
    L7_2 = "name"
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = type
    L7_2 = L3_2.Jobs
    L6_2 = L6_2(L7_2)
    if "table" == L6_2 then
      L6_2 = ipairs
      L7_2 = L3_2.Jobs
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
        if L11_2 == L5_2 then
          L4_2 = true
          break
        end
      end
    else
      L6_2 = L3_2.Jobs
      if L6_2 == L5_2 then
        L4_2 = true
      end
    end
    if not L4_2 then
      L6_2 = false
      L7_2 = "missing_job"
      return L6_2, L7_2
    end
  end
  L4_2 = L3_2.Item
  if L4_2 then
    L4_2 = L3_2.Item
    L4_2 = L4_2.Required
    if L4_2 then
      L4_2 = L3_2.Item
      L4_2 = L4_2.Name
      if L4_2 then
        L4_2 = SV
        L4_2 = L4_2.GetItemCount
        L5_2 = A1_2
        L6_2 = L3_2.Item
        L6_2 = L6_2.Name
        L4_2 = L4_2(L5_2, L6_2)
        L5_2 = L3_2.Item
        L5_2 = L5_2.Count
        if not L5_2 then
          L5_2 = 1
        end
        if L4_2 < L5_2 then
          L5_2 = false
          L6_2 = "missing_item"
          return L5_2, L6_2
        end
      end
    end
  end
  L4_2 = true
  return L4_2
end
IsAllowedToRaid = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = 0
  L3_2 = #A1_2
  L4_2 = A0_2.x
  L5_2 = A0_2.y
  L6_2 = 1
  L7_2 = L3_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L9_2 % L3_2
    L10_2 = L10_2 + 1
    L11_2 = A1_2[L9_2]
    L12_2 = A1_2[L10_2]
    L13_2 = L11_2.y
    L13_2 = L5_2 < L13_2
    L14_2 = L12_2.y
    L14_2 = L5_2 < L14_2
    if L13_2 ~= L14_2 then
      L13_2 = L12_2.x
      L14_2 = L11_2.x
      L13_2 = L13_2 - L14_2
      L14_2 = L11_2.y
      L14_2 = L5_2 - L14_2
      L13_2 = L13_2 * L14_2
      L14_2 = L12_2.y
      L15_2 = L11_2.y
      L14_2 = L14_2 - L15_2
      L13_2 = L13_2 / L14_2
      L14_2 = L11_2.x
      L13_2 = L13_2 + L14_2
      if L4_2 < L13_2 then
        L2_2 = L2_2 + 1
      end
    end
  end
  L6_2 = L2_2 % 2
  L6_2 = 1 == L6_2
  return L6_2
end
isPointInPolygon = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = GetProperty
  L2_2 = Config
  L2_2 = L2_2.StarterApartments
  L2_2 = L2_2.Object
  L1_2 = L1_2(L2_2)
  L2_2 = SV
  L2_2 = L2_2.GetPlayerByIdentifier
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = "Unknown"
  if L2_2 then
    L4_2 = SV
    L4_2 = L4_2.GetCharacterName
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
  end
  L4_2 = {}
  L5_2 = Config
  L5_2 = L5_2.StarterApartments
  L5_2 = L5_2.Type
  L4_2.type = L5_2
  L5_2 = Config
  L5_2 = L5_2.StarterApartments
  L5_2 = L5_2.Object
  L4_2.object_id = L5_2
  L5_2 = L1_2.region
  L4_2.region = L5_2
  L5_2 = L1_2.address
  L4_2.address = L5_2
  L4_2.owner = A0_2
  L4_2.owner_name = L3_2
  L5_2 = {}
  L5_2.locked = true
  L5_2.lightState = false
  L6_2 = Config
  L6_2 = L6_2.StarterApartments
  L6_2 = L6_2.AllowFurnitureInside
  L5_2.allowFurnitureInside = L6_2
  L6_2 = {}
  L5_2.upgrades = L6_2
  L4_2.metadata = L5_2
  L5_2 = {}
  L5_2.defaultActive = false
  L6_2 = Config
  L6_2 = L6_2.StarterApartments
  L6_2 = L6_2.DefaultRentPrice
  L5_2.defaultPrice = L6_2
  L5_2.active = false
  L6_2 = Config
  L6_2 = L6_2.StarterApartments
  L6_2 = L6_2.DefaultRentPrice
  L5_2.price = L6_2
  L4_2.rental = L5_2
  L5_2 = {}
  L5_2.defaultActive = false
  L6_2 = Config
  L6_2 = L6_2.StarterApartments
  L6_2 = L6_2.DefaultPurchasePrice
  L5_2.defaultPrice = L6_2
  L5_2.active = false
  L6_2 = Config
  L6_2 = L6_2.StarterApartments
  L6_2 = L6_2.DefaultPurchasePrice
  L5_2.price = L6_2
  L4_2.sale = L5_2
  L4_2.creator = "SYSTEM"
  L5_2 = Config
  L5_2 = L5_2.StarterApartments
  L5_2 = L5_2.Delivery
  if L5_2 then
    L5_2 = Config
    L5_2 = L5_2.StarterApartments
    L5_2 = L5_2.Delivery
    L5_2 = L5_2.Enabled
    if L5_2 then
      L5_2 = L4_2.metadata
      L5_2.deliveryType = "inside"
      L5_2 = L4_2.metadata
      L6_2 = {}
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Delivery
      L7_2 = L7_2.Coords
      L7_2 = L7_2.x
      L6_2.x = L7_2
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Delivery
      L7_2 = L7_2.Coords
      L7_2 = L7_2.y
      L6_2.y = L7_2
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Delivery
      L7_2 = L7_2.Coords
      L7_2 = L7_2.z
      L6_2.z = L7_2
      L5_2.delivery = L6_2
    end
  end
  L5_2 = Config
  L5_2 = L5_2.StarterApartments
  L5_2 = L5_2.Storage
  if L5_2 then
    L5_2 = Config
    L5_2 = L5_2.StarterApartments
    L5_2 = L5_2.Storage
    L5_2 = L5_2.Enabled
    if L5_2 then
      L5_2 = L4_2.metadata
      L6_2 = {}
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Storage
      L7_2 = L7_2.Coords
      L7_2 = L7_2.x
      L6_2.x = L7_2
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Storage
      L7_2 = L7_2.Coords
      L7_2 = L7_2.y
      L6_2.y = L7_2
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Storage
      L7_2 = L7_2.Coords
      L7_2 = L7_2.z
      L6_2.z = L7_2
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Storage
      L7_2 = L7_2.Slots
      if not L7_2 then
        L7_2 = 20
      end
      L6_2.slots = L7_2
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Storage
      L7_2 = L7_2.Weight
      if not L7_2 then
        L7_2 = 30000
      end
      L6_2.weight = L7_2
      L5_2.storage = L6_2
    end
  end
  L5_2 = Config
  L5_2 = L5_2.StarterApartments
  L5_2 = L5_2.Wardrobe
  if L5_2 then
    L5_2 = Config
    L5_2 = L5_2.StarterApartments
    L5_2 = L5_2.Wardrobe
    L5_2 = L5_2.Enabled
    if L5_2 then
      L5_2 = L4_2.metadata
      L6_2 = {}
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Wardrobe
      L7_2 = L7_2.Coords
      L7_2 = L7_2.x
      L6_2.x = L7_2
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Wardrobe
      L7_2 = L7_2.Coords
      L7_2 = L7_2.y
      L6_2.y = L7_2
      L7_2 = Config
      L7_2 = L7_2.StarterApartments
      L7_2 = L7_2.Wardrobe
      L7_2 = L7_2.Coords
      L7_2 = L7_2.z
      L6_2.z = L7_2
      L5_2.wardrobe = L6_2
    end
  end
  L5_2 = Config
  L5_2 = L5_2.StarterApartments
  L5_2 = L5_2.Type
  if "shell" == L5_2 then
    L5_2 = L4_2.metadata
    L6_2 = Config
    L6_2 = L6_2.StarterApartments
    L6_2 = L6_2.Shell
    L5_2.shell = L6_2
  else
    L5_2 = Config
    L5_2 = L5_2.StarterApartments
    L5_2 = L5_2.Type
    if "ipl" == L5_2 then
      L5_2 = L4_2.metadata
      L6_2 = Config
      L6_2 = L6_2.StarterApartments
      L6_2 = L6_2.Ipl
      L5_2.ipl = L6_2
      L5_2 = L4_2.metadata
      L6_2 = Config
      L6_2 = L6_2.StarterApartments
      L6_2 = L6_2.DefaultThemeIpl
      L5_2.iplTheme = L6_2
      L5_2 = L4_2.metadata
      L6_2 = Config
      L6_2 = L6_2.StarterApartments
      L6_2 = L6_2.AllowChangeTheme
      L5_2.allowChangeThemePurchased = L6_2
    end
  end
  L5_2 = MySQL
  L5_2 = L5_2.insert
  L5_2 = L5_2.await
  L6_2 = "INSERT INTO `houses` (`type`, `object_id`, `owner`, `owner_name`, `region`, `address`, `metadata`, `sale`, `rental`, `description`, `creator`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
  L7_2 = {}
  L8_2 = L4_2.type
  L9_2 = L4_2.object_id
  L10_2 = L4_2.owner
  L11_2 = L4_2.owner_name
  L12_2 = L4_2.region
  L13_2 = L4_2.address
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = L4_2.metadata
  L14_2 = L14_2(L15_2)
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L4_2.sale
  L15_2 = L15_2(L16_2)
  L16_2 = json
  L16_2 = L16_2.encode
  L17_2 = L4_2.rental
  L16_2 = L16_2(L17_2)
  L17_2 = ""
  L18_2 = L4_2.creator
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  L7_2[6] = L13_2
  L7_2[7] = L14_2
  L7_2[8] = L15_2
  L7_2[9] = L16_2
  L7_2[10] = L17_2
  L7_2[11] = L18_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L4_2.metadata
  if L6_2 then
    L6_2 = L4_2.metadata
    L6_2 = L6_2.storage
    if L6_2 then
      L6_2 = L4_2.metadata
      L6_2 = L6_2.storage
      L6_2 = L6_2.x
      if L6_2 then
        L6_2 = library
        L6_2 = L6_2.RegisterStorage
        L7_2 = {}
        L8_2 = "house_storage-"
        L9_2 = L5_2
        L8_2 = L8_2 .. L9_2
        L7_2.id = L8_2
        L8_2 = tonumber
        L9_2 = L4_2.metadata
        L9_2 = L9_2.storage
        L9_2 = L9_2.slots
        L8_2 = L8_2(L9_2)
        L7_2.slots = L8_2
        L8_2 = tonumber
        L9_2 = L4_2.metadata
        L9_2 = L9_2.storage
        L9_2 = L9_2.weight
        L8_2 = L8_2(L9_2)
        L7_2.weight = L8_2
        L6_2(L7_2)
      end
    end
  end
  L6_2 = Properties
  L7_2 = tostring
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  L8_2 = {}
  L8_2.id = L5_2
  L9_2 = L4_2.object_id
  L8_2.object_id = L9_2
  L9_2 = L4_2.owner
  L8_2.owner = L9_2
  L9_2 = L4_2.owner_name
  L8_2.owner_name = L9_2
  L9_2 = L4_2.type
  L8_2.type = L9_2
  L9_2 = Config
  L9_2 = L9_2.StarterApartments
  L9_2 = L9_2.Name
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = L5_2
  L9_2 = L9_2(L10_2, L11_2)
  L8_2.name = L9_2
  L9_2 = L4_2.region
  L8_2.region = L9_2
  L9_2 = L4_2.address
  L8_2.address = L9_2
  L9_2 = {}
  L8_2.furniture = L9_2
  L9_2 = library
  L9_2 = L9_2.GetOrCreateBills
  L10_2 = L5_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = {}
  end
  L8_2.bills = L9_2
  L8_2.unpaidBills = 0
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = {}
  L9_2 = L9_2(L10_2)
  L8_2.keys = L9_2
  L9_2 = {}
  L8_2.permissions = L9_2
  L9_2 = L4_2.metadata
  L8_2.metadata = L9_2
  L9_2 = L4_2.sale
  L8_2.sale = L9_2
  L9_2 = L4_2.rental
  L8_2.rental = L9_2
  L9_2 = L4_2.description
  L8_2.description = L9_2
  L8_2.last_enter = 0
  L9_2 = L4_2.creator
  L8_2.creator = L9_2
  L6_2[L7_2] = L8_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "UPDATE `houses` SET `name` = ? WHERE `id` = ?"
  L8_2 = {}
  L9_2 = Properties
  L10_2 = tostring
  L11_2 = L5_2
  L10_2 = L10_2(L11_2)
  L9_2 = L9_2[L10_2]
  L9_2 = L9_2.name
  L10_2 = tonumber
  L11_2 = L5_2
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L10_2(L11_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L8_2[5] = L13_2
  L8_2[6] = L14_2
  L8_2[7] = L15_2
  L8_2[8] = L16_2
  L8_2[9] = L17_2
  L8_2[10] = L18_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "vms_housing:cl:createdHouse"
  L8_2 = -1
  L9_2 = tostring
  L10_2 = L5_2
  L9_2 = L9_2(L10_2)
  L10_2 = Properties
  L11_2 = tostring
  L12_2 = L5_2
  L11_2 = L11_2(L12_2)
  L10_2 = L10_2[L11_2]
  L6_2(L7_2, L8_2, L9_2, L10_2)
end
AddStarterApartment = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L2_2 = "DELETE FROM `houses` WHERE id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = Properties
    L2_3 = tostring
    L3_3 = A0_2
    L2_3 = L2_3(L3_3)
    L1_3[L2_3] = nil
    L1_3 = TriggerClientEvent
    L2_3 = "vms_housing:cl:removedHouse"
    L3_3 = -1
    L4_3 = tostring
    L5_3 = A0_2
    L4_3, L5_3 = L4_3(L5_3)
    L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  L1_2(L2_2, L3_2, L4_2)
end
DeleteProperty = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L4_1
  L2_2[A0_2] = true
  L2_2 = TriggerClientEvent
  L3_2 = "vms_housing:cl:enterHouse"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
EnterProperty = L5_1
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = os
  L0_2 = L0_2.time
  L0_2 = L0_2()
  function L1_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    function L1_3(A0_4)
      local L1_4, L2_4, L3_4
      L1_4 = os
      L1_4 = L1_4.date
      L2_4 = "!*t"
      L3_4 = A0_4
      L1_4 = L1_4(L2_4, L3_4)
      L2_4 = L1_4.wday
      L2_4 = L2_4 + 5
      L2_4 = L2_4 % 7
      L2_4 = L2_4 + 1
      return L2_4
    end
    function L2_3(A0_4)
      local L1_4, L2_4
      L1_4 = L1_3
      L2_4 = A0_4
      L1_4 = L1_4(L2_4)
      L2_4 = 4
      L1_4 = L2_4 - L1_4
      L1_4 = L1_4 * 86400
      L1_4 = A0_4 + L1_4
      return L1_4
    end
    L3_3 = L2_3
    L4_3 = A0_3
    L3_3 = L3_3(L4_3)
    L4_3 = os
    L4_3 = L4_3.date
    L5_3 = "!*t"
    L6_3 = L3_3
    L4_3 = L4_3(L5_3, L6_3)
    L4_3 = L4_3.year
    L5_3 = os
    L5_3 = L5_3.time
    L6_3 = {}
    L6_3.year = L4_3
    L6_3.month = 1
    L6_3.day = 1
    L6_3.hour = 0
    L5_3 = L5_3(L6_3)
    L6_3 = L2_3
    L7_3 = L5_3
    L6_3 = L6_3(L7_3)
    L7_3 = math
    L7_3 = L7_3.floor
    L8_3 = L3_3 - L6_3
    L8_3 = L8_3 / 604800
    L8_3 = 1 + L8_3
    L7_3 = L7_3(L8_3)
    L8_3 = L7_3
    L9_3 = L4_3
    return L8_3, L9_3
  end
  L2_2 = L1_2
  L3_2 = L0_2
  L2_2, L3_2 = L2_2(L3_2)
  L4_2 = string
  L4_2 = L4_2.format
  L5_2 = "W%d:%d"
  L6_2 = L2_2
  L7_2 = L3_2
  return L4_2(L5_2, L6_2, L7_2)
end
GetWeekPeriod = L5_1
L5_1 = exports
L6_1 = "GetProperty"
L7_1 = GetProperty
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "GetPlayerProperties"
L7_1 = GetPlayerProperties
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "GetPlayerCurrentProperty"
L7_1 = GetPlayerCurrentProperty
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "IsPlayerInProperty"
L7_1 = IsPlayerInProperty
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "AddStarterApartment"
L7_1 = AddStarterApartment
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "DeleteProperty"
L7_1 = DeleteProperty
L5_1(L6_1, L7_1)
L5_1 = exports
L6_1 = "EnterProperty"
L7_1 = EnterProperty
L5_1(L6_1, L7_1)
L5_1 = Citizen
L5_1 = L5_1.CreateThread
function L6_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.UseKeysOnItem
  if L0_2 then
    L0_2 = SV
    L0_2 = L0_2.RegisterUsableItem
    L1_2 = "house_key"
    function L2_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
      L3_3 = A2_3.metadata
      L3_3 = L3_3.propertyId
      if not L3_3 then
        return
      end
      L3_3 = A0_3
      L4_3 = SV
      L4_3 = L4_3.GetPlayer
      L5_3 = L3_3
      L4_3 = L4_3(L5_3)
      L5_3 = SV
      L5_3 = L5_3.GetIdentifier
      L6_3 = L4_3
      L5_3 = L5_3(L6_3)
      L6_3 = library
      L6_3 = L6_3.HasKeys
      L7_3 = L3_3
      L8_3 = L5_3
      L9_3 = A2_3.metadata
      L9_3 = L9_3.propertyId
      L10_3 = A2_3.metadata
      L10_3 = L10_3.keySerialNumber
      L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3)
      if L6_3 then
        L6_3 = TriggerClientEvent
        L7_3 = "vms_housing:cl:usedKeyItem"
        L8_3 = L3_3
        L9_3 = A2_3.metadata
        L9_3 = L9_3.propertyId
        L10_3 = A2_3.metadata
        L10_3 = L10_3.keySerialNumber
        L6_3(L7_3, L8_3, L9_3, L10_3)
      end
    end
    L0_2(L1_2, L2_2)
  end
end
L5_1(L6_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:openManageMenu"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = A0_2
  L4_2 = GetProperty
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  L5_2 = library
  L5_2 = L5_2.HandleLightStateMonthOverlap
  L6_2 = A2_2
  L5_2(L6_2)
  L5_2 = library
  L5_2 = L5_2.ApplyCurrentLightUsage
  L6_2 = A2_2
  L7_2 = os
  L7_2 = L7_2.time
  L7_2 = L7_2()
  L8_2 = true
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = library
  L5_2 = L5_2.GetOrCreateBills
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  L6_2 = A1_2
  L7_2 = {}
  L7_2.bills = L5_2
  L8_2 = L4_2.unpaidRentBills
  L7_2.unpaidRentBills = L8_2
  L8_2 = L4_2.unpaidBills
  L7_2.unpaidBills = L8_2
  L6_2(L7_2)
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:canEnterHouse"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = SV
  L5_2 = L5_2.CanEnterHouse
  L6_2 = L2_2
  L7_2 = L3_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = A1_2
  L7_2 = L5_2
  L6_2(L7_2)
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:canExitHouse"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = SV
  L5_2 = L5_2.CanExitHouse
  L6_2 = L2_2
  L7_2 = L3_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = A1_2
  L7_2 = L5_2
  L6_2(L7_2)
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:buyTheme"
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L5_2 = A0_2
  L6_2 = SV
  L6_2 = L6_2.GetPlayer
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = SV
  L7_2 = L7_2.GetIdentifier
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  if not A3_2 then
    L8_2 = A1_2
    L9_2 = false
    return L8_2(L9_2)
  end
  L8_2 = GetProperty
  L9_2 = A2_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L9_2 = A1_2
    L10_2 = false
    return L9_2(L10_2)
  end
  L9_2 = IsPlayerInProperty
  L10_2 = L5_2
  L11_2 = A2_2
  L9_2 = L9_2(L10_2, L11_2)
  if not L9_2 then
    L9_2 = A1_2
    L10_2 = false
    return L9_2(L10_2)
  end
  L9_2 = L8_2.owner
  if L9_2 then
    L9_2 = L8_2.owner
    L9_2 = L9_2 == L7_2
  end
  L10_2 = L8_2.renter
  if L10_2 then
    L10_2 = L8_2.renter
    L10_2 = L10_2 == L7_2
  end
  L11_2 = library
  L11_2 = L11_2.HasKeys
  L12_2 = L5_2
  L13_2 = L7_2
  L14_2 = A2_2
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  if not L9_2 and not L10_2 and not L11_2 then
    L12_2 = library
    L12_2 = L12_2.Notification
    L13_2 = L5_2
    L14_2 = TRANSLATE
    L15_2 = "notify.not_allowed"
    L14_2 = L14_2(L15_2)
    L15_2 = 5500
    L16_2 = "error"
    L12_2(L13_2, L14_2, L15_2, L16_2)
    L12_2 = A1_2
    L13_2 = false
    return L12_2(L13_2)
  end
  L12_2 = L8_2.metadata
  L12_2 = L12_2.ipl
  if L12_2 then
    L12_2 = AvailableIPLS
    L13_2 = L8_2.metadata
    L13_2 = L13_2.ipl
    L12_2 = L12_2[L13_2]
    L12_2 = L12_2.settings
    L12_2 = L12_2.Themes
    L12_2 = L12_2[A3_2]
    if L12_2 then
      L12_2 = SV
      L12_2 = L12_2.GetMoney
      L13_2 = L6_2
      L14_2 = A4_2
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L13_2 = tonumber
        L14_2 = L12_2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          goto lbl_105
        end
      end
      L13_2 = A1_2
      L14_2 = false
      do return L13_2(L14_2) end
      ::lbl_105::
      L13_2 = tonumber
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      L14_2 = tonumber
      L15_2 = AvailableIPLS
      L16_2 = L8_2.metadata
      L16_2 = L16_2.ipl
      L15_2 = L15_2[L16_2]
      L15_2 = L15_2.settings
      L15_2 = L15_2.Themes
      L15_2 = L15_2[A3_2]
      L15_2 = L15_2.price
      L14_2 = L14_2(L15_2)
      if L13_2 < L14_2 then
        L13_2 = library
        L13_2 = L13_2.Notification
        L14_2 = L5_2
        L15_2 = TRANSLATE
        L16_2 = "notify.not_enough_money"
        L15_2 = L15_2(L16_2)
        L16_2 = 5000
        L17_2 = "error"
        L13_2(L14_2, L15_2, L16_2, L17_2)
        L13_2 = A1_2
        L14_2 = false
        return L13_2(L14_2)
      end
      L13_2 = library
      L13_2 = L13_2.Notification
      L14_2 = L5_2
      L15_2 = TRANSLATE
      L16_2 = "notify.property:purchased_theme"
      L17_2 = AvailableIPLS
      L18_2 = L8_2.metadata
      L18_2 = L18_2.ipl
      L17_2 = L17_2[L18_2]
      L17_2 = L17_2.settings
      L17_2 = L17_2.Themes
      L17_2 = L17_2[A3_2]
      L17_2 = L17_2.label
      L18_2 = AvailableIPLS
      L19_2 = L8_2.metadata
      L19_2 = L19_2.ipl
      L18_2 = L18_2[L19_2]
      L18_2 = L18_2.settings
      L18_2 = L18_2.Themes
      L18_2 = L18_2[A3_2]
      L18_2 = L18_2.price
      L15_2 = L15_2(L16_2, L17_2, L18_2)
      L16_2 = 5000
      L17_2 = "success"
      L13_2(L14_2, L15_2, L16_2, L17_2)
      L13_2 = SV
      L13_2 = L13_2.RemoveMoney
      L14_2 = L6_2
      L15_2 = A4_2
      L16_2 = tonumber
      L17_2 = AvailableIPLS
      L18_2 = L8_2.metadata
      L18_2 = L18_2.ipl
      L17_2 = L17_2[L18_2]
      L17_2 = L17_2.settings
      L17_2 = L17_2.Themes
      L17_2 = L17_2[A3_2]
      L17_2 = L17_2.price
      L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
      L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L13_2 = L8_2.metadata
      L13_2.iplTheme = A3_2
      L13_2 = MySQL
      L13_2 = L13_2.query
      L14_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
      L15_2 = {}
      L16_2 = json
      L16_2 = L16_2.encode
      L17_2 = L8_2.metadata
      L16_2 = L16_2(L17_2)
      L17_2 = tonumber
      L18_2 = A2_2
      L17_2, L18_2, L19_2 = L17_2(L18_2)
      L15_2[1] = L16_2
      L15_2[2] = L17_2
      L15_2[3] = L18_2
      L15_2[4] = L19_2
      L13_2(L14_2, L15_2)
      L13_2 = TriggerClientEvent
      L14_2 = "vms_housing:cl:updateProperty"
      L15_2 = -1
      L16_2 = "modifiedTheme"
      L17_2 = A2_2
      L18_2 = {}
      L18_2.iplTheme = A3_2
      L19_2 = L5_2
      L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L13_2 = A1_2
      L14_2 = true
      L13_2(L14_2)
  end
  else
    L12_2 = A1_2
    L13_2 = false
    L12_2(L13_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:buyFurniture"
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L5_2 = A0_2
  L6_2 = SV
  L6_2 = L6_2.GetPlayer
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = SV
  L7_2 = L7_2.GetIdentifier
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = A3_2.model
  if not L8_2 then
    L8_2 = A1_2
    L9_2 = false
    return L8_2(L9_2)
  end
  L8_2 = GetProperty
  L9_2 = A2_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L9_2 = A1_2
    L10_2 = false
    return L9_2(L10_2)
  end
  L9_2 = L8_2.owner
  if L9_2 then
    L9_2 = L8_2.owner
    L9_2 = L9_2 == L7_2
  end
  L10_2 = L8_2.renter
  if L10_2 then
    L10_2 = L8_2.renter
    L10_2 = L10_2 == L7_2
  end
  L11_2 = library
  L11_2 = L11_2.HasKeys
  L12_2 = L5_2
  L13_2 = L7_2
  L14_2 = A2_2
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  if not L9_2 and not L10_2 and not L11_2 then
    L12_2 = library
    L12_2 = L12_2.Notification
    L13_2 = L5_2
    L14_2 = TRANSLATE
    L15_2 = "notify.not_allowed"
    L14_2 = L14_2(L15_2)
    L15_2 = 5500
    L16_2 = "error"
    L12_2(L13_2, L14_2, L15_2, L16_2)
    L12_2 = A1_2
    L13_2 = false
    return L12_2(L13_2)
  end
  L12_2 = Furniture
  L13_2 = A3_2.model
  L12_2 = L12_2[L13_2]
  L13_2 = A3_2.isInside
  if L13_2 then
    L13_2 = L12_2.isIndoor
    if not L13_2 then
      L13_2 = A1_2
      L14_2 = false
      return L13_2(L14_2)
  end
  else
    L13_2 = A3_2.isInside
    if not L13_2 then
      L13_2 = L12_2.isOutdoor
      if not L13_2 then
        L13_2 = A1_2
        L14_2 = false
        return L13_2(L14_2)
      end
    end
  end
  L13_2 = L8_2.furniture
  if L13_2 then
    L13_2 = L8_2.furniture
    L13_2 = #L13_2
    L14_2 = GetFurnitureLimit
    L15_2 = L8_2.metadata
    L15_2 = L15_2.upgrades
    L14_2 = L14_2(L15_2)
    if L13_2 >= L14_2 then
      L13_2 = library
      L13_2 = L13_2.Notification
      L14_2 = L5_2
      L15_2 = TRANSLATE
      L16_2 = "notify.property:reached_furniture_limit"
      L15_2 = L15_2(L16_2)
      L16_2 = 6000
      L17_2 = "error"
      L13_2(L14_2, L15_2, L16_2, L17_2)
      L13_2 = A1_2
      L14_2 = false
      return L13_2(L14_2)
    end
  end
  L13_2 = L12_2.price
  if L13_2 then
    L13_2 = SV
    L13_2 = L13_2.GetMoney
    L14_2 = L6_2
    L15_2 = A4_2
    L13_2 = L13_2(L14_2, L15_2)
    if L13_2 then
      L14_2 = tonumber
      L15_2 = L13_2
      L14_2 = L14_2(L15_2)
      if L14_2 then
        goto lbl_134
      end
    end
    L14_2 = A1_2
    L15_2 = false
    do return L14_2(L15_2) end
    ::lbl_134::
    L14_2 = tonumber
    L15_2 = L13_2
    L14_2 = L14_2(L15_2)
    L15_2 = tonumber
    L16_2 = L12_2.price
    L15_2 = L15_2(L16_2)
    if L14_2 < L15_2 then
      L14_2 = library
      L14_2 = L14_2.Notification
      L15_2 = L5_2
      L16_2 = TRANSLATE
      L17_2 = "notify.not_enough_money"
      L16_2 = L16_2(L17_2)
      L17_2 = 5000
      L18_2 = "error"
      L14_2(L15_2, L16_2, L17_2, L18_2)
      L14_2 = A1_2
      L15_2 = false
      return L14_2(L15_2)
    end
    L14_2 = SV
    L14_2 = L14_2.RemoveMoney
    L15_2 = L6_2
    L16_2 = A4_2
    L17_2 = tonumber
    L18_2 = L12_2.price
    L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L17_2(L18_2)
    L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  end
  L13_2 = {}
  L14_2 = {}
  L15_2 = A3_2.isInside
  if L15_2 then
    L15_2 = "inside"
    if L15_2 then
      goto lbl_174
    end
  end
  L15_2 = "outside"
  ::lbl_174::
  L14_2.environment = L15_2
  L15_2 = A3_2.coords
  L15_2 = L15_2.x
  L14_2.x = L15_2
  L15_2 = A3_2.coords
  L15_2 = L15_2.y
  L14_2.y = L15_2
  L15_2 = A3_2.coords
  L15_2 = L15_2.z
  L14_2.z = L15_2
  L15_2 = A3_2.rotation
  L15_2 = L15_2.x
  L14_2.pitch = L15_2
  L15_2 = A3_2.rotation
  L15_2 = L15_2.y
  L14_2.roll = L15_2
  L15_2 = A3_2.rotation
  L15_2 = L15_2.z
  L14_2.yaw = L15_2
  L13_2.position = L14_2
  L14_2 = A3_2.model
  L13_2.model = L14_2
  L13_2.stored = 0
  L14_2 = {}
  L13_2.metadata = L14_2
  L14_2 = MySQL
  L14_2 = L14_2.insert
  L14_2 = L14_2.await
  L15_2 = "INSERT INTO `houses_furniture` (`house_id`, `position`, `model`, `stored`, `metadata`) VALUES (?, ?, ?, ?, ?)"
  L16_2 = {}
  L17_2 = A2_2
  L18_2 = json
  L18_2 = L18_2.encode
  L19_2 = L13_2.position
  L18_2 = L18_2(L19_2)
  L19_2 = L13_2.model
  L20_2 = L13_2.stored
  L21_2 = json
  L21_2 = L21_2.encode
  L22_2 = L13_2.metadata
  L21_2, L22_2 = L21_2(L22_2)
  L16_2[1] = L17_2
  L16_2[2] = L18_2
  L16_2[3] = L19_2
  L16_2[4] = L20_2
  L16_2[5] = L21_2
  L16_2[6] = L22_2
  L14_2 = L14_2(L15_2, L16_2)
  L15_2 = {}
  L16_2 = L12_2.metadata
  if L16_2 then
    L15_2 = L12_2.metadata
  end
  L16_2 = L12_2.interactableName
  if L16_2 then
    L16_2 = L12_2.interactableName
    L15_2.interactableName = L16_2
    L16_2 = L15_2.interactableName
    if "storage" == L16_2 then
      L16_2 = "house_storage-"
      L17_2 = A2_2
      L18_2 = "-"
      L19_2 = L14_2
      L16_2 = L16_2 .. L17_2 .. L18_2 .. L19_2
      L15_2.id = L16_2
    end
    L16_2 = L15_2.interactableName
    if "safe" == L16_2 then
      L16_2 = "house_safe-"
      L17_2 = A2_2
      L18_2 = "-"
      L19_2 = L14_2
      L16_2 = L16_2 .. L17_2 .. L18_2 .. L19_2
      L15_2.id = L16_2
      L15_2.pin = ""
    end
  end
  L16_2 = next
  L17_2 = L15_2
  L16_2 = L16_2(L17_2)
  if L16_2 then
    L16_2 = MySQL
    L16_2 = L16_2.query
    L17_2 = "UPDATE `houses_furniture` SET `metadata` = ? WHERE `id` = ? AND `house_id` = ?"
    L18_2 = {}
    L19_2 = json
    L19_2 = L19_2.encode
    L20_2 = L15_2
    L19_2 = L19_2(L20_2)
    L20_2 = L14_2
    L21_2 = tonumber
    L22_2 = A2_2
    L21_2, L22_2 = L21_2(L22_2)
    L18_2[1] = L19_2
    L18_2[2] = L20_2
    L18_2[3] = L21_2
    L18_2[4] = L22_2
    L16_2(L17_2, L18_2)
    L16_2 = L15_2.interactableName
    if "storage" ~= L16_2 then
      L16_2 = L15_2.interactableName
      if "safe" ~= L16_2 then
        goto lbl_279
      end
    end
    L16_2 = library
    L16_2 = L16_2.RegisterStorage
    L17_2 = L15_2
    L16_2(L17_2)
  end
  ::lbl_279::
  L13_2.metadata = L15_2
  L13_2.id = L14_2
  L16_2 = Properties
  L17_2 = tostring
  L18_2 = A2_2
  L17_2 = L17_2(L18_2)
  L16_2 = L16_2[L17_2]
  L16_2 = L16_2.furniture
  if not L16_2 then
    L16_2 = Properties
    L17_2 = tostring
    L18_2 = A2_2
    L17_2 = L17_2(L18_2)
    L16_2 = L16_2[L17_2]
    L17_2 = {}
    L16_2.furniture = L17_2
  end
  L16_2 = library
  L16_2 = L16_2.Notification
  L17_2 = L5_2
  L18_2 = TRANSLATE
  L19_2 = "notify.property:purchased_furniture"
  L20_2 = L12_2.label
  if not L20_2 then
    L20_2 = L12_2.model
  end
  L21_2 = L12_2.price
  L18_2 = L18_2(L19_2, L20_2, L21_2)
  L19_2 = 5000
  L20_2 = "success"
  L16_2(L17_2, L18_2, L19_2, L20_2)
  L16_2 = table
  L16_2 = L16_2.insert
  L17_2 = Properties
  L18_2 = tostring
  L19_2 = A2_2
  L18_2 = L18_2(L19_2)
  L17_2 = L17_2[L18_2]
  L17_2 = L17_2.furniture
  L18_2 = L13_2
  L16_2(L17_2, L18_2)
  L16_2 = TriggerClientEvent
  L17_2 = "vms_housing:cl:updateProperty"
  L18_2 = -1
  L19_2 = "addedFurniture"
  L20_2 = A2_2
  L21_2 = {}
  L21_2.furniture = L13_2
  L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
  L16_2 = A1_2
  L17_2 = true
  L16_2(L17_2)
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:placeFurniture"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = A0_2
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = SV
  L6_2 = L6_2.GetIdentifier
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = A1_2
  L8_2 = true
  L7_2(L8_2)
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:isAllowedToRaid"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = A0_2
  L4_2 = GetProperty
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = A1_2
    L6_2 = false
    L7_2 = nil
    return L5_2(L6_2, L7_2)
  end
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  L6_2 = IsAllowedToRaid
  L7_2 = L3_2
  L8_2 = L5_2
  L9_2 = L4_2
  L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 and L7_2 then
    L8_2 = library
    L8_2 = L8_2.Notification
    L9_2 = L3_2
    L10_2 = TRANSLATE
    L11_2 = "notify.raid:"
    L12_2 = L7_2
    L11_2 = L11_2 .. L12_2
    L10_2 = L10_2(L11_2)
    L11_2 = 5500
    L12_2 = "error"
    L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  L8_2 = A1_2
  L9_2 = L6_2
  L10_2 = L7_2
  L8_2(L9_2, L10_2)
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:useStaticInteractable"
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L7_2 = A0_2
  L8_2 = GetProperty
  L9_2 = A2_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L9_2 = A1_2
    L10_2 = false
    return L9_2(L10_2)
  end
  L9_2 = GetGameTimer
  L9_2 = L9_2()
  L10_2 = A4_2 or L10_2
  if not A4_2 then
    L10_2 = 10000
  end
  L11_2 = L2_1
  L11_2 = L11_2[A2_2]
  if not L11_2 then
    L11_2 = L2_1
    L12_2 = {}
    L11_2[A2_2] = L12_2
  end
  L11_2 = L2_1
  L11_2 = L11_2[A2_2]
  L11_2 = L11_2[A3_2]
  if not L11_2 then
    L11_2 = 0
  end
  if L9_2 < L11_2 then
    L11_2 = A1_2
    L12_2 = false
    return L11_2(L12_2)
  end
  L11_2 = L2_1
  L11_2 = L11_2[A2_2]
  L12_2 = L9_2 + L10_2
  L11_2[A3_2] = L12_2
  if A6_2 and "water" == A6_2 then
    L11_2 = library
    L11_2 = L11_2.ApplyWaterUsage
    L12_2 = A2_2
    L13_2 = A5_2
    L11_2(L12_2, L13_2)
  end
  L11_2 = A1_2
  L12_2 = true
  L11_2(L12_2)
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:checkApartmentActions"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = A0_2
  L4_2 = GetProperty
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = A1_2
    L6_2 = false
    return L5_2(L6_2)
  end
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  L6_2 = SV
  L6_2 = L6_2.GetPlayerJob
  L7_2 = L5_2
  L8_2 = "name"
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = false
  L8_2 = false
  L9_2 = Config
  L9_2 = L9_2.PropertyLockdown
  if L9_2 then
    L9_2 = Config
    L9_2 = L9_2.PropertyLockdown
    L9_2 = L9_2.Enable
    if L9_2 then
      L9_2 = false
      L10_2 = Config
      L10_2 = L10_2.PropertyLockdown
      L10_2 = L10_2.Jobs
      if L10_2 then
        L10_2 = next
        L11_2 = Config
        L11_2 = L11_2.PropertyLockdown
        L11_2 = L11_2.Jobs
        L10_2 = L10_2(L11_2)
        if L10_2 then
          L10_2 = type
          L11_2 = Config
          L11_2 = L11_2.PropertyLockdown
          L11_2 = L11_2.Jobs
          L10_2 = L10_2(L11_2)
          if "table" == L10_2 then
            L10_2 = ipairs
            L11_2 = Config
            L11_2 = L11_2.PropertyLockdown
            L11_2 = L11_2.Jobs
            L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
            for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
              if L15_2 == L6_2 then
                L9_2 = true
                break
              end
            end
          else
            L10_2 = Config
            L10_2 = L10_2.PropertyLockdown
            L10_2 = L10_2.Jobs
            if L10_2 == L6_2 then
              L9_2 = true
            end
          end
      end
      else
        L9_2 = true
      end
      L10_2 = false
      L11_2 = Config
      L11_2 = L11_2.PropertyLockdown
      L11_2 = L11_2.Item
      if L11_2 then
        L11_2 = Config
        L11_2 = L11_2.PropertyLockdown
        L11_2 = L11_2.Item
        L11_2 = L11_2.Required
        if L11_2 then
          L11_2 = SV
          L11_2 = L11_2.GetItemCount
          L12_2 = L5_2
          L13_2 = Config
          L13_2 = L13_2.PropertyLockdown
          L13_2 = L13_2.Item
          L13_2 = L13_2.Name
          L11_2 = L11_2(L12_2, L13_2)
          L12_2 = Config
          L12_2 = L12_2.PropertyLockdown
          L12_2 = L12_2.Item
          L12_2 = L12_2.Count
          if not L12_2 then
            L12_2 = 1
          end
          if L11_2 >= L12_2 then
            L10_2 = true
          end
      end
      else
        L10_2 = true
      end
      L7_2 = L9_2 or L7_2
      if L9_2 then
        L7_2 = L10_2
      end
      L8_2 = L9_2
    end
  end
  L9_2 = false
  L10_2 = false
  L11_2 = Config
  L11_2 = L11_2.PropertyRaids
  if L11_2 then
    L11_2 = Config
    L11_2 = L11_2.PropertyRaids
    L11_2 = L11_2.Enable
    if L11_2 then
      L11_2 = false
      L12_2 = Config
      L12_2 = L12_2.PropertyRaids
      L12_2 = L12_2.Jobs
      if L12_2 then
        L12_2 = next
        L13_2 = Config
        L13_2 = L13_2.PropertyRaids
        L13_2 = L13_2.Jobs
        L12_2 = L12_2(L13_2)
        if L12_2 then
          L12_2 = type
          L13_2 = Config
          L13_2 = L13_2.PropertyRaids
          L13_2 = L13_2.Jobs
          L12_2 = L12_2(L13_2)
          if "table" == L12_2 then
            L12_2 = ipairs
            L13_2 = Config
            L13_2 = L13_2.PropertyRaids
            L13_2 = L13_2.Jobs
            L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
            for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
              if L17_2 == L6_2 then
                L11_2 = true
                break
              end
            end
          else
            L12_2 = Config
            L12_2 = L12_2.PropertyRaids
            L12_2 = L12_2.Jobs
            if L12_2 == L6_2 then
              L11_2 = true
            end
          end
      end
      else
        hasItem = true
      end
      L12_2 = false
      L13_2 = Config
      L13_2 = L13_2.PropertyRaids
      L13_2 = L13_2.Item
      if L13_2 then
        L13_2 = Config
        L13_2 = L13_2.PropertyRaids
        L13_2 = L13_2.Item
        L13_2 = L13_2.Required
        if L13_2 then
          L13_2 = SV
          L13_2 = L13_2.GetItemCount
          L14_2 = L5_2
          L15_2 = Config
          L15_2 = L15_2.PropertyRaids
          L15_2 = L15_2.Item
          L15_2 = L15_2.Name
          L13_2 = L13_2(L14_2, L15_2)
          L14_2 = Config
          L14_2 = L14_2.PropertyRaids
          L14_2 = L14_2.Item
          L14_2 = L14_2.Count
          if not L14_2 then
            L14_2 = 1
          end
          if L13_2 >= L14_2 then
            L12_2 = true
          end
      end
      else
        L12_2 = true
      end
      L9_2 = L11_2 or L9_2
      if L11_2 then
        L9_2 = L12_2
      end
      L10_2 = L11_2
    end
  end
  L11_2 = false
  L12_2 = Config
  L12_2 = L12_2.Lockpick
  if L12_2 then
    L12_2 = Config
    L12_2 = L12_2.Lockpick
    L12_2 = L12_2.Enable
    if L12_2 then
      L12_2 = false
      L13_2 = Config
      L13_2 = L13_2.Lockpick
      L13_2 = L13_2.Item
      if L13_2 then
        L13_2 = Config
        L13_2 = L13_2.Lockpick
        L13_2 = L13_2.Item
        L13_2 = L13_2.Required
        if L13_2 then
          L13_2 = SV
          L13_2 = L13_2.GetItemCount
          L14_2 = L5_2
          L15_2 = Config
          L15_2 = L15_2.Lockpick
          L15_2 = L15_2.Item
          L15_2 = L15_2.Name
          L13_2 = L13_2(L14_2, L15_2)
          L14_2 = Config
          L14_2 = L14_2.Lockpick
          L14_2 = L14_2.Item
          L14_2 = L14_2.Count
          if not L14_2 then
            L14_2 = 1
          end
          if L13_2 >= L14_2 then
            L12_2 = true
          end
      end
      else
        L12_2 = true
      end
      L11_2 = L12_2
    end
  end
  L12_2 = A1_2
  L13_2 = {}
  L13_2.allowedLockdown = L7_2
  L13_2.allowedRemovePoliceSeal = L8_2
  L13_2.allowedRaid = L9_2
  L13_2.allowedLockAfterRaid = L10_2
  L13_2.allowedLockpick = L11_2
  L12_2(L13_2)
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:checkLastProperty"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A0_2
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = false
    return L4_2(L5_2)
  end
  L4_2 = MySQL
  L4_2 = L4_2.single
  L4_2 = L4_2.await
  L5_2 = "SELECT `last_property` FROM `%s` WHERE `%s` = ?"
  L6_2 = L5_2
  L5_2 = L5_2.format
  L7_2 = Config
  L7_2 = L7_2.Core
  if "ESX" == L7_2 then
    L7_2 = "users"
    if L7_2 then
      goto lbl_25
    end
  end
  L7_2 = "players"
  ::lbl_25::
  L8_2 = Config
  L8_2 = L8_2.Core
  if "ESX" == L8_2 then
    L8_2 = "identifier"
    if L8_2 then
      goto lbl_33
    end
  end
  L8_2 = "citizenid"
  ::lbl_33::
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = {}
  L7_2 = SV
  L7_2 = L7_2.GetIdentifier
  L8_2 = L3_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = L4_2.last_property
    if L5_2 then
      L5_2 = json
      L5_2 = L5_2.decode
      L6_2 = L4_2.last_property
      L5_2 = L5_2(L6_2)
      L4_2 = L5_2
      L5_2 = GetProperty
      L6_2 = tostring
      L7_2 = L4_2.id
      L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2)
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
      if L5_2 then
        L6_2 = L5_2.object_id
        if L6_2 then
          L6_2 = GetProperty
          L7_2 = tostring
          L8_2 = L5_2.object_id
          L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
          if L6_2 then
            goto lbl_70
          end
        end
        L6_2 = nil
        ::lbl_70::
        L7_2 = SetPlayerRoutingBucket
        L8_2 = L2_2
        L9_2 = tonumber
        L10_2 = L4_2.id
        L9_2 = L9_2(L10_2)
        L9_2 = L9_2 + 1
        L7_2(L8_2, L9_2)
        L7_2 = A1_2
        L8_2 = true
        L9_2 = L5_2
        L10_2 = L6_2
        return L7_2(L8_2, L9_2, L10_2)
      end
    end
  end
  L5_2 = A1_2
  L6_2 = false
  L5_2(L6_2)
end
L5_1(L6_1, L7_1)
L5_1 = library
L5_1 = L5_1.RegisterCallback
L6_1 = "vms_housing:isAllowedToUseAdmin"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = L4_1
  L3_2 = L3_2[A0_2]
  L2_2(L3_2)
  L2_2 = nil
  L4_1 = L2_2
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:automaticSale"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = library
  L5_2 = L5_2.HasPermissions
  L6_2 = A0_2
  L7_2 = L3_2
  L8_2 = "automaticSell"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if not L5_2 then
    L5_2 = library
    L5_2 = L5_2.Notification
    L6_2 = L1_2
    L7_2 = TRANSLATE
    L8_2 = "notify.not_allowed"
    L7_2 = L7_2(L8_2)
    L8_2 = 5500
    L9_2 = "error"
    return L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = L4_2.renter
  if L5_2 then
    L5_2 = library
    L5_2 = L5_2.Notification
    L6_2 = L1_2
    L7_2 = TRANSLATE
    L8_2 = "notify.property:cannot_sell_with_renter"
    L7_2 = L7_2(L8_2)
    L8_2 = 5000
    L9_2 = "error"
    return L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = Config
  L5_2 = L5_2.AutomaticSell
  L5_2 = L4_2.sale
  L5_2 = L5_2.defaultPrice
  if L5_2 then
    L5_2 = L4_2.sale
    L5_2 = L5_2.defaultPrice
    L6_2 = Config
    L6_2 = L6_2.AutomaticSell
    L6_2 = L6_2 / 100
    L5_2 = L5_2 >= 1 and L5_2
  end
  if L5_2 and L5_2 >= 1 then
    L6_2 = SV
    L6_2 = L6_2.AddMoney
    L7_2 = L2_2
    L8_2 = "bank"
    L9_2 = L5_2
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L1_2
    L8_2 = TRANSLATE
    L9_2 = "notify.property:sold_property"
    L10_2 = L5_2
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = 5500
    L10_2 = "success"
    L6_2(L7_2, L8_2, L9_2, L10_2)
  else
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L1_2
    L8_2 = TRANSLATE
    L9_2 = "notify.property:sold_property"
    L10_2 = 0
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = 5500
    L10_2 = "success"
    L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L4_2.owner = nil
  L4_2.owner_name = nil
  L6_2 = json
  L6_2 = L6_2.encode
  L7_2 = {}
  L6_2 = L6_2(L7_2)
  L4_2.keys = L6_2
  L6_2 = L4_2.sale
  L7_2 = L4_2.sale
  L7_2 = L7_2.defaultActive
  L6_2.active = L7_2
  L6_2 = L4_2.sale
  L7_2 = L4_2.sale
  L7_2 = L7_2.defaultPrice
  if not L7_2 then
    L7_2 = 0
  end
  L6_2.price = L7_2
  L6_2 = L4_2.rental
  L7_2 = L4_2.rental
  L7_2 = L7_2.defaultActive
  L6_2.active = L7_2
  L6_2 = L4_2.rental
  L7_2 = L4_2.rental
  L7_2 = L7_2.defaultPrice
  if not L7_2 then
    L7_2 = 0
  end
  L6_2.price = L7_2
  L6_2 = L4_2.metadata
  L6_2.locked = false
  L6_2 = L4_2.metadata
  L6_2.lightState = false
  L6_2 = L4_2.metadata
  L7_2 = {}
  L6_2.upgrades = L7_2
  L6_2 = {}
  L4_2.permissions = L6_2
  L4_2.last_enter = nil
  L6_2 = {}
  L4_2.furniture = L6_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "UPDATE `houses` SET `owner` = NULL, `owner_name` = NULL, `keys` = ?, `permissions` = ?, `metadata` = ?, `sale` = ?, `rental` = ?, last_enter = NULL WHERE `id` = ?"
  L8_2 = {}
  L9_2 = L4_2.keys
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L4_2.permissions
  L10_2 = L10_2(L11_2)
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L4_2.metadata
  L11_2 = L11_2(L12_2)
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L4_2.sale
  L12_2 = L12_2(L13_2)
  L13_2 = json
  L13_2 = L13_2.encode
  L14_2 = L4_2.rental
  L13_2 = L13_2(L14_2)
  L14_2 = tonumber
  L15_2 = A0_2
  L14_2, L15_2 = L14_2(L15_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L8_2[5] = L13_2
  L8_2[6] = L14_2
  L8_2[7] = L15_2
  L6_2(L7_2, L8_2)
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "DELETE FROM houses_furniture WHERE `id` = ?"
  L8_2 = {}
  L9_2 = tonumber
  L10_2 = A0_2
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L8_2[5] = L13_2
  L8_2[6] = L14_2
  L8_2[7] = L15_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "vms_housing:cl:updateProperty"
  L8_2 = -1
  L9_2 = "autoSellProperty"
  L10_2 = A0_2
  L11_2 = {}
  L12_2 = L4_2.keys
  L11_2.keys = L12_2
  L12_2 = L4_2.metadata
  L11_2.metadata = L12_2
  L12_2 = L4_2.sale
  L11_2.sale = L12_2
  L12_2 = L4_2.rental
  L11_2.rental = L12_2
  L12_2 = L1_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:purchaseProperty"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L3_2 = source
  L4_2 = false
  L5_2 = false
  L6_2 = SV
  L6_2 = L6_2.GetPlayer
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = SV
  L7_2 = L7_2.GetIdentifier
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = GetProperty
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    return
  end
  L9_2 = A2_2.apartmentId
  if L9_2 then
    L9_2 = tostring
    L10_2 = A0_2
    L9_2 = L9_2(L10_2)
    L10_2 = tostring
    L11_2 = A2_2.apartmentId
    L10_2 = L10_2(L11_2)
    if L9_2 ~= L10_2 then
      L9_2 = L8_2.id
      A0_2 = A2_2.apartmentId
      L10_2 = GetProperty
      L11_2 = A2_2.apartmentId
      L10_2 = L10_2(L11_2)
      L8_2 = L10_2
      if not L8_2 then
        return
      end
      L10_2 = L8_2.object_id
      if L10_2 then
        L10_2 = L8_2.object_id
        if L9_2 ~= L10_2 then
          return
        end
      end
    end
  end
  L9_2 = L8_2.owner
  if not L9_2 then
    L9_2 = L8_2.renter
    if not L9_2 then
      goto lbl_55
    end
  end
  do return end
  ::lbl_55::
  L9_2 = L8_2.metadata
  if L9_2 then
    L9_2 = L8_2.sale
    if L9_2 then
      L9_2 = L8_2.sale
      L9_2 = L9_2.active
      if L9_2 then
        L9_2 = L8_2.sale
        L9_2 = L9_2.price
        if L9_2 then
          goto lbl_70
        end
      end
    end
  end
  do return end
  ::lbl_70::
  L9_2 = Config
  L9_2 = L9_2.MaxPropertiesPerPlayer
  if L9_2 then
    L9_2 = Config
    L9_2 = L9_2.MaxPropertiesPerPlayer
    if L9_2 >= 0 then
      L9_2 = Config
      L9_2 = L9_2.MaxPropertiesPerPlayer
      if -1 ~= L9_2 then
        L9_2 = GetPlayerProperties
        L10_2 = L7_2
        L9_2 = L9_2(L10_2)
        L10_2 = #L9_2
        L11_2 = Config
        L11_2 = L11_2.MaxPropertiesPerPlayer
        if L10_2 >= L11_2 then
          L10_2 = library
          L10_2 = L10_2.Notification
          L11_2 = L3_2
          L12_2 = TRANSLATE
          L13_2 = "notify.reached_properties_limit"
          L12_2 = L12_2(L13_2)
          L13_2 = 5000
          L14_2 = "error"
          return L10_2(L11_2, L12_2, L13_2, L14_2)
        end
      end
    end
  end
  L9_2 = SV
  L9_2 = L9_2.GetMoney
  L10_2 = L6_2
  L11_2 = A1_2
  L9_2 = L9_2(L10_2, L11_2)
  if L9_2 then
    L10_2 = tonumber
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    if L10_2 then
      goto lbl_113
    end
  end
  do return end
  ::lbl_113::
  L10_2 = tonumber
  L11_2 = L9_2
  L10_2 = L10_2(L11_2)
  L11_2 = tonumber
  L12_2 = L8_2.sale
  L12_2 = L12_2.price
  L11_2 = L11_2(L12_2)
  if L10_2 < L11_2 then
    L10_2 = library
    L10_2 = L10_2.Notification
    L11_2 = L3_2
    L12_2 = TRANSLATE
    L13_2 = "notify.not_enough_money"
    L12_2 = L12_2(L13_2)
    L13_2 = 5000
    L14_2 = "error"
    return L10_2(L11_2, L12_2, L13_2, L14_2)
  end
  L10_2 = L8_2.type
  if "ipl" == L10_2 and A2_2 then
    L10_2 = L8_2.metadata
    L10_2 = L10_2.ipl
    if L10_2 then
      L10_2 = A2_2.selectedTheme
      if L10_2 then
        L10_2 = AvailableIPLS
        L11_2 = L8_2.metadata
        L11_2 = L11_2.ipl
        L10_2 = L10_2[L11_2]
        if L10_2 then
          L10_2 = L10_2.settings
        end
        if L10_2 then
          L10_2 = L10_2.Themes
        end
        L11_2 = A2_2.selectedTheme
        L10_2 = L10_2[L11_2]
        if L10_2 then
          L10_2 = L8_2.metadata
          L11_2 = A2_2.selectedTheme
          L10_2.iplTheme = L11_2
          L5_2 = true
          L4_2 = true
        end
      end
    end
  end
  L10_2 = Config
  L10_2 = L10_2.CityHallTaxes
  if L10_2 then
    L10_2 = L10_2.PropertyCadastralTax
  end
  if L10_2 then
    L10_2 = L10_2.Enabled
  end
  if L10_2 then
    L10_2 = L8_2.metadata
    L11_2 = os
    L11_2 = L11_2.date
    L12_2 = "%m:%Y"
    L13_2 = os
    L13_2 = L13_2.time
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L13_2()
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L10_2.lastCadastralPeriod = L11_2
    L4_2 = true
  end
  L10_2 = L8_2.sale
  L10_2.active = false
  L10_2 = L8_2.rental
  L10_2.active = false
  L10_2 = library
  L10_2 = L10_2.GetOrCreateBills
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  L8_2.bills = L10_2
  L8_2.unpaidBills = 0
  L10_2 = Config
  L10_2 = L10_2.CityHallTaxes
  if L10_2 then
    L10_2 = L10_2.PropertyPurchase
  end
  if L10_2 then
    L10_2 = L10_2.Enabled
  end
  if L10_2 then
    L10_2 = SV
    L10_2 = L10_2.AddTax
    L11_2 = L7_2
    L12_2 = SV
    L12_2 = L12_2.GetCharacterName
    L13_2 = L6_2
    L12_2 = L12_2(L13_2)
    L13_2 = L8_2.name
    L14_2 = L8_2.address
    L15_2 = "property_purchase_tax"
    L16_2 = tonumber
    L17_2 = L8_2.sale
    L17_2 = L17_2.price
    L16_2, L17_2, L18_2, L19_2 = L16_2(L17_2)
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  end
  L10_2 = SV
  L10_2 = L10_2.RemoveMoney
  L11_2 = L6_2
  L12_2 = A1_2
  L13_2 = tonumber
  L14_2 = L8_2.sale
  L14_2 = L14_2.price
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L13_2(L14_2)
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L10_2 = library
  L10_2 = L10_2.Notification
  L11_2 = L3_2
  L12_2 = TRANSLATE
  L13_2 = "notify.property:purchased"
  L14_2 = L8_2.sale
  L14_2 = L14_2.price
  L12_2 = L12_2(L13_2, L14_2)
  L13_2 = 5000
  L14_2 = "success"
  L10_2(L11_2, L12_2, L13_2, L14_2)
  L8_2.owner = L7_2
  L10_2 = SV
  L10_2 = L10_2.GetCharacterName
  L11_2 = L6_2
  L10_2 = L10_2(L11_2)
  L8_2.owner_name = L10_2
  L10_2 = "UPDATE houses SET owner = @owner, owner_name = @owner_name, sale = @sale, rental = @rental"
  L11_2 = Config
  L11_2 = L11_2.UseKeysOnItem
  if L11_2 then
    L11_2 = Config
    L11_2 = L11_2.AutomaticGiveKeyForProperty
    if L11_2 then
      L11_2 = L10_2
      L12_2 = ", `keys` = @keys"
      L11_2 = L11_2 .. L12_2
      L10_2 = L11_2
      L11_2 = library
      L11_2 = L11_2.GenerateKeySerialNumber
      L12_2 = A0_2
      L11_2 = L11_2(L12_2)
      L12_2 = json
      L12_2 = L12_2.decode
      L13_2 = L8_2.keys
      L12_2 = L12_2(L13_2)
      L8_2.keys = L12_2
      L12_2 = table
      L12_2 = L12_2.insert
      L13_2 = L8_2.keys
      L14_2 = L11_2
      L12_2(L13_2, L14_2)
      L12_2 = json
      L12_2 = L12_2.encode
      L13_2 = L8_2.keys
      L12_2 = L12_2(L13_2)
      L8_2.keys = L12_2
      L12_2 = SV
      L12_2 = L12_2.AddItem
      L13_2 = L3_2
      L14_2 = L6_2
      L15_2 = "house_key"
      L16_2 = 1
      L17_2 = {}
      L17_2.propertyId = A0_2
      L17_2.keySerialNumber = L11_2
      L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
    end
  end
  if L4_2 then
    L11_2 = L10_2
    L12_2 = ", metadata = @metadata"
    L11_2 = L11_2 .. L12_2
    L10_2 = L11_2
  end
  L11_2 = L10_2
  L12_2 = " WHERE id = @id"
  L11_2 = L11_2 .. L12_2
  L10_2 = L11_2
  L11_2 = MySQL
  L11_2 = L11_2.update
  L11_2 = L11_2.await
  L12_2 = L10_2
  L13_2 = {}
  L14_2 = L8_2.owner
  L13_2["@owner"] = L14_2
  L14_2 = L8_2.owner_name
  L13_2["@owner_name"] = L14_2
  L14_2 = L8_2.keys
  L13_2["@keys"] = L14_2
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = L8_2.metadata
  L14_2 = L14_2(L15_2)
  L13_2["@metadata"] = L14_2
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = L8_2.sale
  L14_2 = L14_2(L15_2)
  L13_2["@sale"] = L14_2
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = L8_2.rental
  L14_2 = L14_2(L15_2)
  L13_2["@rental"] = L14_2
  L14_2 = tonumber
  L15_2 = A0_2
  L14_2 = L14_2(L15_2)
  L13_2["@id"] = L14_2
  L11_2(L12_2, L13_2)
  L11_2 = TriggerClientEvent
  L12_2 = "vms_housing:cl:updateProperty"
  L13_2 = -1
  L14_2 = "newOwner"
  L15_2 = A0_2
  L16_2 = {}
  L17_2 = L8_2.owner
  L16_2.owner = L17_2
  L17_2 = L8_2.owner_name
  L16_2.owner_name = L17_2
  L17_2 = L8_2.keys
  L16_2.keys = L17_2
  L17_2 = L8_2.sale
  L16_2.sale = L17_2
  L17_2 = L8_2.rental
  L16_2.rental = L17_2
  L17_2 = L8_2.bills
  L16_2.bills = L17_2
  L17_2 = L5_2 or L17_2
  if L5_2 then
    L17_2 = A2_2.selectedTheme
  end
  L16_2.iplTheme = L17_2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = SV
  L11_2 = L11_2.Webhook
  L12_2 = "PurchasedProperty"
  L13_2 = WebhookText
  L13_2 = L13_2["TITLE.PurchasedProperty"]
  L14_2 = WebhookText
  L14_2 = L14_2["DESCRIPTION.PurchasedProperty"]
  L15_2 = L14_2
  L14_2 = L14_2.format
  L16_2 = L8_2.owner_name
  L17_2 = L3_2
  L18_2 = A0_2
  L19_2 = L8_2.sale
  L19_2 = L19_2.price
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
  L15_2 = 0
  L16_2 = L7_2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:rentProperty"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L4_2 = source
  L5_2 = false
  L6_2 = Config
  L6_2 = L6_2.RentalCycles
  L6_2 = L6_2[A2_2]
  if not L6_2 then
    return
  end
  L6_2 = SV
  L6_2 = L6_2.GetPlayer
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = SV
  L7_2 = L7_2.GetIdentifier
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = GetProperty
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    return
  end
  L9_2 = A3_2.apartmentId
  if L9_2 then
    L9_2 = tostring
    L10_2 = A0_2
    L9_2 = L9_2(L10_2)
    L10_2 = tostring
    L11_2 = A3_2.apartmentId
    L10_2 = L10_2(L11_2)
    if L9_2 ~= L10_2 then
      L9_2 = L8_2.id
      A0_2 = A3_2.apartmentId
      L10_2 = GetProperty
      L11_2 = A3_2.apartmentId
      L10_2 = L10_2(L11_2)
      L8_2 = L10_2
      if not L8_2 then
        return
      end
      L10_2 = L8_2.object_id
      if L9_2 ~= L10_2 then
        return
      end
    end
  end
  L9_2 = L8_2.renter
  if L9_2 then
    return
  end
  L9_2 = L8_2.metadata
  if L9_2 then
    L9_2 = L8_2.rental
    if L9_2 then
      L9_2 = L8_2.rental
      L9_2 = L9_2.active
      if L9_2 then
        L9_2 = L8_2.rental
        L9_2 = L9_2.price
        if L9_2 then
          goto lbl_69
        end
      end
    end
  end
  do return end
  ::lbl_69::
  L9_2 = Config
  L9_2 = L9_2.MaxPropertiesPerPlayer
  if L9_2 then
    L9_2 = Config
    L9_2 = L9_2.MaxPropertiesPerPlayer
    if L9_2 >= 0 then
      L9_2 = Config
      L9_2 = L9_2.MaxPropertiesPerPlayer
      if -1 ~= L9_2 then
        L9_2 = GetPlayerProperties
        L10_2 = L7_2
        L9_2 = L9_2(L10_2)
        L10_2 = #L9_2
        L11_2 = Config
        L11_2 = L11_2.MaxPropertiesPerPlayer
        if L10_2 >= L11_2 then
          L10_2 = library
          L10_2 = L10_2.Notification
          L11_2 = L4_2
          L12_2 = TRANSLATE
          L13_2 = "notify.reached_properties_limit"
          L12_2 = L12_2(L13_2)
          L13_2 = 5000
          L14_2 = "error"
          return L10_2(L11_2, L12_2, L13_2, L14_2)
        end
      end
    end
  end
  if "weekly" == A2_2 then
    L9_2 = math
    L9_2 = L9_2.floor
    L10_2 = tonumber
    L11_2 = L8_2.rental
    L11_2 = L11_2.price
    L10_2 = L10_2(L11_2)
    L10_2 = L10_2 * 12
    L10_2 = L10_2 / 52.17857142857143
    L9_2 = L9_2(L10_2)
    if L9_2 then
      goto lbl_118
    end
  end
  L9_2 = tonumber
  L10_2 = L8_2.rental
  L10_2 = L10_2.price
  L9_2 = L9_2(L10_2)
  ::lbl_118::
  L10_2 = SV
  L10_2 = L10_2.GetMoney
  L11_2 = L6_2
  L12_2 = A1_2
  L10_2 = L10_2(L11_2, L12_2)
  if L10_2 then
    L11_2 = tonumber
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    if L11_2 then
      goto lbl_131
    end
  end
  do return end
  ::lbl_131::
  L11_2 = tonumber
  L12_2 = L10_2
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = L9_2
  L12_2 = L12_2(L13_2)
  if L11_2 < L12_2 then
    L11_2 = library
    L11_2 = L11_2.Notification
    L12_2 = L4_2
    L13_2 = TRANSLATE
    L14_2 = "notify.not_enough_money"
    L13_2 = L13_2(L14_2)
    L14_2 = 5000
    L15_2 = "error"
    return L11_2(L12_2, L13_2, L14_2, L15_2)
  end
  L11_2 = L8_2.type
  if "ipl" == L11_2 and A3_2 then
    L11_2 = A3_2.selectedTheme
    if L11_2 then
      L11_2 = L8_2.metadata
      L11_2 = L11_2.ipl
      if L11_2 then
        L11_2 = A3_2.selectedTheme
        if L11_2 then
          L11_2 = AvailableIPLS
          L12_2 = L8_2.metadata
          L12_2 = L12_2.ipl
          L11_2 = L11_2[L12_2]
          if L11_2 then
            L11_2 = L11_2.settings
          end
          if L11_2 then
            L11_2 = L11_2.Themes
          end
          L12_2 = A3_2.selectedTheme
          L11_2 = L11_2[L12_2]
          if L11_2 then
            L11_2 = L8_2.metadata
            L12_2 = A3_2.selectedTheme
            L11_2.iplTheme = L12_2
            L5_2 = true
          end
        end
      end
    end
  end
  L11_2 = SV
  L11_2 = L11_2.RemoveMoney
  L12_2 = L6_2
  L13_2 = A1_2
  L14_2 = tonumber
  L15_2 = L9_2
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L14_2(L15_2)
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L8_2.renter = L7_2
  L11_2 = SV
  L11_2 = L11_2.GetCharacterName
  L12_2 = L6_2
  L11_2 = L11_2(L12_2)
  L8_2.renter_name = L11_2
  L11_2 = L8_2.permissions
  L12_2 = {}
  L13_2 = L8_2.renter_name
  L12_2._name = L13_2
  L11_2[L7_2] = L12_2
  L11_2 = ipairs
  L12_2 = Config
  L12_2 = L12_2.DefaultPermissionsForRenter
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = L8_2.permissions
    L17_2 = L17_2[L7_2]
    L17_2[L16_2] = true
  end
  L11_2 = L8_2.sale
  L11_2.active = false
  L11_2 = L8_2.rental
  L11_2.active = false
  L11_2 = L8_2.rental
  L12_2 = os
  L12_2 = L12_2.time
  L12_2 = L12_2()
  L11_2.startTime = L12_2
  L11_2 = L8_2.rental
  L11_2.terminateAtPeriod = nil
  L11_2 = L8_2.rental
  L11_2.cycle = A2_2
  L11_2 = library
  L11_2 = L11_2.Notification
  L12_2 = L4_2
  L13_2 = TRANSLATE
  if "weekly" == A2_2 then
    L14_2 = "notify.property:rented_weekly"
    if L14_2 then
      goto lbl_236
    end
  end
  L14_2 = "notify.property:rented_monthly"
  ::lbl_236::
  L15_2 = L9_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = 5000
  L15_2 = "success"
  L11_2(L12_2, L13_2, L14_2, L15_2)
  L8_2.unpaidBills = 0
  L8_2.unpaidRentBills = 0
  L11_2 = library
  L11_2 = L11_2.GetOrCreateBills
  L12_2 = A0_2
  L13_2 = true
  L11_2 = L11_2(L12_2, L13_2)
  L8_2.bills = L11_2
  L11_2 = "UPDATE houses SET renter = @renter, renter_name = @renter_name, sale = @sale, rental = @rental, permissions = @permissions"
  L12_2 = Config
  L12_2 = L12_2.UseKeysOnItem
  if L12_2 then
    L12_2 = Config
    L12_2 = L12_2.AutomaticGiveKeyForProperty
    if L12_2 then
      L12_2 = L11_2
      L13_2 = ", `keys` = @keys"
      L12_2 = L12_2 .. L13_2
      L11_2 = L12_2
      L12_2 = library
      L12_2 = L12_2.GenerateKeySerialNumber
      L13_2 = A0_2
      L12_2 = L12_2(L13_2)
      L13_2 = json
      L13_2 = L13_2.decode
      L14_2 = L8_2.keys
      L13_2 = L13_2(L14_2)
      L8_2.keys = L13_2
      L13_2 = table
      L13_2 = L13_2.insert
      L14_2 = L8_2.keys
      L15_2 = L12_2
      L13_2(L14_2, L15_2)
      L13_2 = json
      L13_2 = L13_2.encode
      L14_2 = L8_2.keys
      L13_2 = L13_2(L14_2)
      L8_2.keys = L13_2
      L13_2 = SV
      L13_2 = L13_2.AddItem
      L14_2 = L4_2
      L15_2 = L6_2
      L16_2 = "house_key"
      L17_2 = 1
      L18_2 = {}
      L18_2.propertyId = A0_2
      L18_2.keySerialNumber = L12_2
      L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
    end
  end
  if L5_2 then
    L12_2 = L11_2
    L13_2 = ", metadata = @metadata"
    L12_2 = L12_2 .. L13_2
    L11_2 = L12_2
  end
  L12_2 = L11_2
  L13_2 = " WHERE id = @id"
  L12_2 = L12_2 .. L13_2
  L11_2 = L12_2
  L12_2 = MySQL
  L12_2 = L12_2.update
  L12_2 = L12_2.await
  L13_2 = L11_2
  L14_2 = {}
  L15_2 = L8_2.renter
  L14_2["@renter"] = L15_2
  L15_2 = L8_2.renter_name
  L14_2["@renter_name"] = L15_2
  L15_2 = L8_2.keys
  L14_2["@keys"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L8_2.permissions
  L15_2 = L15_2(L16_2)
  L14_2["@permissions"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L8_2.metadata
  L15_2 = L15_2(L16_2)
  L14_2["@metadata"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L8_2.sale
  L15_2 = L15_2(L16_2)
  L14_2["@sale"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L8_2.rental
  L15_2 = L15_2(L16_2)
  L14_2["@rental"] = L15_2
  L15_2 = tonumber
  L16_2 = A0_2
  L15_2 = L15_2(L16_2)
  L14_2["@id"] = L15_2
  L12_2(L13_2, L14_2)
  L12_2 = TriggerClientEvent
  L13_2 = "vms_housing:cl:updateProperty"
  L14_2 = -1
  L15_2 = "newRenter"
  L16_2 = A0_2
  L17_2 = {}
  L18_2 = L8_2.renter
  L17_2.renter = L18_2
  L18_2 = L8_2.renter_name
  L17_2.renter_name = L18_2
  L18_2 = L8_2.keys
  L17_2.keys = L18_2
  L18_2 = L8_2.permissions
  L17_2.permissions = L18_2
  L18_2 = L8_2.sale
  L17_2.sale = L18_2
  L18_2 = L8_2.rental
  L17_2.rental = L18_2
  L18_2 = L8_2.bills
  L17_2.bills = L18_2
  L18_2 = L5_2 or L18_2
  if L5_2 then
    L18_2 = A3_2.selectedTheme
  end
  L17_2.iplTheme = L18_2
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = SV
  L12_2 = L12_2.Webhook
  L13_2 = "RentedProperty"
  L14_2 = WebhookText
  L14_2 = L14_2["TITLE.RentedProperty"]
  L15_2 = WebhookText
  L15_2 = L15_2["DESCRIPTION.RentedProperty"]
  L16_2 = L15_2
  L15_2 = L15_2.format
  L17_2 = L8_2.renter_name
  L18_2 = L4_2
  L19_2 = A0_2
  L20_2 = L8_2.rental
  L20_2 = L20_2.price
  L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
  L16_2 = 0
  L17_2 = L7_2
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:enterHouse"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = source
  L2_2 = GetPlayerPed
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = L4_2.playersInside
  if not L5_2 then
    L5_2 = {}
    L4_2.playersInside = L5_2
  end
  L5_2 = table
  L5_2 = L5_2.insert
  L6_2 = L4_2.playersInside
  L7_2 = L1_2
  L5_2(L6_2, L7_2)
  L5_2 = {}
  L5_2.id = A0_2
  L6_2 = L4_2.metadata
  L6_2 = L6_2.exit
  L5_2.coords = L6_2
  L6_2 = Config
  L6_2 = L6_2.Core
  if "ESX" == L6_2 then
    L6_2 = MySQL
    L6_2 = L6_2.query
    L7_2 = "UPDATE `users` SET `last_property` = ? WHERE `identifier` = ?"
    L8_2 = {}
    L9_2 = json
    L9_2 = L9_2.encode
    L10_2 = L5_2
    L9_2 = L9_2(L10_2)
    L10_2 = SV
    L10_2 = L10_2.GetIdentifier
    L11_2 = L3_2
    L10_2, L11_2, L12_2 = L10_2(L11_2)
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L8_2[4] = L12_2
    L6_2(L7_2, L8_2)
    L6_2 = L3_2.set
    L7_2 = "lastProperty"
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  else
    L6_2 = MySQL
    L6_2 = L6_2.query
    L7_2 = "UPDATE `players` SET `last_property` = ? WHERE `citizenid` = ?"
    L8_2 = {}
    L9_2 = json
    L9_2 = L9_2.encode
    L10_2 = L5_2
    L9_2 = L9_2(L10_2)
    L10_2 = SV
    L10_2 = L10_2.GetIdentifier
    L11_2 = L3_2
    L10_2, L11_2, L12_2 = L10_2(L11_2)
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L8_2[4] = L12_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = Player
  L7_2 = L1_2
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2.state
  L6_2.currentProperty = A0_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "UPDATE `houses` SET `last_enter` = ? WHERE `id` = ?"
  L8_2 = {}
  L9_2 = os
  L9_2 = L9_2.time
  L9_2 = L9_2()
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2, L11_2, L12_2 = L10_2(L11_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L6_2(L7_2, L8_2)
  L6_2 = L4_2.type
  if "shell" == L6_2 then
    L6_2 = SetEntityCoords
    L7_2 = L2_2
    L8_2 = vector3
    L9_2 = AvailableShells
    L10_2 = L4_2.metadata
    L10_2 = L10_2.shell
    L9_2 = L9_2[L10_2]
    L9_2 = L9_2.doors
    L9_2 = L9_2.x
    L10_2 = AvailableShells
    L11_2 = L4_2.metadata
    L11_2 = L11_2.shell
    L10_2 = L10_2[L11_2]
    L10_2 = L10_2.doors
    L10_2 = L10_2.y
    L11_2 = AvailableShells
    L12_2 = L4_2.metadata
    L12_2 = L12_2.shell
    L11_2 = L11_2[L12_2]
    L11_2 = L11_2.doors
    L11_2 = L11_2.z
    L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2, L10_2, L11_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L6_2 = SetEntityHeading
    L7_2 = L2_2
    L8_2 = AvailableShells
    L9_2 = L4_2.metadata
    L9_2 = L9_2.shell
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2.doors
    L8_2 = L8_2.heading
    L6_2(L7_2, L8_2)
  else
    L6_2 = L4_2.type
    if "ipl" == L6_2 then
      L6_2 = SetEntityCoords
      L7_2 = L2_2
      L8_2 = vector3
      L9_2 = AvailableIPLS
      L10_2 = L4_2.metadata
      L10_2 = L10_2.ipl
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.doors
      L9_2 = L9_2.x
      L10_2 = AvailableIPLS
      L11_2 = L4_2.metadata
      L11_2 = L11_2.ipl
      L10_2 = L10_2[L11_2]
      L10_2 = L10_2.doors
      L10_2 = L10_2.y
      L11_2 = AvailableIPLS
      L12_2 = L4_2.metadata
      L12_2 = L12_2.ipl
      L11_2 = L11_2[L12_2]
      L11_2 = L11_2.doors
      L11_2 = L11_2.z
      L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2, L10_2, L11_2)
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L6_2 = SetEntityHeading
      L7_2 = L2_2
      L8_2 = AvailableIPLS
      L9_2 = L4_2.metadata
      L9_2 = L9_2.ipl
      L8_2 = L8_2[L9_2]
      L8_2 = L8_2.doors
      L8_2 = L8_2.heading
      L6_2(L7_2, L8_2)
    end
  end
  L6_2 = SetPlayerRoutingBucket
  L7_2 = L1_2
  L8_2 = tonumber
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  L8_2 = L8_2 + 1
  L6_2(L7_2, L8_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:exitHouse"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L4_2 = source
  L5_2 = GetPlayerPed
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = SV
  L6_2 = L6_2.GetPlayer
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = GetProperty
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    return
  end
  L8_2 = L7_2.object_id
  if L8_2 and not A3_2 then
    L8_2 = GetProperty
    L9_2 = L7_2.object_id
    L8_2 = L8_2(L9_2)
    if not L8_2 then
      return
    end
    L9_2 = L8_2.type
    if "building" == L9_2 then
      L7_2 = L8_2
    end
  end
  L8_2 = Config
  L8_2 = L8_2.Core
  if "ESX" == L8_2 then
    L8_2 = MySQL
    L8_2 = L8_2.query
    L9_2 = "UPDATE `users` SET `last_property` = NULL WHERE `identifier` = ?"
    L10_2 = {}
    L11_2 = SV
    L11_2 = L11_2.GetIdentifier
    L12_2 = L6_2
    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L10_2[4] = L14_2
    L8_2(L9_2, L10_2)
    L8_2 = L6_2.set
    L9_2 = "lastProperty"
    L10_2 = nil
    L8_2(L9_2, L10_2)
  else
    L8_2 = MySQL
    L8_2 = L8_2.query
    L9_2 = "UPDATE `players` SET `last_property` = NULL WHERE `citizenid` = ?"
    L10_2 = {}
    L11_2 = SV
    L11_2 = L11_2.GetIdentifier
    L12_2 = L6_2
    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L10_2[4] = L14_2
    L8_2(L9_2, L10_2)
  end
  L8_2 = Player
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  L8_2 = L8_2.state
  L8_2.currentProperty = nil
  if not A2_2 then
    if A3_2 then
      L8_2 = SetEntityCoords
      L9_2 = L5_2
      L10_2 = vector3
      L11_2 = L7_2.metadata
      L11_2 = L11_2.emergencyOutside
      if L11_2 then
        L11_2 = L11_2.x
      end
      if not L11_2 then
        L11_2 = 0.0
      end
      L12_2 = L7_2.metadata
      L12_2 = L12_2.emergencyOutside
      if L12_2 then
        L12_2 = L12_2.y
      end
      if not L12_2 then
        L12_2 = 0.0
      end
      L13_2 = L7_2.metadata
      L13_2 = L13_2.emergencyOutside
      if L13_2 then
        L13_2 = L13_2.z
      end
      if not L13_2 then
        L13_2 = 0.0
      end
      L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2, L13_2)
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      L8_2 = SetEntityHeading
      L9_2 = L5_2
      L10_2 = L7_2.metadata
      L10_2 = L10_2.emergencyOutside
      if L10_2 then
        L10_2 = L10_2.w
      end
      if not L10_2 then
        L10_2 = 0.0
      end
      L8_2(L9_2, L10_2)
    else
      if A1_2 then
        L8_2 = SetEntityCoords
        L9_2 = L5_2
        L10_2 = vector3
        L11_2 = L7_2.metadata
        L11_2 = L11_2.exit
        L11_2 = L11_2.x
        L12_2 = L7_2.metadata
        L12_2 = L12_2.exit
        L12_2 = L12_2.y
        L13_2 = L7_2.metadata
        L13_2 = L13_2.exit
        L13_2 = L13_2.z
        L13_2 = L13_2 - 5.0
        L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2, L13_2)
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      else
        L8_2 = SetEntityCoords
        L9_2 = L5_2
        L10_2 = vector3
        L11_2 = L7_2.metadata
        L11_2 = L11_2.exit
        L11_2 = L11_2.x
        L12_2 = L7_2.metadata
        L12_2 = L12_2.exit
        L12_2 = L12_2.y
        L13_2 = L7_2.metadata
        L13_2 = L13_2.exit
        L13_2 = L13_2.z
        L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2, L13_2)
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      end
      L8_2 = SetEntityHeading
      L9_2 = L5_2
      L10_2 = L7_2.metadata
      L10_2 = L10_2.exit
      L10_2 = L10_2.w
      L8_2(L9_2, L10_2)
    end
  end
  L8_2 = SetPlayerRoutingBucket
  L9_2 = L4_2
  L10_2 = 0
  L8_2(L9_2, L10_2)
  L8_2 = 1
  L9_2 = Properties
  L9_2 = L9_2[A0_2]
  L9_2 = L9_2.playersInside
  L9_2 = #L9_2
  L10_2 = 1
  for L11_2 = L8_2, L9_2, L10_2 do
    L12_2 = Properties
    L12_2 = L12_2[A0_2]
    L12_2 = L12_2.playersInside
    L12_2 = L12_2[L11_2]
    if L12_2 == L4_2 then
      L12_2 = table
      L12_2 = L12_2.remove
      L13_2 = Properties
      L13_2 = L13_2[A0_2]
      L13_2 = L13_2.playersInside
      L14_2 = L11_2
      L12_2(L13_2, L14_2)
      break
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:enterPreviewHouse"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = source
  L2_2 = GetPlayerPed
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SetPlayerRoutingBucket
  L6_2 = L1_2
  L7_2 = tonumber
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2 + 1
  L5_2(L6_2, L7_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:exitPreviewHouse"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = GetPlayerPed
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SetPlayerRoutingBucket
  L6_2 = L1_2
  L7_2 = 0
  L5_2(L6_2, L7_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:enterCameraModeDifferentEnvironment"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = source
  L3_2 = GetPlayerPed
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  if "inside" == A1_2 then
    L5_2 = L3_1
    L6_2 = GetEntityCoords
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    L5_2[L2_2] = L6_2
    L5_2 = L4_2.type
    if "shell" == L5_2 then
      L5_2 = SetEntityCoords
      L6_2 = L3_2
      L7_2 = vector3
      L8_2 = AvailableShells
      L9_2 = L4_2.metadata
      L9_2 = L9_2.shell
      L8_2 = L8_2[L9_2]
      L8_2 = L8_2.doors
      L8_2 = L8_2.x
      L9_2 = AvailableShells
      L10_2 = L4_2.metadata
      L10_2 = L10_2.shell
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.doors
      L9_2 = L9_2.y
      L10_2 = AvailableShells
      L11_2 = L4_2.metadata
      L11_2 = L11_2.shell
      L10_2 = L10_2[L11_2]
      L10_2 = L10_2.doors
      L10_2 = L10_2.z
      L10_2 = L10_2 - 5.0
      L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2, L9_2, L10_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    else
      L5_2 = L4_2.type
      if "ipl" == L5_2 then
        L5_2 = SetEntityCoords
        L6_2 = L3_2
        L7_2 = vector3
        L8_2 = AvailableIPLS
        L9_2 = L4_2.metadata
        L9_2 = L9_2.ipl
        L8_2 = L8_2[L9_2]
        L8_2 = L8_2.doors
        L8_2 = L8_2.x
        L9_2 = AvailableIPLS
        L10_2 = L4_2.metadata
        L10_2 = L10_2.ipl
        L9_2 = L9_2[L10_2]
        L9_2 = L9_2.doors
        L9_2 = L9_2.y
        L10_2 = AvailableIPLS
        L11_2 = L4_2.metadata
        L11_2 = L11_2.ipl
        L10_2 = L10_2[L11_2]
        L10_2 = L10_2.doors
        L10_2 = L10_2.z
        L10_2 = L10_2 - 5.0
        L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2, L9_2, L10_2)
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      end
    end
    L5_2 = SetPlayerRoutingBucket
    L6_2 = L2_2
    L7_2 = tonumber
    L8_2 = A0_2
    L7_2 = L7_2(L8_2)
    L7_2 = L7_2 + 1
    L5_2(L6_2, L7_2)
  else
    L5_2 = SetEntityCoords
    L6_2 = L3_2
    L7_2 = vector3
    L8_2 = L4_2.metadata
    L8_2 = L8_2.exit
    L8_2 = L8_2.x
    L9_2 = L4_2.metadata
    L9_2 = L9_2.exit
    L9_2 = L9_2.y
    L10_2 = L4_2.metadata
    L10_2 = L10_2.exit
    L10_2 = L10_2.z
    L10_2 = L10_2 - 5.0
    L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2, L9_2, L10_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L5_2 = SetPlayerRoutingBucket
    L6_2 = L2_2
    L7_2 = 0
    L5_2(L6_2, L7_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:exitCameraMode"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = source
  L3_2 = GetPlayerPed
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  if "outside" == A1_2 then
    L5_2 = L4_2.type
    if "shell" == L5_2 then
      L5_2 = SetEntityCoords
      L6_2 = L3_2
      L7_2 = vector3
      L8_2 = AvailableShells
      L9_2 = L4_2.metadata
      L9_2 = L9_2.shell
      L8_2 = L8_2[L9_2]
      L8_2 = L8_2.doors
      L8_2 = L8_2.x
      L9_2 = AvailableShells
      L10_2 = L4_2.metadata
      L10_2 = L10_2.shell
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.doors
      L9_2 = L9_2.y
      L10_2 = AvailableShells
      L11_2 = L4_2.metadata
      L11_2 = L11_2.shell
      L10_2 = L10_2[L11_2]
      L10_2 = L10_2.doors
      L10_2 = L10_2.z
      L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2, L9_2, L10_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    else
      L5_2 = L4_2.type
      if "ipl" == L5_2 then
        L5_2 = SetEntityCoords
        L6_2 = L3_2
        L7_2 = vector3
        L8_2 = AvailableIPLS
        L9_2 = L4_2.metadata
        L9_2 = L9_2.ipl
        L8_2 = L8_2[L9_2]
        L8_2 = L8_2.doors
        L8_2 = L8_2.x
        L9_2 = AvailableIPLS
        L10_2 = L4_2.metadata
        L10_2 = L10_2.ipl
        L9_2 = L9_2[L10_2]
        L9_2 = L9_2.doors
        L9_2 = L9_2.y
        L10_2 = AvailableIPLS
        L11_2 = L4_2.metadata
        L11_2 = L11_2.ipl
        L10_2 = L10_2[L11_2]
        L10_2 = L10_2.doors
        L10_2 = L10_2.z
        L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2, L9_2, L10_2)
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      end
    end
    L5_2 = SetPlayerRoutingBucket
    L6_2 = L2_2
    L7_2 = tonumber
    L8_2 = A0_2
    L7_2 = L7_2(L8_2)
    L7_2 = L7_2 + 1
    L5_2(L6_2, L7_2)
  else
    L5_2 = L3_1
    L5_2 = L5_2[L2_2]
    if L5_2 then
      L5_2 = L3_1
      L5_2 = L5_2[L2_2]
      L5_2 = L5_2.x
      if L5_2 then
        L5_2 = SetEntityCoords
        L6_2 = L3_2
        L7_2 = vector3
        L8_2 = L3_1
        L8_2 = L8_2[L2_2]
        L8_2 = L8_2.x
        L9_2 = L3_1
        L9_2 = L9_2[L2_2]
        L9_2 = L9_2.y
        L10_2 = L3_1
        L10_2 = L10_2[L2_2]
        L10_2 = L10_2.z
        L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2, L9_2, L10_2)
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    end
    else
      L5_2 = SetEntityCoords
      L6_2 = L3_2
      L7_2 = vector3
      L8_2 = L4_2.metadata
      L8_2 = L8_2.exit
      L8_2 = L8_2.x
      L9_2 = L4_2.metadata
      L9_2 = L9_2.exit
      L9_2 = L9_2.y
      L10_2 = L4_2.metadata
      L10_2 = L10_2.exit
      L10_2 = L10_2.z
      L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2, L9_2, L10_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    end
    L5_2 = SetPlayerRoutingBucket
    L6_2 = L2_2
    L7_2 = 0
    L5_2(L6_2, L7_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:toggleLight"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = source
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = IsPlayerInProperty
  L4_2 = L1_2
  L5_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    return
  end
  L3_2 = L2_2.metadata
  L3_2 = L3_2.lightState
  if nil == L3_2 then
    L3_2 = L2_2.metadata
    L3_2.lightState = false
  end
  L3_2 = L2_2.metadata
  L4_2 = L2_2.metadata
  L4_2 = L4_2.lightState
  L4_2 = not L4_2
  L3_2.lightState = L4_2
  L3_2 = L2_2.metadata
  L3_2 = L3_2.lightState
  if L3_2 then
    L3_2 = L2_2.metadata
    L4_2 = os
    L4_2 = L4_2.time
    L4_2 = L4_2()
    L3_2.lightStartTime = L4_2
  else
    L3_2 = library
    L3_2 = L3_2.HandleLightStateMonthOverlap
    L4_2 = A0_2
    L3_2(L4_2)
    L3_2 = library
    L3_2 = L3_2.ApplyCurrentLightUsage
    L4_2 = A0_2
    L5_2 = nil
    L6_2 = false
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = MySQL
  L3_2 = L3_2.query
  L4_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L5_2 = {}
  L6_2 = json
  L6_2 = L6_2.encode
  L7_2 = L2_2.metadata
  L6_2 = L6_2(L7_2)
  L7_2 = tonumber
  L8_2 = A0_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L3_2(L4_2, L5_2)
  L3_2 = TriggerClientEvent
  L4_2 = "vms_housing:cl:updateProperty"
  L5_2 = -1
  L6_2 = "toggleLight"
  L7_2 = A0_2
  L8_2 = {}
  L9_2 = L2_2.metadata
  L9_2 = L9_2.lightState
  L8_2.lightState = L9_2
  L9_2 = L1_2
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:ringDoorbell"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = source
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = L2_2.lastDoorBell
  if nil == L3_2 then
    L2_2.lastDoorBell = false
  end
  L3_2 = L2_2.lastDoorBell
  if L3_2 then
    L3_2 = L2_2.lastDoorBell
    L3_2 = L3_2 + 10000
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    if L3_2 >= L4_2 then
      L3_2 = library
      L3_2 = L3_2.Notification
      L4_2 = L1_2
      L5_2 = TRANSLATE
      L6_2 = "notify.wait"
      L5_2 = L5_2(L6_2)
      L6_2 = 5000
      L7_2 = "info"
      return L3_2(L4_2, L5_2, L6_2, L7_2)
    end
  end
  L3_2 = GetGameTimer
  L3_2 = L3_2()
  L2_2.lastDoorBell = L3_2
  L3_2 = TriggerClientEvent
  L4_2 = "vms_housing:cl:updateProperty"
  L5_2 = L1_2
  L6_2 = "ringDoorbell"
  L7_2 = A0_2
  L8_2 = nil
  L9_2 = L1_2
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = L2_2.playersInside
  if L3_2 then
    L3_2 = L2_2.playersInside
    L3_2 = #L3_2
    if L3_2 >= 1 then
      L3_2 = 1
      L4_2 = L2_2.playersInside
      L4_2 = #L4_2
      L5_2 = 1
      for L6_2 = L3_2, L4_2, L5_2 do
        L7_2 = TriggerClientEvent
        L8_2 = "vms_housing:cl:updateProperty"
        L9_2 = L2_2.playersInside
        L9_2 = L9_2[L6_2]
        L10_2 = "ringDoorbell"
        L11_2 = A0_2
        L12_2 = nil
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:toggleLock"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = source
  L4_2 = SV
  L4_2 = L4_2.GetPlayer
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SV
  L5_2 = L5_2.GetIdentifier
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetProperty
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  if A2_2 then
    L6_2.isUnderRaid = false
    L7_2 = L6_2.metadata
    L7_2.locked = true
    L7_2 = MySQL
    L7_2 = L7_2.query
    L8_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
    L9_2 = {}
    L10_2 = json
    L10_2 = L10_2.encode
    L11_2 = L6_2.metadata
    L10_2 = L10_2(L11_2)
    L11_2 = tonumber
    L12_2 = A0_2
    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L9_2[4] = L13_2
    L9_2[5] = L14_2
    L7_2(L8_2, L9_2)
    L7_2 = TriggerClientEvent
    L8_2 = "vms_housing:cl:updateProperty"
    L9_2 = -1
    L10_2 = "toggleLock"
    L11_2 = A0_2
    L12_2 = {}
    L13_2 = L6_2.metadata
    L13_2 = L13_2.locked
    L12_2.locked = L13_2
    L13_2 = L6_2.isUnderRaid
    L12_2.isUnderRaid = L13_2
    L13_2 = L3_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    return
  end
  L7_2 = library
  L7_2 = L7_2.HasKeys
  L8_2 = L3_2
  L9_2 = L5_2
  L10_2 = A0_2
  L11_2 = A1_2
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
  if not L7_2 and not A2_2 then
    L8_2 = library
    L8_2 = L8_2.Notification
    L9_2 = L3_2
    L10_2 = TRANSLATE
    L11_2 = "notify.not_allowed"
    L10_2 = L10_2(L11_2)
    L11_2 = 5500
    L12_2 = "error"
    return L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  L8_2 = L6_2.metadata
  L8_2 = L8_2.locked
  if nil == L8_2 then
    L8_2 = L6_2.metadata
    L8_2.locked = true
  end
  L8_2 = L6_2.metadata
  L9_2 = L6_2.metadata
  L9_2 = L9_2.locked
  L9_2 = not L9_2
  L8_2.locked = L9_2
  L8_2 = MySQL
  L8_2 = L8_2.query
  L9_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L10_2 = {}
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L6_2.metadata
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = A0_2
  L12_2, L13_2, L14_2 = L12_2(L13_2)
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L8_2(L9_2, L10_2)
  L8_2 = TriggerClientEvent
  L9_2 = "vms_housing:cl:updateProperty"
  L10_2 = -1
  L11_2 = "toggleLock"
  L12_2 = A0_2
  L13_2 = {}
  L14_2 = L6_2.metadata
  L14_2 = L14_2.locked
  L13_2.locked = L14_2
  L14_2 = L6_2.isUnderRaid
  L13_2.isUnderRaid = L14_2
  L14_2 = L3_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:toggleDoorlock"
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L6_2 = source
  L7_2 = SV
  L7_2 = L7_2.GetPlayer
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    return
  end
  L8_2 = SV
  L8_2 = L8_2.GetIdentifier
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  L9_2 = GetProperty
  L10_2 = A0_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    return
  end
  if A3_2 then
    if not A5_2 then
      L10_2 = DispatchAlertServer
      if L10_2 then
        L10_2 = Config
        L10_2 = L10_2.Alarm
        L10_2 = L10_2.AlertPoliceOnLockpickFail
        if L10_2 then
          L10_2 = Config
          L10_2 = L10_2.Alarm
          L10_2 = L10_2.AlertPoliceOnlyWithUpgrade
          if L10_2 then
            L10_2 = Config
            L10_2 = L10_2.Alarm
            L10_2 = L10_2.AlertPoliceOnlyWithUpgrade
            if not L10_2 then
              goto lbl_56
            end
            L10_2 = L9_2.metadata
            if L10_2 then
              L10_2 = L10_2.upgrades
            end
            if L10_2 then
              L10_2 = L10_2.alarm
            end
            if not L10_2 then
              goto lbl_56
            end
          end
          L10_2 = DispatchAlertServer
          L11_2 = L6_2
          L12_2 = L7_2
          L13_2 = L9_2
          L14_2 = "failed"
          L10_2(L11_2, L12_2, L13_2, L14_2)
        end
      end
      ::lbl_56::
      return
    end
    L10_2 = Config
    L10_2 = L10_2.Lockpick
    if L10_2 then
      L10_2 = L10_2.Item
    end
    if L10_2 then
      L10_2 = L10_2.Required
    end
    if L10_2 then
      L10_2 = Config
      L10_2 = L10_2.Lockpick
      if L10_2 then
        L10_2 = L10_2.Item
      end
      if L10_2 then
        L10_2 = L10_2.Name
      end
      if L10_2 then
        L10_2 = SV
        L10_2 = L10_2.GetItemCount
        L11_2 = L7_2
        L12_2 = Config
        L12_2 = L12_2.Lockpick
        L12_2 = L12_2.Item
        L12_2 = L12_2.Name
        L10_2 = L10_2(L11_2, L12_2)
        if L10_2 then
          L11_2 = Config
          L11_2 = L11_2.Lockpick
          L11_2 = L11_2.Item
          L11_2 = L11_2.Count
          if not L11_2 then
            L11_2 = 1
          end
          if not (L10_2 < L11_2) then
            goto lbl_106
          end
        end
        L11_2 = library
        L11_2 = L11_2.Notification
        L12_2 = L6_2
        L13_2 = TRANSLATE
        L14_2 = "notify.lockpick:missing_item"
        L13_2 = L13_2(L14_2)
        L14_2 = 5000
        L15_2 = "error"
        do return L11_2(L12_2, L13_2, L14_2, L15_2) end
        ::lbl_106::
        L11_2 = Config
        L11_2 = L11_2.Lockpick
        if L11_2 then
          L11_2 = L11_2.Item
        end
        if L11_2 then
          L11_2 = L11_2.RemoveOnUse
        end
        if L11_2 then
          L11_2 = SV
          L11_2 = L11_2.RemoveItem
          L12_2 = L6_2
          L13_2 = L7_2
          L14_2 = Config
          L14_2 = L14_2.Lockpick
          L14_2 = L14_2.Item
          L14_2 = L14_2.Name
          L15_2 = Config
          L15_2 = L15_2.Lockpick
          L15_2 = L15_2.Item
          L15_2 = L15_2.Count
          if not L15_2 then
            L15_2 = 1
          end
          L11_2(L12_2, L13_2, L14_2, L15_2)
        end
      end
    end
    L10_2 = DispatchAlertServer
    if L10_2 then
      L10_2 = Config
      L10_2 = L10_2.Alarm
      L10_2 = L10_2.AlertPoliceOnLockpickSuccess
      if L10_2 then
        L10_2 = Config
        L10_2 = L10_2.Alarm
        L10_2 = L10_2.AlertPoliceOnlyWithUpgrade
        if L10_2 then
          L10_2 = Config
          L10_2 = L10_2.Alarm
          L10_2 = L10_2.AlertPoliceOnlyWithUpgrade
          if not L10_2 then
            goto lbl_165
          end
          L10_2 = L9_2.metadata
          if L10_2 then
            L10_2 = L10_2.upgrades
          end
          if L10_2 then
            L10_2 = L10_2.alarm
          end
          if not L10_2 then
            goto lbl_165
          end
        end
        L10_2 = DispatchAlertServer
        L11_2 = L6_2
        L12_2 = L7_2
        L13_2 = L9_2
        L14_2 = "success"
        L10_2(L11_2, L12_2, L13_2, L14_2)
      end
    end
    ::lbl_165::
    L10_2 = SV
    L10_2 = L10_2.Webhook
    L11_2 = "LockpickedPropertyDoors"
    L12_2 = WebhookText
    L12_2 = L12_2["TITLE.LockpickedPropertyDoors"]
    L13_2 = WebhookText
    L13_2 = L13_2["DESCRIPTION.LockpickedPropertyDoors"]
    L14_2 = L13_2
    L13_2 = L13_2.format
    L15_2 = SV
    L15_2 = L15_2.GetCharacterName
    L16_2 = L7_2
    L15_2 = L15_2(L16_2)
    L16_2 = L6_2
    L17_2 = A0_2
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    L14_2 = 0
    L15_2 = L8_2
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    L10_2 = L9_2.metadata
    L10_2 = L10_2.doors
    L10_2 = L10_2[A1_2]
    if L10_2 then
      L10_2 = L9_2.metadata
      L10_2 = L10_2.doors
      L10_2 = L10_2[A1_2]
      L10_2.locked = false
    end
  elseif A4_2 then
    L10_2 = L9_2.isUnderRaid
    if L10_2 then
      L10_2 = L9_2.metadata
      L10_2 = L10_2.doors
      L10_2 = L10_2[A1_2]
      if L10_2 then
        L10_2 = L9_2.metadata
        L10_2 = L10_2.doors
        L10_2 = L10_2[A1_2]
        L10_2.locked = true
      end
      L9_2.isUnderRaid = false
    else
      L10_2 = IsAllowedToRaid
      L11_2 = L6_2
      L12_2 = L7_2
      L13_2 = L9_2
      L10_2, L11_2 = L10_2(L11_2, L12_2, L13_2)
      if not L10_2 then
        L12_2 = library
        L12_2 = L12_2.Notification
        L13_2 = L6_2
        L14_2 = TRANSLATE
        L15_2 = "notify.raid:"
        L16_2 = L11_2
        L15_2 = L15_2 .. L16_2
        L14_2 = L14_2(L15_2)
        L15_2 = 5500
        L16_2 = "error"
        return L12_2(L13_2, L14_2, L15_2, L16_2)
      end
      L12_2 = Config
      L12_2 = L12_2.PropertyRaids
      L13_2 = L9_2.metadata
      if L13_2 then
        L13_2 = L13_2.upgrades
      end
      if L13_2 then
        L13_2 = L13_2.antiBurglaryDoors
      end
      if L13_2 then
        L13_2 = library
        L13_2 = L13_2.DrawChance
        L14_2 = L12_2.AntiBurglaryDoors
        L14_2 = L14_2.RaidChance
        L13_2 = L13_2(L14_2)
        if not L13_2 then
          L13_2 = library
          L13_2 = L13_2.Notification
          L14_2 = L6_2
          L15_2 = TRANSLATE
          L16_2 = "notify.raid:failed_due_to_anti_burglary"
          L15_2 = L15_2(L16_2)
          L16_2 = 5500
          L17_2 = "error"
          return L13_2(L14_2, L15_2, L16_2, L17_2)
        end
      end
      L13_2 = L12_2.Item
      if L13_2 then
        L13_2 = L12_2.Item
        L13_2 = L13_2.Required
        if L13_2 then
          L13_2 = L12_2.Item
          L13_2 = L13_2.Name
          if L13_2 then
            L13_2 = L12_2.Item
            L13_2 = L13_2.RemoveOnUse
            if L13_2 then
              L13_2 = SV
              L13_2 = L13_2.RemoveItem
              L14_2 = L6_2
              L15_2 = L7_2
              L16_2 = L12_2.Item
              L16_2 = L16_2.Name
              L17_2 = L12_2.Item
              L17_2 = L17_2.Count
              if not L17_2 then
                L17_2 = 1
              end
              L13_2(L14_2, L15_2, L16_2, L17_2)
            end
          end
        end
      end
      L13_2 = L9_2.metadata
      L13_2 = L13_2.doors
      L13_2 = L13_2[A1_2]
      if L13_2 then
        L13_2 = L9_2.metadata
        L13_2 = L13_2.doors
        L13_2 = L13_2[A1_2]
        L13_2.locked = false
      end
      L9_2.isUnderRaid = true
      L13_2 = L12_2.AntiBurglaryDoors
      L13_2 = L13_2.BreakOnRam
      if L13_2 then
        L13_2 = L9_2.metadata
        if L13_2 then
          L13_2 = L13_2.upgrades
        end
        if L13_2 then
          L13_2 = L13_2.antiBurglaryDoors
        end
        if L13_2 then
          L13_2 = L9_2.metadata
          L13_2 = L13_2.upgrades
          L13_2.antiBurglaryDoors = nil
          L13_2 = MySQL
          L13_2 = L13_2.query
          L14_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
          L15_2 = {}
          L16_2 = json
          L16_2 = L16_2.encode
          L17_2 = L9_2.metadata
          L16_2 = L16_2(L17_2)
          L17_2 = tonumber
          L18_2 = A0_2
          L17_2, L18_2 = L17_2(L18_2)
          L15_2[1] = L16_2
          L15_2[2] = L17_2
          L15_2[3] = L18_2
          L13_2(L14_2, L15_2)
        end
      end
    end
  else
    L10_2 = library
    L10_2 = L10_2.HasKeys
    L11_2 = L6_2
    L12_2 = L8_2
    L13_2 = A0_2
    L14_2 = A2_2
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
    if not L10_2 then
      L11_2 = library
      L11_2 = L11_2.Notification
      L12_2 = L6_2
      L13_2 = TRANSLATE
      L14_2 = "notify.not_allowed"
      L13_2 = L13_2(L14_2)
      L14_2 = 5500
      L15_2 = "error"
      return L11_2(L12_2, L13_2, L14_2, L15_2)
    end
    L11_2 = L9_2.metadata
    L11_2 = L11_2.doors
    L11_2 = L11_2[A1_2]
    if L11_2 then
      L11_2 = L9_2.metadata
      L11_2 = L11_2.doors
      L11_2 = L11_2[A1_2]
      L11_2 = L11_2.locked
      if nil == L11_2 then
        L11_2 = L9_2.metadata
        L11_2 = L11_2.doors
        L11_2 = L11_2[A1_2]
        L11_2.locked = true
      else
        L11_2 = L9_2.metadata
        L11_2 = L11_2.doors
        L11_2 = L11_2[A1_2]
        L12_2 = L9_2.metadata
        L12_2 = L12_2.doors
        L12_2 = L12_2[A1_2]
        L12_2 = L12_2.locked
        L12_2 = not L12_2
        L11_2.locked = L12_2
      end
    end
    L11_2 = MySQL
    L11_2 = L11_2.query
    L12_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
    L13_2 = {}
    L14_2 = json
    L14_2 = L14_2.encode
    L15_2 = L9_2.metadata
    L14_2 = L14_2(L15_2)
    L15_2 = tonumber
    L16_2 = A0_2
    L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L13_2[3] = L16_2
    L13_2[4] = L17_2
    L13_2[5] = L18_2
    L11_2(L12_2, L13_2)
  end
  L10_2 = TriggerClientEvent
  L11_2 = "vms_housing:cl:updateProperty"
  L12_2 = -1
  L13_2 = "toggleDoorlock"
  L14_2 = A0_2
  L15_2 = {}
  L15_2.doorId = A1_2
  L16_2 = L9_2.metadata
  L16_2 = L16_2.doors
  L16_2 = L16_2[A1_2]
  L16_2 = L16_2.locked
  L15_2.locked = L16_2
  L16_2 = L9_2.metadata
  if L16_2 then
    L16_2 = L16_2.upgrades
  end
  if L16_2 then
    L16_2 = L16_2.antiBurglaryDoors
  end
  L15_2.antiBurglaryDoors = L16_2
  L16_2 = L9_2.isUnderRaid
  L15_2.isUnderRaid = L16_2
  L16_2 = L6_2
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:startedLockpickDoors"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = GetProperty
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = DispatchAlertServer
  if L4_2 then
    L4_2 = Config
    L4_2 = L4_2.Alarm
    L4_2 = L4_2.AlertPoliceOnLockpickStart
    if L4_2 then
      L4_2 = Config
      L4_2 = L4_2.Alarm
      L4_2 = L4_2.AlertPoliceOnlyWithUpgrade
      if L4_2 then
        L4_2 = Config
        L4_2 = L4_2.Alarm
        L4_2 = L4_2.AlertPoliceOnlyWithUpgrade
        if not L4_2 then
          goto lbl_48
        end
        L4_2 = L3_2.metadata
        if L4_2 then
          L4_2 = L4_2.upgrades
        end
        if L4_2 then
          L4_2 = L4_2.alarm
        end
        if not L4_2 then
          goto lbl_48
        end
      end
      L4_2 = DispatchAlertServer
      L5_2 = L1_2
      L6_2 = L2_2
      L7_2 = L3_2
      L8_2 = "start"
      L4_2(L5_2, L6_2, L7_2, L8_2)
    end
  end
  ::lbl_48::
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:lockpickDoors"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetProperty
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  if not A1_2 then
    L6_2 = DispatchAlertServer
    if L6_2 then
      L6_2 = Config
      L6_2 = L6_2.Alarm
      L6_2 = L6_2.AlertPoliceOnLockpickFail
      if L6_2 then
        L6_2 = Config
        L6_2 = L6_2.Alarm
        L6_2 = L6_2.AlertPoliceOnlyWithUpgrade
        if L6_2 then
          L6_2 = Config
          L6_2 = L6_2.Alarm
          L6_2 = L6_2.AlertPoliceOnlyWithUpgrade
          if not L6_2 then
            goto lbl_54
          end
          L6_2 = L5_2.metadata
          if L6_2 then
            L6_2 = L6_2.upgrades
          end
          if L6_2 then
            L6_2 = L6_2.alarm
          end
          if not L6_2 then
            goto lbl_54
          end
        end
        L6_2 = DispatchAlertServer
        L7_2 = L2_2
        L8_2 = L3_2
        L9_2 = L5_2
        L10_2 = "failed"
        L6_2(L7_2, L8_2, L9_2, L10_2)
      end
    end
    ::lbl_54::
    return
  end
  L6_2 = Config
  L6_2 = L6_2.Lockpick
  if L6_2 then
    L6_2 = L6_2.Item
  end
  if L6_2 then
    L6_2 = L6_2.Required
  end
  if L6_2 then
    L6_2 = Config
    L6_2 = L6_2.Lockpick
    if L6_2 then
      L6_2 = L6_2.Item
    end
    if L6_2 then
      L6_2 = L6_2.Name
    end
    if L6_2 then
      L6_2 = SV
      L6_2 = L6_2.GetItemCount
      L7_2 = L3_2
      L8_2 = Config
      L8_2 = L8_2.Lockpick
      L8_2 = L8_2.Item
      L8_2 = L8_2.Name
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        L7_2 = Config
        L7_2 = L7_2.Lockpick
        L7_2 = L7_2.Item
        L7_2 = L7_2.Count
        if not L7_2 then
          L7_2 = 1
        end
        if not (L6_2 < L7_2) then
          goto lbl_104
        end
      end
      L7_2 = library
      L7_2 = L7_2.Notification
      L8_2 = L2_2
      L9_2 = TRANSLATE
      L10_2 = "notify.lockpick:missing_item"
      L9_2 = L9_2(L10_2)
      L10_2 = 5000
      L11_2 = "error"
      do return L7_2(L8_2, L9_2, L10_2, L11_2) end
      ::lbl_104::
      L7_2 = Config
      L7_2 = L7_2.Lockpick
      if L7_2 then
        L7_2 = L7_2.Item
      end
      if L7_2 then
        L7_2 = L7_2.RemoveOnUse
      end
      if L7_2 then
        L7_2 = SV
        L7_2 = L7_2.RemoveItem
        L8_2 = L2_2
        L9_2 = L3_2
        L10_2 = Config
        L10_2 = L10_2.Lockpick
        L10_2 = L10_2.Item
        L10_2 = L10_2.Name
        L11_2 = Config
        L11_2 = L11_2.Lockpick
        L11_2 = L11_2.Item
        L11_2 = L11_2.Count
        if not L11_2 then
          L11_2 = 1
        end
        L7_2(L8_2, L9_2, L10_2, L11_2)
      end
    end
  end
  L6_2 = DispatchAlertServer
  if L6_2 then
    L6_2 = Config
    L6_2 = L6_2.Alarm
    L6_2 = L6_2.AlertPoliceOnLockpickSuccess
    if L6_2 then
      L6_2 = Config
      L6_2 = L6_2.Alarm
      L6_2 = L6_2.AlertPoliceOnlyWithUpgrade
      if L6_2 then
        L6_2 = Config
        L6_2 = L6_2.Alarm
        L6_2 = L6_2.AlertPoliceOnlyWithUpgrade
        if not L6_2 then
          goto lbl_163
        end
        L6_2 = L5_2.metadata
        if L6_2 then
          L6_2 = L6_2.upgrades
        end
        if L6_2 then
          L6_2 = L6_2.alarm
        end
        if not L6_2 then
          goto lbl_163
        end
      end
      L6_2 = DispatchAlertServer
      L7_2 = L2_2
      L8_2 = L3_2
      L9_2 = L5_2
      L10_2 = "success"
      L6_2(L7_2, L8_2, L9_2, L10_2)
    end
  end
  ::lbl_163::
  L6_2 = L5_2.metadata
  L6_2.locked = false
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L8_2 = {}
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = L5_2.metadata
  L9_2 = L9_2(L10_2)
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L8_2[5] = L13_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "vms_housing:cl:updateProperty"
  L8_2 = -1
  L9_2 = "toggleLock"
  L10_2 = A0_2
  L11_2 = {}
  L12_2 = L5_2.metadata
  L12_2 = L12_2.locked
  L11_2.locked = L12_2
  L12_2 = L5_2.isUnderRaid
  L11_2.isUnderRaid = L12_2
  L12_2 = L2_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L6_2 = SV
  L6_2 = L6_2.Webhook
  L7_2 = "LockpickedPropertyDoors"
  L8_2 = WebhookText
  L8_2 = L8_2["TITLE.LockpickedPropertyDoors"]
  L9_2 = WebhookText
  L9_2 = L9_2["DESCRIPTION.LockpickedPropertyDoors"]
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = SV
  L11_2 = L11_2.GetCharacterName
  L12_2 = L3_2
  L11_2 = L11_2(L12_2)
  L12_2 = L2_2
  L13_2 = A0_2
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L10_2 = 0
  L11_2 = L4_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:lockdown"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = source
  L2_2 = Config
  L2_2 = L2_2.PropertyLockdown
  L2_2 = L2_2.Enable
  if not L2_2 then
    return
  end
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = Config
  L5_2 = L5_2.PropertyLockdown
  L5_2 = L5_2.Jobs
  if L5_2 then
    L5_2 = SV
    L5_2 = L5_2.GetPlayerJob
    L6_2 = L2_2
    L7_2 = "name"
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = false
    L7_2 = type
    L8_2 = Config
    L8_2 = L8_2.PropertyLockdown
    L8_2 = L8_2.Jobs
    L7_2 = L7_2(L8_2)
    if "table" == L7_2 then
      L7_2 = ipairs
      L8_2 = Config
      L8_2 = L8_2.PropertyLockdown
      L8_2 = L8_2.Jobs
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        if L12_2 == L5_2 then
          L6_2 = true
          break
        end
      end
    else
      L7_2 = Config
      L7_2 = L7_2.PropertyLockdown
      L7_2 = L7_2.Jobs
      if L7_2 == L5_2 then
        L6_2 = true
      end
    end
    if not L6_2 then
      L7_2 = library
      L7_2 = L7_2.Notification
      L8_2 = L1_2
      L9_2 = TRANSLATE
      L10_2 = "notify.not_allowed"
      L9_2 = L9_2(L10_2)
      L10_2 = 5500
      L11_2 = "error"
      return L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  end
  L5_2 = Config
  L5_2 = L5_2.PropertyLockdown
  L5_2 = L5_2.Item
  if L5_2 then
    L5_2 = Config
    L5_2 = L5_2.PropertyLockdown
    L5_2 = L5_2.Item
    L5_2 = L5_2.Required
    if L5_2 then
      L5_2 = SV
      L5_2 = L5_2.GetItemCount
      L6_2 = L2_2
      L7_2 = Config
      L7_2 = L7_2.PropertyLockdown
      L7_2 = L7_2.Item
      L7_2 = L7_2.Name
      L5_2 = L5_2(L6_2, L7_2)
      if L5_2 then
        L6_2 = Config
        L6_2 = L6_2.PropertyLockdown
        L6_2 = L6_2.Item
        L6_2 = L6_2.Count
        if not (L5_2 < L6_2) then
          goto lbl_112
        end
      end
      L6_2 = library
      L6_2 = L6_2.Notification
      L7_2 = L1_2
      L8_2 = TRANSLATE
      L9_2 = "notify.lockdown:missing_item"
      L8_2 = L8_2(L9_2)
      L9_2 = 5000
      L10_2 = "error"
      do return L6_2(L7_2, L8_2, L9_2, L10_2) end
      ::lbl_112::
      L6_2 = Config
      L6_2 = L6_2.PropertyLockdown
      L6_2 = L6_2.Item
      L6_2 = L6_2.RemoveOnUse
      if L6_2 then
        L6_2 = SV
        L6_2 = L6_2.RemoveItem
        L7_2 = L1_2
        L8_2 = L2_2
        L9_2 = Config
        L9_2 = L9_2.PropertyLockdown
        L9_2 = L9_2.Item
        L9_2 = L9_2.Name
        L10_2 = Config
        L10_2 = L10_2.PropertyLockdown
        L10_2 = L10_2.Item
        L10_2 = L10_2.Count
        L6_2(L7_2, L8_2, L9_2, L10_2)
      end
    end
  end
  L5_2 = L4_2.metadata
  L5_2.lockdown = true
  L5_2 = MySQL
  L5_2 = L5_2.query
  L6_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L7_2 = {}
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = L4_2.metadata
  L8_2 = L8_2(L9_2)
  L9_2 = tonumber
  L10_2 = A0_2
  L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  L7_2[6] = L13_2
  L5_2(L6_2, L7_2)
  L5_2 = TriggerClientEvent
  L6_2 = "vms_housing:cl:updateProperty"
  L7_2 = -1
  L8_2 = "lockdown"
  L9_2 = A0_2
  L10_2 = {}
  L11_2 = L4_2.metadata
  L11_2 = L11_2.lockdown
  L10_2.lockdown = L11_2
  L11_2 = L1_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = SV
  L5_2 = L5_2.Webhook
  L6_2 = "LockdownProperty"
  L7_2 = WebhookText
  L7_2 = L7_2["TITLE.LockdownProperty"]
  L8_2 = WebhookText
  L8_2 = L8_2["DESCRIPTION.LockdownProperty"]
  L9_2 = L8_2
  L8_2 = L8_2.format
  L10_2 = SV
  L10_2 = L10_2.GetCharacterName
  L11_2 = L2_2
  L10_2 = L10_2(L11_2)
  L11_2 = L1_2
  L12_2 = A0_2
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L9_2 = 0
  L10_2 = L3_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:removePoliceSeal"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = Config
  L1_2 = L1_2.PropertyLockdown
  L1_2 = L1_2.Enable
  if not L1_2 then
    return
  end
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = Config
  L5_2 = L5_2.PropertyLockdown
  L5_2 = L5_2.Jobs
  if L5_2 then
    L5_2 = SV
    L5_2 = L5_2.GetPlayerJob
    L6_2 = L2_2
    L7_2 = "name"
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = false
    L7_2 = type
    L8_2 = Config
    L8_2 = L8_2.PropertyLockdown
    L8_2 = L8_2.Jobs
    L7_2 = L7_2(L8_2)
    if "table" == L7_2 then
      L7_2 = ipairs
      L8_2 = Config
      L8_2 = L8_2.PropertyLockdown
      L8_2 = L8_2.Jobs
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        if L12_2 == L5_2 then
          L6_2 = true
          break
        end
      end
    else
      L7_2 = Config
      L7_2 = L7_2.PropertyLockdown
      L7_2 = L7_2.Jobs
      if L7_2 == L5_2 then
        L6_2 = true
      end
    end
    if not L6_2 then
      L7_2 = library
      L7_2 = L7_2.Notification
      L8_2 = L1_2
      L9_2 = TRANSLATE
      L10_2 = "notify.not_allowed"
      L9_2 = L9_2(L10_2)
      L10_2 = 5500
      L11_2 = "error"
      return L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  end
  L5_2 = L4_2.metadata
  L5_2.lockdown = false
  L5_2 = MySQL
  L5_2 = L5_2.query
  L6_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L7_2 = {}
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = L4_2.metadata
  L8_2 = L8_2(L9_2)
  L9_2 = tonumber
  L10_2 = A0_2
  L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  L7_2[6] = L13_2
  L5_2(L6_2, L7_2)
  L5_2 = TriggerClientEvent
  L6_2 = "vms_housing:cl:updateProperty"
  L7_2 = -1
  L8_2 = "lockdown"
  L9_2 = A0_2
  L10_2 = {}
  L11_2 = L4_2.metadata
  L11_2 = L11_2.lockdown
  L10_2.lockdown = L11_2
  L11_2 = L1_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = SV
  L5_2 = L5_2.Webhook
  L6_2 = "RemovedPoliceSealProperty"
  L7_2 = WebhookText
  L7_2 = L7_2["TITLE.RemovedPoliceSealProperty"]
  L8_2 = WebhookText
  L8_2 = L8_2["DESCRIPTION.RemovedPoliceSealProperty"]
  L9_2 = L8_2
  L8_2 = L8_2.format
  L10_2 = SV
  L10_2 = L10_2.GetCharacterName
  L11_2 = L2_2
  L10_2 = L10_2(L11_2)
  L11_2 = L1_2
  L12_2 = A0_2
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L9_2 = 0
  L10_2 = L3_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:raidProperty"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = Config
  L1_2 = L1_2.PropertyRaids
  L1_2 = L1_2.Enable
  if not L1_2 then
    return
  end
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = IsAllowedToRaid
  L6_2 = L1_2
  L7_2 = L2_2
  L8_2 = L4_2
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2)
  if not L5_2 then
    if L6_2 then
      L7_2 = library
      L7_2 = L7_2.Notification
      L8_2 = L1_2
      L9_2 = TRANSLATE
      L10_2 = "notify.raid:"
      L11_2 = L6_2
      L10_2 = L10_2 .. L11_2
      L9_2 = L9_2(L10_2)
      L10_2 = 5500
      L11_2 = "error"
      L7_2(L8_2, L9_2, L10_2, L11_2)
    end
    return
  end
  L7_2 = Config
  L7_2 = L7_2.PropertyRaids
  L8_2 = L4_2.metadata
  if L8_2 then
    L8_2 = L8_2.upgrades
  end
  if L8_2 then
    L8_2 = L8_2.antiBurglaryDoors
  end
  if L8_2 then
    L8_2 = library
    L8_2 = L8_2.DrawChance
    L9_2 = L7_2.AntiBurglaryDoors
    L9_2 = L9_2.RaidChance
    L8_2 = L8_2(L9_2)
    if not L8_2 then
      L8_2 = library
      L8_2 = L8_2.Notification
      L9_2 = L1_2
      L10_2 = TRANSLATE
      L11_2 = "notify.raid:failed_due_to_anti_burglary"
      L10_2 = L10_2(L11_2)
      L11_2 = 5500
      L12_2 = "error"
      return L8_2(L9_2, L10_2, L11_2, L12_2)
    end
  end
  L8_2 = L7_2.Item
  if L8_2 then
    L8_2 = L7_2.Item
    L8_2 = L8_2.Required
    if L8_2 then
      L8_2 = L7_2.Item
      L8_2 = L8_2.Name
      if L8_2 then
        L8_2 = L7_2.Item
        L8_2 = L8_2.RemoveOnUse
        if L8_2 then
          L8_2 = SV
          L8_2 = L8_2.RemoveItem
          L9_2 = L1_2
          L10_2 = L2_2
          L11_2 = L7_2.Item
          L11_2 = L11_2.Name
          L12_2 = L7_2.Item
          L12_2 = L12_2.Count
          if not L12_2 then
            L12_2 = 1
          end
          L8_2(L9_2, L10_2, L11_2, L12_2)
        end
      end
    end
  end
  L8_2 = L4_2.metadata
  L8_2.locked = false
  L4_2.isUnderRaid = true
  L8_2 = L7_2.AntiBurglaryDoors
  L8_2 = L8_2.BreakOnRam
  if L8_2 then
    L8_2 = L4_2.metadata
    if L8_2 then
      L8_2 = L8_2.upgrades
    end
    if L8_2 then
      L8_2 = L8_2.antiBurglaryDoors
    end
    if L8_2 then
      L8_2 = L4_2.metadata
      L8_2 = L8_2.upgrades
      L8_2.antiBurglaryDoors = nil
    end
  end
  L8_2 = MySQL
  L8_2 = L8_2.query
  L9_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L10_2 = {}
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L4_2.metadata
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = A0_2
  L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L10_2[5] = L15_2
  L8_2(L9_2, L10_2)
  L8_2 = TriggerClientEvent
  L9_2 = "vms_housing:cl:updateProperty"
  L10_2 = -1
  L11_2 = "raided"
  L12_2 = A0_2
  L13_2 = {}
  L14_2 = L4_2.metadata
  if L14_2 then
    L14_2 = L14_2.upgrades
  end
  if L14_2 then
    L14_2 = L14_2.antiBurglaryDoors
  end
  L13_2.antiBurglaryDoors = L14_2
  L14_2 = L1_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L8_2 = SV
  L8_2 = L8_2.Webhook
  L9_2 = "RaidProperty"
  L10_2 = WebhookText
  L10_2 = L10_2["TITLE.RaidProperty"]
  L11_2 = WebhookText
  L11_2 = L11_2["DESCRIPTION.RaidProperty"]
  L12_2 = L11_2
  L11_2 = L11_2.format
  L13_2 = SV
  L13_2 = L13_2.GetCharacterName
  L14_2 = L2_2
  L13_2 = L13_2(L14_2)
  L14_2 = L1_2
  L15_2 = A0_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L12_2 = 0
  L13_2 = L3_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:buyKey"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = Config
  L2_2 = L2_2.UseKeysOnItem
  if not L2_2 then
    return
  end
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetProperty
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = library
  L6_2 = L6_2.HasPermissions
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = "keysManage"
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.not_allowed"
    L8_2 = L8_2(L9_2)
    L9_2 = 5500
    L10_2 = "error"
    return L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = Config
  L6_2 = L6_2.KeyPrice
  if L6_2 > 0 then
    L6_2 = SV
    L6_2 = L6_2.GetMoney
    L7_2 = L3_2
    L8_2 = "bank"
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L7_2 = tonumber
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        goto lbl_59
      end
    end
    do return end
    ::lbl_59::
    L7_2 = tonumber
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L8_2 = tonumber
    L9_2 = Config
    L9_2 = L9_2.KeyPrice
    L8_2 = L8_2(L9_2)
    if L7_2 < L8_2 then
      L7_2 = library
      L7_2 = L7_2.Notification
      L8_2 = L2_2
      L9_2 = TRANSLATE
      L10_2 = "notify.not_enough_money"
      L9_2 = L9_2(L10_2)
      L10_2 = 5000
      L11_2 = "error"
      return L7_2(L8_2, L9_2, L10_2, L11_2)
    end
    L7_2 = SV
    L7_2 = L7_2.RemoveMoney
    L8_2 = L3_2
    L9_2 = "bank"
    L10_2 = tonumber
    L11_2 = Config
    L11_2 = L11_2.KeyPrice
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  L6_2 = library
  L6_2 = L6_2.GenerateKeySerialNumber
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  L7_2 = json
  L7_2 = L7_2.decode
  L8_2 = L5_2.keys
  L7_2 = L7_2(L8_2)
  L5_2.keys = L7_2
  L7_2 = L5_2.metadata
  L7_2 = L7_2.keysLimit
  if L7_2 then
    L7_2 = L5_2.keys
    L7_2 = #L7_2
    L8_2 = tonumber
    L9_2 = L5_2.metadata
    L9_2 = L9_2.keysLimit
    L8_2 = L8_2(L9_2)
    if L7_2 >= L8_2 then
      L7_2 = json
      L7_2 = L7_2.encode
      L8_2 = L5_2.keys
      L7_2 = L7_2(L8_2)
      L5_2.keys = L7_2
      L7_2 = library
      L7_2 = L7_2.Notification
      L8_2 = L2_2
      L9_2 = TRANSLATE
      L10_2 = "notify.property:reached_keys_limit"
      L9_2 = L9_2(L10_2)
      L10_2 = 5000
      L11_2 = "error"
      return L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  else
    L7_2 = L5_2.keys
    L7_2 = #L7_2
    L8_2 = Config
    L8_2 = L8_2.KeysLimit
    if L7_2 >= L8_2 then
      L7_2 = json
      L7_2 = L7_2.encode
      L8_2 = L5_2.keys
      L7_2 = L7_2(L8_2)
      L5_2.keys = L7_2
      L7_2 = library
      L7_2 = L7_2.Notification
      L8_2 = L2_2
      L9_2 = TRANSLATE
      L10_2 = "notify.property:reached_keys_limit"
      L9_2 = L9_2(L10_2)
      L10_2 = 5000
      L11_2 = "error"
      return L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  end
  L7_2 = table
  L7_2 = L7_2.insert
  L8_2 = L5_2.keys
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = json
  L7_2 = L7_2.encode
  L8_2 = L5_2.keys
  L7_2 = L7_2(L8_2)
  L5_2.keys = L7_2
  if A1_2 then
    L7_2 = SV
    L7_2 = L7_2.GetPlayer
    L8_2 = tonumber
    L9_2 = A1_2
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L8_2(L9_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    if L7_2 then
      L8_2 = SV
      L8_2 = L8_2.AddItem
      L9_2 = tonumber
      L10_2 = A1_2
      L9_2 = L9_2(L10_2)
      L10_2 = L7_2
      L11_2 = "house_key"
      L12_2 = 1
      L13_2 = {}
      L13_2.propertyId = A0_2
      L13_2.keySerialNumber = L6_2
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    else
      L8_2 = SV
      L8_2 = L8_2.AddItem
      L9_2 = L2_2
      L10_2 = L3_2
      L11_2 = "house_key"
      L12_2 = 1
      L13_2 = {}
      L13_2.propertyId = A0_2
      L13_2.keySerialNumber = L6_2
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    end
  else
    L7_2 = SV
    L7_2 = L7_2.AddItem
    L8_2 = L2_2
    L9_2 = L3_2
    L10_2 = "house_key"
    L11_2 = 1
    L12_2 = {}
    L12_2.propertyId = A0_2
    L12_2.keySerialNumber = L6_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  L7_2 = MySQL
  L7_2 = L7_2.query
  L8_2 = "UPDATE `houses` SET `keys` = ? WHERE `id` = ?"
  L9_2 = {}
  L10_2 = L5_2.keys
  L11_2 = tonumber
  L12_2 = A0_2
  L11_2, L12_2, L13_2, L14_2, L15_2 = L11_2(L12_2)
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L9_2[5] = L14_2
  L9_2[6] = L15_2
  L7_2(L8_2, L9_2)
  L7_2 = TriggerClientEvent
  L8_2 = "vms_housing:cl:updateProperty"
  L9_2 = -1
  L10_2 = "keys"
  L11_2 = A0_2
  L12_2 = {}
  L13_2 = L5_2.keys
  L12_2.keys = L13_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  L7_2 = SV
  L7_2 = L7_2.Webhook
  L8_2 = "BoughtKeys"
  L9_2 = WebhookText
  L9_2 = L9_2["TITLE.BoughtKeys"]
  L10_2 = WebhookText
  L10_2 = L10_2["DESCRIPTION.BoughtKeys"]
  L11_2 = L10_2
  L10_2 = L10_2.format
  L12_2 = SV
  L12_2 = L12_2.GetCharacterName
  L13_2 = L3_2
  L12_2 = L12_2(L13_2)
  L13_2 = L2_2
  L14_2 = L6_2
  L15_2 = A0_2
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L11_2 = 0
  L12_2 = L4_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:giveKey"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = Config
  L2_2 = L2_2.UseKeysOnItem
  if L2_2 then
    return
  end
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = tonumber
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  A1_2 = L5_2
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = SV
  L6_2 = L6_2.GetCharacterName
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = SV
  L7_2 = L7_2.GetIdentifier
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  L8_2 = GetProperty
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    return
  end
  L9_2 = library
  L9_2 = L9_2.HasPermissions
  L10_2 = A0_2
  L11_2 = L4_2
  L12_2 = "keysManage"
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  if not L9_2 then
    L9_2 = library
    L9_2 = L9_2.Notification
    L10_2 = L2_2
    L11_2 = TRANSLATE
    L12_2 = "notify.not_allowed"
    L11_2 = L11_2(L12_2)
    L12_2 = 5500
    L13_2 = "error"
    return L9_2(L10_2, L11_2, L12_2, L13_2)
  end
  L9_2 = json
  L9_2 = L9_2.decode
  L10_2 = L8_2.keys
  L9_2 = L9_2(L10_2)
  L8_2.keys = L9_2
  L9_2 = L8_2.keys
  L9_2 = L9_2[L7_2]
  if L9_2 then
    L9_2 = json
    L9_2 = L9_2.encode
    L10_2 = L8_2.keys
    L9_2 = L9_2(L10_2)
    L8_2.keys = L9_2
    L9_2 = library
    L9_2 = L9_2.Notification
    L10_2 = L2_2
    L11_2 = TRANSLATE
    L12_2 = "notify.property:already_have_keys"
    L11_2 = L11_2(L12_2)
    L12_2 = 5500
    L13_2 = "error"
    return L9_2(L10_2, L11_2, L12_2, L13_2)
  end
  L9_2 = 0
  L10_2 = pairs
  L11_2 = L8_2.keys
  L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
  for L14_2 in L10_2, L11_2, L12_2, L13_2 do
    L9_2 = L9_2 + 1
  end
  L10_2 = L8_2.metadata
  L10_2 = L10_2.keysLimit
  if L10_2 then
    L10_2 = tonumber
    L11_2 = L8_2.metadata
    L11_2 = L11_2.keysLimit
    L10_2 = L10_2(L11_2)
    if L9_2 >= L10_2 then
      L10_2 = json
      L10_2 = L10_2.encode
      L11_2 = L8_2.keys
      L10_2 = L10_2(L11_2)
      L8_2.keys = L10_2
      L10_2 = library
      L10_2 = L10_2.Notification
      L11_2 = L2_2
      L12_2 = TRANSLATE
      L13_2 = "notify.property:reached_keys_limit"
      L12_2 = L12_2(L13_2)
      L13_2 = 5000
      L14_2 = "error"
      return L10_2(L11_2, L12_2, L13_2, L14_2)
    end
  else
    L10_2 = Config
    L10_2 = L10_2.KeysLimit
    if L9_2 >= L10_2 then
      L10_2 = json
      L10_2 = L10_2.encode
      L11_2 = L8_2.keys
      L10_2 = L10_2(L11_2)
      L8_2.keys = L10_2
      L10_2 = library
      L10_2 = L10_2.Notification
      L11_2 = L2_2
      L12_2 = TRANSLATE
      L13_2 = "notify.property:reached_keys_limit"
      L12_2 = L12_2(L13_2)
      L13_2 = 5000
      L14_2 = "error"
      return L10_2(L11_2, L12_2, L13_2, L14_2)
    end
  end
  L10_2 = library
  L10_2 = L10_2.Notification
  L11_2 = L2_2
  L12_2 = TRANSLATE
  L13_2 = "notify.property:added_keys"
  L14_2 = L6_2
  L12_2 = L12_2(L13_2, L14_2)
  L13_2 = 5500
  L14_2 = "success"
  L10_2(L11_2, L12_2, L13_2, L14_2)
  L10_2 = L8_2.keys
  L10_2[L7_2] = L6_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L8_2.keys
  L10_2 = L10_2(L11_2)
  L8_2.keys = L10_2
  L10_2 = MySQL
  L10_2 = L10_2.query
  L11_2 = "UPDATE `houses` SET `keys` = ? WHERE `id` = ?"
  L12_2 = {}
  L13_2 = L8_2.keys
  L14_2 = tonumber
  L15_2 = A0_2
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L14_2(L15_2)
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L12_2[4] = L16_2
  L12_2[5] = L17_2
  L12_2[6] = L18_2
  L12_2[7] = L19_2
  L12_2[8] = L20_2
  L10_2(L11_2, L12_2)
  L10_2 = TriggerClientEvent
  L11_2 = "vms_housing:cl:updateProperty"
  L12_2 = -1
  L13_2 = "keys"
  L14_2 = A0_2
  L15_2 = {}
  L16_2 = L8_2.keys
  L15_2.keys = L16_2
  L16_2 = L2_2
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L10_2 = SV
  L10_2 = L10_2.Webhook
  L11_2 = "GaveKeys"
  L12_2 = WebhookText
  L12_2 = L12_2["TITLE.GaveKeys"]
  L13_2 = WebhookText
  L13_2 = L13_2["DESCRIPTION.GaveKeys"]
  L14_2 = L13_2
  L13_2 = L13_2.format
  L15_2 = SV
  L15_2 = L15_2.GetCharacterName
  L16_2 = L3_2
  L15_2 = L15_2(L16_2)
  L16_2 = L2_2
  L17_2 = L6_2
  L18_2 = A1_2
  L19_2 = L7_2
  L20_2 = A0_2
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L14_2 = 0
  L15_2 = L4_2
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:removeKey"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = Config
  L2_2 = L2_2.UseKeysOnItem
  if L2_2 then
    return
  end
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetProperty
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = tostring
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  A1_2 = L6_2
  L6_2 = library
  L6_2 = L6_2.HasPermissions
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = "keysManage"
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.not_allowed"
    L8_2 = L8_2(L9_2)
    L9_2 = 5500
    L10_2 = "error"
    return L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = json
  L6_2 = L6_2.decode
  L7_2 = L5_2.keys
  L6_2 = L6_2(L7_2)
  L5_2.keys = L6_2
  L6_2 = L5_2.keys
  L6_2 = L6_2[A1_2]
  if not L6_2 then
    L6_2 = json
    L6_2 = L6_2.encode
    L7_2 = L5_2.keys
    L6_2 = L6_2(L7_2)
    L5_2.keys = L6_2
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.property:player_dont_have_keys"
    L8_2 = L8_2(L9_2)
    L9_2 = 5500
    L10_2 = "error"
    return L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = library
  L6_2 = L6_2.Notification
  L7_2 = L2_2
  L8_2 = TRANSLATE
  L9_2 = "notify.property:removed_keys"
  L10_2 = L5_2.keys
  L10_2 = L10_2[A1_2]
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = 5500
  L10_2 = "success"
  L6_2(L7_2, L8_2, L9_2, L10_2)
  L6_2 = SV
  L6_2 = L6_2.Webhook
  L7_2 = "RemovedKeys"
  L8_2 = WebhookText
  L8_2 = L8_2["TITLE.RemovedKeys"]
  L9_2 = WebhookText
  L9_2 = L9_2["DESCRIPTION.RemovedKeys"]
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = SV
  L11_2 = L11_2.GetCharacterName
  L12_2 = L3_2
  L11_2 = L11_2(L12_2)
  L12_2 = L2_2
  L13_2 = L5_2.keys
  L13_2 = L13_2[A1_2]
  L14_2 = A1_2
  L15_2 = A0_2
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L10_2 = 0
  L11_2 = L4_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L6_2 = L5_2.keys
  L6_2[A1_2] = nil
  L6_2 = json
  L6_2 = L6_2.encode
  L7_2 = L5_2.keys
  L6_2 = L6_2(L7_2)
  L5_2.keys = L6_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "UPDATE `houses` SET `keys` = ? WHERE `id` = ?"
  L8_2 = {}
  L9_2 = L5_2.keys
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L8_2[5] = L13_2
  L8_2[6] = L14_2
  L8_2[7] = L15_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "vms_housing:cl:updateProperty"
  L8_2 = -1
  L9_2 = "keys"
  L10_2 = A0_2
  L11_2 = {}
  L12_2 = L5_2.keys
  L11_2.keys = L12_2
  L12_2 = L2_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:lockReplacement"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = library
  L5_2 = L5_2.HasPermissions
  L6_2 = A0_2
  L7_2 = L3_2
  L8_2 = "keysManage"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if not L5_2 then
    L5_2 = library
    L5_2 = L5_2.Notification
    L6_2 = L1_2
    L7_2 = TRANSLATE
    L8_2 = "notify.not_allowed"
    L7_2 = L7_2(L8_2)
    L8_2 = 5500
    L9_2 = "error"
    return L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = Config
  L5_2 = L5_2.LockReplacementPrice
  if L5_2 > 0 then
    L5_2 = SV
    L5_2 = L5_2.GetMoney
    L6_2 = L2_2
    L7_2 = "bank"
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      L6_2 = tonumber
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        goto lbl_54
      end
    end
    do return end
    ::lbl_54::
    L6_2 = tonumber
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    L7_2 = tonumber
    L8_2 = Config
    L8_2 = L8_2.LockReplacementPrice
    L7_2 = L7_2(L8_2)
    if L6_2 < L7_2 then
      L6_2 = library
      L6_2 = L6_2.Notification
      L7_2 = L1_2
      L8_2 = TRANSLATE
      L9_2 = "notify.not_enough_money"
      L8_2 = L8_2(L9_2)
      L9_2 = 5000
      L10_2 = "error"
      return L6_2(L7_2, L8_2, L9_2, L10_2)
    end
    L6_2 = SV
    L6_2 = L6_2.RemoveMoney
    L7_2 = L2_2
    L8_2 = "bank"
    L9_2 = tonumber
    L10_2 = Config
    L10_2 = L10_2.LockReplacementPrice
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  L5_2 = json
  L5_2 = L5_2.encode
  L6_2 = {}
  L5_2 = L5_2(L6_2)
  L4_2.keys = L5_2
  L5_2 = MySQL
  L5_2 = L5_2.query
  L6_2 = "UPDATE `houses` SET `keys` = ? WHERE `id` = ?"
  L7_2 = {}
  L8_2 = L4_2.keys
  L9_2 = tonumber
  L10_2 = A0_2
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  L5_2(L6_2, L7_2)
  L5_2 = TriggerClientEvent
  L6_2 = "vms_housing:cl:updateProperty"
  L7_2 = -1
  L8_2 = "keys"
  L9_2 = A0_2
  L10_2 = {}
  L11_2 = L4_2.keys
  L10_2.keys = L11_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = SV
  L5_2 = L5_2.Webhook
  L6_2 = "LockReplacement"
  L7_2 = WebhookText
  L7_2 = L7_2["TITLE.LockReplacement"]
  L8_2 = WebhookText
  L8_2 = L8_2["DESCRIPTION.LockReplacement"]
  L9_2 = L8_2
  L8_2 = L8_2.format
  L10_2 = SV
  L10_2 = L10_2.GetCharacterName
  L11_2 = L2_2
  L10_2 = L10_2(L11_2)
  L11_2 = L1_2
  L12_2 = A0_2
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L9_2 = 0
  L10_2 = L3_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:takeFurnitureToStorage"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetProperty
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = library
  L6_2 = L6_2.HasPermissions
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = "furniture"
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.not_allowed"
    L8_2 = L8_2(L9_2)
    L9_2 = 5500
    L10_2 = "error"
    return L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = pairs
  L7_2 = L5_2.furniture
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = L11_2.id
    if L12_2 == A1_2 then
      L12_2 = L5_2.furniture
      L12_2 = L12_2[L10_2]
      L12_2.stored = 1
      L12_2 = L5_2.furniture
      L12_2 = L12_2[L10_2]
      L12_2.position = nil
      break
    end
  end
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "UPDATE `houses_furniture` SET `stored` = 1, `position` = NULL WHERE `id` = ? AND `house_id` = ?"
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2, L11_2, L12_2 = L10_2(L11_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "vms_housing:cl:updateProperty"
  L8_2 = -1
  L9_2 = "storeFurniture"
  L10_2 = A0_2
  L11_2 = {}
  L11_2.furnitureId = A1_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:checkoutFurniture"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L3_2 = source
  L4_2 = SV
  L4_2 = L4_2.GetPlayer
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SV
  L5_2 = L5_2.GetIdentifier
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetProperty
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = library
  L7_2 = L7_2.HasPermissions
  L8_2 = A0_2
  L9_2 = L5_2
  L10_2 = "furniture"
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  if not L7_2 then
    L7_2 = library
    L7_2 = L7_2.Notification
    L8_2 = L3_2
    L9_2 = TRANSLATE
    L10_2 = "notify.not_allowed"
    L9_2 = L9_2(L10_2)
    L10_2 = 5500
    L11_2 = "error"
    return L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = L6_2.furniture
  if L7_2 then
    L7_2 = L6_2.furniture
    L7_2 = #L7_2
    L8_2 = GetFurnitureLimit
    L9_2 = L6_2.metadata
    L9_2 = L9_2.upgrades
    L8_2 = L8_2(L9_2)
    if L7_2 >= L8_2 then
      L7_2 = library
      L7_2 = L7_2.Notification
      L8_2 = L3_2
      L9_2 = TRANSLATE
      L10_2 = "notify.property:reached_furniture_limit"
      L9_2 = L9_2(L10_2)
      L10_2 = 6000
      L11_2 = "error"
      return L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  end
  L7_2 = Furniture
  L7_2 = L7_2[A2_2]
  if not L7_2 then
    L8_2 = library
    L8_2 = L8_2.Debug
    L9_2 = "Furniture '%s' does not exist!"
    L10_2 = L9_2
    L9_2 = L9_2.format
    L11_2 = A2_2
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = "warn"
    return L8_2(L9_2, L10_2)
  end
  L8_2 = L7_2.deliveryCharge
  if not L8_2 then
    L8_2 = Config
    L8_2 = L8_2.Deliveries
    L9_2 = tostring
    L10_2 = L7_2.deliverySize
    L9_2 = L9_2(L10_2)
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2.defaultDeliveryCharge
  end
  L9_2 = L7_2.price
  if not L9_2 then
    L9_2 = 0
  end
  L10_2 = L8_2 or L10_2
  if not L8_2 then
    L10_2 = 0
  end
  L9_2 = L9_2 + L10_2
  L10_2 = L7_2.price
  if L10_2 or L8_2 then
    L10_2 = SV
    L10_2 = L10_2.GetMoney
    L11_2 = L4_2
    L12_2 = A1_2
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 then
      L11_2 = tonumber
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      if L11_2 then
        goto lbl_108
      end
    end
    do return end
    ::lbl_108::
    L11_2 = tonumber
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    L12_2 = tonumber
    L13_2 = L9_2
    L12_2 = L12_2(L13_2)
    if L11_2 < L12_2 then
      L11_2 = library
      L11_2 = L11_2.Notification
      L12_2 = L3_2
      L13_2 = TRANSLATE
      L14_2 = "notify.not_enough_money"
      L13_2 = L13_2(L14_2)
      L14_2 = 5000
      L15_2 = "error"
      return L11_2(L12_2, L13_2, L14_2, L15_2)
    end
    L11_2 = SV
    L11_2 = L11_2.RemoveMoney
    L12_2 = L4_2
    L13_2 = A1_2
    L14_2 = tonumber
    L15_2 = L9_2
    L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L14_2(L15_2)
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  end
  L10_2 = L7_2.deliveryTime
  if not L10_2 then
    L10_2 = Config
    L10_2 = L10_2.Deliveries
    L11_2 = tostring
    L12_2 = L7_2.deliverySize
    L11_2 = L11_2(L12_2)
    L10_2 = L10_2[L11_2]
    L10_2 = L10_2.defaultDeliveryTime
  end
  L11_2 = {}
  L11_2.model = A2_2
  L11_2.stored = 1
  L12_2 = {}
  L11_2.metadata = L12_2
  L12_2 = MySQL
  L12_2 = L12_2.insert
  L12_2 = L12_2.await
  L13_2 = "INSERT INTO `houses_furniture` (`house_id`, `model`, `stored`, `metadata`) VALUES (?, ?, ?, ?)"
  L14_2 = {}
  L15_2 = A0_2
  L16_2 = L11_2.model
  L17_2 = L11_2.stored
  L18_2 = json
  L18_2 = L18_2.encode
  L19_2 = L11_2.metadata
  L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L18_2(L19_2)
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L14_2[4] = L18_2
  L14_2[5] = L19_2
  L14_2[6] = L20_2
  L14_2[7] = L21_2
  L14_2[8] = L22_2
  L14_2[9] = L23_2
  L14_2[10] = L24_2
  L14_2[11] = L25_2
  L14_2[12] = L26_2
  L14_2[13] = L27_2
  L14_2[14] = L28_2
  L14_2[15] = L29_2
  L12_2 = L12_2(L13_2, L14_2)
  L11_2.id = L12_2
  L13_2 = L7_2.metadata
  if L13_2 then
    L13_2 = L7_2.metadata
    L11_2.metadata = L13_2
  end
  L13_2 = L7_2.interactableName
  if L13_2 then
    L13_2 = L11_2.metadata
    L14_2 = L7_2.interactableName
    L13_2.interactableName = L14_2
    L13_2 = L11_2.metadata
    L13_2 = L13_2.interactableName
    if "storage" == L13_2 then
      L13_2 = L11_2.metadata
      L14_2 = "house_storage-"
      L15_2 = A0_2
      L16_2 = "-"
      L17_2 = L12_2
      L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2
      L13_2.id = L14_2
    end
    L13_2 = L11_2.metadata
    L13_2 = L13_2.interactableName
    if "safe" == L13_2 then
      L13_2 = L11_2.metadata
      L14_2 = "house_safe-"
      L15_2 = A0_2
      L16_2 = "-"
      L17_2 = L12_2
      L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2
      L13_2.id = L14_2
      L13_2 = L11_2.metadata
      L13_2.pin = ""
    end
  end
  L13_2 = Config
  L13_2 = L13_2.DeliveryType
  if 2 ~= L13_2 then
    L13_2 = Config
    L13_2 = L13_2.DeliveryType
    if 3 ~= L13_2 then
      goto lbl_233
    end
  end
  L13_2 = L11_2.metadata
  L14_2 = math
  L14_2 = L14_2.floor
  L15_2 = os
  L15_2 = L15_2.time
  L15_2 = L15_2()
  L16_2 = L10_2 / 1000
  L15_2 = L15_2 + L16_2
  L14_2 = L14_2(L15_2)
  L13_2.deliveryTime = L14_2
  L13_2 = table
  L13_2 = L13_2.insert
  L14_2 = PendingDeliveries
  L15_2 = {}
  L15_2.propertyId = A0_2
  L15_2.furnitureId = L12_2
  L16_2 = L11_2.metadata
  L16_2 = L16_2.deliveryTime
  L15_2.deliveryTime = L16_2
  L13_2(L14_2, L15_2)
  ::lbl_233::
  L13_2 = SV
  L13_2 = L13_2.Webhook
  L14_2 = "OrderedFurniture"
  L15_2 = WebhookText
  L15_2 = L15_2["TITLE.OrderedFurniture"]
  L16_2 = WebhookText
  L16_2 = L16_2["DESCRIPTION.OrderedFurniture"]
  L17_2 = L16_2
  L16_2 = L16_2.format
  L18_2 = SV
  L18_2 = L18_2.GetCharacterName
  L19_2 = L4_2
  L18_2 = L18_2(L19_2)
  L19_2 = L3_2
  L20_2 = A0_2
  L21_2 = L7_2.label
  L22_2 = A2_2
  L23_2 = L7_2.price
  if not L23_2 then
    L23_2 = 0
  end
  L24_2 = L8_2 or L24_2
  if not L8_2 then
    L24_2 = 0
  end
  L25_2 = L9_2
  L26_2 = L11_2.metadata
  L26_2 = L26_2.deliveryTime
  L27_2 = L7_2.interactableName
  if not L27_2 then
    L27_2 = "-"
  end
  L28_2 = library
  L28_2 = L28_2.Dump
  L29_2 = L11_2.metadata
  L28_2, L29_2 = L28_2(L29_2)
  L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  L17_2 = 0
  L18_2 = L5_2
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L13_2 = library
  L13_2 = L13_2.Notification
  L14_2 = L3_2
  L15_2 = TRANSLATE
  L16_2 = "notify.property:ordered_furniture"
  L17_2 = L7_2.label
  L18_2 = L9_2
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L16_2 = 5000
  L17_2 = "success"
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = next
  L14_2 = L11_2.metadata
  L13_2 = L13_2(L14_2)
  if L13_2 then
    L13_2 = MySQL
    L13_2 = L13_2.query
    L14_2 = "UPDATE `houses_furniture` SET `metadata` = ? WHERE `id` = ? AND `house_id` = ?"
    L15_2 = {}
    L16_2 = json
    L16_2 = L16_2.encode
    L17_2 = L11_2.metadata
    L16_2 = L16_2(L17_2)
    L17_2 = L12_2
    L18_2 = tonumber
    L19_2 = A0_2
    L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L18_2(L19_2)
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L15_2[3] = L18_2
    L15_2[4] = L19_2
    L15_2[5] = L20_2
    L15_2[6] = L21_2
    L15_2[7] = L22_2
    L15_2[8] = L23_2
    L15_2[9] = L24_2
    L15_2[10] = L25_2
    L15_2[11] = L26_2
    L15_2[12] = L27_2
    L15_2[13] = L28_2
    L15_2[14] = L29_2
    L13_2(L14_2, L15_2)
    L13_2 = L11_2.metadata
    L13_2 = L13_2.interactableName
    if "storage" ~= L13_2 then
      L13_2 = L11_2.metadata
      L13_2 = L13_2.interactableName
      if "safe" ~= L13_2 then
        goto lbl_314
      end
    end
    L13_2 = library
    L13_2 = L13_2.RegisterStorage
    L14_2 = L11_2.metadata
    L13_2(L14_2)
  end
  ::lbl_314::
  L13_2 = Properties
  L13_2 = L13_2[A0_2]
  L13_2 = L13_2.furniture
  if not L13_2 then
    L13_2 = Properties
    L13_2 = L13_2[A0_2]
    L14_2 = {}
    L13_2.furniture = L14_2
  end
  L13_2 = table
  L13_2 = L13_2.insert
  L14_2 = Properties
  L14_2 = L14_2[A0_2]
  L14_2 = L14_2.furniture
  L15_2 = L11_2
  L13_2(L14_2, L15_2)
  L13_2 = TriggerClientEvent
  L14_2 = "vms_housing:cl:updateProperty"
  L15_2 = -1
  L16_2 = "orderedFurniture"
  L17_2 = A0_2
  L18_2 = {}
  L18_2.furniture = L11_2
  L19_2 = L3_2
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:placeFurniture"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetProperty
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = library
  L6_2 = L6_2.HasPermissions
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = "furniture"
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.not_allowed"
    L8_2 = L8_2(L9_2)
    L9_2 = 5500
    L10_2 = "error"
    return L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = {}
  L7_2 = A1_2.isInside
  if L7_2 then
    L7_2 = "inside"
    if L7_2 then
      goto lbl_46
    end
  end
  L7_2 = "outside"
  ::lbl_46::
  L6_2.environment = L7_2
  L7_2 = A1_2.coords
  L7_2 = L7_2.x
  L6_2.x = L7_2
  L7_2 = A1_2.coords
  L7_2 = L7_2.y
  L6_2.y = L7_2
  L7_2 = A1_2.coords
  L7_2 = L7_2.z
  L6_2.z = L7_2
  L7_2 = A1_2.rotation
  L7_2 = L7_2.x
  L6_2.pitch = L7_2
  L7_2 = A1_2.rotation
  L7_2 = L7_2.y
  L6_2.roll = L7_2
  L7_2 = A1_2.rotation
  L7_2 = L7_2.z
  L6_2.yaw = L7_2
  L7_2 = false
  L8_2 = nil
  L9_2 = pairs
  L10_2 = L5_2.furniture
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = L14_2.id
    L16_2 = A1_2.id
    if L15_2 == L16_2 then
      L8_2 = L13_2
      L15_2 = L14_2.metadata
      if L15_2 then
        L15_2 = L14_2.metadata
        L15_2 = L15_2.deliveryTime
        if L15_2 then
          L7_2 = true
          return
        end
      end
      if not L7_2 then
        L15_2 = L14_2.metadata
        if L15_2 then
          L15_2 = L14_2.metadata
          L15_2 = L15_2.interactableName
          if "storage" ~= L15_2 then
            L15_2 = L14_2.metadata
            L15_2 = L15_2.interactableName
            if "safe" ~= L15_2 then
              goto lbl_102
            end
          end
          L15_2 = library
          L15_2 = L15_2.RegisterStorage
          L16_2 = L14_2.metadata
          L15_2(L16_2)
        end
      end
      ::lbl_102::
      L15_2 = L5_2.furniture
      L15_2 = L15_2[L13_2]
      L15_2.stored = 0
      L15_2 = L5_2.furniture
      L15_2 = L15_2[L13_2]
      L15_2.position = L6_2
      break
    end
  end
  if L7_2 then
    return
  end
  L9_2 = MySQL
  L9_2 = L9_2.query
  L10_2 = "UPDATE `houses_furniture` SET `position` = ?, `stored` = 0 WHERE `id` = ? AND `house_id` = ?"
  L11_2 = {}
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L6_2
  L12_2 = L12_2(L13_2)
  L13_2 = A1_2.id
  L14_2 = tonumber
  L15_2 = A0_2
  L14_2, L15_2, L16_2 = L14_2(L15_2)
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L11_2[4] = L15_2
  L11_2[5] = L16_2
  L9_2(L10_2, L11_2)
  L9_2 = TriggerClientEvent
  L10_2 = "vms_housing:cl:updateProperty"
  L11_2 = -1
  L12_2 = "placedFurniture"
  L13_2 = A0_2
  L14_2 = {}
  L15_2 = A1_2.id
  L14_2.furnitureId = L15_2
  L14_2.position = L6_2
  L15_2 = L2_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:sellFurniture"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L3_2 = source
  if A2_2 then
    L4_2 = Furniture
    L4_2 = L4_2[A2_2]
    if L4_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L4_2 = SV
  L4_2 = L4_2.GetPlayer
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SV
  L5_2 = L5_2.GetIdentifier
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetProperty
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = library
  L7_2 = L7_2.HasPermissions
  L8_2 = A0_2
  L9_2 = L5_2
  L10_2 = "furniture"
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  if not L7_2 then
    L7_2 = library
    L7_2 = L7_2.Notification
    L8_2 = L3_2
    L9_2 = TRANSLATE
    L10_2 = "notify.not_allowed"
    L9_2 = L9_2(L10_2)
    L10_2 = 5500
    L11_2 = "error"
    return L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = Furniture
  L7_2 = L7_2[A2_2]
  if L7_2 then
    L8_2 = L7_2.price
    if L8_2 >= 1 then
      L8_2 = Config
      L8_2 = L8_2.FurnitureSellPercentage
      if L8_2 >= 1 then
        L8_2 = math
        L8_2 = L8_2.floor
        L9_2 = L7_2.price
        L10_2 = Config
        L10_2 = L10_2.FurnitureSellPercentage
        L10_2 = L10_2 / 100
        L9_2 = L9_2 * L10_2
        L8_2 = L8_2(L9_2)
        if L8_2 < 1 then
          L9_2 = library
          L9_2 = L9_2.Notification
          L10_2 = L3_2
          L11_2 = TRANSLATE
          L12_2 = "notify.furniture:cannot_sold"
          L11_2 = L11_2(L12_2)
          L12_2 = 5500
          L13_2 = "error"
          return L9_2(L10_2, L11_2, L12_2, L13_2)
        end
        L9_2 = SV
        L9_2 = L9_2.AddMoney
        L10_2 = L4_2
        L11_2 = "bank"
        L12_2 = L8_2
        L9_2(L10_2, L11_2, L12_2)
        L9_2 = library
        L9_2 = L9_2.Notification
        L10_2 = L3_2
        L11_2 = TRANSLATE
        L12_2 = "notify.furniture:sold"
        L13_2 = A1_2
        L14_2 = L8_2
        L11_2 = L11_2(L12_2, L13_2, L14_2)
        L12_2 = 5500
        L13_2 = "success"
        L9_2(L10_2, L11_2, L12_2, L13_2)
        L9_2 = SV
        L9_2 = L9_2.Webhook
        L10_2 = "SoldFurniture"
        L11_2 = WebhookText
        L11_2 = L11_2["TITLE.SoldFurniture"]
        L12_2 = WebhookText
        L12_2 = L12_2["DESCRIPTION.SoldFurniture"]
        L13_2 = L12_2
        L12_2 = L12_2.format
        L14_2 = SV
        L14_2 = L14_2.GetCharacterName
        L15_2 = L4_2
        L14_2 = L14_2(L15_2)
        L15_2 = L3_2
        L16_2 = L7_2.label
        L17_2 = A2_2
        L18_2 = A1_2
        L19_2 = A0_2
        L20_2 = L8_2
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L13_2 = 0
        L14_2 = L5_2
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    end
  end
  else
    L8_2 = library
    L8_2 = L8_2.Notification
    L9_2 = L3_2
    L10_2 = TRANSLATE
    L11_2 = "notify.furniture:cannot_sold"
    L10_2 = L10_2(L11_2)
    L11_2 = 5500
    L12_2 = "error"
    return L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  L8_2 = pairs
  L9_2 = L6_2.furniture
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = L13_2.id
    if L14_2 == A1_2 then
      L14_2 = table
      L14_2 = L14_2.remove
      L15_2 = L6_2.furniture
      L16_2 = L12_2
      L14_2(L15_2, L16_2)
      break
    end
  end
  L8_2 = MySQL
  L8_2 = L8_2.prepare
  L9_2 = "DELETE FROM houses_furniture WHERE `house_id` = ? AND `id` = ? AND `stored` = 1"
  L10_2 = {}
  L11_2 = tonumber
  L12_2 = A0_2
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = A1_2
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L12_2(L13_2)
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L10_2[5] = L15_2
  L10_2[6] = L16_2
  L10_2[7] = L17_2
  L10_2[8] = L18_2
  L10_2[9] = L19_2
  L10_2[10] = L20_2
  L8_2(L9_2, L10_2)
  L8_2 = TriggerClientEvent
  L9_2 = "vms_housing:cl:updateProperty"
  L10_2 = -1
  L11_2 = "soldFurniture"
  L12_2 = A0_2
  L13_2 = {}
  L13_2.furnitureId = A1_2
  L14_2 = L3_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:removeFurniture"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = source
  L4_2 = SV
  L4_2 = L4_2.GetPlayer
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SV
  L5_2 = L5_2.GetIdentifier
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetProperty
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = library
  L7_2 = L7_2.HasPermissions
  L8_2 = A0_2
  L9_2 = L5_2
  L10_2 = "furniture"
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  if not L7_2 then
    L7_2 = library
    L7_2 = L7_2.Notification
    L8_2 = L3_2
    L9_2 = TRANSLATE
    L10_2 = "notify.not_allowed"
    L9_2 = L9_2(L10_2)
    L10_2 = 5500
    L11_2 = "error"
    return L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = library
  L7_2 = L7_2.Notification
  L8_2 = L3_2
  L9_2 = TRANSLATE
  L10_2 = "notify.furniture:removed"
  L11_2 = A1_2
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = 5500
  L11_2 = "error"
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2 = pairs
  L8_2 = L6_2.furniture
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = L12_2.id
    if L13_2 == A1_2 then
      L13_2 = table
      L13_2 = L13_2.remove
      L14_2 = L6_2.furniture
      L15_2 = L11_2
      L13_2(L14_2, L15_2)
      break
    end
  end
  L7_2 = Furniture
  L7_2 = L7_2[A2_2]
  L8_2 = SV
  L8_2 = L8_2.Webhook
  L9_2 = "RemovedFurniture"
  L10_2 = WebhookText
  L10_2 = L10_2["TITLE.RemovedFurniture"]
  L11_2 = WebhookText
  L11_2 = L11_2["DESCRIPTION.RemovedFurniture"]
  L12_2 = L11_2
  L11_2 = L11_2.format
  L13_2 = SV
  L13_2 = L13_2.GetCharacterName
  L14_2 = L4_2
  L13_2 = L13_2(L14_2)
  L14_2 = L3_2
  L15_2 = L7_2.label
  L16_2 = A2_2
  L17_2 = A1_2
  L18_2 = A0_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L12_2 = 0
  L13_2 = L5_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = MySQL
  L8_2 = L8_2.prepare
  L9_2 = "DELETE FROM houses_furniture WHERE `house_id` = ? AND `id` = ? AND `stored` = 1"
  L10_2 = {}
  L11_2 = tonumber
  L12_2 = A0_2
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = A1_2
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L12_2(L13_2)
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L10_2[5] = L15_2
  L10_2[6] = L16_2
  L10_2[7] = L17_2
  L10_2[8] = L18_2
  L8_2(L9_2, L10_2)
  L8_2 = TriggerClientEvent
  L9_2 = "vms_housing:cl:updateProperty"
  L10_2 = -1
  L11_2 = "removedFurniture"
  L12_2 = A0_2
  L13_2 = {}
  L13_2.furnitureId = A1_2
  L14_2 = L3_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:changeSafePin"
function L7_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L4_2 = source
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = SV
  L6_2 = L6_2.GetIdentifier
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = GetProperty
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    return
  end
  L8_2 = nil
  L9_2 = pairs
  L10_2 = L7_2.furniture
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = L14_2.id
    if L15_2 == A1_2 then
      L8_2 = L13_2
      break
    end
  end
  if not L8_2 then
    return
  end
  L9_2 = L7_2.furniture
  L9_2 = L9_2[L8_2]
  L10_2 = L9_2.position
  if not L10_2 then
    return
  end
  L10_2 = L9_2.metadata
  if not L10_2 then
    return
  end
  L10_2 = L9_2.metadata
  L10_2 = L10_2.interactableName
  if L10_2 then
    L10_2 = L9_2.metadata
    L10_2 = L10_2.interactableName
    if "safe" == L10_2 then
      goto lbl_54
    end
  end
  do return end
  ::lbl_54::
  if A2_2 == A3_2 then
    L10_2 = library
    L10_2 = L10_2.Notification
    L11_2 = L4_2
    L12_2 = TRANSLATE
    L13_2 = "notify.safe:cannot_set_same_pin"
    L12_2 = L12_2(L13_2)
    L13_2 = 5500
    L14_2 = "error"
    return L10_2(L11_2, L12_2, L13_2, L14_2)
  end
  L10_2 = L9_2.metadata
  L10_2 = L10_2.pin
  if A3_2 ~= L10_2 then
    L10_2 = library
    L10_2 = L10_2.Notification
    L11_2 = L4_2
    L12_2 = TRANSLATE
    L13_2 = "notify.safe:wrong_old_pin_was_entered"
    L12_2 = L12_2(L13_2)
    L13_2 = 5500
    L14_2 = "error"
    return L10_2(L11_2, L12_2, L13_2, L14_2)
  end
  L10_2 = library
  L10_2 = L10_2.Notification
  L11_2 = L4_2
  L12_2 = TRANSLATE
  L13_2 = "notify.safe:changed_pin"
  L14_2 = A3_2
  L15_2 = A2_2
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L13_2 = 5500
  L14_2 = "success"
  L10_2(L11_2, L12_2, L13_2, L14_2)
  L10_2 = SV
  L10_2 = L10_2.Webhook
  L11_2 = "ChangedSafePin"
  L12_2 = WebhookText
  L12_2 = L12_2["TITLE.ChangedSafePin"]
  L13_2 = WebhookText
  L13_2 = L13_2["DESCRIPTION.ChangedSafePin"]
  L14_2 = L13_2
  L13_2 = L13_2.format
  L15_2 = SV
  L15_2 = L15_2.GetCharacterName
  L16_2 = L5_2
  L15_2 = L15_2(L16_2)
  L16_2 = L4_2
  L17_2 = L8_2
  L18_2 = A3_2
  L19_2 = A2_2
  L20_2 = A0_2
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L14_2 = 0
  L15_2 = L6_2
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L10_2 = L7_2.furniture
  L10_2 = L10_2[L8_2]
  L10_2 = L10_2.metadata
  L10_2.pin = A2_2
  L10_2 = MySQL
  L10_2 = L10_2.query
  L11_2 = "UPDATE `houses_furniture` SET `metadata` = ? WHERE `id` = ? AND `house_id` = ?"
  L12_2 = {}
  L13_2 = json
  L13_2 = L13_2.encode
  L14_2 = L7_2.furniture
  L14_2 = L14_2[L8_2]
  L14_2 = L14_2.metadata
  L13_2 = L13_2(L14_2)
  L14_2 = A1_2
  L15_2 = tonumber
  L16_2 = A0_2
  L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L15_2(L16_2)
  L12_2[1] = L13_2
  L12_2[2] = L14_2
  L12_2[3] = L15_2
  L12_2[4] = L16_2
  L12_2[5] = L17_2
  L12_2[6] = L18_2
  L12_2[7] = L19_2
  L12_2[8] = L20_2
  L10_2(L11_2, L12_2)
  L10_2 = TriggerClientEvent
  L11_2 = "vms_housing:cl:updateProperty"
  L12_2 = -1
  L13_2 = "changedSafePin"
  L14_2 = A0_2
  L15_2 = {}
  L15_2.furnitureId = A1_2
  L16_2 = L7_2.furniture
  L16_2 = L16_2[L8_2]
  L16_2 = L16_2.metadata
  L16_2 = L16_2.pin
  L15_2.newPin = L16_2
  L16_2 = L4_2
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:unpackDelivery"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = Config
  L1_2 = L1_2.DeliveryType
  if 3 ~= L1_2 then
    return
  end
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = pairs
  L6_2 = L4_2.furniture
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L10_2.metadata
    if L11_2 then
      L11_2 = L10_2.metadata
      L11_2 = L11_2.delivered
      if L11_2 then
        L11_2 = L10_2.metadata
        L11_2.delivered = nil
      end
    end
  end
  L5_2 = MySQL
  L5_2 = L5_2.query
  L6_2 = [[
        UPDATE `houses_furniture`
        SET 
            `metadata` = REPLACE(
                REPLACE(
                    REPLACE(`metadata`, '"delivered":true,', ''),
                ',"delivered":true', ''),
            '"delivered":true', '')
        WHERE 
            `house_id` = ? AND `metadata` LIKE '%"delivered":true%'
    ]]
  L7_2 = {}
  L8_2 = tonumber
  L9_2 = A0_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L5_2(L6_2, L7_2)
  L5_2 = TriggerClientEvent
  L6_2 = "vms_housing:cl:updateProperty"
  L7_2 = -1
  L8_2 = "unpackedDelivery"
  L9_2 = A0_2
  L10_2 = {}
  L11_2 = L1_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:upgrade"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = Config
  L2_2 = L2_2.HousingUpgrades
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    return
  end
  L3_2 = source
  L4_2 = SV
  L4_2 = L4_2.GetPlayer
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SV
  L5_2 = L5_2.GetIdentifier
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetProperty
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = library
  L7_2 = L7_2.HasPermissions
  L8_2 = A0_2
  L9_2 = L5_2
  L10_2 = "upgradesManage"
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  if not L7_2 then
    L7_2 = library
    L7_2 = L7_2.Notification
    L8_2 = L3_2
    L9_2 = TRANSLATE
    L10_2 = "notify.not_allowed"
    L9_2 = L9_2(L10_2)
    L10_2 = 5500
    L11_2 = "error"
    return L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = L2_2.levels
  if L7_2 then
    L7_2 = L6_2.metadata
    L7_2 = L7_2.upgrades
    if not L7_2 then
      goto lbl_307
    end
    L8_2 = L2_2.metadata
    L7_2 = L7_2[L8_2]
    if not L7_2 then
      L7_2 = "0"
    end
    L8_2 = L2_2.levels
    L9_2 = tostring
    L10_2 = tonumber
    L11_2 = L7_2
    L10_2 = L10_2(L11_2)
    L10_2 = L10_2 + 1
    L9_2 = L9_2(L10_2)
    L8_2 = L8_2[L9_2]
    L9_2 = L8_2.price
    if L9_2 then
      L9_2 = false
      L10_2 = SV
      L10_2 = L10_2.GetMoney
      L11_2 = L4_2
      L12_2 = "cash"
      L10_2 = L10_2(L11_2, L12_2)
      L11_2 = L8_2.price
      if L10_2 >= L11_2 then
        L9_2 = true
        L11_2 = SV
        L11_2 = L11_2.RemoveMoney
        L12_2 = L4_2
        L13_2 = "cash"
        L14_2 = L8_2.price
        L11_2(L12_2, L13_2, L14_2)
      else
        L11_2 = SV
        L11_2 = L11_2.GetMoney
        L12_2 = L4_2
        L13_2 = "bank"
        L11_2 = L11_2(L12_2, L13_2)
        L12_2 = L8_2.price
        if L11_2 >= L12_2 then
          L9_2 = true
          L12_2 = SV
          L12_2 = L12_2.RemoveMoney
          L13_2 = L4_2
          L14_2 = "bank"
          L15_2 = L8_2.price
          L12_2(L13_2, L14_2, L15_2)
        end
      end
      if L9_2 then
        L11_2 = library
        L11_2 = L11_2.Notification
        L12_2 = L3_2
        L13_2 = TRANSLATE
        L14_2 = "notify.property:purchased_upgrade"
        L15_2 = L2_2.label
        L16_2 = L8_2.price
        L13_2 = L13_2(L14_2, L15_2, L16_2)
        L14_2 = 5500
        L15_2 = "success"
        L11_2(L12_2, L13_2, L14_2, L15_2)
      else
        L11_2 = library
        L11_2 = L11_2.Notification
        L12_2 = L3_2
        L13_2 = TRANSLATE
        L14_2 = "notify.not_enough_money"
        L13_2 = L13_2(L14_2)
        L14_2 = 5000
        L15_2 = "error"
        return L11_2(L12_2, L13_2, L14_2, L15_2)
      end
    else
      L9_2 = library
      L9_2 = L9_2.Notification
      L10_2 = L3_2
      L11_2 = TRANSLATE
      L12_2 = "notify.property:purchased_upgrade_free"
      L13_2 = L2_2.label
      L11_2 = L11_2(L12_2, L13_2)
      L12_2 = 5500
      L13_2 = "success"
      L9_2(L10_2, L11_2, L12_2, L13_2)
    end
    L9_2 = L6_2.metadata
    L9_2 = L9_2.upgrades
    if not L9_2 then
      L9_2 = L6_2.metadata
      L10_2 = {}
      L9_2.upgrades = L10_2
    end
    L9_2 = L6_2.metadata
    L9_2 = L9_2.upgrades
    L10_2 = L2_2.metadata
    L11_2 = tostring
    L12_2 = tonumber
    L13_2 = L7_2
    L12_2 = L12_2(L13_2)
    L12_2 = L12_2 + 1
    L11_2 = L11_2(L12_2)
    L9_2[L10_2] = L11_2
    L9_2 = SV
    L9_2 = L9_2.Webhook
    L10_2 = "UpgradedToLevel"
    L11_2 = WebhookText
    L11_2 = L11_2["TITLE.UpgradedToLevel"]
    L12_2 = WebhookText
    L12_2 = L12_2["DESCRIPTION.UpgradedToLevel"]
    L13_2 = L12_2
    L12_2 = L12_2.format
    L14_2 = SV
    L14_2 = L14_2.GetCharacterName
    L15_2 = L4_2
    L14_2 = L14_2(L15_2)
    L15_2 = L3_2
    L16_2 = L2_2.label
    L17_2 = L6_2.metadata
    L17_2 = L17_2.upgrades
    L18_2 = L2_2.metadata
    L17_2 = L17_2[L18_2]
    L18_2 = L8_2.price
    L19_2 = A0_2
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L13_2 = 0
    L14_2 = L5_2
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  else
    L7_2 = L2_2.price
    if L7_2 then
      L7_2 = false
      L8_2 = SV
      L8_2 = L8_2.GetMoney
      L9_2 = L4_2
      L10_2 = "cash"
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = L2_2.price
      if L8_2 >= L9_2 then
        L7_2 = true
        L9_2 = SV
        L9_2 = L9_2.RemoveMoney
        L10_2 = L4_2
        L11_2 = "cash"
        L12_2 = L2_2.price
        L9_2(L10_2, L11_2, L12_2)
      else
        L9_2 = SV
        L9_2 = L9_2.GetMoney
        L10_2 = L4_2
        L11_2 = "bank"
        L9_2 = L9_2(L10_2, L11_2)
        L10_2 = L2_2.price
        if L9_2 >= L10_2 then
          L7_2 = true
          L10_2 = SV
          L10_2 = L10_2.RemoveMoney
          L11_2 = L4_2
          L12_2 = "bank"
          L13_2 = L2_2.price
          L10_2(L11_2, L12_2, L13_2)
        end
      end
      if L7_2 then
        L9_2 = library
        L9_2 = L9_2.Notification
        L10_2 = L3_2
        L11_2 = TRANSLATE
        L12_2 = "notify.property:purchased_upgrade"
        L13_2 = L2_2.label
        L14_2 = L2_2.price
        L11_2 = L11_2(L12_2, L13_2, L14_2)
        L12_2 = 5500
        L13_2 = "success"
        L9_2(L10_2, L11_2, L12_2, L13_2)
      else
        L9_2 = library
        L9_2 = L9_2.Notification
        L10_2 = L3_2
        L11_2 = TRANSLATE
        L12_2 = "notify.not_enough_money"
        L11_2 = L11_2(L12_2)
        L12_2 = 5000
        L13_2 = "error"
        return L9_2(L10_2, L11_2, L12_2, L13_2)
      end
    else
      L7_2 = library
      L7_2 = L7_2.Notification
      L8_2 = L3_2
      L9_2 = TRANSLATE
      L10_2 = "notify.property:purchased_upgrade_free"
      L11_2 = L2_2.label
      L9_2 = L9_2(L10_2, L11_2)
      L10_2 = 5500
      L11_2 = "success"
      L7_2(L8_2, L9_2, L10_2, L11_2)
    end
    L7_2 = L6_2.metadata
    L7_2 = L7_2.upgrades
    if not L7_2 then
      L7_2 = L6_2.metadata
      L8_2 = {}
      L7_2.upgrades = L8_2
    end
    L7_2 = L6_2.metadata
    L7_2 = L7_2.upgrades
    L8_2 = L2_2.metadata
    L7_2[L8_2] = true
    L7_2 = SV
    L7_2 = L7_2.Webhook
    L8_2 = "Upgraded"
    L9_2 = WebhookText
    L9_2 = L9_2["TITLE.Upgraded"]
    L10_2 = WebhookText
    L10_2 = L10_2["DESCRIPTION.Upgraded"]
    L11_2 = L10_2
    L10_2 = L10_2.format
    L12_2 = SV
    L12_2 = L12_2.GetCharacterName
    L13_2 = L4_2
    L12_2 = L12_2(L13_2)
    L13_2 = L3_2
    L14_2 = L2_2.label
    L15_2 = L2_2.price
    L16_2 = A0_2
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L11_2 = 0
    L12_2 = L5_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  L7_2 = MySQL
  L7_2 = L7_2.query
  L8_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L9_2 = {}
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L6_2.metadata
  L10_2 = L10_2(L11_2)
  L11_2 = tonumber
  L12_2 = A0_2
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L11_2(L12_2)
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L9_2[5] = L14_2
  L9_2[6] = L15_2
  L9_2[7] = L16_2
  L9_2[8] = L17_2
  L9_2[9] = L18_2
  L9_2[10] = L19_2
  L7_2(L8_2, L9_2)
  L7_2 = TriggerClientEvent
  L8_2 = "vms_housing:cl:updateProperty"
  L9_2 = -1
  L10_2 = "upgrade"
  L11_2 = A0_2
  L12_2 = {}
  L13_2 = L2_2.metadata
  L12_2.metadataName = L13_2
  L13_2 = L2_2.metadata
  L14_2 = L6_2.metadata
  L14_2 = L14_2.upgrades
  L15_2 = L2_2.metadata
  ::lbl_307::
  L14_2 = L14_2[L15_2]
  L12_2[L13_2] = L14_2
  L13_2 = L3_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:marketplaceAdd"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetProperty
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = L5_2.renter
  if L6_2 then
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.property:marketplace_blocked_by_renter"
    L8_2 = L8_2(L9_2)
    L9_2 = 5000
    L10_2 = "info"
    return L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = library
  L6_2 = L6_2.HasPermissions
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = "marketplaceManage"
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.not_allowed"
    L8_2 = L8_2(L9_2)
    L9_2 = 5500
    L10_2 = "error"
    return L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = A1_2.description
  L5_2.description = L6_2
  L6_2 = L5_2.metadata
  L7_2 = A1_2.furnished
  L6_2.furnished = L7_2
  L6_2 = L5_2.metadata
  L7_2 = A1_2.contact_number
  L6_2.contact_number = L7_2
  L6_2 = L5_2.sale
  L7_2 = A1_2.sale
  L6_2.active = L7_2
  L6_2 = A1_2.sale
  if L6_2 then
    L6_2 = L5_2.sale
    L7_2 = tonumber
    L8_2 = A1_2.salePrice
    L7_2 = L7_2(L8_2)
    L6_2.price = L7_2
  end
  L6_2 = L5_2.rental
  L7_2 = A1_2.rental
  L6_2.active = L7_2
  L6_2 = A1_2.rental
  if L6_2 then
    L6_2 = L5_2.rental
    L7_2 = tonumber
    L8_2 = A1_2.rentalPrice
    L7_2 = L7_2(L8_2)
    L6_2.price = L7_2
  end
  L6_2 = L5_2.sale
  L6_2 = L6_2.active
  if not L6_2 then
    L6_2 = L5_2.rental
    L6_2 = L6_2.active
    if not L6_2 then
      L6_2 = library
      L6_2 = L6_2.Notification
      L7_2 = L2_2
      L8_2 = TRANSLATE
      L9_2 = "notify.property:marketplace_offer_updated"
      L8_2 = L8_2(L9_2)
      L9_2 = 5500
      L10_2 = "success"
      L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  else
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.property:marketplace_offer_added"
    L8_2 = L8_2(L9_2)
    L9_2 = 5500
    L10_2 = "success"
    L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "UPDATE `houses` SET `description` = ?, `sale` = ?, `rental` = ?, `metadata` = ? WHERE `id` = ?"
  L8_2 = {}
  L9_2 = L5_2.description
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L5_2.sale
  L10_2 = L10_2(L11_2)
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L5_2.rental
  L11_2 = L11_2(L12_2)
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L5_2.metadata
  L12_2 = L12_2(L13_2)
  L13_2 = tonumber
  L14_2 = A0_2
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L13_2(L14_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L8_2[5] = L13_2
  L8_2[6] = L14_2
  L8_2[7] = L15_2
  L8_2[8] = L16_2
  L8_2[9] = L17_2
  L8_2[10] = L18_2
  L8_2[11] = L19_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "vms_housing:cl:updateProperty"
  L8_2 = -1
  L9_2 = "marketplace"
  L10_2 = A0_2
  L11_2 = {}
  L12_2 = L5_2.description
  L11_2.description = L12_2
  L12_2 = L5_2.sale
  L11_2.sale = L12_2
  L12_2 = L5_2.rental
  L11_2.rental = L12_2
  L12_2 = L5_2.metadata
  L12_2 = L12_2.contact_number
  L11_2.contact_number = L12_2
  L12_2 = L5_2.metadata
  L12_2 = L12_2.furnished
  L11_2.furnished = L12_2
  L12_2 = L2_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L6_2 = SV
  L6_2 = L6_2.Webhook
  L7_2 = "MarketplaceAdded"
  L8_2 = WebhookText
  L8_2 = L8_2["TITLE.MarketplaceAdded"]
  L9_2 = WebhookText
  L9_2 = L9_2["DESCRIPTION.MarketplaceAdded"]
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = SV
  L11_2 = L11_2.GetCharacterName
  L12_2 = L3_2
  L11_2 = L11_2(L12_2)
  L12_2 = L2_2
  L13_2 = A0_2
  L14_2 = L5_2.description
  L15_2 = " "
  L14_2 = L14_2 .. L15_2
  L15_2 = L5_2.metadata
  L15_2 = L15_2.furnished
  if L15_2 then
    L15_2 = "\226\156\133"
    if L15_2 then
      goto lbl_176
    end
  end
  L15_2 = "\226\157\140"
  ::lbl_176::
  L16_2 = L5_2.metadata
  L16_2 = L16_2.contact_number
  L17_2 = " "
  L16_2 = L16_2 .. L17_2
  L17_2 = L5_2.sale
  L17_2 = L17_2.active
  if L17_2 then
    L17_2 = "\226\156\133 $"
    L18_2 = L5_2.sale
    L18_2 = L18_2.price
    L17_2 = L17_2 .. L18_2
    if L17_2 then
      goto lbl_191
    end
  end
  L17_2 = "\226\157\140"
  ::lbl_191::
  L18_2 = L5_2.rental
  L18_2 = L18_2.active
  if L18_2 then
    L18_2 = "\226\156\133 $"
    L19_2 = L5_2.rental
    L19_2 = L19_2.price
    L18_2 = L18_2 .. L19_2
    if L18_2 then
      goto lbl_202
    end
  end
  L18_2 = "\226\157\140"
  ::lbl_202::
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L10_2 = 0
  L11_2 = L4_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:marketplaceRemove"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = L4_2.renter
  if L5_2 then
    L5_2 = library
    L5_2 = L5_2.Notification
    L6_2 = L1_2
    L7_2 = TRANSLATE
    L8_2 = "notify.property:marketplace_blocked_by_renter"
    L7_2 = L7_2(L8_2)
    L8_2 = 5000
    L9_2 = "info"
    return L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = library
  L5_2 = L5_2.HasPermissions
  L6_2 = A0_2
  L7_2 = L3_2
  L8_2 = "marketplaceManage"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if not L5_2 then
    L5_2 = library
    L5_2 = L5_2.Notification
    L6_2 = L1_2
    L7_2 = TRANSLATE
    L8_2 = "notify.not_allowed"
    L7_2 = L7_2(L8_2)
    L8_2 = 5500
    L9_2 = "error"
    return L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = L4_2.sale
  L5_2.active = false
  L5_2 = L4_2.rental
  L5_2.active = false
  L5_2 = library
  L5_2 = L5_2.Notification
  L6_2 = L1_2
  L7_2 = TRANSLATE
  L8_2 = "notify.property:marketplace_offer_removed"
  L7_2 = L7_2(L8_2)
  L8_2 = 5500
  L9_2 = "success"
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = MySQL
  L5_2 = L5_2.query
  L6_2 = "UPDATE `houses` SET `sale` = ?, `rental` = ? WHERE `id` = ?"
  L7_2 = {}
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = L4_2.sale
  L8_2 = L8_2(L9_2)
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = L4_2.rental
  L9_2 = L9_2(L10_2)
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2, L11_2 = L10_2(L11_2)
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L5_2(L6_2, L7_2)
  L5_2 = TriggerClientEvent
  L6_2 = "vms_housing:cl:updateProperty"
  L7_2 = -1
  L8_2 = "marketplace"
  L9_2 = A0_2
  L10_2 = {}
  L11_2 = L4_2.sale
  L10_2.sale = L11_2
  L11_2 = L4_2.rental
  L10_2.rental = L11_2
  L11_2 = L4_2.metadata
  L11_2 = L11_2.contact_number
  L10_2.contact_number = L11_2
  L11_2 = L4_2.metadata
  L11_2 = L11_2.furnished
  L10_2.furnished = L11_2
  L11_2 = L1_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:payTheBill"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  if not A2_2 then
    return
  end
  L3_2 = source
  L4_2 = SV
  L4_2 = L4_2.GetPlayer
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SV
  L5_2 = L5_2.GetIdentifier
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetProperty
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = library
  L7_2 = L7_2.HasPermissions
  L8_2 = A0_2
  L9_2 = L5_2
  L10_2 = "billPayments"
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  if not L7_2 then
    L7_2 = library
    L7_2 = L7_2.Notification
    L8_2 = L3_2
    L9_2 = TRANSLATE
    L10_2 = "notify.not_allowed"
    L9_2 = L9_2(L10_2)
    L10_2 = 5500
    L11_2 = "error"
    return L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = os
  L7_2 = L7_2.date
  L8_2 = "%m:%Y"
  L7_2 = L7_2(L8_2)
  if "rent" ~= A2_2 and L7_2 == A1_2 then
    return
  end
  L8_2 = false
  L9_2 = pairs
  L10_2 = L6_2.bills
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = L14_2.period
    if L15_2 == A1_2 then
      L15_2 = L14_2.type
      if L15_2 == A2_2 then
        L8_2 = L14_2
        break
      end
    end
  end
  if not L8_2 then
    return
  end
  L9_2 = SV
  L9_2 = L9_2.GetMoney
  L10_2 = L4_2
  L11_2 = "bank"
  L9_2 = L9_2(L10_2, L11_2)
  if L9_2 then
    L10_2 = tonumber
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    if L10_2 then
      goto lbl_81
    end
  end
  do return end
  ::lbl_81::
  L10_2 = tonumber
  L11_2 = math
  L11_2 = L11_2.floor
  L12_2 = L8_2.total
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L11_2(L12_2)
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L11_2 = tonumber
  L12_2 = L9_2
  L11_2 = L11_2(L12_2)
  if L10_2 > L11_2 then
    L11_2 = library
    L11_2 = L11_2.Notification
    L12_2 = L3_2
    L13_2 = TRANSLATE
    L14_2 = "notify.not_enough_money"
    L13_2 = L13_2(L14_2)
    L14_2 = 5000
    L15_2 = "error"
    return L11_2(L12_2, L13_2, L14_2, L15_2)
  end
  L11_2 = SV
  L11_2 = L11_2.RemoveMoney
  L12_2 = L4_2
  L13_2 = "bank"
  L14_2 = L10_2
  L11_2(L12_2, L13_2, L14_2)
  if "services" == A2_2 then
    L11_2 = library
    L11_2 = L11_2.Notification
    L12_2 = L3_2
    L13_2 = TRANSLATE
    L14_2 = "notify.property:paid_services"
    L15_2 = L10_2
    L16_2 = A1_2
    L13_2 = L13_2(L14_2, L15_2, L16_2)
    L14_2 = 5000
    L15_2 = "success"
    L11_2(L12_2, L13_2, L14_2, L15_2)
    L8_2.paid = 1
    L11_2 = L6_2.unpaidBills
    L11_2 = L11_2 - 1
    L6_2.unpaidBills = L11_2
    L11_2 = SV
    L11_2 = L11_2.Webhook
    L12_2 = "PaidBillServices"
    L13_2 = WebhookText
    L13_2 = L13_2["TITLE.PaidBillServices"]
    L14_2 = WebhookText
    L14_2 = L14_2["DESCRIPTION.PaidBillServices"]
    L15_2 = L14_2
    L14_2 = L14_2.format
    L16_2 = SV
    L16_2 = L16_2.GetCharacterName
    L17_2 = L4_2
    L16_2 = L16_2(L17_2)
    L17_2 = L3_2
    L18_2 = L10_2
    L19_2 = A0_2
    L20_2 = A1_2
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L15_2 = 0
    L16_2 = L5_2
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  elseif "rent" == A2_2 then
    L11_2 = library
    L11_2 = L11_2.Notification
    L12_2 = L3_2
    L13_2 = TRANSLATE
    L14_2 = "notify.property:paid_rent"
    L15_2 = L10_2
    L16_2 = A1_2
    L13_2 = L13_2(L14_2, L15_2, L16_2)
    L14_2 = 5000
    L15_2 = "success"
    L11_2(L12_2, L13_2, L14_2, L15_2)
    L11_2 = L6_2.owner
    if L11_2 then
      L11_2 = SV
      L11_2 = L11_2.GetPlayerByIdentifier
      L12_2 = L6_2.owner
      L11_2 = L11_2(L12_2)
      L12_2 = Config
      L12_2 = L12_2.CityHallTaxes
      if L12_2 then
        L12_2 = L12_2.RentalIncome
      end
      if L12_2 then
        L12_2 = L12_2.Enabled
      end
      if L12_2 then
        L12_2 = SV
        L12_2 = L12_2.AddTax
        L13_2 = L6_2.owner
        L14_2 = L6_2.owner_name
        L15_2 = L6_2.name
        L16_2 = L6_2.address
        L17_2 = "rental_income_tax"
        L18_2 = L10_2
        L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
      end
      if L11_2 then
        L12_2 = SV
        L12_2 = L12_2.AddMoney
        L13_2 = L11_2
        L14_2 = "bank"
        L15_2 = L10_2
        L12_2(L13_2, L14_2, L15_2)
      else
        L12_2 = SV
        L12_2 = L12_2.AddMoneyOffline
        L13_2 = L11_2
        L14_2 = "bank"
        L15_2 = L10_2
        L12_2(L13_2, L14_2, L15_2)
      end
    end
    L8_2.paid = 1
    L11_2 = L6_2.unpaidRentBills
    L11_2 = L11_2 - 1
    L6_2.unpaidRentBills = L11_2
    L11_2 = SV
    L11_2 = L11_2.Webhook
    L12_2 = "PaidBillRent"
    L13_2 = WebhookText
    L13_2 = L13_2["TITLE.PaidBillRent"]
    L14_2 = WebhookText
    L14_2 = L14_2["DESCRIPTION.PaidBillRent"]
    L15_2 = L14_2
    L14_2 = L14_2.format
    L16_2 = SV
    L16_2 = L16_2.GetCharacterName
    L17_2 = L4_2
    L16_2 = L16_2(L17_2)
    L17_2 = L3_2
    L18_2 = L10_2
    L19_2 = A0_2
    L20_2 = A1_2
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L15_2 = 0
    L16_2 = L5_2
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  end
  L11_2 = MySQL
  L11_2 = L11_2.query
  L12_2 = "UPDATE `houses_bills` SET `paid` = 1 WHERE `house_id` = ? AND `period` = ? AND `type` = ?"
  L13_2 = {}
  L14_2 = tonumber
  L15_2 = A0_2
  L14_2 = L14_2(L15_2)
  L15_2 = A1_2
  L16_2 = A2_2
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L13_2[3] = L16_2
  L11_2(L12_2, L13_2)
  L11_2 = TriggerClientEvent
  L12_2 = "vms_housing:cl:updateProperty"
  L13_2 = -1
  L14_2 = "paidBill"
  L15_2 = A0_2
  L16_2 = {}
  L16_2.type = A2_2
  L16_2.period = A1_2
  L17_2 = L6_2.unpaidBills
  L16_2.unpaidBills = L17_2
  L17_2 = L6_2.unpaidRentBills
  L16_2.unpaidRentBills = L17_2
  L17_2 = L3_2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:rentalTerminateNow"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = library
  L5_2 = L5_2.HasPermissions
  L6_2 = A0_2
  L7_2 = L4_2
  L8_2 = "rentersManage"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if not L5_2 then
    L5_2 = library
    L5_2 = L5_2.Notification
    L6_2 = L1_2
    L7_2 = TRANSLATE
    L8_2 = "notify.not_allowed"
    L7_2 = L7_2(L8_2)
    L8_2 = 5500
    L9_2 = "error"
    return L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = Config
  L5_2 = L5_2.RemoveKeysOnRentEnd
  if L5_2 then
    L5_2 = json
    L5_2 = L5_2.encode
    L6_2 = {}
    L5_2 = L5_2(L6_2)
    L2_2.keys = L5_2
  end
  L2_2.unpaidRentBills = nil
  L5_2 = MySQL
  L5_2 = L5_2.prepare
  L6_2 = "DELETE FROM houses_bills WHERE `house_id` = ? AND `type` = ? AND `paid` = 0"
  L7_2 = {}
  L8_2 = tonumber
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  L9_2 = "rent"
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L5_2(L6_2, L7_2)
  L5_2 = L2_2.bills
  L5_2 = #L5_2
  L6_2 = 1
  L7_2 = -1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = L2_2.bills
    L9_2 = L9_2[L8_2]
    L10_2 = L9_2.type
    if "rent" == L10_2 then
      L10_2 = L9_2.paid
      if 0 ~= L10_2 then
        L10_2 = L9_2.paid
        if false ~= L10_2 then
          goto lbl_80
        end
      end
      L10_2 = table
      L10_2 = L10_2.remove
      L11_2 = L2_2.bills
      L12_2 = L8_2
      L10_2(L11_2, L12_2)
    end
    ::lbl_80::
  end
  L5_2 = SV
  L5_2 = L5_2.Webhook
  L6_2 = "RentalTerminated"
  L7_2 = WebhookText
  L7_2 = L7_2["TITLE.RentalTerminated"]
  L8_2 = WebhookText
  L8_2 = L8_2["DESCRIPTION.RentalTerminated"]
  L9_2 = L8_2
  L8_2 = L8_2.format
  L10_2 = SV
  L10_2 = L10_2.GetCharacterName
  L11_2 = L3_2
  L10_2 = L10_2(L11_2)
  L11_2 = L1_2
  L12_2 = L2_2.renter_name
  L13_2 = L2_2.renter
  L14_2 = A0_2
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L9_2 = 0
  L10_2 = L4_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = L2_2.permissions
  L6_2 = L2_2.renter
  L5_2[L6_2] = nil
  L5_2 = L2_2.metadata
  L5_2.locked = true
  L2_2.renter = nil
  L2_2.renter_name = nil
  L5_2 = L2_2.rental
  L5_2.startTime = nil
  L5_2 = L2_2.rental
  L5_2.terminateAtPeriod = nil
  L5_2 = library
  L5_2 = L5_2.Notification
  L6_2 = L1_2
  L7_2 = TRANSLATE
  L8_2 = "notify.property:rent_terminated_now"
  L7_2 = L7_2(L8_2)
  L8_2 = 5000
  L9_2 = "success"
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = MySQL
  L5_2 = L5_2.Async
  L5_2 = L5_2.execute
  L6_2 = [[
        UPDATE `houses`
            SET
                `renter` = NULL,
                `renter_name` = NULL,
                `keys` = @keys,
                `permissions` = @permissions,
                `metadata` = @metadata,
                `rental` = @rental
        WHERE id = @id
    ]]
  L7_2 = {}
  L8_2 = L2_2.keys
  L7_2["@keys"] = L8_2
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = L2_2.permissions
  L8_2 = L8_2(L9_2)
  L7_2["@permissions"] = L8_2
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = L2_2.metadata
  L8_2 = L8_2(L9_2)
  L7_2["@metadata"] = L8_2
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = L2_2.rental
  L8_2 = L8_2(L9_2)
  L7_2["@rental"] = L8_2
  L8_2 = tonumber
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  L7_2["@id"] = L8_2
  L5_2(L6_2, L7_2)
  L5_2 = TriggerClientEvent
  L6_2 = "vms_housing:cl:updateProperty"
  L7_2 = -1
  L8_2 = "rentalTerminated"
  L9_2 = A0_2
  L10_2 = {}
  L11_2 = L2_2.keys
  L10_2.keys = L11_2
  L11_2 = L2_2.permissions
  L10_2.permissions = L11_2
  L11_2 = L2_2.metadata
  L10_2.metadata = L11_2
  L11_2 = L2_2.rental
  L10_2.rental = L11_2
  L11_2 = L2_2.bills
  L10_2.bills = L11_2
  L11_2 = L1_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:setRentalTermination"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = source
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = library
  L5_2 = L5_2.HasPermissions
  L6_2 = A0_2
  L7_2 = L4_2
  L8_2 = "rentersManage"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if not L5_2 then
    L5_2 = library
    L5_2 = L5_2.Notification
    L6_2 = L1_2
    L7_2 = TRANSLATE
    L8_2 = "notify.not_allowed"
    L7_2 = L7_2(L8_2)
    L8_2 = 5500
    L9_2 = "error"
    return L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = os
  L5_2 = L5_2.date
  L6_2 = "*t"
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2.month
  L6_2 = L6_2 + 1
  L7_2 = L5_2.year
  if L6_2 > 12 then
    L6_2 = 1
    L7_2 = L7_2 + 1
  end
  L8_2 = L2_2.rental
  L9_2 = string
  L9_2 = L9_2.format
  L10_2 = "%02d:%d"
  L11_2 = L6_2
  L12_2 = L7_2
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L8_2.terminateAtPeriod = L9_2
  L8_2 = library
  L8_2 = L8_2.Notification
  L9_2 = L1_2
  L10_2 = TRANSLATE
  L11_2 = "notify.property:rent_termination_scheduled"
  L10_2 = L10_2(L11_2)
  L11_2 = 5000
  L12_2 = "success"
  L8_2(L9_2, L10_2, L11_2, L12_2)
  L8_2 = MySQL
  L8_2 = L8_2.query
  L9_2 = "UPDATE `houses` SET `rental` = ? WHERE `id` = ?"
  L10_2 = {}
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L2_2.rental
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = A0_2
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L12_2(L13_2)
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L10_2[5] = L15_2
  L10_2[6] = L16_2
  L10_2[7] = L17_2
  L10_2[8] = L18_2
  L8_2(L9_2, L10_2)
  L8_2 = SV
  L8_2 = L8_2.Webhook
  L9_2 = "SetRentalTermination"
  L10_2 = WebhookText
  L10_2 = L10_2["TITLE.SetRentalTermination"]
  L11_2 = WebhookText
  L11_2 = L11_2["DESCRIPTION.SetRentalTermination"]
  L12_2 = L11_2
  L11_2 = L11_2.format
  L13_2 = SV
  L13_2 = L13_2.GetCharacterName
  L14_2 = L3_2
  L13_2 = L13_2(L14_2)
  L14_2 = L1_2
  L15_2 = L2_2.rental
  L15_2 = L15_2.terminateAtPeriod
  L16_2 = L2_2.renter_name
  L17_2 = L2_2.renter
  L18_2 = A0_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L12_2 = 0
  L13_2 = L4_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = TriggerClientEvent
  L9_2 = "vms_housing:cl:updateProperty"
  L10_2 = -1
  L11_2 = "rentalTermination"
  L12_2 = A0_2
  L13_2 = {}
  L14_2 = L2_2.rental
  L13_2.rental = L14_2
  L14_2 = L1_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:clearRentalTermination"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = source
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = library
  L5_2 = L5_2.HasPermissions
  L6_2 = A0_2
  L7_2 = L4_2
  L8_2 = "rentersManage"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if not L5_2 then
    L5_2 = library
    L5_2 = L5_2.Notification
    L6_2 = L1_2
    L7_2 = TRANSLATE
    L8_2 = "notify.not_allowed"
    L7_2 = L7_2(L8_2)
    L8_2 = 5500
    L9_2 = "error"
    return L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = L2_2.rental
  L5_2.terminateAtPeriod = nil
  L5_2 = library
  L5_2 = L5_2.Notification
  L6_2 = L1_2
  L7_2 = TRANSLATE
  L8_2 = "notify.property:rent_termination_cancelled"
  L7_2 = L7_2(L8_2)
  L8_2 = 5000
  L9_2 = "success"
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = MySQL
  L5_2 = L5_2.query
  L6_2 = "UPDATE `houses` SET `rental` = ? WHERE `id` = ?"
  L7_2 = {}
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = L2_2.rental
  L8_2 = L8_2(L9_2)
  L9_2 = tonumber
  L10_2 = A0_2
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  L5_2(L6_2, L7_2)
  L5_2 = SV
  L5_2 = L5_2.Webhook
  L6_2 = "StoppedRentalTermination"
  L7_2 = WebhookText
  L7_2 = L7_2["TITLE.StoppedRentalTermination"]
  L8_2 = WebhookText
  L8_2 = L8_2["DESCRIPTION.StoppedRentalTermination"]
  L9_2 = L8_2
  L8_2 = L8_2.format
  L10_2 = SV
  L10_2 = L10_2.GetCharacterName
  L11_2 = L3_2
  L10_2 = L10_2(L11_2)
  L11_2 = L1_2
  L12_2 = A0_2
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L9_2 = 0
  L10_2 = L4_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = TriggerClientEvent
  L6_2 = "vms_housing:cl:updateProperty"
  L7_2 = -1
  L8_2 = "clearRentalTermination"
  L9_2 = A0_2
  L10_2 = {}
  L11_2 = L2_2.rental
  L10_2.rental = L11_2
  L11_2 = L1_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:saveMarketplacePhoto"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = source
  if not A1_2 then
    return
  end
  L4_2 = tostring
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  A1_2 = L4_2
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = SV
  L6_2 = L6_2.GetIdentifier
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = library
  L7_2 = L7_2.HasPermissions
  L8_2 = A0_2
  L9_2 = L6_2
  L10_2 = "marketplaceManage"
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  if not L7_2 then
    L7_2 = library
    L7_2 = L7_2.Notification
    L8_2 = L3_2
    L9_2 = TRANSLATE
    L10_2 = "notify.not_allowed"
    L9_2 = L9_2(L10_2)
    L10_2 = 5500
    L11_2 = "error"
    return L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = L4_2.metadata
  L7_2 = L7_2.images
  if not L7_2 then
    L7_2 = L4_2.metadata
    L8_2 = {}
    L7_2.images = L8_2
  end
  L7_2 = L4_2.metadata
  L7_2 = L7_2.images
  L7_2[A1_2] = A2_2
  L7_2 = MySQL
  L7_2 = L7_2.query
  L8_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L9_2 = {}
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L4_2.metadata
  L10_2 = L10_2(L11_2)
  L11_2 = tonumber
  L12_2 = A0_2
  L11_2, L12_2, L13_2 = L11_2(L12_2)
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L7_2(L8_2, L9_2)
  L7_2 = TriggerClientEvent
  L8_2 = "vms_housing:cl:updateProperty"
  L9_2 = -1
  L10_2 = "marketplaceImage"
  L11_2 = A0_2
  L12_2 = {}
  L12_2.imageId = A1_2
  L13_2 = L4_2.metadata
  L13_2 = L13_2.images
  L13_2 = L13_2[A1_2]
  L12_2.imageURL = L13_2
  L13_2 = L3_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:changeWardrobePosition"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetProperty
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = library
  L6_2 = L6_2.HasPermissions
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = "furniture"
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.not_allowed"
    L8_2 = L8_2(L9_2)
    L9_2 = 5500
    L10_2 = "error"
    return L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = L5_2.metadata
  if L6_2 then
    L6_2 = L5_2.metadata
    L6_2 = L6_2.wardrobe
    if L6_2 then
      L6_2 = L5_2.metadata
      L6_2 = L6_2.wardrobe
      L6_2 = L6_2.x
      if L6_2 then
        goto lbl_50
      end
    end
  end
  do return end
  ::lbl_50::
  L6_2 = library
  L6_2 = L6_2.Notification
  L7_2 = L2_2
  L8_2 = TRANSLATE
  L9_2 = "notify.property:wardrobe_moved"
  L8_2 = L8_2(L9_2)
  L9_2 = 5000
  L10_2 = "success"
  L6_2(L7_2, L8_2, L9_2, L10_2)
  L6_2 = L5_2.metadata
  L6_2 = L6_2.wardrobe
  L7_2 = A1_2.x
  L6_2.x = L7_2
  L6_2 = L5_2.metadata
  L6_2 = L6_2.wardrobe
  L7_2 = A1_2.y
  L6_2.y = L7_2
  L6_2 = L5_2.metadata
  L6_2 = L6_2.wardrobe
  L7_2 = A1_2.z
  L6_2.z = L7_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L8_2 = {}
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = L5_2.metadata
  L9_2 = L9_2(L10_2)
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2, L11_2, L12_2 = L10_2(L11_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "vms_housing:cl:updateProperty"
  L8_2 = -1
  L9_2 = "changedWardrobePosition"
  L10_2 = A0_2
  L11_2 = {}
  L12_2 = L5_2.metadata
  L12_2 = L12_2.wardrobe
  L11_2.wardrobe = L12_2
  L12_2 = L2_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:changeStoragePosition"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetProperty
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = library
  L6_2 = L6_2.HasPermissions
  L7_2 = A0_2
  L8_2 = L4_2
  L9_2 = "furniture"
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if not L6_2 then
    L6_2 = library
    L6_2 = L6_2.Notification
    L7_2 = L2_2
    L8_2 = TRANSLATE
    L9_2 = "notify.not_allowed"
    L8_2 = L8_2(L9_2)
    L9_2 = 5500
    L10_2 = "error"
    return L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = L5_2.metadata
  if L6_2 then
    L6_2 = L5_2.metadata
    L6_2 = L6_2.storage
    if L6_2 then
      L6_2 = L5_2.metadata
      L6_2 = L6_2.storage
      L6_2 = L6_2.x
      if L6_2 then
        goto lbl_50
      end
    end
  end
  do return end
  ::lbl_50::
  L6_2 = library
  L6_2 = L6_2.Notification
  L7_2 = L2_2
  L8_2 = TRANSLATE
  L9_2 = "notify.property:storage_moved"
  L8_2 = L8_2(L9_2)
  L9_2 = 5000
  L10_2 = "success"
  L6_2(L7_2, L8_2, L9_2, L10_2)
  L6_2 = L5_2.metadata
  L6_2 = L6_2.storage
  L7_2 = A1_2.x
  L6_2.x = L7_2
  L6_2 = L5_2.metadata
  L6_2 = L6_2.storage
  L7_2 = A1_2.y
  L6_2.y = L7_2
  L6_2 = L5_2.metadata
  L6_2 = L6_2.storage
  L7_2 = A1_2.z
  L6_2.z = L7_2
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "UPDATE `houses` SET `metadata` = ? WHERE `id` = ?"
  L8_2 = {}
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = L5_2.metadata
  L9_2 = L9_2(L10_2)
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2, L11_2, L12_2 = L10_2(L11_2)
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "vms_housing:cl:updateProperty"
  L8_2 = -1
  L9_2 = "changedStoragePosition"
  L10_2 = A0_2
  L11_2 = {}
  L12_2 = L5_2.metadata
  L12_2 = L12_2.storage
  L11_2.storage = L12_2
  L12_2 = L2_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:sendPropertyContract"
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L6_2 = source
  if not (A1_2 and A2_2 and A3_2) or not A4_2 then
    return
  end
  L7_2 = SV
  L7_2 = L7_2.GetPlayer
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    return
  end
  L8_2 = SV
  L8_2 = L8_2.GetIdentifier
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  L9_2 = GetProperty
  L10_2 = A0_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    return
  end
  L10_2 = library
  L10_2 = L10_2.HasPermissions
  L11_2 = A0_2
  L12_2 = L8_2
  L13_2 = "sell"
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  if not L10_2 then
    L10_2 = library
    L10_2 = L10_2.Notification
    L11_2 = L6_2
    L12_2 = TRANSLATE
    L13_2 = "notify.not_allowed"
    L12_2 = L12_2(L13_2)
    L13_2 = 5500
    L14_2 = "error"
    return L10_2(L11_2, L12_2, L13_2, L14_2)
  end
  L10_2 = SV
  L10_2 = L10_2.GetPlayer
  L11_2 = tonumber
  L12_2 = A2_2
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L11_2(L12_2)
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  if not L10_2 then
    return
  end
  L11_2 = GetPlayerPed
  L12_2 = L6_2
  L11_2 = L11_2(L12_2)
  L12_2 = GetEntityCoords
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  L13_2 = GetPlayerPed
  L14_2 = tonumber
  L15_2 = A2_2
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L14_2(L15_2)
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L14_2 = GetEntityCoords
  L15_2 = L13_2
  L14_2 = L14_2(L15_2)
  if not L11_2 or not L13_2 then
    return
  end
  L15_2 = L12_2 - L14_2
  L15_2 = #L15_2
  if L15_2 >= 8.0 then
    L16_2 = library
    L16_2 = L16_2.Notification
    L17_2 = L6_2
    L18_2 = TRANSLATE
    L19_2 = "notify.contract:player_too_far"
    L18_2 = L18_2(L19_2)
    L19_2 = 5000
    L20_2 = "info"
    return L16_2(L17_2, L18_2, L19_2, L20_2)
  end
  L16_2 = library
  L16_2 = L16_2.Notification
  L17_2 = L6_2
  L18_2 = TRANSLATE
  L19_2 = "notify.contract:sent"
  L20_2 = SV
  L20_2 = L20_2.GetCharacterName
  L21_2 = L10_2
  L20_2, L21_2 = L20_2(L21_2)
  L18_2 = L18_2(L19_2, L20_2, L21_2)
  L19_2 = 5000
  L20_2 = "success"
  L16_2(L17_2, L18_2, L19_2, L20_2)
  L16_2 = tonumber
  L17_2 = A2_2
  L16_2 = L16_2(L17_2)
  L17_2 = L1_1
  L18_2 = {}
  L18_2.propertyId = A0_2
  L18_2.owner = L6_2
  L19_2 = SV
  L19_2 = L19_2.GetCharacterName
  L20_2 = L7_2
  L19_2 = L19_2(L20_2)
  L18_2.ownerName = L19_2
  L18_2.type = A1_2
  L18_2.price = A3_2
  L18_2.paymentMethod = A4_2
  L19_2 = Config
  L19_2 = L19_2.RentalCycles
  L19_2 = L19_2[A5_2]
  L19_2 = A5_2 or L19_2
  if not L19_2 or not A5_2 then
    L19_2 = "monthly"
  end
  L18_2.rentCycle = L19_2
  L17_2[L16_2] = L18_2
  L16_2 = TriggerClientEvent
  L17_2 = "vms_housing:cl:sendPropertyContract"
  L18_2 = tonumber
  L19_2 = A2_2
  L18_2 = L18_2(L19_2)
  L19_2 = tonumber
  L20_2 = A2_2
  L19_2 = L19_2(L20_2)
  L20_2 = L1_1
  L19_2 = L20_2[L19_2]
  L16_2(L17_2, L18_2, L19_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:signedPropertyContract"
function L7_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L0_2 = source
  L1_2 = L1_1
  L1_2 = L1_2[L0_2]
  if not L1_2 then
    return
  end
  L2_2 = L1_2.propertyId
  L3_2 = GetProperty
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetPlayer
  L5_2 = L1_2.owner
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SV
  L5_2 = L5_2.GetIdentifier
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = L3_2.owner
  if L6_2 then
    L6_2 = library
    L6_2 = L6_2.HasPermissions
    L7_2 = L2_2
    L8_2 = L5_2
    L9_2 = "sell"
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if L6_2 then
      goto lbl_46
    end
  end
  L6_2 = library
  L6_2 = L6_2.Notification
  L7_2 = L0_2
  L8_2 = TRANSLATE
  L9_2 = "notify.not_allowed"
  L8_2 = L8_2(L9_2)
  L9_2 = 5500
  L10_2 = "error"
  do return L6_2(L7_2, L8_2, L9_2, L10_2) end
  ::lbl_46::
  L6_2 = L1_2.type
  if "rent-out" == L6_2 then
    L6_2 = L3_2.renter
    if L6_2 then
      L6_2 = library
      L6_2 = L6_2.Notification
      L7_2 = L0_2
      L8_2 = TRANSLATE
      L9_2 = "notify.contract:already_rented"
      L8_2 = L8_2(L9_2)
      L9_2 = 5500
      L10_2 = "error"
      return L6_2(L7_2, L8_2, L9_2, L10_2)
    end
  end
  L6_2 = SV
  L6_2 = L6_2.GetPlayer
  L7_2 = L0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = SV
  L7_2 = L7_2.GetIdentifier
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = GetPlayerPed
  L9_2 = L0_2
  L8_2 = L8_2(L9_2)
  L9_2 = GetEntityCoords
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  L10_2 = GetPlayerPed
  L11_2 = tonumber
  L12_2 = L1_2.owner
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L11_2(L12_2)
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
  L11_2 = GetEntityCoords
  L12_2 = L10_2
  L11_2 = L11_2(L12_2)
  if not L8_2 or not L10_2 then
    return
  end
  L12_2 = L9_2 - L11_2
  L12_2 = #L12_2
  if L12_2 >= 8.0 then
    L13_2 = library
    L13_2 = L13_2.Notification
    L14_2 = L0_2
    L15_2 = TRANSLATE
    L16_2 = "notify.contract:seller_too_far"
    L15_2 = L15_2(L16_2)
    L16_2 = 5500
    L17_2 = "error"
    return L13_2(L14_2, L15_2, L16_2, L17_2)
  end
  L13_2 = Config
  L13_2 = L13_2.MaxPropertiesPerPlayer
  if L13_2 then
    L13_2 = Config
    L13_2 = L13_2.MaxPropertiesPerPlayer
    if L13_2 >= 0 then
      L13_2 = Config
      L13_2 = L13_2.MaxPropertiesPerPlayer
      if -1 ~= L13_2 then
        L13_2 = GetPlayerProperties
        L14_2 = L7_2
        L13_2 = L13_2(L14_2)
        L14_2 = #L13_2
        L15_2 = Config
        L15_2 = L15_2.MaxPropertiesPerPlayer
        if L14_2 >= L15_2 then
          L14_2 = library
          L14_2 = L14_2.Notification
          L15_2 = L0_2
          L16_2 = TRANSLATE
          L17_2 = "notify.reached_properties_limit"
          L16_2 = L16_2(L17_2)
          L17_2 = 5000
          L18_2 = "error"
          return L14_2(L15_2, L16_2, L17_2, L18_2)
        end
      end
    end
  end
  L13_2 = SV
  L13_2 = L13_2.GetMoney
  L14_2 = L6_2
  L15_2 = L1_2.paymentMethod
  L13_2 = L13_2(L14_2, L15_2)
  if L13_2 then
    L14_2 = tonumber
    L15_2 = L13_2
    L14_2 = L14_2(L15_2)
    if L14_2 then
      goto lbl_150
    end
  end
  do return end
  ::lbl_150::
  L14_2 = tonumber
  L15_2 = math
  L15_2 = L15_2.floor
  L16_2 = L1_2.price
  L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L15_2(L16_2)
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
  L15_2 = tonumber
  L16_2 = L13_2
  L15_2 = L15_2(L16_2)
  if L14_2 > L15_2 then
    L15_2 = library
    L15_2 = L15_2.Notification
    L16_2 = L0_2
    L17_2 = TRANSLATE
    L18_2 = "notify.not_enough_money"
    L17_2 = L17_2(L18_2)
    L18_2 = 5500
    L19_2 = "error"
    return L15_2(L16_2, L17_2, L18_2, L19_2)
  end
  L15_2 = SV
  L15_2 = L15_2.RemoveMoney
  L16_2 = L6_2
  L17_2 = L1_2.paymentMethod
  L18_2 = L14_2
  L15_2(L16_2, L17_2, L18_2)
  L15_2 = SV
  L15_2 = L15_2.AddMoney
  L16_2 = L4_2
  L17_2 = L1_2.paymentMethod
  L18_2 = L14_2
  L15_2(L16_2, L17_2, L18_2)
  L15_2 = L1_2.type
  if "rent-out" == L15_2 then
    L15_2 = Config
    L15_2 = L15_2.CityHallTaxes
    if L15_2 then
      L15_2 = L15_2.RentalIncome
    end
    if L15_2 then
      L15_2 = L15_2.Enabled
    end
    if L15_2 then
      L15_2 = SV
      L15_2 = L15_2.AddTax
      L16_2 = L3_2.owner
      L17_2 = L3_2.owner_name
      L18_2 = L3_2.name
      L19_2 = L3_2.address
      L20_2 = "rental_income_tax"
      L21_2 = L14_2
      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    end
    L15_2 = library
    L15_2 = L15_2.Notification
    L16_2 = L0_2
    L17_2 = TRANSLATE
    L18_2 = "notify.contract:started_rent_from_player"
    L19_2 = SV
    L19_2 = L19_2.GetCharacterName
    L20_2 = L4_2
    L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L19_2(L20_2)
    L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
    L18_2 = 5000
    L19_2 = "success"
    L15_2(L16_2, L17_2, L18_2, L19_2)
    L15_2 = library
    L15_2 = L15_2.Notification
    L16_2 = tonumber
    L17_2 = L1_2.owner
    L16_2 = L16_2(L17_2)
    L17_2 = TRANSLATE
    L18_2 = "notify.contract:rented_to_player"
    L19_2 = SV
    L19_2 = L19_2.GetCharacterName
    L20_2 = L6_2
    L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L19_2(L20_2)
    L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
    L18_2 = 5000
    L19_2 = "success"
    L15_2(L16_2, L17_2, L18_2, L19_2)
    L3_2.renter = L7_2
    L15_2 = SV
    L15_2 = L15_2.GetCharacterName
    L16_2 = L6_2
    L15_2 = L15_2(L16_2)
    L3_2.renter_name = L15_2
    L15_2 = L3_2.permissions
    L16_2 = {}
    L17_2 = L3_2.renter_name
    L16_2._name = L17_2
    L15_2[L7_2] = L16_2
    L15_2 = ipairs
    L16_2 = Config
    L16_2 = L16_2.DefaultPermissionsForRenter
    L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
    for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
      L21_2 = L3_2.permissions
      L21_2 = L21_2[L7_2]
      L21_2[L20_2] = true
    end
    L15_2 = L3_2.sale
    L15_2.active = false
    L15_2 = L3_2.rental
    L15_2.active = false
    L15_2 = L3_2.rental
    L15_2.price = L14_2
    L15_2 = L3_2.rental
    L16_2 = os
    L16_2 = L16_2.time
    L16_2 = L16_2()
    L15_2.startTime = L16_2
    L15_2 = L3_2.rental
    L16_2 = Config
    L16_2 = L16_2.RentalCycles
    L17_2 = L1_2.rentCycle
    L16_2 = L16_2[L17_2]
    if L16_2 then
      L16_2 = L1_2.rentCycle
      if L16_2 then
        goto lbl_278
      end
    end
    L16_2 = "monthly"
    ::lbl_278::
    L15_2.cycle = L16_2
    L15_2 = library
    L15_2 = L15_2.GetOrCreateBills
    L16_2 = L2_2
    L17_2 = true
    L15_2 = L15_2(L16_2, L17_2)
    L3_2.bills = L15_2
    L15_2 = "UPDATE houses SET renter = @renter, renter_name = @renter_name, permissions = @permissions, sale = @sale, rental = @rental WHERE id = @id"
    L16_2 = MySQL
    L16_2 = L16_2.update
    L16_2 = L16_2.await
    L17_2 = L15_2
    L18_2 = {}
    L19_2 = L3_2.renter
    L18_2["@renter"] = L19_2
    L19_2 = L3_2.renter_name
    L18_2["@renter_name"] = L19_2
    L19_2 = json
    L19_2 = L19_2.encode
    L20_2 = L3_2.permissions
    L19_2 = L19_2(L20_2)
    L18_2["@permissions"] = L19_2
    L19_2 = json
    L19_2 = L19_2.encode
    L20_2 = L3_2.sale
    L19_2 = L19_2(L20_2)
    L18_2["@sale"] = L19_2
    L19_2 = json
    L19_2 = L19_2.encode
    L20_2 = L3_2.rental
    L19_2 = L19_2(L20_2)
    L18_2["@rental"] = L19_2
    L19_2 = tonumber
    L20_2 = L2_2
    L19_2 = L19_2(L20_2)
    L18_2["@id"] = L19_2
    L16_2(L17_2, L18_2)
    L16_2 = TriggerClientEvent
    L17_2 = "vms_housing:cl:updateProperty"
    L18_2 = -1
    L19_2 = "newRenter"
    L20_2 = L2_2
    L21_2 = {}
    L22_2 = L3_2.renter
    L21_2.renter = L22_2
    L22_2 = L3_2.renter_name
    L21_2.renter_name = L22_2
    L22_2 = L3_2.permissions
    L21_2.permissions = L22_2
    L22_2 = L3_2.sale
    L21_2.sale = L22_2
    L22_2 = L3_2.rental
    L21_2.rental = L22_2
    L22_2 = L3_2.bills
    L21_2.bills = L22_2
    L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
    L16_2 = SV
    L16_2 = L16_2.Webhook
    L17_2 = "RentedOutProperty"
    L18_2 = WebhookText
    L18_2 = L18_2["TITLE.RentedOutProperty"]
    L19_2 = WebhookText
    L19_2 = L19_2["DESCRIPTION.RentedOutProperty"]
    L20_2 = L19_2
    L19_2 = L19_2.format
    L21_2 = L3_2.owner_name
    L22_2 = L3_2.owner
    L23_2 = L2_2
    L24_2 = L3_2.renter_name
    L25_2 = L3_2.renter
    L26_2 = L3_2.rental
    L26_2 = L26_2.price
    L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
    L20_2 = 0
    L21_2 = L7_2
    L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
  else
    L15_2 = Config
    L15_2 = L15_2.CityHallTaxes
    if L15_2 then
      L15_2 = L15_2.PropertyPurchase
    end
    if L15_2 then
      L15_2 = L15_2.Enabled
    end
    if L15_2 then
      L15_2 = SV
      L15_2 = L15_2.AddTax
      L16_2 = L7_2
      L17_2 = SV
      L17_2 = L17_2.GetCharacterName
      L18_2 = L6_2
      L17_2 = L17_2(L18_2)
      L18_2 = L3_2.name
      L19_2 = L3_2.address
      L20_2 = "property_purchase_tax"
      L21_2 = L14_2
      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    end
    L15_2 = Config
    L15_2 = L15_2.CityHallTaxes
    if L15_2 then
      L15_2 = L15_2.PropertyResale
    end
    if L15_2 then
      L15_2 = L15_2.Enabled
    end
    if L15_2 then
      L15_2 = SV
      L15_2 = L15_2.AddTax
      L16_2 = L5_2
      L17_2 = SV
      L17_2 = L17_2.GetCharacterName
      L18_2 = L4_2
      L17_2 = L17_2(L18_2)
      L18_2 = L3_2.name
      L19_2 = L3_2.address
      L20_2 = "property_resale_tax"
      L21_2 = L14_2
      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    end
    L15_2 = library
    L15_2 = L15_2.Notification
    L16_2 = L0_2
    L17_2 = TRANSLATE
    L18_2 = "notify.contract:purchased_from_player"
    L19_2 = SV
    L19_2 = L19_2.GetCharacterName
    L20_2 = L4_2
    L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L19_2(L20_2)
    L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
    L18_2 = 5000
    L19_2 = "success"
    L15_2(L16_2, L17_2, L18_2, L19_2)
    L15_2 = library
    L15_2 = L15_2.Notification
    L16_2 = tonumber
    L17_2 = L1_2.owner
    L16_2 = L16_2(L17_2)
    L17_2 = TRANSLATE
    L18_2 = "notify.contract:sold_to_player"
    L19_2 = SV
    L19_2 = L19_2.GetCharacterName
    L20_2 = L6_2
    L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L19_2(L20_2)
    L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
    L18_2 = 5000
    L19_2 = "success"
    L15_2(L16_2, L17_2, L18_2, L19_2)
    L15_2 = SV
    L15_2 = L15_2.Webhook
    L16_2 = "SoldProperty"
    L17_2 = WebhookText
    L17_2 = L17_2["TITLE.SoldProperty"]
    L18_2 = WebhookText
    L18_2 = L18_2["DESCRIPTION.SoldProperty"]
    L19_2 = L18_2
    L18_2 = L18_2.format
    L20_2 = L3_2.owner_name
    L21_2 = L3_2.owner
    L22_2 = L2_2
    L23_2 = SV
    L23_2 = L23_2.GetCharacterName
    L24_2 = L6_2
    L23_2 = L23_2(L24_2)
    L24_2 = L7_2
    L25_2 = L14_2
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L19_2 = 0
    L20_2 = L7_2
    L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
    L15_2 = "UPDATE houses SET owner = @owner, owner_name = @owner_name, sale = @sale, rental = @rental"
    L3_2.owner = L7_2
    L16_2 = SV
    L16_2 = L16_2.GetCharacterName
    L17_2 = L6_2
    L16_2 = L16_2(L17_2)
    L3_2.owner_name = L16_2
    L16_2 = L3_2.renter
    L17_2 = L3_2.owner
    if L16_2 == L17_2 then
      L3_2.renter = nil
      L3_2.renter_name = nil
      L16_2 = L3_2.rental
      L16_2.startTime = nil
      L16_2 = L3_2.rental
      L16_2.terminateAtPeriod = nil
      L16_2 = L15_2
      L17_2 = ", renter = NULL, renter_name = NULL"
      L16_2 = L16_2 .. L17_2
      L15_2 = L16_2
      L16_2 = L3_2.permissions
      L16_2 = L16_2[L7_2]
      if L16_2 then
        L16_2 = L3_2.permissions
        L16_2[L7_2] = nil
        L16_2 = L15_2
        L17_2 = ", permissions = @permissions"
        L16_2 = L16_2 .. L17_2
        L15_2 = L16_2
      end
    end
    L16_2 = L3_2.sale
    L16_2.active = false
    L16_2 = L3_2.rental
    L16_2.active = false
    L16_2 = L15_2
    L17_2 = " WHERE id = @id"
    L16_2 = L16_2 .. L17_2
    L15_2 = L16_2
    L16_2 = MySQL
    L16_2 = L16_2.update
    L16_2 = L16_2.await
    L17_2 = L15_2
    L18_2 = {}
    L19_2 = L3_2.owner
    L18_2["@owner"] = L19_2
    L19_2 = L3_2.owner_name
    L18_2["@owner_name"] = L19_2
    L19_2 = json
    L19_2 = L19_2.encode
    L20_2 = L3_2.permissions
    L19_2 = L19_2(L20_2)
    L18_2["@permissions"] = L19_2
    L19_2 = json
    L19_2 = L19_2.encode
    L20_2 = L3_2.sale
    L19_2 = L19_2(L20_2)
    L18_2["@sale"] = L19_2
    L19_2 = json
    L19_2 = L19_2.encode
    L20_2 = L3_2.rental
    L19_2 = L19_2(L20_2)
    L18_2["@rental"] = L19_2
    L19_2 = tonumber
    L20_2 = L2_2
    L19_2 = L19_2(L20_2)
    L18_2["@id"] = L19_2
    L16_2(L17_2, L18_2)
    L16_2 = TriggerClientEvent
    L17_2 = "vms_housing:cl:updateProperty"
    L18_2 = -1
    L19_2 = "newOwner"
    L20_2 = L2_2
    L21_2 = {}
    L22_2 = L3_2.owner
    L21_2.owner = L22_2
    L22_2 = L3_2.owner_name
    L21_2.owner_name = L22_2
    L22_2 = L3_2.renter
    L21_2.renter = L22_2
    L22_2 = L3_2.renter_name
    L21_2.renter_name = L22_2
    L22_2 = L3_2.permissions
    L21_2.permissions = L22_2
    L22_2 = L3_2.sale
    L21_2.sale = L22_2
    L22_2 = L3_2.rental
    L21_2.rental = L22_2
    L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
  end
  L15_2 = L1_1
  L15_2[L0_2] = nil
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:cancelContract"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = source
  L2_2 = tonumber
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L1_1
  L2_2 = L3_2[L2_2]
  if L2_2 then
    L2_2 = tonumber
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = L1_1
    L2_2 = L3_2[L2_2]
    L2_2 = L2_2.owner
    if L2_2 then
      L2_2 = library
      L2_2 = L2_2.Notification
      L3_2 = tonumber
      L4_2 = L1_2
      L3_2 = L3_2(L4_2)
      L4_2 = L1_1
      L3_2 = L4_2[L3_2]
      L3_2 = L3_2.owner
      L4_2 = TRANSLATE
      L5_2 = "notify.contract:canceled"
      L4_2 = L4_2(L5_2)
      L5_2 = 5000
      L6_2 = "error"
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
    L2_2 = tonumber
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = L1_1
    L3_2[L2_2] = nil
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:purchasePropertyMarketplace"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L3_2 = Config
  L3_2 = L3_2.Marketplace
  L3_2 = L3_2.Enabled
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.Marketplace
    L3_2 = L3_2.AllowTransactionFromMenu
    if L3_2 then
      goto lbl_12
    end
  end
  do return end
  ::lbl_12::
  L3_2 = source
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = L4_2.sale
  if L5_2 then
    L5_2 = L4_2.sale
    L5_2 = L5_2.active
    if L5_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = SV
  L6_2 = L6_2.GetIdentifier
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = L4_2.owner
  if L6_2 == L7_2 then
    L7_2 = library
    L7_2 = L7_2.Notification
    L8_2 = L3_2
    L9_2 = TRANSLATE
    L10_2 = "notify.property:already_owned"
    L9_2 = L9_2(L10_2)
    L10_2 = 5500
    L11_2 = "error"
    return L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = SV
  L7_2 = L7_2.GetMoney
  L8_2 = L5_2
  L9_2 = A1_2
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 then
    L8_2 = tonumber
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      goto lbl_64
    end
  end
  do return end
  ::lbl_64::
  L8_2 = tonumber
  L9_2 = math
  L9_2 = L9_2.floor
  L10_2 = L4_2.sale
  L10_2 = L10_2.price
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L9_2(L10_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L9_2 = tonumber
  L10_2 = L7_2
  L9_2 = L9_2(L10_2)
  if L8_2 > L9_2 then
    L9_2 = library
    L9_2 = L9_2.Notification
    L10_2 = L3_2
    L11_2 = TRANSLATE
    L12_2 = "notify.not_enough_money"
    L11_2 = L11_2(L12_2)
    L12_2 = 5500
    L13_2 = "error"
    return L9_2(L10_2, L11_2, L12_2, L13_2)
  end
  L9_2 = false
  L10_2 = SV
  L10_2 = L10_2.GetPlayerByIdentifier
  L11_2 = L4_2.owner
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L9_2 = true
  end
  L11_2 = Config
  L11_2 = L11_2.CityHallTaxes
  if L11_2 then
    L11_2 = L11_2.PropertyPurchase
  end
  if L11_2 then
    L11_2 = L11_2.Enabled
  end
  if L11_2 then
    L11_2 = SV
    L11_2 = L11_2.AddTax
    L12_2 = L6_2
    L13_2 = SV
    L13_2 = L13_2.GetCharacterName
    L14_2 = L5_2
    L13_2 = L13_2(L14_2)
    L14_2 = L4_2.name
    L15_2 = L4_2.address
    L16_2 = "property_purchase_tax"
    L17_2 = L8_2
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  end
  L11_2 = Config
  L11_2 = L11_2.CityHallTaxes
  if L11_2 then
    L11_2 = L11_2.PropertyResale
  end
  if L11_2 then
    L11_2 = L11_2.Enabled
  end
  if L11_2 then
    L11_2 = SV
    L11_2 = L11_2.AddTax
    L12_2 = L4_2.owner
    L13_2 = L4_2.owner_name
    L14_2 = L4_2.name
    L15_2 = L4_2.address
    L16_2 = "property_resale_tax"
    L17_2 = L8_2
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  end
  L11_2 = SV
  L11_2 = L11_2.RemoveMoney
  L12_2 = L5_2
  L13_2 = A1_2
  L14_2 = L8_2
  L11_2(L12_2, L13_2, L14_2)
  if L9_2 then
    L11_2 = library
    L11_2 = L11_2.Notification
    L12_2 = SV
    L12_2 = L12_2.GetSource
    L13_2 = L10_2
    L12_2 = L12_2(L13_2)
    L13_2 = TRANSLATE
    L14_2 = "notify.marketplace:sold"
    L15_2 = SV
    L15_2 = L15_2.GetCharacterName
    L16_2 = L5_2
    L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L15_2(L16_2)
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    L14_2 = 5000
    L15_2 = "success"
    L11_2(L12_2, L13_2, L14_2, L15_2)
    L11_2 = SV
    L11_2 = L11_2.AddMoney
    L12_2 = L10_2
    L13_2 = "bank"
    L14_2 = L8_2
    L11_2(L12_2, L13_2, L14_2)
  else
    L11_2 = SV
    L11_2 = L11_2.AddMoneyOffline
    L12_2 = L4_2.owner
    L13_2 = "bank"
    L14_2 = L8_2
    L11_2(L12_2, L13_2, L14_2)
  end
  L11_2 = library
  L11_2 = L11_2.Notification
  L12_2 = L3_2
  L13_2 = TRANSLATE
  L14_2 = "notify.marketplace:purchased"
  L13_2 = L13_2(L14_2)
  L14_2 = 5000
  L15_2 = "success"
  L11_2(L12_2, L13_2, L14_2, L15_2)
  L11_2 = SV
  L11_2 = L11_2.Webhook
  L12_2 = "PurchasedPropertyFromMarketplace"
  L13_2 = WebhookText
  L13_2 = L13_2["TITLE.PurchasedPropertyFromMarketplace"]
  L14_2 = WebhookText
  L15_2 = "DESCRIPTION.PurchasedPropertyFromMarketplace"
  L14_2 = L14_2[L15_2]
  L15_2 = L14_2
  L14_2 = L14_2.format
  L16_2 = SV
  L16_2 = L16_2.GetCharacterName
  L17_2 = L5_2
  L16_2 = L16_2(L17_2)
  L17_2 = L6_2
  L18_2 = A0_2
  L19_2 = L4_2.owner_name
  L20_2 = L4_2.owner
  L21_2 = L8_2
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L15_2 = 0
  L16_2 = L6_2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = "UPDATE houses SET owner = @owner, owner_name = @owner_name, sale = @sale, rental = @rental"
  L4_2.owner = L6_2
  L12_2 = SV
  L12_2 = L12_2.GetCharacterName
  L13_2 = L5_2
  L12_2 = L12_2(L13_2)
  L4_2.owner_name = L12_2
  L12_2 = L4_2.renter
  L13_2 = L4_2.owner
  if L12_2 == L13_2 then
    L4_2.renter = nil
    L4_2.renter_name = nil
    L12_2 = L4_2.rental
    L12_2.startTime = nil
    L12_2 = L4_2.rental
    L12_2.terminateAtPeriod = nil
    L12_2 = L11_2
    L13_2 = ", renter = NULL, renter_name = NULL"
    L12_2 = L12_2 .. L13_2
    L11_2 = L12_2
    L12_2 = L4_2.permissions
    L12_2 = L12_2[L6_2]
    if L12_2 then
      L12_2 = L4_2.permissions
      L12_2[L6_2] = nil
      L12_2 = L11_2
      L13_2 = ", permissions = @permissions"
      L12_2 = L12_2 .. L13_2
      L11_2 = L12_2
    end
  end
  L12_2 = L4_2.sale
  L12_2.active = false
  L12_2 = L4_2.rental
  L12_2.active = false
  L12_2 = L11_2
  L13_2 = " WHERE id = @id"
  L12_2 = L12_2 .. L13_2
  L11_2 = L12_2
  L12_2 = MySQL
  L12_2 = L12_2.update
  L12_2 = L12_2.await
  L13_2 = L11_2
  L14_2 = {}
  L15_2 = L4_2.owner
  L14_2["@owner"] = L15_2
  L15_2 = L4_2.owner_name
  L14_2["@owner_name"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L4_2.permissions
  L15_2 = L15_2(L16_2)
  L14_2["@permissions"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L4_2.sale
  L15_2 = L15_2(L16_2)
  L14_2["@sale"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L4_2.rental
  L15_2 = L15_2(L16_2)
  L14_2["@rental"] = L15_2
  L15_2 = tonumber
  L16_2 = A0_2
  L15_2 = L15_2(L16_2)
  L14_2["@id"] = L15_2
  L12_2(L13_2, L14_2)
  L12_2 = TriggerClientEvent
  L13_2 = "vms_housing:cl:updateProperty"
  L14_2 = -1
  L15_2 = "newOwner"
  L16_2 = A0_2
  L17_2 = {}
  L18_2 = L4_2.owner
  L17_2.owner = L18_2
  L18_2 = L4_2.owner_name
  L17_2.owner_name = L18_2
  L18_2 = L4_2.renter
  L17_2.renter = L18_2
  L18_2 = L4_2.renter_name
  L17_2.renter_name = L18_2
  L18_2 = L4_2.permissions
  L17_2.permissions = L18_2
  L18_2 = L4_2.sale
  L17_2.sale = L18_2
  L18_2 = L4_2.rental
  L17_2.rental = L18_2
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:rentPropertyMarketplace"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L3_2 = Config
  L3_2 = L3_2.Marketplace
  L3_2 = L3_2.Enabled
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.Marketplace
    L3_2 = L3_2.AllowTransactionFromMenu
    if L3_2 then
      goto lbl_12
    end
  end
  do return end
  ::lbl_12::
  L3_2 = source
  L4_2 = GetProperty
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = L4_2.rental
  if L5_2 then
    L5_2 = L4_2.rental
    L5_2 = L5_2.active
    if L5_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = SV
  L6_2 = L6_2.GetIdentifier
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = L4_2.owner
  if L6_2 ~= L7_2 then
    L7_2 = L4_2.renter
    if L6_2 ~= L7_2 then
      goto lbl_54
    end
  end
  L7_2 = library
  L7_2 = L7_2.Notification
  L8_2 = L3_2
  L9_2 = TRANSLATE
  L10_2 = "notify.property:already_owned"
  L9_2 = L9_2(L10_2)
  L10_2 = 5500
  L11_2 = "error"
  do return L7_2(L8_2, L9_2, L10_2, L11_2) end
  ::lbl_54::
  L7_2 = SV
  L7_2 = L7_2.GetMoney
  L8_2 = L5_2
  L9_2 = A1_2
  L7_2 = L7_2(L8_2, L9_2)
  if L7_2 then
    L8_2 = tonumber
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      goto lbl_67
    end
  end
  do return end
  ::lbl_67::
  L8_2 = tonumber
  L9_2 = math
  L9_2 = L9_2.floor
  L10_2 = L4_2.rental
  L10_2 = L10_2.price
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L9_2(L10_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L9_2 = tonumber
  L10_2 = L7_2
  L9_2 = L9_2(L10_2)
  if L8_2 > L9_2 then
    L9_2 = library
    L9_2 = L9_2.Notification
    L10_2 = L3_2
    L11_2 = TRANSLATE
    L12_2 = "notify.not_enough_money"
    L11_2 = L11_2(L12_2)
    L12_2 = 5500
    L13_2 = "error"
    return L9_2(L10_2, L11_2, L12_2, L13_2)
  end
  L9_2 = false
  L10_2 = SV
  L10_2 = L10_2.GetPlayerByIdentifier
  L11_2 = L4_2.owner
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L9_2 = true
  end
  L11_2 = Config
  L11_2 = L11_2.CityHallTaxes
  if L11_2 then
    L11_2 = L11_2.RentalIncome
  end
  if L11_2 then
    L11_2 = L11_2.Enabled
  end
  if L11_2 then
    L11_2 = SV
    L11_2 = L11_2.AddTax
    L12_2 = L4_2.owner
    L13_2 = L4_2.owner_name
    L14_2 = L4_2.name
    L15_2 = L4_2.address
    L16_2 = "rental_income_tax"
    L17_2 = L8_2
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  end
  L11_2 = SV
  L11_2 = L11_2.RemoveMoney
  L12_2 = L5_2
  L13_2 = A1_2
  L14_2 = L8_2
  L11_2(L12_2, L13_2, L14_2)
  if L9_2 then
    L11_2 = library
    L11_2 = L11_2.Notification
    L12_2 = SV
    L12_2 = L12_2.GetSource
    L13_2 = L10_2
    L12_2 = L12_2(L13_2)
    L13_2 = TRANSLATE
    L14_2 = "notify.marketplace:rented"
    L15_2 = SV
    L15_2 = L15_2.GetCharacterName
    L16_2 = L5_2
    L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L15_2(L16_2)
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    L14_2 = 5000
    L15_2 = "success"
    L11_2(L12_2, L13_2, L14_2, L15_2)
    L11_2 = SV
    L11_2 = L11_2.AddMoney
    L12_2 = L10_2
    L13_2 = "bank"
    L14_2 = L8_2
    L11_2(L12_2, L13_2, L14_2)
  else
    L11_2 = SV
    L11_2 = L11_2.AddMoneyOffline
    L12_2 = L4_2.owner
    L13_2 = "bank"
    L14_2 = L8_2
    L11_2(L12_2, L13_2, L14_2)
  end
  L11_2 = library
  L11_2 = L11_2.Notification
  L12_2 = L3_2
  L13_2 = TRANSLATE
  L14_2 = "notify.marketplace:started_rent"
  L13_2 = L13_2(L14_2)
  L14_2 = 5000
  L15_2 = "success"
  L11_2(L12_2, L13_2, L14_2, L15_2)
  L11_2 = SV
  L11_2 = L11_2.Webhook
  L12_2 = "RentedOutPropertyFromMarketplace"
  L13_2 = WebhookText
  L13_2 = L13_2["TITLE.RentedOutPropertyFromMarketplace"]
  L14_2 = WebhookText
  L15_2 = "DESCRIPTION.RentedOutPropertyFromMarketplace"
  L14_2 = L14_2[L15_2]
  L15_2 = L14_2
  L14_2 = L14_2.format
  L16_2 = SV
  L16_2 = L16_2.GetCharacterName
  L17_2 = L5_2
  L16_2 = L16_2(L17_2)
  L17_2 = L6_2
  L18_2 = A0_2
  L19_2 = L4_2.owner_name
  L20_2 = L4_2.owner
  L21_2 = L8_2
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L15_2 = 0
  L16_2 = L6_2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L4_2.renter = L6_2
  L11_2 = SV
  L11_2 = L11_2.GetCharacterName
  L12_2 = L5_2
  L11_2 = L11_2(L12_2)
  L4_2.renter_name = L11_2
  L11_2 = L4_2.permissions
  L12_2 = {}
  L13_2 = L4_2.renter_name
  L12_2._name = L13_2
  L11_2[L6_2] = L12_2
  L11_2 = ipairs
  L12_2 = Config
  L12_2 = L12_2.DefaultPermissionsForRenter
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = L4_2.permissions
    L17_2 = L17_2[L6_2]
    L17_2[L16_2] = true
  end
  L11_2 = L4_2.sale
  L11_2.active = false
  L11_2 = L4_2.rental
  L11_2.active = false
  L11_2 = L4_2.rental
  L12_2 = os
  L12_2 = L12_2.time
  L12_2 = L12_2()
  L11_2.startTime = L12_2
  L11_2 = library
  L11_2 = L11_2.GetOrCreateBills
  L12_2 = A0_2
  L13_2 = true
  L11_2 = L11_2(L12_2, L13_2)
  L4_2.bills = L11_2
  L11_2 = "UPDATE houses SET renter = @renter, renter_name = @renter_name, permissions = @permissions, sale = @sale, rental = @rental WHERE id = @id"
  L12_2 = MySQL
  L12_2 = L12_2.update
  L12_2 = L12_2.await
  L13_2 = L11_2
  L14_2 = {}
  L15_2 = L4_2.renter
  L14_2["@renter"] = L15_2
  L15_2 = L4_2.renter_name
  L14_2["@renter_name"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L4_2.permissions
  L15_2 = L15_2(L16_2)
  L14_2["@permissions"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L4_2.sale
  L15_2 = L15_2(L16_2)
  L14_2["@sale"] = L15_2
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L4_2.rental
  L15_2 = L15_2(L16_2)
  L14_2["@rental"] = L15_2
  L15_2 = tonumber
  L16_2 = A0_2
  L15_2 = L15_2(L16_2)
  L14_2["@id"] = L15_2
  L12_2(L13_2, L14_2)
  L12_2 = TriggerClientEvent
  L13_2 = "vms_housing:cl:updateProperty"
  L14_2 = -1
  L15_2 = "newRenter"
  L16_2 = A0_2
  L17_2 = {}
  L18_2 = L4_2.renter
  L17_2.renter = L18_2
  L18_2 = L4_2.renter_name
  L17_2.renter_name = L18_2
  L18_2 = L4_2.permissions
  L17_2.permissions = L18_2
  L18_2 = L4_2.sale
  L17_2.sale = L18_2
  L18_2 = L4_2.rental
  L17_2.rental = L18_2
  L18_2 = L4_2.bills
  L17_2.bills = L18_2
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:removePermission"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetProperty
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = tostring
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  A1_2 = L6_2
  L6_2 = L5_2.owner
  if L6_2 then
    L6_2 = L5_2.owner
    L6_2 = L6_2 == L4_2
  end
  L7_2 = L5_2.renter
  if L7_2 then
    L7_2 = L5_2.renter
    L7_2 = L7_2 == L4_2
  end
  if not L6_2 and not L7_2 then
    L8_2 = library
    L8_2 = L8_2.Notification
    L9_2 = L2_2
    L10_2 = TRANSLATE
    L11_2 = "notify.not_allowed"
    L10_2 = L10_2(L11_2)
    L11_2 = 5500
    L12_2 = "error"
    return L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  L8_2 = L5_2.owner
  if L8_2 == A1_2 then
    L8_2 = library
    L8_2 = L8_2.Notification
    L9_2 = L2_2
    L10_2 = TRANSLATE
    L11_2 = "notify.permissions:cannot_remove_owner"
    L10_2 = L10_2(L11_2)
    L11_2 = 5000
    L12_2 = "error"
    return L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  if L4_2 == A1_2 then
    L8_2 = library
    L8_2 = L8_2.Notification
    L9_2 = L2_2
    L10_2 = TRANSLATE
    L11_2 = "notify.permissions:cannot_remove_self"
    L10_2 = L10_2(L11_2)
    L11_2 = 5000
    L12_2 = "error"
    return L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  L8_2 = L5_2.permissions
  L8_2 = L8_2[A1_2]
  if not L8_2 then
    L8_2 = library
    L8_2 = L8_2.Notification
    L9_2 = L2_2
    L10_2 = TRANSLATE
    L11_2 = "notify.permissions:error"
    L10_2 = L10_2(L11_2)
    L11_2 = 5000
    L12_2 = "error"
    return L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  if not L6_2 then
    L8_2 = L5_2.permissions
    L8_2 = L8_2[A1_2]
    L8_2 = L8_2.marketplaceManage
    if not L8_2 then
      L8_2 = L5_2.permissions
      L8_2 = L8_2[A1_2]
      L8_2 = L8_2.sell
      if not L8_2 then
        L8_2 = L5_2.permissions
        L8_2 = L8_2[A1_2]
        L8_2 = L8_2.automaticSell
        if not L8_2 then
          L8_2 = L5_2.permissions
          L8_2 = L8_2[A1_2]
          L8_2 = L8_2.rent
          if not L8_2 then
            L8_2 = L5_2.permissions
            L8_2 = L8_2[A1_2]
            L8_2 = L8_2.rentersManage
            if not L8_2 then
              goto lbl_129
            end
          end
        end
      end
    end
    L8_2 = library
    L8_2 = L8_2.Notification
    L9_2 = L2_2
    L10_2 = TRANSLATE
    L11_2 = "notify.not_allowed"
    L10_2 = L10_2(L11_2)
    L11_2 = 5500
    L12_2 = "error"
    return L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  ::lbl_129::
  L8_2 = SV
  L8_2 = L8_2.Webhook
  L9_2 = "RemovedPermissions"
  L10_2 = WebhookText
  L10_2 = L10_2["TITLE.RemovedPermissions"]
  L11_2 = WebhookText
  L11_2 = L11_2["DESCRIPTION.RemovedPermissions"]
  L12_2 = L11_2
  L11_2 = L11_2.format
  L13_2 = SV
  L13_2 = L13_2.GetCharacterName
  L14_2 = L3_2
  L13_2 = L13_2(L14_2)
  L14_2 = L4_2
  L15_2 = L5_2.permissions
  L15_2 = L15_2[A1_2]
  L15_2 = L15_2._name
  L16_2 = A1_2
  L17_2 = A0_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = 0
  L13_2 = L4_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = L5_2.permissions
  L8_2[A1_2] = nil
  L8_2 = "UPDATE houses SET permissions = @permissions WHERE id = @id"
  L9_2 = MySQL
  L9_2 = L9_2.update
  L9_2 = L9_2.await
  L10_2 = L8_2
  L11_2 = {}
  L12_2 = json
  L12_2 = L12_2.encode
  L13_2 = L5_2.permissions
  L12_2 = L12_2(L13_2)
  L11_2["@permissions"] = L12_2
  L12_2 = tonumber
  L13_2 = A0_2
  L12_2 = L12_2(L13_2)
  L11_2["@id"] = L12_2
  L9_2(L10_2, L11_2)
  L9_2 = TriggerClientEvent
  L10_2 = "vms_housing:cl:updateProperty"
  L11_2 = -1
  L12_2 = "updatedPermissions"
  L13_2 = A0_2
  L14_2 = {}
  L15_2 = L5_2.permissions
  L14_2.permissions = L15_2
  L15_2 = L2_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:updatePermission"
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L3_2 = source
  L4_2 = SV
  L4_2 = L4_2.GetPlayer
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = SV
  L5_2 = L5_2.GetIdentifier
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetProperty
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L7_2 = tostring
  L8_2 = A1_2
  L7_2 = L7_2(L8_2)
  A1_2 = L7_2
  L7_2 = L6_2.owner
  if L7_2 then
    L7_2 = L6_2.owner
    L7_2 = L7_2 == L5_2
  end
  L8_2 = L6_2.renter
  if L8_2 then
    L8_2 = L6_2.renter
    L8_2 = L8_2 == L5_2
  end
  if not L7_2 and not L8_2 then
    L9_2 = library
    L9_2 = L9_2.Notification
    L10_2 = L3_2
    L11_2 = TRANSLATE
    L12_2 = "notify.not_allowed"
    L11_2 = L11_2(L12_2)
    L12_2 = 5500
    L13_2 = "error"
    return L9_2(L10_2, L11_2, L12_2, L13_2)
  end
  L9_2 = L6_2.owner
  if L9_2 == A1_2 then
    return
  end
  if L5_2 == A1_2 then
    return
  end
  L9_2 = L6_2.permissions
  L9_2 = L9_2[A1_2]
  if not L9_2 then
    return
  end
  if not L7_2 then
    L9_2 = L6_2.permissions
    L9_2 = L9_2[L5_2]
    L9_2 = L9_2.garage
    if not L9_2 then
      goto lbl_82
    end
  end
  L9_2 = L6_2.permissions
  L9_2 = L9_2[A1_2]
  L10_2 = A2_2.garage
  if L10_2 then
    L10_2 = true
    if L10_2 then
      goto lbl_81
    end
  end
  L10_2 = nil
  ::lbl_81::
  L9_2.garage = L10_2
  ::lbl_82::
  if not L7_2 then
    L9_2 = L6_2.permissions
    L9_2 = L9_2[L5_2]
    L9_2 = L9_2.furniture
    if not L9_2 then
      goto lbl_99
    end
  end
  L9_2 = L6_2.permissions
  L9_2 = L9_2[A1_2]
  L10_2 = A2_2.furniture
  if L10_2 then
    L10_2 = true
    if L10_2 then
      goto lbl_98
    end
  end
  L10_2 = nil
  ::lbl_98::
  L9_2.furniture = L10_2
  ::lbl_99::
  if not L7_2 then
    L9_2 = L6_2.permissions
    L9_2 = L9_2[L5_2]
    L9_2 = L9_2.billPayments
    if not L9_2 then
      goto lbl_116
    end
  end
  L9_2 = L6_2.permissions
  L9_2 = L9_2[A1_2]
  L10_2 = A2_2.billPayments
  if L10_2 then
    L10_2 = true
    if L10_2 then
      goto lbl_115
    end
  end
  L10_2 = nil
  ::lbl_115::
  L9_2.billPayments = L10_2
  ::lbl_116::
  if not L7_2 then
    L9_2 = L6_2.permissions
    L9_2 = L9_2[L5_2]
    L9_2 = L9_2.keysManage
    if not L9_2 then
      goto lbl_133
    end
  end
  L9_2 = L6_2.permissions
  L9_2 = L9_2[A1_2]
  L10_2 = A2_2.keysManage
  if L10_2 then
    L10_2 = true
    if L10_2 then
      goto lbl_132
    end
  end
  L10_2 = nil
  ::lbl_132::
  L9_2.keysManage = L10_2
  ::lbl_133::
  if not L7_2 then
    L9_2 = L6_2.permissions
    L9_2 = L9_2[L5_2]
    L9_2 = L9_2.upgradesManage
    if not L9_2 then
      goto lbl_150
    end
  end
  L9_2 = L6_2.permissions
  L9_2 = L9_2[A1_2]
  L10_2 = A2_2.upgradesManage
  if L10_2 then
    L10_2 = true
    if L10_2 then
      goto lbl_149
    end
  end
  L10_2 = nil
  ::lbl_149::
  L9_2.upgradesManage = L10_2
  ::lbl_150::
  if L7_2 then
    L9_2 = L6_2.permissions
    L9_2 = L9_2[A1_2]
    L10_2 = A2_2.marketplaceManage
    if L10_2 then
      L10_2 = true
      if L10_2 then
        goto lbl_161
      end
    end
    L10_2 = nil
    ::lbl_161::
    L9_2.marketplaceManage = L10_2
    L9_2 = L6_2.permissions
    L9_2 = L9_2[A1_2]
    L10_2 = A2_2.sell
    if L10_2 then
      L10_2 = true
      if L10_2 then
        goto lbl_171
      end
    end
    L10_2 = nil
    ::lbl_171::
    L9_2.sell = L10_2
    L9_2 = L6_2.permissions
    L9_2 = L9_2[A1_2]
    L10_2 = A2_2.automaticSell
    if L10_2 then
      L10_2 = true
      if L10_2 then
        goto lbl_181
      end
    end
    L10_2 = nil
    ::lbl_181::
    L9_2.automaticSell = L10_2
    L9_2 = L6_2.permissions
    L9_2 = L9_2[A1_2]
    L10_2 = A2_2.rent
    if L10_2 then
      L10_2 = true
      if L10_2 then
        goto lbl_191
      end
    end
    L10_2 = nil
    ::lbl_191::
    L9_2.rent = L10_2
    L9_2 = L6_2.permissions
    L9_2 = L9_2[A1_2]
    L10_2 = A2_2.rentersManage
    if L10_2 then
      L10_2 = true
      if L10_2 then
        goto lbl_201
      end
    end
    L10_2 = nil
    ::lbl_201::
    L9_2.rentersManage = L10_2
  end
  L9_2 = SV
  L9_2 = L9_2.Webhook
  L10_2 = "UpdatedPermissions"
  L11_2 = WebhookText
  L11_2 = L11_2["TITLE.UpdatedPermissions"]
  L12_2 = WebhookText
  L12_2 = L12_2["DESCRIPTION.UpdatedPermissions"]
  L13_2 = L12_2
  L12_2 = L12_2.format
  L14_2 = SV
  L14_2 = L14_2.GetCharacterName
  L15_2 = L4_2
  L14_2 = L14_2(L15_2)
  L15_2 = L5_2
  L16_2 = L6_2.permissions
  L16_2 = L16_2[A1_2]
  L16_2 = L16_2._name
  L17_2 = A1_2
  L18_2 = A0_2
  L19_2 = L6_2.permissions
  L19_2 = L19_2[A1_2]
  L19_2 = L19_2.garage
  if L19_2 then
    L19_2 = "\226\156\133"
    if L19_2 then
      goto lbl_229
    end
  end
  L19_2 = "\226\157\140"
  ::lbl_229::
  L20_2 = L6_2.permissions
  L20_2 = L20_2[A1_2]
  L20_2 = L20_2.furniture
  if L20_2 then
    L20_2 = "\226\156\133"
    if L20_2 then
      goto lbl_238
    end
  end
  L20_2 = "\226\157\140"
  ::lbl_238::
  L21_2 = L6_2.permissions
  L21_2 = L21_2[A1_2]
  L21_2 = L21_2.billPayments
  if L21_2 then
    L21_2 = "\226\156\133"
    if L21_2 then
      goto lbl_247
    end
  end
  L21_2 = "\226\157\140"
  ::lbl_247::
  L22_2 = L6_2.permissions
  L22_2 = L22_2[A1_2]
  L22_2 = L22_2.keysManage
  if L22_2 then
    L22_2 = "\226\156\133"
    if L22_2 then
      goto lbl_256
    end
  end
  L22_2 = "\226\157\140"
  ::lbl_256::
  L23_2 = L6_2.permissions
  L23_2 = L23_2[A1_2]
  L23_2 = L23_2.upgradesManage
  if L23_2 then
    L23_2 = "\226\156\133"
    if L23_2 then
      goto lbl_265
    end
  end
  L23_2 = "\226\157\140"
  ::lbl_265::
  L24_2 = L6_2.permissions
  L24_2 = L24_2[A1_2]
  L24_2 = L24_2.marketplaceManage
  if L24_2 then
    L24_2 = "\226\156\133"
    if L24_2 then
      goto lbl_274
    end
  end
  L24_2 = "\226\157\140"
  ::lbl_274::
  L25_2 = L6_2.permissions
  L25_2 = L25_2[A1_2]
  L25_2 = L25_2.sell
  if L25_2 then
    L25_2 = "\226\156\133"
    if L25_2 then
      goto lbl_283
    end
  end
  L25_2 = "\226\157\140"
  ::lbl_283::
  L26_2 = L6_2.permissions
  L26_2 = L26_2[A1_2]
  L26_2 = L26_2.automaticSell
  if L26_2 then
    L26_2 = "\226\156\133"
    if L26_2 then
      goto lbl_292
    end
  end
  L26_2 = "\226\157\140"
  ::lbl_292::
  L27_2 = L6_2.permissions
  L27_2 = L27_2[A1_2]
  L27_2 = L27_2.rent
  if L27_2 then
    L27_2 = "\226\156\133"
    if L27_2 then
      goto lbl_301
    end
  end
  L27_2 = "\226\157\140"
  ::lbl_301::
  L28_2 = L6_2.permissions
  L28_2 = L28_2[A1_2]
  L28_2 = L28_2.rentersManage
  if L28_2 then
    L28_2 = "\226\156\133"
    if L28_2 then
      goto lbl_310
    end
  end
  L28_2 = "\226\157\140"
  ::lbl_310::
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
  L13_2 = 0
  L14_2 = L5_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L9_2 = "UPDATE houses SET permissions = @permissions WHERE id = @id"
  L10_2 = MySQL
  L10_2 = L10_2.update
  L10_2 = L10_2.await
  L11_2 = L9_2
  L12_2 = {}
  L13_2 = json
  L13_2 = L13_2.encode
  L14_2 = L6_2.permissions
  L13_2 = L13_2(L14_2)
  L12_2["@permissions"] = L13_2
  L13_2 = tonumber
  L14_2 = A0_2
  L13_2 = L13_2(L14_2)
  L12_2["@id"] = L13_2
  L10_2(L11_2, L12_2)
  L10_2 = TriggerClientEvent
  L11_2 = "vms_housing:cl:updateProperty"
  L12_2 = -1
  L13_2 = "updatedPermissions"
  L14_2 = A0_2
  L15_2 = {}
  L16_2 = L6_2.permissions
  L15_2.permissions = L16_2
  L16_2 = L3_2
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:addPermission"
function L7_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = SV
  L5_2 = L5_2.GetPlayer
  L6_2 = tonumber
  L7_2 = A1_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L6_2(L7_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  if not L5_2 then
    return
  end
  L6_2 = SV
  L6_2 = L6_2.GetIdentifier
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = GetProperty
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    return
  end
  L8_2 = L7_2.owner
  if L8_2 then
    L8_2 = L7_2.owner
    L8_2 = L8_2 == L4_2
  end
  L9_2 = L7_2.renter
  if L9_2 then
    L9_2 = L7_2.renter
    L9_2 = L9_2 == L4_2
  end
  if not L8_2 and not L9_2 then
    L10_2 = library
    L10_2 = L10_2.Notification
    L11_2 = L2_2
    L12_2 = TRANSLATE
    L13_2 = "notify.not_allowed"
    L12_2 = L12_2(L13_2)
    L13_2 = 5500
    L14_2 = "error"
    return L10_2(L11_2, L12_2, L13_2, L14_2)
  end
  L10_2 = L7_2.owner
  if L10_2 == L6_2 then
    return
  end
  if L4_2 == L6_2 then
    return
  end
  L10_2 = L7_2.permissions
  L10_2 = L10_2[L6_2]
  if L10_2 then
    return
  end
  L10_2 = 0
  L11_2 = pairs
  L12_2 = L7_2.permissions
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2 in L11_2, L12_2, L13_2, L14_2 do
    L10_2 = L10_2 + 1
  end
  L11_2 = L7_2.metadata
  L11_2 = L11_2.permissionsLimit
  if L11_2 then
    L11_2 = tonumber
    L12_2 = L7_2.metadata
    L12_2 = L12_2.permissionsLimit
    L11_2 = L11_2(L12_2)
    if L10_2 >= L11_2 then
      L11_2 = library
      L11_2 = L11_2.Notification
      L12_2 = L2_2
      L13_2 = TRANSLATE
      L14_2 = "notify.property:reached_permissions_limit"
      L13_2 = L13_2(L14_2)
      L14_2 = 5000
      L15_2 = "error"
      return L11_2(L12_2, L13_2, L14_2, L15_2)
    end
  else
    L11_2 = Config
    L11_2 = L11_2.PermissionsLimit
    if L10_2 >= L11_2 then
      L11_2 = library
      L11_2 = L11_2.Notification
      L12_2 = L2_2
      L13_2 = TRANSLATE
      L14_2 = "notify.property:reached_permissions_limit"
      L13_2 = L13_2(L14_2)
      L14_2 = 5000
      L15_2 = "error"
      return L11_2(L12_2, L13_2, L14_2, L15_2)
    end
  end
  L11_2 = L7_2.permissions
  L12_2 = {}
  L13_2 = SV
  L13_2 = L13_2.GetCharacterName
  L14_2 = L5_2
  L13_2 = L13_2(L14_2)
  L12_2._name = L13_2
  L11_2[L6_2] = L12_2
  L11_2 = SV
  L11_2 = L11_2.Webhook
  L12_2 = "AddedPermissions"
  L13_2 = WebhookText
  L13_2 = L13_2["TITLE.AddedPermissions"]
  L14_2 = WebhookText
  L14_2 = L14_2["DESCRIPTION.AddedPermissions"]
  L15_2 = L14_2
  L14_2 = L14_2.format
  L16_2 = SV
  L16_2 = L16_2.GetCharacterName
  L17_2 = L3_2
  L16_2 = L16_2(L17_2)
  L17_2 = L4_2
  L18_2 = L7_2.permissions
  L18_2 = L18_2[L6_2]
  L18_2 = L18_2._name
  L19_2 = L6_2
  L20_2 = A0_2
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L15_2 = 0
  L16_2 = L4_2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = "UPDATE houses SET permissions = @permissions WHERE id = @id"
  L12_2 = MySQL
  L12_2 = L12_2.update
  L12_2 = L12_2.await
  L13_2 = L11_2
  L14_2 = {}
  L15_2 = json
  L15_2 = L15_2.encode
  L16_2 = L7_2.permissions
  L15_2 = L15_2(L16_2)
  L14_2["@permissions"] = L15_2
  L15_2 = tonumber
  L16_2 = A0_2
  L15_2 = L15_2(L16_2)
  L14_2["@id"] = L15_2
  L12_2(L13_2, L14_2)
  L12_2 = TriggerClientEvent
  L13_2 = "vms_housing:cl:updateProperty"
  L14_2 = -1
  L15_2 = "updatedPermissions"
  L16_2 = A0_2
  L17_2 = {}
  L18_2 = L7_2.permissions
  L17_2.permissions = L18_2
  L18_2 = L2_2
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:moveOut"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = source
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = L2_2.renter
  if L5_2 then
    L5_2 = L2_2.renter
    L5_2 = L5_2 == L4_2
  end
  if not L5_2 then
    return
  end
  L6_2 = ""
  L7_2 = L2_2.owner
  if L7_2 then
    L6_2 = [[
            UPDATE `houses`
                SET
                    `renter` = NULL,
                    `renter_name` = NULL,
                    `keys` = @keys,
                    `permissions` = @permissions,
                    `metadata` = @metadata,
                    `rental` = @rental
            WHERE id = @id
        ]]
    L7_2 = Config
    L7_2 = L7_2.RemoveKeysOnRentEnd
    if L7_2 then
      L7_2 = json
      L7_2 = L7_2.encode
      L8_2 = {}
      L7_2 = L7_2(L8_2)
      L2_2.keys = L7_2
    end
    L2_2.unpaidRentBills = nil
    L7_2 = MySQL
    L7_2 = L7_2.prepare
    L8_2 = "DELETE FROM houses_bills WHERE `house_id` = ? AND `type` = ? AND `paid` = 0"
    L9_2 = {}
    L10_2 = tonumber
    L11_2 = A0_2
    L10_2 = L10_2(L11_2)
    L11_2 = "rent"
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L7_2(L8_2, L9_2)
    L7_2 = L2_2.bills
    L7_2 = #L7_2
    L8_2 = 1
    L9_2 = -1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = L2_2.bills
      L11_2 = L11_2[L10_2]
      L12_2 = L11_2.type
      if "rent" == L12_2 then
        L12_2 = L11_2.paid
        if 0 ~= L12_2 then
          L12_2 = L11_2.paid
          if false ~= L12_2 then
            goto lbl_78
          end
        end
        L12_2 = table
        L12_2 = L12_2.remove
        L13_2 = L2_2.bills
        L14_2 = L10_2
        L12_2(L13_2, L14_2)
      end
      ::lbl_78::
    end
    L7_2 = L2_2.permissions
    L8_2 = L2_2.renter
    L7_2[L8_2] = nil
  else
    L6_2 = [[
            UPDATE `houses`
                SET
                    `renter` = NULL,
                    `renter_name` = NULL,
                    `keys` = @keys,
                    `permissions` = @permissions,
                    `metadata` = @metadata,
                    `sale` = @sale,
                    `rental` = @rental,
                    `last_enter` = NULL
            WHERE id = @id
        ]]
    L7_2 = json
    L7_2 = L7_2.encode
    L8_2 = {}
    L7_2 = L7_2(L8_2)
    L2_2.keys = L7_2
    L7_2 = L2_2.sale
    L8_2 = L2_2.sale
    L8_2 = L8_2.defaultActive
    L7_2.active = L8_2
    L7_2 = L2_2.rental
    L8_2 = L2_2.rental
    L8_2 = L8_2.defaultActive
    L7_2.active = L8_2
    L7_2 = L2_2.metadata
    L7_2.contact_number = nil
    L7_2 = Config
    L7_2 = L7_2.RemoveFurnitureOnRentEnd
    if L7_2 then
      L7_2 = {}
      L2_2.furniture = L7_2
      L7_2 = MySQL
      L7_2 = L7_2.prepare
      L8_2 = "DELETE FROM houses_furniture WHERE house_id = ?"
      L9_2 = {}
      L10_2 = tonumber
      L11_2 = A0_2
      L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2)
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L9_2[4] = L13_2
      L9_2[5] = L14_2
      L7_2(L8_2, L9_2)
    end
    L7_2 = {}
    L2_2.bills = L7_2
    L2_2.unpaidBills = 0
    L2_2.unpaidRentBills = nil
    L7_2 = MySQL
    L7_2 = L7_2.prepare
    L8_2 = "DELETE FROM houses_bills WHERE house_id = ?"
    L9_2 = {}
    L10_2 = tonumber
    L11_2 = A0_2
    L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2)
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L9_2[4] = L13_2
    L9_2[5] = L14_2
    L7_2(L8_2, L9_2)
    L7_2 = {}
    L2_2.permissions = L7_2
  end
  L2_2.renter = nil
  L2_2.renter_name = nil
  L7_2 = L2_2.rental
  L7_2.startTime = nil
  L7_2 = L2_2.rental
  L7_2.terminateAtPeriod = nil
  L7_2 = L2_2.metadata
  L7_2.locked = true
  L7_2 = L2_2.metadata
  L7_2.lightState = false
  L7_2 = L2_2.metadata
  L7_2.lightStartTime = nil
  L7_2 = MySQL
  L7_2 = L7_2.Async
  L7_2 = L7_2.execute
  L8_2 = L6_2
  L9_2 = {}
  L10_2 = L2_2.keys
  L9_2["@keys"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.permissions
  L10_2 = L10_2(L11_2)
  L9_2["@permissions"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.metadata
  L10_2 = L10_2(L11_2)
  L9_2["@metadata"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.sale
  L10_2 = L10_2(L11_2)
  L9_2["@sale"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.rental
  L10_2 = L10_2(L11_2)
  L9_2["@rental"] = L10_2
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  L9_2["@id"] = L10_2
  L7_2(L8_2, L9_2)
  L7_2 = library
  L7_2 = L7_2.Notification
  L8_2 = L1_2
  L9_2 = TRANSLATE
  L10_2 = "notify.property:moved_out"
  L9_2 = L9_2(L10_2)
  L10_2 = 5000
  L11_2 = "success"
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L7_2 = TriggerClientEvent
  L8_2 = "vms_housing:cl:updateProperty"
  L9_2 = -1
  L10_2 = "movedOut"
  L11_2 = A0_2
  L12_2 = {}
  L13_2 = L2_2.keys
  L12_2.keys = L13_2
  L13_2 = L2_2.permissions
  L12_2.permissions = L13_2
  L13_2 = L2_2.metadata
  L12_2.metadata = L13_2
  L13_2 = L2_2.sale
  L12_2.sale = L13_2
  L13_2 = L2_2.rental
  L12_2.rental = L13_2
  L13_2 = L2_2.bills
  L12_2.bills = L13_2
  L13_2 = L1_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:removeOwner"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = source
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = L2_2.owner
  if not L5_2 then
    return
  end
  L5_2 = false
  L6_2 = "UPDATE `houses` SET `owner` = NULL, `owner_name` = NULL"
  L7_2 = L2_2.renter
  if not L7_2 then
    L5_2 = true
    L7_2 = L6_2
    L8_2 = ", `keys` = @keys, `permissions` = @permissions, `metadata` = @metadata, `sale` = @sale, `rental` = @rental, last_enter = NULL"
    L7_2 = L7_2 .. L8_2
    L6_2 = L7_2
    L7_2 = json
    L7_2 = L7_2.encode
    L8_2 = {}
    L7_2 = L7_2(L8_2)
    L2_2.keys = L7_2
    L7_2 = {}
    L2_2.permissions = L7_2
    L7_2 = L2_2.metadata
    L7_2.locked = false
    L7_2 = L2_2.metadata
    L7_2.lightState = false
    L7_2 = L2_2.metadata
    L8_2 = {}
    L7_2.upgrades = L8_2
    L7_2 = L2_2.sale
    L8_2 = L2_2.sale
    L8_2 = L8_2.defaultActive
    L7_2.active = L8_2
    L7_2 = L2_2.sale
    L8_2 = L2_2.sale
    L8_2 = L8_2.defaultPrice
    if not L8_2 then
      L8_2 = 0
    end
    L7_2.price = L8_2
    L7_2 = L2_2.rental
    L8_2 = L2_2.rental
    L8_2 = L8_2.defaultActive
    L7_2.active = L8_2
    L7_2 = L2_2.rental
    L8_2 = L2_2.rental
    L8_2 = L8_2.defaultPrice
    if not L8_2 then
      L8_2 = 0
    end
    L7_2.price = L8_2
    L2_2.last_enter = nil
    L7_2 = {}
    L2_2.furniture = L7_2
    L7_2 = MySQL
    L7_2 = L7_2.query
    L8_2 = "DELETE FROM houses_furniture WHERE `id` = ?"
    L9_2 = {}
    L10_2 = tonumber
    L11_2 = A0_2
    L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L9_2[4] = L13_2
    L7_2(L8_2, L9_2)
  end
  L2_2.owner = nil
  L2_2.owner_name = nil
  L7_2 = L6_2
  L8_2 = " WHERE `id` = @id"
  L7_2 = L7_2 .. L8_2
  L6_2 = L7_2
  L7_2 = MySQL
  L7_2 = L7_2.query
  L8_2 = L6_2
  L9_2 = {}
  L10_2 = L2_2.keys
  L9_2["@keys"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.permissions
  L10_2 = L10_2(L11_2)
  L9_2["@permissions"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.metadata
  L10_2 = L10_2(L11_2)
  L9_2["@metadata"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.sale
  L10_2 = L10_2(L11_2)
  L9_2["@sale"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.rental
  L10_2 = L10_2(L11_2)
  L9_2["@rental"] = L10_2
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  L9_2["@id"] = L10_2
  L7_2(L8_2, L9_2)
  if L5_2 then
    L7_2 = TriggerClientEvent
    L8_2 = "vms_housing:cl:updateProperty"
    L9_2 = -1
    L10_2 = "forceRemovedOwner"
    L11_2 = A0_2
    L12_2 = {}
    L12_2.completelyRemoved = L5_2
    L13_2 = L2_2.keys
    L12_2.keys = L13_2
    L13_2 = L2_2.permissions
    L12_2.permissions = L13_2
    L13_2 = L2_2.metadata
    L12_2.metadata = L13_2
    L13_2 = L2_2.sale
    L12_2.sale = L13_2
    L13_2 = L2_2.rental
    L12_2.rental = L13_2
    L13_2 = L1_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  else
    L7_2 = TriggerClientEvent
    L8_2 = "vms_housing:cl:updateProperty"
    L9_2 = -1
    L10_2 = "forceRemovedOwner"
    L11_2 = A0_2
    L12_2 = {}
    L12_2.completelyRemoved = L5_2
    L13_2 = L1_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
end
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "vms_housing:sv:removeRenter"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = source
  L2_2 = GetProperty
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = L2_2.renter
  if not L5_2 then
    return
  end
  L5_2 = false
  L6_2 = "UPDATE `houses` SET `renter` = NULL, `renter_name` = NULL"
  L7_2 = L2_2.owner
  if not L7_2 then
    L7_2 = L6_2
    L8_2 = ", `keys` = @keys, `permissions` = @permissions, `metadata` = @metadata, `sale` = @sale, `rental` = @rental, last_enter = NULL"
    L7_2 = L7_2 .. L8_2
    L6_2 = L7_2
    L7_2 = json
    L7_2 = L7_2.encode
    L8_2 = {}
    L7_2 = L7_2(L8_2)
    L2_2.keys = L7_2
    L7_2 = {}
    L2_2.permissions = L7_2
    L7_2 = L2_2.metadata
    L7_2.locked = false
    L7_2 = L2_2.metadata
    L7_2.lightState = false
    L7_2 = L2_2.metadata
    L8_2 = {}
    L7_2.upgrades = L8_2
    L7_2 = L2_2.sale
    L8_2 = L2_2.sale
    L8_2 = L8_2.defaultActive
    L7_2.active = L8_2
    L7_2 = L2_2.sale
    L8_2 = L2_2.sale
    L8_2 = L8_2.defaultPrice
    if not L8_2 then
      L8_2 = 0
    end
    L7_2.price = L8_2
    L7_2 = L2_2.rental
    L8_2 = L2_2.rental
    L8_2 = L8_2.defaultActive
    L7_2.active = L8_2
    L7_2 = L2_2.rental
    L8_2 = L2_2.rental
    L8_2 = L8_2.defaultPrice
    if not L8_2 then
      L8_2 = 0
    end
    L7_2.price = L8_2
    L2_2.last_enter = nil
    L7_2 = {}
    L2_2.furniture = L7_2
    L7_2 = MySQL
    L7_2 = L7_2.query
    L8_2 = "DELETE FROM houses_furniture WHERE `id` = ?"
    L9_2 = {}
    L10_2 = tonumber
    L11_2 = A0_2
    L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L9_2[4] = L13_2
    L7_2(L8_2, L9_2)
  else
    L7_2 = L2_2.permissions
    L8_2 = L2_2.renter
    L7_2 = L7_2[L8_2]
    if L7_2 then
      L7_2 = L2_2.permissions
      L8_2 = L2_2.renter
      L7_2[L8_2] = nil
    end
    L7_2 = json
    L7_2 = L7_2.decode
    L8_2 = L2_2.keys
    L7_2 = L7_2(L8_2)
    L2_2.keys = L7_2
    L7_2 = L2_2.keys
    L8_2 = identifier
    L7_2 = L7_2[L8_2]
    if L7_2 then
      L7_2 = L2_2.keys
      L8_2 = identifier
      L7_2[L8_2] = nil
    end
    L7_2 = json
    L7_2 = L7_2.encode
    L8_2 = L2_2.keys
    L7_2 = L7_2(L8_2)
    L2_2.keys = L7_2
  end
  L2_2.renter = nil
  L2_2.renter_name = nil
  L7_2 = L6_2
  L8_2 = " WHERE `id` = @id"
  L7_2 = L7_2 .. L8_2
  L6_2 = L7_2
  L7_2 = MySQL
  L7_2 = L7_2.query
  L8_2 = L6_2
  L9_2 = {}
  L10_2 = L2_2.keys
  L9_2["@keys"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.permissions
  L10_2 = L10_2(L11_2)
  L9_2["@permissions"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.metadata
  L10_2 = L10_2(L11_2)
  L9_2["@metadata"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.sale
  L10_2 = L10_2(L11_2)
  L9_2["@sale"] = L10_2
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2.rental
  L10_2 = L10_2(L11_2)
  L9_2["@rental"] = L10_2
  L10_2 = tonumber
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  L9_2["@id"] = L10_2
  L7_2(L8_2, L9_2)
  if L5_2 then
    L7_2 = TriggerClientEvent
    L8_2 = "vms_housing:cl:updateProperty"
    L9_2 = -1
    L10_2 = "forceRemovedRenter"
    L11_2 = A0_2
    L12_2 = {}
    L12_2.completelyRemoved = L5_2
    L13_2 = L2_2.keys
    L12_2.keys = L13_2
    L13_2 = L2_2.permissions
    L12_2.permissions = L13_2
    L13_2 = L2_2.metadata
    L12_2.metadata = L13_2
    L13_2 = L2_2.sale
    L12_2.sale = L13_2
    L13_2 = L2_2.rental
    L12_2.rental = L13_2
    L13_2 = L1_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  else
    L7_2 = TriggerClientEvent
    L8_2 = "vms_housing:cl:updateProperty"
    L9_2 = -1
    L10_2 = "forceRemovedRenter"
    L11_2 = A0_2
    L12_2 = {}
    L12_2.completelyRemoved = L5_2
    L13_2 = L2_2.keys
    L12_2.keys = L13_2
    L13_2 = L2_2.permissions
    L12_2.permissions = L13_2
    L13_2 = L1_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
end
L5_1(L6_1, L7_1)
