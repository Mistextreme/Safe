-- ============================================
-- More exclusive content you will find here:
-- Cleaned and working - hot scripts and more.
--
-- https://unlocknow.net/releases
-- https://discord.gg/unlocknoww
-- ============================================



function DbAddToPurchased(identifier, itemId)
    local query = [[
        INSERT IGNORE INTO rcore_clothing_purchased (identifier, rcore_clothing_item_id, created_at)
        VALUES (@identifier, @item_id, NOW())
    ]]
    local params = {
        ['@identifier'] = identifier,
        ['@item_id'] = itemId
    }
    MySQL.Async.execute(query, params)
end
