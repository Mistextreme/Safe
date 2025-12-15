local L0_1, L1_1
L0_1 = {}
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L4_2 = AvailableIPLS
  L4_2 = L4_2[A0_2]
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L4_2 = L4_2.settings
  L5_2 = exports
  L5_2 = L5_2.bob74_ipl
  L6_2 = L4_2.GetInteriorExport
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2()
  L6_2 = L5_2.Style
  L6_2 = L6_2.Clear
  L6_2()
  L6_2 = L5_2.Style
  L6_2 = L6_2.Set
  L7_2 = L5_2.Style
  L7_2 = L7_2.Theme
  L7_2 = L7_2[A1_2]
  L8_2 = true
  L9_2 = false
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = L4_2.options
  if L6_2 then
    L6_2 = pairs
    L7_2 = L4_2.options
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
      L12_2 = {}
      L13_2 = {}
      L14_2 = L5_2.Swag
      if L14_2 then
        L14_2 = L5_2.Swag
        L14_2 = L14_2[L10_2]
        if L14_2 then
          L14_2 = pairs
          L15_2 = L5_2.Swag
          L15_2 = L15_2[L10_2]
          L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
          for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
            L20_2 = L12_2[L10_2]
            if not L20_2 then
              L20_2 = {}
              L12_2[L10_2] = L20_2
            end
            L20_2 = table
            L20_2 = L20_2.insert
            L21_2 = L12_2[L10_2]
            L22_2 = L19_2
            L20_2(L21_2, L22_2)
          end
      end
      else
        L14_2 = L5_2[L10_2]
        if L14_2 then
          L14_2 = pairs
          L15_2 = L11_2
          L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
          for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
            L20_2 = false
            L21_2 = L12_2[L10_2]
            if not L21_2 then
              L21_2 = {}
              L12_2[L10_2] = L21_2
            end
            if A2_2 then
              L21_2 = A2_2[L10_2]
              if L21_2 then
                L21_2 = ipairs
                L22_2 = A2_2[L10_2]
                L21_2, L22_2, L23_2, L24_2 = L21_2(L22_2)
                for L25_2, L26_2 in L21_2, L22_2, L23_2, L24_2 do
                  if L18_2 == L26_2 then
                    L20_2 = true
                    L27_2 = table
                    L27_2 = L27_2.insert
                    L28_2 = L13_2
                    L29_2 = L5_2[L10_2]
                    L29_2 = L29_2[L18_2]
                    L27_2(L28_2, L29_2)
                    break
                  end
                end
              end
            end
            if not L20_2 then
              L21_2 = table
              L21_2 = L21_2.insert
              L22_2 = L12_2[L10_2]
              L23_2 = L5_2[L10_2]
              L23_2 = L23_2[L18_2]
              L21_2(L22_2, L23_2)
            end
          end
        end
      end
      if A2_2 then
        L14_2 = A2_2[L10_2]
        if nil ~= L14_2 then
          L14_2 = L5_2.Swag
          if L14_2 then
            L14_2 = ipairs
            L15_2 = A2_2[L10_2]
            L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
            for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
              L20_2 = L4_2.options
              L20_2 = L20_2[L10_2]
              L20_2 = L20_2[L19_2]
              if nil ~= L20_2 then
                L20_2 = table
                L20_2 = L20_2.insert
                L21_2 = L13_2
                L22_2 = L5_2.Swag
                L22_2 = L22_2[L10_2]
                L22_2 = L22_2[L19_2]
                L20_2(L21_2, L22_2)
                L20_2 = L12_2[L10_2]
                L20_2 = #L20_2
                L21_2 = 1
                L22_2 = -1
                for L23_2 = L20_2, L21_2, L22_2 do
                  L24_2 = L12_2[L10_2]
                  L24_2 = L24_2[L23_2]
                  L25_2 = L5_2.Swag
                  L25_2 = L25_2[L10_2]
                  L25_2 = L25_2[L19_2]
                  if L24_2 == L25_2 then
                    L24_2 = table
                    L24_2 = L24_2.remove
                    L25_2 = L12_2[L10_2]
                    L26_2 = L23_2
                    L24_2(L25_2, L26_2)
                  end
                end
              end
            end
          end
          L14_2 = L5_2.Swag
          if L14_2 then
            L14_2 = L5_2.Swag
            L14_2 = L14_2.Enable
            L15_2 = L13_2
            L16_2 = true
            L14_2(L15_2, L16_2)
          else
            L14_2 = L5_2[L10_2]
            if L14_2 then
              L14_2 = L5_2[L10_2]
              L14_2 = L14_2.Enable
              if L14_2 then
                L14_2 = L5_2[L10_2]
                L14_2 = L14_2.Enable
                L15_2 = L13_2
                L16_2 = true
                L14_2(L15_2, L16_2)
              end
            end
          end
        end
      end
      L14_2 = L5_2.Swag
      if L14_2 then
        L14_2 = L5_2.Swag
        L14_2 = L14_2.Enable
        L15_2 = L12_2[L10_2]
        L16_2 = false
        L14_2(L15_2, L16_2)
      end
    end
  end
  L6_2 = L4_2.Chairs
  if nil ~= L6_2 then
    if A2_2 then
      L6_2 = A2_2.Chairs
      if L6_2 then
        L6_2 = L5_2.Chairs
        L6_2 = L6_2.Set
        L7_2 = L5_2.Chairs
        L7_2 = L7_2.on
        L6_2(L7_2)
    end
    else
      L6_2 = L5_2.Chairs
      L6_2 = L6_2.Set
      L7_2 = L5_2.Chairs
      L7_2 = L7_2.off
      L6_2(L7_2)
    end
  end
  L6_2 = L4_2.Booze
  if nil ~= L6_2 then
    if A2_2 then
      L6_2 = A2_2.Booze
      if L6_2 then
        L6_2 = L5_2.Booze
        L6_2 = L6_2.on
        if nil ~= L6_2 then
          L6_2 = L5_2.Booze
          L6_2 = L6_2.Set
          L7_2 = L5_2.Booze
          L7_2 = L7_2.on
          L6_2(L7_2)
        end
    end
    else
      L6_2 = L5_2.Booze
      L6_2 = L6_2.off
      if nil ~= L6_2 then
        L6_2 = L5_2.Booze
        L6_2 = L6_2.Set
        L7_2 = L5_2.Booze
        L7_2 = L7_2.off
        L6_2(L7_2)
      end
    end
  end
  L6_2 = L4_2.SafeLeft
  if nil ~= L6_2 then
    if A2_2 then
      L6_2 = A2_2.SafeLeft
      if L6_2 then
        L6_2 = L5_2.Safe
        L6_2 = L6_2.Open
        L7_2 = "left"
        L8_2 = true
        L6_2(L7_2, L8_2)
    end
    else
      L6_2 = L5_2.Safe
      L6_2 = L6_2.Close
      L7_2 = "left"
      L8_2 = false
      L6_2(L7_2, L8_2)
    end
  end
  L6_2 = L4_2.SafeRight
  if nil ~= L6_2 then
    if A2_2 then
      L6_2 = A2_2.SafeRight
      if L6_2 then
        L6_2 = L5_2.Safe
        L6_2 = L6_2.Open
        L7_2 = "right"
        L8_2 = true
        L6_2(L7_2, L8_2)
    end
    else
      L6_2 = L5_2.Safe
      L6_2 = L6_2.Close
      L7_2 = "right"
      L8_2 = false
      L6_2(L7_2, L8_2)
    end
  end
  L6_2 = GetInteriorAtCoords
  L7_2 = AvailableIPLS
  L7_2 = L7_2[A0_2]
  L7_2 = L7_2.doors
  L7_2 = L7_2.x
  L8_2 = AvailableIPLS
  L8_2 = L8_2[A0_2]
  L8_2 = L8_2.doors
  L8_2 = L8_2.y
  L9_2 = AvailableIPLS
  L9_2 = L9_2[A0_2]
  L9_2 = L9_2.doors
  L9_2 = L9_2.z
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = RefreshInterior
  L8_2 = L6_2
  L7_2(L8_2)
  if A3_2 then
    L7_2 = A3_2
    L7_2()
  end
end
L0_1.LoadSettings = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = AvailableIPLS
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = exports
  L2_2 = L2_2.bob74_ipl
  L3_2 = L1_2.settings
  L3_2 = L3_2.GetInteriorExport
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2()
  L3_2 = L2_2.LoadDefault
  L3_2()
end
L0_1.UnloadSettings = L1_1
IPL = L0_1
