local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = {}
L1_1 = {}
L1_1.Y = 0
L1_1.Width = 431
L1_1.Height = 43
L0_1.Rectangle = L1_1
L1_1 = {}
L1_1.X = 25
L1_1.Y = 7
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
L1_1.X = 420
L1_1.Y = 4
L1_1.Scale = 0.25
L0_1.RightText = L1_1
L1_1 = {}
L1_1.Dictionary = "commonmenu"
L1_1.Texture = "gradient_nav"
L1_1.Y = 0
L1_1.Width = 431
L1_1.Height = 38
L0_1.SelectedSprite = L1_1
L1_1 = {}
L1_1.Dictionary = "commonmenu"
L2_1 = {}
L3_1 = "shop_box_blankb"
L4_1 = "shop_box_tickb"
L5_1 = "shop_box_blank"
L6_1 = "shop_box_tick"
L7_1 = "shop_box_crossb"
L8_1 = "shop_box_cross"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L1_1.Textures = L2_1
L1_1.X = 370
L1_1.Y = -3
L1_1.Width = 40
L1_1.Height = 40
L2_1 = RageUI
L3_1 = {}
L3_1.Tick = 1
L3_1.Cross = 2
L2_1.CheckboxStyle = L3_1
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = RageUI
  L5_2 = L5_2.CurrentMenu
  if nil == A4_2 then
    A4_2 = 0
  end
  if A1_2 then
    L6_2 = RenderSprite
    L7_2 = L1_1.Dictionary
    L8_2 = L1_1.Textures
    L8_2 = L8_2[A3_2]
    L9_2 = L5_2.X
    L10_2 = L1_1.X
    L9_2 = L9_2 + L10_2
    L10_2 = L5_2.WidthOffset
    L9_2 = L9_2 + L10_2
    L9_2 = L9_2 - A4_2
    L10_2 = L5_2.Y
    L11_2 = L1_1.Y
    L10_2 = L10_2 + L11_2
    L11_2 = L5_2.SubtitleHeight
    L10_2 = L10_2 + L11_2
    L11_2 = RageUI
    L11_2 = L11_2.ItemOffset
    L10_2 = L10_2 + L11_2
    L11_2 = L1_1.Width
    L12_2 = L1_1.Height
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  else
    L6_2 = RenderSprite
    L7_2 = L1_1.Dictionary
    L8_2 = L1_1.Textures
    L8_2 = L8_2[3]
    L9_2 = L5_2.X
    L10_2 = L1_1.X
    L9_2 = L9_2 + L10_2
    L10_2 = L5_2.WidthOffset
    L9_2 = L9_2 + L10_2
    L9_2 = L9_2 - A4_2
    L10_2 = L5_2.Y
    L11_2 = L1_1.Y
    L10_2 = L10_2 + L11_2
    L11_2 = L5_2.SubtitleHeight
    L10_2 = L10_2 + L11_2
    L11_2 = RageUI
    L11_2 = L11_2.ItemOffset
    L10_2 = L10_2 + L11_2
    L11_2 = L1_1.Width
    L12_2 = L1_1.Height
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
end
L3_1 = 0
L4_1 = false
L5_1 = true
L6_1 = false
L7_1 = 100
L8_1 = RageUI
function L9_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L5_2 = GetPlayerServerId
  L6_2 = PlayerId
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L6_2()
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
  src = L5_2
  L5_2 = PlayerServer
  L6_2 = src
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2.permission
  if "all" == L5_2 then
    L6_2 = RageUI
    L6_2 = L6_2.CurrentMenu
    if nil ~= L6_2 then
      L7_2 = L6_2
      L7_2 = L7_2()
      if L7_2 then
        L7_2 = RageUI
        L7_2 = L7_2.Options
        L7_2 = L7_2 + 1
        L8_2 = L6_2.Pagination
        L8_2 = L8_2.Minimum
        if L7_2 >= L8_2 then
          L8_2 = L6_2.Pagination
          L8_2 = L8_2.Maximum
          if L7_2 <= L8_2 then
            L8_2 = L6_2.Index
            L8_2 = L8_2 == L7_2
            L9_2 = A3_2.LeftBadge
            L10_2 = RageUI
            L10_2 = L10_2.BadgeStyle
            L10_2 = L10_2.None
            if L9_2 ~= L10_2 then
              L9_2 = A3_2.LeftBadge
              if nil ~= L9_2 then
                goto lbl_49
              end
            end
            L9_2 = 0
            ::lbl_49::
            if not L9_2 then
              L9_2 = 27
            end
            L10_2 = A3_2.RightBadge
            L11_2 = RageUI
            L11_2 = L11_2.BadgeStyle
            L11_2 = L11_2.None
            if L10_2 ~= L11_2 then
              L10_2 = A3_2.RightBadge
              if nil ~= L10_2 then
                goto lbl_62
              end
            end
            L10_2 = 0
            ::lbl_62::
            if not L10_2 then
              L10_2 = 32
            end
            L11_2 = 0
            L12_2 = RageUI
            L12_2 = L12_2.ItemsSafeZone
            L13_2 = L6_2
            L12_2(L13_2)
            L12_2 = RenderRectangle
            L13_2 = L6_2.X
            L13_2 = L13_2 + 15
            L14_2 = L6_2.Y
            L15_2 = L0_1.SelectedSprite
            L15_2 = L15_2.Y
            L14_2 = L14_2 + L15_2
            L15_2 = L6_2.SubtitleHeight
            L14_2 = L14_2 + L15_2
            L15_2 = RageUI
            L15_2 = L15_2.ItemOffset
            L14_2 = L14_2 + L15_2
            L15_2 = L0_1.SelectedSprite
            L15_2 = L15_2.Width
            L16_2 = L6_2.WidthOffset
            L15_2 = L15_2 + L16_2
            L15_2 = L15_2 - 30
            L16_2 = L0_1.SelectedSprite
            L16_2 = L16_2.Height
            L16_2 = L16_2 - 3
            L17_2 = 35
            L18_2 = 39
            L19_2 = 47
            L20_2 = 255
            L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            L12_2 = L6_1
            if not L12_2 then
              L12_2 = true
              L6_1 = L12_2
              L12_2 = Citizen
              L12_2 = L12_2.CreateThread
              function L13_2()
                local L0_3, L1_3
                while true do
                  L0_3 = L3_1
                  if L0_3 <= 5 then
                    L0_3 = L3_1
                    L0_3 = L0_3 + 2
                    L3_1 = L0_3
                  else
                    L0_3 = L3_1
                    L0_3 = L0_3 + 7
                    L3_1 = L0_3
                  end
                  L0_3 = L7_1
                  L0_3 = L0_3 - 3
                  L1_3 = 5
                  L7_1 = L0_3
                  L0_3 = L3_1
                  L1_3 = 300
                  if L0_3 >= L1_3 then
                    L0_3 = 0
                    L3_1 = L0_3
                    L0_3 = 100
                    L7_1 = L0_3
                    L0_3 = false
                    L5_1 = L0_3
                  end
                  L0_3 = RageUI
                  L0_3 = L0_3.CurrentMenu
                  if not L0_3 then
                    L0_3 = false
                    L6_1 = L0_3
                    L0_3 = true
                    L5_1 = L0_3
                    return
                  end
                  L0_3 = Wait
                  L1_3 = 10
                  L0_3(L1_3)
                end
              end
              L12_2(L13_2)
            end
            if L8_2 then
              L12_2 = RenderRectangle
              L13_2 = L6_2.X
              L13_2 = L13_2 + 15
              L14_2 = L6_2.Y
              L15_2 = L0_1.SelectedSprite
              L15_2 = L15_2.Y
              L14_2 = L14_2 + L15_2
              L15_2 = L6_2.SubtitleHeight
              L14_2 = L14_2 + L15_2
              L15_2 = RageUI
              L15_2 = L15_2.ItemOffset
              L14_2 = L14_2 + L15_2
              L15_2 = L0_1.SelectedSprite
              L15_2 = L15_2.Width
              L16_2 = L6_2.WidthOffset
              L15_2 = L15_2 + L16_2
              L15_2 = L15_2 - 427
              L16_2 = L0_1.SelectedSprite
              L16_2 = L16_2.Height
              L16_2 = L16_2 - 3
              L17_2 = 39
              L18_2 = 107
              L19_2 = 218
              L20_2 = 255
              L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            end
            if L8_2 then
              L12_2 = L5_1
              if L12_2 then
                L12_2 = RenderRectangle
                L13_2 = L6_2.X
                L13_2 = L13_2 + 15
                L14_2 = L3_1
                L13_2 = L13_2 + L14_2
                L14_2 = L6_2.Y
                L15_2 = L0_1.SelectedSprite
                L15_2 = L15_2.Y
                L14_2 = L14_2 + L15_2
                L15_2 = L6_2.SubtitleHeight
                L14_2 = L14_2 + L15_2
                L15_2 = RageUI
                L15_2 = L15_2.ItemOffset
                L14_2 = L14_2 + L15_2
                L15_2 = L0_1.SelectedSprite
                L15_2 = L15_2.Width
                L16_2 = L6_2.WidthOffset
                L15_2 = L15_2 + L16_2
                L15_2 = L15_2 - 300
                L16_2 = L0_1.SelectedSprite
                L16_2 = L16_2.Height
                L16_2 = L16_2 - 3
                L17_2 = 39
                L18_2 = 107
                L19_2 = 218
                L20_2 = L7_1
                L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
              end
            end
            L12_2 = type
            L13_2 = A3_2
            L12_2 = L12_2(L13_2)
            if "table" == L12_2 then
              L12_2 = A3_2.Enabled
              if true ~= L12_2 then
                L12_2 = A3_2.Enabled
                if nil ~= L12_2 then
                  goto lbl_412
                end
              end
              if L8_2 then
                L12_2 = RenderText
                L13_2 = A0_2
                L14_2 = L6_2.X
                L15_2 = L0_1.Text
                L15_2 = L15_2.X
                L14_2 = L14_2 + L15_2
                L14_2 = L14_2 + L9_2
                L15_2 = L6_2.Y
                L16_2 = L0_1.Text
                L16_2 = L16_2.Y
                L15_2 = L15_2 + L16_2
                L16_2 = L6_2.SubtitleHeight
                L15_2 = L15_2 + L16_2
                L16_2 = RageUI
                L16_2 = L16_2.ItemOffset
                L15_2 = L15_2 + L16_2
                L16_2 = 0
                L17_2 = L0_1.Text
                L17_2 = L17_2.Scale
                L18_2 = 245
                L19_2 = 245
                L20_2 = 245
                L21_2 = 255
                L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
              else
                L12_2 = RenderText
                L13_2 = A0_2
                L14_2 = L6_2.X
                L15_2 = L0_1.Text
                L15_2 = L15_2.X
                L14_2 = L14_2 + L15_2
                L14_2 = L14_2 + L9_2
                L15_2 = L6_2.Y
                L16_2 = L0_1.Text
                L16_2 = L16_2.Y
                L15_2 = L15_2 + L16_2
                L16_2 = L6_2.SubtitleHeight
                L15_2 = L15_2 + L16_2
                L16_2 = RageUI
                L16_2 = L16_2.ItemOffset
                L15_2 = L15_2 + L16_2
                L16_2 = 0
                L17_2 = L0_1.Text
                L17_2 = L17_2.Scale
                L18_2 = 104
                L19_2 = 108
                L20_2 = 114
                L21_2 = 255
                L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
              end
              L12_2 = type
              L13_2 = A3_2
              L12_2 = L12_2(L13_2)
              if "table" == L12_2 then
                L12_2 = A3_2.LeftBadge
                if nil ~= L12_2 then
                  L12_2 = A3_2.LeftBadge
                  L13_2 = RageUI
                  L13_2 = L13_2.BadgeStyle
                  L13_2 = L13_2.None
                  if L12_2 ~= L13_2 then
                    L12_2 = A3_2.LeftBadge
                    L13_2 = L8_2
                    L12_2 = L12_2(L13_2)
                    L13_2 = RenderSprite
                    L14_2 = L12_2.BadgeDictionary
                    if not L14_2 then
                      L14_2 = "commonmenu"
                    end
                    L15_2 = L12_2.BadgeTexture
                    if not L15_2 then
                      L15_2 = ""
                    end
                    L16_2 = L6_2.X
                    L17_2 = L6_2.Y
                    L18_2 = L0_1.LeftBadge
                    L18_2 = L18_2.Y
                    L17_2 = L17_2 + L18_2
                    L18_2 = L6_2.SubtitleHeight
                    L17_2 = L17_2 + L18_2
                    L18_2 = RageUI
                    L18_2 = L18_2.ItemOffset
                    L17_2 = L17_2 + L18_2
                    L18_2 = L0_1.LeftBadge
                    L18_2 = L18_2.Width
                    L19_2 = L0_1.LeftBadge
                    L19_2 = L19_2.Height
                    L20_2 = 0
                    L21_2 = L12_2.BadgeColour
                    if L21_2 then
                      L21_2 = L12_2.BadgeColour
                      L21_2 = L21_2.R
                      if L21_2 then
                        goto lbl_307
                      end
                    end
                    L21_2 = 255
                    ::lbl_307::
                    L22_2 = L12_2.BadgeColour
                    if L22_2 then
                      L22_2 = L12_2.BadgeColour
                      L22_2 = L22_2.G
                      if L22_2 then
                        goto lbl_315
                      end
                    end
                    L22_2 = 255
                    ::lbl_315::
                    L23_2 = L12_2.BadgeColour
                    if L23_2 then
                      L23_2 = L12_2.BadgeColour
                      L23_2 = L23_2.B
                      if L23_2 then
                        goto lbl_323
                      end
                    end
                    L23_2 = 255
                    ::lbl_323::
                    L24_2 = L12_2.BadgeColour
                    if L24_2 then
                      L24_2 = L12_2.BadgeColour
                      L24_2 = L24_2.A
                      if L24_2 then
                        goto lbl_331
                      end
                    end
                    L24_2 = 255
                    ::lbl_331::
                    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
                  end
                end
                L12_2 = A3_2.RightBadge
                if nil ~= L12_2 then
                  L12_2 = A3_2.RightBadge
                  L13_2 = RageUI
                  L13_2 = L13_2.BadgeStyle
                  L13_2 = L13_2.None
                  if L12_2 ~= L13_2 then
                    L12_2 = A3_2.RightBadge
                    L13_2 = L8_2
                    L12_2 = L12_2(L13_2)
                    L13_2 = RenderSprite
                    L14_2 = L12_2.BadgeDictionary
                    if not L14_2 then
                      L14_2 = "commonmenu"
                    end
                    L15_2 = L12_2.BadgeTexture
                    if not L15_2 then
                      L15_2 = ""
                    end
                    L16_2 = L6_2.X
                    L17_2 = L0_1.RightBadge
                    L17_2 = L17_2.X
                    L16_2 = L16_2 + L17_2
                    L17_2 = L6_2.WidthOffset
                    L16_2 = L16_2 + L17_2
                    L17_2 = L6_2.Y
                    L18_2 = L0_1.RightBadge
                    L18_2 = L18_2.Y
                    L17_2 = L17_2 + L18_2
                    L18_2 = L6_2.SubtitleHeight
                    L17_2 = L17_2 + L18_2
                    L18_2 = RageUI
                    L18_2 = L18_2.ItemOffset
                    L17_2 = L17_2 + L18_2
                    L18_2 = L0_1.RightBadge
                    L18_2 = L18_2.Width
                    L19_2 = L0_1.RightBadge
                    L19_2 = L19_2.Height
                    L20_2 = 0
                    L21_2 = L12_2.BadgeColour
                    if L21_2 then
                      L21_2 = L12_2.BadgeColour
                      L21_2 = L21_2.R
                      if L21_2 then
                        goto lbl_386
                      end
                    end
                    L21_2 = 255
                    ::lbl_386::
                    L22_2 = L12_2.BadgeColour
                    if L22_2 then
                      L22_2 = L12_2.BadgeColour
                      L22_2 = L22_2.G
                      if L22_2 then
                        goto lbl_394
                      end
                    end
                    L22_2 = 255
                    ::lbl_394::
                    L23_2 = L12_2.BadgeColour
                    if L23_2 then
                      L23_2 = L12_2.BadgeColour
                      L23_2 = L23_2.B
                      if L23_2 then
                        goto lbl_402
                      end
                    end
                    L23_2 = 255
                    ::lbl_402::
                    L24_2 = L12_2.BadgeColour
                    if L24_2 then
                      L24_2 = L12_2.BadgeColour
                      L24_2 = L24_2.A
                      if L24_2 then
                        goto lbl_410
                      end
                    end
                    L24_2 = 255
                    ::lbl_410::
                    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
                    goto lbl_545
                    ::lbl_412::
                    L12_2 = RageUI
                    L12_2 = L12_2.BadgeStyle
                    L12_2 = L12_2.Lock
                    L13_2 = RageUI
                    L13_2 = L13_2.BadgeStyle
                    L13_2 = L13_2.None
                    if L12_2 == L13_2 or nil == L12_2 then
                      L13_2 = 0
                      if L13_2 then
                        goto lbl_426
                      end
                    end
                    L13_2 = 27
                    ::lbl_426::
                    if L8_2 then
                      L14_2 = RenderText
                      L15_2 = A0_2
                      L16_2 = L6_2.X
                      L17_2 = L0_1.Text
                      L17_2 = L17_2.X
                      L16_2 = L16_2 + L17_2
                      L16_2 = L16_2 + L13_2
                      L17_2 = L6_2.Y
                      L18_2 = L0_1.Text
                      L18_2 = L18_2.Y
                      L17_2 = L17_2 + L18_2
                      L18_2 = L6_2.SubtitleHeight
                      L17_2 = L17_2 + L18_2
                      L18_2 = RageUI
                      L18_2 = L18_2.ItemOffset
                      L17_2 = L17_2 + L18_2
                      L18_2 = 8
                      L19_2 = L0_1.Text
                      L19_2 = L19_2.Scale
                      L20_2 = 0
                      L21_2 = 0
                      L22_2 = 0
                      L23_2 = 255
                      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                    else
                      L14_2 = RenderText
                      L15_2 = A0_2
                      L16_2 = L6_2.X
                      L17_2 = L0_1.Text
                      L17_2 = L17_2.X
                      L16_2 = L16_2 + L17_2
                      L16_2 = L16_2 + L13_2
                      L17_2 = L6_2.Y
                      L18_2 = L0_1.Text
                      L18_2 = L18_2.Y
                      L17_2 = L17_2 + L18_2
                      L18_2 = L6_2.SubtitleHeight
                      L17_2 = L17_2 + L18_2
                      L18_2 = RageUI
                      L18_2 = L18_2.ItemOffset
                      L17_2 = L17_2 + L18_2
                      L18_2 = 8
                      L19_2 = L0_1.Text
                      L19_2 = L19_2.Scale
                      L20_2 = 163
                      L21_2 = 159
                      L22_2 = 148
                      L23_2 = 255
                      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                    end
                    L14_2 = RageUI
                    L14_2 = L14_2.BadgeStyle
                    L14_2 = L14_2.None
                    if L12_2 ~= L14_2 and nil ~= L12_2 then
                      L14_2 = L12_2
                      L15_2 = L8_2
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
                      L18_2 = L6_2.X
                      L19_2 = L6_2.Y
                      L20_2 = L0_1.LeftBadge
                      L20_2 = L20_2.Y
                      L19_2 = L19_2 + L20_2
                      L20_2 = L6_2.SubtitleHeight
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
                      L23_2 = L23_2.R
                      if not L23_2 then
                        L23_2 = 255
                      end
                      L24_2 = L14_2.BadgeColour
                      L24_2 = L24_2.G
                      if not L24_2 then
                        L24_2 = 255
                      end
                      L25_2 = L14_2.BadgeColour
                      L25_2 = L25_2.B
                      if not L25_2 then
                        L25_2 = 255
                      end
                      L26_2 = L14_2.BadgeColour
                      L26_2 = L26_2.A
                      if not L26_2 then
                        L26_2 = 255
                      end
                      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
                    end
                  end
                end
              end
              ::lbl_545::
              L12_2 = A3_2.Enabled
              if true ~= L12_2 then
                L12_2 = A3_2.Enabled
                if nil ~= L12_2 then
                  goto lbl_644
                end
              end
              if L8_2 then
                L12_2 = A3_2.RightLabel
                if nil ~= L12_2 then
                  L12_2 = A3_2.RightLabel
                  if "" ~= L12_2 then
                    L12_2 = RenderText
                    L13_2 = A3_2.RightLabel
                    L14_2 = L6_2.X
                    L15_2 = L0_1.RightText
                    L15_2 = L15_2.X
                    L14_2 = L14_2 + L15_2
                    L14_2 = L14_2 - L10_2
                    L15_2 = L6_2.WidthOffset
                    L14_2 = L14_2 + L15_2
                    L15_2 = L6_2.Y
                    L16_2 = L0_1.RightText
                    L16_2 = L16_2.Y
                    L15_2 = L15_2 + L16_2
                    L16_2 = L6_2.SubtitleHeight
                    L15_2 = L15_2 + L16_2
                    L16_2 = RageUI
                    L16_2 = L16_2.ItemOffset
                    L15_2 = L15_2 + L16_2
                    L16_2 = 0
                    L17_2 = L0_1.RightText
                    L17_2 = L17_2.Scale
                    L18_2 = 0
                    L19_2 = 0
                    L20_2 = 0
                    L21_2 = 255
                    L22_2 = 2
                    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    L12_2 = MeasureStringWidth
                    L13_2 = A3_2.RightLabel
                    L14_2 = 0
                    L15_2 = 0.35
                    L12_2 = L12_2(L13_2, L14_2, L15_2)
                    L11_2 = L12_2
                  end
                end
              else
                L12_2 = A3_2.RightLabel
                if nil ~= L12_2 then
                  L12_2 = A3_2.RightLabel
                  if "" ~= L12_2 then
                    L12_2 = RenderText
                    L13_2 = A3_2.RightLabel
                    L14_2 = L6_2.X
                    L15_2 = L0_1.RightText
                    L15_2 = L15_2.X
                    L14_2 = L14_2 + L15_2
                    L14_2 = L14_2 - L10_2
                    L15_2 = L6_2.WidthOffset
                    L14_2 = L14_2 + L15_2
                    L15_2 = L6_2.Y
                    L16_2 = L0_1.RightText
                    L16_2 = L16_2.Y
                    L15_2 = L15_2 + L16_2
                    L16_2 = L6_2.SubtitleHeight
                    L15_2 = L15_2 + L16_2
                    L16_2 = RageUI
                    L16_2 = L16_2.ItemOffset
                    L15_2 = L15_2 + L16_2
                    L16_2 = 0
                    L17_2 = L0_1.RightText
                    L17_2 = L17_2.Scale
                    L18_2 = 245
                    L19_2 = 245
                    L20_2 = 245
                    L21_2 = 255
                    L22_2 = 2
                    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    L12_2 = MeasureStringWidth
                    L13_2 = A3_2.RightLabel
                    L14_2 = 0
                    L15_2 = 0.35
                    L12_2 = L12_2(L13_2, L14_2, L15_2)
                    L11_2 = L12_2
                  end
                end
              end
              ::lbl_644::
              L11_2 = L10_2 + L11_2
              L12_2 = A3_2.Style
              if nil ~= L12_2 then
                L12_2 = A3_2.Style
                L13_2 = RageUI
                L13_2 = L13_2.CheckboxStyle
                L13_2 = L13_2.Tick
                if L12_2 == L13_2 then
                  L12_2 = L2_1
                  L13_2 = L8_2
                  L14_2 = A2_2
                  L15_2 = 2
                  L16_2 = 4
                  L17_2 = L11_2
                  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
                else
                  L12_2 = A3_2.Style
                  L13_2 = RageUI
                  L13_2 = L13_2.CheckboxStyle
                  L13_2 = L13_2.Cross
                  if L12_2 == L13_2 then
                    L12_2 = L2_1
                    L13_2 = L8_2
                    L14_2 = A2_2
                    L15_2 = 5
                    L16_2 = 6
                    L17_2 = L11_2
                    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
                  else
                    L12_2 = L2_1
                    L13_2 = L8_2
                    L14_2 = A2_2
                    L15_2 = 2
                    L16_2 = 4
                    L17_2 = L11_2
                    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
                  end
                end
              else
                L12_2 = L2_1
                L13_2 = L8_2
                L14_2 = A2_2
                L15_2 = 2
                L16_2 = 4
                L17_2 = L11_2
                L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
              end
              if L8_2 then
                L12_2 = L6_2.Controls
                L12_2 = L12_2.Select
                L12_2 = L12_2.Active
                if not L12_2 then
                  L12_2 = Hovered
                  if L12_2 then
                    L12_2 = L6_2.Controls
                    L12_2 = L12_2.Click
                    L12_2 = L12_2.Active
                    if L12_2 then
                      L12_2 = A3_2.Enabled
                      if true ~= L12_2 then
                        L12_2 = A3_2.Enabled
                      end
                      if nil == L12_2 then
                        L12_2 = isWaitingForServer
                        if not L12_2 then
                          L12_2 = RageUI
                          L12_2 = L12_2.Settings
                          L12_2 = L12_2.Audio
                          L13_2 = TriggerEvent
                          L14_2 = "InteractSound_CL:PlayOnOne"
                          L15_2 = "selected"
                          L16_2 = 0.2
                          L13_2(L14_2, L15_2, L16_2)
                          A2_2 = not A2_2
                          if A2_2 then
                            L13_2 = A4_2.onChecked
                            if nil ~= L13_2 then
                              L13_2 = A4_2.onChecked
                              L13_2()
                            end
                          else
                            L13_2 = A4_2.onUnChecked
                            if nil ~= L13_2 then
                              L13_2 = A4_2.onUnChecked
                              L13_2()
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            else
              L12_2 = error
              L13_2 = "UICheckBox Style is not a `table`"
              L12_2(L13_2)
            end
            L12_2 = RageUI
            L13_2 = RageUI
            L13_2 = L13_2.ItemOffset
            L14_2 = L0_1.Rectangle
            L14_2 = L14_2.Height
            L13_2 = L13_2 + L14_2
            L12_2.ItemOffset = L13_2
            L12_2 = RageUI
            L12_2 = L12_2.ItemsDescription
            L13_2 = L6_2
            L14_2 = A1_2
            L15_2 = L8_2
            L12_2(L13_2, L14_2, L15_2)
            L12_2 = A4_2.onSelected
            if nil ~= L12_2 and L8_2 then
              L12_2 = A4_2.onSelected
              L13_2 = A2_2
              L12_2(L13_2)
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
    return
  end
  function L6_2(A0_3, A1_3)
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
  IsInTable = L6_2
  L6_2 = L5_2[A0_2]
  if nil ~= L6_2 then
    L6_2 = L5_2[A0_2]
    if L6_2 then
      goto lbl_789
    end
  end
  L6_2 = IsInTable
  L7_2 = buttonlist_data
  L8_2 = A0_2
  L6_2 = L6_2(L7_2, L8_2)
  L6_2 = not L6_2 and L6_2
  ::lbl_789::
  Enabled = L6_2
  L6_2 = RageUI
  L6_2 = L6_2.CurrentMenu
  if nil ~= L6_2 then
    L7_2 = Enabled
    if L7_2 then
      L7_2 = L6_2
      L7_2 = L7_2()
      if L7_2 then
        L7_2 = RageUI
        L7_2 = L7_2.Options
        L7_2 = L7_2 + 1
        L8_2 = L6_2.Pagination
        L8_2 = L8_2.Minimum
        if L7_2 >= L8_2 then
          L8_2 = L6_2.Pagination
          L8_2 = L8_2.Maximum
          if L7_2 <= L8_2 then
            L8_2 = L6_2.Index
            L8_2 = L8_2 == L7_2
            L9_2 = A3_2.LeftBadge
            L10_2 = RageUI
            L10_2 = L10_2.BadgeStyle
            L10_2 = L10_2.None
            if L9_2 ~= L10_2 then
              L9_2 = A3_2.LeftBadge
              if nil ~= L9_2 then
                goto lbl_830
              end
            end
            L9_2 = 0
            ::lbl_830::
            if not L9_2 then
              L9_2 = 27
            end
            L10_2 = A3_2.RightBadge
            L11_2 = RageUI
            L11_2 = L11_2.BadgeStyle
            L11_2 = L11_2.None
            if L10_2 ~= L11_2 then
              L10_2 = A3_2.RightBadge
              if nil ~= L10_2 then
                goto lbl_843
              end
            end
            L10_2 = 0
            ::lbl_843::
            if not L10_2 then
              L10_2 = 32
            end
            L11_2 = 0
            L12_2 = RageUI
            L12_2 = L12_2.ItemsSafeZone
            L13_2 = L6_2
            L12_2(L13_2)
            L12_2 = RenderRectangle
            L13_2 = L6_2.X
            L13_2 = L13_2 + 15
            L14_2 = L6_2.Y
            L15_2 = L0_1.SelectedSprite
            L15_2 = L15_2.Y
            L14_2 = L14_2 + L15_2
            L15_2 = L6_2.SubtitleHeight
            L14_2 = L14_2 + L15_2
            L15_2 = RageUI
            L15_2 = L15_2.ItemOffset
            L14_2 = L14_2 + L15_2
            L15_2 = L0_1.SelectedSprite
            L15_2 = L15_2.Width
            L16_2 = L6_2.WidthOffset
            L15_2 = L15_2 + L16_2
            L15_2 = L15_2 - 30
            L16_2 = L0_1.SelectedSprite
            L16_2 = L16_2.Height
            L16_2 = L16_2 - 3
            L17_2 = 35
            L18_2 = 39
            L19_2 = 47
            L20_2 = 255
            L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            L12_2 = L6_1
            if not L12_2 then
              L12_2 = true
              L6_1 = L12_2
              L12_2 = Citizen
              L12_2 = L12_2.CreateThread
              function L13_2()
                local L0_3, L1_3
                while true do
                  L0_3 = L3_1
                  if L0_3 <= 5 then
                    L0_3 = L3_1
                    L0_3 = L0_3 + 2
                    L3_1 = L0_3
                  else
                    L0_3 = L3_1
                    L0_3 = L0_3 + 7
                    L3_1 = L0_3
                  end
                  L0_3 = L7_1
                  L0_3 = L0_3 - 3
                  L1_3 = 5
                  L7_1 = L0_3
                  L0_3 = L3_1
                  L1_3 = 300
                  if L0_3 >= L1_3 then
                    L0_3 = 0
                    L3_1 = L0_3
                    L0_3 = 100
                    L7_1 = L0_3
                    L0_3 = false
                    L5_1 = L0_3
                  end
                  L0_3 = RageUI
                  L0_3 = L0_3.CurrentMenu
                  if not L0_3 then
                    L0_3 = false
                    L6_1 = L0_3
                    L0_3 = true
                    L5_1 = L0_3
                    return
                  end
                  L0_3 = Wait
                  L1_3 = 10
                  L0_3(L1_3)
                end
              end
              L12_2(L13_2)
            end
            if L8_2 then
              L12_2 = RenderRectangle
              L13_2 = L6_2.X
              L13_2 = L13_2 + 15
              L14_2 = L6_2.Y
              L15_2 = L0_1.SelectedSprite
              L15_2 = L15_2.Y
              L14_2 = L14_2 + L15_2
              L15_2 = L6_2.SubtitleHeight
              L14_2 = L14_2 + L15_2
              L15_2 = RageUI
              L15_2 = L15_2.ItemOffset
              L14_2 = L14_2 + L15_2
              L15_2 = L0_1.SelectedSprite
              L15_2 = L15_2.Width
              L16_2 = L6_2.WidthOffset
              L15_2 = L15_2 + L16_2
              L15_2 = L15_2 - 427
              L16_2 = L0_1.SelectedSprite
              L16_2 = L16_2.Height
              L16_2 = L16_2 - 3
              L17_2 = 39
              L18_2 = 107
              L19_2 = 218
              L20_2 = 255
              L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
            end
            if L8_2 then
              L12_2 = L5_1
              if L12_2 then
                L12_2 = RenderRectangle
                L13_2 = L6_2.X
                L13_2 = L13_2 + 15
                L14_2 = L3_1
                L13_2 = L13_2 + L14_2
                L14_2 = L6_2.Y
                L15_2 = L0_1.SelectedSprite
                L15_2 = L15_2.Y
                L14_2 = L14_2 + L15_2
                L15_2 = L6_2.SubtitleHeight
                L14_2 = L14_2 + L15_2
                L15_2 = RageUI
                L15_2 = L15_2.ItemOffset
                L14_2 = L14_2 + L15_2
                L15_2 = L0_1.SelectedSprite
                L15_2 = L15_2.Width
                L16_2 = L6_2.WidthOffset
                L15_2 = L15_2 + L16_2
                L15_2 = L15_2 - 300
                L16_2 = L0_1.SelectedSprite
                L16_2 = L16_2.Height
                L16_2 = L16_2 - 3
                L17_2 = 39
                L18_2 = 107
                L19_2 = 218
                L20_2 = L7_1
                L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
              end
            end
            L12_2 = type
            L13_2 = A3_2
            L12_2 = L12_2(L13_2)
            if "table" == L12_2 then
              L12_2 = A3_2.Enabled
              if true ~= L12_2 then
                L12_2 = A3_2.Enabled
                if nil ~= L12_2 then
                  goto lbl_1193
                end
              end
              if L8_2 then
                L12_2 = RenderText
                L13_2 = A0_2
                L14_2 = L6_2.X
                L15_2 = L0_1.Text
                L15_2 = L15_2.X
                L14_2 = L14_2 + L15_2
                L14_2 = L14_2 + L9_2
                L15_2 = L6_2.Y
                L16_2 = L0_1.Text
                L16_2 = L16_2.Y
                L15_2 = L15_2 + L16_2
                L16_2 = L6_2.SubtitleHeight
                L15_2 = L15_2 + L16_2
                L16_2 = RageUI
                L16_2 = L16_2.ItemOffset
                L15_2 = L15_2 + L16_2
                L16_2 = 0
                L17_2 = L0_1.Text
                L17_2 = L17_2.Scale
                L18_2 = 245
                L19_2 = 245
                L20_2 = 245
                L21_2 = 255
                L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
              else
                L12_2 = RenderText
                L13_2 = A0_2
                L14_2 = L6_2.X
                L15_2 = L0_1.Text
                L15_2 = L15_2.X
                L14_2 = L14_2 + L15_2
                L14_2 = L14_2 + L9_2
                L15_2 = L6_2.Y
                L16_2 = L0_1.Text
                L16_2 = L16_2.Y
                L15_2 = L15_2 + L16_2
                L16_2 = L6_2.SubtitleHeight
                L15_2 = L15_2 + L16_2
                L16_2 = RageUI
                L16_2 = L16_2.ItemOffset
                L15_2 = L15_2 + L16_2
                L16_2 = 0
                L17_2 = L0_1.Text
                L17_2 = L17_2.Scale
                L18_2 = 104
                L19_2 = 108
                L20_2 = 114
                L21_2 = 255
                L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
              end
              L12_2 = type
              L13_2 = A3_2
              L12_2 = L12_2(L13_2)
              if "table" == L12_2 then
                L12_2 = A3_2.LeftBadge
                if nil ~= L12_2 then
                  L12_2 = A3_2.LeftBadge
                  L13_2 = RageUI
                  L13_2 = L13_2.BadgeStyle
                  L13_2 = L13_2.None
                  if L12_2 ~= L13_2 then
                    L12_2 = A3_2.LeftBadge
                    L13_2 = L8_2
                    L12_2 = L12_2(L13_2)
                    L13_2 = RenderSprite
                    L14_2 = L12_2.BadgeDictionary
                    if not L14_2 then
                      L14_2 = "commonmenu"
                    end
                    L15_2 = L12_2.BadgeTexture
                    if not L15_2 then
                      L15_2 = ""
                    end
                    L16_2 = L6_2.X
                    L17_2 = L6_2.Y
                    L18_2 = L0_1.LeftBadge
                    L18_2 = L18_2.Y
                    L17_2 = L17_2 + L18_2
                    L18_2 = L6_2.SubtitleHeight
                    L17_2 = L17_2 + L18_2
                    L18_2 = RageUI
                    L18_2 = L18_2.ItemOffset
                    L17_2 = L17_2 + L18_2
                    L18_2 = L0_1.LeftBadge
                    L18_2 = L18_2.Width
                    L19_2 = L0_1.LeftBadge
                    L19_2 = L19_2.Height
                    L20_2 = 0
                    L21_2 = L12_2.BadgeColour
                    if L21_2 then
                      L21_2 = L12_2.BadgeColour
                      L21_2 = L21_2.R
                      if L21_2 then
                        goto lbl_1088
                      end
                    end
                    L21_2 = 255
                    ::lbl_1088::
                    L22_2 = L12_2.BadgeColour
                    if L22_2 then
                      L22_2 = L12_2.BadgeColour
                      L22_2 = L22_2.G
                      if L22_2 then
                        goto lbl_1096
                      end
                    end
                    L22_2 = 255
                    ::lbl_1096::
                    L23_2 = L12_2.BadgeColour
                    if L23_2 then
                      L23_2 = L12_2.BadgeColour
                      L23_2 = L23_2.B
                      if L23_2 then
                        goto lbl_1104
                      end
                    end
                    L23_2 = 255
                    ::lbl_1104::
                    L24_2 = L12_2.BadgeColour
                    if L24_2 then
                      L24_2 = L12_2.BadgeColour
                      L24_2 = L24_2.A
                      if L24_2 then
                        goto lbl_1112
                      end
                    end
                    L24_2 = 255
                    ::lbl_1112::
                    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
                  end
                end
                L12_2 = A3_2.RightBadge
                if nil ~= L12_2 then
                  L12_2 = A3_2.RightBadge
                  L13_2 = RageUI
                  L13_2 = L13_2.BadgeStyle
                  L13_2 = L13_2.None
                  if L12_2 ~= L13_2 then
                    L12_2 = A3_2.RightBadge
                    L13_2 = L8_2
                    L12_2 = L12_2(L13_2)
                    L13_2 = RenderSprite
                    L14_2 = L12_2.BadgeDictionary
                    if not L14_2 then
                      L14_2 = "commonmenu"
                    end
                    L15_2 = L12_2.BadgeTexture
                    if not L15_2 then
                      L15_2 = ""
                    end
                    L16_2 = L6_2.X
                    L17_2 = L0_1.RightBadge
                    L17_2 = L17_2.X
                    L16_2 = L16_2 + L17_2
                    L17_2 = L6_2.WidthOffset
                    L16_2 = L16_2 + L17_2
                    L17_2 = L6_2.Y
                    L18_2 = L0_1.RightBadge
                    L18_2 = L18_2.Y
                    L17_2 = L17_2 + L18_2
                    L18_2 = L6_2.SubtitleHeight
                    L17_2 = L17_2 + L18_2
                    L18_2 = RageUI
                    L18_2 = L18_2.ItemOffset
                    L17_2 = L17_2 + L18_2
                    L18_2 = L0_1.RightBadge
                    L18_2 = L18_2.Width
                    L19_2 = L0_1.RightBadge
                    L19_2 = L19_2.Height
                    L20_2 = 0
                    L21_2 = L12_2.BadgeColour
                    if L21_2 then
                      L21_2 = L12_2.BadgeColour
                      L21_2 = L21_2.R
                      if L21_2 then
                        goto lbl_1167
                      end
                    end
                    L21_2 = 255
                    ::lbl_1167::
                    L22_2 = L12_2.BadgeColour
                    if L22_2 then
                      L22_2 = L12_2.BadgeColour
                      L22_2 = L22_2.G
                      if L22_2 then
                        goto lbl_1175
                      end
                    end
                    L22_2 = 255
                    ::lbl_1175::
                    L23_2 = L12_2.BadgeColour
                    if L23_2 then
                      L23_2 = L12_2.BadgeColour
                      L23_2 = L23_2.B
                      if L23_2 then
                        goto lbl_1183
                      end
                    end
                    L23_2 = 255
                    ::lbl_1183::
                    L24_2 = L12_2.BadgeColour
                    if L24_2 then
                      L24_2 = L12_2.BadgeColour
                      L24_2 = L24_2.A
                      if L24_2 then
                        goto lbl_1191
                      end
                    end
                    L24_2 = 255
                    ::lbl_1191::
                    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
                    goto lbl_1326
                    ::lbl_1193::
                    L12_2 = RageUI
                    L12_2 = L12_2.BadgeStyle
                    L12_2 = L12_2.Lock
                    L13_2 = RageUI
                    L13_2 = L13_2.BadgeStyle
                    L13_2 = L13_2.None
                    if L12_2 == L13_2 or nil == L12_2 then
                      L13_2 = 0
                      if L13_2 then
                        goto lbl_1207
                      end
                    end
                    L13_2 = 27
                    ::lbl_1207::
                    if L8_2 then
                      L14_2 = RenderText
                      L15_2 = A0_2
                      L16_2 = L6_2.X
                      L17_2 = L0_1.Text
                      L17_2 = L17_2.X
                      L16_2 = L16_2 + L17_2
                      L16_2 = L16_2 + L13_2
                      L17_2 = L6_2.Y
                      L18_2 = L0_1.Text
                      L18_2 = L18_2.Y
                      L17_2 = L17_2 + L18_2
                      L18_2 = L6_2.SubtitleHeight
                      L17_2 = L17_2 + L18_2
                      L18_2 = RageUI
                      L18_2 = L18_2.ItemOffset
                      L17_2 = L17_2 + L18_2
                      L18_2 = 8
                      L19_2 = L0_1.Text
                      L19_2 = L19_2.Scale
                      L20_2 = 0
                      L21_2 = 0
                      L22_2 = 0
                      L23_2 = 255
                      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                    else
                      L14_2 = RenderText
                      L15_2 = A0_2
                      L16_2 = L6_2.X
                      L17_2 = L0_1.Text
                      L17_2 = L17_2.X
                      L16_2 = L16_2 + L17_2
                      L16_2 = L16_2 + L13_2
                      L17_2 = L6_2.Y
                      L18_2 = L0_1.Text
                      L18_2 = L18_2.Y
                      L17_2 = L17_2 + L18_2
                      L18_2 = L6_2.SubtitleHeight
                      L17_2 = L17_2 + L18_2
                      L18_2 = RageUI
                      L18_2 = L18_2.ItemOffset
                      L17_2 = L17_2 + L18_2
                      L18_2 = 8
                      L19_2 = L0_1.Text
                      L19_2 = L19_2.Scale
                      L20_2 = 163
                      L21_2 = 159
                      L22_2 = 148
                      L23_2 = 255
                      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
                    end
                    L14_2 = RageUI
                    L14_2 = L14_2.BadgeStyle
                    L14_2 = L14_2.None
                    if L12_2 ~= L14_2 and nil ~= L12_2 then
                      L14_2 = L12_2
                      L15_2 = L8_2
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
                      L18_2 = L6_2.X
                      L19_2 = L6_2.Y
                      L20_2 = L0_1.LeftBadge
                      L20_2 = L20_2.Y
                      L19_2 = L19_2 + L20_2
                      L20_2 = L6_2.SubtitleHeight
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
                      L23_2 = L23_2.R
                      if not L23_2 then
                        L23_2 = 255
                      end
                      L24_2 = L14_2.BadgeColour
                      L24_2 = L24_2.G
                      if not L24_2 then
                        L24_2 = 255
                      end
                      L25_2 = L14_2.BadgeColour
                      L25_2 = L25_2.B
                      if not L25_2 then
                        L25_2 = 255
                      end
                      L26_2 = L14_2.BadgeColour
                      L26_2 = L26_2.A
                      if not L26_2 then
                        L26_2 = 255
                      end
                      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
                    end
                  end
                end
              end
              ::lbl_1326::
              L12_2 = A3_2.Enabled
              if true ~= L12_2 then
                L12_2 = A3_2.Enabled
                if nil ~= L12_2 then
                  goto lbl_1425
                end
              end
              if L8_2 then
                L12_2 = A3_2.RightLabel
                if nil ~= L12_2 then
                  L12_2 = A3_2.RightLabel
                  if "" ~= L12_2 then
                    L12_2 = RenderText
                    L13_2 = A3_2.RightLabel
                    L14_2 = L6_2.X
                    L15_2 = L0_1.RightText
                    L15_2 = L15_2.X
                    L14_2 = L14_2 + L15_2
                    L14_2 = L14_2 - L10_2
                    L15_2 = L6_2.WidthOffset
                    L14_2 = L14_2 + L15_2
                    L15_2 = L6_2.Y
                    L16_2 = L0_1.RightText
                    L16_2 = L16_2.Y
                    L15_2 = L15_2 + L16_2
                    L16_2 = L6_2.SubtitleHeight
                    L15_2 = L15_2 + L16_2
                    L16_2 = RageUI
                    L16_2 = L16_2.ItemOffset
                    L15_2 = L15_2 + L16_2
                    L16_2 = 0
                    L17_2 = L0_1.RightText
                    L17_2 = L17_2.Scale
                    L18_2 = 0
                    L19_2 = 0
                    L20_2 = 0
                    L21_2 = 255
                    L22_2 = 2
                    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    L12_2 = MeasureStringWidth
                    L13_2 = A3_2.RightLabel
                    L14_2 = 0
                    L15_2 = 0.35
                    L12_2 = L12_2(L13_2, L14_2, L15_2)
                    L11_2 = L12_2
                  end
                end
              else
                L12_2 = A3_2.RightLabel
                if nil ~= L12_2 then
                  L12_2 = A3_2.RightLabel
                  if "" ~= L12_2 then
                    L12_2 = RenderText
                    L13_2 = A3_2.RightLabel
                    L14_2 = L6_2.X
                    L15_2 = L0_1.RightText
                    L15_2 = L15_2.X
                    L14_2 = L14_2 + L15_2
                    L14_2 = L14_2 - L10_2
                    L15_2 = L6_2.WidthOffset
                    L14_2 = L14_2 + L15_2
                    L15_2 = L6_2.Y
                    L16_2 = L0_1.RightText
                    L16_2 = L16_2.Y
                    L15_2 = L15_2 + L16_2
                    L16_2 = L6_2.SubtitleHeight
                    L15_2 = L15_2 + L16_2
                    L16_2 = RageUI
                    L16_2 = L16_2.ItemOffset
                    L15_2 = L15_2 + L16_2
                    L16_2 = 0
                    L17_2 = L0_1.RightText
                    L17_2 = L17_2.Scale
                    L18_2 = 245
                    L19_2 = 245
                    L20_2 = 245
                    L21_2 = 255
                    L22_2 = 2
                    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    L12_2 = MeasureStringWidth
                    L13_2 = A3_2.RightLabel
                    L14_2 = 0
                    L15_2 = 0.35
                    L12_2 = L12_2(L13_2, L14_2, L15_2)
                    L11_2 = L12_2
                  end
                end
              end
              ::lbl_1425::
              L11_2 = L10_2 + L11_2
              L12_2 = A3_2.Style
              if nil ~= L12_2 then
                L12_2 = A3_2.Style
                L13_2 = RageUI
                L13_2 = L13_2.CheckboxStyle
                L13_2 = L13_2.Tick
                if L12_2 == L13_2 then
                  L12_2 = L2_1
                  L13_2 = L8_2
                  L14_2 = A2_2
                  L15_2 = 2
                  L16_2 = 4
                  L17_2 = L11_2
                  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
                else
                  L12_2 = A3_2.Style
                  L13_2 = RageUI
                  L13_2 = L13_2.CheckboxStyle
                  L13_2 = L13_2.Cross
                  if L12_2 == L13_2 then
                    L12_2 = L2_1
                    L13_2 = L8_2
                    L14_2 = A2_2
                    L15_2 = 5
                    L16_2 = 6
                    L17_2 = L11_2
                    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
                  else
                    L12_2 = L2_1
                    L13_2 = L8_2
                    L14_2 = A2_2
                    L15_2 = 2
                    L16_2 = 4
                    L17_2 = L11_2
                    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
                  end
                end
              else
                L12_2 = L2_1
                L13_2 = L8_2
                L14_2 = A2_2
                L15_2 = 2
                L16_2 = 4
                L17_2 = L11_2
                L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
              end
              if L8_2 then
                L12_2 = L6_2.Controls
                L12_2 = L12_2.Select
                L12_2 = L12_2.Active
                if not L12_2 then
                  L12_2 = Hovered
                  if L12_2 then
                    L12_2 = L6_2.Controls
                    L12_2 = L12_2.Click
                    L12_2 = L12_2.Active
                    if L12_2 then
                      L12_2 = A3_2.Enabled
                      if true ~= L12_2 then
                        L12_2 = A3_2.Enabled
                      end
                      if nil == L12_2 then
                        L12_2 = isWaitingForServer
                        if not L12_2 then
                          L12_2 = RageUI
                          L12_2 = L12_2.Settings
                          L12_2 = L12_2.Audio
                          L13_2 = TriggerEvent
                          L14_2 = "InteractSound_CL:PlayOnOne"
                          L15_2 = "selected"
                          L16_2 = 0.2
                          L13_2(L14_2, L15_2, L16_2)
                          A2_2 = not A2_2
                          if A2_2 then
                            L13_2 = A4_2.onChecked
                            if nil ~= L13_2 then
                              L13_2 = A4_2.onChecked
                              L13_2()
                            end
                          else
                            L13_2 = A4_2.onUnChecked
                            if nil ~= L13_2 then
                              L13_2 = A4_2.onUnChecked
                              L13_2()
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            else
              L12_2 = error
              L13_2 = "UICheckBox Style is not a `table`"
              L12_2(L13_2)
            end
            L12_2 = RageUI
            L13_2 = RageUI
            L13_2 = L13_2.ItemOffset
            L14_2 = L0_1.Rectangle
            L14_2 = L14_2.Height
            L13_2 = L13_2 + L14_2
            L12_2.ItemOffset = L13_2
            L12_2 = RageUI
            L12_2 = L12_2.ItemsDescription
            L13_2 = L6_2
            L14_2 = A1_2
            L15_2 = L8_2
            L12_2(L13_2, L14_2, L15_2)
            L12_2 = A4_2.onSelected
            if nil ~= L12_2 and L8_2 then
              L12_2 = A4_2.onSelected
              L13_2 = A2_2
              L12_2(L13_2)
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
end
L8_1.Checkbox = L9_1
L8_1 = RageUI
function L9_1()
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
      L3_1 = L0_3
      L0_3 = true
      L5_1 = L0_3
      L0_3 = 100
      L7_1 = L0_3
      break
    end
  end
  L0_2(L1_2)
end
L8_1.ReloadAnimationCheckBox = L9_1
