local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emp = Tunnel.getInterface("emp_motorista_skips")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local emservico = false
local CoordenadaX = 453.48
local CoordenadaY = -607.74
local CoordenadaZ = 28.57
local timers = 0
local payment = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO PONTOS DE BUS
-----------------------------------------------------------------------------------------------------------------------------------------
local pontos = {
	[1] = { 307.65036010742,-766.56817626953,29.381494 },
	[2] = { 112.01154327393,-949.20715332031,29.65517 },
	[3] = { -272.43658447266,-821.84350585938,31.934 },
	[4] = { -407.51760864258,-372.76373291016,32.3832 },
	[5] = { -1196.3402099609,230.45050048828,67.810 },
	[6] = { 55.374633789062,295.53744506836,110.65 },
	[7] = { 638.74963378906,320.37210083008,108.64 },
	[8] = { 1163.8836669922,403.21939086914,91.1878 },
	[9] = { 2162.1059570312,2682.7907714844,48.98 },
	[10] = { 1801.4133300781,3335.1689453125,41.55 },
	[11] = { 1585.9338378906,3783.2770996094,34.912},
	[12] = { 1942.6047363281,3738.9079589844,32.47 },
	[13] = { 428.54690551758,3485.8784179688,34.75 },
	[14] = { 90.836418151855,3691.1733398438,39.79 },
	[15] = { -118.10765838623,2845.6809082031,50.772 },
	[16] = { -1096.1314697266,2688.23046875,19.73 },
	[17] = { -2553.6359863281,2321.8347167969,33.183 },
	[18] = { -3232.9274902344,1008.492980957,11.941866874695 },
	[19] = { -3186.6232910156,1182.1915283203,9.58 },
	[20] = { -3004.78515625,402.0950012207,15.028 },
	[21] = { -2187.0451660156,-358.81866455078,13.140 },
	[22] = { -1226.3680419922,-891.59832763672,12.55 },
	[23] = { -993.70947265625,-1232.8386230469,5.56 },
	[24] = { -1204.3134765625,-1185.4161376953,7.76 },
	[25] = { -785.38494873047,-665.99157714844,29.351 },
	[26] = { -263.03442382812,-774.92095947266,32.46 },
	[27] = { 174.53012084961,-1035.6793212891,29.37 },
	[28] = { 278.92364501953,-916.03912353516,29.04 },
	[29] = { -630.27,-976.03,20.69 },
	[30] = { -566.36,-667.19,32.54 },
	[31] = { 143.16,-819.09,30.48 },
	[32] = { 408.65,-704.50,28.62 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		if not emservico then
			local ped = PlayerPedId()
			if not IsPedInAnyVehicle(ped) then
				local x,y,z = table.unpack(GetEntityCoords(ped))

				if Vdist(x,y,z,CoordenadaX,CoordenadaY,CoordenadaZ) <= 20 then
					sleep = 4
				--	DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.67, 0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)
					DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.4, 0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)
					if Vdist(x,y,z,CoordenadaX,CoordenadaY,CoordenadaZ) <= 1.2 then
						sleep = 4
						drawTxt("PRESSIONE  ~b~E~w~  PARA INICIAR ROTA",4,0.5,0.93,0.50,255,255,255,180)
						if IsControlJustPressed(1,38) then
							emservico = true
							ColocarRoupa()
							cancelar()
							startjob()
							spawnBus()
							destino = 1
							payment = 10
							CriandoBlip(pontos,destino)
							TriggerEvent("Notify","sucesso","Você entrou em serviço.")
						end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO ROTA
-----------------------------------------------------------------------------------------------------------------------------------------
function startjob()
	Citizen.CreateThread(function()
		while true do
			local sleep = 1000
			if emservico then
				local ped = PlayerPedId()
				if IsPedInAnyVehicle(ped) then
					local x,y,z = table.unpack(GetEntityCoords(ped))
					local vehicle = GetVehiclePedIsUsing(ped)
					local distance = Vdist(x,y,z,pontos[destino][1],pontos[destino][2],pontos[destino][3])
					if distance <= 40 and (IsVehicleModel(vehicle,GetHashKey("mi4")) or IsVehicleModel(vehicle,GetHashKey("mi4"))) then
						sleep = 5
						DrawMarker(21,pontos[destino][1],pontos[destino][2],pontos[destino][3]+0.60,0,0,0,0,180.0,130.0,2.0,2.0,1.0,255,50,0,90,1,0,0,1) 
						local vehiclespeed = GetEntitySpeed(vehicle)*3.6
						if math.ceil(vehiclespeed) <= 5 and distance <= 7.1 then
							sleep = 1
							drawTxt("PRESSIONE  ~b~E~w~  PARA CONTINUAR A ROTA",4,0.5,0.93,0.50,255,255,255,180)
							if IsControlJustPressed(1,38) then
								RemoveBlip(blip)
								if destino == 32 then
									emp.checkPayment(payment,350)
									destino = 1
									payment = 10
								else
									emp.checkPayment(payment,0)
									destino = destino + 1
								end
								CriandoBlip(pontos,destino)
							end
						end
					end

					
				end
			else
				break
			end
			Citizen.Wait(sleep)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMER
-----------------------------------------------------------------------------------------------------------------------------------------
function timer()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5000)
			if emservico then
				if timers > 0 then
					timers = timers - 5
				end
			else
				break
			end
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
function cancelar()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			if emservico then
			--	drawTxt("~y~PRESSIONE ~r~F7 ~w~SE DESEJA FINALIZAR A ROTA ",4,0.270,0.905,0.45,255,255,255,200)
				if IsControlJustPressed(0,168) then
					if nveh then
						TriggerServerEvent("trydeleteveh",VehToNet(nveh))
						nveh = nil
					end
					emservico = false
					RemoveBlip(blip)
					MainRoupa()
					TriggerEvent("Notify","aviso","Você saiu de serviço.")
				end
			else
				break
			end
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
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

function CriandoBlip(pontos,destino)
	blip = AddBlipForCoord(pontos[destino][1],pontos[destino][2],pontos[destino][3])
	SetBlipSprite(blip,1)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.4)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota de Motorista")
	EndTextCommandSetBlipName(blip)
end

function spawnBus()
	local mhash = "mi4"
	if not nveh then
	while not HasModelLoaded(mhash) do
	    RequestModel(mhash)
	    Citizen.Wait(10)
	end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		nveh = CreateVehicle(mhash,462.51,-605.27,29.32+0.5,214.04,true,false)
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

-------------


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
		TriggerServerEvent("emp_motorista_skips:roupa")
	end
	DoScreenFadeIn(800)
end

local RoupaEntregador = {
	["Entregador"] = {
		[1885233650] = {                                      
			[1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 1,0 },
            [4] = { 10,0 },
            [5] = { 0,0 },
            [6] = { 15,0 },
            [7] = { 21,1 },
            [8] = { 15,0 },
			[9] = { 13,0 },
            [10] = { -1,0 },
            [11] = { 349,0 },
			["p0"] = { -1,0 },
            ["p1"] = { -1,0 }
        },
        [-1667301416] = {
            [1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 1,0 },
            [4] = { 76,0 },
            [5] = { 0,0 },
            [6] = { 13,0 },
            [7] = { 29,0 },
            [8] = { 14,0 },
			[9] = { 14,0 },
            [10] = { -1,0 },
            [11] = { 367,0 },
			["p0"] = { -1,0 },
            ["p1"] = { -1,0 }
        }
	}
}

function ColocarRoupa()
	if vRP.getHealth() > 101 then
		if not vRP.isHandcuffed() then
			local custom = RoupaEntregador["Entregador"]
			if custom then
				local old_custom = vRP.getCustomization()
				local idle_copy = {}

				idle_copy = emp.SaveIdleCustom(old_custom)
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