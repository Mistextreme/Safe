local L0_1, L1_1, L2_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = IsOwner
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = IsRenter
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = library
      L1_2 = L1_2.HasKeys
      L2_2 = A0_2.id
      L1_2 = L1_2(L2_2)
    end
  end
  return L1_2
end
HasOwnership = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.owner
  L1_2 = nil ~= L1_2
  return L1_2
end
IsOwner = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.renter
  L1_2 = nil ~= L1_2
  return L1_2
end
IsRenter = L0_1
function L0_1(A0_2)
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
GetFurnitureLimit = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = 1
  L1_2 = Blips
  L1_2 = #L1_2
  L2_2 = 1
  for L3_2 = L0_2, L1_2, L2_2 do
    L4_2 = RemoveBlip
    L5_2 = Blips
    L5_2 = L5_2[L3_2]
    L4_2(L5_2)
    L4_2 = Blips
    L4_2[L3_2] = nil
  end
  L0_2 = pairs
  L1_2 = Properties
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = nil
    L7_2 = L5_2.type
    if "building" == L7_2 then
      L7_2 = Config
      L7_2 = L7_2.Blips
      L6_2 = L7_2.Building
    else
      L7_2 = L5_2.type
      if "motel" == L7_2 then
        L7_2 = Config
        L7_2 = L7_2.Blips
        L6_2 = L7_2.Motel
      else
        L7_2 = L5_2.owner
        L8_2 = Identifier
        if L7_2 == L8_2 then
          L7_2 = Config
          L7_2 = L7_2.Blips
          L6_2 = L7_2.HouseOwner
        else
          L7_2 = L5_2.renter
          L8_2 = Identifier
          if L7_2 == L8_2 then
            L7_2 = Config
            L7_2 = L7_2.Blips
            L6_2 = L7_2.HouseRenter
          else
            L7_2 = library
            L7_2 = L7_2.HasKeys
            L8_2 = L4_2
            L7_2 = L7_2(L8_2)
            if L7_2 then
              L7_2 = Config
              L7_2 = L7_2.Blips
              L6_2 = L7_2.HouseKeyHolder
            else
              L7_2 = L5_2.owner
              if not L7_2 then
                L7_2 = L5_2.renter
                if not L7_2 then
                  L7_2 = Config
                  L7_2 = L7_2.Blips
                  L6_2 = L7_2.HouseForSale
                end
              end
            end
          end
        end
      end
    end
    if L6_2 then
      L7_2 = L5_2.metadata
      if L7_2 then
        L7_2 = L5_2.type
        if "motel" == L7_2 then
          L7_2 = getZoneCenter
          L8_2 = L5_2.metadata
          L8_2 = L8_2.zone
          L8_2 = L8_2.points
          L9_2 = L5_2.metadata
          L9_2 = L9_2.zone
          L9_2 = L9_2.minZ
          L10_2 = L5_2.metadata
          L10_2 = L10_2.zone
          L10_2 = L10_2.maxZ
          L7_2 = L7_2(L8_2, L9_2, L10_2)
          L8_2 = table
          L8_2 = L8_2.insert
          L9_2 = Blips
          L10_2 = library
          L10_2 = L10_2.CreateBlip
          L11_2 = {}
          L12_2 = vector3
          L13_2 = L7_2.x
          L14_2 = L7_2.y
          L15_2 = L7_2.z
          L12_2 = L12_2(L13_2, L14_2, L15_2)
          L11_2.coords = L12_2
          L12_2 = L6_2.sprite
          L11_2.sprite = L12_2
          L12_2 = L6_2.display
          L11_2.display = L12_2
          L12_2 = L6_2.scale
          L11_2.scale = L12_2
          L12_2 = L6_2.color
          L11_2.color = L12_2
          L12_2 = L6_2.name
          L11_2.name = L12_2
          L12_2 = L5_2.blipCategory
          L11_2.blipCategory = L12_2
          L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2)
          L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        else
          L7_2 = L5_2.metadata
          L7_2 = L7_2.menu
          if L7_2 then
            L7_2 = L5_2.object_id
            if not L7_2 then
              L7_2 = table
              L7_2 = L7_2.insert
              L8_2 = Blips
              L9_2 = library
              L9_2 = L9_2.CreateBlip
              L10_2 = {}
              L11_2 = vector3
              L12_2 = L5_2.metadata
              L12_2 = L12_2.menu
              L12_2 = L12_2.x
              L13_2 = L5_2.metadata
              L13_2 = L13_2.menu
              L13_2 = L13_2.y
              L14_2 = L5_2.metadata
              L14_2 = L14_2.menu
              L14_2 = L14_2.z
              L11_2 = L11_2(L12_2, L13_2, L14_2)
              L10_2.coords = L11_2
              L11_2 = L6_2.sprite
              L10_2.sprite = L11_2
              L11_2 = L6_2.display
              L10_2.display = L11_2
              L11_2 = L6_2.scale
              L10_2.scale = L11_2
              L11_2 = L6_2.color
              L10_2.color = L11_2
              L11_2 = L6_2.name
              L10_2.name = L11_2
              L11_2 = L5_2.blipCategory
              L10_2.blipCategory = L11_2
              L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2)
              L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
          end
          else
            L7_2 = L5_2.metadata
            L7_2 = L7_2.enter
            if L7_2 then
              L7_2 = L5_2.object_id
              if not L7_2 then
                L7_2 = table
                L7_2 = L7_2.insert
                L8_2 = Blips
                L9_2 = library
                L9_2 = L9_2.CreateBlip
                L10_2 = {}
                L11_2 = vector3
                L12_2 = L5_2.metadata
                L12_2 = L12_2.enter
                L12_2 = L12_2.x
                L13_2 = L5_2.metadata
                L13_2 = L13_2.enter
                L13_2 = L13_2.y
                L14_2 = L5_2.metadata
                L14_2 = L14_2.enter
                L14_2 = L14_2.z
                L11_2 = L11_2(L12_2, L13_2, L14_2)
                L10_2.coords = L11_2
                L11_2 = L6_2.sprite
                L10_2.sprite = L11_2
                L11_2 = L6_2.display
                L10_2.display = L11_2
                L11_2 = L6_2.scale
                L10_2.scale = L11_2
                L11_2 = L6_2.color
                L10_2.color = L11_2
                L11_2 = L6_2.name
                L10_2.name = L11_2
                L11_2 = L5_2.blipCategory
                L10_2.blipCategory = L11_2
                L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2)
                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
              end
            end
          end
        end
      end
    end
  end
end
RefreshBlips = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L0_2 = GetCurrentPropertyId
  L0_2 = L0_2()
  L1_2 = GetCurrentPropertyData
  L1_2 = L1_2()
  if L1_2 then
    L2_2 = 1
    L3_2 = TargetPoints
    L3_2 = #L3_2
    L4_2 = 1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = TargetPoints
      L6_2 = L6_2[L5_2]
      L6_2 = L6_2.type
      if "entity" ~= L6_2 then
        L6_2 = TargetPoints
        L6_2 = L6_2[L5_2]
        L6_2 = L6_2.type
        if "door" ~= L6_2 then
          goto lbl_30
        end
      end
      L6_2 = CL
      L6_2 = L6_2.Target
      L7_2 = "remove-entity"
      L8_2 = TargetPoints
      L8_2 = L8_2[L5_2]
      L8_2 = L8_2.entity
      L6_2(L7_2, L8_2)
      goto lbl_37
      ::lbl_30::
      L6_2 = CL
      L6_2 = L6_2.Target
      L7_2 = "remove-zone"
      L8_2 = TargetPoints
      L8_2 = L8_2[L5_2]
      L8_2 = L8_2.id
      L6_2(L7_2, L8_2)
      ::lbl_37::
    end
    L2_2 = {}
    TargetPoints = L2_2
    L2_2 = L1_2.type
    if "building" == L2_2 then
      L2_2 = Property
      L2_2 = L2_2.GetApartments
      L3_2 = L1_2
      L4_2 = true
      L2_2 = L2_2(L3_2, L4_2)
      L3_2 = table
      L3_2 = L3_2.insert
      L4_2 = TargetPoints
      L5_2 = {}
      L5_2.type = "zone"
      L6_2 = CL
      L6_2 = L6_2.Target
      L7_2 = "zone"
      L8_2 = {}
      L9_2 = L1_2.metadata
      L9_2 = L9_2.enter
      L8_2.coords = L9_2
      L9_2 = vec
      L10_2 = 1.0
      L11_2 = 1.5
      L12_2 = 2.0
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2.size = L9_2
      L9_2 = L1_2.metadata
      L9_2 = L9_2.exit
      L9_2 = L9_2.w
      L8_2.rotation = L9_2
      L9_2 = {}
      L10_2 = {}
      L10_2.name = "property-offer"
      L10_2.icon = "fa-solid fa-scroll"
      L11_2 = TRANSLATE
      L12_2 = "target.view_house"
      L11_2 = L11_2(L12_2)
      L10_2.label = L11_2
      function L11_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3
        L1_3 = Property
        L2_3 = L1_3
        L1_3 = L1_3.BuildingMenu
        L3_3 = L1_2
        L4_3 = L2_2
        L1_3(L2_3, L3_3, L4_3)
      end
      L10_2.action = L11_2
      L9_2[1] = L10_2
      L8_2.options = L9_2
      L6_2 = L6_2(L7_2, L8_2)
      L5_2.id = L6_2
      L3_2(L4_2, L5_2)
      L3_2 = Config
      L3_2 = L3_2.Garages
      if "vms_garagesv2" == L3_2 then
        L3_2 = L1_2.metadata
        L3_2 = L3_2.parkingEnter
        if L3_2 then
          L3_2 = L1_2.metadata
          L3_2 = L3_2.parkingSpaces
          if L3_2 then
            L3_2 = {}
            L4_2 = pairs
            L5_2 = L1_2.metadata
            L5_2 = L5_2.parkingSpaces
            L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
            for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
              L10_2 = table
              L10_2 = L10_2.insert
              L11_2 = L3_2
              L12_2 = {}
              L13_2 = "property-garage-"
              L14_2 = L8_2
              L13_2 = L13_2 .. L14_2
              L12_2.name = L13_2
              L12_2.icon = "fa-solid fa-warehouse"
              L13_2 = TRANSLATE
              L14_2 = "target.enter_underground_parking"
              L15_2 = L8_2
              L13_2 = L13_2(L14_2, L15_2)
              L12_2.label = L13_2
              L12_2.distance = 3.0
              function L13_2(A0_3)
                local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
                L1_3 = exports
                L1_3 = L1_3.vms_garagesv2
                L2_3 = L1_3
                L1_3 = L1_3.enterApartmentParking
                L3_3 = "vms_housing:parking:"
                L4_3 = L0_2
                L5_3 = ":"
                L6_3 = L8_2
                L3_3 = L3_3 .. L4_3 .. L5_3 .. L6_3
                L1_3(L2_3, L3_3)
              end
              L12_2.action = L13_2
              function L13_2()
                local L0_3, L1_3, L2_3
                L0_3 = Property
                L0_3 = L0_3.IsHaveAnyApartment
                L1_3 = tostring
                L2_3 = L0_2
                L1_3, L2_3 = L1_3(L2_3)
                return L0_3(L1_3, L2_3)
              end
              L12_2.canInteract = L13_2
              L10_2(L11_2, L12_2)
            end
            L4_2 = table
            L4_2 = L4_2.insert
            L5_2 = TargetPoints
            L6_2 = {}
            L6_2.type = "zone"
            L7_2 = CL
            L7_2 = L7_2.Target
            L8_2 = "zone"
            L9_2 = {}
            L10_2 = vector3
            L11_2 = L1_2.metadata
            L11_2 = L11_2.parkingEnter
            L11_2 = L11_2.x
            L12_2 = L1_2.metadata
            L12_2 = L12_2.parkingEnter
            L12_2 = L12_2.y
            L13_2 = L1_2.metadata
            L13_2 = L13_2.parkingEnter
            L13_2 = L13_2.z
            L10_2 = L10_2(L11_2, L12_2, L13_2)
            L9_2.coords = L10_2
            L10_2 = vec
            L11_2 = 2.0
            L12_2 = 2.0
            L13_2 = 2.0
            L10_2 = L10_2(L11_2, L12_2, L13_2)
            L9_2.size = L10_2
            L10_2 = L1_2.metadata
            L10_2 = L10_2.parkingEnter
            L10_2 = L10_2.w
            L9_2.rotation = L10_2
            L9_2.options = L3_2
            L7_2 = L7_2(L8_2, L9_2)
            L6_2.id = L7_2
            L4_2(L5_2, L6_2)
          end
        end
      end
    else
      L2_2 = L1_2.type
      if "motel" == L2_2 then
        L2_2 = Property
        L2_2 = L2_2.GetMotelRooms
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        L3_2 = pairs
        L4_2 = L2_2
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L9_2 = {}
          L10_2 = tostring
          L11_2 = L8_2.id
          L10_2 = L10_2(L11_2)
          L11_2 = L8_2.owner
          if not L11_2 then
            L11_2 = L8_2.renter
            if not L11_2 then
              goto lbl_363
            end
          end
          L11_2 = library
          L11_2 = L11_2.HasAnyPermission
          L12_2 = L10_2
          L11_2 = L11_2(L12_2)
          if L11_2 then
            L11_2 = table
            L11_2 = L11_2.insert
            L12_2 = L9_2
            L13_2 = TargetHandler
            L13_2 = L13_2.Manage
            L14_2 = L10_2
            function L15_2()
              local L0_3, L1_3
              L0_3 = L8_2.metadata
              L0_3 = L0_3.lockdown
              L0_3 = not L0_3
              return L0_3
            end
            L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2, L15_2)
            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
          end
          L11_2 = L8_2.type
          if "mlo" == L11_2 then
            L11_2 = library
            L11_2 = L11_2.HasPermissions
            L12_2 = L10_2
            L13_2 = "furniture"
            L11_2 = L11_2(L12_2, L13_2)
            if L11_2 then
              L11_2 = L8_2.metadata
              L11_2 = L11_2.allowFurnitureInside
              if L11_2 then
                L11_2 = table
                L11_2 = L11_2.insert
                L12_2 = L9_2
                L13_2 = TargetHandler
                L13_2 = L13_2.Furniture
                function L14_2()
                  local L0_3, L1_3
                  L0_3 = L8_2.metadata
                  L0_3 = L0_3.lockdown
                  L0_3 = IsInsideMLO
                  L0_3 = not L0_3 and L0_3
                  return L0_3
                end
                L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2)
                L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
              end
            end
          end
          L11_2 = Config
          L11_2 = L11_2.UseKeysOnItem
          if not L11_2 then
            L11_2 = L8_2.type
            if "mlo" ~= L11_2 then
              L11_2 = table
              L11_2 = L11_2.insert
              L12_2 = L9_2
              L13_2 = TargetHandler
              L13_2 = L13_2.ToggleLock
              L14_2 = L10_2
              function L15_2()
                local L0_3, L1_3
                L0_3 = L8_2.metadata
                L0_3 = L0_3.lockdown
                L0_3 = library
                L0_3 = L0_3.HasKeys
                L1_3 = L10_2
                L0_3 = not L0_3 and L0_3
                return L0_3
              end
              L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2, L15_2)
              L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            end
          end
          L11_2 = L8_2.type
          if "mlo" ~= L11_2 then
            L11_2 = table
            L11_2 = L11_2.insert
            L12_2 = L9_2
            L13_2 = TargetHandler
            L13_2 = L13_2.Doorbell
            L14_2 = L10_2
            L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2)
            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            L11_2 = table
            L11_2 = L11_2.insert
            L12_2 = L9_2
            L13_2 = TargetHandler
            L13_2 = L13_2.Enter
            function L14_2()
              local L0_3, L1_3, L2_3, L3_3
              L0_3 = Property
              L1_3 = L0_3
              L0_3 = L0_3.EnterProperty
              L2_3 = L8_2
              L3_3 = L10_2
              L0_3(L1_3, L2_3, L3_3)
            end
            function L15_2()
              local L0_3, L1_3
              L0_3 = L8_2.metadata
              L0_3 = L0_3.locked
              L0_3 = L8_2.metadata
              L0_3 = L0_3.lockdown
              L0_3 = not L0_3 and L0_3
              return L0_3
            end
            L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2, L15_2)
            L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            L11_2 = Config
            L11_2 = L11_2.Lockpick
            if L11_2 then
              L11_2 = Config
              L11_2 = L11_2.Lockpick
              L11_2 = L11_2.Enable
              if L11_2 then
                L11_2 = table
                L11_2 = L11_2.insert
                L12_2 = L9_2
                L13_2 = TargetHandler
                L13_2 = L13_2.Lockpick
                L14_2 = L10_2
                L15_2 = L8_2.metadata
                if L15_2 then
                  L15_2 = L15_2.upgrades
                end
                if L15_2 then
                  L15_2 = L15_2.antiBurglaryDoors
                end
                L16_2 = L8_2.metadata
                if L16_2 then
                  L16_2 = L16_2.upgrades
                end
                if L16_2 then
                  L16_2 = L16_2.alarm
                end
                function L17_2(A0_3)
                  local L1_3, L2_3, L3_3, L4_3
                  L1_3 = TriggerServerEvent
                  L2_3 = "vms_housing:sv:lockpickDoors"
                  L3_3 = L10_2
                  L4_3 = A0_3
                  L1_3(L2_3, L3_3, L4_3)
                end
                function L18_2()
                  local L0_3, L1_3
                  L0_3 = L8_2.metadata
                  L0_3 = L0_3.locked
                  if L0_3 then
                    L0_3 = L8_2.metadata
                    L0_3 = L0_3.lockdown
                    L0_3 = not L0_3
                  end
                  return L0_3
                end
                L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
                L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
              end
            end
          end
          L11_2 = L8_2.type
          if "mlo" == L11_2 then
            L11_2 = Property
            L12_2 = L11_2
            L11_2 = L11_2.LoadDoors
            L13_2 = L8_2.metadata
            L13_2 = L13_2.doors
            L14_2 = L10_2
            L11_2(L12_2, L13_2, L14_2)
          end
          L11_2 = TargetHandler
          L11_2 = L11_2.Lockdown
          function L12_2()
            local L0_3, L1_3, L2_3
            L0_3 = TriggerServerEvent
            L1_3 = "vms_housing:sv:lockdown"
            L2_3 = L10_2
            L0_3(L1_3, L2_3)
          end
          function L13_2()
            local L0_3, L1_3
            L0_3 = L8_2.metadata
            L0_3 = L0_3.lockdown
            L0_3 = not L0_3
            return L0_3
          end
          L11_2 = L11_2(L12_2, L13_2)
          if L11_2 then
            L12_2 = table
            L12_2 = L12_2.insert
            L13_2 = L9_2
            L14_2 = L11_2
            L12_2(L13_2, L14_2)
          end
          L12_2 = TargetHandler
          L12_2 = L12_2.RemoveSeal
          function L13_2()
            local L0_3, L1_3, L2_3
            L0_3 = TriggerServerEvent
            L1_3 = "vms_housing:sv:removePoliceSeal"
            L2_3 = L10_2
            L0_3(L1_3, L2_3)
          end
          function L14_2()
            local L0_3, L1_3
            L0_3 = L8_2.metadata
            L0_3 = L0_3.lockdown
            return L0_3
          end
          L12_2 = L12_2(L13_2, L14_2)
          if L12_2 then
            L13_2 = table
            L13_2 = L13_2.insert
            L14_2 = L9_2
            L15_2 = L12_2
            L13_2(L14_2, L15_2)
          end
          L13_2 = L8_2.type
          if "mlo" ~= L13_2 then
            L13_2 = TargetHandler
            L13_2 = L13_2.Raid
            L14_2 = L10_2
            function L15_2(A0_3)
              local L1_3, L2_3, L3_3
              if A0_3 then
                L1_3 = TriggerServerEvent
                L2_3 = "vms_housing:sv:raidProperty"
                L3_3 = L10_2
                L1_3(L2_3, L3_3)
              end
            end
            function L16_2()
              local L0_3, L1_3
              L0_3 = L8_2.metadata
              L0_3 = L0_3.locked
              if L0_3 then
                L0_3 = L8_2.isUnderRaid
                L0_3 = not L0_3
              end
              return L0_3
            end
            L13_2 = L13_2(L14_2, L15_2, L16_2)
            if L13_2 then
              L14_2 = table
              L14_2 = L14_2.insert
              L15_2 = L9_2
              L16_2 = L13_2
              L14_2(L15_2, L16_2)
            end
            L14_2 = TargetHandler
            L14_2 = L14_2.RaidLock
            function L15_2()
              local L0_3, L1_3, L2_3, L3_3, L4_3
              L0_3 = Property
              L1_3 = L0_3
              L0_3 = L0_3.ToggleLock
              L2_3 = L10_2
              L3_3 = nil
              L4_3 = true
              L0_3(L1_3, L2_3, L3_3, L4_3)
            end
            function L16_2()
              local L0_3, L1_3
              L0_3 = L8_2.isUnderRaid
              return L0_3
            end
            L14_2 = L14_2(L15_2, L16_2)
            if L14_2 then
              L15_2 = table
              L15_2 = L15_2.insert
              L16_2 = L9_2
              L17_2 = L14_2
              L15_2(L16_2, L17_2)
              goto lbl_399
              ::lbl_363::
              L11_2 = L8_2.owner
              if not L11_2 then
                L11_2 = L8_2.renter
                if not L11_2 then
                  L11_2 = L8_2.sale
                  if L11_2 then
                    L11_2 = L8_2.sale
                    L11_2 = L11_2.active
                    if L11_2 then
                      goto lbl_383
                    end
                  end
                  L11_2 = L8_2.rental
                  if L11_2 then
                    L11_2 = L8_2.rental
                    L11_2 = L11_2.active
                    ::lbl_383::
                    if L11_2 then
                      L11_2 = table
                      L11_2 = L11_2.insert
                      L12_2 = L9_2
                      L13_2 = TargetHandler
                      L13_2 = L13_2.ViewOffer
                      L14_2 = L10_2
                      L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2)
                      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
                    end
                  end
                  L11_2 = Property
                  L12_2 = L11_2
                  L11_2 = L11_2.LoadDoors
                  L13_2 = L8_2.metadata
                  L13_2 = L13_2.doors
                  L14_2 = L10_2
                  L15_2 = false
                  L16_2 = true
                  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
                end
              end
            end
          end
          ::lbl_399::
          L11_2 = next
          L12_2 = L9_2
          L11_2 = L11_2(L12_2)
          if L11_2 then
            L11_2 = table
            L11_2 = L11_2.insert
            L12_2 = TargetPoints
            L13_2 = {}
            L13_2.type = "zone"
            L14_2 = CL
            L14_2 = L14_2.Target
            L15_2 = "zone"
            L16_2 = {}
            L17_2 = L8_2.type
            if "mlo" == L17_2 then
              L17_2 = L8_2.metadata
              L17_2 = L17_2.menu
              if L17_2 then
                goto lbl_424
              end
            end
            L17_2 = L8_2.metadata
            L17_2 = L17_2.enter
            ::lbl_424::
            L16_2.coords = L17_2
            L17_2 = vec
            L18_2 = 1.0
            L19_2 = 1.5
            L20_2 = 2.8
            L17_2 = L17_2(L18_2, L19_2, L20_2)
            L16_2.size = L17_2
            L17_2 = L8_2.type
            if "mlo" == L17_2 then
              L17_2 = 0.0
              if L17_2 then
                goto lbl_440
              end
            end
            L17_2 = L8_2.metadata
            L17_2 = L17_2.exit
            L17_2 = L17_2.w
            ::lbl_440::
            L16_2.rotation = L17_2
            L16_2.options = L9_2
            L14_2 = L14_2(L15_2, L16_2)
            L13_2.id = L14_2
            L11_2(L12_2, L13_2)
          end
        end
      else
        L2_2 = CurrentShell
        if not L2_2 then
          L2_2 = CurrentIPL
          if not L2_2 then
            L2_2 = L1_2.metadata
            L2_2 = L2_2.enter
            if not L2_2 then
              L2_2 = L1_2.metadata
              L2_2 = L2_2.menu
              if not L2_2 then
                goto lbl_709
              end
            end
            L2_2 = {}
            L3_2 = L1_2.owner
            if not L3_2 then
              L3_2 = L1_2.renter
              if not L3_2 then
                goto lbl_626
              end
            end
            L3_2 = library
            L3_2 = L3_2.HasAnyPermission
            L4_2 = L0_2
            L3_2 = L3_2(L4_2)
            if L3_2 then
              L3_2 = table
              L3_2 = L3_2.insert
              L4_2 = L2_2
              L5_2 = TargetHandler
              L5_2 = L5_2.Manage
              L6_2 = nil
              function L7_2()
                local L0_3, L1_3
                L0_3 = L1_2.metadata
                L0_3 = L0_3.lockdown
                L0_3 = not L0_3
                return L0_3
              end
              L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L5_2(L6_2, L7_2)
              L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            end
            L3_2 = library
            L3_2 = L3_2.HasPermissions
            L4_2 = L0_2
            L5_2 = "furniture"
            L3_2 = L3_2(L4_2, L5_2)
            if L3_2 then
              L3_2 = L1_2.metadata
              L3_2 = L3_2.allowFurnitureOutside
              if L3_2 then
                L3_2 = table
                L3_2 = L3_2.insert
                L4_2 = L2_2
                L5_2 = TargetHandler
                L5_2 = L5_2.Furniture
                function L6_2()
                  local L0_3, L1_3
                  L0_3 = L1_2.metadata
                  L0_3 = L0_3.lockdown
                  L0_3 = not L0_3
                  return L0_3
                end
                L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L5_2(L6_2)
                L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
              end
            end
            L3_2 = Config
            L3_2 = L3_2.UseKeysOnItem
            if not L3_2 then
              L3_2 = L1_2.type
              if "mlo" ~= L3_2 then
                L3_2 = table
                L3_2 = L3_2.insert
                L4_2 = L2_2
                L5_2 = TargetHandler
                L5_2 = L5_2.ToggleLock
                L6_2 = nil
                function L7_2()
                  local L0_3, L1_3
                  L0_3 = L1_2.metadata
                  L0_3 = L0_3.lockdown
                  L0_3 = library
                  L0_3 = L0_3.HasKeys
                  L1_3 = L0_2
                  L0_3 = not L0_3 and L0_3
                  return L0_3
                end
                L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L5_2(L6_2, L7_2)
                L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
              end
            end
            L3_2 = L1_2.type
            if "mlo" ~= L3_2 then
              L3_2 = table
              L3_2 = L3_2.insert
              L4_2 = L2_2
              L5_2 = TargetHandler
              L5_2 = L5_2.Doorbell
              L6_2 = L0_2
              L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L5_2(L6_2)
              L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
              L3_2 = table
              L3_2 = L3_2.insert
              L4_2 = L2_2
              L5_2 = TargetHandler
              L5_2 = L5_2.Enter
              function L6_2()
                local L0_3, L1_3, L2_3
                L0_3 = Property
                L1_3 = L0_3
                L0_3 = L0_3.EnterProperty
                L2_3 = L1_2
                L0_3(L1_3, L2_3)
              end
              function L7_2()
                local L0_3, L1_3
                L0_3 = L1_2.metadata
                L0_3 = L0_3.locked
                L0_3 = L1_2.metadata
                L0_3 = L0_3.lockdown
                L0_3 = not L0_3 and L0_3
                return L0_3
              end
              L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L5_2(L6_2, L7_2)
              L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
              L3_2 = Config
              L3_2 = L3_2.Lockpick
              if L3_2 then
                L3_2 = Config
                L3_2 = L3_2.Lockpick
                L3_2 = L3_2.Enable
                if L3_2 then
                  L3_2 = table
                  L3_2 = L3_2.insert
                  L4_2 = L2_2
                  L5_2 = TargetHandler
                  L5_2 = L5_2.Lockpick
                  L6_2 = L0_2
                  L7_2 = L1_2.metadata
                  if L7_2 then
                    L7_2 = L7_2.upgrades
                  end
                  if L7_2 then
                    L7_2 = L7_2.antiBurglaryDoors
                  end
                  L8_2 = L1_2.metadata
                  if L8_2 then
                    L8_2 = L8_2.upgrades
                  end
                  if L8_2 then
                    L8_2 = L8_2.alarm
                  end
                  function L9_2(A0_3)
                    local L1_3, L2_3, L3_3, L4_3
                    L1_3 = TriggerServerEvent
                    L2_3 = "vms_housing:sv:lockpickDoors"
                    L3_3 = L0_2
                    L4_3 = A0_3
                    L1_3(L2_3, L3_3, L4_3)
                  end
                  function L10_2()
                    local L0_3, L1_3
                    L0_3 = L1_2.metadata
                    L0_3 = L0_3.locked
                    if L0_3 then
                      L0_3 = L1_2.metadata
                      L0_3 = L0_3.lockdown
                      L0_3 = not L0_3
                    end
                    return L0_3
                  end
                  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
                  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
                end
              end
            end
            L3_2 = TargetHandler
            L3_2 = L3_2.Lockdown
            function L4_2()
              local L0_3, L1_3, L2_3
              L0_3 = TriggerServerEvent
              L1_3 = "vms_housing:sv:lockdown"
              L2_3 = L0_2
              L0_3(L1_3, L2_3)
            end
            function L5_2()
              local L0_3, L1_3
              L0_3 = L1_2.metadata
              L0_3 = L0_3.lockdown
              L0_3 = not L0_3
              return L0_3
            end
            L3_2 = L3_2(L4_2, L5_2)
            if L3_2 then
              L4_2 = table
              L4_2 = L4_2.insert
              L5_2 = L2_2
              L6_2 = L3_2
              L4_2(L5_2, L6_2)
            end
            L4_2 = TargetHandler
            L4_2 = L4_2.RemoveSeal
            function L5_2()
              local L0_3, L1_3, L2_3
              L0_3 = TriggerServerEvent
              L1_3 = "vms_housing:sv:removePoliceSeal"
              L2_3 = L0_2
              L0_3(L1_3, L2_3)
            end
            function L6_2()
              local L0_3, L1_3
              L0_3 = L1_2.metadata
              L0_3 = L0_3.lockdown
              return L0_3
            end
            L4_2 = L4_2(L5_2, L6_2)
            if L4_2 then
              L5_2 = table
              L5_2 = L5_2.insert
              L6_2 = L2_2
              L7_2 = L4_2
              L5_2(L6_2, L7_2)
            end
            L5_2 = TargetHandler
            L5_2 = L5_2.Raid
            L6_2 = nil
            function L7_2(A0_3)
              local L1_3, L2_3, L3_3
              if A0_3 then
                L1_3 = TriggerServerEvent
                L2_3 = "vms_housing:sv:raidProperty"
                L3_3 = L0_2
                L1_3(L2_3, L3_3)
              end
            end
            function L8_2()
              local L0_3, L1_3
              L0_3 = L1_2.metadata
              L0_3 = L0_3.locked
              if L0_3 then
                L0_3 = L1_2.isUnderRaid
                L0_3 = not L0_3
              end
              return L0_3
            end
            L5_2 = L5_2(L6_2, L7_2, L8_2)
            if L5_2 then
              L6_2 = table
              L6_2 = L6_2.insert
              L7_2 = L2_2
              L8_2 = L5_2
              L6_2(L7_2, L8_2)
            end
            L6_2 = TargetHandler
            L6_2 = L6_2.RaidLock
            function L7_2()
              local L0_3, L1_3, L2_3, L3_3, L4_3
              L0_3 = Property
              L1_3 = L0_3
              L0_3 = L0_3.ToggleLock
              L2_3 = nil
              L3_3 = nil
              L4_3 = true
              L0_3(L1_3, L2_3, L3_3, L4_3)
            end
            function L8_2()
              local L0_3, L1_3
              L0_3 = L1_2.isUnderRaid
              return L0_3
            end
            L6_2 = L6_2(L7_2, L8_2)
            if L6_2 then
              L7_2 = table
              L7_2 = L7_2.insert
              L8_2 = L2_2
              L9_2 = L6_2
              L7_2(L8_2, L9_2)
              goto lbl_653
              ::lbl_626::
              L3_2 = L1_2.owner
              if not L3_2 then
                L3_2 = L1_2.renter
                if not L3_2 then
                  L3_2 = L1_2.sale
                  if L3_2 then
                    L3_2 = L1_2.sale
                    L3_2 = L3_2.active
                    if L3_2 then
                      goto lbl_646
                    end
                  end
                  L3_2 = L1_2.rental
                  if L3_2 then
                    L3_2 = L1_2.rental
                    L3_2 = L3_2.active
                    ::lbl_646::
                    if L3_2 then
                      L3_2 = table
                      L3_2 = L3_2.insert
                      L4_2 = L2_2
                      L5_2 = TargetHandler
                      L5_2 = L5_2.ViewOffer
                      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L5_2()
                      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
                    end
                  end
                end
              end
            end
            ::lbl_653::
            L3_2 = next
            L4_2 = L2_2
            L3_2 = L3_2(L4_2)
            if L3_2 then
              L3_2 = table
              L3_2 = L3_2.insert
              L4_2 = TargetPoints
              L5_2 = {}
              L5_2.type = "zone"
              L6_2 = CL
              L6_2 = L6_2.Target
              L7_2 = "zone"
              L8_2 = {}
              L9_2 = L1_2.type
              if "mlo" == L9_2 then
                L9_2 = L1_2.metadata
                L9_2 = L9_2.menu
                if L9_2 then
                  goto lbl_678
                end
              end
              L9_2 = L1_2.metadata
              L9_2 = L9_2.enter
              ::lbl_678::
              L8_2.coords = L9_2
              L9_2 = L1_2.type
              if "mlo" == L9_2 then
                L9_2 = vec
                L10_2 = 1.5
                L11_2 = 1.5
                L12_2 = 2.8
                L9_2 = L9_2(L10_2, L11_2, L12_2)
                if L9_2 then
                  goto lbl_694
                end
              end
              L9_2 = vec
              L10_2 = 1.0
              L11_2 = 1.5
              L12_2 = 2.8
              L9_2 = L9_2(L10_2, L11_2, L12_2)
              ::lbl_694::
              L8_2.size = L9_2
              L9_2 = L1_2.type
              if "mlo" == L9_2 then
                L9_2 = 0.0
                if L9_2 then
                  goto lbl_704
                end
              end
              L9_2 = L1_2.metadata
              L9_2 = L9_2.exit
              L9_2 = L9_2.w
              ::lbl_704::
              L8_2.rotation = L9_2
              L8_2.options = L2_2
              L6_2 = L6_2(L7_2, L8_2)
              L5_2.id = L6_2
              L3_2(L4_2, L5_2)
            end
          end
        end
        ::lbl_709::
        L2_2 = CurrentShell
        if not L2_2 then
          L2_2 = CurrentIPL
          if not L2_2 then
            L2_2 = L1_2.metadata
            L2_2 = L2_2.garage
            if L2_2 then
              L2_2 = library
              L2_2 = L2_2.HasPermissions
              L3_2 = L0_2
              L4_2 = "garage"
              L2_2 = L2_2(L3_2, L4_2)
              if L2_2 then
                L2_2 = table
                L2_2 = L2_2.insert
                L3_2 = TargetPoints
                L4_2 = {}
                L4_2.type = "zone"
                L5_2 = CL
                L5_2 = L5_2.Target
                L6_2 = "zone"
                L7_2 = {}
                L8_2 = L1_2.metadata
                L8_2 = L8_2.garage
                L7_2.coords = L8_2
                L8_2 = vec
                L9_2 = 2.5
                L10_2 = 2.5
                L11_2 = 2.0
                L8_2 = L8_2(L9_2, L10_2, L11_2)
                L7_2.size = L8_2
                L8_2 = L1_2.metadata
                L8_2 = L8_2.garage
                L8_2 = L8_2.w
                L7_2.rotation = L8_2
                L8_2 = {}
                L9_2 = {}
                L9_2.name = "property-garage"
                L9_2.icon = "fa-solid fa-warehouse"
                L10_2 = TRANSLATE
                L11_2 = "target.garage"
                L10_2 = L10_2(L11_2)
                L9_2.label = L10_2
                L9_2.distance = 2.5
                function L10_2(A0_3)
                  local L1_3, L2_3, L3_3, L4_3
                  L1_3 = Property
                  L1_3 = L1_3.EditingFurniture
                  if L1_3 then
                    L1_3 = CL
                    L1_3 = L1_3.Notification
                    L2_3 = TRANSLATE
                    L3_3 = "notify.furniture:you_are_in_furniture_mode"
                    L2_3 = L2_3(L3_3)
                    L3_3 = 5000
                    L4_3 = "info"
                    return L1_3(L2_3, L3_3, L4_3)
                  end
                  L1_3 = OpenGarage
                  if not L1_3 then
                    L1_3 = warn
                    L2_3 = ""
                    return L1_3(L2_3)
                  end
                  L1_3 = OpenGarage
                  L2_3 = L0_2
                  L3_3 = L1_2
                  L1_3(L2_3, L3_3)
                end
                L9_2.action = L10_2
                function L10_2()
                  local L0_3, L1_3
                  L0_3 = L1_2.metadata
                  L0_3 = L0_3.lockdown
                  L0_3 = not L0_3
                  return L0_3
                end
                L9_2.canInteract = L10_2
                L8_2[1] = L9_2
                L7_2.options = L8_2
                L5_2 = L5_2(L6_2, L7_2)
                L4_2.id = L5_2
                L2_2(L3_2, L4_2)
              end
            end
          end
        end
      end
    end
    L2_2 = CurrentPropertyData
    if L2_2 then
      L2_2 = CurrentPropertyData
      L2_2 = L2_2.type
      if "mlo" == L2_2 then
        L2_2 = IsInsideMLO
        L2_2 = L2_2()
        if L2_2 then
          L2_2 = CurrentPropertyData
          L2_2 = L2_2.metadata
          if L2_2 then
            L2_2 = L2_2.wardrobe
          end
          if L2_2 then
            L2_2 = L2_2.x
          end
          if L2_2 then
            L2_2 = table
            L2_2 = L2_2.insert
            L3_2 = TargetPoints
            L4_2 = TargetHandler
            L4_2 = L4_2.Wardrobe
            L5_2 = CurrentProperty
            L6_2 = CurrentPropertyData
            L6_2 = L6_2.metadata
            L6_2 = L6_2.wardrobe
            L6_2 = L6_2.x
            L7_2 = CurrentPropertyData
            L7_2 = L7_2.metadata
            L7_2 = L7_2.wardrobe
            L7_2 = L7_2.y
            L8_2 = CurrentPropertyData
            L8_2 = L8_2.metadata
            L8_2 = L8_2.wardrobe
            L8_2 = L8_2.z
            L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
            L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
          end
          L2_2 = CurrentPropertyData
          L2_2 = L2_2.metadata
          if L2_2 then
            L2_2 = L2_2.storage
          end
          if L2_2 then
            L2_2 = L2_2.x
          end
          if L2_2 then
            L2_2 = table
            L2_2 = L2_2.insert
            L3_2 = TargetPoints
            L4_2 = TargetHandler
            L4_2 = L4_2.Storage
            L5_2 = CurrentProperty
            L6_2 = CurrentPropertyData
            L6_2 = L6_2.metadata
            L6_2 = L6_2.storage
            L6_2 = L6_2.x
            L7_2 = CurrentPropertyData
            L7_2 = L7_2.metadata
            L7_2 = L7_2.storage
            L7_2 = L7_2.y
            L8_2 = CurrentPropertyData
            L8_2 = L8_2.metadata
            L8_2 = L8_2.storage
            L8_2 = L8_2.z
            L9_2 = CurrentPropertyData
            L9_2 = L9_2.metadata
            L9_2 = L9_2.storage
            L9_2 = L9_2.slots
            L10_2 = CurrentPropertyData
            L10_2 = L10_2.metadata
            L10_2 = L10_2.storage
            L10_2 = L10_2.weight
            L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
            L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
          end
        end
      end
    end
    L2_2 = L1_2.type
    if "mlo" == L2_2 then
      L2_2 = Property
      L3_2 = L2_2
      L2_2 = L2_2.LoadDoors
      L4_2 = L1_2.metadata
      L4_2 = L4_2.doors
      L5_2 = nil
      L6_2 = true
      L7_2 = L1_2.owner
      L7_2 = nil == L7_2
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  else
    L2_2 = CurrentShell
    if not L2_2 then
      L2_2 = CurrentIPL
      if not L2_2 then
        goto lbl_877
      end
    end
    L2_2 = Property
    L3_2 = L2_2
    L2_2 = L2_2.LoadInteriorInteractable
    L2_2(L3_2)
  end
  ::lbl_877::
end
RefreshTargets = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = Properties
  L1_2 = SelectedApartment
  L0_2 = L0_2[L1_2]
  L1_2 = {}
  L2_2 = IsOwner
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L1_2.isOwner = L2_2
  L2_2 = IsRenter
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L1_2.isRenter = L2_2
  L2_2 = library
  L2_2 = L2_2.HasKeys
  L3_2 = SelectedApartment
  L2_2 = L2_2(L3_2)
  L1_2.isKeyHolder = L2_2
  L1_2.apartmentData = L0_2
  L2_2 = library
  L2_2 = L2_2.HasAnyPermission
  L3_2 = SelectedApartment
  L2_2 = L2_2(L3_2)
  L1_2.hasPermManage = L2_2
  L1_2.canLockdown = false
  L1_2.canRemovePoliceSeal = false
  L1_2.canRaid = false
  L1_2.canLockAfterRaid = false
  L2_2 = library
  L2_2 = L2_2.CallbackAwait
  L3_2 = "vms_housing:checkApartmentActions"
  L4_2 = SelectedApartment
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = Config
  L3_2 = L3_2.Lockpick
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.Lockpick
    L3_2 = L3_2.Enable
    if L3_2 then
      L3_2 = L0_2.metadata
      L3_2 = L3_2.locked
      if L3_2 then
        L3_2 = L0_2.metadata
        L3_2 = L3_2.lockdown
        L3_2 = not L3_2 and L3_2
      end
    end
  end
  L1_2.canLockpick = L3_2
  L3_2 = L0_2.metadata
  L3_2 = L3_2.lockdown
  L3_2 = not L3_2 and L3_2
  L1_2.canLockdown = L3_2
  L3_2 = L0_2.metadata
  L3_2 = L3_2.lockdown
  if L3_2 then
    L3_2 = L2_2.allowedRemovePoliceSeal
  end
  L1_2.canRemovePoliceSeal = L3_2
  L3_2 = L0_2.metadata
  L3_2 = L3_2.locked
  if L3_2 then
    L3_2 = L0_2.isUnderRaid
    L3_2 = not L3_2 and L3_2
  end
  L1_2.canRaid = L3_2
  L3_2 = L0_2.isUnderRaid
  if L3_2 then
    L3_2 = L2_2.allowedLockAfterRaid
  end
  L1_2.canLockAfterRaid = L3_2
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "Property"
  L4_2.actionName = "ReloadApartmentMenu"
  L4_2.data = L1_2
  L3_2(L4_2)
end
ReloadApartmentMenu = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = library
  L1_2 = L1_2.Callback
  L2_2 = "vms_housing:checkLastProperty"
  function L3_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    if A0_3 and A1_3 then
      L3_3 = A1_3.type
      if "shell" == L3_3 then
        L3_3 = AvailableShells
        L4_3 = A1_3.metadata
        L4_3 = L4_3.shell
        L3_3 = L3_3[L4_3]
        if not L3_3 then
          L3_3 = warn
          L4_3 = "Could not find shell \""
          L5_3 = A1_3.metadata
          L5_3 = L5_3.shell
          L6_3 = "\"!"
          L4_3 = L4_3 .. L5_3 .. L6_3
          return L3_3(L4_3)
        end
        L3_3 = library
        L3_3 = L3_3.RequestEntity
        L4_3 = A1_3.metadata
        L4_3 = L4_3.shell
        L3_3 = L3_3(L4_3)
        if not L3_3 then
          L4_3 = warn
          L5_3 = "Failed to load shell \""
          L6_3 = A1_3.metadata
          L6_3 = L6_3.shell
          L7_3 = "\" - make sure it is running!"
          L5_3 = L5_3 .. L6_3 .. L7_3
          return L4_3(L5_3)
        end
      else
        L3_3 = A1_3.type
        if "ipl" == L3_3 then
          L3_3 = AvailableIPLS
          L4_3 = A1_3.metadata
          L4_3 = L4_3.ipl
          L3_3 = L3_3[L4_3]
          if not L3_3 then
            L3_3 = warn
            L4_3 = "Could not find ipl \""
            L5_3 = A1_3.metadata
            L5_3 = L5_3.ipl
            L6_3 = "\"!"
            L4_3 = L4_3 .. L5_3 .. L6_3
            return L3_3(L4_3)
          end
        end
      end
      L3_3 = FreezeEntityPosition
      L4_3 = PlayerPedId
      L4_3 = L4_3()
      L5_3 = true
      L3_3(L4_3, L5_3)
      L3_3 = A0_2
      if L3_3 then
        L3_3 = A0_2
        L4_3 = true
        L3_3(L4_3)
      end
      L3_3 = tostring
      L4_3 = A1_3.id
      L3_3 = L3_3(L4_3)
      CurrentProperty = L3_3
      L3_3 = Properties
      if L3_3 then
        L3_3 = next
        L4_3 = Properties
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = Properties
          L4_3 = CurrentProperty
          L3_3 = L3_3[L4_3]
          if L3_3 then
            goto lbl_86
          end
        end
      end
      L3_3 = Properties
      L4_3 = CurrentProperty
      L3_3[L4_3] = A1_3
      ::lbl_86::
      if A2_3 then
        L3_3 = Properties
        if L3_3 then
          L3_3 = next
          L4_3 = Properties
          L3_3 = L3_3(L4_3)
          if L3_3 then
            L3_3 = Properties
            L4_3 = tostring
            L5_3 = A2_3.id
            L4_3 = L4_3(L5_3)
            L3_3 = L3_3[L4_3]
            if L3_3 then
              goto lbl_108
            end
          end
        end
        L3_3 = Properties
        L4_3 = tostring
        L5_3 = A2_3.id
        L4_3 = L4_3(L5_3)
        L3_3[L4_3] = A2_3
      end
      ::lbl_108::
      L3_3 = Properties
      L4_3 = tostring
      L5_3 = A1_3.id
      L4_3 = L4_3(L5_3)
      L3_3 = L3_3[L4_3]
      CurrentPropertyData = L3_3
      L3_3 = A1_3.type
      if "shell" == L3_3 then
        L3_3 = CreateObjectNoOffset
        L4_3 = joaat
        L5_3 = A1_3.metadata
        L5_3 = L5_3.shell
        L4_3 = L4_3(L5_3)
        L5_3 = 0.0
        L6_3 = 0.0
        L7_3 = 500.0
        L8_3 = false
        L9_3 = false
        L10_3 = false
        L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
        CurrentShell = L3_3
        while true do
          L3_3 = DoesEntityExist
          L4_3 = CurrentShell
          L3_3 = L3_3(L4_3)
          if L3_3 then
            break
          end
          L3_3 = Wait
          L4_3 = 1
          L3_3(L4_3)
        end
        L3_3 = SetEntityHeading
        L4_3 = CurrentShell
        L5_3 = 0.0
        L3_3(L4_3, L5_3)
        L3_3 = FreezeEntityPosition
        L4_3 = CurrentShell
        L5_3 = true
        L3_3(L4_3, L5_3)
        L3_3 = Property
        L4_3 = L3_3
        L3_3 = L3_3.LoadStaticInteractable
        L5_3 = AvailableShells
        L6_3 = A1_3.metadata
        L6_3 = L6_3.shell
        L5_3 = L5_3[L6_3]
        L3_3(L4_3, L5_3)
      else
        L3_3 = A1_3.type
        if "ipl" == L3_3 then
          L3_3 = A1_3.metadata
          L3_3 = L3_3.ipl
          CurrentIPL = L3_3
          L3_3 = IPL
          L3_3 = L3_3.LoadSettings
          L4_3 = CurrentIPL
          L5_3 = A1_3.metadata
          L5_3 = L5_3.iplTheme
          L6_3 = A1_3.metadata
          L6_3 = L6_3.iplSettings
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = Property
          L4_3 = L3_3
          L3_3 = L3_3.LoadStaticInteractable
          L5_3 = AvailableIPLS
          L6_3 = A1_3.metadata
          L6_3 = L6_3.ipl
          L5_3 = L5_3[L6_3]
          L3_3(L4_3, L5_3)
        end
      end
      L3_3 = TriggerServerEvent
      L4_3 = "vms_housing:sv:enterHouse"
      L5_3 = CurrentProperty
      L3_3(L4_3, L5_3)
      L3_3 = ToggleWeather
      if L3_3 then
        L3_3 = Citizen
        L3_3 = L3_3.CreateThread
        function L4_3()
          local L0_4, L1_4, L2_4
          while true do
            L0_4 = CurrentShell
            if not L0_4 then
              L0_4 = CurrentIPL
              if not L0_4 then
                break
              end
            end
            L0_4 = CurrentShell
            if not L0_4 then
              L0_4 = CurrentIPL
              if not L0_4 then
                goto lbl_21
              end
            end
            L0_4 = ToggleWeather
            L1_4 = true
            L2_4 = A1_3.type
            L2_4 = "ipl" == L2_4
            L0_4(L1_4, L2_4)
            ::lbl_21::
            L0_4 = Citizen
            L0_4 = L0_4.Wait
            L1_4 = 30000
            L0_4(L1_4)
          end
        end
        L3_3(L4_3)
      end
      L3_3 = A1_3.metadata
      L3_3 = L3_3.lightState
      if nil ~= L3_3 then
        L3_3 = SetArtificialLightsState
        L4_3 = A1_3.metadata
        L4_3 = L4_3.lightState
        L4_3 = not L4_3
        L3_3(L4_3)
      end
      if A1_3 then
        L3_3 = A1_3.furniture
        if L3_3 then
          L3_3 = Property
          L4_3 = L3_3
          L3_3 = L3_3.LoadFurniture
          L5_3 = "inside"
          L6_3 = A1_3.furniture
          L7_3 = CurrentProperty
          L3_3(L4_3, L5_3, L6_3, L7_3)
        end
      end
      L3_3 = FreezeEntityPosition
      L4_3 = PlayerPedId
      L4_3 = L4_3()
      L5_3 = false
      L3_3(L4_3, L5_3)
      L3_3 = Property
      L4_3 = L3_3
      L3_3 = L3_3.LoadInteriorInteractable
      L3_3(L4_3)
    else
      L3_3 = A0_2
      if L3_3 then
        L3_3 = A0_2
        L4_3 = false
        L3_3(L4_3)
      end
    end
  end
  L1_2(L2_2, L3_2)
end
SpawnInLastProperty = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = {}
  L1_2 = pairs
  L2_2 = Properties
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.owner
    L8_2 = Identifier
    if L7_2 ~= L8_2 then
      L7_2 = L6_2.renter
      L8_2 = Identifier
      if L7_2 ~= L8_2 then
        goto lbl_20
      end
    end
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L0_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
    ::lbl_20::
  end
  return L0_2
end
GetPlayerProperties = L0_1
L0_1 = exports
L1_1 = "GetPlayerProperties"
L2_1 = GetPlayerProperties
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Properties
  L2_2 = tostring
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2[L2_2]
  if not L1_2 then
    L1_2 = nil
  end
  return L1_2
end
GetProperty = L0_1
L0_1 = exports
L1_1 = "GetProperty"
L2_1 = GetProperty
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "IsPlayerOnPropertyZone"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = GetCurrentPropertyId
  L0_2 = L0_2()
  L1_2 = nil ~= L0_2
  L2_2 = L0_2
  return L1_2, L2_2
end
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "IsPlayerInsideProperty"
function L2_1()
  local L0_2, L1_2
  L0_2 = CurrentProperty
  L1_2 = CurrentPropertyData
  return L0_2, L1_2
end
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "GetConfiguration"
function L2_1(A0_2)
  local L1_2
  L1_2 = Config
  L1_2 = L1_2[A0_2]
  return L1_2
end
L0_1(L1_1, L2_1)
