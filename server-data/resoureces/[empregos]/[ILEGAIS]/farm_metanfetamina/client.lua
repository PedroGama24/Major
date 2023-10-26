local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("farm_metanfetamina")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS --
-----------------------------------------------------------------------------------------------------------------------------------------
local benzoato = false
local benzoatoobj1 = false
local toulene = false
local touleneobj1 = false
local misturar = false
local pegarbandeija = false
local colocarbandeija = false
local produzindo = false
-------------------------------------------------------------------------------------------------
--[ AÇÃO ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local skips = 1000

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1238.82, -1112.1, 0.79, true ) <= 2 and not benzoato then -- PEGAR BENZOATO
			skips = 1
			DrawText3D(-1238.82, -1112.1, 0.79, "[~y~E~w~] Para coletar o ~y~Benzoato de Sódio~w~.")
			if IsControlJustPressed(0,38) and emP.checkPermissao() then
				local ped = PlayerPedId()
				benzoato = true
				produzindo = true
				vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
				SetTimeout(5000,function()
					TriggerEvent("Notify","sucesso","Você pegou o <b>Benzoato de Sódio</b>.")
					vRP._stopAnim(source,false)
					vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
					vRP._CarregarObjeto("anim@heists@box_carry@","idle","bkr_prop_meth_sacid",50,28422,0.0,-0.10,-0.20,0.0,0.0,0.0)
				
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1249.07, -1120.16, 1.09, true ) <= 2 and benzoato and not benzoatoobj1 then -- COLOCAR BENZOATO
			skips = 1
			DrawText3D(-1249.07, -1120.16, 1.09, "[~y~E~w~] Para colocar o ~y~Benzoato de Sódio~w~.")
			if IsControlJustPressed(0,38) and benzoato and not benzoatoobj1 then
				local ped = PlayerPedId()
				vRP._playAnim(false,{{"pickup_object","pickup_low"}},false)
				vRP._DeletarObjeto(source)
				benzoatoobj1 = true
				SetTimeout(1500,function()
					benzoatoobj = CreateObject(GetHashKey("bkr_prop_meth_sacid"),-1248.31, -1120.58, 1.29-1.0,true,true,true)
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1237.83, -1115.15, 0.79, true ) <= 2 and benzoatoobj1 and not toulene then -- PEGAR TOULENE
			skips = 1
			DrawText3D(-1237.83, -1115.15, 0.79, "[~y~E~w~] Para pegar a ~y~Toulene~w~.")
			if IsControlJustPressed(0,38) and benzoatoobj1 and not toulene then
				local ped = PlayerPedId()
				toulene = true
				vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
				TriggerEvent("Notify","sucesso","Você pegou a <b>Toulene</b>.")
				SetTimeout(5000,function()
					vRP._stopAnim(source,false)
					vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
					vRP._CarregarObjeto("anim@heists@box_carry@","idle","bkr_prop_meth_toulene",50,28422,0.00,-0.05,-0.20,0.0,0.0,0.0)
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1249.07, -1120.16, 1.09, true ) <= 2 and toulene and not touleneobj1 then -- COLOCAR TOULENE
			skips = 1
			DrawText3D(-1249.07, -1120.16, 1.09, "[~y~E~w~] Para colocar o ~y~Toulene~w~.")
			if IsControlJustPressed(0,38) and toulene and not touleneobj1 then
				local ped = PlayerPedId()
				vRP._playAnim(false,{{"pickup_object","pickup_low"}},false)
				vRP._DeletarObjeto(source)
				SetTimeout(1500,function()
					touleneobj1 = true
					touleneobj = CreateObject(GetHashKey("bkr_prop_meth_toulene"),-1249.59, -1120.93, 1.29-1.0,true,true,true)
				end)
			end
		end
		
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1248.81, -1120.74, 1.29, true ) <= 2 and touleneobj1 and not misturar then -- MISTURAR COMPONENTES
			skips = 1
			DrawText3D(-1248.81, -1120.74, 1.29, "[~y~E~w~] Para misturar os ~y~Componentes~w~.")
			if IsControlJustPressed(0,38) and touleneobj1 and not misturar then
				local ped = PlayerPedId()
				misturar = true
				vRP._playAnim(false,{{"mini@repair","fixing_a_ped"}},true)
				TriggerEvent("progress",20000,"MISTURANDO OS COMPONENTES")
				bandeija = CreateObject(GetHashKey("bkr_prop_meth_smashedtray_01_frag_"),-1256.06, -1110.93, 1.59-1.0,true,true,true)
				bandeija1 = CreateObject(GetHashKey("bkr_prop_meth_smashedtray_01_frag_"),-1253.66, -1110.28, 1.59-1.0,true,true,true)
				SetTimeout(20000,function()
					TriggerEvent("Notify","sucesso","Você misturou os <b>Componentes</b>.")
					vRP._stopAnim(source,false)
					DeleteObject(benzoatoobj)
					DeleteObject(touleneobj)
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1255.77, -1112.01, 0.79, true ) <= 2 and misturar and not pegarbandeija then -- PEGAR BANDEIJA
			skips = 1
			DrawText3D(-1255.77, -1112.01, 0.79, "[~y~E~w~] Para pegar a ~y~Bandeija de Metanfetamina~w~.")
			if IsControlJustPressed(0,38) and misturar and not pegarbandeija then
				local ped = PlayerPedId()
				pegarbandeija = true
				vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
				SetTimeout(2000,function()
					TriggerEvent("Notify","sucesso","Você pegou a <b>Bandeija de Metanfetamina</b>.")
					vRP._stopAnim(source,false)
					DeleteObject(bandeija)
					DeleteObject(bandeija1)
					vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
					vRP._CarregarObjeto("anim@heists@box_carry@","idle","bkr_prop_meth_smashedtray_01",50,28422,0.0,-0.15,-0.15,0.0,0.0,-0.5)
				end)
			end
		end

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1249.81, -1125.87, 1.0, true ) <= 2 and pegarbandeija and not colocarbandeija then -- COLOCAR BANDEIJA
			skips = 1
			DrawText3D(-1249.81, -1125.87, 1.0, "[~y~E~w~] Para colocar a ~y~Bandeija de Metanfetamina~w~.")
			if IsControlJustPressed(0,38) and pegarbandeija and not colocarbandeija then
				local ped = PlayerPedId()
				colocarbandeija = true
				vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
				SetTimeout(2000,function()
					vRP._stopAnim(source,false)
					vRP._DeletarObjeto(source)
					bandeija3 = CreateObject(GetHashKey("bkr_prop_meth_smashedtray_01_frag_"),-526.47814941406,-1742.1788330078,16.950052261353-2.0,true,true,true)
					emP.checkPayment()
				end)
				SetTimeout(5000,function()
					DeleteObject(bandeija3)
					benzoato = false
					benzoatoobj1 = false
					toulene = false
					touleneobj1 = false
					misturar = false
					pegarbandeija = false
					colocarbandeija = false
					produzindo = false
				end)
			end
		end
		Citizen.Wait(skips)
	end
end)
-------------------------------------------------------------------------------------------------
--[ ANTI-BUG ]-----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

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
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 255, 255, 0, 10)
end