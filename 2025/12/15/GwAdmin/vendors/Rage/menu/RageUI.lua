local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1
L0_1 = math
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = tonumber
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "%."
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = 0
  end
  L6_2 = "f"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2)
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1.round = L1_1
L0_1 = string
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = string
  L2_2 = L2_2.sub
  L3_2 = A0_2
  L4_2 = 1
  L5_2 = string
  L5_2 = L5_2.len
  L6_2 = A1_2
  L5_2, L6_2 = L5_2(L6_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = L2_2 == A1_2
  return L2_2
end
L0_1.starts = L1_1
L0_1 = RageUI
L1_1 = setmetatable
L2_1 = {}
L3_1 = RageUI
L3_1 = L3_1.Menus
L1_1 = L1_1(L2_1, L3_1)
L0_1.Menus = L1_1
L0_1 = RageUI
L0_1 = L0_1.Menus
function L1_1()
  local L0_2, L1_2
  L0_2 = true
  return L0_2
end
L0_1.__call = L1_1
L0_1 = RageUI
L0_1 = L0_1.Menus
L1_1 = RageUI
L1_1 = L1_1.Menus
L0_1.__index = L1_1
L0_1 = RageUI
L0_1.CurrentMenu = nil
L0_1 = RageUI
L0_1.NextMenu = nil
L0_1 = RageUI
L0_1.Options = 0
L0_1 = RageUI
L0_1.ItemOffset = 0
L0_1 = RageUI
L0_1.StatisticPanelCount = 0
L0_1 = RageUI
L1_1 = {}
L1_1.Current = "NativeUI"
L2_1 = {}
L3_1 = {}
L3_1.Width = 0
L2_1.RageUI = L3_1
L3_1 = {}
L3_1.Width = 0
L2_1.NativeUI = L3_1
L1_1.Style = L2_1
L0_1.UI = L1_1
L0_1 = RageUI
L1_1 = {}
L1_1.Debug = false
L2_1 = {}
L3_1 = {}
L3_1.Enabled = true
L3_1.Active = false
L3_1.Pressed = false
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 172
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 1
L8_1 = 172
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 2
L9_1 = 172
L7_1[1] = L8_1
L7_1[2] = L9_1
L8_1 = {}
L9_1 = 0
L10_1 = 241
L8_1[1] = L9_1
L8_1[2] = L10_1
L9_1 = {}
L10_1 = 1
L11_1 = 241
L9_1[1] = L10_1
L9_1[2] = L11_1
L10_1 = {}
L11_1 = 2
L12_1 = 241
L10_1[1] = L11_1
L10_1[2] = L12_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L3_1.Keys = L4_1
L2_1.Up = L3_1
L3_1 = {}
L3_1.Enabled = true
L3_1.Active = false
L3_1.Pressed = false
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 173
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 1
L8_1 = 173
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 2
L9_1 = 173
L7_1[1] = L8_1
L7_1[2] = L9_1
L8_1 = {}
L9_1 = 0
L10_1 = 242
L8_1[1] = L9_1
L8_1[2] = L10_1
L9_1 = {}
L10_1 = 1
L11_1 = 242
L9_1[1] = L10_1
L9_1[2] = L11_1
L10_1 = {}
L11_1 = 2
L12_1 = 242
L10_1[1] = L11_1
L10_1[2] = L12_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L3_1.Keys = L4_1
L2_1.Down = L3_1
L3_1 = {}
L3_1.Enabled = true
L3_1.Active = false
L3_1.Pressed = false
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 174
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 1
L8_1 = 174
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 2
L9_1 = 174
L7_1[1] = L8_1
L7_1[2] = L9_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L3_1.Keys = L4_1
L2_1.Left = L3_1
L3_1 = {}
L3_1.Enabled = true
L3_1.Pressed = false
L3_1.Active = false
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 175
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 1
L8_1 = 175
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 2
L9_1 = 175
L7_1[1] = L8_1
L7_1[2] = L9_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L3_1.Keys = L4_1
L2_1.Right = L3_1
L3_1 = {}
L3_1.Enabled = true
L3_1.Active = false
L3_1.Pressed = false
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 174
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 1
L8_1 = 174
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 2
L9_1 = 174
L7_1[1] = L8_1
L7_1[2] = L9_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L3_1.Keys = L4_1
L2_1.SliderLeft = L3_1
L3_1 = {}
L3_1.Enabled = true
L3_1.Pressed = false
L3_1.Active = false
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 175
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 1
L8_1 = 175
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 2
L9_1 = 175
L7_1[1] = L8_1
L7_1[2] = L9_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L3_1.Keys = L4_1
L2_1.SliderRight = L3_1
L3_1 = {}
L3_1.Enabled = true
L3_1.Pressed = false
L3_1.Active = false
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 201
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 1
L8_1 = 201
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 2
L9_1 = 201
L7_1[1] = L8_1
L7_1[2] = L9_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L3_1.Keys = L4_1
L2_1.Select = L3_1
L3_1 = {}
L3_1.Enabled = true
L3_1.Active = false
L3_1.Pressed = false
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 177
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 1
L8_1 = 177
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 2
L9_1 = 177
L7_1[1] = L8_1
L7_1[2] = L9_1
L8_1 = {}
L9_1 = 0
L10_1 = 199
L8_1[1] = L9_1
L8_1[2] = L10_1
L9_1 = {}
L10_1 = 1
L11_1 = 199
L9_1[1] = L10_1
L9_1[2] = L11_1
L10_1 = {}
L11_1 = 2
L12_1 = 199
L10_1[1] = L11_1
L10_1[2] = L12_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L3_1.Keys = L4_1
L2_1.Back = L3_1
L3_1 = {}
L3_1.Enabled = false
L3_1.Active = false
L3_1.Pressed = false
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 24
L5_1[1] = L6_1
L5_1[2] = L7_1
L4_1[1] = L5_1
L3_1.Keys = L4_1
L2_1.Click = L3_1
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 2
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 0
L8_1 = 1
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 0
L9_1 = 25
L7_1[1] = L8_1
L7_1[2] = L9_1
L8_1 = {}
L9_1 = 0
L10_1 = 24
L8_1[1] = L9_1
L8_1[2] = L10_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L3_1.Controller = L4_1
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 201
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = 0
L8_1 = 195
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = 0
L9_1 = 196
L7_1[1] = L8_1
L7_1[2] = L9_1
L8_1 = {}
L9_1 = 0
L10_1 = 187
L8_1[1] = L9_1
L8_1[2] = L10_1
L9_1 = {}
L10_1 = 0
L11_1 = 188
L9_1[1] = L10_1
L9_1[2] = L11_1
L10_1 = {}
L11_1 = 0
L12_1 = 189
L10_1[1] = L11_1
L10_1[2] = L12_1
L11_1 = {}
L12_1 = 0
L13_1 = 190
L11_1[1] = L12_1
L11_1[2] = L13_1
L12_1 = {}
L13_1 = 0
L14_1 = 202
L12_1[1] = L13_1
L12_1[2] = L14_1
L13_1 = {}
L14_1 = 0
L15_1 = 217
L13_1[1] = L14_1
L13_1[2] = L15_1
L14_1 = {}
L15_1 = 0
L16_1 = 242
L14_1[1] = L15_1
L14_1[2] = L16_1
L15_1 = {}
L16_1 = 0
L17_1 = 241
L15_1[1] = L16_1
L15_1[2] = L17_1
L16_1 = {}
L17_1 = 0
L18_1 = 239
L16_1[1] = L17_1
L16_1[2] = L18_1
L17_1 = {}
L18_1 = 0
L19_1 = 240
L17_1[1] = L18_1
L17_1[2] = L19_1
L18_1 = {}
L19_1 = 0
L20_1 = 31
L18_1[1] = L19_1
L18_1[2] = L20_1
L19_1 = {}
L20_1 = 0
L21_1 = 30
L19_1[1] = L20_1
L19_1[2] = L21_1
L20_1 = {}
L21_1 = 0
L22_1 = 21
L20_1[1] = L21_1
L20_1[2] = L22_1
L21_1 = {}
L22_1 = 0
L23_1 = 22
L21_1[1] = L22_1
L21_1[2] = L23_1
L22_1 = {}
L23_1 = 0
L24_1 = 23
L22_1[1] = L23_1
L22_1[2] = L24_1
L23_1 = {}
L24_1 = 0
L25_1 = 75
L23_1[1] = L24_1
L23_1[2] = L25_1
L24_1 = {}
L25_1 = 0
L26_1 = 71
L24_1[1] = L25_1
L24_1[2] = L26_1
L25_1 = {}
L26_1 = 0
L27_1 = 72
L25_1[1] = L26_1
L25_1[2] = L27_1
L26_1 = {}
L27_1 = 0
L28_1 = 59
L26_1[1] = L27_1
L26_1[2] = L28_1
L27_1 = {}
L28_1 = 0
L29_1 = 89
L27_1[1] = L28_1
L27_1[2] = L29_1
L28_1 = {}
L29_1 = 0
L30_1 = 9
L28_1[1] = L29_1
L28_1[2] = L30_1
L29_1 = {}
L30_1 = 0
L31_1 = 8
L29_1[1] = L30_1
L29_1[2] = L31_1
L30_1 = {}
L31_1 = 0
L32_1 = 90
L30_1[1] = L31_1
L30_1[2] = L32_1
L31_1 = {}
L32_1 = 0
L33_1 = 76
L31_1[1] = L32_1
L31_1[2] = L33_1
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L4_1[12] = L16_1
L4_1[13] = L17_1
L4_1[14] = L18_1
L4_1[15] = L19_1
L4_1[16] = L20_1
L4_1[17] = L21_1
L4_1[18] = L22_1
L4_1[19] = L23_1
L4_1[20] = L24_1
L4_1[21] = L25_1
L4_1[22] = L26_1
L4_1[23] = L27_1
L4_1[24] = L28_1
L4_1[25] = L29_1
L4_1[26] = L30_1
L4_1[27] = L31_1
L3_1.Keyboard = L4_1
L2_1.Enabled = L3_1
L1_1.Controls = L2_1
L2_1 = {}
L2_1.Id = nil
L2_1.Use = "NativeUI"
L3_1 = {}
L4_1 = {}
L4_1.audioName = "HUD_FREEMODE_SOUNDSET"
L4_1.audioRef = "NAV_UP_DOWN"
L3_1.UpDown = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "NAV_LEFT_RIGHT"
L3_1.LeftRight = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "SELECT"
L3_1.Select = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "BACK"
L3_1.Back = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "ERROR"
L3_1.Error = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "CONTINUOUS_SLIDER"
L4_1.Id = nil
L3_1.Slider = L4_1
L2_1.RageUI = L3_1
L3_1 = {}
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "NAV_UP_DOWN"
L3_1.UpDown = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "NAV_LEFT_RIGHT"
L3_1.LeftRight = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "SELECT"
L3_1.Select = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "BACK"
L3_1.Back = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "ERROR"
L3_1.Error = L4_1
L4_1 = {}
L4_1.audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET"
L4_1.audioRef = "CONTINUOUS_SLIDER"
L4_1.Id = nil
L3_1.Slider = L4_1
L2_1.NativeUI = L3_1
L1_1.Audio = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = {}
L4_1.Width = 431
L4_1.Height = 107
L3_1.Background = L4_1
L4_1 = {}
L4_1.X = 215
L4_1.Y = 20
L4_1.Scale = 1.15
L3_1.Text = L4_1
L2_1.Title = L3_1
L3_1 = {}
L4_1 = {}
L4_1.Width = 431
L4_1.Height = 40
L3_1.Background = L4_1
L4_1 = {}
L4_1.X = 14
L4_1.Y = 10
L4_1.Scale = 0.27
L3_1.Text = L4_1
L4_1 = {}
L4_1.X = 420
L4_1.Y = 10
L4_1.Scale = 0.3
L3_1.PreText = L4_1
L2_1.Subtitle = L3_1
L3_1 = {}
L3_1.Dictionary = "commonmenu.ytd"
L3_1.Texture = "gradient_bgd"
L3_1.Y = 0
L3_1.Width = 431
L2_1.Background = L3_1
L3_1 = {}
L4_1 = {}
L4_1.Width = 0
L4_1.Height = 0
L3_1.Rectangle = L4_1
L3_1.Offset = 5
L4_1 = {}
L4_1.Dictionary = "commonmenu.ytd"
L4_1.Texture = "shop_arrows_upanddown"
L4_1.X = 190
L4_1.Y = -6
L4_1.Width = 0
L4_1.Height = 0
L3_1.Arrows = L4_1
L2_1.Navigation = L3_1
L3_1 = {}
L4_1 = {}
L4_1.Y = 4
L4_1.Width = 431
L4_1.Height = 4
L3_1.Bar = L4_1
L4_1 = {}
L4_1.Dictionary = "commonmenu.ytd"
L4_1.Texture = "gradient_bgd"
L4_1.Y = 4
L4_1.Width = 431
L4_1.Height = 30
L3_1.Background = L4_1
L4_1 = {}
L4_1.X = 8
L4_1.Y = 10
L4_1.Scale = 0.3
L3_1.Text = L4_1
L2_1.Description = L3_1
L1_1.Items = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = {}
L4_1.Dictionary = "commonmenu.ytd"
L4_1.Texture = "gradient_bgd"
L4_1.Y = 4
L4_1.Width = 431
L4_1.Height = 275
L3_1.Background = L4_1
L4_1 = {}
L4_1.Dictionary = "pause_menu_pages_char_mom_dad"
L4_1.Texture = "nose_grid"
L4_1.X = 115.5
L4_1.Y = 47.5
L4_1.Width = 200
L4_1.Height = 200
L3_1.Grid = L4_1
L4_1 = {}
L4_1.Dictionary = "mpinventory"
L4_1.Texture = "in_world_circle"
L4_1.X = 115.5
L4_1.Y = 47.5
L4_1.Width = 20
L4_1.Height = 20
L3_1.Circle = L4_1
L4_1 = {}
L5_1 = {}
L5_1.X = 215.5
L5_1.Y = 15
L5_1.Scale = 0.35
L4_1.Top = L5_1
L5_1 = {}
L5_1.X = 215.5
L5_1.Y = 250
L5_1.Scale = 0.35
L4_1.Bottom = L5_1
L5_1 = {}
L5_1.X = 57.75
L5_1.Y = 130
L5_1.Scale = 0.35
L4_1.Left = L5_1
L5_1 = {}
L5_1.X = 373.25
L5_1.Y = 130
L5_1.Scale = 0.35
L4_1.Right = L5_1
L3_1.Text = L4_1
L2_1.Grid = L3_1
L3_1 = {}
L4_1 = {}
L4_1.Dictionary = "commonmenu.ytd"
L4_1.Texture = "gradient_bgd"
L4_1.Y = 4
L4_1.Width = 431
L4_1.Height = 76
L3_1.Background = L4_1
L4_1 = {}
L4_1.X = 9
L4_1.Y = 50
L4_1.Width = 413
L4_1.Height = 10
L3_1.Bar = L4_1
L4_1 = {}
L5_1 = {}
L5_1.X = 25
L5_1.Y = 15
L5_1.Scale = 0.35
L4_1.Left = L5_1
L5_1 = {}
L5_1.X = 215.5
L5_1.Y = 15
L5_1.Scale = 0.35
L4_1.Middle = L5_1
L5_1 = {}
L5_1.X = 398
L5_1.Y = 15
L5_1.Scale = 0.35
L4_1.Right = L5_1
L3_1.Text = L4_1
L2_1.Percentage = L3_1
L1_1.Panels = L2_1
L0_1.Settings = L1_1
L0_1 = RageUI
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if not A1_2 then
    L2_2 = {}
    A1_2 = L2_2
  end
  L2_2 = pairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = PushScaleformMovieFunction
    L9_2 = A0_2
    L10_2 = L7_2.name
    L8_2(L9_2, L10_2)
    L8_2 = L7_2.param
    if L8_2 then
      L8_2 = pairs
      L9_2 = L7_2.param
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        L14_2 = math
        L14_2 = L14_2.type
        L15_2 = L13_2
        L14_2 = L14_2(L15_2)
        if "integer" == L14_2 then
          L14_2 = PushScaleformMovieFunctionParameterInt
          L15_2 = L13_2
          L14_2(L15_2)
        else
          L14_2 = type
          L15_2 = L13_2
          L14_2 = L14_2(L15_2)
          if "boolean" == L14_2 then
            L14_2 = PushScaleformMovieFunctionParameterBool
            L15_2 = L13_2
            L14_2(L15_2)
          else
            L14_2 = math
            L14_2 = L14_2.type
            L15_2 = L13_2
            L14_2 = L14_2(L15_2)
            if "float" == L14_2 then
              L14_2 = PushScaleformMovieFunctionParameterFloat
              L15_2 = L13_2
              L14_2(L15_2)
            else
              L14_2 = type
              L15_2 = L13_2
              L14_2 = L14_2(L15_2)
              if "string" == L14_2 then
                L14_2 = _ENV
                L15_2 = "PushScaleformMovieFunctionParameterString"
                L14_2 = L14_2[L15_2]
                L15_2 = L13_2
                L14_2(L15_2)
              end
            end
          end
        end
      end
    end
    L8_2 = L7_2.func
    if L8_2 then
      L8_2 = L7_2.func
      L8_2()
    end
    L8_2 = PopScaleformMovieFunctionVoid
    L8_2()
  end
end
L0_1.SetScaleformParams = L1_1
L0_1 = RageUI
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = IsControlEnabled
  L5_2 = 2
  L6_2 = 239
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L4_2 = GetControlNormal
    if L4_2 then
      goto lbl_11
    end
  end
  L4_2 = GetDisabledControlNormal
  ::lbl_11::
  L5_2 = math
  L5_2 = L5_2.round
  L6_2 = L4_2
  L7_2 = 2
  L8_2 = 239
  L6_2 = L6_2(L7_2, L8_2)
  L6_2 = L6_2 * 1920
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2 / 1920
  L6_2 = math
  L6_2 = L6_2.round
  L7_2 = L4_2
  L8_2 = 2
  L9_2 = 240
  L7_2 = L7_2(L8_2, L9_2)
  L7_2 = L7_2 * 1080
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2 / 1080
  L7_2 = A0_2 / 1920
  A1_2 = A1_2 / 1080
  A0_2 = L7_2
  L7_2 = A2_2 / 1920
  A3_2 = A3_2 / 1080
  A2_2 = L7_2
  L7_2 = L5_2 >= A0_2
  return L7_2
end
L0_1.IsMouseInBounds = L1_1
L0_1 = RageUI
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = GetSafeZoneSize
  L0_2 = L0_2()
  L1_2 = math
  L1_2 = L1_2.round
  L2_2 = L0_2
  L3_2 = 2
  L1_2 = L1_2(L2_2, L3_2)
  L0_2 = L1_2
  L1_2 = L0_2 * 100
  L0_2 = L1_2 - 90
  L1_2 = 10
  L0_2 = L1_2 - L0_2
  L1_2 = 1920
  L2_2 = 1080
  L3_2 = {}
  L4_2 = math
  L4_2 = L4_2.round
  L5_2 = L1_2 / L2_2
  L5_2 = L5_2 * 5.4
  L5_2 = L0_2 * L5_2
  L4_2 = L4_2(L5_2)
  L3_2.X = L4_2
  L4_2 = math
  L4_2 = L4_2.round
  L5_2 = L0_2 * 5.4
  L4_2 = L4_2(L5_2)
  L3_2.Y = L4_2
  return L3_2
end
L0_1.GetSafeZoneBounds = L1_1
L0_1 = RageUI
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if nil ~= A0_2 then
    L2_2 = A0_2
    L2_2 = L2_2()
    if L2_2 then
      if true == A1_2 or false == A1_2 then
        if A1_2 then
          L2_2 = RageUI
          L2_2 = L2_2.CurrentMenu
          if nil ~= L2_2 then
            L2_2 = RageUI
            L2_2 = L2_2.CurrentMenu
            L2_2 = L2_2.Closed
            if nil ~= L2_2 then
              L2_2 = RageUI
              L2_2 = L2_2.CurrentMenu
              L2_2 = L2_2.Closed
              L2_2()
            end
            L2_2 = RageUI
            L2_2 = L2_2.CurrentMenu
            L3_2 = not A1_2
            L2_2.Open = L3_2
            L3_2 = A0_2
            L2_2 = A0_2.UpdateInstructionalButtons
            L4_2 = A1_2
            L2_2(L3_2, L4_2)
            L3_2 = A0_2
            L2_2 = A0_2.UpdateCursorStyle
            L2_2(L3_2)
          end
          L2_2 = RageUI
          L2_2.CurrentMenu = A0_2
        else
          L2_2 = RageUI
          L2_2.CurrentMenu = nil
        end
        A0_2.Open = A1_2
        L2_2 = RageUI
        L2_2.Options = 0
        L2_2 = RageUI
        L2_2.ItemOffset = 0
        L2_2 = RageUI
        L2_2.LastControl = false
      else
        L2_2 = A0_2.Open
        return L2_2
      end
    end
  end
end
L0_1.Visible = L1_1
L0_1 = RageUI
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if nil ~= L0_2 then
    L0_2 = RageUI
    L0_2 = L0_2.CurrentMenu
    L0_2 = L0_2.Parent
    while nil ~= L0_2 do
      L0_2.Index = 1
      L1_2 = L0_2.Pagination
      L1_2.Minimum = 1
      L1_2 = L0_2.Pagination
      L2_2 = L0_2.Pagination
      L2_2 = L2_2.Total
      L1_2.Maximum = L2_2
      L0_2 = L0_2.Parent
    end
    L1_2 = RageUI
    L1_2 = L1_2.CurrentMenu
    L1_2.Index = 1
    L1_2 = RageUI
    L1_2 = L1_2.CurrentMenu
    L1_2 = L1_2.Pagination
    L1_2.Minimum = 1
    L1_2 = RageUI
    L1_2 = L1_2.CurrentMenu
    L1_2 = L1_2.Pagination
    L2_2 = RageUI
    L2_2 = L2_2.CurrentMenu
    L2_2 = L2_2.Pagination
    L2_2 = L2_2.Total
    L1_2.Maximum = L2_2
    L1_2 = RageUI
    L1_2 = L1_2.CurrentMenu
    L1_2.Open = false
    L1_2 = RageUI
    L1_2.CurrentMenu = nil
  end
  L0_2 = RageUI
  L0_2.Options = 0
  L0_2 = RageUI
  L0_2.ItemOffset = 0
  L0_2 = ResetScriptGfxAlign
  L0_2()
end
L0_1.CloseAll = L1_1
L0_1 = RageUI
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if nil ~= L0_2 then
    L1_2 = L0_2
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = L0_2.Display
      L1_2 = L1_2.Header
      if L1_2 then
        L1_2 = RageUI
        L1_2 = L1_2.ItemsSafeZone
        L2_2 = L0_2
        L1_2(L2_2)
        L1_2 = L0_2.Sprite
        if nil ~= L1_2 then
          L1_2 = L0_2.Sprite
          L1_2 = L1_2.Dictionary
          if nil ~= L1_2 then
            L1_2 = L0_2.Sprite
            L1_2 = L1_2.Dictionary
            if "commonmenu.ytd" == L1_2 then
              L1_2 = RenderSprite
              L2_2 = L0_2.Sprite
              L2_2 = L2_2.Dictionary
              L3_2 = L0_2.Sprite
              L3_2 = L3_2.Texture
              L4_2 = L0_2.X
              L5_2 = L0_2.Y
              L6_2 = RageUI
              L6_2 = L6_2.Settings
              L6_2 = L6_2.Items
              L6_2 = L6_2.Title
              L6_2 = L6_2.Background
              L6_2 = L6_2.Width
              L7_2 = L0_2.WidthOffset
              L6_2 = L6_2 + L7_2
              L7_2 = RageUI
              L7_2 = L7_2.Settings
              L7_2 = L7_2.Items
              L7_2 = L7_2.Title
              L7_2 = L7_2.Background
              L7_2 = L7_2.Height
              L8_2 = L0_2.Sprite
              L8_2 = L8_2.Color
              L8_2 = L8_2.R
              L9_2 = L0_2.Sprite
              L9_2 = L9_2.Color
              L9_2 = L9_2.G
              L10_2 = L0_2.Sprite
              L10_2 = L10_2.Color
              L10_2 = L10_2.B
              L11_2 = L0_2.Sprite
              L11_2 = L11_2.Color
              L11_2 = L11_2.A
              L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
            else
              L1_2 = RenderSprite
              L2_2 = L0_2.Sprite
              L2_2 = L2_2.Dictionary
              L3_2 = L0_2.Sprite
              L3_2 = L3_2.Texture
              L4_2 = L0_2.X
              L5_2 = L0_2.Y
              L6_2 = RageUI
              L6_2 = L6_2.Settings
              L6_2 = L6_2.Items
              L6_2 = L6_2.Title
              L6_2 = L6_2.Background
              L6_2 = L6_2.Width
              L7_2 = L0_2.WidthOffset
              L6_2 = L6_2 + L7_2
              L7_2 = RageUI
              L7_2 = L7_2.Settings
              L7_2 = L7_2.Items
              L7_2 = L7_2.Title
              L7_2 = L7_2.Background
              L7_2 = L7_2.Height
              L8_2 = nil
              L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
            end
          else
            L1_2 = RenderRectangle
            L2_2 = L0_2.X
            L3_2 = L0_2.Y
            L4_2 = RageUI
            L4_2 = L4_2.Settings
            L4_2 = L4_2.Items
            L4_2 = L4_2.Title
            L4_2 = L4_2.Background
            L4_2 = L4_2.Width
            L5_2 = L0_2.WidthOffset
            L4_2 = L4_2 + L5_2
            L5_2 = RageUI
            L5_2 = L5_2.Settings
            L5_2 = L5_2.Items
            L5_2 = L5_2.Title
            L5_2 = L5_2.Background
            L5_2 = L5_2.Height
            L6_2 = L0_2.Rectangle
            L6_2 = L6_2.R
            L7_2 = L0_2.Rectangle
            L7_2 = L7_2.G
            L8_2 = L0_2.Rectangle
            L8_2 = L8_2.B
            L9_2 = L0_2.Rectangle
            L9_2 = L9_2.A
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
          end
        else
          L1_2 = RenderRectangle
          L2_2 = L0_2.X
          L3_2 = L0_2.Y
          L4_2 = RageUI
          L4_2 = L4_2.Settings
          L4_2 = L4_2.Items
          L4_2 = L4_2.Title
          L4_2 = L4_2.Background
          L4_2 = L4_2.Width
          L5_2 = L0_2.WidthOffset
          L4_2 = L4_2 + L5_2
          L5_2 = RageUI
          L5_2 = L5_2.Settings
          L5_2 = L5_2.Items
          L5_2 = L5_2.Title
          L5_2 = L5_2.Background
          L5_2 = L5_2.Height
          L6_2 = L0_2.Rectangle
          L6_2 = L6_2.R
          L7_2 = L0_2.Rectangle
          L7_2 = L7_2.G
          L8_2 = L0_2.Rectangle
          L8_2 = L8_2.B
          L9_2 = L0_2.Rectangle
          L9_2 = L9_2.A
          L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
        end
        L1_2 = L0_2.Display
        L1_2 = L1_2.Glare
        if L1_2 then
          L1_2 = RequestScaleformMovie
          L2_2 = "MP_MENU_GLARE"
          L1_2 = L1_2(L2_2)
          L2_2 = RageUI
          L2_2 = L2_2.Settings
          L2_2 = L2_2.Items
          L2_2 = L2_2.Title
          L2_2 = L2_2.Background
          L2_2 = L2_2.Width
          L3_2 = RageUI
          L3_2 = L3_2.Settings
          L3_2 = L3_2.Items
          L3_2 = L3_2.Title
          L3_2 = L3_2.Background
          L3_2 = L3_2.Height
          L4_2 = L0_2.X
          L4_2 = L4_2 / 1920
          L5_2 = L0_2.SafeZoneSize
          L5_2 = L5_2.X
          L6_2 = L0_2.WidthOffset
          L6_2 = L6_2 * 0.065731
          L7_2 = 64.399
          L6_2 = L7_2 - L6_2
          L5_2 = L5_2 / L6_2
          L4_2 = L4_2 + L5_2
          L5_2 = L0_2.Y
          L5_2 = L5_2 / 1080
          L6_2 = L0_2.SafeZoneSize
          L6_2 = L6_2.Y
          L6_2 = L6_2 / 33.195020746888
          L5_2 = L5_2 + L6_2
          L6_2 = RageUI
          L6_2 = L6_2.SetScaleformParams
          L7_2 = L1_2
          L8_2 = {}
          L9_2 = {}
          L9_2.name = "SET_DATA_SLOT"
          L10_2 = {}
          L11_2 = GetGameplayCamRelativeHeading
          L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L11_2()
          L10_2[1] = L11_2
          L10_2[2] = L12_2
          L10_2[3] = L13_2
          L10_2[4] = L14_2
          L10_2[5] = L15_2
          L10_2[6] = L16_2
          L9_2.param = L10_2
          L8_2[1] = L9_2
          L6_2(L7_2, L8_2)
          L6_2 = DrawScaleformMovie
          L7_2 = L1_2
          L8_2 = L4_2
          L9_2 = L5_2
          L10_2 = L2_2 / 430
          L11_2 = L3_2 / 100
          L12_2 = 255
          L13_2 = 255
          L14_2 = 255
          L15_2 = 255
          L16_2 = 0
          L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        end
        L1_2 = RenderText
        L2_2 = L0_2.Title
        L3_2 = L0_2.X
        L4_2 = RageUI
        L4_2 = L4_2.Settings
        L4_2 = L4_2.Items
        L4_2 = L4_2.Title
        L4_2 = L4_2.Text
        L4_2 = L4_2.X
        L3_2 = L3_2 + L4_2
        L4_2 = L0_2.WidthOffset
        L4_2 = L4_2 / 2
        L3_2 = L3_2 + L4_2
        L4_2 = L0_2.Y
        L5_2 = RageUI
        L5_2 = L5_2.Settings
        L5_2 = L5_2.Items
        L5_2 = L5_2.Title
        L5_2 = L5_2.Text
        L5_2 = L5_2.Y
        L4_2 = L4_2 + L5_2
        L5_2 = L0_2.TitleFont
        L6_2 = L0_2.TitleScale
        L7_2 = 255
        L8_2 = 255
        L9_2 = 255
        L10_2 = 255
        L11_2 = 1
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
        L1_2 = RageUI
        L2_2 = RageUI
        L2_2 = L2_2.ItemOffset
        L3_2 = RageUI
        L3_2 = L3_2.Settings
        L3_2 = L3_2.Items
        L3_2 = L3_2.Title
        L3_2 = L3_2.Background
        L3_2 = L3_2.Height
        L2_2 = L2_2 + L3_2
        L1_2.ItemOffset = L2_2
      end
    end
  end
end
L0_1.Banner = L1_1
L0_1 = RageUI
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if nil ~= L0_2 then
    L1_2 = L0_2
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = L0_2.Display
      L1_2 = L1_2.Subtitle
      if L1_2 then
        L1_2 = RageUI
        L1_2 = L1_2.ItemsSafeZone
        L2_2 = L0_2
        L1_2(L2_2)
        L1_2 = L0_2.Subtitle
        if "" ~= L1_2 then
          L1_2 = RenderRectangle
          L2_2 = L0_2.X
          L3_2 = L0_2.Y
          L4_2 = RageUI
          L4_2 = L4_2.ItemOffset
          L3_2 = L3_2 + L4_2
          L4_2 = RageUI
          L4_2 = L4_2.Settings
          L4_2 = L4_2.Items
          L4_2 = L4_2.Subtitle
          L4_2 = L4_2.Background
          L4_2 = L4_2.Width
          L5_2 = L0_2.WidthOffset
          L4_2 = L4_2 + L5_2
          L5_2 = RageUI
          L5_2 = L5_2.Settings
          L5_2 = L5_2.Items
          L5_2 = L5_2.Subtitle
          L5_2 = L5_2.Background
          L5_2 = L5_2.Height
          L6_2 = L0_2.SubtitleHeight
          L5_2 = L5_2 + L6_2
          L6_2 = 20
          L7_2 = 24
          L8_2 = 28
          L9_2 = 255
          L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
          L1_2 = RenderText
          L2_2 = L0_2.PageCounterColour
          L3_2 = L0_2.Subtitle
          L2_2 = L2_2 .. L3_2
          L3_2 = L0_2.X
          L4_2 = RageUI
          L4_2 = L4_2.Settings
          L4_2 = L4_2.Items
          L4_2 = L4_2.Subtitle
          L4_2 = L4_2.Text
          L4_2 = L4_2.X
          L3_2 = L3_2 + L4_2
          L4_2 = L0_2.Y
          L5_2 = RageUI
          L5_2 = L5_2.Settings
          L5_2 = L5_2.Items
          L5_2 = L5_2.Subtitle
          L5_2 = L5_2.Text
          L5_2 = L5_2.Y
          L4_2 = L4_2 + L5_2
          L5_2 = RageUI
          L5_2 = L5_2.ItemOffset
          L4_2 = L4_2 + L5_2
          L5_2 = 8
          L6_2 = RageUI
          L6_2 = L6_2.Settings
          L6_2 = L6_2.Items
          L6_2 = L6_2.Subtitle
          L6_2 = L6_2.Text
          L6_2 = L6_2.Scale
          L7_2 = 245
          L8_2 = 245
          L9_2 = 245
          L10_2 = 255
          L11_2 = nil
          L12_2 = false
          L13_2 = false
          L14_2 = RageUI
          L14_2 = L14_2.Settings
          L14_2 = L14_2.Items
          L14_2 = L14_2.Subtitle
          L14_2 = L14_2.Background
          L14_2 = L14_2.Width
          L15_2 = L0_2.WidthOffset
          L14_2 = L14_2 + L15_2
          L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
          L1_2 = L0_2.Index
          L2_2 = L0_2.Options
          if not (L1_2 > L2_2) then
            L1_2 = L0_2.Index
            if not (L1_2 < 0) then
              goto lbl_108
            end
          end
          L0_2.Index = 1
          ::lbl_108::
          if nil ~= L0_2 then
            L1_2 = L0_2.Index
            L2_2 = L0_2.Pagination
            L2_2 = L2_2.Total
            if L1_2 > L2_2 then
              L1_2 = L0_2.Index
              L2_2 = L0_2.Pagination
              L2_2 = L2_2.Total
              L1_2 = L1_2 - L2_2
              L2_2 = L0_2.Pagination
              L3_2 = 1 + L1_2
              L2_2.Minimum = L3_2
              L2_2 = L0_2.Pagination
              L3_2 = L0_2.Pagination
              L3_2 = L3_2.Total
              L3_2 = L3_2 + L1_2
              L2_2.Maximum = L3_2
            else
              L1_2 = L0_2.Pagination
              L1_2.Minimum = 1
              L1_2 = L0_2.Pagination
              L2_2 = L0_2.Pagination
              L2_2 = L2_2.Total
              L1_2.Maximum = L2_2
            end
          end
          L1_2 = L0_2.Display
          L1_2 = L1_2.PageCounter
          if L1_2 then
            L1_2 = L0_2.PageCounter
            if nil == L1_2 then
              L1_2 = RenderText
              L2_2 = L0_2.PageCounterColour
              L3_2 = L0_2.Index
              L4_2 = " / "
              L5_2 = L0_2.Options
              L2_2 = L2_2 .. L3_2 .. L4_2 .. L5_2
              L3_2 = L0_2.X
              L4_2 = RageUI
              L4_2 = L4_2.Settings
              L4_2 = L4_2.Items
              L4_2 = L4_2.Subtitle
              L4_2 = L4_2.PreText
              L4_2 = L4_2.X
              L3_2 = L3_2 + L4_2
              L4_2 = L0_2.WidthOffset
              L3_2 = L3_2 + L4_2
              L4_2 = L0_2.Y
              L5_2 = RageUI
              L5_2 = L5_2.Settings
              L5_2 = L5_2.Items
              L5_2 = L5_2.Subtitle
              L5_2 = L5_2.PreText
              L5_2 = L5_2.Y
              L4_2 = L4_2 + L5_2
              L5_2 = RageUI
              L5_2 = L5_2.ItemOffset
              L4_2 = L4_2 + L5_2
              L5_2 = 8
              L6_2 = RageUI
              L6_2 = L6_2.Settings
              L6_2 = L6_2.Items
              L6_2 = L6_2.Subtitle
              L6_2 = L6_2.PreText
              L6_2 = L6_2.Scale
              L7_2 = 245
              L8_2 = 245
              L9_2 = 245
              L10_2 = 255
              L11_2 = 2
              L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
            else
              L1_2 = RenderText
              L2_2 = L0_2.PageCounter
              L3_2 = L0_2.X
              L4_2 = RageUI
              L4_2 = L4_2.Settings
              L4_2 = L4_2.Items
              L4_2 = L4_2.Subtitle
              L4_2 = L4_2.PreText
              L4_2 = L4_2.X
              L3_2 = L3_2 + L4_2
              L4_2 = L0_2.WidthOffset
              L3_2 = L3_2 + L4_2
              L4_2 = L0_2.Y
              L5_2 = RageUI
              L5_2 = L5_2.Settings
              L5_2 = L5_2.Items
              L5_2 = L5_2.Subtitle
              L5_2 = L5_2.PreText
              L5_2 = L5_2.Y
              L4_2 = L4_2 + L5_2
              L5_2 = RageUI
              L5_2 = L5_2.ItemOffset
              L4_2 = L4_2 + L5_2
              L5_2 = 8
              L6_2 = RageUI
              L6_2 = L6_2.Settings
              L6_2 = L6_2.Items
              L6_2 = L6_2.Subtitle
              L6_2 = L6_2.PreText
              L6_2 = L6_2.Scale
              L7_2 = 245
              L8_2 = 245
              L9_2 = 245
              L10_2 = 255
              L11_2 = 2
              L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
            end
          end
          L1_2 = RageUI
          L2_2 = RageUI
          L2_2 = L2_2.ItemOffset
          L3_2 = RageUI
          L3_2 = L3_2.Settings
          L3_2 = L3_2.Items
          L3_2 = L3_2.Subtitle
          L3_2 = L3_2.Background
          L3_2 = L3_2.Height
          L2_2 = L2_2 + L3_2
          L1_2.ItemOffset = L2_2
        end
      end
    end
  end
end
L0_1.Subtitle = L1_1
L0_1 = RageUI
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if nil ~= L0_2 then
    L1_2 = L0_2
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = L0_2.Display
      L1_2 = L1_2.Background
      if L1_2 then
        L1_2 = RageUI
        L1_2 = L1_2.ItemsSafeZone
        L2_2 = L0_2
        L1_2(L2_2)
        L1_2 = SetScriptGfxDrawOrder
        L2_2 = 0
        L1_2(L2_2)
        L1_2 = RenderRectangle
        L2_2 = L0_2.X
        L3_2 = L0_2.Y
        L4_2 = RageUI
        L4_2 = L4_2.Settings
        L4_2 = L4_2.Items
        L4_2 = L4_2.Background
        L4_2 = L4_2.Y
        L3_2 = L3_2 + L4_2
        L4_2 = L0_2.SubtitleHeight
        L3_2 = L3_2 + L4_2
        L4_2 = RageUI
        L4_2 = L4_2.Settings
        L4_2 = L4_2.Items
        L4_2 = L4_2.Background
        L4_2 = L4_2.Width
        L5_2 = L0_2.WidthOffset
        L4_2 = L4_2 + L5_2
        L5_2 = RageUI
        L5_2 = L5_2.ItemOffset
        L5_2 = L5_2 + 7
        L6_2 = 20
        L7_2 = 24
        L8_2 = 28
        L9_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
        L1_2 = SetScriptGfxDrawOrder
        L2_2 = 1
        L1_2(L2_2)
      end
    end
  end
end
L0_1.Background = L1_1
L0_1 = RageUI
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  L1_2 = RageUI
  L1_2 = L1_2.Settings
  L1_2 = L1_2.Items
  L1_2 = L1_2.Description
  if nil ~= L0_2 then
    L2_2 = L0_2.Description
    if nil ~= L2_2 then
      L2_2 = L0_2
      L2_2 = L2_2()
      if L2_2 then
        L2_2 = RageUI
        L2_2 = L2_2.ItemsSafeZone
        L3_2 = L0_2
        L2_2(L3_2)
        L2_2 = RenderRectangle
        L3_2 = L0_2.X
        L4_2 = L0_2.Y
        L5_2 = L1_2.Background
        L5_2 = L5_2.Y
        L4_2 = L4_2 + L5_2
        L5_2 = L0_2.SubtitleHeight
        L4_2 = L4_2 + L5_2
        L5_2 = RageUI
        L5_2 = L5_2.ItemOffset
        L4_2 = L4_2 + L5_2
        L4_2 = L4_2 + 5
        L5_2 = L1_2.Background
        L5_2 = L5_2.Width
        L6_2 = L0_2.WidthOffset
        L5_2 = L5_2 + L6_2
        L6_2 = L0_2.DescriptionHeight
        L6_2 = L6_2 + 5
        L7_2 = 20
        L8_2 = 24
        L9_2 = 28
        L10_2 = 255
        L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
        L2_2 = RenderText
        L3_2 = L0_2.Description
        L4_2 = L0_2.X
        L5_2 = L1_2.Text
        L5_2 = L5_2.X
        L4_2 = L4_2 + L5_2
        L5_2 = L0_2.Y
        L6_2 = L1_2.Text
        L6_2 = L6_2.Y
        L5_2 = L5_2 + L6_2
        L6_2 = L0_2.SubtitleHeight
        L5_2 = L5_2 + L6_2
        L6_2 = RageUI
        L6_2 = L6_2.ItemOffset
        L5_2 = L5_2 + L6_2
        L5_2 = L5_2 + 5
        L6_2 = 0
        L7_2 = L1_2.Text
        L7_2 = L7_2.Scale
        L8_2 = 255
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = nil
        L13_2 = false
        L14_2 = false
        L15_2 = L1_2.Background
        L15_2 = L15_2.Width
        L16_2 = L0_2.WidthOffset
        L15_2 = L15_2 + L16_2
        L15_2 = L15_2 - 8.0
        L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        L2_2 = RageUI
        L3_2 = RageUI
        L3_2 = L3_2.ItemOffset
        L4_2 = L0_2.DescriptionHeight
        L3_2 = L3_2 + L4_2
        L4_2 = L1_2.Bar
        L4_2 = L4_2.Y
        L3_2 = L3_2 + L4_2
        L2_2.ItemOffset = L3_2
      end
    end
  end
end
L0_1.Description = L1_1
L0_1 = RageUI
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = RageUI
  L0_2 = L0_2.CurrentMenu
  if nil ~= L0_2 then
    L1_2 = L0_2
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = L0_2.Safezone
      if L1_2 then
        L1_2 = ResetScriptGfxAlign
        L1_2()
      end
      L1_2 = L0_2.Display
      L1_2 = L1_2.InstructionalButton
      if L1_2 then
        L1_2 = L0_2.InitScaleform
        if not L1_2 then
          L2_2 = L0_2
          L1_2 = L0_2.UpdateInstructionalButtons
          L3_2 = true
          L1_2(L2_2, L3_2)
          L0_2.InitScaleform = true
        end
        L1_2 = DrawScaleformMovieFullscreen
        L2_2 = L0_2.InstructionalScaleform
        L3_2 = 255
        L4_2 = 255
        L5_2 = 255
        L6_2 = 255
        L7_2 = 0
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
      end
      L1_2 = RageUI
      L1_2 = L1_2.Options
      L0_2.Options = L1_2
      L0_2.SafeZoneSize = nil
      L1_2 = RageUI
      L1_2 = L1_2.Controls
      L1_2()
      L1_2 = RageUI
      L1_2.Options = 0
      L1_2 = RageUI
      L1_2.StatisticPanelCount = 0
      L1_2 = RageUI
      L1_2.ItemOffset = 0
      L1_2 = L0_2.Controls
      L1_2 = L1_2.Back
      L1_2 = L1_2.Enabled
      if L1_2 then
        L1_2 = L0_2.Controls
        L1_2 = L1_2.Back
        L1_2 = L1_2.Pressed
        if L1_2 then
          L1_2 = L0_2.Closable
          if L1_2 then
            L1_2 = isWaitingForServer
            if not L1_2 then
              L1_2 = L0_2.Controls
              L1_2 = L1_2.Back
              L1_2.Pressed = false
              L1_2 = RageUI
              L1_2 = L1_2.Settings
              L1_2 = L1_2.Audio
              L2_2 = RageUI
              L2_2 = L2_2.PlaySound
              L3_2 = L1_2.Use
              L3_2 = L1_2[L3_2]
              L3_2 = L3_2.Back
              L3_2 = L3_2.audioName
              L4_2 = L1_2.Use
              L4_2 = L1_2[L4_2]
              L4_2 = L4_2.Back
              L4_2 = L4_2.audioRef
              L2_2(L3_2, L4_2)
              L2_2 = L0_2.Closed
              if nil ~= L2_2 then
                L2_2 = collectgarbage
                L2_2()
                L2_2 = L0_2.Closed
                L2_2()
              end
              L2_2 = L0_2.Parent
              if nil ~= L2_2 then
                L2_2 = L0_2.Parent
                L2_2 = L2_2()
                if L2_2 then
                  L2_2 = RageUI
                  L3_2 = L0_2.Parent
                  L2_2.NextMenu = L3_2
                  L3_2 = L0_2
                  L2_2 = L0_2.UpdateCursorStyle
                  L2_2(L3_2)
                else
                  L2_2 = RageUI
                  L2_2.NextMenu = nil
                  L2_2 = RageUI
                  L2_2 = L2_2.Visible
                  L3_2 = L0_2
                  L4_2 = false
                  L2_2(L3_2, L4_2)
                end
              else
                L2_2 = RageUI
                L2_2.NextMenu = nil
                L2_2 = RageUI
                L2_2 = L2_2.Visible
                L3_2 = L0_2
                L4_2 = false
                L2_2(L3_2, L4_2)
              end
          end
        end
        else
          L1_2 = L0_2.Controls
          L1_2 = L1_2.Back
          L1_2 = L1_2.Pressed
          if L1_2 then
            L1_2 = L0_2.Closable
            if not L1_2 then
              L1_2 = L0_2.Controls
              L1_2 = L1_2.Back
              L1_2.Pressed = false
            end
          end
        end
      end
      L1_2 = RageUI
      L1_2 = L1_2.NextMenu
      if nil ~= L1_2 then
        L1_2 = RageUI
        L1_2 = L1_2.NextMenu
        L1_2 = L1_2()
        if L1_2 then
          L1_2 = RageUI
          L1_2 = L1_2.Visible
          L2_2 = L0_2
          L3_2 = false
          L1_2(L2_2, L3_2)
          L1_2 = RageUI
          L1_2 = L1_2.Visible
          L2_2 = RageUI
          L2_2 = L2_2.NextMenu
          L3_2 = true
          L1_2(L2_2, L3_2)
          L1_2 = L0_2.Controls
          L1_2 = L1_2.Select
          L1_2.Active = false
          L1_2 = RageUI
          L1_2.NextMenu = nil
          L1_2 = RageUI
          L1_2.LastControl = false
        end
      end
    end
  end
end
L0_1.Render = L1_1
L0_1 = RageUI
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  if "" ~= A1_2 or nil ~= A1_2 then
    L3_2 = RageUI
    L3_2 = L3_2.Settings
    L3_2 = L3_2.Items
    L3_2 = L3_2.Description
    if A2_2 then
      L4_2 = A0_2.Description
      if L4_2 ~= A1_2 then
        L4_2 = A1_2 or L4_2
        if not A1_2 then
          L4_2 = nil
        end
        A0_2.Description = L4_2
        L4_2 = GetLineCount
        L5_2 = A0_2.Description
        L6_2 = A0_2.X
        L7_2 = L3_2.Text
        L7_2 = L7_2.X
        L6_2 = L6_2 + L7_2
        L7_2 = A0_2.Y
        L8_2 = L3_2.Text
        L8_2 = L8_2.Y
        L7_2 = L7_2 + L8_2
        L8_2 = A0_2.SubtitleHeight
        L7_2 = L7_2 + L8_2
        L8_2 = RageUI
        L8_2 = L8_2.ItemOffset
        L7_2 = L7_2 + L8_2
        L8_2 = 0
        L9_2 = L3_2.Text
        L9_2 = L9_2.Scale
        L10_2 = 20
        L11_2 = 24
        L12_2 = 28
        L13_2 = 1
        L14_2 = nil
        L15_2 = false
        L16_2 = false
        L17_2 = L3_2.Background
        L17_2 = L17_2.Width
        L18_2 = A0_2.WidthOffset
        L18_2 = L18_2 - 5.0
        L17_2 = L17_2 + L18_2
        L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
        if L4_2 > 1 then
          L5_2 = L3_2.Background
          L5_2 = L5_2.Height
          L5_2 = L5_2 * L4_2
          A0_2.DescriptionHeight = L5_2
        else
          L5_2 = L3_2.Background
          L5_2 = L5_2.Height
          L5_2 = L5_2 + 7
          A0_2.DescriptionHeight = L5_2
        end
      end
    end
  end
end
L0_1.ItemsDescription = L1_1
L0_1 = RageUI
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = false
  L5_2 = RageUI
  L5_2 = L5_2.IsMouseInBounds
  L6_2 = A0_2.X
  L7_2 = A0_2.SafeZoneSize
  L7_2 = L7_2.X
  L6_2 = L6_2 + L7_2
  L7_2 = A0_2.Y
  L8_2 = A3_2.Rectangle
  L8_2 = L8_2.Y
  L7_2 = L7_2 + L8_2
  L8_2 = A0_2.SafeZoneSize
  L8_2 = L8_2.Y
  L7_2 = L7_2 + L8_2
  L8_2 = A0_2.SubtitleHeight
  L7_2 = L7_2 + L8_2
  L8_2 = RageUI
  L8_2 = L8_2.ItemOffset
  L7_2 = L7_2 + L8_2
  L8_2 = A3_2.Rectangle
  L8_2 = L8_2.Width
  L9_2 = A0_2.WidthOffset
  L8_2 = L8_2 + L9_2
  L9_2 = A3_2.Rectangle
  L9_2 = L9_2.Height
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L4_2 = L5_2
  if L4_2 and not A1_2 then
    L5_2 = RenderRectangle
    L6_2 = A0_2.X
    L7_2 = A0_2.Y
    L8_2 = A3_2.Rectangle
    L8_2 = L8_2.Y
    L7_2 = L7_2 + L8_2
    L8_2 = A0_2.SubtitleHeight
    L7_2 = L7_2 + L8_2
    L8_2 = RageUI
    L8_2 = L8_2.ItemOffset
    L7_2 = L7_2 + L8_2
    L8_2 = A3_2.Rectangle
    L8_2 = L8_2.Width
    L9_2 = A0_2.WidthOffset
    L8_2 = L8_2 + L9_2
    L9_2 = A3_2.Rectangle
    L9_2 = L9_2.Height
    L10_2 = 255
    L11_2 = 255
    L12_2 = 255
    L13_2 = 20
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L5_2 = A0_2.Controls
    L5_2 = L5_2.Click
    L5_2 = L5_2.Active
    if L5_2 then
      A0_2.Index = A2_2
      L5_2 = RageUI
      L5_2 = L5_2.Settings
      L5_2 = L5_2.Audio
      L6_2 = RageUI
      L6_2 = L6_2.PlaySound
      L7_2 = L5_2.Use
      L7_2 = L5_2[L7_2]
      L7_2 = L7_2.UpDown
      L7_2 = L7_2.audioName
      L8_2 = L5_2.Use
      L8_2 = L5_2[L8_2]
      L8_2 = L8_2.UpDown
      L8_2 = L8_2.audioRef
      L6_2(L7_2, L8_2)
    end
  end
  return L4_2
end
L0_1.ItemsMouseBounds = L1_1
L0_1 = RageUI
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2.SafeZoneSize
  if not L1_2 then
    L1_2 = {}
    L1_2.X = 0
    L1_2.Y = 0
    A0_2.SafeZoneSize = L1_2
    L1_2 = A0_2.Safezone
    if L1_2 then
      L1_2 = RageUI
      L1_2 = L1_2.GetSafeZoneBounds
      L1_2 = L1_2()
      A0_2.SafeZoneSize = L1_2
      L1_2 = SetScriptGfxAlign
      L2_2 = 76
      L3_2 = 84
      L1_2(L2_2, L3_2)
      L1_2 = SetScriptGfxAlignParams
      L2_2 = 0
      L3_2 = 0
      L4_2 = 0
      L5_2 = 0
      L1_2(L2_2, L3_2, L4_2, L5_2)
    end
  end
end
L0_1.ItemsSafeZone = L1_1
L0_1 = RageUI
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2
  L4_2 = A2_2 or L4_2
  L4_2 = A3_2 or L4_2
  if (A0_2 ~= A1_2 or not A2_2) and not A3_2 then
    L4_2 = {}
  end
  return L4_2
end
L0_1.CurrentIsEqualTo = L1_1
L0_1 = RageUI
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = RageUI
  L3_2 = L3_2.Visible
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = UpdateOnscreenKeyboard
    L3_2 = L3_2()
    if 0 ~= L3_2 then
      L3_2 = UpdateOnscreenKeyboard
      L3_2 = L3_2()
      if 3 ~= L3_2 then
        L3_2 = RageUI
        L3_2 = L3_2.Banner
        L3_2()
        L3_2 = RageUI
        L3_2 = L3_2.Subtitle
        L3_2()
        if nil ~= A1_2 then
          L3_2 = A1_2
          L3_2()
        end
        L3_2 = RageUI
        L3_2 = L3_2.Background
        L3_2()
        L3_2 = RageUI
        L3_2 = L3_2.Navigation
        L3_2()
        L3_2 = RageUI
        L3_2 = L3_2.Description
        L3_2()
        if nil ~= A2_2 then
          L3_2 = A2_2
          L3_2()
        end
        L3_2 = RageUI
        L3_2 = L3_2.Render
        L3_2()
      end
    end
  end
end
L0_1.IsVisible = L1_1
L0_1 = RageUI
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = RageUI
  L1_2 = L1_2.Settings
  L1_2 = L1_2.Audio
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = "RageUI"
  end
  L1_2.Use = L2_2
end
L0_1.SetStyleAudio = L1_1
L0_1 = RageUI
function L1_1()
  local L0_2, L1_2
  L0_2 = RageUI
  L0_2 = L0_2.Settings
  L0_2 = L0_2.Audio
  L0_2 = L0_2.Use
  if not L0_2 then
    L0_2 = "RageUI"
  end
  return L0_2
end
L0_1.GetStyleAudio = L1_1
