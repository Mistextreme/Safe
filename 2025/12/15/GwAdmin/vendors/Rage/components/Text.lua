local L0_1, L1_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = #A0_2
  L2_2 = math
  L2_2 = L2_2.ceil
  L3_2 = L1_2 / 99
  L2_2 = L2_2(L3_2)
  L3_2 = {}
  L4_2 = 1
  L5_2 = L2_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L7_2 - 1
    L8_2 = L8_2 * 99
    L8_2 = L8_2 + 1
    L9_2 = math
    L9_2 = L9_2.clamp
    L10_2 = string
    L10_2 = L10_2.sub
    L11_2 = A0_2
    L12_2 = L8_2
    L10_2 = L10_2(L11_2, L12_2)
    L10_2 = #L10_2
    L11_2 = 0
    L12_2 = 99
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    if 1 ~= L7_2 then
      L10_2 = L8_2 - 1
      if L10_2 then
        goto lbl_37
      end
    end
    L10_2 = 0
    ::lbl_37::
    L10_2 = L10_2 + L9_2
    L11_2 = string
    L11_2 = L11_2.sub
    L12_2 = A0_2
    L13_2 = L8_2
    L14_2 = L10_2
    L11_2 = L11_2(L12_2, L13_2, L14_2)
    L3_2[L7_2] = L11_2
  end
  return L3_2
end
StringToArray = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = BeginTextCommandWidth
  L4_2 = "CELL_EMAIL_BCON"
  L3_2(L4_2)
  L3_2 = AddTextComponentSubstringPlayerName
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = SetTextFont
  L4_2 = A1_2 or L4_2
  if not A1_2 then
    L4_2 = 0
  end
  L3_2(L4_2)
  L3_2 = SetTextScale
  L4_2 = 1.0
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = EndTextCommandGetWidth
  L4_2 = true
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 * 1920
  return L3_2
end
MeasureStringWidth = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = tostring
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = #L1_2
  if L2_2 < 100 then
    L3_2 = AddTextComponentSubstringPlayerName
    L4_2 = L1_2
    L3_2(L4_2)
  else
    L3_2 = StringToArray
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    L4_2 = 1
    L5_2 = #L3_2
    L6_2 = 1
    for L7_2 = L4_2, L5_2, L6_2 do
      L8_2 = AddTextComponentSubstringPlayerName
      L9_2 = L3_2[L7_2]
      L8_2(L9_2)
    end
  end
end
AddText = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2, A9_2, A10_2, A11_2, A12_2)
  local L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L13_2 = tostring
  L14_2 = A0_2
  L13_2 = L13_2(L14_2)
  L14_2 = tonumber
  L15_2 = A1_2
  L14_2 = L14_2(L15_2)
  if not L14_2 then
    L14_2 = 0
  end
  L14_2 = L14_2 / 1920
  L15_2 = tonumber
  L16_2 = A2_2
  L15_2 = L15_2(L16_2)
  if not L15_2 then
    L15_2 = 0
  end
  L15_2 = L15_2 / 1080
  L16_2 = SetTextFont
  L17_2 = A3_2 or L17_2
  if not A3_2 then
    L17_2 = 0
  end
  L16_2(L17_2)
  L16_2 = SetTextScale
  L17_2 = 1.0
  L18_2 = A4_2 or L18_2
  if not A4_2 then
    L18_2 = 0
  end
  L16_2(L17_2, L18_2)
  L16_2 = SetTextColour
  L17_2 = tonumber
  L18_2 = A5_2
  L17_2 = L17_2(L18_2)
  if not L17_2 then
    L17_2 = 255
  end
  L18_2 = tonumber
  L19_2 = A6_2
  L18_2 = L18_2(L19_2)
  if not L18_2 then
    L18_2 = 255
  end
  L19_2 = tonumber
  L20_2 = A7_2
  L19_2 = L19_2(L20_2)
  if not L19_2 then
    L19_2 = 255
  end
  L20_2 = tonumber
  L21_2 = A8_2
  L20_2 = L20_2(L21_2)
  if not L20_2 then
    L20_2 = 255
  end
  L16_2(L17_2, L18_2, L19_2, L20_2)
  if A10_2 then
    L16_2 = SetTextDropShadow
    L16_2()
  end
  if A11_2 then
    L16_2 = SetTextOutline
    L16_2()
  end
  if nil ~= A9_2 then
    if 1 == A9_2 or "Center" == A9_2 or "Centre" == A9_2 then
      L16_2 = SetTextCentre
      L17_2 = true
      L16_2(L17_2)
    elseif 2 == A9_2 or "Right" == A9_2 then
      L16_2 = SetTextRightJustify
      L17_2 = true
      L16_2(L17_2)
    end
  end
  L16_2 = tonumber
  L17_2 = A12_2
  L16_2 = L16_2(L17_2)
  if L16_2 then
    L16_2 = tonumber
    L17_2 = A12_2
    L16_2 = L16_2(L17_2)
    if 0 ~= L16_2 then
      if 1 == A9_2 or "Center" == A9_2 or "Centre" == A9_2 then
        L16_2 = SetTextWrap
        L17_2 = A12_2 / 1920
        L17_2 = L17_2 / 2
        L17_2 = L14_2 - L17_2
        L18_2 = A12_2 / 1920
        L18_2 = L18_2 / 2
        L18_2 = L14_2 + L18_2
        L16_2(L17_2, L18_2)
      elseif 2 == A9_2 or "Right" == A9_2 then
        L16_2 = SetTextWrap
        L17_2 = 0
        L18_2 = L14_2
        L16_2(L17_2, L18_2)
      else
        L16_2 = SetTextWrap
        L17_2 = L14_2
        L18_2 = A12_2 / 1920
        L18_2 = L14_2 + L18_2
        L16_2(L17_2, L18_2)
      end
  end
  elseif 2 == A9_2 or "Right" == A9_2 then
    L16_2 = SetTextWrap
    L17_2 = 0
    L18_2 = L14_2
    L16_2(L17_2, L18_2)
  end
  L16_2 = BeginTextCommandLineCount
  L17_2 = "CELL_EMAIL_BCON"
  L16_2(L17_2)
  L16_2 = AddText
  L17_2 = L13_2
  L16_2(L17_2)
  L16_2 = GetTextScreenLineCount
  L17_2 = L14_2
  L18_2 = L15_2
  return L16_2(L17_2, L18_2)
end
GetLineCount = L0_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2, A9_2, A10_2, A11_2, A12_2)
  local L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L13_2 = tostring
  L14_2 = A0_2
  L13_2 = L13_2(L14_2)
  L14_2 = tonumber
  L15_2 = A1_2
  L14_2 = L14_2(L15_2)
  if not L14_2 then
    L14_2 = 0
  end
  L14_2 = L14_2 / 1920
  L15_2 = tonumber
  L16_2 = A2_2
  L15_2 = L15_2(L16_2)
  if not L15_2 then
    L15_2 = 0
  end
  L15_2 = L15_2 / 1080
  L16_2 = SetTextFont
  L17_2 = A3_2 or L17_2
  if not A3_2 then
    L17_2 = 0
  end
  L16_2(L17_2)
  L16_2 = SetTextScale
  L17_2 = 1.0
  L18_2 = A4_2 or L18_2
  if not A4_2 then
    L18_2 = 0
  end
  L16_2(L17_2, L18_2)
  L16_2 = SetTextColour
  L17_2 = tonumber
  L18_2 = A5_2
  L17_2 = L17_2(L18_2)
  if not L17_2 then
    L17_2 = 255
  end
  L18_2 = tonumber
  L19_2 = A6_2
  L18_2 = L18_2(L19_2)
  if not L18_2 then
    L18_2 = 255
  end
  L19_2 = tonumber
  L20_2 = A7_2
  L19_2 = L19_2(L20_2)
  if not L19_2 then
    L19_2 = 255
  end
  L20_2 = tonumber
  L21_2 = A8_2
  L20_2 = L20_2(L21_2)
  if not L20_2 then
    L20_2 = 255
  end
  L16_2(L17_2, L18_2, L19_2, L20_2)
  if A10_2 then
    L16_2 = SetTextDropShadow
    L16_2()
  end
  if A11_2 then
    L16_2 = SetTextOutline
    L16_2()
  end
  if nil ~= A9_2 then
    if 1 == A9_2 or "Center" == A9_2 or "Centre" == A9_2 then
      L16_2 = SetTextCentre
      L17_2 = true
      L16_2(L17_2)
    elseif 2 == A9_2 or "Right" == A9_2 then
      L16_2 = SetTextRightJustify
      L17_2 = true
      L16_2(L17_2)
    end
  end
  L16_2 = tonumber
  L17_2 = A12_2
  L16_2 = L16_2(L17_2)
  if L16_2 then
    L16_2 = tonumber
    L17_2 = A12_2
    L16_2 = L16_2(L17_2)
    if 0 ~= L16_2 then
      if 1 == A9_2 or "Center" == A9_2 or "Centre" == A9_2 then
        L16_2 = SetTextWrap
        L17_2 = A12_2 / 1920
        L17_2 = L17_2 / 2
        L17_2 = L14_2 - L17_2
        L18_2 = A12_2 / 1920
        L18_2 = L18_2 / 2
        L18_2 = L14_2 + L18_2
        L16_2(L17_2, L18_2)
      elseif 2 == A9_2 or "Right" == A9_2 then
        L16_2 = SetTextWrap
        L17_2 = 0
        L18_2 = L14_2
        L16_2(L17_2, L18_2)
      else
        L16_2 = SetTextWrap
        L17_2 = L14_2
        L18_2 = A12_2 / 1920
        L18_2 = L14_2 + L18_2
        L16_2(L17_2, L18_2)
      end
  end
  elseif 2 == A9_2 or "Right" == A9_2 then
    L16_2 = SetTextWrap
    L17_2 = 0
    L18_2 = L14_2
    L16_2(L17_2, L18_2)
  end
  L16_2 = BeginTextCommandDisplayText
  L17_2 = "CELL_EMAIL_BCON"
  L16_2(L17_2)
  L16_2 = AddText
  L17_2 = L13_2
  L16_2(L17_2)
  L16_2 = EndTextCommandDisplayText
  L17_2 = L14_2
  L18_2 = L15_2
  L16_2(L17_2, L18_2)
end
RenderText = L0_1
