local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L1_1 = {}
L1_1.Y = 0
L1_1.Width = 500
L1_1.Height = 43
L0_1.Rectangle = L1_1
L1_1 = {}
L1_1.X = 11
L1_1.Y = 7
L1_1.Scale = 0.25
L0_1.Text = L1_1
L1_1 = {}
L1_1.Y = -2
L1_1.Width = 40
L1_1.Height = 40
L0_1.LeftBadge = L1_1
L1_1 = {}
L1_1.X = 375
L1_1.Y = 0
L1_1.Width = 40
L1_1.Height = 40
L0_1.RightBadge = L1_1
L1_1 = {}
L1_1.X = 420
L1_1.Y = 7
L1_1.Scale = 0.25
L0_1.RightText = L1_1
L1_1 = {}
L1_1.Dictionary = "commonmenu"
L1_1.Texture = "gradient_nav"
L1_1.Y = 0
L1_1.Width = 431
L1_1.Height = 38
L0_1.SelectedSprite = L1_1
L1_1 = 0
L2_1 = false
L3_1 = true
L4_1 = false
L5_1 = 100
L6_1 = RageUI
function L7_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L6_2 = GetPlayerServerId
  L7_2 = PlayerId
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L7_2()
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
  src = L6_2
  L6_2 = PlayerServer
  L7_2 = src
  L6_2 = L6_2[L7_2]
  L6_2 = L6_2.permission
  if "all" == L6_2 then
    if A3_2 then
      L7_2 = isWaitingForServer
      A3_2 = not L7_2
    end
    L7_2 = RageUI
    L7_2 = L7_2.CurrentMenu
    if nil ~= L7_2 then
      L8_2 = L7_2
      L8_2 = L8_2()
      if L8_2 then
        L8_2 = RageUI
        L8_2 = L8_2.Options
        L8_2 = L8_2 + 1
        L9_2 = L7_2.Pagination
        L9_2 = L9_2.Minimum
        if L8_2 >= L9_2 then
          L9_2 = L7_2.Pagination
          L9_2 = L9_2.Maximum
          if L8_2 <= L9_2 then
            L9_2 = L7_2.Index
            L9_2 = L9_2 == L8_2
            L10_2 = RageUI
            L10_2 = L10_2.ItemsSafeZone
            L11_2 = L7_2
            L10_2(L11_2)
            L10_2 = A2_2.LeftBadge
            if L10_2 then
              L10_2 = A2_2.LeftBadge
              L11_2 = RageUI
              L11_2 = L11_2.BadgeStyle
              L11_2 = L11_2.None
              L10_2 = L10_2 ~= L11_2
            end
            L11_2 = A2_2.RightBadge
            if L11_2 then
              L11_2 = A2_2.RightBadge
              L12_2 = RageUI
              L12_2 = L12_2.BadgeStyle
              L12_2 = L12_2.None
            end
            L11_2 = L11_2 ~= L12_2
            if L10_2 then
              L12_2 = 27
              if L12_2 then
                goto lbl_81
              end
            end
            L12_2 = 0
            ::lbl_81::
            if L11_2 then
              L13_2 = 32
              if L13_2 then
                goto lbl_87
              end
            end
            L13_2 = 0
            ::lbl_87::
            L14_2 = L4_1
            if not L14_2 then
              L14_2 = true
              L4_1 = L14_2
              L14_2 = Citizen
              L14_2 = L14_2.CreateThread
              function L15_2()
                local L0_3, L1_3
                while true do
                  L0_3 = L1_1
                  if L0_3 <= 5 then
                    L0_3 = L1_1
                    L0_3 = L0_3 + 2
                    L1_1 = L0_3
                  else
                    L0_3 = L1_1
                    L0_3 = L0_3 + 7
                    L1_1 = L0_3
                  end
                  L0_3 = L5_1
                  L0_3 = L0_3 - 3
                  L1_3 = 5
                  L5_1 = L0_3
                  L0_3 = L1_1
                  L1_3 = 300
                  if L0_3 >= L1_3 then
                    L0_3 = 0
                    L1_1 = L0_3
                    L0_3 = 100
                    L5_1 = L0_3
                    L0_3 = false
                    L3_1 = L0_3
                  end
                  L0_3 = RageUI
                  L0_3 = L0_3.CurrentMenu
                  if not L0_3 then
                    L0_3 = false
                    L4_1 = L0_3
                    L0_3 = true
                    L3_1 = L0_3
                    return
                  end
                  L0_3 = Wait
                  L1_3 = 10
                  L0_3(L1_3)
                end
              end
              L14_2(L15_2)
            end
            L14_2 = RenderRectangle
            L15_2 = L7_2.X
            L15_2 = L15_2 + 15
            L16_2 = L7_2.Y
            L17_2 = L0_1.SelectedSprite
            L17_2 = L17_2.Y
            L16_2 = L16_2 + L17_2
            L17_2 = L7_2.SubtitleHeight
            L16_2 = L16_2 + L17_2
            L17_2 = RageUI
            L17_2 = L17_2.ItemOffset
            L16_2 = L16_2 + L17_2
            L17_2 = L0_1.SelectedSprite
            L17_2 = L17_2.Width
            L18_2 = L7_2.WidthOffset
            L17_2 = L17_2 + L18_2
            L17_2 = L17_2 - 30
            L18_2 = L0_1.SelectedSprite
            L18_2 = L18_2.Height
            L18_2 = L18_2 - 3
            L19_2 = 35
            L20_2 = 39
            L21_2 = 47
            L22_2 = 255
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            if L9_2 then
              L14_2 = L3_1
              if L14_2 then
                L14_2 = RenderRectangle
                L15_2 = L7_2.X
                L15_2 = L15_2 + 15
                L16_2 = L1_1
                L15_2 = L15_2 + L16_2
                L16_2 = L7_2.Y
                L17_2 = L0_1.SelectedSprite
                L17_2 = L17_2.Y
                L16_2 = L16_2 + L17_2
                L17_2 = L7_2.SubtitleHeight
                L16_2 = L16_2 + L17_2
                L17_2 = RageUI
                L17_2 = L17_2.ItemOffset
                L16_2 = L16_2 + L17_2
                L17_2 = L0_1.SelectedSprite
                L17_2 = L17_2.Width
                L18_2 = L7_2.WidthOffset
                L17_2 = L17_2 + L18_2
                L17_2 = L17_2 - 300
                L18_2 = L0_1.SelectedSprite
                L18_2 = L18_2.Height
                L18_2 = L18_2 - 3
                L19_2 = 39
                L20_2 = 107
                L21_2 = 218
                L22_2 = L5_1
                L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              end
            end
            if L9_2 then
              L14_2 = RenderRectangle
              L15_2 = L7_2.X
              L15_2 = L15_2 + 15
              L16_2 = L7_2.Y
              L17_2 = L0_1.SelectedSprite
              L17_2 = L17_2.Y
              L16_2 = L16_2 + L17_2
              L17_2 = L7_2.SubtitleHeight
              L16_2 = L16_2 + L17_2
              L17_2 = RageUI
              L17_2 = L17_2.ItemOffset
              L16_2 = L16_2 + L17_2
              L17_2 = L0_1.SelectedSprite
              L17_2 = L17_2.Width
              L18_2 = L7_2.WidthOffset
              L17_2 = L17_2 + L18_2
              L17_2 = L17_2 - 427
              L18_2 = L0_1.SelectedSprite
              L18_2 = L18_2.Height
              L18_2 = L18_2 - 3
              L19_2 = 39
              L20_2 = 107
              L21_2 = 218
              L22_2 = 255
              L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            end
            if A3_2 then
              if L10_2 then
                L14_2 = A2_2.LeftBadge
                if nil ~= L14_2 then
                  L14_2 = A2_2.LeftBadge
                  L15_2 = L9_2
                  L14_2 = L14_2(L15_2)
                  L15_2 = RenderSprite
                  L16_2 = L14_2.BadgeDictionary
                  if not L16_2 then
                    L16_2 = "commonmenu"
                  end
                  L17_2 = L14_2.BadgeTexture
                  if not L17_2 then
                    L17_2 = ""
                  end
                  L18_2 = L7_2.X
                  L18_2 = L18_2 + 17
                  L19_2 = L7_2.Y
                  L20_2 = L0_1.LeftBadge
                  L20_2 = L20_2.Y
                  L19_2 = L19_2 + L20_2
                  L20_2 = L7_2.SubtitleHeight
                  L19_2 = L19_2 + L20_2
                  L20_2 = RageUI
                  L20_2 = L20_2.ItemOffset
                  L19_2 = L19_2 + L20_2
                  L20_2 = L0_1.LeftBadge
                  L20_2 = L20_2.Width
                  L21_2 = L0_1.LeftBadge
                  L21_2 = L21_2.Height
                  L22_2 = 0
                  L23_2 = L14_2.BadgeColour
                  if L23_2 then
                    L23_2 = L14_2.BadgeColour
                    L23_2 = L23_2.R
                    if L23_2 then
                      goto lbl_249
                    end
                  end
                  L23_2 = 255
                  ::lbl_249::
                  L24_2 = L14_2.BadgeColour
                  if L24_2 then
                    L24_2 = L14_2.BadgeColour
                    L24_2 = L24_2.G
                    if L24_2 then
                      goto lbl_257
                    end
                  end
                  L24_2 = 255
                  ::lbl_257::
                  L25_2 = L14_2.BadgeColour
                  if L25_2 then
                    L25_2 = L14_2.BadgeColour
                    L25_2 = L25_2.B
                    if L25_2 then
                      goto lbl_265
                    end
                  end
                  L25_2 = 255
                  ::lbl_265::
                  L26_2 = L14_2.BadgeColour
                  if L26_2 then
                    L26_2 = L14_2.BadgeColour
                    L26_2 = L26_2.A
                    if L26_2 then
                      goto lbl_273
                    end
                  end
                  L26_2 = 255
                  ::lbl_273::
                  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
                end
              end
              if L11_2 then
                L14_2 = A2_2.RightBadge
                if nil ~= L14_2 then
                  L14_2 = A2_2.RightBadge
                  L15_2 = L9_2
                  L14_2 = L14_2(L15_2)
                  L15_2 = RenderSprite
                  L16_2 = L14_2.BadgeDictionary
                  if not L16_2 then
                    L16_2 = "commonmenu"
                  end
                  L17_2 = L14_2.BadgeTexture
                  if not L17_2 then
                    L17_2 = ""
                  end
                  L18_2 = L7_2.X
                  L19_2 = L0_1.RightBadge
                  L19_2 = L19_2.X
                  L18_2 = L18_2 + L19_2
                  L19_2 = L7_2.WidthOffset
                  L18_2 = L18_2 + L19_2
                  L19_2 = L7_2.Y
                  L20_2 = L0_1.RightBadge
                  L20_2 = L20_2.Y
                  L19_2 = L19_2 + L20_2
                  L20_2 = L7_2.SubtitleHeight
                  L19_2 = L19_2 + L20_2
                  L20_2 = RageUI
                  L20_2 = L20_2.ItemOffset
                  L19_2 = L19_2 + L20_2
                  L20_2 = L0_1.RightBadge
                  L20_2 = L20_2.Width
                  L21_2 = L0_1.RightBadge
                  L21_2 = L21_2.Height
                  L22_2 = 0
                  L23_2 = L14_2.BadgeColour
                  if L23_2 then
                    L23_2 = L14_2.BadgeColour
                    L23_2 = L23_2.R
                    if L23_2 then
                      goto lbl_324
                    end
                  end
                  L23_2 = 255
                  ::lbl_324::
                  L24_2 = L14_2.BadgeColour
                  if L24_2 then
                    L24_2 = L14_2.BadgeColour
                    L24_2 = L24_2.G
                    if L24_2 then
                      goto lbl_332
                    end
                  end
                  L24_2 = 255
                  ::lbl_332::
                  L25_2 = L14_2.BadgeColour
                  if L25_2 then
                    L25_2 = L14_2.BadgeColour
                    L25_2 = L25_2.B
                    if L25_2 then
                      goto lbl_340
                    end
                  end
                  L25_2 = 255
                  ::lbl_340::
                  L26_2 = L14_2.BadgeColour
                  if L26_2 then
                    L26_2 = L14_2.BadgeColour
                    L26_2 = L26_2.A
                    if L26_2 then
                      goto lbl_348
                    end
                  end
                  L26_2 = 255
                  ::lbl_348::
                  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
                end
              end
              L14_2 = A2_2.RightLabel
              if L14_2 then
                L14_2 = RenderText
                L15_2 = A2_2.RightLabel
                L16_2 = L7_2.X
                L17_2 = L0_1.RightText
                L17_2 = L17_2.X
                L16_2 = L16_2 + L17_2
                L16_2 = L16_2 - L13_2
                L17_2 = L7_2.WidthOffset
                L16_2 = L16_2 + L17_2
                L16_2 = L16_2 - 15
                L17_2 = L7_2.Y
                L18_2 = L0_1.RightText
                L18_2 = L18_2.Y
                L17_2 = L17_2 + L18_2
                L18_2 = L7_2.SubtitleHeight
                L17_2 = L17_2 + L18_2
                L18_2 = RageUI
                L18_2 = L18_2.ItemOffset
                L17_2 = L17_2 + L18_2
                L18_2 = 0
                L19_2 = L0_1.RightText
                L19_2 = L19_2.Scale
                if L9_2 then
                  L20_2 = 255
                  if L20_2 then
                    goto lbl_387
                  end
                end
                L20_2 = 153
                ::lbl_387::
                if L9_2 then
                  L21_2 = 255
                  if L21_2 then
                    goto lbl_393
                  end
                end
                L21_2 = 153
                ::lbl_393::
                if L9_2 then
                  L22_2 = 255
                  if L22_2 then
                    goto lbl_399
                  end
                end
                L22_2 = 153
                ::lbl_399::
                L23_2 = 255
                L24_2 = 2
                L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
              end
              if not L9_2 then
                L14_2 = 104
                if L14_2 then
                  goto lbl_408
                end
              end
              L14_2 = 255
              ::lbl_408::
              if not L9_2 then
                L15_2 = 108
                if L15_2 then
                  goto lbl_414
                end
              end
              L15_2 = 255
              ::lbl_414::
              if not L9_2 then
                L16_2 = 114
                if L16_2 then
                  goto lbl_420
                end
              end
              L16_2 = 255
              ::lbl_420::
              L17_2 = RenderText
              L18_2 = A0_2 or L18_2
              if L9_2 or not A0_2 then
                L18_2 = A0_2
              end
              L19_2 = L7_2.X
              L20_2 = L0_1.Text
              L20_2 = L20_2.X
              L19_2 = L19_2 + L20_2
              L19_2 = L19_2 + L12_2
              L19_2 = L19_2 + 15
              L20_2 = L7_2.Y
              L21_2 = L0_1.Text
              L21_2 = L21_2.Y
              L20_2 = L20_2 + L21_2
              L21_2 = L7_2.SubtitleHeight
              L20_2 = L20_2 + L21_2
              L21_2 = RageUI
              L21_2 = L21_2.ItemOffset
              L20_2 = L20_2 + L21_2
              L21_2 = 8
              L22_2 = L0_1.Text
              L22_2 = L22_2.Scale
              L23_2 = L14_2
              L24_2 = L15_2
              L25_2 = L16_2
              L26_2 = 255
              L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
            else
              if L11_2 then
                L14_2 = RageUI
                L14_2 = L14_2.BadgeStyle
                L14_2 = L14_2.Lock
                L15_2 = L9_2
                L14_2 = L14_2(L15_2)
                L15_2 = RenderSprite
                L16_2 = L14_2.BadgeDictionary
                if not L16_2 then
                  L16_2 = "commonmenu"
                end
                L17_2 = L14_2.BadgeTexture
                if not L17_2 then
                  L17_2 = ""
                end
                L18_2 = L7_2.X
                L19_2 = L0_1.RightBadge
                L19_2 = L19_2.X
                L18_2 = L18_2 + L19_2
                L19_2 = L7_2.WidthOffset
                L18_2 = L18_2 + L19_2
                L19_2 = L7_2.Y
                L20_2 = L0_1.RightBadge
                L20_2 = L20_2.Y
                L19_2 = L19_2 + L20_2
                L20_2 = L7_2.SubtitleHeight
                L19_2 = L19_2 + L20_2
                L20_2 = RageUI
                L20_2 = L20_2.ItemOffset
                L19_2 = L19_2 + L20_2
                L20_2 = L0_1.RightBadge
                L20_2 = L20_2.Width
                L21_2 = L0_1.RightBadge
                L21_2 = L21_2.Height
                L22_2 = 0
                L23_2 = L14_2.BadgeColour
                if L23_2 then
                  L23_2 = L14_2.BadgeColour
                  L23_2 = L23_2.R
                  if L23_2 then
                    goto lbl_505
                  end
                end
                L23_2 = 255
                ::lbl_505::
                L24_2 = L14_2.BadgeColour
                if L24_2 then
                  L24_2 = L14_2.BadgeColour
                  L24_2 = L24_2.G
                  if L24_2 then
                    goto lbl_513
                  end
                end
                L24_2 = 255
                ::lbl_513::
                L25_2 = L14_2.BadgeColour
                if L25_2 then
                  L25_2 = L14_2.BadgeColour
                  L25_2 = L25_2.B
                  if L25_2 then
                    goto lbl_521
                  end
                end
                L25_2 = 255
                ::lbl_521::
                L26_2 = L14_2.BadgeColour
                if L26_2 then
                  L26_2 = L14_2.BadgeColour
                  L26_2 = L26_2.A
                  if L26_2 then
                    goto lbl_529
                  end
                end
                L26_2 = 255
                ::lbl_529::
                L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
              end
              if not L9_2 then
                L14_2 = 104
                if L14_2 then
                  goto lbl_536
                end
              end
              L14_2 = 124
              ::lbl_536::
              if not L9_2 then
                L15_2 = 108
                if L15_2 then
                  goto lbl_542
                end
              end
              L15_2 = 129
              ::lbl_542::
              if not L9_2 then
                L16_2 = 114
                if L16_2 then
                  goto lbl_548
                end
              end
              L16_2 = 135
              ::lbl_548::
              L17_2 = RenderText
              L18_2 = A0_2
              L19_2 = L7_2.X
              L20_2 = L0_1.Text
              L20_2 = L20_2.X
              L19_2 = L19_2 + L20_2
              L19_2 = L19_2 + L12_2
              L19_2 = L19_2 + 15
              L20_2 = L7_2.Y
              L21_2 = L0_1.Text
              L21_2 = L21_2.Y
              L20_2 = L20_2 + L21_2
              L21_2 = L7_2.SubtitleHeight
              L20_2 = L20_2 + L21_2
              L21_2 = RageUI
              L21_2 = L21_2.ItemOffset
              L20_2 = L20_2 + L21_2
              L21_2 = 8
              L22_2 = L0_1.Text
              L22_2 = L22_2.Scale
              L23_2 = L14_2
              L24_2 = L15_2
              L25_2 = L16_2
              L26_2 = 255
              L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
            end
            L14_2 = RageUI
            L15_2 = RageUI
            L15_2 = L15_2.ItemOffset
            L16_2 = L0_1.Rectangle
            L16_2 = L16_2.Height
            L15_2 = L15_2 + L16_2
            L14_2.ItemOffset = L15_2
            L14_2 = RageUI
            L14_2 = L14_2.ItemsDescription
            L15_2 = L7_2
            L16_2 = A1_2
            L17_2 = L9_2
            L14_2(L15_2, L16_2, L17_2)
            if A3_2 then
              L14_2 = L7_2.EnableMouse
              if L14_2 then
                L14_2 = L7_2.CursorStyle
                if 0 ~= L14_2 then
                  L14_2 = L7_2.CursorStyle
                end
                L14_2 = RageUI
                L14_2 = L14_2.ItemsMouseBounds
                L15_2 = L7_2
                L16_2 = L9_2
                L17_2 = L8_2 + 1
                L18_2 = L0_1
                L14_2 = 1 == L14_2 and L14_2
              end
              L15_2 = L7_2.Controls
              L15_2 = L15_2.Select
              L15_2 = L15_2.Active
              if not L15_2 then
                if not L14_2 then
                  goto lbl_628
                  L15_2 = L14_2 or L15_2
                end
                L15_2 = L7_2.Controls
                L15_2 = L15_2.Click
                L15_2 = L15_2.Active
                if not L15_2 then
                  goto lbl_628
                end
              end
              L15_2 = L9_2
              ::lbl_628::
              L16_2 = A4_2.onHovered
              if nil ~= L16_2 and L14_2 then
                L16_2 = A4_2.onHovered
                L16_2()
              end
              L16_2 = A4_2.onActive
              if nil ~= L16_2 and L9_2 then
                L16_2 = A4_2.onActive
                L16_2()
              end
              if L15_2 then
                L16_2 = RageUI
                L16_2 = L16_2.Settings
                L16_2 = L16_2.Audio
                L17_2 = RageUI
                L17_2 = L17_2.PlaySound
                L18_2 = L16_2.Use
                L18_2 = L16_2[L18_2]
                L18_2 = L18_2.Select
                L18_2 = L18_2.audioName
                L19_2 = L16_2.Use
                L19_2 = L16_2[L19_2]
                L19_2 = L19_2.Select
                L19_2 = L19_2.audioRef
                L17_2(L18_2, L19_2)
                L17_2 = A4_2.onSelected
                if nil ~= L17_2 then
                  L17_2 = Citizen
                  L17_2 = L17_2.CreateThread
                  function L18_2()
                    local L0_3, L1_3
                    L0_3 = A4_2.onSelected
                    L0_3()
                  end
                  L17_2(L18_2)
                end
                if A5_2 then
                  L17_2 = A5_2
                  L17_2 = L17_2()
                  if L17_2 then
                    L17_2 = RageUI
                    L17_2.NextMenu = A5_2
                  end
                end
              end
            end
          end
        end
        L9_2 = RageUI
        L10_2 = RageUI
        L10_2 = L10_2.Options
        L10_2 = L10_2 + 1
        L9_2.Options = L10_2
      end
    end
    return
  end
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L2_3 = pairs
    L3_3 = A0_3
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
      L8_3 = L7_3.label
      if L8_3 == A1_3 then
        L8_3 = true
        return L8_3
      end
    end
    L2_3 = false
    return L2_3
  end
  IsInTable = L7_2
  L7_2 = L6_2[A0_2]
  if nil ~= L7_2 then
    L7_2 = L6_2[A0_2]
    if L7_2 then
      goto lbl_698
      A3_2 = L7_2 or A3_2
    end
  end
  L7_2 = IsInTable
  L8_2 = buttonlist_data
  L9_2 = A0_2
  L7_2 = L7_2(L8_2, L9_2)
  A3_2 = not L7_2 and A3_2
  ::lbl_698::
  L7_2 = RageUI
  L7_2 = L7_2.CurrentMenu
  if nil ~= L7_2 then
    L8_2 = L7_2
    L8_2 = L8_2()
    if L8_2 then
      L8_2 = RageUI
      L8_2 = L8_2.Options
      L8_2 = L8_2 + 1
      L9_2 = L7_2.Pagination
      L9_2 = L9_2.Minimum
      if L8_2 >= L9_2 then
        L9_2 = L7_2.Pagination
        L9_2 = L9_2.Maximum
        if L8_2 <= L9_2 then
          L9_2 = L7_2.Index
          L9_2 = L9_2 == L8_2
          L10_2 = RageUI
          L10_2 = L10_2.ItemsSafeZone
          L11_2 = L7_2
          L10_2(L11_2)
          L10_2 = A2_2.LeftBadge
          if L10_2 then
            L10_2 = A2_2.LeftBadge
            L11_2 = RageUI
            L11_2 = L11_2.BadgeStyle
            L11_2 = L11_2.None
            L10_2 = L10_2 ~= L11_2
          end
          L11_2 = A2_2.RightBadge
          if L11_2 then
            L11_2 = A2_2.RightBadge
            L12_2 = RageUI
            L12_2 = L12_2.BadgeStyle
            L12_2 = L12_2.None
          end
          L11_2 = L11_2 ~= L12_2
          if L10_2 then
            L12_2 = 27
            if L12_2 then
              goto lbl_763
            end
          end
          L12_2 = 0
          ::lbl_763::
          if L11_2 then
            L13_2 = 32
            if L13_2 then
              goto lbl_769
            end
          end
          L13_2 = 0
          ::lbl_769::
          L14_2 = L4_1
          if not L14_2 then
            L14_2 = true
            L4_1 = L14_2
            L14_2 = Citizen
            L14_2 = L14_2.CreateThread
            function L15_2()
              local L0_3, L1_3
              while true do
                L0_3 = L1_1
                if L0_3 <= 5 then
                  L0_3 = L1_1
                  L0_3 = L0_3 + 2
                  L1_1 = L0_3
                else
                  L0_3 = L1_1
                  L0_3 = L0_3 + 7
                  L1_1 = L0_3
                end
                L0_3 = L5_1
                L0_3 = L0_3 - 3
                L1_3 = 5
                L5_1 = L0_3
                L0_3 = L1_1
                L1_3 = 300
                if L0_3 >= L1_3 then
                  L0_3 = 0
                  L1_1 = L0_3
                  L0_3 = 100
                  L5_1 = L0_3
                  L0_3 = false
                  L3_1 = L0_3
                end
                L0_3 = RageUI
                L0_3 = L0_3.CurrentMenu
                if not L0_3 then
                  L0_3 = false
                  L4_1 = L0_3
                  L0_3 = true
                  L3_1 = L0_3
                  return
                end
                L0_3 = Wait
                L1_3 = 10
                L0_3(L1_3)
              end
            end
            L14_2(L15_2)
          end
          L14_2 = RenderRectangle
          L15_2 = L7_2.X
          L15_2 = L15_2 + 15
          L16_2 = L7_2.Y
          L17_2 = L0_1.SelectedSprite
          L17_2 = L17_2.Y
          L16_2 = L16_2 + L17_2
          L17_2 = L7_2.SubtitleHeight
          L16_2 = L16_2 + L17_2
          L17_2 = RageUI
          L17_2 = L17_2.ItemOffset
          L16_2 = L16_2 + L17_2
          L17_2 = L0_1.SelectedSprite
          L17_2 = L17_2.Width
          L18_2 = L7_2.WidthOffset
          L17_2 = L17_2 + L18_2
          L17_2 = L17_2 - 30
          L18_2 = L0_1.SelectedSprite
          L18_2 = L18_2.Height
          L18_2 = L18_2 - 3
          L19_2 = 35
          L20_2 = 39
          L21_2 = 47
          L22_2 = 255
          L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
          if L9_2 then
            L14_2 = L3_1
            if L14_2 then
              L14_2 = RenderRectangle
              L15_2 = L7_2.X
              L15_2 = L15_2 + 15
              L16_2 = L1_1
              L15_2 = L15_2 + L16_2
              L16_2 = L7_2.Y
              L17_2 = L0_1.SelectedSprite
              L17_2 = L17_2.Y
              L16_2 = L16_2 + L17_2
              L17_2 = L7_2.SubtitleHeight
              L16_2 = L16_2 + L17_2
              L17_2 = RageUI
              L17_2 = L17_2.ItemOffset
              L16_2 = L16_2 + L17_2
              L17_2 = L0_1.SelectedSprite
              L17_2 = L17_2.Width
              L18_2 = L7_2.WidthOffset
              L17_2 = L17_2 + L18_2
              L17_2 = L17_2 - 300
              L18_2 = L0_1.SelectedSprite
              L18_2 = L18_2.Height
              L18_2 = L18_2 - 3
              L19_2 = 39
              L20_2 = 107
              L21_2 = 218
              L22_2 = L5_1
              L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            end
          end
          if L9_2 then
            L14_2 = RenderRectangle
            L15_2 = L7_2.X
            L15_2 = L15_2 + 15
            L16_2 = L7_2.Y
            L17_2 = L0_1.SelectedSprite
            L17_2 = L17_2.Y
            L16_2 = L16_2 + L17_2
            L17_2 = L7_2.SubtitleHeight
            L16_2 = L16_2 + L17_2
            L17_2 = RageUI
            L17_2 = L17_2.ItemOffset
            L16_2 = L16_2 + L17_2
            L17_2 = L0_1.SelectedSprite
            L17_2 = L17_2.Width
            L18_2 = L7_2.WidthOffset
            L17_2 = L17_2 + L18_2
            L17_2 = L17_2 - 427
            L18_2 = L0_1.SelectedSprite
            L18_2 = L18_2.Height
            L18_2 = L18_2 - 3
            L19_2 = 39
            L20_2 = 107
            L21_2 = 218
            L22_2 = 255
            L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
          end
          if A3_2 then
            if L10_2 then
              L14_2 = A2_2.LeftBadge
              if nil ~= L14_2 then
                L14_2 = A2_2.LeftBadge
                L15_2 = L9_2
                L14_2 = L14_2(L15_2)
                L15_2 = RenderSprite
                L16_2 = L14_2.BadgeDictionary
                if not L16_2 then
                  L16_2 = "commonmenu"
                end
                L17_2 = L14_2.BadgeTexture
                if not L17_2 then
                  L17_2 = ""
                end
                L18_2 = L7_2.X
                L18_2 = L18_2 + 17
                L19_2 = L7_2.Y
                L20_2 = L0_1.LeftBadge
                L20_2 = L20_2.Y
                L19_2 = L19_2 + L20_2
                L20_2 = L7_2.SubtitleHeight
                L19_2 = L19_2 + L20_2
                L20_2 = RageUI
                L20_2 = L20_2.ItemOffset
                L19_2 = L19_2 + L20_2
                L20_2 = L0_1.LeftBadge
                L20_2 = L20_2.Width
                L21_2 = L0_1.LeftBadge
                L21_2 = L21_2.Height
                L22_2 = 0
                L23_2 = L14_2.BadgeColour
                if L23_2 then
                  L23_2 = L14_2.BadgeColour
                  L23_2 = L23_2.R
                  if L23_2 then
                    goto lbl_931
                  end
                end
                L23_2 = 255
                ::lbl_931::
                L24_2 = L14_2.BadgeColour
                if L24_2 then
                  L24_2 = L14_2.BadgeColour
                  L24_2 = L24_2.G
                  if L24_2 then
                    goto lbl_939
                  end
                end
                L24_2 = 255
                ::lbl_939::
                L25_2 = L14_2.BadgeColour
                if L25_2 then
                  L25_2 = L14_2.BadgeColour
                  L25_2 = L25_2.B
                  if L25_2 then
                    goto lbl_947
                  end
                end
                L25_2 = 255
                ::lbl_947::
                L26_2 = L14_2.BadgeColour
                if L26_2 then
                  L26_2 = L14_2.BadgeColour
                  L26_2 = L26_2.A
                  if L26_2 then
                    goto lbl_955
                  end
                end
                L26_2 = 255
                ::lbl_955::
                L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
              end
            end
            if L11_2 then
              L14_2 = A2_2.RightBadge
              if nil ~= L14_2 then
                L14_2 = A2_2.RightBadge
                L15_2 = L9_2
                L14_2 = L14_2(L15_2)
                L15_2 = RenderSprite
                L16_2 = L14_2.BadgeDictionary
                if not L16_2 then
                  L16_2 = "commonmenu"
                end
                L17_2 = L14_2.BadgeTexture
                if not L17_2 then
                  L17_2 = ""
                end
                L18_2 = L7_2.X
                L19_2 = L0_1.RightBadge
                L19_2 = L19_2.X
                L18_2 = L18_2 + L19_2
                L19_2 = L7_2.WidthOffset
                L18_2 = L18_2 + L19_2
                L19_2 = L7_2.Y
                L20_2 = L0_1.RightBadge
                L20_2 = L20_2.Y
                L19_2 = L19_2 + L20_2
                L20_2 = L7_2.SubtitleHeight
                L19_2 = L19_2 + L20_2
                L20_2 = RageUI
                L20_2 = L20_2.ItemOffset
                L19_2 = L19_2 + L20_2
                L20_2 = L0_1.RightBadge
                L20_2 = L20_2.Width
                L21_2 = L0_1.RightBadge
                L21_2 = L21_2.Height
                L22_2 = 0
                L23_2 = L14_2.BadgeColour
                if L23_2 then
                  L23_2 = L14_2.BadgeColour
                  L23_2 = L23_2.R
                  if L23_2 then
                    goto lbl_1006
                  end
                end
                L23_2 = 255
                ::lbl_1006::
                L24_2 = L14_2.BadgeColour
                if L24_2 then
                  L24_2 = L14_2.BadgeColour
                  L24_2 = L24_2.G
                  if L24_2 then
                    goto lbl_1014
                  end
                end
                L24_2 = 255
                ::lbl_1014::
                L25_2 = L14_2.BadgeColour
                if L25_2 then
                  L25_2 = L14_2.BadgeColour
                  L25_2 = L25_2.B
                  if L25_2 then
                    goto lbl_1022
                  end
                end
                L25_2 = 255
                ::lbl_1022::
                L26_2 = L14_2.BadgeColour
                if L26_2 then
                  L26_2 = L14_2.BadgeColour
                  L26_2 = L26_2.A
                  if L26_2 then
                    goto lbl_1030
                  end
                end
                L26_2 = 255
                ::lbl_1030::
                L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
              end
            end
            L14_2 = A2_2.RightLabel
            if L14_2 then
              L14_2 = RenderText
              L15_2 = A2_2.RightLabel
              L16_2 = L7_2.X
              L17_2 = L0_1.RightText
              L17_2 = L17_2.X
              L16_2 = L16_2 + L17_2
              L16_2 = L16_2 - L13_2
              L17_2 = L7_2.WidthOffset
              L16_2 = L16_2 + L17_2
              L16_2 = L16_2 - 15
              L17_2 = L7_2.Y
              L18_2 = L0_1.RightText
              L18_2 = L18_2.Y
              L17_2 = L17_2 + L18_2
              L18_2 = L7_2.SubtitleHeight
              L17_2 = L17_2 + L18_2
              L18_2 = RageUI
              L18_2 = L18_2.ItemOffset
              L17_2 = L17_2 + L18_2
              L18_2 = 0
              L19_2 = L0_1.RightText
              L19_2 = L19_2.Scale
              if L9_2 then
                L20_2 = 255
                if L20_2 then
                  goto lbl_1069
                end
              end
              L20_2 = 153
              ::lbl_1069::
              if L9_2 then
                L21_2 = 255
                if L21_2 then
                  goto lbl_1075
                end
              end
              L21_2 = 153
              ::lbl_1075::
              if L9_2 then
                L22_2 = 255
                if L22_2 then
                  goto lbl_1081
                end
              end
              L22_2 = 153
              ::lbl_1081::
              L23_2 = 255
              L24_2 = 2
              L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
            end
            if not L9_2 then
              L14_2 = 104
              if L14_2 then
                goto lbl_1090
              end
            end
            L14_2 = 255
            ::lbl_1090::
            if not L9_2 then
              L15_2 = 108
              if L15_2 then
                goto lbl_1096
              end
            end
            L15_2 = 255
            ::lbl_1096::
            if not L9_2 then
              L16_2 = 114
              if L16_2 then
                goto lbl_1102
              end
            end
            L16_2 = 255
            ::lbl_1102::
            L17_2 = RenderText
            L18_2 = A0_2 or L18_2
            if L9_2 or not A0_2 then
              L18_2 = A0_2
            end
            L19_2 = L7_2.X
            L20_2 = L0_1.Text
            L20_2 = L20_2.X
            L19_2 = L19_2 + L20_2
            L19_2 = L19_2 + L12_2
            L19_2 = L19_2 + 15
            L20_2 = L7_2.Y
            L21_2 = L0_1.Text
            L21_2 = L21_2.Y
            L20_2 = L20_2 + L21_2
            L21_2 = L7_2.SubtitleHeight
            L20_2 = L20_2 + L21_2
            L21_2 = RageUI
            L21_2 = L21_2.ItemOffset
            L20_2 = L20_2 + L21_2
            L21_2 = 8
            L22_2 = L0_1.Text
            L22_2 = L22_2.Scale
            L23_2 = L14_2
            L24_2 = L15_2
            L25_2 = L16_2
            L26_2 = 255
            L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
          else
            if L11_2 then
              L14_2 = RageUI
              L14_2 = L14_2.BadgeStyle
              L14_2 = L14_2.Lock
              L15_2 = L9_2
              L14_2 = L14_2(L15_2)
              L15_2 = RenderSprite
              L16_2 = L14_2.BadgeDictionary
              if not L16_2 then
                L16_2 = "commonmenu"
              end
              L17_2 = L14_2.BadgeTexture
              if not L17_2 then
                L17_2 = ""
              end
              L18_2 = L7_2.X
              L19_2 = L0_1.RightBadge
              L19_2 = L19_2.X
              L18_2 = L18_2 + L19_2
              L19_2 = L7_2.WidthOffset
              L18_2 = L18_2 + L19_2
              L19_2 = L7_2.Y
              L20_2 = L0_1.RightBadge
              L20_2 = L20_2.Y
              L19_2 = L19_2 + L20_2
              L20_2 = L7_2.SubtitleHeight
              L19_2 = L19_2 + L20_2
              L20_2 = RageUI
              L20_2 = L20_2.ItemOffset
              L19_2 = L19_2 + L20_2
              L20_2 = L0_1.RightBadge
              L20_2 = L20_2.Width
              L21_2 = L0_1.RightBadge
              L21_2 = L21_2.Height
              L22_2 = 0
              L23_2 = L14_2.BadgeColour
              if L23_2 then
                L23_2 = L14_2.BadgeColour
                L23_2 = L23_2.R
                if L23_2 then
                  goto lbl_1187
                end
              end
              L23_2 = 255
              ::lbl_1187::
              L24_2 = L14_2.BadgeColour
              if L24_2 then
                L24_2 = L14_2.BadgeColour
                L24_2 = L24_2.G
                if L24_2 then
                  goto lbl_1195
                end
              end
              L24_2 = 255
              ::lbl_1195::
              L25_2 = L14_2.BadgeColour
              if L25_2 then
                L25_2 = L14_2.BadgeColour
                L25_2 = L25_2.B
                if L25_2 then
                  goto lbl_1203
                end
              end
              L25_2 = 255
              ::lbl_1203::
              L26_2 = L14_2.BadgeColour
              if L26_2 then
                L26_2 = L14_2.BadgeColour
                L26_2 = L26_2.A
                if L26_2 then
                  goto lbl_1211
                end
              end
              L26_2 = 255
              ::lbl_1211::
              L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
            end
            if not L9_2 then
              L14_2 = 104
              if L14_2 then
                goto lbl_1218
              end
            end
            L14_2 = 124
            ::lbl_1218::
            if not L9_2 then
              L15_2 = 108
              if L15_2 then
                goto lbl_1224
              end
            end
            L15_2 = 129
            ::lbl_1224::
            if not L9_2 then
              L16_2 = 114
              if L16_2 then
                goto lbl_1230
              end
            end
            L16_2 = 135
            ::lbl_1230::
            L17_2 = RenderText
            L18_2 = A0_2
            L19_2 = L7_2.X
            L20_2 = L0_1.Text
            L20_2 = L20_2.X
            L19_2 = L19_2 + L20_2
            L19_2 = L19_2 + L12_2
            L19_2 = L19_2 + 15
            L20_2 = L7_2.Y
            L21_2 = L0_1.Text
            L21_2 = L21_2.Y
            L20_2 = L20_2 + L21_2
            L21_2 = L7_2.SubtitleHeight
            L20_2 = L20_2 + L21_2
            L21_2 = RageUI
            L21_2 = L21_2.ItemOffset
            L20_2 = L20_2 + L21_2
            L21_2 = 8
            L22_2 = L0_1.Text
            L22_2 = L22_2.Scale
            L23_2 = L14_2
            L24_2 = L15_2
            L25_2 = L16_2
            L26_2 = 255
            L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
          end
          L14_2 = RageUI
          L15_2 = RageUI
          L15_2 = L15_2.ItemOffset
          L16_2 = L0_1.Rectangle
          L16_2 = L16_2.Height
          L15_2 = L15_2 + L16_2
          L14_2.ItemOffset = L15_2
          L14_2 = RageUI
          L14_2 = L14_2.ItemsDescription
          L15_2 = L7_2
          L16_2 = A1_2
          L17_2 = L9_2
          L14_2(L15_2, L16_2, L17_2)
          if A3_2 then
            L14_2 = L7_2.EnableMouse
            if L14_2 then
              L14_2 = L7_2.CursorStyle
              if 0 ~= L14_2 then
                L14_2 = L7_2.CursorStyle
              end
              L14_2 = RageUI
              L14_2 = L14_2.ItemsMouseBounds
              L15_2 = L7_2
              L16_2 = L9_2
              L17_2 = L8_2 + 1
              L18_2 = L0_1
              L14_2 = 1 == L14_2 and L14_2
            end
            L15_2 = L7_2.Controls
            L15_2 = L15_2.Select
            L15_2 = L15_2.Active
            if not L15_2 then
              if not L14_2 then
                goto lbl_1310
                L15_2 = L14_2 or L15_2
              end
              L15_2 = L7_2.Controls
              L15_2 = L15_2.Click
              L15_2 = L15_2.Active
              if not L15_2 then
                goto lbl_1310
              end
            end
            L15_2 = L9_2
            ::lbl_1310::
            L16_2 = A4_2.onHovered
            if nil ~= L16_2 and L14_2 then
              L16_2 = A4_2.onHovered
              L16_2()
            end
            L16_2 = A4_2.onActive
            if nil ~= L16_2 and L9_2 then
              L16_2 = A4_2.onActive
              L16_2()
            end
            if L15_2 then
              L16_2 = RageUI
              L16_2 = L16_2.Settings
              L16_2 = L16_2.Audio
              L17_2 = RageUI
              L17_2 = L17_2.PlaySound
              L18_2 = L16_2.Use
              L18_2 = L16_2[L18_2]
              L18_2 = L18_2.Select
              L18_2 = L18_2.audioName
              L19_2 = L16_2.Use
              L19_2 = L16_2[L19_2]
              L19_2 = L19_2.Select
              L19_2 = L19_2.audioRef
              L17_2(L18_2, L19_2)
              L17_2 = A4_2.onSelected
              if nil ~= L17_2 then
                L17_2 = Citizen
                L17_2 = L17_2.CreateThread
                function L18_2()
                  local L0_3, L1_3
                  L0_3 = A4_2.onSelected
                  L0_3()
                end
                L17_2(L18_2)
              end
              if A5_2 then
                L17_2 = A5_2
                L17_2 = L17_2()
                if L17_2 then
                  L17_2 = RageUI
                  L17_2.NextMenu = A5_2
                end
              end
            end
          end
        end
      end
      L9_2 = RageUI
      L10_2 = RageUI
      L10_2 = L10_2.Options
      L10_2 = L10_2 + 1
      L9_2.Options = L10_2
    end
  end
end
L6_1.Button = L7_1
L6_1 = RageUI
function L7_1()
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
      L1_1 = L0_3
      L0_3 = true
      L3_1 = L0_3
      L0_3 = 100
      L5_1 = L0_3
      break
    end
  end
  L0_2(L1_2)
end
L6_1.ReloadAnimation = L7_1
