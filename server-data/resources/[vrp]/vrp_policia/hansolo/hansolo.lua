local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = Tunnel.getInterface("vrp_policia")

local checar = false

RegisterNetEvent('checarCarregado')
AddEventHandler('checarCarregado',function(status)
    checar = status
end)

Citizen.CreateThread(function()
    while true do
        local idle = 1000
        if checar then
           idle = 100
           local playerPed = PlayerPedId()
           local vehicle = GetVehiclePedIsIn(playerPed, false)
 
              if (GetPedInVehicleSeat(vehicle,-1) == playerPed) or (GetPedInVehicleSeat(vehicle,0) == playerPed) or (GetPedInVehicleSeat(vehicle,1) == playerPed) or (GetPedInVehicleSeat(vehicle,2) == playerPed) or (GetPedInVehicleSeat(vehicle,3) == playerPed) or (GetPedInVehicleSeat(vehicle,4) == playerPed) then else
                TriggerServerEvent("checar:cv",source)
            end
        end
        Citizen.Wait(idle)
    end
end)

RegisterNetEvent("rmascara")
AddEventHandler("rmascara",function()
	SetPedComponentVariation(PlayerPedId(),1,0,0,2)
end)

RegisterNetEvent("rcolete")
AddEventHandler("rcolete",function()
	SetPedComponentVariation(PlayerPedId(),9,0,0,2)
end)

RegisterNetEvent("rchapeu")
AddEventHandler("rchapeu",function()
	ClearPedProp(PlayerPedId(),0)
end)

RegisterNetEvent("setalgemas")
AddEventHandler("setalgemas",function()
	local ped = PlayerPedId()
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		SetPedComponentVariation(ped,7,41,0,2)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		SetPedComponentVariation(ped,7,25,0,2)
	end
end)

RegisterNetEvent("removealgemas")
AddEventHandler("removealgemas",function()
	SetPedComponentVariation(PlayerPedId(),7,0,0,2)
end)

local blacklistedWeapons = {
	"GADGET_PARACHUTE",
	"WEAPON_PETROLCAN",
	"WEAPON_FLARE",
	"WEAPON_FIREEXTINGUISHER",

	"WEAPON_KNIFE",
	"WEAPON_DAGGER",
	"WEAPON_KNUCKLE",
	"WEAPON_MACHETE",
	"WEAPON_SWITCHBLADE",
	"WEAPON_WRENCH",
	"WEAPON_HAMMER",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_HATCHET",
	"WEAPON_FLASHLIGHT",
	"WEAPON_BAT",
	"WEAPON_BOTTLE",
	"WEAPON_BATTLEAXE",
	"WEAPON_POOLCUE",
	"WEAPON_STONE_HATCHET",
	"WEAPON_NIGHTSTICK",

	"WEAPON_STUNGUN"
}

Citizen.CreateThread(function()
    while true do
        sleep = 1000
        local ped = PlayerPedId()
        local blacklistweapon = false
        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
        
        
        if IsPedArmed(ped, 6) then
            sleep = 5
            if IsPedShooting(ped) then
                TriggerServerEvent('atirando',x,y,z,infos)
            end
        end
        Citizen.Wait(sleep)
    end
end)

local blips = {}
RegisterNetEvent('notificacao')
AddEventHandler('notificacao',function(x,y,z,user_id,infos)
	local player = vRP.getUserSource(parseInt(w))
        if not DoesBlipExist(blips[user_id]) then
            PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)		
            blips[user_id] = AddBlipForCoord(x,y,z)
            SetBlipScale(blips[user_id],0.5)
            SetBlipSprite(blips[user_id],10)
            SetBlipColour(blips[user_id],49)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Disparos de arma de fogo")
            EndTextCommandSetBlipName(blips[user_id])
            SetBlipAsShortRange(blips[user_id],false)
            SetTimeout(20000,function()   -- MUDA O TEMPO DO TEMPO DE SUMIR O BLIP E APARECER outro
                if DoesBlipExist(blips[user_id]) then
                    RemoveBlip(blips[user_id])
                end
            end)
        end

end)

other = nil
drag = false
carregado = false

RegisterNetEvent("carregar")
AddEventHandler("carregar",function(p1)
    other = p1
    drag = not drag
end)

Citizen.CreateThread(function()
    while true do
    	local idle = 1000
		if drag and other then
			idle = 5
			local ped = GetPlayerPed(GetPlayerFromServerId(other))
			Citizen.InvokeNative(0x6B9BBD38AB0796DF,PlayerPedId(),ped,4103,11816,0.48,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
			carregado = true
		else
			idle = 5
        	if carregado then
				DetachEntity(PlayerPedId(),true,false)
				carregado = false
			end
		end
		Citizen.Wait(idle)
	end
end)

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if not IsPedInAnyVehicle(PlayerPedId()) then
			idle = 5
			if IsControlJustPressed(0,47) then
				TriggerServerEvent("vrp_policia:algemar")
			end
			if IsControlJustPressed(0,74) then
				TriggerServerEvent("vrp_policia:carregar")
			end
		end
		Citizen.Wait(idle)
	end
end)

--[[RegisterCommand('policia:algemar', function()
    TriggerServerEvent("vrp_policia:algemar")
end, false)

RegisterCommand('policia:carregar', function()
    TriggerServerEvent("vrp_policia:carregar")
end, false)
--]]

RegisterKeyMapping("policia:algemar","Algemar alguém","keyboard","G")
RegisterKeyMapping("policia:carregar","Carregar alguém","keyboard","H")


Citizen.CreateThread(function()
	while true do
		local timings = 1000
		local veh = GetVehiclePedIsIn(PlayerPedId(),false)
		local vcoord = GetEntityCoords(veh)
		local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-0.94)
		if IsPedInAnyVehicle(PlayerPedId()) then
			timings = 500
			if DoesObjectOfTypeExistAtCoords(vcoord.x,vcoord.y,vcoord.z,0.9,GetHashKey("p_ld_stinger_s"),true) then
				SetVehicleTyreBurst(veh,0,true,1000.0)
				SetVehicleTyreBurst(veh,1,true,1000.0)
				SetVehicleTyreBurst(veh,2,true,1000.0)
				SetVehicleTyreBurst(veh,3,true,1000.0)
				SetVehicleTyreBurst(veh,4,true,1000.0)
				SetVehicleTyreBurst(veh,5,true,1000.0)
				SetVehicleTyreBurst(veh,6,true,1000.0)
				SetVehicleTyreBurst(veh,7,true,1000.0)
				if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey("p_ld_stinger_s"),true) then
					spike = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey("p_ld_stinger_s"),false,false,false)
					Citizen.InvokeNative(0xAD738C3085FE7E11,spike,true,true)
					SetObjectAsNoLongerNeeded(Citizen.PointerValueIntInitialized(spike))
					DeleteObject(spike)
				end
			end
		end
		Citizen.Wait(timings)
	end
end)


--[[local maquina = {
	{ ['x'] = -1094.83, ['y'] = -830.26, ['z'] = 10.28, ['h'] = 125.71 }
}

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local idle = 1000
		for k,v in pairs(maquina) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local maquina = maquina[k]
			
			if distance < 5.1 then
				DrawMarker(23, maquina.x, maquina.y, maquina.z-0.99, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 136, 96, 240, 180, 0, 0, 0, 0)
				idle = 5
				if distance < 1.2 then
					if IsControlJustPressed(0,38) and src.checkPermissao() then
						src.periciaDinheiro()
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

RegisterNetEvent('checando:dinheiro')
AddEventHandler('checando:dinheiro',function(status)
	local ped = PlayerPedId()
	FreezeEntityPosition(ped,true)
	SetEntityHeading(ped, 125.71)
	SetEntityCoords(ped, -1094.83, -830.26, 10.28-0.95, false, false, false, false)
	SetTimeout(25000,function()
		FreezeEntityPosition(ped,false)
	end)
end)]]

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if reducaopenal then
			idle = 5
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,21,true)
			DisableControlAction(0,22,true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,32,true)
			DisableControlAction(0,33,true)
			DisableControlAction(0,34,true)
			DisableControlAction(0,35,true)
			DisableControlAction(0,56,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,75,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,177,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,188,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,243,true)
			DisableControlAction(0,245,true)
			DisableControlAction(0,246,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,268,true)
			DisableControlAction(0,269,true)
			DisableControlAction(0,270,true)
			DisableControlAction(0,271,true)
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,303,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,344,true)
		end
		Citizen.Wait(idle)
	end
end)

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end



-----------------------------------------------------------------------------------------------------------------------------------
-- ANDAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("homem",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@confident")
	end
end)

RegisterCommand("mulher",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@heels@c")
	end
end)

RegisterCommand("depressivo",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@depressed@a")
	end
end)

RegisterCommand("depressiva",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@depressed@a")
	end
end)

RegisterCommand("empresario",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@business@a")
	end
end)

RegisterCommand("determinado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@brave@a")
	end
end)

RegisterCommand("descontraido",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@casual@a")
	end
end)

RegisterCommand("farto",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@fat@a")
	end
end)

RegisterCommand("estiloso",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@hipster@a")
	end
end)

RegisterCommand("ferido",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@injured")
	end
end)

RegisterCommand("nervoso",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@hurry@a")
	end
end)

RegisterCommand("desleixado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@hobo@a")
	end
end)

RegisterCommand("infeliz",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@sad@a")
	end
end)

RegisterCommand("musculoso",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@muscle@a")
	end
end)

RegisterCommand("desligado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@shadyped@a")
	end
end)

RegisterCommand("fadiga",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@buzzed")
	end
end)

RegisterCommand("apressado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@hurry_butch@a")
	end
end)

RegisterCommand("descolado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@money")
	end
end)

RegisterCommand("corridinha",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@quick")
	end
end)

RegisterCommand("piriguete",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@maneater")
	end
end)

RegisterCommand("petulante",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@sassy")
	end
end)

RegisterCommand("arrogante",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@arrogant@a")
	end
end)

RegisterCommand("bebado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@drunk@slightlydrunk")
	end
end)

RegisterCommand("bebado2",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@drunk@verydrunk")
	end
end)

RegisterCommand("bebado3",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@drunk@moderatedrunk")
	end
end)

RegisterCommand("irritado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@fire")
	end
end)

RegisterCommand("intimidado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_m@intimidation@cop@unarmed")
	end
end)

RegisterCommand("poderosa",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@handbag")
	end
end)

RegisterCommand("chateado",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@injured")
	end
end)

RegisterCommand("estilosa",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@posh@")
	end
end)

RegisterCommand("sensual",function(source,args)
	if not prisioneiro then
		vRP.loadAnimSet("move_f@sexy@a")
	end
end)