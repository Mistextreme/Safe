local L0_1, L1_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2, A9_2, A10_2)
  local L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L11_2 = tonumber
  L12_2 = A2_2
  L11_2 = L11_2(L12_2)
  if not L11_2 then
    L11_2 = 0
  end
  L11_2 = L11_2 / 1920
  L12_2 = tonumber
  L13_2 = A3_2
  L12_2 = L12_2(L13_2)
  if not L12_2 then
    L12_2 = 0
  end
  L12_2 = L12_2 / 1080
  L13_2 = tonumber
  L14_2 = A4_2
  L13_2 = L13_2(L14_2)
  if not L13_2 then
    L13_2 = 0
  end
  L13_2 = L13_2 / 1920
  L14_2 = tonumber
  L15_2 = A5_2
  L14_2 = L14_2(L15_2)
  if not L14_2 then
    L14_2 = 0
  end
  L14_2 = L14_2 / 1080
  L15_2 = HasStreamedTextureDictLoaded
  L16_2 = A0_2
  L15_2 = L15_2(L16_2)
  if not L15_2 then
    L15_2 = RequestStreamedTextureDict
    L16_2 = A0_2
    L17_2 = true
    L15_2(L16_2, L17_2)
  end
  L15_2 = DrawSprite
  L16_2 = A0_2
  L17_2 = A1_2
  L18_2 = L13_2 * 0.5
  L18_2 = L11_2 + L18_2
  L19_2 = L14_2 * 0.5
  L19_2 = L12_2 + L19_2
  L20_2 = L13_2
  L21_2 = L14_2
  L22_2 = A6_2 or L22_2
  if not A6_2 then
    L22_2 = 0
  end
  L23_2 = tonumber
  L24_2 = A7_2
  L23_2 = L23_2(L24_2)
  if not L23_2 then
    L23_2 = 255
  end
  L24_2 = tonumber
  L25_2 = A8_2
  L24_2 = L24_2(L25_2)
  if not L24_2 then
    L24_2 = 255
  end
  L25_2 = tonumber
  L26_2 = A9_2
  L25_2 = L25_2(L26_2)
  if not L25_2 then
    L25_2 = 255
  end
  L26_2 = tonumber
  L27_2 = A10_2
  L26_2 = L26_2(L27_2)
  if not L26_2 then
    L26_2 = 255
  end
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
end
RenderSprite = L0_1
