-- ============================================
-- More exclusive content you will find here:
-- Cleaned and working - hot scripts and more.
--
-- https://unlocknow.net/releases
-- https://discord.gg/unlocknoww
-- ============================================



function GetGameBuild()
    if Config.GameBuild then
        return Config.GameBuild
    end
    return GetConvarInt('sv_enforceGameBuild', 1604)
end
