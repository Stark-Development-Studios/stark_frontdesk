---@diagnostic disable: lowercase-global

if GetResourceState('qb-core') ~= 'started' or GetResourceState('qbx_core') == 'started' then return end

local Config = require 'shared.config'

local QBCore = exports['qb-core']:GetCoreObject()

-- Functions
function getPlayerName()
    local PlayerData = QBCore.Functions.GetPlayerData()
    return PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname
end

function qbIsPlayerPolice()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData then return false end
    local currentJob = PlayerData.job
    if not currentJob then return false end
    for _, job in ipairs(Config.PoliceJobs) do
        if (currentJob.name == job) then
            return true
        end
    end
    return false
end

function qbIsPlayerAmbulance()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData then return false end
    local currentJob = PlayerData.job
    if not currentJob then return false end
    for _, job in ipairs(Config.AmbulanceJobs) do
        if (currentJob.name == job) then
            return true
        end
    end
    return false
end

function qbIsPlayerMechanic()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData then return false end
    local currentJob = PlayerData.job
    if not currentJob then return false end
    for _, job in ipairs(Config.MechanicJobs) do
        if (currentJob.name == job) then
            return true
        end
    end
    return false
end

function qbIsPlayerOnDuty()
    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData then return false end
    local currentJob = PlayerData.job
    if not currentJob then return false end
    return currentJob.onduty
end

-- Events
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('stark_frontdesk:client:createPoliceZones')
    Wait(1000)
    TriggerEvent('stark_frontdesk:client:createAmbulanceZones')
    Wait(1000)
    TriggerEvent('stark_frontdesk:client:createMechanicZones')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerEvent('stark_frontdesk:client:removePoliceZones')
    Wait(1000)
    TriggerEvent('stark_frontdesk:client:removeAmbulanceZones')
    Wait(1000)
    TriggerEvent('stark_frontdesk:client:removeMechanicZones')
end)
