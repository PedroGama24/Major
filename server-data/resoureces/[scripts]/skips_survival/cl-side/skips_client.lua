----[vRP TUNNEL/PROXY]----
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","skips_survival")
--[SURVIVAL TUNNEL/PROXY]--
Skips = {}
Pserver = Tunnel.getInterface("skips_survival","skips_survival")
SkipsSERVER = Tunnel.getInterface("skips_survival")
Tunnel.bindInterface("skips_survival",Skips)


vSERVER = Tunnel.getInterface(GetCurrentResourceName())

cutscene_desistencia = skips.cutscene_pos_desistir
cutscene = skips.cutscene_pos_morte
localrenacer = skips.respawn_pos_morte
localdesistir = skips.respawn_pos_desistir
DeathTime = skips.tempo_morte 

direct_do_ped_p_m =  skips.heading_do_ped_p_m
direct_do_ped_p_d =  skips.heading_do_ped_p_d

ter_primeira_vis = skips.prim_vis
-----------------------------------------------------------------------------------------------------------------------------------------
--[ INDICAR NOCAUTEADO ]-----------------------------------------------------------------------------------------------------------------
--------[ THREAD ]-----------------------------------------------------------------------------------------------------------------------

primeira_vis_pos_morte = ter_primeira_vis

local nocauteado = false
local deathtimer = DeathTime

Citizen.CreateThread(function()
	while true do
			local sleep = 1000
			if GetEntityHealth(PlayerPedId()) <= 101 then
				if not nocauteado then
					sleep = 5
					deathtimer = DeathTime
					nocauteado = true
				end
				if deathtimer > 0 then
					SetPedToRagdoll(ped,1000,1000,0,0,0,0)
					BlockWeaponWheelThisFrame()
					SetEntityHealth(ped,101)
					SetNuiFocus(true,true)
					TransitionToBlurred(1000)
					

					if primeira_vis_pos_morte == true then
						SetFollowPedCamViewMode(4)
					end

					TriggerEvent("hud:SetShow",false)
					SendNUIMessage({
						setDisplay = true,
						setDisplayDead = false,
						deathtimer = deathtimer
					})
				else
					SetNuiFocus(true,true)
					TransitionToBlurred(1000)
					SendNUIMessage({
						setDisplay = false,
						setDisplayDead = true,
						deathtimer = deathtimer
					})
				end
			end
			Citizen.Wait(sleep)
	end
end)
--============================================================================================
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if nocauteado and deathtimer > 0 then
			deathtimer = deathtimer - 1
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ BOTÃO DE MORTE ]---------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

local renacer = localrenacer
local heading = direct_do_ped_p_m

quero_cutscene = cutscene

RegisterNUICallback('Skips:BotaoReviver',function()
	local ped = PlayerPedId()
	TriggerEvent("resetBleeding")
	TriggerEvent("resetDiagnostic")
	SetEntityHealth(ped,400)
	TriggerServerEvent("clearInventory")
	SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
	TriggerEvent("hud:SetShow",true)
	TriggerEvent("Skips:ForceNuiOff") ---- DESLIGAR NUI ANTES DA CUTSCENE
	if quero_cutscene == true then
		TriggerEvent("Skips:Cutscene")
	end
	deathtimer = DeathTime
	nocauteado = false
	ClearPedBloodDamage(ped)
	SetFollowPedCamViewMode(1)
	SetEntityInvincible(ped,false)
	DoScreenFadeOut(1000)
	SetPedArmour(ped,0)
	Citizen.Wait(1000)
	SetEntityCoords(ped, renacer.x, renacer.y, renacer.z + 0.20,1,0,0,1)
	SetEntityHeading(ped, heading)
	SendNUIMessage({
		setDisplay = false,
		setDisplayDead = false,
		deathtimer = deathtimer
	})
	SetTimeout(5000,function()
		FreezeEntityPosition(ped,false)
		Citizen.Wait(1000)
		DoScreenFadeIn(1000)
		SetEntityHealth(ped,400)
		ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.03)
	end)
end)

--[ BOTÃO DE DESISTIR ]------------------------------------------------------------------------------------------------------------------



local desistiu = localdesistir
local heading = direct_do_ped_p_d

quero_cutscene_pos_desisitir = cutscene_desistencia

RegisterNUICallback('Skips:BotaoDesistir',function()
	local ped = PlayerPedId()
	local timer = SkipsSERVER.timedesistencia()
	if SkipsSERVER.checkTimeDesistir() then
		deathtimer = DeathTime
		nocauteado = false
		SetNuiFocus(false,false)
		TransitionFromBlurred(1000)
		SendNUIMessage({
			setDisplay = false,
			setDisplayDead = false,
			deathtimer = deathtimer
		})
		TriggerEvent("Skips:desistir")
		TriggerEvent("resetBleeding")
		TriggerEvent("resetDiagnostic")
		SetFollowPedCamViewMode(1)
		if quero_cutscene_pos_desisitir == true then
			TriggerEvent("Skips:Cutscene")
		end
		SetEntityHealth(ped,400)
		TriggerEvent("hud:SetShow",true)

		SkipsSERVER.removeAttachs()
		
		TriggerServerEvent("clearInventory")
		SetNuiFocus(false,false)
		TransitionFromBlurred(1000)
		ClearPedBloodDamage(ped)
		SetEntityInvincible(ped,false)
		DoScreenFadeOut(1000)
		SetPedArmour(ped,0)
		Citizen.Wait(1000)
		SetEntityCoords(ped, desistiu.x, desistiu.y, desistiu.z + 0.20,1,0,0,1)
		SetEntityHeading(ped, heading)
		SendNUIMessage({
			setDisplay = false,
			setDisplayDead = false,
			deathtimer = deathtimer
		})
		SetTimeout(5000,function()
			SkipsSERVER.SetTimeDesistir()
			FreezeEntityPosition(ped,false)
			Citizen.Wait(1000)
			DoScreenFadeIn(1000)
			ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.03)
		end)
	else
	--print("Você não podera desistir de sua Vida agora! Aguarde "..timer.." Segundos !")
--	TriggerEvent("skips:Notify","negado","Você não podera desistir de sua Vida agora! Aguarde "..timer.." Segundos !")

	TriggerEvent("Notify","negado","Você não podera desistir de sua Vida agora! Aguarde "..timer.." Segundos !",8000)

	end
end)


--[ THREAD PARA DIMINUIR TEMPO APÓS DESISTENCIA ]----------------------------------------------------------------------------------------


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(750)
		if SkipsSERVER.checkuserid() then
			local timer = SkipsSERVER.timedesistencia()
			if timer > 0 then
				SkipsSERVER.diminuirtimedesistencia()
			end
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
--[ DESLIGAR A NUI ]---------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------


RegisterNetEvent("Skips:NuiOff")
AddEventHandler("Skips:NuiOff",function()
	local ped = PlayerPedId()
	TriggerEvent("resetBleeding")
	TriggerEvent("resetDiagnostic")
	deathtimer = DeathTime
	nocauteado = false
	ClearPedBloodDamage(ped)
	SetEntityInvincible(ped,false)
	SetEntityHealth(ped,400)
	SetPedArmour(ped,0)
	SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
	SendNUIMessage({
		setDisplay = false,
		setDisplayDead = false,
		deathtimer = deathtimer
	})
	SetTimeout(5000,function()
		FreezeEntityPosition(ped,false)
		Citizen.Wait(1000)
		DoScreenFadeIn(1000)
	end)
end)

--[ FORÇAR DESLIGAMENTO DA NUI ]---------------------------------------------------------------------------------------------------------

RegisterNetEvent("Skips:ForceNuiOff")
AddEventHandler("Skips:ForceNuiOff",function()
	deathtimer = 0
	nocauteado = false
	SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
	TriggerEvent("Skips:NuiOff")
	SendNUIMessage({
		setDisplay = false,
		setDisplayDead = false,
		deathtimer = deathtimer
	})
   DisableControlAction(0,21,false)
   DisableControlAction(0,22,false)
   DisableControlAction(0,23,false)
   DisableControlAction(0,24,false)
   DisableControlAction(0,25,false)
   DisableControlAction(0,29,false)
   DisableControlAction(0,32,false)
   DisableControlAction(0,33,false)
   DisableControlAction(0,34,false)
   DisableControlAction(0,35,false)
   DisableControlAction(0,47,false)
   DisableControlAction(0,56,false)
   DisableControlAction(0,58,false)
   DisableControlAction(0,73,false)
   DisableControlAction(0,75,false)
   DisableControlAction(0,137,false)
   DisableControlAction(0,140,false)
   DisableControlAction(0,141,false)
   DisableControlAction(0,142,false)
   DisableControlAction(0,143,false)
   DisableControlAction(0,166,false)
   DisableControlAction(0,167,false)
   DisableControlAction(0,168,false)
   DisableControlAction(0,169,false)
   DisableControlAction(0,170,false)
   DisableControlAction(0,177,false)
   DisableControlAction(0,182,false)
   DisableControlAction(0,187,false)
   DisableControlAction(0,188,false)
   DisableControlAction(0,189,false)
   DisableControlAction(0,190,false)
   DisableControlAction(0,243,false)
   DisableControlAction(0,257,false)
   DisableControlAction(0,263,false)
   DisableControlAction(0,264,false)
   DisableControlAction(0,268,false)
   DisableControlAction(0,269,false)
   DisableControlAction(0,270,false)
   DisableControlAction(0,271,false)
   DisableControlAction(0,288,false)
   DisableControlAction(0,289,false)
   DisableControlAction(0,311,false)
   DisableControlAction(0,344,false)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ VOLTAR A VIDA ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local skipsinvivo = false
RegisterNetEvent("Skips:life")
AddEventHandler("Skips:life",function()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
    local armour = GetPedArmour(ped)

    SetEntityHealth(ped,health)
    SetPedArmour(ped,armour)
	
		if skipsinvivo then
			return
		end

	skipsinvivo = true
	TriggerEvent("Notify","sucesso","Você esta sendo curado por uma força Divina e esta se recuperando!",8000)
	ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.05)
	vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
	TriggerEvent('resetDiagnostic')
	SetFollowPedCamViewMode(2)


	TriggerEvent("progress",10000,"Se Recuperando..")
	SetTimeout(1000,function()
		if skipsinvivo then
			repeat
				Citizen.Wait(600)
			if GetEntityHealth(ped) > 101 then
				SetEntityHealth(ped,GetEntityHealth(ped)+1)
			end
		until GetEntityHealth(ped) >= 240 or GetEntityHealth(ped) <= 101
		TriggerEvent("Skips:ForceNuiOff") --- PRIMEIRA TENTATIVA DE DESLIGAR NUI
			SetTimeout(3000,function()
				vRP._playAnim(false,{{"amb@world_human_stupor@male@base","base"}},true)
				TriggerEvent("Notify","sucesso","Você se recuperou graças a um DEUS!",8000)
				SetTimeout(6000,function()
					vRP._playAnim(false,{{}},true)
				end)
			end)
			skipsinvivo = false
		end
	end)
end)

--[ DESISTIR ]---------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("Skips:desistir")
AddEventHandler("Skips:desistir",function()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
    local armour = GetPedArmour(ped)

    SetEntityHealth(ped,health)
    SetPedArmour(ped,armour)
	
		if skipsinvivo then
			return
		end

	skipsinvivo = true
	TriggerEvent("Notify","sucesso","Você acordou em um local estranho!! O que aconteceu?",8000)
	vRP._playAnim(false,{{"amb@world_human_stupor@male@base","base"}},true)
	TriggerEvent('resetDiagnostic')
	SetEntityHealth(ped,400)
	SetFollowPedCamViewMode(2)
	spawnbmx()
	
	TriggerEvent("progress",10000,"Acordando...")
	if skipsinvivo then
		repeat
			Citizen.Wait(600)
		if GetEntityHealth(ped) > 101 then
			SetEntityHealth(ped,GetEntityHealth(ped)+1)
		end
		vRP.playSound("ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
		TriggerEvent("Notify","importante","Parece que tem uma <b>Bike</b> abandonada ali!",8000)
	until GetEntityHealth(ped) >= 240 or GetEntityHealth(ped) <= 101
		SetTimeout(6000,function()
			vRP._playAnim(false,{{"amb@world_human_stupor@male@base","base"}},true)
			TriggerEvent("Notify","sucesso","Você se não se lembra de nada!!",8000)
			SetTimeout(4000,function()
				vRP._playAnim(false,{{}},true)
				SkipsSERVER.forcegod(ped)
			end)
		end)
		skipsinvivo = false
	end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- [ CUTSCENE DEATH ] -------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

function PlayCutscene(cut, coords)
    while not HasThisCutsceneLoaded(cut) do 
        RequestCutsceneWithPlaybackList(cut, 29, 8)
        Wait(0) 
    end
    CreateCutscene(coords)
    Finish()
    RemoveCutscene()
    DoScreenFadeIn(500)
end

function CreateCutscene(coords)
    StartCutsceneAtCoords(coords, 0)
    DoScreenFadeIn(250)
end

function Finish()
    local tripped = false
    repeat
        Wait(0)
        if (GetCutsceneTotalDuration() - GetCutsceneTime() <= 250) then
        DoScreenFadeOut(250)
        tripped = true
        end
    until not IsCutscenePlaying()
    if (not tripped) then
        DoScreenFadeOut(100)
        Wait(150)
    end
    return
end

SkipsSceneDeath = 'MP_INT_MCS_18_A1' 

RegisterNetEvent("Skips:Cutscene")
AddEventHandler("Skips:Cutscene",function()
	local ped = PlayerPedId()
	SetCutsceneTriggerArea(0.0, 0.0, 0.0, 0.0, 121.6249, 0.0);
	x = AddNavmeshBlockingObject(-1314.997, -1721.084, 1.1493, 100.0, 100.0, 100.0, 0.0, false, 7)
   	 SetPedNonCreationArea(-1324.736, -1756.909, -10.0, -1299.695, -1688.181, 10.0)
   	SetOverrideWeather('CLEARING')
    SetTransitionTimecycleModifier("Kifflom", 1.0)
    NetworkOverrideClockTime(18, 0, 0)
    N_0xfb680d403909dc70(1, PlayerId() + 32)
    SetRainLevel(0.0)
    PlayCutscene(SkipsSceneDeath, vector3(-1314.997, -1721.084, 1.1493))
    ClearTimecycleModifier()
    ClearPedNonCreationArea()
	RemoveNavmeshBlockingObject(x)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- [ BMX APÓS DESISTÊNCIA ] -------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

function spawnbmx()
	local mhash = "bmx"
	if not nveh then
	 while not HasModelLoaded(mhash) do
	  RequestModel(mhash)
	    Citizen.Wait(10)
	 end
		local ped = PlayerPedId()
		local x,y,z = vRP.getPosition()
		nveh = CreateVehicle(mhash,-1756.75,-264.66,48.9+0.5,242.57,true,false)
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


-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FUÇAR TUMULOS ] --------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------


local tumulos = {
	{ ['x'] = -1748.76, ['y'] = -277.31, ['z'] = 48.93 },
	{ ['x'] = -1765.85, ['y'] = -260.15, ['z'] = 49.29 },
	{ ['x'] = -1749.65, ['y'] = -288.14, ['z'] = 48.46 },
	{ ['x'] = -1744.75, ['y'] = -272.1, ['z'] = 49.8 },
	{ ['x'] = -1742.79, ['y'] = -281.68, ['z'] = 49.5 },
	{ ['x'] = -1737.27, ['y'] = -287.14, ['z'] = 49.15 },
	{ ['x'] = -1730.7, ['y'] = -287.04, ['z'] = 49.81 },
	{ ['x'] = -1732.43, ['y'] = -278.71, ['z'] = 50.53 },
	{ ['x'] = -1749.56, ['y'] = -260.96, ['z'] = 50.36 },
	{ ['x'] = -1776.9, ['y'] = -269.5, ['z'] = 46.08 },
	{ ['x'] = -1783.3, ['y'] = -278.18, ['z'] = 45.55 },
	{ ['x'] = -1786.39, ['y'] = -262.69, ['z'] = 45.73 },
	{ ['x'] = -1791.86, ['y'] = -250.9, ['z'] = 47.03 },
	{ ['x'] = -1777.43, ['y'] = -242.64, ['z'] = 50.72 },
	{ ['x'] = -1770.15, ['y'] = -240.95, ['z'] = 51.91 },
	{ ['x'] = -1754.72, ['y'] = -251.17, ['z'] = 51.68 },
	{ ['x'] = -1752.23, ['y'] = -307.56, ['z'] = 47.12 },
	{ ['x'] = -1758.03, ['y'] = -303.83, ['z'] = 46.75 },
	{ ['x'] = -1753.83, ['y'] = -295.69, ['z'] = 47.26 },
	{ ['x'] = -1788.38, ['y'] = -274.21, ['z'] = 45.22 },
}

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local idle = 1000
		for k,v in pairs(tumulos) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local tumulos = tumulos[k]
			
			if distance < 5.1 then
				DrawText3Ds(tumulos.x, tumulos.y, tumulos.z+0.4, "~o~E~w~ ~w~PARA VASCULHAR O ~o~TUMULO!~w~.")
				idle = 5
				if distance < 1.2 then
					if IsControlJustPressed(0,38) then
						if SkipsSERVER.futucartumulos(tumulos.x) then
							Citizen.Wait(6000)
							SkipsSERVER.pagamentoporfutucartumulos()
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ EVENTS ]-------------------------------------------------------------------------------------------

RegisterNetEvent('skips:Anim')
AddEventHandler('skips:Anim', function()
    vRP._playAnim(false,{{"amb@world_human_gardener_plant@female@base","base_female"}},true)
    Citizen.Wait(6000)
    ClearPedTasks(PlayerPedId())
end)

--[ FUNCTIONS ]----------------------------------------------------------------------------------------

function DrawText3Ds(x,y,z,text)
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






weapons = {
    [tostring(GetHashKey('WEAPON_UNARMED'))] = 'NO SOCO',
    [tostring(GetHashKey('WEAPON_HAZARDCAN'))] = 'WEAPON_HAZARDCAN',
    [tostring(GetHashKey('GADGET_PARACHUTE'))] = 'GADGET_PARACHUTE',
    [tostring(GetHashKey('WEAPON_MARKSMANRIFLE_MK2'))] = 'WEAPON_MARKSMANRIFLE_MK2',
    [tostring(GetHashKey('WEAPON_COMBATMG_MK2'))] = 'WEAPON_COMBATMG_MK2',
    [tostring(GetHashKey('WEAPON_MILITARYRIFLE'))] = 'WEAPON_MILITARYRIFLE',
    [tostring(GetHashKey('WEAPON_BULLPUPRIFLE_MK2'))] = 'WEAPON_BULLPUPRIFLE_MK2',
    [tostring(GetHashKey('WEAPON_SPECIALCARBINE_MK2'))] = 'WEAPON_SPECIALCARBINE_MK2',
    [tostring(GetHashKey('WEAPON_COMBATSHOTGUN'))] = 'WEAPON_COMBATSHOTGUN',
    [tostring(GetHashKey('WEAPON_PUMPSHOTGUN_MK2'))] = 'WEAPON_PUMPSHOTGUN_MK2',
    [tostring(GetHashKey('WEAPON_RAYCARBINE'))] = 'WEAPON_RAYCARBINE',
    [tostring(GetHashKey('WEAPON_SMG_MK2'))] = 'WEAPON_SMG_MK2',
    [tostring(GetHashKey('WEAPON_GADGETPISTOL'))] = 'WEAPON_GADGETPISTOL',
    [tostring(GetHashKey('WEAPON_NAVYREVOLVER'))] = 'WEAPON_NAVYREVOLVER',
    [tostring(GetHashKey('WEAPON_CERAMICPISTOL'))] = 'WEAPON_CERAMICPISTOL',
    [tostring(GetHashKey('WEAPON_RAYPISTOL'))] = 'WEAPON_RAYPISTOL',
    [tostring(GetHashKey('WEAPON_DOUBLEACTION'))] = 'WEAPON_DOUBLEACTION',
    [tostring(GetHashKey('WEAPON_REVOLVER_MK2'))] = 'WEAPON_REVOLVER_MK2',
    [tostring(GetHashKey('WEAPON_SNSPISTOL_MK2'))] = 'WEAPON_SNSPISTOL_MK2',
    [tostring(GetHashKey('WEAPON_STONE_HATCHET'))] = 'WEAPON_STONE_HATCHET',
    [tostring(GetHashKey('WEAPON_RAYMINIGUN'))] = 'WEAPON_RAYMINIGUN',
    [tostring(GetHashKey('WEAPON_KNIFE'))] = 'WEAPON_KNIFE',
    [tostring(GetHashKey('WEAPON_NIGHTSTICK'))] = 'WEAPON_NIGHTSTICK',
    [tostring(GetHashKey('WEAPON_HAMMER'))] = 'WEAPON_HAMMER',
    [tostring(GetHashKey('WEAPON_BAT'))] = 'WEAPON_BAT',
    [tostring(GetHashKey('WEAPON_GOLFCLUB'))] = 'WEAPON_GOLFCLUB',
    [tostring(GetHashKey('WEAPON_CROWBAR'))] = 'WEAPON_CROWBAR',
    [tostring(GetHashKey('WEAPON_PISTOL'))] = 'WEAPON_PISTOL',
    [tostring(GetHashKey('WEAPON_PISTOL_MK2'))] = 'WEAPON_PISTOL_MK2',
    [tostring(GetHashKey('WEAPON_COMBATPISTOL'))] = 'WEAPON_COMBATPISTOL',
    [tostring(GetHashKey('WEAPON_APPISTOL'))] = 'WEAPON_APPISTOL',
    [tostring(GetHashKey('WEAPON_PISTOL50'))] = 'WEAPON_PISTOL50',
    [tostring(GetHashKey('WEAPON_MICROSMG'))] = 'WEAPON_MICROSMG',
    [tostring(GetHashKey('WEAPON_SMG'))] = 'WEAPON_SMG',
    [tostring(GetHashKey('WEAPON_ASSAULTSMG'))] = 'WEAPON_ASSAULTSMG',
    [tostring(GetHashKey('WEAPON_ASSAULTRIFLE'))] = 'WEAPON_ASSAULTRIFLE',
    [tostring(GetHashKey('WEAPON_CARBINERIFLE'))] = 'WEAPON_CARBINERIFLE',
    [tostring(GetHashKey('WEAPON_CARBINERIFLE_MK2'))] = 'WEAPON_CARBINERIFLE_MK2',
    [tostring(GetHashKey('WEAPON_ASSAULTRIFLE_MK2'))] = 'WEAPON_ASSAULTRIFLE_MK2',
    [tostring(GetHashKey('WEAPON_ADVANCEDRIFLE'))] = 'WEAPON_ADVANCEDRIFLE',
    [tostring(GetHashKey('WEAPON_MG'))] = 'WEAPON_MG',
    [tostring(GetHashKey('WEAPON_COMBATMG'))] = 'WEAPON_COMBATMG',
    [tostring(GetHashKey('WEAPON_PUMPSHOTGUN'))] = 'WEAPON_PUMPSHOTGUN',
    [tostring(GetHashKey('WEAPON_SAWNOFFSHOTGUN'))] = 'WEAPON_SAWNOFFSHOTGUN',
    [tostring(GetHashKey('WEAPON_ASSAULTSHOTGUN'))] = 'WEAPON_ASSAULTSHOTGUN',
    [tostring(GetHashKey('WEAPON_BULLPUPSHOTGUN'))] = 'WEAPON_BULLPUPSHOTGUN',
    [tostring(GetHashKey('WEAPON_STUNGUN'))] = 'WEAPON_STUNGUN',
    [tostring(GetHashKey('WEAPON_SNIPERRIFLE'))] = 'WEAPON_SNIPERRIFLE',
    [tostring(GetHashKey('WEAPON_HEAVYSNIPER'))] = 'WEAPON_HEAVYSNIPER',
    [tostring(GetHashKey('WEAPON_REMOTESNIPER'))] = 'WEAPON_REMOTESNIPER',
    [tostring(GetHashKey('WEAPON_GRENADELAUNCHER'))] = 'WEAPON_GRENADELAUNCHER',
    [tostring(GetHashKey('WEAPON_GRENADELAUNCHER_SMOKE'))] = 'WEAPON_GRENADELAUNCHER_SMOKE',
    [tostring(GetHashKey('WEAPON_RPG'))] = 'WEAPON_RPG',
    [tostring(GetHashKey('WEAPON_PASSENGER_ROCKET'))] = 'WEAPON_PASSENGER_ROCKET',
    [tostring(GetHashKey('WEAPON_AIRSTRIKE_ROCKET'))] = 'WEAPON_AIRSTRIKE_ROCKET',
    [tostring(GetHashKey('WEAPON_STINGER'))] = 'WEAPON_STINGER',
    [tostring(GetHashKey('WEAPON_MINIGUN'))] = 'WEAPON_MINIGUN',
    [tostring(GetHashKey('WEAPON_GRENADE'))] = 'WEAPON_GRENADE',
    [tostring(GetHashKey('WEAPON_STICKYBOMB'))] = 'WEAPON_STICKYBOMB',
    [tostring(GetHashKey('WEAPON_SMOKEGRENADE'))] = 'WEAPON_SMOKEGRENADE',
    [tostring(GetHashKey('WEAPON_BZGAS'))] = 'WEAPON_BZGAS',
    [tostring(GetHashKey('WEAPON_MOLOTOV'))] = 'WEAPON_MOLOTOV',
    [tostring(GetHashKey('WEAPON_FIREEXTINGUISHER'))] = 'WEAPON_FIREEXTINGUISHER',
    [tostring(GetHashKey('WEAPON_PETROLCAN'))] = 'WEAPON_PETROLCAN',
    [tostring(GetHashKey('OBJECT'))] = 'Object',
    [tostring(GetHashKey('WEAPON_BALL'))] = 'WEAPON_BALL',
    [tostring(GetHashKey('WEAPON_FLARE'))] = 'WEAPON_FLARE',
    [tostring(GetHashKey('VEHICLE_WEAPON_TANK'))] = 'VEHICLE_WEAPON_TANK',
    [tostring(GetHashKey('VEHICLE_WEAPON_SPACE_ROCKET'))] = 'VEHICLE_WEAPON_SPACE_ROCKET',
    [tostring(GetHashKey('VEHICLE_WEAPON_PLAYER_LASER'))] = 'VEHICLE_WEAPON_PLAYER_LASER',
    [tostring(GetHashKey('AMMO_RPG'))] = 'AMMO_RPG',
    [tostring(GetHashKey('AMMO_TANK'))] = 'AMMO_TANK',
    [tostring(GetHashKey('AMMO_SPACE_ROCKET'))] = 'AMMO_SPACE_ROCKET',
    [tostring(GetHashKey('AMMO_PLAYER_LASER'))] = 'AMMO_PLAYER_LASER',
    [tostring(GetHashKey('AMMO_ENEMY_LASER'))] = 'AMMO_ENEMY_LASER',
    [tostring(GetHashKey('WEAPON_RAMMED_BY_CAR'))] = 'WEAPON_RAMMED_BY_CAR',
    [tostring(GetHashKey('WEAPON_BOTTLE'))] = 'WEAPON_BOTTLE',
    [tostring(GetHashKey('WEAPON_GUSENBERG'))] = 'WEAPON_GUSENBERG',
    [tostring(GetHashKey('WEAPON_SNSPISTOL'))] = 'WEAPON_SNSPISTOL',
    [tostring(GetHashKey('WEAPON_VINTAGEPISTOL'))] = 'WEAPON_VINTAGEPISTOL',
    [tostring(GetHashKey('WEAPON_DAGGER'))] = 'WEAPON_DAGGER',
    [tostring(GetHashKey('WEAPON_FLAREGUN'))] = 'WEAPON_FLAREGUN',
    [tostring(GetHashKey('WEAPON_HEAVYPISTOL'))] = 'WEAPON_HEAVYPISTOL',
    [tostring(GetHashKey('WEAPON_SPECIALCARBINE'))] = 'WEAPON_SPECIALCARBINE',
    [tostring(GetHashKey('WEAPON_MUSKET'))] = 'WEAPON_MUSKET',
    [tostring(GetHashKey('WEAPON_FIREWORK'))] = 'WEAPON_FIREWORK',
    [tostring(GetHashKey('WEAPON_MARKSMANRIFLE'))] = 'WEAPON_MARKSMANRIFLE',
    [tostring(GetHashKey('WEAPON_HEAVYSHOTGUN'))] = 'WEAPON_HEAVYSHOTGUN',
    [tostring(GetHashKey('WEAPON_PROXMINE'))] = 'WEAPON_PROXMINE',
    [tostring(GetHashKey('WEAPON_HOMINGLAUNCHER'))] = 'WEAPON_HOMINGLAUNCHER',
    [tostring(GetHashKey('WEAPON_HATCHET'))] = 'WEAPON_HATCHET',
    [tostring(GetHashKey('WEAPON_COMBATPDW'))] = 'WEAPON_COMBATPDW',
    [tostring(GetHashKey('WEAPON_KNUCKLE'))] = 'WEAPON_KNUCKLE',
    [tostring(GetHashKey('WEAPON_MARKSMANPISTOL'))] = 'WEAPON_MARKSMANPISTOL',
    [tostring(GetHashKey('WEAPON_MACHETE'))] = 'WEAPON_MACHETE',
    [tostring(GetHashKey('WEAPON_MACHINEPISTOL'))] = 'WEAPON_MACHINEPISTOL',
    [tostring(GetHashKey('WEAPON_FLASHLIGHT'))] = 'WEAPON_FLASHLIGHT',
    [tostring(GetHashKey('WEAPON_DBSHOTGUN'))] = 'WEAPON_DBSHOTGUN',
    [tostring(GetHashKey('WEAPON_COMPACTRIFLE'))] = 'WEAPON_COMPACTRIFLE',
    [tostring(GetHashKey('WEAPON_SWITCHBLADE'))] = 'WEAPON_SWITCHBLADE',
    [tostring(GetHashKey('WEAPON_REVOLVER'))] = 'WEAPON_REVOLVER',
    [tostring(GetHashKey('WEAPON_FIRE'))] = 'WEAPON_FIRE',
    [tostring(GetHashKey('WEAPON_HELI_CRASH'))] = 'WEAPON_HELI_CRASH',
    [tostring(GetHashKey('WEAPON_RUN_OVER_BY_CAR'))] = 'WEAPON_RUN_OVER_BY_CAR',
    [tostring(GetHashKey('WEAPON_HIT_BY_WATER_CANNON'))] = 'WEAPON_HIT_BY_WATER_CANNON',
    [tostring(GetHashKey('WEAPON_EXHAUSTION'))] = 'WEAPON_EXHAUSTION',
    [tostring(GetHashKey('WEAPON_EXPLOSION'))] = 'WEAPON_EXPLOSION',
    [tostring(GetHashKey('WEAPON_ELECTRIC_FENCE'))] = 'WEAPON_ELECTRIC_FENCE',
    [tostring(GetHashKey('WEAPON_BLEEDING'))] = 'WEAPON_BLEEDING',
    [tostring(GetHashKey('WEAPON_DROWNING_IN_VEHICLE'))] = 'WEAPON_DROWNING_IN_VEHICLE',
    [tostring(GetHashKey('WEAPON_DROWNING'))] = 'WEAPON_DROWNING',
    [tostring(GetHashKey('WEAPON_BARBED_WIRE'))] = 'WEAPON_BARBED_WIRE',
    [tostring(GetHashKey('WEAPON_VEHICLE_ROCKET'))] = 'WEAPON_VEHICLE_ROCKET',
    [tostring(GetHashKey('WEAPON_BULLPUPRIFLE'))] = 'WEAPON_BULLPUPRIFLE',
    [tostring(GetHashKey('WEAPON_ASSAULTSNIPER'))] = 'WEAPON_ASSAULTSNIPER',
    [tostring(GetHashKey('WEAPON_HEAVYSNIPER_MK2'))] = 'WEAPON_HEAVYSNIPER_MK2',
    [tostring(GetHashKey('VEHICLE_WEAPON_ROTORS'))] = 'VEHICLE_WEAPON_ROTORS',
    [tostring(GetHashKey('WEAPON_RAILGUN'))] = 'WEAPON_RAILGUN',
    [tostring(GetHashKey('WEAPON_AIR_DEFENCE_GUN'))] = 'WEAPON_AIR_DEFENCE_GUN',
    [tostring(GetHashKey('WEAPON_AUTOSHOTGUN'))] = 'WEAPON_AUTOSHOTGUN',
    [tostring(GetHashKey('WEAPON_BATTLEAXE'))] = 'WEAPON_BATTLEAXE',
    [tostring(GetHashKey('WEAPON_COMPACTLAUNCHER'))] = 'WEAPON_COMPACTLAUNCHER',
    [tostring(GetHashKey('WEAPON_MINISMG'))] = 'WEAPON_MINISMG',
    [tostring(GetHashKey('WEAPON_PIPEBOMB'))] = 'WEAPON_PIPEBOMB',
    [tostring(GetHashKey('WEAPON_POOLCUE'))] = 'WEAPON_POOLCUE',
    [tostring(GetHashKey('WEAPON_WRENCH'))] = 'WEAPON_WRENCH',
    [tostring(GetHashKey('WEAPON_SNOWBALL'))] = 'WEAPON_SNOWBALL',
    [tostring(GetHashKey('WEAPON_ANIMAL'))] = 'WEAPON_ANIMAL',
    [tostring(GetHashKey('WEAPON_COUGAR'))] = 'WEAPON_COUGAR'
}






--- [ KILL EVENTS ]

Citizen.CreateThread(function()
    local isDead = false
    local hasBeenDead = false
	local diedAt

    while true do

			local player = PlayerId()

			if NetworkIsPlayerActive(player) then
				local ped = PlayerPedId()

				if IsPedFatallyInjured(ped) and not isDead then
					isDead = true
					if not diedAt then
						diedAt = GetGameTimer()
					end

					local killer, killerweapon = NetworkGetEntityKillerOfPlayer(player)
					local killerentitytype = GetEntityType(killer)
					local killertype = -1
					local killerinvehicle = false
					local killervehiclename = ''
					local killervehicleseat = 0
					if killerentitytype == 1 then
						killertype = GetPedType(killer)
						if IsPedInAnyVehicle(killer, false) == 1 then
							killerinvehicle = true
							killerid__ = GetPlayerByEntityID(killer)
							killervehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(killer)))
							killervehicleseat = GetPedVehicleSeat(killer)
						else 
							killerinvehicle = false
						end
					end

					local killerid = GetPlayerByEntityID(killer)
					if killer ~= ped and killerid ~= nil and NetworkIsPlayerActive(killerid) then killerid = GetPlayerServerId(killerid)
					else 
						killerid = -1
					end

					if killer == ped or killer == -1 then
						hasBeenDead = true
					else
						vSERVER.sendKillLog(killerid, weapons[tostring(killerweapon)] or "Desconhecido", false)
						hasBeenDead = true
					end
				elseif not IsPedFatallyInjured(ped) then
					isDead = false
					diedAt = nil
				end
				if not hasBeenDead and diedAt ~= nil and diedAt > 0 then
					hasBeenDead = true
				elseif hasBeenDead and diedAt ~= nil and diedAt <= 0 then
					hasBeenDead = false
				end
			end
		Citizen.Wait(5)
    end
end)

function GetPedVehicleSeat(ped)
    local vehicle = GetVehiclePedIsIn(ped, false)
    for i=-2,GetVehicleMaxNumberOfPassengers(vehicle) do
        if(GetPedInVehicleSeat(vehicle, i) == ped) then return i end
    end
    return -2
end

function GetPlayerByEntityID(id)
    for _, player in ipairs(GetActivePlayers()) do
        if(NetworkIsPlayerActive(player) and GetPlayerPed(player) == id) then return player end
    end
    return nil
end

--[[ 
-------------------samu-------------
RegisterCommand("samu", function(source, args)
     
    	if emP.checkServices() then
    	    if emP.checkPayment() then
    	        TriggerEvent("Notify","sucesso","Você pagou $ 20000")
    		    TriggerEvent("knb:samu")
    		else
    		    TriggerEvent("Notify","negado","Você não possui dinheiro suficiente.")
    	    end
    	else
    		TriggerEvent("Notify","negado","Já existem paramédicos em serviço.")
    	end
end, false)

AddEventHandler("knb:samu", function()
    player = GetPlayerPed(-1)
    playerPos = GetEntityCoords(player)
    
    
    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(player, 0.0, 5.0, 0.0)
    
    local targetVeh = GetTargetVehicle(player, inFrontOfPlayer)


    local driverhash = GetHashKey("s_m_m_paramedic_01")
    RequestModel(driverhash)
    local vehhash = GetHashKey("brioso")
    RequestModel(vehhash)


    while not HasModelLoaded(driverhash) and RequestModel(driverhash) or not HasModelLoaded(vehhash) and RequestModel(vehhash) do
        RequestModel(driverhash)
        RequestModel(vehhash)
        Citizen.Wait(0)
    end

    if DoesEntityExist(targetVeh) then
    	if DoesEntityExist(samuVeh) then
			DeleteVeh(samuVeh, samuPed)
			SpawnVehicle(playerPos.x, playerPos.y, playerPos.x, vehhash, driverhash)
		else
			SpawnVehicle(playerPos.x, playerPos.y, playerPos.x, vehhash, driverhash)
		end
		GoToTarget(GetEntityCoords(targetVeh).x, GetEntityCoords(targetVeh).y, GetEntityCoords(targetVeh).z, samuVeh, samuPed, vehhash, targetVeh)
    end
end)

function SpawnVehicle(x, y, z, vehhash, driverhash)                                                     
    local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(x + math.random(-100, 100), y + math.random(-100, 100), z, 0, 3, 0)
    if found and HasModelLoaded(vehhash) and HasModelLoaded(vehhash) then
        samuVeh = CreateVehicle(vehhash, spawnPos, spawnHeading, true, false)                           --Carro spawnando
        ClearAreaOfVehicles(GetEntityCoords(samuVeh), 5000, false, false, false, false, false);  
        SetVehicleOnGroundProperly(samuVeh)
        samuPed = CreatePedInsideVehicle(samuVeh, 26, driverhash, -1, true, false)              		--Spawnando ped
        samuBlip = AddBlipForEntity(samuVeh) 
        BeginTextCommandSetBlipName("STRING")
	    AddTextComponentString("SAMU")
	    EndTextCommandSetBlipName(samuBlip)--Mostrando blip
        SetBlipFlashes(samuBlip, true)  
        SetBlipColour(samuBlip, 5)
    end
end

function DeleteVeh(vehicle, driver)
    SetEntityAsMissionEntity(vehicle, false, false)                                            			--Deletando carro
    DeleteEntity(vehicle)
    SetEntityAsMissionEntity(driver, false, false)                                              		--Deletando motorista
    DeleteEntity(driver)
    RemoveBlip(samuBlip)                                                                    			--Removendo blip
end

function GoToTarget(x, y, z, vehicle, driver, vehhash, target)
    TaskVehicleDriveToCoord(driver, vehicle, x, y, z, 17.0, 0, vehhash, 786603, 1, true)
    ShowAdvancedNotification("CHAR_CALL911", "~b~SAMU", "~r~Emergência", "Uma equipe está sendo enviada para sua localização.")
    enroute = true
    while enroute do
        Citizen.Wait(500)
        distanceToTarget = GetDistanceBetweenCoords(GetEntityCoords(target), GetEntityCoords(vehicle).x, GetEntityCoords(vehicle).y, GetEntityCoords(vehicle).z, true)
        if distanceToTarget < 20 then
            ShowAdvancedNotification("CHAR_DR_FRIEDLANDER", "~b~SAMU", "~r~Doutor Rogério", "Já estou chegando.")
            TaskVehicleTempAction(driver, vehicle, 27, 6000)
            GoToTargetWalking(target, vehicle, driver)
        end
    end
end

function GoToTargetWalking(target, vehicle, driver)
    while enroute do
        Citizen.Wait(500)
        deadplayer = GetEntityCoords(player)
        TaskGoToCoordAnyMeans(driver, deadplayer, 2.0, 0, 0, 786603, 0xbf800000)
        distanceToTarget = GetDistanceBetweenCoords(deadplayer, GetEntityCoords(driver).x, GetEntityCoords(driver).y, GetEntityCoords(driver).z, true)
        norunrange = false 
        if distanceToTarget <= 10 and not norunrange then -- parar npc quando chega proximo ao player
            TaskGoToCoordAnyMeans(driver, deadplayer, 1.0, 0, 0, 786603, 0xbf800000)
            norunrange = true
        end
        if distanceToTarget <= 2 then
            TaskTurnPedToFaceCoord(driver, GetEntityCoords(target), -1)
            ShowAdvancedNotification("CHAR_DR_FRIEDLANDER", "~b~SAMU", "~r~Doutor Rogério", "O que aconteceu? Vou tentar reanimar você.")
            RequestAnimDict("mini@cpr@char_a@cpr_str")
			while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
			    Citizen.Wait(1000)
			end
			TaskPlayAnim(driver,"mini@cpr@char_a@cpr_str","cpr_pumpchest",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
            Citizen.Wait(10000)
            ClearPedTasks(driver)
            Reviver(vehicle, driver)
            ShowAdvancedNotification("CHAR_DR_FRIEDLANDER", "~b~SAMU", "~r~Doutor Rogério", "Tudo certo! Já vou indo.")
        end
        
    end
end ]]

function Reviver(vehicle, driver)
	enroute = false
    norunrange = false
	FreezeEntityPosition(driver, false)
    Citizen.Wait(500)
    vRP.killGod()
	vRP.setHealth(250)
    -- TriggerClientEvent("Skips:ForceNuiOff",nplayer)
    TriggerEvent("Notify","sucesso","Reanimação efetuada com sucesso.")
    Citizen.Wait(5000)
    LeaveTarget(vehicle, driver)
end

function LeaveTarget(vehicle, driver)
	TaskVehicleDriveWander(driver, vehicle, 17.0, drivingStyle)
	SetEntityAsNoLongerNeeded(vehicle)
	SetPedAsNoLongerNeeded(driver)
	RemoveBlip(samuBlip)
	samuVeh = nil
	samuPed = nil
	targetVeh = nil
end

function GetTargetVehicle(player, dir)
    if vRP.isInComa() then 
        ped = GetPlayerPed(-1)
    end
    
    if DoesEntityExist(ped) then
        return ped
    else
        TriggerEvent("Notify","aviso","Você não pode utilizar este comando agora.")
    end
end



function ShowAdvancedNotification(icon, sender, title, text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessage(icon, icon, true, 4, sender, title, text)
    DrawNotification(false, true)
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end	