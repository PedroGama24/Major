local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
func = Tunnel.getInterface("vrp_jewelry")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local andamento = false
local tipo = 0
local segundos = 0
local coordenadaX = -631.39
local coordenadaY = -230.25
local coordenadaZ = 38.05
-----------------------------------------------------------------------------------------------------------------------------------------
-- GERANDO LOCAL DO ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ 1,-626.69,-238.60,38.05,213.77 },
	{ 2,-625.63,-237.83,38.05,214.21 },
	{ 3,-625.78,-234.56,38.05,31.36 },
	{ 4,-626.84,-235.33,38.05,31.36 },
	{ 5,-627.95,-233.90,38.05,212.49 },
	{ 6,-626.90,-233.15,38.05,220.39 },
	{ 7,-620.21,-234.46,38.05,218.81 },
	{ 8,-619.16,-233.70,38.05,214.12 },
	{ 9,-617.54,-230.52,38.05,303.29 },
	{ 10,-618.27,-229.50,38.05,302.42 },
	{ 11,-619.64,-227.63,38.05,301.53 },
	{ 12,-620.40,-226.56,38.05,306.27 },
	{ 13,-623.90,-227.06,38.05,34.69 },
	{ 14,-624.94,-227.86,38.05,33.12 },
	{ 15,-624.40,-231.09,38.05,306.53 },
	{ 16,-623.99,-228.19,38.05,212.40 },
	{ 17,-621.07,-228.57,38.05,121.42 },
	{ 18,-619.72,-230.43,38.05,123.59 },
	{ 19,-620.15,-233.33,38.05,33.98 },
	{ 20,-623.05,-232.93,38.05,302.85 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- HACKEAR O SISTEMA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		local distance = GetDistanceBetweenCoords(coordenadaX,coordenadaY,coordenadaZ,x,y,z,true)
		if distance <= 1.1 and not andamento and not IsPedInAnyVehicle(ped) then
			drawTxt("PRESSIONE  ~b~E~w~  PARA HACKEAR AS CÂMERAS DE SEGURANÇA",4,0.5,0.93,0.50,255,255,255,180)
			if IsControlJustPressed(1,38) then
				func.checkJewelry(coordenadaX,coordenadaY,coordenadaZ,213.52,30,1)
			end
		end

		if andamento and tipo == 1 then
			drawTxt("FALTAM ~g~"..segundos.." SEGUNDOS ~w~PARA TERMINAR DE HACKEAR AS CÂMERAS DE SEGURANÇA",4,0.5,0.93,0.50,255,255,255,180)
		elseif andamento and tipo == 2 then
			drawTxt("FALTAM ~g~"..segundos.." SEGUNDOS ~w~PARA TERMINAR DE ROUBAR AS JOIAS",4,0.5,0.93,0.50,255,255,255,180)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROUBANDO AS JOIAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local skips = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))
		for _,v in pairs(locais) do
			local distance = GetDistanceBetweenCoords(v[2],v[3],v[4],x,y,z,true)
			if distance <= 1.1 and not andamento and not IsPedInAnyVehicle(ped) then
				skips = 5
				drawTxt("PRESSIONE  ~b~E~w~  PARA ROUBAR AS JOIAS",4,0.5,0.93,0.50,255,255,255,180)
				if IsControlJustPressed(1,38) then
					if func.returnJewelry() then
						func.checkJewels(v[1],v[2],v[3],v[4],v[5],2)
					else
						TriggerEvent("Notify","negado","Hackeie as câmeras de segurança.",8000)
					end
				end
			end
		end
		Citizen.Wait(skips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO O ROUBO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("iniciandojewelry")
AddEventHandler("iniciandojewelry",function(x,y,z,h,sec,mod,status)
	andamento = status
	if status then
		tipo = mod
		segundos = sec
		vRP._stopAnim(false)
		SetEntityHeading(GetPlayerPed(-1),h)
		SetEntityCoords(GetPlayerPed(-1),x,y,z-1,false,false,false,false)
		SetPedComponentVariation(GetPlayerPed(-1),9,0,0,2)
		SetPedComponentVariation(GetPlayerPed(-1),5,45,0,2)
		SetCurrentPedWeapon(GetPlayerPed(-1),GetHashKey("WEAPON_UNARMED"),true)
		TriggerEvent('cancelando',true)
	else
		TriggerEvent('cancelando',false)
		vRP._stopAnim(false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if andamento then
			segundos = segundos - 1
			if segundos <= 0 then
				tipo = 0
				andamento = false
				vRP._stopAnim(false)
				TriggerEvent('cancelando',false)
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