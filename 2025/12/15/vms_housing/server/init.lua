local L0_1, L1_1
L0_1 = Config
L0_1 = L0_1.CoreExport
L0_1 = L0_1()
Core = L0_1
L0_1 = {}
Properties = L0_1
L0_1 = {}
Furniture = L0_1
L0_1 = {}
PendingDeliveries = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if "insert" == A0_2 then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if "table" ~= L2_2 then
      goto lbl_105
    end
    L2_2 = ipairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = Furniture
      L8_2 = L8_2[L7_2]
      if not L8_2 then
        return
      end
      L9_2 = MySQL
      L9_2 = L9_2.Async
      L9_2 = L9_2.execute
      L10_2 = [[
                    INSERT INTO `houses_furniture_list` (
                        `model`,
                        `label`,
                        `price`,
                        `deliverySize`,
                        `tag`,
                        `isOutdoor`,
                        `isIndoor`,
                        `interactableName`,
                        `metadata`)
                    VALUES (@model, @label, @price, @deliverySize, @tag, @isOutdoor, @isIndoor, @interactableName, @metadata)
                ]]
      L11_2 = {}
      L11_2["@model"] = L7_2
      L12_2 = L8_2.label
      L11_2["@label"] = L12_2
      L12_2 = L8_2.price
      L11_2["@price"] = L12_2
      L12_2 = L8_2.deliverySize
      L11_2["@deliverySize"] = L12_2
      L12_2 = L8_2.tag
      L11_2["@tag"] = L12_2
      L12_2 = L8_2.isOutdoor
      L11_2["@isOutdoor"] = L12_2
      L12_2 = L8_2.isIndoor
      L11_2["@isIndoor"] = L12_2
      L12_2 = L8_2.interactableName
      L11_2["@interactableName"] = L12_2
      L12_2 = L8_2.metadata
      if L12_2 then
        L12_2 = json
        L12_2 = L12_2.encode
        L13_2 = L8_2.metadata
        L12_2 = L12_2(L13_2)
        if L12_2 then
          goto lbl_48
        end
      end
      L12_2 = nil
      ::lbl_48::
      L11_2["@metadata"] = L12_2
      L9_2(L10_2, L11_2)
    end
  elseif "update" == A0_2 then
    L2_2 = Furniture
    L2_2 = L2_2[A1_2]
    if not L2_2 then
      return
    end
    L3_2 = MySQL
    L3_2 = L3_2.Async
    L3_2 = L3_2.execute
    L4_2 = [[
            UPDATE `houses_furniture_list` SET
                `label` = @label,
                `price` = @price,
                `deliverySize` = @deliverySize,
                `tag` = @tag,
                `isOutdoor` = @isOutdoor,
                `isIndoor` = @isIndoor,
                `interactableName` = @interactableName,
                `metadata` = @metadata
            WHERE `model` = @model
        ]]
    L5_2 = {}
    L5_2["@model"] = A1_2
    L6_2 = L2_2.label
    L5_2["@label"] = L6_2
    L6_2 = L2_2.price
    L5_2["@price"] = L6_2
    L6_2 = L2_2.deliverySize
    L5_2["@deliverySize"] = L6_2
    L6_2 = L2_2.tag
    L5_2["@tag"] = L6_2
    L6_2 = L2_2.isOutdoor
    L5_2["@isOutdoor"] = L6_2
    L6_2 = L2_2.isIndoor
    L5_2["@isIndoor"] = L6_2
    L6_2 = L2_2.interactableName
    L5_2["@interactableName"] = L6_2
    L6_2 = L2_2.metadata
    if L6_2 then
      L6_2 = json
      L6_2 = L6_2.encode
      L7_2 = L2_2.metadata
      L6_2 = L6_2(L7_2)
      if L6_2 then
        goto lbl_92
      end
    end
    L6_2 = nil
    ::lbl_92::
    L5_2["@metadata"] = L6_2
    L3_2(L4_2, L5_2)
  elseif "delete" == A0_2 then
    L2_2 = MySQL
    L2_2 = L2_2.Async
    L2_2 = L2_2.execute
    L3_2 = [[
            DELETE FROM `houses_furniture_list` WHERE `model` = @model
        ]]
    L4_2 = {}
    L4_2["@model"] = A1_2
    L2_2(L3_2, L4_2)
  end
  ::lbl_105::
end
SaveFurniture = L0_1
L0_1 = MySQL
L0_1 = L0_1.ready
function L1_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.AutoExecuteQuery
  if L0_2 then
    L0_2 = MySQL
    L0_2 = L0_2.Async
    L0_2 = L0_2.execute
    L1_2 = [[
            CREATE TABLE IF NOT EXISTS `houses` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `type` varchar(50) DEFAULT NULL,
                `object_id` int(11) DEFAULT NULL,
                `owner` varchar(120) DEFAULT NULL,
                `owner_name` varchar(80) DEFAULT NULL,
                `renter` varchar(120) DEFAULT NULL,
                `renter_name` varchar(80) DEFAULT NULL,
                `name` longtext DEFAULT '',
                `description` longtext DEFAULT NULL,
                `region` varchar(70) DEFAULT NULL,
                `address` varchar(50) DEFAULT NULL,
                `keys` longtext NOT NULL DEFAULT '[]',
                `permissions` longtext DEFAULT '[]',
                `metadata` longtext NOT NULL DEFAULT '[]',
                `sale` longtext DEFAULT '[]',
                `rental` longtext DEFAULT '[]',
                `last_enter` int(11) DEFAULT NULL,
                `creator` varchar(120) DEFAULT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        ]]
    L0_2(L1_2)
    L0_2 = MySQL
    L0_2 = L0_2.Async
    L0_2 = L0_2.execute
    L1_2 = [[
            CREATE TABLE IF NOT EXISTS `houses_bills` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `house_id` int(11) NOT NULL,
                `period` varchar(50) NOT NULL DEFAULT '',
                `type` varchar(50) DEFAULT NULL,
                `total` float DEFAULT 0,
                `paid` tinyint(1) DEFAULT 0,
                `details` longtext NOT NULL,
                PRIMARY KEY (`id`),
                UNIQUE KEY `unique_period_per_house_type` (`house_id`,`period`,`type`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        ]]
    L0_2(L1_2)
    L0_2 = MySQL
    L0_2 = L0_2.Async
    L0_2 = L0_2.execute
    L1_2 = [[
            CREATE TABLE IF NOT EXISTS `houses_furniture` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `house_id` int(11) NOT NULL,
                `position` longtext DEFAULT NULL,
                `model` varchar(70) DEFAULT NULL,
                `stored` int(11) DEFAULT 0,
                `metadata` longtext DEFAULT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        ]]
    L0_2(L1_2)
    L0_2 = MySQL
    L0_2 = L0_2.Async
    L0_2 = L0_2.execute
    L1_2 = [[
            CREATE TABLE IF NOT EXISTS `houses_furniture_list` (
                `model` varchar(80) NOT NULL,
                `label` varchar(80) DEFAULT NULL,
                `price` int(11) DEFAULT 0,
                `deliverySize` int(11) DEFAULT 1,
                `tag` varchar(50) DEFAULT NULL,
                `isOutdoor` int(11) DEFAULT 1,
                `isIndoor` int(11) DEFAULT 1,
                `interactableName` varchar(50) DEFAULT NULL,
                `metadata` longtext DEFAULT NULL,
                PRIMARY KEY (`model`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        ]]
    L0_2(L1_2)
  end
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3
    L0_3 = GetGameTimer
    L0_3 = L0_3()
    L1_3 = os
    L1_3 = L1_3.time
    L1_3 = L1_3()
    L2_3 = os
    L2_3 = L2_3.date
    L3_3 = "%m:%Y"
    L4_3 = L1_3
    L2_3 = L2_3(L3_3, L4_3)
    L3_3 = GetWeekPeriod
    L3_3 = L3_3()
    L4_3 = Config
    L4_3 = L4_3.OptimizeBillsTable
    if L4_3 then
      L4_3 = MySQL
      L4_3 = L4_3.prepare
      L5_3 = "DELETE FROM houses_bills WHERE `paid` = 1 AND `period` != '%s'"
      L6_3 = L5_3
      L5_3 = L5_3.format
      L7_3 = L2_3
      L5_3 = L5_3(L6_3, L7_3)
      L6_3 = {}
      L4_3(L5_3, L6_3)
    end
    L4_3 = MySQL
    L4_3 = L4_3.query
    L4_3 = L4_3.await
    L5_3 = "SELECT * FROM `houses_furniture_list`"
    L6_3 = {}
    L4_3 = L4_3(L5_3, L6_3)
    L5_3 = MySQL
    L5_3 = L5_3.query
    L5_3 = L5_3.await
    L6_3 = "SELECT * FROM `houses`"
    L7_3 = {}
    L5_3 = L5_3(L6_3, L7_3)
    L6_3 = MySQL
    L6_3 = L6_3.query
    L6_3 = L6_3.await
    L7_3 = "SELECT * FROM `houses_bills` ORDER BY id DESC"
    L8_3 = {}
    L6_3 = L6_3(L7_3, L8_3)
    L7_3 = MySQL
    L7_3 = L7_3.query
    L7_3 = L7_3.await
    L8_3 = "SELECT * FROM `houses_furniture`"
    L9_3 = {}
    L7_3 = L7_3(L8_3, L9_3)
    if L4_3 then
      L8_3 = 1
      L9_3 = #L4_3
      L10_3 = 1
      for L11_3 = L8_3, L9_3, L10_3 do
        L12_3 = L4_3[L11_3]
        L13_3 = L12_3.metadata
        if L13_3 then
          L13_3 = json
          L13_3 = L13_3.decode
          L14_3 = L12_3.metadata
          L13_3 = L13_3(L14_3)
          L12_3.metadata = L13_3
        end
        L13_3 = Furniture
        L14_3 = L12_3.model
        L13_3[L14_3] = L12_3
      end
    end
    L8_3 = 1
    L9_3 = #L5_3
    L10_3 = 1
    for L11_3 = L8_3, L9_3, L10_3 do
      L12_3 = L5_3[L11_3]
      L13_3 = tostring
      L14_3 = L12_3.id
      L13_3 = L13_3(L14_3)
      L14_3 = json
      L14_3 = L14_3.decode
      L15_3 = L12_3.metadata
      L14_3 = L14_3(L15_3)
      L12_3.metadata = L14_3
      L14_3 = json
      L14_3 = L14_3.decode
      L15_3 = L12_3.sale
      L14_3 = L14_3(L15_3)
      L12_3.sale = L14_3
      L14_3 = json
      L14_3 = L14_3.decode
      L15_3 = L12_3.rental
      L14_3 = L14_3(L15_3)
      L12_3.rental = L14_3
      L14_3 = L12_3.type
      if "building" ~= L14_3 then
        L14_3 = L12_3.type
        if "motel" ~= L14_3 then
          L14_3 = json
          L14_3 = L14_3.decode
          L15_3 = L12_3.permissions
          L14_3 = L14_3(L15_3)
          L12_3.permissions = L14_3
          L14_3 = {}
          L12_3.bills = L14_3
          L12_3.unpaidBills = 0
          L12_3.unpaidRentBills = 0
          L14_3 = {}
          L12_3.furniture = L14_3
          L14_3 = Config
          L14_3 = L14_3.SaveDoorsState
          if not L14_3 then
            L14_3 = L12_3.type
            if "mlo" == L14_3 then
              L14_3 = L12_3.metadata
              L14_3 = L14_3.doors
              if L14_3 then
                L14_3 = pairs
                L15_3 = L12_3.metadata
                L15_3 = L15_3.doors
                L14_3, L15_3, L16_3, L17_3 = L14_3(L15_3)
                for L18_3, L19_3 in L14_3, L15_3, L16_3, L17_3 do
                  L20_3 = Config
                  L20_3 = L20_3.DefaultDoorsLocked
                  L19_3.locked = L20_3
                end
              end
            else
              L14_3 = L12_3.metadata
              L15_3 = Config
              L15_3 = L15_3.DefaultDoorsLocked
              L14_3.locked = L15_3
            end
          end
          L14_3 = Config
          L14_3 = L14_3.CityHallTaxes
          if L14_3 then
            L14_3 = L14_3.PropertyCadastralTax
          end
          if L14_3 then
            L14_3 = L14_3.Enabled
          end
          if L14_3 then
            L14_3 = L12_3.owner
            if L14_3 then
              L14_3 = L12_3.metadata
              L14_3 = L14_3.lastCadastralPeriod
              if L14_3 then
                L14_3 = L12_3.metadata
                L14_3 = L14_3.lastCadastralPeriod
                if not L14_3 then
                  goto lbl_195
                end
                L14_3 = L12_3.metadata
                L14_3 = L14_3.lastCadastralPeriod
                if L14_3 == L2_3 then
                  goto lbl_195
                end
              end
              L14_3 = SV
              L14_3 = L14_3.AddTax
              L15_3 = L12_3.owner
              L16_3 = L12_3.owner_name
              L17_3 = L12_3.name
              L18_3 = L12_3.address
              L19_3 = "property_cadastral_tax"
              L20_3 = L12_3.sale
              L20_3 = L20_3.defaultPrice
              L14_3 = L14_3(L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
              if L14_3 then
                L15_3 = L12_3.metadata
                L15_3.lastCadastralPeriod = L2_3
                L15_3 = MySQL
                L15_3 = L15_3.prepare
                L16_3 = "UPDATE `houses` SET metadata = ? WHERE id = ?"
                L17_3 = {}
                L18_3 = json
                L18_3 = L18_3.encode
                L19_3 = L12_3.metadata
                L18_3 = L18_3(L19_3)
                L19_3 = tonumber
                L20_3 = L12_3.id
                L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3 = L19_3(L20_3)
                L17_3[1] = L18_3
                L17_3[2] = L19_3
                L17_3[3] = L20_3
                L17_3[4] = L21_3
                L17_3[5] = L22_3
                L17_3[6] = L23_3
                L17_3[7] = L24_3
                L17_3[8] = L25_3
                L15_3(L16_3, L17_3)
              end
            end
          end
          ::lbl_195::
          L14_3 = L12_3.metadata
          if L14_3 then
            L14_3 = L12_3.metadata
            L14_3 = L14_3.storage
            if L14_3 then
              L14_3 = L12_3.metadata
              L14_3 = L14_3.storage
              L14_3 = L14_3.x
              if L14_3 then
                L14_3 = library
                L14_3 = L14_3.RegisterStorage
                L15_3 = {}
                L16_3 = "house_storage-"
                L17_3 = L12_3.id
                L16_3 = L16_3 .. L17_3
                L15_3.id = L16_3
                L16_3 = L12_3.metadata
                L16_3 = L16_3.storage
                L16_3 = L16_3.slots
                L15_3.slots = L16_3
                L16_3 = L12_3.metadata
                L16_3 = L16_3.storage
                L16_3 = L16_3.weight
                L15_3.weight = L16_3
                L14_3(L15_3)
              end
            end
          end
        end
      end
      L14_3 = Properties
      L14_3[L13_3] = L12_3
      L14_3 = L11_3 % 100
      if 0 == L14_3 then
        L14_3 = Citizen
        L14_3 = L14_3.Wait
        L15_3 = 10
        L14_3(L15_3)
      end
    end
    if L7_3 then
      L8_3 = 1
      L9_3 = #L7_3
      L10_3 = 1
      for L11_3 = L8_3, L9_3, L10_3 do
        L12_3 = L7_3[L11_3]
        L13_3 = json
        L13_3 = L13_3.decode
        L14_3 = L12_3.position
        L13_3 = L13_3(L14_3)
        L12_3.position = L13_3
        L13_3 = json
        L13_3 = L13_3.decode
        L14_3 = L12_3.metadata
        L13_3 = L13_3(L14_3)
        L12_3.metadata = L13_3
        L13_3 = Properties
        L14_3 = tostring
        L15_3 = L12_3.house_id
        L14_3 = L14_3(L15_3)
        L13_3 = L13_3[L14_3]
        if L13_3 then
          L14_3 = L12_3.metadata
          if L14_3 then
            L14_3 = L12_3.metadata
            L14_3 = L14_3.deliveryTime
            if L14_3 then
              L14_3 = table
              L14_3 = L14_3.insert
              L15_3 = PendingDeliveries
              L16_3 = {}
              L17_3 = tostring
              L18_3 = L12_3.house_id
              L17_3 = L17_3(L18_3)
              L16_3.propertyId = L17_3
              L17_3 = L12_3.id
              L16_3.furnitureId = L17_3
              L17_3 = L12_3.metadata
              L17_3 = L17_3.deliveryTime
              L16_3.deliveryTime = L17_3
              L14_3(L15_3, L16_3)
            end
            L14_3 = L12_3.position
            if L14_3 then
              L14_3 = L12_3.metadata
              if L14_3 then
                L14_3 = next
                L15_3 = L12_3.metadata
                L14_3 = L14_3(L15_3)
                if L14_3 then
                  L14_3 = L12_3.metadata
                  L14_3 = L14_3.weight
                  if nil ~= L14_3 then
                    L14_3 = library
                    L14_3 = L14_3.RegisterStorage
                    L15_3 = L12_3.metadata
                    L14_3(L15_3)
                  end
                end
              end
            end
          end
          L14_3 = table
          L14_3 = L14_3.insert
          L15_3 = L13_3.furniture
          L16_3 = L12_3
          L14_3(L15_3, L16_3)
        end
      end
    end
    if L6_3 then
      L8_3 = 1
      L9_3 = #L6_3
      L10_3 = 1
      for L11_3 = L8_3, L9_3, L10_3 do
        L12_3 = L6_3[L11_3]
        L13_3 = Properties
        L14_3 = tostring
        L15_3 = L12_3.house_id
        L14_3 = L14_3(L15_3)
        L13_3 = L13_3[L14_3]
        if L13_3 then
          L14_3 = L13_3.type
          if "building" ~= L14_3 then
            L14_3 = L13_3.type
            if "motel" ~= L14_3 then
              L14_3 = L12_3.paid
              if not L14_3 then
                L14_3 = L12_3.type
                if "rent" == L14_3 then
                  L14_3 = L13_3.unpaidRentBills
                  L14_3 = L14_3 + 1
                  L13_3.unpaidRentBills = L14_3
                else
                  L14_3 = Config
                  L14_3 = L14_3.UseServiceBills
                  if L14_3 then
                    L14_3 = L12_3.period
                    if L2_3 ~= L14_3 then
                      L14_3 = L13_3.unpaidBills
                      L14_3 = L14_3 + 1
                      L13_3.unpaidBills = L14_3
                    end
                  end
                end
              end
              L14_3 = table
              L14_3 = L14_3.insert
              L15_3 = L13_3.bills
              L16_3 = L12_3
              L14_3(L15_3, L16_3)
            end
          end
        end
      end
      L8_3 = pairs
      L9_3 = Properties
      L8_3, L9_3, L10_3, L11_3 = L8_3(L9_3)
      for L12_3, L13_3 in L8_3, L9_3, L10_3, L11_3 do
        L14_3 = L13_3.type
        if "building" ~= L14_3 then
          L14_3 = L13_3.type
          if "motel" ~= L14_3 then
            L14_3 = false
            L15_3 = false
            L16_3 = L13_3.rental
            if L16_3 then
              L16_3 = L13_3.rental
              L16_3 = L16_3.cycle
              if "weekly" == L16_3 and L3_3 then
                goto lbl_376
                L16_3 = L3_3 or L16_3
              end
            end
            L16_3 = L2_3
            ::lbl_376::
            L17_3 = ipairs
            L18_3 = L13_3.bills
            if not L18_3 then
              L18_3 = {}
            end
            L17_3, L18_3, L19_3, L20_3 = L17_3(L18_3)
            for L21_3, L22_3 in L17_3, L18_3, L19_3, L20_3 do
              L23_3 = L22_3.period
              if L23_3 == L2_3 then
                L23_3 = L22_3.type
                if "services" == L23_3 then
                  L14_3 = true
              end
              else
                L23_3 = L22_3.period
                if L23_3 == L16_3 then
                  L23_3 = L22_3.type
                  if "rent" == L23_3 then
                    L23_3 = L13_3.renter
                    if L23_3 then
                      L15_3 = true
                    end
                  end
                end
              end
              if L14_3 then
                L23_3 = L13_3.renter
                if not L23_3 or L15_3 then
                  break
                end
              end
            end
            L17_3 = Config
            L17_3 = L17_3.UseServiceBills
            if L17_3 and not L14_3 then
              L17_3 = library
              L17_3 = L17_3.GenerateMonthlyBill
              L18_3 = L12_3
              L19_3 = L2_3
              L17_3 = L17_3(L18_3, L19_3)
              if L17_3 then
                L18_3 = table
                L18_3 = L18_3.insert
                L19_3 = L13_3.bills
                L20_3 = 1
                L21_3 = L17_3
                L18_3(L19_3, L20_3, L21_3)
              end
            end
            L17_3 = Config
            L17_3 = L17_3.UseServiceBills
            if L17_3 then
              L17_3 = L13_3.unpaidBills
              if L17_3 then
                L17_3 = L13_3.unpaidBills
                L18_3 = Config
                L18_3 = L18_3.AllowedUnpaidBills
                if L17_3 >= L18_3 then
                  L17_3 = L13_3.metadata
                  L17_3 = L17_3.lightState
                  if L17_3 then
                    L17_3 = library
                    L17_3 = L17_3.HandleLightStateMonthOverlap
                    L18_3 = L12_3
                    L17_3(L18_3)
                    L17_3 = L13_3.metadata
                    L17_3.lightState = false
                    L17_3 = L13_3.metadata
                    L17_3.lightStartTime = nil
                    L17_3 = MySQL
                    L17_3 = L17_3.prepare
                    L18_3 = "UPDATE `houses` SET metadata = ? WHERE id = ?"
                    L19_3 = {}
                    L20_3 = json
                    L20_3 = L20_3.encode
                    L21_3 = L13_3.metadata
                    L20_3 = L20_3(L21_3)
                    L21_3 = tonumber
                    L22_3 = L12_3
                    L21_3, L22_3, L23_3, L24_3, L25_3 = L21_3(L22_3)
                    L19_3[1] = L20_3
                    L19_3[2] = L21_3
                    L19_3[3] = L22_3
                    L19_3[4] = L23_3
                    L19_3[5] = L24_3
                    L19_3[6] = L25_3
                    L17_3(L18_3, L19_3)
                  end
                end
              end
            end
            L17_3 = L13_3.renter
            if L17_3 then
              if not L15_3 then
                L17_3 = library
                L17_3 = L17_3.GenerateRentBill
                L18_3 = L12_3
                L19_3 = L16_3
                L17_3 = L17_3(L18_3, L19_3)
                if L17_3 then
                  L18_3 = table
                  L18_3 = L18_3.insert
                  L19_3 = L13_3.bills
                  L20_3 = 1
                  L21_3 = L17_3
                  L18_3(L19_3, L20_3, L21_3)
                  L18_3 = L13_3.unpaidRentBills
                  if not L18_3 then
                    L18_3 = 0
                  end
                  L18_3 = L18_3 + 1
                  L13_3.unpaidRentBills = L18_3
                end
              end
              L17_3 = L13_3.unpaidRentBills
              if not L17_3 then
                L17_3 = 0
              end
              L18_3 = Config
              L18_3 = L18_3.AllowedUnpaidRentBills
              if not (L17_3 >= L18_3) then
                L17_3 = L13_3.rental
                L17_3 = L17_3.terminateAtPeriod
                if L17_3 ~= L2_3 then
                  goto lbl_662
                end
              end
              L17_3 = ""
              L18_3 = L13_3.owner
              if L18_3 then
                L17_3 = [[
                                    UPDATE `houses`
                                        SET
                                            `renter` = NULL,
                                            `renter_name` = NULL,
                                            `permissions` = @permissions,
                                            `keys` = @keys,
                                            `metadata` = @metadata,
                                            `rental` = @rental
                                    WHERE id = @id
                                ]]
                L18_3 = Config
                L18_3 = L18_3.RemoveKeysOnRentEnd
                if L18_3 then
                  L18_3 = json
                  L18_3 = L18_3.encode
                  L19_3 = {}
                  L18_3 = L18_3(L19_3)
                  L13_3.keys = L18_3
                end
                L13_3.unpaidRentBills = nil
                L18_3 = MySQL
                L18_3 = L18_3.prepare
                L19_3 = "DELETE FROM houses_bills WHERE `house_id` = ? AND `type` = ? AND `paid` = 0"
                L20_3 = {}
                L21_3 = tonumber
                L22_3 = L12_3
                L21_3 = L21_3(L22_3)
                L22_3 = "rent"
                L20_3[1] = L21_3
                L20_3[2] = L22_3
                L18_3(L19_3, L20_3)
                L18_3 = L13_3.bills
                L18_3 = #L18_3
                L19_3 = 1
                L20_3 = -1
                for L21_3 = L18_3, L19_3, L20_3 do
                  L22_3 = L13_3.bills
                  L22_3 = L22_3[L21_3]
                  L23_3 = L22_3.type
                  if "rent" == L23_3 then
                    L23_3 = L22_3.paid
                    if 0 ~= L23_3 then
                      L23_3 = L22_3.paid
                      if false ~= L23_3 then
                        goto lbl_554
                      end
                    end
                    L23_3 = table
                    L23_3 = L23_3.remove
                    L24_3 = L13_3.bills
                    L25_3 = L21_3
                    L23_3(L24_3, L25_3)
                  end
                  ::lbl_554::
                end
                L18_3 = L13_3.metadata
                L18_3.locked = true
                L18_3 = L13_3.metadata
                L18_3.lightState = false
                L18_3 = L13_3.metadata
                L18_3.lightStartTime = nil
                L18_3 = L13_3.permissions
                L19_3 = L13_3.renter
                L18_3[L19_3] = nil
              else
                L17_3 = [[
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
                L18_3 = json
                L18_3 = L18_3.encode
                L19_3 = {}
                L18_3 = L18_3(L19_3)
                L13_3.keys = L18_3
                L18_3 = L13_3.sale
                L19_3 = L13_3.sale
                L19_3 = L19_3.defaultActive
                L18_3.active = L19_3
                L18_3 = L13_3.rental
                L19_3 = L13_3.rental
                L19_3 = L19_3.defaultActive
                L18_3.active = L19_3
                L18_3 = L13_3.metadata
                L18_3.locked = true
                L18_3 = L13_3.metadata
                L18_3.contact_number = nil
                L18_3 = L13_3.metadata
                L18_3.lightState = false
                L18_3 = L13_3.metadata
                L18_3.lightStartTime = nil
                L18_3 = Config
                L18_3 = L18_3.RemoveFurnitureOnRentEnd
                if L18_3 then
                  L18_3 = {}
                  L13_3.furniture = L18_3
                  L18_3 = MySQL
                  L18_3 = L18_3.prepare
                  L19_3 = "DELETE FROM houses_furniture WHERE house_id = ?"
                  L20_3 = {}
                  L21_3 = tonumber
                  L22_3 = L12_3
                  L21_3, L22_3, L23_3, L24_3, L25_3 = L21_3(L22_3)
                  L20_3[1] = L21_3
                  L20_3[2] = L22_3
                  L20_3[3] = L23_3
                  L20_3[4] = L24_3
                  L20_3[5] = L25_3
                  L18_3(L19_3, L20_3)
                end
                L18_3 = {}
                L13_3.bills = L18_3
                L13_3.unpaidBills = 0
                L13_3.unpaidRentBills = nil
                L18_3 = MySQL
                L18_3 = L18_3.prepare
                L19_3 = "DELETE FROM houses_bills WHERE house_id = ?"
                L20_3 = {}
                L21_3 = tonumber
                L22_3 = L12_3
                L21_3, L22_3, L23_3, L24_3, L25_3 = L21_3(L22_3)
                L20_3[1] = L21_3
                L20_3[2] = L22_3
                L20_3[3] = L23_3
                L20_3[4] = L24_3
                L20_3[5] = L25_3
                L18_3(L19_3, L20_3)
                L18_3 = {}
                L13_3.permissions = L18_3
              end
              L13_3.renter = nil
              L13_3.renter_name = nil
              L18_3 = L13_3.rental
              L18_3.startTime = nil
              L18_3 = L13_3.rental
              L18_3.terminateAtPeriod = nil
              L18_3 = MySQL
              L18_3 = L18_3.Async
              L18_3 = L18_3.execute
              L19_3 = L17_3
              L20_3 = {}
              L21_3 = L13_3.keys
              L20_3["@keys"] = L21_3
              L21_3 = json
              L21_3 = L21_3.encode
              L22_3 = L13_3.permissions
              L21_3 = L21_3(L22_3)
              L20_3["@permissions"] = L21_3
              L21_3 = json
              L21_3 = L21_3.encode
              L22_3 = L13_3.metadata
              L21_3 = L21_3(L22_3)
              L20_3["@metadata"] = L21_3
              L21_3 = json
              L21_3 = L21_3.encode
              L22_3 = L13_3.sale
              L21_3 = L21_3(L22_3)
              L20_3["@sale"] = L21_3
              L21_3 = json
              L21_3 = L21_3.encode
              L22_3 = L13_3.rental
              L21_3 = L21_3(L22_3)
              L20_3["@rental"] = L21_3
              L21_3 = tonumber
              L22_3 = L12_3
              L21_3 = L21_3(L22_3)
              L20_3["@id"] = L21_3
              L18_3(L19_3, L20_3)
            end
          end
        end
        ::lbl_662::
      end
    end
    L8_3 = library
    L8_3 = L8_3.Debug
    L9_3 = "^2VMS Housing init completed in %d ms^7"
    L10_3 = L9_3
    L9_3 = L9_3.format
    L11_3 = GetGameTimer
    L11_3 = L11_3()
    L11_3 = L11_3 - L0_3
    L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3 = L9_3(L10_3, L11_3)
    L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3)
    L8_3 = library
    L8_3 = L8_3.Debug
    L9_3 = "Loaded %d Properies, %d Bills, %d Furniture"
    L10_3 = L9_3
    L9_3 = L9_3.format
    L11_3 = #L5_3
    L12_3 = #L6_3
    L13_3 = #L7_3
    L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3 = L9_3(L10_3, L11_3, L12_3, L13_3)
    L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3)
  end
  L0_2(L1_2)
end
L0_1(L1_1)
L0_1 = CreateThread
function L1_1()
  local L0_2, L1_2
  while true do
    L0_2 = Config
    L0_2 = L0_2.DeliveryType
    if 2 ~= L0_2 then
      L0_2 = Config
      L0_2 = L0_2.DeliveryType
      if 3 ~= L0_2 then
        break
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 8000
    L0_2(L1_2)
    L0_2 = next
    L1_2 = PendingDeliveries
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = ProcessPendingDeliveries
      L1_2 = 200
      L0_2(L1_2)
    end
    L0_2 = Wait
    L1_2 = 30000
    L0_2(L1_2)
  end
end
L0_1(L1_1)
