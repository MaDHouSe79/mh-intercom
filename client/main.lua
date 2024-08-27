--[[ ===================================================== ]]--
--[[             MH Intercom Script by MaDHouSe            ]]--
--[[ ===================================================== ]]--
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData, isLoggedIn, canInteract = {}, false, false

--- Add Intercom Location
---@param job string
---@param customerCoords table
---@param workerCoords table
---@param number number
---@param drivein boolean
local function AddIntercomLocation(job, customerCoords, workerCoords, number, drivein)
    Config.Intercoms[#Config.Intercoms + 1] {
        job = job,
        intercom = job:gsub("^%l", string.upper),
        worker = workerCoords,
        customer = customerCoords,
        number = number,
        drivein = false
    }
end
exports('AddIntercomLocation', AddIntercomLocation)

--- Add To Intercom
---@param number - phone number
local function AddToIntercom(number)
    if Config.UseTokovoip then
        exports['tokovoip_script']:addPlayerToRadio(number, Lang:t('info.phone'))
    else
        exports['pma-voice']:addPlayerToCall(number, Lang:t('info.phone'))
    end
end

--- Remove From Intercom
---@param number - phone number
local function RemoveFromIntercom(number)
    if Config.UseTokovoip then
        exports['tokovoip_script']:removePlayerFromRadio(number)
    else
        exports['pma-voice']:removePlayerFromCall(number)
    end
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerData = QBCore.Functions.GetPlayerData()
        isLoggedIn = true
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerData = {}
        isLoggedIn = false
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    isLoggedIn = true
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(job)
    PlayerData.job = job
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(data)
    PlayerData = data
end)

RegisterNetEvent('mh-intercom:client:callintercom', function(job)
    local audioName, audioRef, notify, found = nil, nil, nil, false
    for k, v in pairs(Config.Intercoms) do
        if v.job == job and PlayerData.job.name == job and PlayerData.job.onduty then
            QBCore.Functions.Notify(Lang:t('call_info.all'), 10000)
            PlaySoundFrontend(-1, "Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1) 
            break
        end
    end
end)

CreateThread(function()
    while true do
        if isLoggedIn then
            local ped = PlayerPedId()
            local playerCoords = GetEntityCoords(ped)
            local nearIntercom = false

            for k, intercom in pairs(Config.Intercoms) do
                if PlayerData.job.name == intercom.job then -- check if player has the job.
                    if #(playerCoords - intercom.worker) < 2.5 then nearIntercom = true end
                    if not canInteract and nearIntercom and PlayerData.job.onduty then canInteract = true end
                    if canInteract then
                        exports['qb-core']:DrawText(Lang:t('info.worker'))
                        AddToIntercom(intercom.number)
                    end
                elseif PlayerData.job.name ~= intercom.job then -- check if player is a customer.
                    if #(playerCoords - intercom.customer) < 2.5 then nearIntercom = true end
                    if not canInteract and nearIntercom then canInteract = true end
                    if canInteract then
                        if intercom.drivein and IsPedInAnyVehicle(ped) then 
                            TriggerServerEvent('mh-intercom:server:alertworkers', intercom.job)
                            exports['qb-core']:DrawText(Lang:t('info.customer'))
                            AddToIntercom(intercom.number)
                        end
                    end
                end
            end

            if not nearIntercom and canInteract then
                canInteract = false
                RemoveFromIntercom(intercom.number)
                exports['qb-core']:HideText()
            end
            
        end
        Wait(5)
    end
end)
