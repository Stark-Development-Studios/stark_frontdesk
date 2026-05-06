fx_version 'cerulean'

use_experimental_fxv2_oal 'yes'

lua54 'yes'

game 'gta5'

name 'stark_frontdesk'

author 'Adama Stark'

version '1.0.1'

repository 'https://github.com/Stark-Development-Studios/stark_frontdesk'

description 'A Civilian LEO/EMS Non-Emergency Interaction Script For Qbox & QBCore'

ox_lib 'locale'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'bridge/client/**.lua',
    'client/*.lua',
}

server_scripts {
    'bridge/server/**.lua',
    'server/*.lua'
}

files {
    'shared/config.lua',
    'locales/*.json',
}

dependency {
    'ox_lib'
}
