local L0_1, L1_1, L2_1, L3_1
L0_1 = RegisterNUICallback
L1_1 = "loaded"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Citizen
  L2_2 = L2_2.Wait
  L3_2 = 1500
  L2_2(L3_2)
  L2_2 = {}
  L2_2.action = "loaded"
  L3_2 = Config
  L3_2 = L3_2.Language
  L2_2.lang = L3_2
  L3_2 = AvailableShells
  L2_2.availableShells = L3_2
  L3_2 = AvailableIPLS
  L2_2.availableIPLS = L3_2
  L3_2 = CharacterName
  L2_2.characterName = L3_2
  L3_2 = Config
  L3_2 = L3_2.UseKeysOnItem
  L2_2.keysOnItem = L3_2
  L3_2 = Config
  L3_2 = L3_2.KeyPrice
  L2_2.keyPrice = L3_2
  L3_2 = Config
  L3_2 = L3_2.KeysLimit
  L2_2.keysLimit = L3_2
  L3_2 = Config
  L3_2 = L3_2.LockReplacementPrice
  L2_2.lockReplacementPrice = L3_2
  L3_2 = Config
  L3_2 = L3_2.UseServiceBills
  L2_2.useServiceBills = L3_2
  L3_2 = Config
  L3_2 = L3_2.FurnitureSellPercentage
  L2_2.furnitureSellPercentage = L3_2
  L3_2 = Config
  L3_2 = L3_2.RequirePurchaseFurniture
  L2_2.requirePurchaseFurniture = L3_2
  L3_2 = Config
  L3_2 = L3_2.DeliveryType
  L2_2.deliveryFurnitureType = L3_2
  L3_2 = Config
  L3_2 = L3_2.AreaUnit
  L2_2.areaUnit = L3_2
  L3_2 = Config
  L3_2 = L3_2.RentalCycles
  L2_2.rentalCycles = L3_2
  L3_2 = Config
  L3_2 = L3_2.AllowedUnpaidRentBills
  L2_2.allowedUnpaidRentBills = L3_2
  L3_2 = Config
  L3_2 = L3_2.AllowChangeStoragePosition
  L2_2.allowChangeStoragePosition = L3_2
  L3_2 = Config
  L3_2 = L3_2.AllowChangeWardrobePosition
  L2_2.allowChangeWardrobePosition = L3_2
  L3_2 = Config
  L3_2 = L3_2.Marketplace
  L3_2 = L3_2.AllowTransactionFromMenu
  L2_2.allowTransactionFromMenu = L3_2
  L3_2 = Config
  L3_2 = L3_2.Garages
  L3_2 = "vms_garagesv2" == L3_2
  L2_2.usingVMSGarages = L3_2
  L3_2 = Config
  L3_2 = L3_2.UseServiceBills
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.AllowedUnpaidBills
    L2_2.allowedUnpaidBills = L3_2
  end
  L3_2 = Citizen
  L3_2 = L3_2.Wait
  L4_2 = 200
  L3_2(L4_2)
  L3_2 = SendNUIMessage
  L4_2 = L2_2
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = openedMenu
    if "HousingCreator" == L1_2 then
      L1_2 = HousingCreator
      L1_2 = L1_2.Close
      L1_2()
  end
  else
    L1_2 = openedMenu
    if "PropertyOffer" ~= L1_2 then
      L1_2 = openedMenu
      if "BuildingMenu" ~= L1_2 then
        L1_2 = openedMenu
        if "ApartmentMenu" ~= L1_2 then
          L1_2 = openedMenu
          if "Contract" ~= L1_2 then
            goto lbl_32
          end
        end
      end
    end
    L1_2 = openedMenu
    if "Contract" == L1_2 then
      L1_2 = TriggerServerEvent
      L2_2 = "vms_housing:sv:cancelContract"
      L1_2(L2_2)
    end
    L1_2 = Property
    L1_2 = L1_2.CloseOffer
    L1_2()
    goto lbl_63
    ::lbl_32::
    L1_2 = openedMenu
    if "PropertyManage" == L1_2 then
      L1_2 = closeManageMenu
      L1_2()
    else
      L1_2 = openedMenu
      if "PropertyFurniture" == L1_2 then
        L1_2 = closeFurnitureMenu
        L1_2()
      else
        L1_2 = openedMenu
        if "PropertyFurniturePurchase" == L1_2 then
          L1_2 = SetNuiFocus
          L2_2 = false
          L3_2 = false
          L1_2(L2_2, L3_2)
        else
          L1_2 = openedMenu
          if "Safe" == L1_2 then
            L1_2 = CloseSafe
            L1_2()
          else
            L1_2 = openedMenu
            if "Marketplace" == L1_2 then
              L1_2 = closeMarketplace
              L1_2()
            end
          end
        end
      end
    end
  end
  ::lbl_63::
end
closeNUI = L0_1
L0_1 = RegisterNUICallback
L1_1 = "close"
function L2_1()
  local L0_2, L1_2
  L0_2 = closeNUI
  L0_2()
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:selectShell"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = houseConfiguration
  L2_2.type = "shell"
  L2_2 = houseConfiguration
  L3_2 = A0_2.shell
  L2_2.shell = L3_2
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:previewShell"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "HousingCreator"
  L3_2.actionName = "Update"
  L4_2 = {}
  L4_2.type = "hide-menu"
  L3_2.data = L4_2
  L2_2(L3_2)
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = HousingCreator
  L2_2 = L2_2.EnterShell
  L3_2 = A0_2.shell
  function L4_2()
    local L0_3, L1_3
    L0_3 = Citizen
    L0_3 = L0_3.CreateThread
    function L1_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
      while true do
        L0_4 = CurrentShell
        if not L0_4 then
          break
        end
        L0_4 = drawText2D
        L1_4 = "Selected Shell:"
        L2_4 = 0.5
        L3_4 = 0.08
        L4_4 = 0.4
        L5_4 = 255
        L6_4 = 255
        L7_4 = 255
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = drawText2D
        L1_4 = "~p~"
        L2_4 = A0_2.shell
        L3_4 = "~s~"
        L1_4 = L1_4 .. L2_4 .. L3_4
        L2_4 = 0.5
        L3_4 = 0.1
        L4_4 = 0.65
        L5_4 = 255
        L6_4 = 255
        L7_4 = 255
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = drawText2D
        L1_4 = "Press ~g~[X]~s~ to back"
        L2_4 = 0.5
        L3_4 = 0.14
        L4_4 = 0.3
        L5_4 = 255
        L6_4 = 255
        L7_4 = 255
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = IsControlJustPressed
        L1_4 = 0
        L2_4 = 73
        L0_4 = L0_4(L1_4, L2_4)
        if L0_4 then
          L0_4 = DeleteObject
          L1_4 = CurrentShell
          L0_4(L1_4)
          L0_4 = houseConfiguration
          L0_4 = L0_4.previousCoords
          if L0_4 then
            L0_4 = houseConfiguration
            L0_4 = L0_4.previousCoords
            L0_4 = L0_4.x
            if L0_4 then
              L0_4 = SetEntityCoords
              L1_4 = PlayerPedId
              L1_4 = L1_4()
              L2_4 = houseConfiguration
              L2_4 = L2_4.previousCoords
              L2_4 = L2_4.xyz
              L0_4(L1_4, L2_4)
            end
          end
          L0_4 = SendNUIMessage
          L1_4 = {}
          L1_4.action = "HousingCreator"
          L1_4.actionName = "Update"
          L2_4 = {}
          L2_4.type = "show-menu"
          L1_4.data = L2_4
          L0_4(L1_4)
          L0_4 = SetNuiFocus
          L1_4 = true
          L2_4 = true
          L0_4(L1_4, L2_4)
          CurrentShell = false
          break
        end
        L0_4 = Citizen
        L0_4 = L0_4.Wait
        L1_4 = 1
        L0_4(L1_4)
      end
    end
    L0_3(L1_3)
  end
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:selectIPL"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = houseConfiguration
  L2_2.type = "ipl"
  L2_2 = houseConfiguration
  L3_2 = A0_2.ipl
  L2_2.ipl = L3_2
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:previewIPL"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "HousingCreator"
  L3_2.actionName = "Update"
  L4_2 = {}
  L4_2.type = "hide-menu"
  L3_2.data = L4_2
  L2_2(L3_2)
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = nil
  L3_2 = AvailableIPLS
  L4_2 = A0_2.ipl
  L3_2 = L3_2[L4_2]
  if L3_2 then
    L3_2 = AvailableIPLS
    L4_2 = A0_2.ipl
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.settings
    if L3_2 then
      L3_2 = AvailableIPLS
      L4_2 = A0_2.ipl
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.settings
      L3_2 = L3_2.Themes
      if L3_2 then
        L3_2 = pairs
        L4_2 = AvailableIPLS
        L5_2 = A0_2.ipl
        L4_2 = L4_2[L5_2]
        L4_2 = L4_2.settings
        L4_2 = L4_2.Themes
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
          L2_2 = L7_2
          break
        end
      end
    end
  end
  L3_2 = HousingCreator
  L3_2 = L3_2.EnterIPL
  L4_2 = A0_2.ipl
  function L5_2()
    local L0_3, L1_3
    L0_3 = Citizen
    L0_3 = L0_3.CreateThread
    function L1_3()
      local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
      while true do
        L0_4 = CurrentIPL
        if not L0_4 then
          break
        end
        L0_4 = drawText2D
        L1_4 = "Selected IPL:"
        L2_4 = 0.5
        L3_4 = 0.08
        L4_4 = 0.4
        L5_4 = 255
        L6_4 = 255
        L7_4 = 255
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = drawText2D
        L1_4 = "~p~"
        L2_4 = A0_2.ipl
        L3_4 = "~s~"
        L1_4 = L1_4 .. L2_4 .. L3_4
        L2_4 = 0.5
        L3_4 = 0.1
        L4_4 = 0.65
        L5_4 = 255
        L6_4 = 255
        L7_4 = 255
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = drawText2D
        L1_4 = "Press ~g~[E]~s~ to back"
        L2_4 = 0.5
        L3_4 = 0.14
        L4_4 = 0.3
        L5_4 = 255
        L6_4 = 255
        L7_4 = 255
        L0_4(L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
        L0_4 = IsControlJustPressed
        L1_4 = 0
        L2_4 = 38
        L0_4 = L0_4(L1_4, L2_4)
        if L0_4 then
          L0_4 = houseConfiguration
          L0_4 = L0_4.previousCoords
          if L0_4 then
            L0_4 = houseConfiguration
            L0_4 = L0_4.previousCoords
            L0_4 = L0_4.x
            if L0_4 then
              L0_4 = SetEntityCoords
              L1_4 = PlayerPedId
              L1_4 = L1_4()
              L2_4 = houseConfiguration
              L2_4 = L2_4.previousCoords
              L2_4 = L2_4.xyz
              L0_4(L1_4, L2_4)
            end
          end
          L0_4 = IPL
          L0_4 = L0_4.UnloadSettings
          L1_4 = A0_2.ipl
          L0_4(L1_4)
          L0_4 = SendNUIMessage
          L1_4 = {}
          L1_4.action = "HousingCreator"
          L1_4.actionName = "Update"
          L2_4 = {}
          L2_4.type = "show-menu"
          L1_4.data = L2_4
          L0_4(L1_4)
          L0_4 = SetNuiFocus
          L1_4 = true
          L2_4 = true
          L0_4(L1_4, L2_4)
          CurrentIPL = false
          break
        end
        L0_4 = Citizen
        L0_4 = L0_4.Wait
        L1_4 = 1
        L0_4(L1_4)
      end
    end
    L0_3(L1_3)
  end
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:actionButton"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = {}
  L2_2.action = "HousingCreator"
  L3_2 = A0_2.type
  if "shell" ~= L3_2 then
    L3_2 = A0_2.type
    if "ipl" ~= L3_2 then
      L3_2 = A0_2.type
      if "mlo" ~= L3_2 then
        L3_2 = A0_2.type
        if "building" ~= L3_2 then
          L3_2 = A0_2.type
          if "motel" ~= L3_2 then
            goto lbl_312
          end
        end
      end
    end
  end
  L3_2 = A0_2.action
  if "save" == L3_2 then
    L3_2 = HousingCreator
    L3_2 = L3_2.Save
    L4_2 = A0_2
    L3_2(L4_2)
    L2_2.actionName = "Open"
  else
    L3_2 = A0_2.action
    if "delete" == L3_2 then
      L3_2 = TriggerServerEvent
      L4_2 = "vms_housing:sv:deleteHouse"
      L5_2 = A0_2.id
      L3_2(L4_2, L5_2)
      L2_2.actionName = "Open"
    else
      L3_2 = A0_2.action
      if "address" == L3_2 then
        L3_2 = houseConfiguration
        L4_2 = A0_2.type
        L3_2.type = L4_2
        L3_2 = GetEntityCoords
        L4_2 = PlayerPedId
        L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2()
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
        L4_2 = GetStreetNameAtCoord
        L5_2 = L3_2.x
        L6_2 = L3_2.y
        L7_2 = L3_2.z
        L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
        L6_2 = GetStreetNameFromHashKey
        L7_2 = L4_2
        L6_2 = L6_2(L7_2)
        L7_2 = houseConfiguration
        L7_2.address = L6_2
        L7_2 = houseConfiguration
        L7_2 = L7_2.address
        if L7_2 then
          L7_2 = houseConfiguration
          L7_2 = L7_2.address
          if "" ~= L7_2 then
            goto lbl_71
          end
        end
        L7_2 = houseConfiguration
        L7_2.address = "-"
        ::lbl_71::
        L2_2.actionName = "Update"
        L7_2 = {}
        L7_2.type = "update-input-value"
        L8_2 = A0_2.action
        L7_2.inputName = L8_2
        L8_2 = A0_2.type
        L7_2.housingType = L8_2
        L8_2 = houseConfiguration
        L8_2 = L8_2.address
        L7_2.value = L8_2
        L2_2.data = L7_2
      else
        L3_2 = A0_2.action
        if "region" == L3_2 then
          L3_2 = houseConfiguration
          L4_2 = A0_2.type
          L3_2.type = L4_2
          L3_2 = GetEntityCoords
          L4_2 = PlayerPedId
          L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2()
          L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          L4_2 = library
          L4_2 = L4_2.GetCurrentRegion
          L5_2 = L3_2.xyz
          L4_2 = L4_2(L5_2)
          L5_2 = houseConfiguration
          L6_2 = L4_2 or L6_2
          if not L4_2 then
            L6_2 = "None"
          end
          L5_2.region = L6_2
          L2_2.actionName = "Update"
          L5_2 = {}
          L5_2.type = "update-input-value"
          L6_2 = A0_2.action
          L5_2.inputName = L6_2
          L6_2 = A0_2.type
          L5_2.housingType = L6_2
          L6_2 = houseConfiguration
          L6_2 = L6_2.region
          L5_2.value = L6_2
          L2_2.data = L5_2
        else
          L3_2 = A0_2.action
          if "yard_zone" ~= L3_2 then
            L3_2 = A0_2.action
            if "interior_zone" ~= L3_2 then
              L3_2 = A0_2.action
              if "enter_point" ~= L3_2 then
                L3_2 = A0_2.action
                if "exit_point" ~= L3_2 then
                  L3_2 = A0_2.action
                  if "emergency_exit_outside" ~= L3_2 then
                    L3_2 = A0_2.action
                    if "emergency_exit_inside" ~= L3_2 then
                      L3_2 = A0_2.action
                      if "menu_point" ~= L3_2 then
                        L3_2 = A0_2.action
                        if "add_single_doors" ~= L3_2 then
                          L3_2 = A0_2.action
                          if "add_double_doors" ~= L3_2 then
                            L3_2 = A0_2.action
                            if "add_slide_gate" ~= L3_2 then
                              L3_2 = A0_2.action
                              if "remove_door" ~= L3_2 then
                                L3_2 = A0_2.action
                                if "garage_point" ~= L3_2 then
                                  L3_2 = A0_2.action
                                  if "enter_garage_point" ~= L3_2 then
                                    L3_2 = A0_2.action
                                    if "wardrobe_point" ~= L3_2 then
                                      L3_2 = A0_2.action
                                      if "storage_point" ~= L3_2 then
                                        L3_2 = A0_2.action
                                        if "delivery_coordinates" ~= L3_2 then
                                          goto lbl_354
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
                  end
                end
              end
            end
          end
          L2_2.actionName = "Update"
          L3_2 = {}
          L3_2.type = "hide-menu"
          L2_2.data = L3_2
          L3_2 = A0_2.action
          if "remove_door" ~= L3_2 then
            L3_2 = SetNuiFocus
            L4_2 = false
            L5_2 = false
            L3_2(L4_2, L5_2)
          end
          L3_2 = A0_2.action
          if "yard_zone" == L3_2 then
            L3_2 = HousingCreator
            L4_2 = L3_2
            L3_2 = L3_2.Polyzone
            L3_2(L4_2)
          else
            L3_2 = A0_2.action
            if "interior_zone" == L3_2 then
              L3_2 = HousingCreator
              L4_2 = L3_2
              L3_2 = L3_2.Polyzone
              L5_2 = true
              L3_2(L4_2, L5_2)
            else
              L3_2 = A0_2.action
              if "enter_point" == L3_2 then
                L3_2 = HousingCreator
                L4_2 = L3_2
                L3_2 = L3_2.CreateEnterPoint
                L3_2(L4_2)
              else
                L3_2 = A0_2.action
                if "exit_point" == L3_2 then
                  L3_2 = HousingCreator
                  L4_2 = L3_2
                  L3_2 = L3_2.CreateExitPoint
                  L3_2(L4_2)
                else
                  L3_2 = A0_2.action
                  if "emergency_exit_outside" == L3_2 then
                    L3_2 = HousingCreator
                    L4_2 = L3_2
                    L3_2 = L3_2.CreateEmergencyExitOutsidePoint
                    L3_2(L4_2)
                  else
                    L3_2 = A0_2.action
                    if "emergency_exit_inside" == L3_2 then
                      L3_2 = HousingCreator
                      L4_2 = L3_2
                      L3_2 = L3_2.CreateEmergencyExitInsidePoint
                      L5_2 = A0_2.houseTheme
                      L3_2(L4_2, L5_2)
                    else
                      L3_2 = A0_2.action
                      if "menu_point" == L3_2 then
                        L3_2 = HousingCreator
                        L4_2 = L3_2
                        L3_2 = L3_2.CreateMenuPoint
                        L3_2(L4_2)
                      else
                        L3_2 = A0_2.action
                        if "add_single_doors" == L3_2 then
                          L3_2 = HousingCreator
                          L4_2 = L3_2
                          L3_2 = L3_2.CreateDoor
                          L3_2(L4_2)
                        else
                          L3_2 = A0_2.action
                          if "add_double_doors" == L3_2 then
                            L3_2 = HousingCreator
                            L4_2 = L3_2
                            L3_2 = L3_2.CreateDoor
                            L5_2 = true
                            L3_2(L4_2, L5_2)
                          else
                            L3_2 = A0_2.action
                            if "add_slide_gate" == L3_2 then
                              L3_2 = HousingCreator
                              L4_2 = L3_2
                              L3_2 = L3_2.CreateDoor
                              L5_2 = false
                              L6_2 = true
                              L3_2(L4_2, L5_2, L6_2)
                            else
                              L3_2 = A0_2.action
                              if "remove_door" == L3_2 then
                                L3_2 = HousingCreator
                                L4_2 = L3_2
                                L3_2 = L3_2.RemoveDoor
                                L5_2 = A0_2.doorId
                                L3_2(L4_2, L5_2)
                                return
                              else
                                L3_2 = A0_2.action
                                if "garage_point" == L3_2 then
                                  L3_2 = A0_2.isGarage
                                  if L3_2 then
                                    L3_2 = HousingCreator
                                    L4_2 = L3_2
                                    L3_2 = L3_2.CreateGaragePoint
                                    L3_2(L4_2)
                                  else
                                    L3_2 = A0_2.isParking
                                    if L3_2 then
                                      L3_2 = HousingCreator
                                      L4_2 = L3_2
                                      L3_2 = L3_2.CreateParkingSpaces
                                      L3_2(L4_2)
                                    end
                                  end
                                else
                                  L3_2 = A0_2.action
                                  if "enter_garage_point" == L3_2 then
                                    L3_2 = HousingCreator
                                    L4_2 = L3_2
                                    L3_2 = L3_2.CreateEnterGaragePoint
                                    L3_2(L4_2)
                                  else
                                    L3_2 = A0_2.action
                                    if "wardrobe_point" == L3_2 then
                                      L3_2 = HousingCreator
                                      L4_2 = L3_2
                                      L3_2 = L3_2.CreateWardrobePoint
                                      L5_2 = false
                                      L6_2 = A0_2.houseTheme
                                      L3_2(L4_2, L5_2, L6_2)
                                    else
                                      L3_2 = A0_2.action
                                      if "storage_point" == L3_2 then
                                        L3_2 = HousingCreator
                                        L4_2 = L3_2
                                        L3_2 = L3_2.CreateStoragePoint
                                        L5_2 = false
                                        L6_2 = A0_2.houseTheme
                                        L3_2(L4_2, L5_2, L6_2)
                                      else
                                        L3_2 = A0_2.action
                                        if "delivery_coordinates" == L3_2 then
                                          L3_2 = HousingCreator
                                          L4_2 = L3_2
                                          L3_2 = L3_2.CreateDeliveryPoint
                                          L5_2 = A0_2.isInside
                                          L6_2 = A0_2.isOutside
                                          L7_2 = A0_2.houseTheme
                                          L3_2(L4_2, L5_2, L6_2, L7_2)
                                          goto lbl_354
                                          ::lbl_312::
                                          L3_2 = A0_2.type
                                          if "furniture" == L3_2 then
                                            L3_2 = A0_2.action
                                            if "save" == L3_2 then
                                              L3_2 = A0_2.model
                                              if L3_2 then
                                                L3_2 = HousingCreator
                                                L3_2 = L3_2.SaveFurniture
                                                L4_2 = A0_2
                                                L3_2(L4_2)
                                                L2_2.actionName = "Open"
                                              else
                                                return
                                              end
                                            else
                                              L3_2 = A0_2.action
                                              if "delete" == L3_2 then
                                                L3_2 = A0_2.model
                                                if L3_2 then
                                                  L3_2 = TriggerServerEvent
                                                  L4_2 = "vms_housing:sv:deleteFurniture"
                                                  L5_2 = A0_2.model
                                                  L3_2(L4_2, L5_2)
                                                  L2_2.actionName = "Open"
                                                else
                                                  return
                                                end
                                              else
                                                L3_2 = A0_2.action
                                                if "register" == L3_2 then
                                                  L3_2 = A0_2.props
                                                  if L3_2 then
                                                    L3_2 = Citizen
                                                    L3_2 = L3_2.CreateThread
                                                    function L4_2()
                                                      local L0_3, L1_3
                                                      L0_3 = RegisterFurniture
                                                      L1_3 = A0_2.props
                                                      L0_3(L1_3)
                                                    end
                                                    L3_2(L4_2)
                                                    L2_2.actionName = "Close"
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
      end
    end
  end
  ::lbl_354::
  L3_2 = Citizen
  L3_2 = L3_2.Wait
  L4_2 = 250
  L3_2(L4_2)
  L3_2 = L2_2.actionName
  if "Close" == L3_2 then
    L3_2 = SetNuiFocus
    L4_2 = false
    L5_2 = false
    L3_2(L4_2, L5_2)
  end
  L3_2 = SendNUIMessage
  L4_2 = L2_2
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:loadPropertyConfig"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = A0_2.id
  if not L2_2 then
    return
  end
  L2_2 = Properties
  L3_2 = tostring
  L4_2 = A0_2.id
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    return
  end
  L3_2 = L2_2.metadata
  L4_2 = houseConfiguration
  L5_2 = L2_2.type
  L4_2.type = L5_2
  L4_2 = L2_2.type
  if "shell" == L4_2 then
    L4_2 = houseConfiguration
    L5_2 = L3_2.shell
    L4_2.shell = L5_2
  else
    L4_2 = L2_2.type
    if "ipl" == L4_2 then
      L4_2 = houseConfiguration
      L5_2 = L3_2.ipl
      L4_2.ipl = L5_2
    else
      L4_2 = L2_2.type
      if "mlo" == L4_2 then
        L4_2 = houseConfiguration
        L5_2 = {}
        L6_2 = library
        L6_2 = L6_2.Deepcopy
        L7_2 = L3_2.interiorZone
        L7_2 = L7_2.points
        L6_2 = L6_2(L7_2)
        L5_2.points = L6_2
        L6_2 = L3_2.interiorZone
        L6_2 = L6_2.minZ
        L5_2.minZ = L6_2
        L6_2 = L3_2.interiorZone
        L6_2 = L6_2.maxZ
        L5_2.maxZ = L6_2
        L4_2.interiorZone = L5_2
        L4_2 = houseConfiguration
        L5_2 = library
        L5_2 = L5_2.Deepcopy
        L6_2 = L3_2.doors
        L5_2 = L5_2(L6_2)
        L4_2.doors = L5_2
        L4_2 = pairs
        L5_2 = houseConfiguration
        L5_2 = L5_2.doors
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = L9_2.left
          if L10_2 then
            L10_2 = L9_2.left
            L10_2 = L10_2.hash
            if L10_2 then
              L10_2 = L9_2.left
              L10_2.hash = nil
            end
          end
          L10_2 = L9_2.right
          if L10_2 then
            L10_2 = L9_2.right
            L10_2 = L10_2.hash
            if L10_2 then
              L10_2 = L9_2.right
              L10_2.hash = nil
            end
          end
          L10_2 = L9_2.hash
          if L10_2 then
            L9_2.hash = nil
          end
        end
        L4_2 = houseConfiguration
        L5_2 = library
        L5_2 = L5_2.Deepcopy
        L6_2 = L3_2.menu
        L5_2 = L5_2(L6_2)
        L4_2.menuCoords = L5_2
      end
    end
  end
  L4_2 = houseConfiguration
  L5_2 = L2_2.address
  L4_2.address = L5_2
  L4_2 = houseConfiguration
  L5_2 = L2_2.region
  L4_2.region = L5_2
  if L3_2 then
    L4_2 = L3_2.zone
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = {}
      L6_2 = library
      L6_2 = L6_2.Deepcopy
      L7_2 = L3_2.zone
      L7_2 = L7_2.points
      L6_2 = L6_2(L7_2)
      L5_2.points = L6_2
      L6_2 = L3_2.zone
      L6_2 = L6_2.minZ
      L5_2.minZ = L6_2
      L6_2 = L3_2.zone
      L6_2 = L6_2.maxZ
      L5_2.maxZ = L6_2
      L4_2.zone = L5_2
    end
    L4_2 = L3_2.wardrobe
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = {}
      L6_2 = L3_2.wardrobe
      L6_2 = L6_2.x
      L5_2.x = L6_2
      L6_2 = L3_2.wardrobe
      L6_2 = L6_2.y
      L5_2.y = L6_2
      L6_2 = L3_2.wardrobe
      L6_2 = L6_2.z
      L5_2.z = L6_2
      L4_2.wardrobeCoords = L5_2
    end
    L4_2 = L3_2.storage
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = {}
      L6_2 = L3_2.storage
      L6_2 = L6_2.x
      L5_2.x = L6_2
      L6_2 = L3_2.storage
      L6_2 = L6_2.y
      L5_2.y = L6_2
      L6_2 = L3_2.storage
      L6_2 = L6_2.z
      L5_2.z = L6_2
      L6_2 = tonumber
      L7_2 = L3_2.storage
      L7_2 = L7_2.slots
      if not L7_2 then
        L7_2 = 1
      end
      L6_2 = L6_2(L7_2)
      L5_2.slots = L6_2
      L6_2 = tonumber
      L7_2 = L3_2.storage
      L7_2 = L7_2.weight
      if not L7_2 then
        L7_2 = 1
      end
      L6_2 = L6_2(L7_2)
      L5_2.weight = L6_2
      L4_2.storageCoords = L5_2
    end
    L4_2 = L3_2.enter
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = {}
      L6_2 = L3_2.enter
      L6_2 = L6_2.x
      L5_2.x = L6_2
      L6_2 = L3_2.enter
      L6_2 = L6_2.y
      L5_2.y = L6_2
      L6_2 = L3_2.enter
      L6_2 = L6_2.z
      L5_2.z = L6_2
      L4_2.enterCoords = L5_2
    end
    L4_2 = L3_2.exit
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = {}
      L6_2 = L3_2.exit
      L6_2 = L6_2.x
      L5_2.x = L6_2
      L6_2 = L3_2.exit
      L6_2 = L6_2.y
      L5_2.y = L6_2
      L6_2 = L3_2.exit
      L6_2 = L6_2.z
      L5_2.z = L6_2
      L6_2 = L3_2.exit
      L6_2 = L6_2.w
      L5_2.w = L6_2
      L4_2.exitCoords = L5_2
    end
    L4_2 = L3_2.emergencyOutside
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = {}
      L6_2 = L3_2.emergencyOutside
      L6_2 = L6_2.x
      L5_2.x = L6_2
      L6_2 = L3_2.emergencyOutside
      L6_2 = L6_2.y
      L5_2.y = L6_2
      L6_2 = L3_2.emergencyOutside
      L6_2 = L6_2.z
      L5_2.z = L6_2
      L6_2 = L3_2.emergencyOutside
      L6_2 = L6_2.w
      L5_2.w = L6_2
      L4_2.emergencyOutsideCoords = L5_2
    end
    L4_2 = L3_2.emergencyInside
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = {}
      L6_2 = L3_2.emergencyInside
      L6_2 = L6_2.x
      L5_2.x = L6_2
      L6_2 = L3_2.emergencyInside
      L6_2 = L6_2.y
      L5_2.y = L6_2
      L6_2 = L3_2.emergencyInside
      L6_2 = L6_2.z
      L5_2.z = L6_2
      L4_2.emergencyInsideCoords = L5_2
    end
    L4_2 = L3_2.garage
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = {}
      L6_2 = L3_2.garage
      L6_2 = L6_2.x
      L5_2.x = L6_2
      L6_2 = L3_2.garage
      L6_2 = L6_2.y
      L5_2.y = L6_2
      L6_2 = L3_2.garage
      L6_2 = L6_2.z
      L5_2.z = L6_2
      L6_2 = L3_2.garage
      L6_2 = L6_2.w
      L5_2.w = L6_2
      L4_2.garageCoords = L5_2
    end
    L4_2 = L3_2.parking
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = library
      L5_2 = L5_2.Deepcopy
      L6_2 = L3_2.parking
      L5_2 = L5_2(L6_2)
      L4_2.parkingSpaces = L5_2
    end
    L4_2 = L3_2.deliveryType
    if L4_2 then
      L4_2 = houseConfiguration
      L5_2 = {}
      L6_2 = L3_2.delivery
      L6_2 = L6_2.x
      L5_2.x = L6_2
      L6_2 = L3_2.delivery
      L6_2 = L6_2.y
      L5_2.y = L6_2
      L6_2 = L3_2.delivery
      L6_2 = L6_2.z
      L5_2.z = L6_2
      L6_2 = L3_2.delivery
      L6_2 = L6_2.w
      L5_2.w = L6_2
      L4_2.deliveryPoint = L5_2
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:getAllBuildings"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = HousingCreator
  L2_2 = L2_2.GetObjects
  L3_2 = true
  L4_2 = true
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  L4_2 = A1_2
  L5_2 = {}
  L5_2.buildings = L2_2
  L5_2.motels = L3_2
  L4_2(L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:getBuildingParking"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = HousingCreator
  L2_2 = L2_2.GetBuildingParkingSpaces
  L3_2 = tostring
  L4_2 = A0_2.id
  L3_2, L4_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = A1_2
  L4_2 = L2_2
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:getAllProperties"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = Properties
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:getAllFurniture"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = Furniture
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:teleportToProperty"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = Properties
  L3_2 = tostring
  L4_2 = A0_2.id
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L3_2 = L2_2.metadata
    L3_2 = L3_2.menu
    if L3_2 then
      L3_2 = SetEntityCoords
      L4_2 = PlayerPedId
      L4_2 = L4_2()
      L5_2 = L2_2.metadata
      L5_2 = L5_2.menu
      L5_2 = L5_2.x
      L6_2 = L2_2.metadata
      L6_2 = L6_2.menu
      L6_2 = L6_2.y
      L7_2 = L2_2.metadata
      L7_2 = L7_2.menu
      L7_2 = L7_2.z
      L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  else
    if L2_2 then
      L3_2 = L2_2.metadata
      L3_2 = L3_2.exit
      if L3_2 then
        L3_2 = SetEntityCoords
        L4_2 = PlayerPedId
        L4_2 = L4_2()
        L5_2 = L2_2.metadata
        L5_2 = L5_2.exit
        L5_2 = L5_2.x
        L6_2 = L2_2.metadata
        L6_2 = L6_2.exit
        L6_2 = L6_2.y
        L7_2 = L2_2.metadata
        L7_2 = L7_2.exit
        L7_2 = L7_2.z
        L3_2(L4_2, L5_2, L6_2, L7_2)
    end
    else
      L3_2 = L2_2.object_id
      if L3_2 then
        L3_2 = Properties
        L4_2 = tostring
        L5_2 = L2_2.object_id
        L4_2 = L4_2(L5_2)
        L3_2 = L3_2[L4_2]
        if L3_2 then
          L4_2 = L3_2.metadata
          L4_2 = L4_2.exit
          if L4_2 then
            L4_2 = SetEntityCoords
            L5_2 = PlayerPedId
            L5_2 = L5_2()
            L6_2 = L3_2.metadata
            L6_2 = L6_2.exit
            L6_2 = L6_2.x
            L7_2 = L3_2.metadata
            L7_2 = L7_2.exit
            L7_2 = L7_2.y
            L8_2 = L3_2.metadata
            L8_2 = L8_2.exit
            L8_2 = L8_2.z
            L4_2(L5_2, L6_2, L7_2, L8_2)
          end
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:teleportToDoors"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = houseConfiguration
  L2_2 = L2_2.doors
  L3_2 = tonumber
  L4_2 = A0_2.id
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L3_2 = L2_2.type
    if "single" == L3_2 then
      L3_2 = SetEntityCoords
      L4_2 = PlayerPedId
      L4_2 = L4_2()
      L5_2 = L2_2.coords
      L5_2 = L5_2.x
      L6_2 = L2_2.coords
      L6_2 = L6_2.y
      L7_2 = L2_2.coords
      L7_2 = L7_2.z
      L3_2(L4_2, L5_2, L6_2, L7_2)
    else
      L3_2 = SetEntityCoords
      L4_2 = PlayerPedId
      L4_2 = L4_2()
      L5_2 = L2_2.center
      L5_2 = L5_2.x
      L6_2 = L2_2.center
      L6_2 = L6_2.y
      L7_2 = L2_2.center
      L7_2 = L7_2.z
      L3_2(L4_2, L5_2, L6_2, L7_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:removeOwner"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = TriggerServerEvent
  L3_2 = "vms_housing:sv:removeOwner"
  L4_2 = A0_2.id
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "creator:removeRenter"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = openedMenu
  if "HousingCreator" ~= L2_2 then
    return
  end
  L2_2 = TriggerServerEvent
  L3_2 = "vms_housing:sv:removeRenter"
  L4_2 = A0_2.id
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "apartments:getInformations"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.apartmentId
  if not L2_2 then
    return
  end
  L2_2 = tostring
  L3_2 = A0_2.apartmentId
  L2_2 = L2_2(L3_2)
  L3_2 = GetCurrentPropertyData
  L3_2 = L3_2()
  if L3_2 then
    L4_2 = L3_2.type
    if "building" == L4_2 then
      goto lbl_16
    end
  end
  do return end
  ::lbl_16::
  L4_2 = Properties
  L4_2 = L4_2[L2_2]
  if L4_2 then
    L5_2 = L4_2.object_id
    if L5_2 then
      goto lbl_24
    end
  end
  do return end
  ::lbl_24::
  SelectedApartment = L2_2
  L5_2 = tostring
  L6_2 = L4_2.object_id
  L5_2 = L5_2(L6_2)
  L6_2 = tostring
  L7_2 = L3_2.id
  L6_2 = L6_2(L7_2)
  if L5_2 ~= L6_2 then
    return
  end
  L5_2 = {}
  L6_2 = L4_2.owner
  if not L6_2 then
    L6_2 = L4_2.renter
    if not L6_2 then
      L6_2 = Property
      L7_2 = L6_2
      L6_2 = L6_2.ViewOffer
      L8_2 = L2_2
      L6_2(L7_2, L8_2)
      return
  end
  else
    L5_2.buildingData = L3_2
    L6_2 = ReloadApartmentMenu
    L6_2()
  end
  L6_2 = SendNUIMessage
  L7_2 = {}
  L7_2.action = "Property"
  L7_2.actionName = "ApartmentMenu"
  L7_2.data = L5_2
  L6_2(L7_2)
  L6_2 = SetNuiFocus
  L7_2 = true
  L8_2 = true
  L6_2(L7_2, L8_2)
  openedMenu = "ApartmentMenu"
end
L0_1(L1_1, L2_1)
L0_1 = 0
L1_1 = RegisterNUICallback
L2_1 = "apartments:action"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.action
  if L2_2 then
    L2_2 = A0_2.apartmentId
    if L2_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L2_2 = tostring
  L3_2 = A0_2.apartmentId
  L2_2 = L2_2(L3_2)
  L3_2 = L0_1
  if 0 ~= L3_2 then
    L3_2 = L0_1
    L3_2 = L3_2 + 3000
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    if L3_2 > L4_2 then
      L3_2 = CL
      L3_2 = L3_2.Notification
      L4_2 = TRANSLATE
      L5_2 = "notify.wait"
      L4_2 = L4_2(L5_2)
      L5_2 = 4500
      L6_2 = "error"
      return L3_2(L4_2, L5_2, L6_2)
    end
  end
  L3_2 = GetCurrentPropertyData
  L3_2 = L3_2()
  if L3_2 then
    L4_2 = L3_2.type
    if "building" == L4_2 then
      goto lbl_38
    end
  end
  do return end
  ::lbl_38::
  L4_2 = Properties
  L4_2 = L4_2[L2_2]
  if L4_2 then
    L5_2 = L4_2.object_id
    if L5_2 then
      L5_2 = tostring
      L6_2 = L4_2.object_id
      L5_2 = L5_2(L6_2)
      L6_2 = tostring
      L7_2 = GetCurrentPropertyId
      L7_2, L8_2, L9_2 = L7_2()
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      if L5_2 == L6_2 then
        goto lbl_55
      end
    end
  end
  do return end
  ::lbl_55::
  L5_2 = GetGameTimer
  L5_2 = L5_2()
  L0_1 = L5_2
  L5_2 = A0_2.action
  if "manage" == L5_2 then
    L5_2 = TargetHandler
    L5_2 = L5_2.Manage
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    L6_2 = L4_2.metadata
    L6_2 = L6_2.lockdown
    if not L6_2 then
      L6_2 = L5_2.action
      L6_2()
      SelectedApartment = nil
      L6_2 = SendNUIMessage
      L7_2 = {}
      L7_2.action = "Property"
      L7_2.actionName = "CloseViewOffer"
      L7_2.dontRemoveCurrentMenu = true
      L6_2(L7_2)
    end
  else
    L5_2 = A0_2.action
    if "lockdown" == L5_2 then
      L5_2 = L4_2.metadata
      L5_2 = L5_2.lockdown
      if not L5_2 then
        L5_2 = TriggerServerEvent
        L6_2 = "vms_housing:sv:lockdown"
        L7_2 = L2_2
        L5_2(L6_2, L7_2)
      end
    else
      L5_2 = A0_2.action
      if "remove_police_seal" == L5_2 then
        L5_2 = L4_2.metadata
        L5_2 = L5_2.lockdown
        if L5_2 then
          L5_2 = TriggerServerEvent
          L6_2 = "vms_housing:sv:removePoliceSeal"
          L7_2 = L2_2
          L5_2(L6_2, L7_2)
        end
      else
        L5_2 = A0_2.action
        if "raid" == L5_2 then
          L5_2 = TargetHandler
          L5_2 = L5_2.Raid
          L6_2 = L2_2
          function L7_2(A0_3)
            local L1_3, L2_3, L3_3
            if A0_3 then
              L1_3 = TriggerServerEvent
              L2_3 = "vms_housing:sv:raidProperty"
              L3_3 = L2_2
              L1_3(L2_3, L3_3)
            end
          end
          L5_2 = L5_2(L6_2, L7_2)
          L6_2 = Property
          L6_2 = L6_2.CloseOffer
          L6_2()
          L6_2 = L5_2.action
          L6_2()
        else
          L5_2 = A0_2.action
          if "raid_lock" == L5_2 then
            L5_2 = L4_2.isUnderRaid
            if L5_2 then
              L5_2 = Property
              L6_2 = L5_2
              L5_2 = L5_2.ToggleLock
              L7_2 = L2_2
              L8_2 = nil
              L9_2 = true
              L5_2(L6_2, L7_2, L8_2, L9_2)
            end
          else
            L5_2 = A0_2.action
            if "enter" == L5_2 then
              L5_2 = Property
              L6_2 = L5_2
              L5_2 = L5_2.EnterProperty
              L7_2 = L4_2
              L8_2 = L2_2
              function L9_2(A0_3)
                local L1_3
                if A0_3 then
                  L1_3 = Property
                  L1_3 = L1_3.CloseOffer
                  L1_3()
                end
              end
              L5_2(L6_2, L7_2, L8_2, L9_2)
            else
              L5_2 = A0_2.action
              if "doorbell" == L5_2 then
                L5_2 = TriggerServerEvent
                L6_2 = "vms_housing:sv:ringDoorbell"
                L7_2 = L2_2
                L5_2(L6_2, L7_2)
              else
                L5_2 = A0_2.action
                if "lock" == L5_2 then
                  L5_2 = L4_2.metadata
                  L5_2 = L5_2.lockdown
                  if not L5_2 then
                    L5_2 = Property
                    L6_2 = L5_2
                    L5_2 = L5_2.ToggleLock
                    L7_2 = L2_2
                    L5_2(L6_2, L7_2)
                  end
                else
                  L5_2 = A0_2.action
                  if "lockpick" == L5_2 then
                    L5_2 = TargetHandler
                    L5_2 = L5_2.Lockpick
                    L6_2 = L2_2
                    L7_2 = L4_2.metadata
                    if L7_2 then
                      L7_2 = L7_2.upgrades
                    end
                    if L7_2 then
                      L7_2 = L7_2.antiBurglaryDoors
                    end
                    L8_2 = L4_2.metadata
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
                      L3_3 = L2_2
                      L4_3 = A0_3
                      L1_3(L2_3, L3_3, L4_3)
                    end
                    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
                    L6_2 = L4_2.metadata
                    L6_2 = L6_2.locked
                    if L6_2 then
                      L6_2 = L4_2.metadata
                      L6_2 = L6_2.lockdown
                      if not L6_2 then
                        L6_2 = Property
                        L6_2 = L6_2.CloseOffer
                        L6_2()
                        L6_2 = L5_2.action
                        L6_2()
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
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "propertyOffer:enterHouse"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2.apartmentId
  if L2_2 then
    L2_2 = Properties
    L3_2 = A0_2.apartmentId
    L2_2 = L2_2[L3_2]
    if L2_2 then
      goto lbl_11
    end
  end
  L2_2 = GetCurrentPropertyData
  L2_2 = L2_2()
  ::lbl_11::
  if not L2_2 then
    return
  end
  L3_2 = L2_2.metadata
  L3_2 = L3_2.shell
  if L3_2 then
    L3_2 = AvailableShells
    L4_2 = L2_2.metadata
    L4_2 = L4_2.shell
    L3_2 = L3_2[L4_2]
    if not L3_2 then
      return
    end
    L3_2 = Property
    L3_2 = L3_2.CloseOffer
    L3_2()
    L3_2 = AvailableShells
    L4_2 = L2_2.metadata
    L4_2 = L4_2.shell
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.doors
    L4_2 = HousingCreator
    L4_2 = L4_2.EnterShell
    L5_2 = L2_2.metadata
    L5_2 = L5_2.shell
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      L0_3 = CL
      L0_3 = L0_3.HandleAction
      L1_3 = "enterInteriorPreview"
      L0_3(L1_3)
      L0_3 = TriggerServerEvent
      L1_3 = "vms_housing:sv:enterPreviewHouse"
      L2_3 = A0_2.apartmentId
      if not L2_3 then
        L2_3 = GetCurrentPropertyId
        L2_3 = L2_3()
      end
      L0_3(L1_3, L2_3)
      L0_3 = ToggleWeather
      if L0_3 then
        L0_3 = Citizen
        L0_3 = L0_3.CreateThread
        function L1_3()
          local L0_4, L1_4
          while true do
            L0_4 = CurrentShell
            if not L0_4 then
              break
            end
            L0_4 = CurrentShell
            if L0_4 then
              L0_4 = ToggleWeather
              L1_4 = true
              L0_4(L1_4)
            end
            L0_4 = Citizen
            L0_4 = L0_4.Wait
            L1_4 = 30000
            L0_4(L1_4)
          end
        end
        L0_3(L1_3)
      end
      L0_3 = nil
      L1_3 = CL
      L1_3 = L1_3.Target
      L2_3 = "zone"
      L3_3 = {}
      L4_3 = vector3
      L5_3 = L3_2.x
      L6_3 = L3_2.y
      L7_3 = L3_2.z
      L7_3 = L7_3 + 1.5
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      L3_3.coords = L4_3
      L4_3 = vec
      L5_3 = 1.5
      L6_3 = 2.1
      L7_3 = 2.0
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      L3_3.size = L4_3
      L4_3 = L3_2.heading
      L3_3.rotation = L4_3
      L4_3 = {}
      L5_3 = {}
      L5_3.name = "property-exit"
      L5_3.icon = "fa-solid fa-door-open"
      L6_3 = TRANSLATE
      L7_3 = "target.exit"
      L6_3 = L6_3(L7_3)
      L5_3.label = L6_3
      function L6_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4
        L0_4 = DeleteObject
        L1_4 = CurrentShell
        L0_4(L1_4)
        L0_4 = ToggleWeather
        if L0_4 then
          L0_4 = ToggleWeather
          L1_4 = false
          L0_4(L1_4)
        end
        L0_4 = L2_2.object_id
        if L0_4 then
          L0_4 = Properties
          L1_4 = tostring
          L2_4 = L2_2.object_id
          L1_4 = L1_4(L2_4)
          L0_4 = L0_4[L1_4]
          if L0_4 then
            L1_4 = L0_4.metadata
            L1_4 = L1_4.exit
            if L1_4 then
              L1_4 = SetEntityCoords
              L2_4 = PlayerPedId
              L2_4 = L2_4()
              L3_4 = L0_4.metadata
              L3_4 = L3_4.exit
              L3_4 = L3_4.x
              L4_4 = L0_4.metadata
              L4_4 = L4_4.exit
              L4_4 = L4_4.y
              L5_4 = L0_4.metadata
              L5_4 = L5_4.exit
              L5_4 = L5_4.z
              L1_4(L2_4, L3_4, L4_4, L5_4)
          end
          else
            L1_4 = SetEntityCoords
            L2_4 = PlayerPedId
            L2_4 = L2_4()
            L3_4 = L2_2.metadata
            L3_4 = L3_4.exit
            L3_4 = L3_4.x
            L4_4 = L2_2.metadata
            L4_4 = L4_4.exit
            L4_4 = L4_4.y
            L5_4 = L2_2.metadata
            L5_4 = L5_4.exit
            L5_4 = L5_4.z
            L1_4(L2_4, L3_4, L4_4, L5_4)
            L1_4 = SetEntityHeading
            L2_4 = PlayerPedId
            L2_4 = L2_4()
            L3_4 = L2_2.metadata
            L3_4 = L3_4.exit
            L3_4 = L3_4.w
            L1_4(L2_4, L3_4)
          end
        else
          L0_4 = SetEntityCoords
          L1_4 = PlayerPedId
          L1_4 = L1_4()
          L2_4 = L2_2.metadata
          L2_4 = L2_4.exit
          L2_4 = L2_4.x
          L3_4 = L2_2.metadata
          L3_4 = L3_4.exit
          L3_4 = L3_4.y
          L4_4 = L2_2.metadata
          L4_4 = L4_4.exit
          L4_4 = L4_4.z
          L0_4(L1_4, L2_4, L3_4, L4_4)
          L0_4 = SetEntityHeading
          L1_4 = PlayerPedId
          L1_4 = L1_4()
          L2_4 = L2_2.metadata
          L2_4 = L2_4.exit
          L2_4 = L2_4.w
          L0_4(L1_4, L2_4)
        end
        L0_4 = CL
        L0_4 = L0_4.HandleAction
        L1_4 = "exitInteriorPreview"
        L0_4(L1_4)
        L0_4 = TriggerServerEvent
        L1_4 = "vms_housing:sv:exitPreviewHouse"
        L2_4 = A0_2.apartmentId
        if not L2_4 then
          L2_4 = GetCurrentPropertyId
          L2_4 = L2_4()
        end
        L0_4(L1_4, L2_4)
        L0_4 = CL
        L0_4 = L0_4.Target
        L1_4 = "remove-zone"
        L2_4 = L0_3
        L0_4(L1_4, L2_4)
        CurrentShell = false
      end
      L5_3.action = L6_3
      L4_3[1] = L5_3
      L3_3.options = L4_3
      L1_3 = L1_3(L2_3, L3_3)
      L0_3 = L1_3
    end
    L4_2(L5_2, L6_2)
  else
    L3_2 = L2_2.metadata
    L3_2 = L3_2.ipl
    if L3_2 then
      L3_2 = AvailableIPLS
      L4_2 = L2_2.metadata
      L4_2 = L4_2.ipl
      L3_2 = L3_2[L4_2]
      if not L3_2 then
        return
      end
      L3_2 = Property
      L3_2 = L3_2.CloseOffer
      L3_2()
      L3_2 = AvailableIPLS
      L4_2 = L2_2.metadata
      L4_2 = L4_2.ipl
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.doors
      L4_2 = HousingCreator
      L4_2 = L4_2.EnterIPL
      L5_2 = L2_2.metadata
      L5_2 = L5_2.ipl
      function L6_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
        L0_3 = CL
        L0_3 = L0_3.HandleAction
        L1_3 = "enterInteriorPreview"
        L0_3(L1_3)
        L0_3 = TriggerServerEvent
        L1_3 = "vms_housing:sv:enterPreviewHouse"
        L2_3 = A0_2.apartmentId
        if not L2_3 then
          L2_3 = GetCurrentPropertyId
          L2_3 = L2_3()
        end
        L0_3(L1_3, L2_3)
        L0_3 = ToggleWeather
        if L0_3 then
          L0_3 = Citizen
          L0_3 = L0_3.CreateThread
          function L1_3()
            local L0_4, L1_4, L2_4
            while true do
              L0_4 = CurrentIPL
              if not L0_4 then
                break
              end
              L0_4 = CurrentIPL
              if L0_4 then
                L0_4 = ToggleWeather
                L1_4 = true
                L2_4 = true
                L0_4(L1_4, L2_4)
              end
              L0_4 = Citizen
              L0_4 = L0_4.Wait
              L1_4 = 30000
              L0_4(L1_4)
            end
          end
          L0_3(L1_3)
        end
        L0_3 = nil
        L1_3 = CL
        L1_3 = L1_3.Target
        L2_3 = "zone"
        L3_3 = {}
        L4_3 = vector3
        L5_3 = L3_2.x
        L6_3 = L3_2.y
        L7_3 = L3_2.z
        L7_3 = L7_3 + 1.5
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        L3_3.coords = L4_3
        L4_3 = vec
        L5_3 = 1.5
        L6_3 = 2.1
        L7_3 = 2.0
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        L3_3.size = L4_3
        L4_3 = L3_2.heading
        L3_3.rotation = L4_3
        L4_3 = {}
        L5_3 = {}
        L5_3.name = "property-exit"
        L5_3.icon = "fa-solid fa-door-open"
        L6_3 = TRANSLATE
        L7_3 = "target.exit"
        L6_3 = L6_3(L7_3)
        L5_3.label = L6_3
        function L6_3()
          local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4
          L0_4 = IPL
          L0_4 = L0_4.UnloadSettings
          L1_4 = CurrentIPL
          L0_4(L1_4)
          L0_4 = ToggleWeather
          if L0_4 then
            L0_4 = ToggleWeather
            L1_4 = false
            L0_4(L1_4)
          end
          L0_4 = L2_2.object_id
          if L0_4 then
            L0_4 = Properties
            L1_4 = tostring
            L2_4 = L2_2.object_id
            L1_4 = L1_4(L2_4)
            L0_4 = L0_4[L1_4]
            if L0_4 then
              L1_4 = L0_4.metadata
              L1_4 = L1_4.exit
              if L1_4 then
                L1_4 = SetEntityCoords
                L2_4 = PlayerPedId
                L2_4 = L2_4()
                L3_4 = L0_4.metadata
                L3_4 = L3_4.exit
                L3_4 = L3_4.x
                L4_4 = L0_4.metadata
                L4_4 = L4_4.exit
                L4_4 = L4_4.y
                L5_4 = L0_4.metadata
                L5_4 = L5_4.exit
                L5_4 = L5_4.z
                L1_4(L2_4, L3_4, L4_4, L5_4)
            end
            else
              L1_4 = SetEntityCoords
              L2_4 = PlayerPedId
              L2_4 = L2_4()
              L3_4 = L2_2.metadata
              L3_4 = L3_4.exit
              L3_4 = L3_4.x
              L4_4 = L2_2.metadata
              L4_4 = L4_4.exit
              L4_4 = L4_4.y
              L5_4 = L2_2.metadata
              L5_4 = L5_4.exit
              L5_4 = L5_4.z
              L1_4(L2_4, L3_4, L4_4, L5_4)
              L1_4 = SetEntityHeading
              L2_4 = PlayerPedId
              L2_4 = L2_4()
              L3_4 = L2_2.metadata
              L3_4 = L3_4.exit
              L3_4 = L3_4.w
              L1_4(L2_4, L3_4)
            end
          else
            L0_4 = SetEntityCoords
            L1_4 = PlayerPedId
            L1_4 = L1_4()
            L2_4 = L2_2.metadata
            L2_4 = L2_4.exit
            L2_4 = L2_4.x
            L3_4 = L2_2.metadata
            L3_4 = L3_4.exit
            L3_4 = L3_4.y
            L4_4 = L2_2.metadata
            L4_4 = L4_4.exit
            L4_4 = L4_4.z
            L0_4(L1_4, L2_4, L3_4, L4_4)
            L0_4 = SetEntityHeading
            L1_4 = PlayerPedId
            L1_4 = L1_4()
            L2_4 = L2_2.metadata
            L2_4 = L2_4.exit
            L2_4 = L2_4.w
            L0_4(L1_4, L2_4)
          end
          L0_4 = CL
          L0_4 = L0_4.HandleAction
          L1_4 = "exitInteriorPreview"
          L0_4(L1_4)
          L0_4 = TriggerServerEvent
          L1_4 = "vms_housing:sv:exitPreviewHouse"
          L2_4 = A0_2.apartmentId
          if not L2_4 then
            L2_4 = GetCurrentPropertyId
            L2_4 = L2_4()
          end
          L0_4(L1_4, L2_4)
          L0_4 = CL
          L0_4 = L0_4.Target
          L1_4 = "remove-zone"
          L2_4 = L0_3
          L0_4(L1_4, L2_4)
          CurrentIPL = false
        end
        L5_3.action = L6_3
        L4_3[1] = L5_3
        L3_3.options = L4_3
        L1_3 = L1_3(L2_3, L3_3)
        L0_3 = L1_3
      end
      L7_2 = A0_2.iplTheme
      if not L7_2 then
        L7_2 = L2_2.metadata
        L7_2 = L7_2.iplTheme
      end
      L4_2(L5_2, L6_2, L7_2)
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "propertyOffer:contractDone"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.contractType
  if "rent" == L2_2 then
    L2_2 = isOfferByMarketplace
    if L2_2 then
      L2_2 = TriggerServerEvent
      L3_2 = "vms_housing:sv:rentPropertyMarketplace"
      L4_2 = marketplaceOfferId
      L5_2 = A0_2.paymentMethod
      L6_2 = A0_2.rentCycle
      L7_2 = {}
      L8_2 = A0_2.apartmentId
      L7_2.apartmentId = L8_2
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    else
      L2_2 = TriggerServerEvent
      L3_2 = "vms_housing:sv:rentProperty"
      L4_2 = GetCurrentPropertyId
      L4_2 = L4_2()
      L5_2 = A0_2.paymentMethod
      L6_2 = A0_2.rentCycle
      L7_2 = {}
      L8_2 = A0_2.selectedTheme
      L7_2.selectedTheme = L8_2
      L8_2 = A0_2.apartmentId
      L7_2.apartmentId = L8_2
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  else
    L2_2 = isOfferByMarketplace
    if L2_2 then
      L2_2 = TriggerServerEvent
      L3_2 = "vms_housing:sv:purchasePropertyMarketplace"
      L4_2 = marketplaceOfferId
      L5_2 = A0_2.paymentMethod
      L6_2 = {}
      L7_2 = A0_2.apartmentId
      L6_2.apartmentId = L7_2
      L2_2(L3_2, L4_2, L5_2, L6_2)
    else
      L2_2 = TriggerServerEvent
      L3_2 = "vms_housing:sv:purchaseProperty"
      L4_2 = GetCurrentPropertyId
      L4_2 = L4_2()
      L5_2 = A0_2.paymentMethod
      L6_2 = {}
      L7_2 = A0_2.selectedTheme
      L6_2.selectedTheme = L7_2
      L7_2 = A0_2.apartmentId
      L6_2.apartmentId = L7_2
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
  end
  L2_2 = Property
  L2_2 = L2_2.CloseOffer
  L2_2()
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "propertyContract:send"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = MotelManageId
  if not L2_2 then
    L2_2 = CurrentProperty
    if not L2_2 then
      L2_2 = GetCurrentPropertyId
      L2_2 = L2_2()
    end
  end
  L3_2 = TriggerServerEvent
  L4_2 = "vms_housing:sv:sendPropertyContract"
  L5_2 = L2_2
  L6_2 = A0_2.contractType
  L7_2 = A0_2.player
  L8_2 = A0_2.price
  L9_2 = A0_2.paymentMethod
  L10_2 = A0_2.rentCycle
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L3_2 = closeManageMenu
  L3_2()
  L3_2 = Property
  L3_2 = L3_2.CloseOffer
  L3_2()
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "propertyContract:signed"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = TriggerServerEvent
  L3_2 = "vms_housing:sv:signedPropertyContract"
  L2_2(L3_2)
  L2_2 = Property
  L2_2 = L2_2.CloseOffer
  L2_2()
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "propertyTheme:edit"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = closeFurnitureMenu
  L2_2()
  L2_2 = editTheme
  L3_2 = A0_2.theme
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "propertyFurniture:edit"
function L3_1(A0_2, A1_2)
  local L2_2
  L2_2 = Property
  L2_2.EditingFurniture = true
  L2_2 = editFurniture
  L2_2()
  L2_2 = closeFurnitureMenu
  L2_2()
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "propertyFurniture:placeNew"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = manageFurniture
  L3_2 = false
  L4_2 = A0_2.model
  L5_2 = A0_2.id
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = closeFurnitureMenu
  L2_2()
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "propertyFurniture:purchaseAccept"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = Property
  L2_2 = L2_2.EditingTheme
  if L2_2 then
    L2_2 = library
    L2_2 = L2_2.Callback
    L3_2 = "vms_housing:buyTheme"
    function L4_2(A0_3)
      local L1_3, L2_3, L3_3
      if A0_3 then
        L1_3 = Property
        L1_3.EditingTheme = false
        L1_3 = SendNUIMessage
        L2_3 = {}
        L2_3.action = "Property"
        L2_3.actionName = "CloseFurniturePurchase"
        L1_3(L2_3)
        L1_3 = SetNuiFocus
        L2_3 = false
        L3_3 = false
        L1_3(L2_3, L3_3)
      end
    end
    L5_2 = CurrentProperty
    if not L5_2 then
      L5_2 = GetCurrentPropertyId
      L5_2 = L5_2()
    end
    L6_2 = Property
    L6_2 = L6_2.EditingTheme
    L7_2 = A0_2.paymentMethod
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  else
    L2_2 = library
    L2_2 = L2_2.Callback
    L3_2 = "vms_housing:buyFurniture"
    function L4_2(A0_3)
      local L1_3, L2_3, L3_3
      if A0_3 then
        L1_3 = Property
        L1_3.EditingFurniture = false
        L1_3 = DeleteObject
        L2_3 = Property
        L2_3 = L2_3.EditingFurnitureObj
        L1_3(L2_3)
        L1_3 = Property
        L1_3.EditingFurnitureObj = nil
        L1_3 = SendNUIMessage
        L2_3 = {}
        L2_3.action = "Property"
        L2_3.actionName = "CloseFurniturePurchase"
        L1_3(L2_3)
        L1_3 = SetNuiFocus
        L2_3 = false
        L3_3 = false
        L1_3(L2_3, L3_3)
      end
    end
    L5_2 = CurrentProperty
    if not L5_2 then
      L5_2 = GetCurrentPropertyId
      L5_2 = L5_2()
    end
    L6_2 = Property
    L6_2 = L6_2.EditingFurnitureData
    L7_2 = A0_2.paymentMethod
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "propertyFurniture:purchaseCancel"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "Property"
  L3_2.actionName = "CloseFurniturePurchase"
  L2_2(L3_2)
  L2_2 = Property
  L2_2 = L2_2.EditingTheme
  if L2_2 then
    L2_2 = CurrentIPL
    if L2_2 then
      L2_2 = CurrentPropertyData
      if not L2_2 then
        L2_2 = GetCurrentPropertyData
        L2_2 = L2_2()
      end
      L3_2 = IPL
      L3_2 = L3_2.LoadSettings
      L4_2 = CurrentIPL
      L5_2 = L2_2.metadata
      L5_2 = L5_2.iplTheme
      L6_2 = L2_2.metadata
      L6_2 = L6_2.iplSettings
      function L7_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
        L0_3 = GetEntityCoords
        L1_3 = PlayerPedId
        L1_3, L2_3, L3_3, L4_3, L5_3 = L1_3()
        L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
        L1_3 = SetEntityCoords
        L2_3 = PlayerPedId
        L2_3 = L2_3()
        L3_3 = L0_3.x
        L4_3 = L0_3.y
        L5_3 = L0_3.z
        L1_3(L2_3, L3_3, L4_3, L5_3)
      end
      L3_2(L4_2, L5_2, L6_2, L7_2)
      L3_2 = Property
      L3_2.EditingTheme = false
    end
  end
  L2_2 = Property
  L2_2 = L2_2.EditingFurnitureObj
  if L2_2 then
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.action = "ControlsMenu"
    L3_2.toggle = true
    L4_2 = furnitureMode
    if "gizmo" == L4_2 then
      L4_2 = "furniture:gizmo"
      if L4_2 then
        goto lbl_46
      end
    end
    L4_2 = "furniture:walkmode"
    ::lbl_46::
    L3_2.controlsLabel = L4_2
    L4_2 = furnitureMode
    if "gizmo" == L4_2 then
      L4_2 = "Furniture:gizmo"
      if L4_2 then
        goto lbl_54
      end
    end
    L4_2 = "Furniture:walkmode"
    ::lbl_54::
    L3_2.controlsName = L4_2
    L2_2(L3_2)
  end
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNuiCallback
L2_1 = "propertyManage:action"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.action
  if not L2_2 then
    return
  end
  L2_2 = MotelManageId
  if not L2_2 then
    L2_2 = CurrentProperty
    if not L2_2 then
      L2_2 = GetCurrentPropertyId
      L2_2 = L2_2()
    end
  end
  L3_2 = A0_2.action
  if "buy-key" == L3_2 then
    L3_2 = library
    L3_2 = L3_2.HasPermissions
    L4_2 = L2_2
    L5_2 = "keysManage"
    L3_2 = L3_2(L4_2, L5_2)
    if not L3_2 then
      return
    end
    L3_2 = library
    L3_2 = L3_2.ActionLimiter
    L3_2 = L3_2()
    if L3_2 then
      return
    end
    L3_2 = TriggerServerEvent
    L4_2 = "vms_housing:sv:buyKey"
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = A0_2.action
    if "lock-replacement" == L3_2 then
      L3_2 = library
      L3_2 = L3_2.HasPermissions
      L4_2 = L2_2
      L5_2 = "keysManage"
      L3_2 = L3_2(L4_2, L5_2)
      if not L3_2 then
        return
      end
      L3_2 = library
      L3_2 = L3_2.ActionLimiter
      L3_2 = L3_2()
      if L3_2 then
        return
      end
      L3_2 = TriggerServerEvent
      L4_2 = "vms_housing:sv:lockReplacement"
      L5_2 = L2_2
      L3_2(L4_2, L5_2)
    else
      L3_2 = A0_2.action
      if "take-to-storage" == L3_2 then
        L3_2 = A0_2.furnitureId
        if not L3_2 then
          return
        end
        L3_2 = library
        L3_2 = L3_2.HasPermissions
        L4_2 = L2_2
        L5_2 = "furniture"
        L3_2 = L3_2(L4_2, L5_2)
        if not L3_2 then
          return
        end
        L3_2 = TriggerServerEvent
        L4_2 = "vms_housing:sv:takeFurnitureToStorage"
        L5_2 = L2_2
        L6_2 = A0_2.furnitureId
        L3_2(L4_2, L5_2, L6_2)
      else
        L3_2 = A0_2.action
        if "checkout-furniture" == L3_2 then
          L3_2 = A0_2.payment
          if L3_2 then
            L3_2 = A0_2.model
            if L3_2 then
              goto lbl_88
            end
          end
          do return end
          ::lbl_88::
          L3_2 = library
          L3_2 = L3_2.HasPermissions
          L4_2 = L2_2
          L5_2 = "furniture"
          L3_2 = L3_2(L4_2, L5_2)
          if not L3_2 then
            return
          end
          L3_2 = Properties
          L4_2 = tostring
          L5_2 = L2_2
          L4_2 = L4_2(L5_2)
          L3_2 = L3_2[L4_2]
          L4_2 = L3_2.furniture
          if L4_2 then
            L4_2 = L3_2.furniture
            L4_2 = #L4_2
            L5_2 = GetFurnitureLimit
            L6_2 = L3_2.metadata
            L6_2 = L6_2.upgrades
            L5_2 = L5_2(L6_2)
            if L4_2 >= L5_2 then
              L4_2 = CL
              L4_2 = L4_2.Notification
              L5_2 = TRANSLATE
              L6_2 = "notify.property:reached_furniture_limit"
              L5_2 = L5_2(L6_2)
              L6_2 = 6000
              L7_2 = "error"
              return L4_2(L5_2, L6_2, L7_2)
            end
          end
          L4_2 = TriggerServerEvent
          L5_2 = "vms_housing:sv:checkoutFurniture"
          L6_2 = L2_2
          L7_2 = A0_2.payment
          L8_2 = A0_2.model
          L4_2(L5_2, L6_2, L7_2, L8_2)
        else
          L3_2 = A0_2.action
          if "purchase-upgrade" == L3_2 then
            L3_2 = A0_2.name
            if not L3_2 then
              return
            end
            L3_2 = library
            L3_2 = L3_2.HasPermissions
            L4_2 = L2_2
            L5_2 = "upgradesManage"
            L3_2 = L3_2(L4_2, L5_2)
            if not L3_2 then
              return
            end
            L3_2 = TriggerServerEvent
            L4_2 = "vms_housing:sv:upgrade"
            L5_2 = L2_2
            L6_2 = A0_2.name
            L3_2(L4_2, L5_2, L6_2)
          else
            L3_2 = A0_2.action
            if "marketplace-remove" == L3_2 then
              L3_2 = library
              L3_2 = L3_2.HasPermissions
              L4_2 = L2_2
              L5_2 = "marketplaceManage"
              L3_2 = L3_2(L4_2, L5_2)
              if not L3_2 then
                return
              end
              L3_2 = TriggerServerEvent
              L4_2 = "vms_housing:sv:marketplaceRemove"
              L5_2 = L2_2
              L3_2(L4_2, L5_2)
            else
              L3_2 = A0_2.action
              if "marketplace-add" == L3_2 then
                L3_2 = library
                L3_2 = L3_2.HasPermissions
                L4_2 = L2_2
                L5_2 = "marketplaceManage"
                L3_2 = L3_2(L4_2, L5_2)
                if not L3_2 then
                  return
                end
                L3_2 = library
                L3_2 = L3_2.ActionLimiter
                L3_2 = L3_2()
                if L3_2 then
                  return
                end
                L3_2 = TriggerServerEvent
                L4_2 = "vms_housing:sv:marketplaceAdd"
                L5_2 = L2_2
                L6_2 = A0_2
                L3_2(L4_2, L5_2, L6_2)
              else
                L3_2 = A0_2.action
                if "change-wardrobe-position" == L3_2 then
                  L3_2 = library
                  L3_2 = L3_2.HasPermissions
                  L4_2 = L2_2
                  L5_2 = "furniture"
                  L3_2 = L3_2(L4_2, L5_2)
                  if not L3_2 then
                    return
                  end
                  L3_2 = HousingCreator
                  L4_2 = L3_2
                  L3_2 = L3_2.CreateWardrobePoint
                  L5_2 = true
                  L3_2(L4_2, L5_2)
                  L3_2 = closeNUI
                  L3_2()
                else
                  L3_2 = A0_2.action
                  if "change-storage-position" == L3_2 then
                    L3_2 = library
                    L3_2 = L3_2.HasPermissions
                    L4_2 = L2_2
                    L5_2 = "furniture"
                    L3_2 = L3_2(L4_2, L5_2)
                    if not L3_2 then
                      return
                    end
                    L3_2 = HousingCreator
                    L4_2 = L3_2
                    L3_2 = L3_2.CreateStoragePoint
                    L5_2 = true
                    L3_2(L4_2, L5_2)
                    L3_2 = closeNUI
                    L3_2()
                  else
                    L3_2 = A0_2.action
                    if "check-cameras" == L3_2 then
                      L3_2 = checkCameras
                      L4_2 = L2_2
                      function L5_2(A0_3)
                        local L1_3, L2_3, L3_3, L4_3
                        if A0_3 then
                          L1_3 = closeNUI
                          L1_3()
                        else
                          L1_3 = CL
                          L1_3 = L1_3.Notification
                          L2_3 = TRANSLATE
                          L3_3 = "notify.cameras:no_cameras_installed"
                          L2_3 = L2_3(L3_3)
                          L3_3 = 3000
                          L4_3 = "error"
                          L1_3(L2_3, L3_3, L4_3)
                        end
                      end
                      L6_2 = A0_2.environment
                      L3_2(L4_2, L5_2, L6_2)
                    else
                      L3_2 = A0_2.action
                      if "remove-permission" == L3_2 then
                        L3_2 = library
                        L3_2 = L3_2.ActionLimiter
                        L3_2 = L3_2()
                        if L3_2 then
                          return
                        end
                        L3_2 = TriggerServerEvent
                        L4_2 = "vms_housing:sv:removePermission"
                        L5_2 = L2_2
                        L6_2 = A0_2.identifier
                        L3_2(L4_2, L5_2, L6_2)
                      else
                        L3_2 = A0_2.action
                        if "remove-key" == L3_2 then
                          L3_2 = library
                          L3_2 = L3_2.HasPermissions
                          L4_2 = L2_2
                          L5_2 = "keysManage"
                          L3_2 = L3_2(L4_2, L5_2)
                          if not L3_2 then
                            return
                          end
                          L3_2 = TriggerServerEvent
                          L4_2 = "vms_housing:sv:removeKey"
                          L5_2 = L2_2
                          L6_2 = A0_2.identifier
                          L3_2(L4_2, L5_2, L6_2)
                        else
                          L3_2 = A0_2.action
                          if "modal-accepted" == L3_2 then
                            L3_2 = A0_2.type
                            if "marketplace-sell" == L3_2 then
                              L3_2 = library
                              L3_2 = L3_2.HasPermissions
                              L4_2 = L2_2
                              L5_2 = "automaticSell"
                              L3_2 = L3_2(L4_2, L5_2)
                              if not L3_2 then
                                return
                              end
                              L3_2 = TriggerServerEvent
                              L4_2 = "vms_housing:sv:automaticSale"
                              L5_2 = L2_2
                              L3_2(L4_2, L5_2)
                            else
                              L3_2 = A0_2.type
                              if "pay-bill" == L3_2 then
                                L3_2 = library
                                L3_2 = L3_2.HasPermissions
                                L4_2 = L2_2
                                L5_2 = "billPayments"
                                L3_2 = L3_2(L4_2, L5_2)
                                if not L3_2 then
                                  return
                                end
                                L3_2 = TriggerServerEvent
                                L4_2 = "vms_housing:sv:payTheBill"
                                L5_2 = L2_2
                                L6_2 = A0_2.period
                                L7_2 = A0_2.billType
                                L3_2(L4_2, L5_2, L6_2, L7_2)
                              else
                                L3_2 = A0_2.type
                                if "make-photo" == L3_2 then
                                  L3_2 = library
                                  L3_2 = L3_2.HasPermissions
                                  L4_2 = L2_2
                                  L5_2 = "marketplaceManage"
                                  L3_2 = L3_2(L4_2, L5_2)
                                  if not L3_2 then
                                    return
                                  end
                                  L3_2 = Property
                                  L3_2 = L3_2.MarketplacePhotoMode
                                  L4_2 = L2_2
                                  L5_2 = A0_2.imageId
                                  L3_2(L4_2, L5_2)
                                else
                                  L3_2 = A0_2.type
                                  if "save-photo" == L3_2 then
                                    L3_2 = library
                                    L3_2 = L3_2.HasPermissions
                                    L4_2 = L2_2
                                    L5_2 = "marketplaceManage"
                                    L3_2 = L3_2(L4_2, L5_2)
                                    if L3_2 then
                                      L3_2 = A0_2.imageUrl
                                      if L3_2 then
                                        L3_2 = A0_2.imageUrl
                                        if "" ~= L3_2 then
                                          goto lbl_336
                                        end
                                      end
                                    end
                                    do return end
                                    ::lbl_336::
                                    L3_2 = TriggerServerEvent
                                    L4_2 = "vms_housing:sv:saveMarketplacePhoto"
                                    L5_2 = L2_2
                                    L6_2 = A0_2.imageId
                                    L7_2 = A0_2.imageUrl
                                    L3_2(L4_2, L5_2, L6_2, L7_2)
                                  else
                                    L3_2 = A0_2.type
                                    if "remove-photo" == L3_2 then
                                      L3_2 = library
                                      L3_2 = L3_2.HasPermissions
                                      L4_2 = L2_2
                                      L5_2 = "marketplaceManage"
                                      L3_2 = L3_2(L4_2, L5_2)
                                      if not L3_2 then
                                        return
                                      end
                                      L3_2 = TriggerServerEvent
                                      L4_2 = "vms_housing:sv:saveMarketplacePhoto"
                                      L5_2 = L2_2
                                      L6_2 = A0_2.imageId
                                      L7_2 = nil
                                      L3_2(L4_2, L5_2, L6_2, L7_2)
                                    else
                                      L3_2 = A0_2.type
                                      if "rental-terminate-now" == L3_2 then
                                        L3_2 = library
                                        L3_2 = L3_2.HasPermissions
                                        L4_2 = L2_2
                                        L5_2 = "rentersManage"
                                        L3_2 = L3_2(L4_2, L5_2)
                                        if not L3_2 then
                                          return
                                        end
                                        L3_2 = TriggerServerEvent
                                        L4_2 = "vms_housing:sv:rentalTerminateNow"
                                        L5_2 = L2_2
                                        L3_2(L4_2, L5_2)
                                      else
                                        L3_2 = A0_2.type
                                        if "rental-termination" == L3_2 then
                                          L3_2 = library
                                          L3_2 = L3_2.HasPermissions
                                          L4_2 = L2_2
                                          L5_2 = "rentersManage"
                                          L3_2 = L3_2(L4_2, L5_2)
                                          if not L3_2 then
                                            return
                                          end
                                          L3_2 = TriggerServerEvent
                                          L4_2 = "vms_housing:sv:setRentalTermination"
                                          L5_2 = L2_2
                                          L3_2(L4_2, L5_2)
                                        else
                                          L3_2 = A0_2.type
                                          if "rental-cancel-termination" == L3_2 then
                                            L3_2 = library
                                            L3_2 = L3_2.HasPermissions
                                            L4_2 = L2_2
                                            L5_2 = "rentersManage"
                                            L3_2 = L3_2(L4_2, L5_2)
                                            if not L3_2 then
                                              return
                                            end
                                            L3_2 = TriggerServerEvent
                                            L4_2 = "vms_housing:sv:clearRentalTermination"
                                            L5_2 = L2_2
                                            L3_2(L4_2, L5_2)
                                          else
                                            L3_2 = A0_2.type
                                            if "add-player-permission" == L3_2 then
                                              L3_2 = TriggerServerEvent
                                              L4_2 = "vms_housing:sv:addPermission"
                                              L5_2 = L2_2
                                              L6_2 = A0_2.id
                                              L3_2(L4_2, L5_2, L6_2)
                                            else
                                              L3_2 = A0_2.type
                                              if "save-permission" == L3_2 then
                                                L3_2 = TriggerServerEvent
                                                L4_2 = "vms_housing:sv:updatePermission"
                                                L5_2 = L2_2
                                                L6_2 = A0_2.identifier
                                                L7_2 = {}
                                                L8_2 = A0_2.garage
                                                L7_2.garage = L8_2
                                                L8_2 = A0_2.furniture
                                                L7_2.furniture = L8_2
                                                L8_2 = A0_2.billPayments
                                                L7_2.billPayments = L8_2
                                                L8_2 = A0_2.keysManage
                                                L7_2.keysManage = L8_2
                                                L8_2 = A0_2.upgradesManage
                                                L7_2.upgradesManage = L8_2
                                                L8_2 = A0_2.marketplaceManage
                                                L7_2.marketplaceManage = L8_2
                                                L8_2 = A0_2.sell
                                                L7_2.sell = L8_2
                                                L8_2 = A0_2.automaticSell
                                                L7_2.automaticSell = L8_2
                                                L8_2 = A0_2.rent
                                                L7_2.rent = L8_2
                                                L8_2 = A0_2.rentersManage
                                                L7_2.rentersManage = L8_2
                                                L3_2(L4_2, L5_2, L6_2, L7_2)
                                              else
                                                L3_2 = A0_2.type
                                                if "sell-furniture" == L3_2 then
                                                  L3_2 = A0_2.furnitureId
                                                  if not L3_2 then
                                                    return
                                                  end
                                                  L3_2 = library
                                                  L3_2 = L3_2.HasPermissions
                                                  L4_2 = L2_2
                                                  L5_2 = "furniture"
                                                  L3_2 = L3_2(L4_2, L5_2)
                                                  if not L3_2 then
                                                    return
                                                  end
                                                  L3_2 = TriggerServerEvent
                                                  L4_2 = "vms_housing:sv:sellFurniture"
                                                  L5_2 = L2_2
                                                  L6_2 = A0_2.furnitureId
                                                  L7_2 = A0_2.model
                                                  L3_2(L4_2, L5_2, L6_2, L7_2)
                                                else
                                                  L3_2 = A0_2.type
                                                  if "remove-furniture" == L3_2 then
                                                    L3_2 = A0_2.furnitureId
                                                    if not L3_2 then
                                                      return
                                                    end
                                                    L3_2 = library
                                                    L3_2 = L3_2.HasPermissions
                                                    L4_2 = L2_2
                                                    L5_2 = "furniture"
                                                    L3_2 = L3_2(L4_2, L5_2)
                                                    if not L3_2 then
                                                      return
                                                    end
                                                    L3_2 = TriggerServerEvent
                                                    L4_2 = "vms_housing:sv:removeFurniture"
                                                    L5_2 = L2_2
                                                    L6_2 = A0_2.furnitureId
                                                    L7_2 = A0_2.model
                                                    L3_2(L4_2, L5_2, L6_2, L7_2)
                                                  else
                                                    L3_2 = A0_2.type
                                                    if "give-key" == L3_2 then
                                                      L3_2 = library
                                                      L3_2 = L3_2.HasPermissions
                                                      L4_2 = L2_2
                                                      L5_2 = "keysManage"
                                                      L3_2 = L3_2(L4_2, L5_2)
                                                      if not L3_2 then
                                                        return
                                                      end
                                                      L3_2 = TriggerServerEvent
                                                      L4_2 = "vms_housing:sv:giveKey"
                                                      L5_2 = L2_2
                                                      L6_2 = A0_2.id
                                                      L3_2(L4_2, L5_2, L6_2)
                                                    else
                                                      L3_2 = A0_2.type
                                                      if "move-out" == L3_2 then
                                                        L3_2 = TriggerServerEvent
                                                        L4_2 = "vms_housing:sv:moveOut"
                                                        L5_2 = L2_2
                                                        L3_2(L4_2, L5_2)
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
          end
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNuiCallback
L2_1 = "marketplace:getProperty"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Properties
  L3_2 = tostring
  L4_2 = A0_2.id
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L3_2 = L2_2.sale
    if L3_2 then
      L3_2 = L2_2.sale
      L3_2 = L3_2.active
      if true == L3_2 then
        goto lbl_22
      end
    end
    L3_2 = L2_2.rental
    if L3_2 then
      L3_2 = L2_2.rental
      L3_2 = L3_2.active
      ::lbl_22::
      if true == L3_2 then
        L3_2 = {}
        L4_2 = L2_2.owner
        L5_2 = Identifier
        L4_2 = L4_2 == L5_2
        L3_2.isOwner = L4_2
        L4_2 = A0_2.id
        L3_2.id = L4_2
        L4_2 = L2_2.type
        L3_2.type = L4_2
        L4_2 = L2_2.name
        L3_2.name = L4_2
        L4_2 = L2_2.region
        L3_2.region = L4_2
        L4_2 = Config
        L4_2 = L4_2.Regions
        L5_2 = L2_2.region
        L4_2 = L4_2[L5_2]
        if not L4_2 then
          L4_2 = Config
          L4_2 = L4_2.NoRegion
        end
        L3_2.regionData = L4_2
        L4_2 = L2_2.address
        L3_2.address = L4_2
        L4_2 = L2_2.description
        L3_2.description = L4_2
        L4_2 = L2_2.metadata
        L3_2.metadata = L4_2
        L4_2 = L2_2.sale
        L3_2.sale = L4_2
        L4_2 = L2_2.rental
        L3_2.rental = L4_2
        L4_2 = L2_2.object_id
        if L4_2 then
          L4_2 = Properties
          L5_2 = tostring
          L6_2 = L2_2.object_id
          L5_2 = L5_2(L6_2)
          L4_2 = L4_2[L5_2]
          if L4_2 then
            L5_2 = {}
            L6_2 = L4_2.type
            L5_2.type = L6_2
            L6_2 = L4_2.name
            L5_2.name = L6_2
            L3_2.building = L5_2
          end
        end
        L4_2 = A1_2
        L5_2 = L3_2
        L4_2(L5_2)
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNuiCallback
L2_1 = "marketplace:markOnGps"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = Properties
  L3_2 = tostring
  L4_2 = A0_2.id
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if L2_2 then
    L3_2 = L2_2.metadata
    L3_2 = L3_2.enter
    if L3_2 then
      L3_2 = SetNewWaypoint
      L4_2 = L2_2.metadata
      L4_2 = L4_2.enter
      L4_2 = L4_2.x
      L5_2 = L2_2.metadata
      L5_2 = L5_2.enter
      L5_2 = L5_2.y
      L3_2(L4_2, L5_2)
      L3_2 = CL
      L3_2 = L3_2.Notification
      L4_2 = TRANSLATE
      L5_2 = "notify.marketplace:marked_on_gps"
      L4_2 = L4_2(L5_2)
      L5_2 = 5000
      L6_2 = "success"
      L3_2(L4_2, L5_2, L6_2)
    else
      L3_2 = L2_2.metadata
      L3_2 = L3_2.menu
      if L3_2 then
        L3_2 = SetNewWaypoint
        L4_2 = L2_2.metadata
        L4_2 = L4_2.menu
        L4_2 = L4_2.x
        L5_2 = L2_2.metadata
        L5_2 = L5_2.menu
        L5_2 = L5_2.y
        L3_2(L4_2, L5_2)
        L3_2 = CL
        L3_2 = L3_2.Notification
        L4_2 = TRANSLATE
        L5_2 = "notify.marketplace:marked_on_gps"
        L4_2 = L4_2(L5_2)
        L5_2 = 5000
        L6_2 = "success"
        L3_2(L4_2, L5_2, L6_2)
      else
        L3_2 = L2_2.object_id
        if L3_2 then
          L3_2 = Properties
          L4_2 = tostring
          L5_2 = L2_2.object_id
          L4_2 = L4_2(L5_2)
          L3_2 = L3_2[L4_2]
          L4_2 = L3_2.metadata
          L4_2 = L4_2.enter
          if L4_2 then
            L4_2 = SetNewWaypoint
            L5_2 = L3_2.metadata
            L5_2 = L5_2.enter
            L5_2 = L5_2.x
            L6_2 = L3_2.metadata
            L6_2 = L6_2.enter
            L6_2 = L6_2.y
            L4_2(L5_2, L6_2)
            L4_2 = CL
            L4_2 = L4_2.Notification
            L5_2 = TRANSLATE
            L6_2 = "notify.marketplace:marked_on_gps"
            L5_2 = L5_2(L6_2)
            L6_2 = 5000
            L7_2 = "success"
            L4_2(L5_2, L6_2, L7_2)
          end
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNuiCallback
L2_1 = "marketplace:showContract"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = Properties
  L3_2 = tostring
  L4_2 = A0_2.id
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if L2_2 then
    isOfferByMarketplace = true
    L3_2 = tostring
    L4_2 = A0_2.id
    L3_2 = L3_2(L4_2)
    marketplaceOfferId = L3_2
    L3_2 = Config
    L3_2 = L3_2.Regions
    L4_2 = L2_2.region
    L3_2 = L3_2[L4_2]
    if L3_2 then
      L3_2 = Config
      L3_2 = L3_2.Regions
      L4_2 = L2_2.region
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.electricity
      if L3_2 then
        goto lbl_29
      end
    end
    L3_2 = Config
    L3_2 = L3_2.NoRegion
    L3_2 = L3_2.electricity
    ::lbl_29::
    L4_2 = Config
    L4_2 = L4_2.Regions
    L5_2 = L2_2.region
    L4_2 = L4_2[L5_2]
    if L4_2 then
      L4_2 = Config
      L4_2 = L4_2.Regions
      L5_2 = L2_2.region
      L4_2 = L4_2[L5_2]
      L4_2 = L4_2.internet
      if L4_2 then
        goto lbl_45
      end
    end
    L4_2 = Config
    L4_2 = L4_2.NoRegion
    L4_2 = L4_2.internet
    ::lbl_45::
    L5_2 = Config
    L5_2 = L5_2.Regions
    L6_2 = L2_2.region
    L5_2 = L5_2[L6_2]
    if L5_2 then
      L5_2 = Config
      L5_2 = L5_2.Regions
      L6_2 = L2_2.region
      L5_2 = L5_2[L6_2]
      L5_2 = L5_2.water
      if L5_2 then
        goto lbl_61
      end
    end
    L5_2 = Config
    L5_2 = L5_2.NoRegion
    L5_2 = L5_2.water
    ::lbl_61::
    L6_2 = SendNUIMessage
    L7_2 = {}
    L7_2.action = "Property"
    L7_2.actionName = "ViewOfferContract"
    L8_2 = {}
    L8_2.isByMarketplace = true
    L9_2 = L2_2.address
    L8_2.address = L9_2
    L8_2.electricity = L3_2
    L8_2.internet = L4_2
    L8_2.water = L5_2
    L9_2 = L2_2.rental
    if L9_2 then
      L9_2 = L2_2.rental
      L9_2 = L9_2.active
      if L9_2 then
        L9_2 = L2_2.rental
        L9_2 = L9_2.price
        if L9_2 then
          goto lbl_86
        end
      end
    end
    L9_2 = nil
    ::lbl_86::
    L8_2.rentPrice = L9_2
    L9_2 = L2_2.sale
    if L9_2 then
      L9_2 = L2_2.sale
      L9_2 = L9_2.active
      if L9_2 then
        L9_2 = L2_2.sale
        L9_2 = L9_2.price
        if L9_2 then
          goto lbl_99
        end
      end
    end
    L9_2 = nil
    ::lbl_99::
    L8_2.purchasePrice = L9_2
    L7_2.data = L8_2
    L6_2(L7_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "getClosestPlayers"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = openedMenu
  if not L2_2 then
    return
  end
  L2_2 = CL
  L2_2 = L2_2.GetClosestPlayers
  L2_2 = L2_2()
  L3_2 = {}
  if L2_2 then
    L4_2 = next
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = pairs
      L5_2 = L2_2
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = PlayerId
        L10_2 = L10_2()
        if L9_2 ~= L10_2 then
          L10_2 = #L3_2
          L10_2 = L10_2 + 1
          L11_2 = GetPlayerServerId
          L12_2 = L9_2
          L11_2 = L11_2(L12_2)
          L3_2[L10_2] = L11_2
        end
      end
    end
  end
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.action = "Property"
  L5_2.actionName = "RefreshClosestPlayers"
  L5_2.data = L3_2
  L4_2(L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "sendNotification"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = CL
  L2_2 = L2_2.Notification
  L3_2 = TRANSLATE
  L4_2 = A0_2.name
  L3_2 = L3_2(L4_2)
  L4_2 = 5000
  L5_2 = A0_2.type
  L2_2(L3_2, L4_2, L5_2)
end
L1_1(L2_1, L3_1)
