local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
job = Tunnel.getInterface("emp_corona_skips")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local quantidade = 0
local statuses = false
local nveh = nil
local pegando = false
local andamento = false
local propcaixa = nil
local propcaixa2 = nil
local propcaixa3 = nil
local propcaixa4 = nil
local propcaixa5 = nil
local propcaixa6 = nil
local propcaixa7 = nil
local propcaixa8 = nil
local propcaixa9 = nil
local propcaixa10 = nil
local caixanamao = false
local traseira = false
local portaaberta = false
local portaaberta2 = false
local encomendapega = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DE ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local entregavan = {
	[1] = {x=6.54,y=-262.54,z=47.22},
	[2] = {x=56.31,y=-282.23,z=47.42}, 
	[3] = {x=79.20,y=-289.59,z=46.67}, 
	[4] = {x=47.11,y=-219.62,z=51.49}, 
	[5] = {x=-48.41,y=-192.71,z=52.14}, 
	[6] = {x=-56.66,y=-47.83,z=62.53}, 
	[7] = {x=-334.99,y=119.27,z=66.91}, 
	[8] = {x=-395.92,y=133.14,z=65.46}, 
	[9] = {x=-598.03,y=139.68,z=60.00}, 
	[10] = {x=-644.00,y=169.00,z=61.17}, 
	[11] = {x=-633.66,y=206.96,z=73.93}, 
	[12] = {x=492.35,y=-1747.04,z=28.48}, 
	[13] = {x=474.544,y=-1813.12,z=27.97}, 
	[14] = {x=422.03,y=-1865.57,z=26.84}, 
	[15] = {x=337.00,y=-1946.08,z=24.30}, 
	[16] = {x=207.10,y=-2042.77,z=18.16}
}

local entregalocal = {
	[1] = {x= -428.3413, y= 294.2118 ,z= 83.26700}, 
	[2] = {x= -21.5459, y= 219.4016 ,z= 106.720}, 
	[3] = {x= 372.807, y= 340.903167 ,z= 103.33050}, 
	[4] = {x= 1144.6400, y= -299.0586 ,z= 68.90917}, 
	[5] = {x= 1119.652, y= -983.112 ,z= 46.327102}, 
	[6] = {x= -41.4461, y= -1747.8660 ,z= 29.409648}, 
	[7] = {x= 32.0340, y= -1315.7655 ,z= 29.5235}, 
	[8] = {x= -702.492431, y= -916.856 ,z= 19.2142028}, 
	[9] = {x= -1230.312, y= -904.3779 ,z= 12.1410}, 
	[10] = {x= -1473.0175, y= -363.334 ,z= 40.20634}, 
	[11] = {x= -2961.697, y= 376.8905 ,z= 15.0076}, 
	[12] = {x= 543.32244, y= 2659.0986 ,z= 42.17870}, 
	[13] = {x= 2005.916, y= 3046.2441 ,z= 47.21376}, 
	[14] = {x= 2553.60766, y= 399.379852 ,z= 108.6142}, 
	[15] = {x= 372.5050, y= 341.0015 ,z= 103.2396}, 
	[16] = {x= 197.836, y= 324.5246 ,z= 105.407}, 

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO TRABALHO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('emp_corona_skips:permissao')
AddEventHandler('emp_corona_skips:permissao',function()
	if not emservico then
		emservico = true
		parte = 0
		destino = math.random(1,16)
		TriggerEvent("Notify","importante","Voce entrou em <b>Serviço</b>, pegue o <b>Caminhão</b>!")
		ColocarRoupa()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local skips = 1000
		local ped = PlayerPedId()
		if GetDistanceBetweenCoords(GetEntityCoords(ped), -618.10229492188,340.931640625,85.192932128906,true) <= 30 then  --- pegar serviço
			skips = 1
		    DrawText3D(-618.10229492188,340.931640625,85.192932128906+0.47, "~w~Motorista", 1.0, 4)
		    DrawText3D(-618.10229492188,340.931640625,85.192932128906+0.33, "~b~Corona", 0.9, 1)
		    DrawMarker(21, -618.10229492188,340.931640625,85.192932128906-0.1, 0, 0, 0, 0, 0, 0, 0.8, 0.8, 0.5, 255, 80, 0, 90, 0, true, false, false)
		    if GetDistanceBetweenCoords(GetEntityCoords(ped), -618.10229492188,340.931640625,85.192932128906,true) <= 1 then
                if IsControlJustPressed(0,38) then	
				    TriggerServerEvent('emp_corona_skips:permissao')
				end
			end
		end
		if emservico and parte == 0 then
			if GetDistanceBetweenCoords(GetEntityCoords(ped), -557.55651855469,332.33200073242,84.582450866699,true) <= 20 then --- pegar caminhão
				skips = 1
		        DrawMarker(21,-557.55651855469,332.33200073242,84.582450866699-0.6,0,0,0,0,180.0,130.0,0.8,0.8,0.5,255,80,0,90,1,0,0,1)
		        if GetDistanceBetweenCoords(GetEntityCoords(ped), -557.55651855469,332.33200073242,84.582450866699,true) <= 1 then
                    if IsControlJustPressed(0,38) then	
                    	Fade(1200)
				        TriggerEvent("Notify","importante","Voce pegou o <b>Caminhão</b> na garagem, pegue as <b>caixa de cerverja</b> e coloque nele!")
		                spawnVan()
                        parte = 1
				    end
			    end
		    end
		end
		if emservico and parte == 1 then
			skips = 1
		    local veh = GetVanPosition(10)
			local coordsVan = GetOffsetFromEntityInWorldCoords(veh, 0.0, -6.7, 1.0)
			local model = GetEntityModel(veh)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),-609.78509521484,330.77069091797,85.192794799805,true) -- pegar pacote
			local distance2 = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsVan.x,coordsVan.y,coordsVan.z,true)
			if distance <= 50 and not pegando and portaaberta then
				
				DrawMarker(21,-609.78509521484,330.77069091797,85.192794799805-0.6,0,0,0,0,180.0,130.0,0.8,0.8,0.5,255,80,0,90,1,0,0,1)
				if distance < 1.5 and not IsPedInAnyVehicle(ped) then
                    if IsControlJustPressed(0,38) and not andamento then
                    	if quantidade < 10 then
                            pegando = true
                            andamento = true
                            caixanamao = true
                            TriggerEvent('cancelando',true)
                            vRP._CarregarObjeto("anim@heists@box_carry@","idle","v_ret_ml_beerpis2",50,28422)
                        else
                        	vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        	TriggerEvent("Notify","aviso","Voce colocou o máximo de <b>Caixa</b> no <b>VaCaminhãon</b>!")
                        end
					end
				end
			end
			if pegando and distance2 <= 1.5 and not IsPedInAnyVehicle(ped) then
                if model == 2112052861 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
					skips = 1
					DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~b~[E] ~w~Guardar")
					TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,38) and andamento then
                    	quantidade = quantidade + 1
                    	vRP._DeletarObjeto()
                        FreezeEntityPosition(ped,true)
                        RequestAnimDict("anim@heists@money_grab@briefcase")
				        while not HasAnimDictLoaded("anim@heists@money_grab@briefcase") do
					        Citizen.Wait(0) 
				        end
				        TaskPlayAnim(ped,"anim@heists@money_grab@briefcase","put_down_case",100.0,200.0,0.3,120,0.2,0,0,0)
				        Wait(800)
				        vRP._DeletarObjeto()
				        CaixaVan(veh,model)
                        Wait(600)
                        caixanamao = false
                        andamento = false
                        pegando = false
				        ClearPedTasksImmediately(ped)
                        FreezeEntityPosition(ped,false)
                        if quantidade == 10 then
                        	TriggerEvent("Notify","importante","Voce colocou <b>"..quantidade.."/10 Caixas</b> no <b>Caminhão</b>, feche as portas traseiras, entre nela e aguarde até receber uma <b>Entrega</b>!")
                        	vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        	portaaberta = false
                        	time = math.random(10000,15000)
                        	parte = 2
                        	Wait(time)
                            TriggerEvent("Notify","sucesso","Chamado recebido, entre no <b>Caminhão</b>, e vá ao <b>local</b> entregar as <b>Cervejas</b>!")
                        	vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                        	CriandoBlip(entregalocal,destino)
                        else
                        	TriggerEvent("Notify","importante","Voce colocou <b>"..quantidade.."/10 Caixas de cerveja </b> no <b>Caminhão</b>!")
                            vRP.playSound("5_Second_Timer","DLC_HEISTS_GENERAL_FRONTEND_SOUNDS")
                        end
					end
				end
			end
		end
		Citizen.Wait(skips)
	end
end)

Citizen.CreateThread(function()
	while true do
		sleep = 1000
		local ped = PlayerPedId()
		if emservico and parte == 2 then
		    local veh = GetVanPosition(10)
			local coordsVan = GetOffsetFromEntityInWorldCoords(veh, 0.0, -6.7, 1.0)
			local model = GetEntityModel(veh)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsVan.x,coordsVan.y,coordsVan.z, true)
			local distance2 = GetDistanceBetweenCoords(GetEntityCoords(ped),entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z,true)
			if not pegando and portaaberta2 and not encomendapega and distance <= 1.5 and not IsPedInAnyVehicle(ped) then
				if model == 2112052861 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
					sleep = 5
                    if IsControlJustPressed(0,58) and not andamento then
                    	if quantidade > 0 then
                    	    quantidade = quantidade - 1
                    	    encomendapega = true
                            TriggerEvent('cancelando',true)
                            FreezeEntityPosition(ped,true)
                            RequestAnimDict("pickup_object")
				            while not HasAnimDictLoaded("pickup_object") do
					            Citizen.Wait(0) 
				            end
				            TaskPlayAnim(ped,"pickup_object","pickup_low",100.0,200.0,0.3,120,0.2,0,0,0)
                            Wait(700)
                            pegando = true
				            ClearPedTasksImmediately(ped)
                            FreezeEntityPosition(ped,false)
                            vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
                            TriggerEvent("Notify","importante","Voce retirou <b>1x Encomenda</b> da <b>Van</b>!")
                            vRP._CarregarObjeto("anim@heists@box_carry@","idle","v_ret_ml_beerpis2",50,28422)
                            TirarCaixa()
                            andamento = true
                        else
                            parte = 1
                            vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        	TriggerEvent("Notify","aviso","Voce entregou todas as <b>Cervejas</b>, volte para a central e pegue mais!")
                            quantidade = 0
                        end
					end
				end
			end
			if pegando and portaaberta2 and encomendapega and distance <= 1.5 and not IsPedInAnyVehicle(ped) then
                if model == 2112052861 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
					sleep = 5
					TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,58) and andamento then
                    	quantidade = quantidade + 1
                    	encomendapega = false
                    	vRP._DeletarObjeto()
                        FreezeEntityPosition(ped,true)
                        RequestAnimDict("anim@heists@money_grab@briefcase")
				        while not HasAnimDictLoaded("anim@heists@money_grab@briefcase") do
					        Citizen.Wait(0) 
				        end
				        TaskPlayAnim(ped,"anim@heists@money_grab@briefcase","put_down_case",100.0,200.0,0.3,120,0.2,0,0,0)
				        Wait(800)
				        vRP._DeletarObjeto()
				        CaixaVan(veh,model)
                        Wait(600)
                        caixanamao = false
                        andamento = false
                        pegando = false
                        vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
				        ClearPedTasksImmediately(ped)
                        FreezeEntityPosition(ped,false)
                        TriggerEvent("Notify","importante","Voce colocou a <b>Cerveja</b> no <b>Caminhão</b>, atualmente com <b>"..quantidade.."/10 Caixas de cerveja</b>!")
					end
				end
			end
			if distance2 <= 50 and pegando and encomendapega then
				if distance2 < 30.0 and not IsPedInAnyVehicle(ped) then
					sleep = 5
					DrawMarker(21,entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z-0.6,0,0,0,0,180.0,130.0,0.8,0.8,0.5,255,80,0,90,1,0,0,1)
				--	DrawText3Ds(entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z+0.35,"~b~[E] ~w~Entregar Encomenda")
					TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,38) then
                    	if quantidade >= 0 then
                    		Fade(1200)
                    		local pagamento = math.random(600,1200)
                    		destinoantigo = destino
							pegando = false
							encomendapega = false
                            andamento = false
                            vRP._DeletarObjeto()
                            ClearPedTasksImmediately(ped)
                            TriggerServerEvent("emp_corona_skips:receber",pagamento)
                            portaaberta = false
                            RemoveBlip(blip)
                        	if quantidade > 0 then
                        		TriggerEvent("Notify","sucesso","<b>Cerveja</b> entregue, voce ganhou <b>$"..pagamento.."</b>, faltam entregar <b>"..quantidade.."/10 <b>Cervejas</b>!")
                                TriggerEvent("Notify","importante","Feche as portas traseiras, entre no <b>Caminhão</b> e aguarde até receber uma nova <b>Entrega</b>!")
                                time = math.random(20000,30000)
                        	    Wait(time)
                        	    TriggerEvent("Notify","sucesso","Chamado recebido, entre no <b>VaCaminhãon</b>, e vá ao <b>local</b> entregar as <b>cervejas</b>!")
                        	    vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                                while true do
                                    if destinoantigo == destino then
                                        destino = math.random(1,16)
                                    else
                                        break
                                    end
                                    Citizen.Wait(1)
                                end
                                CriandoBlip(entregalocal,destino)
                            else
                            	parte = 1
                        	    vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        	    quantidade = 0
                        	    destino = math.random(1,16)
                        	    pegando = false
							    encomendapega = false
                                andamento = false
                                portaaberta2 = false
                                portaaberta = false
                        	    TriggerEvent("Notify","aviso","Voce entregou todas as suas <b>cervejas</b>, volte para a central e pegue mais!")
                            end
                        end
					end
				end
			elseif distance2 <= 50 and not pegando and not encomendapega then
				sleep = 5
				DrawMarker(21,entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z-0.6,0,0,0,0,180.0,130.0,0.8,0.8,0.5,255,80,0,90,1,0,0,1)
				if distance2 < 30 and not IsPedInAnyVehicle(ped) then
					DrawMarker(21,entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z-0.6,0,0,0,0,180.0,130.0,0.8,0.8,0.5,255,80,0,90,1,0,0,1)
					DrawText3Ds(entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z+0.35,"~w~ Pegue a cerveja no ~b~Caminhão")
			    end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local skips = 1000
		local veh = GetVanPosition(10)
		local coordsVan = GetOffsetFromEntityInWorldCoords(veh, 0.0, -6.7, 0.0)
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),coordsVan.x,coordsVan.y,coordsVan.z,true)
		local model = GetEntityModel(veh)
		if distance <= 2.0 and not IsPedInAnyVehicle(PlayerPedId()) and emservico then
		    if model == 2112052861 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
			    if not traseira and not portaaberta and not portaaberta2 then
					skips = 1
			        DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~b~[E] ~w~Abrir")
			    	if IsControlJustPressed(0,38) then
				        SetVehicleDoorOpen(veh, 5, false, false)
				        traseira = true
				        portaaberta2 = true
				        if parte == 1 then
				            portaaberta = true
				        end
				    end
                elseif traseira and not portaaberta then
            	    if parte == 1 then
						skips = 1
	                    DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~b~[E] ~w~Fechar")
	                elseif parte == 2 and not encomendapega then
						skips = 1
	            	    DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~b~[E] ~w~Fechar | ~b~[G] ~w~Pegar caixa de cerveja")
	                elseif parte == 2 and encomendapega then
						skips = 1
	            	    DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~b~[E] ~w~Fechar | ~b~[G] ~w~Guardar caixa de cerveja")
	                end 
					skips = 1
				    if IsControlJustPressed(0,38) then
						SetVehicleDoorShut(veh, 5, false)
				        traseira = false
				        if parte == 2 then
				            portaaberta2 = false
				        end
				    end
                end
			end
		end
		if distance <= 3.0 and not IsPedInAnyVehicle(PlayerPedId()) and emservico then
			if model == 2112052861 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
				skips = 1
				DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.55,"  ~b~"..quantidade.."~w~  /  ~b~10    ")
			end
		end
		Citizen.Wait(skips)
    end
end)

Citizen.CreateThread(function()
	while true do
		sleep = 1000
		if andamento then
			sleep = 1
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,21,true)
			DisableControlAction(0,22,true)
		end
		Citizen.Wait(sleep)
	end
end)

function spawnVan()
	local mhash = "pounder"
	if not nveh then
	while not HasModelLoaded(mhash) do
	    RequestModel(mhash)
	    Citizen.Wait(10)
	end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		nveh = CreateVehicle(mhash,-565.37750244141,328.62063598633,84.412590026855+0.5,261.73,true,false)
		SetVehicleIsStolen(nveh,false)
		SetVehicleOnGroundProperly(nveh)
		SetEntityInvincible(nveh,false)
		SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
		Citizen.InvokeNative(0xAD738C3085FE7E11,nveh,true,true)
		SetVehicleHasBeenOwnedByPlayer(nveh,true)
		SetVehicleDirtLevel(nveh,0.0)
		SetVehRadioStation(nveh,"OFF")
		SetVehicleEngineOn(GetVehiclePedIsIn(ped,false),true)
		SetModelAsNoLongerNeeded(mhash)
	end
end

function Fade(time)
	DoScreenFadeOut(800)
	Wait(time)
	DoScreenFadeIn(800)
end

function FadeRoupa(time,tipo,idle_copy)
	DoScreenFadeOut(800)
	Wait(time)
	if tipo == 1 then 
		vRP.setCustomization(idle_copy)
	else
		TriggerServerEvent("emp_corona_skips:roupa")
	end
	DoScreenFadeIn(800)
end

local RoupaMotorista = {
	["Motorista"] = {
		[1885233650] = {
			[1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 42,0 },
            [4] = { 134,2 },
            [5] = { 0,0 },
            [6] = { 12,6 },
            [7] = { 0,0 },
            [8] = { 57,0 },
			[9] = { 13,0 },
            [10] = { -1,0 },
            [11] = { 363,2 },
			["p0"] = { 145,0 },
            ["p1"] = { 42,0 }
        },
		[-1667301416] = {    -- 1885233650                                  
			[1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 122,9 },
            [4] = { 141,2 },
            [5] = { 0,0 },
            [6] = { 55,0 },
            [7] = { 29,0 },
            [8] = { 6,0 },
			[9] = { 14,0 },
            [10] = { -1,0 },
            [11] = { 382,2 },
			["p0"] = { 144,0 },
            ["p1"] = { 0,0 }
        }
        
	}
}

function ColocarRoupa()
	if vRP.getHealth() > 101 then
		if not vRP.isHandcuffed() then
			local custom = RoupaMotorista["Motorista"]
			if custom then
				local old_custom = vRP.getCustomization()
				local idle_copy = {}

				idle_copy = job.SaveIdleCustom(old_custom)
				idle_copy.modelhash = nil

				for l,w in pairs(custom[old_custom.modelhash]) do
						idle_copy[l] = w
				end
				FadeRoupa(1200,1,idle_copy)
			end
		end
	end
end

function MainRoupa()
	if vRP.getHealth() > 101 then
		if not vRP.isHandcuffed() then
	        FadeRoupa(1200,2)
	    end
	end
end

function CaixaVan(veh,model)
	if quantidade <= 10 then
		RequestModel(GetHashKey("v_ret_ml_beerpis2"))
        while not HasModelLoaded(GetHashKey("v_ret_ml_beerpis2")) do
            Citizen.Wait(10)
        end
	    local coords = GetOffsetFromEntityInWorldCoords(veh,0.0,0.0,-5.0)
		if quantidade == 1 and model == 2112052861 then
			propcaixa = nil 
			propcaixa = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa,veh,0.0,-0.25,-3.0,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa,true)
		elseif quantidade == 2 and model == 2112052861 then
			propcaixa2 = nil
			propcaixa2 = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa2,veh,0.0,0.25,-3.0,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa2,true)
		elseif quantidade == 3 and model == 2112052861 then
			propcaixa3 = nil
			propcaixa3 = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa3,veh,0.0,-0.25,-3.5,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa3,true)
		elseif quantidade == 4 and model == 2112052861 then
			propcaixa4 = nil
			propcaixa4 = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa4,veh,0.0,0.25,-3.5,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa4,true)
		elseif quantidade == 5 and model == 2112052861 then
			propcaixa5 = nil
			propcaixa5 = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa5,veh,0.0,-0.25,-4.0,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa5,true)
		elseif quantidade == 6 and model == 2112052861 then
			propcaixa6 = nil
			propcaixa6 = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa6,veh,0.0,0.25,-4.0,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa6,true)
		elseif quantidade == 7 and model == 2112052861 then
			propcaixa7 = nil
			propcaixa7 = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa7,veh,0.0,-0.25,-4.5,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa7,true)
		elseif quantidade == 8 and model == 2112052861 then
			propcaix8 = nil
			propcaixa8 = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa8,veh,0.0,0.25,-4.5,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa8,true)
		elseif quantidade == 9 and model == 2112052861 then
			propcaixa9 = nil
			propcaixa9 = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa9,veh,0.0,-0.25,-5.0,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa9,true)
		elseif quantidade == 10 and model == 2112052861 then
			propcaix10 = nil
			propcaixa10 = CreateObject(GetHashKey("v_ret_ml_beerpis2"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa10,veh,0.0,0.25,-5.0,0.65,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa10,true)
		end
	end
end

function TirarCaixa()
	if quantidade == 0 then
        if DoesEntityExist(propcaixa) then
			DetachEntity(propcaixa,false,false)
			FreezeEntityPosition(propcaixa,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa))
            propcaixa = nil
        end
	elseif quantidade == 1 then
		if DoesEntityExist(propcaixa2) then
			DetachEntity(propcaixa2,false,false)
			FreezeEntityPosition(propcaixa2,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa2))
            propcaixa2 = nil
        end
	elseif quantidade == 2 then
		if DoesEntityExist(propcaixa3) then
			DetachEntity(propcaixa3,false,false)
			FreezeEntityPosition(propcaixa3,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa3))
            propcaixa3 = nil
        end
	elseif quantidade == 3 then
		if DoesEntityExist(propcaixa4) then
			DetachEntity(propcaixa4,false,false)
			FreezeEntityPosition(propcaixa4,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa4))
            propcaixa4 = nil
        end
	elseif quantidade == 4 then
		if DoesEntityExist(propcaixa5) then
			DetachEntity(propcaixa5,false,false)
			FreezeEntityPosition(propcaixa5,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa5))
            propcaixa5 = nil
        end
	elseif quantidade == 5 then
		if DoesEntityExist(propcaixa6) then
			DetachEntity(propcaixa6,false,false)
			FreezeEntityPosition(propcaixa6,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa6))
            propcaixa6 = nil
        end
    elseif quantidade == 6 then
		if DoesEntityExist(propcaixa7) then
			DetachEntity(propcaixa7,false,false)
			FreezeEntityPosition(propcaixa7,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa7))
            propcaixa7 = nil
        end
    elseif quantidade == 7 then
		if DoesEntityExist(propcaixa8) then
			DetachEntity(propcaixa8,false,false)
			FreezeEntityPosition(propcaixa8,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa8))
            propcaixa8 = nil
        end
    elseif quantidade == 8 then
		if DoesEntityExist(propcaixa9) then
			DetachEntity(propcaixa9,false,false)
			FreezeEntityPosition(propcaixa9,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa9))
            propcaixa9 = nil
        end
    elseif quantidade == 9 then
		if DoesEntityExist(propcaixa10) then
			DetachEntity(propcaixa10,false,false)
			FreezeEntityPosition(propcaixa10,false)
            TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa10))
            propcaixa10 = nil
        end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		sleep = 1000
		if emservico then
		sleep = 4
		if IsControlJustPressed(0,168)  then
			emservico = false
            quantidade = 0
            parte = 0
            statuses = false
            pegando = false
            andamento = false
            caixanamao = false
            traseira = false
            portaaberta = false
            portaaberta2 = false
            encomendapega = false
			TriggerEvent('cancelando',false)
			RemoveBlip(blip)
			vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
			MainRoupa()
			if nveh then
			    TriggerServerEvent("trydeleteveh",VehToNet(nveh))
			    nveh = nil
			end
			if DoesEntityExist(propcaixa) then
                DetachEntity(propcaixa,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa))
                propcaixa = nil
            end
		    if DoesEntityExist(propcaixa2) then
                DetachEntity(propcaixa2,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa2))
                propcaixa2 = nil
            end
		    if DoesEntityExist(propcaixa3) then
                DetachEntity(propcaixa3,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa3))
                propcaixa3 = nil
            end
		    if DoesEntityExist(propcaixa4) then
                DetachEntity(propcaixa4,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa4))
                propcaixa4 = nil
            end 
		    if DoesEntityExist(propcaixa5) then
                DetachEntity(propcaixa5,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa5))
                propcaixa5 = nil
            end
		    if DoesEntityExist(propcaixa6) then
                DetachEntity(propcaixa6,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa6))
                propcaixa6 = nil
            end
		    if DoesEntityExist(propcaixa7) then
                DetachEntity(propcaixa7,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa7))
                propcaixa7 = nil
            end
		    if DoesEntityExist(propcaixa8) then
                DetachEntity(propcaixa8,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa8))
                propcaixa8 = nil
            end
		    if DoesEntityExist(propcaixa9) then
                DetachEntity(propcaixa9,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa9))
                propcaixa9 = nil
            end
		    if DoesEntityExist(propcaixa10) then
                DetachEntity(propcaixa10,false,false)
                TriggerServerEvent("trydeleteobj",ObjToNet(propcaixa10))
                propcaixa10 = nil
            end
		end
	end
	Citizen.Wait(sleep)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
-----------------------------------------------------------------------------------------------------------------------------------------
function GetVanPosition(radius)
	local ped = PlayerPedId()
	local coordsx = GetEntityCoords(ped, 1)
	local coordsy = GetOffsetFromEntityInWorldCoords(ped, 0.0, radius+0.00001, 0.0)
	local nearVehicle = GetVanDirection(coordsx, coordsy)
	if IsEntityAVehicle(nearVehicle) then
	    return nearVehicle
	else
		local x,y,z = table.unpack(coordsx)
	    if IsPedSittingInAnyVehicle(ped) then
	        local veh = GetVehiclePedIsIn(ped,true)
	        return veh
	    else
	        local veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,8192+4096+4+2+1) 
	        if not IsEntityAVehicle(veh) then 
	        	veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,4+2+1) 
	        end 
	        return veh
	    end
	end
end

function GetVanDirection(coordFrom,coordTo)
	local position = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
	local a,b,c,d,vehicle = GetRaycastResult(position)
	return vehicle
end

function DrawText3D(x,y,z, text, scl, font) 
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

	local scale = (1/dist)*scl
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
	if onScreen then
		SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 180)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
	end
end

function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.34, 0.34)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.001+ factor, 0.028, 0, 0, 0, 78)
end

function CriandoBlip(entregalocal,destino)
	blip = AddBlipForCoord(entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z)
	SetBlipSprite(blip,162)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.45)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Encomendas")
	EndTextCommandSetBlipName(blip)
end