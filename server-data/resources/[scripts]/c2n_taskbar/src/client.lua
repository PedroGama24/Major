local opened = false
local task_result = nil

function getTaskBar(dificulty,title)
    if not opened then
        if not dificulty then
            dificulty = "medio"
        end
        if not title then
            title = "Taskbar"
        end
        opened = true
        SetNuiFocus(true,false)
        SendNUIMessage({ show = true, showTaskbar = true, dificulty = cfg.dificuldade[dificulty], title = title })
        while true do
            if task_result == "success" then
                task_result = nil
                return true
            elseif task_result == "failed" then
                task_result = nil
                return false
            end
            Citizen.Wait(100)
        end
    end
end

RegisterNUICallback("c2n:Callbacks",function(data)
    task_result = data.result
    if data.focus == false then
        opened = false
        SetNuiFocus(false,false)
    end
end)     

RegisterNetEvent("c2n_taskbar:getTaskBar")
AddEventHandler("c2n_taskbar:getTaskBar",function(dificulty,title)
    TriggerServerEvent("c2n_taskbar:taskResult",exports['c2n_taskbar']:getTaskBar(dificulty,title))
end)

-- RegisterCommand("taskbar",function(source,args,rawCommand)
--     local taskResult = exports['c2n_taskbar']:getTaskBar("facil","C2N Taskbar")
--     if taskResult then
--         print("Sucesso")
--     else
--         print("Falhou")
--     end
-- end)
