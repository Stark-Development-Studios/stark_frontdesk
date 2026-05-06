if GetResourceState('qbx_core') ~= 'started' then return end

if not lib.checkDependency('ox_lib', '3.33.0', true) then return end

local Config = require 'shared.config'

local QBX = exports.qbx_core

lib.callback.register('stark_frontdesk:server:qbxGetOnDutyPolice', function()
    local leoCount = 0
    for _, i in pairs(Config.PoliceJobs) do
        local count = QBX:GetDutyCount(i)
        leoCount += count
    end
    return leoCount
end)

lib.callback.register('stark_frontdesk:server:qbxGetOnDutyAmbulance', function()
    local emsCount = 0
    for _, i in pairs(Config.AmbulanceJobs) do
        local count = QBX:GetDutyCount(i)
        emsCount += count
    end
    return emsCount
end)

lib.callback.register('stark_frontdesk:server:qbxGetOnDutyMechanic', function()
    local mechCount = 0
    for _, i in pairs(Config.MechanicJobs) do
        local count = QBX:GetDutyCount(i)
        mechCount += count
    end
    return mechCount
end)
