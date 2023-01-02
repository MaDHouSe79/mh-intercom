--[[ ===================================================== ]]--
--[[             MH Intercom Script by MaDHouSe            ]]--
--[[ ===================================================== ]]--

Config = {}

Config.UseTokovoip = false -- Defalt false for QBCore, if false it uses pma-voice

Config.Intercoms = {
    {
        job       = 'police',                              -- job
        intercom  = 'Police',                              -- intercom
        worker    = vector3(442.9329, -981.8671, 30.6895), -- worker intercom location
        customer  = vector3(441.6382, -979.9668, 30.6895), -- customer intercom location
        number    = 878915,                                -- pma-voice number (6 digits unique number)
        drivein   = false,                                 -- is a drive in for vehicles
        notify    = Lang:t('call_info.police'),            -- notify worker message
        audioName = "Beep_Green",                          -- sound name, the sound you heer
        audioRef  = "DLC_HEIST_HACKING_SNAKE_SOUNDS",      -- sound Ref, the audio ref
    },
    {
        job       = 'burgershot',
        intercom  = 'Burgershot',
        worker    = vector3(-1192.00, -906.65, 14.09),
        customer  = vector3(-1204.79, -899.01, 13.30),
        number    = 878914,                                -- number (6 digits unique number)
        drivein   = true,
        notify    = Lang:t('call_info.burgershot'),
        audioName = "Beep_Green",
        audioRef  = "DLC_HEIST_HACKING_SNAKE_SOUNDS",
    },
}