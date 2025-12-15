local L0_1, L1_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = A0_2
  L1_2 = A0_2.gsub
  L3_2 = "%s+"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = L1_2
  L1_2 = L1_2.lower
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = Cache
  L2_2 = "vehicleEntity:"
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = GetAllVehicles
    L2_2 = L2_2()
    L3_2 = 1
    L4_2 = #L2_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = GetVehicleNumberPlateText
      L8_2 = L2_2[L6_2]
      L7_2 = L7_2(L8_2)
      L9_2 = L7_2
      L8_2 = L7_2.gsub
      L10_2 = "%s+"
      L11_2 = ""
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L9_2 = L8_2
      L8_2 = L8_2.lower
      L8_2 = L8_2(L9_2)
      L7_2 = L8_2
      if L7_2 == A0_2 then
        L8_2 = CacheSet
        L9_2 = "vehicleEntity:"
        L10_2 = A0_2
        L9_2 = L9_2 .. L10_2
        L10_2 = L2_2[L6_2]
        L11_2 = 80
        L8_2(L9_2, L10_2, L11_2)
        break
      end
    end
  end
  L2_2 = Cache
  L3_2 = "vehicleEntity:"
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  return L2_2(L3_2)
end
FindVehicleEntityByPlate = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = FrameworkGetDBVehicles
  L3_2 = A0_2
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end
GetVehiclesInDatabase = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = Cache
  L2_2 = "dbVehicle:"
  L3_2 = A0_2
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = FrameworkGetSpecificVehicleInDB
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = CacheSet
    L4_2 = "dbVehicle:"
    L5_2 = A0_2
    L4_2 = L4_2 .. L5_2
    L5_2 = L2_2
    L6_2 = 30
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L1_2 = L3_2
    return L2_2
  end
  return L1_2
end
GetSpecificVehicleInDatabase = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "manage_vehicles.transfer_vehicle"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = {}
    L4_2.error = "permission"
    return L4_2
  end
  L4_2 = AdminLog
  L5_2 = -1
  L6_2 = "info"
  L7_2 = "Transferred vehicle ownership from "
  L8_2 = A1_2
  L9_2 = " to "
  L10_2 = A2_2
  L11_2 = " by "
  L12_2 = A0_2
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = CacheDelete
  L5_2 = "dbVehicle:"
  L6_2 = A1_2
  L5_2 = L5_2 .. L6_2
  L4_2(L5_2)
  L4_2 = CacheDelete
  L5_2 = "dbVehicles"
  L4_2(L5_2)
  L4_2 = FrameworkTransferVehicleOwnership
  L5_2 = A1_2
  L6_2 = A2_2
  return L4_2(L5_2, L6_2)
end
TransferVehicleOwnership = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = HasPermission
  L3_2 = A0_2
  L4_2 = "manage_vehicles.repair_vehicle"
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = {}
    L3_2.error = "permission"
    return L3_2
  end
  L3_2 = AdminLog
  L4_2 = -1
  L5_2 = "info"
  L6_2 = "Repaired vehicle "
  L7_2 = A1_2
  L8_2 = " by "
  L9_2 = A0_2
  L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = FindVehicleEntityByPlate
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = L3_2.value
  end
  if not L3_2 then
    return
  end
  L4_2 = TriggerClientEvent
  L5_2 = "electus_admin:repairVehicle"
  L6_2 = NetworkGetEntityOwner
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  L7_2 = NetworkGetNetworkIdFromEntity
  L8_2 = L3_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
RepairVehicle = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = HasPermission
  L3_2 = A0_2
  L4_2 = "manage_vehicles"
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = {}
    L3_2.error = "permission"
    return L3_2
  end
  L3_2 = AdminLog
  L4_2 = -1
  L5_2 = "info"
  L6_2 = "Flipped vehicle "
  L7_2 = A1_2
  L8_2 = " by "
  L9_2 = A0_2
  L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = FindVehicleEntityByPlate
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = L3_2.value
  end
  if not L3_2 then
    return
  end
  L4_2 = TriggerClientEvent
  L5_2 = "electus_admin:flipVehicle"
  L6_2 = NetworkGetEntityOwner
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  L7_2 = NetworkGetNetworkIdFromEntity
  L8_2 = L3_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
FlipVehicle = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = HasPermission
  L3_2 = A0_2
  L4_2 = "manage_vehicles"
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = {}
    L3_2.error = "permission"
    return L3_2
  end
  L3_2 = AdminLog
  L4_2 = -1
  L5_2 = "info"
  L6_2 = "Deleted vehicle "
  L7_2 = A1_2
  L8_2 = " by "
  L9_2 = A0_2
  L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = FindVehicleEntityByPlate
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = L3_2.value
  end
  if not L3_2 then
    return
  end
  L4_2 = DeleteEntity
  L5_2 = L3_2
  L4_2(L5_2)
end
DeleteVehicle = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "manage_vehicles.change_plate"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = {}
    L4_2.error = "permission"
    return L4_2
  end
  L4_2 = AdminLog
  L5_2 = -1
  L6_2 = "info"
  L7_2 = "Changed plate from "
  L8_2 = A2_2
  L9_2 = " to "
  L10_2 = A1_2
  L11_2 = " by "
  L12_2 = A0_2
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = "SELECT * FROM {vehicle_table} WHERE {plate} = ?"
  L5_2 = L4_2
  L4_2 = L4_2.gsub
  L6_2 = "{plate}"
  L7_2 = Queries
  L7_2 = L7_2.Vehicles
  L7_2 = L7_2.plate
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L4_2
  L4_2 = L4_2.gsub
  L6_2 = "{vehicle_table}"
  L7_2 = Queries
  L7_2 = L7_2.Vehicles
  L7_2 = L7_2.table
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = MySQL
  L5_2 = L5_2.single
  L5_2 = L5_2.await
  L6_2 = L4_2
  L7_2 = {}
  L8_2 = A2_2
  L7_2[1] = L8_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = json
  L6_2 = L6_2.decode
  L7_2 = Queries
  L7_2 = L7_2.Vehicles
  L7_2 = L7_2.vehicle
  L7_2 = L5_2[L7_2]
  L6_2 = L6_2(L7_2)
  L6_2.plate = A1_2
  L7_2 = "UPDATE {vehicle_table} SET {plate} = @newPlate, {vehicle} = @vehicle WHERE {plate} = @oldPlate"
  L8_2 = L7_2
  L7_2 = L7_2.gsub
  L9_2 = "{plate}"
  L10_2 = Queries
  L10_2 = L10_2.Vehicles
  L10_2 = L10_2.plate
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = L7_2
  L7_2 = L7_2.gsub
  L9_2 = "{vehicle_table}"
  L10_2 = Queries
  L10_2 = L10_2.Vehicles
  L10_2 = L10_2.table
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = L7_2
  L7_2 = L7_2.gsub
  L9_2 = "{vehicle}"
  L10_2 = Queries
  L10_2 = L10_2.Vehicles
  L10_2 = L10_2.vehicle
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = MySQL
  L8_2 = L8_2.update
  L8_2 = L8_2.await
  L9_2 = L7_2
  L10_2 = {}
  L10_2["@newPlate"] = A1_2
  L11_2 = json
  L11_2 = L11_2.encode
  L12_2 = L6_2
  L11_2 = L11_2(L12_2)
  L10_2["@vehicle"] = L11_2
  L10_2["@oldPlate"] = A2_2
  L8_2(L9_2, L10_2)
  L8_2 = FindVehicleEntityByPlate
  L9_2 = A2_2
  L8_2 = L8_2(L9_2)
  if L8_2 then
    L8_2 = L8_2.value
  end
  if L8_2 then
    L9_2 = SetVehicleNumberPlateText
    L10_2 = L8_2
    L11_2 = A1_2
    L9_2(L10_2, L11_2)
  end
  L9_2 = CacheDelete
  L10_2 = "dbVehicle:"
  L11_2 = A2_2
  L10_2 = L10_2 .. L11_2
  L9_2(L10_2)
  L9_2 = CacheDelete
  L10_2 = "dbVehicles"
  L9_2(L10_2)
  L9_2 = true
  return L9_2
end
ChangePlate = L0_1
