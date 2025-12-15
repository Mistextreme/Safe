local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = 20
L1_1 = 44
L2_1 = 21
L3_1 = 30
L4_1 = 31
L5_1 = 289
L6_1 = 0.5
L7_1 = 2.5
L8_1 = true
L9_1 = true
L10_1 = vector3
L11_1 = 0.0
L12_1 = 0.0
L13_1 = 0.3
L10_1 = L10_1(L11_1, L12_1, L13_1)
L11_1 = 10.0
L12_1 = 0.01
L13_1 = false
L14_1 = PlayerPedId
L14_1 = L14_1()
L15_1 = L6_1
L16_1 = vector3
L17_1 = 0
L18_1 = 0
L19_1 = 0
L16_1 = L16_1(L17_1, L18_1, L19_1)
L17_1 = vector3
L18_1 = 0
L19_1 = 0
L20_1 = 0
L17_1 = L17_1(L18_1, L19_1, L20_1)
L18_1 = L14_1
L19_1 = {}
function L20_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = A1_2 - A0_2
  L4_2 = Clamp
  L5_2 = A2_2
  L6_2 = 0.0
  L7_2 = 1.0
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2 = L3_2 * L4_2
  L3_2 = A0_2 + L3_2
  return L3_2
end
Lerp = L20_1
function L20_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = math
  L3_2 = L3_2.min
  L4_2 = math
  L4_2 = L4_2.max
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
Clamp = L20_1
function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L9_1
  if L1_2 then
    L1_2 = PlaySoundFrontend
    L2_2 = -1
    if A0_2 then
      L3_2 = "SELECT"
      if L3_2 then
        goto lbl_12
      end
    end
    L3_2 = "CANCEL"
    ::lbl_12::
    L4_2 = "HUD_FRONTEND_DEFAULT_SOUNDSET"
    L5_2 = true
    L1_2(L2_2, L3_2, L4_2, L5_2)
  end
end
PlayToggleSound = L20_1
function L20_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = A0_2
  L1_2(L2_2)
end
ShowNotification = L20_1
function L20_1()
  local L0_2, L1_2
  L0_2 = GetFrameTime
  L0_2 = L0_2()
  L0_2 = L0_2 * 1000
  return L0_2
end
GetFrameTime = L20_1
function L20_1()
  local L0_2, L1_2
  L0_2 = SetNoClip
  L1_2 = L13_1
  L1_2 = not L1_2
  return L0_2(L1_2)
end
ToggleNoClipMode = L20_1
function L20_1()
  local L0_2, L1_2, L2_2
  L0_2 = IsControlJustReleased
  L1_2 = 0
  L2_2 = L5_1
  L0_2 = L0_2(L1_2, L2_2)
  if L0_2 then
    L0_2 = L8_1
    if L0_2 then
      L0_2 = ToggleNoClipMode
      L0_2()
    end
  end
end
HandleNoClipInput = L20_1
function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L13_1
  if L1_2 == A0_2 then
    return
  end
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L14_1 = L1_2
  L1_2 = L14_1
  L18_1 = L1_2
  L1_2 = IsPedInAnyVehicle
  L2_2 = L14_1
  L3_2 = false
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = GetVehiclePedIsIn
    L2_2 = L14_1
    L3_2 = false
    L1_2 = L1_2(L2_2, L3_2)
    L2_2 = GetPedInVehicleSeat
    L3_2 = L1_2
    L4_2 = -1
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = L14_1
    if L2_2 == L3_2 then
      L18_1 = L1_2
    end
  end
  L13_1 = A0_2
  L1_2 = L13_1
  if L1_2 then
    L1_2 = FreezeEntityPosition
    L2_2 = L18_1
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = SetEntityCollision
    L2_2 = L18_1
    L3_2 = false
    L4_2 = false
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = SetEntityInvincible
    L2_2 = L18_1
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = SetEntityVisible
    L2_2 = L18_1
    L3_2 = false
    L4_2 = false
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = SetLocalPlayerVisibleLocally
    L2_2 = true
    L1_2(L2_2)
    L1_2 = SetEntityAlpha
    L2_2 = L18_1
    L3_2 = 51
    L4_2 = false
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = CreateThread
    function L2_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
      L0_3 = L18_1
      while true do
        L1_3 = L13_1
        if not L1_3 then
          break
        end
        L1_3 = DoesEntityExist
        L2_3 = L0_3
        L1_3 = L1_3(L2_3)
        if not L1_3 then
          break
        end
        L1_3 = Wait
        L2_3 = 1
        L1_3(L2_3)
        L1_3 = SetEntityVisible
        L2_3 = L18_1
        L3_3 = false
        L4_3 = false
        L1_3(L2_3, L3_3, L4_3)
        L1_3 = SetLocalPlayerVisibleLocally
        L2_3 = true
        L1_3(L2_3)
        L1_3 = SetEntityAlpha
        L2_3 = L18_1
        L3_3 = 51
        L4_3 = false
        L1_3(L2_3, L3_3, L4_3)
        L1_3 = vector3
        L2_3 = GetDisabledControlNormal
        L3_3 = 0
        L4_3 = L3_1
        L2_3 = L2_3(L3_3, L4_3)
        L3_3 = GetDisabledControlNormal
        L4_3 = 0
        L5_3 = L4_1
        L3_3 = L3_3(L4_3, L5_3)
        L4_3 = IsControlPressed
        L5_3 = 0
        L6_3 = L0_1
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = 1
          if L4_3 then
            goto lbl_54
          end
        end
        L4_3 = IsControlPressed
        L5_3 = 0
        L6_3 = L1_1
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = -1
          if L4_3 then
            goto lbl_54
          end
        end
        L4_3 = 0
        ::lbl_54::
        L1_3 = L1_3(L2_3, L3_3, L4_3)
        L16_1 = L1_3
        L1_3 = Lerp
        L2_3 = L15_1
        L3_3 = IsControlPressed
        L4_3 = 0
        L5_3 = L2_1
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = L7_1
          if L3_3 then
            goto lbl_68
          end
        end
        L3_3 = L6_1
        ::lbl_68::
        L4_3 = 0.1
        L1_3 = L1_3(L2_3, L3_3, L4_3)
        L15_1 = L1_3
        L1_3 = UpdateNoClipPosition
        L1_3()
      end
      L1_3 = DoesEntityExist
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      if L1_3 then
        L1_3 = SetEntityVisible
        L2_3 = L0_3
        L3_3 = true
        L4_3 = false
        L1_3(L2_3, L3_3, L4_3)
        L1_3 = SetLocalPlayerVisibleLocally
        L2_3 = true
        L1_3(L2_3)
        L1_3 = ResetEntityAlpha
        L2_3 = L0_3
        L1_3(L2_3)
        L1_3 = FreezeEntityPosition
        L2_3 = L0_3
        L3_3 = false
        L1_3(L2_3, L3_3)
        L1_3 = SetEntityCollision
        L2_3 = L0_3
        L3_3 = true
        L4_3 = true
        L1_3(L2_3, L3_3, L4_3)
        L1_3 = SetEntityInvincible
        L2_3 = L0_3
        L3_3 = false
        L1_3(L2_3, L3_3)
        L1_3 = SetEntityVelocity
        L2_3 = L0_3
        L3_3 = L17_1
        L1_3(L2_3, L3_3)
      end
    end
    L1_2(L2_2)
  else
  end
end
SetNoClip = L20_1
function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = vector3
  L1_2 = GetDisabledControlNormal
  L2_2 = 0
  L3_2 = L3_1
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = GetDisabledControlNormal
  L3_2 = 0
  L4_2 = L4_1
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = IsControlPressed
  L4_2 = 0
  L5_2 = L0_1
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = 1
    if L3_2 then
      goto lbl_29
    end
  end
  L3_2 = IsControlPressed
  L4_2 = 0
  L5_2 = L1_1
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = -1
    if L3_2 then
      goto lbl_29
    end
  end
  L3_2 = 0
  ::lbl_29::
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  L16_1 = L0_2
  L0_2 = Lerp
  L1_2 = L15_1
  L2_2 = IsControlPressed
  L3_2 = 0
  L4_2 = L2_1
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = L7_1
    if L2_2 then
      goto lbl_43
    end
  end
  L2_2 = L6_1
  ::lbl_43::
  L3_2 = 0.1
  L0_2 = L0_2(L1_2, L2_2, L3_2)
  L15_1 = L0_2
end
HandleMovementInput = L20_1
function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = GetGameplayCamRot
  L1_2 = 0
  L0_2 = L0_2(L1_2)
  L1_2 = SetEntityRotation
  L2_2 = L18_1
  L3_2 = L0_2
  L4_2 = 0
  L5_2 = true
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = GetEntityMatrix
  L2_2 = L18_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  L5_2 = L16_1.x
  L5_2 = L2_2 * L5_2
  L6_2 = L16_1.y
  L6_2 = -L6_2
  L6_2 = L1_2 * L6_2
  L5_2 = L5_2 + L6_2
  L6_2 = L16_1.z
  L6_2 = -L6_2
  L6_2 = L3_2 * L6_2
  L5_2 = L5_2 + L6_2
  L6_2 = Lerp
  L7_2 = L17_1
  L8_2 = L15_1
  L8_2 = L5_2 * L8_2
  L9_2 = 0.1
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L17_1 = L6_2
  L6_2 = L17_1
  L6_2 = L4_2 + L6_2
  L7_2 = SetEntityCoordsNoOffset
  L8_2 = L18_1
  L9_2 = L6_2.x
  L10_2 = L6_2.y
  L11_2 = L6_2.z
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
UpdateNoClipPosition = L20_1
