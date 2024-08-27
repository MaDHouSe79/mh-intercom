--[[ ===================================================== ]]--
--[[             MH Intercom Script by MaDHouSe            ]]--
--[[ ===================================================== ]]--
RegisterServerEvent('mh-intercom:server:alertworkers')
AddEventHandler('mh-intercom:server:alertworkers', function(job)
    TriggerClientEvent('mh-intercom:client:callintercom', -1, job)
end)
