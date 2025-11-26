if not lib.checkDependency('ox_lib', '3.32.0', true) then return end

local Config = require 'shared.config'

if Config.Framework == 'qb' then
    local QBCore = exports['qb-core']:GetCoreObject()

    -- Functions
    local function policeFrontDeskProgress()
        if Config.Progress.enabled then
            if Config.Progress.style == 'qb' then
                QBCore.Functions.Progressbar(locale('info.progress_name'), locale('info.progress_label'),
                    Config.Progress.duration, false, true,
                    {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true
                    }, {}, {}, {}, function() -- Progress Completed
                        local playerName = qbGetPlayerName()
                        local alert = lib.alertDialog({
                            header = locale('info.alert_dialog_header'),
                            content = locale('info.alert_dialog_description'):format(playerName),
                            centered = true,
                            cancel = true,
                            size = 'md',
                            labels = {
                                confirm = locale('info.alert_dialog_confirm_label'),
                            }
                        })
                        if alert == 'confirm' then
                            -- Open Menu
                        else
                            QBCore.Functions.Notify(locale('error.alert_dialog_cancelled_description'), 'error', 5000)
                        end
                    end, function() -- Progress Cancelled
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
                    local playerName = qbGetPlayerName()
                    local alert = lib.alertDialog({
                        header = locale('info.alert_dialog_header'),
                        content = locale('info.alert_dialog_description'):format(playerName),
                        centered = true,
                        cancel = true,
                        size = 'md',
                        labels = {
                            confirm = locale('info.alert_dialog_confirm_label'),
                        }
                    })
                    if alert == 'confirm' then
                        -- Open Menu
                    else
                        lib.notify({
                            title = locale('error.alert_dialog_cancelled_title'),
                            description = locale('error.alert_dialog_cancelled_description'),
                            duration = 5000,
                            position = 'center-right',
                            type = 'error'
                        })
                    end
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
                if lib.progressCircle({
                        duration = Config.Progress.duration,
                        position = 'bottom',
                        label = locale('info.progress_label'),
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            mouse = false,
                            combat = true
                        }
                    }) then
                    local playerName = qbGetPlayerName()
                    local alert = lib.alertDialog({
                        header = locale('info.alert_dialog_header'),
                        content = locale('info.alert_dialog_description'):format(playerName),
                        centered = true,
                        cancel = true,
                        size = 'md',
                        labels = {
                            confirm = locale('info.alert_dialog_confirm_label'),
                        }
                    })
                    if alert == 'confirm' then
                        -- Open Menu
                    else
                        lib.notify({
                            title = locale('error.alert_dialog_cancelled_title'),
                            description = locale('error.alert_dialog_cancelled_description'),
                            duration = 5000,
                            position = 'center-right',
                            type = 'error'
                        })
                    end
                else
                    lib.notify({
                        title = locale('error.progress_cancelled_title'),
                        description = locale('error.progress_cancelled_description'),
                        duration = 5000,
                        position = 'center-right',
                        type = 'error'
                    })
                end
            elseif Config.Progress.style == 'lation' then
                local lation_ui = exports.lation_ui
                if lation_ui:progressBar({
                        label = locale('info.progress_label'),
                        duration = Config.Progress.duration,
                        icon = 'fa-solid fa-bell-concierge',
                        iconColor = '#FFFFFF',
                        color = '#FF0000',
                        -- steps = {}, -- FEATURE COMING SOON
                        canCancel = true,
                        useWhileDead = false,
                        disable = {
                            move = true,
                            sprint = true,
                            car = true,
                            combat = true,
                            mouse = false
                        }
                    }) then
                    local playerName = qbGetPlayerName()
                    local alert = lation_ui:alert({
                        header = locale('info.alert_dialog_header'),
                        content = locale('info.alert_dialog_description'):format(playerName),
                        icon = 'fa-solid fa-user-shield',
                        iconColor = '#FFFFFF',
                        labels = {
                            confirm = locale('info.alert_dialog_confirm_label'),
                        },
                        type = 'success',
                        size = 'md',
                        cancel = true
                    })
                    if alert == 'confirm' then
                        -- Open Menu
                    else
                        lation_ui:notify({
                            title = locale('error.alert_dialog_cancelled_title'),
                            message = locale('error.alert_dialog_cancelled_description'),
                            type = 'error',
                            duration = 5000,
                            position = 'center-right'
                        })
                    end
                else
                    lation_ui:notify({
                        title = locale('error.progress_cancelled_title'),
                        message = locale('error.progress_cancelled_description'),
                        type = 'error',
                        duration = 5000,
                        position = 'center-right'
                    })
                end
            end
        else
            local playerName = qbGetPlayerName()
            local alert = lib.alertDialog({
                header = locale('info.alert_dialog_header'),
                content = locale('info.alert_dialog_description'):format(playerName),
                centered = true,
                cancel = true,
                size = 'md',
                labels = {
                    confirm = locale('info.alert_dialog_confirm_label'),
                }
            })
            if alert == 'confirm' then
                -- Open Menu
            else
                lib.notify({
                    title = locale('error.alert_dialog_cancelled_title'),
                    description = locale('error.alert_dialog_cancelled_description'),
                    duration = 5000,
                    position = 'center-right',
                    type = 'error'
                })
            end
        end
    end

    local function ambulanceFrontDeskProgress()
        if Config.Progress.enabled then
            if Config.Progress.style == 'qb' then
                QBCore.Functions.Progressbar(locale('info.progress_name'), locale('info.progress_label'),
                    Config.Progress.duration, false, true,
                    {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true
                    }, {}, {}, {}, function() -- Progress Completed
                        local playerName = qbGetPlayerName()
                        local alert = lib.alertDialog({
                            header = locale('info.alert_dialog_header'),
                            content = locale('info.alert_dialog_description'):format(playerName),
                            centered = true,
                            cancel = true,
                            size = 'md',
                            labels = {
                                confirm = locale('info.alert_dialog_confirm_label'),
                            }
                        })
                        if alert == 'confirm' then
                            -- Open Menu
                        else
                            QBCore.Functions.Notify(locale('error.alert_dialog_cancelled_description'), 'error', 5000)
                        end
                    end, function() -- Progress Cancelled
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
                    local playerName = qbGetPlayerName()
                    local alert = lib.alertDialog({
                        header = locale('info.alert_dialog_header'),
                        content = locale('info.alert_dialog_description'):format(playerName),
                        centered = true,
                        cancel = true,
                        size = 'md',
                        labels = {
                            confirm = locale('info.alert_dialog_confirm_label'),
                        }
                    })
                    if alert == 'confirm' then
                        -- Open Menu
                    else
                        lib.notify({
                            title = locale('error.alert_dialog_cancelled_title'),
                            description = locale('error.alert_dialog_cancelled_description'),
                            duration = 5000,
                            position = 'center-right',
                            type = 'error'
                        })
                    end
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
                if lib.progressCircle({
                        duration = Config.Progress.duration,
                        position = 'bottom',
                        label = locale('info.progress_label'),
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            mouse = false,
                            combat = true
                        }
                    }) then
                    local playerName = qbGetPlayerName()
                    local alert = lib.alertDialog({
                        header = locale('info.alert_dialog_header'),
                        content = locale('info.alert_dialog_description'):format(playerName),
                        centered = true,
                        cancel = true,
                        size = 'md',
                        labels = {
                            confirm = locale('info.alert_dialog_confirm_label'),
                        }
                    })
                    if alert == 'confirm' then
                        -- Open Menu
                    else
                        lib.notify({
                            title = locale('error.alert_dialog_cancelled_title'),
                            description = locale('error.alert_dialog_cancelled_description'),
                            duration = 5000,
                            position = 'center-right',
                            type = 'error'
                        })
                    end
                else
                    lib.notify({
                        title = locale('error.progress_cancelled_title'),
                        description = locale('error.progress_cancelled_description'),
                        duration = 5000,
                        position = 'center-right',
                        type = 'error'
                    })
                end
            elseif Config.Progress.style == 'lation' then
                local lation_ui = exports.lation_ui
                if lation_ui:progressBar({
                        label = locale('info.progress_label'),
                        duration = Config.Progress.duration,
                        icon = 'fa-solid fa-bell-concierge',
                        iconColor = '#FFFFFF',
                        color = '#FF0000',
                        -- steps = {}, -- FEATURE COMING SOON
                        canCancel = true,
                        useWhileDead = false,
                        disable = {
                            move = true,
                            sprint = true,
                            car = true,
                            combat = true,
                            mouse = false
                        }
                    }) then
                    local playerName = qbGetPlayerName()
                    local alert = lation_ui:alert({
                        header = locale('info.alert_dialog_header'),
                        content = locale('info.alert_dialog_description'):format(playerName),
                        icon = 'fa-solid fa-user-shield',
                        iconColor = '#FFFFFF',
                        labels = {
                            confirm = locale('info.alert_dialog_confirm_label'),
                        },
                        type = 'success',
                        size = 'md',
                        cancel = true
                    })
                    if alert == 'confirm' then
                        -- Open Menu
                    else
                        lation_ui:notify({
                            title = locale('error.alert_dialog_cancelled_title'),
                            message = locale('error.alert_dialog_cancelled_description'),
                            type = 'error',
                            duration = 5000,
                            position = 'center-right'
                        })
                    end
                else
                    lation_ui:notify({
                        title = locale('error.progress_cancelled_title'),
                        message = locale('error.progress_cancelled_description'),
                        type = 'error',
                        duration = 5000,
                        position = 'center-right'
                    })
                end
            end
        else
            local playerName = qbGetPlayerName()
            local alert = lib.alertDialog({
                header = locale('info.alert_dialog_header'),
                content = locale('info.alert_dialog_description'):format(playerName),
                centered = true,
                cancel = true,
                size = 'md',
                labels = {
                    confirm = locale('info.alert_dialog_confirm_label'),
                }
            })
            if alert == 'confirm' then
                -- Open Menu
            else
                lib.notify({
                    title = locale('error.alert_dialog_cancelled_title'),
                    description = locale('error.alert_dialog_cancelled_description'),
                    duration = 5000,
                    position = 'center-right',
                    type = 'error'
                })
            end
        end
    end

    local function mechanicFrontDeskProgress()
        if Config.Progress.enabled then
            if Config.Progress.style == 'qb' then
                QBCore.Functions.Progressbar(locale('info.progress_name'), locale('info.progress_label'),
                    Config.Progress.duration, false, true,
                    {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true
                    }, {}, {}, {}, function() -- Progress Completed
                        local playerName = qbGetPlayerName()
                        local alert = lib.alertDialog({
                            header = locale('info.alert_dialog_header'),
                            content = locale('info.alert_dialog_description'):format(playerName),
                            centered = true,
                            cancel = true,
                            size = 'md',
                            labels = {
                                confirm = locale('info.alert_dialog_confirm_label'),
                            }
                        })
                        if alert == 'confirm' then
                            -- Open Menu
                        else
                            QBCore.Functions.Notify(locale('error.alert_dialog_cancelled_description'), 'error', 5000)
                        end
                    end, function() -- Progress Cancelled
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
                    local playerName = qbGetPlayerName()
                    local alert = lib.alertDialog({
                        header = locale('info.alert_dialog_header'),
                        content = locale('info.alert_dialog_description'):format(playerName),
                        centered = true,
                        cancel = true,
                        size = 'md',
                        labels = {
                            confirm = locale('info.alert_dialog_confirm_label'),
                        }
                    })
                    if alert == 'confirm' then
                        -- Open Menu
                    else
                        lib.notify({
                            title = locale('error.alert_dialog_cancelled_title'),
                            description = locale('error.alert_dialog_cancelled_description'),
                            duration = 5000,
                            position = 'center-right',
                            type = 'error'
                        })
                    end
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
                if lib.progressCircle({
                        duration = Config.Progress.duration,
                        position = 'bottom',
                        label = locale('info.progress_label'),
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            mouse = false,
                            combat = true
                        }
                    }) then
                    local playerName = qbGetPlayerName()
                    local alert = lib.alertDialog({
                        header = locale('info.alert_dialog_header'),
                        content = locale('info.alert_dialog_description'):format(playerName),
                        centered = true,
                        cancel = true,
                        size = 'md',
                        labels = {
                            confirm = locale('info.alert_dialog_confirm_label'),
                        }
                    })
                    if alert == 'confirm' then
                        -- Open Menu
                    else
                        lib.notify({
                            title = locale('error.alert_dialog_cancelled_title'),
                            description = locale('error.alert_dialog_cancelled_description'),
                            duration = 5000,
                            position = 'center-right',
                            type = 'error'
                        })
                    end
                else
                    lib.notify({
                        title = locale('error.progress_cancelled_title'),
                        description = locale('error.progress_cancelled_description'),
                        duration = 5000,
                        position = 'center-right',
                        type = 'error'
                    })
                end
            elseif Config.Progress.style == 'lation' then
                local lation_ui = exports.lation_ui
                if lation_ui:progressBar({
                        label = locale('info.progress_label'),
                        duration = Config.Progress.duration,
                        icon = 'fa-solid fa-bell-concierge',
                        iconColor = '#FFFFFF',
                        color = '#FF0000',
                        -- steps = {}, -- FEATURE COMING SOON
                        canCancel = true,
                        useWhileDead = false,
                        disable = {
                            move = true,
                            sprint = true,
                            car = true,
                            combat = true,
                            mouse = false
                        }
                    }) then
                    local playerName = qbGetPlayerName()
                    local alert = lation_ui:alert({
                        header = locale('info.alert_dialog_header'),
                        content = locale('info.alert_dialog_description'):format(playerName),
                        icon = 'fa-solid fa-user',
                        iconColor = '#FFFFFF',
                        labels = {
                            confirm = locale('info.alert_dialog_confirm_label'),
                        },
                        type = 'success',
                        size = 'md',
                        cancel = true
                    })
                    if alert == 'confirm' then
                        -- Open Menu
                    else
                        lation_ui:notify({
                            title = locale('error.alert_dialog_cancelled_title'),
                            message = locale('error.alert_dialog_cancelled_description'),
                            type = 'error',
                            duration = 5000,
                            position = 'center-right'
                        })
                    end
                else
                    lation_ui:notify({
                        title = locale('error.progress_cancelled_title'),
                        message = locale('error.progress_cancelled_description'),
                        type = 'error',
                        duration = 5000,
                        position = 'center-right'
                    })
                end
            end
        else
            local playerName = qbGetPlayerName()
            local alert = lib.alertDialog({
                header = locale('info.alert_dialog_header'),
                content = locale('info.alert_dialog_description'):format(playerName),
                centered = true,
                cancel = true,
                size = 'md',
                labels = {
                    confirm = locale('info.alert_dialog_confirm_label'),
                }
            })
            if alert == 'confirm' then
                -- Open Menu
            else
                lib.notify({
                    title = locale('error.alert_dialog_cancelled_title'),
                    description = locale('error.alert_dialog_cancelled_description'),
                    duration = 5000,
                    position = 'center-right',
                    type = 'error'
                })
            end
        end
    end

    local function createPoliceZones()
        if Config.Target == 'qb' then
            if GetResourceState('qb-target') == 'started' then
                for _, i in pairs(Config.PoliceLocations) do
                    exports['qb-target']:AddCircleZone(i.name, i.coords, 1.5, {
                        name = i.name,
                        debugPoly = false,
                        useZ = true
                    }, {
                        options = {
                            {
                                type = "client",
                                event = "stark_frontdesk:client:policeProgress",
                                icon = 'fa-solid fa-bell-concierge',
                                label = locale('info.target_label'),
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
                        coords = i.coords,
                        name = i.name,
                        radius = 1.5,
                        debug = true,
                        drawSprite = true,
                        options = {
                            label = locale('info.target_label'),
                            icon = 'fa-solid fa-bell-concierge',
                            distance = 3.0,
                            event = 'stark_frontdesk:client:policeProgress'
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
                    exports['qb-target']:AddCircleZone(i.name, i.coords, 1.5, {
                        name = i.name,
                        debugPoly = false,
                        useZ = true
                    }, {
                        options = {
                            {
                                type = 'client',
                                event = 'stark_frontdesk:client:ambulanceProgress',
                                icon = 'fa-solid fa-bell-concierge',
                                label = locale('info.target_label'),
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
                        radius = 1.5,
                        debug = true,
                        drawSprite = true,
                        options = {
                            label = locale('info.target_label'),
                            icon = 'fa-solid fa-bell-concierge',
                            distance = 3.0,
                            event = 'stark_frontdesk:client:ambulanceProgress'
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
                    exports['qb-target']:AddCircleZone(i.name, i.coords, 1.5, {
                        name = i.name,
                        debugPoly = false,
                        useZ = true
                    }, {
                        options = {
                            {
                                type = 'client',
                                event = 'stark_frontdesk:client:mechanicProgress',
                                icon = 'fa-solid fa-bell-concierge',
                                label = locale('info.target_label'),
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
                        radius = 1.5,
                        debug = true,
                        drawSprite = true,
                        options = {
                            label = locale('info.target_label'),
                            icon = 'fa-solid fa-bell-concierge',
                            distance = 3.0,
                            event = 'stark_frontdesk:client:mechanicProgress'
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
        if not GetInvokingResource() then return end
        createPoliceZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:removePoliceZones', function()
        if not GetInvokingResource() then return end
        removePoliceZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:createAmbulanceZones', function()
        if not GetInvokingResource() then return end
        createAmbulanceZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:removeAmbulanceZones', function()
        if not GetInvokingResource() then return end
        removeAmbulanceZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:createMechanicZones', function()
        if not GetInvokingResource() then return end
        createMechanicZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:removeMechanicZones', function()
        if not GetInvokingResource() then return end
        removeMechanicZones()
    end)

    RegisterNetEvent('stark_frontdesk:client:policeProgress', function()
        if not GetInvokingResource() then return end
        policeFrontDeskProgress()
    end)

    RegisterNetEvent('stark_frontdesk:client:ambulanceProgress', function()
        if not GetInvokingResource() then return end
        ambulanceFrontDeskProgress()
    end)

    RegisterNetEvent('stark_frontdesk:client:mechanicProgress', function()
        if not GetInvokingResource() then return end
        mechanicFrontDeskProgress()
    end)

    -- Threads
end

if Config.Framework == 'qbx' then
    -- Functions
    -- Events
    -- Threads
end
