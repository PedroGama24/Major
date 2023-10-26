local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("skips_lavagem")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS --
-----------------------------------------------------------------------------------------------------------------------------------------
local papel = false
local colocarpapel = false
local pegarnota = false
local colocarnota = false
local embalando = false
-------------------------------------------------------------------------------------------------
--[ AÇÃO ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() -- PEGAR PAPEL
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),935.97, -1464.54, 23.05, true ) <= 2 and not papel then
			DrawText3D(935.97, -1464.54, 23.05, "[~w~E~w~] Para coletar o ~w~PAPEL~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),935.97, -1464.54, 23.05, true ) <= 2 and not papel then
				if IsControlJustPressed(0,38) and emP.checkDinheiro() then
					sleep = 5
					local ped = PlayerPedId()
					papel = true
					vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
					vRP._CarregarObjeto("anim@heists@box_carry@","idle","bkr_prop_prtmachine_paperream",50,28422,0.0,-0.35,-0.05,0.0,180.0,0.0)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function() -- COLOCAR PAPEL
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),941.08, -1464.87, 23.05, true ) <= 2 and papel and not colocarpapel then
			DrawText3D(941.08, -1464.87, 23.05, "[~w~E~w~] Para colocar o ~w~PAPEL~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),941.08, -1464.87, 23.05, true ) <= 2 and papel and not colocarpapel then
				if IsControlJustPressed(0,38) and emP.checkPermissao() then
					sleep = 5
					local ped = PlayerPedId()
					colocarpapel = true
					vRP._DeletarObjeto(source)
					vRP._stopAnim(source,false)
					notasfalsa = CreateObject(GetHashKey("bkr_prop_prtmachine_moneyream"),940.68, -1475.79, 23.63-1.1,true,true,true)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function() -- PEGAR NOTAS FALSAS
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),940.83, -1475.95, 23.63, true ) <= 2 and colocarpapel and not pegarnota then
			DrawText3D(940.83, -1475.95, 23.63, "[~w~E~w~] Para pegar as ~w~NOTAS FALSAS~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),940.83, -1475.95, 23.63, true ) <= 2 and colocarpapel and not pegarnota then
				if IsControlJustPressed(0,38) and emP.checkPermissao() then
					sleep = 5
					local ped = PlayerPedId()
					pegarnota = true
					vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
					vRP._CarregarObjeto("anim@heists@box_carry@","idle","bkr_prop_prtmachine_moneyream",50,28422,0.0,-0.35,-0.05,0.0,180.0,0.0)
					DeleteObject(notasfalsa)
				end
			end
		end	
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function() -- COLOCAR NOTAS FALSAS
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),932.01, -1468.16, 23.05, true ) <= 2 and pegarnota and not colocarnota then
			DrawText3D(932.01, -1468.16, 23.05, "[~w~E~w~] Para colocar na mesa as ~w~NOTAS FALSAS~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),932.01, -1468.16, 23.05, true ) <= 2 and pegarnota and not colocarnota then
				if IsControlJustPressed(0,38) and emP.checkPermissao() then
					sleep = 5
					local ped = PlayerPedId()
					colocarnota = true
					vRP._DeletarObjeto(source)
					vRP._stopAnim(source,false)
					notasfalsa1 = CreateObject(GetHashKey("bkr_prop_prtmachine_moneyream"),932.59, -1467.87, 23.99-1.1,true,true,true)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function() -- EMBALAR NOTAS FALSAS
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 931.98, -1467.93, 23.05, true ) <= 2 and colocarnota and not embalando then
			DrawText3D(931.98, -1467.93, 23.05, "[~w~E~w~] Para embalas as ~w~NOTAS FALSAS~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 931.98, -1467.93, 23.05, true ) <= 2 and colocarnota and not embalando then
				if IsControlJustPressed(0,38) and emP.checkPermissao() then
					sleep = 5
					local ped = PlayerPedId()
					TriggerServerEvent("lavar-dinheiro","contardinheiro")
					SetEntityHeading(ped,284.14)
					SetEntityCoords(ped,931.98, -1467.93, 23.05-0,7,false,false,false,false)
					embalando = true
					colocarnota = false
					pegarnota = false
					colocarpapel = false
					papel = false
					SetTimeout(10000,function()
						embalando = false
						emP.checkPayment()
						DeleteObject(notasfalsa1)
					end)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-------------------------------------------------------------------------------------------------
--[ ANTI-BUG ]-----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if papel then
			DisableControlAction(0,167,true)
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
    
    SetTextScale(0.38, 0.38)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
end