----------------------------------------------------------------
--------------------- BY: SkipS#1234
----------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

aTx = {}
Tunnel.bindInterface("sks_empresas",aTx)
astrax = Tunnel.getInterface("sks_empresas")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS --
-----------------------------------------------------------------------------------------------------------------------------------------

local andamento = false
local segundos = 0
local time = 0

-----------------------------------------------------------------------------------------------------------------------------------------
-- nui
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(30000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(30000)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ BUTTON ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "comprar-ammo" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","Ammunation")
		
	elseif data == "comprar-ldr" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","LojaDeRoupas")
		
	elseif data == "comprar-tatto" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","Tatto")
	
	elseif data == "comprar-mercado" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","Mercadinho")
		
	elseif data == "comprar-tequila" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","TeQuilala")
		
	elseif data == "comprar-posto" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","PostoDeCombustivel")
		
	elseif data == "comprar-conce" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","Concessionaria")
		
	elseif data == "comprar-ls" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","LosSantos")
		
	elseif data == "comprar-jl" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","Joalheiria")
		
	elseif data == "comprar-bnk" then
		ToggleActionMenu()
		TriggerServerEvent("comprar","BancoFlecca")
		
		
		
		
	elseif data == "vender-ammo" then
		ToggleActionMenu()
		TriggerServerEvent("vender","Ammunation")
		
		elseif data == "vender-ldr" then
		ToggleActionMenu()
		TriggerServerEvent("vender","LojaDeRoupas")
		
	elseif data == "vender-tatto" then
		ToggleActionMenu()
		TriggerServerEvent("vender","Tatto")
	
	elseif data == "vender-mercado" then
		ToggleActionMenu()
		TriggerServerEvent("vender","Mercadinho")
		
	elseif data == "vender-tequila" then
		ToggleActionMenu()
		TriggerServerEvent("vender","TeQuilala")
		
	elseif data == "vender-posto" then
		ToggleActionMenu()
		TriggerServerEvent("vender","PostoDeCombustivel")
		
	elseif data == "vender-conce" then
		ToggleActionMenu()
		TriggerServerEvent("vender","Concessionaria")
		
	elseif data == "vender-ls" then
		ToggleActionMenu()
		TriggerServerEvent("vender","LosSantos")
		
	elseif data == "vender-jl" then
		ToggleActionMenu()
		TriggerServerEvent("vender","Joalheiria")
		
	elseif data == "vender-bnk" then
		ToggleActionMenu()
		TriggerServerEvent("vender","BancoFlecca")
	
	elseif data == "fechar" then
		ToggleActionMenu()
	
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ LOCAIS ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

local lojas = {
	{ ['x'] = -1082.09, ['y'] = -247.5050, ['z'] = 37.76}, --   -1082.0921630859,-247.50509643555,37.763278961182
}

-----------------------------------------------------------------------------------------------------------------------------------------
--[ MENU ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		sleep = 1000
		
		for k,v in pairs(lojas) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local lojas = lojas[k]
			
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), lojas.x, lojas.y, lojas.z, true ) <= 2 then
				sleep = 5
				DrawText3D(lojas.x, lojas.y, lojas.z, "[~y~E~w~] Para abrir o menu de ~y~EMPRESAS~w~.")
			--	DrawMarker(27,lojas.x, lojas.y, lojas.z-0.97,0,0,0,0.0,0,0,0.7,0.7,0.7, 255,255,0,90,0,0,0,1)
			end
			
			if distance <= 15 then
				sleep = 5
				DrawMarker(27,lojas.x, lojas.y, lojas.z-0.97,0,0,0,0.0,0,0,0.7,0.7,0.7, 255,255,0,90,0,0,0,1)
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) then
						ToggleActionMenu()						
					end
				end
			end
		end
		Wait(sleep)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
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
-- TIMER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(180*60000) -- cada 3 horas será realizado o pagamento!
		TriggerServerEvent("salarioempresa")
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCALIZAÇÃO DAS LAVAGENS DE DINHEIRO --
-----------------------------------------------------------------------------------------------------------------------------------------
local locallavagem = {
		{ ['id'] = 1 , ['x'] = -1057.550, ['y'] = -244.27, ['z'] = 44.02, ['h'] = 113.73 }, -- -1057.5509033203,-244.27479553223,44.021064758301
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO --
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		sleep = 1000
		for _,v in pairs(locallavagem) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 1.6 and not andamento then
				sleep = 5
		--		drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR LAVAGEM DE DINHEIRO",4,0.5,0.93,0.50,255,255,255,180)
				DrawText3D(locallavagem[1].x, locallavagem[1].y, locallavagem[1].z, "[~y~E~w~] Para lavar o seu ~y~DINHEIRO SUJO~w~.")
				DrawMarker(27,-1057.67, -244.28, 44.03-0.97,0,0,0,0.0,0,0,0.7,0.7,0.7, 255,255,0,90,0,0,0,1)

				if IsControlJustPressed(0,38) and astrax.propietario() and astrax.checkDinheiro() and not IsPedInAnyVehicle(ped) then
					astrax.lavagemPolicia(v.id,v.x,v.y,v.z,v.h)		
				end
			end
		end
		Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIANDO LAVAGEM DE DINHEIRO --
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("iniciandolavagem")
AddEventHandler("iniciandolavagem",function(head,x,y,z)
	segundos = 10
	time = 20
	andamento = true
	SetEntityHeading(PlayerPedId(),head)
	SetEntityCoords(PlayerPedId(),x,y,z-1,false,false,false,false)
	SetCurrentPedWeapon(PlayerPedId(),GetHashKey("WEAPON_UNARMED"),true)
	TriggerEvent('cancelando',true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTAGEM --
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if andamento then
			segundos = segundos - 1
			time = time - 1

			if segundos == 0 then
			--	andamento = false
				ClearPedTasks(PlayerPedId())
				TriggerEvent('cancelando',false)
				astrax.checkPayment()
				TriggerEvent("Notify","sucesso","Aguarde "..time.." segundos para lavar seu dinheiro novamente!")

			end

			if time <= 0 then
				andamento = false
			end


		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES --
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

----------------------------------------------------------------
--------------------- BY: SkipS#1234
----------------------------------------------------------------