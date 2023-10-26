local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
job = Tunnel.getInterface("emp_gas_skips")
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
	[1] = {x=135.04052734375,y=-2109.1008300781,z=28.11270904541},
	[2] = {x=132.89521789551,y=-2066.3352050781,z=18.391521453857}, 
	[3] = {x=137.33004760742,y=-2126.4123535156,z=31.709688186646}, 
	[4] = {x=135.82109069824,y=-2158.4162597656,z=34.158061981201}, 
	[5] = {x=116.28260803223,y=-2160.5241699219,z=34.158054351807}, 
	[6] = {x=1184.6296386719,y=-1728.9437255859,z=35.928478240967}, 
	[7] = {x=1191.5847167969,y=-1742.4737548828,z=37.731296539307}, 
	[8] = {x=1208.2174072266,y=-1766.3088378906,z=39.810085296631}, 
	[9] = {x=1277.8560791016,y=-1736.5245361328,z=52.028675079346}, 
	[10] = {x=1292.1982421875,y=-1729.7014160156,z=53.498481750488}, 
	[11] = {x=215.47714233398,y=681.69256591797,z=189.30680847168}, 
	[12] = {x=239.97030639648,y=714.86749267578,z=187.7995300293}, 
	[13] = {x=209.34436035156,y=644.12023925781,z=188.25102233887}, 
	[14] = {x=154.51876831055,y=608.07543945313,z=194.08102416992}, 
	[15] = {x=150.46794128418,y=626.05047607422,z=198.63833618164}, 
	[16] = {x=151.17144775391,y=633.95220947266,z=200.54341125488},
	[17] = {x=94.643997192383,y=-1943.3939208984,z=20.671506881714}, 
	[18] = {x=107.74659729004,y=-1950.4522705078,z=20.66641998291}, 
	[19] = {x=41.798931121826,y=-1922.0638427734,z=21.67103767395}, 
	[20] = {x=44.899227142334,y=-1883.8878173828,z=22.023107528687}, 
	[21] = {x=-11.844042778015,y=-1847.9914550781,z=24.782075881958}, 
	[22] = {x=-60.644943237305,y=-1795.501953125,z=27.479234695435}, 
	[23] = {x=-62.269241333008,y=-1462.5003662109,z=31.983657836914}, 
	[24] = {x=-31.138652801514,y=-1459.5961914063,z=31.031373977661}, 
	[25] = {x=411.2936706543,y=-1787.9775390625,z=28.797946929932}, 
	[26] = {x=500.67556762695,y=-1782.6766357422,z=28.380084991455}, 
	[27] = {x=488.3186340332,y=-1761.2447509766,z=28.471366882324}, 
	[28] = {x=496.79925537109,y=-873.87744140625,z=25.265214920044},
	[29] = {x=306.54595947266,y=-1982.8800048828,z=22.052997589111},
	[30] = {x=266.68347167969,y=-2030.6496582031,z=18.4836769104},
	[31] = {x=328.75485229492,y=-2026.9937744141,z=21.148448944092},
	[32] = {x=-1069.8707275391,y=-1019.1244506836,z=2.0389490127563},
	[33] = {x=-1069.7954101563,y=-1158.7854003906,z=2.0785665512085},
	[34] = {x=-978.44903564453,y=-1104.8997802734,z=2.1014232635498}, 
	[35] = {x=-1115.7176513672,y=-1621.8435058594,z=4.3984251022339}
}

local entregalocal = {
	[1] = {x=288.06970214844,y=-2072.5583496094,z=17.66357421875}, --
	[2] = {x=183.06372070313,y=-2028.0242919922,z=18.268379211426}, --
	[3] = {x=139.31785583496,y=-2132.5344238281,z=31.709684371948}, --
	[4] = {x=178.96690368652,y=-1924.9154052734,z=21.371023178101}, --
	[5] = {x=289.74060058594,y=-2077.0153808594,z=17.663578033447}, --
	[6] = {x=1203.9632568359,y=-1671.7525634766,z=42.357967376709}, --
	[7] = {x=1259.2443847656,y=-1761.0754394531,z=49.65824508667}, --
	[8] = {x=-544.0966796875,y=-853.86206054688,z=28.807521820068}, --
	[9] = {x=1274.4270019531,y=-1721.0914306641,z=54.68078994751}, --
	[10] = {x=1289.6793212891,y=-1711.5521240234,z=55.264228820801}, --
	[11] = {x=231.66537475586,y=672.77380371094,z=189.9454498291}, --
	[12] = {x=216.10844421387,y=620.486328125,z=187.63606262207}, --
	[13] = {x=215.98963928223,y=620.76708984375,z=187.63655090332}, --
	[14] = {x=128.17102050781,y=566.29327392578,z=183.96835327148}, --
	[15] = {x=80.663993835449,y=274.12231445313,z=110.21017456055}, --
	[16] = {x=225.27786254883,y=337.59393310547,z=105.60368347168}, --
	[17] = {x=85.438163757324,y=-1959.4147949219,z=21.121524810791}, --
	[18] = {x=114.11856079102,y=-1960.8939208984,z=21.334547042847}, --
	[19] = {x=-20.088613510132,y=-1857.9084472656,z=25.407459259033}, --
	[20] = {x=54.231491088867,y=-1873.330078125,z=22.805839538574}, --
	[21] = {x=-20.764394760132,y=-1858.8950195313,z=25.408672332764}, --
	[22] = {x=-50.404556274414,y=-1783.3073730469,z=28.300819396973}, --
	[23] = {x=-42.477767944336,y=-1473.8662109375,z=31.817226409912}, --
	[24] = {x=-32.505836486816,y=-1446.2437744141,z=31.891033172607}, --
	[25] = {x=274.33346557617,y=-834.16119384766,z=29.252950668335}, --
	[26] = {x=513.86297607422,y=-1781.2208251953,z=28.913976669312}, --
	[27] = {x=379.27575683594,y=-1780.9871826172,z=29.409488677979}, --
	[28] = {x=488.14959716797,y=-873.42175292969,z=25.389318466187}, --
	[29] = {x=279.60229492188,y=-2043.4061279297,z=19.767562866211},--
	[30] = {x=256.49746704102,y=-2023.6540527344,z=19.266288757324}, --
	[31] = {x=336.10089111328,y=-2021.599609375,z=22.354278564453}, --
	[32] = {x=-1075.44140625,y=-1026.3692626953,z=4.5453286170959}, --
	[33] = {x=-1004.6940307617,y=-1154.458984375,z=2.1587393283844}, --
	[34] = {x=-1063.4895019531,y=-1054.8193359375,z=2.1503593921661}, --
	[35] = {x=-1122.7257080078,y=-1558.0690917969,z=4.9910039901733} --
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO TRABALHO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('emp_gas_skips:permissao')
AddEventHandler('emp_gas_skips:permissao',function()
	if not emservico then
		emservico = true
		parte = 0
		destino = math.random(1,35)
		TriggerEvent("Notify","importante","Voce entrou em <b>Serviço</b>, pegue a <b>Pampa !</b>")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		sleep = 1000
		local ped = PlayerPedId()
		if GetDistanceBetweenCoords(GetEntityCoords(ped), 533.94, -1844.03, 26.75,true) <= 30 then
			sleep = 1
		  --  DrawText3D(533.94, -1844.03, 26.75+0.47, "~w~Entregador", 1.0, 4)
		    --DrawText3D(533.94, -1844.03, 26.75+0.33, "~b~UltraGás", 0.9, 1)
		    DrawMarker(21, 533.94, -1844.03, 26.75-0.1, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 65, 105, 255, 50, 0, true, false, false)
		    if GetDistanceBetweenCoords(GetEntityCoords(ped), 533.94, -1844.03, 26.757,true) <= 1 then
                if IsControlJustPressed(0,38) then	
				    TriggerServerEvent('emp_gas_skips:permissao')
					Fade(1200)
				        TriggerEvent("Notify","importante","Voce pegou a <b>Pampa</b> na garagem, pegue os <b>Botijões de Gás</b> e coloque nela!")
		                spawnVan()
						ColocarRoupa()
                        parte = 1
				end
			end
		end
		-- if emservico and parte == 0 then
		-- 	if GetDistanceBetweenCoords(GetEntityCoords(ped), 537.23, -1840.78, 25.34,true) <= 20 then
		-- 		sleep = 1
		--         DrawMarker(21,537.23, -1840.78, 25.34-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,65,105,255,50,0,0,0,1)
		--         if GetDistanceBetweenCoords(GetEntityCoords(ped), 537.23, -1840.78, 25.34,true) <= 1 then
        --             if IsControlJustPressed(0,38) then	
        --             	Fade(1200)
		-- 		        TriggerEvent("Notify","importante","Voce pegou a <b>Pampa</b> na garagem, pegue os <b>Botijões de Gás</b> e coloque nela!")
		--                 spawnVan()
        --                 parte = 1
		-- 		    end
		-- 	    end
		--     end
		-- end
		if emservico and parte == 1 then
			sleep = 1
		    local veh = GetVanPosition(10)
			local coordsVan = GetOffsetFromEntityInWorldCoords(veh, 0.0, -2.7, 0.0)
			local model = GetEntityModel(veh)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),542.31, -1825.08, 27.34,true)
			local distance2 = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsVan.x,coordsVan.y,coordsVan.z,true)
			if distance <= 50 and not pegando and portaaberta then
				DrawMarker(21,542.31, -1825.08, 27.34-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,65,105,255,50,0,0,0,1)
				if distance < 1.5 and not IsPedInAnyVehicle(ped) then
                    if IsControlJustPressed(0,38) and not andamento then
                    	if quantidade < 8 then
                            pegando = true
                            andamento = true
                            caixanamao = true
                            TriggerEvent('cancelando',true)
                            vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_fire_exting_1a",50,28422)
                        else
                        	vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        	TriggerEvent("Notify","aviso","Voce colocou o máximo de <b>estoque</b> na <b>Pampa</b>!")
                        end
					end
				end
			end
			if pegando and distance2 <= 1.5 and not IsPedInAnyVehicle(ped) then
                if model == 2137340341 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
					sleep = 1
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
                        if quantidade == 8 then
                        	TriggerEvent("Notify","importante","Voce colocou <b>"..quantidade.."/8 Gás</b> na <b>Pampa</b>, feche as portas traseiras, entre nela e aguarde até receber uma <b>Entrega</b>!")
                        	vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        	portaaberta = false
                        	time = math.random(10000,15000)
                        	parte = 2
                        	Wait(time)
                            TriggerEvent("Notify","sucesso","Chamado recebido, entre na <b>Pampa</b>, e vá ao <b>local</b> entregar um <b>Gás</b>!")
                        	vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                        	CriandoBlip(entregalocal,destino)
                        else
                        	TriggerEvent("Notify","importante","Voce colocou <b>"..quantidade.."/8 Gás</b> na <b>Pampa</b>!")
                            vRP.playSound("5_Second_Timer","DLC_HEISTS_GENERAL_FRONTEND_SOUNDS")
                        end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		sleep = 1000
		local ped = PlayerPedId()
		if emservico and parte == 2 then
		    local veh = GetVanPosition(10)
			local coordsVan = GetOffsetFromEntityInWorldCoords(veh, 0.0, -2.7, 0.0)
			local model = GetEntityModel(veh)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsVan.x,coordsVan.y,coordsVan.z, true)
			local distance2 = GetDistanceBetweenCoords(GetEntityCoords(ped),entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z,true)
			if not pegando and portaaberta2 and not encomendapega and distance <= 1.5 and not IsPedInAnyVehicle(ped) then
				if model == 2137340341 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
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
                            TriggerEvent("Notify","importante","Voce retirou <b>1x Botijão de gás</b> da <b>Pampa</b>!")
                            vRP._CarregarObjeto("anim@heists@box_carry@","idle","prop_fire_exting_1a",50,28422)
                            TirarCaixa()
                            andamento = true
                        else
                            parte = 1
                            vRP.playSound("5_SEC_WARNING","HUD_MINI_GAME_SOUNDSET")
                        	TriggerEvent("Notify","aviso","Voce entregou todas as seus <b>botijões</b>, volte para a central e pegue mais!")
                            quantidade = 0
                        end
					end
				end
			end
			if pegando and portaaberta2 and encomendapega and distance <= 1.5 and not IsPedInAnyVehicle(ped) then
                if model == 2137340341 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
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
                        TriggerEvent("Notify","importante","Voce colocou o <b>botijão de gás</b> na <b>Pampa</b>, atualmente com <b>"..quantidade.."/8!")
					end
				end
			end
			if distance2 <= 50 and pegando and encomendapega then
				if distance2 < 1.5 and not IsPedInAnyVehicle(ped) then
					sleep = 5
					DrawText3Ds(entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z+0.35,"~b~[E] ~w~Entregar Botijão")
					TriggerEvent('cancelando',false)
                    if IsControlJustPressed(0,38) then
                    	if quantidade >= 0 then
                    		Fade(1200)
                    		local pagamento = math.random(500,800)
                    		destinoantigo = destino
							pegando = false
							encomendapega = false
                            andamento = false
                            vRP._DeletarObjeto()
                            ClearPedTasksImmediately(ped)
                            TriggerServerEvent("emp_gas_skips:receber",pagamento)
                            portaaberta = false
                            RemoveBlip(blip)
                        	if quantidade > 0 then
                        		TriggerEvent("Notify","sucesso","<b>Botijões</b> entregues, voce ganhou <b>$"..pagamento.."</b>, faltam entregar <b>"..quantidade.."/8 !")
                                TriggerEvent("Notify","importante","Feche as portas traseiras, entre na <b>Pampa</b> e aguarde até receber uma <b>Entrega</b>!")
                                time = math.random(20000,30000)
                        	    Wait(time)
                        	    TriggerEvent("Notify","sucesso","Chamado recebido, entre na <b>Pampa</b>, e vá ao <b>local</b> entregar o <b>Gás</b>!")
                        	    vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
                                while true do
                                    if destinoantigo == destino then
                                        destino = math.random(1,35)
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
                        	    destino = math.random(1,35)
                        	    pegando = false
							    encomendapega = false
                                andamento = false
                                portaaberta2 = false
                                portaaberta = false
                        	    TriggerEvent("Notify","aviso","Voce entregou todas as suas <b>botijões</b>, volte para a central e pegue mais!")
                            end
                        end
					end
				end
			elseif distance2 <= 50 and not pegando and not encomendapega then
				sleep = 5
				DrawMarker(21,entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,65,105,255,50,0,0,0,1)
				if distance2 < 1.5 and not IsPedInAnyVehicle(ped) then
					DrawMarker(21,entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,65,105,255,50,0,0,0,1)
					DrawText3Ds(entregalocal[destino].x,entregalocal[destino].y,entregalocal[destino].z+0.35,"~w~ Pegue o Botijão na ~b~Pampa")
			    end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		sleep = 1000
		local veh = GetVanPosition(10)
		local coordsVan = GetOffsetFromEntityInWorldCoords(veh, 0.0, -2.7, 0.0)
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),coordsVan.x,coordsVan.y,coordsVan.z,true)
		local model = GetEntityModel(veh)
		if distance <= 2.0 and not IsPedInAnyVehicle(PlayerPedId()) and emservico then
		    if model == 2137340341 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
			    if not traseira and not portaaberta and not portaaberta2 then
					sleep = 1
			        DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~b~[E] ~w~Abrir")
			    	if IsControlJustPressed(0,38) then
				        SetVehicleDoorOpen(veh, 3, false, false)
				        SetVehicleDoorOpen(veh, 2, false, false)
				        traseira = true
				        portaaberta2 = true
				        if parte == 1 then
				            portaaberta = true
				        end
				    end
                elseif traseira and not portaaberta then
            	    if parte == 1 then
						sleep = 1
	                    DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~b~[E] ~w~Fechar")
	                elseif parte == 2 and not encomendapega then
						sleep = 1
	            	    DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~b~[E] ~w~Fechar | ~b~[G] ~w~Pegar botijão de gás")
	                elseif parte == 2 and encomendapega then
						sleep = 1
	            	    DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~b~[E] ~w~Fechar | ~b~[G] ~w~Guardar botijão de gás ")
	                end 
					sleep = 1
				    if IsControlJustPressed(0,38) then
				        SetVehicleDoorShut(veh, 3, false)
				        SetVehicleDoorShut(veh, 2, false)
				        traseira = false
				        if parte == 2 then
				            portaaberta2 = false
				        end
				    end
                end
			end
		end
		if distance <= 3.0 and not IsPedInAnyVehicle(PlayerPedId()) and emservico then
			if model == 2137340341 and GetVehicleNumberPlateText(veh) == vRP.getRegistrationNumber() then
				sleep = 1
				DrawText3Ds(coordsVan.x,coordsVan.y,coordsVan.z+0.55,"  ~b~"..quantidade.."~w~  /  ~b~8    ")
			end
		end
		Citizen.Wait(sleep)
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
	local mhash = "cdagas"
	if not nveh then
	while not HasModelLoaded(mhash) do
	    RequestModel(mhash)
	    Citizen.Wait(10)
	end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		nveh = CreateVehicle(mhash,538.23, -1844.67, 25.06+0.5,234.24,true,false)
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

function CaixaVan(veh,model)
	if quantidade <= 8 then
		RequestModel(GetHashKey("prop_fire_exting_1a"))
        while not HasModelLoaded(GetHashKey("prop_fire_exting_1a")) do
            Citizen.Wait(10)
        end
	    local coords = GetOffsetFromEntityInWorldCoords(veh,0.0,0.0,-5.0)
		if quantidade == 1 and model == 2137340341 then
			propcaixa = nil
			propcaixa = CreateObject(GetHashKey("prop_fire_exting_1a"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa,veh,0.0,-0.25,-1.95,-0.25,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa,true)
		elseif quantidade == 2 and model == 2137340341 then
			propcaixa2 = nil
			propcaixa2 = CreateObject(GetHashKey("prop_fire_exting_1a"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa2,veh,0.0,0.25,-1.95,-0.25,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa2,true)
		elseif quantidade == 3 and model == 2137340341 then
			propcaixa3 = nil
			propcaixa3 = CreateObject(GetHashKey("prop_fire_exting_1a"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa3,veh,0.0,-0.25,-1.50,-0.25,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa3,true)
		elseif quantidade == 4 and model == 2137340341 then
			propcaixa4 = nil
			propcaixa4 = CreateObject(GetHashKey("prop_fire_exting_1a"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa4,veh,0.0,0.25,-1.50,-0.25,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa4,true)
		elseif quantidade == 5 and model == 2137340341 then
			propcaixa5 = nil
			propcaixa5 = CreateObject(GetHashKey("prop_fire_exting_1a"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa5,veh,0.0,-0.25,-1.01,-0.25,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa5,true)
		elseif quantidade == 6 and model == 2137340341 then
			propcaixa6 = nil
			propcaixa6 = CreateObject(GetHashKey("prop_fire_exting_1a"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa6,veh,0.0,0.25,-1.01,-0.25,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa6,true)
		elseif quantidade == 7 and model == 2137340341 then
			propcaixa7 = nil
			propcaixa7 = CreateObject(GetHashKey("prop_fire_exting_1a"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa7,veh,0.0,-0.25,-0.52,-0.25,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa7,true)
		elseif quantidade == 8 and model == 2137340341 then
			propcaixa8 = nil
			propcaixa8 = CreateObject(GetHashKey("prop_fire_exting_1a"),coords.x,coords.y,coords.z,true,true,true)
			AttachEntityToEntity(propcaixa8,veh,0.0,0.25,-0.52,-0.25,0.0,0.0,0.0,false,false,true,false,2,true)
			FreezeEntityPosition(propcaixa8,true)
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
	end
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

local roupaEletricistaSkips = {
	["Eletricista"] = {
		[1885233650] = {                                      
            [1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 42,0 },
            [4] = { 134,0 },
            [5] = { 0,0 },
            [6] = { 12,6 },
            [7] = { 0,0 },
            [8] = { 57,0 },
			[9] = { 13,0 },
            [10] = { -1,0 },
            [11] = { 363,0 },
			["p0"] = { 145,3 },
            ["p1"] = { 42,0 }
        },
        [-1667301416] = {
			[1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 47,0 },
            [4] = { 142,0 },
            [5] = { 0,0 },
            [6] = { 26,0 },
            [7] = { 29,0 },
            [8] = { 14,0 },
			[9] = { 14,0 },
            [10] = { -1,0 },
            [11] = { 382,0 },
			["p0"] = { 144,3 },
            ["p1"] = { -1,0 }
        }
	}
}

function ColocarRoupa()
	if vRP.getHealth() > 101 then
		if not vRP.isHandcuffed() then
			local custom = roupaEletricistaSkips["Eletricista"]
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

-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		sleep = 1000
		if emservico then
			sleep = 4
			if IsControlJustPressed(0,168) then
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
				MainRoupa()
				RemoveBlip(blip)
				TriggerEvent("Notify","importante","Você saiu de expediente!")
				vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
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