local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("emp_colheita_skips")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local CoordenadaX =  417.12  --   417.12, 6520.51, 27.72
local CoordenadaY =6520.51
local CoordenadaZ = 27.72
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = 742.66, ['y'] = 6455.79, ['z'] = 31.22 },
	[2] = { ['x'] = 721.29, ['y'] = 6458.21, ['z'] = 30.61 },
	[3] = { ['x'] = 697.23, ['y'] = 6459.12, ['z'] = 30.45 },
	[4] = { ['x'] = 663.92, ['y'] = 6458.82, ['z'] = 31.11 },
	[5] = { ['x'] = 638.47, ['y'] = 6460.14, ['z'] = 30.1 },
	[6] = { ['x'] = 616.33, ['y'] = 6460.66, ['z'] = 29.48 },
	[7] = { ['x'] = 618.08, ['y'] = 6466.09, ['z'] = 29.35 },
	[8] = { ['x'] = 641.36, ['y'] = 6465.44, ['z'] = 29.96 },
	[9] = { ['x'] = 668.1, ['y'] = 6464.63, ['z'] = 30.32 },
	[10] = { ['x'] = 697.21, ['y'] = 6463.57, ['z'] = 30.26 },
	[11] = { ['x'] = 717.04, ['y'] = 6464.02, ['z'] = 30.05 },
	[12] = { ['x'] = 742.65, ['y'] = 6462.81, ['z'] = 30.57 },
	[13] = { ['x'] = 745.55, ['y'] = 6467.84, ['z'] = 29.48 },
	[14] = { ['x'] = 737.28, ['y'] = 6468.04, ['z'] = 29.72 },
	[15] = { ['x'] = 722.61, ['y'] = 6468.52, ['z'] = 29.4 },
	[16] = { ['x'] = 701.68, ['y'] = 6469.3, ['z'] = 29.89 },
	[17] = { ['x'] = 682.47, ['y'] = 6469.42, ['z'] = 29.89 },
	[18] = { ['x'] = 658.48, ['y'] = 6470.54, ['z'] = 30.08 },
	[19] = { ['x'] = 640.01, ['y'] = 6471.62, ['z'] = 30.08 },
	[20] = { ['x'] = 618.7, ['y'] = 6472.49, ['z'] = 29.54 },
	[21] = { ['x'] = 619.75, ['y'] = 6479.12, ['z'] = 29.94 },
	[22] = { ['x'] = 637.81, ['y'] = 6478.88, ['z'] = 30.27 },
	[23] = { ['x'] = 667.19, ['y'] = 6478.44, ['z'] = 29.81 },
	[24] = { ['x'] = 689.23, ['y'] = 6478.0, ['z'] = 29.24 },
	[25] = { ['x'] = 723.73, ['y'] = 6477.63, ['z'] = 28.45 },
	[26] = { ['x'] = 710.99, ['y'] = 6483.82, ['z'] = 28.33 },
	[27] = { ['x'] = 686.89, ['y'] = 6483.79, ['z'] = 29.03 },
	[28] = { ['x'] = 667.23, ['y'] = 6484.33, ['z'] = 29.39 },
	[29] = { ['x'] = 651.63, ['y'] = 6484.91, ['z'] = 29.68 },
	[30] = { ['x'] = 618.79, ['y'] = 6486.08, ['z'] = 29.75 },
	[31] = { ['x'] = 616.39, ['y'] = 6498.6, ['z'] = 28.99 },
	[32] = { ['x'] = 632.78, ['y'] = 6499.69, ['z'] = 29.03 },
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
			if distance <= 50 then
				skips = 1
				DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
				if distance <= 1.2 then
					skips = 1
					drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR A COLHEITA",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						servico = true
						selecionado = 1
						spawnTrator()
						ColocarRoupa()
						CriandoBlip(locs,selecionado)
						TriggerEvent("Notify","sucesso","Você entrou em serviço.")
						TriggerEvent("Notify","aviso","Pegue o trator e vá para a colheita.")
					end
				end
			end
		end
		Citizen.Wait(skips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVIÇO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)
			local veh = GetVehiclePedIsIn(PlayerPedId(),false)

			if distance <= 45.0 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z+0.20,0,0,0,0,180.0,130.0,2.0,2.0,1.0,255,0,0,50,1,0,0,1)
				if distance <= 2.5 then
					if IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("tractor2")) then
						SetEntityMaxSpeed(veh,0.45*10-0.45)
						RemoveBlip(blips)
						if selecionado == 32 then
							selecionado = 1
						else
							selecionado = selecionado + 1
						end
						emP.checkPayment()
						CriandoBlip(locs,selecionado)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if servico then
			if IsControlJustPressed(0,168) then
				servico = false
				MainRoupa()
				RemoveBlip(blips)
				if nveh then
					TriggerServerEvent("trydeleteveh",VehToNet(nveh))
					nveh = nil
				end
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
			end
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------
-- SEPARAR GRAOS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = {
	{ ['id'] = 1 , ['x'] = 421.77, ['y'] = 6482.26, ['z'] = 28.81 }, 
	{ ['id'] = 2 , ['x'] = 424.21, ['y'] = 6481.86, ['z'] = 28.81 },
	{ ['id'] = 2 , ['x'] = 424.33, ['y'] = 6484.7, ['z'] = 28.85 },

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCESSO --
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local skips = 1000
		if not processo then
			for _,v in pairs(locais) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
				local distance2 = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
				local vehicle = GetPlayersLastVehicle()
				if distance2 <= 10 then
					skips = 1
					DrawMarker(21,421.77,6482.26,28.81-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
					if distance2 <= 2 and not andamento then
						skips = 1
						drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR A SEPARAÇÃO DOS GRÃOS",4,0.5,0.93,0.50,255,255,255,180)
						if IsControlJustPressed(0,38) and emP.checkGraos() and not IsPedInAnyVehicle(ped) then
							processo = true
							segundos = 3
							vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
							SetTimeout(4000,function()
							emP.separarGraos()
							end)
						end
					end
				end
			end
		end
		if processo then
			skips = 1
			drawTxt("AGUARDE ~g~"..segundos.."~w~ SEGUNDOS ATÉ FINALIZAR A SEPARAÇÃO DOS GRÃOS",4,0.5,0.93,0.50,255,255,255,180)
		end
		Citizen.Wait(skips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
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

function FadeRoupa(time,tipo,idle_copy)
	DoScreenFadeOut(800)
	Wait(time)
	if tipo == 1 then 
		vRP.setCustomization(idle_copy)
	else
		TriggerServerEvent("emp_corona_skips:roupa")
	end
	DoScreenFadeIn(800)
end

local roupaEletricistaSkips = {
	["Eletricista"] = {
		[1885233650] = {                                      
            [1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 0,0 },
            [4] = { 75,0 },
            [5] = { 0,0 },
            [6] = { 27,0 },
            [7] = { 0,0 },
            [8] = { 115,0 },
			[9] = { 13,0 },
            [10] = { -1,0 },
            [11] = { 499,1 },
			["p0"] = { 183,0 },
            ["p1"] = { 0,0 }
        },
        [-1667301416] = {
			[1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 1,0 },
            [4] = { 217,0 },
            [5] = { 0,0 },
            [6] = { 26,0 },
            [7] = { 29,0 },
            [8] = { 259,0 },
			[9] = { 14,0 },
            [10] = { -1,0 },
            [11] = { 354,11 },
			["p0"] = { -1,0 },
            ["p1"] = { -1,0 }
        }
	}
}

function ColocarRoupa()
	if vRP.getHealth() > 101 then
		if not vRP.isHandcuffed() then
			local custom = roupaEletricistaSkips["Eletricista"]
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Colheita")
	EndTextCommandSetBlipName(blips)
end

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

function spawnTrator()
	local mhash = "tractor2"
	if not nveh then
	while not HasModelLoaded(mhash) do
	    RequestModel(mhash)
	    Citizen.Wait(10)
	end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		nveh = CreateVehicle(mhash,432.19, 6508.63, 28.25+0.5,79.52,true,false)
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