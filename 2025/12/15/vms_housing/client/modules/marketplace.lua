local L0_1, L1_1, L2_1
isOfferByMarketplace = false
marketplaceOfferId = nil
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  isOfferByMarketplace = false
  marketplaceOfferId = nil
  L0_2 = {}
  L1_2 = pairs
  L2_2 = Properties
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = false
    L8_2 = L6_2.sale
    if L8_2 then
      L8_2 = L6_2.sale
      L8_2 = L8_2.active
      if true == L8_2 then
        goto lbl_24
      end
    end
    L8_2 = L6_2.rental
    if L8_2 then
      L8_2 = L6_2.rental
      L8_2 = L8_2.active
      ::lbl_24::
      if true == L8_2 then
        L8_2 = L6_2.owner
        if not L8_2 then
          L8_2 = Config
          L8_2 = L8_2.Marketplace
          L8_2 = L8_2.ShowSecondaryMarketOnly
          if L8_2 then
            goto lbl_33
          end
        end
        L7_2 = true
      end
    end
    ::lbl_33::
    if L7_2 then
      L8_2 = nil
      L9_2 = 1
      L10_2 = 5
      L11_2 = 1
      for L12_2 = L9_2, L10_2, L11_2 do
        L13_2 = tostring
        L14_2 = L12_2
        L13_2 = L13_2(L14_2)
        L14_2 = L6_2.metadata
        L14_2 = L14_2.images
        if L14_2 then
          L14_2 = L6_2.metadata
          L14_2 = L14_2.images
          L14_2 = L14_2[L13_2]
          if L14_2 then
            L14_2 = L6_2.metadata
            L14_2 = L14_2.images
            L8_2 = L14_2[L13_2]
            break
          end
        end
      end
      L9_2 = L6_2.metadata
      L9_2 = L9_2.garage
      L9_2 = nil ~= L9_2
      L10_2 = L6_2.metadata
      L10_2 = L10_2.parking
      L11_2 = L6_2.address
      L12_2 = Config
      L12_2 = L12_2.Regions
      L13_2 = L6_2.region
      L12_2 = L12_2[L13_2]
      if L12_2 then
        L12_2 = L11_2
        L13_2 = ", "
        L14_2 = L6_2.region
        L12_2 = L12_2 .. L13_2 .. L14_2
        L11_2 = L12_2
      end
      L12_2 = {}
      L12_2.name = L11_2
      L12_2.parking = L10_2
      L12_2.garage = L9_2
      L12_2.image = L8_2
      L13_2 = L6_2.metadata
      if L13_2 then
        L13_2 = L13_2.zone
      end
      if L13_2 then
        L13_2 = L13_2.area
      end
      L12_2.area = L13_2
      L13_2 = L6_2.sale
      L12_2.sale = L13_2
      L13_2 = L6_2.rental
      L12_2.rental = L13_2
      L0_2[L5_2] = L12_2
      L12_2 = L6_2.object_id
      if L12_2 then
        L12_2 = Properties
        L13_2 = tostring
        L14_2 = L6_2.object_id
        L13_2 = L13_2(L14_2)
        L12_2 = L12_2[L13_2]
        if L12_2 then
          L13_2 = L0_2[L5_2]
          L14_2 = {}
          L15_2 = L12_2.type
          L14_2.type = L15_2
          L15_2 = L12_2.name
          L14_2.name = L15_2
          L15_2 = L12_2.metadata
          if L15_2 then
            L15_2 = L15_2.parkingSpaces
          end
          L14_2.parkingSpaces = L15_2
          L13_2.building = L14_2
        end
      end
    end
  end
  L1_2 = {}
  L1_2.action = "Marketplace"
  L1_2.actionName = "Open"
  L2_2 = {}
  L2_2.propertiesList = L0_2
  L3_2 = Config
  L3_2 = L3_2.NoRegion
  L2_2.noRegion = L3_2
  L3_2 = Config
  L3_2 = L3_2.Regions
  L2_2.regions = L3_2
  L1_2.data = L2_2
  L2_2 = SetNuiFocus
  L3_2 = true
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SendNUIMessage
  L3_2 = L1_2
  L2_2(L3_2)
  openedMenu = "Marketplace"
end
openMarketplace = L0_1
function L0_1()
  local L0_2, L1_2, L2_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "Marketplace"
  L1_2.actionName = "Close"
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  openedMenu = nil
  isOfferByMarketplace = false
  marketplaceOfferId = nil
end
closeMarketplace = L0_1
L0_1 = exports
L1_1 = "OpenMarketplace"
L2_1 = openMarketplace
L0_1(L1_1, L2_1)
