local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = {}
L1_1.Dictionary = "commonmenu"
L1_1.Texture = "gradient_bgd"
L1_1.Y = 4
L1_1.Width = 431
L1_1.Height = 112
L0_1.Background = L1_1
L1_1 = {}
L1_1.Dictionary = "commonmenu"
L1_1.Texture = "arrowleft"
L1_1.X = 7.5
L1_1.Y = 15
L1_1.Width = 30
L1_1.Height = 30
L0_1.LeftArrow = L1_1
L1_1 = {}
L1_1.Dictionary = "commonmenu"
L1_1.Texture = "arrowright"
L1_1.X = 393.5
L1_1.Y = 15
L1_1.Width = 30
L1_1.Height = 30
L0_1.RightArrow = L1_1
L1_1 = {}
L1_1.X = 215.5
L1_1.Y = 15
L1_1.Scale = 0.25
L0_1.Header = L1_1
L1_1 = {}
L1_1.X = 15
L1_1.Y = 55
L1_1.Width = 44.5
L1_1.Height = 44.5
L0_1.Box = L1_1
L1_1 = {}
L1_1.X = 15
L1_1.Y = 47
L1_1.Width = 44.5
L1_1.Height = 8
L0_1.SelectedRectangle = L1_1
L1_1 = {}
L1_1.Text = "of"
L0_1.Seperator = L1_1
L1_1 = RageUI
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L7_2 = RageUI
  L7_2 = L7_2.CurrentMenu
  if nil ~= L7_2 then
    L8_2 = L7_2
    L8_2 = L8_2()
    if L8_2 then
      L8_2 = L7_2.Index
      if L8_2 == A5_2 then
        L8_2 = #A1_2
        if L8_2 > 9 then
          L8_2 = 9
          if L8_2 then
            goto lbl_19
          end
        end
        L8_2 = #A1_2
        ::lbl_19::
        L9_2 = RageUI
        L9_2 = L9_2.IsMouseInBounds
        L10_2 = L7_2.X
        L11_2 = L0_1.Box
        L11_2 = L11_2.X
        L10_2 = L10_2 + L11_2
        L11_2 = L7_2.SafeZoneSize
        L11_2 = L11_2.X
        L10_2 = L10_2 + L11_2
        L11_2 = L7_2.WidthOffset
        L11_2 = L11_2 / 2
        L10_2 = L10_2 + L11_2
        L11_2 = L7_2.Y
        L12_2 = L0_1.Box
        L12_2 = L12_2.Y
        L11_2 = L11_2 + L12_2
        L12_2 = L7_2.SafeZoneSize
        L12_2 = L12_2.Y
        L11_2 = L11_2 + L12_2
        L12_2 = L7_2.SubtitleHeight
        L11_2 = L11_2 + L12_2
        L12_2 = RageUI
        L12_2 = L12_2.ItemOffset
        L11_2 = L11_2 + L12_2
        L12_2 = L0_1.Box
        L12_2 = L12_2.Width
        L12_2 = L12_2 * L8_2
        L13_2 = L0_1.Box
        L13_2 = L13_2.Height
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
        L10_2 = RageUI
        L10_2 = L10_2.IsMouseInBounds
        L11_2 = L7_2.X
        L12_2 = L0_1.LeftArrow
        L12_2 = L12_2.X
        L11_2 = L11_2 + L12_2
        L12_2 = L7_2.SafeZoneSize
        L12_2 = L12_2.X
        L11_2 = L11_2 + L12_2
        L12_2 = L7_2.WidthOffset
        L12_2 = L12_2 / 2
        L11_2 = L11_2 + L12_2
        L12_2 = L7_2.Y
        L13_2 = L0_1.LeftArrow
        L13_2 = L13_2.Y
        L12_2 = L12_2 + L13_2
        L13_2 = L7_2.SafeZoneSize
        L13_2 = L13_2.Y
        L12_2 = L12_2 + L13_2
        L13_2 = L7_2.SubtitleHeight
        L12_2 = L12_2 + L13_2
        L13_2 = RageUI
        L13_2 = L13_2.ItemOffset
        L12_2 = L12_2 + L13_2
        L13_2 = L0_1.LeftArrow
        L13_2 = L13_2.Width
        L14_2 = L0_1.LeftArrow
        L14_2 = L14_2.Height
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        L11_2 = RageUI
        L11_2 = L11_2.IsMouseInBounds
        L12_2 = L7_2.X
        L13_2 = L0_1.RightArrow
        L13_2 = L13_2.X
        L12_2 = L12_2 + L13_2
        L13_2 = L7_2.SafeZoneSize
        L13_2 = L13_2.X
        L12_2 = L12_2 + L13_2
        L13_2 = L7_2.WidthOffset
        L13_2 = L13_2 / 2
        L12_2 = L12_2 + L13_2
        L13_2 = L7_2.Y
        L14_2 = L0_1.RightArrow
        L14_2 = L14_2.Y
        L13_2 = L13_2 + L14_2
        L14_2 = L7_2.SafeZoneSize
        L14_2 = L14_2.Y
        L13_2 = L13_2 + L14_2
        L14_2 = L7_2.SubtitleHeight
        L13_2 = L13_2 + L14_2
        L14_2 = RageUI
        L14_2 = L14_2.ItemOffset
        L13_2 = L13_2 + L14_2
        L14_2 = L0_1.RightArrow
        L14_2 = L14_2.Width
        L15_2 = L0_1.RightArrow
        L15_2 = L15_2.Height
        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
        L12_2 = false
        L13_2 = RenderRectangle
        L14_2 = L7_2.X
        L15_2 = L7_2.Y
        L15_2 = L15_2 + 5
        L16_2 = L0_1.Background
        L16_2 = L16_2.Y
        L15_2 = L15_2 + L16_2
        L16_2 = L7_2.SubtitleHeight
        L15_2 = L15_2 + L16_2
        L16_2 = RageUI
        L16_2 = L16_2.ItemOffset
        L15_2 = L15_2 + L16_2
        L16_2 = L0_1.Background
        L16_2 = L16_2.Width
        L17_2 = L7_2.WidthOffset
        L16_2 = L16_2 + L17_2
        L17_2 = L0_1.Background
        L17_2 = L17_2.Height
        L18_2 = 20
        L19_2 = 24
        L20_2 = 28
        L21_2 = 255
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        L13_2 = RenderSprite
        L14_2 = L0_1.LeftArrow
        L14_2 = L14_2.Dictionary
        L15_2 = L0_1.LeftArrow
        L15_2 = L15_2.Texture
        L16_2 = L7_2.X
        L17_2 = L0_1.LeftArrow
        L17_2 = L17_2.X
        L16_2 = L16_2 + L17_2
        L17_2 = L7_2.WidthOffset
        L17_2 = L17_2 / 2
        L16_2 = L16_2 + L17_2
        L17_2 = L7_2.Y
        L18_2 = L0_1.LeftArrow
        L18_2 = L18_2.Y
        L17_2 = L17_2 + L18_2
        L18_2 = L7_2.SubtitleHeight
        L17_2 = L17_2 + L18_2
        L18_2 = RageUI
        L18_2 = L18_2.ItemOffset
        L17_2 = L17_2 + L18_2
        L18_2 = L0_1.LeftArrow
        L18_2 = L18_2.Width
        L19_2 = L0_1.LeftArrow
        L19_2 = L19_2.Height
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        L13_2 = RenderSprite
        L14_2 = L0_1.RightArrow
        L14_2 = L14_2.Dictionary
        L15_2 = L0_1.RightArrow
        L15_2 = L15_2.Texture
        L16_2 = L7_2.X
        L17_2 = L0_1.RightArrow
        L17_2 = L17_2.X
        L16_2 = L16_2 + L17_2
        L17_2 = L7_2.WidthOffset
        L17_2 = L17_2 / 2
        L16_2 = L16_2 + L17_2
        L17_2 = L7_2.Y
        L18_2 = L0_1.RightArrow
        L18_2 = L18_2.Y
        L17_2 = L17_2 + L18_2
        L18_2 = L7_2.SubtitleHeight
        L17_2 = L17_2 + L18_2
        L18_2 = RageUI
        L18_2 = L18_2.ItemOffset
        L17_2 = L17_2 + L18_2
        L18_2 = L0_1.RightArrow
        L18_2 = L18_2.Width
        L19_2 = L0_1.RightArrow
        L19_2 = L19_2.Height
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        L13_2 = RenderRectangle
        L14_2 = L7_2.X
        L15_2 = L0_1.SelectedRectangle
        L15_2 = L15_2.X
        L14_2 = L14_2 + L15_2
        L15_2 = L0_1.Box
        L15_2 = L15_2.Width
        L16_2 = A3_2 - A2_2
        L15_2 = L15_2 * L16_2
        L14_2 = L14_2 + L15_2
        L15_2 = L7_2.WidthOffset
        L15_2 = L15_2 / 2
        L14_2 = L14_2 + L15_2
        L15_2 = L7_2.Y
        L16_2 = L0_1.SelectedRectangle
        L16_2 = L16_2.Y
        L15_2 = L15_2 + L16_2
        L16_2 = L7_2.SubtitleHeight
        L15_2 = L15_2 + L16_2
        L16_2 = RageUI
        L16_2 = L16_2.ItemOffset
        L15_2 = L15_2 + L16_2
        L16_2 = L0_1.SelectedRectangle
        L16_2 = L16_2.Width
        L17_2 = L0_1.SelectedRectangle
        L17_2 = L17_2.Height
        L18_2 = 35
        L19_2 = 39
        L20_2 = 47
        L21_2 = 150
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        L13_2 = 1
        L14_2 = L8_2
        L15_2 = 1
        for L16_2 = L13_2, L14_2, L15_2 do
          L17_2 = RenderRectangle
          L18_2 = L7_2.X
          L19_2 = L0_1.Box
          L19_2 = L19_2.X
          L18_2 = L18_2 + L19_2
          L19_2 = L0_1.Box
          L19_2 = L19_2.Width
          L20_2 = L16_2 - 1
          L19_2 = L19_2 * L20_2
          L18_2 = L18_2 + L19_2
          L19_2 = L7_2.WidthOffset
          L19_2 = L19_2 / 2
          L18_2 = L18_2 + L19_2
          L19_2 = L7_2.Y
          L20_2 = L0_1.Box
          L20_2 = L20_2.Y
          L19_2 = L19_2 + L20_2
          L20_2 = L7_2.SubtitleHeight
          L19_2 = L19_2 + L20_2
          L20_2 = RageUI
          L20_2 = L20_2.ItemOffset
          L19_2 = L19_2 + L20_2
          L20_2 = L0_1.Box
          L20_2 = L20_2.Width
          L21_2 = L0_1.Box
          L21_2 = L21_2.Height
          L22_2 = table
          L22_2 = L22_2.unpack
          L23_2 = A2_2 + L16_2
          L23_2 = L23_2 - 1
          L23_2 = A1_2[L23_2]
          L22_2, L23_2, L24_2 = L22_2(L23_2)
          L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
        end
        L13_2 = {}
        L14_2 = type
        L15_2 = A6_2
        L14_2 = L14_2(L15_2)
        if "table" == L14_2 then
          L14_2 = type
          L15_2 = A6_2.Seperator
          L14_2 = L14_2(L15_2)
          if "table" == L14_2 then
            L13_2 = A6_2.Seperator
          else
            L13_2 = L0_1.Seperator
          end
        else
          L13_2 = L0_1.Seperator
        end
        L14_2 = RenderText
        L15_2 = A0_2 or L15_2
        if not A0_2 or not A0_2 then
          L15_2 = ""
        end
        L16_2 = " ("
        L17_2 = A3_2
        L18_2 = " "
        L19_2 = L13_2.Text
        L20_2 = " "
        L21_2 = #A1_2
        L22_2 = ")"
        L15_2 = L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
        L16_2 = L7_2.X
        L17_2 = RageUI
        L17_2 = L17_2.Settings
        L17_2 = L17_2.Panels
        L17_2 = L17_2.Grid
        L17_2 = L17_2.Text
        L17_2 = L17_2.Top
        L17_2 = L17_2.X
        L16_2 = L16_2 + L17_2
        L17_2 = L7_2.WidthOffset
        L17_2 = L17_2 / 2
        L16_2 = L16_2 + L17_2
        L17_2 = L7_2.Y
        L18_2 = RageUI
        L18_2 = L18_2.Settings
        L18_2 = L18_2.Panels
        L18_2 = L18_2.Grid
        L18_2 = L18_2.Text
        L18_2 = L18_2.Top
        L18_2 = L18_2.Y
        L17_2 = L17_2 + L18_2
        L18_2 = L7_2.SubtitleHeight
        L17_2 = L17_2 + L18_2
        L18_2 = RageUI
        L18_2 = L18_2.ItemOffset
        L17_2 = L17_2 + L18_2
        L18_2 = 0
        L19_2 = 0.25
        L20_2 = 245
        L21_2 = 245
        L22_2 = 245
        L23_2 = 255
        L24_2 = 1
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
        if L9_2 or L10_2 or L11_2 then
          L14_2 = RageUI
          L14_2 = L14_2.Settings
          L14_2 = L14_2.Controls
          L14_2 = L14_2.Click
          L14_2 = L14_2.Active
          if L14_2 then
            L12_2 = true
            if L10_2 then
              A3_2 = A3_2 - 1
              if A3_2 < 1 then
                A3_2 = #A1_2
                L14_2 = #A1_2
                L14_2 = L14_2 - L8_2
                A2_2 = L14_2 + 1
              elseif A3_2 < A2_2 then
                A2_2 = A2_2 - 1
              end
            elseif L11_2 then
              A3_2 = A3_2 + 1
              L14_2 = #A1_2
              if A3_2 > L14_2 then
                A3_2 = 1
                A2_2 = 1
              else
                L14_2 = A2_2 + L8_2
                L14_2 = L14_2 - 1
                if A3_2 > L14_2 then
                  A2_2 = A2_2 + 1
                end
              end
            elseif L9_2 then
              L14_2 = 1
              L15_2 = L8_2
              L16_2 = 1
              for L17_2 = L14_2, L15_2, L16_2 do
                L18_2 = RageUI
                L18_2 = L18_2.IsMouseInBounds
                L19_2 = L7_2.X
                L20_2 = L0_1.Box
                L20_2 = L20_2.X
                L19_2 = L19_2 + L20_2
                L20_2 = L0_1.Box
                L20_2 = L20_2.Width
                L21_2 = L17_2 - 1
                L20_2 = L20_2 * L21_2
                L19_2 = L19_2 + L20_2
                L20_2 = L7_2.SafeZoneSize
                L20_2 = L20_2.X
                L19_2 = L19_2 + L20_2
                L20_2 = L7_2.WidthOffset
                L20_2 = L20_2 / 2
                L19_2 = L19_2 + L20_2
                L20_2 = L7_2.Y
                L21_2 = L0_1.Box
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
                L21_2 = L0_1.Box
                L21_2 = L21_2.Width
                L22_2 = L0_1.Box
                L22_2 = L22_2.Height
                L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
                if L18_2 then
                  L18_2 = A2_2 + L17_2
                  A3_2 = L18_2 - 1
                end
              end
            end
            L14_2 = A4_2.onColorChange
            if nil ~= L14_2 then
              L14_2 = A4_2.onColorChange
              L15_2 = A2_2
              L16_2 = A3_2
              L14_2(L15_2, L16_2)
            end
          end
        end
        L14_2 = RageUI
        L15_2 = RageUI
        L15_2 = L15_2.ItemOffset
        L16_2 = L0_1.Background
        L16_2 = L16_2.Height
        L15_2 = L15_2 + L16_2
        L16_2 = L0_1.Background
        L16_2 = L16_2.Y
        L15_2 = L15_2 + L16_2
        L14_2.ItemOffset = L15_2
        if L9_2 or L10_2 or L11_2 then
          L14_2 = RageUI
          L14_2 = L14_2.Settings
          L14_2 = L14_2.Controls
          L14_2 = L14_2.Click
          L14_2 = L14_2.Active
          if L14_2 then
            L14_2 = RageUI
            L14_2 = L14_2.Settings
            L14_2 = L14_2.Audio
            L15_2 = RageUI
            L15_2 = L15_2.PlaySound
            L16_2 = L14_2.Use
            L16_2 = L14_2[L16_2]
            L16_2 = L16_2.Select
            L16_2 = L16_2.audioName
            L17_2 = L14_2.Use
            L17_2 = L14_2[L17_2]
            L17_2 = L17_2.Select
            L17_2 = L17_2.audioRef
            L15_2(L16_2, L17_2)
          end
        end
      end
    end
  end
end
L1_1.ColourPanel = L2_1
