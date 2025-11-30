if GetResourceState('qb-core') ~= 'started' or GetResourceState('qbx_core') == 'started' then return end

if not lib.checkDependency('ox_lib', '3.32.0', true) then return end