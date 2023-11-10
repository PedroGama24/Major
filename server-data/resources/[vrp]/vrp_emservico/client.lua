local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

ykP = Tunnel.getInterface("vrp_emservico")
local onservicePOLICE = false
local onserviceEMS = false
local onserviceTAXI = false
local onserviceMEC = false
local onserviceConce = false
local onserviceAdv = false
local onserviceBurger = false

local emservicoPolicia = {
    {2597.0104980469,5337.5141601562,47.674739837646},   -- PRF
    {264.82, -338.19, 45.79},   -- PC
    {-2094.44, -471.08, 12.23},   -- ROTA
    {2508.06,-333.08,101.9},   -- PMESP
    {40.95, 6521.64, 32.5},   -- BAEP
    {-2345.6645507812,3268.6958007812,32.81076049804},   -- EXERCITO
}

local emservicoEMS = {
    {-432.35018920898,-318.90771484375,34.910766601562},
    {-1127.3, -1695.14, 5.05},
}


local emservicoTaxi = {
    {894.29254150391,-173.13482666016,81.594970703125}
}

local emservicoConce = {
    {125.5856628418,-129.19332885742,60.488426208496}
}

local emservicoAdv = {
    {166.88432312012,-1102.2434082031,29.323265075684}
}

local emservicoMecanico = {
{893.78, -2099.46, 34.89}

}

local emservicoBurgershot = {
    {-1192.96, -901.08, 14.0}
    
    }

local contador = 0

Citizen.CreateThread(function()
    while true do
        local skips = 1000
        for k,v in ipairs(emservicoPolicia) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 88, 179, 252, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001,255, 255, 255, 70, 1, 0, 0, 1)
                if onservicePOLICE and contador == 0 and distance <= 1.5 then
                    skips = 5
					DrawText3d(x, y, z+0.5, "~r~[ F ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,49)) then
                        local ped = PlayerPedId()
                        ykP.offService(source)
                        SetPedArmour(ped, 0)
                        RemoveAllPedWeapons(ped,true)
                        SetPedComponentVariation(ped, 9, 0, 0, 0)
                        onservicePOLICE = false
                        contador = 2
                    end
                elseif not onservicePOLICE and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onservicePOLICE = true
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoEMS) do
            local x,y,z = table.unpack(v)
            local ped = PlayerPedId()
            local pCoords = GetEntityCoords(ped)
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceEMS and contador == 0 and distance <= 1.5 then
                    skips = 5
					DrawText3d(x, y, z+0.5, "~r~[ F ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,49)) then
                        ykP.offService(source)
                        SetPedArmour(ped, 0)
                        RemoveAllPedWeapons(ped,true)
                        SetPedComponentVariation(ped, 9, 0, 0, 0)
                        TriggerEvent('emp_paramedico:encerrarJob')
                        onserviceEMS = false
                        contador = 2
                    end
                elseif not onserviceEMS and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1, 49)) and ykP.emServico() then
                        TriggerEvent('emp_paramedico:iniciarJob')
                        TriggerEvent('paycheck:iniciarContador')
                        onserviceEMS = true
                        contador = 2
                    end
                end
            end
        end


        for k,v in ipairs(emservicoTaxi) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceTAXI and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~r~[ F ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,49)) then
                        ykP.offService(source)
                        TriggerEvent('emp_taxista:encerrarJob')
                        onserviceTAXI = false
                        contador = 2
                    end
                elseif not onserviceTAXI and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceTAXI = true
                        TriggerEvent('emp_taxista:iniciarJob')
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoConce) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceConce and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~r~[ F ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,49)) then
                        ykP.offService(source)
                        TriggerEvent('emp_taxista:encerrarJob')
                        onserviceConce = false
                        contador = 2
                    end
                elseif not onserviceConce and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceConce = true
                        TriggerEvent('emp_taxista:iniciarJob')
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoAdv) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceAdv and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~r~[ F ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,49)) then
                        ykP.offService(source)
                        TriggerEvent('emp_taxista:encerrarJob')
                        onserviceAdv = false
                        contador = 2
                    end
                elseif not onserviceAdv and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceAdv = true
                        TriggerEvent('emp_taxista:iniciarJob')
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end

        for k,v in ipairs(emservicoBurgershot) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 255, 0, 0, 70, 1, 0, 0, 1)
                if onserviceBurger and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~r~[ F ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,49)) then
                        ykP.offService(source)
                        onserviceBurger = false
                        contador = 2
                    end
                elseif not onserviceBurger and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceBurger = true
                        contador = 2
                    end
                end
            end
        end

        for k,v in ipairs(emservicoMecanico) do
            local x,y,z = table.unpack(v)
            local pCoords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, x, y, z, true)
            if distance < 5.0 then
                alpha = math.floor(255 - (distance * 30))
                skips = 5
                DrawMarker(23, x, y, z-0.97, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255, 255, 255, 155, 0, 0, 0, 0)
                skips = 5
                DrawMarker(21, x, y, z-0.5, 0, 0, 0, 0, 180.0, 0, 0.3, 0.5, 0.5001, 0, 255, 25, 70, 1, 0, 0, 1)
                if onserviceMEC and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~r~[ F ] ~w~PARA SAIR DO EXPEDIENTE", alpha)
                    if (IsControlJustPressed(1,49)) then
                        ykP.offService(source)
                        onserviceMEC = false
                        contador = 2
                    end
                elseif not onserviceMEC and contador == 0 and distance <= 1.5 then
                    skips = 5
                    DrawText3d(x, y, z+0.5, "~g~[ F ] ~w~PARA INICIAR O EXPEDIENTE", alpha)
                    if IsControlJustPressed(1, 49) and ykP.emServico() then
                        onserviceMEC = true
                        contador = 2
                        TriggerEvent('paycheck:iniciarContador')
                    end
                end
            end
        end
        Citizen.Wait(skips)
    end
end)


RegisterNetEvent('vrp_emservico:receberColete')
AddEventHandler('vrp_emservico:receberColete', function()
    local ped = PlayerPedId()
    SetPedArmour(ped, 100)
end)

------------ CONTADOR
Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if contador > 0 then
            contador = contador - 2
        end
    end
end)
------------

function DrawText3d(x,y,z, text, alpha)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(0.5, 0.5)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, alpha)
        SetTextDropshadow(0, 0, 0, 0, alpha)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        SetDrawOrigin(x,y,z, 0)
        DrawText(0.0, 0.0)
        ClearDrawOrigin()
    end
end