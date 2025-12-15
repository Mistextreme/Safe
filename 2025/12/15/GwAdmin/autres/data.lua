local Character = {}
local ReportClient = {}
local LastReportTaken = {}
local LastSetAccountIdentifier = nil
local Bullets = {}
local GamerTags = {}
local SkinIndexTable = {}

local RankData = {}
RankData.permissions = {}
RankData.rankName = ""
RankData.rankColor = ""

local LastSkinDraw = nil
local PlayerServer = {}
local PlayerServerOffline = {}
local ButtonListData = {}

local IsPedCreate = false
local EntityPreview = nil
local MenuPlayersOpen = false

-- Populate SkinIndexTable with skin names and values
for i = 0, 700, 1 do
  table.insert(SkinIndexTable, { Name = "skin " .. i, Value = i })
end

-- Function to create and display a ped preview of a skin
local function CreatePedPreview(skinId)
  -- Exit if skinId is nil
  if not skinId then
    return
  end

  -- Exit if skinId is the same as the last drawn skin
  if skinId == LastSkinDraw then
    return
  end

  Citizen.CreateThread(function()
    LastSkinDraw = skinId

    -- Delete existing entity preview if it exists
    if DoesEntityExist(EntityPreview) then
      DeleteEntity(EntityPreview)
    end

    IsPedCreate = true
    local models = { "mp_f_freemode_01", "mp_m_freemode_01" }
    local modelName = models[GetSex(skinId)]
    local modelHash = GetHashKey(modelName)

    -- Request the model and wait for it to load
    RequestModel(modelHash)
    local timeout = 1000
    while not HasModelLoaded(modelHash) and timeout > 0 do
      Wait(0)
      timeout = timeout - 1
      if timeout == 0 then
        return
      end
    end

    -- Create the ped
    local spawnPosition = vector3(0, 0, 0)
    local ped = CreatePed(4, modelHash, spawnPosition.x, spawnPosition.y, spawnPosition.z - 0.98, 0.0, false, false)

    -- Apply the skin to the ped
    while true do
      if ApplyPlayerSkinToPed(ped, skinId) then
        break
      end
      Citizen.Wait(0)
    end

    -- Set entity properties
    SetEntityCollision(ped, false, true)
    SetEntityInvincible(ped, true)
    NetworkSetEntityInvisibleToNetwork(ped, true)
    SetEntityCanBeDamaged(ped, false)
    SetBlockingOfNonTemporaryEvents(ped, true)

    EntityPreview = ped

    -- Position the ped in front of the menu
    local positions = {}
    for i = 1, 10, 1 do
      if not MenuPlayersOpen then
        break
      end
      local menuPositionX, menuPositionY = GetWorldCoordFromScreenCoord(0.30035417461395, 0.487036895752)
      if clientGetCache("gw-menuPositionX") == 1 then
        menuPositionX, menuPositionY = GetWorldCoordFromScreenCoord(0.30035417461395, 0.487036895752)
      else
        menuPositionX, menuPositionY = GetWorldCoordFromScreenCoord(0.67035417461395, 0.487036895752)
      end
      local finalPositionX = menuPositionX + menuPositionY * 4.0
      local cameraRotation = GetGameplayCamRot(2)

      positions[i] = finalPositionX

      -- Calculate average position
      local averagePosition = vector3(0, 0, 0)
      for index, position in ipairs(positions) do
        averagePosition = averagePosition + position
      end
      averagePosition = averagePosition / 10

      -- Set the entity's heading and rotation
      SetEntityHeading(ped, cameraRotation.z + 180.0)
      SetEntityRotation(ped, -cameraRotation.x, 0, cameraRotation.z + 180.0, 2, true)
      SetEntityCoordsNoOffset(ped, averagePosition.x, averagePosition.y, averagePosition.z, true, true, true)

      Citizen.Wait(0)
    end
  end)
end

local CreatePeds = CreatePedPreview

-- Register events if illenium-appearance is running
if GetResourceState("illenium-appearance") == "started" then
  RegisterNetEvent("skinchanger:change")
  AddEventHandler("skinchanger:change", function(componentId, drawableId)
    local componentMap = {
      tshirt = 8,
      pants = 4,
      shoes = 6,
      bproof = 9,
      chain = 7,
      arms = 3,
      torso = 11,
      bags = 5,
      mask = 1
    }

    local propMap = {
      bracelets = 7,
      helmet = 0,
      glasses = 1,
      watches = 6,
      ears = 2
    }

    local component = componentMap[componentId:gsub("_1", ""):gsub("_2", "")]
    local prop = propMap[componentId:gsub("_1", ""):gsub("_2", "")]
    local ped = PlayerPedId()
    local appearance = exports["illenium-appearance"]:getPedAppearance(ped)
    local components = appearance.components
    local props = appearance.props

    if component then
      for _, comp in pairs(components) do
        if comp.component_id == component then
          if componentId:find("_1") or componentId == componentId:gsub("_1", ""):gsub("_2", "") then
            comp.drawable = drawableId
          elseif componentId:find("_2") then
            comp.texture = drawableId
          end
          exports["illenium-appearance"]:setPedComponent(ped, comp)
        end
      end
    elseif prop then
      for _, propData in pairs(props) do
        if propData.prop_id == prop then
          if componentId:find("_1") or componentId == componentId:gsub("_1", ""):gsub("_2", "") then
            propData.drawable = drawableId
            IsPedCreate = drawableId
          elseif componentId:find("_2") then
            propData.texture = drawableId
          end
          local var2 = IsPedCreate
          propData.drawable = var2
          exports["illenium-appearance"]:setPedProp(ped, propData)
        end
      end
    end
  end)
end

RegisterNetEvent("setPedComponent")
local function SetPlayerPedComponent(componentData)
  local ped = PlayerPedId()
  exports["illenium-appearance"]:setPedComponent(ped, componentData)
end
AddEventHandler("setPedComponent", SetPlayerPedComponent)

RegisterNetEvent("setPedProp")
local function SetPlayerPedProp(propData)
  local ped = PlayerPedId()
  exports["illenium-appearance"]:setPedProp(ped, propData)
end
AddEventHandler("setPedProp", SetPlayerPedProp)

RegisterNetEvent("savePlayer")
local function SavePlayerAppearance()
  local ped = PlayerPedId()
  local appearance = exports["illenium-appearance"]:getPedAppearance(ped)
  TriggerServerEvent("illenium-appearance:server:saveAppearance", appearance)
end
AddEventHandler("savePlayer", SavePlayerAppearance)

-- Vehicle handling parameter descriptions
local handlingParameterDescriptions = {}
handlingParameterDescriptions[1] = { name = "fMass", desc = "Poids du véhicule en kilogrammes." }
handlingParameterDescriptions[2] = { name = "fInitialDragCoeff", desc = "Coefficient de traînée initial affectant la résistance aérodynamique du véhicule." }
handlingParameterDescriptions[3] = { name = "fPercentSubmerged", desc = "Pourcentage de la hauteur du véhicule dans l'eau avant qu'il ne flotte." }
handlingParameterDescriptions[4] = { name = "vecCentreOfMassOffset", desc = "Décalage du centre de masse du véhicule dans l'espace 3D." }
handlingParameterDescriptions[5] = { name = "vecInertiaMultiplier", desc = "Multiplicateur affectant l'inertie du véhicule." }
handlingParameterDescriptions[6] = { name = "fDriveBiasFront", desc = "Détermine si le véhicule est à traction avant, arrière ou intégrale." }
handlingParameterDescriptions[7] = { name = "nInitialDriveGears", desc = "Nombre de vitesses avant dans la transmission du véhicule." }
handlingParameterDescriptions[8] = { name = "fInitialDriveForce", desc = "Force de traction initiale appliquée aux roues du véhicule." }
handlingParameterDescriptions[9] = { name = "fDriveInertia", desc = "Inertie affectant l'accélération du véhicule." }
handlingParameterDescriptions[10] = { name = "fClutchChangeRateScaleUpShift", desc = "Taux de changement d'embrayage lors des montées en vitesse." }
handlingParameterDescriptions[11] = { name = "fClutchChangeRateScaleDownShift", desc = "Taux de changement d'embrayage lors des descentes en vitesse." }
handlingParameterDescriptions[12] = { name = "fInitialDriveMaxFlatVel", desc = "Vitesse maximale en ligne droite du véhicule." }
handlingParameterDescriptions[13] = { name = "fBrakeForce", desc = "Force appliquée par les freins." }
handlingParameterDescriptions[14] = { name = "fBrakeBiasFront", desc = "Répartition de freinage vers les roues avant." }
handlingParameterDescriptions[15] = { name = "fHandBrakeForce", desc = "Force appliquée par le frein à main." }
handlingParameterDescriptions[16] = { name = "fSteeringLock", desc = "Angle de braquage maximal." }
handlingParameterDescriptions[17] = { name = "fTractionCurveMax", desc = "Courbe maximale de traction du véhicule." }
handlingParameterDescriptions[18] = { name = "fTractionCurveMin", desc = "Courbe minimale de traction du véhicule." }
handlingParameterDescriptions[19] = { name = "fTractionCurveLateral", desc = "Courbe de traction latérale affectant les virages." }
handlingParameterDescriptions[20] = { name = "fTractionSpringDeltaMax", desc = "Delta maximal du ressort de traction." }
handlingParameterDescriptions[21] = { name = "fLowSpeedTractionLossMult", desc = "Multiplicateur pour la perte de traction à basse vitesse." }
handlingParameterDescriptions[22] = { name = "fCamberStiffnesss", desc = "Rigidité de l'angle de carrossage." }
handlingParameterDescriptions[23] = { name = "fTractionBiasFront", desc = "Répartition de la traction vers les roues avant." }
handlingParameterDescriptions[24] = { name = "fTractionLossMult", desc = "Multiplicateur de perte de traction globale." }
handlingParameterDescriptions[25] = { name = "fSuspensionForce", desc = "Force appliquée par le système de suspension." }
handlingParameterDescriptions[26] = { name = "fSuspensionCompDamp", desc = "Amortissement de compression de la suspension." }
handlingParameterDescriptions[27] = { name = "fSuspensionReboundDamp", desc = "Amortissement de rebond de la suspension." }
handlingParameterDescriptions[28] = { name = "fSuspensionUpperLimit", desc = "Limite supérieure du débattement de suspension." }
handlingParameterDescriptions[29] = { name = "fSuspensionLowerLimit", desc = "Limite inférieure du débattement de suspension." }
handlingParameterDescriptions[30] = { name = "fSuspensionRaise", desc = "Hauteur de relèvement de la suspension." }
handlingParameterDescriptions[31] = { name = "fSuspensionBiasFront", desc = "Répartition de la suspension vers les roues avant." }
handlingParameterDescriptions[32] = { name = "fTractionCurveMax", desc = "Courbe maximale de traction (entrée en double)." }
handlingParameterDescriptions[33] = { name = "fAntiRollBarForce", desc = "Force appliquée par la barre anti-roulis." }
handlingParameterDescriptions[34] = { name = "fAntiRollBarBiasFront", desc = "Répartition de la barre anti-roulis vers les roues avant." }
handlingParameterDescriptions[35] = { name = "fRollCentreHeightFront", desc = "Hauteur du centre de roulis à l'avant." }
handlingParameterDescriptions[36] = { name = "fRollCentreHeightRear", desc = "Hauteur du centre de roulis à l'arrière." }
handlingParameterDescriptions[37] = { name = "fCollisionDamageMult", desc = "Multiplicateur des dégâts causés par les collisions." }
handlingParameterDescriptions[38] = { name = "fWeaponDamageMult", desc = "Multiplicateur des dégâts causés par les armes." }
handlingParameterDescriptions[39] = { name = "fDeformationDamageMult", desc = "Multiplicateur des dégâts causés par la déformation." }
handlingParameterDescriptions[40] = { name = "fEngineDamageMult", desc = "Multiplicateur des dégâts infligés au moteur." }
handlingParameterDescriptions[41] = { name = "fPetrolTankVolume", desc = "Volume du réservoir de carburant." }
handlingParameterDescriptions[42] = { name = "fOilVolume", desc = "Volume du réservoir d'huile." }
handlingParameterDescriptions[43] = { name = "fSeatOffsetDistX", desc = "Décalage de la distance du siège sur l'axe X." }
handlingParameterDescriptions[44] = { name = "fSeatOffsetDistY", desc = "Décalage de la distance du siège sur l'axe Y." }
handlingParameterDescriptions[45] = { name = "fSeatOffsetDistZ", desc = "Décalage de la distance du siège sur l'axe Z." }
handlingParameterDescriptions[46] = { name = "nMonetaryValue", desc = "Valeur monétaire du véhicule." }
handlingParameterDescriptions[47] = { name = "strModelFlags", desc = "Drapeaux définissant les attributs du modèle de véhicule." }
handlingParameterDescriptions[48] = { name = "strHandlingFlags", desc = "Drapeaux définissant les attributs de maniement du véhicule." }
handlingParameterDescriptions[49] = { name = "strDamageFlags", desc = "Drapeaux définissant les attributs de dommages du véhicule." }
handlingParameterDescriptions[50] = { name = "fBackEndPopUpCarImpulseMult", desc = "Multiplicateur d'impulsion lors du soulèvement de l'arrière du véhicule." }

local handlingParameterDescriptions2 = {}
handlingParameterDescriptions2.name = "fBackEndPopUpBuildingImpulseMult"
-- Vehicle Handling Variables Descriptions

local handlingVariables = {}

-- Part 1: Vehicle Handling Properties
local backEndPopUpCarImpulseMult = {}
backEndPopUpCarImpulseMult.name = "fBackEndPopUpCarImpulseMult"
backEndPopUpCarImpulseMult.desc = "Multiplicateur d'impulsion lors du soulèvement de l'arrière en collision avec des bâtiments."

local backEndPopUpMaxDeltaSpeed = {}
backEndPopUpMaxDeltaSpeed.name = "fBackEndPopUpMaxDeltaSpeed"
backEndPopUpMaxDeltaSpeed.desc = "Vitesse maximale de soulèvement de l'arrière."

local camberFront = {}
camberFront.name = "fCamberFront"
camberFront.desc = "Angle de carrossage des roues avant."

local camberRear = {}
camberRear.name = "fCamberRear"
camberRear.desc = "Angle de carrossage des roues arrière."

local castor = {}
castor.name = "fCastor"
castor.desc = "Angle de chasse de la direction."

local toeFront = {}
toeFront.name = "fToeFront"
toeFront.desc = "Angle de pincement des roues avant."

local toeRear = {}
toeRear.name = "fToeRear"
toeRear.desc = "Angle de pincement des roues arrière."

local engineResistance = {}
engineResistance.name = "fEngineResistance"
engineResistance.desc = "Résistance appliquée par le moteur."

local advancedFlags = {}
advancedFlags.name = "strAdvancedFlags"
advancedFlags.desc = "Drapeaux avancés pour les propriétés de maniement."

local thrust = {}
thrust.name = "fThrust"
thrust.desc = "Poussée appliquée par le système de propulsion du véhicule."

local thrustFallOff = {}
thrustFallOff.name = "fThrustFallOff"
thrustFallOff.desc = "Taux de réduction de la poussée."

local thrustVectoring = {}
thrustVectoring.name = "fThrustVectoring"
thrustVectoring.desc = "Vectorisation de la poussée pour un meilleur contrôle."

local yawMult = {}
yawMult.name = "fYawMult"
yawMult.desc = "Multiplicateur de contrôle du lacet."

local yawStabilise = {}
yawStabilise.name = "fYawStabilise"
yawStabilise.desc = "Résistance au lacet, augmente avec la vitesse."

local sideSlipMult = {}
sideSlipMult.name = "fSideSlipMult"
sideSlipMult.desc = "Résistance latérale, augmente avec la vitesse."

local rollMult = {}
rollMult.name = "fRollMult"
rollMult.desc = "Force d'inclinaison, augmente avec la vitesse."

local rollStabilise = {}
rollStabilise.name = "fRollStabilise"
rollStabilise.desc = "Résistance à l'inclinaison, augmente avec la vitesse."

local pitchMult = {}
pitchMult.name = "fPitchMult"
pitchMult.desc = "Multiplicateur de contrôle du tangage."

local pitchStabilise = {}
pitchStabilise.name = "fPitchStabilise"
pitchStabilise.desc = "Stabilisation des mouvements de tangage."

local formLiftMult = {}
formLiftMult.name = "fFormLiftMult"
formLiftMult.desc = "Multiplicateur de la portance en fonction de la forme du véhicule."

local attackLiftMult = {}
attackLiftMult.name = "fAttackLiftMult"
attackLiftMult.desc = "Multiplicateur de portance lors des manœuvres d'attaque."

local attackDiveMult = {}
attackDiveMult.name = "fAttackDiveMult"
attackDiveMult.desc = "Multiplicateur pour la plongée lors des manœuvres d'attaque."

local gearDownDragV = {}
gearDownDragV.name = "fGearDownDragV"
gearDownDragV.desc = "Coefficient de traînée lorsque le train d'atterrissage ou les volets sont abaissés."

local gearDownLiftMult = {}
gearDownLiftMult.name = "fGearDownLiftMult"
gearDownLiftMult.desc = "Multiplicateur de portance lorsque le train d'atterrissage ou les volets sont abaissés."

local windMult = {}
windMult.name = "fWindMult"
windMult.desc = "Multiplicateur de résistance au vent."

local moveRes = {}
moveRes.name = "fMoveRes"
moveRes.desc = "Résistance aux forces de déplacement."

local turnRes = {}
turnRes.name = "vecTurnRes"
turnRes.desc = "Vecteur de résistance au virage."

local speedRes = {}
speedRes.name = "vecSpeedRes"
speedRes.desc = "Vecteur de résistance à la vitesse."

local gearDoorFrontOpen = {}
gearDoorFrontOpen.name = "fGearDoorFrontOpen"
gearDoorFrontOpen.desc = "Force d'ouverture des portes du train avant."

local gearDoorRearOpen = {}
gearDoorRearOpen.name = "fGearDoorRearOpen"
gearDoorRearOpen.desc = "Force d'ouverture des portes du train arrière."

local gearDoorRearOpen2 = {}
gearDoorRearOpen2.name = "fGearDoorRearOpen2"
gearDoorRearOpen2.desc = "Force supplémentaire pour ouvrir les portes du train arrière."

local gearDoorRearMOpen = {}
gearDoorRearMOpen.name = "fGearDoorRearMOpen"
gearDoorRearMOpen.desc = "Force pour ouvrir manuellement les portes du train arrière."

local turbulenceMagnitudeMax = {}
turbulenceMagnitudeMax.name = "fTurbulenceMagnitudeMax"
turbulenceMagnitudeMax.desc = "Amplitude maximale des turbulences."

local turbulenceForceMulti = {}
turbulenceForceMulti.name = "fTurbulenceForceMulti"
turbulenceForceMulti.desc = "Multiplicateur de la force des turbulences."

local turbulenceRollTorqueMulti = {}
turbulenceRollTorqueMulti.name = "fTurbulenceRollTorqueMulti"
turbulenceRollTorqueMulti.desc = "Multiplicateur du couple de roulis dû aux turbulences."

local turbulencePitchTorqueMulti = {}
turbulencePitchTorqueMulti.name = "fTurbulencePitchTorqueMulti"
turbulencePitchTorqueMulti.desc = "Multiplicateur du couple de tangage dû aux turbulences."

local bodyDamageControlEffectMult = {}
bodyDamageControlEffectMult.name = "fBodyDamageControlEffectMult"
bodyDamageControlEffectMult.desc = "Multiplicateur des effets de contrôle des dommages à la carrosserie."

local inputSensitivityForDifficulty = {}
inputSensitivityForDifficulty.name = "fInputSensitivityForDifficulty"
inputSensitivityForDifficulty.desc = "Sensibilité des commandes en fonction du niveau de difficulté."

local onGroundYawBoostSpeedPeak = {}
onGroundYawBoostSpeedPeak.name = "fOnGroundYawBoostSpeedPeak"
onGroundYawBoostSpeedPeak.desc = "Vitesse maximale pour le boost de lacet au sol."

local onGroundYawBoostSpeedCap = {}
onGroundYawBoostSpeedCap.name = "fOnGroundYawBoostSpeedCap"
onGroundYawBoostSpeedCap.desc = "Limitation de vitesse pour le boost de lacet au sol."

local engineOffGlideMulti = {}
engineOffGlideMulti.name = "fEngineOffGlideMulti"
engineOffGlideMulti.desc = "Multiplicateur de l'effet de glisse lorsque le moteur est éteint."

local thrustFallOffDuplicate = {}
thrustFallOffDuplicate.name = "fThrustFallOff"
thrustFallOffDuplicate.desc = "Taux de réduction de la poussée (entrée en double)."

local backEndPopUpCarImpulseMultDuplicate = {}
backEndPopUpCarImpulseMultDuplicate.name = "fBackEndPopUpCarImpulseMult"
backEndPopUpCarImpulseMultDuplicate.desc = "Multiplicateur pour l'impulsion arrière lors d'un soulèvement (entrée en double)."

local leanFwdCOMMult = {}
leanFwdCOMMult.name = "fLeanFwdCOMMult"
leanFwdCOMMult.desc = "Multiplicateur du centre de masse lors de l'inclinaison vers l'avant."

local leanFwdForceMult = {}
leanFwdForceMult.name = "fLeanFwdForceMult"
leanFwdForceMult.desc = "Multiplicateur de force lors de l'inclinaison vers l'avant."

local leanBakCOMMult = {}
leanBakCOMMult.name = "fLeanBakCOMMult"
leanBakCOMMult.desc = "Multiplicateur du centre de masse lors de l'inclinaison vers l'arrière."

local leanBakForceMult = {}
leanBakForceMult.name = "fLeanBakForceMult"
leanBakForceMult.desc = "Multiplicateur de force lors de l'inclinaison vers l'arrière."

local maxBankAngle = {}
maxBankAngle.name = "fMaxBankAngle"
maxBankAngle.desc = "Angle maximal d'inclinaison du véhicule."

local fullAnimAngle = {}
fullAnimAngle.name = "fFullAnimAngle"
fullAnimAngle.desc = "Angle complet de l'animation du véhicule."

local desLeanReturnFrac = {}
desLeanReturnFrac.name = "fDesLeanReturnFrac"
desLeanReturnFrac.desc = "Fraction de retour d'inclinaison désirée."

handlingVariables[51] = backEndPopUpCarImpulseMult
handlingVariables[52] = backEndPopUpMaxDeltaSpeed
handlingVariables[53] = camberFront
handlingVariables[54] = camberRear
handlingVariables[55] = castor
handlingVariables[56] = toeFront
handlingVariables[57] = toeRear
handlingVariables[58] = engineResistance
handlingVariables[59] = advancedFlags
handlingVariables[60] = thrust
handlingVariables[61] = thrustFallOff
handlingVariables[62] = thrustVectoring
handlingVariables[63] = yawMult
handlingVariables[64] = yawStabilise
handlingVariables[65] = sideSlipMult
handlingVariables[66] = rollMult
handlingVariables[67] = rollStabilise
handlingVariables[68] = pitchMult
handlingVariables[69] = pitchStabilise
handlingVariables[70] = formLiftMult
handlingVariables[71] = attackLiftMult
handlingVariables[72] = attackDiveMult
handlingVariables[73] = gearDownDragV
handlingVariables[74] = gearDownLiftMult
handlingVariables[75] = windMult
handlingVariables[76] = moveRes
handlingVariables[77] = turnRes
handlingVariables[78] = speedRes
handlingVariables[79] = gearDoorFrontOpen
handlingVariables[80] = gearDoorRearOpen
handlingVariables[81] = gearDoorRearOpen2
handlingVariables[82] = gearDoorRearMOpen
handlingVariables[83] = turbulenceMagnitudeMax
handlingVariables[84] = turbulenceForceMulti
handlingVariables[85] = turbulenceRollTorqueMulti
handlingVariables[86] = turbulencePitchTorqueMulti
handlingVariables[87] = bodyDamageControlEffectMult
handlingVariables[88] = inputSensitivityForDifficulty
handlingVariables[89] = onGroundYawBoostSpeedPeak
handlingVariables[90] = onGroundYawBoostSpeedCap
handlingVariables[91] = engineOffGlideMulti
handlingVariables[92] = thrustFallOffDuplicate
handlingVariables[93] = backEndPopUpCarImpulseMultDuplicate
handlingVariables[94] = leanFwdCOMMult
handlingVariables[95] = leanFwdForceMult
handlingVariables[96] = leanBakCOMMult
handlingVariables[97] = leanBakForceMult
handlingVariables[98] = maxBankAngle
handlingVariables[99] = fullAnimAngle
handlingVariables[100] = desLeanReturnFrac

-- Part 2: Motorcycle Handling Properties
local stickLeanMult = {}
stickLeanMult.name = "fStickLeanMult"
stickLeanMult.desc = "Multiplicateur de l'effet d'inclinaison du guidon."

local brakingStabilityMult = {}
brakingStabilityMult.name = "fBrakingStabilityMult"
brakingStabilityMult.desc = "Multiplicateur de stabilité lors du freinage."

local inAirSteerMult = {}
inAirSteerMult.name = "fInAirSteerMult"
inAirSteerMult.desc = "Multiplicateur de direction en l'air."

local wheelieBalancePoint = {}
wheelieBalancePoint.name = "fWheelieBalancePoint"
wheelieBalancePoint.desc = "Point d'équilibre pour les wheelies."

local stoppieBalancePoint = {}
stoppieBalancePoint.name = "fStoppieBalancePoint"
stoppieBalancePoint.desc = "Point d'équilibre pour les stoppies."

local wheelieSteerMult = {}
wheelieSteerMult.name = "fWheelieSteerMult"
wheelieSteerMult.desc = "Multiplicateur de direction pendant les wheelies."

local rearBalanceMult = {}
rearBalanceMult.name = "fRearBalanceMult"
rearBalanceMult.desc = "Multiplicateur de l'équilibre arrière."

local frontBalanceMult = {}
frontBalanceMult.name = "fFrontBalanceMult"
frontBalanceMult.desc = "Multiplicateur de l'équilibre avant."

local bikeGroundSideFrictionMult = {}
bikeGroundSideFrictionMult.name = "fBikeGroundSideFrictionMult"
bikeGroundSideFrictionMult.desc = "Multiplicateur de la friction latérale au sol pour la moto."

local bikeWheelGroundSideFrictionMult = {}
bikeWheelGroundSideFrictionMult.name = "fBikeWheelGroundSideFrictionMult"
bikeWheelGroundSideFrictionMult.desc = "Multiplicateur de la friction latérale des roues au sol pour la moto."

local bikeOnStandLeanAngle = {}
bikeOnStandLeanAngle.name = "fBikeOnStandLeanAngle"
bikeOnStandLeanAngle.desc = "Angle d'inclinaison de la moto lorsqu'elle est sur sa béquille."

local bikeOnStandSteerAngle = {}
bikeOnStandSteerAngle.name = "fBikeOnStandSteerAngle"
bikeOnStandSteerAngle.desc = "Angle de direction de la moto lorsqu'elle est sur sa béquille."

local jumpForce = {}
jumpForce.name = "fJumpForce"
jumpForce.desc = "Force appliquée lors des sauts."

handlingVariables[101] = stickLeanMult
handlingVariables[102] = brakingStabilityMult
handlingVariables[103] = inAirSteerMult
handlingVariables[104] = wheelieBalancePoint
handlingVariables[105] = stoppieBalancePoint
handlingVariables[106] = wheelieSteerMult
handlingVariables[107] = rearBalanceMult
handlingVariables[108] = frontBalanceMult
handlingVariables[109] = bikeGroundSideFrictionMult
handlingVariables[110] = bikeWheelGroundSideFrictionMult
handlingVariables[111] = bikeOnStandLeanAngle
handlingVariables[112] = bikeOnStandSteerAngle
handlingVariables[113] = jumpForce

-- Character Customization Keys
local characterKeys = {}

characterKeys[1] = "face_md_weight"
characterKeys[2] = "skin_md_weight"
characterKeys[3] = "mom"
characterKeys[4] = "dad"
characterKeys[5] = "nose_1"
characterKeys[6] = "nose_2"
characterKeys[7] = "nose_3"
characterKeys[8] = "nose_4"
characterKeys[9] = "nose_5"
characterKeys[10] = "nose_6"
characterKeys[11] = "eyebrows_5"
characterKeys[12] = "eyebrows_6"
characterKeys[13] = "cheeks_1"
characterKeys[14] = "cheeks_2"
characterKeys[15] = "cheeks_3"
characterKeys[16] = "eye_squint"
characterKeys[17] = "lip_thickness"
characterKeys[18] = "jaw_1"
characterKeys[19] = "jaw_2"
characterKeys[20] = "chin_1"
characterKeys[21] = "chin_2"
characterKeys[22] = "chin_3"
characterKeys[23] = "chin_4"
characterKeys[24] = "neck_thickness"
characterKeys[25] = "hair_color_1"
characterKeys[26] = "hair_color_2"
characterKeys[27] = "age_1"
characterKeys[28] = "age_2"
characterKeys[29] = "blemishes_1"
characterKeys[30] = "blemishes_2"
characterKeys[31] = "beard_1"
characterKeys[32] = "beard_2"
characterKeys[33] = "eye_color"
characterKeys[34] = "eyebrows_1"
characterKeys[35] = "eyebrows_2"
characterKeys[36] = "makeup_1"
characterKeys[37] = "makeup_2"
characterKeys[38] = "lipstick_1"
characterKeys[39] = "lipstick_2"
characterKeys[40] = "hair_1"
characterKeys[41] = "hair_2"
characterKeys[42] = "beard_3"
characterKeys[43] = "beard_4"
characterKeys[44] = "eyebrows_3"
characterKeys[45] = "eyebrows_4"
characterKeys[46] = "makeup_3"
characterKeys[47] = "makeup_4"
characterKeys[48] = "lipstick_3"
characterKeys[49] = "lipstick_4"
characterKeys[50] = "blush_1"
characterKeys[51] = "blush_2"
characterKeys[52] = "blush_3"
characterKeys[53] = "complexion_1"
characterKeys[54] = "complexion_2"
characterKeys[55] = "sun_1"
characterKeys[56] = "sun_2"
characterKeys[57] = "moles_1"
characterKeys[58] = "moles_2"
characterKeys[59] = "chest_1"
characterKeys[60] = "chest_2"
characterKeys[61] = "chest_3"
characterKeys[62] = "bodyb_1"
characterKeys[63] = "bodyb_2"
characterKeys[64] = "bodyb_3"
characterKeys[65] = "bodyb_4"
characterKeys[66] = "ears_1"
characterKeys[67] = "ears_2"
characterKeys[68] = "tshirt_1"
characterKeys[69] = "tshirt_2"
characterKeys[70] = "torso_1"
characterKeys[71] = "torso_2"
characterKeys[72] = "arms"
characterKeys[73] = "arms_2"
characterKeys[74] = "decals_1"
characterKeys[75] = "decals_2"
characterKeys[76] = "pants_1"
characterKeys[77] = "pants_2"
characterKeys[78] = "shoes_1"
characterKeys[79] = "shoes_2"
characterKeys[80] = "mask_1"
characterKeys[81] = "mask_2"
characterKeys[82] = "bproof_1"
characterKeys[83] = "bproof_2"
characterKeys[84] = "chain_1"
characterKeys[85] = "chain_2"
characterKeys[86] = "bags_1"
characterKeys[87] = "bags_2"
characterKeys[88] = "helmet_1"
characterKeys[89] = "helmet_2"
characterKeys[90] = "glasses_1"
characterKeys[91] = "glasses_2"
characterKeys[92] = "watches_1"
characterKeys[93] = "watches_2"
characterKeys[94] = "bracelets_1"
characterKeys[95] = "bracelets_2"

-- Vehicle Names List
local vehicleNames = {}

-- Compacts
vehicleNames[1] = "ASBO"
vehicleNames[2] = "BLISTA"
vehicleNames[3] = "BRIOSO"
vehicleNames[4] = "BRIOSO2"
vehicleNames[5] = "CLUB"
vehicleNames[6] = "DILETTANTE"
vehicleNames[7] = "DILETTANTE2"
vehicleNames[8] = "ISSI2"
vehicleNames[9] = "ISSI3"
vehicleNames[10] = "ISSI4"
vehicleNames[11] = "ISSI5"
vehicleNames[12] = "ISSI6"
vehicleNames[13] = "KANJO"
vehicleNames[14] = "PANTO"
vehicleNames[15] = "PRAIRIE"
vehicleNames[16] = "RHAPSODY"
vehicleNames[17] = "WEEVIL"

-- Sedans
vehicleNames[18] = "ASEA"
vehicleNames[19] = "ASEA2"
vehicleNames[20] = "ASTEROPE"
vehicleNames[21] = "COG55"
vehicleNames[22] = "COG552"
vehicleNames[23] = "COGNOSCENTI"
vehicleNames[24] = "COGNOSCENTI2"
vehicleNames[25] = "EMPEROR"
vehicleNames[26] = "EMPEROR2"
vehicleNames[27] = "EMPEROR3"
vehicleNames[28] = "FUGITIVE"
vehicleNames[29] = "GLENDALE"
vehicleNames[30] = "GLENDALE2"
vehicleNames[31] = "INGOT"
vehicleNames[32] = "INTRUDER"
vehicleNames[33] = "LIMO2"
vehicleNames[34] = "PREMIER"
vehicleNames[35] = "PRIMO"
vehicleNames[36] = "PRIMO2"
vehicleNames[37] = "REGINA"
vehicleNames[38] = "ROMERO"
vehicleNames[39] = "SCHAFTER2"
vehicleNames[40] = "SCHAFTER5"
vehicleNames[41] = "SCHAFTER6"
vehicleNames[42] = "STAFFORD"
vehicleNames[43] = "STANIER"
vehicleNames[44] = "STRATUM"
vehicleNames[45] = "STRETCH"
vehicleNames[46] = "SUPERD"
vehicleNames[47] = "SURGE"
vehicleNames[48] = "TAILGATER"
vehicleNames[49] = "TAILGATER2"
vehicleNames[50] = "WARRENER"
vehicleNames[51] = "WARRENER2"
vehicleNames[52] = "WASHINGTON"

-- SUVs
vehicleNames[53] = "BALLER"
vehicleNames[54] = "BALLER2"
vehicleNames[55] = "BALLER3"
vehicleNames[56] = "BALLER4"
vehicleNames[57] = "BALLER5"
vehicleNames[58] = "BALLER6"
vehicleNames[59] = "BJXL"
vehicleNames[60] = "CAVALCADE"
vehicleNames[61] = "CAVALCADE2"
vehicleNames[62] = "CONTENDER"
vehicleNames[63] = "DUBSTA"
vehicleNames[64] = "DUBSTA2"
vehicleNames[65] = "FQ2"
vehicleNames[66] = "GRANGER"
vehicleNames[67] = "GRESLEY"
vehicleNames[68] = "HABANERO"
vehicleNames[69] = "HUNTLEY"
vehicleNames[70] = "LANDSTALKER"
vehicleNames[71] = "LANDSTALKER2"
vehicleNames[72] = "MESA"
vehicleNames[73] = "MESA2"
vehicleNames[74] = "NOVAK"
vehicleNames[75] = "PATRIOT"
vehicleNames[76] = "PATRIOT2"
vehicleNames[77] = "RADI"
vehicleNames[78] = "REBLA"
vehicleNames[79] = "ROCOTO"
vehicleNames[80] = "SEMINOLE"
vehicleNames[81] = "SEMINOLE2"
vehicleNames[82] = "SERRANO"
vehicleNames[83] = "STREITER"
vehicleNames[84] = "SQUADDIE"
vehicleNames[85] = "TOROS"
vehicleNames[86] = "XLS"
vehicleNames[87] = "XLS2"

-- Coupes
vehicleNames[88] = "COGCABRIO"
vehicleNames[89] = "EXEMPLAR"
vehicleNames[90] = "F620"
vehicleNames[91] = "FELON"
vehicleNames[92] = "FELON2"
vehicleNames[93] = "JACKAL"
vehicleNames[94] = "PREVION"
vehicleNames[95] = "ORACLE"
vehicleNames[96] = "ORACLE2"
vehicleNames[97] = "SENTINEL"
vehicleNames[98] = "SENTINEL2"
vehicleNames[99] = "WINDSOR"
vehicleNames[100] = "WINDSOR2"
local vehicleList = {} -- Renamed L3_1 to vehicleList

-- Define all vehicle names here
local zion = "ZION" -- Renamed L4_1 to zion
local zion2 = "ZION2" -- Renamed L5_1 to zion2
local blade = "BLADE" -- Renamed L6_1 to blade
local buccaneer = "BUCCANEER" -- Renamed L7_1 to buccaneer
local buccaneer2 = "BUCCANEER2" -- Renamed L8_1 to buccaneer2
local chino = "CHINO" -- Renamed L9_1 to chino
local chino2 = "CHINO2" -- Renamed L10_1 to chino2
local clique = "CLIQUE" -- Renamed L11_1 to clique
local coquette3 = "COQUETTE3" -- Renamed L12_1 to coquette3
local deviant = "DEVIANT" -- Renamed L13_1 to deviant
local dominator = "DOMINATOR" -- Renamed L14_1 to dominator
local dominator2 = "DOMINATOR2" -- Renamed L15_1 to dominator2
local dominator3 = "DOMINATOR3" -- Renamed L16_1 to dominator3
local dominator4 = "DOMINATOR4" -- Renamed L17_1 to dominator4
local dominator5 = "DOMINATOR5" -- Renamed L18_1 to dominator5
local dominator6 = "DOMINATOR6" -- Renamed L19_1 to dominator6
local dominator7 = "DOMINATOR7" -- Renamed L20_1 to dominator7
local dominator8 = "DOMINATOR8" -- Renamed L21_1 to dominator8
local dukes = "DUKES" -- Renamed L22_1 to dukes
local dukes2 = "DUKES2" -- Renamed L23_1 to dukes2
local dukes3 = "DUKES3" -- Renamed L24_1 to dukes3
local ellie = "ELLIE" -- Renamed L25_1 to ellie
local faction = "FACTION" -- Renamed L26_1 to faction
local faction2 = "FACTION2" -- Renamed L27_1 to faction2
local faction3 = "FACTION3" -- Renamed L28_1 to faction3
local gauntlet = "GAUNTLET" -- Renamed L29_1 to gauntlet
local gauntlet2 = "GAUNTLET2" -- Renamed L30_1 to gauntlet2
local gauntlet3 = "GAUNTLET3" -- Renamed L31_1 to gauntlet3
local gauntlet4 = "GAUNTLET4" -- Renamed L32_1 to gauntlet4
local gauntlet5 = "GAUNTLET5" -- Renamed L33_1 to gauntlet5
local hermes = "HERMES" -- Renamed L34_1 to hermes
local hotknife = "HOTKNIFE" -- Renamed L35_1 to hotknife
local hustler = "HUSTLER" -- Renamed L36_1 to hustler
local impaler = "IMPALER" -- Renamed L37_1 to impaler
local impaler2 = "IMPALER2" -- Renamed L38_1 to impaler2
local impaler3 = "IMPALER3" -- Renamed L39_1 to impaler3
local impaler4 = "IMPALER4" -- Renamed L40_1 to impaler4
local imperator = "IMPERATOR" -- Renamed L41_1 to imperator
local imperator2 = "IMPERATOR2" -- Renamed L42_1 to imperator2
local imperator3 = "IMPERATOR3" -- Renamed L43_1 to imperator3
local lurcher = "LURCHER" -- Renamed L44_1 to lurcher
local manana2 = "MANANA2" -- Renamed L45_1 to manana2
local moonbeam = "MOONBEAM" -- Renamed L46_1 to moonbeam
local moonbeam2 = "MOONBEAM2" -- Renamed L47_1 to moonbeam2
local nightshade = "NIGHTSHADE" -- Renamed L48_1 to nightshade
local peyote2 = "PEYOTE2" -- Renamed L49_1 to peyote2
local phoenix = "PHOENIX" -- Renamed L50_1 to phoenix
local picador = "PICADOR" -- Renamed L51_1 to picador
local ratloader = "RATLOADER" -- Renamed L52_1 to ratloader
local ratloader2 = "RATLOADER2" -- Renamed L53_1 to ratloader2
local ruiner = "RUINER"
local ruiner2 = "RUINER2"
local ruiner3 = "RUINER3"
local sabreGT = "SABREGT"
local sabreGT2 = "SABREGT2"
local slamVan = "SLAMVAN"
local slamVan2 = "SLAMVAN2"
local slamVan3 = "SLAMVAN3"
local slamVan4 = "SLAMVAN4"
local slamVan5 = "SLAMVAN5"
local slamVan6 = "SLAMVAN6"
local stalion = "STALION"
local stalion2 = "STALION2"
local tampa = "TAMPA"
local tampa3 = "TAMPA3"
local tulip = "TULIP"
local vamos = "VAMOS"
local vigero = "VIGERO"
local virgo = "VIRGO"
local virgo2 = "VIRGO2"
local virgo3 = "VIRGO3"
local voodoo = "VOODOO"
local voodoo2 = "VOODOO2"
local yosemite = "YOSEMITE"
local yosemite2 = "YOSEMITE2"
local ardent = "ARDENT"
local btype = "BTYPE"
local btype2 = "BTYPE2"
local btype3 = "BTYPE3"
local casco = "CASCO"
local cheburek = "CHEBUREK"
local cheetah2 = "CHEETAH2"
local coquette2 = "COQUETTE2"
local deluxo = "DELUXO"
local dynasty = "DYNASTY"
local fagaloa = "FAGALOA"
local feltzer3 = "FELTZER3"
local gt500 = "GT500"
local infernus2 = "INFERNUS2"
local jb700 = "JB700"
local jb7002 = "JB7002"
local jester3 = "JESTER3"
local mamba = "MAMBA"
local manana = "MANANA"
local michelli = "MICHELLI"
local monroe = "MONROE"
local nebula = "NEBULA"
local peyote = "PEYOTE"
local peyote3 = "PEYOTE3"
local pigalle = "PIGALLE"
local rapidgt3 = "RAPIDGT3"
local retinue = "RETINUE"
local retinue2 = "RETINUE2"
local savestra = "SAVESTRA"
local stinger = "STINGER"
local stingerGT = "STINGERGT"
local stromberg = "STROMBERG"
local swinger = "SWINGER"
local torero = "TORERO"
local toreador = "TOREADOR"
local tornado = "TORNADO"
local tornado2 = "TORNADO2"
local tornado3 = "TORNADO3"
local tornado4 = "TORNADO4"
local tornado5 = "TORNADO5"
local tornado6 = "TORNADO6"
local turismo2 = "TURISMO2"
local viseris = "VISERIS"
local z190 = "Z190"
local zion3 = "ZION3"
local ztype = "ZTYPE"
local alpha = "ALPHA"
local banshee = "BANSHEE"
local bestiaGTS = "BESTIAGTS"
local blista2 = "BLISTA2"
local blista3 = "BLISTA3"
local buffalo = "BUFFALO"
local buffalo2 = "BUFFALO2"
local buffalo3 = "BUFFALO3"
local carbonizzare = "CARBONIZZARE"
local calico = "CALICO"
local comet2 = "COMET2"
local comet3 = "COMET3"
local comet4 = "COMET4"
local comet5 = "COMET5"
local comet6 = "COMET6"
local coquette = "COQUETTE"
local coquette4 = "COQUETTE4"
local cypher = "CYPHER"
local drafter = "DRAFTER"
local elegy = "ELEGY"
local elegy2 = "ELEGY2"
local euros = "EUROS"
local feltzer2 = "FELTZER2"
local flashGT = "FLASHGT"
local furoreGT = "FUROREGT"
local fusilade = "FUSILADE"
local futo = "FUTO"
local futo2 = "FUTO2"
local gb200 = "GB200"
local growler = "GROWLER"
local hotring = "HOTRING"
local imorgon = "IMORGON"
local issi7 = "ISSI7"
local italiRSX = "ITALIRSX"
local italiGTO = "ITALIGTO"
local jester = "JESTER"
local jester2 = "JESTER2"
local jester4 = "JESTER4"
local jugular = "JUGULAR"
local khamelion = "KHAMELION"
local komoda = "KOMODA"
local kuruma = "KURUMA"
local kuruma2 = "KURUMA2"
local locust = "LOCUST"
local lynx = "LYNX"
local massacro = "MASSACRO"
local massacro2 = "MASSACRO2"
local neo = "NEO"
local neon = "NEON"
local ninef = "NINEF"
local ninef2 = "NINEF2"
local omnis = "OMNIS"
local paragon = "PARAGON"
local paragon2 = "PARAGON2"
local pariah = "PARIAH"
local penumbra = "PENUMBRA"
local penumbra2 = "PENUMBRA2"
local raiden = "RAIDEN"
local rapidGT = "RAPIDGT"
local rapidGT2 = "RAPIDGT2"
local raptor = "RAPTOR"
local remus = "REMUS"
local revolter = "REVOLTER"
local rt3000 = "RT3000"
local ruston = "RUSTON"
local schafter2 = "SCHAFTER2"
local schafter3 = "SCHAFTER3"
local schafter4 = "SCHAFTER4"
local schafter5 = "SCHAFTER5"
local schlagen = "SCHLAGEN"
local schwarzer = "SCHWARZER"
local sentinel3 = "SENTINEL3"
local seven70 = "SEVEN70"
local specter = "SPECTER"
local specter2 = "SPECTER2"
local sugoi = "SUGOI"
local sultan = "SULTAN"
local sultan2 = "SULTAN2"
local surano = "SURANO"
local tampa2 = "TAMPA2"
local tropos = "TROPOS"
local verlierer2 = "VERLIERER2"
local vectre = "VECTRE"
local veto = "VETO"
local veto2 = "VETO2"
local vstr = "VSTR"
local zr380 = "ZR380"
local zr3802 = "ZR3802"
local zr3803 = "ZR3803"
local zr350 = "ZR350"
local adder = "ADDER"
local autarch = "AUTARCH"
local banshee2 = "BANSHEE2"
local bullet = "BULLET"
local cheetah = "CHEETAH"
local cyclone = "CYCLONE"
local deveste = "DEVESTE"
local emerus = "EMERUS"
local entityXF = "ENTITYXF"
local entity2 = "ENTITY2"
local fmj = "FMJ"
local furia = "FURIA"
local gp1 = "GP1"
local infernus = "INFERNUS"
local italiGTB = "ITALIGTB"
local italiGTB2 = "ITALIGTB2"
local krieger = "KRIEGER"
local le7b = "LE7B"
local nero = "NERO"
local nero2 = "NERO2"
local osiris = "OSIRIS"
local penetrator = "PENETRATOR"
local pfister811 = "PFISTER811"
local prototipo = "PROTOTIPO"
local reaper = "REAPER"
local s80 = "S80"
local sc1 = "SC1"
local scramjet = "SCRAMJET"
local sheava = "SHEAVA"
local sultanRS = "SULTANRS"
local t20 = "T20"
local taipan = "TAIPAN"
local tempesta = "TEMPESTA"
local tezeract = "TEZERACT"
local thrax = "THRAX"
local tigon = "TIGON"
local turismoR = "TURISMOR"
local tyrant = "TYRANT"
local tyrus = "TYRUS"
local vacca = "VACCA"
local vagner = "VAGNER"
local vigilante = "VIGILANTE"
local visione = "VISIONE"
local voltic = "VOLTIC"
local voltic2 = "VOLTIC2"
local xa21 = "XA21"
local zentorno = "ZENTORNO"
local zorrusso = "ZORRUSSO"
local akuma = "AKUMA"
local avarus = "AVARUS"
local bagger = "BAGGER"
local bati = "BATI"
local bati2 = "BATI2"
local bf400 = "BF400"
local carbonRS = "CARBONRS"
local chimera = "CHIMERA"
local cliffhanger = "CLIFFHANGER"
local daemon = "DAEMON"
local daemon2 = "DAEMON2"
local defiler = "DEFILER"
local deathbike = "DEATHBIKE"
local deathbike2 = "DEATHBIKE2"
local deathbike3 = "DEATHBIKE3"
local diablous = "DIABLOUS"
local diablous2 = "DIABLOUS2"
local double = "DOUBLE"
local enduro = "ENDURO"
local esskey = "ESSKEY"
local faggio = "FAGGIO"
local faggio2 = "FAGGIO2"
local faggio3 = "FAGGIO3"
local fcr = "FCR"
local fcr2 = "FCR2"
local gargoyle = "GARGOYLE"
local hakuchou = "HAKUCHOU"
local hakuchou2 = "HAKUCHOU2"
local hexer = "HEXER"
local innovation = "INNOVATION"
local lectro = "LECTRO"
local manchez = "MANCHEZ"
local manchez2 = "MANCHEZ2"
local nemesis = "NEMESIS"
local nightblade = "NIGHTBLADE"
local oppressor = "OPPRESSOR"
local oppressor2 = "OPPRESSOR2"
local pcj = "PCJ"
local ratbike = "RATBIKE"
local rrocket = "RROCKET"

-- Populate the vehicleList array with the vehicle names.
vehicleList[51] = zion
vehicleList[52] = zion2
vehicleList[53] = blade
vehicleList[54] = buccaneer
vehicleList[55] = buccaneer2
vehicleList[56] = chino
vehicleList[57] = chino2
vehicleList[58] = clique
vehicleList[59] = coquette3
vehicleList[60] = deviant
vehicleList[61] = dominator
vehicleList[62] = dominator2
vehicleList[63] = dominator3
vehicleList[64] = dominator4
vehicleList[65] = dominator5
vehicleList[66] = dominator6
vehicleList[67] = dominator7
vehicleList[68] = dominator8
vehicleList[69] = dukes
vehicleList[70] = dukes2
vehicleList[71] = dukes3
vehicleList[72] = ellie
vehicleList[73] = faction
vehicleList[74] = faction2
vehicleList[75] = faction3
vehicleList[76] = gauntlet
vehicleList[77] = gauntlet2
vehicleList[78] = gauntlet3
vehicleList[79] = gauntlet4
vehicleList[80] = gauntlet5
vehicleList[81] = hermes
vehicleList[82] = hotknife
vehicleList[83] = hustler
vehicleList[84] = impaler
vehicleList[85] = impaler2
vehicleList[86] = impaler3
vehicleList[87] = impaler4
vehicleList[88] = imperator
vehicleList[89] = imperator2
vehicleList[90] = imperator3
vehicleList[91] = lurcher
vehicleList[92] = manana2
vehicleList[93] = moonbeam
vehicleList[94] = moonbeam2
vehicleList[95] = nightshade
vehicleList[96] = peyote2
vehicleList[97] = phoenix
vehicleList[98] = picador
vehicleList[99] = ratloader
vehicleList[100] = ratloader2
vehicleList[101] = zion
vehicleList[102] = zion2
vehicleList[103] = blade
vehicleList[104] = buccaneer
vehicleList[105] = buccaneer2
vehicleList[106] = chino
vehicleList[107] = chino2
vehicleList[108] = clique
vehicleList[109] = coquette3
vehicleList[110] = deviant
vehicleList[111] = dominator
vehicleList[112] = dominator2
vehicleList[113] = dominator3
vehicleList[114] = dominator4
vehicleList[115] = dominator5
vehicleList[116] = dominator6
vehicleList[117] = dominator7
vehicleList[118] = dominator8
vehicleList[119] = dukes
vehicleList[120] = dukes2
vehicleList[121] = dukes3
vehicleList[122] = ellie
vehicleList[123] = faction
vehicleList[124] = faction2
vehicleList[125] = faction3
vehicleList[126] = gauntlet
vehicleList[127] = gauntlet2
vehicleList[128] = gauntlet3
vehicleList[129] = gauntlet4
vehicleList[130] = gauntlet5
vehicleList[131] = hermes
vehicleList[132] = hotknife
vehicleList[133] = hustler
vehicleList[134] = impaler
vehicleList[135] = impaler2
vehicleList[136] = impaler3
vehicleList[137] = impaler4
vehicleList[138] = imperator
vehicleList[139] = imperator2
vehicleList[140] = imperator3
vehicleList[141] = lurcher
vehicleList[142] = manana2
vehicleList[143] = moonbeam
vehicleList[144] = moonbeam2
vehicleList[145] = nightshade
vehicleList[146] = peyote2
vehicleList[147] = phoenix
vehicleList[148] = picador
vehicleList[149] = ratloader
vehicleList[150] = ratloader2
vehicleList[151] = ruiner
vehicleList[152] = ruiner2
vehicleList[153] = ruiner3
vehicleList[154] = sabreGT
vehicleList[155] = sabreGT2
vehicleList[156] = slamVan
vehicleList[157] = slamVan2
vehicleList[158] = slamVan3
vehicleList[159] = slamVan4
vehicleList[160] = slamVan5
vehicleList[161] = slamVan6
vehicleList[162] = stalion
vehicleList[163] = stalion2
vehicleList[164] = tampa
vehicleList[165] = tampa3
vehicleList[166] = tulip
vehicleList[167] = vamos
vehicleList[168] = vigero
vehicleList[169] = virgo
vehicleList[170] = virgo2
vehicleList[171] = virgo3
vehicleList[172] = voodoo
vehicleList[173] = voodoo2
vehicleList[174] = yosemite
vehicleList[175] = yosemite2
vehicleList[176] = ardent
vehicleList[177] = btype
vehicleList[178] = btype2
vehicleList[179] = btype3
vehicleList[180] = casco
vehicleList[181] = cheburek
vehicleList[182] = cheetah2
vehicleList[183] = coquette2
vehicleList[184] = deluxo
vehicleList[185] = dynasty
vehicleList[186] = fagaloa
vehicleList[187] = feltzer3
vehicleList[188] = gt500
vehicleList[189] = infernus2
vehicleList[190] = jb700
vehicleList[191] = jb7002
vehicleList[192] = jester3
vehicleList[193] = mamba
vehicleList[194] = manana
vehicleList[195] = michelli
vehicleList[196] = monroe
vehicleList[197] = nebula
vehicleList[198] = peyote
vehicleList[199] = peyote3
vehicleList[200] = pigalle
vehicleList[201] = rapidgt3
vehicleList[202] = retinue
vehicleList[203] = retinue2
vehicleList[204] = savestra
vehicleList[205] = stinger
vehicleList[206] = stingerGT
vehicleList[207] = stromberg
vehicleList[208] = swinger
vehicleList[209] = torero
vehicleList[210] = toreador
vehicleList[211] = tornado
vehicleList[212] = tornado2
vehicleList[213] = tornado3
vehicleList[214] = tornado4
vehicleList[215] = tornado5
vehicleList[216] = tornado6
vehicleList[217] = turismo2
vehicleList[218] = viseris
vehicleList[219] = z190
vehicleList[220] = zion3
vehicleList[221] = ztype
vehicleList[222] = alpha
vehicleList[223] = banshee
vehicleList[224] = bestiaGTS
vehicleList[225] = blista2
vehicleList[226] = blista3
vehicleList[227] = buffalo
vehicleList[228] = buffalo2
vehicleList[229] = buffalo3
vehicleList[230] = carbonizzare
vehicleList[231] = calico
vehicleList[232] = comet2
vehicleList[233] = comet3
vehicleList[234] = comet4
vehicleList[235] = comet5
vehicleList[236] = comet6
vehicleList[237] = coquette
vehicleList[238] = coquette4
vehicleList[239] = cypher
vehicleList[240] = drafter
vehicleList[241] = elegy
vehicleList[242] = elegy2
vehicleList[243] = euros
vehicleList[244] = feltzer2
vehicleList[245] = flashGT
vehicleList[246] = furoreGT
vehicleList[247] = fusilade
vehicleList[248] = futo
vehicleList[249] = futo2
vehicleList[250] = gb200
vehicleList[251] = growler
vehicleList[252] = hotring
vehicleList[253] = imorgon
vehicleList[254] = issi7
vehicleList[255] = italiRSX
vehicleList[256] = italiGTO
vehicleList[257] = jester
vehicleList[258] = jester2
vehicleList[259] = jester4
vehicleList[260] = jugular
vehicleList[261] = khamelion
vehicleList[262] = komoda
vehicleList[263] = kuruma
vehicleList[264] = kuruma2
vehicleList[265] = locust
vehicleList[266] = lynx
vehicleList[267] = massacro
vehicleList[268] = massacro2
vehicleList[269] = neo
vehicleList[270] = neon
vehicleList[271] = ninef
vehicleList[272] = ninef2
vehicleList[273] = omnis
vehicleList[274] = paragon
vehicleList[275] = paragon2
vehicleList[276] = pariah
vehicleList[277] = penumbra
vehicleList[278] = penumbra2
vehicleList[279] = raiden
vehicleList[280] = rapidGT
vehicleList[281] = rapidGT2
vehicleList[282] = raptor
vehicleList[283] = remus
vehicleList[284] = revolter
vehicleList[285] = rt3000
vehicleList[286] = ruston
vehicleList[287] = schafter2
vehicleList[288] = schafter3
vehicleList[289] = schafter4
vehicleList[290] = schafter5
vehicleList[291] = schlagen
vehicleList[292] = schwarzer
vehicleList[293] = sentinel3
vehicleList[294] = seven70
vehicleList[295] = specter
vehicleList[296] = specter2
vehicleList[297] = sugoi
vehicleList[298] = sultan
vehicleList[299] = sultan2
vehicleList[300] = sultan2
vehicleList[301] = surano
vehicleList[302] = tampa2
vehicleList[303] = tropos
vehicleList[304] = verlierer2
vehicleList[305] = vectre
vehicleList[306] = veto
vehicleList[307] = veto2
vehicleList[308] = vstr
vehicleList[309] = zr380
vehicleList[310] = zr3802
vehicleList[311] = zr3803
vehicleList[312] = zr350
vehicleList[313] = adder
vehicleList[314] = autarch
vehicleList[315] = banshee2
vehicleList[316] = bullet
vehicleList[317] = cheetah
vehicleList[318] = cyclone
vehicleList[319] = deveste
vehicleList[320] = emerus
vehicleList[321] = entityXF
vehicleList[322] = entity2
vehicleList[323] = fmj
vehicleList[324] = furia
vehicleList[325] = gp1
vehicleList[326] = infernus
vehicleList[327] = italiGTB
vehicleList[328] = italiGTB2
vehicleList[329] = krieger
vehicleList[330] = le7b
vehicleList[331] = nero
vehicleList[332] = nero2
vehicleList[333] = osiris
vehicleList[334] = penetrator
vehicleList[335] = pfister811
vehicleList[336] = prototipo
vehicleList[337] = reaper
vehicleList[338] = s80
vehicleList[339] = sc1
vehicleList[340] = scramjet
vehicleList[341] = sheava
vehicleList[342] = sultanRS
vehicleList[343] = t20
vehicleList[344] = taipan
vehicleList[345] = tempesta
vehicleList[346] = tezeract
vehicleList[347] = thrax
vehicleList[348] = tigon
vehicleList[349] = turismoR
vehicleList[350] = tyrant
vehicleList[351] = tyrus
vehicleList[352] = vacca
vehicleList[353] = vagner
vehicleList[354] = vigilante
vehicleList[355] = visione
vehicleList[356] = voltic
vehicleList[357] = voltic2
vehicleList[358] = xa21
vehicleList[359] = zentorno
vehicleList[360] = zorrusso
vehicleList[361] = akuma
vehicleList[362] = avarus
vehicleList[363] = bagger
vehicleList[364] = bati
vehicleList[365] = bati2
vehicleList[366] = bf400
vehicleList[367] = carbonRS
vehicleList[368] = chimera
vehicleList[369] = cliffhanger
vehicleList[370] = daemon
vehicleList[371] = daemon2
vehicleList[372] = defiler
vehicleList[373] = deathbike
vehicleList[374] = deathbike2
vehicleList[375] = deathbike3
vehicleList[376] = diablous
vehicleList[377] = diablous2
vehicleList[378] = double
vehicleList[379] = enduro
vehicleList[380] = esskey
vehicleList[381] = faggio
vehicleList[382] = faggio2
vehicleList[383] = faggio3
vehicleList[384] = fcr
vehicleList[385] = fcr2
vehicleList[386] = gargoyle
vehicleList[387] = hakuchou
vehicleList[388] = hakuchou2
vehicleList[389] = hexer
vehicleList[390] = innovation
vehicleList[391] = lectro
vehicleList[392] = manchez
vehicleList[393] = manchez2
vehicleList[394] = nemesis
vehicleList[395] = nightblade
vehicleList[396] = oppressor
vehicleList[397] = oppressor2
vehicleList[398] = pcj
vehicleList[399] = ratbike
vehicleList[400] = rrocket
-- Assign vehicle names to an array at specific indices.
local vehicleList = {}

-- Assign vehicle names to an array at specific indices.
vehicleList[351] = "RUFFIAN"
vehicleList[352] = "SANCHEZ"
vehicleList[353] = "SANCHEZ2"
vehicleList[354] = "SANCTUS"
vehicleList[355] = "SHOTARO"
vehicleList[356] = "SOVEREIGN"
vehicleList[357] = "STRYDER"
vehicleList[358] = "THRUST"
vehicleList[359] = "VADER"
vehicleList[360] = "VINDICATOR"
vehicleList[361] = "VORTEX"
vehicleList[362] = "WOLFSBANE"
vehicleList[363] = "ZOMBIEA"
vehicleList[364] = "ZOMBIEB"
vehicleList[365] = "BFINJECTION"
vehicleList[366] = "BIFTA"
vehicleList[367] = "BLAZER"
vehicleList[368] = "BLAZER2"
vehicleList[369] = "BLAZER3"
vehicleList[370] = "BLAZER4"
vehicleList[371] = "BLAZER5"
vehicleList[372] = "BODHI2"
vehicleList[373] = "BRAWLER"
vehicleList[374] = "BRUISER"
vehicleList[375] = "BRUISER2"
vehicleList[376] = "BRUISER3"
vehicleList[377] = "BRUTUS"
vehicleList[378] = "BRUTUS2"
vehicleList[379] = "BRUTUS3"
vehicleList[380] = "CARACARA"
vehicleList[381] = "CARACARA2"
vehicleList[382] = "DLOADER"
vehicleList[383] = "DUBSTA3"
vehicleList[384] = "DUNE"
vehicleList[385] = "DUNE2"
vehicleList[386] = "DUNE3"
vehicleList[387] = "DUNE4"
vehicleList[388] = "DUNE5"
vehicleList[389] = "EVERON"
vehicleList[390] = "FREECRAWLER"
vehicleList[391] = "HELLION"
vehicleList[392] = "INSURGENT"
vehicleList[393] = "INSURGENT2"
vehicleList[394] = "INSURGENT3"
vehicleList[395] = "KALAHARI"
vehicleList[396] = "KAMACHO"
vehicleList[397] = "MARSHALL"
vehicleList[398] = "MENACER"
vehicleList[399] = "MESA3"
vehicleList[400] = "MONSTER"
vehicleList[401] = "MONSTER3"
vehicleList[402] = "MONSTER4"
vehicleList[403] = "MONSTER5"
vehicleList[404] = "NIGHTSHARK"
vehicleList[405] = "OUTLAW"
vehicleList[406] = "RANCHERXL"
vehicleList[407] = "RANCHERXL2"
vehicleList[408] = "RCBANDITO"
vehicleList[409] = "REBEL"
vehicleList[410] = "REBEL2"
vehicleList[411] = "RIATA"
vehicleList[412] = "SANDKING"
vehicleList[413] = "SANDKING2"
vehicleList[414] = "TECHNICAL"
vehicleList[415] = "TECHNICAL2"
vehicleList[416] = "TECHNICAL3"
vehicleList[417] = "TROPHYTRUCK"
vehicleList[418] = "TROPHYTRUCK2"
vehicleList[419] = "VAGRANT"
vehicleList[420] = "VERUS"
vehicleList[421] = "YOSEMITE3"
vehicleList[422] = "WINKY"
vehicleList[423] = "ZHABA"
vehicleList[424] = "BULLDOZER"
vehicleList[425] = "CUTTER"
vehicleList[426] = "DUMP"
vehicleList[427] = "FLATBED"
vehicleList[428] = "GUARDIAN"
vehicleList[429] = "HANDLER"
vehicleList[430] = "MIXER"
vehicleList[431] = "MIXER2"
vehicleList[432] = "RUBBLE"
vehicleList[433] = "TIPTRUCK"
vehicleList[434] = "TIPTRUCK2"
vehicleList[435] = "AIRTUG"
vehicleList[436] = "CADDY"
vehicleList[437] = "CADDY2"
vehicleList[438] = "CADDY3"
vehicleList[439] = "DOCKTUG"
vehicleList[440] = "FORKLIFT"
vehicleList[441] = "TRACTOR2"
vehicleList[442] = "TRACTOR3"
vehicleList[443] = "MOWER"
vehicleList[444] = "RIPLEY"
vehicleList[445] = "SADLER"
vehicleList[446] = "SADLER2"
vehicleList[447] = "SCRAP"
vehicleList[448] = "SLAMTRUCK"
vehicleList[449] = "TOWTRUCK"
vehicleList[450] = "TOWTRUCK2"
vehicleList[451] = "TRACTOR"
vehicleList[452] = "UTILLITRUCK"
vehicleList[453] = "UTILLITRUCK2"
vehicleList[454] = "UTILLITRUCK3"
vehicleList[455] = "ARMYTRAILER"
vehicleList[456] = "ARMYTRAILER2"
vehicleList[457] = "FREIGHTTRAILER"
vehicleList[458] = "ARMYTANKER"
vehicleList[459] = "TRAILERLARGE"
vehicleList[460] = "DOCKTRAILER"
vehicleList[461] = "TR3"
vehicleList[462] = "TR2"
vehicleList[463] = "TR4"
vehicleList[464] = "TRFLAT"
vehicleList[465] = "TRAILERS"
vehicleList[466] = "TRAILERS4"
vehicleList[467] = "TRAILERS2"
vehicleList[468] = "TRAILERS3"
vehicleList[469] = "TVTRAILER"
vehicleList[470] = "TRAILERLOGS"
vehicleList[471] = "TANKER"
vehicleList[472] = "TANKER2"
vehicleList[473] = "BALETRAILER"
vehicleList[474] = "GRAINTRAILER"
vehicleList[475] = "BOATTRAILER"
vehicleList[476] = "RAKETRAILER"
vehicleList[477] = "TRAILERSMALL"
vehicleList[478] = "BISON"
vehicleList[479] = "BISON2"
vehicleList[480] = "BISON3"
vehicleList[481] = "BOBCATXL"
vehicleList[482] = "BOXVILLE"
vehicleList[483] = "BOXVILLE2"
vehicleList[484] = "BOXVILLE3"
vehicleList[485] = "BOXVILLE4"
vehicleList[486] = "BOXVILLE5"
vehicleList[487] = "BURRITO"
vehicleList[488] = "BURRITO2"
vehicleList[489] = "BURRITO3"
vehicleList[490] = "BURRITO4"
vehicleList[491] = "BURRITO5"
vehicleList[492] = "CAMPER"
vehicleList[493] = "GBURRITO"
vehicleList[494] = "GBURRITO2"
vehicleList[495] = "JOURNEY"
vehicleList[496] = "MINIVAN"
vehicleList[497] = "MINIVAN2"
vehicleList[498] = "PARADISE"
vehicleList[499] = "PONY"
vehicleList[500] = "PONY2"
vehicleList[501] = "RUMPO"
vehicleList[502] = "RUMPO2"
vehicleList[503] = "RUMPO3"
vehicleList[504] = "SPEEDO"
vehicleList[505] = "SPEEDO2"
vehicleList[506] = "SPEEDO4"
vehicleList[507] = "SURFER"
vehicleList[508] = "SURFER2"
vehicleList[509] = "TACO"
vehicleList[510] = "YOUGA"
vehicleList[511] = "YOUGA2"
vehicleList[512] = "YOUGA3"
vehicleList[513] = "BMX"
vehicleList[514] = "CRUISER"
vehicleList[515] = "FIXTER"
vehicleList[516] = "SCORCHER"
vehicleList[517] = "TRIBIKE"
vehicleList[518] = "TRIBIKE2"
vehicleList[519] = "TRIBIKE3"
vehicleList[520] = "AVISA"
vehicleList[521] = "DINGHY"
vehicleList[522] = "DINGHY2"
vehicleList[523] = "DINGHY3"
vehicleList[524] = "DINGHY4"
vehicleList[525] = "DINGHY5"
vehicleList[526] = "JETMAX"
vehicleList[527] = "MARQUIS"
vehicleList[528] = "PATROLBOAT"
vehicleList[529] = "PREDATOR"
vehicleList[530] = "SEASHARK"
vehicleList[531] = "SEASHARK2"
vehicleList[532] = "SEASHARK3"
vehicleList[533] = "SPEEDER"
vehicleList[534] = "SPEEDER2"
vehicleList[535] = "SQUALO"
vehicleList[536] = "SUBMERSIBLE"
vehicleList[537] = "SUBMERSIBLE2"
vehicleList[538] = "SUNTRAP"
vehicleList[539] = "TORO"
vehicleList[540] = "TORO2"
vehicleList[541] = "TROPIC"
vehicleList[542] = "TROPIC2"
vehicleList[543] = "TUG"
vehicleList[544] = "KOSATKA"
vehicleList[545] = "LONGFIN"
vehicleList[546] = "AKULA"
vehicleList[547] = "ANNIHILATOR"
vehicleList[548] = "ANNIHILATOR2"
vehicleList[549] = "BUZZARD"
vehicleList[550] = "BUZZARD2"
vehicleList[551] = "CARGOBOB"
vehicleList[552] = "CARGOBOB2"
vehicleList[553] = "CARGOBOB3"
vehicleList[554] = "CARGOBOB4"
vehicleList[555] = "FROGGER"
vehicleList[556] = "FROGGER2"
vehicleList[557] = "HAVOK"
vehicleList[558] = "HUNTER"
vehicleList[559] = "MAVERICK"
vehicleList[560] = "POLMAV"
vehicleList[561] = "SAVAGE"
vehicleList[562] = "SEASPARROW"
vehicleList[563] = "SEASPARROW2"
vehicleList[564] = "SEASPARROW3"
vehicleList[565] = "SKYLIFT"
vehicleList[566] = "SUPERVOLITO"
vehicleList[567] = "SUPERVOLITO2"
vehicleList[568] = "SWIFT"
vehicleList[569] = "SWIFT2"
vehicleList[570] = "VALKYRIE"
vehicleList[571] = "VALKYRIE2"
vehicleList[572] = "VOLATUS"
vehicleList[573] = "ALPHAZ1"
vehicleList[574] = "AVENGER"
vehicleList[575] = "ALKONOST"
vehicleList[576] = "AVENGER2"
vehicleList[577] = "BESRA"
vehicleList[578] = "BLIMP"
vehicleList[579] = "BLIMP2"
vehicleList[580] = "BLIMP3"
vehicleList[581] = "BOMBUSHKA"
vehicleList[582] = "CARGOPLANE"
vehicleList[583] = "CUBAN800"
vehicleList[584] = "DODO"
vehicleList[585] = "DUSTER"
vehicleList[586] = "HOWARD"
vehicleList[587] = "HYDRA"
vehicleList[588] = "JET"
vehicleList[589] = "LAZER"
vehicleList[590] = "LUXOR"
vehicleList[591] = "LUXOR2"
vehicleList[592] = "MAMMATUS"
vehicleList[593] = "MICROLIGHT"
vehicleList[594] = "MILJET"
vehicleList[595] = "MOGUL"
vehicleList[596] = "MOLOTOK"
vehicleList[597] = "NIMBUS"
vehicleList[598] = "NOKOTA"
vehicleList[599] = "PYRO"
vehicleList[600] = "ROGUE"
vehicleList[601] = "SEABREEZE"
vehicleList[602] = "SHAMAL"
vehicleList[603] = "STARLING"
vehicleList[604] = "STRIKEFORCE"
vehicleList[605] = "STUNT"
vehicleList[606] = "TITAN"
vehicleList[607] = "TULA"
vehicleList[608] = "VELUM"
vehicleList[609] = "VELUM2"
vehicleList[610] = "VESTRA"
vehicleList[611] = "VOLATOL"
vehicleList[612] = "AIRBUS"
vehicleList[613] = "BRICKADE"
vehicleList[614] = "BUS"
vehicleList[615] = "COACH"
vehicleList[616] = "PBUS2"
vehicleList[617] = "RALLYTRUCK"
vehicleList[618] = "RENTALBUS"
vehicleList[619] = "TAXI"
vehicleList[620] = "TOURBUS"
vehicleList[621] = "TRASH"
vehicleList[622] = "TRASH2"
vehicleList[623] = "WASTELANDER"
vehicleList[624] = "AMBULANCE"
vehicleList[625] = "FBI"
vehicleList[626] = "FBI2"
vehicleList[627] = "FIRETRUK"
vehicleList[628] = "LGUARD"
vehicleList[629] = "PBUS"
vehicleList[630] = "POLICE"
vehicleList[631] = "POLICE2"
vehicleList[632] = "POLICE3"
vehicleList[633] = "POLICE4"
vehicleList[634] = "POLICEB"
vehicleList[635] = "POLICEOLD1"
vehicleList[636] = "POLICEOLD2"
vehicleList[637] = "POLICET"
vehicleList[638] = "POLMAV"
vehicleList[639] = "PRANGER"
vehicleList[640] = "PREDATOR"
vehicleList[641] = "RIOT"
vehicleList[642] = "RIOT2"
vehicleList[643] = "SHERIFF"
vehicleList[644] = "SHERIFF2"
vehicleList[645] = "APC"
vehicleList[646] = "BARRACKS"
vehicleList[647] = "BARRACKS2"
vehicleList[648] = "BARRACKS3"
vehicleList[649] = "BARRAGE"
vehicleList[650] = "CHERNOBOG"
local tableSort = table.sort -- Store table.sort in a local variable

-- Define a function to compare two values (for sorting)
local function compare(a, b)
  return a < b -- Return true if a is less than b, otherwise false
end

-- Sort the Vehicles table using the custom comparison function
tableSort(_ENV.Vehicles, compare)

local pedList = {} -- Create an empty table to store ped models

-- Add ped model names to the pedList table
pedList[1] = "a_c_boar"
pedList[2] = "a_c_boar_02"
pedList[3] = "a_c_cat_01"
pedList[4] = "a_c_chickenhawk"
pedList[5] = "a_c_chimp"
pedList[6] = "a_c_chop"
pedList[7] = "a_c_chop_02"
pedList[8] = "a_c_cormorant"
pedList[9] = "a_c_cow"
pedList[10] = "a_c_coyote"
pedList[11] = "a_c_coyote_02"
pedList[12] = "a_c_crow"
pedList[13] = "a_c_deer"
pedList[14] = "a_c_deer_02"
pedList[15] = "a_c_dolphin"
pedList[16] = "a_c_fish"
pedList[17] = "a_c_hen"
pedList[18] = "a_c_humpback"
pedList[19] = "a_c_husky"
pedList[20] = "a_c_killerwhale"
pedList[21] = "a_c_mtlion"
pedList[22] = "a_c_mtlion_02"
pedList[23] = "a_c_panther"
pedList[24] = "a_c_pig"
pedList[25] = "a_c_pigeon"
pedList[26] = "a_c_poodle"
pedList[27] = "a_c_pug"
pedList[28] = "a_c_pug_02"
pedList[29] = "a_c_rabbit_01"
pedList[30] = "a_c_rat"
pedList[31] = "a_c_retriever"
pedList[32] = "a_c_rhesus"
pedList[33] = "a_c_rottweiler"
pedList[34] = "a_c_seagull"
pedList[35] = "a_c_sharkhammer"
pedList[36] = "a_c_sharktiger"
pedList[37] = "a_c_shepherd"
pedList[38] = "a_c_stingray"
pedList[39] = "a_c_westy"
pedList[40] = "a_c_whalegrey"
pedList[41] = "a_f_m_beach_01"
pedList[42] = "a_f_m_bevhills_01"
pedList[43] = "a_f_m_bevhills_02"
pedList[44] = "a_f_m_bodybuild_01"
pedList[45] = "a_f_m_business_02"
pedList[46] = "a_f_m_downtown_01"
pedList[47] = "a_f_m_eastsa_01"
pedList[48] = "a_f_m_eastsa_02"
pedList[49] = "a_f_m_fatbla_01"
pedList[50] = "a_f_m_fatcult_01"
pedList[51] = "a_f_m_fatwhite_01"
pedList[52] = "a_f_m_genbiker_01"
pedList[53] = "a_f_m_ktown_01"
pedList[54] = "a_f_m_ktown_02"
pedList[55] = "a_f_m_prolhost_01"
pedList[56] = "a_f_m_salton_01"
pedList[57] = "a_f_m_skidrow_01"
pedList[58] = "a_f_m_soucent_01"
pedList[59] = "a_f_m_soucent_02"
pedList[60] = "a_f_m_soucentmc_01"
pedList[61] = "a_f_m_tourist_01"
pedList[62] = "a_f_m_tramp_01"
pedList[63] = "a_f_m_trampbeac_01"
pedList[64] = "a_f_o_genstreet_01"
pedList[65] = "a_f_o_indian_01"
pedList[66] = "a_f_o_ktown_01"
pedList[67] = "a_f_o_salton_01"
pedList[68] = "a_f_o_soucent_01"
pedList[69] = "a_f_o_soucent_02"
pedList[70] = "a_f_y_beach_01"
pedList[71] = "a_f_y_beach_02"
pedList[72] = "a_f_y_bevhills_01"
pedList[73] = "a_f_y_bevhills_02"
pedList[74] = "a_f_y_bevhills_03"
pedList[75] = "a_f_y_bevhills_04"
pedList[76] = "a_f_y_bevhills_05"
pedList[77] = "a_f_y_business_01"
pedList[78] = "a_f_y_business_02"
pedList[79] = "a_f_y_business_03"
pedList[80] = "a_f_y_business_04"
pedList[81] = "a_f_y_carclub_01"
pedList[82] = "a_f_y_clubcust_01"
pedList[83] = "a_f_y_clubcust_02"
pedList[84] = "a_f_y_clubcust_03"
pedList[85] = "a_f_y_clubcust_04"
pedList[86] = "a_f_y_eastsa_01"
pedList[87] = "a_f_y_eastsa_02"
pedList[88] = "a_f_y_eastsa_03"
pedList[89] = "a_f_y_epsilon_01"
pedList[90] = "a_f_y_femaleagent"
pedList[91] = "a_f_y_fitness_01"
pedList[92] = "a_f_y_fitness_02"
pedList[93] = "a_f_y_gencaspat_01"
pedList[94] = "a_f_y_genhot_01"
pedList[95] = "a_f_y_golfer_01"
pedList[96] = "a_f_y_hiker_01"
pedList[97] = "a_f_y_hippie_01"
pedList[98] = "a_f_y_hipster_01"
pedList[99] = "a_f_y_hipster_02"
pedList[100] = "a_f_y_hipster_03"
pedList[101] = "a_f_y_hipster_04"
pedList[102] = "a_f_y_indian_01"
pedList[103] = "a_f_y_juggalo_01"
pedList[104] = "a_f_y_runner_01"
pedList[105] = "a_f_y_rurmeth_01"
pedList[106] = "a_f_y_scdressy_01"
pedList[107] = "a_f_y_skater_01"
pedList[108] = "a_f_y_smartcaspat_01"
pedList[109] = "a_f_y_soucent_01"
pedList[110] = "a_f_y_soucent_02"
pedList[111] = "a_f_y_soucent_03"
pedList[112] = "a_f_y_studioparty_01"
pedList[113] = "a_f_y_studioparty_02"
pedList[114] = "a_f_y_tennis_01"
pedList[115] = "a_f_y_topless_01"
pedList[116] = "a_f_y_tourist_01"
pedList[117] = "a_f_y_tourist_02"
pedList[118] = "a_f_y_vinewood_01"
pedList[119] = "a_f_y_vinewood_02"
pedList[120] = "a_f_y_vinewood_03"
pedList[121] = "a_f_y_vinewood_04"
pedList[122] = "a_f_y_yoga_01"
pedList[123] = "a_m_m_acult_01"
pedList[124] = "a_m_m_afriamer_01"
pedList[125] = "a_m_m_beach_01"
pedList[126] = "a_m_m_beach_02"
pedList[127] = "a_m_m_bevhills_01"
pedList[128] = "a_m_m_bevhills_02"
pedList[129] = "a_m_m_business_01"
pedList[130] = "a_m_m_eastsa_01"
pedList[131] = "a_m_m_eastsa_02"
pedList[132] = "a_m_m_farmer_01"
pedList[133] = "a_m_m_fatlatin_01"
pedList[134] = "a_m_m_genbiker_01"
pedList[135] = "a_m_m_genfat_01"
pedList[136] = "a_m_m_genfat_02"
pedList[137] = "a_m_m_golfer_01"
pedList[138] = "a_m_m_hasjew_01"
pedList[139] = "a_m_m_hillbilly_01"
pedList[140] = "a_m_m_hillbilly_02"
pedList[141] = "a_m_m_indian_01"
pedList[142] = "a_m_m_ktown_01"
pedList[143] = "a_m_m_malibu_01"
pedList[144] = "a_m_m_mexcntry_01"
pedList[145] = "a_m_m_mexlabor_01"
pedList[146] = "a_m_m_mlcrisis_01"
pedList[147] = "a_m_m_og_boss_01"
pedList[148] = "a_m_m_paparazzi_01"
pedList[149] = "a_m_m_polynesian_01"
pedList[150] = "a_m_m_prolhost_01"
pedList[151] = "a_m_m_rurmeth_01"
pedList[152] = "a_m_m_salton_01"
pedList[153] = "a_m_m_salton_02"
pedList[154] = "a_m_m_salton_03"
pedList[155] = "a_m_m_salton_04"
pedList[156] = "a_m_m_skater_01"
pedList[157] = "a_m_m_skidrow_01"
pedList[158] = "a_m_m_socenlat_01"
pedList[159] = "a_m_m_soucent_01"
pedList[160] = "a_m_m_soucent_02"
pedList[161] = "a_m_m_soucent_03"
pedList[162] = "a_m_m_soucent_04"
pedList[163] = "a_m_m_stlat_02"
pedList[164] = "a_m_m_studioparty_01"
pedList[165] = "a_m_m_tennis_01"
pedList[166] = "a_m_m_tourist_01"
pedList[167] = "a_m_m_tramp_01"
pedList[168] = "a_m_m_trampbeac_01"
pedList[169] = "a_m_m_tranvest_01"
pedList[170] = "a_m_m_tranvest_02"
pedList[171] = "a_m_o_acult_01"
pedList[172] = "a_m_o_acult_02"
pedList[173] = "a_m_o_beach_01"
pedList[174] = "a_m_o_beach_02"
pedList[175] = "a_m_o_genstreet_01"
pedList[176] = "a_m_o_ktown_01"
pedList[177] = "a_m_o_salton_01"
pedList[178] = "a_m_o_soucent_01"
pedList[179] = "a_m_o_soucent_02"
pedList[180] = "a_m_o_soucent_03"
pedList[181] = "a_m_o_tramp_01"
pedList[182] = "a_m_y_acult_01"
pedList[183] = "a_m_y_acult_02"
pedList[184] = "a_m_y_beach_01"
pedList[185] = "a_m_y_beach_02"
pedList[186] = "a_m_y_beach_03"
pedList[187] = "a_m_y_beach_04"
pedList[188] = "a_m_y_beachvesp_01"
pedList[189] = "a_m_y_beachvesp_02"
pedList[190] = "a_m_y_bevhills_01"
pedList[191] = "a_m_y_bevhills_02"
pedList[192] = "a_m_y_breakdance_01"
pedList[193] = "a_m_y_busicas_01"
pedList[194] = "a_m_y_business_01"
pedList[195] = "a_m_y_business_02"
pedList[196] = "a_m_y_business_03"
pedList[197] = "a_m_y_carclub_01"
pedList[198] = "a_m_y_clubcust_01"
pedList[199] = "a_m_y_clubcust_02"
pedList[200] = "a_m_y_clubcust_03"
pedList[201] = "a_m_y_clubcust_04"
pedList[202] = "a_m_y_cyclist_01"
pedList[203] = "a_m_y_dhill_01"
pedList[204] = "a_m_y_downtown_01"
pedList[205] = "a_m_y_eastsa_01"
pedList[206] = "a_m_y_eastsa_02"
pedList[207] = "a_m_y_epsilon_01"
pedList[208] = "a_m_y_epsilon_02"
pedList[209] = "a_m_y_gay_01"
pedList[210] = "a_m_y_gay_02"
pedList[211] = "a_m_y_gencaspat_01"
pedList[212] = "a_m_y_genstreet_01"
pedList[213] = "a_m_y_genstreet_02"
pedList[214] = "a_m_y_golfer_01"
pedList[215] = "a_m_y_hasjew_01"
pedList[216] = "a_m_y_hiker_01"
pedList[217] = "a_m_y_hippy_01"
pedList[218] = "a_m_y_hipster_01"
pedList[219] = "a_m_y_hipster_02"
pedList[220] = "a_m_y_hipster_03"
pedList[221] = "a_m_y_indian_01"
pedList[222] = "a_m_y_jetski_01"
pedList[223] = "a_m_y_juggalo_01"
pedList[224] = "a_m_y_ktown_01"
pedList[225] = "a_m_y_ktown_02"
pedList[226] = "a_m_y_latino_01"
pedList[227] = "a_m_y_methhead_01"
pedList[228] = "a_m_y_mexthug_01"
pedList[229] = "a_m_y_motox_01"
pedList[230] = "a_m_y_motox_02"
pedList[231] = "a_m_y_musclbeac_01"
pedList[232] = "a_m_y_musclbeac_02"
pedList[233] = "a_m_y_polynesian_01"
pedList[234] = "a_m_y_roadcyc_01"
pedList[235] = "a_m_y_runner_01"
pedList[236] = "a_m_y_runner_02"
pedList[237] = "a_m_y_salton_01"
pedList[238] = "a_m_y_skater_01"
pedList[239] = "a_m_y_skater_02"
pedList[240] = "a_m_y_smartcaspat_01"
pedList[241] = "a_m_y_soucent_01"
pedList[242] = "a_m_y_soucent_02"
pedList[243] = "a_m_y_soucent_03"
pedList[244] = "a_m_y_soucent_04"
pedList[245] = "a_m_y_stbla_01"
pedList[246] = "a_m_y_stbla_02"

_ENV.pedslistclient = pedList -- Assign the pedList to the global variable pedslistclient
-- List of male pedestrian models (y)
malePedModels = {
  "a_m_m_acult_01",
  "a_m_m_afriamer_01",
  "a_m_m_asian_01",
  "a_m_m_beach_01",
  "a_m_m_bevhills_01",
  "a_m_m_bevhills_02",
  "a_m_m_bodybuild_01",
  "a_m_m_business_01",
  "a_m_m_bybiker_01",
  "a_m_m_chin_01",
  "a_m_m_eastsa_01",
  "a_m_m_farmer_01",
  "a_m_m_fatlatin_01",
  "a_m_m_genstreet_01",
  "a_m_m_golf_01",
  "a_m_m_hasjew_01",
  "a_m_m_hispan_01",
  "a_m_m_hipster_01",
  "a_m_m_indian_01",
  "a_m_m_ktown_01",
  "a_m_m_latino_01",
  "a_m_m_lifeinvad_01",
  "a_m_m_malibu_01",
  "a_m_m_mexcntry_01",
  "a_m_m_mexlabor_01",
  "a_m_m_og_boss_01",
  "a_m_m_paparazzi_01",
  "a_m_m_parmedic_01",
  "a_m_m_pimps_01",
  "a_m_m_prolhost_01",
  "a_m_m_rurmeth_01",
  "a_m_m_salvatrucha_01",
  "a_m_m_skater_01",
  "a_m_m_skinhead_01",
  "a_m_m_smartcas_01",
  "a_m_m_southcen_01",
  "a_m_m_southcent_02",
  "a_m_m_tourist_01",
  "a_m_m_tramp_01",
  "a_m_m_tranvest_01",
  "a_m_m_trucker_01",
  "a_m_m_tweed_01",
  "a_m_m_unarm_01",
  "a_m_m_vagrant_01",
  "a_m_o_acult_01",
  "a_m_o_beach_01",
  "a_m_o_genstreet_01",
  "a_m_o_ktown_01",
  "a_m_o_no_jeans_01",
  "a_m_o_ ученый_01",
  "a_m_o_salvatrucha_01",
  "a_m_o_soucentmc_01",
  "a_m_o_soucentmc_02",
  "a_m_o_tourist_01",
  "a_m_o_tramp_01",
  "a_m_y_acult_01",
  "a_m_y_beach_01",
  "a_m_y_breakdance_01",
  "a_m_y_busker_01",
  "a_m_y_clubcust_01",
  "a_m_y_country_01",
  "a_m_y_cyclist_01",
  "a_m_y_dhill_01",
  "a_m_y_downtown_01",
  "a_m_y_eastsa_01",
  "a_m_y_epsilon_01",
  "a_m_y_fitness_01",
  "a_m_y_french_01",
  "a_m_y_genstreet_01",
  "a_m_y_golfer_01",
  "a_m_y_hasjew_01",
  "a_m_y_hiker_01",
  "a_m_y_hipster_01",
  "a_m_y_indian_01",
  "a_m_y_jetski_01",
  "a_m_y_ktown_01",
  "a_m_y_latino_01",
  "a_m_y_methhead_01",
  "a_m_y_motox_01",
  "a_m_y_musclbeac_01",
  "a_m_y_policeman_01",
  "a_m_y_roadcyc_01",
  "a_m_y_runner_01",
  "a_m_y_ скидаться_01",
  "a_m_y_skater_01",
  "a_m_y_smartcas_01",
  "a_m_y_socenlat_01",
  "a_m_y_southcent_01",
  "a_m_y_tennis_01",
  "a_m_y_tourist_01",
  "a_m_y_ спортсмен_01",
  "a_m_y_ стлат_01",
  "a_m_y_ studioparty_01",
  "a_m_y_ stwhi_01",
  "a_m_y_ stwhi_02",
  "a_m_y_ sunbathe_01",
  "a_m_y_ surfer_01",
  "a_m_y_ tattoocust_01",
  "a_m_y_ vinouche_01",
  "a_m_y_ vinewood_01",
  "a_m_y_ vinewood_02",
  "a_m_y_ vinewood_03",
  "a_m_y_ vinewood_04",
  "a_m_y_ yoga_01",
  "cs_amandatownley",
  "cs_andreas",
  "cs_ashley",
  "cs_bankman",
  "cs_barry",
  "cs_beverly",
  "cs_brad",
  "cs_bradcadaver",
  "cs_carbuyer",
  "cs_casey",
  "cs_chengsr",
  "cs_chrisformage",
  "cs_clay",
  "cs_dale",
  "cs_davenorton",
  "cs_debra",
  "cs_denise",
  "cs_devin",
  "cs_dom",
  "cs_dreyfuss",
  "cs_drfriedlander",
  "cs_fabien",
  "cs_fbisuit_01",
  "cs_floyd",
  "cs_guadalope",
  "cs_gurk",
  "cs_hunter",
  "cs_janet",
  "cs_jewelass",
  "cs_jimmyboston",
  "cs_jimmydisanto",
  "cs_jimmydisanto2",
  "cs_joeminuteman",
  "cs_johnnyklebitz",
  "cs_josef",
  "cs_josh",
  "cs_karen_daniels",
  "cs_lestercrest",
  "cs_lestercrest_2",
  "cs_lestercrest_3",
  "cs_lifeinvad_01",
  "cs_magenta",
  "cs_manuel",
  "cs_marnie",
  "cs_martinmadrazo",
  "cs_maryann",
  "cs_michelle",
  "cs_milton",
  "cs_molly",
  "cs_movpremf_01",
  "cs_movpremmale",
  "cs_mrk",
  "cs_mrs_thornhill",
  "cs_mrsphillips",
  "cs_natalia",
  "cs_nervousron",
  "cs_nigel",
  "cs_old_man1a",
  "cs_old_man2",
  "cs_omega",
  "cs_orleans",
  "cs_paper",
  "cs_patricia",
  "cs_patricia_02",
  "cs_priest",
  "cs_prolsec_02",
  "cs_russiandrunk",
  "cs_siemonyetarian",
  "cs_solomon",
  "cs_stevehains",
  "cs_stretch",
  "cs_tanisha",
  "cs_taocheng",
  "cs_taocheng2",
  "cs_taostranslator",
  "cs_taostranslator2",
  "cs_tenniscoach",
  "cs_terry",
  "cs_tom",
  "cs_tomepsilon",
  "cs_tracydisanto",
  "cs_wade",
  "cs_zimbor",
  "csb_abigail",
  "csb_agatha",
  "csb_agent",
  "csb_alan",
  "csb_anita",
  "csb_anton",
  "csb_ary",
  "csb_ary_02",
  "csb_avery",
  "csb_avischwartzman_02",
  "csb_avischwartzman_03",
  "csb_avon",
  "csb_ballas_leader",
  "csb_ballasog",
  "csb_billionaire",
  "csb_bogdan",
  "csb_bride",
  "csb_brucie2",
  "csb_bryony",
  "csb_burgerdrug",
  "csb_callgirl_01",
  "csb_callgirl_02",
  "csb_car3guy1",
  "csb_car3guy2",
  "csb_celeb_01",
  "csb_charlie_reed",
  "csb_chef",
  "csb_chef2",
  "csb_chin_goon",
  "csb_cletus",
  "csb_cop",
  "csb_customer",
  "csb_denise_friend",
  "csb_dix",
  "csb_djblamadon",
  "csb_drugdealer",
  "csb_englishdave",
  "csb_englishdave_02",
  "csb_fos_rep",
  "csb_g",
  "csb_georginacheng",
  "csb_golfer_a",
  "csb_golfer_b",
  "csb_groom",
  "csb_grove_str_dlr",
  "csb_gustavo",
  "csb_hao",
  "csb_hao_02",
  "csb_helmsmanpavel",
  "csb_huang",
  "csb_hugh",
  "csb_imani",
  "csb_imran",
  "csb_isldj_00",
  "csb_isldj_01",
  "csb_isldj_02",
  "csb_isldj_03",
  "csb_isldj_04",
  "csb_jackhowitzer",
  "csb_jamalamir",
  "csb_janitor",
  "csb_jio",
  "csb_jio_02",
  "csb_johnny_guns",
  "csb_juanstrickler",
  "csb_maude",
  "csb_miguelmadrazo",
  "csb_mimi",
  "csb_mjo",
  "csb_mjo_02",
  "csb_money",
  "csb_moodyman_02",
  "csb_mp_agent14",
  "csb_mrs_r",
  "csb_musician_00",
  "csb_mweather",
  "csb_ortega",
  "csb_oscar",
  "csb_paige",
  "csb_party_promo",
  "csb_popov",
  "csb_porndudes",
  "csb_prologuedriver",
  "csb_prolsec",
  "csb_ramp_gang",
  "csb_ramp_hic",
  "csb_ramp_hipster",
  "csb_ramp_marine",
  "csb_ramp_mex",
  "csb_rashcosvki",
  "csb_reporter",
  "csb_req_officer",
  "csb_roccopelosi",
  "csb_screen_writer"
}

-- Function to count clients in report
-- Takes a boolean argument: true to count taken, false to count available
function countReport(countTaken)
  local count = 0
  for _, report in pairs(reportClient) do
    if countTaken then
      if report.take then
        count = count + 1
      end
    else
      if not report.take then
        count = count + 1
      end
    end
  end
  return count
end

-- Function to convert a value to a number with 3 decimal places
function toNumber(value)
  local roundedValue = math.floor(tonumber(value) * 1000 + 0.5)
  return roundedValue / 1000
end

-- Function to set vehicle handling data
function SetVehicleHandlingData(vehicle, handlingId, value)
  if DoesEntityExist(vehicle) then
    for _, handlingVariable in pairs(handlingVariables) do
      if handlingVariable.name == handlingId then
        if string.find(handlingId, "n") and string.find(handlingId, "n") == 1 then
          SetVehicleHandlingInt(vehicle, "CHandlingData", handlingId, tonumber(value))
        elseif string.find(handlingId, "f") and string.find(handlingId, "f") == 1 then
          SetVehicleHandlingFloat(vehicle, "CHandlingData", handlingId, tonumber(value) + 0.0)
        elseif string.find(handlingId, "vec") and string.find(handlingId, "vec") == 1 then
          SetVehicleHandlingVector(vehicle, "CHandlingData", handlingId, value)
        else
          SetVehicleHandlingField(vehicle, "CHandlingData", handlingId, value)
        end
      end
    end
  end
end

-- Function to get vehicle handling data
function GetVehicleHandlingData(vehicle)
  local handlingData = {}
  if DoesEntityExist(vehicle) then
    for _, handlingVariable in pairs(handlingVariables) do
      if string.find(handlingVariable.name, "^n") then
        local value = GetVehicleHandlingInt(vehicle, "CHandlingData", handlingVariable.name)
        if value then
          table.insert(handlingData, {
            name = handlingVariable.name,
            value = value,
            type = "int"
          })
        end
      elseif string.find(handlingVariable.name, "^f") then
        local value = GetVehicleHandlingFloat(vehicle, "CHandlingData", handlingVariable.name)
        if value then
          table.insert(handlingData, {
            name = handlingVariable.name,
            value = value,
            type = "float"
          })
        end
      end
    end
  end
  return handlingData
end
function GetVehicleHandlingData(entity, handlingType, handlingName)
  local handlingDataList = {}

  if entity then
    local handlingData = GetVehicleHandlingFloat(entity, "CHandlingData", handlingName)
    if handlingData then
      table.insert(handlingDataList, {
        name = handlingName,
        value = handlingData,
        type = "float"
      })
    elseif handlingType and handlingType == 1 then
      local vectorData = GetVehicleHandlingVector(entity, "CHandlingData", handlingName)
      if vectorData then
        table.insert(handlingDataList, {
          name = handlingName,
          value = vectorData,
          type = "vector3"
        })
      end
    end
  end
  return handlingDataList
end

_ENV["gamerTagCompsEnum"] = {
  GamerName = 0,
  CrewTag = 1,
  HealthArmour = 2,
  BigText = 3,
  AudioIcon = 4,
  UsingMenu = 5,
  PassiveMode = 6,
  WantedStars = 7,
  Driver = 8,
  CoDriver = 9,
  Tagged = 12,
  GamerNameNearby = 13,
  Arrow = 14,
  Packages = 15,
  InvIfPedIsFollowing = 16,
  RankText = 17,
  Typing = 18
}

_ENV["client"] = {
  cache = {
    talkingMode = 1,
    playerList = 1,
    blips = 1,
    staffMode = false,
    vehicleActions = false,
    playerActions = false,
    serverActions = false,
    miscActions = false,
    devActions = false,
    reportActions = false,
    rankActions = false,
    settings = false,
    sound = false,
    reportActionsidx = 1,
    menuPosition = 1,
    deleteVehicleRadius = 1,
    pedActions = 1,
    minipeds = false,
    tpActions = 1,
    vehicleColor = 1,
    revive = 1,
    heal = 1,
    playerSelected = {},
    playerSelected2 = {},
    hat = 1,
    tshirt = 1,
    pant = 1,
    shoes = 1,
    torso = 1,
    mask = 1,
    hair = 1,
    playerListType = 1,
    weather = 1,
    rankListData = {}
  }
}

-- Applies skin customization to a ped.
function ApplySkin(ped, characterData)
  for key, value in pairs(characterData) do
    Character[key] = value
  end

  for _, key in ipairs(characterKeys) do
    if Character[key] == nil then
      Character[key] = 0
    end
  end

  if Character.face_md_weight and Character.skin_md_weight then
    face_weight = Character.face_md_weight / 100 + 0.0
    skin_weight = Character.skin_md_weight / 100 + 0.0
  else
    face_weight = 0.5
    skin_weight = 0.5
  end

  -- Apply head blend data
  SetPedHeadBlendData(ped, Character.mom, Character.dad, 0, Character.mom, Character.dad, 0, face_weight, skin_weight, 0.0, false)

  -- Apply face features
  SetPedFaceFeature(ped, 0, Character.nose_1 / 10 + 0.0)
  SetPedFaceFeature(ped, 1, Character.nose_2 / 10 + 0.0)
  SetPedFaceFeature(ped, 2, Character.nose_3 / 10 + 0.0)
  SetPedFaceFeature(ped, 3, Character.nose_4 / 10 + 0.0)
  SetPedFaceFeature(ped, 4, Character.nose_5 / 10 + 0.0)
  SetPedFaceFeature(ped, 5, Character.nose_6 / 10 + 0.0)
  SetPedFaceFeature(ped, 6, Character.eyebrows_5 / 10 + 0.0)
  SetPedFaceFeature(ped, 7, Character.eyebrows_6 / 10 + 0.0)
  SetPedFaceFeature(ped, 8, Character.cheeks_1 / 10 + 0.0)
  SetPedFaceFeature(ped, 9, Character.cheeks_2 / 10 + 0.0)
  SetPedFaceFeature(ped, 10, Character.cheeks_3 / 10 + 0.0)
  SetPedFaceFeature(ped, 11, Character.eye_squint / 10 + 0.0)
  SetPedFaceFeature(ped, 12, Character.lip_thickness / 10 + 0.0)
  SetPedFaceFeature(ped, 13, Character.jaw_1 / 10 + 0.0)
  SetPedFaceFeature(ped, 14, Character.jaw_2 / 10 + 0.0)
  SetPedFaceFeature(ped, 15, Character.chin_1 / 10 + 0.0)
  SetPedFaceFeature(ped, 16, Character.chin_2 / 10 + 0.0)
  SetPedFaceFeature(ped, 17, Character.chin_3 / 10 + 0.0)
  SetPedFaceFeature(ped, 18, Character.chin_4 / 10 + 0.0)
  SetPedFaceFeature(ped, 19, Character.neck_thickness / 10 + 0.0)

  -- Apply hair color
  SetPedHairColor(ped, Character.hair_color_1, Character.hair_color_2)

  -- Apply head overlays
  SetPedHeadOverlay(ped, 3, Character.age_1, Character.age_2 / 10 + 0.0)
  SetPedHeadOverlay(ped, 0, Character.blemishes_1, Character.blemishes_2 / 10 + 0.0)
  SetPedHeadOverlay(ped, 1, Character.beard_1, Character.beard_2 / 10 + 0.0)

  -- Apply eye color
  SetPedEyeColor(ped, Character.eye_color)

  -- Apply more head overlays
  SetPedHeadOverlay(ped, 2, Character.eyebrows_1, Character.eyebrows_2 / 10 + 0.0)
  SetPedHeadOverlay(ped, 4, Character.makeup_1, Character.makeup_2 / 10 + 0.0)
  SetPedHeadOverlay(ped, 8, Character.lipstick_1, Character.lipstick_2 / 10 + 0.0)

  -- Apply hair component variation
  SetPedComponentVariation(ped, 2, Character.hair_1, Character.hair_2, 2)

  -- Apply head overlay colors
  SetPedHeadOverlayColor(ped, 1, 1, Character.beard_3, Character.beard_4)
  SetPedHeadOverlayColor(ped, 2, 1, Character.eyebrows_3, Character.eyebrows_4)
  SetPedHeadOverlayColor(ped, 4, 2, Character.makeup_3, Character.makeup_4)
  SetPedHeadOverlayColor(ped, 8, 1, Character.lipstick_3, Character.lipstick_4)

  -- Apply even more head overlays
  SetPedHeadOverlay(ped, 5, Character.blush_1, Character.blush_2 / 10 + 0.0)
  SetPedHeadOverlayColor(ped, 5, 2, Character.blush_3)
  SetPedHeadOverlay(ped, 6, Character.complexion_1, Character.complexion_2 / 10 + 0.0)
  SetPedHeadOverlay(ped, 7, Character.sun_1, Character.sun_2 / 10 + 0.0)
  SetPedHeadOverlay(ped, 9, Character.moles_1, Character.moles_2 / 10 + 0.0)
  SetPedHeadOverlay(ped, 10, Character.chest_1, Character.chest_2 / 10 + 0.0)
end
-- Applies player skin to a ped.
_ENV["ApplyPlayerSkinToPed"] = function(ped, Character)
  local appearanceResourceState = GetResourceState("illenium-appearance")

  if appearanceResourceState == "started" then
    -- Check if the headBlend data is available
    if Character == nil or Character.headBlend == nil then
      -- Initialize headBlend data
      if Character == nil then
        Character = {}
      end
      Character.headBlend = {}
      Character.headBlend.shapeFirst = 0
      Character.headBlend.shapeSecond = 0
      Character.headBlend.shapeThird = 0
      Character.headBlend.skinFirst = 0
      Character.headBlend.skinSecond = 0
      Character.headBlend.skinThird = 0
      Character.shapeMix = 0.5
      Character.headBlend.skinMix = 0.5
      Character.headBlend.thirdMix = 0.5
    end

    -- Check if the faceFeatures data is available
    if Character.faceFeatures == nil then
      -- Initialize faceFeatures data
      Character.faceFeatures = {}
      Character.faceFeatures.noseWidth = 0
      Character.faceFeatures.noseBoneHigh = 0
      Character.faceFeatures.nosePeakLowering = 0
      Character.faceFeatures.noseBoneTwist = 0
      Character.faceFeatures.lipsThickness = 0
      Character.faceFeatures.neckThickness = 0
      Character.faceFeatures.jawBoneWidth = 0
      Character.faceFeatures.jawBoneBackSize = 0
      Character.faceFeatures.chinBoneLowering = 0
      Character.faceFeatures.chinBoneLength = 0
      Character.faceFeatures.chinBoneSize = 0
      Character.faceFeatures.chinHole = 0
    end

    -- Set the head blend data for the ped
    SetPedHeadBlendData(
      ped,
      Character.headBlend.shapeFirst,
      Character.headBlend.shapeSecond,
      Character.headBlend.shapeThird,
      Character.headBlend.skinFirst,
      Character.headBlend.skinSecond,
      Character.headBlend.skinThird,
      Character.shapeMix,
      Character.headBlend.skinMix,
      Character.headBlend.thirdMix,
      false
    )

    -- Set face features for the ped
    SetPedFaceFeature(ped, 0, Character.faceFeatures.noseWidth / 10.0)
    SetPedFaceFeature(ped, 3, Character.faceFeatures.noseBoneHigh / 10.0)
    SetPedFaceFeature(ped, 4, Character.faceFeatures.nosePeakLowering / 10.0)
    SetPedFaceFeature(ped, 5, Character.faceFeatures.noseBoneTwist / 10.0)
    SetPedFaceFeature(ped, 12, Character.faceFeatures.lipsThickness / 10.0)
    SetPedFaceFeature(ped, 19, Character.faceFeatures.neckThickness / 10.0)
    SetPedFaceFeature(ped, 13, Character.faceFeatures.jawBoneWidth / 10.0)
    SetPedFaceFeature(ped, 14, Character.faceFeatures.jawBoneBackSize / 10.0)
    SetPedFaceFeature(ped, 15, Character.faceFeatures.chinBoneLowering / 10.0)
    SetPedFaceFeature(ped, 17, Character.faceFeatures.chinBoneSize / 10.0)
    SetPedFaceFeature(ped, 18, Character.faceFeatures.chinHole / 10.0)

    -- Handle head overlays
    if Character.headOverlays then
      -- Beard
      SetPedHeadOverlay(ped, 1, Character.headOverlays.beard.style, Character.headOverlays.beard.opacity)
      SetPedHeadOverlayColor(ped, 1, 1, Character.headOverlays.beard.color, Character.headOverlays.beard.secondColor)

      -- Eyebrows
      SetPedHeadOverlay(ped, 2, Character.headOverlays.eyebrows.style, Character.headOverlays.eyebrows.opacity)
      SetPedHeadOverlayColor(ped, 2, 1, Character.headOverlays.eyebrows.color, Character.headOverlays.eyebrows.secondColor)

      -- Make Up
      SetPedHeadOverlay(ped, 4, Character.headOverlays.makeUp.style, Character.headOverlays.makeUp.opacity)
      SetPedHeadOverlayColor(ped, 4, 2, Character.headOverlays.makeUp.color, Character.headOverlays.makeUp.secondColor)

      -- Lipstick
      local lipstickOpacity = Character.headOver
      if not lipstickOpacity then
        lipstickOpacity = 0.1
      end
      SetPedHeadOverlay(ped, 8, Character.headOverlays.lipstick.style, lipstickOpacity)

      SetPedHeadOverlayColor(ped, 8, 2, Character.headOverlays.lipstick.color, Character.headOverlays.lipstick.secondColor)
    end

    -- Iterate through components and set them
    for _, component in ipairs(Character.components) do
      SetPedComponentVariation(ped, component.component_id, component.drawable, component.texture, 2)
    end

    -- Iterate through props and set them
    for _, prop in ipairs(Character.props) do
      SetPedPropIndex(ped, prop.prop_id, prop.drawable, prop.texture, true)
    end

    -- Set hair style and color
    SetPedComponentVariation(ped, 2, Character.hair.style, Character.hair.texture, 2)
    SetPedHairColor(ped, Character.hair.color, Character.hair.highlight)

    -- Set eye color
    SetPedEyeColor(ped, Character.eyeColor)

    return true
  else
    -- If illenium-appearance is not started, use ApplySkin function
    return ApplySkin(Character, ped)
  end
end

-- Gets the sex of the character.
_ENV["getSex"] = function(Character)
  local appearanceResourceState = GetResourceState("illenium-appearance")

  if appearanceResourceState == "started" then
    -- If the appearance resource is started, get the sex from the model
    if Character.model == "mp_f_freemode_01" then
      return 1 -- Female
    end
    return 2 -- Male
  else
    -- If appearance resource is not started, get sex from the character data
    if Character.sex == 1 then
      return 1 -- Female
    end
    return 2 -- Male
  end
end