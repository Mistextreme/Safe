local L0_1, L1_1, L2_1
L0_1 = {}
L0_1.EditingFurniture = false
L0_1.EditingFurnitureObj = nil
L1_1 = {}
L0_1.EditingFurnitureData = L1_1
L0_1.EditingTheme = false
L1_1 = {}
L0_1.LoadedFurnitures = L1_1
L1_1 = {}
L0_1.StaticInteractable = L1_1
L0_1.LastLockedDoors = nil
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = false
  L3_2 = false
  L4_2 = GetCurrentPropertyData
  L4_2 = L4_2()
  if A1_2 then
    L5_2 = L4_2.type
    if "building" == L5_2 then
      L2_2 = true
    else
      L5_2 = L4_2.type
      if "motel" == L5_2 then
        L3_2 = true
      end
    end
    L5_2 = Properties
    L6_2 = tostring
    L7_2 = A1_2
    L6_2 = L6_2(L7_2)
    L4_2 = L5_2[L6_2]
  else
    L5_2 = GetCurrentPropertyId
    L5_2 = L5_2()
    A1_2 = L5_2
  end
  if not L4_2 then
    return
  end
  L5_2 = nil
  L6_2 = nil
  L7_2 = false
  L8_2 = L4_2.type
  if "shell" == L8_2 then
    L8_2 = AvailableShells
    L9_2 = L4_2.metadata
    L9_2 = L9_2.shell
    L8_2 = L8_2[L9_2]
    if L8_2 then
      L8_2 = L8_2.rooms
    end
    if L8_2 then
      L8_2 = AvailableShells
      L9_2 = L4_2.metadata
      L9_2 = L9_2.shell
      L8_2 = L8_2[L9_2]
      L5_2 = L8_2.rooms
  end
  else
    L8_2 = L4_2.type
    if "ipl" == L8_2 then
      L8_2 = AvailableIPLS
      L9_2 = L4_2.metadata
      L9_2 = L9_2.ipl
      L8_2 = L8_2[L9_2]
      if L8_2 then
        L8_2 = L8_2.rooms
      end
      if L8_2 then
        L8_2 = AvailableIPLS
        L9_2 = L4_2.metadata
        L9_2 = L9_2.ipl
        L8_2 = L8_2[L9_2]
        L5_2 = L8_2.rooms
      end
      L8_2 = L4_2.metadata
      L6_2 = L8_2.ipl
      L8_2 = L4_2.metadata
      L7_2 = L8_2.allowChangeTheme
    end
  end
  L8_2 = L4_2.metadata
  L8_2 = L8_2.garage
  L8_2 = nil ~= L8_2
  L9_2 = L4_2.metadata
  L9_2 = L9_2.parking
  L10_2 = nil
  L11_2 = L4_2.object_id
  if L11_2 then
    L11_2 = Properties
    L12_2 = tostring
    L13_2 = L4_2.object_id
    L12_2 = L12_2(L13_2)
    L11_2 = L11_2[L12_2]
    if L11_2 then
      L12_2 = L11_2.metadata
      if L12_2 then
        L12_2 = L12_2.parkingSpaces
      end
      L10_2 = L12_2
    end
  end
  L11_2 = L4_2.sale
  if L11_2 then
    L11_2 = L4_2.sale
    L11_2 = L11_2.active
    if L11_2 then
      L11_2 = L4_2.sale
      L11_2 = L11_2.price
      if L11_2 then
        goto lbl_105
      end
    end
  end
  L11_2 = nil
  ::lbl_105::
  L12_2 = L4_2.rental
  if L12_2 then
    L12_2 = L4_2.rental
    L12_2 = L12_2.active
    if L12_2 then
      L12_2 = L4_2.rental
      L12_2 = L12_2.price
      if L12_2 then
        goto lbl_117
      end
    end
  end
  L12_2 = nil
  ::lbl_117::
  L13_2 = Config
  L13_2 = L13_2.Regions
  L14_2 = L4_2.region
  L13_2 = L13_2[L14_2]
  if L13_2 then
    L13_2 = Config
    L13_2 = L13_2.Regions
    L14_2 = L4_2.region
    L13_2 = L13_2[L14_2]
    L13_2 = L13_2.electricity
    if L13_2 then
      goto lbl_133
    end
  end
  L13_2 = Config
  L13_2 = L13_2.NoRegion
  L13_2 = L13_2.electricity
  ::lbl_133::
  L14_2 = Config
  L14_2 = L14_2.Regions
  L15_2 = L4_2.region
  L14_2 = L14_2[L15_2]
  if L14_2 then
    L14_2 = Config
    L14_2 = L14_2.Regions
    L15_2 = L4_2.region
    L14_2 = L14_2[L15_2]
    L14_2 = L14_2.internet
    if L14_2 then
      goto lbl_149
    end
  end
  L14_2 = Config
  L14_2 = L14_2.NoRegion
  L14_2 = L14_2.internet
  ::lbl_149::
  L15_2 = Config
  L15_2 = L15_2.Regions
  L16_2 = L4_2.region
  L15_2 = L15_2[L16_2]
  if L15_2 then
    L15_2 = Config
    L15_2 = L15_2.Regions
    L16_2 = L4_2.region
    L15_2 = L15_2[L16_2]
    L15_2 = L15_2.water
    if L15_2 then
      goto lbl_165
    end
  end
  L15_2 = Config
  L15_2 = L15_2.NoRegion
  L15_2 = L15_2.water
  ::lbl_165::
  L16_2 = SendNUIMessage
  L17_2 = {}
  L17_2.action = "Property"
  L17_2.actionName = "OpenViewOffer"
  L18_2 = {}
  L18_2.id = A1_2
  L19_2 = L4_2.type
  L18_2.type = L19_2
  L19_2 = L4_2.address
  L18_2.address = L19_2
  L19_2 = L4_2.region
  L18_2.region = L19_2
  L19_2 = L4_2.name
  L18_2.name = L19_2
  L19_2 = L4_2.description
  L18_2.description = L19_2
  L18_2.purchasePrice = L11_2
  L18_2.rentPrice = L12_2
  L18_2.electricity = L13_2
  L18_2.internet = L14_2
  L18_2.water = L15_2
  L19_2 = L4_2.metadata
  if L19_2 then
    L19_2 = L19_2.zone
  end
  if L19_2 then
    L19_2 = L19_2.area
  end
  L18_2.area = L19_2
  L18_2.rooms = L5_2
  L18_2.garage = L8_2
  L18_2.parking = L9_2
  L18_2.parkingSpaces = L10_2
  L18_2.ipl = L6_2
  L18_2.allowChangeTheme = L7_2
  L17_2.data = L18_2
  L16_2(L17_2)
  L16_2 = SetNuiFocus
  L17_2 = true
  L18_2 = true
  L16_2(L17_2, L18_2)
  openedMenu = "PropertyOffer"
end
L0_1.ViewOffer = L1_1
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "Property"
  L1_2.actionName = "CloseViewOffer"
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  openedMenu = nil
  marketplaceOfferId = nil
  isOfferByMarketplace = false
  SelectedApartment = nil
end
L0_1.CloseOffer = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  if not A4_2 then
    L5_2 = A0_2.EditingFurniture
    if not L5_2 then
      L5_2 = A0_2.EditingTheme
      if not L5_2 then
        goto lbl_10
      end
    end
    return
  end
  ::lbl_10::
  if not A4_2 then
    L5_2 = CL
    L5_2 = L5_2.CanEnterHouse
    L5_2 = L5_2()
    if not L5_2 then
      if A3_2 then
        L5_2 = A3_2
        L6_2 = false
        L5_2(L6_2)
      end
      return
    end
  end
  L5_2 = library
  L5_2 = L5_2.Callback
  L6_2 = "vms_housing:canEnterHouse"
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L1_3 = A4_2
    if not L1_3 and not A0_3 then
      L1_3 = A3_2
      if L1_3 then
        L1_3 = A3_2
        L2_3 = false
        L1_3(L2_3)
      end
      return
    end
    L1_3 = CurrentShell
    if L1_3 then
      L1_3 = A3_2
      if L1_3 then
        L1_3 = A3_2
        L2_3 = false
        L1_3(L2_3)
      end
      L1_3 = warn
      L2_3 = "You are already in shell!"
      return L1_3(L2_3)
    end
    L1_3 = CurrentIPL
    if L1_3 then
      L1_3 = A3_2
      if L1_3 then
        L1_3 = A3_2
        L2_3 = false
        L1_3(L2_3)
      end
      L1_3 = warn
      L2_3 = "You are already in IPL!"
      return L1_3(L2_3)
    end
    L1_3 = A1_2.type
    if "shell" == L1_3 then
      L1_3 = AvailableShells
      L2_3 = A1_2.metadata
      L2_3 = L2_3.shell
      L1_3 = L1_3[L2_3]
      if not L1_3 then
        L1_3 = A3_2
        if L1_3 then
          L1_3 = A3_2
          L2_3 = false
          L1_3(L2_3)
        end
        L1_3 = warn
        L2_3 = "Could not find shell \""
        L3_3 = A1_2.metadata
        L3_3 = L3_3.shell
        L4_3 = "\"!"
        L2_3 = L2_3 .. L3_3 .. L4_3
        return L1_3(L2_3)
      end
      L1_3 = library
      L1_3 = L1_3.RequestEntity
      L2_3 = A1_2.metadata
      L2_3 = L2_3.shell
      L1_3 = L1_3(L2_3)
      if not L1_3 then
        L2_3 = A3_2
        if L2_3 then
          L2_3 = A3_2
          L3_3 = false
          L2_3(L3_3)
        end
        L2_3 = warn
        L3_3 = "Failed to load shell \""
        L4_3 = A1_2.metadata
        L4_3 = L4_3.shell
        L5_3 = "\" - make sure it is running!"
        L3_3 = L3_3 .. L4_3 .. L5_3
        return L2_3(L3_3)
      end
    else
      L1_3 = A1_2.type
      if "ipl" == L1_3 then
        L1_3 = AvailableIPLS
        L2_3 = A1_2.metadata
        L2_3 = L2_3.ipl
        L1_3 = L1_3[L2_3]
        if not L1_3 then
          L1_3 = A3_2
          if L1_3 then
            L1_3 = A3_2
            L2_3 = false
            L1_3(L2_3)
          end
          L1_3 = warn
          L2_3 = "Could not find ipl \""
          L3_3 = A1_2.metadata
          L3_3 = L3_3.ipl
          L4_3 = "\"!"
          L2_3 = L2_3 .. L3_3 .. L4_3
          return L1_3(L2_3)
        end
      end
    end
    L1_3 = A0_2
    L2_3 = L1_3
    L1_3 = L1_3.RemoveFurniture
    L1_3(L2_3)
    L1_3 = A3_2
    if L1_3 then
      L1_3 = A3_2
      L2_3 = true
      L1_3(L2_3)
    end
    L1_3 = DoScreenFadeOut
    L2_3 = 1500
    L1_3(L2_3)
    L1_3 = Wait
    L2_3 = 750
    L1_3(L2_3)
    L1_3 = A4_2
    if not L1_3 then
      L1_3 = library
      L1_3 = L1_3.PlayAudio
      L2_3 = "enterHouse"
      L1_3(L2_3)
    end
    L1_3 = Wait
    L2_3 = 750
    L1_3(L2_3)
    L1_3 = FreezeEntityPosition
    L2_3 = PlayerPedId
    L2_3 = L2_3()
    L3_3 = true
    L1_3(L2_3, L3_3)
    L1_3 = A2_2
    if L1_3 then
      L1_3 = tostring
      L2_3 = A2_2
      L1_3 = L1_3(L2_3)
      if L1_3 then
        goto lbl_147
      end
    end
    L1_3 = GetCurrentPropertyId
    L1_3 = L1_3()
    ::lbl_147::
    CurrentProperty = L1_3
    L1_3 = A2_2
    if L1_3 then
      L1_3 = Properties
      L2_3 = tostring
      L3_3 = A2_2
      L2_3 = L2_3(L3_3)
      L1_3 = L1_3[L2_3]
      if L1_3 then
        goto lbl_160
      end
    end
    L1_3 = GetCurrentPropertyData
    L1_3 = L1_3()
    ::lbl_160::
    CurrentPropertyData = L1_3
    L1_3 = A1_2.type
    if "shell" == L1_3 then
      L1_3 = CreateObjectNoOffset
      L2_3 = joaat
      L3_3 = A1_2.metadata
      L3_3 = L3_3.shell
      L2_3 = L2_3(L3_3)
      L3_3 = 0.0
      L4_3 = 0.0
      L5_3 = 500.0
      L6_3 = false
      L7_3 = false
      L8_3 = false
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
      CurrentShell = L1_3
      while true do
        L1_3 = DoesEntityExist
        L2_3 = CurrentShell
        L1_3 = L1_3(L2_3)
        if L1_3 then
          break
        end
        L1_3 = Wait
        L2_3 = 1
        L1_3(L2_3)
      end
      L1_3 = SetEntityHeading
      L2_3 = CurrentShell
      L3_3 = 0.0
      L1_3(L2_3, L3_3)
      L1_3 = FreezeEntityPosition
      L2_3 = CurrentShell
      L3_3 = true
      L1_3(L2_3, L3_3)
      L1_3 = A0_2
      L2_3 = L1_3
      L1_3 = L1_3.LoadStaticInteractable
      L3_3 = AvailableShells
      L4_3 = A1_2.metadata
      L4_3 = L4_3.shell
      L3_3 = L3_3[L4_3]
      L1_3(L2_3, L3_3)
    else
      L1_3 = A1_2.type
      if "ipl" == L1_3 then
        L1_3 = A1_2.metadata
        L1_3 = L1_3.ipl
        CurrentIPL = L1_3
        L1_3 = IPL
        L1_3 = L1_3.LoadSettings
        L2_3 = CurrentIPL
        L3_3 = A1_2.metadata
        L3_3 = L3_3.iplTheme
        L4_3 = A1_2.metadata
        L4_3 = L4_3.iplSettings
        L1_3(L2_3, L3_3, L4_3)
        L1_3 = A0_2
        L2_3 = L1_3
        L1_3 = L1_3.LoadStaticInteractable
        L3_3 = AvailableIPLS
        L4_3 = A1_2.metadata
        L4_3 = L4_3.ipl
        L3_3 = L3_3[L4_3]
        L1_3(L2_3, L3_3)
      end
    end
    L1_3 = TriggerServerEvent
    L2_3 = "vms_housing:sv:enterHouse"
    L3_3 = CurrentProperty
    L1_3(L2_3, L3_3)
    L1_3 = ToggleWeather
    if L1_3 then
      L1_3 = Citizen
      L1_3 = L1_3.CreateThread
      function L2_3()
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
          L2_4 = A1_2.type
          L2_4 = "ipl" == L2_4
          L0_4(L1_4, L2_4)
          ::lbl_21::
          L0_4 = Citizen
          L0_4 = L0_4.Wait
          L1_4 = 30000
          L0_4(L1_4)
        end
      end
      L1_3(L2_3)
    end
    L1_3 = Wait
    L2_3 = 1500
    L1_3(L2_3)
    L1_3 = CurrentPropertyData
    L1_3 = L1_3.metadata
    L1_3 = L1_3.lightState
    if nil ~= L1_3 then
      L1_3 = SetArtificialLightsState
      L2_3 = CurrentPropertyData
      L2_3 = L2_3.metadata
      L2_3 = L2_3.lightState
      L2_3 = not L2_3
      L1_3(L2_3)
    end
    L1_3 = DoScreenFadeIn
    L2_3 = 1500
    L1_3(L2_3)
    L1_3 = A1_2
    if L1_3 then
      L1_3 = A1_2.furniture
      if L1_3 then
        L1_3 = A0_2
        L2_3 = L1_3
        L1_3 = L1_3.LoadFurniture
        L3_3 = "inside"
        L4_3 = A1_2.furniture
        L5_3 = CurrentProperty
        L1_3(L2_3, L3_3, L4_3, L5_3)
      end
    end
    L1_3 = FreezeEntityPosition
    L2_3 = PlayerPedId
    L2_3 = L2_3()
    L3_3 = false
    L1_3(L2_3, L3_3)
  end
  L5_2(L6_2, L7_2)
end
L0_1.EnterProperty = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = DoScreenFadeOut
  L6_2 = 1500
  L5_2(L6_2)
  L5_2 = Wait
  L6_2 = 750
  L5_2(L6_2)
  if not A4_2 then
    L5_2 = library
    L5_2 = L5_2.PlayAudio
    L6_2 = "exitHouse"
    L5_2(L6_2)
  end
  L5_2 = Wait
  L6_2 = 750
  L5_2(L6_2)
  L5_2 = FreezeEntityPosition
  L6_2 = PlayerPedId
  L6_2 = L6_2()
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = TriggerServerEvent
  L6_2 = "vms_housing:sv:exitHouse"
  L7_2 = CurrentProperty
  L8_2 = A2_2
  L9_2 = A3_2
  L10_2 = A4_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = ToggleWeather
  if L5_2 then
    L5_2 = ToggleWeather
    L6_2 = false
    L5_2(L6_2)
  end
  L5_2 = SetArtificialLightsState
  L6_2 = false
  L5_2(L6_2)
  L5_2 = CurrentShell
  if L5_2 then
    L5_2 = DeleteObject
    L6_2 = CurrentShell
    L5_2(L6_2)
    CurrentShell = nil
  end
  L5_2 = CurrentIPL
  if L5_2 then
    L5_2 = IPL
    L5_2 = L5_2.UnloadSettings
    L6_2 = CurrentIPL
    L5_2(L6_2)
    CurrentIPL = nil
  end
  L6_2 = A0_2
  L5_2 = A0_2.RemoveFurniture
  L5_2(L6_2)
  L6_2 = A0_2
  L5_2 = A0_2.RemoveStaticInteractable
  L5_2(L6_2)
  CurrentProperty = nil
  CurrentPropertyData = nil
  L5_2 = Wait
  L6_2 = 1500
  L5_2(L6_2)
  L5_2 = RefreshTargets
  L5_2()
  L5_2 = FreezeEntityPosition
  L6_2 = PlayerPedId
  L6_2 = L6_2()
  L7_2 = false
  L5_2(L6_2, L7_2)
  L5_2 = DoScreenFadeIn
  L6_2 = 1500
  L5_2(L6_2)
  if A1_2 then
    L5_2 = A1_2
    L6_2 = true
    L5_2(L6_2)
  end
end
L0_1.ExitProperty = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  if A2_2 then
    L4_2 = tostring
    L5_2 = A2_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_10
    end
  end
  L4_2 = GetCurrentPropertyId
  L4_2 = L4_2()
  ::lbl_10::
  CurrentProperty = L4_2
  if A2_2 then
    L4_2 = Properties
    L5_2 = tostring
    L6_2 = A2_2
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2[L5_2]
    if L4_2 then
      goto lbl_22
    end
  end
  L4_2 = GetCurrentPropertyData
  L4_2 = L4_2()
  ::lbl_22::
  CurrentPropertyData = L4_2
  if A2_2 then
    L5_2 = A0_2
    L4_2 = A0_2.LoadFurniture
    L6_2 = "inside"
    L7_2 = CurrentPropertyData
    L7_2 = L7_2.furniture
    L8_2 = CurrentProperty
    L4_2(L5_2, L6_2, L7_2, L8_2)
  end
  L4_2 = RefreshTargets
  L4_2()
end
L0_1.EnterPropertyInterior = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = CurrentPropertyData
  L3_2 = L2_2.type
  if "mlo" == L3_2 then
    L3_2 = GetCurrentPropertyData
    L3_2 = L3_2()
    if not L3_2 then
      goto lbl_16
    end
    L3_2 = GetCurrentPropertyData
    L3_2 = L3_2()
    L3_2 = L3_2.type
    if "motel" ~= L3_2 then
      goto lbl_16
    end
  end
  L4_2 = A0_2
  L3_2 = A0_2.RemoveFurniture
  L3_2(L4_2)
  ::lbl_16::
  CurrentProperty = nil
  CurrentPropertyData = nil
  L3_2 = RefreshTargets
  L3_2()
end
L0_1.ExitPropertyInterior = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L4_2 = false
  L5_2 = pairs
  L6_2 = A2_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L10_2.stored
    if 0 == L11_2 then
      L11_2 = L10_2.position
      if L11_2 then
        L11_2 = L10_2.position
        L11_2 = L11_2.environment
        if L11_2 == A1_2 then
          L11_2 = library
          L11_2 = L11_2.SpawnProp
          L12_2 = L10_2.model
          L13_2 = vector3
          L14_2 = L10_2.position
          L14_2 = L14_2.x
          L15_2 = L10_2.position
          L15_2 = L15_2.y
          L16_2 = L10_2.position
          L16_2 = L16_2.z
          L13_2 = L13_2(L14_2, L15_2, L16_2)
          L14_2 = false
          L11_2 = L11_2(L12_2, L13_2, L14_2)
          while true do
            L12_2 = DoesEntityExist
            L13_2 = L11_2
            L12_2 = L12_2(L13_2)
            if L12_2 then
              break
            end
            L12_2 = Citizen
            L12_2 = L12_2.Wait
            L13_2 = 5
            L12_2(L13_2)
          end
          L12_2 = SetEntityCoordsNoOffset
          L13_2 = L11_2
          L14_2 = L10_2.position
          L14_2 = L14_2.x
          L15_2 = L10_2.position
          L15_2 = L15_2.y
          L16_2 = L10_2.position
          L16_2 = L16_2.z
          L12_2(L13_2, L14_2, L15_2, L16_2)
          L12_2 = SetEntityRotation
          L13_2 = L11_2
          L14_2 = L10_2.position
          L14_2 = L14_2.pitch
          L15_2 = L10_2.position
          L15_2 = L15_2.roll
          L16_2 = L10_2.position
          L16_2 = L16_2.yaw
          L17_2 = 0
          L18_2 = false
          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
          L12_2 = SetEntityAsMissionEntity
          L13_2 = L11_2
          L14_2 = true
          L15_2 = true
          L12_2(L13_2, L14_2, L15_2)
          L12_2 = FreezeEntityPosition
          L13_2 = L11_2
          L14_2 = true
          L12_2(L13_2, L14_2)
          L12_2 = next
          L13_2 = L10_2.metadata
          L12_2 = L12_2(L13_2)
          if L12_2 then
            L12_2 = L10_2.metadata
            L12_2 = L12_2.interactableName
            if L12_2 then
              L12_2 = L10_2.metadata
              L12_2 = L12_2.interactableName
              if "device" == L12_2 then
                L12_2 = Config
                L12_2 = L12_2.RequirePurchaseFurniture
                if L12_2 then
                  goto lbl_89
                end
              end
              L12_2 = L10_2.metadata
              L12_2 = L12_2.interactableName
              ::lbl_89::
              if "device" ~= L12_2 then
                L12_2 = {}
                L13_2 = L10_2.metadata
                L13_2 = L13_2.interactableName
                L12_2.interactableName = L13_2
                L13_2 = "furniture-"
                L14_2 = L10_2.id
                L13_2 = L13_2 .. L14_2
                L12_2.name = L13_2
                L13_2 = TRANSLATE
                L14_2 = "target.interactable:"
                L15_2 = L10_2.metadata
                L15_2 = L15_2.interactableName
                L14_2 = L14_2 .. L15_2
                L13_2 = L13_2(L14_2)
                if not L13_2 then
                  L13_2 = L10_2.metadata
                  L13_2 = L13_2.interactableName
                end
                L12_2.label = L13_2
                function L13_2()
                  local L0_3, L1_3, L2_3, L3_3, L4_3
                  L0_3 = CL
                  L0_3 = L0_3.InteractableFurniture
                  L1_3 = L10_2.model
                  L2_3 = L10_2.metadata
                  L2_3 = L2_3.interactableName
                  L3_3 = L10_2.id
                  L4_3 = L10_2.metadata
                  L0_3(L1_3, L2_3, L3_3, L4_3)
                end
                L12_2.action = L13_2
                L13_2 = Config
                L13_2 = L13_2.FurnitureInteractionAccess
                if 2 == L13_2 then
                  function L13_2()
                    local L0_3, L1_3
                    L0_3 = library
                    L0_3 = L0_3.HasAnyPermission
                    L1_3 = A3_2
                    return L0_3(L1_3)
                  end
                  L12_2.canInteract = L13_2
                else
                  L13_2 = Config
                  L13_2 = L13_2.FurnitureInteractionAccess
                  if 3 == L13_2 then
                    function L13_2()
                      local L0_3, L1_3, L2_3
                      L0_3 = library
                      L0_3 = L0_3.HasPermissions
                      L1_3 = A3_2
                      L2_3 = "furniture"
                      return L0_3(L1_3, L2_3)
                    end
                    L12_2.canInteract = L13_2
                  end
                end
                L13_2 = CL
                L13_2 = L13_2.Target
                L14_2 = "entity"
                L15_2 = {}
                L15_2.entity = L11_2
                L16_2 = {}
                L17_2 = L12_2
                L16_2[1] = L17_2
                L15_2.options = L16_2
                L13_2(L14_2, L15_2)
              end
            end
          end
          L12_2 = table
          L12_2 = L12_2.insert
          L13_2 = A0_2.LoadedFurnitures
          L14_2 = {}
          L14_2.entity = L11_2
          L15_2 = L10_2.model
          L14_2.model = L15_2
          L15_2 = L10_2.id
          L14_2.furnitureId = L15_2
          L15_2 = L10_2.metadata
          L14_2.metadata = L15_2
          L12_2(L13_2, L14_2)
      end
    end
    else
      L11_2 = Config
      L11_2 = L11_2.RequirePurchaseFurniture
      if L11_2 then
        L11_2 = Config
        L11_2 = L11_2.DeliveryType
        if 3 == L11_2 and not L4_2 then
          L11_2 = L10_2.stored
          if 1 == L11_2 then
            L11_2 = L10_2.metadata
            if L11_2 then
              L11_2 = L10_2.metadata
              L11_2 = L11_2.delivered
              if L11_2 then
                L11_2 = CurrentPropertyData
                if not L11_2 then
                  L11_2 = GetCurrentPropertyData
                  L11_2 = L11_2()
                end
                L12_2 = L11_2.metadata
                if L12_2 then
                  L12_2 = L11_2.metadata
                  L12_2 = L12_2.deliveryType
                  if L12_2 then
                    L12_2 = L11_2.metadata
                    L12_2 = L12_2.deliveryType
                    if L12_2 == A1_2 then
                      L12_2 = L11_2.metadata
                      L12_2 = L12_2.delivery
                      if L12_2 then
                        L4_2 = true
                        L12_2 = library
                        L12_2 = L12_2.SpawnProp
                        L13_2 = Config
                        L13_2 = L13_2.DeliveryObject
                        L14_2 = vector3
                        L15_2 = L11_2.metadata
                        L15_2 = L15_2.delivery
                        L15_2 = L15_2.x
                        L16_2 = L11_2.metadata
                        L16_2 = L16_2.delivery
                        L16_2 = L16_2.y
                        L17_2 = L11_2.metadata
                        L17_2 = L17_2.delivery
                        L17_2 = L17_2.z
                        L14_2 = L14_2(L15_2, L16_2, L17_2)
                        L15_2 = false
                        L12_2 = L12_2(L13_2, L14_2, L15_2)
                        while true do
                          L13_2 = DoesEntityExist
                          L14_2 = L12_2
                          L13_2 = L13_2(L14_2)
                          if L13_2 then
                            break
                          end
                          L13_2 = Citizen
                          L13_2 = L13_2.Wait
                          L14_2 = 5
                          L13_2(L14_2)
                        end
                        L13_2 = SetEntityCoordsNoOffset
                        L14_2 = L12_2
                        L15_2 = L11_2.metadata
                        L15_2 = L15_2.delivery
                        L15_2 = L15_2.x
                        L16_2 = L11_2.metadata
                        L16_2 = L16_2.delivery
                        L16_2 = L16_2.y
                        L17_2 = L11_2.metadata
                        L17_2 = L17_2.delivery
                        L17_2 = L17_2.z
                        L13_2(L14_2, L15_2, L16_2, L17_2)
                        L13_2 = SetEntityHeading
                        L14_2 = L12_2
                        L15_2 = L11_2.metadata
                        L15_2 = L15_2.delivery
                        L15_2 = L15_2.w
                        L13_2(L14_2, L15_2)
                        L13_2 = SetEntityAsMissionEntity
                        L14_2 = L12_2
                        L15_2 = true
                        L16_2 = true
                        L13_2(L14_2, L15_2, L16_2)
                        L13_2 = FreezeEntityPosition
                        L14_2 = L12_2
                        L15_2 = true
                        L13_2(L14_2, L15_2)
                        L13_2 = CL
                        L13_2 = L13_2.Target
                        L14_2 = "entity"
                        L15_2 = {}
                        L15_2.entity = L12_2
                        L16_2 = {}
                        L17_2 = {}
                        L17_2.interactableName = "delivery"
                        L17_2.name = "furniture-delivery"
                        L18_2 = TRANSLATE
                        L19_2 = "target.interactable:delivery"
                        L18_2 = L18_2(L19_2)
                        L17_2.label = L18_2
                        function L18_2()
                          local L0_3, L1_3
                          L0_3 = A0_2.UnpackDelivery
                          L1_3 = L12_2
                          L0_3(L1_3)
                        end
                        L17_2.action = L18_2
                        function L18_2()
                          local L0_3, L1_3
                          L0_3 = library
                          L0_3 = L0_3.HasAnyPermission
                          L1_3 = A3_2
                          return L0_3(L1_3)
                        end
                        L17_2.canInteract = L18_2
                        L16_2[1] = L17_2
                        L15_2.options = L16_2
                        L13_2(L14_2, L15_2)
                        L13_2 = table
                        L13_2 = L13_2.insert
                        L14_2 = A0_2.LoadedFurnitures
                        L15_2 = {}
                        L15_2.entity = L12_2
                        L15_2.furnitureId = "delivery"
                        L13_2(L14_2, L15_2)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if "outside" == A1_2 then
    L5_2 = GetCurrentPropertyData
    L5_2 = L5_2()
    if L5_2 then
      L6_2 = L5_2.metadata
      L6_2 = L6_2.lockdown
      if L6_2 then
        L6_2 = false
        L7_2 = L5_2.object_id
        if L7_2 then
          L7_2 = Properties
          L8_2 = L5_2.object_id
          L7_2 = L7_2[L8_2]
          L8_2 = L7_2.type
          if "building" == L8_2 then
            L6_2 = true
          end
        end
        if not L6_2 then
          L7_2 = library
          L7_2 = L7_2.SpawnProp
          L8_2 = Config
          L8_2 = L8_2.PropertyLockdown
          L8_2 = L8_2.ObjectModel
          L9_2 = vector3
          L10_2 = L5_2.metadata
          L10_2 = L10_2.exit
          L10_2 = L10_2.x
          L11_2 = L5_2.metadata
          L11_2 = L11_2.exit
          L11_2 = L11_2.y
          L12_2 = L5_2.metadata
          L12_2 = L12_2.exit
          L12_2 = L12_2.z
          L12_2 = L12_2 - 0.12
          L9_2 = L9_2(L10_2, L11_2, L12_2)
          L10_2 = false
          L7_2 = L7_2(L8_2, L9_2, L10_2)
          while true do
            L8_2 = DoesEntityExist
            L9_2 = L7_2
            L8_2 = L8_2(L9_2)
            if L8_2 then
              break
            end
            L8_2 = Citizen
            L8_2 = L8_2.Wait
            L9_2 = 5
            L8_2(L9_2)
          end
          L8_2 = SetEntityCoordsNoOffset
          L9_2 = L7_2
          L10_2 = L5_2.metadata
          L10_2 = L10_2.exit
          L10_2 = L10_2.x
          L11_2 = L5_2.metadata
          L11_2 = L11_2.exit
          L11_2 = L11_2.y
          L12_2 = L5_2.metadata
          L12_2 = L12_2.exit
          L12_2 = L12_2.z
          L12_2 = L12_2 - 0.12
          L8_2(L9_2, L10_2, L11_2, L12_2)
          L8_2 = SetEntityHeading
          L9_2 = L7_2
          L10_2 = L5_2.metadata
          L10_2 = L10_2.exit
          L10_2 = L10_2.w
          L8_2(L9_2, L10_2)
          L8_2 = SetEntityAsMissionEntity
          L9_2 = L7_2
          L10_2 = true
          L11_2 = true
          L8_2(L9_2, L10_2, L11_2)
          L8_2 = FreezeEntityPosition
          L9_2 = L7_2
          L10_2 = true
          L8_2(L9_2, L10_2)
          L8_2 = table
          L8_2 = L8_2.insert
          L9_2 = A0_2.LoadedFurnitures
          L10_2 = {}
          L10_2.entity = L7_2
          L10_2.furnitureId = "lockdown"
          L8_2(L9_2, L10_2)
        end
      end
    end
  end
end
L0_1.LoadFurniture = L1_1
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = next
  L4_2 = A0_2.LoadedFurnitures
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    if A2_2 then
      L3_2 = A2_2
      L3_2()
    end
    return
  end
  if A1_2 then
    L3_2 = ipairs
    L4_2 = A0_2.LoadedFurnitures
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.furnitureId
      if L9_2 == A1_2 then
        L9_2 = L8_2.entity
        if L9_2 then
          L9_2 = CL
          L9_2 = L9_2.Target
          L10_2 = "remove-entity"
          L11_2 = L8_2.entity
          L9_2(L10_2, L11_2)
          L9_2 = DeleteObject
          L10_2 = L8_2.entity
          L9_2(L10_2)
          L9_2 = table
          L9_2 = L9_2.remove
          L10_2 = A0_2.LoadedFurnitures
          L11_2 = L7_2
          L9_2(L10_2, L11_2)
          break
        end
      end
    end
  else
    L3_2 = ipairs
    L4_2 = A0_2.LoadedFurnitures
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.entity
      if L9_2 then
        L9_2 = CL
        L9_2 = L9_2.Target
        L10_2 = "remove-entity"
        L11_2 = L8_2.entity
        L9_2(L10_2, L11_2)
        L9_2 = DeleteObject
        L10_2 = L8_2.entity
        L9_2(L10_2)
      end
    end
    L3_2 = {}
    A0_2.LoadedFurnitures = L3_2
  end
  if A2_2 then
    L3_2 = A2_2
    L3_2()
  end
end
L0_1.RemoveFurniture = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TriggerServerEvent
  L2_2 = "vms_housing:sv:toggleLight"
  L3_2 = CurrentProperty
  L1_2(L2_2, L3_2)
end
L0_1.ToggleLight = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = Property
  L4_2 = L4_2.LastLockedDoors
  if L4_2 then
    L4_2 = Property
    L4_2 = L4_2.LastLockedDoors
    if not L4_2 then
      goto lbl_34
    end
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    L5_2 = Property
    L5_2 = L5_2.LastLockedDoors
    if not (L4_2 > L5_2) then
      goto lbl_34
    end
  end
  L4_2 = TriggerServerEvent
  L5_2 = "vms_housing:sv:toggleLock"
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = GetCurrentPropertyId
    L6_2 = L6_2()
    if not L6_2 then
      L6_2 = CurrentProperty
    end
  end
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = Property
  L5_2 = GetGameTimer
  L5_2 = L5_2()
  L5_2 = L5_2 + 2000
  L4_2.LastLockedDoors = L5_2
  goto lbl_42
  ::lbl_34::
  L4_2 = CL
  L4_2 = L4_2.Notification
  L5_2 = TRANSLATE
  L6_2 = "notify.doors:wait"
  L5_2 = L5_2(L6_2)
  L6_2 = 3500
  L7_2 = "info"
  L4_2(L5_2, L6_2, L7_2)
  ::lbl_42::
end
L0_1.ToggleLock = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = CL
  L2_2 = L2_2.Target
  L3_2 = "remove-entity"
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
  L2_2 = library
  L2_2 = L2_2.PlayAnimation
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = "anim@scripted@ulp_missions@empty_crate@male@"
  L5_2 = "action"
  L6_2 = 8.0
  L7_2 = 1.0
  L8_2 = 3800
  L9_2 = 1
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L2_2 = Citizen
  L2_2 = L2_2.Wait
  L3_2 = 3650
  L2_2(L3_2)
  L2_2 = TriggerServerEvent
  L3_2 = "vms_housing:sv:unpackDelivery"
  L4_2 = CurrentProperty
  if not L4_2 then
    L4_2 = GetCurrentPropertyId
    L4_2 = L4_2()
  end
  L2_2(L3_2, L4_2)
end
L0_1.UnpackDelivery = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = CurrentProperty
  if L1_2 then
    L1_2 = CurrentPropertyData
    if L1_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L1_2 = CurrentPropertyData
  L1_2 = L1_2.type
  if "shell" ~= L1_2 then
    L1_2 = CurrentPropertyData
    L1_2 = L1_2.type
    if "ipl" ~= L1_2 then
      return
    end
  end
  L1_2 = nil
  L2_2 = CurrentPropertyData
  L2_2 = L2_2.object_id
  if L2_2 then
    L2_2 = Properties
    L3_2 = tostring
    L4_2 = CurrentPropertyData
    L4_2 = L4_2.object_id
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2[L3_2]
    if L2_2 then
      L3_2 = L2_2.type
      if "building" == L3_2 then
        L1_2 = L2_2
      end
    end
  end
  L2_2 = 1
  L3_2 = TargetPoints
  L3_2 = #L3_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = TargetPoints
    L6_2 = L6_2[L5_2]
    L6_2 = L6_2.type
    if "zone" == L6_2 then
      L6_2 = CL
      L6_2 = L6_2.Target
      L7_2 = "remove-zone"
      L8_2 = TargetPoints
      L8_2 = L8_2[L5_2]
      L8_2 = L8_2.id
      L6_2(L7_2, L8_2)
    end
  end
  L2_2 = {}
  TargetPoints = L2_2
  L2_2 = {}
  L3_2 = library
  L3_2 = L3_2.HasAnyPermission
  L4_2 = CurrentProperty
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
      L0_3 = CurrentPropertyData
      L0_3 = L0_3.metadata
      L0_3 = L0_3.lockdown
      L0_3 = not L0_3
      return L0_3
    end
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2(L6_2, L7_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L3_2 = library
  L3_2 = L3_2.HasPermissions
  L4_2 = CurrentProperty
  L5_2 = "furniture"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = CurrentPropertyData
    L3_2 = L3_2.metadata
    L3_2 = L3_2.allowFurnitureInside
    if L3_2 then
      L3_2 = table
      L3_2 = L3_2.insert
      L4_2 = L2_2
      L5_2 = TargetHandler
      L5_2 = L5_2.Furniture
      function L6_2()
        local L0_3, L1_3
        L0_3 = CurrentPropertyData
        L0_3 = L0_3.metadata
        L0_3 = L0_3.lockdown
        L0_3 = not L0_3
        return L0_3
      end
      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2(L6_2)
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    end
  end
  L3_2 = CurrentPropertyData
  L3_2 = L3_2.metadata
  if L3_2 then
    L3_2 = L3_2.wardrobe
  end
  if L3_2 then
    L3_2 = L3_2.x
  end
  if L3_2 then
    L3_2 = table
    L3_2 = L3_2.insert
    L4_2 = TargetPoints
    L5_2 = TargetHandler
    L5_2 = L5_2.Wardrobe
    L6_2 = CurrentProperty
    L7_2 = CurrentPropertyData
    L7_2 = L7_2.metadata
    L7_2 = L7_2.wardrobe
    L7_2 = L7_2.x
    L8_2 = CurrentPropertyData
    L8_2 = L8_2.metadata
    L8_2 = L8_2.wardrobe
    L8_2 = L8_2.y
    L9_2 = CurrentPropertyData
    L9_2 = L9_2.metadata
    L9_2 = L9_2.wardrobe
    L9_2 = L9_2.z
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L3_2 = CurrentPropertyData
  L3_2 = L3_2.metadata
  if L3_2 then
    L3_2 = L3_2.storage
  end
  if L3_2 then
    L3_2 = L3_2.x
  end
  if L3_2 then
    L3_2 = table
    L3_2 = L3_2.insert
    L4_2 = TargetPoints
    L5_2 = TargetHandler
    L5_2 = L5_2.Storage
    L6_2 = CurrentProperty
    L7_2 = CurrentPropertyData
    L7_2 = L7_2.metadata
    L7_2 = L7_2.storage
    L7_2 = L7_2.x
    L8_2 = CurrentPropertyData
    L8_2 = L8_2.metadata
    L8_2 = L8_2.storage
    L8_2 = L8_2.y
    L9_2 = CurrentPropertyData
    L9_2 = L9_2.metadata
    L9_2 = L9_2.storage
    L9_2 = L9_2.z
    L10_2 = CurrentPropertyData
    L10_2 = L10_2.metadata
    L10_2 = L10_2.storage
    L10_2 = L10_2.slots
    L11_2 = CurrentPropertyData
    L11_2 = L11_2.metadata
    L11_2 = L11_2.storage
    L11_2 = L11_2.weight
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L3_2 = CurrentPropertyData
  L3_2 = L3_2.metadata
  if L3_2 then
    L3_2 = L3_2.emergencyInside
  end
  if L3_2 then
    L3_2 = L3_2.x
  end
  if L3_2 then
    L3_2 = table
    L3_2 = L3_2.insert
    L4_2 = TargetPoints
    L5_2 = {}
    L5_2.type = "emergency_exit"
    L6_2 = CL
    L6_2 = L6_2.Target
    L7_2 = "zone"
    L8_2 = {}
    L9_2 = vector3
    L10_2 = CurrentPropertyData
    L10_2 = L10_2.metadata
    L10_2 = L10_2.emergencyInside
    L10_2 = L10_2.x
    L11_2 = CurrentPropertyData
    L11_2 = L11_2.metadata
    L11_2 = L11_2.emergencyInside
    L11_2 = L11_2.y
    L12_2 = CurrentPropertyData
    L12_2 = L12_2.metadata
    L12_2 = L12_2.emergencyInside
    L12_2 = L12_2.z
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L8_2.coords = L9_2
    L9_2 = vec
    L10_2 = 1.5
    L11_2 = 1.5
    L12_2 = 2.0
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L8_2.size = L9_2
    L8_2.rotation = 0.0
    L9_2 = {}
    L10_2 = {}
    L10_2.name = "property-emergency-exit"
    L10_2.icon = "fa-solid fa-person-through-window"
    L11_2 = TRANSLATE
    L12_2 = "target.emergency_exit"
    L11_2 = L11_2(L12_2)
    L10_2.label = L11_2
    function L11_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      L0_3 = A0_2.EditingFurniture
      if not L0_3 then
        L0_3 = A0_2.EditingTheme
        if not L0_3 then
          goto lbl_16
        end
      end
      L0_3 = CL
      L0_3 = L0_3.Notification
      L1_3 = TRANSLATE
      L2_3 = "notify.furniture:you_are_in_furniture_mode"
      L1_3 = L1_3(L2_3)
      L2_3 = 5000
      L3_3 = "info"
      do return L0_3(L1_3, L2_3, L3_3) end
      ::lbl_16::
      L0_3 = A0_2
      L1_3 = L0_3
      L0_3 = L0_3.ExitProperty
      L2_3 = nil
      L3_3 = false
      L4_3 = false
      L5_3 = true
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    end
    L10_2.action = L11_2
    L9_2[1] = L10_2
    L8_2.options = L9_2
    L6_2 = L6_2(L7_2, L8_2)
    L5_2.id = L6_2
    L3_2(L4_2, L5_2)
  end
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = {}
  L5_2.name = "property-door-peephole"
  L5_2.icon = "fa-solid fa-video"
  L6_2 = TRANSLATE
  L7_2 = "target.door_peephole"
  L6_2 = L6_2(L7_2)
  L5_2.label = L6_2
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = A0_2.EditingFurniture
    if not L0_3 then
      L0_3 = A0_2.EditingTheme
      if not L0_3 then
        goto lbl_16
      end
    end
    L0_3 = CL
    L0_3 = L0_3.Notification
    L1_3 = TRANSLATE
    L2_3 = "notify.furniture:you_are_in_furniture_mode"
    L1_3 = L1_3(L2_3)
    L2_3 = 5000
    L3_3 = "info"
    do return L0_3(L1_3, L2_3, L3_3) end
    ::lbl_16::
    L0_3 = A0_2
    L1_3 = L0_3
    L0_3 = L0_3.OpenDoorPeephole
    L0_3(L1_3)
  end
  L5_2.action = L6_2
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = {}
  L5_2.name = "property-light"
  L5_2.icon = "fa-solid fa-lightbulb"
  L6_2 = TRANSLATE
  L7_2 = "target.toggle_light"
  L6_2 = L6_2(L7_2)
  L5_2.label = L6_2
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = A0_2.EditingFurniture
    if not L0_3 then
      L0_3 = A0_2.EditingTheme
      if not L0_3 then
        goto lbl_16
      end
    end
    L0_3 = CL
    L0_3 = L0_3.Notification
    L1_3 = TRANSLATE
    L2_3 = "notify.furniture:you_are_in_furniture_mode"
    L1_3 = L1_3(L2_3)
    L2_3 = 5000
    L3_3 = "info"
    do return L0_3(L1_3, L2_3, L3_3) end
    ::lbl_16::
    L0_3 = Config
    L0_3 = L0_3.UseServiceBills
    if L0_3 then
      L0_3 = CurrentPropertyData
      L0_3 = L0_3.unpaidBills
      L1_3 = Config
      L1_3 = L1_3.AllowedUnpaidBills
      if L0_3 >= L1_3 then
        L0_3 = CL
        L0_3 = L0_3.Notification
        L1_3 = TRANSLATE
        L2_3 = "notify.property:no_electricity"
        L1_3 = L1_3(L2_3)
        L2_3 = 4000
        L3_3 = "info"
        return L0_3(L1_3, L2_3, L3_3)
      end
    end
    L0_3 = A0_2.ToggleLight
    L0_3()
  end
  L5_2.action = L6_2
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = TargetHandler
  L5_2 = L5_2.ToggleLock
  L6_2 = nil
  function L7_2()
    local L0_3, L1_3
    L0_3 = CurrentPropertyData
    L0_3 = L0_3.metadata
    L0_3 = L0_3.lockdown
    L0_3 = not L0_3
    return L0_3
  end
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2(L6_2, L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = {}
  L5_2.name = "property-exit"
  L5_2.icon = "fa-solid fa-door-open"
  L6_2 = TRANSLATE
  L7_2 = "target.exit"
  L6_2 = L6_2(L7_2)
  L5_2.label = L6_2
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = A0_2.EditingFurniture
    if not L0_3 then
      L0_3 = A0_2.EditingTheme
      if not L0_3 then
        goto lbl_16
      end
    end
    L0_3 = CL
    L0_3 = L0_3.Notification
    L1_3 = TRANSLATE
    L2_3 = "notify.furniture:you_are_in_furniture_mode"
    L1_3 = L1_3(L2_3)
    L2_3 = 5000
    L3_3 = "info"
    do return L0_3(L1_3, L2_3, L3_3) end
    ::lbl_16::
    L0_3 = CL
    L0_3 = L0_3.CanExitHouse
    L0_3 = L0_3()
    if not L0_3 then
      return
    end
    L0_3 = library
    L0_3 = L0_3.Callback
    L1_3 = "vms_housing:canExitHouse"
    function L2_3(A0_4)
      local L1_4, L2_4
      if not A0_4 then
        return
      end
      L1_4 = A0_2
      L2_4 = L1_4
      L1_4 = L1_4.ExitProperty
      L1_4(L2_4)
    end
    L0_3(L1_3, L2_3)
  end
  L5_2.action = L6_2
  function L6_2()
    local L0_3, L1_3
    L0_3 = CurrentPropertyData
    L0_3 = L0_3.metadata
    L0_3 = L0_3.locked
    L0_3 = not L0_3
    return L0_3
  end
  L5_2.canInteract = L6_2
  L3_2(L4_2, L5_2)
  L3_2 = Config
  L3_2 = L3_2.Garages
  if "vms_garagesv2" == L3_2 and L1_2 then
    L3_2 = L1_2.metadata
    if L3_2 then
      L3_2 = L1_2.metadata
      L3_2 = L3_2.parkingEnter
      if L3_2 then
        L3_2 = L1_2.metadata
        L3_2 = L3_2.parkingSpaces
        if L3_2 then
          L3_2 = pairs
          L4_2 = L1_2.metadata
          L4_2 = L4_2.parkingSpaces
          L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
          for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
            L9_2 = table
            L9_2 = L9_2.insert
            L10_2 = L2_2
            L11_2 = {}
            L12_2 = "property-garage-"
            L13_2 = L7_2
            L12_2 = L12_2 .. L13_2
            L11_2.name = L12_2
            L11_2.icon = "fa-solid fa-warehouse"
            L12_2 = TRANSLATE
            L13_2 = "target.enter_underground_parking"
            L14_2 = L7_2
            L12_2 = L12_2(L13_2, L14_2)
            L11_2.label = L12_2
            function L12_2(A0_3)
              local L1_3, L2_3, L3_3, L4_3, L5_3
              L1_3 = CurrentProperty
              L2_3 = A0_2.EditingFurniture
              if not L2_3 then
                L2_3 = A0_2.EditingTheme
                if not L2_3 then
                  goto lbl_17
                end
              end
              L2_3 = CL
              L2_3 = L2_3.Notification
              L3_3 = TRANSLATE
              L4_3 = "notify.furniture:you_are_in_furniture_mode"
              L3_3 = L3_3(L4_3)
              L4_3 = 5000
              L5_3 = "info"
              do return L2_3(L3_3, L4_3, L5_3) end
              ::lbl_17::
              L2_3 = CL
              L2_3 = L2_3.CanExitHouse
              L2_3 = L2_3()
              if not L2_3 then
                return
              end
              L2_3 = library
              L2_3 = L2_3.Callback
              L3_3 = "vms_housing:canExitHouse"
              function L4_3(A0_4)
                local L1_4, L2_4, L3_4, L4_4, L5_4
                if not A0_4 then
                  return
                end
                L1_4 = A0_2
                L2_4 = L1_4
                L1_4 = L1_4.ExitProperty
                function L3_4()
                  local L0_5, L1_5, L2_5, L3_5, L4_5, L5_5
                  L0_5 = exports
                  L0_5 = L0_5.vms_garagesv2
                  L1_5 = L0_5
                  L0_5 = L0_5.enterApartmentParking
                  L2_5 = "vms_housing:parking:"
                  L3_5 = L1_2.id
                  L4_5 = ":"
                  L5_5 = L7_2
                  L2_5 = L2_5 .. L3_5 .. L4_5 .. L5_5
                  L0_5(L1_5, L2_5)
                end
                L4_4 = false
                L5_4 = true
                L1_4(L2_4, L3_4, L4_4, L5_4)
              end
              L2_3(L3_3, L4_3)
            end
            L11_2.action = L12_2
            function L12_2()
              local L0_3, L1_3
              L0_3 = CurrentPropertyData
              L0_3 = L0_3.metadata
              L0_3 = L0_3.locked
              L0_3 = not L0_3
              return L0_3
            end
            L11_2.canInteract = L12_2
            L9_2(L10_2, L11_2)
          end
        end
      end
    end
  end
  L3_2 = CurrentPropertyData
  L3_2 = L3_2.type
  if "shell" == L3_2 then
    L3_2 = table
    L3_2 = L3_2.insert
    L4_2 = TargetPoints
    L5_2 = {}
    L5_2.type = "zone"
    L6_2 = CL
    L6_2 = L6_2.Target
    L7_2 = "zone"
    L8_2 = {}
    L9_2 = vector3
    L10_2 = AvailableShells
    L11_2 = CurrentPropertyData
    L11_2 = L11_2.metadata
    L11_2 = L11_2.shell
    L10_2 = L10_2[L11_2]
    L10_2 = L10_2.doors
    L10_2 = L10_2.x
    L11_2 = AvailableShells
    L12_2 = CurrentPropertyData
    L12_2 = L12_2.metadata
    L12_2 = L12_2.shell
    L11_2 = L11_2[L12_2]
    L11_2 = L11_2.doors
    L11_2 = L11_2.y
    L12_2 = AvailableShells
    L13_2 = CurrentPropertyData
    L13_2 = L13_2.metadata
    L13_2 = L13_2.shell
    L12_2 = L12_2[L13_2]
    L12_2 = L12_2.doors
    L12_2 = L12_2.z
    L12_2 = L12_2 + 1.5
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L8_2.coords = L9_2
    L9_2 = vec
    L10_2 = 1.5
    L11_2 = 2.1
    L12_2 = 2.0
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L8_2.size = L9_2
    L9_2 = AvailableShells
    L10_2 = CurrentPropertyData
    L10_2 = L10_2.metadata
    L10_2 = L10_2.shell
    L9_2 = L9_2[L10_2]
    L9_2 = L9_2.doors
    L9_2 = L9_2.heading
    L8_2.rotation = L9_2
    L8_2.options = L2_2
    L6_2 = L6_2(L7_2, L8_2)
    L5_2.id = L6_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = CurrentPropertyData
    L3_2 = L3_2.type
    if "ipl" == L3_2 then
      L3_2 = table
      L3_2 = L3_2.insert
      L4_2 = TargetPoints
      L5_2 = {}
      L5_2.type = "zone"
      L6_2 = CL
      L6_2 = L6_2.Target
      L7_2 = "zone"
      L8_2 = {}
      L9_2 = vector3
      L10_2 = AvailableIPLS
      L11_2 = CurrentPropertyData
      L11_2 = L11_2.metadata
      L11_2 = L11_2.ipl
      L10_2 = L10_2[L11_2]
      L10_2 = L10_2.doors
      L10_2 = L10_2.x
      L11_2 = AvailableIPLS
      L12_2 = CurrentPropertyData
      L12_2 = L12_2.metadata
      L12_2 = L12_2.ipl
      L11_2 = L11_2[L12_2]
      L11_2 = L11_2.doors
      L11_2 = L11_2.y
      L12_2 = AvailableIPLS
      L13_2 = CurrentPropertyData
      L13_2 = L13_2.metadata
      L13_2 = L13_2.ipl
      L12_2 = L12_2[L13_2]
      L12_2 = L12_2.doors
      L12_2 = L12_2.z
      L12_2 = L12_2 + 1.5
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2.coords = L9_2
      L9_2 = vec
      L10_2 = 1.5
      L11_2 = 2.1
      L12_2 = 2.0
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2.size = L9_2
      L9_2 = AvailableIPLS
      L10_2 = CurrentPropertyData
      L10_2 = L10_2.metadata
      L10_2 = L10_2.ipl
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.doors
      L9_2 = L9_2.heading
      L8_2.rotation = L9_2
      L8_2.options = L2_2
      L6_2 = L6_2(L7_2, L8_2)
      L5_2.id = L6_2
      L3_2(L4_2, L5_2)
    end
  end
end
L0_1.LoadInteriorInteractable = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = A1_2.interactable
  if not L2_2 then
    return
  end
  L2_2 = pairs
  L3_2 = A1_2.interactable
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = {}
    L9_2 = pairs
    L10_2 = L7_2.options
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = {}
      L16_2 = L14_2.type
      L15_2.name = L16_2
      L16_2 = L14_2.targetIcon
      L15_2.icon = L16_2
      L16_2 = TRANSLATE
      L17_2 = "target.interactable:"
      L18_2 = L14_2.type
      L17_2 = L17_2 .. L18_2
      L16_2 = L16_2(L17_2)
      L15_2.label = L16_2
      L15_2.distance = 1.0
      function L16_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
        L0_3 = library
        L0_3 = L0_3.Callback
        L1_3 = "vms_housing:useStaticInteractable"
        function L2_3(A0_4)
          local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4
          if not A0_4 then
            return
          end
          L1_4 = CL
          L1_4 = L1_4.InteractableFurniture
          L2_4 = nil
          L3_4 = L14_2.type
          L4_4 = nil
          L5_4 = {}
          L6_4 = L7_2
          L5_4.data = L6_4
          L6_4 = L14_2
          L5_4.option = L6_4
          L1_4(L2_4, L3_4, L4_4, L5_4)
        end
        L3_3 = CurrentProperty
        L4_3 = L6_2
        L5_3 = L14_2.timeUsage
        L6_3 = L14_2.waterUsage
        L7_3 = L14_2.billType
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
      end
      L15_2.action = L16_2
      L16_2 = Config
      L16_2 = L16_2.StaticInteractionAccess
      if 2 == L16_2 then
        function L16_2()
          local L0_3, L1_3
          L0_3 = library
          L0_3 = L0_3.HasAnyPermission
          L1_3 = CurrentProperty
          return L0_3(L1_3)
        end
        L15_2.canInteract = L16_2
      else
        L16_2 = Config
        L16_2 = L16_2.StaticInteractionAccess
        if 3 == L16_2 then
          function L16_2()
            local L0_3, L1_3, L2_3
            L0_3 = library
            L0_3 = L0_3.HasPermissions
            L1_3 = CurrentProperty
            L2_3 = "furniture"
            return L0_3(L1_3, L2_3)
          end
          L15_2.canInteract = L16_2
        end
      end
      L16_2 = table
      L16_2 = L16_2.insert
      L17_2 = L8_2
      L18_2 = L15_2
      L16_2(L17_2, L18_2)
    end
    L9_2 = table
    L9_2 = L9_2.insert
    L10_2 = A0_2.StaticInteractable
    L11_2 = {}
    L12_2 = L7_2.type
    L11_2.type = L12_2
    L12_2 = L7_2.coords
    L11_2.coords = L12_2
    L12_2 = CL
    L12_2 = L12_2.Target
    L13_2 = "zone"
    L14_2 = {}
    L15_2 = L7_2.target
    L14_2.coords = L15_2
    L15_2 = L7_2.target
    L15_2 = L15_2.w
    L14_2.rotation = L15_2
    L15_2 = L7_2.targetSize
    L14_2.size = L15_2
    L14_2.options = L8_2
    L12_2 = L12_2(L13_2, L14_2)
    L11_2.id = L12_2
    L9_2(L10_2, L11_2)
  end
end
L0_1.LoadStaticInteractable = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = A0_2.StaticInteractable
  if L1_2 then
    L1_2 = next
    L2_2 = A0_2.StaticInteractable
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = pairs
      L2_2 = A0_2.StaticInteractable
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L7_2 = CL
        L7_2 = L7_2.Target
        L8_2 = "remove-zone"
        L9_2 = L6_2.id
        L7_2(L8_2, L9_2)
      end
    end
  end
  L1_2 = {}
  A0_2.StaticInteractable = L1_2
end
L0_1.RemoveStaticInteractable = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = pairs
  L3_2 = A1_2.doors
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.type
    if "slide_gate" == L8_2 then
      L8_2 = joaat
      L9_2 = "vms_housing_%s_%s"
      L10_2 = L9_2
      L9_2 = L9_2.format
      L11_2 = A1_2.propertyId
      L12_2 = L6_2
      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L7_2.hash = L8_2
      L8_2 = AddDoorToSystem
      L9_2 = L7_2.hash
      L10_2 = L7_2.model
      L11_2 = L7_2.coords
      L11_2 = L11_2.x
      L12_2 = L7_2.coords
      L12_2 = L12_2.y
      L13_2 = L7_2.coords
      L13_2 = L13_2.z
      L14_2 = false
      L15_2 = false
      L16_2 = false
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L8_2 = DoorSystemSetDoorState
      L9_2 = L7_2.hash
      L10_2 = 4
      L11_2 = false
      L12_2 = false
      L8_2(L9_2, L10_2, L11_2, L12_2)
      L8_2 = DoorSystemSetDoorState
      L9_2 = L7_2.hash
      L10_2 = A1_2.forceLock
      if not L10_2 then
        L10_2 = L7_2.locked
        if true ~= L10_2 then
          goto lbl_46
        end
      end
      L10_2 = 1
      ::lbl_46::
      if not L10_2 then
        L10_2 = 0
      end
      L11_2 = false
      L12_2 = false
      L8_2(L9_2, L10_2, L11_2, L12_2)
      L8_2 = DoorSystemSetAutomaticRate
      L9_2 = L7_2.hash
      L10_2 = 5.0
      L11_2 = false
      L12_2 = false
      L8_2(L9_2, L10_2, L11_2, L12_2)
    else
      L8_2 = L7_2.type
      if "single" == L8_2 then
        L8_2 = joaat
        L9_2 = "vms_housing_%s_%s"
        L10_2 = L9_2
        L9_2 = L9_2.format
        L11_2 = A1_2.propertyId
        L12_2 = L6_2
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L9_2(L10_2, L11_2, L12_2)
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        L7_2.hash = L8_2
        L8_2 = AddDoorToSystem
        L9_2 = L7_2.hash
        L10_2 = L7_2.model
        L11_2 = L7_2.coords
        L11_2 = L11_2.x
        L12_2 = L7_2.coords
        L12_2 = L12_2.y
        L13_2 = L7_2.coords
        L13_2 = L13_2.z
        L14_2 = false
        L15_2 = false
        L16_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        L8_2 = DoorSystemSetDoorState
        L9_2 = L7_2.hash
        L10_2 = 4
        L11_2 = false
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
        L8_2 = DoorSystemSetDoorState
        L9_2 = L7_2.hash
        L10_2 = A1_2.forceLock
        if not L10_2 then
          L10_2 = L7_2.locked
          if true ~= L10_2 then
            goto lbl_98
          end
        end
        L10_2 = 1
        ::lbl_98::
        if not L10_2 then
          L10_2 = 0
        end
        L11_2 = false
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
        L8_2 = DoorSystemSetAutomaticRate
        L9_2 = L7_2.hash
        L10_2 = 10.0
        L11_2 = false
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
      else
        L8_2 = L7_2.type
        if "double" == L8_2 then
          L8_2 = L7_2.left
          if L8_2 then
            L8_2 = L7_2.left
            L9_2 = joaat
            L10_2 = "vms_housing_%s_%s_left"
            L11_2 = L10_2
            L10_2 = L10_2.format
            L12_2 = A1_2.propertyId
            L13_2 = L6_2
            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L10_2(L11_2, L12_2, L13_2)
            L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            L8_2.hash = L9_2
            L8_2 = AddDoorToSystem
            L9_2 = L7_2.left
            L9_2 = L9_2.hash
            L10_2 = L7_2.left
            L10_2 = L10_2.model
            L11_2 = L7_2.left
            L11_2 = L11_2.coords
            L11_2 = L11_2.x
            L12_2 = L7_2.left
            L12_2 = L12_2.coords
            L12_2 = L12_2.y
            L13_2 = L7_2.left
            L13_2 = L13_2.coords
            L13_2 = L13_2.z
            L14_2 = false
            L15_2 = false
            L16_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            L8_2 = DoorSystemSetDoorState
            L9_2 = L7_2.left
            L9_2 = L9_2.hash
            L10_2 = 4
            L11_2 = false
            L12_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2)
            L8_2 = DoorSystemSetDoorState
            L9_2 = L7_2.left
            L9_2 = L9_2.hash
            L10_2 = A1_2.forceLock
            if not L10_2 then
              L10_2 = L7_2.locked
              if true ~= L10_2 then
                goto lbl_161
              end
            end
            L10_2 = 1
            ::lbl_161::
            if not L10_2 then
              L10_2 = 0
            end
            L11_2 = false
            L12_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2)
            L8_2 = DoorSystemSetAutomaticRate
            L9_2 = L7_2.left
            L9_2 = L9_2.hash
            L10_2 = 10.0
            L11_2 = false
            L12_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
          L8_2 = L7_2.right
          if L8_2 then
            L8_2 = L7_2.right
            L9_2 = joaat
            L10_2 = "vms_housing_%s_%s_right"
            L11_2 = L10_2
            L10_2 = L10_2.format
            L12_2 = A1_2.propertyId
            L13_2 = L6_2
            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L10_2(L11_2, L12_2, L13_2)
            L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            L8_2.hash = L9_2
            L8_2 = AddDoorToSystem
            L9_2 = L7_2.right
            L9_2 = L9_2.hash
            L10_2 = L7_2.right
            L10_2 = L10_2.model
            L11_2 = L7_2.right
            L11_2 = L11_2.coords
            L11_2 = L11_2.x
            L12_2 = L7_2.right
            L12_2 = L12_2.coords
            L12_2 = L12_2.y
            L13_2 = L7_2.right
            L13_2 = L13_2.coords
            L13_2 = L13_2.z
            L14_2 = false
            L15_2 = false
            L16_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
            L8_2 = DoorSystemSetDoorState
            L9_2 = L7_2.right
            L9_2 = L9_2.hash
            L10_2 = 4
            L11_2 = false
            L12_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2)
            L8_2 = DoorSystemSetDoorState
            L9_2 = L7_2.right
            L9_2 = L9_2.hash
            L10_2 = A1_2.forceLock
            if not L10_2 then
              L10_2 = L7_2.locked
              if true ~= L10_2 then
                goto lbl_221
              end
            end
            L10_2 = 1
            ::lbl_221::
            if not L10_2 then
              L10_2 = 0
            end
            L11_2 = false
            L12_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2)
            L8_2 = DoorSystemSetAutomaticRate
            L9_2 = L7_2.right
            L9_2 = L9_2.hash
            L10_2 = 10.0
            L11_2 = false
            L12_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
        end
      end
    end
  end
end
L0_1.RegisterDoors = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A1_2 then
    L2_2 = pairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L7_2.type
      if "double" == L8_2 then
        L8_2 = DoorSystemSetDoorState
        L9_2 = L7_2.left
        L9_2 = L9_2.hash
        L10_2 = 1
        L11_2 = false
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
        L8_2 = DoorSystemSetDoorState
        L9_2 = L7_2.right
        L9_2 = L9_2.hash
        L10_2 = 1
        L11_2 = false
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
      else
        L8_2 = L7_2.type
        if "slide_gate" ~= L8_2 then
          L8_2 = L7_2.type
          if "single" ~= L8_2 then
            goto lbl_37
          end
        end
        L8_2 = DoorSystemSetDoorState
        L9_2 = L7_2.hash
        L10_2 = 1
        L11_2 = false
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
      end
      ::lbl_37::
    end
  end
end
L0_1.LockDoors = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A1_2 then
    L2_2 = pairs
    L3_2 = A1_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L7_2.type
      if "double" == L8_2 then
        L8_2 = DoorSystemSetDoorState
        L9_2 = L7_2.left
        L9_2 = L9_2.hash
        L10_2 = 0
        L11_2 = false
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
        L8_2 = DoorSystemSetDoorState
        L9_2 = L7_2.right
        L9_2 = L9_2.hash
        L10_2 = 0
        L11_2 = false
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
      else
        L8_2 = L7_2.type
        if "slide_gate" ~= L8_2 then
          L8_2 = L7_2.type
          if "single" ~= L8_2 then
            goto lbl_37
          end
        end
        L8_2 = DoorSystemSetDoorState
        L9_2 = L7_2.hash
        L10_2 = 0
        L11_2 = false
        L12_2 = false
        L8_2(L9_2, L10_2, L11_2, L12_2)
      end
      ::lbl_37::
    end
  end
end
L0_1.UnlockDoors = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  if A3_2 then
    L5_2 = TargetPoints
    L5_2 = #L5_2
    L6_2 = 1
    L7_2 = -1
    for L8_2 = L5_2, L6_2, L7_2 do
      L9_2 = TargetPoints
      L9_2 = L9_2[L8_2]
      L9_2 = L9_2.type
      if "door" == L9_2 then
        L9_2 = CL
        L9_2 = L9_2.Target
        L10_2 = "remove-entity"
        L11_2 = TargetPoints
        L11_2 = L11_2[L8_2]
        L11_2 = L11_2.entity
        L9_2(L10_2, L11_2)
        L9_2 = table
        L9_2 = L9_2.remove
        L10_2 = TargetPoints
        L11_2 = L8_2
        L9_2(L10_2, L11_2)
      end
    end
  end
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L3_3 = A2_2
    if not L3_3 then
      L3_3 = GetCurrentPropertyId
      L3_3 = L3_3()
    end
    L4_3 = A2_2
    if L4_3 then
      L4_3 = Properties
      L5_3 = tostring
      L6_3 = A2_2
      L5_3 = L5_3(L6_3)
      L4_3 = L4_3[L5_3]
      if L4_3 then
        goto lbl_18
      end
    end
    L4_3 = GetCurrentPropertyData
    L4_3 = L4_3()
    ::lbl_18::
    L5_3 = {}
    L6_3 = Config
    L6_3 = L6_3.UseKeysOnItem
    if not L6_3 then
      L6_3 = table
      L6_3 = L6_3.insert
      L7_3 = L5_3
      L8_3 = {}
      L8_3.interactableName = "door"
      L9_3 = "door-left-"
      L10_3 = A1_3
      L9_3 = L9_3 .. L10_3
      L8_3.name = L9_3
      L9_3 = TRANSLATE
      L10_3 = "target.toggle_lock_door"
      L9_3 = L9_3(L10_3)
      L8_3.label = L9_3
      L9_3 = A2_3 or L9_3
      if not A2_3 then
        L9_3 = 1.2
      end
      L8_3.distance = L9_3
      function L9_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4
        L0_4 = A0_2.LastLockedDoors
        if L0_4 then
          L0_4 = A0_2.LastLockedDoors
          if not L0_4 then
            goto lbl_26
          end
          L0_4 = GetGameTimer
          L0_4 = L0_4()
          L1_4 = A0_2.LastLockedDoors
          if not (L0_4 > L1_4) then
            goto lbl_26
          end
        end
        L0_4 = TriggerServerEvent
        L1_4 = "vms_housing:sv:toggleDoorlock"
        L2_4 = L3_3
        L3_4 = A1_3
        L4_4 = nil
        L5_4 = false
        L6_4 = false
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4)
        L0_4 = GetGameTimer
        L0_4 = L0_4()
        L0_4 = L0_4 + 2000
        A0_2.LastLockedDoors = L0_4
        goto lbl_34
        ::lbl_26::
        L0_4 = CL
        L0_4 = L0_4.Notification
        L1_4 = TRANSLATE
        L2_4 = "notify.doors:wait"
        L1_4 = L1_4(L2_4)
        L2_4 = 3500
        L3_4 = "info"
        L0_4(L1_4, L2_4, L3_4)
        ::lbl_34::
      end
      L8_3.action = L9_3
      function L9_3()
        local L0_4, L1_4
        L0_4 = HasOwnership
        L1_4 = L4_3
        return L0_4(L1_4)
      end
      L8_3.canInteract = L9_3
      L6_3(L7_3, L8_3)
    end
    L6_3 = table
    L6_3 = L6_3.insert
    L7_3 = L5_3
    L8_3 = TargetHandler
    L8_3 = L8_3.Lockpick
    L9_3 = L3_3
    L10_3 = L4_3.metadata
    if L10_3 then
      L10_3 = L10_3.upgrades
    end
    if L10_3 then
      L10_3 = L10_3.antiBurglaryDoors
    end
    L11_3 = L4_3.metadata
    if L11_3 then
      L11_3 = L11_3.upgrades
    end
    if L11_3 then
      L11_3 = L11_3.alarm
    end
    function L12_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4
      L1_4 = TriggerServerEvent
      L2_4 = "vms_housing:sv:toggleDoorlock"
      L3_4 = L3_3
      L4_4 = A1_3
      L5_4 = nil
      L6_4 = true
      L7_4 = false
      L8_4 = A0_4
      L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4)
    end
    function L13_3()
      local L0_4, L1_4
      L0_4 = L4_3.metadata
      L0_4 = L0_4.doors
      L1_4 = A1_3
      L0_4 = L0_4[L1_4]
      L0_4 = L0_4.locked
      if L0_4 then
        L0_4 = L4_3.metadata
        L0_4 = L0_4.lockdown
        L0_4 = not L0_4
      end
      return L0_4
    end
    L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
    L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
    L6_3 = TargetHandler
    L6_3 = L6_3.Raid
    L7_3 = L3_3
    function L8_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
      if A0_4 then
        L1_4 = TriggerServerEvent
        L2_4 = "vms_housing:sv:toggleDoorlock"
        L3_4 = L3_3
        L4_4 = A1_3
        L5_4 = nil
        L6_4 = false
        L7_4 = true
        L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
      end
    end
    function L9_3()
      local L0_4, L1_4
      L0_4 = L4_3.metadata
      L0_4 = L0_4.doors
      L1_4 = A1_3
      L0_4 = L0_4[L1_4]
      L0_4 = L0_4.locked
      if L0_4 then
        L0_4 = L4_3.isUnderRaid
        L0_4 = not L0_4
      end
      return L0_4
    end
    L6_3 = L6_3(L7_3, L8_3, L9_3)
    if L6_3 then
      L7_3 = table
      L7_3 = L7_3.insert
      L8_3 = L5_3
      L9_3 = L6_3
      L7_3(L8_3, L9_3)
    end
    L7_3 = TargetHandler
    L7_3 = L7_3.RaidLock
    function L8_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
      if A0_4 then
        L1_4 = TriggerServerEvent
        L2_4 = "vms_housing:sv:toggleDoorlock"
        L3_4 = L3_3
        L4_4 = A1_3
        L5_4 = nil
        L6_4 = false
        L7_4 = true
        L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
      end
    end
    function L9_3()
      local L0_4, L1_4
      L0_4 = L4_3.isUnderRaid
      return L0_4
    end
    L7_3 = L7_3(L8_3, L9_3)
    if L7_3 then
      L8_3 = table
      L8_3 = L8_3.insert
      L9_3 = L5_3
      L10_3 = L7_3
      L8_3(L9_3, L10_3)
    end
    L8_3 = CL
    L8_3 = L8_3.Target
    L9_3 = "entity"
    L10_3 = {}
    L10_3.entity = A0_3
    L10_3.options = L5_3
    L8_3(L9_3, L10_3)
    L8_3 = table
    L8_3 = L8_3.insert
    L9_3 = TargetPoints
    L10_3 = {}
    L10_3.type = "door"
    L10_3.entity = A0_3
    L8_3(L9_3, L10_3)
  end
  if A1_2 and not A4_2 then
    L6_2 = pairs
    L7_2 = A1_2
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
      L12_2 = L11_2.type
      if "double" == L12_2 then
        L12_2 = GetClosestObjectOfType
        L13_2 = L11_2.left
        L13_2 = L13_2.coords
        L13_2 = L13_2.x
        L14_2 = L11_2.left
        L14_2 = L14_2.coords
        L14_2 = L14_2.y
        L15_2 = L11_2.left
        L15_2 = L15_2.coords
        L15_2 = L15_2.z
        L16_2 = 1.0
        L17_2 = L11_2.left
        L17_2 = L17_2.model
        L18_2 = false
        L19_2 = false
        L20_2 = false
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L13_2 = GetClosestObjectOfType
        L14_2 = L11_2.right
        L14_2 = L14_2.coords
        L14_2 = L14_2.x
        L15_2 = L11_2.right
        L15_2 = L15_2.coords
        L15_2 = L15_2.y
        L16_2 = L11_2.right
        L16_2 = L16_2.coords
        L16_2 = L16_2.z
        L17_2 = 1.0
        L18_2 = L11_2.right
        L18_2 = L18_2.model
        L19_2 = false
        L20_2 = false
        L21_2 = false
        L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        if L12_2 and 0 ~= L12_2 then
          L14_2 = L5_2
          L15_2 = L12_2
          L16_2 = L10_2
          L17_2 = L11_2.distance
          L14_2(L15_2, L16_2, L17_2)
        end
        if L13_2 and 0 ~= L13_2 then
          L14_2 = L5_2
          L15_2 = L13_2
          L16_2 = L10_2
          L17_2 = L11_2.distance
          L14_2(L15_2, L16_2, L17_2)
        end
      else
        L12_2 = L11_2.type
        if "slide_gate" ~= L12_2 then
          L12_2 = L11_2.type
          if "single" ~= L12_2 then
            goto lbl_139
          end
        end
        L12_2 = nil
        L13_2 = L11_2.type
        if "slide_gate" == L13_2 then
          L13_2 = GetClosestObjectOfType
          L14_2 = L11_2.coords
          L14_2 = L14_2.x
          L15_2 = L11_2.coords
          L15_2 = L15_2.y
          L16_2 = L11_2.coords
          L16_2 = L16_2.z
          L17_2 = 15.0
          L18_2 = L11_2.model
          L19_2 = false
          L20_2 = false
          L21_2 = false
          L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
          L12_2 = L13_2
        else
          L13_2 = GetClosestObjectOfType
          L14_2 = L11_2.coords
          L14_2 = L14_2.x
          L15_2 = L11_2.coords
          L15_2 = L15_2.y
          L16_2 = L11_2.coords
          L16_2 = L16_2.z
          L17_2 = 1.0
          L18_2 = L11_2.model
          L19_2 = false
          L20_2 = false
          L21_2 = false
          L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
          L12_2 = L13_2
        end
        if L12_2 and 0 ~= L12_2 then
          L13_2 = L5_2
          L14_2 = L12_2
          L15_2 = L10_2
          L16_2 = L11_2.distance
          L13_2(L14_2, L15_2, L16_2)
        end
      end
      ::lbl_139::
    end
  end
end
L0_1.LoadDoors = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = A0_2
  L2_2 = false
  L3_2 = pairs
  L4_2 = Properties
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.object_id
    if L9_2 then
      L9_2 = tostring
      L10_2 = L8_2.object_id
      L9_2 = L9_2(L10_2)
      L10_2 = tostring
      L11_2 = L1_2
      L10_2 = L10_2(L11_2)
      if L9_2 == L10_2 then
        L9_2 = library
        L9_2 = L9_2.HasAnyPermission
        L10_2 = L8_2.id
        L9_2 = L9_2(L10_2)
        if L9_2 then
          L2_2 = true
          break
        end
      end
    end
  end
  return L2_2
end
L0_1.IsHaveAnyApartment = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = {}
  L3_2 = A0_2.id
  L4_2 = pairs
  L5_2 = Properties
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.object_id
    if L10_2 == L3_2 then
      if A1_2 then
        L10_2 = table
        L10_2 = L10_2.insert
        L11_2 = L2_2
        L12_2 = {}
        L13_2 = L9_2.id
        L12_2.id = L13_2
        L13_2 = L9_2.name
        L12_2.name = L13_2
        L10_2(L11_2, L12_2)
      else
        L10_2 = table
        L10_2 = L10_2.insert
        L11_2 = L2_2
        L12_2 = L9_2
        L10_2(L11_2, L12_2)
      end
    end
  end
  L4_2 = L2_2
  L5_2 = true
  return L4_2, L5_2
end
L0_1.GetApartments = L1_1
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "Property"
  L4_2.actionName = "BuildingMenu"
  L5_2 = {}
  L5_2.buildingData = A1_2
  L5_2.apartments = A2_2
  L4_2.data = L5_2
  L3_2(L4_2)
  L3_2 = SetNuiFocus
  L4_2 = true
  L5_2 = true
  L3_2(L4_2, L5_2)
  openedMenu = "BuildingMenu"
end
L0_1.BuildingMenu = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = A0_2.id
  L2_2 = {}
  L3_2 = pairs
  L4_2 = Properties
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.object_id
    if L9_2 == L1_2 then
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = L2_2
      L11_2 = L8_2
      L9_2(L10_2, L11_2)
    end
  end
  return L2_2
end
L0_1.GetMotelRooms = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = DoScreenFadeOut
  L2_2 = 1500
  L1_2(L2_2)
  L1_2 = Wait
  L2_2 = 1500
  L1_2(L2_2)
  L1_2 = FreezeEntityPosition
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = TriggerServerEvent
  L2_2 = "vms_housing:sv:exitHouse"
  L3_2 = CurrentProperty
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = ToggleWeather
  if L1_2 then
    L1_2 = ToggleWeather
    L2_2 = false
    L1_2(L2_2)
  end
  L1_2 = CurrentShell
  if L1_2 then
    L1_2 = DeleteObject
    L2_2 = CurrentShell
    L1_2(L2_2)
    CurrentShell = nil
  end
  L1_2 = CurrentIPL
  if L1_2 then
    L1_2 = IPL
    L1_2 = L1_2.UnloadSettings
    L2_2 = CurrentIPL
    L1_2(L2_2)
    CurrentIPL = nil
  end
  L2_2 = A0_2
  L1_2 = A0_2.RemoveFurniture
  L3_2 = nil
  function L4_2()
    local L0_3, L1_3
  end
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "ControlsMenu"
  L2_2.toggle = true
  L2_2.controlsLabel = "property:peephole"
  L2_2.controlsName = "Property:peephole"
  L1_2(L2_2)
  L1_2 = CurrentPropertyData
  L1_2 = L1_2.metadata
  if L1_2 then
    L1_2 = L1_2.upgrades
  end
  if L1_2 then
    L1_2 = L1_2.smartPeephole
  end
  if L1_2 then
    L1_2 = ClearFocus
    L1_2()
    L1_2 = SetTimecycleModifier
    L2_2 = "CAMERA_secuirity"
    L1_2(L2_2)
    L1_2 = SetTimecycleModifierStrength
    L2_2 = 0.8
    L1_2(L2_2)
  else
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.action = "Property"
    L2_2.actionName = "OpenDoorPeephole"
    L1_2(L2_2)
  end
  L1_2 = Wait
  L2_2 = 1500
  L1_2(L2_2)
  L1_2 = DoScreenFadeIn
  L2_2 = 1500
  L1_2(L2_2)
  L1_2 = SetEntityVisible
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = false
  L4_2 = 0
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = 0.2
  L2_2 = 1.56
  L3_2 = nil
  L4_2 = CurrentPropertyData
  L4_2 = L4_2.object_id
  if L4_2 then
    L4_2 = Properties
    L5_2 = tostring
    L6_2 = CurrentPropertyData
    L6_2 = L6_2.object_id
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2[L5_2]
    if L4_2 then
      L4_2 = Properties
      L5_2 = tostring
      L6_2 = CurrentPropertyData
      L6_2 = L6_2.object_id
      L5_2 = L5_2(L6_2)
      L4_2 = L4_2[L5_2]
      L4_2 = L4_2.type
      if "building" == L4_2 then
        L4_2 = Properties
        L5_2 = tostring
        L6_2 = CurrentPropertyData
        L6_2 = L6_2.object_id
        L5_2 = L5_2(L6_2)
        L3_2 = L4_2[L5_2]
      end
    end
  end
  if L3_2 then
    L4_2 = math
    L4_2 = L4_2.rad
    L5_2 = L3_2.metadata
    L5_2 = L5_2.exit
    L5_2 = L5_2.w
    L5_2 = L5_2 + 90.0
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_138
    end
  end
  L4_2 = math
  L4_2 = L4_2.rad
  L5_2 = CurrentPropertyData
  L5_2 = L5_2.metadata
  L5_2 = L5_2.exit
  L5_2 = L5_2.w
  L5_2 = L5_2 + 90.0
  L4_2 = L4_2(L5_2)
  ::lbl_138::
  if L3_2 then
    L5_2 = L3_2.metadata
    L5_2 = L5_2.exit
    L5_2 = L5_2.x
    L6_2 = math
    L6_2 = L6_2.cos
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    L6_2 = L6_2 * L1_2
    L5_2 = L5_2 - L6_2
    if L5_2 then
      goto lbl_165
    end
  end
  L5_2 = CurrentPropertyData
  L5_2 = L5_2.metadata
  L5_2 = L5_2.exit
  L5_2 = L5_2.x
  L6_2 = math
  L6_2 = L6_2.cos
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2 * L1_2
  L5_2 = L5_2 - L6_2
  ::lbl_165::
  if L3_2 then
    L6_2 = L3_2.metadata
    L6_2 = L6_2.exit
    L6_2 = L6_2.y
    L7_2 = math
    L7_2 = L7_2.sin
    L8_2 = L4_2
    L7_2 = L7_2(L8_2)
    L7_2 = L7_2 * L1_2
    L6_2 = L6_2 - L7_2
    if L6_2 then
      goto lbl_192
    end
  end
  L6_2 = CurrentPropertyData
  L6_2 = L6_2.metadata
  L6_2 = L6_2.exit
  L6_2 = L6_2.y
  L7_2 = math
  L7_2 = L7_2.sin
  L8_2 = L4_2
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2 * L1_2
  L6_2 = L6_2 - L7_2
  ::lbl_192::
  if L3_2 then
    L7_2 = L3_2.metadata
    L7_2 = L7_2.exit
    L7_2 = L7_2.z
    L7_2 = L7_2 + L2_2
    if L7_2 then
      goto lbl_207
    end
  end
  L7_2 = CurrentPropertyData
  L7_2 = L7_2.metadata
  L7_2 = L7_2.exit
  L7_2 = L7_2.z
  L7_2 = L7_2 + L2_2
  ::lbl_207::
  if L3_2 then
    L8_2 = L3_2.metadata
    L8_2 = L8_2.exit
    L8_2 = L8_2.x
    L9_2 = math
    L9_2 = L9_2.cos
    L10_2 = L4_2
    L9_2 = L9_2(L10_2)
    L9_2 = L9_2 * 2.0
    L8_2 = L8_2 + L9_2
    if L8_2 then
      goto lbl_234
    end
  end
  L8_2 = CurrentPropertyData
  L8_2 = L8_2.metadata
  L8_2 = L8_2.exit
  L8_2 = L8_2.x
  L9_2 = math
  L9_2 = L9_2.cos
  L10_2 = L4_2
  L9_2 = L9_2(L10_2)
  L9_2 = L9_2 * 2.0
  L8_2 = L8_2 + L9_2
  ::lbl_234::
  if L3_2 then
    L9_2 = L3_2.metadata
    L9_2 = L9_2.exit
    L9_2 = L9_2.y
    L10_2 = math
    L10_2 = L10_2.sin
    L11_2 = L4_2
    L10_2 = L10_2(L11_2)
    L10_2 = L10_2 * 2.0
    L9_2 = L9_2 + L10_2
    if L9_2 then
      goto lbl_261
    end
  end
  L9_2 = CurrentPropertyData
  L9_2 = L9_2.metadata
  L9_2 = L9_2.exit
  L9_2 = L9_2.y
  L10_2 = math
  L10_2 = L10_2.sin
  L11_2 = L4_2
  L10_2 = L10_2(L11_2)
  L10_2 = L10_2 * 2.0
  L9_2 = L9_2 + L10_2
  ::lbl_261::
  if L3_2 then
    L10_2 = L3_2.metadata
    L10_2 = L10_2.exit
    L10_2 = L10_2.z
    L10_2 = L10_2 + L2_2
    if L10_2 then
      goto lbl_276
    end
  end
  L10_2 = CurrentPropertyData
  L10_2 = L10_2.metadata
  L10_2 = L10_2.exit
  L10_2 = L10_2.z
  L10_2 = L10_2 + L2_2
  ::lbl_276::
  L11_2 = CreateCam
  L12_2 = "DEFAULT_SCRIPTED_CAMERA"
  L13_2 = true
  L11_2 = L11_2(L12_2, L13_2)
  L12_2 = SetCamCoord
  L13_2 = L11_2
  L14_2 = L5_2
  L15_2 = L6_2
  L16_2 = L7_2
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = PointCamAtCoord
  L13_2 = L11_2
  L14_2 = L8_2
  L15_2 = L9_2
  L16_2 = L10_2
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = SetCamFov
  L13_2 = L11_2
  L14_2 = CurrentPropertyData
  L14_2 = L14_2.metadata
  if L14_2 then
    L14_2 = L14_2.upgrades
  end
  if L14_2 then
    L14_2 = L14_2.smartPeephole
  end
  if L14_2 then
    L14_2 = 110.0
    if L14_2 then
      goto lbl_308
    end
  end
  L14_2 = 160.0
  ::lbl_308::
  L12_2(L13_2, L14_2)
  L12_2 = SetCamActive
  L13_2 = L11_2
  L14_2 = true
  L12_2(L13_2, L14_2)
  L12_2 = RenderScriptCams
  L13_2 = true
  L14_2 = true
  L15_2 = 1
  L16_2 = true
  L17_2 = true
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  while true do
    L12_2 = DisableAllControlActions
    L13_2 = 0
    L12_2(L13_2)
    L12_2 = EnableControlAction
    L13_2 = 0
    L14_2 = 194
    L15_2 = true
    L12_2(L13_2, L14_2, L15_2)
    L12_2 = IsControlJustPressed
    L13_2 = 0
    L14_2 = 194
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      break
    end
    L12_2 = Citizen
    L12_2 = L12_2.Wait
    L13_2 = 1
    L12_2(L13_2)
  end
  L12_2 = SendNUIMessage
  L13_2 = {}
  L13_2.action = "ControlsMenu"
  L13_2.toggle = false
  L12_2(L13_2)
  L13_2 = A0_2
  L12_2 = A0_2.EnterProperty
  L14_2 = CurrentPropertyData
  L15_2 = CurrentProperty
  function L16_2(A0_3)
    local L1_3, L2_3
    if A0_3 then
      L1_3 = Citizen
      L1_3 = L1_3.CreateThread
      function L2_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4
        L0_4 = Citizen
        L0_4 = L0_4.Wait
        L1_4 = 2500
        L0_4(L1_4)
        L0_4 = SetEntityVisible
        L1_4 = PlayerPedId
        L1_4 = L1_4()
        L2_4 = true
        L3_4 = 0
        L0_4(L1_4, L2_4, L3_4)
        L0_4 = RenderScriptCams
        L1_4 = false
        L2_4 = true
        L3_4 = 500
        L4_4 = true
        L5_4 = true
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4)
        L0_4 = DestroyCam
        L1_4 = L11_2
        L2_4 = false
        L0_4(L1_4, L2_4)
        L0_4 = ClearFocus
        L0_4()
        L0_4 = ClearTimecycleModifier
        L0_4()
        L0_4 = ClearExtraTimecycleModifier
        L0_4()
        L0_4 = SendNUIMessage
        L1_4 = {}
        L1_4.action = "Property"
        L1_4.actionName = "CloseDoorPeephole"
        L0_4(L1_4)
      end
      L1_3(L2_3)
    end
  end
  L17_2 = true
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
end
L0_1.OpenDoorPeephole = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = library
  L1_2 = L1_2.CallbackAwait
  L2_2 = "vms_housing:isAllowedToRaid"
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = GetCurrentPropertyId
    L3_2 = L3_2()
  end
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L3_2 = CL
    L3_2 = L3_2.Notification
    L4_2 = TRANSLATE
    L5_2 = "notify.raid:"
    L6_2 = L2_2
    L5_2 = L5_2 .. L6_2
    L4_2 = L4_2(L5_2)
    L5_2 = 5500
    L6_2 = "error"
    return L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = GetCurrentPropertyData
  L4_2 = L4_2()
  L5_2 = library
  L5_2 = L5_2.PlayAnimation
  L6_2 = L3_2
  L7_2 = "missheistfbi3b_ig7"
  L8_2 = "lift_fibagent_loop"
  L9_2 = 8.0
  L10_2 = 8.0
  L11_2 = -1
  L12_2 = 1
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L5_2 = CL
  L5_2 = L5_2.Minigame
  L6_2 = "police_raid"
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = library
    L1_3 = L1_3.StopAnimation
    L2_3 = L3_2
    L1_3(L2_3)
    if A0_3 then
      L1_3 = TriggerServerEvent
      L2_3 = "vms_housing:sv:raidProperty"
      L3_3 = A0_2
      if not L3_3 then
        L3_3 = GetCurrentPropertyId
        L3_3 = L3_3()
      end
      L1_3(L2_3, L3_3)
    end
  end
  L8_2 = {}
  L9_2 = L4_2.metadata
  if L9_2 then
    L9_2 = L9_2.upgrades
  end
  if L9_2 then
    L9_2 = L9_2.antiBurglaryDoors
  end
  L8_2.antiBurglaryDoors = L9_2
  L5_2(L6_2, L7_2, L8_2)
end
L0_1.Raid = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = MARKETPLACE_PHOTOS_WEBHOOK
  if not L2_2 then
    L2_2 = library
    L2_2 = L2_2.Debug
    L3_2 = "Nie mo\197\188esz korzysta\196\135 z tej opcji. Nie ma skonfigurowanego webhooka."
    L4_2 = "warn"
    return L2_2(L3_2, L4_2)
  end
  L2_2 = true
  L3_2 = false
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = closeManageMenu
  L6_2()
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L3_2
    L0_3 = not L0_3
    L3_2 = L0_3
    L0_3 = L3_2
    if L0_3 then
      L0_3 = CreateMobilePhone
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = CellCamActivate
      L1_3 = true
      L2_3 = true
      L0_3(L1_3, L2_3)
      L0_3 = SendNUIMessage
      L1_3 = {}
      L1_3.action = "ControlsMenu"
      L1_3.toggle = true
      L1_3.controlsLabel = "property:photomode"
      L1_3.controlsName = "Property:photomode_on"
      L0_3(L1_3)
      L0_3 = CL
      L0_3 = L0_3.Notification
      L1_3 = TRANSLATE
      L2_3 = "notify.property:marketplace_photomode_on"
      L1_3 = L1_3(L2_3)
      L2_3 = 4000
      L3_3 = "info"
      L0_3(L1_3, L2_3, L3_3)
    else
      L0_3 = DestroyMobilePhone
      L0_3()
      L0_3 = CellCamActivate
      L1_3 = false
      L2_3 = false
      L0_3(L1_3, L2_3)
      L0_3 = SendNUIMessage
      L1_3 = {}
      L1_3.action = "ControlsMenu"
      L1_3.toggle = true
      L1_3.controlsLabel = "property:photomode"
      L1_3.controlsName = "Property:photomode_off"
      L0_3(L1_3)
      L0_3 = CL
      L0_3 = L0_3.Notification
      L1_3 = TRANSLATE
      L2_3 = "notify.property:marketplace_photomode_off"
      L1_3 = L1_3(L2_3)
      L2_3 = 4000
      L3_3 = "info"
      L0_3(L1_3, L2_3, L3_3)
    end
  end
  L7_2 = CL
  L7_2 = L7_2.Hud
  L8_2 = L7_2
  L7_2 = L7_2.Disable
  L7_2(L8_2)
  L7_2 = SendNUIMessage
  L8_2 = {}
  L8_2.action = "ControlsMenu"
  L8_2.toggle = true
  L8_2.controlsLabel = "property:photomode"
  L8_2.controlsName = "Property:photomode_off"
  L7_2(L8_2)
  L7_2 = false
  while L2_2 do
    L8_2 = DisabledControls
    L8_2()
    if not L7_2 then
      if L3_2 then
        L8_2 = IsControlJustPressed
        L9_2 = 0
        L10_2 = 191
        L8_2 = L8_2(L9_2, L10_2)
        if L8_2 then
          L7_2 = true
          L8_2 = SendNUIMessage
          L9_2 = {}
          L9_2.action = "ControlsMenu"
          L9_2.toggle = false
          L8_2(L9_2)
          L8_2 = Citizen
          L8_2 = L8_2.Wait
          L9_2 = 100
          L8_2(L9_2)
          L8_2 = exports
          L8_2 = L8_2["screenshot-basic"]
          L9_2 = L8_2
          L8_2 = L8_2.requestScreenshotUpload
          L10_2 = ""
          L11_2 = "files[]"
          function L12_2(A0_3)
            local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
            L1_3 = json
            L1_3 = L1_3.decode
            L2_3 = A0_3
            L1_3 = L1_3(L2_3)
            if L1_3 then
              L2_3 = L1_3.attachments
              L2_3 = L2_3[1]
              L2_3 = L2_3.url
              if L2_3 then
                L2_3 = TriggerServerEvent
                L3_3 = "vms_housing:sv:saveMarketplacePhoto"
                L4_3 = L4_2
                L5_3 = L5_2
                L6_3 = L1_3.attachments
                L6_3 = L6_3[1]
                L6_3 = L6_3.url
                L2_3(L3_3, L4_3, L5_3, L6_3)
                L2_3 = false
                L2_2 = L2_3
            end
            else
              L2_3 = false
              L7_2 = L2_3
            end
          end
          L8_2(L9_2, L10_2, L11_2, L12_2)
        end
      end
      L8_2 = IsControlJustPressed
      L9_2 = 0
      L10_2 = 38
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 then
        L8_2 = L6_2
        L8_2()
      end
      L8_2 = IsControlJustPressed
      L9_2 = 0
      L10_2 = 202
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 then
        L2_2 = false
      end
    end
    L8_2 = Citizen
    L8_2 = L8_2.Wait
    L9_2 = 1
    L8_2(L9_2)
  end
  L8_2 = DestroyMobilePhone
  L8_2()
  L8_2 = CellCamActivate
  L9_2 = false
  L10_2 = false
  L8_2(L9_2, L10_2)
  L8_2 = CL
  L8_2 = L8_2.Hud
  L9_2 = L8_2
  L8_2 = L8_2.Enable
  L8_2(L9_2)
  L8_2 = SendNUIMessage
  L9_2 = {}
  L9_2.action = "ControlsMenu"
  L9_2.toggle = false
  L8_2(L9_2)
end
L0_1.MarketplacePhotoMode = L1_1
Property = L0_1
L0_1 = exports
L1_1 = "IsHaveAnyApartment"
L2_1 = Property
L2_1 = L2_1.IsHaveAnyApartment
L0_1(L1_1, L2_1)
