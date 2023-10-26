local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_farms")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0

-----------------------------------------------------------------------------------------------------------------------------------------
--  COLETA LARANJAS - PEGAR LARANJAS
-----------------------------------------------------------------------------------------------------------------------------------------
local laranjas = {
	{ 377.62771606445,6517.5278320312,28.377960205078 },
	{ 369.90811157227,6517.2197265625,28.369789123535 },
	{ 363.12442016602,6518.0126953125,28.28963470459 },
	{ 377.80847167969,6506.3994140625,27.985116958618 },
	{ 370.46722412109,6506.28125,28.407974243164 },
	{ 363.66625976562,6506.0498046875,28.5442237854 }
}

local morangos = {
	{ 1829.82, 4998.35, 54.21 },
	{ 1825.13, 4994.25, 53.11 },
	{ 1834.16, 4993.43, 53.6 },
	{ 1830.43, 4990.25, 52.68 },
}

local processo = false
local segundos = 0


Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		if not processo then
		for _,func in pairs(laranjas) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(func)
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),x,y,z)
			if distancia <= 2.5 then
				sleep = 1
				drawTxt("PRESSIONE  ~o~E~w~  PARA ~o~PEGAR AS LARANJAS",4,0.5,0.90,0.50,255,255,255,200)
			    if IsControlJustPressed(0,38) then
					processo = true
					segundos = 5
					vRP._playAnim(false,{{"amb@lo_res_idles@","arms_up_lo_res_base"}},true)

					SetTimeout(5000,function()
						TriggerServerEvent("vanillapegar")
						TriggerEvent('cancelando',true)
						vRP._stopAnim(source)
						Citizen.Wait(tempo)
						TriggerEvent('cancelando',false)
					end)

			    end
			end
		end
	end
		Citizen.Wait(sleep)	
	end
end)


Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		if not processo then
		for _,func in pairs(morangos) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(func)
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),x,y,z)
			if distancia <= 2.5 then
				sleep = 1
				drawTxt("PRESSIONE  ~r~E~w~  PARA ~r~COLHER OS MORANGOS",4,0.5,0.90,0.50,255,255,255,200)
			    if IsControlJustPressed(0,38) then
					processo = true
					segundos = 5
					
					vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a", "idle_a_female"}},true)

					SetTimeout(5000,function()
						TriggerServerEvent("vanillapegar2")
						TriggerEvent('cancelando',true)
						vRP._stopAnim(source)
						Citizen.Wait(tempo)
						TriggerEvent('cancelando',false)
					end)

			    end
			end
		end
	end
		Citizen.Wait(sleep)	
	end
end)

-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
				ClearPedTasks(PlayerPedId())
				vRP._DeletarObjeto()
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

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

