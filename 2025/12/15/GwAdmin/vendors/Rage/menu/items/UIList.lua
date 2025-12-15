local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
L1_1 = {}
L1_1.Y = 0
L1_1.Width = 431
L1_1.Height = 43
L0_1.Rectangle = L1_1
L1_1 = {}
L1_1.X = 23
L1_1.Y = 5
L1_1.Scale = 0.25
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
L1_1.X = 405
L1_1.Y = 4
L1_1.Scale = 0.25
L0_1.RightText = L1_1
L1_1 = {}
L1_1.Dictionary = "commonmenu.ytd"
L1_1.Texture = "gradient_nav"
L1_1.Y = 0
L1_1.Width = 431
L1_1.Height = 38
L0_1.SelectedSprite = L1_1
L1_1 = {}
L2_1 = {}
L2_1.Dictionary = "commonmenu.ytd"
L2_1.Texture = "arrowleft"
L2_1.X = 378
L2_1.Y = 3
L2_1.Width = 30
L2_1.Height = 30
L1_1.LeftArrow = L2_1
L2_1 = {}
L2_1.Dictionary = "commonmenu.ytd"
L2_1.Texture = "arrowright"
L2_1.X = 400
L2_1.Y = 3
L2_1.Width = 30
L2_1.Height = 30
L1_1.RightArrow = L2_1
L2_1 = {}
L2_1.X = 400
L2_1.Y = 3
L2_1.Scale = 0.3
L1_1.Text = L2_1
L2_1 = 0
L3_1 = false
L4_1 = true
L5_1 = false
L6_1 = 100
L7_1 = RageUI
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2)
  local L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2
  L9_2 = RageUI
  L9_2 = L9_2.CurrentMenu
  if nil ~= L9_2 then
    L10_2 = L9_2
    L10_2 = L10_2()
    if L10_2 then
      L10_2 = RageUI
      L10_2 = L10_2.Options
      L10_2 = L10_2 + 1
      L11_2 = L9_2.Pagination
      L11_2 = L11_2.Minimum
      if L10_2 >= L11_2 then
        L11_2 = L9_2.Pagination
        L11_2 = L11_2.Maximum
        if L10_2 <= L11_2 then
          L11_2 = L9_2.Index
          L11_2 = L11_2 == L10_2
          L12_2 = false
          L13_2 = false
          L14_2 = RageUI
          L14_2 = L14_2.ItemsSafeZone
          L15_2 = L9_2
          L14_2(L15_2)
          L14_2 = false
          L15_2 = A4_2.LeftBadge
          L16_2 = RageUI
          L16_2 = L16_2.BadgeStyle
          L16_2 = L16_2.None
          if L15_2 ~= L16_2 then
            L15_2 = A4_2.LeftBadge
            if nil ~= L15_2 then
              goto lbl_45
            end
          end
          L15_2 = 0
          ::lbl_45::
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
              goto lbl_58
            end
          end
          L16_2 = 0
          ::lbl_58::
          if not L16_2 then
            L16_2 = 32
          end
          L17_2 = 0
          L18_2 = L5_1
          if not L18_2 then
            L18_2 = true
            L5_1 = L18_2
            L18_2 = Citizen
            L18_2 = L18_2.CreateThread
            function L19_2()
              local L0_3, L1_3
              while true do
                L0_3 = L2_1
                if L0_3 <= 5 then
                  L0_3 = L2_1
                  L0_3 = L0_3 + 2
                  L2_1 = L0_3
                else
                  L0_3 = L2_1
                  L0_3 = L0_3 + 7
                  L2_1 = L0_3
                end
                L0_3 = L6_1
                L0_3 = L0_3 - 3
                L1_3 = 5
                L6_1 = L0_3
                L0_3 = L2_1
                L1_3 = 300
                if L0_3 >= L1_3 then
                  L0_3 = 0
                  L2_1 = L0_3
                  L0_3 = 100
                  L6_1 = L0_3
                  L0_3 = false
                  L4_1 = L0_3
                end
                L0_3 = RageUI
                L0_3 = L0_3.CurrentMenu
                if not L0_3 then
                  L0_3 = false
                  L5_1 = L0_3
                  L0_3 = true
                  L4_1 = L0_3
                  return
                end
                L0_3 = Wait
                L1_3 = 10
                L0_3(L1_3)
              end
            end
            L18_2(L19_2)
          end
          L18_2 = RenderRectangle
          L19_2 = L9_2.X
          L19_2 = L19_2 + 15
          L20_2 = L9_2.Y
          L21_2 = L0_1.SelectedSprite
          L21_2 = L21_2.Y
          L20_2 = L20_2 + L21_2
          L21_2 = L9_2.SubtitleHeight
          L20_2 = L20_2 + L21_2
          L21_2 = RageUI
          L21_2 = L21_2.ItemOffset
          L20_2 = L20_2 + L21_2
          L21_2 = L0_1.SelectedSprite
          L21_2 = L21_2.Width
          L22_2 = L9_2.WidthOffset
          L21_2 = L21_2 + L22_2
          L21_2 = L21_2 - 30
          L22_2 = L0_1.SelectedSprite
          L22_2 = L22_2.Height
          L22_2 = L22_2 - 3
          L23_2 = 35
          L24_2 = 39
          L25_2 = 47
          L26_2 = 255
          L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
          if L11_2 then
            L18_2 = L4_1
            if L18_2 then
              L18_2 = RenderRectangle
              L19_2 = L9_2.X
              L19_2 = L19_2 + 15
              L20_2 = L2_1
              L19_2 = L19_2 + L20_2
              L20_2 = L9_2.Y
              L21_2 = L0_1.SelectedSprite
              L21_2 = L21_2.Y
              L20_2 = L20_2 + L21_2
              L21_2 = L9_2.SubtitleHeight
              L20_2 = L20_2 + L21_2
              L21_2 = RageUI
              L21_2 = L21_2.ItemOffset
              L20_2 = L20_2 + L21_2
              L21_2 = L0_1.SelectedSprite
              L21_2 = L21_2.Width
              L22_2 = L9_2.WidthOffset
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 - 300
              L22_2 = L0_1.SelectedSprite
              L22_2 = L22_2.Height
              L22_2 = L22_2 - 3
              L23_2 = 74
              L24_2 = 75
              L25_2 = 77
              L26_2 = L6_1
              L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
            end
          end
          if L11_2 then
            L18_2 = RenderRectangle
            L19_2 = L9_2.X
            L19_2 = L19_2 + 15
            L20_2 = L9_2.Y
            L21_2 = L0_1.SelectedSprite
            L21_2 = L21_2.Y
            L20_2 = L20_2 + L21_2
            L21_2 = L9_2.SubtitleHeight
            L20_2 = L20_2 + L21_2
            L21_2 = RageUI
            L21_2 = L21_2.ItemOffset
            L20_2 = L20_2 + L21_2
            L21_2 = L0_1.SelectedSprite
            L21_2 = L21_2.Width
            L22_2 = L9_2.WidthOffset
            L21_2 = L21_2 + L22_2
            L21_2 = L21_2 - 427
            L22_2 = L0_1.SelectedSprite
            L22_2 = L22_2.Height
            L22_2 = L22_2 - 3
            L23_2 = 133
            L24_2 = 133
            L25_2 = 133
            L26_2 = 255
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
          end
          L18_2 = type
          L19_2 = A1_2[A2_2]
          L18_2 = L18_2(L19_2)
          if "table" == L18_2 then
            L18_2 = string
            L18_2 = L18_2.format
            L19_2 = "\226\134\144 %s \226\134\146"
            L20_2 = A1_2[A2_2]
            L20_2 = L20_2.Name
            L18_2 = L18_2(L19_2, L20_2)
            if L18_2 then
              goto lbl_201
            end
          end
          L18_2 = string
          L18_2 = L18_2.format
          L19_2 = "\226\134\144 %s%s~s~ \226\134\146"
          L20_2 = A8_2 or L20_2
          if nil == A8_2 or not A8_2 then
            L20_2 = "~s~"
          end
          L21_2 = A1_2[A2_2]
          L18_2 = L18_2(L19_2, L20_2, L21_2)
          if not L18_2 then
            L18_2 = "NIL"
          end
          ::lbl_201::
          if true == A5_2 or nil == A5_2 then
            if L11_2 then
              L19_2 = A4_2.RightLabel
              if nil ~= L19_2 then
                L19_2 = A4_2.RightLabel
                if "" ~= L19_2 then
                  L19_2 = RenderText
                  L20_2 = A4_2.RightLabel
                  L21_2 = L9_2.X
                  L22_2 = L0_1.RightText
                  L22_2 = L22_2.X
                  L21_2 = L21_2 + L22_2
                  L21_2 = L21_2 - L16_2
                  L22_2 = L9_2.WidthOffset
                  L21_2 = L21_2 + L22_2
                  L22_2 = L9_2.Y
                  L23_2 = L0_1.RightText
                  L23_2 = L23_2.Y
                  L22_2 = L22_2 + L23_2
                  L23_2 = L9_2.SubtitleHeight
                  L22_2 = L22_2 + L23_2
                  L23_2 = RageUI
                  L23_2 = L23_2.ItemOffset
                  L22_2 = L22_2 + L23_2
                  L23_2 = 8
                  L24_2 = L0_1.RightText
                  L24_2 = L24_2.Scale
                  L25_2 = 0
                  L26_2 = 0
                  L27_2 = 0
                  L28_2 = 255
                  L29_2 = 2
                  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
                  L19_2 = MeasureStringWidth
                  L20_2 = A4_2.RightLabel
                  L21_2 = 0
                  L22_2 = 0.35
                  L19_2 = L19_2(L20_2, L21_2, L22_2)
                  L17_2 = L19_2
                end
              end
            else
              L19_2 = A4_2.RightLabel
              if nil ~= L19_2 then
                L19_2 = A4_2.RightLabel
                if "" ~= L19_2 then
                  L19_2 = MeasureStringWidth
                  L20_2 = A4_2.RightLabel
                  L21_2 = 0
                  L22_2 = 0.35
                  L19_2 = L19_2(L20_2, L21_2, L22_2)
                  L17_2 = L19_2
                  L19_2 = RenderText
                  L20_2 = A4_2.RightLabel
                  L21_2 = L9_2.X
                  L22_2 = L0_1.RightText
                  L22_2 = L22_2.X
                  L21_2 = L21_2 + L22_2
                  L21_2 = L21_2 - L16_2
                  L22_2 = L9_2.WidthOffset
                  L21_2 = L21_2 + L22_2
                  L22_2 = L9_2.Y
                  L23_2 = L0_1.RightText
                  L23_2 = L23_2.Y
                  L22_2 = L22_2 + L23_2
                  L23_2 = L9_2.SubtitleHeight
                  L22_2 = L22_2 + L23_2
                  L23_2 = RageUI
                  L23_2 = L23_2.ItemOffset
                  L22_2 = L22_2 + L23_2
                  L23_2 = 8
                  L24_2 = L0_1.RightText
                  L24_2 = L24_2.Scale
                  L25_2 = 0
                  L26_2 = 0
                  L27_2 = 0
                  L28_2 = 255
                  L29_2 = 2
                  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
                end
              end
            end
          end
          L19_2 = L16_2 * 1.3
          L17_2 = L19_2 + L17_2
          if true == A5_2 or nil == A5_2 then
            if L11_2 then
              L19_2 = RenderText
              L20_2 = A0_2
              L21_2 = L9_2.X
              L22_2 = L0_1.Text
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 + L15_2
              L22_2 = L9_2.Y
              L23_2 = L0_1.Text
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L9_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = 8
              L24_2 = L0_1.Text
              L24_2 = L24_2.Scale
              L25_2 = 255
              L26_2 = 255
              L27_2 = 255
              L28_2 = 255
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
              L19_2 = RenderText
              L20_2 = L18_2
              L21_2 = L9_2.X
              L22_2 = L1_1.Text
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 + 5
              L22_2 = L9_2.WidthOffset
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 - L17_2
              L22_2 = L9_2.Y
              L23_2 = L1_1.Text
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L9_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = 8
              L24_2 = L1_1.Text
              L24_2 = L24_2.Scale
              L25_2 = 255
              L26_2 = 255
              L27_2 = 255
              L28_2 = 255
              L29_2 = 2
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
            else
              L19_2 = RenderText
              L20_2 = A0_2
              L21_2 = L9_2.X
              L22_2 = L0_1.Text
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 + L15_2
              L22_2 = L9_2.Y
              L23_2 = L0_1.Text
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L9_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = 8
              L24_2 = L0_1.Text
              L24_2 = L24_2.Scale
              L25_2 = 104
              L26_2 = 108
              L27_2 = 114
              L28_2 = 255
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
              L19_2 = RenderText
              L20_2 = L18_2
              L21_2 = L9_2.X
              L22_2 = L1_1.Text
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 + 5
              L22_2 = L9_2.WidthOffset
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 - L17_2
              L22_2 = L9_2.Y
              L23_2 = L1_1.Text
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L9_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = 8
              L24_2 = L1_1.Text
              L24_2 = L24_2.Scale
              L25_2 = 153
              L26_2 = 153
              L27_2 = 153
              L28_2 = 255
              L29_2 = 2
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
            end
          else
            L19_2 = RenderText
            L20_2 = A0_2
            L21_2 = L9_2.X
            L22_2 = L0_1.Text
            L22_2 = L22_2.X
            L21_2 = L21_2 + L22_2
            L21_2 = L21_2 + L15_2
            L22_2 = L9_2.Y
            L23_2 = L0_1.Text
            L23_2 = L23_2.Y
            L22_2 = L22_2 + L23_2
            L23_2 = L9_2.SubtitleHeight
            L22_2 = L22_2 + L23_2
            L23_2 = RageUI
            L23_2 = L23_2.ItemOffset
            L22_2 = L22_2 + L23_2
            L23_2 = 8
            L24_2 = L0_1.Text
            L24_2 = L24_2.Scale
            L25_2 = 163
            L26_2 = 159
            L27_2 = 148
            L28_2 = 255
            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
            if L11_2 then
              L19_2 = RenderText
              L20_2 = L18_2
              L21_2 = L9_2.X
              L22_2 = L1_1.Text
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L22_2 = L9_2.WidthOffset
              L21_2 = L21_2 + L22_2
              L22_2 = L9_2.Y
              L23_2 = L1_1.Text
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L9_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = 8
              L24_2 = L1_1.Text
              L24_2 = L24_2.Scale
              L25_2 = 163
              L26_2 = 159
              L27_2 = 148
              L28_2 = 255
              L29_2 = 2
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
            else
              L19_2 = RenderText
              L20_2 = L18_2
              L21_2 = L9_2.X
              L22_2 = L1_1.Text
              L22_2 = L22_2.X
              L21_2 = L21_2 + L22_2
              L21_2 = L21_2 + 5
              L22_2 = L9_2.WidthOffset
              L21_2 = L21_2 + L22_2
              L22_2 = L9_2.Y
              L23_2 = L1_1.Text
              L23_2 = L23_2.Y
              L22_2 = L22_2 + L23_2
              L23_2 = L9_2.SubtitleHeight
              L22_2 = L22_2 + L23_2
              L23_2 = RageUI
              L23_2 = L23_2.ItemOffset
              L22_2 = L22_2 + L23_2
              L23_2 = 8
              L24_2 = L1_1.Text
              L24_2 = L24_2.Scale
              L25_2 = 163
              L26_2 = 159
              L27_2 = 148
              L28_2 = 255
              L29_2 = 2
              L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
            end
          end
          L19_2 = type
          L20_2 = A4_2
          L19_2 = L19_2(L20_2)
          if "table" == L19_2 then
            L19_2 = A4_2.Enabled
            if true ~= L19_2 then
              L19_2 = A4_2.Enabled
              if nil ~= L19_2 then
                goto lbl_696
              end
            end
            L19_2 = type
            L20_2 = A4_2
            L19_2 = L19_2(L20_2)
            if "table" ~= L19_2 then
              goto lbl_758
            end
            L19_2 = A4_2.LeftBadge
            if nil ~= L19_2 then
              L19_2 = A4_2.LeftBadge
              L20_2 = RageUI
              L20_2 = L20_2.BadgeStyle
              L20_2 = L20_2.None
              if L19_2 ~= L20_2 then
                L19_2 = A4_2.LeftBadge
                L20_2 = L11_2
                L19_2 = L19_2(L20_2)
                L20_2 = RenderSprite
                L21_2 = "commonmenu.ytd"
                L22_2 = L19_2.BadgeTexture
                if not L22_2 then
                  L22_2 = ""
                end
                L23_2 = L9_2.X
                L24_2 = L9_2.Y
                L25_2 = L0_1.LeftBadge
                L25_2 = L25_2.Y
                L24_2 = L24_2 + L25_2
                L25_2 = L9_2.SubtitleHeight
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
                    goto lbl_594
                  end
                end
                L28_2 = 255
                ::lbl_594::
                L29_2 = L19_2.BadgeColour
                if L29_2 then
                  L29_2 = L19_2.BadgeColour
                  L29_2 = L29_2.G
                  if L29_2 then
                    goto lbl_602
                  end
                end
                L29_2 = 255
                ::lbl_602::
                L30_2 = L19_2.BadgeColour
                if L30_2 then
                  L30_2 = L19_2.BadgeColour
                  L30_2 = L30_2.B
                  if L30_2 then
                    goto lbl_610
                  end
                end
                L30_2 = 255
                ::lbl_610::
                L31_2 = L19_2.BadgeColour
                if L31_2 then
                  L31_2 = L19_2.BadgeColour
                  L31_2 = L31_2.A
                  if L31_2 then
                    goto lbl_618
                  end
                end
                L31_2 = 255
                ::lbl_618::
                L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
              end
            end
            L19_2 = A4_2.RightBadge
            if nil == L19_2 then
              goto lbl_758
            end
            L19_2 = A4_2.RightBadge
            L20_2 = RageUI
            L20_2 = L20_2.BadgeStyle
            L20_2 = L20_2.None
            if L19_2 == L20_2 then
              goto lbl_758
            end
            L19_2 = A4_2.RightBadge
            L20_2 = L11_2
            L19_2 = L19_2(L20_2)
            L20_2 = RenderSprite
            L21_2 = "commonmenu.ytd"
            L22_2 = L19_2.BadgeTexture
            if not L22_2 then
              L22_2 = ""
            end
            L23_2 = L9_2.X
            L24_2 = L0_1.RightBadge
            L24_2 = L24_2.X
            L23_2 = L23_2 + L24_2
            L24_2 = L9_2.WidthOffset
            L23_2 = L23_2 + L24_2
            L24_2 = L9_2.Y
            L25_2 = L0_1.RightBadge
            L25_2 = L25_2.Y
            L24_2 = L24_2 + L25_2
            L25_2 = L9_2.SubtitleHeight
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
                goto lbl_670
              end
            end
            L28_2 = 255
            ::lbl_670::
            L29_2 = L19_2.BadgeColour
            if L29_2 then
              L29_2 = L19_2.BadgeColour
              L29_2 = L29_2.G
              if L29_2 then
                goto lbl_678
              end
            end
            L29_2 = 255
            ::lbl_678::
            L30_2 = L19_2.BadgeColour
            if L30_2 then
              L30_2 = L19_2.BadgeColour
              L30_2 = L30_2.B
              if L30_2 then
                goto lbl_686
              end
            end
            L30_2 = 255
            ::lbl_686::
            L31_2 = L19_2.BadgeColour
            if L31_2 then
              L31_2 = L19_2.BadgeColour
              L31_2 = L31_2.A
              if L31_2 then
                goto lbl_694
              end
            end
            L31_2 = 255
            ::lbl_694::
            L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
            goto lbl_758
            ::lbl_696::
            L19_2 = RageUI
            L19_2 = L19_2.BadgeStyle
            L19_2 = L19_2.Lock
            L20_2 = RageUI
            L20_2 = L20_2.BadgeStyle
            L20_2 = L20_2.None
            if L19_2 ~= L20_2 and nil ~= L19_2 then
              L20_2 = L19_2
              L21_2 = L11_2
              L20_2 = L20_2(L21_2)
              L21_2 = RenderSprite
              L22_2 = "commonmenu.ytd"
              L23_2 = L20_2.BadgeTexture
              if not L23_2 then
                L23_2 = ""
              end
              L24_2 = L9_2.X
              L25_2 = L9_2.Y
              L26_2 = L0_1.LeftBadge
              L26_2 = L26_2.Y
              L25_2 = L25_2 + L26_2
              L26_2 = L9_2.SubtitleHeight
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
          ::lbl_758::
          L19_2 = RageUI
          L19_2 = L19_2.IsMouseInBounds
          L20_2 = L9_2.X
          L21_2 = L1_1.Text
          L21_2 = L21_2.X
          L20_2 = L20_2 + L21_2
          L21_2 = L9_2.WidthOffset
          L20_2 = L20_2 + L21_2
          L20_2 = L20_2 - L17_2
          L21_2 = L9_2.SafeZoneSize
          L21_2 = L21_2.X
          L20_2 = L20_2 + L21_2
          L21_2 = L9_2.Y
          L22_2 = L1_1.Text
          L22_2 = L22_2.Y
          L21_2 = L21_2 + L22_2
          L22_2 = L9_2.SubtitleHeight
          L21_2 = L21_2 + L22_2
          L22_2 = RageUI
          L22_2 = L22_2.ItemOffset
          L21_2 = L21_2 + L22_2
          L21_2 = L21_2 + 2.5
          L22_2 = L9_2.SafeZoneSize
          L22_2 = L22_2.Y
          L21_2 = L21_2 + L22_2
          L22_2 = 15
          L23_2 = 22.5
          L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
          L12_2 = L19_2
          L19_2 = RageUI
          L19_2 = L19_2.IsMouseInBounds
          L20_2 = L9_2.X
          L21_2 = L1_1.Text
          L21_2 = L21_2.X
          L20_2 = L20_2 + L21_2
          L21_2 = L9_2.WidthOffset
          L20_2 = L20_2 + L21_2
          L21_2 = L9_2.SafeZoneSize
          L21_2 = L21_2.X
          L20_2 = L20_2 + L21_2
          L20_2 = L20_2 - L17_2
          L21_2 = MeasureStringWidth
          L22_2 = L18_2
          L23_2 = 0
          L24_2 = L1_1.Text
          L24_2 = L24_2.Scale
          L21_2 = L21_2(L22_2, L23_2, L24_2)
          L20_2 = L20_2 - L21_2
          L21_2 = L9_2.Y
          L22_2 = L1_1.Text
          L22_2 = L22_2.Y
          L21_2 = L21_2 + L22_2
          L22_2 = L9_2.SubtitleHeight
          L21_2 = L21_2 + L22_2
          L22_2 = RageUI
          L22_2 = L22_2.ItemOffset
          L21_2 = L21_2 + L22_2
          L21_2 = L21_2 + 2.5
          L22_2 = L9_2.SafeZoneSize
          L22_2 = L22_2.Y
          L21_2 = L21_2 + L22_2
          L22_2 = 15
          L23_2 = 22.5
          L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
          L13_2 = L19_2
          L19_2 = RageUI
          L20_2 = RageUI
          L20_2 = L20_2.ItemOffset
          L21_2 = L0_1.Rectangle
          L21_2 = L21_2.Height
          L20_2 = L20_2 + L21_2
          L19_2.ItemOffset = L20_2
          L19_2 = RageUI
          L19_2 = L19_2.ItemsDescription
          L20_2 = L9_2
          L21_2 = A3_2
          L22_2 = L11_2
          L19_2(L20_2, L21_2, L22_2)
          if L11_2 then
            L19_2 = L9_2.Controls
            L19_2 = L19_2.Left
            L19_2 = L19_2.Active
            if not L19_2 then
              L19_2 = L9_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not (L19_2 and L12_2) then
                goto lbl_903
              end
            end
            L19_2 = L9_2.Controls
            L19_2 = L19_2.Right
            L19_2 = L19_2.Active
            if not L19_2 then
              L19_2 = L9_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not L19_2 or not L13_2 then
                A2_2 = A2_2 - 1
                if A2_2 < 1 then
                  A2_2 = #A1_2
                end
                L19_2 = A6_2.onListChange
                if nil ~= L19_2 then
                  L19_2 = A6_2.onListChange
                  L20_2 = A2_2
                  L21_2 = A1_2[A2_2]
                  L19_2(L20_2, L21_2)
                end
                L19_2 = RageUI
                L19_2 = L19_2.Settings
                L19_2 = L19_2.Audio
                L20_2 = TriggerEvent
                L21_2 = "InteractSound_CL:PlayOnOne"
                L22_2 = "selected"
                L23_2 = 0.2
                L20_2(L21_2, L22_2, L23_2)
            end
          end
          ::lbl_903::
          elseif L11_2 then
            L19_2 = L9_2.Controls
            L19_2 = L19_2.Right
            L19_2 = L19_2.Active
            if not L19_2 then
              L19_2 = L9_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not (L19_2 and L13_2) then
                goto lbl_950
              end
            end
            L19_2 = L9_2.Controls
            L19_2 = L19_2.Left
            L19_2 = L19_2.Active
            if not L19_2 then
              L19_2 = L9_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not L19_2 or not L12_2 then
                A2_2 = A2_2 + 1
                L19_2 = #A1_2
                if A2_2 > L19_2 then
                  A2_2 = 1
                end
                L19_2 = A6_2.onListChange
                if nil ~= L19_2 then
                  L19_2 = A6_2.onListChange
                  L20_2 = A2_2
                  L21_2 = A1_2[A2_2]
                  L19_2(L20_2, L21_2)
                end
                L19_2 = RageUI
                L19_2 = L19_2.Settings
                L19_2 = L19_2.Audio
                L20_2 = TriggerEvent
                L21_2 = "InteractSound_CL:PlayOnOne"
                L22_2 = "selected"
                L23_2 = 0.2
                L20_2(L21_2, L22_2, L23_2)
              end
            end
          end
          ::lbl_950::
          if L11_2 then
            L19_2 = L9_2.Controls
            L19_2 = L19_2.Select
            L19_2 = L19_2.Active
            if not L19_2 then
              if not L14_2 then
                goto lbl_997
              end
              L19_2 = L9_2.Controls
              L19_2 = L19_2.Click
              L19_2 = L19_2.Active
              if not L19_2 or L12_2 or L13_2 then
                goto lbl_997
              end
            end
            L19_2 = RageUI
            L19_2 = L19_2.Settings
            L19_2 = L19_2.Audio
            L20_2 = TriggerEvent
            L21_2 = "InteractSound_CL:PlayOnOne"
            L22_2 = "selected"
            L23_2 = 0.2
            L20_2(L21_2, L22_2, L23_2)
            L20_2 = A6_2.onSelected
            if nil ~= L20_2 then
              L20_2 = isWaitingForServer
              if not L20_2 then
                L20_2 = A6_2.onSelected
                L21_2 = A2_2
                L22_2 = A1_2[A2_2]
                L20_2(L21_2, L22_2)
              end
            end
            if nil ~= A7_2 then
              L20_2 = type
              L21_2 = A7_2
              L20_2 = L20_2(L21_2)
              if "table" == L20_2 then
                L20_2 = RageUI
                L21_2 = A7_2[A2_2]
                L20_2.NextMenu = L21_2
              end
            end
          ::lbl_997::
          elseif L11_2 then
            L19_2 = A6_2.onActive
            if nil ~= L19_2 then
              L19_2 = A6_2.onActive
              L19_2()
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
L7_1.List = L8_1
L7_1 = RageUI
function L8_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3
    while true do
      L0_3 = Wait
      L1_3 = 100
      L0_3(L1_3)
      L0_3 = 0
      L2_1 = L0_3
      L0_3 = true
      L4_1 = L0_3
      L0_3 = 100
      L6_1 = L0_3
      break
    end
  end
  L0_2(L1_2)
end
L7_1.ReloadAnimationList = L8_1
