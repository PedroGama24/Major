
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = Tunnel.getInterface("vrp_player",src)
Tunnel.bindInterface("vrp_player",src)
vSERVER = Tunnel.getInterface("vrp_player")



-----------------------------------------------------------------------------------------------------------------------------------------
-- PERDER ITEM NA AGUA
-----------------------------------------------------------------------------------------------------------------------------------------
local perdedinheiroacada = 20
local perdedinheiroatual = 0

Citizen.CreateThread(function()
	while true do
		w = 1000
		
		if IsPedSwimming(PlayerPedId()) then
			w = 100
			perdedinheiroatual = perdedinheiroatual + 1
			TriggerServerEvent('perdeitem:nadando', perdedinheiroatual)
		else
			perdedinheiroatual = 0
		end

		if(perdedinheiroatual >= perdedinheiroacada) then
			w = 100
			perdedinheiroatual = 0
		end
		Citizen.Wait(w)
	end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- TELA AFK 
---------------------------------------
DisableIdleCamera(true)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUG CRIAÇÃO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		w = 1000
		if Instanced then
			w = 100
			for i=0, 255 do
				local otherPlayerPed = GetPlayerPed(i)
				
				if otherPlayerPed ~= PlayerPedId() then
					SetEntityLocallyInvisible(otherPlayerPed)
					SetEntityNoCollisionEntity(PlayerPedId(),  otherPlayerPed,  true)
				end
			end
		end
		Citizen.Wait(w)
	end
end)

--[ PLACAS ]-----------------------------------------------------------------------------------------------------------------------------
imageUrl = "https://cdn.discordapp.com/attachments/683792195530260608/764909905827463168/mercosul.png" -- 

local textureDic = CreateRuntimeTxd('duiTxd')
local object = CreateDui(imageUrl, 540, 300)
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle)
AddReplaceTexture('vehshare', 'plate01', 'duiTxd', 'duiTex')
AddReplaceTexture('vehshare', 'plate02', 'duiTxd', 'duiTex')
AddReplaceTexture('vehshare', 'plate03', 'duiTxd', 'duiTex') 
AddReplaceTexture('vehshare', 'plate04', 'duiTxd', 'duiTex')
AddReplaceTexture('vehshare', 'plate05', 'duiTxd', 'duiTex') 

local object = CreateDui('https://i.imgur.com/Q3uw6V7.png', 540, 300) 
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex2", handle) 
AddReplaceTexture('vehshare', 'plate01_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate02_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate03_n', 'duiTxd', 'duiTex2') 
AddReplaceTexture('vehshare', 'plate04_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate05_n', 'duiTxd', 'duiTex2')


-----------------------------------------------------------------------------------------------------------------------------------------
--[ ANIMACAO DA BOCA AO FALAR ]----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function GetPlayers()
	local players = {}
	for i = 0, 256 do
		if NetworkIsPlayerActive(i) then
			players[#players + 1] = i
		end
	end
	return players
  end
  
  Citizen.CreateThread(function()
	RequestAnimDict("facials@gen_male@variations@normal")
	RequestAnimDict("mp_facial")
  
	local talkingPlayers = {}
	while true do
		w = 1000
		for k,v in pairs(GetPlayers()) do
			w = 300
			local boolTalking = NetworkIsPlayerTalking(v)
			if v ~= PlayerId() then
				if boolTalking and not talkingPlayers[v] then
					PlayFacialAnim(GetPlayerPed(v), "mic_chatter", "mp_facial")
					talkingPlayers[v] = true
				elseif not boolTalking and talkingPlayers[v] then
					PlayFacialAnim(GetPlayerPed(v), "mood_normal_1", "facials@gen_male@variations@normal")
					talkingPlayers[v] = nil
				end
			end
		end
		Citizen.Wait(w)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MANCAR DANO
-----------------------------------------------------------------------------------------------------------------------------------------
local hurt = false
Citizen.CreateThread(function()
	while true do
		w = 1000
		if GetEntityHealth(GetPlayerPed(-1)) <= 150 then
			w = 3
			setHurt()
			DisableControlAction(0, 21, true) -- desabilita corrida
			DisableControlAction(0, 22, true) -- desabilita os pulos

		elseif hurt and GetEntityHealth(GetPlayerPed(-1)) > 199 then
			setNotHurt()
		end
		Citizen.Wait(w)
	end
end)

function setHurt()
	hurt = true
	RequestAnimSet("move_m@injured")
	SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
	
end

function setNotHurt()
	hurt = false
	ResetPedMovementClipset(GetPlayerPed(-1))
	ResetPedWeaponMovementClipset(GetPlayerPed(-1))
	ResetPedStrafeClipset(GetPlayerPed(-1))
end



-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOURAR OS PNEUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		w = 1000
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			w = 100
			local vehicle = GetVehiclePedIsIn(ped)
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				local roll = GetEntityRoll(vehicle)
				if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
					if IsVehicleTyreBurst(vehicle, wheel_rm1, 0) == false then
					SetVehiclePetrolTankHealth(vehicle, -4000, 1)
					SetVehicleEngineTemperature(vehicle, 5000, 1)
					SetVehicleEngineHealth(vehicle, -4000, 1)
					SetVehicleTyreBurst(vehicle, 0, 1)
					Citizen.Wait(100)
					SetVehicleTyreBurst(vehicle, 1, 1)
					Citizen.Wait(100)
					SetVehicleTyreBurst(vehicle, 2, 1)
					Citizen.Wait(100)
					SetVehicleTyreBurst(vehicle, 3, 1)
					Citizen.Wait(100)
					SetVehicleTyreBurst(vehicle, 4, 1)
					Citizen.Wait(100)
					SetVehicleTyreBurst(vehicle, 5, 1)
					Citizen.Wait(100)
					SetVehicleTyreBurst(vehicle, 45, 1)
					Citizen.Wait(100)
					SetVehicleTyreBurst(vehicle, 47, 1)
					end
				end
			end
		end
		Citizen.Wait(w)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- NOCARJACK
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		w = 1000
		if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
			w = 100
			local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
			if GetVehicleDoorLockStatus(veh) >= 2 or GetPedInVehicleSeat(veh,-1) then
				TriggerServerEvent("TryDoorsEveryone",veh,2,GetVehicleNumberPlateText(veh))
			end
		end
		Citizen.Wait(w)
	end
end)

RegisterNetEvent("SyncDoorsEveryone")
AddEventHandler("SyncDoorsEveryone",function(veh,doors)
	SetVehicleDoorsLocked(veh,doors)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- coronhada
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		w = 1000
		local ped = PlayerPedId()
		if IsPedArmed(ped, 6) then
			w = 100
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
		end
		Citizen.Wait(w)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /VTUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("vtuning",function(source,args)
	local vehicle = GetVehiclePedIsUsing(PlayerPedId())
	if IsEntityAVehicle(vehicle) then
		local motor = GetVehicleMod(vehicle,11)
		local freio = GetVehicleMod(vehicle,12)
		local transmissao = GetVehicleMod(vehicle,13)
		local suspensao = GetVehicleMod(vehicle,15)
		local blindagem = GetVehicleMod(vehicle,16)
		local body = GetVehicleBodyHealth(vehicle)
		local engine = GetVehicleEngineHealth(vehicle)
		local fuel = GetVehicleFuelLevel(vehicle)

		if motor == -1 then
			motor = "Desativado"
		elseif motor == 0 then
			motor = "Nível 1 / "..GetNumVehicleMods(vehicle,11)
		elseif motor == 1 then
			motor = "Nível 2 / "..GetNumVehicleMods(vehicle,11)
		elseif motor == 2 then
			motor = "Nível 3 / "..GetNumVehicleMods(vehicle,11)
		elseif motor == 3 then
			motor = "Nível 4 / "..GetNumVehicleMods(vehicle,11)
		elseif motor == 4 then
			motor = "Nível 5 / "..GetNumVehicleMods(vehicle,11)
		end

		if freio == -1 then
			freio = "Desativado"
		elseif freio == 0 then
			freio = "Nível 1 / "..GetNumVehicleMods(vehicle,12)
		elseif freio == 1 then
			freio = "Nível 2 / "..GetNumVehicleMods(vehicle,12)
		elseif freio == 2 then
			freio = "Nível 3 / "..GetNumVehicleMods(vehicle,12)
		end

		if transmissao == -1 then
			transmissao = "Desativado"
		elseif transmissao == 0 then
			transmissao = "Nível 1 / "..GetNumVehicleMods(vehicle,13)
		elseif transmissao == 1 then
			transmissao = "Nível 2 / "..GetNumVehicleMods(vehicle,13)
		elseif transmissao == 2 then
			transmissao = "Nível 3 / "..GetNumVehicleMods(vehicle,13)
		elseif transmissao == 3 then
			transmissao = "Nível 4 / "..GetNumVehicleMods(vehicle,13)
		end

		if suspensao == -1 then
			suspensao = "Desativado"
		elseif suspensao == 0 then
			suspensao = "Nível 1 / "..GetNumVehicleMods(vehicle,15)
		elseif suspensao == 1 then
			suspensao = "Nível 2 / "..GetNumVehicleMods(vehicle,15)
		elseif suspensao == 2 then
			suspensao = "Nível 3 / "..GetNumVehicleMods(vehicle,15)
		elseif suspensao == 3 then
			suspensao = "Nível 4 / "..GetNumVehicleMods(vehicle,15)
		end

		if blindagem == -1 then
			blindagem = "Desativado"
		elseif blindagem == 0 then
			blindagem = "Nível 1 / "..GetNumVehicleMods(vehicle,16)
		elseif blindagem == 1 then
			blindagem = "Nível 2 / "..GetNumVehicleMods(vehicle,16)
		elseif blindagem == 2 then
			blindagem = "Nível 3 / "..GetNumVehicleMods(vehicle,16)
		elseif blindagem == 3 then
			blindagem = "Nível 4 / "..GetNumVehicleMods(vehicle,16)
		elseif blindagem == 4 then
			blindagem = "Nível 5 / "..GetNumVehicleMods(vehicle,16)
		end

		TriggerEvent("Notify","importante","<b>Motor:</b> "..motor.."<br><b>Freio:</b> "..freio.."<br><b>Transmissão:</b> "..transmissao.."<br><b>Suspensão:</b> "..suspensao.."<br><b>Blindagem:</b> "..blindagem.."<br><b>Chassi:</b> "..parseInt(body/10).."%<br><b>Engine:</b> "..parseInt(engine/10).."%<br><b>Gasolina:</b> "..parseInt(fuel).."%",15000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- QTH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		w = 100
		if IsControlJustReleased(1,  118) then
			TriggerServerEvent("offred:qthPolice")
		end
		Citizen.Wait(w)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
------- AGACHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		skips = 1000
		local ped = PlayerPedId()
		local player = PlayerId()
		if agachar then
			skips = 5
			DisablePlayerFiring(player, true)
		end
		Citizen.Wait(skips)
	end
end)

Citizen.CreateThread(function()
	while true do
		skips = 1000
		local ped = PlayerPedId()
		DisableControlAction(0,36,true)
		if not IsPedInAnyVehicle(ped) then
			skips = 5
			RequestAnimSet("move_ped_crouched")
			RequestAnimSet("move_ped_crouched_strafing")
			if IsDisabledControlJustPressed(0,36) then
				if agachar then
					ResetPedStrafeClipset(ped)
					ResetPedMovementClipset(ped,0.25)
					agachar = false
				else
					SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
					SetPedMovementClipset(ped,"move_ped_crouched",0.25)
					agachar = true
				end
			end
		end
		Citizen.Wait(skips)
	end
end) 


----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVE DANO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	local ped = PlayerPedId()
	local pedId = PlayerId()
	while true do
		w = 1000
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNOWBALL"), 0.00)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMOKEGRENADE"), 0.01)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_RAYPISTOL"), 0.01)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.01)
		N_0x4757f00bc6323cfe(GetHashKey("weapon_knuckle"), 0.01)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.01)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.40)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MOLOTOV"), 0.01)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BZGAS"), 0.20)
		Citizen.Wait(w)
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- CONTROLE DE VELOCIDADE
------------------------
RegisterCommand("cr",function(source,args)
	local veh = GetVehiclePedIsIn(PlayerPedId(),false)
	local maxspeed = GetVehicleMaxSpeed(GetEntityModel(veh))
	local vehspeed = GetEntitySpeed(veh)*3.6
	if GetPedInVehicleSeat(veh,-1) == PlayerPedId() and math.ceil(vehspeed) >= 1 then
		if args[1] == nil then
			SetEntityMaxSpeed(veh,maxspeed)
		else
			SetEntityMaxSpeed(veh,0.28*args[1]-0.28)
			TriggerEvent("Notify","sucesso","Velocidade máxima travada em <b>"..args[1].." km/h</b>.")
		end
	end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- /ATTACHS
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ RegisterCommand("attachs",function(source,args)
	local ped = PlayerPedId()
	if GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_COMBATPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),GetHashKey("COMPONENT_AT_PI_FLSH"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_APPISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_APPISTOL"),GetHashKey("COMPONENT_AT_PI_FLSH"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_SMG"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_SMG"),GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_COMBATPDW") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_COMBATPDW"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),GetHashKey("COMPONENT_AT_SIGHTS"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),GetHashKey("COMPONENT_AT_AR_FLSH"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_CARBINERIFLE") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),GetHashKey("COMPONENT_AT_AR_AFGRIP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_MICROSMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_MICROSMG"),GetHashKey("COMPONENT_AT_PI_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_MICROSMG"),GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTRIFLEhen
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLEetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLEetHashKey("COMPONENT_AT_SCOPE_MACRO"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTRIFLEetHashKey("COMPONENT_AT_AR_AFGRIP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_RAIL"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_FLSH_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_COMP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL_MK2") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_RAIL"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_FLSH_02"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL_MK2"),GetHashKey("COMPONENT_AT_PI_COMP"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_ASSAULTSMG") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTSMG"),GetHashKey("COMPONENT_AT_AR_FLSH"))
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_ASSAULTSMG"),GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
	elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL") then
		GiveWeaponComponentToPed(ped,GetHashKey("WEAPON_PISTOL"),GetHashKey("COMPONENT_AT_PI_FLSH"))
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- BEBIDAS ENERGETICAS
-----------------------------------------------------------------------------------------------------------------------------------------
local energetico = false
RegisterNetEvent('energeticos')
AddEventHandler('energeticos',function(status)
	energetico = status
	if energetico then
		SetRunSprintMultiplierForPlayer(PlayerId(),1.15)
	else
		SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
	end
end)

Citizen.CreateThread(function()
	while true do
		w = 100
		if energetico then
			RestorePlayerStamina(PlayerId(),1.0)
		end
		Citizen.Wait(w)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTÁRIO
-----------------------------------------------------------------------------------------------------------------------------------------

--Citizen.CreateThread(function()
  --  while true do
    --    Citizen.Wait(0)
      --  if IsControlJustReleased(0, 289) then
        --    TriggerServerEvent("aztec:inventory")
        --end
    --end
--end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO O F6
-----------------------------------------------------------------------------------------------------------------------------------------
local cancelando = false
RegisterNetEvent('cancelando')
AddEventHandler('cancelando',function(status)
	cancelando = status
end)

Citizen.CreateThread(function()
	while true do
		w = 100
		if cancelando then
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,188,true)
			DisableControlAction(0,57,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,344,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,245,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,38,true)
		end
		Citizen.Wait(w)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ABRIR PORTA-MALAS DO VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("malas",function(source,args)
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("trytrunk",VehToNet(vehicle))
	end
end)

RegisterNetEvent("synctrunk")
AddEventHandler("synctrunk",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local isopen = GetVehicleDoorAngleRatio(v,5)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				if isopen == 0 then
					SetVehicleDoorOpen(v,5,0,0)
				else
					SetVehicleDoorShut(v,5,0)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ABRIR CAPO DO VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("capo",function(source,args)
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("tryhood",VehToNet(vehicle))
	end
end)

RegisterNetEvent("synchood")
AddEventHandler("synchood",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local isopen = GetVehicleDoorAngleRatio(v,4)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				if isopen == 0 then
					SetVehicleDoorOpen(v,4,0,0)
				else
					SetVehicleDoorShut(v,4,0)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ABRE E FECHA OS VIDROS
-----------------------------------------------------------------------------------------------------------------------------------------
local vidros = false
RegisterCommand("vidros",function(source,args)
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("trywins",VehToNet(vehicle))
	end
end)

RegisterNetEvent("syncwins")
AddEventHandler("syncwins",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				if vidros then
					vidros = false
					RollUpWindow(v,0)
					RollUpWindow(v,1)
					RollUpWindow(v,2)
					RollUpWindow(v,3)
				else
					vidros = true
					RollDownWindow(v,0)
					RollDownWindow(v,1)
					RollDownWindow(v,2)
					RollDownWindow(v,3)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ABRIR PORTAS DO VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("porta",function(source,args)
	local vehicle = vRP.getNearestVehicle(7)
	if IsEntityAVehicle(vehicle) then
		TriggerServerEvent("trydoors",VehToNet(vehicle),args[1])
	end
end)

RegisterNetEvent("syncdoors")
AddEventHandler("syncdoors",function(index,door)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local isopen = GetVehicleDoorAngleRatio(v,0) and GetVehicleDoorAngleRatio(v,1)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				if door == "1" then
					if GetVehicleDoorAngleRatio(v,0) == 0 then
						SetVehicleDoorOpen(v,0,0,0)
					else
						SetVehicleDoorShut(v,0,0)
					end
				elseif door == "2" then
					if GetVehicleDoorAngleRatio(v,1) == 0 then
						SetVehicleDoorOpen(v,1,0,0)
					else
						SetVehicleDoorShut(v,1,0)
					end
				elseif door == "3" then
					if GetVehicleDoorAngleRatio(v,2) == 0 then
						SetVehicleDoorOpen(v,2,0,0)
					else
						SetVehicleDoorShut(v,2,0)
					end
				elseif door == "4" then
					if GetVehicleDoorAngleRatio(v,3) == 0 then
						SetVehicleDoorOpen(v,3,0,0)
					else
						SetVehicleDoorShut(v,3,0)
					end
				elseif door == nil then
					if isopen == 0 then
						SetVehicleDoorOpen(v,0,0,0)
						SetVehicleDoorOpen(v,1,0,0)
						SetVehicleDoorOpen(v,2,0,0)
						SetVehicleDoorOpen(v,3,0,0)
					else
						SetVehicleDoorShut(v,0,0)
						SetVehicleDoorShut(v,1,0)
						SetVehicleDoorShut(v,2,0)
						SetVehicleDoorShut(v,3,0)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /MASCARA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("mascara")
AddEventHandler("mascara",function(index,color)
	local ped = GetPlayerPed(-1)
	if index == nil then
		vRP.playAnim(true,{{"misscommon@std_take_off_masks","take_off_mask_ps",1}},false)
		Wait(1700)
		ClearPedTasks(ped)
		SetPedComponentVariation(ped,1,0,0,2)
		return
	end
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") or GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		vRP.playAnim(true,{{"misscommon@van_put_on_masks","put_on_mask_ps",1}},false)
		Wait(1700)
		ClearPedTasks(ped)
		SetPedComponentVariation(ped,1,parseInt(index),parseInt(color),2)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /blusa
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("blusa")
AddEventHandler("blusa",function(index,color)
	local ped = GetPlayerPed(-1)
	if index == nil then
		SetPedComponentVariation(ped,8,15,0,2)
		return
	end
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		vRP._playAnim(true,{{"clothingshirt","try_shirt_positive_d"}},false)
		Wait(5000)
		SetPedComponentVariation(ped,8,parseInt(index),parseInt(color),2)
		ClearPedTasks(ped)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		vRP._playAnim(true,{{"clothingshirt","try_shirt_positive_d"}},false)
		Wait(5000)
		SetPedComponentVariation(ped,8,parseInt(index),parseInt(color),2)
		ClearPedTasks(ped)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /jaqueta
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("jaqueta")
AddEventHandler("jaqueta",function(index,color)
	local ped = GetPlayerPed(-1)
	if index == nil then
		SetPedComponentVariation(ped,11,15,0,2)
		return
	end
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		vRP._playAnim(true,{{"clothingshirt","try_shirt_positive_d"}},false)
		Wait(5000)
		SetPedComponentVariation(ped,11,parseInt(index),parseInt(color),2)
		ClearPedTasks(ped)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		vRP._playAnim(true,{{"clothingshirt","try_shirt_positive_d"}},false)
		Wait(5000)
		SetPedComponentVariation(ped,11,parseInt(index),parseInt(color),2)
		ClearPedTasks(ped)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /calca
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("calca")
AddEventHandler("calca",function(index,color)
	local ped = GetPlayerPed(-1)
	if index == nil then
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(true,{{"clothingtrousers","try_trousers_neutral_c"}},false)
				Wait(2500)
			SetPedComponentVariation(ped,4,18,0,2)
			ClearPedTasks(ped)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(true,{{"clothingtrousers","try_trousers_neutral_c"}},false)
				Wait(2500)
			SetPedComponentVariation(ped,4,15,0,2)
			ClearPedTasks(ped)
		end
		return
	end
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		vRP._playAnim(true,{{"clothingtrousers","try_trousers_neutral_c"}},false)
				Wait(2500)
		SetPedComponentVariation(ped,4,parseInt(index),parseInt(color),2)
		ClearPedTasks(ped)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		vRP._playAnim(true,{{"clothingtrousers","try_trousers_neutral_c"}},false)
				Wait(2500)
		SetPedComponentVariation(ped,4,parseInt(index),parseInt(color),2)
		ClearPedTasks(ped)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- BANDAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('bandagem')
AddEventHandler('bandagem',function()
	local bandagem = 0
	repeat
		bandagem = bandagem + 1
		SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+1)
		Citizen.Wait(600)
	until GetEntityHealth(PlayerPedId()) >= 200 or GetEntityHealth(PlayerPedId()) <= 100 or bandagem == 100
		TriggerEvent("Notify","sucesso","Tratamento concluido.")
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /maos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("maos")
AddEventHandler("maos",function(index,color)
	local ped = GetPlayerPed(-1)
	if index == nil then
		SetPedComponentVariation(ped,3,15,0,2)
		return
	end
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		vRP._playAnim(true,{{"clothingshirt","try_shirt_positive_d"}},false)
			Wait(2500)
			ClearPedTasks(ped)
		SetPedComponentVariation(ped,3,parseInt(index),parseInt(color),2)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		vRP._playAnim(true,{{"clothingshirt","try_shirt_positive_d"}},false)
			Wait(2500)
			ClearPedTasks(ped)
		SetPedComponentVariation(ped,3,parseInt(index),parseInt(color),2)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /acess
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("acessorios")
AddEventHandler("acessorios",function(index,color)
	local ped = GetPlayerPed(-1)
	if index == nil then
		SetPedComponentVariation(ped,7,0,0,2)
		return
	end
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		SetPedComponentVariation(ped,7,parseInt(index),parseInt(color),2)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		SetPedComponentVariation(ped,7,parseInt(index),parseInt(color),2)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /acess
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("sapatos")
AddEventHandler("sapatos",function(index,color)
	local ped = GetPlayerPed(-1)
	if index == nil then
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			vRP._playAnim(false,{{"clothingshoes","try_shoes_positive_d"}},false)
				Wait(3000)
				ClearPedTasks(ped)
			SetPedComponentVariation(ped,6,34,0,2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			vRP._playAnim(false,{{"clothingshoes","try_shoes_positive_d"}},false)
				Wait(3000)
				ClearPedTasks(ped)
			SetPedComponentVariation(ped,6,35,0,2)
		end
		return
	end
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		vRP._playAnim(false,{{"clothingshoes","try_shoes_positive_d"}},false)
				Wait(3000)
				ClearPedTasks(ped)
		SetPedComponentVariation(ped,6,parseInt(index),parseInt(color),2)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		vRP._playAnim(false,{{"clothingshoes","try_shoes_positive_d"}},false)
				Wait(3000)
				ClearPedTasks(ped)
		SetPedComponentVariation(ped,6,parseInt(index),parseInt(color),2)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /CHAPEU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chapeu")
AddEventHandler("chapeu",function(index,color)
	local ped = GetPlayerPed(-1)
	if index == nil then
		vRP.playAnim(true,{{"veh@common@fp_helmet@","take_off_helmet_stand",1}},false)
		Wait(700)
		ClearPedProp(ped,0)
		return
	end
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		vRP.playAnim(true,{{"veh@common@fp_helmet@","put_on_helmet",1}},false)
		Wait(1700)
		SetPedPropIndex(ped,0,parseInt(index),parseInt(color),2)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		vRP.playAnim(true,{{"veh@common@fp_helmet@","put_on_helmet",1}},false)
		Wait(1700)
		SetPedPropIndex(ped,0,parseInt(index),parseInt(color),2)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /OCULOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("oculos")
AddEventHandler("oculos",function(index,color)
	local ped = GetPlayerPed(-1)
	if index == nil then
		vRP.playAnim(true,{{"misscommon@std_take_off_masks","take_off_mask_ps",1}},false)
		Wait(400)
		ClearPedTasks(ped)
		ClearPedProp(ped,1)
		return
	end
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		vRP.playAnim(true,{{"misscommon@van_put_on_masks","put_on_mask_ps",1}},false)
		Wait(800)
		ClearPedTasks(ped)
		SetPedPropIndex(ped,1,parseInt(index),parseInt(color),2)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		vRP.playAnim(true,{{"misscommon@van_put_on_masks","put_on_mask_ps",1}},false)
		Wait(800)
		ClearPedTasks(ped)
		SetPedPropIndex(ped,1,parseInt(index),parseInt(color),2)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- REPAIRTIRES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("repairTires")
AddEventHandler("repairTires",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			for i = 0,8 do
				SetVehicleTyreFixed(v,i)
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('reparar')
AddEventHandler('reparar',function(vehicle)
	TriggerServerEvent("tryreparar",VehToNet(vehicle))
end)

RegisterNetEvent('syncreparar')
AddEventHandler('syncreparar',function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		local fuel = GetVehicleFuelLevel(v)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				SetVehicleFixed(v)
				SetVehicleDirtLevel(v,0.0)
				SetVehicleUndriveable(v,false)
				SetEntityAsMissionEntity(v,true,true)
				SetVehicleOnGroundProperly(v)
				SetVehicleFuelLevel(v,fuel)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REPARAR MOTOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('repararmotor')
AddEventHandler('repararmotor',function(vehicle)
	TriggerServerEvent("trymotor",VehToNet(vehicle))
end)

RegisterNetEvent('syncmotor')
AddEventHandler('syncmotor',function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				SetVehicleEngineHealth(v,1000.0)
			end
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- /CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
local carregado = false
RegisterCommand("carregar",function(source,args)
	local ped = PlayerPedId()
	local randomico,npcs = FindFirstPed()
	repeat
		local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),GetEntityCoords(npcs),true)
		if not IsPedAPlayer(npcs) and distancia <= 3 and not IsPedInAnyVehicle(ped) and not IsPedInAnyVehicle(npcs) then
			if carregado then
				ClearPedTasksImmediately(carregado)
				DetachEntity(carregado,true,true)
				TaskWanderStandard(carregado,10.0,10)
				SetEntityAsMissionEntity(carregado,false,true)
				carregado = false
			else
				SetEntityAsMissionEntity(npcs,true,true)
				AttachEntityToEntity(npcs,ped,4103,11816,0.48,0.0,0.0,0.0,0.0,0.0,false,false,true,false,2,true)
				carregado = npcs
				sucess = true
			end
		end
	sucess,npcs = FindNextPed(randomico)
	until not sucess
	EndFindPed(randomico)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /sequestro2
-----------------------------------------------------------------------------------------------------------------------------------------
local sequestrado = nil
RegisterCommand("sequestro2",function(source,args)
	local ped = PlayerPedId()
	local random,npc = FindFirstPed()
	repeat
		local distancia = GetDistanceBetweenCoords(GetEntityCoords(ped),GetEntityCoords(npc),true)
		if not IsPedAPlayer(npc) and distancia <= 3 and not IsPedInAnyVehicle(npc) then
			vehicle = vRP.getNearestVehicle(7)
			if IsEntityAVehicle(vehicle) then
				if vRP.getCarroClass(vehicle) then
					if sequestrado then
						AttachEntityToEntity(sequestrado,vehicle,GetEntityBoneIndexByName(vehicle,"bumper_r"),0.6,-1.2,-0.6,60.0,-90.0,180.0,false,false,false,true,2,true)
						DetachEntity(sequestrado,true,true)
						SetEntityVisible(sequestrado,true)
						SetEntityInvincible(sequestrado,false)
						SetEntityAsMissionEntity(sequestrado,false,true)
						ClearPedTasksImmediately(sequestrado)
						sequestrado = nil
					elseif not sequestrado then
						SetEntityAsMissionEntity(npc,true,true)
						AttachEntityToEntity(npc,vehicle,GetEntityBoneIndexByName(vehicle,"bumper_r"),0.6,-0.4,-0.1,60.0,-90.0,180.0,false,false,false,true,2,true)
						SetEntityVisible(npc,false)
						SetEntityInvincible(npc,true)
						sequestrado = npc
						complet = true
					end
					TriggerServerEvent("trymala",VehToNet(vehicle))
				end
			end
		end
		complet,npc = FindNextPed(random)
	until not complet
	EndFindPed(random)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMPURRAR
-----------------------------------------------------------------------------------------------------------------------------------------
local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc,moveFunc,disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = { handle = iter, destructor = disposeFunc }
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next,id = moveFunc(iter)
		until not next

		enum.destructor,enum.handle = nil,nil
		disposeFunc(iter)
	end)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle,FindNextVehicle,EndFindVehicle)
end

function GetVeh()
    local vehicles = {}
    for vehicle in EnumerateVehicles() do
        table.insert(vehicles,vehicle)
    end
    return vehicles
end

function GetClosestVeh(coords)
	local vehicles = GetVeh()
	local closestDistance = -1
	local closestVehicle = -1
	local coords = coords

	if coords == nil then
		local ped = PlayerPedId()
		coords = GetEntityCoords(ped)
	end

	for i=1,#vehicles,1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance = GetDistanceBetweenCoords(vehicleCoords,coords.x,coords.y,coords.z,true)
		if closestDistance == -1 or closestDistance > distance then
			closestVehicle  = vehicles[i]
			closestDistance = distance
		end
	end
	return closestVehicle,closestDistance
end

local First = vector3(0.0,0.0,0.0)
local Second = vector3(5.0,5.0,5.0)
local Vehicle = { Coords = nil, Vehicle = nil, Dimension = nil, IsInFront = false, Distance = nil }

Citizen.CreateThread(function()
	while true do
		w = 1000
		local ped = PlayerPedId()
		local closestVehicle,Distance = GetClosestVeh()
		if Distance < 6.1 and not IsPedInAnyVehicle(ped) then
			w = 500
			Vehicle.Coords = GetEntityCoords(closestVehicle)
			Vehicle.Dimensions = GetModelDimensions(GetEntityModel(closestVehicle),First,Second)
			Vehicle.Vehicle = closestVehicle
			Vehicle.Distance = Distance
			if GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle), GetEntityCoords(ped), true) > GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle) * -1, GetEntityCoords(ped), true) then
				Vehicle.IsInFront = false
			else
				Vehicle.IsInFront = true
			end
		else
			Vehicle = { Coords = nil, Vehicle = nil, Dimensions = nil, IsInFront = false, Distance = nil }
		end
		Citizen.Wait(w)
	end
end)

Citizen.CreateThread(function()
	while true do
		w = 1000
		if Vehicle.Vehicle ~= nil then
			w = 500
			local ped = PlayerPedId()
			if IsControlPressed(0,244) and GetEntityHealth(ped) > 100 and IsVehicleSeatFree(Vehicle.Vehicle,-1) and not IsEntityAttachedToEntity(ped,Vehicle.Vehicle) and not (GetEntityRoll(Vehicle.Vehicle) > 75.0 or GetEntityRoll(Vehicle.Vehicle) < -75.0) then
				RequestAnimDict('missfinale_c2ig_11')
				TaskPlayAnim(ped,'missfinale_c2ig_11','pushcar_offcliff_m',2.0,-8.0,-1,35,0,0,0,0)
				NetworkRequestControlOfEntity(Vehicle.Vehicle)

				if Vehicle.IsInFront then
					AttachEntityToEntity(ped,Vehicle.Vehicle,GetPedBoneIndex(6286),0.0,Vehicle.Dimensions.y*-1+0.1,Vehicle.Dimensions.z+1.0,0.0,0.0,180.0,0.0,false,false,true,false,true)
				else
					AttachEntityToEntity(ped,Vehicle.Vehicle,GetPedBoneIndex(6286),0.0,Vehicle.Dimensions.y-0.3,Vehicle.Dimensions.z+1.0,0.0,0.0,0.0,0.0,false,false,true,false,true)
				end

				while true do
					Citizen.Wait(5)
					if IsDisabledControlPressed(0,34) then
						TaskVehicleTempAction(ped,Vehicle.Vehicle,11,100)
					end

					if IsDisabledControlPressed(0,9) then
						TaskVehicleTempAction(ped,Vehicle.Vehicle,10,100)
					end

					if Vehicle.IsInFront then
						SetVehicleForwardSpeed(Vehicle.Vehicle,-1.0)
					else
						SetVehicleForwardSpeed(Vehicle.Vehicle,1.0)
					end

					if not IsDisabledControlPressed(0,244) then
						DetachEntity(ped,false,false)
						StopAnimTask(ped,'missfinale_c2ig_11','pushcar_offcliff_m',2.0)
						break
					end
				end
			end
		end
		Citizen.Wait(w)
	end
end)







------------- BRAÇO PRA FORA 


local loadedAnimation = false

RegisterKeyMapping("cmd","Colocar mÃ£o na porta do veiculo","keyboard","Q")
RegisterKeyMapping("ses","","keyboard","F6")

RegisterCommand('ses', function()
	loadedAnimation = false
end)

RegisterCommand('cmd', function()
	local ped = GetPlayerPed(-1)
	if not loadedAnimation then
		putHandOnWindow()
	end
end)

function putHandOnWindow()
	local ped = GetPlayerPed(-1)
	local veh = GetVehiclePedIsUsing(ped)
	if GetEntityHealth(ped) > 101 then
		if IsPedInAnyVehicle(ped,false) then
		if vehModels() then
				if GetPedInVehicleSeat(veh,-1) == ped then
					loadAnimation(1)
					loadedAnimation = true
				end
				if GetPedInVehicleSeat(veh,1) == ped then 
					loadAnimation(2)
					loadedAnimation = true
				end
			end
		end
	end
end

Citizen.CreateThread(function()
	while true do
		local timeDistance = 1000
		local ped = PlayerPedId()
		local pp = PlayerId()
		if IsEntityPlayingAnim(ped,"anim@veh@lowrider@std@ds@arm@base","steer_lean_left_low_lowdoor",3) then
			if IsPlayerFreeAiming(pp) then
				timeDistance = 5
				ClearPedSecondaryTask(ped)
				loadedAnimation = false
			end
		end
		Citizen.Wait(timeDistance)
	end
end)

function loadAnimation(number)
	local ped = GetPlayerPed(-1)
	RequestAnimDict("anim@veh@lowrider@std@ds@arm@base")
	while not HasAnimDictLoaded("anim@veh@lowrider@std@ds@arm@base") do
		RequestAnimDict("anim@veh@lowrider@std@ds@arm@base")
		Citizen.Wait(10)
	end
	if number == 1 then
		if HasAnimDictLoaded("anim@veh@lowrider@std@ds@arm@base") then
			TaskPlayAnim(ped,"anim@veh@lowrider@std@ds@arm@base","steer_lean_left_low_lowdoor",  5.0,-1,-1,50,0,false,false,false)
		end
	elseif number == 2 then
		if HasAnimDictLoaded("anim@veh@lowrider@std@ds@arm@base") then
			TaskPlayAnim(ped,"anim@veh@lowrider@std@ds@arm@base","steer_lean_left_high_lowdoor",  5.0,-1,-1,50,0,false,false,false)
		end
	end
end

function vehModels()
	local ped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(ped)
	return IsVehicleModel(vehicle,GetHashKey("mercedesgle")) or IsVehicleModel(vehicle,GetHashKey("jeeppolicia")) or IsVehicleModel(vehicle,GetHashKey("mercxclass")) or IsVehicleModel(vehicle,GetHashKey("mercedespolicia")) or IsVehicleModel(vehicle,GetHashKey("m8comando")) or IsVehicleModel(vehicle,GetHashKey("r820p"))
end



--------- SISTEMA DE FPS BOOST 

RegisterCommand("fps",function(source,args)
	if args[1] == nil then
		TriggerEvent("Notify","sucesso","Escolha qual o nivel de Boost voce deseja: </br>1 - /fps ultra</br>  2 - /fps medio</br> 3 - /fps baixo</br> 4- /fps off", "") 
	elseif args[1] == "on" then
		TriggerEvent("Notify","sucesso","Escolha qual o nivel de Boost voce deseja: </br>1 - /fps ultra</br>  2 - /fps medio</br> 3 - /fps baixo</br> 4- /fps off", "") 
		
elseif args[1] == "ultra" then
		SetTimecycleModifier("cinema")
		RopeDrawShadowEnabled(false)
		CascadeShadowsClearShadowSampleType()
		CascadeShadowsSetAircraftMode(false)
		CascadeShadowsEnableEntityTracker(true)
		CascadeShadowsSetDynamicDepthMode(false)
		CascadeShadowsSetEntityTrackerScale(0.0)
		CascadeShadowsSetDynamicDepthValue(0.0)
		CascadeShadowsSetCascadeBoundsScale(0.0)
		SetFlashLightFadeDistance(0.0)
		SetLightsCutoffDistanceTweak(0.0)
		DistantCopCarSirens(false)
		TriggerEvent("Notify","sucesso","Boost de fps ultra ligado!", "")    
		
	elseif args[1] == "medio" then
		SetTimecycleModifier("cinema")
		RopeDrawShadowEnabled(false)
		CascadeShadowsClearShadowSampleType()
		CascadeShadowsSetAircraftMode(false)
		CascadeShadowsEnableEntityTracker(true)
		CascadeShadowsSetDynamicDepthMode(false)
		CascadeShadowsSetEntityTrackerScale(0.0)
		CascadeShadowsSetDynamicDepthValue(0.0)
		CascadeShadowsSetCascadeBoundsScale(0.0)
		SetFlashLightFadeDistance(0.0)
		SetLightsCutoffDistanceTweak(0.0)
		DistantCopCarSirens(false)
		TriggerEvent("Notify","sucesso","Boost de fps mediano ligado!", "")    
		
	elseif args[1] == "baixo" then
		RopeDrawShadowEnabled(true)
		CascadeShadowsClearShadowSampleType()
		CascadeShadowsSetAircraftMode(false)
		CascadeShadowsEnableEntityTracker(true)
		CascadeShadowsSetDynamicDepthMode(false)
		CascadeShadowsSetEntityTrackerScale(5.0)
		CascadeShadowsSetDynamicDepthValue(3.0)
		CascadeShadowsSetCascadeBoundsScale(3.0)
		SetFlashLightFadeDistance(3.0)
		SetLightsCutoffDistanceTweak(3.0)
		DistantCopCarSirens(false)
		SetArtificialLightsState(false)
		TriggerEvent("Notify","sucesso","Boost de fps baixo ligado!", "")    
		
	elseif args[1] == "off" then
		SetTimecycleModifier("default")
		RopeDrawShadowEnabled(true)
		CascadeShadowsSetAircraftMode(true)
		CascadeShadowsEnableEntityTracker(false)
		CascadeShadowsSetDynamicDepthMode(true)
		CascadeShadowsSetEntityTrackerScale(5.0)
		CascadeShadowsSetDynamicDepthValue(5.0)
		CascadeShadowsSetCascadeBoundsScale(5.0)
		SetFlashLightFadeDistance(10.0)
		SetLightsCutoffDistanceTweak(10.0)
		DistantCopCarSirens(true)
		SetArtificialLightsState(false)
		TriggerEvent("Notify","sucesso","Boost de fps desligado!")
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- SETENERGETIC
-----------------------------------------------------------------------------------------------------------------------------------------
local energetic = 0
RegisterNetEvent("setEnergetic")
AddEventHandler("setEnergetic",function(timers,number)
	energetic = timers
	SetRunSprintMultiplierForPlayer(PlayerId(),number)
end)

Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if energetic > 0 then
			timeDistance = 4
			RestorePlayerStamina(PlayerId(),1.0)
		end
		Citizen.Wait(timeDistance)
	end
end)

Citizen.CreateThread(function()
	while true do
		if energetic > 0 then
			energetic = energetic - 1

			if energetic <= 0 or GetEntityHealth(PlayerPedId()) <= 101 then
				energetic = 0
				SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
			end
		end
		Citizen.Wait(1000)
	end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- GETHANDCUFF
-----------------------------------------------------------------------------------------------------------------------------------------
function src.getHandcuff()
	return handcuff
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOGGLEHANDCUFF
-----------------------------------------------------------------------------------------------------------------------------------------
local handcuff = false
function src.toggleHandcuff()
	local ped = PlayerPedId()
	if not handcuff then
		handcuff = true
		TriggerEvent("gcPhone:handcuff")
		TriggerEvent("radio:outServers")

		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			SetPedComponentVariation(ped,7,41,0,2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			SetPedComponentVariation(ped,7,25,0,2)
		end
	else
		handcuff = false
		SetPedComponentVariation(ped,7,0,0,2)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHANDCUFF
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if handcuff then
			timeDistance = 4
			DisableControlAction(1,21,true)
			DisableControlAction(1,23,true)
			DisableControlAction(1,24,true)
			DisableControlAction(1,25,true)
			DisableControlAction(1,75,true)
			DisableControlAction(1,22,true)
			DisableControlAction(1,73,true)
			DisableControlAction(1,167,true)
			DisableControlAction(1,311,true)
			DisableControlAction(1,29,true)
			DisableControlAction(1,182,true)
			DisableControlAction(1,187,true)
			DisableControlAction(1,189,true)
			DisableControlAction(1,190,true)
			DisableControlAction(1,188,true)
			DisableControlAction(1,245,true)
			DisableControlAction(1,243,true)
			DisableControlAction(1,105,true)
			DisablePlayerFiring(PlayerPedId(),true)
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADWHILEHANDCUFF
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		w = 10000
		local ped = PlayerPedId()
		if handcuff and GetEntityHealth(ped) > 101 then
			vRP.playAnim(true,{"mp_arresting","idle"},true)
		end
		Citizen.Wait(w)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETDIAGNOSTIC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("resetHandcuff")
AddEventHandler("resetHandcuff",function()
	local ped = PlayerPedId()
	if handcuff then
		handcuff = false
		vRP.stopAnim(false)
		SetPedComponentVariation(ped,7,0,0,2)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LAVA JATO
-----------------------------------------------------------------------------------------------------------------------------------------
local markerPos = vector3(851.41, -2110.74, 29.59)
local HasAlreadyGotMessage = false

Citizen.CreateThread(function()

   while true do	
    local ped = GetPlayerPed(-1)
	Citizen.Wait(0)
	local playerCoords = GetEntityCoords(ped)
	local distance = #(playerCoords - markerPos)
	local isInMarker = false	
	
		if distance < 5.0 then
		DrawMarker(27, markerPos.x, markerPos.y, markerPos.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.0, 3.0, 3.0, 255, 100, 0, 50, false, false, 2, nil, nil, false)
	    		if distance < 2.0 then
				isInMarker = true
				else
				HasAlreadyGotMessage = false
				end
		else
			Citizen.Wait(2000)
		end
	
		if not IsPedInAnyVehicle(ped) then
		  elseif isInMarker and not HasAlreadyGotMessage then
			local vehicle = GetVehiclePedIsIn(PlayerPedId())
			AddExplosion(
				848.46, -2109.07, 30.59, 
				75, 
				0.0 --[[ number ]], 
				true --[[ boolean ]], 
				true --[[ boolean ]], 
				0.1 --[[ number ]]
			)
			SetTimeout(5000,function()
			SetVehicleDirtLevel(vehicle, 0.1)
			
			TriggerEvent("Notify","sucesso","Seu Veículo foi lavado. Tente mantê-lo limpo.")
			HasAlreadyGotMessage = true
			end)

			Citizen.Wait(5000)
		end
	
	end
end)


--------- ILHA MAPA DLC--------------

ilha = "h4_fake_islandx"

Citizen.CreateThread(function()
	repeat
	  Wait(1)
		SetRadarAsExteriorThisFrame()
		SetRadarAsInteriorThisFrame(ilha,vec(4700.0,-5145.0),0,0)
	until false
  end)

 