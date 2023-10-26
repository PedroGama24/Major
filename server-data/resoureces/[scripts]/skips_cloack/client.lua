local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface(GetCurrentResourceName())
cfg = module(GetCurrentResourceName(), "config")

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        for k,v in pairs(cfg.cloackroom) do
            local distance = #(GetEntityCoords(PlayerPedId()) - v.coords) 
            if distance < 2 then
                sleep = 1
                DrawMarker(27,v.coords[1],v.coords[2],v.coords[3]-1,0,0,0,0.0,0,0,0.6,0.6,0.5,0,0,255,50,0,0,0,1)
                DrawText3Ds(v.coords[1],v.coords[2],v.coords[3],"PRESSIONA ~b~E~w~ PARA ABRIR "..k.."")
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterKeyMapping("mpr:cloackroom:open","Abrir cloackroom","keyboard","E")

RegisterCommand("mpr:cloackroom:open", function()
    for k,v in pairs(cfg.cloackroom) do
        local distance = #(GetEntityCoords(PlayerPedId()) - v.coords) 
        if distance < 1 then
            if vSERVER.checkPerm(k) then
                if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then  -- MASCULINO
                    SetNuiFocus(true, true)
                    SendNUIMessage({ action = "open", organization = k, sexuality = "male", cfg = cfg.cloackroom[k] })
                    break
                elseif GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01") then -- FEMININO
                    SetNuiFocus(true, true)
                    SendNUIMessage({ action = "open", organization = k, sexuality = "female", cfg = cfg.cloackroom[k] })
                    break
                end
            else
                TriggerEvent("Notify", "negado","Você não tem permissão")
            end
        end
    end
end)

RegisterNUICallback("select", function(data,cb)
    SetNuiFocus(false, false)
    vSERVER.setPreset(data.org,data.cloack)
end)

RegisterNUICallback("close", function(data,cb)
    SetNuiFocus(false, false)
end)


function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    SetTextScale(0.34, 0.34)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370 +0.02
    DrawRect(_x,_y+0.0125, 0.001+ factor, 0.028, 0, 0, 0, 78)
end
