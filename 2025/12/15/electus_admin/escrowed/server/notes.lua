local L0_1, L1_1, L2_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = HasPermission
  L5_2 = A0_2
  L6_2 = "manage_players.create_notes"
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = {}
    L5_2.error = "permission"
    return L5_2
  end
  L5_2 = AdminLog
  L6_2 = -1
  L7_2 = "info"
  L8_2 = "Note created for "
  L9_2 = A1_2
  L10_2 = " by "
  L11_2 = A0_2
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = "INSERT INTO electus_admin_notes (identifier, title, content) VALUES (?, ?, ?)"
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = A3_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = {}
    L6_2.error = "database_error"
    return L6_2
  end
  L6_2 = true
  return L6_2
end
CreateNote = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT * FROM electus_admin_notes WHERE identifier = ?"
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L7_2 = L1_2[L5_2]
    L7_2 = L7_2.note_id
    L6_2.id = L7_2
  end
  return L1_2
end
GetNotes = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = HasPermission
  L4_2 = A0_2
  L5_2 = "manage_players.delete_notes"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = {}
    L4_2.error = "permission"
    return L4_2
  end
  L4_2 = AdminLog
  L5_2 = -1
  L6_2 = "info"
  L7_2 = "Note deleted with ID "
  L8_2 = A2_2
  L9_2 = " by "
  L10_2 = A0_2
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = "DELETE FROM electus_admin_notes WHERE note_id = ? AND identifier = ?"
  L6_2 = {}
  L7_2 = A2_2
  L8_2 = A1_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = {}
    L5_2.error = "database_error"
    return L5_2
  end
  L5_2 = true
  return L5_2
end
DeleteNote = L0_1
L0_1 = exports
L1_1 = "CreateNote"
L2_1 = CreateNote
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "GetNotes"
L2_1 = GetNotes
L0_1(L1_1, L2_1)
L0_1 = exports
L1_1 = "DeleteNote"
L2_1 = DeleteNote
L0_1(L1_1, L2_1)
