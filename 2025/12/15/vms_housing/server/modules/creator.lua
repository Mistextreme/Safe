local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:sv:createNewHouse"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2
  L3_2 = source
  L4_2 = SV
  L4_2 = L4_2.GetPlayer
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = SV
  L5_2 = L5_2.GetIdentifier
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = library
  L6_2 = L6_2.HasCreatorPermissions
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L6_2 = nil
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L1_3 = A0_3.object_id
    if L1_3 then
      L1_3 = A1_2.parkingSpaces
      if L1_3 then
        L1_3 = Properties
        L2_3 = tostring
        L3_3 = A0_3.object_id
        L2_3 = L2_3(L3_3)
        L1_3 = L1_3[L2_3]
        L2_3 = L1_3.metadata
        L2_3 = L2_3.parkingSpaces
        if L2_3 then
          L2_3 = pairs
          L3_3 = L1_3.metadata
          L3_3 = L3_3.parkingSpaces
          L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
          for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
            L8_3 = L1_3.metadata
            L8_3 = L8_3.parkingSpaces
            L9_3 = tostring
            L10_3 = L6_3
            L9_3 = L9_3(L10_3)
            L8_3 = L8_3[L9_3]
            if L8_3 then
              L8_3 = pairs
              L9_3 = L7_3
              L8_3, L9_3, L10_3, L11_3 = L8_3(L9_3)
              for L12_3, L13_3 in L8_3, L9_3, L10_3, L11_3 do
                L14_3 = tonumber
                L15_3 = L13_3
                L14_3 = L14_3(L15_3)
                L15_3 = tonumber
                L16_3 = A2_2
                L15_3 = L15_3(L16_3)
                if L14_3 == L15_3 then
                  L14_3 = L1_3.metadata
                  L14_3 = L14_3.parkingSpaces
                  L15_3 = tostring
                  L16_3 = L6_3
                  L15_3 = L15_3(L16_3)
                  L14_3 = L14_3[L15_3]
                  L15_3 = tostring
                  L16_3 = L12_3
                  L15_3 = L15_3(L16_3)
                  L14_3[L15_3] = nil
                end
              end
            end
          end
          L2_3 = pairs
          L3_3 = A1_2.parkingSpaces
          L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
          for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
            L8_3 = L1_3.metadata
            L8_3 = L8_3.parkingSpaces
            L9_3 = tostring
            L10_3 = L6_3
            L9_3 = L9_3(L10_3)
            L8_3 = L8_3[L9_3]
            if L8_3 then
              L8_3 = ipairs
              L9_3 = L7_3
              L8_3, L9_3, L10_3, L11_3 = L8_3(L9_3)
              for L12_3, L13_3 in L8_3, L9_3, L10_3, L11_3 do
                L14_3 = L1_3.metadata
                L14_3 = L14_3.parkingSpaces
                L15_3 = tostring
                L16_3 = L6_3
                L15_3 = L15_3(L16_3)
                L14_3 = L14_3[L15_3]
                L15_3 = tostring
                L16_3 = L13_3
                L15_3 = L15_3(L16_3)
                L16_3 = tonumber
                L17_3 = L6_2
                L16_3 = L16_3(L17_3)
                L14_3[L15_3] = L16_3
              end
            end
          end
          L2_3 = pairs
          L3_3 = L1_3.metadata
          L3_3 = L3_3.parkingSpaces
          L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
          for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
            L8_3 = exports
            L8_3 = L8_3.vms_garagesv2
            L9_3 = L8_3
            L8_3 = L8_3.registerBuildingParking
            L10_3 = A1_2.building
            L11_3 = L6_3
            L12_3 = L1_3.name
            L13_3 = {}
            L14_3 = L1_3.metadata
            L14_3 = L14_3.exit
            L13_3.enterOnFoot = L14_3
            L14_3 = L1_3.metadata
            L14_3 = L14_3.parkingEnter
            L13_3.enterWithVehicle = L14_3
            L14_3 = L7_3
            L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
            L8_3 = Citizen
            L8_3 = L8_3.Wait
            L9_3 = 100
            L8_3(L9_3)
          end
          L2_3 = MySQL
          L2_3 = L2_3.update
          L3_3 = "UPDATE houses SET metadata = ? WHERE id = ?"
          L4_3 = {}
          L5_3 = json
          L5_3 = L5_3.encode
          L6_3 = L1_3.metadata
          L5_3 = L5_3(L6_3)
          L6_3 = tonumber
          L7_3 = A0_3.object_id
          L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L6_3(L7_3)
          L4_3[1] = L5_3
          L4_3[2] = L6_3
          L4_3[3] = L7_3
          L4_3[4] = L8_3
          L4_3[5] = L9_3
          L4_3[6] = L10_3
          L4_3[7] = L11_3
          L4_3[8] = L12_3
          L4_3[9] = L13_3
          L4_3[10] = L14_3
          L4_3[11] = L15_3
          L4_3[12] = L16_3
          L4_3[13] = L17_3
          L2_3(L3_3, L4_3)
          L2_3 = TriggerClientEvent
          L3_3 = "vms_housing:cl:createdHouse"
          L4_3 = -1
          L5_3 = tostring
          L6_3 = A1_2.building
          L5_3 = L5_3(L6_3)
          L6_3 = L1_3
          L2_3(L3_3, L4_3, L5_3, L6_3)
        end
      end
    end
  end
  if not A2_2 then
    L8_2 = json
    L8_2 = L8_2.decode
    L9_2 = A1_2.metadata
    L8_2 = L8_2(L9_2)
    L9_2 = json
    L9_2 = L9_2.decode
    L10_2 = A1_2.sale
    L9_2 = L9_2(L10_2)
    L10_2 = json
    L10_2 = L10_2.decode
    L11_2 = A1_2.rental
    L10_2 = L10_2(L11_2)
    L11_2 = L9_2.defaultPrice
    L9_2.price = L11_2
    L11_2 = L9_2.defaultActive
    L9_2.active = L11_2
    L11_2 = json
    L11_2 = L11_2.encode
    L12_2 = L9_2
    L11_2 = L11_2(L12_2)
    L9_2 = L11_2
    L11_2 = L10_2.defaultPrice
    L10_2.price = L11_2
    L11_2 = L10_2.defaultActive
    L10_2.active = L11_2
    L11_2 = json
    L11_2 = L11_2.encode
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    L10_2 = L11_2
    L11_2 = Config
    L11_2 = L11_2.Garages
    if "vms_garagesv2" == L11_2 and "building" == A0_2 then
      L11_2 = A1_2.apartmentParking
      if L11_2 then
        L11_2 = {}
        L8_2.parkingSpaces = L11_2
        L11_2 = 1
        L12_2 = A1_2.parkingFloors
        L13_2 = 1
        for L14_2 = L11_2, L12_2, L13_2 do
          L15_2 = L8_2.parkingSpaces
          L16_2 = tostring
          L17_2 = L14_2
          L16_2 = L16_2(L17_2)
          L17_2 = {}
          L15_2[L16_2] = L17_2
        end
      end
    end
    L11_2 = MySQL
    L11_2 = L11_2.insert
    L11_2 = L11_2.await
    L12_2 = "INSERT INTO `houses` (`type`, `object_id`, `name`, `region`, `address`, `metadata`, `sale`, `rental`, `description`, `creator`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    L13_2 = {}
    L14_2 = A0_2
    L15_2 = A1_2.building
    if not L15_2 then
      L15_2 = A1_2.motel
    end
    L16_2 = A1_2.name
    L17_2 = A1_2.region
    L18_2 = A1_2.address
    L19_2 = json
    L19_2 = L19_2.encode
    L20_2 = L8_2
    L19_2 = L19_2(L20_2)
    L20_2 = L9_2
    L21_2 = L10_2
    L22_2 = A1_2.description
    L23_2 = L5_2
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L13_2[3] = L16_2
    L13_2[4] = L17_2
    L13_2[5] = L18_2
    L13_2[6] = L19_2
    L13_2[7] = L20_2
    L13_2[8] = L21_2
    L13_2[9] = L22_2
    L13_2[10] = L23_2
    L11_2 = L11_2(L12_2, L13_2)
    L6_2 = L11_2
    if L8_2 then
      L11_2 = L8_2.storage
      if L11_2 then
        L11_2 = L8_2.storage
        L11_2 = L11_2.x
        if L11_2 then
          L11_2 = library
          L11_2 = L11_2.RegisterStorage
          L12_2 = {}
          L13_2 = "house_storage-"
          L14_2 = L6_2
          L13_2 = L13_2 .. L14_2
          L12_2.id = L13_2
          L13_2 = tonumber
          L14_2 = L8_2.storage
          L14_2 = L14_2.slots
          L13_2 = L13_2(L14_2)
          L12_2.slots = L13_2
          L13_2 = tonumber
          L14_2 = L8_2.storage
          L14_2 = L14_2.weight
          L13_2 = L13_2(L14_2)
          L12_2.weight = L13_2
          L11_2(L12_2)
        end
      end
    end
    L11_2 = Properties
    L12_2 = tostring
    L13_2 = L6_2
    L12_2 = L12_2(L13_2)
    L13_2 = {}
    L13_2.id = L6_2
    L14_2 = A1_2.building
    if L14_2 then
      L14_2 = tonumber
      L15_2 = A1_2.building
      L14_2 = L14_2(L15_2)
      if L14_2 then
        goto lbl_149
      end
    end
    L14_2 = A1_2.motel
    if L14_2 then
      L14_2 = tonumber
      L15_2 = A1_2.motel
      L14_2 = L14_2(L15_2)
    end
    ::lbl_149::
    L13_2.object_id = L14_2
    L13_2.type = A0_2
    L14_2 = A1_2.name
    L13_2.name = L14_2
    L14_2 = A1_2.region
    L13_2.region = L14_2
    L14_2 = A1_2.address
    L13_2.address = L14_2
    L14_2 = {}
    L13_2.furniture = L14_2
    L14_2 = {}
    L13_2.bills = L14_2
    L13_2.unpaidBills = 0
    L14_2 = json
    L14_2 = L14_2.encode
    L15_2 = {}
    L14_2 = L14_2(L15_2)
    L13_2.keys = L14_2
    L14_2 = {}
    L13_2.permissions = L14_2
    L13_2.metadata = L8_2
    L14_2 = json
    L14_2 = L14_2.decode
    L15_2 = L9_2
    L14_2 = L14_2(L15_2)
    L13_2.sale = L14_2
    L14_2 = json
    L14_2 = L14_2.decode
    L15_2 = L10_2
    L14_2 = L14_2(L15_2)
    L13_2.rental = L14_2
    L14_2 = A1_2.description
    L13_2.description = L14_2
    L13_2.last_enter = 0
    L13_2.creator = L5_2
    L11_2[L12_2] = L13_2
    L11_2 = SV
    L11_2 = L11_2.Webhook
    L12_2 = "CreatedProperty"
    L13_2 = WebhookText
    L13_2 = L13_2["TITLE.CreatedProperty"]
    L14_2 = WebhookText
    L14_2 = L14_2["DESCRIPTION.CreatedProperty"]
    L15_2 = L14_2
    L14_2 = L14_2.format
    L16_2 = GetPlayerName
    L17_2 = L3_2
    L16_2 = L16_2(L17_2)
    L17_2 = L3_2
    L18_2 = A0_2
    L19_2 = L6_2
    L20_2 = A1_2.name
    L21_2 = A1_2.description
    L22_2 = A1_2.region
    L23_2 = A1_2.address
    L24_2 = A1_2.building
    if L24_2 then
      L24_2 = "Building"
      if L24_2 then
        goto lbl_220
      end
    end
    L24_2 = A1_2.motel
    if L24_2 then
      L24_2 = "Motel"
      if L24_2 then
        goto lbl_220
      end
    end
    L24_2 = ""
    ::lbl_220::
    L25_2 = A1_2.building
    if not L25_2 then
      L25_2 = A1_2.motel
      if not L25_2 then
        L25_2 = "-"
      end
    end
    L26_2 = Properties
    L27_2 = tostring
    L28_2 = L6_2
    L27_2 = L27_2(L28_2)
    L26_2 = L26_2[L27_2]
    L26_2 = L26_2.sale
    L26_2 = L26_2.active
    if L26_2 then
      L26_2 = "\226\156\133 $"
      L27_2 = Properties
      L28_2 = tostring
      L29_2 = L6_2
      L28_2 = L28_2(L29_2)
      L27_2 = L27_2[L28_2]
      L27_2 = L27_2.sale
      L27_2 = L27_2.price
      L26_2 = L26_2 .. L27_2
      if L26_2 then
        goto lbl_248
      end
    end
    L26_2 = "\226\157\140 No"
    ::lbl_248::
    L27_2 = Properties
    L28_2 = tostring
    L29_2 = L6_2
    L28_2 = L28_2(L29_2)
    L27_2 = L27_2[L28_2]
    L27_2 = L27_2.rental
    L27_2 = L27_2.active
    if L27_2 then
      L27_2 = "\226\156\133 $"
      L28_2 = Properties
      L29_2 = tostring
      L30_2 = L6_2
      L29_2 = L29_2(L30_2)
      L28_2 = L28_2[L29_2]
      L28_2 = L28_2.rental
      L28_2 = L28_2.price
      L27_2 = L27_2 .. L28_2
      if L27_2 then
        goto lbl_269
      end
    end
    L27_2 = "\226\157\140 No"
    ::lbl_269::
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
    L15_2 = 0
    L16_2 = L5_2
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    L11_2 = L8_2.garage
    if L11_2 then
      L11_2 = RegisterGarage
      if L11_2 then
        L11_2 = RegisterGarage
        L12_2 = tostring
        L13_2 = L6_2
        L12_2 = L12_2(L13_2)
        L13_2 = Properties
        L14_2 = tostring
        L15_2 = L6_2
        L14_2 = L14_2(L15_2)
        L13_2 = L13_2[L14_2]
        L14_2 = true
        L11_2(L12_2, L13_2, L14_2)
      end
    end
    L11_2 = Config
    L11_2 = L11_2.Garages
    if "vms_garagesv2" == L11_2 then
      L11_2 = L8_2.parking
      if L11_2 then
        L11_2 = exports
        L11_2 = L11_2.vms_garagesv2
        L12_2 = L11_2
        L11_2 = L11_2.registerPropertyParking
        L13_2 = tostring
        L14_2 = L6_2
        L13_2 = L13_2(L14_2)
        L14_2 = "Property "
        L15_2 = A1_2.name
        L14_2 = L14_2 .. L15_2
        L15_2 = L8_2.zone
        L16_2 = L8_2.parking
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
      end
      if "building" == A0_2 then
        L11_2 = A1_2.apartmentParking
        if L11_2 then
          L11_2 = 1
          L12_2 = A1_2.parkingFloors
          L13_2 = 1
          for L14_2 = L11_2, L12_2, L13_2 do
            L15_2 = exports
            L15_2 = L15_2.vms_garagesv2
            L16_2 = L15_2
            L15_2 = L15_2.registerBuildingParking
            L17_2 = L6_2
            L18_2 = L14_2
            L19_2 = A1_2.name
            L20_2 = {}
            L21_2 = L8_2.exit
            L20_2.enterOnFoot = L21_2
            L21_2 = L8_2.parkingEnter
            L20_2.enterWithVehicle = L21_2
            L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
          end
        end
      end
      L11_2 = A1_2.building
      if L11_2 then
        L11_2 = A1_2.parkingSpaces
        if L11_2 then
          L11_2 = Properties
          L12_2 = tostring
          L13_2 = A1_2.building
          L12_2 = L12_2(L13_2)
          L11_2 = L11_2[L12_2]
          L12_2 = L11_2.metadata
          L12_2 = L12_2.parkingSpaces
          if L12_2 then
            L12_2 = pairs
            L13_2 = A1_2.parkingSpaces
            L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
            for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
              L18_2 = L11_2.metadata
              L18_2 = L18_2.parkingSpaces
              L19_2 = tostring
              L20_2 = L16_2
              L19_2 = L19_2(L20_2)
              L18_2 = L18_2[L19_2]
              if L18_2 then
                L18_2 = ipairs
                L19_2 = L17_2
                L18_2, L19_2, L20_2, L21_2 = L18_2(L19_2)
                for L22_2, L23_2 in L18_2, L19_2, L20_2, L21_2 do
                  L24_2 = L11_2.metadata
                  L24_2 = L24_2.parkingSpaces
                  L25_2 = tostring
                  L26_2 = L16_2
                  L25_2 = L25_2(L26_2)
                  L24_2 = L24_2[L25_2]
                  L25_2 = tostring
                  L26_2 = L23_2
                  L25_2 = L25_2(L26_2)
                  L26_2 = tonumber
                  L27_2 = L6_2
                  L26_2 = L26_2(L27_2)
                  L24_2[L25_2] = L26_2
                end
              end
            end
            L12_2 = pairs
            L13_2 = L11_2.metadata
            L13_2 = L13_2.parkingSpaces
            L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
            for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
              L18_2 = exports
              L18_2 = L18_2.vms_garagesv2
              L19_2 = L18_2
              L18_2 = L18_2.registerBuildingParking
              L20_2 = A1_2.building
              L21_2 = L16_2
              L22_2 = L11_2.name
              L23_2 = {}
              L24_2 = L11_2.metadata
              L24_2 = L24_2.exit
              L23_2.enterOnFoot = L24_2
              L24_2 = L11_2.metadata
              L24_2 = L24_2.parkingEnter
              L23_2.enterWithVehicle = L24_2
              L24_2 = L17_2
              L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
              L18_2 = Citizen
              L18_2 = L18_2.Wait
              L19_2 = 100
              L18_2(L19_2)
            end
            L12_2 = MySQL
            L12_2 = L12_2.update
            L13_2 = "UPDATE houses SET metadata = ? WHERE id = ?"
            L14_2 = {}
            L15_2 = json
            L15_2 = L15_2.encode
            L16_2 = L11_2.metadata
            L15_2 = L15_2(L16_2)
            L16_2 = tonumber
            L17_2 = A1_2.building
            L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2 = L16_2(L17_2)
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
            L14_2[16] = L30_2
            L12_2(L13_2, L14_2)
            L12_2 = TriggerClientEvent
            L13_2 = "vms_housing:cl:createdHouse"
            L14_2 = -1
            L15_2 = tostring
            L16_2 = A1_2.building
            L15_2 = L15_2(L16_2)
            L16_2 = L11_2
            L12_2(L13_2, L14_2, L15_2, L16_2)
          end
        end
      end
    end
  else
    L6_2 = A2_2
    L8_2 = GetProperty
    L9_2 = tostring
    L10_2 = L6_2
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2 = L9_2(L10_2)
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
    if not L8_2 then
      return
    end
    L9_2 = json
    L9_2 = L9_2.decode
    L10_2 = A1_2.metadata
    L9_2 = L9_2(L10_2)
    A1_2.metadata = L9_2
    L9_2 = json
    L9_2 = L9_2.decode
    L10_2 = A1_2.sale
    L9_2 = L9_2(L10_2)
    A1_2.sale = L9_2
    L9_2 = json
    L9_2 = L9_2.decode
    L10_2 = A1_2.rental
    L9_2 = L9_2(L10_2)
    A1_2.rental = L9_2
    L9_2 = L8_2.type
    if "shell" == L9_2 then
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.shell
      L9_2.shell = L10_2
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.allowFurnitureOutside
      L9_2.allowFurnitureOutside = L10_2
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.allowFurnitureInside
      L9_2.allowFurnitureInside = L10_2
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.enter
      L9_2.enter = L10_2
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.exit
      L9_2.exit = L10_2
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.garage
      L9_2.garage = L10_2
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.parking
      L9_2.parking = L10_2
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.wardrobe
      L9_2.wardrobe = L10_2
      L9_2 = L8_2.metadata
      L9_2 = L9_2.storage
      if not L9_2 then
        L9_2 = A1_2.metadata
        L9_2 = L9_2.storage
        if L9_2 then
          L9_2 = library
          L9_2 = L9_2.RegisterStorage
          L10_2 = {}
          L11_2 = "house_storage-"
          L12_2 = L6_2
          L11_2 = L11_2 .. L12_2
          L10_2.id = L11_2
          L11_2 = tonumber
          L12_2 = A1_2.metadata
          L12_2 = L12_2.storage
          L12_2 = L12_2.slots
          L11_2 = L11_2(L12_2)
          L10_2.slots = L11_2
          L11_2 = tonumber
          L12_2 = A1_2.metadata
          L12_2 = L12_2.storage
          L12_2 = L12_2.weight
          L11_2 = L11_2(L12_2)
          L10_2.weight = L11_2
          L9_2(L10_2)
        end
      end
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.storage
      L9_2.storage = L10_2
      L9_2 = L7_2
      L10_2 = L8_2
      L9_2(L10_2)
    else
      L9_2 = L8_2.type
      if "ipl" == L9_2 then
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.ipl
        L9_2.ipl = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.iplTheme
        L9_2.iplTheme = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.allowFurnitureOutside
        L9_2.allowFurnitureOutside = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.allowFurnitureInside
        L9_2.allowFurnitureInside = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.allowChangeTheme
        L9_2.allowChangeTheme = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.allowChangeThemePurchased
        L9_2.allowChangeThemePurchased = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.enter
        L9_2.enter = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.exit
        L9_2.exit = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.garage
        L9_2.garage = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.parking
        L9_2.parking = L10_2
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.wardrobe
        L9_2.wardrobe = L10_2
        L9_2 = L8_2.metadata
        L9_2 = L9_2.storage
        if not L9_2 then
          L9_2 = A1_2.metadata
          L9_2 = L9_2.storage
          if L9_2 then
            L9_2 = library
            L9_2 = L9_2.RegisterStorage
            L10_2 = {}
            L11_2 = "house_storage-"
            L12_2 = L6_2
            L11_2 = L11_2 .. L12_2
            L10_2.id = L11_2
            L11_2 = tonumber
            L12_2 = A1_2.metadata
            L12_2 = L12_2.storage
            L12_2 = L12_2.slots
            L11_2 = L11_2(L12_2)
            L10_2.slots = L11_2
            L11_2 = tonumber
            L12_2 = A1_2.metadata
            L12_2 = L12_2.storage
            L12_2 = L12_2.weight
            L11_2 = L11_2(L12_2)
            L10_2.weight = L11_2
            L9_2(L10_2)
          end
        end
        L9_2 = L8_2.metadata
        L10_2 = A1_2.metadata
        L10_2 = L10_2.storage
        L9_2.storage = L10_2
        L9_2 = L7_2
        L10_2 = L8_2
        L9_2(L10_2)
      else
        L9_2 = L8_2.type
        if "mlo" == L9_2 then
          L9_2 = L8_2.metadata
          L10_2 = A1_2.metadata
          L10_2 = L10_2.allowFurnitureOutside
          L9_2.allowFurnitureOutside = L10_2
          L9_2 = L8_2.metadata
          L10_2 = A1_2.metadata
          L10_2 = L10_2.allowFurnitureInside
          L9_2.allowFurnitureInside = L10_2
          L9_2 = L8_2.metadata
          L10_2 = A1_2.metadata
          L10_2 = L10_2.interiorZone
          L9_2.interiorZone = L10_2
          L9_2 = L8_2.metadata
          L10_2 = A1_2.metadata
          L10_2 = L10_2.menu
          L9_2.menu = L10_2
          L9_2 = L8_2.metadata
          L10_2 = A1_2.metadata
          L10_2 = L10_2.garage
          L9_2.garage = L10_2
          L9_2 = L8_2.metadata
          L10_2 = A1_2.metadata
          L10_2 = L10_2.parking
          L9_2.parking = L10_2
          L9_2 = L8_2.metadata
          L10_2 = A1_2.metadata
          L10_2 = L10_2.doors
          L9_2.doors = L10_2
          L9_2 = L8_2.metadata
          L10_2 = A1_2.metadata
          L10_2 = L10_2.wardrobe
          L9_2.wardrobe = L10_2
          L9_2 = L8_2.metadata
          L9_2 = L9_2.storage
          if not L9_2 then
            L9_2 = A1_2.metadata
            L9_2 = L9_2.storage
            if L9_2 then
              L9_2 = library
              L9_2 = L9_2.RegisterStorage
              L10_2 = {}
              L11_2 = "house_storage-"
              L12_2 = L6_2
              L11_2 = L11_2 .. L12_2
              L10_2.id = L11_2
              L11_2 = tonumber
              L12_2 = A1_2.metadata
              L12_2 = L12_2.storage
              L12_2 = L12_2.slots
              L11_2 = L11_2(L12_2)
              L10_2.slots = L11_2
              L11_2 = tonumber
              L12_2 = A1_2.metadata
              L12_2 = L12_2.storage
              L12_2 = L12_2.weight
              L11_2 = L11_2(L12_2)
              L10_2.weight = L11_2
              L9_2(L10_2)
            end
          end
          L9_2 = L8_2.metadata
          L10_2 = A1_2.metadata
          L10_2 = L10_2.storage
          L9_2.storage = L10_2
        else
          L9_2 = L8_2.type
          if "building" == L9_2 then
            L9_2 = L8_2.metadata
            L10_2 = A1_2.metadata
            L10_2 = L10_2.enter
            L9_2.enter = L10_2
            L9_2 = L8_2.metadata
            L10_2 = A1_2.metadata
            L10_2 = L10_2.exit
            L9_2.exit = L10_2
            L9_2 = {}
            L10_2 = A1_2.apartmentParking
            if L10_2 then
              L10_2 = L8_2.metadata
              L11_2 = A1_2.metadata
              L11_2 = L11_2.parkingEnter
              L10_2.parkingEnter = L11_2
              L10_2 = 1
              L11_2 = A1_2.parkingFloors
              L12_2 = 1
              for L13_2 = L10_2, L11_2, L12_2 do
                L14_2 = L8_2.metadata
                L14_2 = L14_2.parkingSpaces
                if L14_2 then
                  L14_2 = tostring
                  L15_2 = L13_2
                  L14_2 = L14_2(L15_2)
                  L15_2 = L8_2.metadata
                  L15_2 = L15_2.parkingSpaces
                  L16_2 = tostring
                  L17_2 = L13_2
                  L16_2 = L16_2(L17_2)
                  L15_2 = L15_2[L16_2]
                  if not L15_2 then
                    L15_2 = {}
                  end
                  L9_2[L14_2] = L15_2
                else
                  L14_2 = tostring
                  L15_2 = L13_2
                  L14_2 = L14_2(L15_2)
                  L15_2 = {}
                  L9_2[L14_2] = L15_2
                end
                L14_2 = exports
                L14_2 = L14_2.vms_garagesv2
                L15_2 = L14_2
                L14_2 = L14_2.registerBuildingParking
                L16_2 = L6_2
                L17_2 = L13_2
                L18_2 = A1_2.name
                L19_2 = {}
                L20_2 = L8_2.metadata
                L20_2 = L20_2.exit
                L19_2.enterOnFoot = L20_2
                L20_2 = L8_2.metadata
                L20_2 = L20_2.parkingEnter
                L19_2.enterWithVehicle = L20_2
                L20_2 = L9_2
                L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
                L14_2 = Citizen
                L14_2 = L14_2.Wait
                L15_2 = 100
                L14_2(L15_2)
              end
              L10_2 = L8_2.metadata
              L10_2.parkingSpaces = L9_2
            else
              L10_2 = L8_2.metadata
              L10_2 = L10_2.parkingSpaces
              if L10_2 then
                L10_2 = pairs
                L11_2 = L8_2.metadata
                L11_2 = L11_2.parkingSpaces
                L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
                for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
                end
              end
              L10_2 = L8_2.metadata
              L10_2.parkingEnter = nil
              L10_2 = L8_2.metadata
              L10_2.parkingSpaces = nil
            end
          end
        end
      end
    end
    L9_2 = L8_2.metadata
    L10_2 = A1_2.metadata
    L10_2 = L10_2.zone
    L9_2.zone = L10_2
    L9_2 = A1_2.metadata
    L9_2 = L9_2.keysLimit
    if L9_2 then
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.keysLimit
      L9_2.keysLimit = L10_2
    else
      L9_2 = L8_2.metadata
      L9_2.keysLimit = nil
    end
    L9_2 = A1_2.metadata
    L9_2 = L9_2.permissionsLimit
    if L9_2 then
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.permissionsLimit
      L9_2.permissionsLimit = L10_2
    else
      L9_2 = L8_2.metadata
      L9_2.permissionsLimit = nil
    end
    L9_2 = A1_2.metadata
    L9_2 = L9_2.deliveryType
    if L9_2 then
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.deliveryType
      L9_2.deliveryType = L10_2
      L9_2 = L8_2.metadata
      L10_2 = A1_2.metadata
      L10_2 = L10_2.delivery
      L9_2.delivery = L10_2
    else
      L9_2 = L8_2.metadata
      L9_2.deliveryType = nil
      L9_2 = L8_2.metadata
      L9_2.delivery = nil
    end
    L9_2 = L8_2.metadata
    A1_2.metadata = L9_2
    L9_2 = A1_2.sale
    if L9_2 then
      L9_2 = L8_2.sale
      if L9_2 then
        L9_2 = A1_2.sale
        L9_2 = L9_2.defaultPrice
        if L9_2 then
          L9_2 = A1_2.sale
          L9_2 = L9_2.defaultPrice
          if L9_2 > 0 then
            L9_2 = L8_2.sale
            L10_2 = A1_2.sale
            L10_2 = L10_2.defaultPrice
            L9_2.defaultPrice = L10_2
            L9_2 = L8_2.owner
            if not L9_2 then
              L9_2 = L8_2.sale
              L10_2 = L8_2.sale
              L10_2 = L10_2.defaultPrice
              L9_2.price = L10_2
            end
        end
        else
          L9_2 = L8_2.sale
          L10_2 = L8_2.sale
          L10_2 = L10_2.defaultPrice
          if not L10_2 then
            L10_2 = 0
          end
          L9_2.price = L10_2
        end
        L9_2 = L8_2.owner
        if not L9_2 then
          L9_2 = L8_2.renter
          if not L9_2 then
            L9_2 = L8_2.sale
            L10_2 = A1_2.sale
            L10_2 = L10_2.defaultActive
            L9_2.defaultActive = L10_2
            L9_2 = L8_2.sale
            L10_2 = A1_2.sale
            L10_2 = L10_2.defaultActive
            L9_2.active = L10_2
          end
        end
        L9_2 = L8_2.sale
        A1_2.sale = L9_2
      end
    end
    L9_2 = A1_2.rental
    if L9_2 then
      L9_2 = L8_2.rental
      if L9_2 then
        L9_2 = A1_2.rental
        L9_2 = L9_2.defaultPrice
        if L9_2 then
          L9_2 = A1_2.rental
          L9_2 = L9_2.defaultPrice
          if L9_2 > 0 then
            L9_2 = L8_2.rental
            L10_2 = A1_2.rental
            L10_2 = L10_2.defaultPrice
            L9_2.defaultPrice = L10_2
            L9_2 = L8_2.owner
            if not L9_2 then
              L9_2 = L8_2.rental
              L10_2 = L8_2.rental
              L10_2 = L10_2.defaultPrice
              L9_2.price = L10_2
            end
        end
        else
          L9_2 = L8_2.rental
          L10_2 = L8_2.rental
          L10_2 = L10_2.defaultPrice
          if not L10_2 then
            L10_2 = 0
          end
          L9_2.price = L10_2
        end
        L9_2 = L8_2.owner
        if not L9_2 then
          L9_2 = L8_2.renter
          if not L9_2 then
            L9_2 = L8_2.rental
            L10_2 = A1_2.rental
            L10_2 = L10_2.defaultActive
            L9_2.defaultActive = L10_2
            L9_2 = L8_2.rental
            L10_2 = A1_2.rental
            L10_2 = L10_2.defaultActive
            L9_2.active = L10_2
          end
        end
        L9_2 = L8_2.rental
        A1_2.rental = L9_2
      end
    end
    L9_2 = MySQL
    L9_2 = L9_2.update
    L10_2 = "UPDATE houses SET name = ?, region = ?, address = ?, metadata = ?, sale = ?, rental = ?, description = ? WHERE id = ?"
    L11_2 = {}
    L12_2 = A1_2.name
    L13_2 = A1_2.region
    L14_2 = A1_2.address
    L15_2 = json
    L15_2 = L15_2.encode
    L16_2 = A1_2.metadata
    L15_2 = L15_2(L16_2)
    L16_2 = json
    L16_2 = L16_2.encode
    L17_2 = A1_2.sale
    L16_2 = L16_2(L17_2)
    L17_2 = json
    L17_2 = L17_2.encode
    L18_2 = A1_2.rental
    L17_2 = L17_2(L18_2)
    L18_2 = A1_2.description
    L19_2 = A2_2
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L11_2[3] = L14_2
    L11_2[4] = L15_2
    L11_2[5] = L16_2
    L11_2[6] = L17_2
    L11_2[7] = L18_2
    L11_2[8] = L19_2
    L9_2(L10_2, L11_2)
    L9_2 = A1_2.name
    L8_2.name = L9_2
    L9_2 = A1_2.description
    L8_2.description = L9_2
    L9_2 = A1_2.region
    L8_2.region = L9_2
    L9_2 = A1_2.address
    L8_2.address = L9_2
    L9_2 = A1_2.metadata
    L8_2.metadata = L9_2
    L9_2 = A1_2.sale
    L8_2.sale = L9_2
    L9_2 = A1_2.rental
    L8_2.rental = L9_2
    L9_2 = A1_2.metadata
    L9_2 = L9_2.garage
    if L9_2 then
      L9_2 = RegisterGarage
      if L9_2 then
        L9_2 = RegisterGarage
        L10_2 = tostring
        L11_2 = L6_2
        L10_2 = L10_2(L11_2)
        L11_2 = L8_2
        L12_2 = false
        L9_2(L10_2, L11_2, L12_2)
      end
    end
    L9_2 = A1_2.metadata
    L9_2 = L9_2.parking
    if L9_2 then
      L9_2 = exports
      L9_2 = L9_2.vms_garagesv2
      L10_2 = L9_2
      L9_2 = L9_2.registerPropertyParking
      L11_2 = tostring
      L12_2 = L6_2
      L11_2 = L11_2(L12_2)
      L12_2 = "Property "
      L13_2 = A1_2.name
      L12_2 = L12_2 .. L13_2
      L13_2 = A1_2.metadata
      L13_2 = L13_2.zone
      L14_2 = A1_2.metadata
      L14_2 = L14_2.parking
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    end
    L9_2 = SV
    L9_2 = L9_2.Webhook
    L10_2 = "EditedProperty"
    L11_2 = WebhookText
    L11_2 = L11_2["TITLE.EditedProperty"]
    L12_2 = WebhookText
    L12_2 = L12_2["DESCRIPTION.EditedProperty"]
    L13_2 = L12_2
    L12_2 = L12_2.format
    L14_2 = GetPlayerName
    L15_2 = L3_2
    L14_2 = L14_2(L15_2)
    L15_2 = L3_2
    L16_2 = L8_2.type
    L17_2 = A2_2
    L18_2 = A1_2.name
    L19_2 = A1_2.description
    L20_2 = A1_2.region
    L21_2 = A1_2.address
    L22_2 = A1_2.building
    if L22_2 then
      L22_2 = "Building"
      if L22_2 then
        goto lbl_1015
      end
    end
    L22_2 = A1_2.motel
    if L22_2 then
      L22_2 = "Motel"
      if L22_2 then
        goto lbl_1015
      end
    end
    L22_2 = ""
    ::lbl_1015::
    L23_2 = A1_2.building
    if not L23_2 then
      L23_2 = A1_2.motel
      if not L23_2 then
        L23_2 = "-"
      end
    end
    L24_2 = L8_2.sale
    L24_2 = L24_2.active
    if L24_2 then
      L24_2 = "\226\156\133 $"
      L25_2 = L8_2.sale
      L25_2 = L25_2.price
      L24_2 = L24_2 .. L25_2
      if L24_2 then
        goto lbl_1033
      end
    end
    L24_2 = "\226\157\140 No"
    ::lbl_1033::
    L25_2 = L8_2.rental
    L25_2 = L25_2.active
    if L25_2 then
      L25_2 = "\226\156\133 $"
      L26_2 = L8_2.rental
      L26_2 = L26_2.price
      L25_2 = L25_2 .. L26_2
      if L25_2 then
        goto lbl_1044
      end
    end
    L25_2 = "\226\157\140 No"
    ::lbl_1044::
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L13_2 = 0
    L14_2 = L5_2
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L8_2 = TriggerClientEvent
  L9_2 = "vms_housing:cl:createdHouse"
  L10_2 = -1
  L11_2 = tostring
  L12_2 = L6_2
  L11_2 = L11_2(L12_2)
  L12_2 = Properties
  L13_2 = tostring
  L14_2 = L6_2
  L13_2 = L13_2(L14_2)
  L12_2 = L12_2[L13_2]
  L8_2(L9_2, L10_2, L11_2, L12_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:sv:deleteHouse"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = library
  L4_2 = L4_2.HasCreatorPermissions
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = GetProperty
  L5_2 = tostring
  L6_2 = A0_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
    L1_3 = A0_3.object_id
    if L1_3 then
      L1_3 = Properties
      L2_3 = tostring
      L3_3 = A0_3.object_id
      L2_3 = L2_3(L3_3)
      L1_3 = L1_3[L2_3]
      L2_3 = L1_3.metadata
      L2_3 = L2_3.parkingSpaces
      if L2_3 then
        L2_3 = pairs
        L3_3 = L1_3.metadata
        L3_3 = L3_3.parkingSpaces
        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
        for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
          L8_3 = L1_3.metadata
          L8_3 = L8_3.parkingSpaces
          L9_3 = tostring
          L10_3 = L6_3
          L9_3 = L9_3(L10_3)
          L8_3 = L8_3[L9_3]
          if L8_3 then
            L8_3 = pairs
            L9_3 = L7_3
            L8_3, L9_3, L10_3, L11_3 = L8_3(L9_3)
            for L12_3, L13_3 in L8_3, L9_3, L10_3, L11_3 do
              L14_3 = tonumber
              L15_3 = L13_3
              L14_3 = L14_3(L15_3)
              L15_3 = tonumber
              L16_3 = A0_2
              L15_3 = L15_3(L16_3)
              if L14_3 == L15_3 then
                L14_3 = L1_3.metadata
                L14_3 = L14_3.parkingSpaces
                L15_3 = tostring
                L16_3 = L6_3
                L15_3 = L15_3(L16_3)
                L14_3 = L14_3[L15_3]
                L15_3 = tostring
                L16_3 = L12_3
                L15_3 = L15_3(L16_3)
                L14_3[L15_3] = nil
              end
            end
          end
        end
        L2_3 = pairs
        L3_3 = L1_3.metadata
        L3_3 = L3_3.parkingSpaces
        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
        for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
          L8_3 = exports
          L8_3 = L8_3.vms_garagesv2
          L9_3 = L8_3
          L8_3 = L8_3.registerBuildingParking
          L10_3 = A0_3.object_id
          L11_3 = L6_3
          L12_3 = L1_3.name
          L13_3 = {}
          L14_3 = L1_3.metadata
          L14_3 = L14_3.exit
          L13_3.enterOnFoot = L14_3
          L14_3 = L1_3.metadata
          L14_3 = L14_3.parkingEnter
          L13_3.enterWithVehicle = L14_3
          L14_3 = L7_3
          L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
          L8_3 = Citizen
          L8_3 = L8_3.Wait
          L9_3 = 100
          L8_3(L9_3)
        end
        L2_3 = MySQL
        L2_3 = L2_3.update
        L3_3 = "UPDATE houses SET metadata = ? WHERE id = ?"
        L4_3 = {}
        L5_3 = json
        L5_3 = L5_3.encode
        L6_3 = L1_3.metadata
        L5_3 = L5_3(L6_3)
        L6_3 = tonumber
        L7_3 = A0_3.object_id
        L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L6_3(L7_3)
        L4_3[1] = L5_3
        L4_3[2] = L6_3
        L4_3[3] = L7_3
        L4_3[4] = L8_3
        L4_3[5] = L9_3
        L4_3[6] = L10_3
        L4_3[7] = L11_3
        L4_3[8] = L12_3
        L4_3[9] = L13_3
        L4_3[10] = L14_3
        L4_3[11] = L15_3
        L4_3[12] = L16_3
        L2_3(L3_3, L4_3)
        L2_3 = TriggerClientEvent
        L3_3 = "vms_housing:cl:createdHouse"
        L4_3 = -1
        L5_3 = tostring
        L6_3 = A0_3.object_id
        L5_3 = L5_3(L6_3)
        L6_3 = L1_3
        L2_3(L3_3, L4_3, L5_3, L6_3)
      end
    end
  end
  L6_2 = MySQL
  L6_2 = L6_2.query
  L7_2 = "DELETE FROM `houses` WHERE id = ?"
  L8_2 = {}
  L9_2 = A0_2
  L8_2[1] = L9_2
  function L9_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L1_3 = L5_2
    L2_3 = L4_2
    L1_3(L2_3)
    L1_3 = Properties
    L2_3 = tostring
    L3_3 = A0_2
    L2_3 = L2_3(L3_3)
    L1_3[L2_3] = nil
    L1_3 = SV
    L1_3 = L1_3.Webhook
    L2_3 = "EditedProperty"
    L3_3 = WebhookText
    L3_3 = L3_3["TITLE.DeletedProperty"]
    L4_3 = WebhookText
    L4_3 = L4_3["DESCRIPTION.DeletedProperty"]
    L5_3 = L4_3
    L4_3 = L4_3.format
    L6_3 = GetPlayerName
    L7_3 = L1_2
    L6_3 = L6_3(L7_3)
    L7_3 = L1_2
    L8_3 = A0_2
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
    L5_3 = 0
    L6_3 = L3_2
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
    L1_3 = TriggerClientEvent
    L2_3 = "vms_housing:cl:removedHouse"
    L3_3 = -1
    L4_3 = tostring
    L5_3 = A0_2
    L4_3, L5_3, L6_3, L7_3, L8_3 = L4_3(L5_3)
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
  end
  L6_2(L7_2, L8_2, L9_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:sv:addFurniture"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = library
  L4_2 = L4_2.HasCreatorPermissions
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = {}
  L5_2 = ""
  L6_2 = pairs
  L7_2 = A0_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = Furniture
    L12_2 = L12_2[L10_2]
    if not L12_2 then
      L12_2 = table
      L12_2 = L12_2.insert
      L13_2 = L4_2
      L14_2 = L10_2
      L12_2(L13_2, L14_2)
      L12_2 = Furniture
      L13_2 = {}
      L13_2.label = ""
      L13_2.price = 0
      L14_2 = L11_2.deliverySize
      if not L14_2 then
        L14_2 = 1
      end
      L13_2.deliverySize = L14_2
      L13_2.tag = ""
      L13_2.isOutdoor = true
      L13_2.isIndoor = true
      L12_2[L10_2] = L13_2
      L12_2 = L5_2
      L13_2 = [[
                %s,
            ]]
      L14_2 = L13_2
      L13_2 = L13_2.format
      L15_2 = L10_2
      L13_2 = L13_2(L14_2, L15_2)
      L12_2 = L12_2 .. L13_2
      L5_2 = L12_2
    end
  end
  L6_2 = SV
  L6_2 = L6_2.Webhook
  L7_2 = "CreatedFurniture"
  L8_2 = WebhookText
  L8_2 = L8_2["TITLE.CreatedFurniture"]
  L9_2 = WebhookText
  L9_2 = L9_2["DESCRIPTION.CreatedFurniture"]
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = GetPlayerName
  L12_2 = L1_2
  L11_2 = L11_2(L12_2)
  L12_2 = L1_2
  L13_2 = L5_2
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L10_2 = 0
  L11_2 = L3_2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L6_2 = SaveFurniture
  L7_2 = "insert"
  L8_2 = L4_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "vms_housing:cl:reloadFurnitureList"
  L8_2 = -1
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = Furniture
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:sv:modifyFurniture"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L2_2 = source
  L3_2 = SV
  L3_2 = L3_2.GetPlayer
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = SV
  L4_2 = L4_2.GetIdentifier
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = library
  L5_2 = L5_2.HasCreatorPermissions
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L5_2 = Furniture
  L5_2 = L5_2[A0_2]
  if L5_2 then
    L5_2 = nil
    L6_2 = A1_2.isSmallDelivery
    if L6_2 then
      L5_2 = 1
    else
      L6_2 = A1_2.isMediumDelivery
      if L6_2 then
        L5_2 = 2
      else
        L6_2 = A1_2.isBigDelivery
        if L6_2 then
          L5_2 = 3
        end
      end
    end
    L6_2 = Furniture
    L7_2 = {}
    L8_2 = A1_2.label
    L7_2.label = L8_2
    L8_2 = A1_2.price
    L7_2.price = L8_2
    L7_2.deliverySize = L5_2
    L8_2 = A1_2.tag
    if not L8_2 then
      L8_2 = ""
    end
    L7_2.tag = L8_2
    L8_2 = A1_2.isFurnitureOutside
    L7_2.isOutdoor = L8_2
    L8_2 = A1_2.isFurnitureInside
    L7_2.isIndoor = L8_2
    L8_2 = A1_2.interactableName
    L7_2.interactableName = L8_2
    L8_2 = A1_2.metadata
    L7_2.metadata = L8_2
    L6_2[A0_2] = L7_2
    L6_2 = SV
    L6_2 = L6_2.Webhook
    L7_2 = "EditedFurniture"
    L8_2 = WebhookText
    L8_2 = L8_2["TITLE.EditedFurniture"]
    L9_2 = WebhookText
    L9_2 = L9_2["DESCRIPTION.EditedFurniture"]
    L10_2 = L9_2
    L9_2 = L9_2.format
    L11_2 = GetPlayerName
    L12_2 = L2_2
    L11_2 = L11_2(L12_2)
    L12_2 = L2_2
    L13_2 = A1_2.label
    L14_2 = A1_2.price
    L15_2 = L5_2
    L16_2 = A1_2.tag
    if not L16_2 then
      L16_2 = ""
    end
    L17_2 = A1_2.isFurnitureOutside
    if L17_2 then
      L17_2 = "\226\156\133"
      if L17_2 then
        goto lbl_84
      end
    end
    L17_2 = "\226\157\140"
    ::lbl_84::
    L18_2 = A1_2.isFurnitureInside
    if L18_2 then
      L18_2 = "\226\156\133"
      if L18_2 then
        goto lbl_91
      end
    end
    L18_2 = "\226\157\140"
    ::lbl_91::
    L19_2 = A1_2.interactableName
    L20_2 = library
    L20_2 = L20_2.Dump
    L21_2 = A1_2.metadata
    L20_2, L21_2 = L20_2(L21_2)
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    L10_2 = 0
    L11_2 = L4_2
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
    L6_2 = SaveFurniture
    L7_2 = "update"
    L8_2 = A0_2
    L6_2(L7_2, L8_2)
    L6_2 = TriggerClientEvent
    L7_2 = "vms_housing:cl:reloadFurniture"
    L8_2 = -1
    L9_2 = A0_2
    L10_2 = Furniture
    L10_2 = L10_2[A0_2]
    L6_2(L7_2, L8_2, L9_2, L10_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:sv:deleteFurniture"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = source
  L2_2 = SV
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = SV
  L3_2 = L3_2.GetIdentifier
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = library
  L4_2 = L4_2.HasCreatorPermissions
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = Furniture
  L4_2 = L4_2[A0_2]
  if L4_2 then
    L4_2 = Furniture
    L4_2[A0_2] = nil
    L4_2 = SV
    L4_2 = L4_2.Webhook
    L5_2 = "DeletedFurniture"
    L6_2 = WebhookText
    L6_2 = L6_2["TITLE.DeletedFurniture"]
    L7_2 = WebhookText
    L7_2 = L7_2["DESCRIPTION.DeletedFurniture"]
    L8_2 = L7_2
    L7_2 = L7_2.format
    L9_2 = GetPlayerName
    L10_2 = L1_2
    L9_2 = L9_2(L10_2)
    L10_2 = L1_2
    L11_2 = A0_2
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    L8_2 = 0
    L9_2 = L3_2
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = SaveFurniture
    L5_2 = "delete"
    L6_2 = A0_2
    L4_2(L5_2, L6_2)
    L4_2 = TriggerClientEvent
    L5_2 = "vms_housing:cl:reloadFurniture"
    L6_2 = -1
    L7_2 = A0_2
    L4_2(L5_2, L6_2, L7_2)
  end
end
L0_1(L1_1, L2_1)
