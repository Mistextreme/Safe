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
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if nil ~= L0_2 then
    L1_2 = L0_2
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = RageUI
      L1_2 = L1_2.Options
      L1_2 = L1_2 + 1
      L2_2 = L0_2.Pagination
      L2_2 = L2_2.Minimum
      if L1_2 >= L2_2 then
        L2_2 = L0_2.Pagination
        L2_2 = L2_2.Maximum
        if L1_2 <= L2_2 then
          L2_2 = RenderRectangle
          L3_2 = L0_2.X
          L4_2 = L0_2.WidthOffset
          L4_2 = L4_2 * 2.5
          if 0 ~= L4_2 then
            L4_2 = L0_2.WidthOffset
            L4_2 = L4_2 * 2.5
            if L4_2 then
              goto lbl_34
            end
          end
          L4_2 = 200
          ::lbl_34::
          L3_2 = L3_2 + L4_2
          L3_2 = L3_2 - 150
          L3_2 = L3_2 + 8
          L4_2 = L0_2.Y
          L5_2 = RageUI
          L5_2 = L5_2.ItemOffset
          L4_2 = L4_2 + L5_2
          L4_2 = L4_2 + 15
          L5_2 = 300
          L6_2 = 3
          L7_2 = 255
          L8_2 = 255
          L9_2 = 255
          L10_2 = 150
          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
          L2_2 = RageUI
          L3_2 = RageUI
          L3_2 = L3_2.ItemOffset
          L4_2 = L0_1.Rectangle
          L4_2 = L4_2.Height
          L3_2 = L3_2 + L4_2
          L2_2.ItemOffset = L3_2
          L2_2 = L0_2.Index
          if L2_2 == L1_2 then
            L2_2 = RageUI
            L2_2 = L2_2.LastControl
            if L2_2 then
              L2_2 = L1_2 - 1
              L0_2.Index = L2_2
              L2_2 = L0_2.Index
              if L2_2 < 1 then
                L2_2 = RageUI
                L2_2 = L2_2.CurrentMenu
                L2_2 = L2_2.Options
                L0_2.Index = L2_2
              end
            else
              L2_2 = L1_2 + 1
              L0_2.Index = L2_2
            end
          end
        end
      end
      L2_2 = RageUI
      L3_2 = RageUI
      L3_2 = L3_2.Options
      L3_2 = L3_2 + 1
      L2_2.Options = L3_2
    end
  end
end
L1_1.Line = L2_1
