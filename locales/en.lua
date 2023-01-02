--[[ ===================================================== ]]--
--[[             MH Intercom Script by MaDHouSe            ]]--
--[[ ===================================================== ]]--

local Translations = {
    call_info = {
        ['police'] = "There is someone at the desk intercom",
        ['burgershot'] = "There is someone at the intercom",
    },
    info = {
        ['phone'] = "Phone",
        ['worker'] = "Worker Intercom",
        ['customer'] = "Customer Intercom",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})