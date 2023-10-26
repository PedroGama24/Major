-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
dogz = Tunnel.getInterface("vRP")
dg = {}
Tunnel.bindInterface("hud",dg)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local voice = 2
local stress = 0
local stamina = 0
local oxigen = 0
local hunger = 100
local thirst = 100
local hardness = {}
local showHud = false
local talking = false
local showMovie = false
local radioDisplay = ""
local homeInterior = false
local hour = nil
local minute = nil
local playerActive = false

local hotkey = true

-----------------------------------------------------------------------------------------------------------------------------------------
-- SEATBELT
-----------------------------------------------------------------------------------------------------------------------------------------
local beltLock = 0
local beltSpeed = 0
local beltVelocity = 0
local updateFoods = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIVINABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local divingMask = nil
local divingTank = nil
local clientOxigen = 100
local divingTimers = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOCKVARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local clockHours = 18
local clockMinutes = 0
local timeDate = GetGameTimer()
local weatherSync = "EXTRASUNNY"
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP:PLAYERACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp:playerActive")
AddEventHandler("vrp:playerActive",function(user_id)
	playerActive = true
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if playerActive then
			if divingMask ~= nil then
				if GetGameTimer() >= divingTimers then
					divingTimers = GetGameTimer() + 35000
					clientOxigen = clientOxigen - 1
					dogz.clientOxigen()

					if clientOxigen <= 0 then
						ApplyDamageToPed(PlayerPedId(),50,false)
					end
				end
			end
		end

		Citizen.Wait(5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFOODS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if playerActive then
			local ped = PlayerPedId()
			if GetGameTimer() >= updateFoods and GetEntityHealth(ped) > 101 then
				updateFoods = GetGameTimer() + 90000
				thirst = thirst - 1
				hunger = hunger - 1
				dogz.clientFoods()
			end
		end

		Citizen.Wait(30000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if GetGameTimer() >= timeDate then
			timeDate = GetGameTimer() + 3000
			clockMinutes = clockMinutes + 2

			if clockMinutes >= 60 then
				clockHours = clockHours + 1
				clockMinutes = 0

				if clockHours >= 24 then
					clockHours = 0
				end
			end
		end

		Citizen.Wait(10000)
	end
end)
--[[ -----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if homeInterior then
			SetWeatherTypeNow("EXTRASUNNY")
			SetWeatherTypePersist("EXTRASUNNY")
			SetWeatherTypeNowPersist("EXTRASUNNY")
			NetworkOverrideClockTime(12,00,00)
		else
			SetWeatherTypeNow(weatherSync)
			SetWeatherTypePersist(weatherSync)
			SetWeatherTypeNowPersist(weatherSync)
			NetworkOverrideClockTime(clockHours,clockMinutes,00)
		end

		if beltLock >= 1 then
			DisableControlAction(1,75,true)
		end

		Citizen.Wait(0)
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- VOICETALKING
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("hud:userTalking",function(status)
	talking = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROGRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Progress")
AddEventHandler("Progress",function(progressTimer)
	SendNUIMessage({ progress = true, progressTimer = parseInt(progressTimer - 500) })
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHUD
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if showHud then
			updateDisplayHud()
		end

		Citizen.Wait(500)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEDISPLAYHUD
-----------------------------------------------------------------------------------------------------------------------------------------
local streetLast = 0
local flexDirection = "Norte"
function updateDisplayHud()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local heading = GetEntityHeading(ped)
	local armour = GetPedArmour(ped)
	local health = GetEntityHealth(ped)
	local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords["x"],coords["y"],coords["z"]))

	if heading >= 315 or heading < 45 then
		flexDirection = "Norte"
	elseif heading >= 45 and heading < 135 then
		flexDirection = "Oeste"
	elseif heading >= 135 and heading < 225 then
		flexDirection = "Sul"
	elseif heading >= 225 and heading < 315 then
		flexDirection = "Leste"
	end

	hours = GetClockHours()
	minutes = GetClockMinutes()

	if hours <= 9 then
		hours = "0"..hours
	end

	if minutes <= 9 then
		minutes = "0"..minutes
	end

	local horario = hours..":"..minutes

	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsUsing(ped)
		local fuel = GetVehicleFuelLevel(vehicle)
		local plate = string.gsub(GetVehicleNumberPlateText(vehicle), " ", "")
		local speed = GetEntitySpeed(vehicle) * 3.6
		local showBelt = true
		
		if GetVehicleClass(vehicle) == 8 and (GetVehicleClass(vehicle) >= 13 and GetVehicleClass(vehicle) <= 16) and GetVehicleClass(vehicle) == 21 then
			showBelt = false
		end
		SendNUIMessage({ vehicle = true, talking = talking, health = health, armour = armour, thirst = thirst, hunger = hunger, stress = stress, stamina = stamina, oxigen = clientOxigen, suit = divingMask, street = streetName, direction = flexDirection, radio = radioDisplay, voice = voice, fuel = fuel, speed = speed, time = horario, showbelt = showBelt, seatbelt = beltLock, hardness = (hardness[plate] or 0), hotkey = hotkey })
	else
		SendNUIMessage({ vehicle = false, talking = talking, health = health, armour = armour, thirst = thirst, hunger = hunger, stress = stress, stamina = stamina, oxigen = clientOxigen, suit = divingMask, street = streetName, direction = flexDirection, radio = radioDisplay, voice = voice, time = horario, hotkey = hotkey })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hud",function(source,args)
	showHud = not showHud

	updateDisplayHud()
	SendNUIMessage({ hud = showHud })
end)

Citizen.CreateThread(function()
	showHud = not showHud

	updateDisplayHud()
	SendNUIMessage({ hud = showHud })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOVIE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("movie",function(source,args)
	showMovie = not showMovie

	updateDisplayHud()
	SendNUIMessage({ movie = showMovie })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	DisplayRadar(false)

	RequestStreamedTextureDict("circlemap",false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Citizen.Wait(100)
	end

	AddReplaceTexture("platform:/textures/graphics","radarmasksm","circlemap","radarmasksm")

	SetMinimapClipType(1)

	SetMinimapComponentPosition("minimap","L","B",0.0,0.0,0.158,0.28)
	SetMinimapComponentPosition("minimap_mask","L","B",0.155,0.12,0.080,0.164)
	SetMinimapComponentPosition("minimap_blur","L","B",-0.005,0.021,0.240,0.302)

	Citizen.Wait(5000)

	SetBigmapActive(true,false)

	Citizen.Wait(100)

	SetBigmapActive(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:TOGGLEHOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:toggleHood")
AddEventHandler("hud:toggleHood",function()
	showHood = not showHood

	if showHood then
		SetPedComponentVariation(PlayerPedId(),1,69,0,1)
	else
		SetPedComponentVariation(PlayerPedId(),1,0,0,1)
	end

	SendNUIMessage({ hood = showHood })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:HARDNESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:plateHardness")
AddEventHandler("hud:plateHardness",function(vehPlate,status)
	hardness[vehPlate] = parseInt(status)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:ALLHARDNESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:allHardness")
AddEventHandler("hud:allHardness",function(vehHardness)
	hardness = vehHardness
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REMOVEHOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:removeHood")
AddEventHandler("hud:removeHood",function()
	if showHood then
		showHood = false
		SendNUIMessage({ hood = showHood })
		SetPedComponentVariation(PlayerPedId(),1,0,0,1)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUSFOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("statusHunger", function(statusHunger)
	hunger = parseInt(statusHunger)
end)

RegisterNetEvent("statusThirst", function(statusThrist)
	thirst = parseInt(statusThrist)
end)

RegisterNetEvent("statusStress", function(statusStress)
	stress = parseInt(statusStress)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUSOXIGEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("statusOxigen")
AddEventHandler("statusOxigen",function(number)
	clientOxigen = parseInt(number)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RECHARGEOXIGEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:rechargeOxigen")
AddEventHandler("hud:rechargeOxigen",function()
	TriggerEvent("Notify","verde","Reabastecimento concluído.",3000)
	dogz.rechargeOxigen()
	clientOxigen = 100
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUDACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hudActived")
AddEventHandler("hudActived",function(status)
	showHud = status

	updateDisplayHud() --testar isso dps

	SendNUIMessage({ hud = showHud })
end)


RegisterKeyMapping('shortcuts', 'Atalhos', 'keyboard', 'u')
RegisterCommand("shortcuts", function() 
    hotkey = false

end)





-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:VOICEMODE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("pma-voice:setTalkingMode", function(status)
	voice = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:RADIODISPLAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:RadioDisplay")
AddEventHandler("hud:RadioDisplay",function(number)
	if parseInt(number) <= 0 then
		radioDisplay = ""
	else
		radioDisplay = parseInt(number)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FOWARDPED
-----------------------------------------------------------------------------------------------------------------------------------------
function fowardPed(ped)
	local heading = GetEntityHeading(ped) + 90.0
	if heading < 0.0 then
		heading = 360.0 + heading
	end

	heading = heading * 0.0174533

	return { x = math.cos(heading) * 2.0, y = math.sin(heading) * 2.0 }
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBELT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local timeDistance = 999
        if playerActive then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped) then
                if not IsPedOnAnyBike(ped) and not IsPedInAnyHeli(ped) and not IsPedInAnyPlane(ped) then
                    timeDistance = 1

                    local vehicle = GetVehiclePedIsUsing(ped)
                    local speed = GetEntitySpeed(vehicle) * 3.6
                    if speed ~= beltSpeed then
                        local plate = string.gsub(GetVehicleNumberPlateText(vehicle), " ", "")

                        if ((beltSpeed - speed) >= 50 and beltLock == 0) or ((beltSpeed - speed) >= 60 and beltLock == 1 and hardness[plate] == nil and GetPedInVehicleSeat(vehicle,-1) == ped) then
                            local fowardVeh = fowardPed(ped)
                            local coords = GetEntityCoords(ped)
                            SetEntityCoords(ped,coords["x"] + fowardVeh["x"],coords["y"] + fowardVeh["y"],coords["z"] + 1,1,0,0,0)
                            SetEntityVelocity(ped,beltVelocity["x"],beltVelocity["y"],beltVelocity["z"])
                            ApplyDamageToPed(ped,50,false)

							

                            Citizen.Wait(1)

                            SetPedToRagdoll(ped,5000,5000,0,0,0,0)
                        end

                        beltVelocity = GetEntityVelocity(vehicle)
                        beltSpeed = speed
                    end
                end
            else
                if beltSpeed ~= 0 then
                    beltSpeed = 0
                end

                if beltLock == 1 then
                    beltLock = 0
                end
            end
        end

        Citizen.Wait(timeDistance)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEATBELT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("seatbelt",function(source,args)
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped) then
		if not IsPedOnAnyBike(ped) then
			if beltLock == 1 then
				TriggerEvent("vrp_sound:source","unbelt",0.5)
				beltLock = 0
			else
				TriggerEvent("vrp_sound:source","belt",0.5)
				beltLock = 1
			end
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYMAPPING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("seatbelt","Colocar/Retirar o cinto.","keyboard","g")
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:SYNCTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:syncTimers")
AddEventHandler("hud:syncTimers",function(timer)
	clockHours = parseInt(timer[2])
	clockMinutes = parseInt(timer[1])
	weatherSync = timer[3]
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOMES:HOURS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("homes:Hours")
AddEventHandler("homes:Hours",function(status)
	homeInterior = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHEALTHREDUCE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if GetEntityHealth(ped) > 101 then
			if hunger >= 6 and hunger <= 15 then
				ApplyDamageToPed(ped,1,false)
				TriggerEvent("Notify","Fome","🍔 Sofrendo com a fome.",5000,"left")
			elseif hunger <= 5 then
				ApplyDamageToPed(ped,2,false)
				TriggerEvent("Notify","Fome","🍔 Sofrendo com a fome.",5000,"left")
			end

			if thirst >= 6 and thirst <= 15 then
				ApplyDamageToPed(ped,1,false)
				TriggerEvent("Notify","Sede","💧 Sofrendo com a sede.",5000,"left")
			elseif thirst <= 5 then
				ApplyDamageToPed(ped,2,false)
				TriggerEvent("Notify","Sede","💧 Sofrendo com a sede.",5000,"left")
			end
		end


		Citizen.Wait(15000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSHAKESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		if playerActive then
			local ped = PlayerPedId()
			local health = GetEntityHealth(ped)

			if health > 101 then
				if stress >= 99 then
					ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.75)
				elseif stress >= 80 and stress <= 98 then
					timeDistance = 9990
					ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.50)
				elseif stress >= 60 and stress <= 79 then
					timeDistance = 7500
					ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.25)
				elseif stress >= 40 and stress <= 59 then
					timeDistance = 9990
					ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.05)
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVESCUBA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:removeScuba")
AddEventHandler("hud:removeScuba",function()
	local ped = PlayerPedId()
	if DoesEntityExist(divingMask) or DoesEntityExist(divingTank) then
		if DoesEntityExist(divingMask) then
			TriggerServerEvent("tryDeleteObject",NetworkGetNetworkIdFromEntity(divingMask))
			divingMask = nil
		end

		if DoesEntityExist(divingTank) then
			TriggerServerEvent("tryDeleteObject",NetworkGetNetworkIdFromEntity(divingTank))
			divingTank = nil
		end
		
		SetEnableScuba(ped,false)
		SetPedMaxTimeUnderwater(ped,10.0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:SETDIVING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:setDiving")
AddEventHandler("hud:setDiving",function()
	local ped = PlayerPedId()

	if DoesEntityExist(divingMask) or DoesEntityExist(divingTank) then
		if DoesEntityExist(divingMask) then
			TriggerServerEvent("tryDeleteObject",NetworkGetNetworkIdFromEntity(divingMask))
			divingMask = nil
		end

		if DoesEntityExist(divingTank) then
			TriggerServerEvent("tryDeleteObject",NetworkGetNetworkIdFromEntity(divingTank))
			divingTank = nil
		end

		SetEnableScuba(ped,false)
		SetPedMaxTimeUnderwater(ped,10.0)
	else
		local maskModel = GetHashKey("p_s_scuba_mask_s")
		local tankModel = GetHashKey("p_s_scuba_tank_s")

		RequestModel(tankModel)
		while not HasModelLoaded(tankModel) do
			Citizen.Wait(1)
		end

		RequestModel(maskModel)
		while not HasModelLoaded(maskModel) do
			Citizen.Wait(1)
		end

		if HasModelLoaded(tankModel) then
			divingTank = CreateObject(tankModel,1.0,1.0,1.0,true,true,false)
			AttachEntityToEntity(divingTank,ped,GetPedBoneIndex(ped,24818),-0.28,-0.24,0.0,180.0,90.0,0.0,1,1,0,0,2,1)
			SetEntityAsMissionEntity(divingTank,true,true)
			SetModelAsNoLongerNeeded(divingTank)
		end

		if HasModelLoaded(maskModel) then
			divingMask = CreateObject(maskModel,1.0,1.0,1.0,true,true,false)
			AttachEntityToEntity(divingMask,ped,GetPedBoneIndex(ped,12844),0.0,0.0,0.0,180.0,90.0,0.0,1,1,0,0,2,1)
			SetEntityAsMissionEntity(divingMask,true,true)
			SetModelAsNoLongerNeeded(divingMask)
		end

		SetEnableScuba(ped,true)
		SetPedMaxTimeUnderwater(ped,2000.0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do

		local skips = 1000
		local ped = PlayerPedId()

		if IsPedInAnyVehicle(ped) and showHud then
			if not IsMinimapRendering() then
				DisplayRadar(true)
			end
		else
			if IsMinimapRendering() then
				DisplayRadar(false)
			end
		end

		if beltLock == 1 then
			skips = 1
			DisableControlAction(1,75,true) -- não deixa sair do veiculo enquanto estiver de cinto
		end

		Citizen.Wait(skips)
	end
end)

