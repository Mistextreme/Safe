local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = false
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = {}
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L3_2 = Properties
  L3_2 = L3_2[A0_2]
  L4_2 = library
  L4_2 = L4_2.HasAnyPermission
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = L4_1
  if L4_2 then
    L4_2 = next
    L5_2 = L4_1
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_57
    end
  end
  L4_2 = {}
  L4_1 = L4_2
  L4_2 = pairs
  L5_2 = L3_2.furniture
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = Config
    L10_2 = L10_2.Cameras
    L11_2 = L9_2.model
    L10_2 = L10_2[L11_2]
    if L10_2 then
      L10_2 = L9_2.position
      if L10_2 then
        L10_2 = L9_2.stored
        if 0 == L10_2 then
          if A2_2 then
            L10_2 = L9_2.position
            L10_2 = L10_2.environment
            if L10_2 == A2_2 then
              L10_2 = table
              L10_2 = L10_2.insert
              L11_2 = L4_1
              L12_2 = L9_2
              L10_2(L11_2, L12_2)
            end
          else
            L10_2 = table
            L10_2 = L10_2.insert
            L11_2 = L4_1
            L12_2 = L9_2
            L10_2(L11_2, L12_2)
          end
        end
      end
    end
  end
  ::lbl_57::
  L4_2 = next
  L5_2 = L4_1
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    if A1_2 then
      L4_2 = A1_2
      L5_2 = false
      L4_2(L5_2)
    end
    return
  end
  if A1_2 then
    L4_2 = A1_2
    L5_2 = true
    L4_2(L5_2)
  end
  L4_2 = DoScreenFadeOut
  L5_2 = 300
  L4_2(L5_2)
  L4_2 = Wait
  L5_2 = 300
  L4_2(L5_2)
  L4_2 = L0_1
  if not L4_2 then
    if A2_2 then
      L4_2 = CurrentProperty
      if L4_2 then
        if "outside" == A2_2 then
          L4_2 = TriggerServerEvent
          L5_2 = "vms_housing:sv:exitHouse"
          L6_2 = CurrentProperty
          L7_2 = true
          L4_2(L5_2, L6_2, L7_2)
          L4_2 = ToggleWeather
          if L4_2 then
            L4_2 = ToggleWeather
            L5_2 = false
            L4_2(L5_2)
          end
          L4_2 = CurrentShell
          if L4_2 then
            L4_2 = DeleteObject
            L5_2 = CurrentShell
            L4_2(L5_2)
            CurrentShell = nil
          end
          L4_2 = CurrentIPL
          if L4_2 then
            L4_2 = IPL
            L4_2 = L4_2.UnloadSettings
            L5_2 = CurrentIPL
            L4_2(L5_2)
            CurrentIPL = nil
          end
        end
      elseif "inside" == A2_2 then
        L4_2 = TriggerServerEvent
        L5_2 = "vms_housing:sv:enterCameraModeDifferentEnvironment"
        L6_2 = A0_2
        L7_2 = A2_2
        L4_2(L5_2, L6_2, L7_2)
        L4_2 = L3_2.type
        if "shell" == L4_2 then
          L4_2 = Property
          L5_2 = L4_2
          L4_2 = L4_2.RemoveFurniture
          L4_2(L5_2)
          L4_2 = CreateObjectNoOffset
          L5_2 = joaat
          L6_2 = L3_2.metadata
          L6_2 = L6_2.shell
          L5_2 = L5_2(L6_2)
          L6_2 = 0.0
          L7_2 = 0.0
          L8_2 = 500.0
          L9_2 = false
          L10_2 = false
          L11_2 = false
          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
          CurrentShell = L4_2
          while true do
            L4_2 = DoesEntityExist
            L5_2 = CurrentShell
            L4_2 = L4_2(L5_2)
            if L4_2 then
              break
            end
            L4_2 = Wait
            L5_2 = 1
            L4_2(L5_2)
          end
          L4_2 = SetEntityHeading
          L5_2 = CurrentShell
          L6_2 = 0.0
          L4_2(L5_2, L6_2)
          L4_2 = FreezeEntityPosition
          L5_2 = CurrentShell
          L6_2 = true
          L4_2(L5_2, L6_2)
          L4_2 = ToggleWeather
          if L4_2 then
            L4_2 = Citizen
            L4_2 = L4_2.CreateThread
            function L5_2()
              local L0_3, L1_3
              while true do
                L0_3 = CurrentShell
                if not L0_3 then
                  break
                end
                L0_3 = CurrentShell
                if L0_3 then
                  L0_3 = ToggleWeather
                  L1_3 = true
                  L0_3(L1_3)
                end
                L0_3 = Citizen
                L0_3 = L0_3.Wait
                L1_3 = 30000
                L0_3(L1_3)
              end
            end
            L4_2(L5_2)
          end
        else
          L4_2 = L3_2.type
          if "ipl" == L4_2 then
            L4_2 = L3_2.metadata
            L4_2 = L4_2.ipl
            CurrentIPL = L4_2
            L4_2 = IPL
            L4_2 = L4_2.LoadSettings
            L5_2 = CurrentIPL
            L6_2 = L3_2.metadata
            L6_2 = L6_2.iplTheme
            L7_2 = L3_2.metadata
            L7_2 = L7_2.iplSettings
            L4_2(L5_2, L6_2, L7_2)
          end
        end
        L4_2 = Wait
        L5_2 = 1500
        L4_2(L5_2)
        L4_2 = L3_2.metadata
        L4_2 = L4_2.lightState
        if nil ~= L4_2 then
          L4_2 = SetArtificialLightsState
          L5_2 = L3_2.metadata
          L5_2 = L5_2.lightState
          L5_2 = not L5_2
          L4_2(L5_2)
        end
        if L3_2 then
          L4_2 = L3_2.furniture
          if L4_2 then
            L4_2 = Property
            L5_2 = L4_2
            L4_2 = L4_2.LoadFurniture
            L6_2 = "inside"
            L7_2 = L3_2.furniture
            L8_2 = A0_2
            L4_2(L5_2, L6_2, L7_2, L8_2)
          end
        end
      end
    end
    L4_2 = 1
    L1_1 = L4_2
    L4_2 = true
    L0_1 = L4_2
  end
  L4_2 = L0_1
  if L4_2 then
    L4_2 = L3_1
    if L4_2 then
      L4_2 = SetEntityVisible
      L5_2 = L3_1
      L6_2 = true
      L4_2(L5_2, L6_2)
    end
    L4_2 = RenderScriptCams
    L5_2 = false
    L6_2 = false
    L7_2 = 0
    L8_2 = true
    L9_2 = false
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = DestroyCam
    L5_2 = L2_1
    L6_2 = false
    L4_2(L5_2, L6_2)
    L4_2 = false
    L2_1 = L4_2
  end
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = GetEntityCoords
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L7_2 = L1_1
  L6_2 = L4_1
  L6_2 = L6_2[L7_2]
  L7_2 = ClearFocus
  L7_2()
  L7_2 = L6_2.position
  if not L7_2 then
    L7_2 = DoScreenFadeOut
    L8_2 = 400
    L7_2(L8_2)
    L7_2 = false
    L0_1 = L7_2
    L7_2 = Wait
    L8_2 = 400
    L7_2(L8_2)
    L7_2 = ClearFocus
    L7_2()
    L7_2 = ClearTimecycleModifier
    L7_2()
    L7_2 = ClearExtraTimecycleModifier
    L7_2()
    L7_2 = RenderScriptCams
    L8_2 = false
    L9_2 = false
    L10_2 = 0
    L11_2 = true
    L12_2 = false
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    L7_2 = SetFocusEntity
    L8_2 = L4_2
    L7_2(L8_2)
    L7_2 = SetEntityCollision
    L8_2 = L4_2
    L9_2 = true
    L10_2 = true
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = SetEntityVisible
    L8_2 = L4_2
    L9_2 = true
    L7_2(L8_2, L9_2)
    L7_2 = Wait
    L8_2 = 300
    L7_2(L8_2)
    if A2_2 then
      L7_2 = CurrentProperty
      if L7_2 then
        if "outside" == A2_2 then
          L7_2 = Property
          L8_2 = L7_2
          L7_2 = L7_2.EnterProperty
          L9_2 = L3_2
          L10_2 = A0_2
          function L11_2(A0_3)
            local L1_3, L2_3
            if A0_3 then
              L1_3 = Citizen
              L1_3 = L1_3.CreateThread
              function L2_3()
                local L0_4, L1_4
                L0_4 = Citizen
                L0_4 = L0_4.Wait
                L1_4 = 3000
                L0_4(L1_4)
                L0_4 = openManageMenu
                L0_4()
              end
              L1_3(L2_3)
            end
          end
          L12_2 = true
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
        else
          L7_2 = FreezeEntityPosition
          L8_2 = L4_2
          L9_2 = false
          L7_2(L8_2, L9_2)
          L7_2 = DoScreenFadeIn
          L8_2 = 400
          L7_2(L8_2)
        end
      elseif "inside" == A2_2 then
        L7_2 = TriggerServerEvent
        L8_2 = "vms_housing:sv:exitCameraMode"
        L9_2 = A0_2
        L10_2 = A2_2
        L7_2(L8_2, L9_2, L10_2)
        L7_2 = ToggleWeather
        if L7_2 then
          L7_2 = ToggleWeather
          L8_2 = false
          L7_2(L8_2)
        end
        L7_2 = CurrentShell
        if L7_2 then
          L7_2 = DeleteObject
          L8_2 = CurrentShell
          L7_2(L8_2)
          CurrentShell = nil
        end
        L7_2 = CurrentIPL
        if L7_2 then
          L7_2 = IPL
          L7_2 = L7_2.UnloadSettings
          L8_2 = CurrentIPL
          L7_2(L8_2)
          CurrentIPL = nil
        end
        L7_2 = openManageMenu
        L7_2()
        L7_2 = Property
        L8_2 = L7_2
        L7_2 = L7_2.RemoveFurniture
        L7_2(L8_2)
        L7_2 = FreezeEntityPosition
        L8_2 = L4_2
        L9_2 = false
        L7_2(L8_2, L9_2)
        L7_2 = DoScreenFadeIn
        L8_2 = 400
        L7_2(L8_2)
      else
        L7_2 = FreezeEntityPosition
        L8_2 = L4_2
        L9_2 = false
        L7_2(L8_2, L9_2)
        L7_2 = DoScreenFadeIn
        L8_2 = 400
        L7_2(L8_2)
      end
    else
      L7_2 = openManageMenu
      L7_2()
      L7_2 = FreezeEntityPosition
      L8_2 = L4_2
      L9_2 = false
      L7_2(L8_2, L9_2)
      L7_2 = DoScreenFadeIn
      L8_2 = 400
      L7_2(L8_2)
    end
    L7_2 = {}
    L4_1 = L7_2
    L7_2 = SendNUIMessage
    L8_2 = {}
    L8_2.action = "ControlsMenu"
    L8_2.toggle = false
    L7_2(L8_2)
    return
  end
  L7_2 = CreateCamWithParams
  L8_2 = "DEFAULT_SCRIPTED_CAMERA"
  L9_2 = vector3
  L10_2 = L6_2.position
  L10_2 = L10_2.x
  L11_2 = L6_2.position
  L11_2 = L11_2.y
  L12_2 = L6_2.position
  L12_2 = L12_2.z
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = 0
  L11_2 = 0
  L12_2 = 0
  L13_2 = 50.0
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L2_1 = L7_2
  L7_2 = GetClosestObjectOfType
  L8_2 = L6_2.position
  L8_2 = L8_2.x
  L9_2 = L6_2.position
  L9_2 = L9_2.y
  L10_2 = L6_2.position
  L10_2 = L10_2.z
  L11_2 = 0.5
  L12_2 = GetHashKey
  L13_2 = L6_2.model
  L12_2 = L12_2(L13_2)
  L13_2 = false
  L14_2 = false
  L15_2 = false
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L3_1 = L7_2
  L7_2 = GetGameTimer
  L7_2 = L7_2()
  L7_2 = L7_2 + 3000
  while true do
    L8_2 = GetGameTimer
    L8_2 = L8_2()
    if not (L7_2 > L8_2) then
      break
    end
    L8_2 = DoesEntityExist
    L9_2 = L3_1
    L8_2 = L8_2(L9_2)
    if L8_2 then
      break
    end
    L8_2 = Wait
    L9_2 = 1
    L8_2(L9_2)
    L8_2 = GetClosestObjectOfType
    L9_2 = L6_2.position
    L9_2 = L9_2.x
    L10_2 = L6_2.position
    L10_2 = L10_2.y
    L11_2 = L6_2.position
    L11_2 = L11_2.z
    L12_2 = 0.5
    L13_2 = GetHashKey
    L14_2 = L6_2.model
    L13_2 = L13_2(L14_2)
    L14_2 = false
    L15_2 = false
    L16_2 = false
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L3_1 = L8_2
  end
  L8_2 = GetEntityRotation
  L9_2 = L3_1
  L8_2 = L8_2(L9_2)
  L9_2 = L8_2.x
  L9_2 = L9_2 - 18.0
  L10_2 = L8_2.z
  L10_2 = L10_2 + 180.0
  L10_2 = L10_2 % 360.0
  L11_2 = SetCamRot
  L12_2 = L2_1
  L13_2 = L9_2
  L14_2 = L8_2.y
  L15_2 = L10_2
  L16_2 = 2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = SetCamActive
  L12_2 = L2_1
  L13_2 = true
  L11_2(L12_2, L13_2)
  L11_2 = SetTimecycleModifier
  L12_2 = "scanline_cam_cheap"
  L11_2(L12_2)
  L11_2 = DisableAllControlActions
  L12_2 = 0
  L11_2(L12_2)
  L11_2 = FreezeEntityPosition
  L12_2 = L4_2
  L13_2 = true
  L11_2(L12_2, L13_2)
  L11_2 = SetEntityCollision
  L12_2 = L4_2
  L13_2 = false
  L14_2 = true
  L11_2(L12_2, L13_2, L14_2)
  L11_2 = SetEntityVisible
  L12_2 = L4_2
  L13_2 = false
  L11_2(L12_2, L13_2)
  L11_2 = SetEntityVisible
  L12_2 = L3_1
  L13_2 = false
  L11_2(L12_2, L13_2)
  L11_2 = SetTimecycleModifierStrength
  L12_2 = 2.0
  L11_2(L12_2)
  L11_2 = SetFocusArea
  L12_2 = L6_2.position
  L12_2 = L12_2.x
  L13_2 = L6_2.position
  L13_2 = L13_2.y
  L14_2 = L6_2.position
  L14_2 = L14_2.z
  L15_2 = 0.0
  L16_2 = 0.0
  L17_2 = 0.0
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L11_2 = PointCamAtCoord
  L12_2 = L2_1
  L13_2 = vector3
  L14_2 = L6_2.position
  L14_2 = L14_2.x
  L15_2 = L6_2.position
  L15_2 = L15_2.y
  L16_2 = L6_2.position
  L16_2 = L16_2.z
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L13_2(L14_2, L15_2, L16_2)
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  L11_2 = RenderScriptCams
  L12_2 = true
  L13_2 = false
  L14_2 = 1
  L15_2 = true
  L16_2 = false
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = Wait
  L12_2 = 1000
  L11_2(L12_2)
  L11_2 = DoScreenFadeIn
  L12_2 = 500
  L11_2(L12_2)
  L11_2 = RequestAmbientAudioBank
  L12_2 = "Phone_Soundset_Franklin"
  L13_2 = 0
  L14_2 = 0
  L11_2(L12_2, L13_2, L14_2)
  L11_2 = RequestAmbientAudioBank
  L12_2 = "HintCamSounds"
  L13_2 = 0
  L14_2 = 0
  L11_2(L12_2, L13_2, L14_2)
  L11_2 = SendNUIMessage
  L12_2 = {}
  L12_2.action = "ControlsMenu"
  L12_2.toggle = true
  L12_2.controlsLabel = "property:camera"
  L12_2.controlsName = "Property:camera"
  L11_2(L12_2)
  while true do
    L11_2 = IsCamActive
    L12_2 = L2_1
    L11_2 = L11_2(L12_2)
    if not L11_2 then
      break
    end
    L11_2 = Citizen
    L11_2 = L11_2.Wait
    L12_2 = 2
    L11_2(L12_2)
    L11_2 = DisableAllControlActions
    L12_2 = 0
    L11_2(L12_2)
    L11_2 = HideHudComponentThisFrame
    L12_2 = 7
    L11_2(L12_2)
    L11_2 = HideHudComponentThisFrame
    L12_2 = 8
    L11_2(L12_2)
    L11_2 = HideHudComponentThisFrame
    L12_2 = 9
    L11_2(L12_2)
    L11_2 = HideHudComponentThisFrame
    L12_2 = 6
    L11_2(L12_2)
    L11_2 = HideHudComponentThisFrame
    L12_2 = 19
    L11_2(L12_2)
    L11_2 = HideHudAndRadarThisFrame
    L11_2()
    L11_2 = SetEntityLocallyInvisible
    L12_2 = L3_1
    L11_2(L12_2)
    L11_2 = IsDisabledControlPressed
    L12_2 = 0
    L13_2 = 174
    L11_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L11_2 = L1_1
      L12_2 = L11_2 - 1
      L11_2 = L4_1
      L11_2 = L11_2[L12_2]
      if L11_2 then
        L11_2 = L1_1
        L11_2 = L11_2 - 1
        L1_1 = L11_2
        L11_2 = checkCameras
        L12_2 = A0_2
        L13_2 = nil
        L14_2 = A2_2
        L11_2(L12_2, L13_2, L14_2)
      else
        L11_2 = L1_1
        L12_2 = L4_1
        L12_2 = #L12_2
        if L11_2 ~= L12_2 then
          L11_2 = L4_1
          L11_2 = #L11_2
          L1_1 = L11_2
          L11_2 = checkCameras
          L12_2 = A0_2
          L13_2 = nil
          L14_2 = A2_2
          L11_2(L12_2, L13_2, L14_2)
        end
      end
    end
    L11_2 = IsDisabledControlPressed
    L12_2 = 0
    L13_2 = 175
    L11_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L11_2 = L1_1
      L12_2 = L11_2 + 1
      L11_2 = L4_1
      L11_2 = L11_2[L12_2]
      if L11_2 then
        L11_2 = L1_1
        L11_2 = L11_2 + 1
        L1_1 = L11_2
        L11_2 = checkCameras
        L12_2 = A0_2
        L13_2 = nil
        L14_2 = A2_2
        L11_2(L12_2, L13_2, L14_2)
      else
        L11_2 = L1_1
        if 1 ~= L11_2 then
          L11_2 = 1
          L1_1 = L11_2
          L11_2 = checkCameras
          L12_2 = A0_2
          L13_2 = nil
          L14_2 = A2_2
          L11_2(L12_2, L13_2, L14_2)
        end
      end
    end
    L11_2 = SetTextFont
    L12_2 = 4
    L11_2(L12_2)
    L11_2 = SetTextScale
    L12_2 = 0.8
    L13_2 = 0.8
    L11_2(L12_2, L13_2)
    L11_2 = SetTextColour
    L12_2 = 255
    L13_2 = 255
    L14_2 = 255
    L15_2 = 255
    L11_2(L12_2, L13_2, L14_2, L15_2)
    L11_2 = SetTextDropshadow
    L12_2 = 0.1
    L13_2 = 3
    L14_2 = 27
    L15_2 = 27
    L16_2 = 255
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    L11_2 = BeginTextCommandDisplayText
    L12_2 = "STRING"
    L11_2(L12_2)
    L11_2 = AddTextComponentSubstringPlayerName
    L12_2 = L3_2.address
    L13_2 = " - Cam "
    L14_2 = L1_1
    L15_2 = "/"
    L16_2 = L4_1
    L16_2 = #L16_2
    L12_2 = L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2
    L11_2(L12_2)
    L11_2 = EndTextCommandDisplayText
    L12_2 = 0.01
    L13_2 = 0.01
    L11_2(L12_2, L13_2)
    L11_2 = SetTextFont
    L12_2 = 4
    L11_2(L12_2)
    L11_2 = SetTextScale
    L12_2 = 0.7
    L13_2 = 0.7
    L11_2(L12_2, L13_2)
    L11_2 = SetTextColour
    L12_2 = 255
    L13_2 = 255
    L14_2 = 255
    L15_2 = 255
    L11_2(L12_2, L13_2, L14_2, L15_2)
    L11_2 = SetTextDropshadow
    L12_2 = 0.1
    L13_2 = 3
    L14_2 = 27
    L15_2 = 27
    L16_2 = 255
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    L11_2 = BeginTextCommandDisplayText
    L12_2 = "STRING"
    L11_2(L12_2)
    L11_2 = GetPosixTime
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L11_2()
    L17_2 = AddTextComponentSubstringPlayerName
    L18_2 = ""
    L19_2 = L13_2
    L20_2 = "/"
    L21_2 = L12_2
    L22_2 = "/"
    L23_2 = L11_2
    L24_2 = " "
    L25_2 = L14_2
    L26_2 = ":"
    L27_2 = L15_2
    L28_2 = ":"
    L29_2 = L16_2
    L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2 .. L27_2 .. L28_2 .. L29_2
    L17_2(L18_2)
    L17_2 = EndTextCommandDisplayText
    L18_2 = 0.01
    L19_2 = 0.055
    L17_2(L18_2, L19_2)
    L17_2 = IsDisabledControlPressed
    L18_2 = 1
    L19_2 = 194
    L17_2 = L17_2(L18_2, L19_2)
    if L17_2 then
      L17_2 = DoScreenFadeOut
      L18_2 = 400
      L17_2(L18_2)
      L17_2 = false
      L0_1 = L17_2
      L17_2 = Wait
      L18_2 = 400
      L17_2(L18_2)
      L17_2 = ClearFocus
      L17_2()
      L17_2 = ClearTimecycleModifier
      L17_2()
      L17_2 = ClearExtraTimecycleModifier
      L17_2()
      L17_2 = RenderScriptCams
      L18_2 = false
      L19_2 = false
      L20_2 = 0
      L21_2 = true
      L22_2 = false
      L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
      L17_2 = SetCamActive
      L18_2 = L2_1
      L19_2 = false
      L17_2(L18_2, L19_2)
      L17_2 = DestroyCam
      L18_2 = L2_1
      L19_2 = false
      L17_2(L18_2, L19_2)
      L17_2 = SetFocusEntity
      L18_2 = L4_2
      L17_2(L18_2)
      L17_2 = SetEntityCollision
      L18_2 = L4_2
      L19_2 = true
      L20_2 = true
      L17_2(L18_2, L19_2, L20_2)
      L17_2 = SetEntityVisible
      L18_2 = L4_2
      L19_2 = true
      L17_2(L18_2, L19_2)
      L17_2 = Wait
      L18_2 = 300
      L17_2(L18_2)
      if A2_2 then
        L17_2 = CurrentProperty
        if L17_2 then
          if "outside" == A2_2 then
            L17_2 = Property
            L18_2 = L17_2
            L17_2 = L17_2.EnterProperty
            L19_2 = L3_2
            L20_2 = A0_2
            function L21_2(A0_3)
              local L1_3, L2_3
              if A0_3 then
                L1_3 = Citizen
                L1_3 = L1_3.CreateThread
                function L2_3()
                  local L0_4, L1_4
                  L0_4 = Citizen
                  L0_4 = L0_4.Wait
                  L1_4 = 3000
                  L0_4(L1_4)
                  L0_4 = openManageMenu
                  L0_4()
                end
                L1_3(L2_3)
              end
            end
            L22_2 = true
            L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
          else
            L17_2 = FreezeEntityPosition
            L18_2 = L4_2
            L19_2 = false
            L17_2(L18_2, L19_2)
            L17_2 = DoScreenFadeIn
            L18_2 = 400
            L17_2(L18_2)
          end
        elseif "inside" == A2_2 then
          L17_2 = TriggerServerEvent
          L18_2 = "vms_housing:sv:exitCameraMode"
          L19_2 = A0_2
          L20_2 = A2_2
          L17_2(L18_2, L19_2, L20_2)
          L17_2 = ToggleWeather
          if L17_2 then
            L17_2 = ToggleWeather
            L18_2 = false
            L17_2(L18_2)
          end
          L17_2 = CurrentShell
          if L17_2 then
            L17_2 = DeleteObject
            L18_2 = CurrentShell
            L17_2(L18_2)
            CurrentShell = nil
          end
          L17_2 = CurrentIPL
          if L17_2 then
            L17_2 = IPL
            L17_2 = L17_2.UnloadSettings
            L18_2 = CurrentIPL
            L17_2(L18_2)
            CurrentIPL = nil
          end
          L17_2 = openManageMenu
          L17_2()
          L17_2 = Property
          L18_2 = L17_2
          L17_2 = L17_2.RemoveFurniture
          L17_2(L18_2)
          L17_2 = FreezeEntityPosition
          L18_2 = L4_2
          L19_2 = false
          L17_2(L18_2, L19_2)
          L17_2 = DoScreenFadeIn
          L18_2 = 400
          L17_2(L18_2)
        else
          L17_2 = FreezeEntityPosition
          L18_2 = L4_2
          L19_2 = false
          L17_2(L18_2, L19_2)
          L17_2 = DoScreenFadeIn
          L18_2 = 400
          L17_2(L18_2)
        end
      else
        L17_2 = openManageMenu
        L17_2()
        L17_2 = FreezeEntityPosition
        L18_2 = L4_2
        L19_2 = false
        L17_2(L18_2, L19_2)
        L17_2 = DoScreenFadeIn
        L18_2 = 400
        L17_2(L18_2)
      end
      L17_2 = SetEntityVisible
      L18_2 = L3_1
      L19_2 = true
      L17_2(L18_2, L19_2)
      L17_2 = {}
      L4_1 = L17_2
      break
    end
  end
  L11_2 = SendNUIMessage
  L12_2 = {}
  L12_2.action = "ControlsMenu"
  L12_2.toggle = false
  L11_2(L12_2)
  L11_2 = SetEntityVisible
  L12_2 = L3_1
  L13_2 = true
  L11_2(L12_2, L13_2)
end
checkCameras = L5_1
