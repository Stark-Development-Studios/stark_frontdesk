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

    Progress = {
        enabled = true,
        style = 'ox_circle', -- supported: 'qb', 'ox_bar', 'ox_circle', or 'lation'
        duration = 1500
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
            coords = vector3(445.07, -980.67, 30.71),
        },

        [2] = {
            name = 'Los Santos County Sheriff\'s Office',
            coords = vector3(1818.41, 3670.64, 34.71),
        },

        [3] = {
            name = 'San Anderas State Police',
            coords = vector3(-584.15, -417.18, 35.18),
        },

        -- Add Other Department Locations
    },

    AmbulanceLocations = {
        [1] = {
            name = 'Pillbox Hill Medical Center',
            coords = vector3(311.76, -581.04, 43.27),
        },

        [2] = {
            name = 'Mount Zonah Medical Center',
            coords = vector3(-434.01, -326.45, 34.91),
        },

        [3] = {
            name = 'Sandy Shores Clinic',
            coords = vector3(1672.25, 3665.42, 35.34),
        },

        -- Add Other Hospital Locations
    },

    MechanicLocations = {
        [1] = {
            name = 'Cruisin\' Craftsmen',
            coords = vector3(-327.5, -1335.91, 31.45),
        },

        -- Add Other Mechanic Locations
    },
}
