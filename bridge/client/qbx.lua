---@diagnostic disable: lowercase-global

if GetResourceState('qbx_core') ~= 'started' then return end

local Config = require 'shared.config'

local QBX = exports.qbx_core

-- Functions
function qbxGetPlayerName()
    local PlayerData = QBX:GetPlayerData()
    return PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname
end

function qbxIsPlayerPolice()
    local PlayerData = QBX:GetPlayerData()
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

function qbxIsPlayerAmbulance()
    local PlayerData = QBX:GetPlayerData()
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

function qbxIsPlayerMechanic()
    local PlayerData = QBX:GetPlayerData()
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

function qbxIsPlayerOnDuty()
    local PlayerData = QBX:GetPlayerData()
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
