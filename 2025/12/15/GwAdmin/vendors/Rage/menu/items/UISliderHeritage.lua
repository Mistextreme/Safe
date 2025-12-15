local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
L1_1 = {}
L1_1.Dictionary = "commonmenu"
L1_1.Texture = "gradient_nav"
L1_1.Y = 0
L1_1.Width = 431
L1_1.Height = 38
L0_1.SelectedSprite = L1_1
L1_1 = {}
L2_1 = {}
L2_1.X = 250
L2_1.Y = 14.5
L2_1.Width = 150
L2_1.Height = 9
L1_1.Background = L2_1
L2_1 = {}
L2_1.X = 250
L2_1.Y = 14.5
L2_1.Width = 75
L2_1.Height = 9
L1_1.Slider = L2_1
L2_1 = {}
L2_1.X = 323.5
L2_1.Y = 9
L2_1.Width = 2.5
L2_1.Height = 20
L1_1.Divider = L2_1
L2_1 = {}
L2_1.Dictionary = "mpleaderboard"
L2_1.Texture = "leaderboard_female_icon"
L2_1.X = 215
L2_1.Y = 0
L2_1.Width = 40
L2_1.Height = 40
L1_1.LeftArrow = L2_1
L2_1 = {}
L2_1.Dictionary = "mpleaderboard"
L2_1.Texture = "leaderboard_male_icon"
L2_1.X = 395
L2_1.Y = 0
L2_1.Width = 40
L2_1.Height = 40
L1_1.RightArrow = L2_1
L2_1 = {}
L3_1 = 1
L4_1 = 10
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = table
  L7_1 = L7_1.insert
  L8_1 = L2_1
  L9_1 = L6_1
  L7_1(L8_1, L9_1)
end
L3_1 = RageUI
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L5_2 = RageUI
  L5_2 = L5_2.CurrentMenu
  L6_2 = RageUI
  L6_2 = L6_2.Settings
  L6_2 = L6_2.Audio
  if nil ~= L5_2 then
    L7_2 = L5_2
    L7_2 = L7_2()
    if L7_2 then
      L7_2 = RageUI
      L7_2 = L7_2.Options
      L7_2 = L7_2 + 1
      L8_2 = L5_2.Pagination
      L8_2 = L8_2.Minimum
      if L7_2 >= L8_2 then
        L8_2 = L5_2.Pagination
        L8_2 = L8_2.Maximum
        if L7_2 <= L8_2 then
          L8_2 = A4_2 or L8_2
          if not A4_2 then
            L8_2 = 0.1
          end
          L9_2 = L5_2.Index
          L9_2 = L9_2 == L7_2
          L10_2 = false
          L11_2 = false
          L12_2 = RageUI
          L12_2 = L12_2.ItemsSafeZone
          L13_2 = L5_2
          L12_2(L13_2)
          L12_2 = false
          L13_2 = 0
          L14_2 = L5_2.EnableMouse
          if true == L14_2 then
            L14_2 = L5_2.CursorStyle
            if 0 == L14_2 then
              goto lbl_49
            end
          end
          L14_2 = L5_2.CursorStyle
          ::lbl_49::
          if 1 == L14_2 then
            L14_2 = RageUI
            L14_2 = L14_2.ItemsMouseBounds
            L15_2 = L5_2
            L16_2 = L9_2
            L17_2 = L7_2
            L18_2 = L0_1
            L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
            L12_2 = L14_2
          end
          if L9_2 then
            L14_2 = RenderSprite
            L15_2 = L0_1.SelectedSprite
            L15_2 = L15_2.Dictionary
            L16_2 = L0_1.SelectedSprite
            L16_2 = L16_2.Texture
            L17_2 = L5_2.X
            L18_2 = L5_2.Y
            L19_2 = L0_1.SelectedSprite
            L19_2 = L19_2.Y
            L18_2 = L18_2 + L19_2
            L19_2 = L5_2.SubtitleHeight
            L18_2 = L18_2 + L19_2
            L19_2 = RageUI
            L19_2 = L19_2.ItemOffset
            L18_2 = L18_2 + L19_2
            L19_2 = L0_1.SelectedSprite
            L19_2 = L19_2.Width
            L20_2 = L5_2.WidthOffset
            L19_2 = L19_2 + L20_2
            L20_2 = L0_1.SelectedSprite
            L20_2 = L20_2.Height
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            L14_2 = RageUI
            L14_2 = L14_2.IsMouseInBounds
            L15_2 = L5_2.X
            L16_2 = L1_1.LeftArrow
            L16_2 = L16_2.X
            L15_2 = L15_2 + L16_2
            L16_2 = L5_2.SafeZoneSize
            L16_2 = L16_2.X
            L15_2 = L15_2 + L16_2
            L16_2 = L5_2.WidthOffset
            L15_2 = L15_2 + L16_2
            L16_2 = L5_2.Y
            L17_2 = L1_1.LeftArrow
            L17_2 = L17_2.Y
            L16_2 = L16_2 + L17_2
            L17_2 = L5_2.SafeZoneSize
            L17_2 = L17_2.Y
            L16_2 = L16_2 + L17_2
            L17_2 = L5_2.SubtitleHeight
            L16_2 = L16_2 + L17_2
            L17_2 = RageUI
            L17_2 = L17_2.ItemOffset
            L16_2 = L16_2 + L17_2
            L17_2 = L1_1.LeftArrow
            L17_2 = L17_2.Width
            L18_2 = L1_1.LeftArrow
            L18_2 = L18_2.Height
            L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
            L10_2 = L14_2
            L14_2 = RageUI
            L14_2 = L14_2.IsMouseInBounds
            L15_2 = L5_2.X
            L16_2 = L1_1.RightArrow
            L16_2 = L16_2.X
            L15_2 = L15_2 + L16_2
            L16_2 = L5_2.SafeZoneSize
            L16_2 = L16_2.X
            L15_2 = L15_2 + L16_2
            L16_2 = L5_2.WidthOffset
            L15_2 = L15_2 + L16_2
            L16_2 = L5_2.Y
            L17_2 = L1_1.RightArrow
            L17_2 = L17_2.Y
            L16_2 = L16_2 + L17_2
            L17_2 = L5_2.SafeZoneSize
            L17_2 = L17_2.Y
            L16_2 = L16_2 + L17_2
            L17_2 = L5_2.SubtitleHeight
            L16_2 = L16_2 + L17_2
            L17_2 = RageUI
            L17_2 = L17_2.ItemOffset
            L16_2 = L16_2 + L17_2
            L17_2 = L1_1.RightArrow
            L17_2 = L17_2.Width
            L18_2 = L1_1.RightArrow
            L18_2 = L18_2.Height
            L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
            L11_2 = L14_2
          end
          if L9_2 then
            L14_2 = RenderText
            L15_2 = A0_2
            L16_2 = L5_2.X
            L17_2 = L0_1.Text
            L17_2 = L17_2.X
            L16_2 = L16_2 + L17_2
            L17_2 = L5_2.Y
            L18_2 = L0_1.Text
            L18_2 = L18_2.Y
            L17_2 = L17_2 + L18_2
            L18_2 = L5_2.SubtitleHeight
            L17_2 = L17_2 + L18_2
            L18_2 = RageUI
            L18_2 = L18_2.ItemOffset
            L17_2 = L17_2 + L18_2
            L18_2 = 0
            L19_2 = L0_1.Text
            L19_2 = L19_2.Scale
            L20_2 = 0
            L21_2 = 0
            L22_2 = 0
            L23_2 = 255
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
            L14_2 = RenderSprite
            L15_2 = L1_1.LeftArrow
            L15_2 = L15_2.Dictionary
            L16_2 = L1_1.LeftArrow
            L16_2 = L16_2.Texture
            L17_2 = L5_2.X
            L18_2 = L1_1.LeftArrow
            L18_2 = L18_2.X
            L17_2 = L17_2 + L18_2
            L18_2 = L5_2.WidthOffset
            L17_2 = L17_2 + L18_2
            L17_2 = L17_2 - L13_2
            L18_2 = L5_2.Y
            L19_2 = L1_1.LeftArrow
            L19_2 = L19_2.Y
            L18_2 = L18_2 + L19_2
            L19_2 = L5_2.SubtitleHeight
            L18_2 = L18_2 + L19_2
            L19_2 = RageUI
            L19_2 = L19_2.ItemOffset
            L18_2 = L18_2 + L19_2
            L19_2 = L1_1.LeftArrow
            L19_2 = L19_2.Width
            L20_2 = L1_1.LeftArrow
            L20_2 = L20_2.Height
            L21_2 = 0
            L22_2 = 0
            L23_2 = 0
            L24_2 = 0
            L25_2 = 255
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
            L14_2 = RenderSprite
            L15_2 = L1_1.RightArrow
            L15_2 = L15_2.Dictionary
            L16_2 = L1_1.RightArrow
            L16_2 = L16_2.Texture
            L17_2 = L5_2.X
            L18_2 = L1_1.RightArrow
            L18_2 = L18_2.X
            L17_2 = L17_2 + L18_2
            L18_2 = L5_2.WidthOffset
            L17_2 = L17_2 + L18_2
            L17_2 = L17_2 - L13_2
            L18_2 = L5_2.Y
            L19_2 = L1_1.RightArrow
            L19_2 = L19_2.Y
            L18_2 = L18_2 + L19_2
            L19_2 = L5_2.SubtitleHeight
            L18_2 = L18_2 + L19_2
            L19_2 = RageUI
            L19_2 = L19_2.ItemOffset
            L18_2 = L18_2 + L19_2
            L19_2 = L1_1.RightArrow
            L19_2 = L19_2.Width
            L20_2 = L1_1.RightArrow
            L20_2 = L20_2.Height
            L21_2 = 0
            L22_2 = 0
            L23_2 = 0
            L24_2 = 0
            L25_2 = 255
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
          else
            L14_2 = RenderText
            L15_2 = A0_2
            L16_2 = L5_2.X
            L17_2 = L0_1.Text
            L17_2 = L17_2.X
            L16_2 = L16_2 + L17_2
            L17_2 = L5_2.Y
            L18_2 = L0_1.Text
            L18_2 = L18_2.Y
            L17_2 = L17_2 + L18_2
            L18_2 = L5_2.SubtitleHeight
            L17_2 = L17_2 + L18_2
            L18_2 = RageUI
            L18_2 = L18_2.ItemOffset
            L17_2 = L17_2 + L18_2
            L18_2 = 0
            L19_2 = L0_1.Text
            L19_2 = L19_2.Scale
            L20_2 = 245
            L21_2 = 245
            L22_2 = 245
            L23_2 = 255
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
            L14_2 = RenderSprite
            L15_2 = L1_1.LeftArrow
            L15_2 = L15_2.Dictionary
            L16_2 = L1_1.LeftArrow
            L16_2 = L16_2.Texture
            L17_2 = L5_2.X
            L18_2 = L1_1.LeftArrow
            L18_2 = L18_2.X
            L17_2 = L17_2 + L18_2
            L18_2 = L5_2.WidthOffset
            L17_2 = L17_2 + L18_2
            L17_2 = L17_2 - L13_2
            L18_2 = L5_2.Y
            L19_2 = L1_1.LeftArrow
            L19_2 = L19_2.Y
            L18_2 = L18_2 + L19_2
            L19_2 = L5_2.SubtitleHeight
            L18_2 = L18_2 + L19_2
            L19_2 = RageUI
            L19_2 = L19_2.ItemOffset
            L18_2 = L18_2 + L19_2
            L19_2 = L1_1.LeftArrow
            L19_2 = L19_2.Width
            L20_2 = L1_1.LeftArrow
            L20_2 = L20_2.Height
            L21_2 = 0
            L22_2 = 255
            L23_2 = 255
            L24_2 = 255
            L25_2 = 255
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
            L14_2 = RenderSprite
            L15_2 = L1_1.RightArrow
            L15_2 = L15_2.Dictionary
            L16_2 = L1_1.RightArrow
            L16_2 = L16_2.Texture
            L17_2 = L5_2.X
            L18_2 = L1_1.RightArrow
            L18_2 = L18_2.X
            L17_2 = L17_2 + L18_2
            L18_2 = L5_2.WidthOffset
            L17_2 = L17_2 + L18_2
            L17_2 = L17_2 - L13_2
            L18_2 = L5_2.Y
            L19_2 = L1_1.RightArrow
            L19_2 = L19_2.Y
            L18_2 = L18_2 + L19_2
            L19_2 = L5_2.SubtitleHeight
            L18_2 = L18_2 + L19_2
            L19_2 = RageUI
            L19_2 = L19_2.ItemOffset
            L18_2 = L18_2 + L19_2
            L19_2 = L1_1.RightArrow
            L19_2 = L19_2.Width
            L20_2 = L1_1.RightArrow
            L20_2 = L20_2.Height
            L21_2 = 0
            L22_2 = 255
            L23_2 = 255
            L24_2 = 255
            L25_2 = 255
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
          end
          L14_2 = RenderRectangle
          L15_2 = L5_2.X
          L16_2 = L1_1.Background
          L16_2 = L16_2.X
          L15_2 = L15_2 + L16_2
          L16_2 = L5_2.WidthOffset
          L15_2 = L15_2 + L16_2
          L15_2 = L15_2 - L13_2
          L16_2 = L5_2.Y
          L17_2 = L1_1.Background
          L17_2 = L17_2.Y
          L16_2 = L16_2 + L17_2
          L17_2 = L5_2.SubtitleHeight
          L16_2 = L16_2 + L17_2
          L17_2 = RageUI
          L17_2 = L17_2.ItemOffset
          L16_2 = L16_2 + L17_2
          L17_2 = L1_1.Background
          L17_2 = L17_2.Width
          L18_2 = L1_1.Background
          L18_2 = L18_2.Height
          L19_2 = 4
          L20_2 = 32
          L21_2 = 57
          L22_2 = 255
          L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
          L14_2 = RenderRectangle
          L15_2 = L5_2.X
          L16_2 = L1_1.Slider
          L16_2 = L16_2.X
          L15_2 = L15_2 + L16_2
          L16_2 = L1_1.Background
          L16_2 = L16_2.Width
          L17_2 = L1_1.Slider
          L17_2 = L17_2.Width
          L16_2 = L16_2 - L17_2
          L17_2 = L2_1
          L17_2 = #L17_2
          L16_2 = L16_2 / L17_2
          L16_2 = L16_2 * A1_2
          L15_2 = L15_2 + L16_2
          L16_2 = L5_2.WidthOffset
          L15_2 = L15_2 + L16_2
          L15_2 = L15_2 - L13_2
          L16_2 = L5_2.Y
          L17_2 = L1_1.Slider
          L17_2 = L17_2.Y
          L16_2 = L16_2 + L17_2
          L17_2 = L5_2.SubtitleHeight
          L16_2 = L16_2 + L17_2
          L17_2 = RageUI
          L17_2 = L17_2.ItemOffset
          L16_2 = L16_2 + L17_2
          L17_2 = L1_1.Slider
          L17_2 = L17_2.Width
          L18_2 = L1_1.Slider
          L18_2 = L18_2.Height
          L19_2 = 57
          L20_2 = 116
          L21_2 = 200
          L22_2 = 255
          L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
          L14_2 = RenderRectangle
          L15_2 = L5_2.X
          L16_2 = L1_1.Divider
          L16_2 = L16_2.X
          L15_2 = L15_2 + L16_2
          L16_2 = L5_2.WidthOffset
          L15_2 = L15_2 + L16_2
          L16_2 = L5_2.Y
          L17_2 = L1_1.Divider
          L17_2 = L17_2.Y
          L16_2 = L16_2 + L17_2
          L17_2 = L5_2.SubtitleHeight
          L16_2 = L16_2 + L17_2
          L17_2 = RageUI
          L17_2 = L17_2.ItemOffset
          L16_2 = L16_2 + L17_2
          L17_2 = L1_1.Divider
          L17_2 = L17_2.Width
          L18_2 = L1_1.Divider
          L18_2 = L18_2.Height
          L19_2 = 245
          L20_2 = 245
          L21_2 = 245
          L22_2 = 255
          L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
          L14_2 = RageUI
          L15_2 = RageUI
          L15_2 = L15_2.ItemOffset
          L16_2 = L0_1.Rectangle
          L16_2 = L16_2.Height
          L15_2 = L15_2 + L16_2
          L14_2.ItemOffset = L15_2
          L14_2 = RageUI
          L14_2 = L14_2.ItemsDescription
          L15_2 = L5_2
          L16_2 = A2_2
          L17_2 = L9_2
          L14_2(L15_2, L16_2, L17_2)
          if L9_2 then
            L14_2 = L5_2.Controls
            L14_2 = L14_2.SliderLeft
            L14_2 = L14_2.Active
            if not L14_2 then
              L14_2 = L5_2.Controls
              L14_2 = L14_2.Click
              L14_2 = L14_2.Active
              if not (L14_2 and L10_2) then
                goto lbl_538
              end
            end
            L14_2 = L5_2.Controls
            L14_2 = L14_2.SliderRight
            L14_2 = L14_2.Active
            if not L14_2 then
              L14_2 = L5_2.Controls
              L14_2 = L14_2.Click
              L14_2 = L14_2.Active
              if not L14_2 or not L11_2 then
                A1_2 = A1_2 - L8_2
                L14_2 = 0.1
                if A1_2 < L14_2 then
                  A1_2 = 0.0
                else
                  L14_2 = RageUI
                  L14_2 = L14_2.PlaySound
                  L15_2 = L6_2.Use
                  L15_2 = L6_2[L15_2]
                  L15_2 = L15_2.Slider
                  L15_2 = L15_2.audioName
                  L16_2 = L6_2.Use
                  L16_2 = L6_2[L16_2]
                  L16_2 = L16_2.Slider
                  L16_2 = L16_2.audioRef
                  L17_2 = true
                  L14_2(L15_2, L16_2, L17_2)
                end
                L14_2 = A3_2.onSliderChange
                if nil ~= L14_2 then
                  L14_2 = A3_2.onSliderChange
                  L15_2 = A1_2 / 10
                  L16_2 = A1_2
                  L14_2(L15_2, L16_2)
                end
            end
          end
          ::lbl_538::
          elseif L9_2 then
            L14_2 = L5_2.Controls
            L14_2 = L14_2.SliderRight
            L14_2 = L14_2.Active
            if not L14_2 then
              L14_2 = L5_2.Controls
              L14_2 = L14_2.Click
              L14_2 = L14_2.Active
              if not (L14_2 and L11_2) then
                goto lbl_592
              end
            end
            L14_2 = L5_2.Controls
            L14_2 = L14_2.SliderLeft
            L14_2 = L14_2.Active
            if not L14_2 then
              L14_2 = L5_2.Controls
              L14_2 = L14_2.Click
              L14_2 = L14_2.Active
              if not L14_2 or not L10_2 then
                A1_2 = A1_2 + L8_2
                L14_2 = L2_1
                L14_2 = #L14_2
                if A1_2 > L14_2 then
                  A1_2 = 10
                else
                  L14_2 = RageUI
                  L14_2 = L14_2.PlaySound
                  L15_2 = L6_2.Use
                  L15_2 = L6_2[L15_2]
                  L15_2 = L15_2.Slider
                  L15_2 = L15_2.audioName
                  L16_2 = L6_2.Use
                  L16_2 = L6_2[L16_2]
                  L16_2 = L16_2.Slider
                  L16_2 = L16_2.audioRef
                  L17_2 = true
                  L14_2(L15_2, L16_2, L17_2)
                end
                L14_2 = A3_2.onSliderChange
                if nil ~= L14_2 then
                  L14_2 = A3_2.onSliderChange
                  L15_2 = A1_2 / 10
                  L16_2 = A1_2
                  L14_2(L15_2, L16_2)
                end
              end
            end
          end
          ::lbl_592::
          if L9_2 then
            L14_2 = L5_2.Controls
            L14_2 = L14_2.Select
            L14_2 = L14_2.Active
            if not L14_2 then
              if not L12_2 then
                goto lbl_631
              end
              L14_2 = L5_2.Controls
              L14_2 = L14_2.Click
              L14_2 = L14_2.Active
              if not L14_2 or L10_2 or L11_2 then
                goto lbl_631
              end
            end
            L14_2 = A3_2.onSelected
            if nil ~= L14_2 then
              L14_2 = A3_2.onSelected
              L15_2 = A1_2 / 10
              L16_2 = A1_2
              L14_2(L15_2, L16_2)
            end
            L14_2 = RageUI
            L14_2 = L14_2.PlaySound
            L15_2 = L6_2.Use
            L15_2 = L6_2[L15_2]
            L15_2 = L15_2.Select
            L15_2 = L15_2.audioName
            L16_2 = L6_2.Use
            L16_2 = L6_2[L16_2]
            L16_2 = L16_2.Select
            L16_2 = L16_2.audioRef
            L17_2 = false
            L14_2(L15_2, L16_2, L17_2)
          ::lbl_631::
          elseif L9_2 then
            L14_2 = A3_2.onActive
            if nil ~= L14_2 then
              L14_2 = A3_2.onActive
              L14_2()
            end
          end
        end
      end
      L8_2 = RageUI
      L9_2 = RageUI
      L9_2 = L9_2.Options
      L9_2 = L9_2 + 1
      L8_2.Options = L9_2
    end
  end
end
L3_1.UISliderHeritage = L4_1
