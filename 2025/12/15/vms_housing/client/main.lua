local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:cl:playerDropped"
function L2_1()
  local L0_2, L1_2
  L0_2 = ToggleWeather
  if L0_2 then
    L0_2 = ToggleWeather
    L1_2 = false
    L0_2(L1_2)
  end
  L0_2 = CurrentShell
  if L0_2 then
    L0_2 = DeleteObject
    L1_2 = CurrentShell
    L0_2(L1_2)
  end
  L0_2 = Property
  L1_2 = L0_2
  L0_2 = L0_2.RemoveFurniture
  L0_2(L1_2)
  L0_2 = Config
  L0_2 = L0_2.Marketplace
  L0_2 = L0_2.__ped
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = Config
    L1_2 = L1_2.Marketplace
    L1_2 = L1_2.__ped
    L0_2(L1_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:cl:createdHouse"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = Properties
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = Properties
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.type
    if "mlo" == L2_2 then
      L2_2 = Properties
      L2_2 = L2_2[A0_2]
      L2_2 = L2_2.metadata
      if L2_2 then
        L2_2 = L2_2.doors
      end
      if L2_2 then
        L2_2 = pairs
        L3_2 = Properties
        L3_2 = L3_2[A0_2]
        L3_2 = L3_2.metadata
        L3_2 = L3_2.doors
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = L7_2.type
          if "double" == L8_2 then
            L8_2 = L7_2.left
            if L8_2 then
              L8_2 = L7_2.left
              L8_2 = L8_2.hash
              if L8_2 then
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
                L10_2 = 0
                L11_2 = false
                L12_2 = false
                L8_2(L9_2, L10_2, L11_2, L12_2)
              end
            end
            L8_2 = L7_2.right
            if L8_2 then
              L8_2 = L7_2.right
              L8_2 = L8_2.hash
              if L8_2 then
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
                L10_2 = 0
                L11_2 = false
                L12_2 = false
                L8_2(L9_2, L10_2, L11_2, L12_2)
              end
            end
          end
          L8_2 = L7_2.hash
          if L8_2 then
            L8_2 = DoorSystemSetDoorState
            L9_2 = L7_2.hash
            L10_2 = 4
            L11_2 = false
            L12_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2)
            L8_2 = DoorSystemSetDoorState
            L9_2 = L7_2.hash
            L10_2 = 0
            L11_2 = false
            L12_2 = false
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
        end
      end
    end
  end
  L2_2 = Properties
  L2_2[A0_2] = A1_2
  L2_2 = Properties
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = Properties
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.type
    if "mlo" == L2_2 then
      L2_2 = Properties
      L2_2 = L2_2[A0_2]
      L2_2 = L2_2.metadata
      if L2_2 then
        L2_2 = L2_2.doors
      end
      if L2_2 then
        L2_2 = Property
        L3_2 = L2_2
        L2_2 = L2_2.RegisterDoors
        L4_2 = {}
        L4_2.propertyId = A0_2
        L5_2 = Properties
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.owner
        L5_2 = Properties
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.renter
        L5_2 = not L5_2 and L5_2
        L4_2.forceLock = L5_2
        L5_2 = Properties
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.metadata
        L5_2 = L5_2.doors
        L4_2.doors = L5_2
        L2_2(L3_2, L4_2)
      end
    end
  end
  L2_2 = RefreshBlips
  L2_2()
  L2_2 = GetCurrentPropertyId
  L2_2 = L2_2()
  if L2_2 ~= A0_2 then
    L2_2 = Properties
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2.object_id
    if not L2_2 then
      goto lbl_153
    end
    L2_2 = GetCurrentPropertyId
    L2_2 = L2_2()
    L3_2 = tostring
    L4_2 = Properties
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2.object_id
    L3_2 = L3_2(L4_2)
    if L2_2 ~= L3_2 then
      goto lbl_153
    end
  end
  L2_2 = ExitZone
  L2_2()
  ::lbl_153::
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:cl:removedHouse"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = Properties
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = Properties
    L1_2 = L1_2[A0_2]
    L1_2 = L1_2.type
    if "mlo" == L1_2 then
      L1_2 = Properties
      L1_2 = L1_2[A0_2]
      L1_2 = L1_2.metadata
      if L1_2 then
        L1_2 = L1_2.doors
      end
      if L1_2 then
        L1_2 = pairs
        L2_2 = Properties
        L2_2 = L2_2[A0_2]
        L2_2 = L2_2.metadata
        L2_2 = L2_2.doors
        L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
        for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
          L7_2 = L6_2.type
          if "double" == L7_2 then
            L7_2 = L6_2.left
            if L7_2 then
              L7_2 = L6_2.left
              L7_2 = L7_2.hash
              if L7_2 then
                L7_2 = DoorSystemSetDoorState
                L8_2 = L6_2.left
                L8_2 = L8_2.hash
                L9_2 = 4
                L10_2 = false
                L11_2 = false
                L7_2(L8_2, L9_2, L10_2, L11_2)
                L7_2 = DoorSystemSetDoorState
                L8_2 = L6_2.left
                L8_2 = L8_2.hash
                L9_2 = 0
                L10_2 = false
                L11_2 = false
                L7_2(L8_2, L9_2, L10_2, L11_2)
                L7_2 = RemoveDoorFromSystem
                L8_2 = L6_2.left
                L8_2 = L8_2.hash
                L7_2(L8_2)
              end
            end
            L7_2 = L6_2.right
            if L7_2 then
              L7_2 = L6_2.right
              L7_2 = L7_2.hash
              if L7_2 then
                L7_2 = DoorSystemSetDoorState
                L8_2 = L6_2.right
                L8_2 = L8_2.hash
                L9_2 = 4
                L10_2 = false
                L11_2 = false
                L7_2(L8_2, L9_2, L10_2, L11_2)
                L7_2 = DoorSystemSetDoorState
                L8_2 = L6_2.right
                L8_2 = L8_2.hash
                L9_2 = 0
                L10_2 = false
                L11_2 = false
                L7_2(L8_2, L9_2, L10_2, L11_2)
                L7_2 = RemoveDoorFromSystem
                L8_2 = L6_2.right
                L8_2 = L8_2.hash
                L7_2(L8_2)
              end
            end
          end
          L7_2 = L6_2.hash
          if L7_2 then
            L7_2 = DoorSystemSetDoorState
            L8_2 = L6_2.hash
            L9_2 = 4
            L10_2 = false
            L11_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2)
            L7_2 = DoorSystemSetDoorState
            L8_2 = L6_2.hash
            L9_2 = 0
            L10_2 = false
            L11_2 = false
            L7_2(L8_2, L9_2, L10_2, L11_2)
            L7_2 = RemoveDoorFromSystem
            L8_2 = L6_2.hash
            L7_2(L8_2)
          end
        end
      end
    end
  end
  L1_2 = Properties
  L1_2[A0_2] = nil
  L1_2 = RefreshBlips
  L1_2()
  L1_2 = GetCurrentPropertyId
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = ExitZone
    L1_2()
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:cl:enterHouse"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = GetProperty
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = CurrentShell
  if L2_2 then
    return
  end
  L2_2 = CurrentIPL
  if L2_2 then
    return
  end
  L2_2 = library
  L2_2 = L2_2.CallbackAwait
  L3_2 = "vms_housing:isAllowedToUseAdmin"
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = L1_2.type
  if "shell" == L3_2 then
    L3_2 = AvailableShells
    L4_2 = L1_2.metadata
    L4_2 = L4_2.shell
    L3_2 = L3_2[L4_2]
    if not L3_2 then
      L3_2 = warn
      L4_2 = "Could not find shell \""
      L5_2 = L1_2.metadata
      L5_2 = L5_2.shell
      L6_2 = "\"!"
      L4_2 = L4_2 .. L5_2 .. L6_2
      return L3_2(L4_2)
    end
    L3_2 = library
    L3_2 = L3_2.RequestEntity
    L4_2 = L1_2.metadata
    L4_2 = L4_2.shell
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L4_2 = warn
      L5_2 = "Failed to load shell \""
      L6_2 = L1_2.metadata
      L6_2 = L6_2.shell
      L7_2 = "\" - make sure it is running!"
      L5_2 = L5_2 .. L6_2 .. L7_2
      return L4_2(L5_2)
    end
  else
    L3_2 = L1_2.type
    if "ipl" == L3_2 then
      L3_2 = AvailableIPLS
      L4_2 = L1_2.metadata
      L4_2 = L4_2.ipl
      L3_2 = L3_2[L4_2]
      if not L3_2 then
        L3_2 = warn
        L4_2 = "Could not find ipl \""
        L5_2 = L1_2.metadata
        L5_2 = L5_2.ipl
        L6_2 = "\"!"
        L4_2 = L4_2 .. L5_2 .. L6_2
        return L3_2(L4_2)
      end
    else
      return
    end
  end
  L3_2 = Property
  L4_2 = L3_2
  L3_2 = L3_2.RemoveFurniture
  L3_2(L4_2)
  L3_2 = DoScreenFadeOut
  L4_2 = 1500
  L3_2(L4_2)
  L3_2 = Wait
  L4_2 = 1500
  L3_2(L4_2)
  L3_2 = FreezeEntityPosition
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = tostring
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  CurrentProperty = L3_2
  CurrentPropertyData = L1_2
  L3_2 = L1_2.type
  if "shell" == L3_2 then
    L3_2 = CreateObjectNoOffset
    L4_2 = joaat
    L5_2 = L1_2.metadata
    L5_2 = L5_2.shell
    L4_2 = L4_2(L5_2)
    L5_2 = 0.0
    L6_2 = 0.0
    L7_2 = 500.0
    L8_2 = false
    L9_2 = false
    L10_2 = false
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    CurrentShell = L3_2
    while true do
      L3_2 = DoesEntityExist
      L4_2 = CurrentShell
      L3_2 = L3_2(L4_2)
      if L3_2 then
        break
      end
      L3_2 = Wait
      L4_2 = 1
      L3_2(L4_2)
    end
    L3_2 = SetEntityHeading
    L4_2 = CurrentShell
    L5_2 = 0.0
    L3_2(L4_2, L5_2)
    L3_2 = FreezeEntityPosition
    L4_2 = CurrentShell
    L5_2 = true
    L3_2(L4_2, L5_2)
    L3_2 = Property
    L4_2 = L3_2
    L3_2 = L3_2.LoadStaticInteractable
    L5_2 = AvailableShells
    L6_2 = L1_2.metadata
    L6_2 = L6_2.shell
    L5_2 = L5_2[L6_2]
    L3_2(L4_2, L5_2)
  else
    L3_2 = L1_2.type
    if "ipl" == L3_2 then
      L3_2 = L1_2.metadata
      L3_2 = L3_2.ipl
      CurrentIPL = L3_2
      L3_2 = IPL
      L3_2 = L3_2.LoadSettings
      L4_2 = CurrentIPL
      L5_2 = L1_2.metadata
      L5_2 = L5_2.iplTheme
      L6_2 = L1_2.metadata
      L6_2 = L6_2.iplSettings
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = Property
      L4_2 = L3_2
      L3_2 = L3_2.LoadStaticInteractable
      L5_2 = AvailableIPLS
      L6_2 = L1_2.metadata
      L6_2 = L6_2.ipl
      L5_2 = L5_2[L6_2]
      L3_2(L4_2, L5_2)
    end
  end
  L3_2 = TriggerServerEvent
  L4_2 = "vms_housing:sv:enterHouse"
  L5_2 = CurrentProperty
  L3_2(L4_2, L5_2)
  L3_2 = ToggleWeather
  if L3_2 then
    L3_2 = Citizen
    L3_2 = L3_2.CreateThread
    function L4_2()
      local L0_3, L1_3, L2_3
      while true do
        L0_3 = CurrentShell
        if not L0_3 then
          L0_3 = CurrentIPL
          if not L0_3 then
            break
          end
        end
        L0_3 = CurrentShell
        if not L0_3 then
          L0_3 = CurrentIPL
          if not L0_3 then
            goto lbl_21
          end
        end
        L0_3 = ToggleWeather
        L1_3 = true
        L2_3 = L1_2.type
        L2_3 = "ipl" == L2_3
        L0_3(L1_3, L2_3)
        ::lbl_21::
        L0_3 = Citizen
        L0_3 = L0_3.Wait
        L1_3 = 30000
        L0_3(L1_3)
      end
    end
    L3_2(L4_2)
  end
  L3_2 = Wait
  L4_2 = 1500
  L3_2(L4_2)
  L3_2 = CurrentPropertyData
  L3_2 = L3_2.metadata
  L3_2 = L3_2.lightState
  if nil ~= L3_2 then
    L3_2 = SetArtificialLightsState
    L4_2 = CurrentPropertyData
    L4_2 = L4_2.metadata
    L4_2 = L4_2.lightState
    L4_2 = not L4_2
    L3_2(L4_2)
  end
  L3_2 = DoScreenFadeIn
  L4_2 = 1500
  L3_2(L4_2)
  if L1_2 then
    L3_2 = L1_2.furniture
    if L3_2 then
      L3_2 = Property
      L4_2 = L3_2
      L3_2 = L3_2.LoadFurniture
      L5_2 = "inside"
      L6_2 = L1_2.furniture
      L7_2 = CurrentProperty
      L3_2(L4_2, L5_2, L6_2, L7_2)
    end
  end
  L3_2 = FreezeEntityPosition
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = RefreshTargets
  L3_2()
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:cl:usedKeyItem"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = GetEntityCoords
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = Properties
  L4_2 = L4_2[A0_2]
  L5_2 = false
  L6_2 = L4_2.object_id
  if L6_2 then
    L6_2 = tostring
    L7_2 = GetCurrentPropertyId
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L7_2()
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L7_2 = tostring
    L8_2 = L4_2.object_id
    L7_2 = L7_2(L8_2)
    L5_2 = L6_2 == L7_2
  end
  L6_2 = GetCurrentPropertyId
  L6_2 = L6_2()
  if L6_2 == A0_2 or L5_2 then
    L6_2 = L4_2.type
    if "mlo" == L6_2 then
      L6_2 = L4_2.metadata
      L6_2 = L6_2.doors
      if not L6_2 then
        goto lbl_259
      end
      L6_2 = nil
      L7_2 = pairs
      L8_2 = L4_2.metadata
      L8_2 = L8_2.doors
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        L13_2 = L12_2.type
        if "slide_gate" == L13_2 then
          L13_2 = L3_2.xyz
          L14_2 = vector3
          L15_2 = L12_2.coords
          L15_2 = L15_2.x
          L16_2 = L12_2.coords
          L16_2 = L16_2.y
          L17_2 = L12_2.coords
          L17_2 = L17_2.z
          L14_2 = L14_2(L15_2, L16_2, L17_2)
          L13_2 = L13_2 - L14_2
          L13_2 = #L13_2
          L14_2 = L12_2.distance
          if not L14_2 then
            L14_2 = 8.5
          end
          if L13_2 < L14_2 then
            L6_2 = L11_2
          end
        else
          L13_2 = L12_2.type
          if "double" == L13_2 then
            L13_2 = L3_2.xyz
            L14_2 = vector3
            L15_2 = L12_2.center
            L15_2 = L15_2.x
            L16_2 = L12_2.center
            L16_2 = L16_2.y
            L17_2 = L12_2.center
            L17_2 = L17_2.z
            L14_2 = L14_2(L15_2, L16_2, L17_2)
            L13_2 = L13_2 - L14_2
            L13_2 = #L13_2
            L14_2 = L12_2.distance
            if not L14_2 then
              L14_2 = 1.5
            end
            if L13_2 < L14_2 then
              L6_2 = L11_2
              break
            end
          else
            L13_2 = L12_2.type
            if "single" == L13_2 then
              L13_2 = L3_2.xyz
              L14_2 = vector3
              L15_2 = L12_2.coords
              L15_2 = L15_2.x
              L16_2 = L12_2.coords
              L16_2 = L16_2.y
              L17_2 = L12_2.coords
              L17_2 = L17_2.z
              L14_2 = L14_2(L15_2, L16_2, L17_2)
              L13_2 = L13_2 - L14_2
              L13_2 = #L13_2
              L14_2 = L12_2.distance
              if not L14_2 then
                L14_2 = 1.5
              end
              if L13_2 < L14_2 then
                L6_2 = L11_2
                break
              end
            end
          end
        end
      end
      if not L6_2 then
        goto lbl_259
      end
      L7_2 = Property
      L7_2 = L7_2.LastLockedDoors
      if L7_2 then
        L7_2 = Property
        L7_2 = L7_2.LastLockedDoors
        if not L7_2 then
          goto lbl_146
        end
        L7_2 = GetGameTimer
        L7_2 = L7_2()
        L8_2 = Property
        L8_2 = L8_2.LastLockedDoors
        if not (L7_2 > L8_2) then
          goto lbl_146
        end
      end
      L7_2 = TriggerServerEvent
      L8_2 = "vms_housing:sv:toggleDoorlock"
      L9_2 = A0_2
      L10_2 = L6_2
      L11_2 = nil
      L12_2 = false
      L13_2 = false
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L7_2 = Property
      L8_2 = GetGameTimer
      L8_2 = L8_2()
      L8_2 = L8_2 + 2000
      L7_2.LastLockedDoors = L8_2
      goto lbl_259
      ::lbl_146::
      L7_2 = CL
      L7_2 = L7_2.Notification
      L8_2 = TRANSLATE
      L9_2 = "notify.doors:wait"
      L8_2 = L8_2(L9_2)
      L9_2 = 3500
      L10_2 = "info"
      L7_2(L8_2, L9_2, L10_2)
    else
      L6_2 = L4_2.metadata
      if L6_2 then
        L6_2 = L4_2.metadata
        L6_2 = L6_2.enter
        if L6_2 then
          L6_2 = L3_2.xyz
          L7_2 = vector3
          L8_2 = L4_2.metadata
          L8_2 = L8_2.enter
          L8_2 = L8_2.x
          L9_2 = L4_2.metadata
          L9_2 = L9_2.enter
          L9_2 = L9_2.y
          L10_2 = L4_2.metadata
          L10_2 = L10_2.enter
          L10_2 = L10_2.z
          L7_2 = L7_2(L8_2, L9_2, L10_2)
          L6_2 = L6_2 - L7_2
          L6_2 = #L6_2
          L7_2 = 1.5
          if L6_2 > L7_2 then
            return
          end
          L7_2 = Property
          L8_2 = L7_2
          L7_2 = L7_2.ToggleLock
          L9_2 = A0_2
          L10_2 = A1_2
          L7_2(L8_2, L9_2, L10_2)
        end
      end
    end
  else
    L6_2 = CurrentProperty
    if L6_2 == A0_2 then
      L6_2 = CurrentShell
      if L6_2 then
        L6_2 = AvailableShells
        L7_2 = L4_2.metadata
        L7_2 = L7_2.shell
        L6_2 = L6_2[L7_2]
        if L6_2 then
          L7_2 = L6_2.doors
          if L7_2 then
            goto lbl_203
          end
        end
        do return end
        ::lbl_203::
        L7_2 = L3_2.xyz
        L8_2 = vector3
        L9_2 = L6_2.doors
        L9_2 = L9_2.x
        L10_2 = L6_2.doors
        L10_2 = L10_2.y
        L11_2 = L6_2.doors
        L11_2 = L11_2.z
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        L7_2 = L7_2 - L8_2
        L7_2 = #L7_2
        L8_2 = 1.5
        if L7_2 > L8_2 then
          return
        end
        L8_2 = Property
        L9_2 = L8_2
        L8_2 = L8_2.ToggleLock
        L10_2 = A0_2
        L11_2 = A1_2
        L8_2(L9_2, L10_2, L11_2)
      else
        L6_2 = CurrentIPL
        if L6_2 then
          L6_2 = AvailableIPLS
          L7_2 = L4_2.metadata
          L7_2 = L7_2.ipl
          L6_2 = L6_2[L7_2]
          if L6_2 then
            L7_2 = L6_2.doors
            if L7_2 then
              goto lbl_238
            end
          end
          do return end
          ::lbl_238::
          L7_2 = L3_2.xyz
          L8_2 = vector3
          L9_2 = L6_2.doors
          L9_2 = L9_2.x
          L10_2 = L6_2.doors
          L10_2 = L10_2.y
          L11_2 = L6_2.doors
          L11_2 = L11_2.z
          L8_2 = L8_2(L9_2, L10_2, L11_2)
          L7_2 = L7_2 - L8_2
          L7_2 = #L7_2
          L8_2 = 1.5
          if L7_2 > L8_2 then
            return
          end
          L8_2 = Property
          L9_2 = L8_2
          L8_2 = L8_2.ToggleLock
          L10_2 = A0_2
          L11_2 = A1_2
          L8_2(L9_2, L10_2, L11_2)
        end
      end
    end
  end
  ::lbl_259::
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:cl:updateProperty"
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L4_2 = tostring
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  L5_2 = false
  L6_2 = false
  L7_2 = false
  L8_2 = false
  L9_2 = false
  L10_2 = Properties
  L10_2 = L10_2[L4_2]
  if not L10_2 and "deliveredFurniture" ~= A0_2 then
    return
  end
  L10_2 = Properties
  if L10_2 then
    L10_2 = L10_2[L4_2]
  end
  if L10_2 then
    L10_2 = L10_2.object_id
  end
  L11_2 = false
  if L10_2 then
    L12_2 = tostring
    L13_2 = L10_2
    L12_2 = L12_2(L13_2)
    L10_2 = L12_2
    L12_2 = Properties
    L12_2 = L12_2[L10_2]
    L11_2 = L12_2 or L11_2
    if L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L10_2]
      L12_2 = L12_2.type
      L11_2 = "building" == L12_2
    end
  end
  if "newOwner" == A0_2 then
    L12_2 = Property
    L13_2 = L12_2
    L12_2 = L12_2.UnlockDoors
    L14_2 = Properties
    L14_2 = L14_2[L4_2]
    L14_2 = L14_2.metadata
    if L14_2 then
      L14_2 = L14_2.doors
    end
    L12_2(L13_2, L14_2)
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.owner
    L12_2.owner = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.owner_name
    L12_2.owner_name = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.renter
    L12_2.renter = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.renter_name
    L12_2.renter_name = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.sale
    L12_2.sale = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.rental
    L12_2.rental = L13_2
    L12_2 = A2_2.permissions
    if L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.permissions
      L12_2.permissions = L13_2
    end
    L12_2 = A2_2.keys
    if L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.keys
      L12_2.keys = L13_2
    end
    L12_2 = A2_2.bills
    if L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.bills
      L12_2.bills = L13_2
    end
    L12_2 = A2_2.iplTheme
    if L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L12_2 = L12_2.metadata
      L13_2 = A2_2.iplTheme
      L12_2.iplTheme = L13_2
    end
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    L5_2 = true
  elseif "newRenter" == A0_2 then
    L12_2 = Property
    L13_2 = L12_2
    L12_2 = L12_2.UnlockDoors
    L14_2 = Properties
    L14_2 = L14_2[L4_2]
    L14_2 = L14_2.metadata
    if L14_2 then
      L14_2 = L14_2.doors
    end
    L12_2(L13_2, L14_2)
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.renter
    L12_2.renter = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.renter_name
    L12_2.renter_name = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.permissions
    L12_2.permissions = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.sale
    L12_2.sale = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.rental
    L12_2.rental = L13_2
    L12_2 = A2_2.keys
    if L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.keys
      L12_2.keys = L13_2
    end
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.bills
    L12_2.bills = L13_2
    if A2_2 then
      L12_2 = A2_2.iplTheme
      if L12_2 then
        L12_2 = Properties
        L12_2 = L12_2[L4_2]
        L12_2 = L12_2.metadata
        L13_2 = A2_2.iplTheme
        L12_2.iplTheme = L13_2
      end
    end
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    L5_2 = true
  elseif "forceRemovedOwner" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.renter
    if not L12_2 then
      L12_2 = Property
      L13_2 = L12_2
      L12_2 = L12_2.LockDoors
      L14_2 = Properties
      L14_2 = L14_2[L4_2]
      L14_2 = L14_2.metadata
      if L14_2 then
        L14_2 = L14_2.doors
      end
      L12_2(L13_2, L14_2)
    end
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.owner = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.owner_name = nil
    L12_2 = A2_2.completelyRemoved
    if L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.keys
      L12_2.keys = L13_2
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.permissions
      L12_2.permissions = L13_2
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.metadata
      L12_2.metadata = L13_2
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.sale
      L12_2.sale = L13_2
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.rental
      L12_2.rental = L13_2
    end
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    L12_2 = openedMenu
    if "HousingCreator" == L12_2 then
      L12_2 = SendNUIMessage
      L13_2 = {}
      L13_2.action = "HousingCreator"
      L13_2.actionName = "RefreshPropertiesMenu"
      L12_2(L13_2)
    end
    L5_2 = true
    L7_2 = true
    L9_2 = true
  elseif "forceRemovedRenter" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.owner
    if not L12_2 then
      L12_2 = Property
      L13_2 = L12_2
      L12_2 = L12_2.LockDoors
      L14_2 = Properties
      L14_2 = L14_2[L4_2]
      L14_2 = L14_2.metadata
      if L14_2 then
        L14_2 = L14_2.doors
      end
      L12_2(L13_2, L14_2)
    end
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.renter = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.renter_name = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.keys
    L12_2.keys = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.permissions
    L12_2.permissions = L13_2
    L12_2 = A2_2.completelyRemoved
    if L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.metadata
      L12_2.metadata = L13_2
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.sale
      L12_2.sale = L13_2
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.rental
      L12_2.rental = L13_2
    end
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    L12_2 = openedMenu
    if "HousingCreator" == L12_2 then
      L12_2 = SendNUIMessage
      L13_2 = {}
      L13_2.action = "HousingCreator"
      L13_2.actionName = "RefreshPropertiesMenu"
      L12_2(L13_2)
    end
    L5_2 = true
    L7_2 = true
  elseif "autoSellProperty" == A0_2 then
    L12_2 = Property
    L13_2 = L12_2
    L12_2 = L12_2.LockDoors
    L14_2 = Properties
    L14_2 = L14_2[L4_2]
    L14_2 = L14_2.metadata
    if L14_2 then
      L14_2 = L14_2.doors
    end
    L12_2(L13_2, L14_2)
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.owner = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.owner_name = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.renter = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.renter_name = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.keys
    L12_2.keys = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = {}
    L12_2.permissions = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.metadata
    L12_2.metadata = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.sale
    L12_2.sale = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.rental
    L12_2.rental = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = {}
    L12_2.furniture = L13_2
    L5_2 = true
    L7_2 = true
    L9_2 = true
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = closeManageMenu
      L12_2()
    end
  elseif "toggleLight" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L13_2 = A2_2.lightState
    L12_2.lightState = L13_2
    L12_2 = CurrentProperty
    if L12_2 then
      L12_2 = CurrentProperty
      if L12_2 == L4_2 then
        L12_2 = SetArtificialLightsState
        L13_2 = Properties
        L13_2 = L13_2[L4_2]
        L13_2 = L13_2.metadata
        L13_2 = L13_2.lightState
        L13_2 = not L13_2
        L12_2(L13_2)
      end
    end
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = library
      L12_2 = L12_2.PlayAnimation
      L13_2 = PlayerPedId
      L13_2 = L13_2()
      L14_2 = "mini@sprunk@first_person"
      L15_2 = "PLYR_BUY_DRINK_PT1"
      L16_2 = 8.0
      L17_2 = 8.0
      L18_2 = 1800
      L19_2 = 1
      L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L12_2 = Citizen
      L12_2 = L12_2.CreateThread
      function L13_2()
        local L0_3, L1_3
        L0_3 = Citizen
        L0_3 = L0_3.Wait
        L1_3 = 650
        L0_3(L1_3)
        L0_3 = library
        L0_3 = L0_3.PlayAudio
        L1_3 = "lightSwitch"
        L0_3(L1_3)
      end
      L12_2(L13_2)
    end
  elseif "toggleLock" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L13_2 = A2_2.locked
    L12_2.locked = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.isUnderRaid
    L12_2.isUnderRaid = L13_2
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = library
      L12_2 = L12_2.PlayAnimation
      L13_2 = PlayerPedId
      L13_2 = L13_2()
      L14_2 = "veh@std@habanero@ps@enter_exit"
      L15_2 = "d_locked"
      L16_2 = 8.0
      L17_2 = 8.0
      L18_2 = 890
      L19_2 = 1
      L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L12_2 = Citizen
      L12_2 = L12_2.CreateThread
      function L13_2()
        local L0_3, L1_3
        L0_3 = Citizen
        L0_3 = L0_3.Wait
        L1_3 = 400
        L0_3(L1_3)
        L0_3 = A2_2.locked
        if true == L0_3 then
          L0_3 = library
          L0_3 = L0_3.PlayAudio
          L1_3 = "lockDoors"
          L0_3(L1_3)
        else
          L0_3 = library
          L0_3 = L0_3.PlayAudio
          L1_3 = "openDoors"
          L0_3(L1_3)
        end
      end
      L12_2(L13_2)
    end
  elseif "toggleDoorlock" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L12_2 = L12_2.doors
    L13_2 = A2_2.doorId
    L12_2 = L12_2[L13_2]
    L13_2 = A2_2.locked
    L12_2.locked = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L12_2 = L12_2.upgrades
    L13_2 = A2_2.antiBurglaryDoors
    L12_2.antiBurglaryDoors = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.isUnderRaid
    L12_2.isUnderRaid = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L12_2 = L12_2.doors
    L13_2 = A2_2.doorId
    L12_2 = L12_2[L13_2]
    L12_2 = L12_2.type
    if "double" == L12_2 then
      L12_2 = DoorSystemSetDoorState
      L13_2 = Properties
      L13_2 = L13_2[L4_2]
      L13_2 = L13_2.metadata
      L13_2 = L13_2.doors
      L14_2 = A2_2.doorId
      L13_2 = L13_2[L14_2]
      L13_2 = L13_2.left
      L13_2 = L13_2.hash
      L14_2 = A2_2.locked
      if true == L14_2 then
        L14_2 = 1
        if L14_2 then
          goto lbl_505
        end
      end
      L14_2 = 0
      ::lbl_505::
      L15_2 = false
      L16_2 = false
      L12_2(L13_2, L14_2, L15_2, L16_2)
      L12_2 = DoorSystemSetDoorState
      L13_2 = Properties
      L13_2 = L13_2[L4_2]
      L13_2 = L13_2.metadata
      L13_2 = L13_2.doors
      L14_2 = A2_2.doorId
      L13_2 = L13_2[L14_2]
      L13_2 = L13_2.right
      L13_2 = L13_2.hash
      L14_2 = A2_2.locked
      if true == L14_2 then
        L14_2 = 1
        if L14_2 then
          goto lbl_524
        end
      end
      L14_2 = 0
      ::lbl_524::
      L15_2 = false
      L16_2 = false
      L12_2(L13_2, L14_2, L15_2, L16_2)
    else
      L12_2 = DoorSystemSetDoorState
      L13_2 = Properties
      L13_2 = L13_2[L4_2]
      L13_2 = L13_2.metadata
      L13_2 = L13_2.doors
      L14_2 = A2_2.doorId
      L13_2 = L13_2[L14_2]
      L13_2 = L13_2.hash
      L14_2 = A2_2.locked
      if true == L14_2 then
        L14_2 = 1
        if L14_2 then
          goto lbl_543
        end
      end
      L14_2 = 0
      ::lbl_543::
      L15_2 = false
      L16_2 = false
      L12_2(L13_2, L14_2, L15_2, L16_2)
    end
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = IsPedInAnyVehicle
      L13_2 = PlayerPedId
      L13_2 = L13_2()
      L14_2 = false
      L12_2 = L12_2(L13_2, L14_2)
      if not L12_2 then
        L12_2 = library
        L12_2 = L12_2.PlayAnimation
        L13_2 = PlayerPedId
        L13_2 = L13_2()
        L14_2 = "veh@std@habanero@ps@enter_exit"
        L15_2 = "d_locked"
        L16_2 = 8.0
        L17_2 = 8.0
        L18_2 = 890
        L19_2 = 1
        L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      end
      L12_2 = Citizen
      L12_2 = L12_2.CreateThread
      function L13_2()
        local L0_3, L1_3
        L0_3 = Citizen
        L0_3 = L0_3.Wait
        L1_3 = 400
        L0_3(L1_3)
        L0_3 = A2_2.locked
        if true == L0_3 then
          L0_3 = library
          L0_3 = L0_3.PlayAudio
          L1_3 = "lockDoors"
          L0_3(L1_3)
        else
          L0_3 = library
          L0_3 = L0_3.PlayAudio
          L1_3 = "openDoors"
          L0_3(L1_3)
        end
      end
      L12_2(L13_2)
    end
    L5_2 = true
  elseif "lockdown" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L13_2 = A2_2.lockdown
    L12_2.lockdown = L13_2
    L7_2 = true
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
  elseif "raided" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.isUnderRaid = true
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L12_2.locked = false
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L12_2 = L12_2.upgrades
    L13_2 = A2_2.antiBurglaryDoors
    L12_2.antiBurglaryDoors = L13_2
    L5_2 = true
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
  elseif "upgrade" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L12_2 = L12_2.upgrades
    if not L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L12_2 = L12_2.metadata
      L13_2 = {}
      L12_2.upgrades = L13_2
    end
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L12_2 = L12_2.upgrades
    L13_2 = A2_2.metadataName
    L14_2 = A2_2.metadataName
    L14_2 = A2_2[L14_2]
    L12_2[L13_2] = L14_2
    L5_2 = true
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "upgrades"
    L12_2.forcedUpdate = true
    L13_2 = {}
    L12_2.ownUpgrades = L13_2
    L13_2 = GetFurnitureLimit
    L14_2 = Properties
    L14_2 = L14_2[L4_2]
    L14_2 = L14_2.metadata
    L14_2 = L14_2.upgrades
    L13_2 = L13_2(L14_2)
    L12_2.furnitureLimit = L13_2
    L6_2 = L12_2
    L12_2 = pairs
    L13_2 = Config
    L13_2 = L13_2.HousingUpgrades
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
      L18_2 = Properties
      L18_2 = L18_2[L4_2]
      L18_2 = L18_2.metadata
      L18_2 = L18_2.upgrades
      L19_2 = L17_2.metadata
      L18_2 = L18_2[L19_2]
      if L18_2 then
        L18_2 = L6_2.ownUpgrades
        L19_2 = L17_2.metadata
        L20_2 = Properties
        L20_2 = L20_2[L4_2]
        L20_2 = L20_2.metadata
        L20_2 = L20_2.upgrades
        L21_2 = L17_2.metadata
        L20_2 = L20_2[L21_2]
        L18_2[L19_2] = L20_2
      end
    end
  elseif "keys" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.keys
    L12_2.keys = L13_2
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "keys"
    L12_2.forcedUpdate = true
    L13_2 = json
    L13_2 = L13_2.decode
    L14_2 = Properties
    L14_2 = L14_2[L4_2]
    L14_2 = L14_2.keys
    L13_2 = L13_2(L14_2)
    L12_2.keys = L13_2
    L6_2 = L12_2
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    if A3_2 then
      L12_2 = GetPlayerServerId
      L13_2 = PlayerId
      L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
      L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
      if A3_2 == L12_2 then
        L12_2 = SendNUIMessage
        L13_2 = {}
        L13_2.action = "Property"
        L13_2.actionName = "CloseModal"
        L12_2(L13_2)
      end
    end
  elseif "marketplace" == A0_2 then
    L12_2 = A2_2.description
    if L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = A2_2.description
      L12_2.description = L13_2
    end
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.sale
    L12_2.sale = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.rental
    L12_2.rental = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L13_2 = A2_2.contact_number
    L12_2.contact_number = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L13_2 = A2_2.furnished
    L12_2.furnished = L13_2
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "marketplace"
    L12_2.forcedUpdate = true
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.description
    L12_2.description = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.sale
    L12_2.sale = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.rental
    L12_2.rental = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.metadata
    L13_2 = L13_2.images
    L12_2.images = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.metadata
    L13_2 = L13_2.contact_number
    L12_2.contact_number = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.metadata
    L13_2 = L13_2.furnished
    L12_2.furnished = L13_2
    L6_2 = L12_2
  elseif "marketplaceImage" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L12_2 = L12_2.images
    if not L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L12_2 = L12_2.metadata
      L13_2 = {}
      L12_2.images = L13_2
    end
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L12_2 = L12_2.images
    L13_2 = A2_2.imageId
    L14_2 = A2_2.imageURL
    L12_2[L13_2] = L14_2
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "marketplace"
    L12_2.forcedUpdate = true
    L12_2.onlyPhotos = true
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.metadata
    L13_2 = L13_2.images
    L12_2.images = L13_2
    L6_2 = L12_2
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L6_2.closeModal = true
    end
  elseif "unpackedDelivery" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.furniture
    if not L12_2 then
      return
    end
    L12_2 = pairs
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
      L18_2 = L17_2.metadata
      if L18_2 then
        L18_2 = L17_2.metadata
        L18_2 = L18_2.delivered
        if L18_2 then
          L18_2 = L17_2.metadata
          L18_2.delivered = nil
        end
      end
    end
  elseif "storeFurniture" == A0_2 then
    L12_2 = A2_2.furnitureId
    if not L12_2 then
      return
    end
    L12_2 = pairs
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
      L18_2 = L17_2.id
      L19_2 = A2_2.furnitureId
      if L18_2 == L19_2 then
        L18_2 = L17_2.position
        if L18_2 then
          L18_2 = L17_2.position
          L18_2 = L18_2.environment
          if "inside" == L18_2 then
            L18_2 = CurrentProperty
            if L18_2 == L4_2 then
              goto lbl_892
            end
          end
          L18_2 = L17_2.position
          L18_2 = L18_2.environment
          if "outside" == L18_2 then
            L18_2 = GetCurrentPropertyId
            L18_2 = L18_2()
            ::lbl_892::
            if L18_2 == L4_2 then
              L18_2 = Property
              L19_2 = L18_2
              L18_2 = L18_2.RemoveFurniture
              L20_2 = A2_2.furnitureId
              L18_2(L19_2, L20_2)
            end
          end
        end
        L18_2 = Properties
        L18_2 = L18_2[L4_2]
        L18_2 = L18_2.furniture
        L18_2 = L18_2[L16_2]
        L18_2.stored = 1
        L18_2 = Properties
        L18_2 = L18_2[L4_2]
        L18_2 = L18_2.furniture
        L18_2 = L18_2[L16_2]
        L18_2.position = nil
        break
      end
    end
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "furniture"
    L12_2.forcedUpdate = true
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L12_2.furniture = L13_2
    L6_2 = L12_2
  elseif "orderedFurniture" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.furniture
    if not L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = {}
      L12_2.furniture = L13_2
    end
    L12_2 = table
    L12_2 = L12_2.insert
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L14_2 = A2_2.furniture
    L12_2(L13_2, L14_2)
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "ordered-furniture"
    L12_2.forcedUpdate = true
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L12_2.furniture = L13_2
    L6_2 = L12_2
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L6_2.forcedClose = true
    end
  elseif "deliveredFurniture" == A0_2 then
    L12_2 = false
    L13_2 = pairs
    L14_2 = A2_2
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
    for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
      L19_2 = tostring
      L20_2 = L17_2
      L19_2 = L19_2(L20_2)
      L17_2 = L19_2
      L19_2 = GetCurrentPropertyId
      L19_2 = L19_2()
      if L19_2 ~= L17_2 then
        L19_2 = CurrentProperty
        if L19_2 ~= L17_2 then
          goto lbl_979
        end
      end
      L4_2 = L17_2
      ::lbl_979::
      L19_2 = pairs
      L20_2 = L18_2
      L19_2, L20_2, L21_2, L22_2 = L19_2(L20_2)
      for L23_2, L24_2 in L19_2, L20_2, L21_2, L22_2 do
        L25_2 = Properties
        L25_2 = L25_2[L17_2]
        L25_2 = L25_2.furniture
        if not L25_2 then
          L25_2 = Properties
          L25_2 = L25_2[L17_2]
          L26_2 = {}
          L25_2.furniture = L26_2
        end
        L25_2 = pairs
        L26_2 = Properties
        L26_2 = L26_2[L17_2]
        L26_2 = L26_2.furniture
        L25_2, L26_2, L27_2, L28_2 = L25_2(L26_2)
        for L29_2, L30_2 in L25_2, L26_2, L27_2, L28_2 do
          L31_2 = L30_2.id
          if L31_2 == L24_2 then
            L31_2 = L30_2.metadata
            if L31_2 then
              L31_2 = L30_2.metadata
              L31_2.deliveryTime = nil
              L31_2 = Config
              L31_2 = L31_2.DeliveryType
              if 3 == L31_2 then
                L31_2 = Properties
                L31_2 = L31_2[L17_2]
                L31_2 = L31_2.metadata
                if L31_2 then
                  L31_2 = Properties
                  L31_2 = L31_2[L17_2]
                  L31_2 = L31_2.metadata
                  L31_2 = L31_2.deliveryType
                  if L31_2 then
                    L31_2 = Properties
                    L31_2 = L31_2[L17_2]
                    L31_2 = L31_2.metadata
                    L31_2 = L31_2.delivery
                    if L31_2 then
                      L31_2 = L30_2.metadata
                      L31_2.delivered = true
                      L12_2 = true
                    end
                  end
                end
              end
            end
            break
          end
        end
      end
    end
    if L12_2 and L4_2 and "nil" ~= L4_2 then
      L13_2 = false
      L14_2 = next
      L15_2 = Property
      L15_2 = L15_2.LoadedFurnitures
      L14_2 = L14_2(L15_2)
      if L14_2 then
        L14_2 = pairs
        L15_2 = Property
        L15_2 = L15_2.LoadedFurnitures
        L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
        for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
          L20_2 = L19_2.furnitureId
          if "delivery" == L20_2 then
            L13_2 = true
            break
          end
        end
      end
      if not L13_2 then
        L14_2 = Property
        L15_2 = L14_2
        L14_2 = L14_2.LoadFurniture
        L16_2 = Properties
        L16_2 = L16_2[L4_2]
        L16_2 = L16_2.metadata
        L16_2 = L16_2.deliveryType
        L17_2 = {}
        L18_2 = {}
        L18_2.stored = 1
        L19_2 = {}
        L19_2.delivered = true
        L18_2.metadata = L19_2
        L17_2[1] = L18_2
        L18_2 = L4_2
        L14_2(L15_2, L16_2, L17_2, L18_2)
      end
    end
  elseif "soldFurniture" == A0_2 or "removedFurniture" == A0_2 then
    L12_2 = A2_2.furnitureId
    if not L12_2 then
      return
    end
    L12_2 = pairs
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
      L18_2 = L17_2.id
      L19_2 = A2_2.furnitureId
      if L18_2 == L19_2 then
        L18_2 = table
        L18_2 = L18_2.remove
        L19_2 = Properties
        L19_2 = L19_2[L4_2]
        L19_2 = L19_2.furniture
        L20_2 = L16_2
        L18_2(L19_2, L20_2)
        break
      end
    end
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "furniture"
    L12_2.forcedUpdate = true
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L12_2.furniture = L13_2
    L6_2 = L12_2
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = SendNUIMessage
      L13_2 = {}
      L13_2.action = "Property"
      L13_2.actionName = "CloseModal"
      L12_2(L13_2)
    end
  elseif "placedFurniture" == A0_2 then
    L12_2 = pairs
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
      L18_2 = L17_2.id
      L19_2 = A2_2.furnitureId
      if L18_2 == L19_2 then
        L18_2 = A2_2.position
        L17_2.position = L18_2
        L17_2.stored = 0
      end
    end
    L7_2 = true
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = {}
      L12_2.action = "Property"
      L12_2.actionName = "CloseFurniture"
      L6_2 = L12_2
    end
  elseif "addedFurniture" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.furniture
    if not L12_2 then
      L12_2 = Properties
      L12_2 = L12_2[L4_2]
      L13_2 = {}
      L12_2.furniture = L13_2
    end
    L12_2 = table
    L12_2 = L12_2.insert
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L14_2 = A2_2.furniture
    L12_2(L13_2, L14_2)
    L7_2 = true
  elseif "modifiedFurniture" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.furniture
    L13_2 = A2_2.furnitureId
    L14_2 = A2_2.furniture
    L12_2[L13_2] = L14_2
    L7_2 = true
  elseif "modifiedTheme" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L13_2 = A2_2.iplTheme
    L12_2.iplTheme = L13_2
    L8_2 = true
  elseif "changedSafePin" == A0_2 then
    L12_2 = A2_2.furnitureId
    if not L12_2 then
      return
    end
    L12_2 = pairs
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.furniture
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
      L18_2 = L17_2.id
      L19_2 = A2_2.furnitureId
      if L18_2 == L19_2 then
        L18_2 = Properties
        L18_2 = L18_2[L4_2]
        L18_2 = L18_2.furniture
        L18_2 = L18_2[L16_2]
        L18_2 = L18_2.metadata
        L19_2 = A2_2.newPin
        L18_2.pin = L19_2
        break
      end
    end
    L7_2 = true
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = {}
      L12_2.action = "Safe"
      L12_2.actionName = "ChangedPIN"
      L12_2.success = true
      L6_2 = L12_2
      L12_2 = SetNuiFocus
      L13_2 = false
      L14_2 = false
      L12_2(L13_2, L14_2)
      L12_2 = Citizen
      L12_2 = L12_2.CreateThread
      function L13_2()
        local L0_3, L1_3
        L0_3 = Wait
        L1_3 = 1200
        L0_3(L1_3)
        L0_3 = CloseSafe
        L0_3()
      end
      L12_2(L13_2)
    end
  elseif "ringDoorbell" == A0_2 then
    if A3_2 then
      L12_2 = GetPlayerServerId
      L13_2 = PlayerId
      L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
      L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
      if A3_2 == L12_2 then
        L12_2 = library
        L12_2 = L12_2.PlayAnimation
        L13_2 = PlayerPedId
        L13_2 = L13_2()
        L14_2 = "mp_doorbell"
        L15_2 = "open_door"
        L16_2 = 8.0
        L17_2 = 8.0
        L18_2 = 2130
        L19_2 = 1
        L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        L12_2 = Citizen
        L12_2 = L12_2.CreateThread
        function L13_2()
          local L0_3, L1_3
          L0_3 = Wait
          L1_3 = 1200
          L0_3(L1_3)
          L0_3 = library
          L0_3 = L0_3.PlayAudio
          L1_3 = "doorbell"
          L0_3(L1_3)
        end
        L12_2(L13_2)
    end
    else
      L12_2 = CurrentProperty
      if L12_2 == L4_2 then
        L12_2 = library
        L12_2 = L12_2.PlayAudio
        L13_2 = "doorbellInside"
        L12_2(L13_2)
      end
    end
  elseif "paidBill" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.bills
    if L12_2 then
      L12_2 = next
      L13_2 = Properties
      L13_2 = L13_2[L4_2]
      L13_2 = L13_2.bills
      L12_2 = L12_2(L13_2)
      if L12_2 then
        L12_2 = pairs
        L13_2 = Properties
        L13_2 = L13_2[L4_2]
        L13_2 = L13_2.bills
        L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
        for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
          L18_2 = L17_2.period
          L19_2 = A2_2.period
          if L18_2 == L19_2 then
            L18_2 = L17_2.type
            L19_2 = A2_2.type
            if L18_2 == L19_2 then
              L17_2.paid = 1
              break
            end
          end
        end
      end
    end
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.unpaidBills
    L12_2.unpaidBills = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.unpaidRentBills
    L12_2.unpaidRentBills = L13_2
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "bills"
    L12_2.forcedUpdate = true
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.bills
    L12_2.bills = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.unpaidBills
    L12_2.unpaidBills = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.unpaidRentBills
    L12_2.unpaidRentBills = L13_2
    L6_2 = L12_2
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = SendNUIMessage
      L13_2 = {}
      L13_2.action = "Property"
      L13_2.actionName = "CloseModal"
      L12_2(L13_2)
    end
  elseif "changedWardrobePosition" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L13_2 = A2_2.wardrobe
    L12_2.wardrobe = L13_2
    L12_2 = CurrentProperty
    if L12_2 then
      L12_2 = CurrentProperty
      if L12_2 == L4_2 then
        L12_2 = 1
        L13_2 = TargetPoints
        L13_2 = #L13_2
        L14_2 = 1
        for L15_2 = L12_2, L13_2, L14_2 do
          L16_2 = TargetPoints
          L16_2 = L16_2[L15_2]
          L16_2 = L16_2.type
          if "wardrobe" == L16_2 then
            L16_2 = CL
            L16_2 = L16_2.Target
            L17_2 = "remove-zone"
            L18_2 = TargetPoints
            L18_2 = L18_2[L15_2]
            L18_2 = L18_2.id
            L16_2(L17_2, L18_2)
            L16_2 = table
            L16_2 = L16_2.remove
            L17_2 = TargetPoints
            L18_2 = L15_2
            L16_2(L17_2, L18_2)
            break
          end
        end
        L12_2 = CurrentShell
        if not L12_2 then
          L12_2 = CurrentIPL
          if not L12_2 then
            L12_2 = IsInsideMLO
            L12_2 = L12_2()
          end
        end
        if L12_2 then
          L12_2 = table
          L12_2 = L12_2.insert
          L13_2 = TargetPoints
          L14_2 = TargetHandler
          L14_2 = L14_2.Wardrobe
          L15_2 = CurrentProperty
          L16_2 = CurrentPropertyData
          L16_2 = L16_2.metadata
          L16_2 = L16_2.wardrobe
          L16_2 = L16_2.x
          L17_2 = CurrentPropertyData
          L17_2 = L17_2.metadata
          L17_2 = L17_2.wardrobe
          L17_2 = L17_2.y
          L18_2 = CurrentPropertyData
          L18_2 = L18_2.metadata
          L18_2 = L18_2.wardrobe
          L18_2 = L18_2.z
          L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
        end
      end
    end
  elseif "changedStoragePosition" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.metadata
    L13_2 = A2_2.storage
    L12_2.storage = L13_2
    L12_2 = CurrentProperty
    if L12_2 then
      L12_2 = CurrentProperty
      if L12_2 == L4_2 then
        L12_2 = 1
        L13_2 = TargetPoints
        L13_2 = #L13_2
        L14_2 = 1
        for L15_2 = L12_2, L13_2, L14_2 do
          L16_2 = TargetPoints
          L16_2 = L16_2[L15_2]
          L16_2 = L16_2.type
          if "storage" == L16_2 then
            L16_2 = CL
            L16_2 = L16_2.Target
            L17_2 = "remove-zone"
            L18_2 = TargetPoints
            L18_2 = L18_2[L15_2]
            L18_2 = L18_2.id
            L16_2(L17_2, L18_2)
            L16_2 = table
            L16_2 = L16_2.remove
            L17_2 = TargetPoints
            L18_2 = L15_2
            L16_2(L17_2, L18_2)
            break
          end
        end
        L12_2 = CurrentShell
        if not L12_2 then
          L12_2 = CurrentIPL
          if not L12_2 then
            L12_2 = IsInsideMLO
            L12_2 = L12_2()
          end
        end
        if L12_2 then
          L12_2 = table
          L12_2 = L12_2.insert
          L13_2 = TargetPoints
          L14_2 = TargetHandler
          L14_2 = L14_2.Storage
          L15_2 = CurrentProperty
          L16_2 = CurrentPropertyData
          L16_2 = L16_2.metadata
          L16_2 = L16_2.storage
          L16_2 = L16_2.x
          L17_2 = CurrentPropertyData
          L17_2 = L17_2.metadata
          L17_2 = L17_2.storage
          L17_2 = L17_2.y
          L18_2 = CurrentPropertyData
          L18_2 = L18_2.metadata
          L18_2 = L18_2.storage
          L18_2 = L18_2.z
          L19_2 = CurrentPropertyData
          L19_2 = L19_2.metadata
          L19_2 = L19_2.storage
          L19_2 = L19_2.slots
          L20_2 = CurrentPropertyData
          L20_2 = L20_2.metadata
          L20_2 = L20_2.storage
          L20_2 = L20_2.weight
          L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
        end
      end
    end
  elseif "rentalTerminated" == A0_2 then
    L12_2 = Property
    L13_2 = L12_2
    L12_2 = L12_2.LockDoors
    L14_2 = Properties
    L14_2 = L14_2[L4_2]
    L14_2 = L14_2.metadata
    if L14_2 then
      L14_2 = L14_2.doors
    end
    L12_2(L13_2, L14_2)
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.renter = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.renter_name = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.unpaidRentBills = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.keys
    L12_2.keys = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.permissions
    L12_2.permissions = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.metadata
    L12_2.metadata = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.rental
    L12_2.rental = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.bills
    L12_2.bills = L13_2
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "rental-termination"
    L12_2.forcedUpdate = true
    L13_2 = json
    L13_2 = L13_2.decode
    L14_2 = Properties
    L14_2 = L14_2[L4_2]
    L14_2 = L14_2.keys
    L13_2 = L13_2(L14_2)
    L12_2.keys = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.metadata
    L12_2.metadata = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.permissions
    L12_2.permissions = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.rental
    L12_2.rental = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.bills
    L12_2.bills = L13_2
    L6_2 = L12_2
    L5_2 = true
    L9_2 = true
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = SendNUIMessage
      L13_2 = {}
      L13_2.action = "Property"
      L13_2.actionName = "CloseModal"
      L12_2(L13_2)
    end
  elseif "rentalTermination" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.rental
    L12_2.rental = L13_2
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "rental-termination"
    L12_2.forcedUpdate = true
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.rental
    L12_2.rental = L13_2
    L6_2 = L12_2
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = SendNUIMessage
      L13_2 = {}
      L13_2.action = "Property"
      L13_2.actionName = "CloseModal"
      L12_2(L13_2)
    end
  elseif "clearRentalTermination" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.rental
    L12_2.rental = L13_2
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "rental-termination"
    L12_2.forcedUpdate = true
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.rental
    L12_2.rental = L13_2
    L6_2 = L12_2
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = SendNUIMessage
      L13_2 = {}
      L13_2.action = "Property"
      L13_2.actionName = "CloseModal"
      L12_2(L13_2)
    end
  elseif "updatedPermissions" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.permissions
    L12_2.permissions = L13_2
    L5_2 = true
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "permissions"
    L12_2.forcedUpdate = true
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.permissions
    L12_2.permissions = L13_2
    L6_2 = L12_2
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = SendNUIMessage
      L13_2 = {}
      L13_2.action = "Property"
      L13_2.actionName = "CloseModal"
      L12_2(L13_2)
    end
  elseif "movedOut" == A0_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.owner
    if not L12_2 then
      L12_2 = Property
      L13_2 = L12_2
      L12_2 = L12_2.LockDoors
      L14_2 = Properties
      L14_2 = L14_2[L4_2]
      L14_2 = L14_2.metadata
      if L14_2 then
        L14_2 = L14_2.doors
      end
      L12_2(L13_2, L14_2)
    end
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.renter = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.renter_name = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2.unpaidRentBills = nil
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.keys
    L12_2.keys = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.permissions
    L12_2.permissions = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.metadata
    L12_2.metadata = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.sale
    L12_2.sale = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.rental
    L12_2.rental = L13_2
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L13_2 = A2_2.bills
    L12_2.bills = L13_2
    L12_2 = {}
    L12_2.action = "Property"
    L12_2.actionName = "UpdateManage"
    L12_2.type = "rental-termination"
    L12_2.forcedUpdate = true
    L13_2 = json
    L13_2 = L13_2.decode
    L14_2 = Properties
    L14_2 = L14_2[L4_2]
    L14_2 = L14_2.keys
    L13_2 = L13_2(L14_2)
    L12_2.keys = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.metadata
    L12_2.metadata = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.permissions
    L12_2.permissions = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.rental
    L12_2.rental = L13_2
    L13_2 = Properties
    L13_2 = L13_2[L4_2]
    L13_2 = L13_2.bills
    L12_2.bills = L13_2
    L6_2 = L12_2
    L5_2 = true
    L9_2 = true
    L12_2 = SelectedApartment
    if L12_2 then
      L12_2 = SelectedApartment
      if L12_2 == L4_2 then
        L12_2 = ReloadApartmentMenu
        L12_2()
      end
    end
    L12_2 = GetPlayerServerId
    L13_2 = PlayerId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    if A3_2 == L12_2 then
      L12_2 = closeManageMenu
      L12_2()
    end
  end
  if L5_2 then
    L12_2 = RefreshBlips
    L12_2()
  end
  if L9_2 then
    L12_2 = Properties
    L12_2 = L12_2[L4_2]
    L12_2 = L12_2.type
    if "mlo" == L12_2 then
      L12_2 = Property
      L13_2 = L12_2
      L12_2 = L12_2.RegisterDoors
      L14_2 = {}
      L14_2.propertyId = L4_2
      L15_2 = Properties
      L15_2 = L15_2[L4_2]
      L15_2 = L15_2.owner
      L15_2 = Properties
      L15_2 = L15_2[L4_2]
      L15_2 = L15_2.renter
      L15_2 = not L15_2 and L15_2
      L14_2.forceLock = L15_2
      L15_2 = Properties
      L15_2 = L15_2[L4_2]
      L15_2 = L15_2.metadata
      L15_2 = L15_2.doors
      L14_2.doors = L15_2
      L12_2(L13_2, L14_2)
    end
  end
  L12_2 = GetCurrentPropertyId
  L12_2 = L12_2()
  if L12_2 ~= L4_2 then
    L12_2 = CurrentProperty
    if L12_2 ~= L4_2 then
      goto lbl_1936
    end
  end
  L12_2 = library
  L12_2 = L12_2.HasAnyPermission
  L13_2 = L4_2
  L12_2 = L12_2(L13_2)
  if not L12_2 then
    L12_2 = openedMenu
    if "PropertyManage" == L12_2 then
      L12_2 = closeManageMenu
      L12_2()
    else
      L12_2 = openedMenu
      if "PropertyFurniture" ~= L12_2 then
        L12_2 = openedMenu
        if "PropertyFurniturePurchase" ~= L12_2 then
          goto lbl_1863
        end
      end
      L12_2 = closeFurnitureMenu
      L12_2()
    end
  end
  ::lbl_1863::
  if L6_2 then
    L12_2 = openedMenu
    if "PropertyManage" ~= L12_2 then
      L12_2 = openedMenu
      if "Safe" ~= L12_2 then
        goto lbl_1874
      end
    end
    L12_2 = SendNUIMessage
    L13_2 = L6_2
    L12_2(L13_2)
  end
  ::lbl_1874::
  if L5_2 then
    L12_2 = RefreshTargets
    L12_2()
  end
  if L7_2 then
    L12_2 = Property
    L13_2 = L12_2
    L12_2 = L12_2.RemoveFurniture
    L14_2 = nil
    function L15_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = Property
      L1_3 = L0_3
      L0_3 = L0_3.LoadFurniture
      L2_3 = CurrentProperty
      if L2_3 then
        L2_3 = "inside"
        if L2_3 then
          goto lbl_10
        end
      end
      L2_3 = "outside"
      ::lbl_10::
      L3_3 = Properties
      L4_3 = L4_2
      L3_3 = L3_3[L4_3]
      L3_3 = L3_3.furniture
      L4_3 = L4_2
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = Properties
      L1_3 = L4_2
      L0_3 = L0_3[L1_3]
      L0_3 = L0_3.type
      if "mlo" == L0_3 then
        L0_3 = Properties
        L1_3 = L4_2
        L0_3 = L0_3[L1_3]
        L0_3 = L0_3.object_id
        if not L0_3 then
          L0_3 = Property
          L1_3 = L0_3
          L0_3 = L0_3.LoadFurniture
          L2_3 = CurrentProperty
          if L2_3 then
            L2_3 = "outside"
            if L2_3 then
              goto lbl_37
            end
          end
          L2_3 = "inside"
          ::lbl_37::
          L3_3 = Properties
          L4_3 = L4_2
          L3_3 = L3_3[L4_3]
          L3_3 = L3_3.furniture
          L4_3 = L4_2
          L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
    end
    L12_2(L13_2, L14_2, L15_2)
  end
  if L8_2 then
    L12_2 = CurrentIPL
    if L12_2 then
      L12_2 = IPL
      L12_2 = L12_2.LoadSettings
      L13_2 = CurrentIPL
      L14_2 = Properties
      L14_2 = L14_2[L4_2]
      L14_2 = L14_2.metadata
      L14_2 = L14_2.iplTheme
      L15_2 = Properties
      L15_2 = L15_2[L4_2]
      L15_2 = L15_2.metadata
      L15_2 = L15_2.iplSettings
      function L16_2()
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
      L12_2(L13_2, L14_2, L15_2, L16_2)
    end
  end
  if "unpackedDelivery" == A0_2 then
    L12_2 = Property
    L13_2 = L12_2
    L12_2 = L12_2.RemoveFurniture
    L14_2 = "delivery"
    L12_2(L13_2, L14_2)
  end
  if "autoSellProperty" == A0_2 then
    L12_2 = CurrentProperty
    if L12_2 == L4_2 then
      L12_2 = Property
      L13_2 = L12_2
      L12_2 = L12_2.ExitProperty
      L12_2(L13_2)
    end
  end
  if "movedOut" == A0_2 then
    L12_2 = CurrentProperty
    if L12_2 == L4_2 then
      L12_2 = CurrentPropertyData
      L12_2 = L12_2.owner
      if L12_2 then
        L12_2 = GetPlayerServerId
        L13_2 = PlayerId
        L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L13_2()
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
        if A3_2 ~= L12_2 then
          goto lbl_1987
        end
      end
      L12_2 = Property
      L13_2 = L12_2
      L12_2 = L12_2.ExitProperty
      L12_2(L13_2)
      goto lbl_1987
      ::lbl_1936::
      L12_2 = GetCurrentPropertyId
      L12_2 = L12_2()
      if L12_2 == L10_2 then
        if L6_2 and L11_2 then
          L12_2 = openedMenu
          if "BuildingMenu" ~= L12_2 then
            L12_2 = openedMenu
            if "ApartmentMenu" ~= L12_2 then
              goto lbl_1953
            end
          end
          L12_2 = SendNUIMessage
          L13_2 = L6_2
          L12_2(L13_2)
        end
        ::lbl_1953::
        if L6_2 and not L11_2 then
          L12_2 = openedMenu
          if "PropertyManage" == L12_2 then
            L12_2 = SendNUIMessage
            L13_2 = L6_2
            L12_2(L13_2)
          end
        end
        if L6_2 and L11_2 then
          L12_2 = MotelManageId
          if L12_2 then
            L12_2 = MotelManageId
            if L12_2 == L4_2 then
              L12_2 = openedMenu
              if "PropertyManage" == L12_2 then
                L12_2 = SendNUIMessage
                L13_2 = L6_2
                L12_2(L13_2)
              end
            end
          end
        end
        if not L11_2 and L5_2 then
          L12_2 = RefreshBlips
          L12_2()
          L12_2 = RefreshTargets
          L12_2()
        end
      end
    end
  end
  ::lbl_1987::
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:cl:sendPropertyContract"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = Properties
  L2_2 = A0_2.propertyId
  L1_2 = L1_2[L2_2]
  if not L1_2 then
    return
  end
  L2_2 = L1_2.address
  A0_2.address = L2_2
  L3_2 = CharacterName
  A0_2.characterName = L3_2
  L3_2 = L1_2.region
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.Regions
    L4_2 = L1_2.region
    L3_2 = L3_2[L4_2]
    if L3_2 then
      goto lbl_22
    end
  end
  L3_2 = Config
  L3_2 = L3_2.NoRegion
  ::lbl_22::
  L4_2 = L3_2.electricity
  A0_2.electricity = L4_2
  L4_2 = L3_2.water
  A0_2.water = L4_2
  L4_2 = L3_2.internet
  A0_2.internet = L4_2
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.action = "Property"
  L5_2.actionName = "ShowContract"
  L5_2.data = A0_2
  L4_2(L5_2)
  L4_2 = SetNuiFocus
  L5_2 = true
  L6_2 = true
  L4_2(L5_2, L6_2)
  openedMenu = "Contract"
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:cl:reloadFurnitureList"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = json
  L1_2 = L1_2.decode
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  Furniture = L1_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "Property"
  L2_2.actionName = "ReloadAvailableFurniture"
  L3_2 = Furniture
  L2_2.data = L3_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "vms_housing:cl:reloadFurniture"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Furniture
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = Furniture
    L2_2[A0_2] = A1_2
    L2_2 = SendNUIMessage
    L3_2 = {}
    L3_2.action = "Property"
    L3_2.actionName = "ReloadAvailableFurniture"
    L4_2 = Furniture
    L3_2.data = L4_2
    L2_2(L3_2)
  end
end
L0_1(L1_1, L2_1)
