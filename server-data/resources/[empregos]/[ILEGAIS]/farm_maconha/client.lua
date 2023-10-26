local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("farm_maconha")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local pronto = false
local plantaaqui = false
local plantado = false
local plantado1 = false
local confirma = false
local adubo = false
local regando = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- COORDENADAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locblips = {
	[1] = { ['x'] = 1765.37, ['y'] = -1608.001, ['z'] = 112.642 }, -- 592.35717773438,-418.28137207031,17.623769760132
}

local locplantas = {
	[1] = { ['x'] = 592.256, ['y'] = -418.8407, ['z'] = 17.623 }, -- 592.25628662109,-418.84072875977,17.623779296875
	[2] = { ['x'] = 592.205, ['y'] = -420.20, ['z'] = 17.62 }, -- 592.20513916016,-420.2077331543,17.623779296875
	[3] = { ['x'] = 592.00, ['y'] = -422.82, ['z'] = 17.62 } -- 592.00164794922,-422.82150268555,17.623779296875
}


-----------------------------------------------------------------------------------------------------------------------------------------
-- COMEÇAR A PLANTAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	local ped = PlayerPedId()
	while true do
		local skips = 1000

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),606.08532714844,-422.87652587891,17.623769760132, true ) <= 1 and not adubo then
			skips = 1
			DrawText3D(606.08532714844,-422.87652587891,17.623769760132, "[~r~E~w~] PARA PEGAR O ~g~ADUBO~w~.")
			if IsControlJustPressed(0,38) and emP.checkPermissao() then
				SetEntityHeading(ped,277.95)
				SetEntityCoords(ped,606.08532714844,-422.87652587891,17.623769760132-1,false,false,false,false)
				emP.freezy()
				adubo = true
				vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
				SetTimeout(2500,function()
					vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
					vRP._CarregarObjeto("anim@heists@box_carry@","idle","bkr_prop_weed_bucket_01a",50,28422,0.0,-0.10,-0.2,0.0,0.0,0.0) -- 50,28422,0.07,0.1,-0.21,100.0,0.5,0.1
					TriggerEvent("Notify","sucesso","Você pegou o <b>pote de adubo</b>.")
				end)
			end
		end
		
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),592.35717773438,-418.28137207031,17.623769760132, true ) <= 1 and not plantado and adubo then
			skips = 1
			DrawText3D(592.35717773438,-418.28137207031,17.623769760132, "[~r~E~w~] PARA PLANTAR OS PÉS DE ~g~MACONHA~w~.")
			if IsControlJustPressed(0,38) and emP.checkPermissao() and not plantado then
				local bowz,cdz = GetGroundZFor_3dCoord(592.35717773438,-418.28137207031,17.623769760132) -- ped 
				local bowz,cdz = GetGroundZFor_3dCoord(locplantas[1].x,locplantas[1].y,locplantas[1].z) -- planta 
				pote = CreateObject(GetHashKey("bkr_prop_weed_plantpot_stack_01b"),locplantas[1].x,locplantas[1].y,locplantas[1].z-1.1,true,true,true)
				pote1 = CreateObject(GetHashKey("bkr_prop_weed_plantpot_stack_01b"),locplantas[2].x,locplantas[2].y,locplantas[2].z-1.1,true,true,true)
				pote2 = CreateObject(GetHashKey("bkr_prop_weed_plantpot_stack_01b"),locplantas[3].x,locplantas[3].y,locplantas[3].z-1.1,true,true,true)
				adubo1 = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"),591.15325927734,-417.79821777344,17.623777389526-1.1,true,true,true)
				vRP._DeletarObjeto(source)
				vRP._playAnim(false,{{"amb@world_human_gardener_plant@female@base","base_female"}},true)
				SetEntityHeading(ped,175.9)
				SetEntityCoords(ped,592.36297607422,-417.83483886719,17.623777389526-1,false,false,false,false)
				pronto = false
				plantado = true

				SetTimeout(5000,function()
					TriggerEvent("Notify","sucesso","Você plantou um pé de maconha.")
					DeleteObject(pote)
					DeleteObject(pote1)
					DeleteObject(pote2)
					DeleteObject(adubo1)
					vRP._stopAnim(source,false)
					pezinho = CreateObject(GetHashKey("bkr_prop_weed_01_small_01c"),locplantas[1].x,locplantas[1].y,locplantas[1].z-1.1,true,true,true)
					pezinho1 = CreateObject(GetHashKey("bkr_prop_weed_01_small_01c"),locplantas[2].x,locplantas[2].y,locplantas[2].z-1.1,true,true,true)
					pezinho2 = CreateObject(GetHashKey("bkr_prop_weed_01_small_01c"),locplantas[3].x,locplantas[3].y,locplantas[3].z-1.1,true,true,true)
				end)
				SetTimeout(10000,function()
					plantado1 = true
					DeleteObject(pezinho)
					DeleteObject(pezinho1)
					DeleteObject(pezinho2)
					pe2 = CreateObject(GetHashKey("bkr_prop_weed_01_small_01a"),locplantas[3].x,locplantas[3].y,locplantas[3].z-1.1,true,true,true)
					pe1 = CreateObject(GetHashKey("bkr_prop_weed_01_small_01a"),locplantas[2].x,locplantas[2].y,locplantas[2].z-1.1,true,true,true)
					pe = CreateObject(GetHashKey("bkr_prop_weed_01_small_01a"),locplantas[1].x,locplantas[1].y,locplantas[1].z-1.1,true,true,true)
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),592.35717773438,-418.28137207031,17.623769760132, true ) <= 1 and plantado1 and not regando then
			skips = 1
			DrawText3D(592.35717773438,-418.28137207031,17.623769760132, "[~r~E~w~] PARA REGAR AS ~g~PLANTAS~w~.")
			if IsControlJustPressed(0,38) then
				SetEntityHeading(ped,175.9)
				SetEntityCoords(ped,592.35717773438,-418.28137207031,17.623769760132-1,false,false,false,false)
				vRP._playAnim(true,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
				vRP._CarregarObjeto("","","prop_wateringcan",50,57005,0.45,0.0,0.05,0.0,260.0,140.0)
				regando = true

				SetTimeout(5000,function()
					TriggerEvent("Notify","sucesso","Você regou as <b>plantas, aguarde crescer!</b>!")
					vRP._stopAnim(source,false)
					vRP._DeletarObjeto(source)
				end)

				SetTimeout(5000,function()
					DeleteObject(pe)
					DeleteObject(pe1)
					DeleteObject(pe2)
					pemedio2 = CreateObject(GetHashKey("bkr_prop_weed_med_01a"),locplantas[3].x,locplantas[3].y,locplantas[3].z-3.5,true,true,true)
					pemedio1 = CreateObject(GetHashKey("bkr_prop_weed_med_01a"),locplantas[2].x,locplantas[2].y,locplantas[2].z-3.5,true,true,true)
					pemedio = CreateObject(GetHashKey("bkr_prop_weed_med_01a"),locplantas[1].x,locplantas[1].y,locplantas[1].z-3.5,true,true,true)
				end)
				
				SetTimeout(20000,function()
					DeleteObject(pemedio)
					DeleteObject(pemedio1)
					DeleteObject(pemedio2)
					pezao2 = CreateObject(GetHashKey("bkr_prop_weed_lrg_01a"),locplantas[3].x,locplantas[3].y,locplantas[3].z-3.5,true,true,true)
					pezao1 = CreateObject(GetHashKey("bkr_prop_weed_lrg_01a"),locplantas[2].x,locplantas[2].y,locplantas[2].z-3.5,true,true,true)
					pezao = CreateObject(GetHashKey("bkr_prop_weed_lrg_01a"),locplantas[1].x,locplantas[1].y,locplantas[1].z-3.5,true,true,true)
					pronto = true
					plantado = true
					confirma = true
					TriggerEvent("Notify","sucesso","Seu <b>pé de maconha</b> está pronto.")
				end)
			end
		end

		if confirma then
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),592.35717773438,-418.28137207031,17.623769760132, true ) <= 1 then
				skips = 1
				DrawText3D(locplantas[1].x,locplantas[1].y,locplantas[1].z, "[~r~E~w~] PARA COLHER A ~g~MACONHA~w~.")
				if IsControlJustPressed(0,38) then
					plantaaqui = false
					pronto = false
					confirma = false
					adubo = false
					plantado1 = false
					regando = false
					SetEntityHeading(ped,175.9)
					SetEntityCoords(ped,592.35717773438,-418.28137207031,17.623769760132-1,false,false,false,false)
					vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}},true)
					vRP._CarregarObjeto("amb@prop_human_parking_meter@female@idle_a","idle_a_female","p_cs_scissors_s",50,57005,0.055,0.05,0.0,240.0,0.0,0.0) -- 50,28422,0.07,0.1,-0.21,100.0,0.5,0.1
					SetTimeout(10000,function()
						plantado = false
						vRP._stopAnim(source,false)
						DeleteObject(pezao)
						DeleteObject(pezao1)
						DeleteObject(pezao2)
						TriggerEvent('cancelando',source,true)
						vRP._DeletarObjeto(source)
						emP.checkPayment()
						TriggerEvent("Notify","sucesso","Você colheu <b>3<b> folhas de maconha.")
					end)
				end
			end
		end
		Citizen.Wait(skips)
	end
end)


-------------------------------------------------------------------------------------------------
--[ ANTI-BUG ]-----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if adubo then
				DisableControlAction(0,21,true)
				DisableControlAction(0,22,true)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if adubo then
			if IsControlJustPressed(0,168) then
				plantaaqui = false
					pronto = false
					confirma = false
					adubo = false
					plantado1 = false
					plantado = false
					regando = false
				 	DeleteObject(pote)
					DeleteObject(pote1)
					DeleteObject(pote2)
					DeleteObject(adubo1)
					DeleteObject(pezinho)
					DeleteObject(pezinho1)
					DeleteObject(pezinho2)
					DeleteObject(pe)
					DeleteObject(pe1)
					DeleteObject(pe2)
					DeleteObject(pemedio)
					DeleteObject(pemedio1)
					DeleteObject(pemedio2)
					DeleteObject(pezao)
					DeleteObject(pezao1)
					DeleteObject(pezao2)
				 vRP._DeletarObjeto(source)
				TriggerEvent("Notify","aviso","Você cancelou o serviço.")
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end
