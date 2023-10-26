local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("emp_pescador_skips")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
local taskbar = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local skips = 1000
		if not processo then
			local ped = PlayerPedId()
			
			local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),20.15,3868.12,28.42) -- 720.15,3868.12,28.42
			if distancia <= 180 and taskbar == false then
				skips = 1
				DrawMarker(1,20.15,3868.12,28.42-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
				if distancia <= 180 then
					skips = 1
					drawTxt("PRESSIONE  ~b~E~w~  PARA INICIAR A PESCARIA",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if emP.checkItens() then
							processo = true
							segundos = 10
							taskbar = true

							SetTimeout(10000,function()
								
								emP.checkPayment()
								vRP._stopAnim(false)
								vRP._DeletarObjeto()
								taskbar = false
							end)
							
							if not IsEntityPlayingAnim(ped,"amb@world_human_stand_fishing@idle_a","idle_c",3) then
								vRP._CarregarObjeto("amb@world_human_stand_fishing@idle_a","idle_c","prop_fishing_rod_01",15,60309)
							end
							TriggerEvent('cancelando',true)
						end
					end
				end
			end
		end
		if processo then
			skips = 1
			drawTxt("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ FISGAR UM PEIXE",4,0.5,0.93,0.50,255,255,255,180)
			
		end
		Citizen.Wait(skips)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
			--	ClearPedTasks(PlayerPedId())
			--	vRP._stopAnim(false)
			--	vRP._DeletarObjeto()
				
				TriggerEvent("Notify","sucesso","Parece que tem um peixe por perto!")
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