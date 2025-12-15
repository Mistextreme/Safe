local L0_1, L1_1, L2_1
function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = HasPermission
  L6_2 = A0_2
  L7_2 = "manage_alerts"
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = {}
    L6_2.error = "permission"
    return L6_2
  end
  L6_2 = AdminLog
  L7_2 = -1
  L8_2 = "info"
  L9_2 = "Alert created by "
  L10_2 = A0_2
  L9_2 = L9_2 .. L10_2
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = MySQL
  L6_2 = L6_2.query
  L6_2 = L6_2.await
  L7_2 = "INSERT INTO electus_admin_alerts (alert_name, alert_item, alert_type, amount) VALUES (?, ?, ?, ?)"
  L8_2 = {}
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L12_2 = A4_2
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L8_2[4] = L12_2
  L6_2 = L6_2(L7_2, L8_2)
  return L6_2
end
CreateAlert = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM electus_admin_alerts"
  L0_2 = L0_2(L1_2)
  L1_2 = 1
  L2_2 = #L0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_2[L4_2]
    L6_2 = L0_2[L4_2]
    L6_2 = L6_2.alert_id
    L5_2.id = L6_2
    L5_2 = L0_2[L4_2]
    L6_2 = L0_2[L4_2]
    L6_2 = L6_2.alert_name
    L5_2.alertName = L6_2
    L5_2 = L0_2[L4_2]
    L6_2 = L0_2[L4_2]
    L6_2 = L6_2.alert_item
    L5_2.alertItem = L6_2
    L5_2 = L0_2[L4_2]
    L6_2 = L0_2[L4_2]
    L6_2 = L6_2.alert_type
    L5_2.type = L6_2
    L5_2 = L0_2[L4_2]
    L6_2 = L0_2[L4_2]
    L6_2 = L6_2.amount
    L5_2.amount = L6_2
  end
  return L0_2
end
GetAlerts = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = MySQL
  L1_2 = L1_2.single
  L1_2 = L1_2.await
  L2_2 = "SELECT * FROM electus_admin_alerts WHERE alert_id = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L2_2 = L1_2.alert_id
    L1_2.id = L2_2
    L2_2 = L1_2.alert_name
    L1_2.alertName = L2_2
    L2_2 = L1_2.alert_type
    L1_2.type = L2_2
    L2_2 = L1_2.amount
    L1_2.amount = L2_2
  end
  return L1_2
end
GetAlertById = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT * FROM electus_admin_active_alerts"
  L0_2 = L0_2(L1_2)
  L1_2 = 1
  L2_2 = #L0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = GetAlertById
    L6_2 = L0_2[L4_2]
    L6_2 = L6_2.alert_id
    L5_2 = L5_2(L6_2)
    L6_2 = L0_2[L4_2]
    L7_2 = GetIdentifierName
    L8_2 = L0_2[L4_2]
    L8_2 = L8_2.identifier
    L7_2 = L7_2(L8_2)
    L6_2.alertName = L7_2
    L6_2 = L0_2[L4_2]
    L7_2 = L0_2[L4_2]
    L7_2 = L7_2.alert_id
    L6_2.id = L7_2
    L6_2 = L0_2[L4_2]
    L7_2 = L0_2[L4_2]
    L7_2 = L7_2.identifier
    L6_2.identifier = L7_2
    L6_2 = L0_2[L4_2]
    L7_2 = L5_2
    if L7_2 then
      L7_2 = L7_2.alert_name
    end
    L6_2.alertName = L7_2
    L6_2 = L0_2[L4_2]
    L7_2 = L5_2
    if L7_2 then
      L7_2 = L7_2.alert_type
    end
    L6_2.type = L7_2
    L6_2 = L0_2[L4_2]
    L7_2 = L5_2
    if L7_2 then
      L7_2 = L7_2.amount
    end
    L6_2.amount = L7_2
  end
  return L0_2
end
GetActiveAlerts = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = HasPermission
  L3_2 = A0_2
  L4_2 = "manage_alerts"
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = {}
    L3_2.error = "permission"
    return L3_2
  end
  L3_2 = AdminLog
  L4_2 = -1
  L5_2 = "info"
  L6_2 = "Alert deleted by "
  L7_2 = A0_2
  L8_2 = " for "
  L9_2 = A1_2
  L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = "DELETE FROM electus_admin_alerts WHERE alert_id = ?"
  L5_2 = {}
  L6_2 = A1_2
  L5_2[1] = L6_2
  L3_2 = L3_2(L4_2, L5_2)
  return L3_2
end
DeleteAlert = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "manage_alerts"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = {}
    L4_2.error = "permission"
    return L4_2
  end
  L4_2 = AdminLog
  L5_2 = -1
  L6_2 = "info"
  L7_2 = "Active alert deleted by "
  L8_2 = A0_2
  L9_2 = " for "
  L10_2 = A1_2
  L11_2 = " and "
  L12_2 = A2_2
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = "DELETE FROM electus_admin_active_alerts WHERE alert_id = ? AND identifier = ?"
  L6_2 = {}
  L7_2 = A1_2
  L8_2 = A2_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  return L4_2
end
DeleteActiveAlert = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = GetAlerts
  L0_2 = L0_2()
  L1_2 = 1
  L2_2 = #L0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_2[L4_2]
    L6_2 = {}
    L7_2 = L5_2.type
    if "cash" == L7_2 then
      L7_2 = GetPlayersWithMinCash
      L8_2 = L5_2.amount
      L7_2 = L7_2(L8_2)
      L6_2 = L7_2
    else
      L7_2 = L5_2.type
      if "bank" == L7_2 then
        L7_2 = GetPlayersWithMinBank
        L8_2 = L5_2.amount
        L7_2 = L7_2(L8_2)
        L6_2 = L7_2
      else
        L7_2 = L5_2.type
        if "item" == L7_2 then
          L7_2 = L5_2.alertItem
          if L7_2 then
            L7_2 = GetItemWithMinAmountDatabase
            L8_2 = L5_2.alertItem
            L9_2 = L5_2.amount
            L7_2 = L7_2(L8_2, L9_2)
            L6_2 = L7_2
        end
        else
          L7_2 = L5_2.type
          if "vehicles" == L7_2 then
            L7_2 = GetPlayersWithMinVehicles
            L8_2 = L5_2.amount
            L7_2 = L7_2(L8_2)
            L6_2 = L7_2
          end
        end
      end
    end
    L7_2 = 1
    L8_2 = #L6_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = CreateActiveAlert
      L12_2 = L5_2.id
      L13_2 = L6_2[L10_2]
      L13_2 = L13_2.identifier
      L11_2(L12_2, L13_2)
    end
  end
end
CheckForAlerts = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = MySQL
  L2_2 = L2_2.single
  L2_2 = L2_2.await
  L3_2 = "SELECT alert_id FROM electus_admin_active_alerts WHERE alert_id = ? AND identifier = ?"
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = MySQL
  L3_2 = L3_2.query
  L3_2 = L3_2.await
  L4_2 = "INSERT INTO electus_admin_active_alerts (alert_id, identifier) VALUES (?, ?)"
  L5_2 = {}
  L6_2 = A0_2
  L7_2 = A1_2
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L3_2 = L3_2(L4_2, L5_2)
  return L3_2
end
CreateActiveAlert = L0_1
L0_1 = CheckForAlerts
L0_1()
L0_1 = lib
L0_1 = L0_1.cron
L0_1 = L0_1.new
L1_1 = "0 */1 * * *"
L2_1 = CheckForAlerts
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "GetAlerts"
L2_1 = GetAlerts
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "GetActiveAlerts"
L2_1 = GetActiveAlerts
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "CreateAlert"
L2_1 = CreateAlert
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "DeleteAlert"
L2_1 = DeleteAlert
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "DeleteActiveAlert"
L2_1 = DeleteActiveAlert
L0_1(L1_1, L2_1)
