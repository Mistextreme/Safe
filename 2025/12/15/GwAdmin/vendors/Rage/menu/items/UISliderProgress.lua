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
L2_1.Width = 150
L2_1.Height = 9
L1_1.Slider = L2_1
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
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L7_2 = RageUI
  L7_2 = L7_2.CurrentMenu
  L8_2 = RageUI
  L8_2 = L8_2.Settings
  L8_2 = L8_2.Audio
  if nil ~= L7_2 then
    L9_2 = L7_2
    L9_2 = L9_2()
    if L9_2 then
      L9_2 = {}
      L10_2 = 1
      L11_2 = A2_2
      L12_2 = 1
      for L13_2 = L10_2, L11_2, L12_2 do
        L14_2 = table
        L14_2 = L14_2.insert
        L15_2 = L9_2
        L16_2 = L13_2
        L14_2(L15_2, L16_2)
      end
      L10_2 = RageUI
      L10_2 = L10_2.Options
      L10_2 = L10_2 + 1
      L11_2 = L7_2.Pagination
      L11_2 = L11_2.Minimum
      if L10_2 >= L11_2 then
        L11_2 = L7_2.Pagination
        L11_2 = L11_2.Maximum
        if L10_2 <= L11_2 then
          L11_2 = L7_2.Index
          L11_2 = L11_2 == L10_2
          L12_2 = false
          L13_2 = false
          L14_2 = RageUI
          L14_2 = L14_2.ItemsSafeZone
          L15_2 = L7_2
          L14_2(L15_2)
          L14_2 = false
          L15_2 = A4_2.LeftBadge
          L16_2 = RageUI
          L16_2 = L16_2.BadgeStyle
          L16_2 = L16_2.None
          if L15_2 ~= L16_2 then
            L15_2 = A4_2.LeftBadge
            if nil ~= L15_2 then
              goto lbl_60
            end
          end
          L15_2 = 0
          ::lbl_60::
          if not L15_2 then
            L15_2 = 27
          end
          L16_2 = A4_2.RightBadge
          L17_2 = RageUI
          L17_2 = L17_2.BadgeStyle
          L17_2 = L17_2.None
          if L16_2 ~= L17_2 then
            L16_2 = A4_2.RightBadge
            if nil ~= L16_2 then
              goto lbl_73
            end
          end
          L16_2 = 0
          ::lbl_73::
          if not L16_2 then
            L16_2 = 32
          end
          L17_2 = 0
          L18_2 = L7_2.EnableMouse
          if true == L18_2 then
            L18_2 = L7_2.CursorStyle
            if 0 == L18_2 then
              goto lbl_84
            end
          end
          L18_2 = L7_2.CursorStyle
          ::lbl_84::
          if 1 == L18_2 then
            L18_2 = RageUI
            L18_2 = L18_2.ItemsMouseBounds
            L19_2 = L7_2
            L20_2 = L11_2
            L21_2 = L10_2
            L22_2 = L0_1
            L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
            L14_2 = L18_2
          end
          if L11_2 then
            L18_2 = RenderSprite
            L19_2 = L0_1.SelectedSprite
            L19_2 = L19_2.Dictionary
            L20_2 = L0_1.SelectedSprite
            L20_2 = L20_2.Texture
            L21_2 = L7_2.X
            L22_2 = L7_2.Y
            L23_2 = L0_1.SelectedSprite
            L23_2 = L23_2.Y
            L22_2 = L22_2 + L23_2
            L23_2 = L7_2.SubtitleHeight
            L22_2 = L22_2 + L23_2
            L23_2 = RageUI
            L23_2 = L23_2.ItemOffset
            L22_2 = L22_2 + L23_2
            L23_2 = L0_1.SelectedSprite
            L23_2 = L23_2.Width
            L24_2 = L7_2.WidthOffset
            L23_2 = L23_2 + L24_2
            L24_2 = L0_1.SelectedSprite
            L24_2 = L24_2.Height
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
            L18_2 = RageUI
            L18_2 = L18_2.IsMouseInBounds
            L19_2 = L7_2.X
            L20_2 = L1_1.LeftArrow
            L20_2 = L20_2.X
            L19_2 = L19_2 + L20_2
            L20_2 = L7_2.SafeZoneSize
            L20_2 = L20_2.X
            L19_2 = L19_2 + L20_2
            L20_2 = L7_2.WidthOffset
            L19_2 = L19_2 + L20_2
            L20_2 = L7_2.Y
            L21_2 = L1_1.LeftArrow
            L21_2 = L21_2.Y
            L20_2 = L20_2 + L21_2
            L21_2 = L7_2.SafeZoneSize
            L21_2 = L21_2.Y
            L20_2 = L20_2 + L21_2
            L21_2 = L7_2.SubtitleHeight
            L20_2 = L20_2 + L21_2
            L21_2 = RageUI
            L21_2 = L21_2.ItemOffset
            L20_2 = L20_2 + L21_2
            L21_2 = L1_1.LeftArrow
            L21_2 = L21_2.Width
            L22_2 = L1_1.LeftArrow
            L22_2 = L22_2.Height
            L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
            L12_2 = L18_2
            L18_2 = RageUI
            L18_2 = L18_2.IsMouseInBounds
            L19_2 = L7_2.X
            L20_2 = L1_1.RightArrow
            L20_2 = L20_2.X
            L19_2 = L19_2 + L20_2
            L20_2 = L7_2.SafeZoneSize
            L20_2 = L20_2.X
            L19_2 = L19_2 + L20_2
            L20_2 = L7_2.WidthOffset
            L19_2 = L19_2 + L20_2
            L20_2 = L7_2.Y
            L21_2 = L1_1.RightArrow
            L21_2 = L21_2.Y
            L20_2 = L20_2 + L21_2
            L21_2 = L7_2.SafeZoneSize
            L21_2 = L21_2.Y
            L20_2 = L20_2 + L21_2
            L21_2 = L7_2.SubtitleHeight
            L20_2 = L20_2 + L21_2
            L21_2 = RageUI
            L21_2 = L21_2.ItemOffset
            L20_2 = L20_2 + L21_2
            L21_2 = L1_1.RightArrow
            L21_2 = L21_2.Width
            L22_2 = L1_1.RightArrow
            L22_2 = L22_2.Height
            L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
            L13_2 = L18_2
          end
          if true == A5_2 or nil == A5_2 then
            if L11_2 then
              L18_2 = A4_2.RightLabel
              if nil ~= L18_2 then
                L18_2 = A4_2.RightLabel
                if "" ~= L18_2 then
                  L18_2 = RenderText
                  L19_2 = A4_2.RightLabel
                  L20_2 = L7_2.X
                  L21_2 = L0_1.RightText
                  L21_2 = L21_2.X
                  L20_2 = L20_2 + L21_2
                  L20_2 = L20_2 - L16_2
                  L21_2 = L7_2.WidthOffset
                  L20_2 = L20_2 + L21_2
                  L21_2 = L7_2.Y
                  L22_2 = L0_1.RightText
                  L22_2 = L22_2.Y
                  L21_2 = L21_2 + L22_2
                  L22_2 = L7_2.SubtitleHeight
                  L21_2 = L21_2 + L22_2
                  L22_2 = RageUI
                  L22_2 = L22_2.ItemOffset
                  L21_2 = L21_2 + L22_2
                  L22_2 = 0
                  L23_2 = L0_1.RightText
                  L23_2 = L23_2.Scale
                  L24_2 = 0
                  L25_2 = 0
                  L26_2 = 0
                  L27_2 = 255
                  L28_2 = 2
                  L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                  L18_2 = MeasureStringWidth
                  L19_2 = A4_2.RightLabel
                  L20_2 = 0
                  L21_2 = 0.35
                  L18_2 = L18_2(L19_2, L20_2, L21_2)
                  L17_2 = L18_2
                end
              end
            else
              L18_2 = A4_2.RightLabel
              if nil ~= L18_2 then
                L18_2 = A4_2.RightLabel
                if "" ~= L18_2 then
                  L18_2 = MeasureStringWidth
                  L19_2 = A4_2.RightLabel
                  L20_2 = 0
                  L21_2 = 0.35
                  L18_2 = L18_2(L19_2, L20_2, L21_2)
                  L17_2 = L18_2
                  L18_2 = RenderText
                  L19_2 = A4_2.RightLabel
                  L20_2 = L7_2.X
                  L21_2 = L0_1.RightText
                  L21_2 = L21_2.X
                  L20_2 = L20_2 + L21_2
                  L20_2 = L20_2 - L16_2
                  L21_2 = L7_2.WidthOffset
                  L20_2 = L20_2 + L21_2
                  L21_2 = L7_2.Y
                  L22_2 = L0_1.RightText
                  L22_2 = L22_2.Y
                  L21_2 = L21_2 + L22_2
                  L22_2 = L7_2.SubtitleHeight
                  L21_2 = L21_2 + L22_2
                  L22_2 = RageUI
                  L22_2 = L22_2.ItemOffset
                  L21_2 = L21_2 + L22_2
                  L22_2 = 0
                  L23_2 = L0_1.RightText
                  L23_2 = L23_2.Scale
                  L24_2 = 245
                  L25_2 = 245
                  L26_2 = 245
                  L27_2 = 255
                  L28_2 = 2
                  L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                end
              end
            end
          end
          L17_2 = L17_2 + L16_2
          if true == A5_2 or nil == A5_2 then
            if L11_2 then
              L18_2 = RenderText
              L19_2 = A0_2
              L20_2 = L7_2.X
              L21_2 = L0_1.Text
              L21_2 = L21_2.X
              L20_2 = L20_2 + L21_2
              L20_2 = L20_2 + L15_2
              L21_2 = L7_2.Y
              L22_2 = L0_1.Text
              L22_2 = L22_2.Y
              L21_2 = L21_2 + L22_2
              L22_2 = L7_2.SubtitleHeight
              L21_2 = L21_2 + L22_2
              L22_2 = RageUI
              L22_2 = L22_2.ItemOffset
              L21_2 = L21_2 + L22_2
              L22_2 = 0
              L23_2 = L0_1.Text
              L23_2 = L23_2.Scale
              L24_2 = 0
              L25_2 = 0
              L26_2 = 0
              L27_2 = 255
              L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
              L18_2 = RenderSprite
              L19_2 = L1_1.LeftArrow
              L19_2 = L19_2.Dictionary
              L20_2 = L1_1.LeftArrow
              L20_2 = L20_2.Texture
              L21_2 = L7_2.X
              L22_2 = L1_1.LeftArrow
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L22_2 = L7_2.WidthOffset
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 - L17_2
              L22_2 = L7_2.Y
              L23_2 = L1_1.LeftArrow
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L7_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = L1_1.LeftArrow
              L23_2 = L23_2.Width
              L24_2 = L1_1.LeftArrow
              L24_2 = L24_2.Height
              L25_2 = 0
              L26_2 = 0
              L27_2 = 0
              L28_2 = 0
              L29_2 = 255
              L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
              L18_2 = RenderSprite
              L19_2 = L1_1.RightArrow
              L19_2 = L19_2.Dictionary
              L20_2 = L1_1.RightArrow
              L20_2 = L20_2.Texture
              L21_2 = L7_2.X
              L22_2 = L1_1.RightArrow
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L22_2 = L7_2.WidthOffset
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 - L17_2
              L22_2 = L7_2.Y
              L23_2 = L1_1.RightArrow
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L7_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = L1_1.RightArrow
              L23_2 = L23_2.Width
              L24_2 = L1_1.RightArrow
              L24_2 = L24_2.Height
              L25_2 = 0
              L26_2 = 0
              L27_2 = 0
              L28_2 = 0
              L29_2 = 255
              L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
            else
              L18_2 = RenderText
              L19_2 = A0_2
              L20_2 = L7_2.X
              L21_2 = L0_1.Text
              L21_2 = L21_2.X
              L20_2 = L20_2 + L21_2
              L20_2 = L20_2 + L15_2
              L21_2 = L7_2.Y
              L22_2 = L0_1.Text
              L22_2 = L22_2.Y
              L21_2 = L21_2 + L22_2
              L22_2 = L7_2.SubtitleHeight
              L21_2 = L21_2 + L22_2
              L22_2 = RageUI
              L22_2 = L22_2.ItemOffset
              L21_2 = L21_2 + L22_2
              L22_2 = 0
              L23_2 = L0_1.Text
              L23_2 = L23_2.Scale
              L24_2 = 245
              L25_2 = 245
              L26_2 = 245
              L27_2 = 255
              L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
            end
          else
            L18_2 = RenderText
            L19_2 = A0_2
            L20_2 = L7_2.X
            L21_2 = L0_1.Text
            L21_2 = L21_2.X
            L20_2 = L20_2 + L21_2
            L20_2 = L20_2 + L15_2
            L21_2 = L7_2.Y
            L22_2 = L0_1.Text
            L22_2 = L22_2.Y
            L21_2 = L21_2 + L22_2
            L22_2 = L7_2.SubtitleHeight
            L21_2 = L21_2 + L22_2
            L22_2 = RageUI
            L22_2 = L22_2.ItemOffset
            L21_2 = L21_2 + L22_2
            L22_2 = 0
            L23_2 = L0_1.Text
            L23_2 = L23_2.Scale
            L24_2 = 163
            L25_2 = 159
            L26_2 = 148
            L27_2 = 255
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
            if L11_2 then
              L18_2 = RenderSprite
              L19_2 = L1_1.LeftArrow
              L19_2 = L19_2.Dictionary
              L20_2 = L1_1.LeftArrow
              L20_2 = L20_2.Texture
              L21_2 = L7_2.X
              L22_2 = L1_1.LeftArrow
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L22_2 = L7_2.WidthOffset
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 - L17_2
              L22_2 = L7_2.Y
              L23_2 = L1_1.LeftArrow
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L7_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = L1_1.LeftArrow
              L23_2 = L23_2.Width
              L24_2 = L1_1.LeftArrow
              L24_2 = L24_2.Height
              L25_2 = 163
              L26_2 = 159
              L27_2 = 148
              L28_2 = 255
              L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
              L18_2 = RenderSprite
              L19_2 = L1_1.RightArrow
              L19_2 = L19_2.Dictionary
              L20_2 = L1_1.RightArrow
              L20_2 = L20_2.Texture
              L21_2 = L7_2.X
              L22_2 = L1_1.RightArrow
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L22_2 = L7_2.WidthOffset
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 - L17_2
              L22_2 = L7_2.Y
              L23_2 = L1_1.RightArrow
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L7_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = L1_1.RightArrow
              L23_2 = L23_2.Width
              L24_2 = L1_1.RightArrow
              L24_2 = L24_2.Height
              L25_2 = 163
              L26_2 = 159
              L27_2 = 148
              L28_2 = 255
              L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
            end
          end
          L18_2 = type
          L19_2 = A4_2
          L18_2 = L18_2(L19_2)
          if "table" == L18_2 then
            L18_2 = A4_2.Enabled
            if true ~= L18_2 then
              L18_2 = A4_2.Enabled
              if nil ~= L18_2 then
                goto lbl_702
              end
            end
            L18_2 = type
            L19_2 = A4_2
            L18_2 = L18_2(L19_2)
            if "table" ~= L18_2 then
              goto lbl_767
            end
            L18_2 = A4_2.LeftBadge
            if nil ~= L18_2 then
              L18_2 = A4_2.LeftBadge
              L19_2 = RageUI
              L19_2 = L19_2.BadgeStyle
              L19_2 = L19_2.None
              if L18_2 ~= L19_2 then
                L18_2 = A4_2.LeftBadge
                L19_2 = L11_2
                L18_2 = L18_2(L19_2)
                L19_2 = RenderSprite
                L20_2 = L18_2.BadgeDictionary
                if not L20_2 then
                  L20_2 = "commonmenu"
                end
                L21_2 = L18_2.BadgeTexture
                if not L21_2 then
                  L21_2 = ""
                end
                L22_2 = L7_2.X
                L23_2 = L7_2.Y
                L24_2 = L0_1.LeftBadge
                L24_2 = L24_2.Y
                L23_2 = L23_2 + L24_2
                L24_2 = L7_2.SubtitleHeight
                L23_2 = L23_2 + L24_2
                L24_2 = RageUI
                L24_2 = L24_2.ItemOffset
                L23_2 = L23_2 + L24_2
                L24_2 = L0_1.LeftBadge
                L24_2 = L24_2.Width
                L25_2 = L0_1.LeftBadge
                L25_2 = L25_2.Height
                L26_2 = 0
                L27_2 = L18_2.BadgeColour
                if L27_2 then
                  L27_2 = L18_2.BadgeColour
                  L27_2 = L27_2.R
                  if L27_2 then
                    goto lbl_597
                  end
                end
                L27_2 = 255
                ::lbl_597::
                L28_2 = L18_2.BadgeColour
                if L28_2 then
                  L28_2 = L18_2.BadgeColour
                  L28_2 = L28_2.G
                  if L28_2 then
                    goto lbl_605
                  end
                end
                L28_2 = 255
                ::lbl_605::
                L29_2 = L18_2.BadgeColour
                if L29_2 then
                  L29_2 = L18_2.BadgeColour
                  L29_2 = L29_2.B
                  if L29_2 then
                    goto lbl_613
                  end
                end
                L29_2 = 255
                ::lbl_613::
                L30_2 = L18_2.BadgeColour
                if L30_2 then
                  L30_2 = L18_2.BadgeColour
                  L30_2 = L30_2.A
                  if L30_2 then
                    goto lbl_621
                  end
                end
                L30_2 = 255
                ::lbl_621::
                L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
              end
            end
            L18_2 = A4_2.RightBadge
            if nil == L18_2 then
              goto lbl_767
            end
            L18_2 = A4_2.RightBadge
            L19_2 = RageUI
            L19_2 = L19_2.BadgeStyle
            L19_2 = L19_2.None
            if L18_2 == L19_2 then
              goto lbl_767
            end
            L18_2 = A4_2.RightBadge
            L19_2 = L11_2
            L18_2 = L18_2(L19_2)
            L19_2 = RenderSprite
            L20_2 = L18_2.BadgeDictionary
            if not L20_2 then
              L20_2 = "commonmenu"
            end
            L21_2 = L18_2.BadgeTexture
            if not L21_2 then
              L21_2 = ""
            end
            L22_2 = L7_2.X
            L23_2 = L0_1.RightBadge
            L23_2 = L23_2.X
            L22_2 = L22_2 + L23_2
            L23_2 = L7_2.WidthOffset
            L22_2 = L22_2 + L23_2
            L23_2 = L7_2.Y
            L24_2 = L0_1.RightBadge
            L24_2 = L24_2.Y
            L23_2 = L23_2 + L24_2
            L24_2 = L7_2.SubtitleHeight
            L23_2 = L23_2 + L24_2
            L24_2 = RageUI
            L24_2 = L24_2.ItemOffset
            L23_2 = L23_2 + L24_2
            L24_2 = L0_1.RightBadge
            L24_2 = L24_2.Width
            L25_2 = L0_1.RightBadge
            L25_2 = L25_2.Height
            L26_2 = 0
            L27_2 = L18_2.BadgeColour
            if L27_2 then
              L27_2 = L18_2.BadgeColour
              L27_2 = L27_2.R
              if L27_2 then
                goto lbl_676
              end
            end
            L27_2 = 255
            ::lbl_676::
            L28_2 = L18_2.BadgeColour
            if L28_2 then
              L28_2 = L18_2.BadgeColour
              L28_2 = L28_2.G
              if L28_2 then
                goto lbl_684
              end
            end
            L28_2 = 255
            ::lbl_684::
            L29_2 = L18_2.BadgeColour
            if L29_2 then
              L29_2 = L18_2.BadgeColour
              L29_2 = L29_2.B
              if L29_2 then
                goto lbl_692
              end
            end
            L29_2 = 255
            ::lbl_692::
            L30_2 = L18_2.BadgeColour
            if L30_2 then
              L30_2 = L18_2.BadgeColour
              L30_2 = L30_2.A
              if L30_2 then
                goto lbl_700
              end
            end
            L30_2 = 255
            ::lbl_700::
            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
            goto lbl_767
            ::lbl_702::
            L18_2 = RageUI
            L18_2 = L18_2.BadgeStyle
            L18_2 = L18_2.Lock
            L19_2 = RageUI
            L19_2 = L19_2.BadgeStyle
            L19_2 = L19_2.None
            if L18_2 ~= L19_2 and nil ~= L18_2 then
              L19_2 = L18_2
              L20_2 = L11_2
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
              L23_2 = L7_2.X
              L24_2 = L7_2.Y
              L25_2 = L0_1.LeftBadge
              L25_2 = L25_2.Y
              L24_2 = L24_2 + L25_2
              L25_2 = L7_2.SubtitleHeight
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
              L28_2 = L28_2.R
              if not L28_2 then
                L28_2 = 255
              end
              L29_2 = L19_2.BadgeColour
              L29_2 = L29_2.G
              if not L29_2 then
                L29_2 = 255
              end
              L30_2 = L19_2.BadgeColour
              L30_2 = L30_2.B
              if not L30_2 then
                L30_2 = 255
              end
              L31_2 = L19_2.BadgeColour
              L31_2 = L31_2.A
              if not L31_2 then
                L31_2 = 255
              end
              L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
            end
          else
            L18_2 = error
            L19_2 = "UICheckBox Style is not a `table`"
            L18_2(L19_2)
          end
          ::lbl_767::
          L18_2 = type
          L19_2 = A4_2.ProgressBackgroundColor
          L18_2 = L18_2(L19_2)
          if "table" == L18_2 then
            L18_2 = RenderRectangle
            L19_2 = L7_2.X
            L20_2 = L1_1.Background
            L20_2 = L20_2.X
            L19_2 = L19_2 + L20_2
            L20_2 = L7_2.WidthOffset
            L19_2 = L19_2 + L20_2
            L19_2 = L19_2 - L17_2
            L20_2 = L7_2.Y
            L21_2 = L1_1.Background
            L21_2 = L21_2.Y
            L20_2 = L20_2 + L21_2
            L21_2 = L7_2.SubtitleHeight
            L20_2 = L20_2 + L21_2
            L21_2 = RageUI
            L21_2 = L21_2.ItemOffset
            L20_2 = L20_2 + L21_2
            L21_2 = L1_1.Background
            L21_2 = L21_2.Width
            L22_2 = L1_1.Background
            L22_2 = L22_2.Height
            L23_2 = A4_2.ProgressBackgroundColor
            L23_2 = L23_2.R
            L24_2 = A4_2.ProgressBackgroundColor
            L24_2 = L24_2.G
            L25_2 = A4_2.ProgressBackgroundColor
            L25_2 = L25_2.B
            L26_2 = A4_2.ProgressBackgroundColor
            L26_2 = L26_2.A
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
          else
            L18_2 = error
            L19_2 = "Style ProgressBackgroundColor is not a table or undefined"
            L18_2(L19_2)
          end
          L18_2 = type
          L19_2 = A4_2.ProgressColor
          L18_2 = L18_2(L19_2)
          if "table" == L18_2 then
            L18_2 = RenderRectangle
            L19_2 = L7_2.X
            L20_2 = L1_1.Slider
            L20_2 = L20_2.X
            L19_2 = L19_2 + L20_2
            L20_2 = L7_2.WidthOffset
            L19_2 = L19_2 + L20_2
            L19_2 = L19_2 - L17_2
            L20_2 = L7_2.Y
            L21_2 = L1_1.Slider
            L21_2 = L21_2.Y
            L20_2 = L20_2 + L21_2
            L21_2 = L7_2.SubtitleHeight
            L20_2 = L20_2 + L21_2
            L21_2 = RageUI
            L21_2 = L21_2.ItemOffset
            L20_2 = L20_2 + L21_2
            L21_2 = L1_1.Slider
            L21_2 = L21_2.Width
            L22_2 = #L9_2
            L22_2 = L22_2 - 1
            L21_2 = L21_2 / L22_2
            L22_2 = A1_2 - 1
            L21_2 = L21_2 * L22_2
            L22_2 = L1_1.Slider
            L22_2 = L22_2.Height
            L23_2 = A4_2.ProgressColor
            L23_2 = L23_2.R
            L24_2 = A4_2.ProgressColor
            L24_2 = L24_2.G
            L25_2 = A4_2.ProgressColor
            L25_2 = L25_2.B
            L26_2 = A4_2.ProgressColor
            L26_2 = L26_2.A
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
          else
            L18_2 = error
            L19_2 = "Style ProgressColor is not a table or undefined"
            L18_2(L19_2)
          end
          L18_2 = RageUI
          L19_2 = RageUI
          L19_2 = L19_2.ItemOffset
          L20_2 = L0_1.Rectangle
          L20_2 = L20_2.Height
          L19_2 = L19_2 + L20_2
          L18_2.ItemOffset = L19_2
          L18_2 = RageUI
          L18_2 = L18_2.ItemsDescription
          L19_2 = L7_2
          L20_2 = A3_2
          L21_2 = L11_2
          L18_2(L19_2, L20_2, L21_2)
          if L11_2 then
            L18_2 = L7_2.Controls
            L18_2 = L18_2.Left
            L18_2 = L18_2.Active
            if not L18_2 then
              L18_2 = L7_2.Controls
              L18_2 = L18_2.Click
              L18_2 = L18_2.Active
              if not (L18_2 and L12_2) then
                goto lbl_929
              end
            end
            L18_2 = L7_2.Controls
            L18_2 = L18_2.Right
            L18_2 = L18_2.Active
            if not L18_2 then
              L18_2 = L7_2.Controls
              L18_2 = L18_2.Click
              L18_2 = L18_2.Active
              if not L18_2 or not L13_2 then
                A1_2 = A1_2 - 1
                if A1_2 < 1 then
                  A1_2 = #L9_2
                end
                L18_2 = A6_2.onSliderChange
                if nil ~= L18_2 then
                  L18_2 = A6_2.onSliderChange
                  L19_2 = A1_2
                  L18_2(L19_2)
                end
                L18_2 = RageUI
                L18_2 = L18_2.PlaySound
                L19_2 = L8_2.Use
                L19_2 = L8_2[L19_2]
                L19_2 = L19_2.LeftRight
                L19_2 = L19_2.audioName
                L20_2 = L8_2.Use
                L20_2 = L8_2[L20_2]
                L20_2 = L20_2.LeftRight
                L20_2 = L20_2.audioRef
                L18_2(L19_2, L20_2)
            end
          end
          ::lbl_929::
          elseif L11_2 then
            L18_2 = L7_2.Controls
            L18_2 = L18_2.Right
            L18_2 = L18_2.Active
            if not L18_2 then
              L18_2 = L7_2.Controls
              L18_2 = L18_2.Click
              L18_2 = L18_2.Active
              if not (L18_2 and L13_2) then
                goto lbl_978
              end
            end
            L18_2 = L7_2.Controls
            L18_2 = L18_2.Left
            L18_2 = L18_2.Active
            if not L18_2 then
              L18_2 = L7_2.Controls
              L18_2 = L18_2.Click
              L18_2 = L18_2.Active
              if not L18_2 or not L12_2 then
                A1_2 = A1_2 + 1
                L18_2 = #L9_2
                if A1_2 > L18_2 then
                  A1_2 = 1
                end
                L18_2 = A6_2.onSliderChange
                if nil ~= L18_2 then
                  L18_2 = A6_2.onSliderChange
                  L19_2 = A1_2
                  L18_2(L19_2)
                end
                L18_2 = RageUI
                L18_2 = L18_2.PlaySound
                L19_2 = L8_2.Use
                L19_2 = L8_2[L19_2]
                L19_2 = L19_2.LeftRight
                L19_2 = L19_2.audioName
                L20_2 = L8_2.Use
                L20_2 = L8_2[L20_2]
                L20_2 = L20_2.LeftRight
                L20_2 = L20_2.audioRef
                L18_2(L19_2, L20_2)
              end
            end
          end
          ::lbl_978::
          if L11_2 then
            L18_2 = L7_2.Controls
            L18_2 = L18_2.Select
            L18_2 = L18_2.Active
            if not L18_2 then
              if not L14_2 then
                goto lbl_1014
              end
              L18_2 = L7_2.Controls
              L18_2 = L18_2.Click
              L18_2 = L18_2.Active
              if not L18_2 or L12_2 or L13_2 then
                goto lbl_1014
              end
            end
            L18_2 = A6_2.onSelected
            if nil ~= L18_2 then
              L18_2 = A6_2.onSelected
              L19_2 = A1_2
              L18_2(L19_2)
            end
            L18_2 = RageUI
            L18_2 = L18_2.PlaySound
            L19_2 = L8_2.Use
            L19_2 = L8_2[L19_2]
            L19_2 = L19_2.Select
            L19_2 = L19_2.audioName
            L20_2 = L8_2.Use
            L20_2 = L8_2[L20_2]
            L20_2 = L20_2.Select
            L20_2 = L20_2.audioRef
            L18_2(L19_2, L20_2)
          ::lbl_1014::
          elseif L11_2 then
            L18_2 = A6_2.onActive
            if nil ~= L18_2 then
              L18_2 = A6_2.onActive
              L18_2()
            end
          end
        end
      end
      L11_2 = RageUI
      L12_2 = RageUI
      L12_2 = L12_2.Options
      L12_2 = L12_2 + 1
      L11_2.Options = L12_2
    end
  end
end
L2_1.SliderProgress = L3_1
