--MAER COSTA DIREITOS RESERVADOS


local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("instaladorInternet")



local Objects = {
    { ["x"] = 399.06744384766, ["y"] = -769.93621826172, ["z"] = 29.286233901978, ["h"] = 69.0, ["model"] = "dt1_15_ladder_003" }

}

local trabalhando = false
local escadaNaMao = false
local escadaNoCarro =true
local escadaNoPoste = false
local foraCarro = true

local executandoServico = false
local servicoConcluido = false


local posteConsertado = {}

--TEMPO PARA CONSERTAR
tempoConserto = 6
-- TEMPO DE RESPAWN
local tempoRespawn = 21000  -- 7 minutos 

local respawn = 0
local segundos =0

Citizen.CreateThread(function()
	FreezeEntityPosition(PlayerPedId(), false)
	while true do
		local objects = {}
			for k,v in pairs(cfg.postes) do
				table.insert(objects, v.prop)
			end
		Citizen.Wait(10)
        if IsControlJustPressed(0,38)  then
						--	vRP._CarregarObjeto("amb@world_human_muscle_free_weights@male@barbell@idle_a","idle_a","prop_byard_ladder01",49,28422)
         local obj = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 3.0, GetHashKey(objects[1]), false, true ,true)
         end
		-- BLIP DO EXPEDIENTE 
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),723.07, -2016.19, 29.31640625,true)
		if distance <= 30 then
			DrawMarker(21,723.07, -2016.19, 29.31640625,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)

			if distance <= 1.2 then

				if not trabalhando then
		    	--	DrawText3D(723.07, -2016.19, 29.3640625 + 1.5, 'PRESSIONE  ~b~E~w~  PARA INICIAR O EXPEDIENTE')  
					if IsControlJustPressed(0,38)  then
							trabalhando = true
							spawnUno()
							ColocarRoupa()

							TriggerEvent("Notify","sucesso","Expediente iniciado! Vá instalar a internet!")
					
					end

				end			
			end
		end


		--PEGAR ESCADA
		if trabalhando and foraCarro() and Perto()  then
					if IsControlJustPressed(0,38) then
						--PEGA ESCADA NO CARRO
						if  not escadaNaMao and escadaNoCarro then
							escadaNoCarro = false
							escadaNaMao = true
							vRP.playAnim(true,{{"mini@repair","fixing_a_ped",1}},false)
							Wait(1000)
							vRP._stopAnim(false)
						--	vRP._CarregarObjeto("amb@world_human_muscle_free_weights@male@barbell@idle_a","idle_a","prop_byard_ladder01",49,28422)

						garbagebag = CreateObject(GetHashKey("prop_byard_ladder01"), 0, 0, 0, true, true, true) -- 
						AttachEntityToEntity(garbagebag, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.3, 0, 0, 150, 180.0, 180.0, true, true, false, true, 1, true) -- object is attached to right hand 

						elseif escadaNaMao and not escadaNoCarro then
							--GUARDAR ESCADA NO CARRO 
							escadaNoCarro = true
							escadaNaMao = false
							vRP.playAnim(true,{{"mini@repair","fixing_a_ped",1}},false)
							Wait(1000)
							vRP._stopAnim(false)
							vRP._DeletarObjeto()
							local garbagebagdelete = DeleteEntity(garbagebag)
						end
					TriggerEvent('cancelando',false)
				end
		end	

-- NOS POSTES
	if escadaNaMao or escadaNoPoste then
		-- PARA CRIAR OS BLIPS
		local ped = GetPlayerPed(-1)
		local list = {}
		for k,v in pairs(objects) do
			local obj = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 3.0, GetHashKey(v), false, true ,true)
			local dist = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(obj), true)
			table.insert(list, {object = obj, distance = dist})
		end
		local closest = list[1]
		for k,v in pairs(list) do
			if v.distance < closest.distance then
				closest = v
			end
		end
		local distance = closest.distance
		local object = closest.object

			--ESCREVE O BLIP NA AREA DE SEGURANÇA PARA NAO CAIR 
			if escadaNoPoste and not executandoServico then
				local ob = GetEntityCoords(object).z
				local p = GetEntityCoords(ped).z
				local distancia = p - ob



					if distancia > 5 then
						DrawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z +2,  'PRESSIONE  ~b~Y~w~  PARA INSTALAR A INTERNET') 

						if IsControlJustPressed(0, 246) then
							--INICIA O REPARO , SOBE NA ESCADA E MARTELA O MARTELÃO
								executandoServico = true
								segundos = tempoConserto
							
							
						end




					end
			end

		if distance < cfg.distance and DoesEntityExist(object) and not posteConsertado[object] then

		--ESCREVE NOS POSTES 
			local ped = PlayerPedId()
	    if escadaNaMao then
			DrawText3D(GetEntityCoords(object).x, GetEntityCoords(object).y, GetEntityCoords(object).z + 2.5, 'PRESSIONE  ~b~Y~w~  COLOCAR A ESCADA')  
		elseif escadaNoPoste and  servicoConcluido then
			DrawText3D(GetEntityCoords(object).x, GetEntityCoords(object).y, GetEntityCoords(object).z + 2.5, 'PRESSIONE  ~b~Y~w~  PARA PEGAR A ESCADA')  
		end

			--CONTROLES AO PRESSIONAR Y
				if IsControlJustPressed(0, 246) then
							--COLOCA A ESCADA NO POSTE E FAZ ANIMAÇÃO DE COLOCAR NO POSTE.
				if not escadaNoPoste and escadaNaMao then
								escadaNoPoste = true
								escadaNaMao	= false
								executandoServico =false
								vRP.playAnim(true,{{"mini@repair","fixing_a_ped",1}},false)
								Wait(1000)
								vRP._stopAnim(false)
								vRP._DeletarObjeto()
								local garbagebagdelete = DeleteEntity(garbagebag)
								TriggerEvent('cancelando',false)
								local HashKey = GetHashKey("hw1_06_ldr_")
								notificacao()
							 	SpawnObject = CreateObject(HashKey,GetEntityCoords(object).x - 0.25 ,GetEntityCoords(object).y ,GetEntityCoords(object).z )
								print(GetEntityCoords(object).x)
								print(GetEntityCoords(object).y)
								PlaceObjectOnGroundProperly(SpawnObject)
								SetEntityHeading(SpawnObject, 69.0)
								FreezeEntityPosition(SpawnObject, true)
								SetEntityAsMissionEntity(SpawnObject, true, true)
					

				-- RETIRA A ESCADA DO POSTE E COLOCA NA MÃO
				elseif escadaNoPoste and not escadaNaMao and servicoConcluido then
						servicoConcluido= false
						executandoServico =false
						escadaNoPoste = false
						escadaNaMao	= true
					posteConsertado[object] = true

						vRP.playAnim(true,{{"mini@repair","fixing_a_ped",1}},false)
						Wait(1000)

						DeleteObject(SpawnObject)
						vRP._stopAnim(false)
						garbagebag = CreateObject(GetHashKey("prop_byard_ladder01"), 0, 0, 0, true, true, true) -- 
                        AttachEntityToEntity(garbagebag, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.3, 0, 0, 150, 180.0, 180.0, true, true, false, true, 1, true) -- object is attached to right hand 
				end
			end
		end
if segundos > 0 then
drawTxt("AGUARDE ~b~"..segundos.."~w~ SEGUNDOS ATÉ FINALIZAR A INSTALAÇÃO",4,0.5,19,0.50,255,255,255,180)
else
end
	end

	end
end)



-- VERIFICAR SE ESTA FORA DO CARRO
function foraCarro()
local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        if(GetPedInVehicleSeat(veh, -1) == ped) then
		return false
		else
		return true
		end
end

function Perto()
  local ped = GetPlayerPed(-1)
  local veh = GetVehiclePedIsIn(ped, false)
  local vehicle = vRP.getNearestVehicle(7)
  local model = GetEntityModel(vehicle)
  local displaytext = GetDisplayNameFromVehicleModel(model)
  local name = GetLabelText(displaytext)
print(model)
local vehicleCoords = GetEntityCoords(vehicle)
local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),vehicleCoords.x,vehicleCoords.y,vehicleCoords.z,true)

  if (name == "Comet") and distance < 2.5 then
	if not escadaNaMao then
	DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z + 1.5, 'PRESSIONE  ~b~E~w~  PARA PEGAR A ESCADA')  
	else 
	DrawText3D(GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z + 1.5, 'PRESSIONE  ~b~E~w~  PARA GUARDAR A ESCADA')  
	end

    return true
  else
    return false
  end
end

--FUNÇÕES IMPORTANTES--
function notificacao(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

DrawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
  	local scale = 0.45
   	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor , 0.030, 66, 66, 66, 150)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			vRP.playAnim(true,{{"amb@prop_human_movie_bulb@base","base"}},false)

			if segundos == 0 then
				vRP._stopAnim(true)

				servicoConcluido = true
				vRP._stopAnim(false)
				local valor = emP.pagar()
				TriggerEvent("Notify","sucesso","Você recebeu R$" .. valor)

				
				TriggerEvent('cancelando',false)
			end
		end
	end
end)


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

function notificacao(text)
	SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


function CriandoBlip(object)
	blips = AddBlipForCoord(GetEntityCoords(object).x,GetEntityCoords(object).y,GetEntityCoords(object).z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coleta de Lixo")
	EndTextCommandSetBlipName(blips)
end

function spawnUno()
	local mhash = "comet2"
	if not nveh then
	while not HasModelLoaded(mhash) do
	    RequestModel(mhash)
	    Citizen.Wait(10)
	end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		nveh = CreateVehicle(mhash,725.43, -2033.67, 28.92+0.5,355.82,true,false)
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
            [3] = { 42,1 },
            [4] = { 134,3 },
            [5] = { 0,0 },
            [6] = { 12,6 },
            [7] = { 0,0 },
            [8] = { 230,0 },
			[9] = { 13,0 },
            [10] = { -1,0 },
            [11] = { 363,3 },
			["p0"] = { 145,2 },
            ["p1"] = { 0,0 }
        },
        [-1667301416] = {
			[1] = { 0,0 },
			[2] = { 154,0 },
            [3] = { 122,6 },
            [4] = { 141,3 },
            [5] = { 0,0 },
            [6] = { 65,0 },
            [7] = { 29,0 },
            [8] = { 287,0 },
			[9] = { 14,0 },
            [10] = { -1,0 },
            [11] = { 382,3 },
			["p0"] = { 144,2 },
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
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if trabalhando then
			if IsControlJustPressed(0,168) then
				trabalhando = false
				local garbagebagdelete = DeleteEntity(garbagebag)
				MainRoupa()
				if nveh then
					TriggerServerEvent("trydeleteveh",VehToNet(nveh))
					nveh = nil
				end
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
			end
		end
	end
end)