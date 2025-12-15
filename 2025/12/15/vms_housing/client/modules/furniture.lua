local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
furnitureMode = false
L0_1 = false
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  if nil ~= A0_2 then
    L0_1 = A0_2
  else
    L1_2 = L0_1
    L1_2 = not L1_2
    L0_1 = L1_2
  end
  L1_2 = L0_1
  if L1_2 then
    L1_2 = SetCursorLocation
    L2_2 = 0.5
    L3_2 = 0.5
    L1_2(L2_2, L3_2)
    L1_2 = EnterCursorMode
    L1_2()
  else
    L1_2 = LeaveCursorMode
    L1_2()
  end
end
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L3_2 = CurrentProperty
  if not L3_2 then
    L3_2 = GetCurrentPropertyId
    L3_2 = L3_2()
  end
  L4_2 = CurrentPropertyData
  if not L4_2 then
    L4_2 = GetCurrentPropertyData
    L4_2 = L4_2()
  end
  L5_2 = 0.0
  L6_2 = false
  L7_2 = L4_2.type
  if "mlo" == L7_2 then
    L7_2 = IsInsideMLO
    L7_2 = L7_2()
    L6_2 = L7_2
  else
    L7_2 = CurrentProperty
    if L7_2 then
      L6_2 = true
    end
  end
  L7_2 = SendNUIMessage
  L8_2 = {}
  L8_2.action = "Property"
  L8_2.actionName = "FurniturePlace"
  L7_2(L8_2)
  L7_2 = SetNuiFocus
  L8_2 = false
  L9_2 = false
  L7_2(L8_2, L9_2)
  L7_2 = Property
  L7_2 = L7_2.EditingFurnitureObj
  if L7_2 then
    L7_2 = DeleteEntity
    L8_2 = Property
    L8_2 = L8_2.EditingFurnitureObj
    L7_2(L8_2)
    L7_2 = Property
    L7_2.EditingFurnitureObj = nil
    L7_2 = Property
    L8_2 = {}
    L7_2.EditingFurnitureData = L8_2
  end
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = GetGameplayCamRot
    L0_3 = L0_3()
    L1_3 = math
    L1_3 = L1_3.pi
    L1_3 = L1_3 / 180
    L0_3 = L0_3 * L1_3
    L1_3 = vector3
    L2_3 = math
    L2_3 = L2_3.sin
    L3_3 = L0_3.z
    L2_3 = L2_3(L3_3)
    L2_3 = -L2_3
    L3_3 = math
    L3_3 = L3_3.cos
    L4_3 = L0_3.z
    L3_3 = L3_3(L4_3)
    L4_3 = math
    L4_3 = L4_3.sin
    L5_3 = L0_3.x
    L4_3, L5_3 = L4_3(L5_3)
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  if A0_2 then
    L8_2 = pairs
    L9_2 = Property
    L9_2 = L9_2.LoadedFurnitures
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = L13_2.furnitureId
      if L14_2 == A2_2 then
        L14_2 = Property
        L15_2 = L13_2.entity
        L14_2.EditingFurnitureObj = L15_2
      end
    end
  elseif A1_2 then
    L8_2 = Property
    L9_2 = library
    L9_2 = L9_2.SpawnProp
    L10_2 = A1_2
    L11_2 = GetEntityCoords
    L12_2 = PlayerPedId
    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L12_2()
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
    L12_2 = false
    L13_2 = nil
    L14_2 = true
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L8_2.EditingFurnitureObj = L9_2
    L8_2 = GetGameTimer
    L8_2 = L8_2()
    L8_2 = L8_2 + 5000
    L9_2 = false
    while true do
      L10_2 = DoesEntityExist
      L11_2 = Property
      L11_2 = L11_2.EditingFurnitureObj
      L10_2 = L10_2(L11_2)
      if L10_2 then
        break
      end
      L10_2 = GetGameTimer
      L10_2 = L10_2()
      if L8_2 < L10_2 then
        L9_2 = true
        break
      end
      L10_2 = Citizen
      L10_2 = L10_2.Wait
      L11_2 = 5
      L10_2(L11_2)
    end
    if L9_2 then
      L10_2 = library
      L10_2 = L10_2.Debug
      L11_2 = "Unable to load object..."
      return L10_2(L11_2)
    end
  end
  L8_2 = PlaceObjectOnGroundProperly
  L9_2 = Property
  L9_2 = L9_2.EditingFurnitureObj
  L8_2(L9_2)
  L8_2 = SetEntityAsMissionEntity
  L9_2 = Property
  L9_2 = L9_2.EditingFurnitureObj
  L10_2 = true
  L11_2 = true
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = SetEntityCollision
  L9_2 = Property
  L9_2 = L9_2.EditingFurnitureObj
  L10_2 = false
  L11_2 = false
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = SetEntityNoCollisionEntity
  L9_2 = PlayerPedId
  L9_2 = L9_2()
  L10_2 = Property
  L10_2 = L10_2.EditingFurnitureObj
  L11_2 = false
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = SetEntityNoCollisionEntity
  L9_2 = Property
  L9_2 = L9_2.EditingFurnitureObj
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = false
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = FreezeEntityPosition
  L9_2 = Property
  L9_2 = L9_2.EditingFurnitureObj
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetEntityDynamic
  L9_2 = Property
  L9_2 = L9_2.EditingFurnitureObj
  L10_2 = false
  L8_2(L9_2, L10_2)
  L8_2 = SetEntityProofs
  L9_2 = Property
  L9_2 = L9_2.EditingFurnitureObj
  L10_2 = true
  L11_2 = true
  L12_2 = true
  L13_2 = true
  L14_2 = true
  L15_2 = true
  L16_2 = true
  L17_2 = true
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L8_2 = SetEntityCanBeDamaged
  L9_2 = Property
  L9_2 = L9_2.EditingFurnitureObj
  L10_2 = false
  L8_2(L9_2, L10_2)
  L8_2 = 0
  furnitureMode = "gizmo"
  L9_2 = HousingCreator
  L10_2 = L9_2
  L9_2 = L9_2.CreateCamera
  L11_2 = true
  L9_2(L10_2, L11_2)
  L9_2 = L1_1
  L9_2()
  L9_2 = SendNUIMessage
  L10_2 = {}
  L10_2.action = "ControlsMenu"
  L10_2.toggle = true
  L11_2 = furnitureMode
  if "gizmo" == L11_2 then
    L11_2 = "furniture:gizmo"
    if L11_2 then
      goto lbl_187
    end
  end
  L11_2 = "furniture:walkmode"
  ::lbl_187::
  L10_2.controlsLabel = L11_2
  L11_2 = furnitureMode
  if "gizmo" == L11_2 then
    L11_2 = "Furniture:gizmo"
    if L11_2 then
      goto lbl_195
    end
  end
  L11_2 = "Furniture:walkmode"
  ::lbl_195::
  L10_2.controlsName = L11_2
  L9_2(L10_2)
  while true do
    L9_2 = Property
    L9_2 = L9_2.EditingFurnitureObj
    if not L9_2 then
      break
    end
    L9_2 = PlayerPedId
    L9_2 = L9_2()
    L10_2 = GetEntityCoords
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    L11_2 = HudForceWeaponWheel
    L12_2 = false
    L11_2(L12_2)
    L11_2 = HideHudComponentThisFrame
    L12_2 = 19
    L11_2(L12_2)
    L11_2 = HideHudComponentThisFrame
    L12_2 = 20
    L11_2(L12_2)
    L11_2 = GetEntityCoords
    L12_2 = Property
    L12_2 = L12_2.EditingFurnitureObj
    L11_2 = L11_2(L12_2)
    L12_2 = GetEntityHeading
    L13_2 = Property
    L13_2 = L13_2.EditingFurnitureObj
    L12_2 = L12_2(L13_2)
    L13_2 = GetEntityRotation
    L14_2 = Property
    L14_2 = L14_2.EditingFurnitureObj
    L15_2 = 2
    L13_2 = L13_2(L14_2, L15_2)
    L14_2 = SetEntityDrawOutline
    L15_2 = Property
    L15_2 = L15_2.EditingFurnitureObj
    L16_2 = true
    L14_2(L15_2, L16_2)
    L14_2 = SetEntityDrawOutlineColor
    L15_2 = 159
    L16_2 = 15
    L17_2 = 255
    L18_2 = 200
    L14_2(L15_2, L16_2, L17_2, L18_2)
    L14_2 = SetEntityDrawOutlineShader
    L15_2 = 1
    L14_2(L15_2)
    L14_2 = DisabledControls
    L14_2()
    L14_2 = Wait
    L15_2 = 0
    L14_2(L15_2)
    L14_2 = furnitureMode
    if "gizmo" == L14_2 then
      L14_2 = makeEntityMatrix
      L15_2 = Property
      L15_2 = L15_2.EditingFurnitureObj
      L14_2 = L14_2(L15_2)
      L15_2 = Citizen
      L15_2 = L15_2.InvokeNative
      L16_2 = 3945716898
      L18_2 = L14_2
      L17_2 = L14_2.Buffer
      L17_2 = L17_2(L18_2)
      L18_2 = "Editor1"
      L19_2 = Citizen
      L19_2 = L19_2.ReturnResultAnyway
      L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L19_2()
      L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
      if L15_2 then
        L16_2 = applyEntityMatrix
        L17_2 = Property
        L17_2 = L17_2.EditingFurnitureObj
        L18_2 = L14_2
        L16_2(L17_2, L18_2)
      end
      L16_2 = EnableControlAction
      L17_2 = 0
      L18_2 = Config
      L18_2 = L18_2.FurnitureControls
      L18_2 = L18_2.ENABLE_CURSOR
      L18_2 = L18_2.controlIndex
      L19_2 = true
      L16_2(L17_2, L18_2, L19_2)
      L16_2 = IsControlJustPressed
      L17_2 = 0
      L18_2 = Config
      L18_2 = L18_2.FurnitureControls
      L18_2 = L18_2.ENABLE_CURSOR
      L18_2 = L18_2.controlIndex
      L16_2 = L16_2(L17_2, L18_2)
      if L16_2 then
        L16_2 = L1_1
        L16_2()
      end
      L16_2 = rotateCamInputs
      L16_2()
      L16_2 = moveCamInputs
      L17_2 = true
      L16_2(L17_2)
    else
      L14_2 = RayCastGamePlayCamera
      L15_2 = nil
      L16_2 = 150.0
      L14_2, L15_2 = L14_2(L15_2, L16_2)
      if L14_2 then
        L16_2 = DrawLine
        L17_2 = L10_2.x
        L18_2 = L10_2.y
        L19_2 = L10_2.z
        L20_2 = L15_2.x
        L21_2 = L15_2.y
        L22_2 = L15_2.z
        L23_2 = 159
        L24_2 = 15
        L25_2 = 255
        L26_2 = 250
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
        L16_2 = Property
        L16_2 = L16_2.EditingFurnitureObj
        if L16_2 then
          L16_2 = SetEntityCoords
          L17_2 = Property
          L17_2 = L17_2.EditingFurnitureObj
          L18_2 = L15_2.x
          L19_2 = L15_2.y
          L20_2 = L15_2.z
          L20_2 = L20_2 + L5_2
          L16_2(L17_2, L18_2, L19_2, L20_2)
        end
      end
      L16_2 = IsControlPressed
      L17_2 = 0
      L18_2 = Config
      L18_2 = L18_2.FurnitureControls
      L18_2 = L18_2.UP
      L18_2 = L18_2.controlIndex
      L16_2 = L16_2(L17_2, L18_2)
      if L16_2 then
        L16_2 = IsControlReleased
        L17_2 = 0
        L18_2 = Config
        L18_2 = L18_2.FurnitureControls
        L18_2 = L18_2.SPEED_DOWN
        L18_2 = L18_2.controlIndex
        L16_2 = L16_2(L17_2, L18_2)
        if L16_2 then
          L16_2 = Config
          L16_2 = L16_2.FurnitureSettings
          L16_2 = L16_2.HeightSpeed
          L5_2 = L5_2 + L16_2
        else
          L16_2 = Config
          L16_2 = L16_2.FurnitureSettings
          L16_2 = L16_2.HeightSpeedSlow
          L5_2 = L5_2 + L16_2
        end
      end
      L16_2 = IsControlPressed
      L17_2 = 0
      L18_2 = Config
      L18_2 = L18_2.FurnitureControls
      L18_2 = L18_2.DOWN
      L18_2 = L18_2.controlIndex
      L16_2 = L16_2(L17_2, L18_2)
      if L16_2 then
        L16_2 = IsControlReleased
        L17_2 = 0
        L18_2 = Config
        L18_2 = L18_2.FurnitureControls
        L18_2 = L18_2.SPEED_DOWN
        L18_2 = L18_2.controlIndex
        L16_2 = L16_2(L17_2, L18_2)
        if L16_2 then
          L16_2 = Config
          L16_2 = L16_2.FurnitureSettings
          L16_2 = L16_2.HeightSpeed
          L5_2 = L5_2 - L16_2
        else
          L16_2 = Config
          L16_2 = L16_2.FurnitureSettings
          L16_2 = L16_2.HeightSpeedSlow
          L5_2 = L5_2 - L16_2
        end
      end
      L16_2 = IsControlPressed
      L17_2 = 0
      L18_2 = Config
      L18_2 = L18_2.FurnitureControls
      L18_2 = L18_2.ROTATE_LEFT
      L18_2 = L18_2.controlIndex
      L16_2 = L16_2(L17_2, L18_2)
      if L16_2 then
        L16_2 = IsControlReleased
        L17_2 = 0
        L18_2 = Config
        L18_2 = L18_2.FurnitureControls
        L18_2 = L18_2.SPEED_DOWN
        L18_2 = L18_2.controlIndex
        L16_2 = L16_2(L17_2, L18_2)
        if L16_2 then
          L16_2 = Config
          L16_2 = L16_2.FurnitureSettings
          L16_2 = L16_2.RotateSpeed
          L12_2 = L12_2 + L16_2
        else
          L16_2 = Config
          L16_2 = L16_2.FurnitureSettings
          L16_2 = L16_2.RotateSpeedSlow
          L12_2 = L12_2 + L16_2
        end
        L16_2 = SetEntityRotation
        L17_2 = Property
        L17_2 = L17_2.EditingFurnitureObj
        L18_2 = 0
        L19_2 = 0
        L20_2 = L12_2
        L21_2 = 1
        L22_2 = true
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      end
      L16_2 = IsControlPressed
      L17_2 = 0
      L18_2 = Config
      L18_2 = L18_2.FurnitureControls
      L18_2 = L18_2.ROTATE_RIGHT
      L18_2 = L18_2.controlIndex
      L16_2 = L16_2(L17_2, L18_2)
      if L16_2 then
        L16_2 = IsControlReleased
        L17_2 = 0
        L18_2 = Config
        L18_2 = L18_2.FurnitureControls
        L18_2 = L18_2.SPEED_DOWN
        L18_2 = L18_2.controlIndex
        L16_2 = L16_2(L17_2, L18_2)
        if L16_2 then
          L16_2 = Config
          L16_2 = L16_2.FurnitureSettings
          L16_2 = L16_2.RotateSpeed
          L12_2 = L12_2 - L16_2
        else
          L16_2 = Config
          L16_2 = L16_2.FurnitureSettings
          L16_2 = L16_2.RotateSpeedSlow
          L12_2 = L12_2 - L16_2
        end
        L16_2 = SetEntityRotation
        L17_2 = Property
        L17_2 = L17_2.EditingFurnitureObj
        L18_2 = 0
        L19_2 = 0
        L20_2 = L12_2
        L21_2 = 1
        L22_2 = true
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      end
    end
    L14_2 = EnableControlAction
    L15_2 = 0
    L16_2 = Config
    L16_2 = L16_2.FurnitureControls
    L16_2 = L16_2.CHANGE_MODE
    L16_2 = L16_2.controlIndex
    L17_2 = true
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = IsControlJustPressed
    L15_2 = 0
    L16_2 = Config
    L16_2 = L16_2.FurnitureControls
    L16_2 = L16_2.CHANGE_MODE
    L16_2 = L16_2.controlIndex
    L14_2 = L14_2(L15_2, L16_2)
    if L14_2 then
      L14_2 = GetGameTimer
      L14_2 = L14_2()
      L15_2 = L8_2 + 3000
      if L14_2 >= L15_2 then
        L14_2 = GetGameTimer
        L14_2 = L14_2()
        L8_2 = L14_2
        L14_2 = furnitureMode
        if "gizmo" == L14_2 then
          furnitureMode = "normal"
          L14_2 = L0_1
          if L14_2 then
            L14_2 = L1_1
            L15_2 = false
            L14_2(L15_2)
          end
          L14_2 = HousingCreator
          L15_2 = L14_2
          L14_2 = L14_2.DeleteCamera
          L14_2(L15_2)
          L14_2 = FreezeEntityPosition
          L15_2 = PlayerPedId
          L15_2 = L15_2()
          L16_2 = false
          L14_2(L15_2, L16_2)
        else
          furnitureMode = "gizmo"
          L14_2 = L1_1
          L15_2 = true
          L14_2(L15_2)
          L14_2 = HousingCreator
          L15_2 = L14_2
          L14_2 = L14_2.CreateCamera
          L16_2 = true
          L14_2(L15_2, L16_2)
        end
        L14_2 = SendNUIMessage
        L15_2 = {}
        L15_2.action = "ControlsMenu"
        L15_2.toggle = true
        L16_2 = furnitureMode
        if "gizmo" == L16_2 then
          L16_2 = "furniture:gizmo"
          if L16_2 then
            goto lbl_526
          end
        end
        L16_2 = "furniture:walkmode"
        ::lbl_526::
        L15_2.controlsLabel = L16_2
        L16_2 = furnitureMode
        if "gizmo" == L16_2 then
          L16_2 = "Furniture:gizmo"
          if L16_2 then
            goto lbl_534
          end
        end
        L16_2 = "Furniture:walkmode"
        ::lbl_534::
        L15_2.controlsName = L16_2
        L14_2(L15_2)
      else
        L14_2 = CL
        L14_2 = L14_2.Notification
        L15_2 = TRANSLATE
        L16_2 = "notify.furniture:mode_cooldown"
        L15_2 = L15_2(L16_2)
        L16_2 = 4000
        L17_2 = "error"
        L14_2(L15_2, L16_2, L17_2)
      end
    end
    L14_2 = EnableControlAction
    L15_2 = 0
    L16_2 = Config
    L16_2 = L16_2.FurnitureControls
    L16_2 = L16_2.SNAP_TO_GROUND
    L16_2 = L16_2.controlIndex
    L17_2 = true
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = IsControlJustPressed
    L15_2 = 0
    L16_2 = Config
    L16_2 = L16_2.FurnitureControls
    L16_2 = L16_2.SNAP_TO_GROUND
    L16_2 = L16_2.controlIndex
    L14_2 = L14_2(L15_2, L16_2)
    if L14_2 then
      L14_2 = PlaceObjectOnGroundProperly_2
      L15_2 = Property
      L15_2 = L15_2.EditingFurnitureObj
      L14_2(L15_2)
    end
    L14_2 = DoesEntityExist
    L15_2 = Property
    L15_2 = L15_2.EditingFurnitureObj
    L14_2 = L14_2(L15_2)
    if not L14_2 then
      L14_2 = Property
      L14_2.EditingFurniture = false
      L14_2 = DeleteObject
      L15_2 = Property
      L15_2 = L15_2.EditingFurnitureObj
      L14_2(L15_2)
      L14_2 = Property
      L14_2.EditingFurnitureObj = nil
    end
    L14_2 = IsControlJustPressed
    L15_2 = 0
    L16_2 = Config
    L16_2 = L16_2.FurnitureControls
    L16_2 = L16_2.CLOSE
    L16_2 = L16_2.controlIndex
    L14_2 = L14_2(L15_2, L16_2)
    if L14_2 then
      L14_2 = Property
      L14_2.EditingFurniture = false
      L14_2 = DeleteObject
      L15_2 = Property
      L15_2 = L15_2.EditingFurnitureObj
      L14_2(L15_2)
      L14_2 = Property
      L14_2.EditingFurnitureObj = nil
      L14_2 = Property
      L15_2 = L14_2
      L14_2 = L14_2.RemoveFurniture
      L16_2 = nil
      function L17_2()
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
        L3_3 = L4_2.furniture
        L4_3 = CurrentProperty
        L0_3(L1_3, L2_3, L3_3, L4_3)
        L0_3 = L4_2.type
        if "mlo" == L0_3 then
          L0_3 = Property
          L1_3 = L0_3
          L0_3 = L0_3.LoadFurniture
          L2_3 = CurrentProperty
          if L2_3 then
            L2_3 = "outside"
            if L2_3 then
              goto lbl_25
            end
          end
          L2_3 = "inside"
          ::lbl_25::
          L3_3 = L4_2.furniture
          L4_3 = CurrentProperty
          L0_3(L1_3, L2_3, L3_3, L4_3)
        end
      end
      L14_2(L15_2, L16_2, L17_2)
    end
    L14_2 = EnableControlAction
    L15_2 = 0
    L16_2 = Config
    L16_2 = L16_2.FurnitureControls
    L16_2 = L16_2.ACCEPT
    L16_2 = L16_2.controlIndex
    L17_2 = true
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = IsControlJustPressed
    L15_2 = 0
    L16_2 = Config
    L16_2 = L16_2.FurnitureControls
    L16_2 = L16_2.ACCEPT
    L16_2 = L16_2.controlIndex
    L14_2 = L14_2(L15_2, L16_2)
    if L14_2 then
      L14_2 = GetEntityCoords
      L15_2 = Property
      L15_2 = L15_2.EditingFurnitureObj
      L14_2 = L14_2(L15_2)
      L15_2 = L4_2.metadata
      L15_2 = L15_2.zone
      if L15_2 then
        L15_2 = isPointInPolygon
        L16_2 = L14_2
        L17_2 = L4_2.metadata
        L17_2 = L17_2.zone
        L17_2 = L17_2.points
        L15_2 = L15_2(L16_2, L17_2)
      end
      if L6_2 or not L6_2 and L15_2 then
        L16_2 = true
        L17_2 = L4_2.type
        if "mlo" == L17_2 then
          L17_2 = isPointInPolygon
          L18_2 = L14_2
          L19_2 = L4_2.metadata
          L19_2 = L19_2.interiorZone
          L19_2 = L19_2.points
          L17_2 = L17_2(L18_2, L19_2)
          L18_2 = Furniture
          L18_2 = L18_2[A1_2]
          L18_2 = L18_2.isIndoor
          L18_2 = 1 == L18_2
          L19_2 = Furniture
          L19_2 = L19_2[A1_2]
          L19_2 = L19_2.isOutdoor
          L19_2 = 1 == L19_2
          L20_2 = L4_2.metadata
          if L20_2 then
            L20_2 = L20_2.allowFurnitureInside
          end
          L20_2 = false ~= L20_2
          L21_2 = L4_2.metadata
          if L21_2 then
            L21_2 = L21_2.allowFurnitureOutside
          end
          L21_2 = false ~= L21_2
          if L17_2 then
            if not L18_2 then
              L16_2 = false
              L22_2 = CL
              L22_2 = L22_2.Notification
              L23_2 = TRANSLATE
              L24_2 = "notify.furniture:cannot_place_inside"
              L23_2 = L23_2(L24_2)
              L24_2 = 4000
              L25_2 = "error"
              L22_2(L23_2, L24_2, L25_2)
            elseif not L20_2 then
              L16_2 = false
              L22_2 = CL
              L22_2 = L22_2.Notification
              L23_2 = TRANSLATE
              L24_2 = "notify.furniture:inside_disabled"
              L23_2 = L23_2(L24_2)
              L24_2 = 4000
              L25_2 = "error"
              L22_2(L23_2, L24_2, L25_2)
            end
          else
            if not L19_2 then
              L16_2 = false
              L22_2 = CL
              L22_2 = L22_2.Notification
              L23_2 = TRANSLATE
              L24_2 = "notify.furniture:cannot_place_outside"
              L23_2 = L23_2(L24_2)
              L24_2 = 4000
              L25_2 = "error"
              L22_2(L23_2, L24_2, L25_2)
            elseif not L21_2 then
              L16_2 = false
              L22_2 = CL
              L22_2 = L22_2.Notification
              L23_2 = TRANSLATE
              L24_2 = "notify.furniture:outside_disabled"
              L23_2 = L23_2(L24_2)
              L24_2 = 4000
              L25_2 = "error"
              L22_2(L23_2, L24_2, L25_2)
            end
            L22_2 = L4_2.object_id
            if L22_2 then
              L16_2 = false
              L22_2 = CL
              L22_2 = L22_2.Notification
              L23_2 = TRANSLATE
              L24_2 = "notify.furniture:no_outdoor_area"
              L23_2 = L23_2(L24_2)
              L24_2 = 4000
              L25_2 = "error"
              L22_2(L23_2, L24_2, L25_2)
            end
          end
        end
        if L16_2 then
          L17_2 = Property
          L18_2 = {}
          L18_2.id = A2_2
          L18_2.model = A1_2
          L18_2.coords = L14_2
          L19_2 = GetEntityRotation
          L20_2 = Property
          L20_2 = L20_2.EditingFurnitureObj
          L19_2 = L19_2(L20_2)
          L18_2.rotation = L19_2
          L18_2.isInside = L6_2
          L18_2.isExisting = A0_2
          L17_2.EditingFurnitureData = L18_2
          L17_2 = Config
          L17_2 = L17_2.RequirePurchaseFurniture
          if L17_2 or A0_2 then
            L17_2 = TriggerServerEvent
            L18_2 = "vms_housing:sv:placeFurniture"
            L19_2 = L3_2
            L20_2 = Property
            L20_2 = L20_2.EditingFurnitureData
            L17_2(L18_2, L19_2, L20_2)
            L17_2 = Property
            L17_2.EditingFurniture = false
            L17_2 = DeleteObject
            L18_2 = Property
            L18_2 = L18_2.EditingFurnitureObj
            L17_2(L18_2)
            L17_2 = Property
            L17_2.EditingFurnitureObj = nil
            break
          else
            L17_2 = SendNUIMessage
            L18_2 = {}
            L18_2.action = "Property"
            L18_2.actionName = "OpenFurniturePurchase"
            L19_2 = {}
            L20_2 = Furniture
            L20_2 = L20_2[A1_2]
            L20_2 = L20_2.label
            L19_2.label = L20_2
            L20_2 = Furniture
            L20_2 = L20_2[A1_2]
            L20_2 = L20_2.price
            L19_2.price = L20_2
            L18_2.data = L19_2
            L17_2(L18_2)
            openedMenu = "PropertyFurniturePurchase"
            L17_2 = SetNuiFocus
            L18_2 = true
            L19_2 = true
            L17_2(L18_2, L19_2)
          end
        end
      else
        L16_2 = CL
        L16_2 = L16_2.Notification
        L17_2 = TRANSLATE
        L18_2 = "notify.furniture:outside_zone"
        L17_2 = L17_2(L18_2)
        L18_2 = 4000
        L19_2 = "error"
        L16_2(L17_2, L18_2, L19_2)
      end
    end
  end
  L9_2 = L0_1
  if L9_2 then
    L9_2 = L1_1
    L10_2 = false
    L9_2(L10_2)
  end
  L9_2 = HousingCreator
  L10_2 = L9_2
  L9_2 = L9_2.DeleteCamera
  L9_2(L10_2)
  L9_2 = FreezeEntityPosition
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = false
  L9_2(L10_2, L11_2)
  L9_2 = SendNUIMessage
  L10_2 = {}
  L10_2.action = "ControlsMenu"
  L10_2.toggle = false
  L9_2(L10_2)
  L9_2 = Property
  L9_2.EditingFurniture = false
  L9_2 = Property
  L10_2 = {}
  L9_2.EditingFurnitureData = L10_2
  L9_2 = openFurnitureMenu
  L9_2()
end
manageFurniture = L2_1
function L2_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L0_3 = {}
    L1_3 = nil
    while true do
      L2_3 = Property
      L2_3 = L2_3.EditingFurniture
      if not L2_3 then
        break
      end
      L2_3 = PlayerPedId
      L2_3 = L2_3()
      L3_3 = GetEntityCoords
      L4_3 = L2_3
      L3_3 = L3_3(L4_3)
      L4_3 = HudForceWeaponWheel
      L5_3 = false
      L4_3(L5_3)
      L4_3 = HideHudComponentThisFrame
      L5_3 = 19
      L4_3(L5_3)
      L4_3 = HideHudComponentThisFrame
      L5_3 = 20
      L4_3(L5_3)
      L4_3 = DisabledControls
      L4_3()
      L4_3 = RayCastGamePlayCamera
      L5_3 = nil
      L6_3 = 80.0
      L4_3, L5_3, L6_3 = L4_3(L5_3, L6_3)
      if L4_3 then
        L7_3 = DrawLine
        L8_3 = L3_3.x
        L9_3 = L3_3.y
        L10_3 = L3_3.z
        L11_3 = L5_3.x
        L12_3 = L5_3.y
        L13_3 = L5_3.z
        L14_3 = 159
        L15_3 = 15
        L16_3 = 255
        L17_3 = 250
        L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
        if L6_3 then
          if L1_3 ~= L6_3 then
            L7_3 = L0_3[L1_3]
            if L7_3 then
              L7_3 = SetEntityDrawOutline
              L8_3 = L1_3
              L9_3 = false
              L7_3(L8_3, L9_3)
              L0_3[L1_3] = nil
          end
          else
            L7_3 = L0_3[L6_3]
            if not L7_3 then
              L7_3 = pairs
              L8_3 = Property
              L8_3 = L8_3.LoadedFurnitures
              L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3)
              for L11_3, L12_3 in L7_3, L8_3, L9_3, L10_3 do
                L13_3 = L12_3.entity
                if L13_3 == L6_3 then
                  L1_3 = L6_3
                  L0_3[L6_3] = L12_3
                  L13_3 = SetEntityDrawOutline
                  L14_3 = L6_3
                  L15_3 = true
                  L13_3(L14_3, L15_3)
                  L13_3 = SetEntityDrawOutlineColor
                  L14_3 = 159
                  L15_3 = 15
                  L16_3 = 255
                  L17_3 = 200
                  L13_3(L14_3, L15_3, L16_3, L17_3)
                  L13_3 = SetEntityDrawOutlineShader
                  L14_3 = 0
                  L13_3(L14_3)
                end
              end
            end
          end
          L7_3 = IsControlJustPressed
          L8_3 = 0
          L9_3 = Config
          L9_3 = L9_3.FurnitureControls
          L9_3 = L9_3.ACCEPT
          L9_3 = L9_3.controlIndex
          L7_3 = L7_3(L8_3, L9_3)
          if L7_3 then
            L7_3 = next
            L8_3 = L0_3
            L7_3 = L7_3(L8_3)
            if L7_3 then
              L7_3 = pairs
              L8_3 = L0_3
              L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3)
              for L11_3, L12_3 in L7_3, L8_3, L9_3, L10_3 do
                L13_3 = SetEntityDrawOutline
                L14_3 = L11_3
                L15_3 = false
                L13_3(L14_3, L15_3)
              end
            end
            L7_3 = L0_3[L6_3]
            if L7_3 then
              L7_3 = manageFurniture
              L8_3 = true
              L9_3 = L0_3[L6_3]
              L9_3 = L9_3.model
              L10_3 = L0_3[L6_3]
              L10_3 = L10_3.furnitureId
              L7_3(L8_3, L9_3, L10_3)
            end
            L7_3 = Property
            L7_3.EditingFurniture = false
            break
          end
        end
      else
        L7_3 = next
        L8_3 = L0_3
        L7_3 = L7_3(L8_3)
        if L7_3 then
          L7_3 = pairs
          L8_3 = L0_3
          L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3)
          for L11_3, L12_3 in L7_3, L8_3, L9_3, L10_3 do
            L13_3 = SetEntityDrawOutline
            L14_3 = L11_3
            L15_3 = false
            L13_3(L14_3, L15_3)
          end
          L7_3 = {}
          L0_3 = L7_3
        end
      end
      L7_3 = IsControlJustPressed
      L8_3 = 0
      L9_3 = Config
      L9_3 = L9_3.FurnitureControls
      L9_3 = L9_3.CLOSE
      L9_3 = L9_3.controlIndex
      L7_3 = L7_3(L8_3, L9_3)
      if L7_3 then
        L7_3 = next
        L8_3 = L0_3
        L7_3 = L7_3(L8_3)
        if L7_3 then
          L7_3 = pairs
          L8_3 = L0_3
          L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3)
          for L11_3, L12_3 in L7_3, L8_3, L9_3, L10_3 do
            L13_3 = SetEntityDrawOutline
            L14_3 = L11_3
            L15_3 = false
            L13_3(L14_3, L15_3)
          end
          L7_3 = {}
          L0_3 = L7_3
        end
        L7_3 = Property
        L7_3.EditingFurniture = false
        break
      end
      L7_3 = Citizen
      L7_3 = L7_3.Wait
      L8_3 = 1
      L7_3(L8_3)
    end
  end
  L0_2(L1_2)
end
editFurniture = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = Property
  L1_2.EditingTheme = A0_2
  L1_2 = CurrentProperty
  if not L1_2 then
    L1_2 = GetCurrentPropertyId
    L1_2 = L1_2()
  end
  L2_2 = CurrentPropertyData
  if not L2_2 then
    L2_2 = GetCurrentPropertyData
    L2_2 = L2_2()
  end
  L3_2 = CurrentIPL
  if L3_2 then
    L3_2 = AvailableIPLS
    L4_2 = L2_2.metadata
    L4_2 = L4_2.ipl
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.settings
    L3_2 = L3_2.Themes
    L4_2 = Property
    L4_2 = L4_2.EditingTheme
    L3_2 = L3_2[L4_2]
    if L3_2 then
      L4_2 = IPL
      L4_2 = L4_2.LoadSettings
      L5_2 = CurrentIPL
      L6_2 = Property
      L6_2 = L6_2.EditingTheme
      L7_2 = L2_2.metadata
      L7_2 = L7_2.iplSettings
      function L8_2()
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
      L4_2(L5_2, L6_2, L7_2, L8_2)
      while true do
        L4_2 = Property
        L4_2 = L4_2.EditingTheme
        if not L4_2 then
          break
        end
        L4_2 = IsControlJustPressed
        L5_2 = 0
        L6_2 = Config
        L6_2 = L6_2.FurnitureControls
        L6_2 = L6_2.CLOSE
        L6_2 = L6_2.controlIndex
        L4_2 = L4_2(L5_2, L6_2)
        if L4_2 then
          L4_2 = IPL
          L4_2 = L4_2.LoadSettings
          L5_2 = CurrentIPL
          L6_2 = L2_2.metadata
          L6_2 = L6_2.iplTheme
          L7_2 = L2_2.metadata
          L7_2 = L7_2.iplSettings
          function L8_2()
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
          L4_2(L5_2, L6_2, L7_2, L8_2)
          L4_2 = Property
          L4_2.EditingTheme = nil
        end
        L4_2 = IsControlJustPressed
        L5_2 = 0
        L6_2 = Config
        L6_2 = L6_2.FurnitureControls
        L6_2 = L6_2.ACCEPT
        L6_2 = L6_2.controlIndex
        L4_2 = L4_2(L5_2, L6_2)
        if L4_2 then
          L4_2 = SendNUIMessage
          L5_2 = {}
          L5_2.action = "Property"
          L5_2.actionName = "OpenFurniturePurchase"
          L6_2 = {}
          L7_2 = L3_2.label
          L6_2.label = L7_2
          L7_2 = L3_2.price
          L6_2.price = L7_2
          L5_2.data = L6_2
          L4_2(L5_2)
          L4_2 = SetNuiFocus
          L5_2 = true
          L6_2 = true
          L4_2(L5_2, L6_2)
          openedMenu = "PropertyFurniturePurchase"
        end
        L4_2 = Citizen
        L4_2 = L4_2.Wait
        L5_2 = 1
        L4_2(L5_2)
      end
    end
  end
  L3_2 = Property
  L3_2.EditingTheme = nil
end
editTheme = L2_1
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = CurrentProperty
  if not L0_2 then
    L0_2 = GetCurrentPropertyId
    L0_2 = L0_2()
  end
  L1_2 = CurrentPropertyData
  if not L1_2 then
    L1_2 = GetCurrentPropertyData
    L1_2 = L1_2()
  end
  L2_2 = waitingForLoadAfterRestart
  if L2_2 then
    return
  end
  if not L1_2 then
    return
  end
  L2_2 = Property
  L2_2 = L2_2.EditingFurniture
  if not L2_2 then
    L2_2 = Property
    L2_2 = L2_2.EditingTheme
    if not L2_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L2_2 = false
  L3_2 = false
  L4_2 = library
  L4_2 = L4_2.HasPermissions
  L5_2 = L0_2
  L6_2 = "furniture"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    return
  end
  L4_2 = L1_2.type
  if "shell" == L4_2 then
    L4_2 = CurrentShell
    if L4_2 then
      L2_2 = true
    end
  else
    L4_2 = L1_2.type
    if "ipl" == L4_2 then
      L4_2 = CurrentIPL
      if L4_2 then
        L2_2 = true
      end
    else
      L4_2 = L1_2.type
      if "mlo" == L4_2 then
        L4_2 = IsInsideMLO
        L4_2 = L4_2()
        L2_2 = L4_2
      end
    end
  end
  L3_2 = not L2_2
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.action = "Property"
  L5_2.actionName = "OpenFurniture"
  L6_2 = {}
  L7_2 = L1_2.furniture
  L6_2.propertyFurniture = L7_2
  L7_2 = L2_2 or L7_2
  if L2_2 then
    L7_2 = CurrentIPL
  end
  L6_2.ipl = L7_2
  L7_2 = L1_2.metadata
  L7_2 = L7_2.allowChangeThemePurchased
  L6_2.allowChangeThemePurchased = L7_2
  L6_2.isInside = L2_2
  L6_2.isOutside = L3_2
  L7_2 = L1_2.metadata
  L7_2 = L7_2.allowFurnitureInside
  L6_2.allowedInside = L7_2
  L7_2 = L1_2.metadata
  L7_2 = L7_2.allowFurnitureOutside
  L6_2.allowedOutside = L7_2
  L5_2.data = L6_2
  L4_2(L5_2)
  L4_2 = SetNuiFocus
  L5_2 = true
  L6_2 = true
  L4_2(L5_2, L6_2)
  openedMenu = "PropertyFurniture"
end
openFurnitureMenu = L2_1
L2_1 = exports
L3_1 = "OpenFurnitureMenu"
L4_1 = openFurnitureMenu
L2_1(L3_1, L4_1)
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "Property"
  L1_2.actionName = "CloseFurniture"
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  openedMenu = nil
end
closeFurnitureMenu = L2_1
L2_1 = Config
L2_1 = L2_1.HousingFurniture
L2_1 = L2_1.Command
if L2_1 then
  L2_1 = RegisterCommand
  L3_1 = Config
  L3_1 = L3_1.HousingFurniture
  L3_1 = L3_1.Command
  function L4_1()
    local L0_2, L1_2
    L0_2 = openFurnitureMenu
    L0_2()
  end
  L2_1(L3_1, L4_1)
  L2_1 = Config
  L2_1 = L2_1.HousingFurniture
  L2_1 = L2_1.Key
  if L2_1 then
    L2_1 = RegisterKeyMapping
    L3_1 = Config
    L3_1 = L3_1.HousingFurniture
    L3_1 = L3_1.Command
    L4_1 = Config
    L4_1 = L4_1.HousingFurniture
    L4_1 = L4_1.Description
    if not L4_1 then
      L4_1 = ""
    end
    L5_1 = "keyboard"
    L6_1 = Config
    L6_1 = L6_1.HousingFurniture
    L6_1 = L6_1.Key
    L2_1(L3_1, L4_1, L5_1, L6_1)
  end
end
