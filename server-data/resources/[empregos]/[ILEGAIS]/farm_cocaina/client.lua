local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("farm_cocaina")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS --
-----------------------------------------------------------------------------------------------------------------------------------------
local acido = false -- [ ACIDO ]
local acidoobj = false -- [ ACIDO OBJETO ]
local panela = false -- [ PANELA ]
local panelaobj = false -- [ PANELA OBJETO ]
local misturar = false -- [ MISTURAR ]
local produzindococa = false  -- [ PRODUZIR ]
-------------------------------------------------------------------------------------------------
--[ AÇÃO ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() -- PEGAR PAPEL
	while true do
		local skips = 1000

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),172.14, -1713.04, 22.21, true ) <= 2 and not acido then -- PEGAR ACIDO
			skips = 1
			DrawText3D(172.14, -1713.04, 22.21, "[~g~E~w~] Para coletar o ~g~Ácido Corrosivo~w~.")
			if IsControlJustPressed(0,38) and emP.checkPermissao() then
				local ped = PlayerPedId()
				acido = true
				produzindococa = true
				SetEntityCoords(PlayerPedId(),172.28, -1712.97, 22.21-1.1)
				SetEntityHeading(PlayerPedId(),294.88)
				vRP._playAnim(false,{{"amb@medic@standing@tendtodead@idle_a","idle_a"}},true)
				
				SetTimeout(2500,function()
					TriggerEvent("Notify","sucesso","Você pegou o <b>Ácido Corrosivo</b>.")
					vRP._stopAnim(source,false)
					vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
					vRP._CarregarObjeto("anim@heists@box_carry@","idle","bkr_prop_meth_hcacid",50,28422,0.00,-0.05,-0.20,0.0,0.0,0.0)
			--	vRP._CarregarObjeto("anim@heists@box_carry@","idle","bkr_prop_coke_metalbowl_01",50,28422,0.0,-0.15,-0.28,0.0,0.0,-1.5)
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),155.38, -1711.67, 22.21, true ) <= 2 and acido and not acidoobj then -- COLOCAR ACIDO
			skips = 1
			DrawText3D(155.38, -1711.67, 22.21, "[~g~E~w~] Para colocar o ~g~Ácido Corrosivo~w~.")
			if IsControlJustPressed(0,38) and acido and not acidoobj then
				local ped = PlayerPedId()
				SetEntityCoords(PlayerPedId(),155.38, -1711.67, 22.21-1.1)
				SetEntityHeading(PlayerPedId(),48.2)
				vRP._playAnim(false,{{"mp_common","givetake1_a"}},false)
				vRP._DeletarObjeto(source)
				acidoobj = true
				SetTimeout(1500,function()
					acidoobj1 = CreateObject(GetHashKey("bkr_prop_meth_hcacid"),154.79, -1710.45, 23.08-1.0,true,true,true)
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),160.96, -1705.17, 22.21, true ) <= 2 and acidoobj and not panela then -- PEGAR PANELA
			skips = 1
			DrawText3D(160.96, -1705.17, 22.21, "[~g~E~w~] Para pegar a ~g~Panela de Cocaína~w~.")
			if IsControlJustPressed(0,38) and acidoobj and not panela then
				local ped = PlayerPedId()
				panela = true
				SetEntityCoords(PlayerPedId(),160.96, -1705.17, 22.21-1.5)
				SetEntityHeading(PlayerPedId(),75.46)
				vRP._playAnim(false,{{"amb@medic@standing@tendtodead@idle_a","idle_a"}},true)
				TriggerEvent("Notify","sucesso","Você pegou a <b>Panela de Cocaína</b>.")
				SetTimeout(5000,function()
					vRP._stopAnim(source,false)
					vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
					vRP._CarregarObjeto("anim@heists@box_carry@","idle","bkr_prop_coke_metalbowl_01",50,28422,0.0,-0.15,-0.28,0.0,0.0,-1.5)
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),154.93, -1712.36, 22.21, true ) <= 2 and panela and not panelaobj then -- COLOCAR PANELA
			skips = 1
			DrawText3D(154.93, -1712.36, 22.21, "[~g~E~w~] Para colocar a ~g~Panela de Cocaína~w~.")
			if IsControlJustPressed(0,38) and panela and not panelaobj then
				local ped = PlayerPedId()
				SetEntityHeading(PlayerPedId(),54.68)
				vRP._playAnim(false,{{"mp_common","givetake1_a"}},false)
				vRP._DeletarObjeto(source)
				SetTimeout(1500,function()
					panelacoca = CreateObject(GetHashKey("bkr_prop_coke_metalbowl_01"),154.64, -1711.91, 23.09-1.0,true,true,true)
					panelaobj = true
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),155.56, -1711.61, 22.21, true ) <= 2 and panelaobj and not misturar then -- PESAR COCAÍNA
			skips = 1
			DrawText3D(155.56, -1711.61, 22.2118325806, "[~g~E~w~] Para pesar a ~g~Cocaína~w~.")
			if IsControlJustPressed(0,38) and panelaobj and not misturar then
				local ped = PlayerPedId()
				misturar = true
				SetEntityCoords(PlayerPedId(),155.56, -1711.61, 22.21)
				SetEntityHeading(PlayerPedId(),50.63)
				TriggerEvent("progress",20300,"PESANDO A COCAÍNA")
				vRP._playAnim(false,{{"anim@amb@business@coc@coc_packing_hi@","full_cycle_v3_pressoperator"}},true)
				--balanca = CreateObject(GetHashKey("bkr_prop_coke_scale_01"),-527.43664550781,-1796.0651855469,22.506299591064-1.0,true,true,true)
				espatula = CreateObject(GetHashKey("bkr_prop_coke_fullscoop_01a"),-527.43664550781,-1796.0651855469,22.4062995-1.1,true,true,true)
				SetTimeout(2500,function()
				--	DeleteObject(balanca)
					vRP._CarregarObjeto("","","bkr_prop_coke_scale_01",50,28422,0.0,0.0,-0.1,0.0,0.0,0.0)
				end)
				SetTimeout(5000,function()
					vRP._DeletarObjeto(source)
					balanca1 = CreateObject(GetHashKey("bkr_prop_coke_scale_01"),155.29, -1711.12, 23.08-1.1,true,true,true)
					testeH = GetHashKey("bkr_prop_coke_scale_01")
					SetEntityHeading(testeH,51.68)
				end)
				SetTimeout(7500,function()
					DeleteObject(espatula)
					vRP._CarregarObjeto("","","bkr_prop_coke_fullscoop_01a",50,57005,0.16,0.07,-0.05,200.0,120.0,0.0)
				end)
				SetTimeout(15000,function()
					cocaina = CreateObject(GetHashKey("bkr_prop_coke_powder_02"),155.29, -1711.12, 23.12-1.0,true,true,true)
				end)
				SetTimeout(20000,function()
					vRP._DeletarObjeto(source)
				end)
				SetTimeout(20300,function()
					vRP._stopAnim(source,false)
					DeleteObject(balanca1)
					DeleteObject(cocaina)
					DeleteObject(panelacoca)
					DeleteObject(acidoobj1)
					emP.checkcocaina()
					acido = false -- [ ACIDO ]
					acidoobj = false -- [ ACIDO OBJETO ]
					panela = false -- [ PANELA ]
					panelaobj = false -- [ PANELA OBJETO ]
					misturar = false -- [ MISTURAR ]
					produzindococa = false -- [ PRODUZIR ]
				end)
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
		Citizen.Wait(5)
			if acido then
	--			DisableControlAction(0,167,true)
				DisableControlAction(0,21,true)
				DisableControlAction(0,22,true)
			end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES --
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
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 0, 255, 0, 10)
end