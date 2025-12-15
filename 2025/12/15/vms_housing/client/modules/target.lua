local L0_1, L1_1
L0_1 = {}
TargetHandler = L0_1
L0_1 = TargetHandler
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = {}
  L1_2.name = "property-offer"
  L1_2.icon = "fa-solid fa-scroll"
  L2_2 = TRANSLATE
  L3_2 = "target.view_house"
  L2_2 = L2_2(L3_2)
  L1_2.label = L2_2
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = Property
    L2_3 = L1_3
    L1_3 = L1_3.ViewOffer
    L3_3 = A0_2
    L1_3(L2_3, L3_3)
  end
  L1_2.action = L2_2
  return L1_2
end
L0_1.ViewOffer = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = {}
  L2_2.name = "property-enter"
  L2_2.icon = "fa-solid fa-door-open"
  L3_2 = TRANSLATE
  L4_2 = "target.enter"
  L3_2 = L3_2(L4_2)
  L2_2.label = L3_2
  L2_2.action = A0_2
  L2_2.canInteract = A1_2
  return L2_2
end
L0_1.Enter = L1_1
L0_1 = TargetHandler
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = {}
  L1_2.name = "property-furniture"
  L1_2.icon = "fa-solid fa-chair"
  L2_2 = TRANSLATE
  L3_2 = "target.furniture"
  L2_2 = L2_2(L3_2)
  L1_2.label = L2_2
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = Property
    L0_3 = L0_3.EditingFurniture
    if not L0_3 then
      L0_3 = Property
      L0_3 = L0_3.EditingTheme
      if not L0_3 then
        goto lbl_18
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
    ::lbl_18::
    L0_3 = openFurnitureMenu
    L0_3()
  end
  L1_2.action = L2_2
  L1_2.canInteract = A0_2
  return L1_2
end
L0_1.Furniture = L1_1
L0_1 = TargetHandler
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = {}
  L1_2.name = "property-doorbell"
  L1_2.icon = "fa-solid fa-bell"
  L2_2 = TRANSLATE
  L3_2 = "target.doorbell"
  L2_2 = L2_2(L3_2)
  L1_2.label = L2_2
  function L2_2()
    local L0_3, L1_3, L2_3
    L0_3 = TriggerServerEvent
    L1_3 = "vms_housing:sv:ringDoorbell"
    L2_3 = A0_2
    L0_3(L1_3, L2_3)
  end
  L1_2.action = L2_2
  return L1_2
end
L0_1.Doorbell = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L5_2 = {}
  L5_2.name = "property-lockpick"
  L5_2.icon = "fa-solid fa-unlock-keyhole"
  L6_2 = TRANSLATE
  L7_2 = "target.lockpick"
  L6_2 = L6_2(L7_2)
  L5_2.label = L6_2
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = DispatchAlertClient
    if L0_3 then
      L0_3 = Config
      L0_3 = L0_3.Alarm
      L0_3 = L0_3.AlertPoliceOnLockpickStart
      if L0_3 then
        L0_3 = Config
        L0_3 = L0_3.Alarm
        L0_3 = L0_3.AlertPoliceOnlyWithUpgrade
        if L0_3 then
          L0_3 = Config
          L0_3 = L0_3.Alarm
          L0_3 = L0_3.AlertPoliceOnlyWithUpgrade
          if not L0_3 then
            goto lbl_30
          end
          L0_3 = A2_2
          if not L0_3 then
            goto lbl_30
          end
        end
        L0_3 = DispatchAlertClient
        L1_3 = Properties
        L2_3 = tostring
        L3_3 = A0_2
        L2_3 = L2_3(L3_3)
        L1_3 = L1_3[L2_3]
        L2_3 = "start"
        L0_3(L1_3, L2_3)
      end
    end
    ::lbl_30::
    L0_3 = TriggerServerEvent
    L1_3 = "vms_housing:sv:startedLockpickDoors"
    L2_3 = A0_2
    L0_3(L1_3, L2_3)
    L0_3 = CL
    L0_3 = L0_3.Minigame
    L1_3 = "lockpick"
    function L2_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4
      if A0_4 then
        L1_4 = DispatchAlertClient
        if L1_4 then
          L1_4 = Config
          L1_4 = L1_4.Alarm
          L1_4 = L1_4.AlertPoliceOnLockpickSuccess
          if L1_4 then
            L1_4 = Config
            L1_4 = L1_4.Alarm
            L1_4 = L1_4.AlertPoliceOnlyWithUpgrade
            if L1_4 then
              L1_4 = Config
              L1_4 = L1_4.Alarm
              L1_4 = L1_4.AlertPoliceOnlyWithUpgrade
              if L1_4 then
                L1_4 = A2_2
                if L1_4 then
                  L1_4 = DispatchAlertClient
                  L2_4 = Properties
                  L3_4 = tostring
                  L4_4 = A0_2
                  L3_4 = L3_4(L4_4)
                  L2_4 = L2_4[L3_4]
                  L3_4 = "success"
                  L1_4(L2_4, L3_4)
                end
              end
            end
          end
        end
      else
        L1_4 = DispatchAlertClient
        if L1_4 then
          L1_4 = Config
          L1_4 = L1_4.Alarm
          L1_4 = L1_4.AlertPoliceOnLockpickFail
          if L1_4 then
            L1_4 = Config
            L1_4 = L1_4.Alarm
            L1_4 = L1_4.AlertPoliceOnlyWithUpgrade
            if L1_4 then
              L1_4 = Config
              L1_4 = L1_4.Alarm
              L1_4 = L1_4.AlertPoliceOnlyWithUpgrade
              if not L1_4 then
                goto lbl_62
              end
              L1_4 = A2_2
              if not L1_4 then
                goto lbl_62
              end
            end
            L1_4 = DispatchAlertClient
            L2_4 = Properties
            L3_4 = tostring
            L4_4 = A0_2
            L3_4 = L3_4(L4_4)
            L2_4 = L2_4[L3_4]
            L3_4 = "failed"
            L1_4(L2_4, L3_4)
          end
        end
      end
      ::lbl_62::
      L1_4 = A3_2
      L2_4 = A0_4
      L1_4(L2_4)
    end
    L3_3 = {}
    L4_3 = A1_2
    L3_3.antiBurglaryDoors = L4_3
    L0_3(L1_3, L2_3, L3_3)
  end
  L5_2.action = L6_2
  L5_2.canInteract = A4_2
  L6_2 = Config
  L6_2 = L6_2.Lockpick
  if L6_2 then
    L6_2 = L6_2.Item
  end
  if L6_2 then
    L6_2 = L6_2.Required
  end
  if L6_2 then
    L6_2 = Config
    L6_2 = L6_2.Lockpick
    if L6_2 then
      L6_2 = L6_2.Item
    end
    if L6_2 then
      L6_2 = L6_2.Name
    end
    if L6_2 then
      L6_2 = Config
      L6_2 = L6_2.Lockpick
      L6_2 = L6_2.Item
      L6_2 = L6_2.Name
      L5_2.requiredItem = L6_2
    end
  end
  return L5_2
end
L0_1.Lockpick = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.PropertyLockdown
  if L2_2 then
    L2_2 = Config
    L2_2 = L2_2.PropertyLockdown
    L2_2 = L2_2.Enable
    if L2_2 then
      goto lbl_12
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_12::
  L2_2 = {}
  L2_2.name = "property-lockdown"
  L2_2.icon = "fa-solid fa-road-barrier"
  L3_2 = TRANSLATE
  L4_2 = "target.lockdown"
  L3_2 = L3_2(L4_2)
  L2_2.label = L3_2
  L2_2.action = A0_2
  L2_2.canInteract = A1_2
  L3_2 = Config
  L3_2 = L3_2.PropertyLockdown
  L3_2 = L3_2.Jobs
  if L3_2 then
    L3_2 = next
    L4_2 = Config
    L4_2 = L4_2.PropertyLockdown
    L4_2 = L4_2.Jobs
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = Config
      L3_2 = L3_2.PropertyLockdown
      L3_2 = L3_2.Jobs
      L2_2.jobs = L3_2
    end
  end
  L3_2 = Config
  L3_2 = L3_2.PropertyLockdown
  L3_2 = L3_2.Item
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.PropertyLockdown
    L3_2 = L3_2.Item
    L3_2 = L3_2.Required
    if L3_2 then
      L3_2 = Config
      L3_2 = L3_2.PropertyLockdown
      L3_2 = L3_2.Item
      L3_2 = L3_2.Name
      L2_2.requiredItem = L3_2
    end
  end
  return L2_2
end
L0_1.Lockdown = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.PropertyLockdown
  if L2_2 then
    L2_2 = Config
    L2_2 = L2_2.PropertyLockdown
    L2_2 = L2_2.Enable
    if L2_2 then
      goto lbl_12
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_12::
  L2_2 = {}
  L2_2.name = "property-removeseal"
  L2_2.icon = "fa-solid fa-lock-open"
  L3_2 = TRANSLATE
  L4_2 = "target.removeseal"
  L3_2 = L3_2(L4_2)
  L2_2.label = L3_2
  L2_2.action = A0_2
  L2_2.canInteract = A1_2
  L3_2 = Config
  L3_2 = L3_2.PropertyLockdown
  L3_2 = L3_2.Jobs
  if L3_2 then
    L3_2 = next
    L4_2 = Config
    L4_2 = L4_2.PropertyLockdown
    L4_2 = L4_2.Jobs
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = Config
      L3_2 = L3_2.PropertyLockdown
      L3_2 = L3_2.Jobs
      L2_2.jobs = L3_2
    end
  end
  return L2_2
end
L0_1.RemoveSeal = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = Config
  L3_2 = L3_2.PropertyRaids
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.PropertyRaids
    L3_2 = L3_2.Enable
    if L3_2 then
      goto lbl_12
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_12::
  L3_2 = {}
  L3_2.name = "property-raid"
  L3_2.icon = "fa-solid fa-person-walking-arrow-right"
  L4_2 = TRANSLATE
  L5_2 = "target.raid"
  L4_2 = L4_2(L5_2)
  L3_2.label = L4_2
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L0_3 = library
    L0_3 = L0_3.CallbackAwait
    L1_3 = "vms_housing:isAllowedToRaid"
    L2_3 = A0_2
    if not L2_3 then
      L2_3 = GetCurrentPropertyId
      L2_3 = L2_3()
    end
    L0_3, L1_3 = L0_3(L1_3, L2_3)
    if not L0_3 then
      return
    end
    L2_3 = PlayerPedId
    L2_3 = L2_3()
    L3_3 = A0_2
    if L3_3 then
      L3_3 = Properties
      L4_3 = A0_2
      L3_3 = L3_3[L4_3]
      if L3_3 then
        goto lbl_25
      end
    end
    L3_3 = GetCurrentPropertyData
    L3_3 = L3_3()
    ::lbl_25::
    L4_3 = library
    L4_3 = L4_3.PlayAnimation
    L5_3 = L2_3
    L6_3 = "missheistfbi3b_ig7"
    L7_3 = "lift_fibagent_loop"
    L8_3 = 8.0
    L9_3 = 8.0
    L10_3 = -1
    L11_3 = 1
    L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
    L4_3 = CL
    L4_3 = L4_3.Minigame
    L5_3 = "police_raid"
    function L6_3(A0_4)
      local L1_4, L2_4
      L1_4 = library
      L1_4 = L1_4.StopAnimation
      L2_4 = L2_3
      L1_4(L2_4)
      L1_4 = A1_2
      L2_4 = A0_4
      L1_4(L2_4)
    end
    L7_3 = {}
    L8_3 = L3_3.metadata
    if L8_3 then
      L8_3 = L8_3.upgrades
    end
    if L8_3 then
      L8_3 = L8_3.antiBurglaryDoors
    end
    L7_3.antiBurglaryDoors = L8_3
    L4_3(L5_3, L6_3, L7_3)
  end
  L3_2.action = L4_2
  L3_2.canInteract = A2_2
  L4_2 = Config
  L4_2 = L4_2.PropertyRaids
  L4_2 = L4_2.Jobs
  if L4_2 then
    L4_2 = next
    L5_2 = Config
    L5_2 = L5_2.PropertyRaids
    L5_2 = L5_2.Jobs
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = Config
      L4_2 = L4_2.PropertyRaids
      L4_2 = L4_2.Jobs
      L3_2.jobs = L4_2
    end
  end
  L4_2 = Config
  L4_2 = L4_2.PropertyRaids
  L4_2 = L4_2.Item
  if L4_2 then
    L4_2 = Config
    L4_2 = L4_2.PropertyRaids
    L4_2 = L4_2.Item
    L4_2 = L4_2.Required
    if L4_2 then
      L4_2 = Config
      L4_2 = L4_2.PropertyRaids
      L4_2 = L4_2.Item
      L4_2 = L4_2.Name
      L3_2.requiredItem = L4_2
    end
  end
  return L3_2
end
L0_1.Raid = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.PropertyRaids
  if L2_2 then
    L2_2 = Config
    L2_2 = L2_2.PropertyRaids
    L2_2 = L2_2.Enable
    if L2_2 then
      goto lbl_12
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_12::
  L2_2 = {}
  L2_2.name = "property-complete_raid"
  L2_2.icon = "fa-solid fa-door-closed"
  L3_2 = TRANSLATE
  L4_2 = "target.complete_raid"
  L3_2 = L3_2(L4_2)
  L2_2.label = L3_2
  L2_2.action = A0_2
  L2_2.canInteract = A1_2
  L3_2 = Config
  L3_2 = L3_2.PropertyRaids
  L3_2 = L3_2.Jobs
  if L3_2 then
    L3_2 = next
    L4_2 = Config
    L4_2 = L4_2.PropertyRaids
    L4_2 = L4_2.Jobs
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = Config
      L3_2 = L3_2.PropertyRaids
      L3_2 = L3_2.Jobs
      L2_2.jobs = L3_2
    end
  end
  return L2_2
end
L0_1.RaidLock = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L6_2 = {}
  L6_2.name = "property-storage"
  L6_2.icon = "fa-solid fa-boxes-stacked"
  L7_2 = TRANSLATE
  L8_2 = "target.storage"
  L7_2 = L7_2(L8_2)
  L6_2.label = L7_2
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = Property
    L0_3 = L0_3.EditingFurniture
    if not L0_3 then
      L0_3 = Property
      L0_3 = L0_3.EditingTheme
      if not L0_3 then
        goto lbl_18
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
    ::lbl_18::
    L0_3 = OpenStorage
    L1_3 = {}
    L2_3 = "house_storage-"
    L3_3 = A0_2
    L2_3 = L2_3 .. L3_3
    L1_3.id = L2_3
    L2_3 = A4_2
    L1_3.slots = L2_3
    L2_3 = A5_2
    L1_3.weight = L2_3
    L0_3(L1_3)
  end
  L6_2.action = L7_2
  L7_2 = Config
  L7_2 = L7_2.StaticInteractionAccess
  if 2 == L7_2 then
    function L7_2()
      local L0_3, L1_3
      L0_3 = library
      L0_3 = L0_3.HasAnyPermission
      L1_3 = A0_2
      return L0_3(L1_3)
    end
    L6_2.canInteract = L7_2
  else
    L7_2 = Config
    L7_2 = L7_2.StaticInteractionAccess
    if 3 == L7_2 then
      function L7_2()
        local L0_3, L1_3, L2_3
        L0_3 = library
        L0_3 = L0_3.HasPermissions
        L1_3 = A0_2
        L2_3 = "furniture"
        return L0_3(L1_3, L2_3)
      end
      L6_2.canInteract = L7_2
    end
  end
  L7_2 = {}
  L7_2.type = "storage"
  L8_2 = CL
  L8_2 = L8_2.Target
  L9_2 = "zone"
  L10_2 = {}
  L11_2 = vector3
  L12_2 = A1_2
  L13_2 = A2_2
  L14_2 = A3_2
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L10_2.coords = L11_2
  L11_2 = vec
  L12_2 = 1.5
  L13_2 = 1.5
  L14_2 = 2.0
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L10_2.size = L11_2
  L10_2.rotation = 0.0
  L11_2 = {}
  L12_2 = L6_2
  L11_2[1] = L12_2
  L10_2.options = L11_2
  L8_2 = L8_2(L9_2, L10_2)
  L7_2.id = L8_2
  return L7_2
end
L0_1.Storage = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = {}
  L4_2.name = "property-wardrobe"
  L4_2.icon = "fa-solid fa-shirt"
  L5_2 = TRANSLATE
  L6_2 = "target.wardrobe"
  L5_2 = L5_2(L6_2)
  L4_2.label = L5_2
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = Property
    L0_3 = L0_3.EditingFurniture
    if not L0_3 then
      L0_3 = Property
      L0_3 = L0_3.EditingTheme
      if not L0_3 then
        goto lbl_18
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
    ::lbl_18::
    L0_3 = OpenWardrobe
    L0_3()
  end
  L4_2.action = L5_2
  L5_2 = Config
  L5_2 = L5_2.StaticInteractionAccess
  if 2 == L5_2 then
    function L5_2()
      local L0_3, L1_3
      L0_3 = library
      L0_3 = L0_3.HasAnyPermission
      L1_3 = A0_2
      return L0_3(L1_3)
    end
    L4_2.canInteract = L5_2
  else
    L5_2 = Config
    L5_2 = L5_2.StaticInteractionAccess
    if 3 == L5_2 then
      function L5_2()
        local L0_3, L1_3, L2_3
        L0_3 = library
        L0_3 = L0_3.HasPermissions
        L1_3 = A0_2
        L2_3 = "furniture"
        return L0_3(L1_3, L2_3)
      end
      L4_2.canInteract = L5_2
    end
  end
  L5_2 = {}
  L5_2.type = "wardrobe"
  L6_2 = CL
  L6_2 = L6_2.Target
  L7_2 = "zone"
  L8_2 = {}
  L9_2 = vector3
  L10_2 = A1_2
  L11_2 = A2_2
  L12_2 = A3_2
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
  L10_2 = L4_2
  L9_2[1] = L10_2
  L8_2.options = L9_2
  L6_2 = L6_2(L7_2, L8_2)
  L5_2.id = L6_2
  return L5_2
end
L0_1.Wardrobe = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = {}
  L2_2.name = "property-manage"
  L2_2.icon = "fa-solid fa-gear"
  L3_2 = TRANSLATE
  L4_2 = "target.manage"
  L3_2 = L3_2(L4_2)
  L2_2.label = L3_2
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = Property
    L0_3 = L0_3.EditingFurniture
    if not L0_3 then
      L0_3 = Property
      L0_3 = L0_3.EditingTheme
      if not L0_3 then
        goto lbl_18
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
    ::lbl_18::
    L0_3 = openManageMenu
    L1_3 = A0_2
    L0_3(L1_3)
  end
  L2_2.action = L3_2
  L2_2.canInteract = A1_2
  return L2_2
end
L0_1.Manage = L1_1
L0_1 = TargetHandler
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = {}
  L2_2.name = "property-lock"
  L2_2.icon = "fa-solid fa-key"
  L3_2 = TRANSLATE
  L4_2 = "target.toggle_lock"
  L3_2 = L3_2(L4_2)
  L2_2.label = L3_2
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = Property
    L1_3 = L0_3
    L0_3 = L0_3.ToggleLock
    L2_3 = A0_2
    L0_3(L1_3, L2_3)
  end
  L2_2.action = L3_2
  L2_2.canInteract = A1_2
  return L2_2
end
L0_1.ToggleLock = L1_1
