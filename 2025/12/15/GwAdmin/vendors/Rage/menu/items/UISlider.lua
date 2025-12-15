local L0_1, L1_1, L2_1, L3_1
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
L1_1.Y = -2
L1_1.Width = 40
L1_1.Height = 40
L0_1.LeftBadge = L1_1
L1_1 = {}
L1_1.X = 385
L1_1.Y = -2
L1_1.Width = 40
L1_1.Height = 40
L0_1.RightBadge = L1_1
L1_1 = {}
L1_1.X = 420
L1_1.Y = 4
L1_1.Scale = 0.35
L0_1.RightText = L1_1
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
L2_1.Dictionary = "commonmenutu"
L2_1.Texture = "arrowleft"
L2_1.X = 235
L2_1.Y = 11.5
L2_1.Width = 15
L2_1.Height = 15
L1_1.LeftArrow = L2_1
L2_1 = {}
L2_1.Dictionary = "commonmenutu"
L2_1.Texture = "arrowright"
L2_1.X = 400
L2_1.Y = 11.5
L2_1.Width = 15
L2_1.Height = 15
L1_1.RightArrow = L2_1
L2_1 = RageUI
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)
  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2
  L8_2 = RageUI
  L8_2 = L8_2.CurrentMenu
  L9_2 = RageUI
  L9_2 = L9_2.Settings
  L9_2 = L9_2.Audio
  if nil ~= L8_2 then
    L10_2 = L8_2
    L10_2 = L10_2()
    if L10_2 then
      L10_2 = {}
      L11_2 = 1
      L12_2 = A2_2
      L13_2 = 1
      for L14_2 = L11_2, L12_2, L13_2 do
        L15_2 = table
        L15_2 = L15_2.insert
        L16_2 = L10_2
        L17_2 = L14_2
        L15_2(L16_2, L17_2)
      end
      L11_2 = RageUI
      L11_2 = L11_2.Options
      L11_2 = L11_2 + 1
      L12_2 = L8_2.Pagination
      L12_2 = L12_2.Minimum
      if L11_2 >= L12_2 then
        L12_2 = L8_2.Pagination
        L12_2 = L12_2.Maximum
        if L11_2 <= L12_2 then
          L12_2 = L8_2.Index
          L12_2 = L12_2 == L11_2
          L13_2 = false
          L14_2 = false
          L15_2 = RageUI
          L15_2 = L15_2.ItemsSafeZone
          L16_2 = L8_2
          L15_2(L16_2)
          L15_2 = false
          L16_2 = A5_2.LeftBadge
          L17_2 = RageUI
          L17_2 = L17_2.BadgeStyle
          L17_2 = L17_2.None
          if L16_2 ~= L17_2 then
            L16_2 = A5_2.LeftBadge
            if nil ~= L16_2 then
              goto lbl_60
            end
          end
          L16_2 = 0
          ::lbl_60::
          if not L16_2 then
            L16_2 = 27
          end
          L17_2 = A5_2.RightBadge
          L18_2 = RageUI
          L18_2 = L18_2.BadgeStyle
          L18_2 = L18_2.None
          if L17_2 ~= L18_2 then
            L17_2 = A5_2.RightBadge
            if nil ~= L17_2 then
              goto lbl_73
            end
          end
          L17_2 = 0
          ::lbl_73::
          if not L17_2 then
            L17_2 = 32
          end
          L18_2 = 0
          L19_2 = L8_2.EnableMouse
          if true == L19_2 then
            L19_2 = L8_2.CursorStyle
            if 0 == L19_2 then
              goto lbl_84
            end
          end
          L19_2 = L8_2.CursorStyle
          ::lbl_84::
          if 1 == L19_2 then
            L19_2 = RageUI
            L19_2 = L19_2.ItemsMouseBounds
            L20_2 = L8_2
            L21_2 = L12_2
            L22_2 = L11_2
            L23_2 = L0_1
            L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
            L15_2 = L19_2
          end
          if L12_2 then
            L19_2 = RenderSprite
            L20_2 = L0_1.SelectedSprite
            L20_2 = L20_2.Dictionary
            L21_2 = L0_1.SelectedSprite
            L21_2 = L21_2.Texture
            L22_2 = L8_2.X
            L23_2 = L8_2.Y
            L24_2 = L0_1.SelectedSprite
            L24_2 = L24_2.Y
            L23_2 = L23_2 + L24_2
            L24_2 = L8_2.SubtitleHeight
            L23_2 = L23_2 + L24_2
            L24_2 = RageUI
            L24_2 = L24_2.ItemOffset
            L23_2 = L23_2 + L24_2
            L24_2 = L0_1.SelectedSprite
            L24_2 = L24_2.Width
            L25_2 = L8_2.WidthOffset
            L24_2 = L24_2 + L25_2
            L25_2 = L0_1.SelectedSprite
            L25_2 = L25_2.Height
            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
            L19_2 = RageUI
            L19_2 = L19_2.IsMouseInBounds
            L20_2 = L8_2.X
            L21_2 = L1_1.LeftArrow
            L21_2 = L21_2.X
            L20_2 = L20_2 + L21_2
            L21_2 = L8_2.SafeZoneSize
            L21_2 = L21_2.X
            L20_2 = L20_2 + L21_2
            L21_2 = L8_2.WidthOffset
            L20_2 = L20_2 + L21_2
            L21_2 = L8_2.Y
            L22_2 = L1_1.LeftArrow
            L22_2 = L22_2.Y
            L21_2 = L21_2 + L22_2
            L22_2 = L8_2.SafeZoneSize
            L22_2 = L22_2.Y
            L21_2 = L21_2 + L22_2
            L22_2 = L8_2.SubtitleHeight
            L21_2 = L21_2 + L22_2
            L22_2 = RageUI
            L22_2 = L22_2.ItemOffset
            L21_2 = L21_2 + L22_2
            L22_2 = L1_1.LeftArrow
            L22_2 = L22_2.Width
            L23_2 = L1_1.LeftArrow
            L23_2 = L23_2.Height
            L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
            L13_2 = L19_2
            L19_2 = RageUI
            L19_2 = L19_2.IsMouseInBounds
            L20_2 = L8_2.X
            L21_2 = L1_1.RightArrow
            L21_2 = L21_2.X
            L20_2 = L20_2 + L21_2
            L21_2 = L8_2.SafeZoneSize
            L21_2 = L21_2.X
            L20_2 = L20_2 + L21_2
            L21_2 = L8_2.WidthOffset
            L20_2 = L20_2 + L21_2
            L21_2 = L8_2.Y
            L22_2 = L1_1.RightArrow
            L22_2 = L22_2.Y
            L21_2 = L21_2 + L22_2
            L22_2 = L8_2.SafeZoneSize
            L22_2 = L22_2.Y
            L21_2 = L21_2 + L22_2
            L22_2 = L8_2.SubtitleHeight
            L21_2 = L21_2 + L22_2
            L22_2 = RageUI
            L22_2 = L22_2.ItemOffset
            L21_2 = L21_2 + L22_2
            L22_2 = L1_1.RightArrow
            L22_2 = L22_2.Width
            L23_2 = L1_1.RightArrow
            L23_2 = L23_2.Height
            L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
            L14_2 = L19_2
          end
          if true == A6_2 or nil == A6_2 then
            if L12_2 then
              L19_2 = A5_2.RightLabel
              if nil ~= L19_2 then
                L19_2 = A5_2.RightLabel
                if "" ~= L19_2 then
                  L19_2 = RenderText
                  L20_2 = A5_2.RightLabel
                  L21_2 = L8_2.X
                  L22_2 = L0_1.RightText
                  L22_2 = L22_2.X
                  L21_2 = L21_2 + L22_2
                  L21_2 = L21_2 - L17_2
                  L22_2 = L8_2.WidthOffset
                  L21_2 = L21_2 + L22_2
                  L22_2 = L8_2.Y
                  L23_2 = L0_1.RightText
                  L23_2 = L23_2.Y
                  L22_2 = L22_2 + L23_2
                  L23_2 = L8_2.SubtitleHeight
                  L22_2 = L22_2 + L23_2
                  L23_2 = RageUI
                  L23_2 = L23_2.ItemOffset
                  L22_2 = L22_2 + L23_2
                  L23_2 = 0
                  L24_2 = L0_1.RightText
                  L24_2 = L24_2.Scale
                  L25_2 = 0
                  L26_2 = 0
                  L27_2 = 0
                  L28_2 = 255
                  L29_2 = 2
                  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
                  L19_2 = MeasureStringWidth
                  L20_2 = A5_2.RightLabel
                  L21_2 = 0
                  L22_2 = 0.35
                  L19_2 = L19_2(L20_2, L21_2, L22_2)
                  L18_2 = L19_2
                end
              end
            else
              L19_2 = A5_2.RightLabel
              if nil ~= L19_2 then
                L19_2 = A5_2.RightLabel
                if "" ~= L19_2 then
                  L19_2 = MeasureStringWidth
                  L20_2 = A5_2.RightLabel
                  L21_2 = 0
                  L22_2 = 0.35
                  L19_2 = L19_2(L20_2, L21_2, L22_2)
                  L18_2 = L19_2
                  L19_2 = RenderText
                  L20_2 = A5_2.RightLabel
                  L21_2 = L8_2.X
                  L22_2 = L0_1.RightText
                  L22_2 = L22_2.X
                  L21_2 = L21_2 + L22_2
                  L21_2 = L21_2 - L17_2
                  L22_2 = L8_2.WidthOffset
                  L21_2 = L21_2 + L22_2
                  L22_2 = L8_2.Y
                  L23_2 = L0_1.RightText
                  L23_2 = L23_2.Y
                  L22_2 = L22_2 + L23_2
                  L23_2 = L8_2.SubtitleHeight
                  L22_2 = L22_2 + L23_2
                  L23_2 = RageUI
                  L23_2 = L23_2.ItemOffset
                  L22_2 = L22_2 + L23_2
                  L23_2 = 0
                  L24_2 = L0_1.RightText
                  L24_2 = L24_2.Scale
                  L25_2 = 245
                  L26_2 = 245
                  L27_2 = 245
                  L28_2 = 255
                  L29_2 = 2
                  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
                end
              end
            end
          end
          L18_2 = L18_2 + L17_2
          if true == A6_2 or nil == A6_2 then
            if L12_2 then
              L19_2 = RenderText
              L20_2 = A0_2
              L21_2 = L8_2.X
              L22_2 = L0_1.Text
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 + L16_2
              L22_2 = L8_2.Y
              L23_2 = L0_1.Text
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L8_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = 0
              L24_2 = L0_1.Text
              L24_2 = L24_2.Scale
              L25_2 = 0
              L26_2 = 0
              L27_2 = 0
              L28_2 = 255
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
              L19_2 = RenderSprite
              L20_2 = L1_1.LeftArrow
              L20_2 = L20_2.Dictionary
              L21_2 = L1_1.LeftArrow
              L21_2 = L21_2.Texture
              L22_2 = L8_2.X
              L23_2 = L1_1.LeftArrow
              L23_2 = L23_2.X
              L22_2 = L22_2 + L23_2
              L23_2 = L8_2.WidthOffset
              L22_2 = L22_2 + L23_2
              L22_2 = L22_2 - L18_2
              L23_2 = L8_2.Y
              L24_2 = L1_1.LeftArrow
              L24_2 = L24_2.Y
              L23_2 = L23_2 + L24_2
              L24_2 = L8_2.SubtitleHeight
              L23_2 = L23_2 + L24_2
              L24_2 = RageUI
              L24_2 = L24_2.ItemOffset
              L23_2 = L23_2 + L24_2
              L24_2 = L1_1.LeftArrow
              L24_2 = L24_2.Width
              L25_2 = L1_1.LeftArrow
              L25_2 = L25_2.Height
              L26_2 = 0
              L27_2 = 0
              L28_2 = 0
              L29_2 = 0
              L30_2 = 255
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
              L19_2 = RenderSprite
              L20_2 = L1_1.RightArrow
              L20_2 = L20_2.Dictionary
              L21_2 = L1_1.RightArrow
              L21_2 = L21_2.Texture
              L22_2 = L8_2.X
              L23_2 = L1_1.RightArrow
              L23_2 = L23_2.X
              L22_2 = L22_2 + L23_2
              L23_2 = L8_2.WidthOffset
              L22_2 = L22_2 + L23_2
              L22_2 = L22_2 - L18_2
              L23_2 = L8_2.Y
              L24_2 = L1_1.RightArrow
              L24_2 = L24_2.Y
              L23_2 = L23_2 + L24_2
              L24_2 = L8_2.SubtitleHeight
              L23_2 = L23_2 + L24_2
              L24_2 = RageUI
              L24_2 = L24_2.ItemOffset
              L23_2 = L23_2 + L24_2
              L24_2 = L1_1.RightArrow
              L24_2 = L24_2.Width
              L25_2 = L1_1.RightArrow
              L25_2 = L25_2.Height
              L26_2 = 0
              L27_2 = 0
              L28_2 = 0
              L29_2 = 0
              L30_2 = 255
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
            else
              L19_2 = RenderText
              L20_2 = A0_2
              L21_2 = L8_2.X
              L22_2 = L0_1.Text
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 + L16_2
              L22_2 = L8_2.Y
              L23_2 = L0_1.Text
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L8_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = 0
              L24_2 = L0_1.Text
              L24_2 = L24_2.Scale
              L25_2 = 245
              L26_2 = 245
              L27_2 = 245
              L28_2 = 255
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
            end
          else
            L19_2 = RenderText
            L20_2 = A0_2
            L21_2 = L8_2.X
            L22_2 = L0_1.Text
            L22_2 = L22_2.X
            L21_2 = L21_2 + L22_2
            L21_2 = L21_2 + L16_2
            L22_2 = L8_2.Y
            L23_2 = L0_1.Text
            L23_2 = L23_2.Y
            L22_2 = L22_2 + L23_2
            L23_2 = L8_2.SubtitleHeight
            L22_2 = L22_2 + L23_2
            L23_2 = RageUI
            L23_2 = L23_2.ItemOffset
            L22_2 = L22_2 + L23_2
            L23_2 = 0
            L24_2 = L0_1.Text
            L24_2 = L24_2.Scale
            L25_2 = 163
            L26_2 = 159
            L27_2 = 148
            L28_2 = 255
            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
            if L12_2 then
              L19_2 = RenderSprite
              L20_2 = L1_1.LeftArrow
              L20_2 = L20_2.Dictionary
              L21_2 = L1_1.LeftArrow
              L21_2 = L21_2.Texture
              L22_2 = L8_2.X
              L23_2 = L1_1.LeftArrow
              L23_2 = L23_2.X
              L22_2 = L22_2 + L23_2
              L23_2 = L8_2.WidthOffset
              L22_2 = L22_2 + L23_2
              L22_2 = L22_2 - L18_2
              L23_2 = L8_2.Y
              L24_2 = L1_1.LeftArrow
              L24_2 = L24_2.Y
              L23_2 = L23_2 + L24_2
              L24_2 = L8_2.SubtitleHeight
              L23_2 = L23_2 + L24_2
              L24_2 = RageUI
              L24_2 = L24_2.ItemOffset
              L23_2 = L23_2 + L24_2
              L24_2 = L1_1.LeftArrow
              L24_2 = L24_2.Width
              L25_2 = L1_1.LeftArrow
              L25_2 = L25_2.Height
              L26_2 = 163
              L27_2 = 159
              L28_2 = 148
              L29_2 = 255
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
              L19_2 = RenderSprite
              L20_2 = L1_1.RightArrow
              L20_2 = L20_2.Dictionary
              L21_2 = L1_1.RightArrow
              L21_2 = L21_2.Texture
              L22_2 = L8_2.X
              L23_2 = L1_1.RightArrow
              L23_2 = L23_2.X
              L22_2 = L22_2 + L23_2
              L23_2 = L8_2.WidthOffset
              L22_2 = L22_2 + L23_2
              L22_2 = L22_2 - L18_2
              L23_2 = L8_2.Y
              L24_2 = L1_1.RightArrow
              L24_2 = L24_2.Y
              L23_2 = L23_2 + L24_2
              L24_2 = L8_2.SubtitleHeight
              L23_2 = L23_2 + L24_2
              L24_2 = RageUI
              L24_2 = L24_2.ItemOffset
              L23_2 = L23_2 + L24_2
              L24_2 = L1_1.RightArrow
              L24_2 = L24_2.Width
              L25_2 = L1_1.RightArrow
              L25_2 = L25_2.Height
              L26_2 = 163
              L27_2 = 159
              L28_2 = 148
              L29_2 = 255
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
            end
          end
          L19_2 = type
          L20_2 = A5_2
          L19_2 = L19_2(L20_2)
          if "table" == L19_2 then
            L19_2 = A5_2.Enabled
            if true ~= L19_2 then
              L19_2 = A5_2.Enabled
              if nil ~= L19_2 then
                goto lbl_702
              end
            end
            L19_2 = type
            L20_2 = A5_2
            L19_2 = L19_2(L20_2)
            if "table" ~= L19_2 then
              goto lbl_767
            end
            L19_2 = A5_2.LeftBadge
            if nil ~= L19_2 then
              L19_2 = A5_2.LeftBadge
              L20_2 = RageUI
              L20_2 = L20_2.BadgeStyle
              L20_2 = L20_2.None
              if L19_2 ~= L20_2 then
                L19_2 = A5_2.LeftBadge
                L20_2 = L12_2
                L19_2 = L19_2(L20_2)
                L20_2 = RenderSprite
                L21_2 = L19_2.BadgeDictionary
                if not L21_2 then
                  L21_2 = "commonmenu"
                end
                L22_2 = L19_2.BadgeTexture
                if not L22_2 then
                  L22_2 = ""
                end
                L23_2 = L8_2.X
                L24_2 = L8_2.Y
                L25_2 = L0_1.LeftBadge
                L25_2 = L25_2.Y
                L24_2 = L24_2 + L25_2
                L25_2 = L8_2.SubtitleHeight
                L24_2 = L24_2 + L25_2
                L25_2 = RageUI
                L25_2 = L25_2.ItemOffset
                L24_2 = L24_2 + L25_2
                L25_2 = L0_1.LeftBadge
                L25_2 = L25_2.Width
                L26_2 = L0_1.LeftBadge
                L26_2 = L26_2.Height
                L27_2 = 0
                L28_2 = L19_2.BadgeColour
                if L28_2 then
                  L28_2 = L19_2.BadgeColour
                  L28_2 = L28_2.R
                  if L28_2 then
                    goto lbl_597
                  end
                end
                L28_2 = 255
                ::lbl_597::
                L29_2 = L19_2.BadgeColour
                if L29_2 then
                  L29_2 = L19_2.BadgeColour
                  L29_2 = L29_2.G
                  if L29_2 then
                    goto lbl_605
                  end
                end
                L29_2 = 255
                ::lbl_605::
                L30_2 = L19_2.BadgeColour
                if L30_2 then
                  L30_2 = L19_2.BadgeColour
                  L30_2 = L30_2.B
                  if L30_2 then
                    goto lbl_613
                  end
                end
                L30_2 = 255
                ::lbl_613::
                L31_2 = L19_2.BadgeColour
                if L31_2 then
                  L31_2 = L19_2.BadgeColour
                  L31_2 = L31_2.A
                  if L31_2 then
                    goto lbl_621
                  end
                end
                L31_2 = 255
                ::lbl_621::
                L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
              end
            end
            L19_2 = A5_2.RightBadge
            if nil == L19_2 then
              goto lbl_767
            end
            L19_2 = A5_2.RightBadge
            L20_2 = RageUI
            L20_2 = L20_2.BadgeStyle
            L20_2 = L20_2.None
            if L19_2 == L20_2 then
              goto lbl_767
            end
            L19_2 = A5_2.RightBadge
            L20_2 = L12_2
            L19_2 = L19_2(L20_2)
            L20_2 = RenderSprite
            L21_2 = L19_2.BadgeDictionary
            if not L21_2 then
              L21_2 = "commonmenu"
            end
            L22_2 = L19_2.BadgeTexture
            if not L22_2 then
              L22_2 = ""
            end
            L23_2 = L8_2.X
            L24_2 = L0_1.RightBadge
            L24_2 = L24_2.X
            L23_2 = L23_2 + L24_2
            L24_2 = L8_2.WidthOffset
            L23_2 = L23_2 + L24_2
            L24_2 = L8_2.Y
            L25_2 = L0_1.RightBadge
            L25_2 = L25_2.Y
            L24_2 = L24_2 + L25_2
            L25_2 = L8_2.SubtitleHeight
            L24_2 = L24_2 + L25_2
            L25_2 = RageUI
            L25_2 = L25_2.ItemOffset
            L24_2 = L24_2 + L25_2
            L25_2 = L0_1.RightBadge
            L25_2 = L25_2.Width
            L26_2 = L0_1.RightBadge
            L26_2 = L26_2.Height
            L27_2 = 0
            L28_2 = L19_2.BadgeColour
            if L28_2 then
              L28_2 = L19_2.BadgeColour
              L28_2 = L28_2.R
              if L28_2 then
                goto lbl_676
              end
            end
            L28_2 = 255
            ::lbl_676::
            L29_2 = L19_2.BadgeColour
            if L29_2 then
              L29_2 = L19_2.BadgeColour
              L29_2 = L29_2.G
              if L29_2 then
                goto lbl_684
              end
            end
            L29_2 = 255
            ::lbl_684::
            L30_2 = L19_2.BadgeColour
            if L30_2 then
              L30_2 = L19_2.BadgeColour
              L30_2 = L30_2.B
              if L30_2 then
                goto lbl_692
              end
            end
            L30_2 = 255
            ::lbl_692::
            L31_2 = L19_2.BadgeColour
            if L31_2 then
              L31_2 = L19_2.BadgeColour
              L31_2 = L31_2.A
              if L31_2 then
                goto lbl_700
              end
            end
            L31_2 = 255
            ::lbl_700::
            L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
            goto lbl_767
            ::lbl_702::
            L19_2 = RageUI
            L19_2 = L19_2.BadgeStyle
            L19_2 = L19_2.Lock
            L20_2 = RageUI
            L20_2 = L20_2.BadgeStyle
            L20_2 = L20_2.None
            if L19_2 ~= L20_2 and nil ~= L19_2 then
              L20_2 = L19_2
              L21_2 = L12_2
              L20_2 = L20_2(L21_2)
              L21_2 = RenderSprite
              L22_2 = L20_2.BadgeDictionary
              if not L22_2 then
                L22_2 = "commonmenu"
              end
              L23_2 = L20_2.BadgeTexture
              if not L23_2 then
                L23_2 = ""
              end
              L24_2 = L8_2.X
              L25_2 = L8_2.Y
              L26_2 = L0_1.LeftBadge
              L26_2 = L26_2.Y
              L25_2 = L25_2 + L26_2
              L26_2 = L8_2.SubtitleHeight
              L25_2 = L25_2 + L26_2
              L26_2 = RageUI
              L26_2 = L26_2.ItemOffset
              L25_2 = L25_2 + L26_2
              L26_2 = L0_1.LeftBadge
              L26_2 = L26_2.Width
              L27_2 = L0_1.LeftBadge
              L27_2 = L27_2.Height
              L28_2 = 0
              L29_2 = L20_2.BadgeColour
              L29_2 = L29_2.R
              if not L29_2 then
                L29_2 = 255
              end
              L30_2 = L20_2.BadgeColour
              L30_2 = L30_2.G
              if not L30_2 then
                L30_2 = 255
              end
              L31_2 = L20_2.BadgeColour
              L31_2 = L31_2.B
              if not L31_2 then
                L31_2 = 255
              end
              L32_2 = L20_2.BadgeColour
              L32_2 = L32_2.A
              if not L32_2 then
                L32_2 = 255
              end
              L21_2(L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2)
            end
          else
            L19_2 = error
            L20_2 = "UICheckBox Style is not a `table`"
            L19_2(L20_2)
          end
          ::lbl_767::
          L19_2 = RenderRectangle
          L20_2 = L8_2.X
          L21_2 = L1_1.Background
          L21_2 = L21_2.X
          L20_2 = L20_2 + L21_2
          L21_2 = L8_2.WidthOffset
          L20_2 = L20_2 + L21_2
          L20_2 = L20_2 - L18_2
          L21_2 = L8_2.Y
          L22_2 = L1_1.Background
          L22_2 = L22_2.Y
          L21_2 = L21_2 + L22_2
          L22_2 = L8_2.SubtitleHeight
          L21_2 = L21_2 + L22_2
          L22_2 = RageUI
          L22_2 = L22_2.ItemOffset
          L21_2 = L21_2 + L22_2
          L22_2 = L1_1.Background
          L22_2 = L22_2.Width
          L23_2 = L1_1.Background
          L23_2 = L23_2.Height
          L24_2 = 4
          L25_2 = 32
          L26_2 = 57
          L27_2 = 255
          L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
          L19_2 = RenderRectangle
          L20_2 = L8_2.X
          L21_2 = L1_1.Slider
          L21_2 = L21_2.X
          L20_2 = L20_2 + L21_2
          L21_2 = L1_1.Background
          L21_2 = L21_2.Width
          L22_2 = L1_1.Slider
          L22_2 = L22_2.Width
          L21_2 = L21_2 - L22_2
          L22_2 = #L10_2
          L22_2 = L22_2 - 1
          L21_2 = L21_2 / L22_2
          L22_2 = A1_2 - 1
          L21_2 = L21_2 * L22_2
          L20_2 = L20_2 + L21_2
          L21_2 = L8_2.WidthOffset
          L20_2 = L20_2 + L21_2
          L20_2 = L20_2 - L18_2
          L21_2 = L8_2.Y
          L22_2 = L1_1.Slider
          L22_2 = L22_2.Y
          L21_2 = L21_2 + L22_2
          L22_2 = L8_2.SubtitleHeight
          L21_2 = L21_2 + L22_2
          L22_2 = RageUI
          L22_2 = L22_2.ItemOffset
          L21_2 = L21_2 + L22_2
          L22_2 = L1_1.Slider
          L22_2 = L22_2.Width
          L23_2 = L1_1.Slider
          L23_2 = L23_2.Height
          L24_2 = 57
          L25_2 = 116
          L26_2 = 200
          L27_2 = 255
          L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
          if A4_2 then
            L19_2 = RenderRectangle
            L20_2 = L8_2.X
            L21_2 = L1_1.Divider
            L21_2 = L21_2.X
            L20_2 = L20_2 + L21_2
            L21_2 = L8_2.WidthOffset
            L20_2 = L20_2 + L21_2
            L21_2 = L8_2.Y
            L22_2 = L1_1.Divider
            L22_2 = L22_2.Y
            L21_2 = L21_2 + L22_2
            L22_2 = L8_2.SubtitleHeight
            L21_2 = L21_2 + L22_2
            L22_2 = RageUI
            L22_2 = L22_2.ItemOffset
            L21_2 = L21_2 + L22_2
            L22_2 = L1_1.Divider
            L22_2 = L22_2.Width
            L23_2 = L1_1.Divider
            L23_2 = L23_2.Height
            L24_2 = 245
            L25_2 = 245
            L26_2 = 245
            L27_2 = 255
            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
          end
          L19_2 = RageUI
          L20_2 = RageUI
          L20_2 = L20_2.ItemOffset
          L21_2 = L0_1.Rectangle
          L21_2 = L21_2.Height
          L20_2 = L20_2 + L21_2
          L19_2.ItemOffset = L20_2
          L19_2 = RageUI
          L19_2 = L19_2.ItemsDescription
          L20_2 = L8_2
          L21_2 = A3_2
          L22_2 = L12_2
          L19_2(L20_2, L21_2, L22_2)
          if L12_2 then
            L19_2 = L8_2.Controls
            L19_2 = L19_2.Left
            L19_2 = L19_2.Active
            if not L19_2 then
              L19_2 = L8_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not (L19_2 and L13_2) then
                goto lbl_943
              end
            end
            L19_2 = L8_2.Controls
            L19_2 = L19_2.Right
            L19_2 = L19_2.Active
            if not L19_2 then
              L19_2 = L8_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not L19_2 or not L14_2 then
                A1_2 = A1_2 - 1
                if A1_2 < 1 then
                  A1_2 = #L10_2
                end
                L19_2 = A7_2.onSliderChange
                if nil ~= L19_2 then
                  L19_2 = A7_2.onSliderChange
                  L20_2 = A1_2
                  L19_2(L20_2)
                end
                L19_2 = RageUI
                L19_2 = L19_2.PlaySound
                L20_2 = L9_2.Use
                L20_2 = L9_2[L20_2]
                L20_2 = L20_2.LeftRight
                L20_2 = L20_2.audioName
                L21_2 = L9_2.Use
                L21_2 = L9_2[L21_2]
                L21_2 = L21_2.LeftRight
                L21_2 = L21_2.audioRef
                L19_2(L20_2, L21_2)
            end
          end
          ::lbl_943::
          elseif L12_2 then
            L19_2 = L8_2.Controls
            L19_2 = L19_2.Right
            L19_2 = L19_2.Active
            if not L19_2 then
              L19_2 = L8_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not (L19_2 and L14_2) then
                goto lbl_992
              end
            end
            L19_2 = L8_2.Controls
            L19_2 = L19_2.Left
            L19_2 = L19_2.Active
            if not L19_2 then
              L19_2 = L8_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not L19_2 or not L13_2 then
                A1_2 = A1_2 + 1
                L19_2 = #L10_2
                if A1_2 > L19_2 then
                  A1_2 = 1
                end
                L19_2 = A7_2.onSliderChange
                if nil ~= L19_2 then
                  L19_2 = A7_2.onSliderChange
                  L20_2 = A1_2
                  L19_2(L20_2)
                end
                L19_2 = RageUI
                L19_2 = L19_2.PlaySound
                L20_2 = L9_2.Use
                L20_2 = L9_2[L20_2]
                L20_2 = L20_2.LeftRight
                L20_2 = L20_2.audioName
                L21_2 = L9_2.Use
                L21_2 = L9_2[L21_2]
                L21_2 = L21_2.LeftRight
                L21_2 = L21_2.audioRef
                L19_2(L20_2, L21_2)
              end
            end
          end
          ::lbl_992::
          if L12_2 then
            L19_2 = L8_2.Controls
            L19_2 = L19_2.Select
            L19_2 = L19_2.Active
            if not L19_2 then
              if not L15_2 then
                goto lbl_1028
              end
              L19_2 = L8_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not L19_2 or L13_2 or L14_2 then
                goto lbl_1028
              end
            end
            L19_2 = A7_2.onSelected
            if nil ~= L19_2 then
              L19_2 = A7_2.onSelected
              L20_2 = A1_2
              L19_2(L20_2)
            end
            L19_2 = RageUI
            L19_2 = L19_2.PlaySound
            L20_2 = L9_2.Use
            L20_2 = L9_2[L20_2]
            L20_2 = L20_2.Select
            L20_2 = L20_2.audioName
            L21_2 = L9_2.Use
            L21_2 = L9_2[L21_2]
            L21_2 = L21_2.Select
            L21_2 = L21_2.audioRef
            L19_2(L20_2, L21_2)
          ::lbl_1028::
          elseif L12_2 then
            L19_2 = A7_2.onActive
            if nil ~= L19_2 then
              L19_2 = A7_2.onActive
              L19_2()
            end
          end
        end
      end
      L12_2 = RageUI
      L13_2 = RageUI
      L13_2 = L13_2.Options
      L13_2 = L13_2 + 1
      L12_2.Options = L13_2
    end
  end
end
L2_1.Slider = L3_1
