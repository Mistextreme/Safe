Locales = {}

Citizen.CreateThread(function()

    TranslateIt = function(...)
        return Translate(...)
    end

    function Translate(str, ...) -- Translate string
        if not str then
            print(("[^1ERROR^7] Resource ^5%s^7 You did not specify a parameter for the Translate function or the value is nil!"):format(GetInvokingResource() or GetCurrentResourceName()))
            return "Given translate function parameter is nil!"
        end
        local loc = string.lower(Config.Locale)
        if Locales[loc] then
            if Locales[loc][str] then
                return string.format(Locales[loc][str], ...)
            elseif loc ~= "en" and Locales["en"] and Locales["en"][str] then
                return string.format(Locales["en"][str], ...)
            else
                return "Translation [" .. loc .. "][" .. str .. "] does not exist"
            end
        elseif loc ~= "en" and Locales["en"] and Locales["en"][str] then
            return string.format(Locales["en"][str], ...)
        else
            return "Locale [" .. loc .. "] does not exist"
        end
    end

end)