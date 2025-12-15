local L0_1, L1_1, L2_1
L0_1 = {}
L0_1.WaitGameTimer = nil
L0_1.IsHaveProp = nil
L0_1.IsHaveProp2 = nil
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L2_2 = library
  L2_2 = L2_2.WaitGameTimer
  if L2_2 then
    L2_2 = library
    L2_2 = L2_2.WaitGameTimer
    if L1_2 <= L2_2 then
      L2_2 = CL
      L2_2 = L2_2.Notification
      L3_2 = TRANSLATE
      L4_2 = "notify.wait"
      L3_2 = L3_2(L4_2)
      L4_2 = 4500
      L5_2 = "info"
      L2_2(L3_2, L4_2, L5_2)
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = library
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = 1500
  end
  L3_2 = L1_2 + L3_2
  L2_2.WaitGameTimer = L3_2
  L2_2 = false
  return L2_2
end
L0_1.ActionLimiter = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = Config
  L2_2 = L2_2.Debug
  if not L2_2 then
    return
  end
  if A1_2 then
    if "error" == A1_2 then
      L2_2 = error
      L3_2 = A0_2
      L2_2(L3_2)
    elseif "warn" == A1_2 then
      L2_2 = warn
      L3_2 = A0_2
      L2_2(L3_2)
    end
  else
    L2_2 = print
    L3_2 = A0_2
    L2_2(L3_2)
  end
end
L0_1.Debug = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = json
  L1_2 = L1_2.encode
  L2_2 = A0_2
  L3_2 = {}
  L3_2.indent = true
  return L1_2(L2_2, L3_2)
end
L0_1.Dump = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = nil
  if "table" == L1_2 then
    L3_2 = {}
    L2_2 = L3_2
    L3_2 = next
    L4_2 = A0_2
    L5_2 = nil
    L6_2 = nil
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = library
      L9_2 = L9_2.Deepcopy
      L10_2 = L7_2
      L9_2 = L9_2(L10_2)
      L10_2 = library
      L10_2 = L10_2.Deepcopy
      L11_2 = L8_2
      L10_2 = L10_2(L11_2)
      L2_2[L9_2] = L10_2
    end
    L3_2 = setmetatable
    L4_2 = L2_2
    L5_2 = library
    L5_2 = L5_2.Deepcopy
    L6_2 = getmetatable
    L7_2 = A0_2
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2)
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  else
    L2_2 = A0_2
  end
  return L2_2
end
L0_1.Deepcopy = L1_1
function L1_1(A0_2, A1_2, ...)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = Config
  L2_2 = L2_2.Core
  if "ESX" == L2_2 then
    L2_2 = ESX
    L2_2 = L2_2.TriggerServerCallback
    L3_2 = A0_2
    L4_2 = A1_2
    L5_2 = ...
    L2_2(L3_2, L4_2, L5_2)
  else
    L2_2 = QBCore
    L2_2 = L2_2.Functions
    L2_2 = L2_2.TriggerCallback
    L3_2 = A0_2
    L4_2 = A1_2
    L5_2 = ...
    L2_2(L3_2, L4_2, L5_2)
  end
end
L0_1.Callback = L1_1
function L1_1(A0_2, ...)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = promise
  L1_2 = L1_2.new
  L1_2 = L1_2()
  L2_2 = Config
  L2_2 = L2_2.Core
  if "ESX" == L2_2 then
    L2_2 = ESX
    L2_2 = L2_2.TriggerServerCallback
    L3_2 = A0_2
    function L4_2(...)
      local L0_3, L1_3, L2_3
      L0_3 = L1_2
      L1_3 = L0_3
      L0_3 = L0_3.resolve
      L2_3 = ...
      L0_3(L1_3, L2_3)
    end
    L5_2 = ...
    L2_2(L3_2, L4_2, L5_2)
  else
    L2_2 = QBCore
    L2_2 = L2_2.Functions
    L2_2 = L2_2.TriggerCallback
    L3_2 = A0_2
    function L4_2(...)
      local L0_3, L1_3, L2_3
      L0_3 = L1_2
      L1_3 = L0_3
      L0_3 = L0_3.resolve
      L2_3 = ...
      L0_3(L1_3, L2_3)
    end
    L5_2 = ...
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = Citizen
  L2_2 = L2_2.Await
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  return L2_2
end
L0_1.CallbackAwait = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = AddBlipForCoord
  L2_2 = A0_2.coords
  L1_2 = L1_2(L2_2)
  L2_2 = SetBlipSprite
  L3_2 = L1_2
  L4_2 = A0_2.sprite
  L2_2(L3_2, L4_2)
  L2_2 = SetBlipDisplay
  L3_2 = L1_2
  L4_2 = A0_2.display
  L2_2(L3_2, L4_2)
  L2_2 = SetBlipScale
  L3_2 = L1_2
  L4_2 = A0_2.scale
  L2_2(L3_2, L4_2)
  L2_2 = SetBlipColour
  L3_2 = L1_2
  L4_2 = A0_2.color
  L2_2(L3_2, L4_2)
  L2_2 = SetBlipAsShortRange
  L3_2 = L1_2
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = BeginTextCommandSetBlipName
  L3_2 = "STRING"
  L2_2(L3_2)
  L2_2 = AddTextComponentString
  L3_2 = A0_2.name
  L2_2(L3_2)
  L2_2 = EndTextCommandSetBlipName
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = A0_2.blipCategory
  if nil ~= L2_2 then
    L2_2 = SetBlipCategory
    L3_2 = L1_2
    L4_2 = A0_2.blipCategory
    L2_2(L3_2, L4_2)
  end
  return L1_2
end
L0_1.CreateBlip = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = RemoveBlip
    L2_2 = A0_2
    L1_2(L2_2)
    L1_2 = nil
    return L1_2
  end
end
L0_1.DeleteBlip = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = true
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  L2_2 = L2_2 + 5000
  L3_2 = tonumber
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = A0_2 or L3_2
  if not L3_2 or not A0_2 then
    L3_2 = GetHashKey
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
  end
  L4_2 = RequestModel
  L5_2 = L3_2
  L4_2(L5_2)
  while true do
    L4_2 = HasModelLoaded
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = RequestModel
    L5_2 = L3_2
    L4_2(L5_2)
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    if L2_2 < L4_2 then
      L1_2 = false
      break
    end
    L4_2 = Wait
    L5_2 = 1
    L4_2(L5_2)
  end
  return L1_2
end
L0_1.RequestEntity = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = library
  L1_2 = L1_2.RequestEntity
  L2_2 = A0_2.model
  L1_2(L2_2)
  L1_2 = CreatePed
  L2_2 = 4
  L3_2 = A0_2.model
  L4_2 = A0_2.coords
  L4_2 = L4_2.x
  L5_2 = A0_2.coords
  L5_2 = L5_2.y
  L6_2 = A0_2.coords
  L6_2 = L6_2.z
  L7_2 = A0_2.coords
  L7_2 = L7_2.w
  if not L7_2 then
    L7_2 = 0.0
  end
  L8_2 = false
  L9_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L2_2 = FreezeEntityPosition
  L3_2 = L1_2
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SetEntityInvincible
  L3_2 = L1_2
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = TaskSetBlockingOfNonTemporaryEvents
  L3_2 = L1_2
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.animation
  if L2_2 then
    L2_2 = library
    L2_2 = L2_2.PlayAnimation
    L3_2 = L1_2
    L4_2 = A0_2.animation
    L4_2 = L4_2[1]
    L5_2 = A0_2.animation
    L5_2 = L5_2[2]
    L6_2 = 8.0
    L7_2 = 8.0
    L8_2 = -1
    L9_2 = 1
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  end
  return L1_2
end
L0_1.SpawnPed = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L6_2 = PlayerPedId
  L6_2 = L6_2()
  L7_2 = tonumber
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  L7_2 = A0_2 or L7_2
  if not L7_2 or not A0_2 then
    L7_2 = GetHashKey
    L8_2 = A0_2
    L7_2 = L7_2(L8_2)
  end
  if A1_2 then
    L8_2 = vec
    L9_2 = A1_2.x
    L10_2 = A1_2.y
    L11_2 = A1_2.z
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    if L8_2 then
      goto lbl_25
    end
  end
  L8_2 = GetEntityCoords
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  ::lbl_25::
  L9_2 = library
  L9_2 = L9_2.RequestEntity
  L10_2 = L7_2
  L9_2(L10_2)
  L9_2 = CreateObject
  L10_2 = L7_2
  L11_2 = L8_2.xyz
  L12_2 = A2_2
  L13_2 = false
  L14_2 = true
  L15_2 = A5_2 or L15_2
  if not A5_2 then
    L15_2 = false
  end
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  if A3_2 then
    L10_2 = AttachEntityToEntity
    L11_2 = L9_2
    L12_2 = A3_2.attachTo
    L13_2 = A3_2.boneIndex
    L14_2 = A3_2.placement
    L14_2 = L14_2[1]
    L15_2 = A3_2.placement
    L15_2 = L15_2[2]
    L16_2 = A3_2.placement
    L16_2 = L16_2[3]
    L17_2 = A3_2.placement
    L17_2 = L17_2[4]
    L18_2 = A3_2.placement
    L18_2 = L18_2[5]
    L19_2 = A3_2.placement
    L19_2 = L19_2[6]
    L20_2 = true
    L21_2 = true
    L22_2 = false
    L23_2 = true
    L24_2 = 1
    L25_2 = true
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
  end
  if A4_2 then
    L10_2 = SetEntityCollision
    L11_2 = L9_2
    L12_2 = false
    L13_2 = true
    L10_2(L11_2, L12_2, L13_2)
  end
  return L9_2
end
L0_1.SpawnProp = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = false
  L2_2 = SetTimeout
  L3_2 = 5000
  function L4_2()
    local L0_3, L1_3
    L0_3 = true
    L1_2 = L0_3
  end
  L2_2(L3_2, L4_2)
  repeat
    L2_2 = RequestAnimDict
    L3_2 = A0_2
    L2_2(L3_2)
    L2_2 = Wait
    L3_2 = 50
    L2_2(L3_2)
    L2_2 = HasAnimDictLoaded
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
  until L2_2 or L1_2
end
L0_1.LoadDict = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2)
  local L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L9_2 = library
  L9_2 = L9_2.LoadDict
  L10_2 = A1_2
  L9_2(L10_2)
  if A7_2 then
    L9_2 = library
    L10_2 = library
    L10_2 = L10_2.SpawnProp
    L11_2 = GetHashKey
    L12_2 = A7_2[1]
    L11_2 = L11_2(L12_2)
    L12_2 = A7_2[2]
    L13_2 = A7_2[3]
    L14_2 = A7_2[4]
    L15_2 = A7_2[5]
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    L9_2.IsHaveProp = L10_2
  end
  if A8_2 then
    L9_2 = library
    L10_2 = library
    L10_2 = L10_2.SpawnProp
    L11_2 = GetHashKey
    L12_2 = A8_2[1]
    L11_2 = L11_2(L12_2)
    L12_2 = A8_2[2]
    L13_2 = A8_2[3]
    L14_2 = A8_2[4]
    L15_2 = A8_2[5]
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    L9_2.IsHaveProp2 = L10_2
  end
  L9_2 = library
  L9_2.IsPlayingAnimation = true
  L9_2 = TaskPlayAnim
  L10_2 = A0_2
  L11_2 = A1_2
  L12_2 = A2_2
  L13_2 = A3_2 or L13_2
  if not A3_2 then
    L13_2 = 8.0
  end
  L14_2 = A4_2 or L14_2
  if not A4_2 then
    L14_2 = 8.0
  end
  L15_2 = A5_2
  L16_2 = A6_2
  L17_2 = 0
  L18_2 = false
  L19_2 = false
  L20_2 = false
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
end
L0_1.PlayAnimation = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = library
  L1_2 = L1_2.IsHaveProp
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = library
    L2_2 = L2_2.IsHaveProp
    L1_2(L2_2)
    L1_2 = library
    L1_2.IsHaveProp = nil
  end
  L1_2 = library
  L1_2 = L1_2.IsHaveProp2
  if L1_2 then
    L1_2 = DeleteEntity
    L2_2 = library
    L2_2 = L2_2.IsHaveProp2
    L1_2(L2_2)
    L1_2 = library
    L1_2.IsHaveProp2 = nil
  end
  L1_2 = library
  L1_2 = L1_2.IsPlayingAnimation
  if L1_2 then
    L1_2 = ClearPedTasks
    L2_2 = A0_2
    L1_2(L2_2)
  end
  L1_2 = library
  L1_2.IsPlayingAnimation = false
end
L0_1.StopAnimation = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L6_2 = RequestNamedPtfxAsset
  L7_2 = A0_2
  L6_2(L7_2)
  while true do
    L6_2 = HasNamedPtfxAssetLoaded
    L7_2 = A0_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      break
    end
    L6_2 = Citizen
    L6_2 = L6_2.Wait
    L7_2 = 10
    L6_2(L7_2)
  end
  L6_2 = UseParticleFxAssetNextCall
  L7_2 = A0_2
  L6_2(L7_2)
  L6_2 = StartParticleFxLoopedAtCoord
  L7_2 = A1_2
  L8_2 = A2_2.x
  L9_2 = A2_2.y
  L10_2 = A2_2.z
  L11_2 = A3_2.x
  L12_2 = A3_2.y
  L13_2 = A3_2.z
  L14_2 = A4_2
  L15_2 = 0.0
  L16_2 = 0.0
  L17_2 = 0.0
  L18_2 = 0
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  if A5_2 then
    L7_2 = A5_2[1]
    if L7_2 then
      L7_2 = SetParticleFxLoopedColour
      L8_2 = L6_2
      L9_2 = tonumber
      L10_2 = A5_2[1]
      L9_2 = L9_2(L10_2)
      L9_2 = L9_2 + 0.0
      L10_2 = tonumber
      L11_2 = A5_2[2]
      L10_2 = L10_2(L11_2)
      L10_2 = L10_2 + 0.0
      L11_2 = tonumber
      L12_2 = A5_2[3]
      L11_2 = L11_2(L12_2)
      L11_2 = L11_2 + 0.0
      L12_2 = false
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      L7_2 = A5_2[4]
      if L7_2 then
        L7_2 = SetParticleFxLoopedAlpha
        L8_2 = L6_2
        L9_2 = tonumber
        L10_2 = A5_2[4]
        L9_2 = L9_2(L10_2)
        L9_2 = L9_2 + 0.0
        L7_2(L8_2, L9_2)
      end
    end
  end
  return L6_2
end
L0_1.StartParticles = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = DoesParticleFxLoopedExist
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = RemoveParticleFx
    L2_2 = A0_2
    L3_2 = false
    L1_2(L2_2, L3_2)
  end
end
L0_1.StopParticles = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = ""
  L2_2 = 0
  if "enterHouse" == A0_2 then
    L3_2 = "enter_house"
    L2_2 = 0.1
    L1_2 = L3_2
  elseif "exitHouse" == A0_2 then
    L3_2 = "exit_house"
    L2_2 = 0.1
    L1_2 = L3_2
  elseif "openDoors" == A0_2 then
    L3_2 = "open_doors"
    L2_2 = 0.1
    L1_2 = L3_2
  elseif "lockDoors" == A0_2 then
    L3_2 = "lock_doors"
    L2_2 = 0.05
    L1_2 = L3_2
  elseif "doorbell" == A0_2 then
    L3_2 = "doorbell"
    L2_2 = 0.005
    L1_2 = L3_2
  elseif "doorbellInside" == A0_2 then
    L3_2 = "doorbell"
    L2_2 = 0.1
    L1_2 = L3_2
  elseif "lightSwitch" == A0_2 then
    L3_2 = "light_switch"
    L2_2 = 0.12
    L1_2 = L3_2
  end
  if "" == L1_2 then
    return
  end
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "PlayAudio"
  L4_2.file = L1_2
  L4_2.volume = L2_2
  L3_2(L4_2)
end
L0_1.PlayAudio = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.Regions
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.zone
    if L7_2 then
      L7_2 = isPointInPolygon
      L8_2 = A0_2
      L9_2 = L6_2.zone
      L7_2 = L7_2(L8_2, L9_2)
      if L7_2 then
        return L5_2
      end
    end
  end
  L1_2 = nil
  return L1_2
end
L0_1.GetCurrentRegion = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Properties
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = Config
  L2_2 = L2_2.UseKeysAsItem
  if not L2_2 then
    L2_2 = L1_2.owner
    L3_2 = Identifier
    if L2_2 == L3_2 then
      L2_2 = true
      return L2_2
    end
    L2_2 = L1_2.renter
    L3_2 = Identifier
    if L2_2 == L3_2 then
      L2_2 = true
      return L2_2
    end
    L2_2 = L1_2.keys
    if L2_2 then
      L2_2 = string
      L2_2 = L2_2.find
      L3_2 = L1_2.keys
      L4_2 = Identifier
      L2_2 = L2_2(L3_2, L4_2)
      if L2_2 then
        L2_2 = true
        return L2_2
      end
    end
    L2_2 = false
    return L2_2
  end
end
L0_1.HasKeys = L1_1
function L1_1(A0_2, A1_2)
