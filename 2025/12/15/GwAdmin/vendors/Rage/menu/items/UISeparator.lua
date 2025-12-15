local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = {}
L1_1.Y = 0
L1_1.Width = 431
L1_1.Height = 38
L0_1.Rectangle = L1_1
L1_1 = {}
L1_1.X = 8
L1_1.Y = 3
L1_1.Scale = 0.33
L0_1.Text = L1_1
L1_1 = RageUI
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = RageUI
  L1_2 = L1_2.CurrentMenu
  if nil ~= L1_2 then
    L2_2 = L1_2
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = RageUI
      L2_2 = L2_2.Options
      L2_2 = L2_2 + 1
      L3_2 = L1_2.Pagination
      L3_2 = L3_2.Minimum
      if L2_2 >= L3_2 then
        L3_2 = L1_2.Pagination
        L3_2 = L3_2.Maximum
        if L2_2 <= L3_2 then
          if nil ~= A0_2 then
            L3_2 = RenderText
            L4_2 = A0_2
            L5_2 = L1_2.X
            L6_2 = L0_1.Text
            L6_2 = L6_2.X
            L5_2 = L5_2 + L6_2
            L6_2 = L1_2.WidthOffset
            L6_2 = L6_2 * 2.5
            if 0 ~= L6_2 then
              L6_2 = L1_2.WidthOffset
              L6_2 = L6_2 * 2.5
              if L6_2 then
                goto lbl_41
              end
            end
            L6_2 = 200
            ::lbl_41::
            L5_2 = L5_2 + L6_2
            L6_2 = L1_2.Y
            L7_2 = L0_1.Text
            L7_2 = L7_2.Y
            L6_2 = L6_2 + L7_2
            L7_2 = L1_2.SubtitleHeight
            L6_2 = L6_2 + L7_2
            L7_2 = RageUI
            L7_2 = L7_2.ItemOffset
            L6_2 = L6_2 + L7_2
            L7_2 = 0
            L8_2 = L0_1.Text
            L8_2 = L8_2.Scale
            L8_2 = L8_2 - 0.05
            L9_2 = 245
            L10_2 = 245
            L11_2 = 245
            L12_2 = 255
            L13_2 = 1
            L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
          end
          L3_2 = RageUI
          L4_2 = RageUI
          L4_2 = L4_2.ItemOffset
          L5_2 = L0_1.Rectangle
          L5_2 = L5_2.Height
          L4_2 = L4_2 + L5_2
          L3_2.ItemOffset = L4_2
          L3_2 = L1_2.Index
          if L3_2 == L2_2 then
            L3_2 = RageUI
            L3_2 = L3_2.LastControl
            if L3_2 then
              L3_2 = L2_2 - 1
              L1_2.Index = L3_2
              L3_2 = L1_2.Index
              if L3_2 < 1 then
                L3_2 = RageUI
                L3_2 = L3_2.CurrentMenu
                L3_2 = L3_2.Options
                L1_2.Index = L3_2
              end
            else
              L3_2 = L2_2 + 1
              L1_2.Index = L3_2
            end
          end
        end
      end
      L3_2 = RageUI
      L4_2 = RageUI
      L4_2 = L4_2.Options
      L4_2 = L4_2 + 1
      L3_2.Options = L4_2
    end
  end
end
L1_1.Separator = L2_1
