local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = {}
L1_1.Dictionary = "commonmenu.ytd"
L1_1.Texture = "gradient_bgd"
L1_1.Y = 4
L1_1.Width = 431
L1_1.Height = 42
L0_1.Background = L1_1
L1_1 = {}
L2_1 = {}
L2_1.X = 8
L2_1.Y = 10
L2_1.Scale = 0.35
L1_1.Left = L2_1
L2_1 = {}
L2_1.X = 8
L2_1.Y = 10
L2_1.Scale = 0.35
L1_1.Right = L2_1
L0_1.Text = L1_1
L1_1 = RageUI
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = RageUI
  L3_2 = L3_2.CurrentMenu
  if nil ~= L3_2 then
    L4_2 = MeasureStringWidth
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L5_2 = L3_2
    L5_2 = L5_2()
    if L5_2 then
      if nil ~= A2_2 then
        L5_2 = L3_2.Index
        if L5_2 ~= A2_2 then
          goto lbl_137
        end
      end
      L5_2 = RenderRectangle
      L6_2 = L3_2.X
      L7_2 = L3_2.Y
      L8_2 = L0_1.Background
      L8_2 = L8_2.Y
      L7_2 = L7_2 + L8_2
      L8_2 = L3_2.SubtitleHeight
      L7_2 = L7_2 + L8_2
      L8_2 = RageUI
      L8_2 = L8_2.ItemOffset
      L7_2 = L7_2 + L8_2
      L8_2 = RageUI
      L8_2 = L8_2.StatisticPanelCount
      L8_2 = L8_2 * 42
      L7_2 = L7_2 + L8_2
      L8_2 = L0_1.Background
      L8_2 = L8_2.Width
      L9_2 = L3_2.WidthOffset
      L8_2 = L8_2 + L9_2
      L9_2 = L0_1.Background
      L9_2 = L9_2.Height
      L10_2 = 0
      L11_2 = 0
      L12_2 = 0
      L13_2 = 170
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L5_2 = RenderText
      L6_2 = A0_2 or L6_2
      if not A0_2 then
        L6_2 = ""
      end
      L7_2 = L3_2.X
      L8_2 = L0_1.Text
      L8_2 = L8_2.Left
      L8_2 = L8_2.X
      L7_2 = L7_2 + L8_2
      L8_2 = RageUI
      L8_2 = L8_2.StatisticPanelCount
      L8_2 = L8_2 * 40
      L9_2 = L3_2.Y
      L8_2 = L8_2 + L9_2
      L9_2 = L0_1.Text
      L9_2 = L9_2.Left
      L9_2 = L9_2.Y
      L8_2 = L8_2 + L9_2
      L9_2 = L3_2.SubtitleHeight
      L8_2 = L8_2 + L9_2
      L9_2 = RageUI
      L9_2 = L9_2.ItemOffset
      L8_2 = L8_2 + L9_2
      L9_2 = 0
      L10_2 = L0_1.Text
      L10_2 = L10_2.Left
      L10_2 = L10_2.Scale
      L11_2 = 245
      L12_2 = 245
      L13_2 = 245
      L14_2 = 255
      L15_2 = 0
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      L5_2 = RenderText
      L6_2 = A1_2 or L6_2
      if not A1_2 then
        L6_2 = ""
      end
      L7_2 = L3_2.X
      L8_2 = L0_1.Background
      L8_2 = L8_2.Width
      L7_2 = L7_2 + L8_2
      L8_2 = L3_2.WidthOffset
      L7_2 = L7_2 + L8_2
      L7_2 = L7_2 - L4_2
      L8_2 = RageUI
      L8_2 = L8_2.StatisticPanelCount
      L8_2 = L8_2 * 40
      L9_2 = L3_2.Y
      L8_2 = L8_2 + L9_2
      L9_2 = L0_1.Text
      L9_2 = L9_2.Left
      L9_2 = L9_2.Y
      L8_2 = L8_2 + L9_2
      L9_2 = L3_2.SubtitleHeight
      L8_2 = L8_2 + L9_2
      L9_2 = RageUI
      L9_2 = L9_2.ItemOffset
      L8_2 = L8_2 + L9_2
      L9_2 = 0
      L10_2 = L0_1.Text
      L10_2 = L10_2.Left
      L10_2 = L10_2.Scale
      L11_2 = 245
      L12_2 = 245
      L13_2 = 245
      L14_2 = 255
      L15_2 = 2
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      L5_2 = RageUI
      L6_2 = RageUI
      L6_2 = L6_2.StatisticPanelCount
      L6_2 = L6_2 + 1
      L5_2.StatisticPanelCount = L6_2
    end
  end
  ::lbl_137::
end
L1_1.BoutonPanel = L2_1
