local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
L1_1 = nil
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  if A0_2 then
    MotelManageId = A0_2
  end
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = CurrentProperty
    if not L2_2 then
      L2_2 = GetCurrentPropertyId
      L2_2 = L2_2()
    end
  end
  if not L2_2 then
    return
  end
  if L2_2 then
    L3_2 = Properties
    L3_2 = L3_2[L2_2]
    if L3_2 then
      goto lbl_25
    end
  end
  L3_2 = CurrentPropertyData
  if not L3_2 then
    L3_2 = GetCurrentPropertyData
    L3_2 = L3_2()
  end
  ::lbl_25::
  L4_2 = library
  L4_2 = L4_2.HasAnyPermission
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = false
  L5_2 = false
  L6_2 = L3_2.type
  if "shell" == L6_2 then
    L6_2 = CurrentShell
    if L6_2 then
      L4_2 = true
    else
      L5_2 = true
    end
  else
    L6_2 = L3_2.type
    if "ipl" == L6_2 then
      L6_2 = CurrentIPL
      if L6_2 then
        L4_2 = true
      else
        L5_2 = true
      end
    else
      L6_2 = L3_2.type
      if "mlo" == L6_2 then
        L6_2 = IsInsideMLO
        L6_2 = L6_2()
        L4_2 = L6_2
        L5_2 = not L4_2
      end
    end
  end
  L6_2 = Config
  L6_2 = L6_2.Regions
  L7_2 = L3_2.region
  L6_2 = L6_2[L7_2]
  if not L6_2 then
    L6_2 = Config
    L6_2 = L6_2.NoRegion
  end
  L7_2 = nil
  L8_2 = L1_1
  if L8_2 then
    L8_2 = GetGameTimer
    L8_2 = L8_2()
    L9_2 = L1_1
    if not (L8_2 > L9_2) then
      L8_2 = L0_1
      if L8_2 == L2_2 then
        goto lbl_109
      end
    end
  end
  L8_2 = promise
  L8_2 = L8_2.new
  L8_2 = L8_2()
  L9_2 = library
  L9_2 = L9_2.Callback
  L10_2 = "vms_housing:openManageMenu"
  function L11_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = GetGameTimer
    L1_3 = L1_3()
    L1_3 = L1_3 + 60000
    L1_1 = L1_3
    L1_3 = L8_2
    L2_3 = L1_3
    L1_3 = L1_3.resolve
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
  end
  L12_2 = L2_2
  L9_2(L10_2, L11_2, L12_2)
  L0_1 = L2_2
  L9_2 = Citizen
  L9_2 = L9_2.Await
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  L7_2 = L9_2
  L9_2 = Properties
  L9_2 = L9_2[L2_2]
  L10_2 = L7_2.bills
  L9_2.bills = L10_2
  L9_2 = Properties
  L9_2 = L9_2[L2_2]
  L10_2 = L7_2.unpaidRentBills
  L9_2.unpaidRentBills = L10_2
  L9_2 = Properties
  L9_2 = L9_2[L2_2]
  L10_2 = L7_2.unpaidBills
  L9_2.unpaidBills = L10_2
  ::lbl_109::
  L8_2 = L3_2.owner
  if L8_2 then
    L8_2 = L3_2.owner
    L9_2 = Identifier
    L8_2 = L8_2 == L9_2
  end
  L9_2 = L3_2.renter
  if L9_2 then
    L9_2 = L3_2.renter
    L10_2 = Identifier
    L9_2 = L9_2 == L10_2
  end
  L10_2 = {}
  L10_2.action = "Property"
  L10_2.actionName = "OpenManage"
  L11_2 = {}
  L12_2 = L3_2.type
  L11_2.type = L12_2
  L12_2 = L3_2.object_id
  L12_2 = nil ~= L12_2
  L11_2.isObject = L12_2
  L11_2.isDevice = A1_2
  L11_2.isOwner = L8_2
  L11_2.isRenter = L9_2
  L12_2 = L3_2.renter
  L11_2.renter = L12_2
  L12_2 = L3_2.renter_name
  L11_2.renterName = L12_2
  L12_2 = L3_2.permissions
  L13_2 = Identifier
  L12_2 = L12_2[L13_2]
  if not L12_2 then
    L12_2 = {}
  end
  L11_2.myPermissions = L12_2
  L12_2 = L3_2.bills
  L11_2.bills = L12_2
  L12_2 = L3_2.unpaidBills
  L11_2.unpaidBills = L12_2
  L12_2 = L3_2.unpaidRentBills
  L11_2.unpaidRentBills = L12_2
  L12_2 = json
  L12_2 = L12_2.decode
  L13_2 = L3_2.keys
  L12_2 = L12_2(L13_2)
  L11_2.keys = L12_2
  L12_2 = Config
  L12_2 = L12_2.Deliveries
  L11_2.deliveries = L12_2
  L12_2 = L3_2.name
  L11_2.name = L12_2
  L12_2 = L3_2.description
  L11_2.description = L12_2
  L12_2 = L3_2.address
  L11_2.address = L12_2
  L12_2 = L3_2.region
  L11_2.region = L12_2
  L12_2 = L6_2 or L12_2
  if L6_2 then
    L12_2 = L6_2.electricity
  end
  L11_2.electricity = L12_2
  L12_2 = L6_2 or L12_2
  if L6_2 then
    L12_2 = L6_2.internet
  end
  L11_2.internet = L12_2
  L12_2 = L6_2 or L12_2
  if L6_2 then
    L12_2 = L6_2.water
  end
  L11_2.water = L12_2
  L11_2.isInside = L4_2
  L12_2 = L3_2.last_enter
  L11_2.lastEnter = L12_2
  L12_2 = L3_2.metadata
  L12_2 = L12_2.garage
  L12_2 = nil ~= L12_2
  L11_2.garage = L12_2
  L12_2 = L3_2.metadata
  L12_2 = L12_2.parking
  if L12_2 then
    L12_2 = L3_2.metadata
    L12_2 = L12_2.parking
    L12_2 = #L12_2
  end
  L11_2.parking = L12_2
  L12_2 = L3_2.sale
  L11_2.sale = L12_2
  L12_2 = L3_2.rental
  L11_2.rental = L12_2
  L12_2 = L3_2.metadata
  L12_2 = L12_2.keysLimit
  L11_2.keysLimit = L12_2
  L12_2 = GetFurnitureLimit
  L13_2 = L3_2.metadata
  L13_2 = L13_2.upgrades
  L12_2 = L12_2(L13_2)
  L11_2.furnitureLimit = L12_2
  L12_2 = Config
  L12_2 = L12_2.AutomaticSell
  L12_2 = L3_2.sale
  L12_2 = L12_2.defaultPrice
  if L12_2 then
    L12_2 = L3_2.sale
    L12_2 = L12_2.defaultPrice
    L13_2 = Config
    L13_2 = L13_2.AutomaticSell
    L13_2 = L13_2 / 100
    L12_2 = L12_2 >= 1 and L12_2
  end
  L11_2.autoSellPrice = L12_2
  L10_2.data = L11_2
  if L8_2 or L9_2 then
    L11_2 = L10_2.data
    L12_2 = L3_2.permissions
    L11_2.permissions = L12_2
  end
  L11_2 = library
  L11_2 = L11_2.HasPermissions
  L12_2 = L2_2
  L13_2 = "furniture"
  L11_2 = L11_2(L12_2, L13_2)
  if L11_2 then
    L11_2 = L10_2.data
    L12_2 = L3_2.furniture
    L11_2.furniture = L12_2
    L11_2 = L10_2.data
    L12_2 = L3_2.metadata
    L12_2 = L12_2.allowFurnitureInside
    L11_2.allowedInside = L12_2
    L11_2 = L10_2.data
    L12_2 = L3_2.metadata
    L12_2 = L12_2.allowFurnitureOutside
    L11_2.allowedOutside = L12_2
    L11_2 = L10_2.data
    L12_2 = L3_2.metadata
    L12_2 = L12_2.wardrobe
    if L12_2 then
      L12_2 = L3_2.metadata
      L12_2 = L12_2.wardrobe
      L12_2 = L12_2.x
      L12_2 = nil ~= L12_2
    end
    L11_2.hasWardrobe = L12_2
    L11_2 = L10_2.data
    L12_2 = L3_2.metadata
    L12_2 = L12_2.storage
    if L12_2 then
      L12_2 = L3_2.metadata
      L12_2 = L12_2.storage
      L12_2 = L12_2.x
      L12_2 = nil ~= L12_2
    end
    L11_2.hasStorage = L12_2
  end
  L11_2 = library
  L11_2 = L11_2.HasPermissions
  L12_2 = L2_2
  L13_2 = "upgradesManage"
  L11_2 = L11_2(L12_2, L13_2)
  if L11_2 then
    L11_2 = L10_2.data
    L12_2 = Config
    L12_2 = L12_2.HousingUpgrades
    L11_2.upgrades = L12_2
    L11_2 = L10_2.data
    L12_2 = {}
    L11_2.ownUpgrades = L12_2
    L11_2 = pairs
    L12_2 = Config
    L12_2 = L12_2.HousingUpgrades
    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
    for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
      L17_2 = L3_2.metadata
      L17_2 = L17_2.upgrades
      if L17_2 then
        L17_2 = L3_2.metadata
        L17_2 = L17_2.upgrades
        L18_2 = L16_2.metadata
        L17_2 = L17_2[L18_2]
        if L17_2 then
          L17_2 = L10_2.data
          L17_2 = L17_2.ownUpgrades
          L18_2 = L16_2.metadata
          L19_2 = L3_2.metadata
          L19_2 = L19_2.upgrades
          L20_2 = L16_2.metadata
          L19_2 = L19_2[L20_2]
          L17_2[L18_2] = L19_2
        end
      end
    end
  end
  L11_2 = library
  L11_2 = L11_2.HasPermissions
  L12_2 = L2_2
  L13_2 = "marketplaceManage"
  L11_2 = L11_2(L12_2, L13_2)
  if L11_2 then
    L11_2 = L10_2.data
    L12_2 = L3_2.metadata
    L12_2 = L12_2.furnished
    L11_2.furnished = L12_2
    L11_2 = L10_2.data
    L12_2 = L3_2.metadata
    L12_2 = L12_2.contact_number
    L11_2.contact_number = L12_2
    L11_2 = L10_2.data
    L12_2 = L3_2.metadata
    L12_2 = L12_2.images
    L11_2.images = L12_2
  end
  L11_2 = SetNuiFocus
  L12_2 = true
  L13_2 = true
  L11_2(L12_2, L13_2)
  L11_2 = SendNUIMessage
  L12_2 = L10_2
  L11_2(L12_2)
  openedMenu = "PropertyManage"
end
openManageMenu = L2_1
L2_1 = exports
L3_1 = "OpenManageMenu"
L4_1 = openManageMenu
L2_1(L3_1, L4_1)
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "Property"
  L1_2.actionName = "CloseManage"
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  openedMenu = nil
  MotelManageId = nil
end
closeManageMenu = L2_1
L2_1 = Config
L2_1 = L2_1.HousingManagement
L2_1 = L2_1.Command
if L2_1 then
  L2_1 = RegisterCommand
  L3_1 = Config
  L3_1 = L3_1.HousingManagement
  L3_1 = L3_1.Command
  function L4_1()
    local L0_2, L1_2
    L0_2 = openManageMenu
    L0_2()
  end
  L2_1(L3_1, L4_1)
  L2_1 = Config
  L2_1 = L2_1.HousingManagement
  L2_1 = L2_1.Key
  if L2_1 then
    L2_1 = RegisterKeyMapping
    L3_1 = Config
    L3_1 = L3_1.HousingManagement
    L3_1 = L3_1.Command
    L4_1 = Config
    L4_1 = L4_1.HousingManagement
    L4_1 = L4_1.Description
    if not L4_1 then
      L4_1 = ""
    end
    L5_1 = "keyboard"
    L6_1 = Config
    L6_1 = L6_1.HousingManagement
    L6_1 = L6_1.Key
    L2_1(L3_1, L4_1, L5_1, L6_1)
  end
end
