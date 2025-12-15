local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "electus_admin:flipVehicle"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = NetworkGetEntityFromNetworkId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetEntityRotation
  L3_2 = L1_2
  L4_2 = 2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = SetEntityRotation
  L4_2 = L1_2
  L5_2 = L2_2[1]
  L6_2 = 0
  L7_2 = L2_2[3]
  L8_2 = 2
  L9_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = SetVehicleOnGroundProperly
  L4_2 = L1_2
  L3_2(L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "electus_admin:repairVehicle"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = NetworkGetEntityFromNetworkId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = SetVehicleFixed
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = SetVehicleDeformationFixed
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = SetVehicleUndriveable
  L3_2 = L1_2
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = SetVehicleEngineOn
  L3_2 = L1_2
  L4_2 = true
  L5_2 = true
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
