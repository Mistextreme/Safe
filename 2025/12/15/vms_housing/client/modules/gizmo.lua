local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = false
L1_1 = "translate"
L2_1 = false
L3_1 = nil
L4_1 = setmetatable
L5_1 = {}
L5_1.EndBig = ">"
L5_1.EndLittle = "<"
L6_1 = {}
L7_1 = {}
L7_1.code = "i1"
L6_1.Int8 = L7_1
L7_1 = {}
L7_1.code = "I1"
L6_1.Uint8 = L7_1
L7_1 = {}
L7_1.code = "i2"
L6_1.Int16 = L7_1
L7_1 = {}
L7_1.code = "I2"
L6_1.Uint16 = L7_1
L7_1 = {}
L7_1.code = "i4"
L6_1.Int32 = L7_1
L7_1 = {}
L7_1.code = "I4"
L6_1.Uint32 = L7_1
L7_1 = {}
L7_1.code = "i8"
L6_1.Int64 = L7_1
L7_1 = {}
L7_1.code = "I8"
L6_1.Uint64 = L7_1
L7_1 = {}
L7_1.code = "f"
L7_1.size = 4
L6_1.Float32 = L7_1
L7_1 = {}
L7_1.code = "d"
L7_1.size = 8
L6_1.Float64 = L7_1
L7_1 = {}
L7_1.code = "j"
L6_1.LuaInt = L7_1
L7_1 = {}
L7_1.code = "J"
L6_1.UluaInt = L7_1
L7_1 = {}
L7_1.code = "n"
L6_1.LuaNum = L7_1
L7_1 = {}
L7_1.code = "z"
L7_1.size = -1
L6_1.String = L7_1
L5_1.Types = L6_1
L6_1 = {}
L7_1 = {}
L7_1.code = "c"
L6_1.String = L7_1
L7_1 = {}
L7_1.code = "i"
L6_1.Int = L7_1
L7_1 = {}
L7_1.code = "I"
L6_1.Uint = L7_1
L5_1.FixedTypes = L6_1
L6_1 = {}
function L7_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = dataView
  L2_2 = L2_2.ArrayBuffer
  L3_2 = A1_2
  return L2_2(L3_2)
end
L6_1.__call = L7_1
L4_1 = L4_1(L5_1, L6_1)
L4_1.__index = L4_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = setmetatable
  L2_2 = {}
  L3_2 = string
  L3_2 = L3_2.blob
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2.blob = L3_2
  L2_2.length = A0_2
  L2_2.offset = 1
  L2_2.cangrow = true
  L3_2 = L4_1
  return L1_2(L2_2, L3_2)
end
L4_1.ArrayBuffer = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = setmetatable
  L2_2 = {}
  L2_2.blob = A0_2
  L4_2 = A0_2
  L3_2 = A0_2.len
  L3_2 = L3_2(L4_2)
  L2_2.length = L3_2
  L2_2.offset = 1
  L2_2.cangrow = true
  L3_2 = L4_1
  return L1_2(L2_2, L3_2)
end
L4_1.Wrap = L5_1
function L5_1(A0_2)
  local L1_2
  L1_2 = A0_2.blob
  return L1_2
end
L4_1.Buffer = L5_1
function L5_1(A0_2)
  local L1_2
  L1_2 = A0_2.length
  return L1_2
end
L4_1.ByteLength = L5_1
function L5_1(A0_2)
  local L1_2
  L1_2 = A0_2.offset
  return L1_2
end
L4_1.ByteOffset = L5_1
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = setmetatable
  L4_2 = {}
  L5_2 = A0_2.blob
  L4_2.blob = L5_2
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = A0_2.length
  end
  L4_2.length = L5_2
  L5_2 = 1 + A1_2
  L4_2.offset = L5_2
  L4_2.cangrow = false
  L5_2 = L4_1
  return L3_2(L4_2, L5_2)
end
L4_1.SubView = L5_1
function L5_1(A0_2)
  local L1_2
  if A0_2 then
    L1_2 = L4_1.EndBig
    if L1_2 then
      goto lbl_7
    end
  end
  L1_2 = L4_1.EndLittle
  ::lbl_7::
  return L1_2
end
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = A0_2.blob
  L5_2 = L4_2
  L4_2 = L4_2.blob_pack
  L6_2 = A1_2
  L7_2 = A3_2
  L8_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = A0_2.cangrow
  if not L5_2 then
    L5_2 = A0_2.blob
    if L4_2 ~= L5_2 then
      goto lbl_20
    end
  end
  A0_2.blob = L4_2
  L6_2 = L4_2
  L5_2 = L4_2.len
  L5_2 = L5_2(L6_2)
  A0_2.length = L5_2
  L5_2 = true
  do return L5_2 end
  goto lbl_22
  ::lbl_20::
  L5_2 = false
  do return L5_2 end
  ::lbl_22::
end
L7_1 = pairs
L8_1 = L4_1.Types
L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1)
for L11_1, L12_1 in L7_1, L8_1, L9_1, L10_1 do
  L13_1 = L12_1.size
  if not L13_1 then
    L13_1 = string
    L13_1 = L13_1.packsize
    L14_1 = L12_1.code
    L13_1 = L13_1(L14_1)
    L12_1.size = L13_1
  else
    L13_1 = L12_1.size
    if L13_1 >= 0 then
      L13_1 = string
      L13_1 = L13_1.packsize
      L14_1 = L12_1.code
      L13_1 = L13_1(L14_1)
      L14_1 = L12_1.size
      if L13_1 ~= L14_1 then
        L13_1 = "Pack size of %s (%d) does not match cached length: (%d)"
        L14_1 = error
        L16_1 = L13_1
        L15_1 = L13_1.format
        L17_1 = L11_1
        L18_1 = string
        L18_1 = L18_1.packsize
        L19_1 = L12_1.code
        L18_1 = L18_1(L19_1)
        L19_1 = L12_1.size
        L15_1, L16_1, L17_1, L18_1, L19_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
        L14_1(L15_1, L16_1, L17_1, L18_1, L19_1)
        L14_1 = nil
        return L14_1
      end
    end
  end
  L13_1 = "Get"
  L14_1 = L11_1
  L13_1 = L13_1 .. L14_1
  function L14_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    if not A1_2 then
      A1_2 = 0
    end
    if A1_2 >= 0 then
      L3_2 = A0_2.offset
      L3_2 = L3_2 + A1_2
      L4_2 = A0_2.blob
      L5_2 = L4_2
      L4_2 = L4_2.blob_unpack
      L6_2 = L3_2
      L7_2 = L5_1
      L8_2 = A2_2
      L7_2 = L7_2(L8_2)
      L8_2 = L12_1.code
      L7_2 = L7_2 .. L8_2
      L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
      return L4_2
    end
    L3_2 = nil
    return L3_2
  end
  L4_1[L13_1] = L14_1
  L13_1 = "Set"
  L14_1 = L11_1
  L13_1 = L13_1 .. L14_1
  function L14_1(A0_2, A1_2, A2_2, A3_2)
    local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
    if A1_2 >= 0 and A2_2 then
      L4_2 = A0_2.offset
      L4_2 = L4_2 + A1_2
      L5_2 = L12_1.size
      if L5_2 < 0 then
        L6_2 = A2_2
        L5_2 = A2_2.len
        L5_2 = L5_2(L6_2)
        if L5_2 then
          goto lbl_16
        end
      end
      L5_2 = L12_1.size
      ::lbl_16::
      L6_2 = A0_2.cangrow
      if not L6_2 then
        L6_2 = L5_2 - 1
        L6_2 = L4_2 + L6_2
        L7_2 = A0_2.length
        if not (L6_2 <= L7_2) then
          goto lbl_42
        end
      end
      L6_2 = L6_1
      L7_2 = A0_2
      L8_2 = L4_2
      L9_2 = A2_2
      L10_2 = L5_1
      L11_2 = A3_2
      L10_2 = L10_2(L11_2)
      L11_2 = L12_1.code
      L10_2 = L10_2 .. L11_2
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if not L6_2 then
        L6_2 = error
        L7_2 = "cannot grow subview"
        L6_2(L7_2)
        goto lbl_45
        ::lbl_42::
        L6_2 = error
        L7_2 = "cannot grow dataview"
        L6_2(L7_2)
      end
    end
    ::lbl_45::
    return A0_2
  end
  L4_1[L13_1] = L14_1
end
L7_1 = pairs
L8_1 = L4_1.FixedTypes
L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1)
for L11_1, L12_1 in L7_1, L8_1, L9_1, L10_1 do
  L12_1.size = -1
  L13_1 = "GetFixed"
  L14_1 = L11_1
  L13_1 = L13_1 .. L14_1
  function L14_1(A0_2, A1_2, A2_2, A3_2)
    local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
    if A1_2 >= 0 then
      L4_2 = A0_2.offset
      L4_2 = L4_2 + A1_2
      L5_2 = A2_2 - 1
      L5_2 = L4_2 + L5_2
      L6_2 = A0_2.length
      if L5_2 <= L6_2 then
        L5_2 = L5_1
        L6_2 = A3_2
        L5_2 = L5_2(L6_2)
        L6_2 = "c"
        L7_2 = tostring
        L8_2 = A2_2
        L7_2 = L7_2(L8_2)
        L5_2 = L5_2 .. L6_2 .. L7_2
        L6_2 = A0_2.blob
        L7_2 = L6_2
        L6_2 = L6_2.blob_unpack
        L8_2 = L4_2
        L9_2 = L5_2
        L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2)
        return L6_2
      end
    end
    L4_2 = nil
    return L4_2
  end
  L4_1[L13_1] = L14_1
  L13_1 = "SetFixed"
  L14_1 = L11_1
  L13_1 = L13_1 .. L14_1
  function L14_1(A0_2, A1_2, A2_2, A3_2, A4_2)
    local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
    if A1_2 >= 0 and A3_2 then
      L5_2 = A0_2.offset
      L5_2 = L5_2 + A1_2
      L6_2 = A0_2.cangrow
      if not L6_2 then
        L6_2 = A2_2 - 1
        L6_2 = L5_2 + L6_2
        L7_2 = A0_2.length
        if not (L6_2 <= L7_2) then
          goto lbl_38
        end
      end
      L6_2 = L5_1
      L7_2 = A4_2
      L6_2 = L6_2(L7_2)
      L7_2 = "c"
      L8_2 = tostring
      L9_2 = A2_2
      L8_2 = L8_2(L9_2)
      L6_2 = L6_2 .. L7_2 .. L8_2
      L7_2 = L6_1
      L8_2 = A0_2
      L9_2 = L5_2
      L10_2 = A3_2
      L11_2 = L6_2
      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
      if not L7_2 then
        L7_2 = error
        L8_2 = "cannot grow subview"
        L7_2(L8_2)
        goto lbl_41
        ::lbl_38::
        L6_2 = error
        L7_2 = "cannot grow dataview"
        L6_2(L7_2)
      end
    end
    ::lbl_41::
    return A0_2
  end
  L4_1[L13_1] = L14_1
end
function L7_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = math
  L3_2 = L3_2.sqrt
  L4_2 = A0_2 * A0_2
  L5_2 = A1_2 * A1_2
  L4_2 = L4_2 + L5_2
  L5_2 = A2_2 * A2_2
  L4_2 = L4_2 + L5_2
  L3_2 = L3_2(L4_2)
  if 0 == L3_2 then
    L4_2 = 0
    L5_2 = 0
    L6_2 = 0
    return L4_2, L5_2, L6_2
  end
  L4_2 = A0_2 / L3_2
  L5_2 = A1_2 / L3_2
  L6_2 = A2_2 / L3_2
  return L4_2, L5_2, L6_2
end
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = GetEntityMatrix
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  L5_2 = L4_1.ArrayBuffer
  L6_2 = 60
  L5_2 = L5_2(L6_2)
  L7_2 = L5_2
  L6_2 = L5_2.SetFloat32
  L8_2 = 0
  L9_2 = L2_2[1]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 4
  L9_2 = L2_2[2]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 8
  L9_2 = L2_2[3]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 12
  L9_2 = 0
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 16
  L9_2 = L1_2[1]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 20
  L9_2 = L1_2[2]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 24
  L9_2 = L1_2[3]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 28
  L9_2 = 0
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 32
  L9_2 = L3_2[1]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 36
  L9_2 = L3_2[2]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 40
  L9_2 = L3_2[3]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 44
  L9_2 = 0
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 48
  L9_2 = L4_2[1]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 52
  L9_2 = L4_2[2]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 56
  L9_2 = L4_2[3]
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L6_2
  L6_2 = L6_2.SetFloat32
  L8_2 = 60
  L9_2 = 1
  L6_2(L7_2, L8_2, L9_2)
  return L5_2
end
makeEntityMatrix = L8_1
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L3_2 = A1_2
  L2_2 = A1_2.GetFloat32
  L4_2 = 16
  L2_2 = L2_2(L3_2, L4_2)
  L4_2 = A1_2
  L3_2 = A1_2.GetFloat32
  L5_2 = 20
  L3_2 = L3_2(L4_2, L5_2)
  L5_2 = A1_2
  L4_2 = A1_2.GetFloat32
  L6_2 = 24
  L4_2 = L4_2(L5_2, L6_2)
  L6_2 = A1_2
  L5_2 = A1_2.GetFloat32
  L7_2 = 0
  L5_2 = L5_2(L6_2, L7_2)
  L7_2 = A1_2
  L6_2 = A1_2.GetFloat32
  L8_2 = 4
  L6_2 = L6_2(L7_2, L8_2)
  L8_2 = A1_2
  L7_2 = A1_2.GetFloat32
  L9_2 = 8
  L7_2 = L7_2(L8_2, L9_2)
  L9_2 = A1_2
  L8_2 = A1_2.GetFloat32
  L10_2 = 32
  L8_2 = L8_2(L9_2, L10_2)
  L10_2 = A1_2
  L9_2 = A1_2.GetFloat32
  L11_2 = 36
  L9_2 = L9_2(L10_2, L11_2)
  L11_2 = A1_2
  L10_2 = A1_2.GetFloat32
  L12_2 = 40
  L10_2 = L10_2(L11_2, L12_2)
  L12_2 = A1_2
  L11_2 = A1_2.GetFloat32
  L13_2 = 48
  L11_2 = L11_2(L12_2, L13_2)
  L13_2 = A1_2
  L12_2 = A1_2.GetFloat32
  L14_2 = 52
  L12_2 = L12_2(L13_2, L14_2)
  L14_2 = A1_2
  L13_2 = A1_2.GetFloat32
  L15_2 = 56
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = L7_1
  L15_2 = L2_2
  L16_2 = L3_2
  L17_2 = L4_2
  L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2, L17_2)
  L4_2 = L16_2
  L3_2 = L15_2
  L2_2 = L14_2
  L14_2 = L7_1
  L15_2 = L5_2
  L16_2 = L6_2
  L17_2 = L7_2
  L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2, L17_2)
  L7_2 = L16_2
  L6_2 = L15_2
  L5_2 = L14_2
  L14_2 = L7_1
  L15_2 = L8_2
  L16_2 = L9_2
  L17_2 = L10_2
  L14_2, L15_2, L16_2 = L14_2(L15_2, L16_2, L17_2)
  L10_2 = L16_2
  L9_2 = L15_2
  L8_2 = L14_2
  L14_2 = SetEntityMatrix
  L15_2 = A0_2
  L16_2 = L2_2
  L17_2 = L3_2
  L18_2 = L4_2
  L19_2 = L5_2
  L20_2 = L6_2
  L21_2 = L7_2
  L22_2 = L8_2
  L23_2 = L9_2
  L24_2 = L10_2
  L25_2 = L11_2
  L26_2 = L12_2
  L27_2 = L13_2
  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
end
applyEntityMatrix = L8_1
L8_1 = RegisterKeyMapping
L9_1 = "+gizmoSelect"
L10_1 = TRANSLATE
L11_1 = "control.gizmo:select"
L10_1 = L10_1(L11_1)
L11_1 = "MOUSE_BUTTON"
L12_1 = "MOUSE_LEFT"
L8_1(L9_1, L10_1, L11_1, L12_1)
L8_1 = RegisterKeyMapping
L9_1 = "+gizmoTranslation"
L10_1 = TRANSLATE
L11_1 = "control.gizmo:translation"
L10_1 = L10_1(L11_1)
L11_1 = "keyboard"
L12_1 = Config
L12_1 = L12_1.FurnitureControls
L12_1 = L12_1.GIZMO_TRANSLATION
L12_1 = L12_1.control
L8_1(L9_1, L10_1, L11_1, L12_1)
L8_1 = RegisterKeyMapping
L9_1 = "+gizmoRotation"
L10_1 = TRANSLATE
L11_1 = "control.gizmo:rotation"
L10_1 = L10_1(L11_1)
L11_1 = "keyboard"
L12_1 = Config
L12_1 = L12_1.FurnitureControls
L12_1 = L12_1.GIZMO_ROTATION
L12_1 = L12_1.control
L8_1(L9_1, L10_1, L11_1, L12_1)
