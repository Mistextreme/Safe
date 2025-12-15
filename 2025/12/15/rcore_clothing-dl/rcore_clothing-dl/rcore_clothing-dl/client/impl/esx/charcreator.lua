-- ============================================
-- More exclusive content you will find here:
-- Cleaned and working - hot scripts and more.
--
-- https://unlocknow.net/releases
-- https://discord.gg/unlocknoww
-- ============================================



AddEventHandler('rcore_clothing:esx:charcreator', function()
    Wait(1000)
    LoadAndSetModel(GetPlayerStartingModel())
    CustomSetDefaultVariations(PlayerPedId())
    TriggerEvent('rcore_clothing:openCharCreator')
end)
