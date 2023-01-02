--[[ ===================================================== ]]--
--[[             MH Intercom Script by MaDHouSe            ]]--
--[[ ===================================================== ]]--

local Translations = {
    call_info = {
        ['police'] = "Er is iemand bij de balie-intercom",
        ['burgershot'] = "Er staat iemand bij de intercom",
    },
    info = {
        ['phone'] = "Telefoon",
        ['worker'] = "Werknemer intercom",
        ['customer'] = "Klantenintercom",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})