--[[ ===================================================== ]]--
--[[             MH Intercom Script by MaDHouSe            ]]--
--[[ ===================================================== ]]--

local Translations = {
    call_info = {
        ['all'] = "There is someone at the intercom",
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
