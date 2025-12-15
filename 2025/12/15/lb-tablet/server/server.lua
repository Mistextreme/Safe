local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
function L3_1(A0_2)
  local L1_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
GetEquippedTablet = L3_1
L3_1 = exports
L4_1 = "GetEquippedTablet"
L5_1 = GetEquippedTablet
L3_1(L4_1, L5_1)
function L3_1(A0_2)
  local L1_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
GetSourceFromTablet = L3_1
L3_1 = exports
L4_1 = "GetSourceFromTablet"
L5_1 = GetSourceFromTablet
L3_1(L4_1, L5_1)
function L3_1(A0_2)
  local L1_2
  L1_2 = L2_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
GetSettings = L3_1
L3_1 = exports
L4_1 = "GetSettings"
L5_1 = GetSettings
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2)
  local L2_2
  L2_2 = L2_1
  L2_2[A0_2] = A1_2
end
SetSettings = L3_1
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = Config
  L0_2 = L0_2.CacheSettings
  if false == L0_2 then
    return
  end
  L0_2 = infoprint
  L1_2 = "info"
  L2_2 = "Saving all settings"
  L0_2(L1_2, L2_2)
  L0_2 = {}
  L1_2 = pairs
  L2_2 = L2_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = #L0_2
    L7_2 = L7_2 + 1
    L8_2 = {}
    L9_2 = json
    L9_2 = L9_2.encode
    L10_2 = L6_2
    L9_2 = L9_2(L10_2)
    L10_2 = L5_2
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L0_2[L7_2] = L8_2
  end
  L1_2 = #L0_2
  if 0 == L1_2 then
    L1_2 = debugprint
    L2_2 = "No settings were changed, not saving"
    L1_2(L2_2)
    return
  end
  L1_2 = MySQL
  L1_2 = L1_2.rawExecute
  L2_2 = "UPDATE lbtablet_tablets SET settings = ? WHERE id = ?"
  L3_2 = L0_2
  L1_2(L2_2, L3_2)
end
SaveAllSettings = L3_1
L3_1 = RegisterCallback
L4_1 = "getTablet"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = GetEquippedTablet
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetIdentifier
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = Wait
    L4_2 = 2000
    L3_2(L4_2)
    L3_2 = GetIdentifier
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
  end
  if L1_2 then
    L3_2 = {}
    L3_2.id = L1_2
    L4_2 = GetSettings
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L3_2.settings = L4_2
    L3_2.isSetup = true
    return L3_2
  elseif not L2_2 then
    L3_2 = debugprint
    L4_2 = "getTablet: no identifier found for"
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = MySQL
  L3_2 = L3_2.single
  L3_2 = L3_2.await
  L4_2 = "SELECT id, tablet_name, settings, is_setup FROM lbtablet_tablets WHERE id = ?"
  L5_2 = {}
  L6_2 = L2_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = L0_1
    L5_2 = L3_2.id
    L4_2[A0_2] = L5_2
    L5_2 = L3_2.id
    L4_2 = L1_1
    L4_2[L5_2] = A0_2
    L4_2 = Player
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2.state
    L5_2 = L3_2.tablet_name
    L4_2.lbTabletName = L5_2
    L4_2 = L3_2.is_setup
    L4_2 = L3_2.is_setup
    L4_2 = 1 == L4_2 or L4_2
    L3_2.is_setup = L4_2
    L4_2 = L3_2.settings
    if L4_2 then
      L4_2 = SetSettings
      L5_2 = L3_2.id
      L6_2 = json
      L6_2 = L6_2.decode
      L7_2 = L3_2.settings
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L6_2(L7_2)
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
    end
    L4_2 = TriggerEvent
    L5_2 = "lb-tablet:jobUpdated"
    L6_2 = A0_2
    L7_2 = GetJob
    L8_2 = A0_2
    L7_2 = L7_2(L8_2)
    L7_2 = L7_2.name
    L8_2 = IsOnDuty
    L9_2 = A0_2
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L8_2(L9_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
    L4_2 = {}
    L5_2 = L3_2.id
    L4_2.id = L5_2
    L5_2 = GetSettings
    L6_2 = L3_2.id
    L5_2 = L5_2(L6_2)
    L4_2.settings = L5_2
    L5_2 = L3_2.is_setup
    L4_2.isSetup = L5_2
    return L4_2
  end
  L4_2 = GetCharacterName
  L5_2 = A0_2
  L4_2, L5_2 = L4_2(L5_2)
  L6_2 = L
  L7_2 = "BACKEND.MISC.X_TABLET"
  L8_2 = {}
  L8_2.firstname = L4_2
  L8_2.lastname = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = MySQL
  L7_2 = L7_2.insert
  L7_2 = L7_2.await
  L8_2 = "INSERT INTO lbtablet_tablets (id, tablet_name) VALUES (?, ?)"
  L9_2 = {}
  L10_2 = L2_2
  L11_2 = L6_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L7_2(L8_2, L9_2)
  L7_2 = L0_1
  L7_2[A0_2] = L2_2
  L7_2 = L1_1
  L7_2[L2_2] = A0_2
  L7_2 = Config
  L7_2 = L7_2.LBPhone
  if L7_2 then
    L7_2 = exports
    L7_2 = L7_2["lb-phone"]
    L8_2 = L7_2
    L7_2 = L7_2.GetEquippedPhoneNumber
    L9_2 = A0_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L8_2 = MySQL
      L8_2 = L8_2.query
      L8_2 = L8_2.await
      L9_2 = "SELECT username, `active` FROM phone_logged_in_accounts WHERE app = 'Mail' AND phone_number = ?"
      L10_2 = {}
      L11_2 = L7_2
      L10_2[1] = L11_2
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 then
        goto lbl_149
      end
    end
    L8_2 = {}
    ::lbl_149::
    L9_2 = 1
    L10_2 = #L8_2
    L11_2 = 1
    for L12_2 = L9_2, L10_2, L11_2 do
      L13_2 = L8_2[L12_2]
      L13_2 = L13_2.username
      L14_2 = L8_2[L12_2]
      L14_2 = L14_2.active
      L15_2 = AddSignedInAccount
      L16_2 = L2_2
      L17_2 = "mail"
      L18_2 = L13_2
      L15_2(L16_2, L17_2, L18_2)
      if L14_2 then
        L15_2 = SetActiveAccount
        L16_2 = L2_2
        L17_2 = "mail"
        L18_2 = L13_2
        L15_2(L16_2, L17_2, L18_2)
      end
    end
  end
  L7_2 = Config
  L7_2 = L7_2.AutoCreateEmail
  if L7_2 then
    L7_2 = GetActiveAccount
    L8_2 = L2_2
    L9_2 = "mail"
    L7_2 = L7_2(L8_2, L9_2)
    if not L7_2 then
      L7_2 = debugprint
      L8_2 = "Generating email account for new tablet"
      L9_2 = L2_2
      L7_2(L8_2, L9_2)
      L7_2 = GenerateEmailAccount
      L8_2 = A0_2
      L9_2 = L2_2
      L7_2(L8_2, L9_2)
    end
  end
  L7_2 = TriggerEvent
  L8_2 = "lb-tablet:jobUpdated"
  L9_2 = A0_2
  L10_2 = GetJob
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  L10_2 = L10_2.name
  L11_2 = IsOnDuty
  L12_2 = A0_2
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L11_2(L12_2)
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L7_2 = {}
  L7_2.id = L1_2
  L7_2.isSetup = false
  return L7_2
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "tablet:toggleOpen"
function L5_1(A0_2)
  local L1_2, L2_2
  L1_2 = Player
  L2_2 = source
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2.state
  L2_2 = true == A0_2
  L1_2.lbTabletOpen = L2_2
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "tablet:toggleFlashlight"
function L5_1(A0_2)
  local L1_2, L2_2
  L1_2 = Config
  L1_2 = L1_2.SyncFlashlight
  if L1_2 then
    L1_2 = Player
    L2_2 = source
    L1_2 = L1_2(L2_2)
    L1_2 = L1_2.state
    L2_2 = true == A0_2
    L1_2.lbTabletFlashlight = L2_2
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterCallback
L4_1 = "isAdmin"
function L5_1(A0_2)
  local L1_2, L2_2
  L1_2 = IsAdmin
  L2_2 = A0_2
  return L1_2(L2_2)
end
L3_1(L4_1, L5_1)
L3_1 = BaseCallback
L4_1 = "setName"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if "string" == L3_2 then
    L3_2 = #A2_2
    if 0 ~= L3_2 then
      L3_2 = #A2_2
      if not (L3_2 > 50) then
        goto lbl_14
      end
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_14::
  L3_2 = MySQL
  L3_2 = L3_2.update
  L3_2 = L3_2.await
  L4_2 = "UPDATE lbtablet_tablets SET tablet_name = ? WHERE id = ?"
  L5_2 = {}
  L6_2 = A2_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 > 0
  if L3_2 then
    L4_2 = Player
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2.state
    L4_2.lbTabletName = A2_2
  end
  return L3_2
end
L3_1(L4_1, L5_1)
L3_1 = BaseCallback
L4_1 = "factoryReset"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = MySQL
  L2_2 = L2_2.update
  L2_2 = L2_2.await
  L3_2 = "UPDATE lbtablet_tablets SET settings = NULL WHERE id = ?"
  L4_2 = {}
  L5_2 = A1_2
  L4_2[1] = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = SetSettings
  L3_2 = A1_2
  L4_2 = nil
  L2_2(L3_2, L4_2)
  L2_2 = PlayerLoggedOut
  L3_2 = A0_2
  L2_2(L3_2)
end
L3_1(L4_1, L5_1)
L3_1 = BaseCallback
L4_1 = "setSettings"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = SetSettings
  L4_2 = A1_2
  L5_2 = A2_2
  L3_2(L4_2, L5_2)
  L3_2 = Config
  L3_2 = L3_2.CacheSettings
  if false == L3_2 then
    L3_2 = MySQL
    L3_2 = L3_2.update
    L4_2 = "UPDATE lbtablet_tablets SET settings = ? WHERE id = ?"
    L5_2 = {}
    L6_2 = json
    L6_2 = L6_2.encode
    L7_2 = A2_2
    L6_2 = L6_2(L7_2)
    L7_2 = A1_2
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L3_2(L4_2, L5_2)
  end
  L3_2 = true
  return L3_2
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNetEvent
L4_1 = "tablet:finishedSetup"
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = GetEquippedTablet
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 or not A0_2 then
    return
  end
  L3_2 = SetSettings
  L4_2 = L2_2
  L5_2 = A0_2
  L3_2(L4_2, L5_2)
  L3_2 = MySQL
  L3_2 = L3_2.update
  L4_2 = "UPDATE lbtablet_tablets SET settings = ?, is_setup = 1 WHERE id = ?"
  L5_2 = {}
  L6_2 = json
  L6_2 = L6_2.encode
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  L7_2 = L2_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2(L4_2, L5_2)
end
L3_1(L4_1, L5_1)
L3_1 = OnTabletDisconnect
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = GetSettings
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = debugprint
    L4_2 = "Saving settings for tablet %s %s (%i)"
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = A0_2
    L7_2 = GetPlayerName
    L8_2 = A1_2
    L7_2 = L7_2(L8_2)
    L8_2 = A1_2
    L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = MySQL
    L3_2 = L3_2.update
    L3_2 = L3_2.await
    L4_2 = "UPDATE lbtablet_tablets SET settings = ? WHERE id = ?"
    L5_2 = {}
    L6_2 = json
    L6_2 = L6_2.encode
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    L7_2 = A0_2
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L3_2(L4_2, L5_2)
  end
  L3_2 = debugprint
  L4_2 = "Removing cached tablet %s for %s (%i)"
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = A0_2
  L7_2 = GetPlayerName
  L8_2 = A1_2
  L7_2 = L7_2(L8_2)
  L8_2 = A1_2
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = SetSettings
  L4_2 = A0_2
  L5_2 = nil
  L3_2(L4_2, L5_2)
  L3_2 = L0_1
  L3_2[A1_2] = nil
  L3_2 = L1_1
  L3_2[A0_2] = nil
end
L3_1(L4_1)
L3_1 = AddEventHandler
L4_1 = "onResourceStop"
function L5_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = SaveAllSettings
  L1_2()
end
L3_1(L4_1, L5_1)
L3_1 = AddEventHandler
L4_1 = "txAdmin:events:serverShuttingDown"
L5_1 = SaveAllSettings
L3_1(L4_1, L5_1)
