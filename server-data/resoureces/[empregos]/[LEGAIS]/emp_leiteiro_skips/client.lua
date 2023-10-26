local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("emp_leiteiro_skips")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- CORDENADAS DAS VACAS
-----------------------------------------------------------------------------------------------------------------------------------------
local vacas = {
	{ 2153.3208007812,5012.4052734375,41.334892272949 },
	{ 2150.0112304688,5009.0854492188,41.333385467529 },
	{ 2147.03125,5011.76171875,41.306804656982 },
	{ 2150.5126953125,5015.0473632812,41.351593017578 },

	{ 2147.0446777344,5005.9565429688,41.33504486084 },
	{ 2144.2026367188,5008.2578125,41.295513153076 },
	{ 2140.8137207031,5004.9077148438,41.28364944458 },
	{ 2143.294921875,5002.17578125,41.305011749268 },

	{ 2139.9562988281,4999.03125,41.402194976807 },
	{ 2137.0415039062,5001.3955078125,41.398345947266 },
	{ 2133.1591796875,4997.5219726562,41.33918762207 },
	{ 2135.7863769531,4995.3403320312,41.381778717041 },

	{ 2132.3583984375,4991.9697265625,41.31001663208 },
	{ 2129.7045898438,4994.1801757812,41.313522338867 },
	{ 2126.3967285156,4991.0424804688,41.273048400879 },
	{ 2128.5283203125,4988.4765625,41.255996704102 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local skips = 1000
		if not processo then
			for _,func in pairs(vacas) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(func)
				local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),x,y,z)
				if distancia <= 1.2 then
					skips = 1
					drawTxt("PRESSIONE  ~y~E~w~  PARA ORDENHAR A VACA",4,0.5,0.95,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then

						Wait(500)
						
						local taskResult = exports['c2n_taskbar']:getTaskBar("facil","Ordenhar a vaca")
						if taskResult then

							if emP.checkPayment() then
								TriggerEvent('cancelando',true)
								processo = true
								segundos = 10
							end
						else
							TriggerEvent("Notify","Negado","Infelizmente você não conseguiu, tente novamente!!")
						end
					end
				end
			end
		end
		if processo then
			skips = 1
			drawTxt("AGUARDE ~y~"..segundos.."~w~ SEGUNDOS PARA ORDENHAR A PROXIMA VACA",4,0.5,0.95,0.50,255,255,255,180)
		end
		Citizen.Wait(skips)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if processo then
			if segundos > 0 then
				segundos = segundos - 1
				if segundos == 0 then
					processo = false
					TriggerEvent('cancelando',false)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
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


-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL DE ENTREGA!
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = 1169.31  
local CoordenadaY = -291.105
local CoordenadaZ = 69.021


-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 32.429, ['y'] = -1343.033, ['z'] = 29.497 },  --   32.429927825928,-1343.0339355469,29.497022628784  
	[2] = { ['x'] = 2553.24, ['y'] = 388.62, ['z'] = 108.62 },  -- 2553.2416992188,388.62710571289,108.62292480469
	[3] = { ['x'] = 1153.512, ['y'] = -320.19, ['z'] = 69.20 }, -- 1153.5129394531,-320.19995117188,69.205039978027
	[4] = { ['x'] = -716.570, ['y'] = -909.17, ['z'] = 19.21 }, -- -716.57006835938,-909.17791748047,19.21558380127
	[5] = { ['x'] = -51.75, ['y'] = -1747.96, ['z'] = 29.420 }, -- -51.753528594971,-1747.9622802734,29.420993804932
	[6] = { ['x'] = 381.101, ['y'] = 328.682, ['z'] = 103.566 }, -- 381.10113525391,328.6823425293,103.56636047363
	[7] = { ['x'] = -3245.85, ['y'] = 1008.20, ['z'] = 12.83 }, -- -3245.8505859375,1008.2083740234,12.8307056427
	[8] = { ['x'] = 1737.06, ['y'] = 6415.453, ['z'] = 35.037 }, -- 1737.0626220703,6415.453125,35.037220001221
	[9] = { ['x'] = 541.39, ['y'] = 2666.02, ['z'] = 42.156 } -- 541.39428710938,2666.029296875,42.156482696533
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local skips = 1000
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)

			if distance <= 30.0 then
				skips = 1
				DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)
				if distance <= 1.2 then
					skips = 1
					drawTxt("PRESSIONE  ~b~E~w~  PARA INICIAR ENTREGAS",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						servico = true
						selecionado = math.random(9)
						CriandoBlip(locs,selecionado)
					end
				end
			end
		end
		Citizen.Wait(skips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local skips = 1000
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)

			if distance <= 30.0 then
				skips = 1
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.15,0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)
				if distance <= 1.2 then
					skips = 1
					drawTxt("PRESSIONE  ~b~E~w~  PARA ENTREGAR GARRAFAS DE LEITE",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						if emP.checkPayment1() then
							vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
							RemoveBlip(blips)
					--		TriggerEvent("Notify","sucesso","<b>Leite</b> entregue com <b>sucesso</b>, vá para proxima rota!")
							backentrega = selecionado
							while true do
								if backentrega == selecionado then
									selecionado = math.random(9)
								else
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						end
					end
				end
			end
		end
		Citizen.Wait(skips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if servico then
			if IsControlJustPressed(0,168) then
				TriggerEvent("Notify","sucesso","<b>Você</b> precionou F7 e saiu de <b>expediente</b>!")
				servico = false
				RemoveBlip(blips)
			end
		end
	end
end)

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Leite")
	EndTextCommandSetBlipName(blips)
end

