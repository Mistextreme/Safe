local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L0_1.ESC = 322
L0_1.F1 = 288
L0_1.F2 = 289
L0_1.F3 = 170
L0_1.F5 = 166
L0_1.F6 = 167
L0_1.F7 = 168
L0_1.F8 = 169
L0_1.F9 = 56
L0_1.F10 = 57
L0_1["~"] = 243
L0_1["1"] = 157
L0_1["2"] = 158
L0_1["3"] = 160
L0_1["4"] = 164
L0_1["5"] = 165
L0_1["6"] = 159
L0_1["7"] = 161
L0_1["8"] = 162
L0_1["9"] = 163
L0_1["-"] = 84
L0_1["="] = 83
L0_1.BACKSPACE = 177
L0_1.TAB = 37
L0_1.Q = 44
L0_1.W = 32
L0_1.E = 38
L0_1.R = 45
L0_1.T = 245
L0_1.Y = 246
L0_1.U = 303
L0_1.P = 199
L0_1["["] = 39
L0_1["]"] = 40
L0_1.ENTER = 18
L0_1.CAPS = 137
L0_1.A = 34
L0_1.S = 8
L0_1.D = 9
L0_1.F = 23
L0_1.G = 47
L0_1.H = 74
L0_1.K = 311
L0_1.L = 182
L0_1.LEFTSHIFT = 21
L0_1.Z = 20
L0_1.X = 73
L0_1.C = 26
L0_1.V = 0
L0_1.B = 29
L0_1.N = 249
L0_1.M = 244
L0_1[","] = 82
L0_1["."] = 81
L0_1.LEFTCTRL = 36
L0_1.LEFTALT = 19
L0_1.SPACE = 22
L0_1.RIGHTCTRL = 70
L0_1.HOME = 213
L0_1.PAGEUP = 10
L0_1.PAGEDOWN = 11
L0_1.DELETE = 178
L0_1.LEFT = 174
L0_1.RIGHT = 175
L0_1.TOP = 27
L0_1.DOWN = 173
L0_1.NENTER = 201
L0_1.N4 = 108
L0_1.N5 = 60
L0_1.N6 = 107
L0_1["N+"] = 96
L0_1["N-"] = 97
L0_1.N7 = 117
L0_1.N8 = 61
L0_1.N9 = 118
L1_1 = {}
laptopObjects = L1_1
L1_1 = {}
swappedCars = L1_1
L1_1 = {}
upgradedCars = L1_1
L1_1 = {}
stocks = L1_1
L1_1 = {}
syncedCars = L1_1
menuOpen = false
time = 0
L1_1 = {}
stockHandling = L1_1
parkedVehicle = nil
currentWorkshop = nil
currentWorkshopKey = nil
workshopVehicle = nil
prepared = false
stockEngineObject = nil
engineLift = nil
holdingLift = false
liftDest = nil
liftInPosition = false
hasEngine = true
swapped = false
engineOnLift = nil
action = nil
atDropoff = false
atPickup = false
selectedEngine = nil
newEngineObject = nil
crateObject = nil
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.Workshops
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L5_2.laptop
    L6_2 = L6_2.prop
    L7_2 = GetHashKey
    L8_2 = L6_2.model
    L7_2 = L7_2(L8_2)
    L8_2 = RequestModel
    L9_2 = L7_2
    L8_2(L9_2)
    while true do
      L8_2 = HasModelLoaded
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      if L8_2 then
        break
      end
      L8_2 = Citizen
      L8_2 = L8_2.Wait
      L9_2 = 10
      L8_2(L9_2)
    end
    L8_2 = CreateObject
    L9_2 = L7_2
    L10_2 = L6_2.x
    L11_2 = L6_2.y
    L12_2 = L6_2.z
    L13_2 = false
    L14_2 = true
    L15_2 = 0
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L9_2 = SetEntityDynamic
    L10_2 = L8_2
    L11_2 = false
    L9_2(L10_2, L11_2)
    L9_2 = FreezeEntityPosition
    L10_2 = L8_2
    L11_2 = true
    L9_2(L10_2, L11_2)
    L9_2 = SetEntityHeading
    L10_2 = L8_2
    L11_2 = L6_2.h
    L9_2(L10_2, L11_2)
    L9_2 = table
    L9_2 = L9_2.insert
    L10_2 = laptopObjects
    L11_2 = L8_2
    L9_2(L10_2, L11_2)
  end
  L0_2 = GetHashKey
  L1_2 = "prop_table_07"
  L0_2 = L0_2(L1_2)
  L1_2 = RequestModel
  L2_2 = L0_2
  L1_2(L2_2)
  while "crateObject" do
    L1_2 = HasModelLoaded
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 10
    L1_2(L2_2)
  end
  L1_2 = CreateObject
  L2_2 = L0_2
  L3_2 = 1095.77
  L4_2 = 1324.0
  L5_2 = 100.0
  L6_2 = false
  L7_2 = false
  L8_2 = 0
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  crateObject = L1_2
  L1_2 = SetEntityHeading
  L2_2 = crateObject
  L3_2 = 66.0
  L1_2(L2_2, L3_2)
  L1_2 = SetEntityDynamic
  L2_2 = crateObject
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = FreezeEntityPosition
  L2_2 = crateObject
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetEntityAsMissionEntity
  L2_2 = crateObject
  L3_2 = true
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
end
L1_1(L2_1)
L1_1 = RegisterNUICallback
L2_1 = "NUILoaded"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = SetNUIUnits
  L2_2()
  L2_2 = InsertNUIEngines
  L2_2()
  L2_2 = DisableSnakeGame
  L2_2()
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.EnableSnakeMinigame
  if not L0_2 then
    L0_2 = SendNUIMessage
    L1_2 = {}
    L1_2.event = "disableSnake"
    L0_2(L1_2)
  end
end
DisableSnakeGame = L1_1
L1_1 = RegisterNUICallback
L2_1 = "SelectEngine"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = IsEngineInStock
  L3_2 = A0_2.engine
  L4_2 = currentWorkshop
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = A0_2.engine
    selectedEngine = L2_2
    L2_2 = A1_2
    L3_2 = true
    L2_2(L3_2)
    return
  end
  L2_2 = ShowTooltip
  L3_2 = "~r~This engine is out of stock"
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = false
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.event = "canSelect"
  L2_2.canSelect = A0_2
  L1_2(L2_2)
end
SetCanSelect = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.event = "clearEngines"
  L0_2(L1_2)
  L0_2 = pairs
  L1_2 = Config
  L1_2 = L1_2.AvailableEngines
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = Config
    L6_2 = L6_2.Engines
    L6_2 = L6_2[L5_2]
    L7_2 = true
    L8_2 = workshopVehicle
    if L8_2 then
      L8_2 = GetVehicleMaxEngineSize
      L9_2 = workshopVehicle
      L8_2 = L8_2(L9_2)
      L9_2 = L6_2.physicalSize
      if L8_2 < L9_2 then
        L7_2 = false
      end
    end
    L8_2 = L6_2.mass
    L9_2 = Config
    L9_2 = L9_2.UseMetric
    if not L9_2 then
      L8_2 = L8_2 * 2.205
    end
    L9_2 = SendNUIMessage
    L10_2 = {}
    L10_2.event = "insertEngine"
    L10_2.key = L5_2
    L11_2 = L6_2.name
    L10_2.name = L11_2
    L11_2 = L6_2.image
    if not L11_2 then
      L11_2 = "missing.png"
    end
    L10_2.image = L11_2
    L11_2 = CalculatePowerRating
    L12_2 = L6_2.power
    L12_2 = L12_2 / 1000
    L11_2 = L11_2(L12_2)
    L10_2.power = L11_2
    L11_2 = CalculateSpeedRating
    L12_2 = L6_2.maxV
    L11_2 = L11_2(L12_2)
    L10_2.speed = L11_2
    L10_2.weight = L8_2
    L10_2.willFit = L7_2
    L11_2 = L6_2.price
    L10_2.price = L11_2
    L11_2 = L6_2.shipmentDuration
    L10_2.shipment = L11_2
    L11_2 = IsEngineInStock
    L12_2 = L5_2
    L13_2 = currentWorkshop
    L11_2 = L11_2(L12_2, L13_2)
    L10_2.inStock = L11_2
    L9_2(L10_2)
  end
end
InsertNUIEngines = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = hasEngine
  if L1_2 then
    if nil ~= A0_2 and -1 ~= A0_2 then
      L1_2 = GetVehicleHandlingFloat
      L2_2 = A0_2
      L3_2 = "CHandlingData"
      L4_2 = "fInitialDriveMaxFlatVel"
      L1_2 = L1_2(L2_2, L3_2, L4_2)
      L2_2 = GetVehicleHandlingFloat
      L3_2 = A0_2
      L4_2 = "CHandlingData"
      L5_2 = "fInitialDriveForce"
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      L3_2 = GetVehicleHandlingFloat
      L4_2 = A0_2
      L5_2 = "CHandlingData"
      L6_2 = "fMass"
      L3_2 = L3_2(L4_2, L5_2, L6_2)
      L4_2 = L3_2 * 0.05
      L4_2 = L4_2 + 100.0
      L5_2 = upgradedCars
      L5_2 = L5_2[A0_2]
      if L5_2 then
        L5_2 = upgradedCars
        L5_2 = L5_2[A0_2]
        L6_2 = Config
        L6_2 = L6_2.Engines
        L6_2 = L6_2[L5_2]
        L4_2 = L6_2.mass
      end
      L5_2 = Config
      L5_2 = L5_2.UseMetric
      if not L5_2 then
        L4_2 = L4_2 * 2.205
      end
      L5_2 = SendNUIMessage
      L6_2 = {}
      L6_2.event = "setVehicle"
      L7_2 = CalculatePowerRating
      L8_2 = L2_2
      L7_2 = L7_2(L8_2)
      L6_2.power = L7_2
      L7_2 = CalculateSpeedRating
      L8_2 = L1_2
      L7_2 = L7_2(L8_2)
      L6_2.speed = L7_2
      L6_2.engineWeight = L4_2
      L5_2(L6_2)
    else
      L1_2 = SendNUIMessage
      L2_2 = {}
      L2_2.event = "removeVehicle"
      L1_2(L2_2)
    end
  end
end
NUISetCurrentVehicle = L1_1
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = "kg"
  L1_2 = Config
  L1_2 = L1_2.UseMetric
  if not L1_2 then
    L0_2 = "lbs"
  end
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.event = "setUnits"
  L2_2.units = L0_2
  L1_2(L2_2)
end
SetNUIUnits = L1_1
function L1_1()
  local L0_2, L1_2, L2_2
  menuOpen = true
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.event = "show"
  L1_2.state = true
  L0_2(L1_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.event = "setPermissions"
  L2_2 = GetPermissions
  L2_2 = L2_2()
  L1_2.permissions = L2_2
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
end
OpenMenu = L1_1
L1_1 = RegisterNUICallback
L2_1 = "CloseMenu"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = CloseMenu
  L2_2()
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2
  menuOpen = false
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.event = "show"
  L1_2.state = false
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
end
CloseMenu = L1_1
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2
  while true do
    L0_2 = 1000
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = GetEntityCoords
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = pairs
    L4_2 = Config
    L4_2 = L4_2.Workshops
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.location
      L10_2 = GetDistanceBetweenCoords
      L11_2 = L9_2.x
      L12_2 = L9_2.y
      L13_2 = L9_2.z
      L14_2 = L2_2
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if L10_2 < 20.0 then
        currentWorkshop = L8_2
        currentWorkshopKey = L7_2
        L11_2 = CanUseWorkshop
        L12_2 = currentWorkshop
        L11_2 = L11_2(L12_2)
        if L11_2 then
          L11_2 = IsPedInAnyVehicle
          L12_2 = L1_2
          L11_2 = L11_2(L12_2)
          if L11_2 then
            L0_2 = 0
          end
          L11_2 = false
          L12_2 = GetNearestVehicle
          L13_2 = L9_2.x
          L14_2 = L9_2.y
          L15_2 = L9_2.z
          L16_2 = 0.75
          L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
          if -1 ~= L12_2 then
            L13_2 = GetEntityHeading
            L14_2 = L12_2
            L13_2 = L13_2(L14_2)
            L14_2 = L9_2.h
            L14_2 = L14_2 - 7.0
            if L13_2 > L14_2 then
              L14_2 = L9_2.h
              L14_2 = L14_2 + 7.0
              if L13_2 < L14_2 then
                parkedVehicle = L12_2
                L11_2 = true
                L14_2 = IsPedInAnyVehicle
                L15_2 = L1_2
                L14_2 = L14_2(L15_2)
                if L14_2 then
                  L14_2 = DrawMarker
                  L15_2 = 43
                  L16_2 = L9_2.x
                  L17_2 = L9_2.y
                  L18_2 = L9_2.z
                  L18_2 = L18_2 - 1.0
                  L19_2 = 0.0
                  L20_2 = 0.0
                  L21_2 = 0.0
                  L22_2 = 0.0
                  L23_2 = 0.0
                  L24_2 = L9_2.h
                  L25_2 = 3.0
                  L26_2 = 6.0
                  L27_2 = 0.5
                  L28_2 = 0
                  L29_2 = 180
                  L30_2 = 40
                  L31_2 = 30
                  L32_2 = 0
                  L33_2 = 0
                  L34_2 = 0
                  L35_2 = 0
                  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                end
            end
            else
              L14_2 = parkedVehicle
              if L14_2 then
                parkedVehicle = nil
              end
              L14_2 = IsPedInAnyVehicle
              L15_2 = L1_2
              L14_2 = L14_2(L15_2)
              if L14_2 then
                L11_2 = true
                L14_2 = DrawMarker
                L15_2 = 43
                L16_2 = L9_2.x
                L17_2 = L9_2.y
                L18_2 = L9_2.z
                L18_2 = L18_2 - 1.0
                L19_2 = 0.0
                L20_2 = 0.0
                L21_2 = 0.0
                L22_2 = 0.0
                L23_2 = 0.0
                L24_2 = L9_2.h
                L25_2 = 3.0
                L26_2 = 6.0
                L27_2 = 0.5
                L28_2 = 180
                L29_2 = 40
                L30_2 = 40
                L31_2 = 30
                L32_2 = 0
                L33_2 = 0
                L34_2 = 0
                L35_2 = 0
                L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
              end
            end
          else
            L13_2 = parkedVehicle
            if L13_2 then
              parkedVehicle = nil
            end
          end
          if not L11_2 then
            L13_2 = IsPedInAnyVehicle
            L14_2 = L1_2
            L13_2 = L13_2(L14_2)
            if L13_2 then
              L13_2 = DrawMarker
              L14_2 = 43
              L15_2 = L9_2.x
              L16_2 = L9_2.y
              L17_2 = L9_2.z
              L17_2 = L17_2 - 1.0
              L18_2 = 0.0
              L19_2 = 0.0
              L20_2 = 0.0
              L21_2 = 0.0
              L22_2 = 0.0
              L23_2 = L9_2.h
              L24_2 = 3.0
              L25_2 = 6.0
              L26_2 = 0.5
              L27_2 = 0
              L28_2 = 40
              L29_2 = 180
              L30_2 = 30
              L31_2 = 0
              L32_2 = 0
              L33_2 = 0
              L34_2 = 0
              L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2)
            end
          end
        end
      end
    end
    L3_2 = workshopVehicle
    if L3_2 then
      L3_2 = prepared
      if L3_2 then
        L3_2 = FreezeEntityPosition
        L4_2 = workshopVehicle
        L5_2 = true
        L3_2(L4_2, L5_2)
      end
    end
    L3_2 = Citizen
    L3_2 = L3_2.Wait
    L4_2 = L0_2
    L3_2(L4_2)
  end
end
L1_1(L2_1)
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  while true do
    L0_2 = 1000
    L1_2 = currentWorkshop
    if L1_2 then
      L1_2 = PlayerPedId
      L1_2 = L1_2()
      L2_2 = GetEntityCoords
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L3_2 = currentWorkshop
      L3_2 = L3_2.location
      L4_2 = currentWorkshop
      L4_2 = L4_2.laptop
      L4_2 = L4_2.prop
      L5_2 = GetDistanceBetweenCoords
      L6_2 = L4_2.x
      L7_2 = L4_2.y
      L8_2 = L4_2.z
      L9_2 = L2_2
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
      if L5_2 < 2.0 then
        L0_2 = 0
        L6_2 = Draw3DText
        L7_2 = L4_2.x
        L8_2 = L4_2.y
        L9_2 = L4_2.z
        L9_2 = L9_2 + 0.2
        L10_2 = L
        L11_2 = "Press [E] to use the laptop"
        L10_2 = L10_2(L11_2)
        L11_2 = 4
        L12_2 = 0.025
        L13_2 = 0.025
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        L6_2 = IsControlJustReleased
        L7_2 = 0
        L8_2 = Config
        L9_2 = L8_2.InteractionKeybind
        L8_2 = L0_1
        L8_2 = L8_2[L9_2]
        L6_2 = L6_2(L7_2, L8_2)
        if L6_2 then
          L6_2 = SetNUIStock
          L6_2()
          L6_2 = OpenMenu
          L6_2()
        end
      end
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L1_1(L2_1)
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  while true do
    L0_2 = 1000
    L1_2 = parkedVehicle
    if L1_2 then
      L1_2 = holdingLift
      if not L1_2 then
        L1_2 = liftInPosition
        if not L1_2 then
          L1_2 = hasEngine
          if L1_2 then
            L1_2 = CanUseWorkshop
            L2_2 = currentWorkshop
            L1_2 = L1_2(L2_2)
            if L1_2 then
              L1_2 = PlayerPedId
              L1_2 = L1_2()
              L2_2 = GetEntityCoords
              L3_2 = L1_2
              L2_2 = L2_2(L3_2)
              L3_2 = GetWorldPositionOfEntityBone
              L4_2 = parkedVehicle
              L5_2 = GetEntityBoneIndexByName
              L6_2 = parkedVehicle
              L7_2 = "engine"
              L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2(L6_2, L7_2)
              L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
              L4_2 = 999.0
              L5_2 = engineLift
              if L5_2 then
                L5_2 = GetEntityCoords
                L6_2 = engineLift
                L5_2 = L5_2(L6_2)
                L6_2 = GetDistanceBetweenCoords
                L7_2 = L5_2
                L8_2 = L3_2
                L6_2 = L6_2(L7_2, L8_2)
                L4_2 = L6_2
              end
              L5_2 = GetDistanceBetweenCoords
              L6_2 = L3_2
              L7_2 = L2_2
              L5_2 = L5_2(L6_2, L7_2)
              if L5_2 < 2.0 then
                L5_2 = IsPedInAnyVehicle
                L6_2 = L1_2
                L5_2 = L5_2(L6_2)
                if not L5_2 and L4_2 > 2.0 then
                  L5_2 = action
                  if not L5_2 then
                    L0_2 = 0
                    L5_2 = CanVehicleBeSwapped
                    L6_2 = parkedVehicle
                    L5_2 = L5_2(L6_2)
                    if L5_2 then
                      L5_2 = workshopVehicle
                      if nil == L5_2 then
                        L5_2 = Draw3DText
                        L6_2 = L3_2.x
                        L7_2 = L3_2.y
                        L8_2 = L3_2.z
                        L8_2 = L8_2 + 0.2
                        L9_2 = L
                        L10_2 = "Press [E] to prepare for an engine swap"
                        L9_2 = L9_2(L10_2)
                        L10_2 = 4
                        L11_2 = 0.03
                        L12_2 = 0.03
                        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                        L5_2 = IsControlJustReleased
                        L6_2 = 0
                        L7_2 = Config
                        L8_2 = L7_2.InteractionKeybind
                        L7_2 = L0_1
                        L7_2 = L7_2[L8_2]
                        L5_2 = L5_2(L6_2, L7_2)
                        if L5_2 then
                          L5_2 = StartPrepareVehicle
                          L5_2()
                        end
                      else
                        L5_2 = Draw3DText
                        L6_2 = L3_2.x
                        L7_2 = L3_2.y
                        L8_2 = L3_2.z
                        L8_2 = L8_2 + 0.2
                        L9_2 = L
                        L10_2 = "Press [E] to end the engine swap"
                        L9_2 = L9_2(L10_2)
                        L10_2 = 4
                        L11_2 = 0.03
                        L12_2 = 0.03
                        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                        L5_2 = IsControlJustReleased
                        L6_2 = 0
                        L7_2 = Config
                        L8_2 = L7_2.InteractionKeybind
                        L7_2 = L0_1
                        L7_2 = L7_2[L8_2]
                        L5_2 = L5_2(L6_2, L7_2)
                        if L5_2 then
                          L5_2 = EndSwap
                          L6_2 = workshopVehicle
                          L5_2(L6_2)
                        end
                      end
                    else
                      L5_2 = Draw3DText
                      L6_2 = L3_2.x
                      L7_2 = L3_2.y
                      L8_2 = L3_2.z
                      L8_2 = L8_2 + 0.2
                      L9_2 = L
                      L10_2 = "~r~This vehicle can not be engine swapped"
                      L9_2 = L9_2(L10_2)
                      L10_2 = 4
                      L11_2 = 0.03
                      L12_2 = 0.03
                      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L1_1(L2_1)
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  while true do
    L0_2 = 1000
    L1_2 = engineLift
    if L1_2 then
      L1_2 = PlayerPedId
      L1_2 = L1_2()
      L2_2 = GetEntityCoords
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L3_2 = GetEntityCoords
      L4_2 = engineLift
      L3_2 = L3_2(L4_2)
      L4_2 = vector3
      L5_2 = L3_2.x
      L6_2 = L3_2.y
      L7_2 = L3_2.z
      L7_2 = L7_2 + 1.0
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L3_2 = L4_2
      L4_2 = GetDistanceBetweenCoords
      L5_2 = L2_2
      L6_2 = L3_2
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = 2.5
      if L4_2 < L5_2 then
        L5_2 = atDropoff
        if L5_2 then
          L5_2 = engineOnLift
          if nil ~= L5_2 then
            L5_2 = holdingLift
            if not L5_2 then
              goto lbl_165
            end
          end
        end
        L5_2 = action
        if not L5_2 then
          L0_2 = 0
          L5_2 = liftInPosition
          if not L5_2 then
            L5_2 = holdingLift
            if not L5_2 then
              L5_2 = selectedEngine
              if L5_2 then
                L5_2 = atPickup
                if not L5_2 then
                  L5_2 = Draw3DText
                  L6_2 = L3_2.x
                  L7_2 = L3_2.y
                  L8_2 = L3_2.z
                  L9_2 = L
                  L10_2 = "Press [E] to grab the engine lift"
                  L9_2 = L9_2(L10_2)
                  L10_2 = 4
                  L11_2 = 0.03
                  L12_2 = 0.03
                  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                  L5_2 = IsControlJustReleased
                  L6_2 = 0
                  L7_2 = Config
                  L8_2 = L7_2.InteractionKeybind
                  L7_2 = L0_1
                  L7_2 = L7_2[L8_2]
                  L5_2 = L5_2(L6_2, L7_2)
                  if L5_2 then
                    L5_2 = GrabLift
                    L5_2()
                  end
                end
              else
                L5_2 = Draw3DText
                L6_2 = L3_2.x
                L7_2 = L3_2.y
                L8_2 = L3_2.z
                L9_2 = L
                L10_2 = "~r~Select desired engine on the laptop first"
                L9_2 = L9_2(L10_2)
                L10_2 = 4
                L11_2 = 0.03
                L12_2 = 0.03
                L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
              end
            else
              L5_2 = Draw3DText
              L6_2 = L3_2.x
              L7_2 = L3_2.y
              L8_2 = L3_2.z
              L9_2 = L
              L10_2 = "Press [E] to let go of the engine lift"
              L9_2 = L9_2(L10_2)
              L10_2 = 4
              L11_2 = 0.03
              L12_2 = 0.03
              L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
              L5_2 = IsControlJustReleased
              L6_2 = 0
              L7_2 = Config
              L8_2 = L7_2.InteractionKeybind
              L7_2 = L0_1
              L7_2 = L7_2[L8_2]
              L5_2 = L5_2(L6_2, L7_2)
              if L5_2 then
                L5_2 = ReleaseLift
                L5_2()
              end
            end
          else
            L5_2 = hasEngine
            if L5_2 then
              L5_2 = swapped
              if not L5_2 then
                L5_2 = Draw3DText
                L6_2 = L3_2.x
                L7_2 = L3_2.y
                L8_2 = L3_2.z
                L9_2 = L
                L10_2 = "Press [E] to take out the engine"
                L9_2 = L9_2(L10_2)
                L10_2 = 4
                L11_2 = 0.03
                L12_2 = 0.03
                L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                L5_2 = IsControlJustReleased
                L6_2 = 0
                L7_2 = Config
                L8_2 = L7_2.InteractionKeybind
                L7_2 = L0_1
                L7_2 = L7_2[L8_2]
                L5_2 = L5_2(L6_2, L7_2)
                if L5_2 then
                  L5_2 = TakeOutEngine
                  L5_2()
                end
            end
            else
              L5_2 = engineOnLift
              if "new" == L5_2 then
                L5_2 = Draw3DText
                L6_2 = L3_2.x
                L7_2 = L3_2.y
                L8_2 = L3_2.z
                L9_2 = L
                L10_2 = "Press [E] to put in the new engine"
                L9_2 = L9_2(L10_2)
                L10_2 = 4
                L11_2 = 0.03
                L12_2 = 0.03
                L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                L5_2 = IsControlJustReleased
                L6_2 = 0
                L7_2 = Config
                L8_2 = L7_2.InteractionKeybind
                L7_2 = L0_1
                L7_2 = L7_2[L8_2]
                L5_2 = L5_2(L6_2, L7_2)
                if L5_2 then
                  L5_2 = PutInNewEngine
                  L5_2()
                end
              end
            end
          end
        end
      end
      ::lbl_165::
      L5_2 = currentWorkshop
      L5_2 = L5_2.location
      L6_2 = GetDistanceBetweenCoords
      L7_2 = L5_2.x
      L8_2 = L5_2.y
      L9_2 = L5_2.z
      L10_2 = L3_2
      L11_2 = true
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      if L6_2 > 50.0 then
        L7_2 = ReleaseLift
        L7_2()
        L7_2 = currentWorkshop
        L7_2 = L7_2.lift
        L8_2 = L7_2.prop
        L9_2 = SetEntityCoords
        L10_2 = engineLift
        L11_2 = L8_2.x
        L12_2 = L8_2.y
        L13_2 = L8_2.z
        L9_2(L10_2, L11_2, L12_2, L13_2)
        L9_2 = SetEntityHeading
        L10_2 = engineLift
        L11_2 = L8_2.h
        L9_2(L10_2, L11_2)
      end
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L1_1(L2_1)
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  while true do
    L0_2 = 1000
    L1_2 = holdingLift
    if L1_2 then
      L1_2 = hasEngine
      if not L1_2 then
        L1_2 = engineOnLift
        if not L1_2 then
          goto lbl_175
        end
        L1_2 = engineOnLift
        if "stock" == L1_2 then
          goto lbl_175
        end
      end
      L1_2 = swapped
      if not L1_2 then
        L0_2 = 0
        L1_2 = PlayerPedId
        L1_2 = L1_2()
        L2_2 = GetEntityCoords
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        L3_2 = GetWorldPositionOfEntityBone
        L4_2 = workshopVehicle
        L5_2 = GetEntityBoneIndexByName
        L6_2 = workshopVehicle
        L7_2 = "engine"
        L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L5_2(L6_2, L7_2)
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
        L4_2 = GetModelDimensions
        L5_2 = GetEntityModel
        L6_2 = workshopVehicle
        L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L5_2(L6_2)
        L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
        L6_2 = L5_2.x
        L7_2 = L4_2.x
        L6_2 = L6_2 - L7_2
        L7_2 = currentWorkshop
        L7_2 = L7_2.lift
        L7_2 = L7_2.rotation
        if 0 == L7_2 then
          L7_2 = vector3
          L8_2 = L3_2.x
          L9_2 = L6_2 / 2
          L9_2 = L9_2 + 0.2
          L10_2 = currentWorkshop
          L10_2 = L10_2.lift
          L10_2 = L10_2.side
          L9_2 = L9_2 * L10_2
          L8_2 = L8_2 + L9_2
          L9_2 = L3_2.y
          L10_2 = currentWorkshop
          L10_2 = L10_2.location
          L10_2 = L10_2.z
          L10_2 = L10_2 - 1.0
          L7_2 = L7_2(L8_2, L9_2, L10_2)
          liftDest = L7_2
        else
          L7_2 = vector3
          L8_2 = L3_2.x
          L9_2 = L3_2.y
          L10_2 = L6_2 / 2
          L10_2 = L10_2 + 0.2
          L11_2 = currentWorkshop
          L11_2 = L11_2.lift
          L11_2 = L11_2.side
          L10_2 = L10_2 * L11_2
          L9_2 = L9_2 + L10_2
          L10_2 = currentWorkshop
          L10_2 = L10_2.location
          L10_2 = L10_2.z
          L10_2 = L10_2 - 1.0
          L7_2 = L7_2(L8_2, L9_2, L10_2)
          liftDest = L7_2
        end
        L7_2 = GetEntityCoords
        L8_2 = engineLift
        L7_2 = L7_2(L8_2)
        L8_2 = GetEntityHeading
        L9_2 = engineLift
        L8_2 = L8_2(L9_2)
        L9_2 = GetDistanceBetweenCoords
        L10_2 = L7_2
        L11_2 = liftDest
        L9_2 = L9_2(L10_2, L11_2)
        L10_2 = 0.5
        if L9_2 < L10_2 then
          L10_2 = currentWorkshop
          L10_2 = L10_2.location
          L10_2 = L10_2.h
          L10_2 = L10_2 - 100.0
          if L8_2 > L10_2 then
            L10_2 = currentWorkshop
            L10_2 = L10_2.location
            L10_2 = L10_2.h
            L10_2 = L10_2 + 290.0
            if L8_2 < L10_2 then
              L10_2 = DrawMarker
              L11_2 = 43
              L12_2 = liftDest
              L12_2 = L12_2.x
              L13_2 = liftDest
              L13_2 = L13_2.y
              L14_2 = liftDest
              L14_2 = L14_2.z
              L14_2 = L14_2 - 0.2
              L15_2 = 0.0
              L16_2 = 0.0
              L17_2 = 0.0
              L18_2 = 0.0
              L19_2 = 0.0
              L20_2 = currentWorkshop
              L20_2 = L20_2.location
              L20_2 = L20_2.h
              L21_2 = 2.0
              L22_2 = 1.2
              L23_2 = 0.7
              L24_2 = 0
              L25_2 = 200
              L26_2 = 0
              L27_2 = 30
              L28_2 = 0
              L29_2 = 0
              L30_2 = 0
              L31_2 = 0
              L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
          end
        end
        else
          L10_2 = DrawMarker
          L11_2 = 43
          L12_2 = liftDest
          L12_2 = L12_2.x
          L13_2 = liftDest
          L13_2 = L13_2.y
          L14_2 = liftDest
          L14_2 = L14_2.z
          L14_2 = L14_2 - 0.2
          L15_2 = 0.0
          L16_2 = 0.0
          L17_2 = 0.0
          L18_2 = 0.0
          L19_2 = 0.0
          L20_2 = currentWorkshop
          L20_2 = L20_2.location
          L20_2 = L20_2.h
          L21_2 = 2.0
          L22_2 = 1.2
          L23_2 = 0.7
          L24_2 = 200
          L25_2 = 0
          L26_2 = 0
          L27_2 = 30
          L28_2 = 0
          L29_2 = 0
          L30_2 = 0
          L31_2 = 0
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
        end
      end
    end
    ::lbl_175::
    L1_2 = holdingLift
    if L1_2 then
      L0_2 = 0
      L1_2 = DisableControlAction
      L2_2 = 0
      L3_2 = 21
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = DisableControlAction
      L2_2 = 0
      L3_2 = 22
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = DisableControlAction
      L2_2 = 0
      L3_2 = 140
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = DisableControlAction
      L2_2 = 0
      L3_2 = 141
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = DisableControlAction
      L2_2 = 0
      L3_2 = 142
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = DisableControlAction
      L2_2 = 0
      L3_2 = 143
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L1_1(L2_1)
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  while true do
    L0_2 = 2000
    L1_2 = workshopVehicle
    if L1_2 then
      L0_2 = 100
      L1_2 = Config
      L1_2 = L1_2.StopSwapOnDeath
      if L1_2 then
        L1_2 = IsEntityDead
        L2_2 = PlayerPedId
        L2_2, L3_2, L4_2, L5_2 = L2_2()
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if not L1_2 then
          L1_2 = GetDistanceBetweenCoords
          L2_2 = GetEntityCoords
          L3_2 = PlayerPedId
          L3_2, L4_2, L5_2 = L3_2()
          L2_2 = L2_2(L3_2, L4_2, L5_2)
          L3_2 = currentWorkshop
          L3_2 = L3_2.location
          L3_2 = L3_2.x
          L4_2 = currentWorkshop
          L4_2 = L4_2.location
          L4_2 = L4_2.y
          L5_2 = currentWorkshop
          L5_2 = L5_2.location
          L5_2 = L5_2.z
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if not (L1_2 > 50.0) then
            goto lbl_35
          end
        end
        L1_2 = ResetSwap
        L1_2()
      end
      ::lbl_35::
      L1_2 = CheckOwnership
      L2_2 = workshopVehicle
      L1_2(L2_2)
      L1_2 = CheckOwnership
      L2_2 = engineLift
      L1_2(L2_2)
      L1_2 = CheckOwnership
      L2_2 = stockEngineObject
      L1_2(L2_2)
      L1_2 = CheckOwnership
      L2_2 = newEngineObject
      L1_2(L2_2)
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 3000
    L1_2(L2_2)
  end
end
L1_1(L2_1)
function L1_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = NetworkHasControlOfEntity
      L2_2 = A0_2
      L1_2 = L1_2(L2_2)
      if not L1_2 then
        L1_2 = NetworkRequestControlOfEntity
        L2_2 = A0_2
        L1_2(L2_2)
      end
    end
  end
end
CheckOwnership = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
    action = "grabbing_lift"
    L0_3 = PlayerPedId
    L0_3 = L0_3()
    L1_3 = PlayAnim
    L2_3 = "mp_car_bomb"
    L3_3 = "car_bomb_mechanic"
    L4_3 = 17
    L1_3(L2_3, L3_3, L4_3)
    L1_3 = Citizen
    L1_3 = L1_3.Wait
    L2_3 = 3000
    L1_3(L2_3)
    L1_3 = AttachEntityToEntity
    L2_3 = engineLift
    L3_3 = PlayerPedId
    L3_3 = L3_3()
    L4_3 = 11816
    L5_3 = 0.15
    L6_3 = 1.0
    L7_3 = -1.0
    L8_3 = 0.0
    L9_3 = 0.0
    L10_3 = 180.0
    L11_3 = 0.0
    L12_3 = false
    L13_3 = false
    L14_3 = false
    L15_3 = 2
    L16_3 = true
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
    holdingLift = true
    action = nil
    L1_3 = _ClearPedTasks
    L2_3 = PlayerPedId
    L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L2_3()
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
    L1_3 = PlayAnim
    L2_3 = "anim@heists@box_carry@"
    L3_3 = "walk"
    L4_3 = 49
    L1_3(L2_3, L3_3, L4_3)
  end
  L0_2(L1_2)
end
GrabLift = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = _ClearPedTasks
  L2_2 = L0_2
  L1_2(L2_2)
  L1_2 = DetachEntity
  L2_2 = engineLift
  L3_2 = true
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  holdingLift = false
  L1_2 = GetEntityCoords
  L2_2 = engineLift
  L1_2 = L1_2(L2_2)
  L2_2 = GetEntityHeading
  L3_2 = engineLift
  L2_2 = L2_2(L3_2)
  L3_2 = GetDistanceBetweenCoords
  L4_2 = L1_2
  L5_2 = liftDest
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 0.5
  if L3_2 < L4_2 then
    L4_2 = currentWorkshop
    L4_2 = L4_2.location
    L4_2 = L4_2.h
    L4_2 = L4_2 - 120.0
    if L2_2 > L4_2 then
      L4_2 = currentWorkshop
      L4_2 = L4_2.location
      L4_2 = L4_2.h
      L4_2 = L4_2 + 290.0
      if L2_2 < L4_2 then
        L4_2 = hasEngine
        if not L4_2 then
          L4_2 = engineOnLift
          if not L4_2 then
            goto lbl_75
          end
          L4_2 = engineOnLift
          if "stock" == L4_2 then
            goto lbl_75
          end
        end
        L4_2 = SetEntityNoCollisionEntity
        L5_2 = engineLift
        L6_2 = workshopVehicle
        L7_2 = false
        L4_2(L5_2, L6_2, L7_2)
        L4_2 = SetEntityHeading
        L5_2 = engineLift
        L6_2 = currentWorkshop
        L6_2 = L6_2.location
        L6_2 = L6_2.h
        L6_2 = L6_2 - 90.0
        L4_2(L5_2, L6_2)
        L4_2 = SetEntityCoords
        L5_2 = engineLift
        L6_2 = liftDest
        L6_2 = L6_2.x
        L7_2 = liftDest
        L7_2 = L7_2.y
        L8_2 = liftDest
        L8_2 = L8_2.z
        L9_2 = false
        L10_2 = false
        L11_2 = false
        L12_2 = false
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        liftInPosition = true
      end
    end
  end
  ::lbl_75::
end
ReleaseLift = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = TriggerServerEvent
  L1_2 = "kq_engineswaps:prepareVehicle"
  L2_2 = NetworkGetNetworkIdFromEntity
  L3_2 = parkedVehicle
  L2_2, L3_2 = L2_2(L3_2)
  L0_2(L1_2, L2_2, L3_2)
end
StartPrepareVehicle = L1_1
L1_1 = RegisterNetEvent
L2_1 = "kq_engineswaps:prepareVehicle"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "kq_engineswaps:prepareVehicle"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = PrepareVehicle
  L4_2 = L2_2
  L3_2(L4_2)
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = Citizen
  L1_2 = L1_2.CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = prepared
    if not L0_3 then
      L0_3 = action
      if "prep" ~= L0_3 then
        goto lbl_8
      end
    end
    do return end
    ::lbl_8::
    L0_3 = A0_2
    workshopVehicle = L0_3
    action = "prep"
    L0_3 = PlayerPedId
    L0_3 = L0_3()
    L1_3 = 4
    L2_3 = IsEngineInRear
    L2_3 = L2_3()
    if L2_3 then
      L1_3 = 5
    end
    L2_3 = NetworkRequestControlOfEntity
    L3_3 = workshopVehicle
    L2_3(L3_3)
    L2_3 = SetEntityAsMissionEntity
    L3_3 = workshopVehicle
    L4_3 = true
    L5_3 = true
    L2_3(L3_3, L4_3, L5_3)
    L2_3 = SetVehicleDoorOpen
    L3_3 = workshopVehicle
    L4_3 = L1_3
    L5_3 = false
    L6_3 = false
    L2_3(L3_3, L4_3, L5_3, L6_3)
    L2_3 = Citizen
    L2_3 = L2_3.Wait
    L3_3 = 500
    L2_3(L3_3)
    L2_3 = PlayAnim
    L3_3 = Config
    L3_3 = L3_3.RepairAnim
    L3_3 = L3_3.dict
    L4_3 = Config
    L4_3 = L4_3.RepairAnim
    L4_3 = L4_3.anim
    L2_3(L3_3, L4_3)
    L2_3 = Citizen
    L2_3 = L2_3.Wait
    L3_3 = Config
    L3_3 = L3_3.PrepDuration
    if not L3_3 then
      L3_3 = 10000
    end
    L2_3(L3_3)
    L2_3 = NetworkGetNetworkIdFromEntity
    L3_3 = workshopVehicle
    L2_3 = L2_3(L3_3)
    L3_3 = TriggerServerEvent
    L4_3 = "kq_engineswaps:removeDoor"
    L5_3 = L2_3
    L6_3 = L1_3
    L3_3(L4_3, L5_3, L6_3)
    L3_3 = TriggerEvent
    L4_3 = "kq_hideouts:setCanExit"
    L5_3 = false
    L3_3(L4_3, L5_3)
    L3_3 = InsertNUIEngines
    L3_3()
    L3_3 = NUISetCurrentVehicle
    L4_3 = workshopVehicle
    L3_3(L4_3)
    L3_3 = DeleteIfExists
    L4_3 = stockEngineObject
    L3_3(L4_3)
    stockEngineObject = nil
    L3_3 = CreateEngineLift
    L3_3()
    L3_3 = CreateNewEngine
    L3_3()
    L3_3 = CreateStockEngine
    L3_3()
    prepared = true
    swapped = false
    selectedEngine = nil
    holdingLift = false
    liftDest = nil
    liftInPosition = false
    hasEngine = true
    action = nil
    L3_3 = SetCanSelect
    L4_3 = true
    L3_3(L4_3)
    L3_3 = _ClearPedTasks
    L4_3 = PlayerPedId
    L4_3, L5_3, L6_3 = L4_3()
    L3_3(L4_3, L5_3, L6_3)
  end
  L1_2(L2_2)
end
PrepareVehicle = L1_1
L1_1 = RegisterNetEvent
L2_1 = "kq_engineswaps:removeDoor"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "kq_engineswaps:removeDoor"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = SetVehicleDoorBroken
  L4_2 = L2_2
  L5_2 = A1_2
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "kq_engineswaps:fixVehicle"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "kq_engineswaps:fixVehicle"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NetworkGetEntityFromNetworkId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = SetVehicleFixed
  L3_2 = L1_2
  L2_2(L3_2)
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = engineLift
  if nil ~= L0_2 then
    L0_2 = DeleteObject
    L1_2 = engineLift
    L0_2(L1_2)
    engineLift = nil
  end
  L0_2 = currentWorkshop
  L0_2 = L0_2.lift
  L1_2 = L0_2.prop
  L2_2 = GetHashKey
  L3_2 = L1_2.model
  L2_2 = L2_2(L3_2)
  L3_2 = RequestModel
  L4_2 = L2_2
  L3_2(L4_2)
  while true do
    L3_2 = HasModelLoaded
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      break
    end
    L3_2 = Citizen
    L3_2 = L3_2.Wait
    L4_2 = 10
    L3_2(L4_2)
  end
  L3_2 = L0_2.clearArea
  if L3_2 then
    L3_2 = _ClearAreaOfObjects
    L4_2 = L1_2.x
    L5_2 = L1_2.y
    L6_2 = L1_2.z
    L7_2 = L0_2.clearRadius
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
  L3_2 = CreateObject
  L4_2 = L2_2
  L5_2 = L1_2.x
  L6_2 = L1_2.y
  L7_2 = L1_2.z
  L8_2 = true
  L9_2 = true
  L10_2 = 1
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  engineLift = L3_2
  L3_2 = SetObjectPrivate
  L4_2 = engineLift
  L3_2(L4_2)
  L3_2 = SetEntityDynamic
  L4_2 = engineLift
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityHeading
  L4_2 = engineLift
  L5_2 = L1_2.h
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityAsMissionEntity
  L4_2 = engineLift
  L5_2 = true
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
end
CreateEngineLift = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = currentWorkshop
  L0_2 = L0_2.engineDropoff
  L1_2 = L0_2.clearArea
  if L1_2 then
    L1_2 = _ClearAreaOfObjects
    L2_2 = L0_2.x
    L3_2 = L0_2.y
    L4_2 = L0_2.z
    L5_2 = L0_2.clearRadius
    L1_2(L2_2, L3_2, L4_2, L5_2)
  end
end
ClearOldEngine = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = GetHashKey
  L1_2 = "prop_car_engine_01"
  L0_2 = L0_2(L1_2)
  L1_2 = RequestModel
  L2_2 = L0_2
  L1_2(L2_2)
  while true do
    L1_2 = HasModelLoaded
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = 10
    L1_2(L2_2)
  end
  L1_2 = GetWorldPositionOfEntityBone
  L2_2 = parkedVehicle
  L3_2 = GetEntityBoneIndexByName
  L4_2 = parkedVehicle
  L5_2 = "engine"
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2(L4_2, L5_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L2_2 = CreateObject
  L3_2 = L0_2
  L4_2 = L1_2.x
  L5_2 = L1_2.y
  L6_2 = L1_2.z
  L6_2 = L6_2 - 10.0
  L7_2 = true
  L8_2 = true
  L9_2 = 1
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  stockEngineObject = L2_2
  L2_2 = SetObjectPrivate
  L3_2 = stockEngineObject
  L2_2(L3_2)
  L2_2 = FreezeEntityPosition
  L3_2 = stockEngineObject
  L4_2 = true
  L2_2(L3_2, L4_2)
end
CreateStockEngine = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = newEngineObject
  if nil ~= L0_2 then
    L0_2 = DeleteObject
    L1_2 = newEngineObject
    L0_2(L1_2)
    newEngineObject = nil
  end
  L0_2 = currentWorkshop
  L0_2 = L0_2.newEngine
  L1_2 = GetHashKey
  L2_2 = "prop_car_engine_01"
  L1_2 = L1_2(L2_2)
  L2_2 = RequestModel
  L3_2 = L1_2
  L2_2(L3_2)
  while true do
    L2_2 = HasModelLoaded
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = Citizen
    L2_2 = L2_2.Wait
    L3_2 = 10
    L2_2(L3_2)
  end
  L2_2 = L0_2.clearArea
  if L2_2 then
    L2_2 = _ClearAreaOfObjects
    L3_2 = L0_2.x
    L4_2 = L0_2.y
    L5_2 = L0_2.z
    L6_2 = L0_2.clearRadius
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = CreateObject
  L3_2 = L1_2
  L4_2 = L0_2.x
  L5_2 = L0_2.y
  L6_2 = L0_2.z
  L7_2 = true
  L8_2 = true
  L9_2 = 1
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  newEngineObject = L2_2
  L2_2 = SetObjectPrivate
  L3_2 = newEngineObject
  L2_2(L3_2)
  L2_2 = SetEntityDynamic
  L3_2 = newEngineObject
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SetEntityHeading
  L3_2 = newEngineObject
  L4_2 = L0_2.h
  L2_2(L3_2, L4_2)
  L2_2 = SetEntityAsMissionEntity
  L3_2 = newEngineObject
  L4_2 = true
  L5_2 = true
  L2_2(L3_2, L4_2, L5_2)
end
CreateNewEngine = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = TriggerEvent
    L1_3 = "kq_hideouts:setCanExit"
    L2_3 = true
    L0_3(L1_3, L2_3)
    action = "ending"
    L0_3 = PlayerPedId
    L0_3 = L0_3()
    L1_3 = workshopVehicle
    L2_3 = PlayAnim
    L3_3 = Config
    L3_3 = L3_3.RepairAnim
    L3_3 = L3_3.dict
    L4_3 = Config
    L4_3 = L4_3.RepairAnim
    L4_3 = L4_3.anim
    L2_3(L3_3, L4_3)
    L2_3 = Citizen
    L2_3 = L2_3.Wait
    L3_3 = Config
    L3_3 = L3_3.PrepDuration
    L3_3 = L3_3 / 2
    L2_3(L3_3)
    L2_3 = _ClearPedTasks
    L3_3 = PlayerPedId
    L3_3, L4_3 = L3_3()
    L2_3(L3_3, L4_3)
    L2_3 = Citizen
    L2_3 = L2_3.Wait
    L3_3 = 250
    L2_3(L3_3)
    L2_3 = ResetSwap
    L2_3()
  end
  L0_2(L1_2)
end
EndSwap = L1_1
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = workshopVehicle
  L1_2 = NetworkGetNetworkIdFromEntity
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = 4
  L3_2 = IsEngineInRear
  L3_2 = L3_2()
  if L3_2 then
    L2_2 = 5
  end
  L3_2 = TriggerServerEvent
  L4_2 = "kq_engineswaps:endSwap"
  L5_2 = L1_2
  L3_2(L4_2, L5_2)
  L3_2 = TriggerServerEvent
  L4_2 = "kq_engineswaps:fixVehicle"
  L5_2 = L1_2
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = hasEngine
  if not L3_2 then
    L3_2 = ForceVehicleEngineAudio
    L4_2 = workshopVehicle
    L5_2 = GetEntityModel
    L6_2 = workshopVehicle
    L5_2, L6_2 = L5_2(L6_2)
    L3_2(L4_2, L5_2, L6_2)
  end
  workshopVehicle = nil
  prepared = false
  L3_2 = FreezeEntityPosition
  L4_2 = L0_2
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = DeleteIfExists
  L4_2 = engineLift
  L3_2(L4_2)
  engineLift = nil
  L3_2 = DeleteIfExists
  L4_2 = newEngineObject
  L3_2(L4_2)
  newEngineObject = nil
  L3_2 = DeleteIfExists
  L4_2 = stockEngineObject
  L3_2(L4_2)
  stockEngineObject = nil
  action = nil
  L3_2 = InsertNUIEngines
  L3_2()
  L3_2 = SetCanSelect
  L4_2 = false
  L3_2(L4_2)
end
ResetSwap = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = workshopVehicle
  if L0_2 then
    L0_2 = liftInPosition
    if L0_2 then
      L0_2 = Citizen
      L0_2 = L0_2.CreateThread
      function L1_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
        L0_3 = PlayerPedId
        L0_3 = L0_3()
        action = "taking_out"
        L1_3 = PlayAnim
        L2_3 = "mp_car_bomb"
        L3_3 = "car_bomb_mechanic"
        L4_3 = 17
        L1_3(L2_3, L3_3, L4_3)
        L1_3 = Citizen
        L1_3 = L1_3.Wait
        L2_3 = Config
        L2_3 = L2_3.TakeOutDuration
        if not L2_3 then
          L2_3 = 5000
        end
        L1_3(L2_3)
        hasEngine = false
        L1_3 = GetWorldPositionOfEntityBone
        L2_3 = parkedVehicle
        L3_3 = GetEntityBoneIndexByName
        L4_3 = parkedVehicle
        L5_3 = "engine"
        L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L3_3(L4_3, L5_3)
        L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
        while true do
          L2_3 = IsEntityDead
          L3_3 = PlayerPedId
          L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L3_3()
          L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
          if not L2_3 then
            break
          end
          L2_3 = Config
          L2_3 = L2_3.StopSwapOnDeath
          if not L2_3 then
            break
          end
          L2_3 = Citizen
          L2_3 = L2_3.Wait
          L3_3 = 500
          L2_3(L3_3)
        end
        L2_3 = SetEntityCoords
        L3_3 = stockEngineObject
        L4_3 = L1_3.x
        L5_3 = L1_3.y
        L6_3 = L1_3.z
        L6_3 = L6_3 - 0.1
        L7_3 = false
        L8_3 = false
        L9_3 = false
        L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
        L2_3 = FreezeEntityPosition
        L3_3 = stockEngineObject
        L4_3 = false
        L2_3(L3_3, L4_3)
        L2_3 = SetEntityCollision
        L3_3 = stockEngineObject
        L4_3 = false
        L5_3 = true
        L2_3(L3_3, L4_3, L5_3)
        L2_3 = SetEntityHeading
        L3_3 = stockEngineObject
        L4_3 = GetEntityHeading
        L5_3 = engineLift
        L4_3 = L4_3(L5_3)
        L4_3 = L4_3 + 90.0
        L2_3(L3_3, L4_3)
        L2_3 = SetEntityDynamic
        L3_3 = stockEngineObject
        L4_3 = true
        L2_3(L3_3, L4_3)
        L2_3 = SetEntityAsMissionEntity
        L3_3 = stockEngineObject
        L4_3 = true
        L5_3 = true
        L2_3(L3_3, L4_3, L5_3)
        L2_3 = SetEntityHasGravity
        L3_3 = stockEngineObject
        L4_3 = false
        L2_3(L3_3, L4_3)
        L2_3 = SetEntityVelocity
        L3_3 = stockEngineObject
        L4_3 = 0.0
        L5_3 = 0.0
        L6_3 = 0.5
        L2_3(L3_3, L4_3, L5_3, L6_3)
        while true do
          L2_3 = IsEntityDead
          L3_3 = PlayerPedId
          L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L3_3()
          L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
          if not L2_3 then
            break
          end
          L2_3 = Config
          L2_3 = L2_3.StopSwapOnDeath
          if not L2_3 then
            break
          end
          L2_3 = Citizen
          L2_3 = L2_3.Wait
          L3_3 = 500
          L2_3(L3_3)
        end
        L2_3 = Citizen
        L2_3 = L2_3.Wait
        L3_3 = 700
        L2_3(L3_3)
        L2_3 = SetEntityVelocity
        L3_3 = stockEngineObject
        L4_3 = 0.0
        L5_3 = 0.0
        L6_3 = 0.0
        L2_3(L3_3, L4_3, L5_3, L6_3)
        L2_3 = AttachEntityToEntity
        L3_3 = stockEngineObject
        L4_3 = engineLift
        L5_3 = 0
        L6_3 = 0.2
        L7_3 = -1.3
        L8_3 = 1.4
        L9_3 = 0.0
        L10_3 = 0.0
        L11_3 = 90.0
        L12_3 = 0.0
        L13_3 = false
        L14_3 = false
        L15_3 = false
        L16_3 = 0
        L17_3 = true
        L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
        liftInPosition = false
        engineOnLift = "stock"
        action = nil
        L2_3 = ForceVehicleEngineAudio
        L3_3 = workshopVehicle
        L4_3 = Config
        L4_3 = L4_3.NoEngine
        L4_3 = L4_3.sound
        L2_3(L3_3, L4_3)
        L2_3 = SetCanSelect
        L3_3 = false
        L2_3(L3_3)
        L2_3 = _ClearPedTasks
        L3_3 = PlayerPedId
        L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L3_3()
        L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
      end
      L0_2(L1_2)
    end
  end
end
TakeOutEngine = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = selectedEngine
  if L0_2 then
    L0_2 = workshopVehicle
    if L0_2 then
      L0_2 = engineOnLift
      if "new" == L0_2 then
        L0_2 = CanUseWorkshop
        L1_2 = currentWorkshop
        L0_2 = L0_2(L1_2)
        if L0_2 then
          L0_2 = Citizen
          L0_2 = L0_2.CreateThread
          function L1_2()
            local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
            L0_3 = PlayerPedId
            L0_3 = L0_3()
            action = "putting_in_engine"
            L1_3 = PlayAnim
            L2_3 = "mp_car_bomb"
            L3_3 = "car_bomb_mechanic"
            L4_3 = 17
            L1_3(L2_3, L3_3, L4_3)
            L1_3 = Citizen
            L1_3 = L1_3.Wait
            L2_3 = Config
            L2_3 = L2_3.PutInDuration
            if not L2_3 then
              L2_3 = 6000
            end
            L1_3(L2_3)
            L1_3 = GetVehicleNumberPlateText
            L2_3 = workshopVehicle
            L1_3 = L1_3(L2_3)
            L2_3 = TriggerServerEvent
            L3_3 = "kq_engineswaps:setVehicleEngine"
            L4_3 = L1_3
            L5_3 = selectedEngine
            L6_3 = currentWorkshopKey
            L2_3(L3_3, L4_3, L5_3, L6_3)
            hasEngine = true
            L2_3 = DetachEntity
            L3_3 = newEngineObject
            L4_3 = true
            L5_3 = false
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = SetEntityDynamic
            L3_3 = newEngineObject
            L4_3 = true
            L2_3(L3_3, L4_3)
            L2_3 = SetEntityCollision
            L3_3 = newEngineObject
            L4_3 = true
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = SetEntityAsMissionEntity
            L3_3 = newEngineObject
            L4_3 = true
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = SetEntityHasGravity
            L3_3 = newEngineObject
            L4_3 = false
            L2_3(L3_3, L4_3)
            L2_3 = SetEntityVelocity
            L3_3 = newEngineObject
            L4_3 = 0.0
            L5_3 = 0.0
            L6_3 = -0.4
            L2_3(L3_3, L4_3, L5_3, L6_3)
            L2_3 = SetEntityCollision
            L3_3 = newEngineObject
            L4_3 = false
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = Citizen
            L2_3 = L2_3.Wait
            L3_3 = 3000
            L2_3(L3_3)
            L2_3 = DeleteObject
            L3_3 = newEngineObject
            L2_3(L3_3)
            newEngineObject = nil
            engineOnLift = nil
            liftInPosition = false
            action = nil
            swapped = true
            L2_3 = _ClearPedTasks
            L3_3 = PlayerPedId
            L3_3, L4_3, L5_3, L6_3 = L3_3()
            L2_3(L3_3, L4_3, L5_3, L6_3)
            L2_3 = currentWorkshop
            L2_3 = L2_3.storageName
            L3_3 = currentWorkshop
            L3_3 = L3_3.playerWorkshop
            if L3_3 then
              L2_3 = "player"
            end
            L3_3 = stocks
            L3_3[L2_3] = nil
          end
          L0_2(L1_2)
        end
      end
    end
  end
end
PutInNewEngine = L1_1
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  while true do
    L0_2 = 1000
    L1_2 = stockEngineObject
    if L1_2 then
      L1_2 = engineOnLift
      if "stock" == L1_2 then
        L1_2 = PlayerPedId
        L1_2 = L1_2()
        L2_2 = GetEntityCoords
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        L3_2 = GetEntityCoords
        L4_2 = stockEngineObject
        L3_2 = L3_2(L4_2)
        L4_2 = GetDistanceBetweenCoords
        L5_2 = L3_2
        L6_2 = L1_2
        L4_2 = L4_2(L5_2, L6_2)
        L5_2 = currentWorkshop
        L5_2 = L5_2.engineDropoff
        L6_2 = false
        L7_2 = GetDistanceBetweenCoords
        L8_2 = L5_2.x
        L9_2 = L5_2.y
        L10_2 = L5_2.z
        L10_2 = L10_2 - 1.0
        L11_2 = L3_2
        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
        if L7_2 < 1.0 then
          L8_2 = action
          if "taking_off_engine" ~= L8_2 then
            L0_2 = 0
            L8_2 = atDropoff
            if not L8_2 then
              atDropoff = true
            end
            L6_2 = true
            L8_2 = DrawMarker
            L9_2 = 43
            L10_2 = L5_2.x
            L11_2 = L5_2.y
            L12_2 = L5_2.z
            L12_2 = L12_2 - 1.0
            L13_2 = 0.0
            L14_2 = 0.0
            L15_2 = 0.0
            L16_2 = 0.0
            L17_2 = 0.0
            L18_2 = L5_2.h
            L19_2 = 1.5
            L20_2 = 2.5
            L21_2 = 0.5
            L22_2 = 0
            L23_2 = 180
            L24_2 = 40
            L25_2 = 30
            L26_2 = 0
            L27_2 = 0
            L28_2 = 0
            L29_2 = 0
            L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
            L8_2 = holdingLift
            if not L8_2 then
              L8_2 = Draw3DText
              L9_2 = L3_2.x
              L10_2 = L3_2.y
              L11_2 = L3_2.z
              L12_2 = L
              L13_2 = "Press [E] to put down the engine"
              L12_2 = L12_2(L13_2)
              L13_2 = 4
              L14_2 = 0.03
              L15_2 = 0.03
              L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
              L8_2 = IsControlJustReleased
              L9_2 = 0
              L10_2 = Config
              L11_2 = L10_2.InteractionKeybind
              L10_2 = L0_1
              L10_2 = L10_2[L11_2]
              L8_2 = L8_2(L9_2, L10_2)
              if L8_2 then
                action = "taking_off_engine"
                L8_2 = PlayAnim
                L9_2 = "mp_car_bomb"
                L10_2 = "car_bomb_mechanic"
                L11_2 = 17
                L8_2(L9_2, L10_2, L11_2)
                L8_2 = Citizen
                L8_2 = L8_2.Wait
                L9_2 = Config
                L9_2 = L9_2.EngineDropDuration
                if not L9_2 then
                  L9_2 = 3000
                end
                L8_2(L9_2)
                L8_2 = _ClearPedTasks
                L9_2 = PlayerPedId
                L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L9_2()
                L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
                L8_2 = SetEntityHasGravity
                L9_2 = stockEngineObject
                L10_2 = true
                L8_2(L9_2, L10_2)
                L8_2 = DetachEntity
                L9_2 = stockEngineObject
                L10_2 = true
                L11_2 = false
                L8_2(L9_2, L10_2, L11_2)
                L8_2 = SetEntityDynamic
                L9_2 = stockEngineObject
                L10_2 = true
                L8_2(L9_2, L10_2)
                L8_2 = SetEntityCollision
                L9_2 = stockEngineObject
                L10_2 = true
                L11_2 = true
                L8_2(L9_2, L10_2, L11_2)
                L8_2 = ApplyForceToEntity
                L9_2 = stockEngineObject
                L10_2 = 0
                L11_2 = 0.0
                L12_2 = 0.0
                L13_2 = -1.0
                L14_2 = 0.0
                L15_2 = 0.0
                L16_2 = 0.0
                L17_2 = 0
                L18_2 = false
                L19_2 = true
                L20_2 = true
                L21_2 = false
                L22_2 = true
                L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                engineOnLift = nil
                action = nil
                atDropoff = false
              end
            end
        end
        else
          L8_2 = atDropoff
          if L8_2 then
            atDropoff = false
          end
        end
        L8_2 = holdingLift
        if L8_2 and not L6_2 then
          L0_2 = 0
          L8_2 = DrawMarker
          L9_2 = 43
          L10_2 = L5_2.x
          L11_2 = L5_2.y
          L12_2 = L5_2.z
          L12_2 = L12_2 - 1.0
          L13_2 = 0.0
          L14_2 = 0.0
          L15_2 = 0.0
          L16_2 = 0.0
          L17_2 = 0.0
          L18_2 = L5_2.h
          L19_2 = 1.5
          L20_2 = 2.5
          L21_2 = 0.5
          L22_2 = 200
          L23_2 = 0
          L24_2 = 0
          L25_2 = 30
          L26_2 = 0
          L27_2 = 0
          L28_2 = 0
          L29_2 = 0
          L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
        end
      end
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L1_1(L2_1)
function L1_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
    L0_3 = PlayerPedId
    L0_3 = L0_3()
    action = "attach_new"
    L1_3 = PlayAnim
    L2_3 = "mp_car_bomb"
    L3_3 = "car_bomb_mechanic"
    L4_3 = 17
    L1_3(L2_3, L3_3, L4_3)
    L1_3 = Citizen
    L1_3 = L1_3.Wait
    L2_3 = Config
    L2_3 = L2_3.EnginePickupDuration
    if not L2_3 then
      L2_3 = 5000
    end
    L1_3(L2_3)
    L1_3 = SetEntityDynamic
    L2_3 = newEngineObject
    L3_3 = false
    L1_3(L2_3, L3_3)
    L1_3 = SetEntityCollision
    L2_3 = newEngineObject
    L3_3 = false
    L4_3 = false
    L1_3(L2_3, L3_3, L4_3)
    L1_3 = AttachEntityToEntity
    L2_3 = newEngineObject
    L3_3 = engineLift
    L4_3 = 0
    L5_3 = 0.2
    L6_3 = -1.3
    L7_3 = 1.4
    L8_3 = 0.0
    L9_3 = 0.0
    L10_3 = 90.0
    L11_3 = 0.0
    L12_3 = false
    L13_3 = false
    L14_3 = false
    L15_3 = 0
    L16_3 = true
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
    engineOnLift = "new"
    action = nil
    atPickup = false
    L1_3 = _ClearPedTasks
    L2_3 = PlayerPedId
    L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L2_3()
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
  end
  L0_2(L1_2)
end
AttachNewEngine = L1_1
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  while true do
    L0_2 = 1000
    L1_2 = currentWorkshop
    if L1_2 then
      L1_2 = workshopVehicle
      if L1_2 then
        L1_2 = engineLift
        if L1_2 then
          L1_2 = hasEngine
          if not L1_2 then
            L1_2 = engineOnLift
            if not L1_2 then
              L0_2 = 0
              L1_2 = PlayerPedId
              L1_2 = L1_2()
              L2_2 = GetEntityCoords
              L3_2 = L1_2
              L2_2 = L2_2(L3_2)
              L3_2 = GetEntityCoords
              L4_2 = newEngineObject
              L3_2 = L3_2(L4_2)
              L4_2 = GetEntityCoords
              L5_2 = engineLift
              L4_2 = L4_2(L5_2)
              L5_2 = GetDistanceBetweenCoords
              L6_2 = L4_2.x
              L7_2 = L4_2.y
              L8_2 = L4_2.z
              L9_2 = L3_2.x
              L10_2 = L3_2.y
              L11_2 = L3_2.z
              L12_2 = true
              L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
              L6_2 = 1.5
              if L5_2 < L6_2 then
                L6_2 = atPickup
                if not L6_2 then
                  atPickup = true
                end
                L6_2 = holdingLift
                if L6_2 then
                  L6_2 = DrawMarker
                  L7_2 = 0
                  L8_2 = L3_2.x
                  L9_2 = L3_2.y
                  L10_2 = L3_2.z
                  L10_2 = L10_2 + 1.6
                  L11_2 = 0.0
                  L12_2 = 0.0
                  L13_2 = 0.0
                  L14_2 = 0.0
                  L15_2 = 0.0
                  L16_2 = 0.0
                  L17_2 = 0.75
                  L18_2 = 0.75
                  L19_2 = 0.75
                  L20_2 = 0
                  L21_2 = 200
                  L22_2 = 0
                  L23_2 = 30
                  L24_2 = 0
                  L25_2 = 0
                  L26_2 = 0
                  L27_2 = 0
                  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
                else
                  L6_2 = GetDistanceBetweenCoords
                  L7_2 = L2_2
                  L8_2 = L3_2
                  L6_2 = L6_2(L7_2, L8_2)
                  L7_2 = 1.5
                  if L6_2 < L7_2 then
                    L7_2 = action
                    if not L7_2 then
                      L7_2 = Draw3DText
                      L8_2 = L3_2.x
                      L9_2 = L3_2.y
                      L10_2 = L3_2.z
                      L10_2 = L10_2 + 0.3
                      L11_2 = L
                      L12_2 = "Press [E] to put the engine on the lift"
                      L11_2 = L11_2(L12_2)
                      L12_2 = 4
                      L13_2 = 0.03
                      L14_2 = 0.03
                      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
                      L7_2 = IsControlJustReleased
                      L8_2 = 0
                      L9_2 = Config
                      L10_2 = L9_2.InteractionKeybind
                      L9_2 = L0_1
                      L9_2 = L9_2[L10_2]
                      L7_2 = L7_2(L8_2, L9_2)
                      if L7_2 then
                        L7_2 = AttachNewEngine
                        L7_2()
                      end
                    end
                  end
                end
              else
                L6_2 = atPickup
                if L6_2 then
                  atPickup = false
                end
                L6_2 = holdingLift
                if L6_2 then
                  L6_2 = DrawMarker
                  L7_2 = 0
                  L8_2 = L3_2.x
                  L9_2 = L3_2.y
                  L10_2 = L3_2.z
                  L10_2 = L10_2 + 1.6
                  L11_2 = 0.0
                  L12_2 = 0.0
                  L13_2 = 0.0
                  L14_2 = 0.0
                  L15_2 = 0.0
                  L16_2 = 0.0
                  L17_2 = 0.75
                  L18_2 = 0.75
                  L19_2 = 0.75
                  L20_2 = 200
                  L21_2 = 0
                  L22_2 = 0
                  L23_2 = 30
                  L24_2 = 0
                  L25_2 = 0
                  L26_2 = 0
                  L27_2 = 0
                  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
                end
              end
            end
          end
        end
      end
    end
    L1_2 = Citizen
    L1_2 = L1_2.Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L1_1(L2_1)
L1_1 = Config
L1_1 = L1_1.Debug
if L1_1 then
  L1_1 = RegisterCommand
  L2_1 = "tune"
  function L3_1(A0_2, A1_2)
    local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
    L2_2 = GetVehiclePedIsIn
    L3_2 = PlayerPedId
    L3_2 = L3_2()
    L4_2 = false
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = TriggerServerEvent
    L4_2 = "kq_engineswaps:setVehicleEngine"
    L5_2 = GetVehicleNumberPlateText
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    L6_2 = A1_2[1]
    L7_2 = currentWorkshopKey
    L3_2(L4_2, L5_2, L6_2, L7_2)
    workshopVehicle = L2_2
  end
  L1_1(L2_1, L3_1)
end
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = DoesEntityExist
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = ClearPedTasks
    L2_2 = A0_2
    L1_2(L2_2)
  end
end
_ClearPedTasks = L1_1
L1_1 = AddEventHandler
L2_1 = "onResourceStop"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 ~= A0_2 then
    return
  end
  L1_2 = DeleteIfExists
  L2_2 = engineLift
  L1_2(L2_2)
  L1_2 = DeleteIfExists
  L2_2 = newEngineObject
  L1_2(L2_2)
  L1_2 = DeleteIfExists
  L2_2 = crateObject
  L1_2(L2_2)
  L1_2 = pairs
  L2_2 = laptopObjects
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = DeleteIfExists
    L8_2 = L6_2
    L7_2(L8_2)
  end
  L1_2 = DeleteIfExists
  L2_2 = stockEngineObject
  L1_2(L2_2)
  L1_2 = DeleteIfExists
  L2_2 = crateObject
  L1_2(L2_2)
end
L1_1(L2_1, L3_1)
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = Citizen
  L1_2 = L1_2.CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = Config
    L0_3 = L0_3.DontChangeObjectOwnership
    if L0_3 then
      L0_3 = Citizen
      L0_3 = L0_3.Wait
      L1_3 = 1000
      L0_3(L1_3)
      L0_3 = ObjToNet
      L1_3 = A0_2
      L0_3 = L0_3(L1_3)
      L1_3 = SetNetworkIdExistsOnAllMachines
      L2_3 = L0_3
      L3_3 = true
      L1_3(L2_3, L3_3)
      L1_3 = NetworkUseHighPrecisionBlending
      L2_3 = L0_3
      L3_3 = true
      L1_3(L2_3, L3_3)
      L1_3 = SetNetworkIdCanMigrate
      L2_3 = L0_3
      L3_3 = false
      L1_3(L2_3, L3_3)
    end
  end
  L1_2(L2_2)
end
SetObjectPrivate = L1_1
