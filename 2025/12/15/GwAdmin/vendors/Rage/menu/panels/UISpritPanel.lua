local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = {}
L1_1.Dictionary = "commonmenu"
L1_1.Texture = "gradient_bgd"
L1_1.Y = 4
L1_1.Width = 431
L1_1.Height = 42
L0_1.Background = L1_1
L1_1 = RageUI
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = RageUI
  L2_2 = L2_2.CurrentMenu
  if nil ~= L2_2 then
    L3_2 = L2_2
    L3_2 = L3_2()
    if L3_2 then
      L3_2 = RenderSprite
      L4_2 = A0_2
      L5_2 = A1_2
      L6_2 = L2_2.X
      L7_2 = L2_2.Y
      L8_2 = L0_1.Background
      L8_2 = L8_2.Y
      L7_2 = L7_2 + L8_2
      L8_2 = L2_2.SubtitleHeight
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
      L9_2 = L2_2.WidthOffset
      L8_2 = L8_2 + L9_2
      L9_2 = L0_1.Background
      L9_2 = L9_2.Height
      L9_2 = L9_2 + 200
      L10_2 = 0
      L11_2 = 255
      L12_2 = 255
      L13_2 = 255
      L14_2 = 255
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      L3_2 = RageUI
      L4_2 = RageUI
      L4_2 = L4_2.StatisticPanelCount
      L4_2 = L4_2 + 1
      L3_2.StatisticPanelCount = L4_2
    end
  end
end
L1_1.RenderSprite = L2_1
