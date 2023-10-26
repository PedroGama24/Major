RegisterServerEvent("c2n_taskbar:taskResult")
function getTaskBar(source,dificulty,title)
    local __result = nil
    TriggerClientEvent("c2n_taskbar:getTaskBar",source,dificulty,title)
    AddEventHandler("c2n_taskbar:taskResult",function(result)
        __result = result
    end)
    while true do
        if __result ~= nil then
            return __result
        end
        Citizen.Wait(100)
    end
end