local L0_1, L1_1, L2_1, L3_1
OBJECTS_PHOTOS_TOOL_WEBHOOK = nil
MARKETPLACE_PHOTOS_WEBHOOK = nil
waitingForLoadAfterRestart = true
L0_1 = {}
AlarmBlips = L0_1
L0_1 = {}
Blips = L0_1
L0_1 = {}
TargetPoints = L0_1
L0_1 = {}
Properties = L0_1
L0_1 = {}
Furniture = L0_1
CurrentShell = nil
CurrentIPL = nil
CurrentProperty = nil
CurrentPropertyData = nil
SelectedApartment = nil
openedMenu = nil
L0_1 = {}
PlayerData = L0_1
Identifier = nil
CharacterName = ""
L0_1 = Config
L0_1 = L0_1.Core
if "ESX" == L0_1 then
  L0_1 = Config
  L0_1 = L0_1.CoreExport
  L0_1 = L0_1()
  ESX = L0_1
else
  L0_1 = Config
  L0_1 = L0_1.Core
  if "QB-Core" == L0_1 then
    L0_1 = Config
    L0_1 = L0_1.CoreExport
    L0_1 = L0_1()
    QBCore = L0_1
  end
end
function L0_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = Citizen
  L2_2 = L2_2.CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = A1_2
    PlayerData = L0_3
    L0_3 = CL
    L0_3 = L0_3.GetPlayerIdentifier
    L0_3 = L0_3()
    Identifier = L0_3
    L0_3 = CL
    L0_3 = L0_3.GetPlayerCharacterName
    L0_3 = L0_3()
    CharacterName = L0_3
    L0_3 = SpawnInLastProperty
    L0_3()
    L0_3 = TriggerEvent
    L1_3 = "vms_housing:init"
    L0_3(L1_3)
    L0_3 = Citizen
    L0_3 = L0_3.Wait
    L1_3 = A0_2
    if L1_3 then
      L1_3 = 5000
      if L1_3 then
        goto lbl_25
      end
    end
    L1_3 = 0
    ::lbl_25::
    L0_3(L1_3)
    L0_3 = SendNUIMessage
    L1_3 = {}
    L1_3.action = "loaded2"
    L2_3 = CharacterName
    L1_3.characterName = L2_3
    L0_3(L1_3)
    L0_3 = TriggerServerEvent
    L1_3 = "vms_housing:sv:fetchData"
    L0_3(L1_3)
  end
  L2_2(L3_2)
end
L1_1 = RegisterNetEvent
L2_1 = "vms_housing:notification"
L3_1 = CL
L3_1 = L3_1.Notification
L1_1(L2_1, L3_1)
L1_1 = AddEventHandler
L2_1 = "onResourceStart"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = Config
  L1_2 = L1_2.Core
  if "ESX" == L1_2 then
    while true do
      L1_2 = ESX
      if L1_2 then
        break
      end
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 200
      L1_2(L2_2)
    end
  else
    while true do
      L1_2 = QBCore
      if L1_2 then
        break
      end
      L1_2 = Citizen
      L1_2 = L1_2.Wait
      L2_2 = 200
      L1_2(L2_2)
    end
  end
  L1_2 = CL
  L1_2 = L1_2.IsPlayerLoaded
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = L0_1
    L2_2 = true
    L3_2 = CL
    L3_2 = L3_2.GetPlayerData
    L3_2 = L3_2()
    L1_2(L2_2, L3_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = AddEventHandler
L2_1 = "onResourceStop"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 == L1_2 then
    L1_2 = CurrentProperty
    if L1_2 then
      L1_2 = TriggerServerEvent
      L2_2 = "vms_housing:sv:exitHouse"
      L3_2 = CurrentProperty
      L1_2(L2_2, L3_2)
      L1_2 = ToggleWeather
      if L1_2 then
        L1_2 = ToggleWeather
        L2_2 = false
        L1_2(L2_2)
      end
      L1_2 = CurrentShell
      if L1_2 then
        L1_2 = DeleteObject
        L2_2 = CurrentShell
        L1_2(L2_2)
      end
    end
    L1_2 = Property
    L2_2 = L1_2
    L1_2 = L1_2.RemoveFurniture
    L1_2(L2_2)
    L1_2 = Config
    L1_2 = L1_2.Marketplace
    L1_2 = L1_2.__ped
    if L1_2 then
      L1_2 = DeleteEntity
      L2_2 = Config
      L2_2 = L2_2.Marketplace
      L2_2 = L2_2.__ped
      L1_2(L2_2)
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = Config
L2_1 = L2_1.PlayerLoaded
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L0_1
  L2_2 = false
  L3_2 = Config
  L3_2 = L3_2.Core
  L3_2 = A0_2 or L3_2
  if "ESX" ~= L3_2 or not A0_2 then
    L3_2 = CL
    L3_2 = L3_2.GetPlayerData
    L3_2 = L3_2()
  end
  L1_2(L2_2, L3_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = Config
L2_1 = L2_1.PlayerSetJob
function L3_1(A0_2)
  local L1_2
  L1_2 = PlayerData
  L1_2.job = A0_2
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "vms_housing:cl:loadProperties"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = json
  L1_2 = L1_2.decode
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  Properties = L1_2
  L1_2 = CurrentProperty
  if L1_2 then
    L1_2 = Properties
    L2_2 = tostring
    L3_2 = CurrentProperty
    L2_2 = L2_2(L3_2)
    L1_2 = L1_2[L2_2]
    CurrentPropertyData = L1_2
  end
  L1_2 = pairs
  L2_2 = Properties
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.type
    if "mlo" == L7_2 then
      L7_2 = L6_2.metadata
      if L7_2 then
        L7_2 = L6_2.metadata
        L7_2 = L7_2.doors
        if L7_2 then
          L7_2 = Property
          L8_2 = L7_2
          L7_2 = L7_2.RegisterDoors
          L9_2 = {}
          L9_2.propertyId = L5_2
          L10_2 = L6_2.owner
          L10_2 = L6_2.renter
          L10_2 = not L10_2 and L10_2
          L9_2.forceLock = L10_2
          L10_2 = L6_2.metadata
          L10_2 = L10_2.doors
          L9_2.doors = L10_2
          L7_2(L8_2, L9_2)
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "vms_housing:cl:loadFurniture"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = json
  L1_2 = L1_2.decode
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  Furniture = L1_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "Property"
  L2_2.actionName = "ReloadAvailableFurniture"
  L3_2 = Furniture
  L2_2.data = L3_2
  L1_2(L2_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "vms_housing:cl:fetchedData"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  waitingForLoadAfterRestart = false
  OBJECTS_PHOTOS_TOOL_WEBHOOK = A0_2
  MARKETPLACE_PHOTOS_WEBHOOK = A1_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "LoadWebhook"
  L4_2 = OBJECTS_PHOTOS_TOOL_WEBHOOK
  L3_2.webhook = L4_2
  L2_2(L3_2)
  L2_2 = Config
  L2_2 = L2_2.Debug
  if L2_2 then
    L2_2 = Citizen
    L2_2 = L2_2.CreateThread
    function L3_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
      L0_3 = 0
      L1_3 = pairs
      L2_3 = Properties
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        L0_3 = L0_3 + 1
      end
      L1_3 = library
      L1_3 = L1_3.Debug
      L2_3 = "^4[Loaded]^7 Loaded %s Properties!"
      L3_3 = L2_3
      L2_3 = L2_3.format
      L4_3 = L0_3
      L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3 = L2_3(L3_3, L4_3)
      L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
      L1_3 = 0
      L2_3 = pairs
      L3_3 = Furniture
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L1_3 = L1_3 + 1
      end
      L2_3 = library
      L2_3 = L2_3.Debug
      L3_3 = "^4[Loaded]^7 Loaded %s Furniture!"
      L4_3 = L3_3
      L3_3 = L3_3.format
      L5_3 = L1_3
      L3_3, L4_3, L5_3, L6_3, L7_3, L8_3 = L3_3(L4_3, L5_3)
      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
    end
    L2_2(L3_2)
  end
  L2_2 = RefreshBlips
  L2_2()
end
L1_1(L2_1, L3_1)
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = Config
  L0_2 = L0_2.Marketplace
  L1_2 = L0_2.Enabled
  if L1_2 then
    L1_2 = L0_2.Ped
    if L1_2 then
      L1_2 = L0_2.Ped
      L1_2 = L1_2.Model
      if L1_2 then
        L1_2 = L0_2.Ped
        L1_2 = L1_2.Coords
        if L1_2 then
          L1_2 = library
          L1_2 = L1_2.SpawnPed
          L2_2 = {}
          L3_2 = L0_2.Ped
          L3_2 = L3_2.Model
          L2_2.model = L3_2
          L3_2 = L0_2.Ped
          L3_2 = L3_2.Coords
          L2_2.coords = L3_2
          L3_2 = L0_2.Ped
          L3_2 = L3_2.Animation
          L2_2.animation = L3_2
          L1_2 = L1_2(L2_2)
          L0_2.__ped = L1_2
        end
      end
    end
    L1_2 = L0_2.Blip
    if L1_2 then
      L1_2 = L0_2.BlipCoords
      if L1_2 then
        L1_2 = library
        L1_2 = L1_2.CreateBlip
        L2_2 = {}
        L3_2 = L0_2.BlipCoords
        L2_2.coords = L3_2
        L3_2 = L0_2.Blip
        L3_2 = L3_2.sprite
        L2_2.sprite = L3_2
        L3_2 = L0_2.Blip
        L3_2 = L3_2.display
        L2_2.display = L3_2
        L3_2 = L0_2.Blip
        L3_2 = L3_2.scale
        L2_2.scale = L3_2
        L3_2 = L0_2.Blip
        L3_2 = L3_2.color
        L2_2.color = L3_2
        L3_2 = L0_2.Blip
        L3_2 = L3_2.name
        L2_2.name = L3_2
        L1_2 = L1_2(L2_2)
        L0_2.__blip = L1_2
      end
    end
    L1_2 = CL
    L1_2 = L1_2.Target
    L2_2 = "zone"
    L3_2 = {}
    L4_2 = L0_2.TargetCoords
    L4_2 = L4_2.xyz
    L3_2.coords = L4_2
    L4_2 = L0_2.TargetCoords
    L4_2 = L4_2.w
    L3_2.rotation = L4_2
    L4_2 = L0_2.TargetSize
    L3_2.size = L4_2
    L4_2 = {}
    L5_2 = {}
    L5_2.name = "marketplace"
    L5_2.icon = "fa-solid fa-building"
    L6_2 = TRANSLATE
    L7_2 = "target.marketplace"
    L6_2 = L6_2(L7_2)
    L5_2.label = L6_2
    function L6_2()
      local L0_3, L1_3
      L0_3 = openMarketplace
      L0_3()
    end
    L5_2.action = L6_2
    L4_2[1] = L5_2
    L3_2.options = L4_2
    L1_2(L2_2, L3_2)
  end
end
L2_1 = Citizen
L2_1 = L2_1.CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Citizen
  L0_2 = L0_2.Wait
  L1_2 = 2000
  L0_2(L1_2)
  L0_2 = library
  L0_2 = L0_2.Debug
  L1_2 = Config
  L1_2 = L1_2.Weather
  if L1_2 then
    L1_2 = "^2[Compatibility]^7 Found Compatible Weather: ^3%s^7"
    L2_2 = L1_2
    L1_2 = L1_2.format
    L3_2 = Config
    L3_2 = L3_2.Weather
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      goto lbl_19
    end
  end
  L1_2 = "^1[Compatibility]^7 No compatible weather found!"
  ::lbl_19::
  L0_2(L1_2)
  L0_2 = library
  L0_2 = L0_2.Debug
  L1_2 = Config
  L1_2 = L1_2.Clothing
  if L1_2 then
    L1_2 = "^2[Compatibility]^7 Found Compatible Clothing: ^3%s^7"
    L2_2 = L1_2
    L1_2 = L1_2.format
    L3_2 = Config
    L3_2 = L3_2.Clothing
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      goto lbl_34
    end
  end
  L1_2 = "^1[Compatibility]^7 No compatible clothing found!"
  ::lbl_34::
  L0_2(L1_2)
  L0_2 = library
  L0_2 = L0_2.Debug
  L1_2 = Config
  L1_2 = L1_2.Garages
  if L1_2 then
    L1_2 = "^2[Compatibility]^7 Found Compatible Garage: ^3%s^7"
    L2_2 = L1_2
    L1_2 = L1_2.format
    L3_2 = Config
    L3_2 = L3_2.Garages
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      goto lbl_49
    end
  end
  L1_2 = "^1[Compatibility]^7 No compatible garage found!"
  ::lbl_49::
  L0_2(L1_2)
  L0_2 = library
  L0_2 = L0_2.Debug
  L1_2 = Config
  L1_2 = L1_2.Inventory
  if L1_2 then
    L1_2 = "^2[Compatibility]^7 Found Compatible Inventory: ^3%s^7"
    L2_2 = L1_2
    L1_2 = L1_2.format
    L3_2 = Config
    L3_2 = L3_2.Inventory
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      goto lbl_64
    end
  end
  L1_2 = "^1[Compatibility]^7 No compatible inventory found!"
  ::lbl_64::
  L0_2(L1_2)
  L0_2 = L1_1
  L0_2()
end
L2_1(L3_1)
