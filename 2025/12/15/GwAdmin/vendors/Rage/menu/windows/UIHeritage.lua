local L0_1, L1_1, L2_1
L0_1 = {}
L1_1 = {}
L1_1.Dictionary = "pause_menu_pages_char_mom_dad"
L1_1.Texture = "mumdadbg"
L1_1.Width = 431
L1_1.Height = 228
L0_1.Background = L1_1
L1_1 = {}
L1_1.Dictionary = "char_creator_portraits"
L1_1.X = 25
L1_1.Width = 228
L1_1.Height = 228
L0_1.Mum = L1_1
L1_1 = {}
L1_1.Dictionary = "char_creator_portraits"
L1_1.X = 195
L1_1.Width = 228
L1_1.Height = 228
L0_1.Dad = L1_1
L1_1 = RageUI
L1_1 = L1_1.Window
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = RageUI
  L2_2 = L2_2.CurrentMenu
  if nil ~= L2_2 then
    L3_2 = L2_2
    L3_2 = L3_2()
    if L3_2 then
      if A0_2 < 0 or A0_2 > 21 then
        A0_2 = 0
      end
      if A1_2 < 0 or A1_2 > 23 then
        A1_2 = 0
      end
      if 21 == A0_2 then
        L3_2 = "special_female_"
        L4_2 = tonumber
        L5_2 = string
        L5_2 = L5_2.sub
        L6_2 = A0_2
        L7_2 = 2
        L8_2 = 2
        L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2)
        L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
        L4_2 = L4_2 - 1
        L3_2 = L3_2 .. L4_2
        A0_2 = L3_2
      else
        L3_2 = "female_"
        L4_2 = A0_2
        L3_2 = L3_2 .. L4_2
        A0_2 = L3_2
      end
      if A1_2 >= 21 then
        L3_2 = "special_male_"
        L4_2 = tonumber
        L5_2 = string
        L5_2 = L5_2.sub
        L6_2 = A1_2
        L7_2 = 2
        L8_2 = 2
        L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2)
        L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
        L4_2 = L4_2 - 1
        L3_2 = L3_2 .. L4_2
        A1_2 = L3_2
      else
        L3_2 = "male_"
        L4_2 = A1_2
        L3_2 = L3_2 .. L4_2
        A1_2 = L3_2
      end
      L3_2 = RenderSprite
      L4_2 = L0_1.Background
      L4_2 = L4_2.Dictionary
      L5_2 = L0_1.Background
      L5_2 = L5_2.Texture
      L6_2 = L2_2.X
      L7_2 = L2_2.Y
      L8_2 = L2_2.SubtitleHeight
      L7_2 = L7_2 + L8_2
      L8_2 = RageUI
      L8_2 = L8_2.ItemOffset
      L7_2 = L7_2 + L8_2
      L8_2 = L0_1.Background
      L8_2 = L8_2.Width
      L9_2 = L2_2.WidthOffset
      L9_2 = L9_2 / 1
      L8_2 = L8_2 + L9_2
      L9_2 = L0_1.Background
      L9_2 = L9_2.Height
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
      L3_2 = RenderSprite
      L4_2 = L0_1.Dad
      L4_2 = L4_2.Dictionary
      L5_2 = A1_2
      L6_2 = L2_2.X
      L7_2 = L0_1.Dad
      L7_2 = L7_2.X
      L6_2 = L6_2 + L7_2
      L7_2 = L2_2.WidthOffset
      L7_2 = L7_2 / 2
      L6_2 = L6_2 + L7_2
      L7_2 = L2_2.Y
      L8_2 = L2_2.SubtitleHeight
      L7_2 = L7_2 + L8_2
      L8_2 = RageUI
      L8_2 = L8_2.ItemOffset
      L7_2 = L7_2 + L8_2
      L8_2 = L0_1.Dad
      L8_2 = L8_2.Width
      L9_2 = L0_1.Dad
      L9_2 = L9_2.Height
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
      L3_2 = RenderSprite
      L4_2 = L0_1.Mum
      L4_2 = L4_2.Dictionary
      L5_2 = A0_2
      L6_2 = L2_2.X
      L7_2 = L0_1.Mum
      L7_2 = L7_2.X
      L6_2 = L6_2 + L7_2
      L7_2 = L2_2.WidthOffset
      L7_2 = L7_2 / 2
      L6_2 = L6_2 + L7_2
      L7_2 = L2_2.Y
      L8_2 = L2_2.SubtitleHeight
      L7_2 = L7_2 + L8_2
      L8_2 = RageUI
      L8_2 = L8_2.ItemOffset
      L7_2 = L7_2 + L8_2
      L8_2 = L0_1.Mum
      L8_2 = L8_2.Width
      L9_2 = L0_1.Mum
      L9_2 = L9_2.Height
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
      L3_2 = RageUI
      L4_2 = RageUI
      L4_2 = L4_2.ItemOffset
      L5_2 = L0_1.Background
      L5_2 = L5_2.Height
      L4_2 = L4_2 + L5_2
      L3_2.ItemOffset = L4_2
    end
  end
end
L1_1.Heritage = L2_1
