local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("emp_lenhador_skips")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
local list = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CORDENADAS DAS ARVORES
-----------------------------------------------------------------------------------------------------------------------------------------
local arvores = {
	{ 1,-1578.97,4538.94,18.98 },
	{ 2,-1572.79,4520.81,19.07 },
	{ 3,-1575.64,4517.89,19.24 },
	{ 4,-1574.02,4513.43,19.98 },
	{ 5,-1572.27,4503.38,21.09 },
	{ 6,-1577.34,4504.02,20.82 },
	{ 7,-1580.87,4495.17,21.35 },
	{ 8,-1586.38,4500.06,20.75 },
	{ 9,-1591.82,4503.67,20.38 },
	{ 10,-1592.93,4501.04,20.44 },
	{ 11,-1596.97,4496.67,20.07 },
	{ 12,-1597.50,4487.70,18.69 },
	{ 13,-1602.40,4480.68,16.42 },
	{ 14,-1603.45,4483.81,17.05 },
	{ 15,-1605.55,4485.84,17.09 },
	{ 16,-1592.38,4484.62,17.17 },
	{ 17,-1591.48,4481.66,16.31 },
	{ 18,-1589.24,4487.65,18.72 },
	{ 19,-1584.40,4491.20,20.81 },
	{ 20,-1574.44,4496.91,21.73 },
	{ 21,-1574.99,4491.95,22.53 },
	{ 22,-1576.33,4485.01,22.22 },
	{ 23,-1578.53,4511.93,19.95 },
	{ 24,-1581.35,4513.32,19.59 },
	{ 25,-1583.85,4515.67,19.07 },
	{ 26,-1585.75,4517.67,18.66 },
	{ 27,-1592.67,4516.29,17.82 },
	{ 28,-1591.53,4513.23,18.69 },
	{ 29,-1599.65,4509.46,18.32 },
	{ 30,-1605.21,4508.43,17.04 },
	{ 31,-1599.58,4517.08,16.56 },
	{ 32,-1585.39,4509.44,19.97 },
	{ 33,-1589.57,4507.30,20.12 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local skips = 1000
		if not processo then
			for _,func in pairs(arvores) do
				local ped = PlayerPedId()
				local i,x,y,z = table.unpack(func)
				local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),x,y,z)
				if distancia <= 20 and list[i] == nil then
					skips = 1
					DrawMarker(21,x,y,z,0,0,0,0,180.0,130.0,0.6,0.8,0.5,98,163,41,25,1,0,0,1)
					if distancia <= 1.2 then
						skips = 1
						drawTxt("PRESSIONE  ~b~E~w~  PARA CORTAR MADEIRA",4,0.5,0.93,0.50,255,255,255,180)
						if IsControlJustPressed(0,38) then
							if GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_HATCHET") or GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_BATTLEAXE") then
								if emP.checkPayment() then
									list[i] = true
									processo = true
									segundos = 3
									SetEntityCoords(ped,x,y,z-1)
									SetEntityHeading(ped,100.0)
									vRP._playAnim(false,{{"melee@hatchet@streamed_core","plyr_front_takedown_b"}},true)
									TriggerEvent('cancelando',true)
								end
							end
						end
					end
				end
			end
		end
		if processo then
			drawTxt("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ FINALIZAR A EXTRAÇÃO DA MADEIRA",4,0.5,0.93,0.50,255,255,255,180)
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
					vRP._stopAnim(false)
					TriggerEvent('cancelando',false)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(180000)
		list = {}
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

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
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




-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX = -841.07
local CoordenadaY = 5401.668
local CoordenadaZ = 34.61 
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 1289.45, ['y'] = -1747.1, ['z'] = 54.02 },
	[2] = { ['x'] = 1210.62, ['y'] = -1309.52, ['z'] = 35.22 },
	[3] = { ['x'] = 1561.41, ['y'] = -1693.56, ['z'] = 89.21 },
	[4] = { ['x'] = 557.64, ['y'] = -2328.00, ['z'] = 5.82 },
	[5] = { ['x'] = -1097.71, ['y'] = -1649.72, ['z'] = 4.39 },
	[6] = { ['x'] = -2016.37, ['y'] = 559.32, ['z'] = 108.30 },
	[7] = { ['x'] = -663.58, ['y'] = 222.33, ['z'] = 81.95 },
	[8] = { ['x'] = 141.28, ['y'] = -379.58, ['z'] = 43.25 },
	[9] = { ['x'] = 23.99, ['y'] = -619.81, ['z'] = 35.34 }
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
				DrawMarker(27,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0.0,0,0,0.7,0.7,0.7, 255,255,0,90,0,0,0,1)


				
				if distance <= 1.2 then
					skips = 1
					--drawTxt("PRESSIONE  ~b~E~w~  PARA INICIAR ENTREGAS",4,0.5,0.93,0.50,255,255,255,180)

					DrawText3D(CoordenadaX,CoordenadaY,CoordenadaZ, "[~y~E~w~] Para pegar ~y~PEGAR AS ROTAS~w~.")
					

					if IsControlJustPressed(0,38) then
						servico = true
						selecionado = math.random(9)

						ColocarRoupa()
						spawnVan()
						TriggerEvent("Notify","sucesso","<b>Você iniciou seu expediente, vá trabalhar!</b>!")
						
						CriandoBlip(locs,selecionado)
						CriandoBlip2(floresta)
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
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z,0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)
				if distance <= 1.2 then
					skips = 1
					drawTxt("PRESSIONE  ~b~E~w~  PARA ENTREGAR TORAS DE MADEIRA",4,0.5,0.93,0.50,255,255,255,255)
					if IsControlJustPressed(0,38) then
						if emP.checkPayment1() then
							RemoveBlip(blips)
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


---------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if servico then
			if IsControlJustPressed(0,168) then
				TriggerEvent("Notify","sucesso","<b>Você</b> precionou F7 e saiu de <b>expediente</b>!")
				servico = false
				MainRoupa()
				if nveh then
					TriggerServerEvent("trydeleteveh",VehToNet(nveh))
					nveh = nil
				end
				RemoveBlip(blips)
				RemoveBlip(floresta)
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

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,1)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Madeira")
	EndTextCommandSetBlipName(blips)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
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
		TriggerServerEvent("emp_lenhador_skips:roupa")
	end
	DoScreenFadeIn(800)
end

local roupasLenhadorSkips = {
	["Lenhador"] = {
		[1885233650] = {                                      
            [1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 185,0 },
            [4] = { 75,0 },
            [5] = { 0,0 },
            [6] = { 27,0 },
            [7] = { 172,0 },
            [8] = { 15,0 },
			[9] = { 13,0 },
            [10] = { -1,0 },
            [11] = { 477,1 },
			["p0"] = { -1,0 },
            ["p1"] = { -1,0 }
        },
        [-1667301416] = {
			[1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 32,0 },
            [4] = { 217,0 },
            [5] = { 0,0 },
            [6] = { 26,0 },
            [7] = { 29,0 },
            [8] = { 259,0 },
			[9] = { 14,0 },
            [10] = { -1,0 },
            [11] = { 591,0 },
			["p0"] = { -1,0 },
            ["p1"] = { -1,0 }
        }
	}
}

function ColocarRoupa()
	if vRP.getHealth() > 101 then
		if not vRP.isHandcuffed() then
			local custom = roupasLenhadorSkips["Lenhador"]
			if custom then
				local old_custom = vRP.getCustomization()
				local idle_copy = {}

				idle_copy = emP.SaveIdleCustom(old_custom)
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


function CriandoBlip2(florestaa)
	floresta = AddBlipForCoord(-1578.97,4538.94,18.98)
	SetBlipSprite(floresta, 9)
	SetBlipColour(floresta, 1)
	SetBlipAlpha(floresta, 30)
	SetBlipScale(floresta,0.3)
	
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coleta de TORAS")
	EndTextCommandSetBlipName(floresta)
end

function spawnVan()
	local mhash = "ratloader"
	if not nveh then
	while not HasModelLoaded(mhash) do
	    RequestModel(mhash)
	    Citizen.Wait(10)
	end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		nveh = CreateVehicle(mhash,-836.2, 5408.23, 33.9+0.5,343.98,true,false)
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