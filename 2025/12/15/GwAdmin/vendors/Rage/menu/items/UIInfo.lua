local L0_1, L1_1
L0_1 = RageUI
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = #A1_2
  L4_2 = #A2_2
  if L3_2 >= L4_2 then
    L3_2 = #A1_2
    if L3_2 then
      goto lbl_9
    end
  end
  L3_2 = #A2_2
  ::lbl_9::
  if nil ~= A0_2 then
    L4_2 = RenderText
    L5_2 = "~h~"
    L6_2 = A0_2
    L7_2 = "~s~"
    L5_2 = L5_2 .. L6_2 .. L7_2
    L6_2 = 450
    L7_2 = 7
    L8_2 = 0
    L9_2 = 0.3
    L10_2 = 255
    L11_2 = 255
    L12_2 = 255
    L13_2 = 255
    L14_2 = 0
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  if nil ~= A1_2 then
    L4_2 = RenderText
    L5_2 = table
    L5_2 = L5_2.concat
    L6_2 = A1_2
    L7_2 = "\n"
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = 450
    if nil ~= A0_2 then
      L7_2 = 37
      if L7_2 then
        goto lbl_41
      end
    end
    L7_2 = 7
    ::lbl_41::
    L8_2 = 0
    L9_2 = 0.25
    L10_2 = 255
    L11_2 = 255
    L12_2 = 255
    L13_2 = 255
    L14_2 = 0
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  if nil ~= A2_2 then
    L4_2 = RenderText
    L5_2 = table
    L5_2 = L5_2.concat
    L6_2 = A2_2
    L7_2 = "\n"
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = 862
    if nil ~= A0_2 then
      L7_2 = 37
      if L7_2 then
        goto lbl_64
      end
    end
    L7_2 = 7
    ::lbl_64::
    L8_2 = 0
    L9_2 = 0.25
    L10_2 = 255
    L11_2 = 255
    L12_2 = 255
    L13_2 = 255
    L14_2 = 2
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L4_2 = RenderRectangle
  L5_2 = 440
  L6_2 = 0
  L7_2 = 432
  if nil ~= A0_2 then
    L8_2 = L3_2 * 25
    L8_2 = 50 + L8_2
    if L8_2 then
      goto lbl_88
    end
  end
  L8_2 = L3_2 + 1
  L8_2 = L8_2 * 25
  ::lbl_88::
  L9_2 = 20
  L10_2 = 24
  L11_2 = 28
  L12_2 = 255
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
L0_1.Info = L1_1
