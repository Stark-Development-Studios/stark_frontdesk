if not lib.checkDependency('ox_lib', '3.32.0', true) then return end

local Config = require 'shared.config'

if Config.Framework == 'qb' then
    local QBCore = exports['qb-core']:GetCoreObject()

    -- Functions
    local function frontDeskProgress()
        if Config.Progress.enabled then
            if Config.Progress.style == 'qb' then
                QBCore.Functions.Progressbar(locale('info.progress_name'), locale('info.progress_label'),
                    Config.Progress.duration, false, true,
                    {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true
                    }, {}, {}, {}, function() -- Completed
                        -- Prompt Alert
                        -- Open Menu
                    end, function() -- Cancelled
                        QBCore.Functions.Notify(locale('error.progress_cancelled_description'), 'error', 5000)
                    end)
            elseif Config.Progress.style == 'ox_bar' then
                if lib.progressBar({
                        duration = Config.Progress.duration,
                        label = locale('info.progress_label'),
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                            mouse = false
                        }
                    }) then
                    -- Prompt Alert
                    -- Open Menu
                else
                    lib.notify({
                        title = locale('error.progress_cancelled_title'),
                        description = locale('error.progress_cancelled_description'),
                        duration = 5000,
                        position = 'center-right',
                        type = 'error'
                    })
                end
            elseif Config.Progress.style == 'ox_circle' then
            elseif Config.Progress.style == 'lation' then
            end
        else
            -- Prompt Alert
            -- Open Menu
        end
    end

    frontDeskProgress() -- DEBUG

    local function createPoliceZones()
        if Config.Target == 'qb' then
            if GetResourceState('qb-target') == 'started' then
                for _, i in pairs(Config.PoliceLocations) do
                    exports['qb-target']:AddCircleZone(i.name, i.coords, 2.0, {
                        name = i.name,
                        debugPoly = false,
                        useZ = true
                    }, {
                        options = {
                            {
                                type = "client", -- event type (client or server)
                                event = "",      -- event name?
                                icon = 'fa-solid fa-bell-concierge',
                                label = locale('info.target_label'),
                                action = function() end, -- function call instead?
                            }
                        },
                        distance = 3.0
                    })
                end
            end
        elseif Config.Target == 'ox' then
            if GetResourceState('ox_target') == 'started' then
                local ox_target = exports.ox_target
                for _, i in pairs(Config.PoliceLocations) do
                    ox_target:addSphereZone({
                        coords = i.coords, -- Right Now, Coords is an empty string. Will Need To Define!
                        name = i.name,
                        radius = 2.0,
                        debug = true,
                        drawSprite = true,
                        options = {
                            label = locale('info.target_label'),
                            icon = 'fa-solid fa-bell-concierge',
                            distance = 3.0,
                            onSelect = function() end, -- function call?
                            event = ''                 -- client event?
                        }
                    })
                end
            end
        end
    end

    local function createAmbulanceZones()
        if Config.Target == 'qb' then
            if GetResourceState('qb-target') == 'started' then
                for _, i in pairs(Config.AmbulanceLocations) do
                    exports['qb-target']:AddCircleZone(i.name, i.coords, 2.0, {
                        name = i.name,
                        debugPoly = false,
                        useZ = true
                    }, {
                        options = {
                            {
                                type = 'client',
                                event = '',
                                icon = 'fa-solid fa-bell-concierge',
                                label = locale('info.target_label'),
                                action = function() end,
                            }
                        },
                        distance = 3.0
                    })
                end
            end
        elseif Config.Target == 'ox' then
            if GetResourceState('ox_target') == 'started' then
                local ox_target = exports.ox_target
                for _, i in pairs(Config.AmbulanceLocations) do
                    ox_target:addSphereZone({
                        coords = i.coords,
                        name = i.name,
                        radius = 2.0,
                        debug = true,
                        drawSprite = true,
                        options = {
                            label = locale('info.target_label'),
                            icon = 'fa-solid fa-bell-concierge',
                            distance = 3.0,
                            onSelect = function() end,
                            event = ''
                        }
                    })
                end
            end
        end
    end

    local function createMechanicZones()
        if Config.Target == 'qb' then
            if GetResourceState('qb-target') == 'started' then
                for _, i in pairs(Config.MechanicLocations) do
                    exports['qb-target']:AddCircleZone(i.name, i.coords, 2.0, {
                        name = i.name,
                        debugPoly = false,
                        useZ = true
                    }, {
                        options = {
                            {
                                type = 'client',
                                event = '',
                                icon = 'fa-solid fa-bell-concierge',
                                label = locale('info.target_label'),
                                action = function() end
                            }
                        },
                        distance = 3.0
                    })
                end
            end
        elseif Config.Target == 'ox' then
            if GetResourceState('ox_target') == 'started' then
                local ox_target = exports.ox_target
                for _, i in pairs(Config.MechanicLocations) do
                    ox_target:addSphereZone({
                        coords = i.coords,
                        name = i.name,
                        radius = 2.0,
                        debug = true,
                        drawSprite = true,
                        options = {
                            label = locale('info.target_label'),
                            icon = 'fa-solid fa-bell-concierge',
                            distance = 3.0,
                            onSelect = function() end,
                            event = ''
                        }
                    })
                end
            end
        end
    end

    local function removePoliceZones()
        if Config.Target == 'qb' then
            if GetResourceState('qb-target') == 'started' then
                for _, i in pairs(Config.PoliceLocations) do
                    exports['qb-target']:RemoveZone(i.name)
                end
            end
        elseif Config.Target == 'ox' then
            if GetResourceState('ox_target') == 'started' then
                local ox_target = exports.ox_target
                for _, i in pairs(Config.PoliceLocations) do
                    ox_target:removeZone(i.name)
                end
            end
        end
    end

    local function removeAmbulanceZones()
        if Config.Target == 'qb' then
            if GetResourceState('qb-target') == 'started' then
                for _, i in pairs(Config.AmbulanceLocations) do
                    exports['qb-target']:RemoveZone(i.name)
                end
            end
        elseif Config.Target == 'ox' then
            if GetResourceState('ox_target') == 'started' then
                local ox_target = exports.ox_target
                for _, i in pairs(Config.AmbulanceLocations) do
                    ox_target:removeZone(i.name)
                end
            end
        end
    end

    local function removeMechanicZones()
        if Config.Target == 'qb' then
            if GetResourceState('qb-target') == 'started' then
                for _, i in pairs(Config.MechanicLocations) do
                    exports['qb-target']:RemoveZone(i.name)
                end
            end
        elseif Config.Target == 'ox' then
            if GetResourceState('ox_target') == 'started' then
                local ox_target = exports.ox_target
                for _, i in pairs(Config.MechanicLocations) do
                    ox_target:removeZone(i.name)
                end
            end
        end
    end

    -- Events
    RegisterNetEvent('stark_frontdesk:client:createPoliceZones', function()
        if GetInvokingResource() then return end
        createPoliceZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:removePoliceZones', function()
        if GetInvokingResource() then return end
        removePoliceZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:createAmbulanceZones', function()
        if GetInvokingResource() then return end
        createAmbulanceZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:removeAmbulanceZones', function()
        if GetInvokingResource() then return end
        removeAmbulanceZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:createMechanicZones', function()
        if GetInvokingResource() then return end
        createMechanicZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:removeMechanicZones', function()
        if GetInvokingResource() then return end
        removeMechanicZones()
    end)

    -- Threads
end

if Config.Framework == 'qbx' then
    -- Functions
    -- Events
    -- Threads
end
