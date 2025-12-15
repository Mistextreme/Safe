NoGWPED = {}
NoGWPED.PedSet = false
NoGWPED.pedv = nil
NoGWPED.cam = nil

Citizen.CreateThread(function()
    DisableIdleCamera(true)
end)


function createPed(model, locationx, locationy, locationz)
    local hash = model
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Citizen.Wait(1)
    end
    return CreatePed(26, hash, locationx, locationy, locationz, 0, false, false)
end


function NoGWPED:CreateVirtualPed()
    if self.pedv then
        
        self:DestroyVirtualPed()
    end
    NoGWPED.PedSet = true
    local atm = 0
    local dict, anim = NoGWPED.AnimationForPedVirtual.dict, NoGWPED.AnimationForPedVirtual.anim
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) and atm < 1000 do
        Citizen.Wait(0)
        atm += 1
    end
    if atm >= 1000 then
        return warn('^1[NoGWPED] ^3Error loading animation dictionary^7')
    end
    clonedPed = createPed(GetEntityModel(PlayerPedId()), nil, nil, nil)
    SetEntityCollision(clonedPed, false, true)
    SetEntityInvincible(clonedPed, true)
    NetworkSetEntityInvisibleToNetwork(clonedPed, true)
    ClonePedToTarget(PlayerPedId(), clonedPed)
    SetEntityCanBeDamaged(clonedPed, false)
    SetBlockingOfNonTemporaryEvents(clonedPed, true)
    TaskPlayAnim(clonedPed, dict, anim, 8.0, 8.0, -1, 1, 0, false, false, false)
    FreezeEntityPosition(clonedPed, true)
    SetPedConfigFlag(clonedPed, 89, false)
    SetEntityDynamic(clonedPed, false)
    SetEntityHasGravity(clonedPed, false)
    SetEntityMotionBlur(clonedPed, false)
    SetPedCanBeTargetted(clonedPed, false)
    SetEntityAlpha(clonedPed, 254, false)
    self.cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetGameplayCamFov(), false, 0)
    self.pedv = clonedPed
    Citizen.CreateThread(function()
        while NoGWPED.PedSet do 
            NoGWPED:SetPedCoordsAndScaleWithGetCam()
            Citizen.Wait(0)
        end
    end)
end 

function NoGWPED:UpdatePed()
    if self.pedv then
        DeleteEntity(self.pedv)
        NoGWPED.PedSet = false
        self.pedv = nil
        NoGWPED.PedSet = true
        local dict, anim = NoGWPED.AnimationForPedVirtual.dict, NoGWPED.AnimationForPedVirtual.anim
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
        clonedPed = createPed(GetEntityModel(PlayerPedId()), nil, nil, nil)
        SetEntityCollision(clonedPed, false, false)
        SetEntityInvincible(clonedPed, true)
        NetworkSetEntityInvisibleToNetwork(clonedPed, true)
        ClonePedToTarget(PlayerPedId(), clonedPed)
        SetEntityCanBeDamaged(clonedPed, false)
        SetEntityAlpha(clonedPed, 254, false)
        SetBlockingOfNonTemporaryEvents(clonedPed, true)
        SetEntityDynamic(clonedPed, false)
        SetEntityHasGravity(clonedPed, false)
        SetEntityMotionBlur(clonedPed, false)
        SetPedCanBeTargetted(clonedPed, false)
        SetPedAoBlobRendering(clonedPed, false)
        TaskPlayAnim(clonedPed, dict, anim, 8.0, 8.0, -1, 1, 0, false, false, false)
        self.pedv = clonedPed
    end
end

function NoGWPED:SetPedCoordsAndScaleWithGetCam()
    local camType = GetFollowPedCamViewMode()
    local target = 1.0

    local scaleFactor = 0.3
    if camType == 0 then -- Caméra à la troisième personne
        target = 1.5
        scaleFactor = 0.44
    end
    if camType == 1 then -- Caméra après la première personne
        target =  4.0
        scaleFactor = 1.15
    elseif camType == 2 then -- Caméra après le double appui sur la première personne
        target = 4.0
        scaleFactor = 1.15
    end

    if camType == 4 then -- Première personne
        target = 1.0
    end
    if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
        if GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 3.5 >= NoGWPED.RemovePedInCarSpeed then
            SetEntityAlpha(self.pedv, 0, false)
        else
            SetEntityAlpha(self.pedv, 254, false)
        end
    end
    local pos = GetFinalRenderedCamCoord()
    SetCamCoord(self.cam, pos)
    local rot = GetFinalRenderedCamRot(2)
    SetCamRot(self.cam, vector3(-rot.x, rot.y, rot.z) + vector3(0, 0, 180.0), 2)
    SetCamFov(self.cam, GetGameplayCamFov())
    local camRight, camForward, camUp, camCoords = GetCamMatrix(self.cam)
    ClearPedBloodDamage(self.pedv)
    local coordsDesired = camCoords + camForward * -(target) + (camRight * 0.0) + (camUp * 0.0)
    SetEntityCoords(self.pedv, coordsDesired)
    SetEntityMatrix(self.pedv, camForward * scaleFactor, camRight * scaleFactor, camUp * scaleFactor, vector3(coordsDesired.x, coordsDesired.y, coordsDesired.z + 0.05))
    FreezeEntityPosition(self.pedv, true)
end

function NoGWPED:DestroyVirtualPed()
    if self.pedv then
        NoGWPED.PedSet = false
        DeleteEntity(self.pedv)
        DestroyCam(self.cam, true)
        self.pedv = nil
    end
end

exports('Get', function()
    return NoGWPED
end)

exports('CreateVirtualPed', function()
    NoGWPED:CreateVirtualPed()
end)

exports('DestroyVirtualPed', function()
    NoGWPED:DestroyVirtualPed()
end)

exports('UpdatePed', function()
    NoGWPED:UpdatePed()
end)

exports('GetPed', function()
    return NoGWPED.pedv
end)

