if not lib.checkDependency('ox_lib', '3.32.0', true) then return end

local Config = require 'shared.config'

if Config.Framework == 'qb' then
    local QBCore = exports['qb-core']:GetCoreObject()

    -- Functions
    local function createPoliceMenu()
        if Config.Menu == 'qb' then
            local policeMenu = {
                {
                    header = locale('info.police_menu_header'),
                    icon = 'fa-solid fa-shield-halved',
                    isMenuHeader = true
                },
                {
                    header = locale('info.police_request_assistance_header'),
                    txt = locale('info.police_request_assistance_description'),
                    icon = 'fa-solid fa-user-shield',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.police_request_license_header'),
                    txt = locale('info.police_request_license_description'),
                    icon = 'fa-solid fa-gun',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.police_request_job_information_header'),
                    txt = locale('info.police_request_job_information_description'),
                    icon = 'fa-solid fa-briefcase',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.police_close_menu_header'),
                    txt = locale('info.police_close_menu_description'),
                    icon = 'fa-solid fa-right-from-bracket',
                    action = function()
                        exports['qb-menu']:closeMenu()
                        QBCore.Functions.Notify(locale('error.police_menu_closed_description'), 'error', 5000)
                    end
                }
            }

            exports['qb-menu']:openMenu(policeMenu)
        elseif Config.Menu == 'ox' then
            local menuOptions = {
                {
                    title = locale('info.police_request_assistance_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-user-shield',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.police_request_assistance_description'),
                    event = ''
                },
                {
                    title = locale('info.police_request_license_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-gun',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.police_request_license_description'),
                    event = ''
                },
                {
                    title = locale('info.police_request_job_information_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-briefcase',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.police_request_job_information_description'),
                    event = ''
                }
            }

            lib.registerContext({
                id = 'open_police_desk_menu',
                title = locale('info.police_menu_header'),
                canClose = true,
                onExit = function()
                    lib.notify({
                        title = locale('error.police_menu_closed_title'),
                        description = locale('error.police_menu_closed_description'),
                        duration = 5000,
                        position = 'center-right',
                        type = 'error'
                    })
                end,
                options = menuOptions
            })

            lib.showContext('open_police_desk_menu')
        elseif Config.Menu == 'lation' then
            local lation_ui = exports.lation_ui
            local menuOptions = {
                {
                    title = locale('info.police_request_assistance_header'),
                    icon = 'fa-solid fa-user-shield',
                    iconColor = '#FFFFFF',
                    description = locale('info.police_request_assistance_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.police_request_license_header'),
                    icon = 'fa-solid fa-gun',
                    iconColor = '#FFFFFF',
                    description = locale('info.police_request_license_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.police_request_job_information_header'),
                    icon = 'fa-solid fa-briefcase',
                    iconColor = '#FFFFFF',
                    description = locale('info.police_request_job_information_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.police_close_menu_header'),
                    icon = 'fa-solid fa-right-from-bracket',
                    iconColor = '#FFFFFF',
                    description = locale('info.police_close_menu_description'),
                    arrow = true,
                    onSelect = function()
                        lation_ui:hideMenu()
                        lation_ui:notify({
                            title = locale('error.police_menu_closed_title'),
                            message = locale('error.police_menu_closed_description'),
                            type = 'error',
                            duration = 5000,
                            position = 'center-right'
                        })
                    end
                }
            }

            lation_ui:registerMenu({
                id = 'open_police_desk_menu',
                title = locale('info.police_menu_header'),
                canClose = true,
                position = 'offcenter-right',
                onExit = function()
                    lation_ui:notify({
                        title = locale('error.police_menu_closed_title'),
                        message = locale('error.police_menu_closed_description'),
                        type = 'error',
                        duration = 5000,
                        position = 'center-right'
                    })
                end,
                options = menuOptions
            })

            lation_ui:showMenu('open_police_desk_menu')
        end
    end

    local function createAmbulanceMenu()
        if Config.Menu == 'qb' then
            local ambulanceMenu = {
                {
                    header = locale('info.ambulance_menu_header'),
                    icon = 'fa-solid fa-hospital',
                    isMenuHeader = true
                },
                {
                    header = locale('info.ambulance_request_assistance_header'),
                    txt = locale('info.ambulance_request_assistance_description'),
                    icon = 'fa-solid fa-user-doctor',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.ambulance_request_bandage_header'),
                    txt = locale('info.ambulance_request_bandage_description'),
                    icon = 'fa-solid fa-bandage',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.ambulance_request_job_information_header'),
                    txt = locale('info.ambulance_request_job_information_description'),
                    icon = 'fa-solid fa-briefcase',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.ambulance_close_menu_header'),
                    txt = locale('info.ambulance_close_menu_description'),
                    icon = 'fa-solid fa-right-from-bracket',
                    action = function()
                        exports['qb-menu']:closeMenu()
                        QBCore.Functions.Notify(locale('error.ambulance_menu_closed_description'), 'error', 5000)
                    end
                }
            }

            exports['qb-menu']:openMenu(ambulanceMenu)
        elseif Config.Menu == 'ox' then
            local menuOptions = {
                {
                    title = locale('info.ambulance_request_assistance_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-user-doctor',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.ambulance_request_assistance_description'),
                    event = ''
                },
                {
                    title = locale('info.ambulance_request_bandage_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-bandage',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.ambulance_request_bandage_description'),
                    event = ''
                },
                {
                    title = locale('info.ambulance_request_job_information_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-briefcase',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.ambulance_request_job_information_description'),
                    event = ''
                }
            }

            lib.registerContext({
                id = 'open_ambulance_desk_menu',
                title = locale('info.ambulance_menu_header'),
                canClose = true,
                onExit = function()
                    lib.notify({
                        title = locale('error.ambulance_menu_closed_title'),
                        description = locale('error.ambulance_menu_closed_description'),
                        duration = 5000,
                        position = 'center-right',
                        type = 'error'
                    })
                end,
                options = menuOptions
            })

            lib.showContext('open_ambulance_desk_menu')
        elseif Config.Menu == 'lation' then
            local lation_ui = exports.lation_ui
            local menuOptions = {
                {
                    title = locale('info.ambulance_request_assistance_header'),
                    icon = 'fa-solid fa-user-doctor',
                    iconColor = '#FFFFFF',
                    description = locale('info.ambulance_request_assistance_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.ambulance_request_bandage_header'),
                    icon = 'fa-solid fa-bandage',
                    iconColor = '#FFFFFF',
                    description = locale('info.ambulance_request_bandage_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.ambulance_request_job_information_header'),
                    icon = 'fa-solid fa-briefcase',
                    iconColor = '#FFFFFF',
                    description = locale('info.ambulance_request_job_information_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.ambulance_close_menu_header'),
                    icon = 'fa-solid fa-right-from-bracket',
                    iconColor = '#FFFFFF',
                    description = locale('info.ambulance_close_menu_description'),
                    arrow = true,
                    onSelect = function()
                        lation_ui:hideMenu()
                        lation_ui:notify({
                            title = locale('error.ambulance_menu_closed_title'),
                            message = locale('error.ambulance_menu_closed_description'),
                            type = 'error',
                            duration = 5000,
                            position = 'center-right'
                        })
                    end
                }
            }

            lation_ui:registerMenu({
                id = 'open_ambulance_desk_menu',
                title = locale('info.ambulance_menu_header'),
                canClose = true,
                position = 'offcenter-right',
                onExit = function()
                    lation_ui:notify({
                        title = locale('error.ambulance_menu_closed_title'),
                        message = locale('error.ambulance_menu_closed_description'),
                        type = 'error',
                        duration = 5000,
                        position = 'center-right'
                    })
                end,
                options = menuOptions
            })

            lation_ui:showMenu('open_ambulance_desk_menu')
        end
    end

    local function createMechanicMenu()
        if Config.Menu == 'qb' then
            local mechanicMenu = {
                {
                    header = locale('info.mechanic_menu_header'),
                    icon = 'fa-solid fa-car-battery',
                    isMenuHeader = true
                },
                {
                    header = locale('info.mechanic_request_assistance_header'),
                    txt = locale('info.mechanic_request_assistance_description'),
                    icon = 'fa-solid fa-user-gear',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.mechanic_request_repair_kit_header'),
                    txt = locale('info.mechanic_request_repair_kit_description'),
                    icon = 'fa-solid fa-toolbox',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.mechanic_request_repair_upgrade_header'),
                    txt = locale('info.mechanic_request_repair_upgrade_description'),
                    icon = 'fa-solid fa-screwdriver-wrench',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.mechanic_request_job_information_header'),
                    txt = locale('info.mechanic_request_job_information_description'),
                    icon = 'fa-solid fa-briefcase',
                    action = function() end,
                    params = {
                        event = ''
                    }
                },
                {
                    header = locale('info.mechanic_close_menu_header'),
                    txt = locale('info.mechanic_close_menu_description'),
                    icon = 'fa-solid fa-right-from-bracket',
                    action = function()
                        exports['qb-menu']:closeMenu()
                        QBCore.Functions.Notify(locale('error.mechanic_menu_closed_description'), 'error', 5000)
                    end
                }
            }

            exports['qb-menu']:openMenu(mechanicMenu)
        elseif Config.Menu == 'ox' then
            local menuOptions = {
                {
                    title = locale('info.mechanic_request_assistance_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-user-gear',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.mechanic_request_assistance_description'),
                    event = ''
                },
                {
                    title = locale('info.mechanic_request_repair_kit_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-toolbox',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.mechanic_request_repair_kit_description'),
                    event = ''
                },
                {
                    title = locale('info.mechanic_request_repair_upgrade_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-screwdriver-wrench',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.mechanic_request_repair_upgrade_description'),
                    event = ''
                },
                {
                    title = locale('info.mechanic_request_job_information_header'),
                    onSelect = function() end,
                    icon = 'fa-solid fa-briefcase',
                    iconColor = 'white',
                    arrow = true,
                    description = locale('info.mechanic_request_job_information_description'),
                    event = ''
                }
            }

            lib.registerContext({
                id = 'open_mechanic_desk_menu',
                title = locale('info.mechanic_menu_header'),
                canClose = true,
                onExit = function()
                    lib.notify({
                        title = locale('error.mechanic_menu_closed_title'),
                        description = locale('error.mechanic_menu_closed_description'),
                        duration = 5000,
                        position = 'center-right',
                        type = 'error'
                    })
                end,
                options = menuOptions
            })

            lib.showContext('open_mechanic_desk_menu')
        elseif Config.Menu == 'lation' then
            local lation_ui = exports.lation_ui
            local menuOptions = {
                {
                    title = locale('info.mechanic_request_assistance_header'),
                    icon = 'fa-solid fa-user-gear',
                    iconColor = '#FFFFFF',
                    description = locale('info.mechanic_request_assistance_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.mechanic_request_repair_kit_header'),
                    icon = 'fa-solid fa-toolbox',
                    iconColor = '#FFFFFF',
                    description = locale('info.mechanic_request_repair_kit_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.mechanic_request_repair_upgrade_header'),
                    icon = 'fa-solid fa-screwdriver-wrench',
                    iconColor = '#FFFFFF',
                    description = locale('info.mechanic_request_repair_upgrade_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.mechanic_request_job_information_header'),
                    icon = 'fa-solid fa-briefcase',
                    iconColor = '#FFFFFF',
                    description = locale('info.mechanic_request_job_information_description'),
                    arrow = true,
                    onSelect = function() end,
                    event = ''
                },
                {
                    title = locale('info.mechanic_close_menu_header'),
                    icon = 'fa-solid fa-right-from-bracket',
                    iconColor = '#FFFFFF',
                    description = locale('info.mechanic_close_menu_description'),
                    arrow = true,
                    onSelect = function()
                        lation_ui:hideMenu()
                        lation_ui:notify({
                            title = locale('error.mechanic_menu_closed_title'),
                            message = locale('error.mechanic_menu_closed_description'),
                            type = 'error',
                            duration = 5000,
                            position = 'center-right'
                        })
                    end
                }
            }

            lation_ui:registerMenu({
                id = 'open_mechanic_desk_menu',
                title = locale('info.mechanic_menu_header'),
                canClose = true,
                position = 'offcenter-right',
                onExit = function()
                    lation_ui:notify({
                        title = locale('error.mechanic_menu_closed_title'),
                        message = locale('error.mechanic_menu_closed_description'),
                        type = 'error',
                        duration = 5000,
                        position = 'center-right'
                    })
                end,
                options = menuOptions
            })

            lation_ui:showMenu('open_mechanic_desk_menu')
        end
    end

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
                    }, {}, {}, {}, function()
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
                            TriggerEvent('stark_frontdesk:client:openPoliceMenu')
                        else
                            QBCore.Functions.Notify(locale('error.alert_dialog_cancelled_description'), 'error', 5000)
                        end
                    end, function()
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
                        TriggerEvent('stark_frontdesk:client:openPoliceMenu')
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
                        TriggerEvent('stark_frontdesk:client:openPoliceMenu')
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
                        TriggerEvent('stark_frontdesk:client:openPoliceMenu')
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
                TriggerEvent('stark_frontdesk:client:openPoliceMenu')
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
                            TriggerEvent('stark_frontdesk:client:openAmbulanceMenu')
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
                        TriggerEvent('stark_frontdesk:client:openAmbulanceMenu')
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
                        TriggerEvent('stark_frontdesk:client:openAmbulanceMenu')
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
                        TriggerEvent('stark_frontdesk:client:openAmbulanceMenu')
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
                TriggerEvent('stark_frontdesk:client:openAmbulanceMenu')
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
                            TriggerEvent('stark_frontdesk:client:openMechanicMenu')
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
                        TriggerEvent('stark_frontdesk:client:openMechanicMenu')
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
                        TriggerEvent('stark_frontdesk:client:openMechanicMenu')
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
                        TriggerEvent('stark_frontdesk:client:openMechanicMenu')
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
                TriggerEvent('stark_frontdesk:client:openMechanicMenu')
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

    RegisterNetEvent('stark_frontdesk:client:openPoliceMenu', function()
        if not GetInvokingResource() then return end
        createPoliceMenu()
    end)

    RegisterNetEvent('stark_frontdesk:client:openAmbulanceMenu', function()
        if not GetInvokingResource() then return end
        createAmbulanceMenu()
    end)

    RegisterNetEvent('stark_frontdesk:client:openMechanicMenu', function()
        if not GetInvokingResource() then return end
        createMechanicMenu()
    end)

    -- Event Handlers
    AddEventHandler('onResourceStop', function(resourceName)
        if GetCurrentResourceName() == resourceName then
            TriggerEvent('stark_frontdesk:client:removePoliceZones')
            Wait(1000)
            TriggerEvent('stark_frontdesk:client:removeAmbulanceZones')
            Wait(1000)
            TriggerEvent('stark_frontdesk:client:removeMechanicZones')
        end
    end)

    -- Threads
end

if Config.Framework == 'qbx' then
    -- Functions
    -- Events
    -- Threads
end
