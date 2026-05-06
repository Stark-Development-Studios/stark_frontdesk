if GetResourceState('qb-core') ~= 'started' or GetResourceState('qbx_core') == 'started' then return end

if not lib.checkDependency('ox_lib', '3.33.0', true) then return end

local Config = require 'shared.config'

local QBCore = exports['qb-core']:GetCoreObject()

lib.callback.register('stark_frontdesk:server:qbGetOnDutyPolice', function()
    local leoCount = 0
    for _, i in pairs(Config.PoliceJobs) do
        local count = QBCore.Functions.GetDutyCount(i)
        leoCount += count
    end
    return leoCount
end)

lib.callback.register('stark_frontdesk:server:qbGetOnDutyAmbulance', function()
    local emsCount = 0
    for _, i in pairs(Config.AmbulanceJobs) do
        local count = QBCore.Functions.GetDutyCount(i)
        emsCount += count
    end
    return emsCount
end)

lib.callback.register('stark_frontdesk:server:qbGetOnDutyMechanic', function()
    local mechCount = 0
    for _, i in pairs(Config.MechanicJobs) do
        local count = QBCore.Functions.GetDutyCount(i)
        mechCount += count
    end
    return mechCount
end)
