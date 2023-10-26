local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","vrp_skips")

src = {}
Tunnel.bindInterface("vrp_skips",src)
vSERVER = Tunnel.getInterface("vrp_skips")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local chamou = false
local blips = {}

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
       
        if health <= 105 and not chamou then
            if vSERVER.getAppleWatch() then
                chamou = true
                vSERVER.chamarHospital()
            end
        elseif health > 105 and chamou then
            chamou = false
        end

        Citizen.Wait(1000)
    end
end)

local applewatch = false

Citizen.CreateThread(function()
	while true do
        applewatch = vSERVER.getAppleWatch()
        if applewatch then
            if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then
                SetPedPropIndex(PlayerPedId(), 6, 22,0,0 or 2)
            elseif GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01") then
                SetPedPropIndex(PlayerPedId(), 6, 11,0,0 or 2)
            end
        else
            if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then
                if tonumber(GetPedPropIndex(PlayerPedId(),6)) == 22 then
                    SetPedPropIndex(PlayerPedId(), 6, 2,0,0 or 2)
                end
            elseif GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01") then
                if tonumber(GetPedPropIndex(PlayerPedId(),6)) == 11 then
                    SetPedPropIndex(PlayerPedId(), 6, 1,0,0 or 2)
                end
            end
        end
        Citizen.Wait(1500)
	end 
end)

function src.criarRota(x,y,z)
    blips = AddBlipForCoord(x,y,z)
    SetBlipSprite(blips,353)
    SetBlipColour(blips,1)
    SetBlipScale(blips,0.4)
    SetBlipAsShortRange(blips,false)
    SetBlipRoute(blips,true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("SMART WATCH")
    EndTextCommandSetBlipName(blips)
end
