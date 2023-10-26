local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("emp_minerador")
----------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local impacts = 0
local isMining = false
----------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timedistance = 1000
		if not servico then
		  for _,v in pairs(config.start) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			    if distance <= 5.0 then
				DrawText3D(v.x,v.y,v.z+0.9, "~w~PRESSIONE ~y~E ~w~PARA INICIAR O ~y~SERVICO")					
				timedistance = 5
				if distance <= 2.0 then
					if IsControlJustPressed(0,38) then
						TriggerEvent("Notify","sucesso","Trabalho iniciado com sucesso",8000)	
						servico = true
						selecionado = math.random(#config.rota)
						CriandoBlip(config.rota,selecionado)	
					    end
				    end
			    end
		    end
	     end
	    Citizen.Wait(timedistance)
    end
end)
----------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timedistance = 1000
		if servico then
			local ped = PlayerPedId()
			local vehicle = GetPlayersLastVehicle()			
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(config.rota[selecionado].x,config.rota[selecionado].y,config.rota[selecionado].z)
			local distance = GetDistanceBetweenCoords(config.rota[selecionado].x,config.rota[selecionado].y,cdz,x,y,z,true)
			if distance <= 50.0 then
			    timedistance = 5
				DrawText3D(config.rota[selecionado].x,config.rota[selecionado].y,config.rota[selecionado].z+0.2, "~g~E ~w~MINERAR")									
				if distance <= 1.5 then
					if IsControlJustPressed(0,38) then
						if emP.checkWeight() then
								servico = true
								minerar()
								emP.Notify()
								SetTimeout(7000, function()
								emP.checkPayment()
								Wait(500)
								TriggerEvent("Notify","aviso","Vá até o proximo ponto de mineração",8000)	
								end)
								Wait(6500)								
						        backentrega = selecionado
								while true do
									if backentrega == selecionado then
										selecionado = math.random(#config.rota)
									else
										break
									end
								Citizen.Wait(1)
							end
					    end
				    end
			    end
		    end
		    end
		Citizen.Wait(timedistance)
	end
end)
----------------------------------------------------------------------
function minerar()
	isMining = true
	Citizen.CreateThread(function()
		while impacts < 3 do
				local ped = PlayerPedId()
				RequestAnimDict("melee@hatchet@streamed_core")
				while (not HasAnimDictLoaded("melee@hatchet@streamed_core")) do Citizen.Wait(0) end
				TaskPlayAnim(ped, "melee@hatchet@streamed_core", "plyr_front_takedown_b", 8.0, -8.0, -1, 2, 0, false, false, false) 
				SetEntityHeading(ped, 270.0)
				FreezeEntityPosition(ped, true)
				if impacts == 0 then
					pickaxe = CreateObject(GetHashKey("prop_tool_pickaxe"), 0, 0, 0, true, true, true) 
					AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, false, true, 0, true)
				end  
				Citizen.Wait(2500)
				FreezeEntityPosition(PlayerPedId(), false)
				ClearPedTasks(PlayerPedId())
				impacts = impacts+1
				if impacts == 3 then
					DetachEntity(pickaxe, 1, true)
					DeleteEntity(pickaxe)
					DeleteObject(pickaxe)
					impacts = 0
					isMining = false	
	 			break
			end        
		end
	end)
end
-------------------------------
loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end
----------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		timedistance = 1000
		if servico then
			timedistance = 5
			drawTxt("PRESSIONE ~r~F7 ~w~PARA FINALIZAR O EXPEDIENTE",2,0.260,0.905,0.5,255,255,255,200)
			drawTxt("~w~ PROSSIGA ATE O SEU DESTINO ",2,0.260,0.929,0.5,255,255,255,200)
			if IsControlJustPressed(0,168) then
				TriggerEvent("Notify","aviso","Você saiu de servico",8000)			
				servico = false
				RemoveBlip(blips)
			end
		end
		Citizen.Wait(timedistance)
	end
end)
----------------------------------------------------------------------
function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(config.rota[selecionado].x,config.rota[selecionado].y,config.rota[selecionado].z)
	SetBlipSprite(blips,162)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Localidade de mineração")
	EndTextCommandSetBlipName(blips)
end

----------------------------------------------------------------------
Citizen.CreateThread(function()
	for k,v in pairs(config.start) do
		RequestModel(GetHashKey(v.hash2))
		while not HasModelLoaded(GetHashKey(v.hash2)) do
			Citizen.Wait(10)
		end

		local ped = CreatePed(4,v.hash,v.x,v.y,v.z-1,v.h,false,true)
		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped,true)
	end
end)
----------------------------------------------------------------------
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
----------------------------------------------------------------------
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(2)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 150)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
	local factor = (string.len(text) / 370) + 0.01	
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,38,42,56,200)
end

