local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = {}
L1_1.Dictionary = "commonmenu"
L1_1.Texture = "gradient_bgd"
L1_1.Y = 4
L1_1.Width = 431
L1_1.Height = 76
L0_1.Background = L1_1
L1_1 = {}
L1_1.X = 9
L1_1.Y = 50
L1_1.Width = 413
L1_1.Height = 10
L0_1.Bar = L1_1
L1_1 = {}
L2_1 = {}
L2_1.X = 25
L2_1.Y = 15
L2_1.Scale = 0.25
L1_1.Left = L2_1
L2_1 = {}
L2_1.X = 215.5
L2_1.Y = 15
L2_1.Scale = 0.25
L1_1.Middle = L2_1
L2_1 = {}
L2_1.X = 398
L2_1.Y = 15
L2_1.Scale = 0.25
L1_1.Right = L2_1
L0_1.Text = L1_1
L1_1 = RageUI
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L6_2 = RageUI
  L6_2 = L6_2.CurrentMenu
  if nil ~= L6_2 then
    L7_2 = L6_2
    L7_2 = L7_2()
    if L7_2 then
      if nil ~= A5_2 then
        L7_2 = L6_2.Index
        if L7_2 ~= A5_2 then
          goto lbl_366
        end
      end
      L7_2 = RageUI
      L7_2 = L7_2.IsMouseInBounds
      L8_2 = L6_2.X
      L9_2 = L0_1.Bar
      L9_2 = L9_2.X
      L8_2 = L8_2 + L9_2
      L9_2 = L6_2.SafeZoneSize
      L9_2 = L9_2.X
      L8_2 = L8_2 + L9_2
      L9_2 = L6_2.Y
      L10_2 = L0_1.Bar
      L10_2 = L10_2.Y
      L9_2 = L9_2 + L10_2
      L10_2 = L6_2.SafeZoneSize
      L10_2 = L10_2.Y
      L9_2 = L9_2 + L10_2
      L10_2 = L6_2.SubtitleHeight
      L9_2 = L9_2 + L10_2
      L10_2 = RageUI
      L10_2 = L10_2.ItemOffset
      L9_2 = L9_2 + L10_2
      L9_2 = L9_2 - 4
      L10_2 = L0_1.Bar
      L10_2 = L10_2.Width
      L11_2 = L6_2.WidthOffset
      L10_2 = L10_2 + L11_2
      L11_2 = L0_1.Bar
      L11_2 = L11_2.Height
      L11_2 = L11_2 + 8
      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
      L8_2 = false
      L9_2 = L0_1.Bar
      L9_2 = L9_2.Width
      if A0_2 < 0.0 then
        A0_2 = 0.0
      elseif A0_2 > 1.0 then
        A0_2 = 1.0
      end
      L9_2 = L9_2 * A0_2
      L10_2 = RenderRectangle
      L11_2 = L6_2.X
      L12_2 = L6_2.Y
      L12_2 = L12_2 + 5
      L13_2 = L0_1.Background
      L13_2 = L13_2.Y
      L12_2 = L12_2 + L13_2
      L13_2 = L6_2.SubtitleHeight
      L12_2 = L12_2 + L13_2
      L13_2 = RageUI
      L13_2 = L13_2.ItemOffset
      L12_2 = L12_2 + L13_2
      L13_2 = L0_1.Background
      L13_2 = L13_2.Width
      L14_2 = L6_2.WidthOffset
      L13_2 = L13_2 + L14_2
      L14_2 = L0_1.Background
      L14_2 = L14_2.Height
      L15_2 = 20
      L16_2 = 24
      L17_2 = 28
      L18_2 = 255
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
      L10_2 = RenderRectangle
      L11_2 = L6_2.X
      L12_2 = L0_1.Bar
      L12_2 = L12_2.X
      L11_2 = L11_2 + L12_2
      L12_2 = L6_2.WidthOffset
      L12_2 = L12_2 / 2
      L11_2 = L11_2 + L12_2
      L12_2 = L6_2.Y
      L13_2 = L0_1.Bar
      L13_2 = L13_2.Y
      L12_2 = L12_2 + L13_2
      L13_2 = L6_2.SubtitleHeight
      L12_2 = L12_2 + L13_2
      L13_2 = RageUI
      L13_2 = L13_2.ItemOffset
      L12_2 = L12_2 + L13_2
      L13_2 = L0_1.Bar
      L13_2 = L13_2.Width
      L14_2 = L0_1.Bar
      L14_2 = L14_2.Height
      L15_2 = 35
      L16_2 = 39
      L17_2 = 47
      L18_2 = 255
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
      L10_2 = RenderRectangle
      L11_2 = L6_2.X
      L12_2 = L0_1.Bar
      L12_2 = L12_2.X
      L11_2 = L11_2 + L12_2
      L12_2 = L6_2.WidthOffset
      L12_2 = L12_2 / 2
      L11_2 = L11_2 + L12_2
      L12_2 = L6_2.Y
      L13_2 = L0_1.Bar
      L13_2 = L13_2.Y
      L12_2 = L12_2 + L13_2
      L13_2 = L6_2.SubtitleHeight
      L12_2 = L12_2 + L13_2
      L13_2 = RageUI
      L13_2 = L13_2.ItemOffset
      L12_2 = L12_2 + L13_2
      L13_2 = L9_2
      L14_2 = L0_1.Bar
      L14_2 = L14_2.Height
      L15_2 = 133
      L16_2 = 133
      L17_2 = 133
      L18_2 = 255
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
      L10_2 = RenderText
      L11_2 = A1_2 or L11_2
      if not A1_2 then
        L11_2 = "Opacity"
      end
      L12_2 = L6_2.X
      L13_2 = L0_1.Text
      L13_2 = L13_2.Middle
      L13_2 = L13_2.X
      L12_2 = L12_2 + L13_2
      L13_2 = L6_2.WidthOffset
      L13_2 = L13_2 / 2
      L12_2 = L12_2 + L13_2
      L13_2 = L6_2.Y
      L14_2 = L0_1.Text
      L14_2 = L14_2.Middle
      L14_2 = L14_2.Y
      L13_2 = L13_2 + L14_2
      L14_2 = L6_2.SubtitleHeight
      L13_2 = L13_2 + L14_2
      L14_2 = RageUI
      L14_2 = L14_2.ItemOffset
      L13_2 = L13_2 + L14_2
      L14_2 = 0
      L15_2 = L0_1.Text
      L15_2 = L15_2.Middle
      L15_2 = L15_2.Scale
      L16_2 = 245
      L17_2 = 245
      L18_2 = 245
      L19_2 = 255
      L20_2 = 1
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      L10_2 = RenderText
      L11_2 = A2_2 or L11_2
      if not A2_2 then
        L11_2 = "0%"
      end
      L12_2 = L6_2.X
      L13_2 = L0_1.Text
      L13_2 = L13_2.Left
      L13_2 = L13_2.X
      L12_2 = L12_2 + L13_2
      L13_2 = L6_2.WidthOffset
      L13_2 = L13_2 / 2
      L12_2 = L12_2 + L13_2
      L13_2 = L6_2.Y
      L14_2 = L0_1.Text
      L14_2 = L14_2.Left
      L14_2 = L14_2.Y
      L13_2 = L13_2 + L14_2
      L14_2 = L6_2.SubtitleHeight
      L13_2 = L13_2 + L14_2
      L14_2 = RageUI
      L14_2 = L14_2.ItemOffset
      L13_2 = L13_2 + L14_2
      L14_2 = 0
      L15_2 = L0_1.Text
      L15_2 = L15_2.Left
      L15_2 = L15_2.Scale
      L16_2 = 245
      L17_2 = 245
      L18_2 = 245
      L19_2 = 255
      L20_2 = 1
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      L10_2 = RenderText
      L11_2 = A3_2 or L11_2
      if not A3_2 then
        L11_2 = "100%"
      end
      L12_2 = L6_2.X
      L13_2 = L0_1.Text
      L13_2 = L13_2.Right
      L13_2 = L13_2.X
      L12_2 = L12_2 + L13_2
      L13_2 = L6_2.WidthOffset
      L13_2 = L13_2 / 2
      L12_2 = L12_2 + L13_2
      L13_2 = L6_2.Y
      L14_2 = L0_1.Text
      L14_2 = L14_2.Right
      L14_2 = L14_2.Y
      L13_2 = L13_2 + L14_2
      L14_2 = L6_2.SubtitleHeight
      L13_2 = L13_2 + L14_2
      L14_2 = RageUI
      L14_2 = L14_2.ItemOffset
      L13_2 = L13_2 + L14_2
      L14_2 = 0
      L15_2 = L0_1.Text
      L15_2 = L15_2.Right
      L15_2 = L15_2.Scale
      L16_2 = 245
      L17_2 = 245
      L18_2 = 245
      L19_2 = 255
      L20_2 = 1
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      if L7_2 then
        L10_2 = IsDisabledControlPressed
        L11_2 = 0
        L12_2 = 24
        L10_2 = L10_2(L11_2, L12_2)
        if L10_2 then
          L8_2 = true
          L10_2 = math
          L10_2 = L10_2.round
          L11_2 = GetControlNormal
          L12_2 = 2
          L13_2 = 239
          L11_2 = L11_2(L12_2, L13_2)
          L11_2 = L11_2 * 1920
          L10_2 = L10_2(L11_2)
          L11_2 = L6_2.SafeZoneSize
          L11_2 = L11_2.X
          L10_2 = L10_2 - L11_2
          L11_2 = L6_2.X
          L12_2 = L0_1.Bar
          L12_2 = L12_2.X
          L11_2 = L11_2 + L12_2
          L12_2 = L6_2.WidthOffset
          L12_2 = L12_2 / 2
          L11_2 = L11_2 + L12_2
          L9_2 = L10_2 - L11_2
          if L9_2 < 0 then
            L9_2 = 0
          else
            L10_2 = L0_1.Bar
            L10_2 = L10_2.Width
            if L9_2 > L10_2 then
              L10_2 = L0_1.Bar
              L9_2 = L10_2.Width
            end
          end
          L10_2 = math
          L10_2 = L10_2.round
          L11_2 = L0_1.Bar
          L11_2 = L11_2.Width
          L11_2 = L9_2 / L11_2
          L12_2 = 2
          L10_2 = L10_2(L11_2, L12_2)
          A0_2 = L10_2
          L10_2 = A4_2.onProgressChange
          if nil ~= L10_2 then
            L10_2 = A4_2.onProgressChange
            L11_2 = A0_2
            L10_2(L11_2)
          end
        end
      end
      L10_2 = RageUI
      L11_2 = RageUI
      L11_2 = L11_2.ItemOffset
      L12_2 = L0_1.Background
      L12_2 = L12_2.Height
      L11_2 = L11_2 + L12_2
      L12_2 = L0_1.Background
      L12_2 = L12_2.Y
      L11_2 = L11_2 + L12_2
      L10_2.ItemOffset = L11_2
      if L7_2 and L8_2 then
        L10_2 = RageUI
        L10_2 = L10_2.Settings
        L10_2 = L10_2.Audio
        L11_2 = RageUI
        L11_2 = L11_2.PlaySound
        L12_2 = L10_2.Use
        L12_2 = L10_2[L12_2]
        L12_2 = L12_2.Slider
        L12_2 = L12_2.audioName
        L13_2 = L10_2.Use
        L13_2 = L10_2[L13_2]
        L13_2 = L13_2.Slider
        L13_2 = L13_2.audioRef
        L14_2 = true
        L11_2(L12_2, L13_2, L14_2)
        L11_2 = A4_2.onSelected
        if nil ~= L11_2 then
          L11_2 = A4_2.onSelected
          L12_2 = A0_2
          L11_2(L12_2)
        end
      end
    end
  end
  ::lbl_366::
end
L1_1.PercentagePanel = L2_1
