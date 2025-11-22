return {
    VersionCheck = true,

    Framework = 'qbx', -- supported: 'qb' or 'qbx'

    Target = 'ox',     -- supported: 'qb' or 'ox'

    Notify = {
        enabled = true,   -- True To Enable Notifications, False To Disable
        style = 'ox',     --  supported: 'qb', 'ox', or 'lation'
        duration = 10000, -- Configurable Notification Duration Length
    },

    Dispatch = {
        enabled = false,       -- True To Enable A Dispatch System, False To Disable
        style = 'cd_dispatch', -- supported: 'cd_dispatch' or 'ps-dispatch'
    },

    Menu = 'ox', -- supported: 'qb', 'ox', or 'lation'

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
        }
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
        }
    },

    MechanicLocations = {
        [1] = {
            name = 'Cruisin\' Craftsmen',
            coords = '',
        },
    },
}
