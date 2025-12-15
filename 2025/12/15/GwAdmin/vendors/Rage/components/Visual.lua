local L0_1, L1_1, L2_1, L3_1
L0_1 = Visual
if not L0_1 then
  L0_1 = {}
end
Visual = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = 100
  L2_2 = string
  L2_2 = L2_2.len
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = 99
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = string
    L5_2 = L5_2.sub
    L6_2 = A0_2
    L7_2 = L4_2
    L8_2 = L4_2 + 99
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L6_2 = AddTextComponentSubstringPlayerName
    L7_2 = L5_2
    L6_2(L7_2)
  end
end
L1_1 = Visual
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = ClearPrints
  L2_2()
  L2_2 = BeginTextCommandPrint
  L3_2 = "STRING"
  L2_2(L3_2)
  L2_2 = AddTextComponentSubstringPlayerName
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = EndTextCommandPrint
  if A1_2 then
    L3_2 = math
    L3_2 = L3_2.ceil
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_19
    end
  end
  L3_2 = 0
  ::lbl_19::
  L4_2 = true
  L2_2(L3_2, L4_2)
end
L1_1.Subtitle = L2_1
L1_1 = Visual
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = BeginTextCommandDisplayHelp
  L4_2 = "jamyfafi"
  L3_2(L4_2)
  L3_2 = AddTextComponentSubstringPlayerName
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = string
  L3_2 = L3_2.len
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 > 99 then
    L3_2 = L0_1
    L4_2 = A0_2
    L3_2(L4_2)
  end
  L3_2 = EndTextCommandDisplayHelp
  L4_2 = 0
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = 0
  end
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = true
  end
  L7_2 = -1
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L1_1.FloatingHelpText = L2_1
L1_1 = Visual
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = BeginTextCommandBusyspinnerOn
  L3_2 = "STRING"
  L2_2(L3_2)
  L2_2 = AddTextComponentSubstringPlayerName
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = EndTextCommandBusyspinnerOn
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = 1
  end
  L2_2(L3_2)
end
L1_1.Prompt = L2_1
L1_1 = Visual
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = Citizen
  L3_2 = L3_2.CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3
    L0_3 = Citizen
    L0_3 = L0_3.Wait
    L1_3 = 0
    L0_3(L1_3)
    L0_3 = Visual
    L0_3 = L0_3.Prompt
    L1_3 = A1_2
    L2_3 = A2_2
    L0_3(L1_3, L2_3)
    L0_3 = Citizen
    L0_3 = L0_3.Wait
    L1_3 = A0_2
    L0_3(L1_3)
    L0_3 = BusyspinnerIsOn
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = BusyspinnerOff
      L0_3()
    end
  end
  L3_2(L4_2)
end
L1_1.PromptDuration = L2_1
L1_1 = RegisterNetEvent
L2_1 = "Visual:Popup"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "Visual:Popup"
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = RageUI
  L1_2 = L1_2.Popup
  L2_2 = A0_2
  L1_2(L2_2)
end
L1_1(L2_1, L3_1)
L1_1 = Visual
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = ClearPrints
  L1_2()
  L1_2 = A0_2.colors
  if nil == L1_2 then
    L1_2 = SetNotificationBackgroundColor
    L2_2 = 140
    L1_2(L2_2)
  else
    L1_2 = SetNotificationBackgroundColor
    L2_2 = A0_2.colors
    L1_2(L2_2)
  end
  L1_2 = SetNotificationTextEntry
  L2_2 = "STRING"
  L1_2(L2_2)
  L1_2 = A0_2.message
  if nil == L1_2 then
    L1_2 = error
    L2_2 = "Missing arguments, message"
    L1_2(L2_2)
  else
    L1_2 = AddTextComponentString
    L2_2 = tostring
    L3_2 = A0_2.message
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  L1_2 = DrawNotification
  L2_2 = false
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.sound
  if nil ~= L1_2 then
    L1_2 = A0_2.sound
    L1_2 = L1_2.audio_name
    if nil ~= L1_2 then
      L1_2 = A0_2.sound
      L1_2 = L1_2.audio_ref
      if nil ~= L1_2 then
        L1_2 = PlaySoundFrontend
        L2_2 = -1
        L3_2 = A0_2.sound
        L3_2 = L3_2.audio_name
        L4_2 = A0_2.sound
        L4_2 = L4_2.audio_ref
        L5_2 = true
        L1_2(L2_2, L3_2, L4_2, L5_2)
      else
        L1_2 = error
        L2_2 = "Missing arguments, audio_ref"
        L1_2(L2_2)
      end
    else
      L1_2 = error
      L2_2 = "Missing arguments, audio_name"
      L1_2(L2_2)
    end
  end
end
L1_1.Popup = L2_1
L1_1 = Visual
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = ClearPrints
  L1_2()
  L1_2 = SetTextEntry_2
  L2_2 = "STRING"
  L1_2(L2_2)
  L1_2 = A0_2.message
  if nil ~= L1_2 then
    L1_2 = AddTextComponentString
    L2_2 = tostring
    L3_2 = A0_2.message
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    L1_2(L2_2, L3_2, L4_2, L5_2)
  else
    L1_2 = error
    L2_2 = "Missing arguments, message"
    L1_2(L2_2)
  end
  L1_2 = A0_2.time_display
  if nil ~= L1_2 then
    L1_2 = DrawSubtitleTimed
    L2_2 = tonumber
    L3_2 = A0_2.time_display
    L2_2 = L2_2(L3_2)
    L3_2 = 1
    L1_2(L2_2, L3_2)
  else
    L1_2 = DrawSubtitleTimed
    L2_2 = 6000
    L3_2 = 1
    L1_2(L2_2, L3_2)
  end
  L1_2 = A0_2.sound
  if nil ~= L1_2 then
    L1_2 = A0_2.sound
    L1_2 = L1_2.audio_name
    if nil ~= L1_2 then
      L1_2 = A0_2.sound
      L1_2 = L1_2.audio_ref
      if nil ~= L1_2 then
        L1_2 = PlaySoundFrontend
        L2_2 = -1
        L3_2 = A0_2.sound
        L3_2 = L3_2.audio_name
        L4_2 = A0_2.sound
        L4_2 = L4_2.audio_ref
        L5_2 = true
        L1_2(L2_2, L3_2, L4_2, L5_2)
      else
        L1_2 = error
        L2_2 = "Missing arguments, audio_ref"
        L1_2(L2_2)
      end
    else
      L1_2 = error
      L2_2 = "Missing arguments, audio_name"
      L1_2(L2_2)
    end
  end
end
L1_1.Text = L2_1
