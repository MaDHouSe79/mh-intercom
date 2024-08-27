--[[ ===================================================== ]]--
--[[             MH Intercom Script by MaDHouSe            ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local canInteract = false

local function AddIntercomLocation(job, customerCoords, workerCoords, number, drivein)
    Config.Intercoms[#Config.Intercoms + 1] {
        job = job,
        intercom = job:gsub("^%l", job.upper),
        worker = workerCoords,
        customer = customerCoords,
        number = number,
        drivein = false
    }
end
exports('AddIntercomLocation', AddIntercomLocation)

local function AddToIntercom(number)
    if Config.UseTokovoip then
        exports['tokovoip_script']:addPlayerToRadio(number, Lang:t('info.phone'))
    else
        exports['pma-voice']:addPlayerToCall(number, Lang:t('info.phone'))
    end
end

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
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(data)
    PlayerData = data
end)

RegisterNetEvent('mh-intercom:client:callintercom')
AddEventHandler('mh-intercom:client:callintercom', function(job)
    local audioName, audioRef, notify
    local found = false
    for k, v in pairs(Config.Intercoms) do
        if v.job == job and PlayerData.job.name == job and PlayerData.job.onduty then
            notify = v.call_message
            audioName = v.audioName
            audioRef = v.audioRef
            found = true
        end
    end
    if found then
        QBCore.Functions.Notify(notify, 10000)
        PlaySoundFrontend(-1, audioName, audioRef, 1)
    end
end)

CreateThread(function()
    while true do
        Wait(4)
        if LocalPlayer.state.isLoggedIn then
            local nearIntercom = false
            local playerCoords = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Intercoms) do
                if PlayerData.job.name == v.job and PlayerData.job.onduty then
                    local distance = #(playerCoords - v.worker)
                    if distance < 2.0 then
                        nearIntercom = true
                        if not canInteract then
                            canInteract = true
                            exports['qb-core']:DrawText(Lang:t('info.worker'))
                            AddToIntercom(v.number)
                        end
                    end
                end
                local distance = #(playerCoords - v.customer)
                if distance < 3.0 then
                    nearIntercom = true
                    if not canInteract then
                        canInteract = true
                        if v.drivein then
                            if IsPedInAnyVehicle(PlayerPedId()) then
                                TriggerServerEvent('mh-intercom:server:alertworkers', v.job)
                                exports['qb-core']:DrawText(Lang:t('info.customer'))
                                AddToIntercom(v.number)
                            end
                        else
                            TriggerServerEvent('mh-intercom:server:alertworkers', v.job)
                            exports['qb-core']:DrawText(Lang:t('info.customer'))
                            AddToIntercom(v.number)
                        end
                    end
                end
                if not nearIntercom then
                    if canInteract then
                        canInteract = false
                        exports['qb-core']:HideText()
                        RemoveFromIntercom(v.number)
                    end
                    Wait(1000)
                end
            end
        end
    end
end)
