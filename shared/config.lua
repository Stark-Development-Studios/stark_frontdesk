return {
    VersionCheck = true,

    Framework = 'qbx', -- supported: 'qb' or 'qbx'

    Target = 'ox',     -- supported: 'qb' or 'ox'

    Notify = {
        enabled = true,    -- True To Enable Notifications, False To Disable
        style = 'ox',      --  supported: 'qb', 'ox', or 'lation'
        duration = 10000,  -- Configurable Notification Duration Length
        disabledJobs = {}, -- Dispatch.enabled Must Be True In Order For These Jobs To Not Get Both Notifications and Dispatch Alerts
    },

    Dispatch = {
        enabled = false,       -- True To Enable A Dispatch System, False To Disable
        style = 'cd_dispatch', -- supported: 'cd_dispatch' or 'ps-dispatch'
    },

    Menu = 'ox',   -- supported: 'qb', 'ox', or 'lation'

    PoliceJobs = { -- Which Police Jobs Will Receive The Notifications or Dispatch Alerts
        'police',
        'lscso',
        'sast',
        'bcso',
        'sasp',
        -- add your server's police job here as found in qb-core/shared/jobs.lua or qbx_core/shared/jobs.lua
    },

    AmbulanceJobs = { -- Which EMS Jobs Will Receive The Notifications or Dispatch Alerts
        'ambulance',
        -- add your server's ambulance job here as found in qb-core/shared/jobs.lua or qbx_core/shared/jobs.lua
    },

    MechanicJobs = { -- Which Mechanic Jobs Will Receive Notifications
        'mechanic',
        'mechanic2',
        'mechanic3',
        'beeker',
        'bennys',
        'cruisin',
        -- add your server's mechanic job here as found in qb-core/shared/jobs.lua or qbx_core/shared/jobs.lua
    },

    PoliceLocations = {
        [1] = {
            name = 'Mission Row Police Department',
            coords = '',
        },

        [2] = {
            name = 'Los Santos County Sheriff\'s Office',
            coords = '',
        },

        [3] = {
            name = 'San Anderas State Police',
            coords = '',
        },

        -- Add Other Department Locations
    },

    AmbulanceLocations = {
        [1] = {
            name = 'Pillbox Hill Medical Center',
            coords = '',
        },

        [2] = {
            name = 'Mount Zonah Medical Center',
            coords = '',
        },

        [3] = {
            name = 'Sandy Shores Clinic',
            coords = '',
        },

        -- Add Other Hospital Locations
    },

    MechanicLocations = {
        [1] = {
            name = 'Cruisin\' Craftsmen',
            coords = '',
        },

        -- Add Other Mechanic Locations
    },
}
