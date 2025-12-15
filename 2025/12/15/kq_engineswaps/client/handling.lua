local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "kq_engineswaps:setVehicleEngine"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "kq_engineswaps:setVehicleEngine"
function L2_1(A0_2, A1_2)
  local L2_2
  if A0_2 then
    if false ~= A1_2 then
      L2_2 = swappedCars
      L2_2[A0_2] = A1_2
    end
    L2_2 = syncedCars
    L2_2[A0_2] = true
  end
end
L0_1(L1_1, L2_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  while true do
    L0_2 = Config
    L0_2 = L0_2.SyncInterval
    L1_2 = PlayerPedId
    L1_2 = L1_2()
    L2_2 = GetEntityCoords
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L3_2 = GetGamePool
    L4_2 = "CVehicle"
    L3_2 = L3_2(L4_2)
    L4_2 = 1
    L5_2 = #L3_2
    L6_2 = 1
    for L7_2 = L4_2, L5_2, L6_2 do
      L8_2 = L3_2[L7_2]
      L9_2 = GetEntityCoords
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      L10_2 = GetDistanceBetweenCoords
      L11_2 = L9_2
      L12_2 = L2_2
      L10_2 = L10_2(L11_2, L12_2)
      L11_2 = Config
      L11_2 = L11_2.SyncRadius
      if L10_2 <= L11_2 then
        L10_2 = GetVehicleNumberPlateText
        L11_2 = L8_2
        L10_2 = L10_2(L11_2)
        L11_2 = string
        L11_2 = L11_2.gsub
        L12_2 = L10_2
        L13_2 = "%s+"
        L14_2 = ""
        L11_2 = L11_2(L12_2, L13_2, L14_2)
        L10_2 = L11_2
        L11_2 = syncedCars
        L11_2 = L11_2[L10_2]
        if not L11_2 then
          L11_2 = TriggerServerEvent
          L12_2 = "kq_engineswaps:requestSync"
          L13_2 = L10_2
          L11_2(L12_2, L13_2)
        else
          L11_2 = false
          L12_2 = IsPedInAnyVehicle
          L13_2 = L1_2
          L12_2 = L12_2(L13_2)
          if L12_2 then
            L12_2 = upgradedCars
            L12_2 = L12_2[L8_2]
            L13_2 = swappedCars
            L13_2 = L13_2[L10_2]
            if L12_2 == L13_2 then
              L12_2 = GetVehiclePedIsIn
              L13_2 = L1_2
              L14_2 = false
              L12_2 = L12_2(L13_2, L14_2)
              if L12_2 == L8_2 then
                L11_2 = true
              end
            end
          end
          L12_2 = swappedCars
          L12_2 = L12_2[L10_2]
          if L12_2 and not L11_2 then
            L12_2 = upgradedCars
            L13_2 = swappedCars
            L13_2 = L13_2[L10_2]
            L12_2[L8_2] = L13_2
            L12_2 = Config
            L12_2 = L12_2.UseCustomHandlingSetter
            if not L12_2 then
              L12_2 = SetVehicleEngine
              L13_2 = L8_2
              L14_2 = Config
              L14_2 = L14_2.Engines
              L15_2 = swappedCars
              L15_2 = L15_2[L10_2]
              L14_2 = L14_2[L15_2]
              L12_2(L13_2, L14_2)
            else
              L12_2 = CustomSetVehicleEngine
              L13_2 = L8_2
              L14_2 = Config
              L14_2 = L14_2.Engines
              L15_2 = swappedCars
              L15_2 = L15_2[L10_2]
              L14_2 = L14_2[L15_2]
              L12_2(L13_2, L14_2)
            end
          end
        end
      end
    end
    L4_2 = Citizen
    L4_2 = L4_2.Wait
    L5_2 = L0_2
    L4_2(L5_2)
  end
end
L0_1(L1_1)
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = A1_2.power
  L2_2 = L2_2 / 1000
  L2_2 = L2_2 + 0.0
  L3_2 = Config
  L3_2 = L3_2.PowerMultiplier
  L2_2 = L2_2 * L3_2
  L3_2 = GetVehicleHandlingFloat
  L4_2 = A0_2
  L5_2 = "CHandlingData"
  L6_2 = "fInitialDriveMaxFlatVel"
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = GetVehicleHandlingFloat
  L5_2 = A0_2
  L6_2 = "CHandlingData"
  L7_2 = "fDriveInertia"
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = GetVehicleHandlingFloat
  L6_2 = A0_2
  L7_2 = "CHandlingData"
  L8_2 = "fInitialDriveForce"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = GetVehicleHandlingFloat
  L7_2 = A0_2
  L8_2 = "CHandlingData"
  L9_2 = "fMass"
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = stockHandling
  L7_2 = L7_2[A0_2]
  if L7_2 then
    L7_2 = stockHandling
    L7_2 = L7_2[A0_2]
    L6_2 = L7_2.fMass
  end
  L7_2 = math
  L7_2 = L7_2.floor
  L8_2 = L2_2 - L5_2
  L8_2 = L8_2 * 3
  L8_2 = L8_2 * 100
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2 / 100
  L8_2 = A1_2.maxV
  L9_2 = Config
  L9_2 = L9_2.MaxVMultiplier
  L8_2 = L8_2 * L9_2
  L9_2 = L2_2
  L10_2 = L6_2 * 0.95
  L10_2 = L10_2 - 100.0
  L11_2 = A1_2.mass
  L10_2 = L10_2 + L11_2
  L11_2 = 0.0
  L12_2 = 1000.0
  if L10_2 < L12_2 then
    L11_2 = 15.0
  else
    L12_2 = 1100.0
    if L10_2 < L12_2 then
      L11_2 = 10.0
    else
      L12_2 = 1250.0
      if L10_2 < L12_2 then
        L11_2 = 7.0
      else
        L12_2 = 1500.0
        if L10_2 < L12_2 then
          L11_2 = 4.0
        end
      end
    end
  end
  L12_2 = 1.0 + L7_2
  L8_2 = L8_2 + L11_2
  L13_2 = 1.2
  if L12_2 > L13_2 then
    L12_2 = 1.2
  end
  L13_2 = SetVehicleHandlingField
  L14_2 = A0_2
  L15_2 = "CHandlingData"
  L16_2 = "fInitialDriveMaxFlatVel"
  L17_2 = L8_2
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = SetVehicleHandlingField
  L14_2 = A0_2
  L15_2 = "CHandlingData"
  L16_2 = "fDriveInertia"
  L17_2 = L12_2
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = SetVehicleHandlingField
  L14_2 = A0_2
  L15_2 = "CHandlingData"
  L16_2 = "fInitialDriveForce"
  L17_2 = L9_2
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = SetVehicleHandlingField
  L14_2 = A0_2
  L15_2 = "CHandlingData"
  L16_2 = "fMass"
  L17_2 = L10_2
  L13_2(L14_2, L15_2, L16_2, L17_2)
  L13_2 = ModifyVehicleTopSpeed
  L14_2 = A0_2
  L15_2 = L7_2 * 4
  L13_2(L14_2, L15_2)
  L13_2 = ForceVehicleEngineAudio
  L14_2 = A0_2
  L15_2 = A1_2.sound
  L13_2(L14_2, L15_2)
  L13_2 = EnableVehicleExhaustPops
  L14_2 = A0_2
  L15_2 = true
  L13_2(L14_2, L15_2)
  L13_2 = stockHandling
  L13_2 = L13_2[A0_2]
  if not L13_2 then
    L13_2 = stockHandling
    L14_2 = {}
    L14_2.fInitialDriveMaxFlatVel = L3_2
    L14_2.fDriveInertia = L4_2
    L14_2.fInitialDriveForce = L5_2
    L14_2.fMass = L6_2
    L14_2.boost = L7_2
    L13_2[A0_2] = L14_2
  end
end
SetVehicleEngine = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = stockHandling
  L1_2 = L1_2[A0_2]
  if nil ~= L1_2 then
    L1_2 = SetVehicleHandlingField
    L2_2 = A0_2
    L3_2 = "CHandlingData"
    L4_2 = "fInitialDriveMaxFlatVel"
    L5_2 = stockHandling
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.fInitialDriveMaxFlatVel
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = SetVehicleHandlingField
    L2_2 = A0_2
    L3_2 = "CHandlingData"
    L4_2 = "fDriveInertia"
    L5_2 = stockHandling
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.fDriveInertia
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = SetVehicleHandlingField
    L2_2 = A0_2
    L3_2 = "CHandlingData"
    L4_2 = "fInitialDriveForce"
    L5_2 = stockHandling
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.fInitialDriveForce
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = SetVehicleHandlingField
    L2_2 = A0_2
    L3_2 = "CHandlingData"
    L4_2 = "fMass"
    L5_2 = stockHandling
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.fMass
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = ModifyVehicleTopSpeed
    L2_2 = A0_2
    L3_2 = stockHandling
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2.boost
    L3_2 = L3_2 * 4
    L3_2 = -L3_2
    L1_2(L2_2, L3_2)
    L1_2 = ForceVehicleEngineAudio
    L2_2 = A0_2
    L3_2 = GetEntityModel
    L4_2 = A0_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = EnableVehicleExhaustPops
    L2_2 = A0_2
    L3_2 = true
    L1_2(L2_2, L3_2)
  end
end
MakeStock = L0_1
