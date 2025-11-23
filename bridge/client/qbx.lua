---@diagnostic disable: lowercase-global

if GetResourceState('qbx_core') ~= 'started' then return end

local Config = require 'shared.config'

local QBX = exports.qbx_core

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
