local L0_1, L1_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)
  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L8_2 = tonumber
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = 0
  end
  L8_2 = L8_2 / 1920
  L9_2 = tonumber
  L10_2 = A1_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = 0
  end
  L9_2 = L9_2 / 1080
  L10_2 = tonumber
  L11_2 = A2_2
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = 0
  end
  L10_2 = L10_2 / 1920
  L11_2 = tonumber
  L12_2 = A3_2
  L11_2 = L11_2(L12_2)
  if not L11_2 then
    L11_2 = 0
  end
  L11_2 = L11_2 / 1080
  L12_2 = DrawRect
  L13_2 = L10_2 * 0.5
  L13_2 = L8_2 + L13_2
  L14_2 = L11_2 * 0.5
  L14_2 = L9_2 + L14_2
  L15_2 = L10_2
  L16_2 = L11_2
  L17_2 = tonumber
  L18_2 = A4_2
  L17_2 = L17_2(L18_2)
  if not L17_2 then
    L17_2 = 255
  end
  L18_2 = tonumber
  L19_2 = A5_2
  L18_2 = L18_2(L19_2)
  if not L18_2 then
    L18_2 = 255
  end
  L19_2 = tonumber
  L20_2 = A6_2
  L19_2 = L19_2(L20_2)
  if not L19_2 then
    L19_2 = 255
  end
  L20_2 = tonumber
  L21_2 = A7_2
  L20_2 = L20_2(L21_2)
  if not L20_2 then
    L20_2 = 255
  end
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
end
RenderRectangle = L0_1
