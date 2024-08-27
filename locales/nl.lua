--[[ ===================================================== ]]--
--[[             MH Intercom Script by MaDHouSe            ]]--
--[[ ===================================================== ]]--

local Translations = {
    call_info = {
        ['all'] = "Er staat iemand bij de intercom",
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
