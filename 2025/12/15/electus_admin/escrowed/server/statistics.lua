local L0_1, L1_1, L2_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchSingle
  L1_2 = "SELECT * FROM electus_admin_weekly_stats ORDER BY timestamp DESC LIMIT 1"
  L0_2 = L0_2(L1_2)
  L1_2 = MySQL
  L1_2 = L1_2.Sync
  L1_2 = L1_2.execute
  L2_2 = "DELETE FROM electus_admin_weekly_stats"
  L1_2(L2_2)
  L1_2 = MySQL
  L1_2 = L1_2.insert
  L1_2 = L1_2.await
  L2_2 = [[
            INSERT INTO electus_admin_monthly_stats (players, jobs, items, balance)
            VALUES (?, ?, ?, ?)
        ]]
  L3_2 = {}
  L4_2 = L0_2.players
  L5_2 = L0_2.jobs
  L6_2 = L0_2.items
  L7_2 = L0_2.balance
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L1_2 = L1_2(L2_2, L3_2)
end
CollectMonthlyStatistics = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchSingle
  L1_2 = "SELECT * FROM electus_admin_daily_stats ORDER BY timestamp DESC LIMIT 1"
  L0_2 = L0_2(L1_2)
  L1_2 = MySQL
  L1_2 = L1_2.Sync
  L1_2 = L1_2.fetchScalar
  L2_2 = "SELECT timestamp FROM electus_admin_weekly_stats ORDER BY timestamp DESC LIMIT 1"
  L1_2 = L1_2(L2_2)
  L2_2 = MySQL
  L2_2 = L2_2.Sync
  L2_2 = L2_2.execute
  L3_2 = "DELETE FROM electus_admin_daily_stats"
  L2_2(L3_2)
  L2_2 = MySQL
  L2_2 = L2_2.insert
  L2_2 = L2_2.await
  L3_2 = [[
            INSERT INTO electus_admin_weekly_stats (players, jobs, items, balance)
            VALUES (?, ?, ?, ?)
        ]]
  L4_2 = {}
  L5_2 = L0_2.players
  L6_2 = L0_2.jobs
  L7_2 = L0_2.items
  L8_2 = L0_2.balance
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L2_2 = L2_2(L3_2, L4_2)
  if L1_2 then
    L3_2 = tonumber
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    L1_2 = L3_2 / 1000
    L3_2 = os
    L3_2 = L3_2.date
    L4_2 = "%W"
    L5_2 = L1_2
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = os
    L4_2 = L4_2.date
    L5_2 = "%W"
    L6_2 = os
    L6_2 = L6_2.time
    L6_2, L7_2, L8_2 = L6_2()
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    L3_2 = L3_2 == L4_2
    if not L3_2 then
      L4_2 = CollectMonthlyStatistics
      L4_2()
    end
  end
end
CollectWeeklyStatistics = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchScalar
  L1_2 = "SELECT timestamp FROM electus_admin_daily_stats ORDER BY timestamp DESC LIMIT 1"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L1_2 = tonumber
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L0_2 = L1_2 / 1000
    L1_2 = os
    L1_2 = L1_2.date
    L2_2 = "%d"
    L3_2 = L0_2
    L1_2 = L1_2(L2_2, L3_2)
    L2_2 = os
    L2_2 = L2_2.date
    L3_2 = "%d"
    L4_2 = os
    L4_2 = L4_2.time
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L4_2()
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L1_2 = L1_2 == L2_2
    if false == L1_2 then
      L2_2 = CollectWeeklyStatistics
      L2_2()
    end
  end
  L1_2 = CollectJob
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = 1
  L4_2 = Config
  L4_2 = L4_2.statistics
  L4_2 = L4_2.items
  L4_2 = #L4_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = #L2_2
    L7_2 = L7_2 + 1
    L8_2 = {}
    L9_2 = Config
    L9_2 = L9_2.statistics
    L9_2 = L9_2.items
    L9_2 = L9_2[L6_2]
    L8_2.item = L9_2
    L9_2 = GetItemPlayersDatabase
    L10_2 = Config
    L10_2 = L10_2.statistics
    L10_2 = L10_2.items
    L10_2 = L10_2[L6_2]
    L9_2 = L9_2(L10_2)
    L9_2 = #L9_2
    L8_2.count = L9_2
    L2_2[L7_2] = L8_2
  end
  L3_2 = GetNumPlayerIndices
  L3_2 = L3_2()
  L4_2 = FrameworkGetTotalBank
  L4_2 = L4_2()
  L5_2 = FrameworkGetTotalCash
  L5_2 = L5_2()
  L4_2 = L4_2 + L5_2
  L5_2 = MySQL
  L5_2 = L5_2.insert
  L5_2 = L5_2.await
  L6_2 = [[
            INSERT INTO electus_admin_daily_stats (players, jobs, items, balance)
            VALUES (?, ?, ?, ?)
        ]]
  L7_2 = {}
  L8_2 = L3_2
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = L1_2
  L9_2 = L9_2(L10_2)
  L10_2 = json
  L10_2 = L10_2.encode
  L11_2 = L2_2
  L10_2 = L10_2(L11_2)
  L11_2 = L4_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L5_2 = L5_2(L6_2, L7_2)
end
CollectDailyStatistics = L0_1
L0_1 = lib
L0_1 = L0_1.cron
L0_1 = L0_1.new
L1_1 = "00 */1 * * *"
L2_1 = CollectDailyStatistics
L0_1(L1_1, L2_1)
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchAll
  L1_2 = "SELECT * FROM electus_admin_daily_stats ORDER BY timestamp"
  L0_2 = L0_2(L1_2)
  L1_2 = GetJobsLabels
  L1_2 = L1_2()
  L2_2 = 1
  L3_2 = #L0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L0_2[L5_2]
    L7_2 = json
    L7_2 = L7_2.decode
    L8_2 = L0_2[L5_2]
    L8_2 = L8_2.jobs
    L7_2 = L7_2(L8_2)
    L6_2.jobs = L7_2
    L6_2 = 1
    L7_2 = L0_2[L5_2]
    L7_2 = L7_2.jobs
    L7_2 = #L7_2
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = L0_2[L5_2]
      L10_2 = L10_2.jobs
      L10_2 = L10_2[L9_2]
      L11_2 = L0_2[L5_2]
      L11_2 = L11_2.jobs
      L11_2 = L11_2[L9_2]
      L11_2 = L11_2.job
      L11_2 = L1_2[L11_2]
      L11_2 = L11_2.label
      L10_2.label = L11_2
    end
    L6_2 = L0_2[L5_2]
    L7_2 = json
    L7_2 = L7_2.decode
    L8_2 = L0_2[L5_2]
    L8_2 = L8_2.items
    L7_2 = L7_2(L8_2)
    L6_2.items = L7_2
    L6_2 = 1
    L7_2 = L0_2[L5_2]
    L7_2 = L7_2.items
    L7_2 = #L7_2
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = L0_2[L5_2]
      L10_2 = L10_2.items
      L10_2 = L10_2[L9_2]
      L11_2 = GetItemLabel
      L12_2 = L0_2[L5_2]
      L12_2 = L12_2.items
      L12_2 = L12_2[L9_2]
      L12_2 = L12_2.item
      L11_2 = L11_2(L12_2)
      L10_2.label = L11_2
    end
  end
  return L0_2
end
GetDailyStatistics = L0_1
function L0_1()
  local L0_2, L1_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchAll
  L1_2 = "SELECT players, timestamp FROM electus_admin_daily_stats WHERE DATE(timestamp) = CURDATE() ORDER BY timestamp"
  L0_2 = L0_2(L1_2)
  return L0_2
end
GetTodaysPlayerCount = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchAll
  L1_2 = "SELECT * FROM electus_admin_weekly_stats ORDER BY timestamp"
  L0_2 = L0_2(L1_2)
  L1_2 = 1
  L2_2 = #L0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_2[L4_2]
    L6_2 = json
    L6_2 = L6_2.decode
    L7_2 = L0_2[L4_2]
    L7_2 = L7_2.jobs
    L6_2 = L6_2(L7_2)
    L5_2.jobs = L6_2
    L5_2 = L0_2[L4_2]
    L6_2 = json
    L6_2 = L6_2.decode
    L7_2 = L0_2[L4_2]
    L7_2 = L7_2.items
    L6_2 = L6_2(L7_2)
    L5_2.items = L6_2
  end
  return L0_2
end
GetWeeklyStatistics = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = MySQL
  L0_2 = L0_2.Sync
  L0_2 = L0_2.fetchAll
  L1_2 = "SELECT * FROM electus_admin_monthly_stats ORDER BY timestamp"
  L0_2 = L0_2(L1_2)
  L1_2 = 1
  L2_2 = #L0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_2[L4_2]
    L6_2 = json
    L6_2 = L6_2.decode
    L7_2 = L0_2[L4_2]
    L7_2 = L7_2.jobs
    L6_2 = L6_2(L7_2)
    L5_2.jobs = L6_2
    L5_2 = L0_2[L4_2]
    L6_2 = json
    L6_2 = L6_2.decode
    L7_2 = L0_2[L4_2]
    L7_2 = L7_2.items
    L6_2 = L6_2(L7_2)
    L5_2.items = L6_2
  end
  return L0_2
end
GetMonthlyStatistics = L0_1
L0_1 = exports
L1_1 = "GetTodaysPlayerCount"
L2_1 = GetTodaysPlayerCount
L0_1(L1_1, L2_1)
