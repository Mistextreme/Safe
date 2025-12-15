-- ============================================
-- More exclusive content you will find here:
-- Cleaned and working - hot scripts and more.
--
-- https://unlocknow.net/releases
-- https://discord.gg/unlocknoww
-- ============================================



RegisterNetEvent('qb-clothing:loadPlayerSkin', function()
    local Source = source
    LoadSkin(Source, true)
end)
RegisterNetEvent('qb-clothing:saveSkin', function()
    TriggerClientEvent('rcore_clothing:saveCurrentSkin', source)
end)
