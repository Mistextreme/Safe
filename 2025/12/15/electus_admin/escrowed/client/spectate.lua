local L0_1, L1_1, L2_1
L0_1 = RegisterNetEvent
L1_1 = "electus_admin:requestSpectate"
function L2_1()
  local L0_2, L1_2
  L0_2 = SendReactMessage
  L1_2 = "gameStream:startRecording"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "setPeerId"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "electus_admin:setPeerId"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = {}
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "electus_admin:stopRecording"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = SendReactMessage
  L2_2 = "gameStream:stopRecording"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
