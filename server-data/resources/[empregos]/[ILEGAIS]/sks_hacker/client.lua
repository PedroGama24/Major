local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("sks_hacker")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local selecionado = 0
local emservico = false
local CoordenadaX = 757.38
local CoordenadaY = -1912.14
local CoordenadaZ = 29.47
-- ['x'] = 757.38, ['y'] = -1912.14, ['z'] = 29.47
local locais = {
	{ ['id'] = 1, ['x'] = 318.13, ['y'] = 313.81, ['z'] = 105.43, ['h'] = 165.12 },	
	{ ['id'] = 2, ['x'] = -694.63, ['y'] = 281.35, ['z'] = 83.05, ['h'] = 342.03 },
	{ ['id'] = 3, ['x'] = -848.56, ['y'] = -677.97, ['z'] = 27.84, ['h'] = 267.88 },
	{ ['id'] = 4, ['x'] = -772.97, ['y'] = -1147.23, ['z'] = 10.6, ['h'] = 123.197 },
	{ ['id'] = 5, ['x'] = 512.73, ['y'] = -1477.41, ['z'] = 29.3, ['h'] = 90.892 },
	{ ['id'] = 6, ['x'] = 413.15, ['y'] = -1032.32, ['z'] = 29.39, ['h'] = 90.687 },
	{ ['id'] = 7, ['x'] = -261.2, ['y'] = -1320.83, ['z'] = 31.31, ['h'] = 267.88 },
	{ ['id'] = 8, ['x'] = -173.97, ['y'] = -1457.52, ['z'] = 31.64, ['h'] = 317.013 },
	{ ['id'] = 9, ['x'] = 37.85, ['y'] = -1699.5, ['z'] = 29.52, ['h'] = 16.342 },
	{ ['id'] = 10, ['x'] = 761.47, ['y'] = -851.31, ['z'] = 25.66, ['h'] = 95.488 },
	{ ['id'] = 11, ['x'] = -2233.76, ['y'] = -365.48, ['z'] = 13.46, ['h'] = 332.558 },
	{ ['id'] = 12, ['x'] = -2079.2, ['y'] = -339.89, ['z'] = 13.29, ['h'] = 174.723 },
	{ ['id'] = 13, ['x'] = -619.59, ['y'] = -637.72, ['z'] = 31.84, ['h'] = 96.643 },
	{ ['id'] = 14, ['x'] = -692.27, ['y'] = -854.26, ['z'] = 23.77, ['h'] = 180.492 },
	{ ['id'] = 15, ['x'] = -479.6, ['y'] = -2184.68, ['z'] = 9.24, ['h'] = 306.282 },
	{ ['id'] = 16, ['x'] = -88.67, ['y'] = -1751.83, ['z'] = 29.77, ['h'] = 30.225  },
	{ ['id'] = 17, ['x'] = 173.5, ['y'] = -1613.71, ['z'] = 29.28, ['h'] = 37.622 },
	{ ['id'] = 18, ['x'] = 561.56, ['y'] = -1734.26, ['z'] = 29.29, ['h'] = 148.905 },
	{ ['id'] = 19, ['x'] = 967.69, ['y'] = -1741.4, ['z'] = 31.16, ['h'] = 253.846 },
	{ ['id'] = 20, ['x'] = 1240.24, ['y'] = -1461.11, ['z'] = 34.89, ['h'] = 358.610 },
	{ ['id'] = 21, ['x'] = 980.8, ['y'] = -234.64, ['z'] = 69.15, ['h'] = 244.970 },
	{ ['id'] = 22, ['x'] = 28.84, ['y'] = 204.14, ['z'] = 106.65, ['h'] = 252.937 },
	{ ['id'] = 23, ['x'] = -405.78, ['y'] = 116.9, ['z'] = 65.35, ['h'] = 347.937 },
	{ ['id'] = 24, ['x'] = 28.2, ['y'] = -1361.66, ['z'] = 29.37, ['h'] = 185.11 },
	{ ['id'] = 25, ['x'] = 31.23, ['y'] = -1382.57, ['z'] = 29.31, ['h'] = 84.44 },
	{ ['id'] = 26, ['x'] = 28.2, ['y'] = -1361.66, ['z'] = 29.37, ['h'] = 185.11 },
	{ ['id'] = 27, ['x'] = 31.23, ['y'] = -1382.57, ['z'] = 29.31, ['h'] = 84.44 },
	{ ['id'] = 28, ['x'] = 28.2, ['y'] = -1361.66, ['z'] = 29.37, ['h'] = 185.11 },
	{ ['id'] = 29, ['x'] = 31.23, ['y'] = -1382.57, ['z'] = 29.31, ['h'] = 84.44 },
	{ ['id'] = 30, ['x'] = 28.2, ['y'] = -1361.66, ['z'] = 29.37, ['h'] = 185.11 },
	{ ['id'] = 31, ['x'] = 31.23, ['y'] = -1382.57, ['z'] = 29.31, ['h'] = 84.44 },
	{ ['id'] = 32, ['x'] = 28.2, ['y'] = -1361.66, ['z'] = 29.37, ['h'] = 185.11 },
}


-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local kswait = 1000
		if not emservico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(CoordenadaX,CoordenadaY,CoordenadaZ)
			local distance = GetDistanceBetweenCoords(CoordenadaX,CoordenadaY,cdz,x,y,z,true)
            if distance <= 5 then
                kswait = 4
				DrawMarker(43,CoordenadaX,CoordenadaY,CoordenadaZ-1,0,0,0,0.0,0,0,0.8,0.8,0.8,255,0,0,50,0,0,0,1)
				if distance <= 1.2 then
				kswait = 4
					drawTxt("PRESSIONE  ~r~E~w~  PARA IR HACKEAR.",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and emP.checkPermission() then
                        emP.setSearch()
						emservico = true
						selecionado = math.random(23)
						CriandoBlip(locais,selecionado)
						TriggerEvent("Notify","sucesso","Você entrou em serviço, tenha seu notebook na mochila.")						
					end
				end
			end
        end
        Citizen.Wait(kswait)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- HACKEAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local kswait = 1000	
		if emservico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locais[selecionado].x,locais[selecionado].y,locais[selecionado].z)
			local distance = GetDistanceBetweenCoords(locais[selecionado].x,locais[selecionado].y,cdz,x,y,z,true)
            if distance <= 10 then
                kswait = 4
				DrawMarker(42,locais[selecionado].x,locais[selecionado].y,locais[selecionado].z-0.6,0,0,0,0.0,0,0,0.8,0.8,0.8,242,79,0,50,0,0,0,1)
				if distance <= 2.5 then
				kswait = 4
					drawTxt("PRESSIONE  ~r~E~w~  PARA HACKEAR A REDE",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and emP.checkTimers() and emP.checkPolice() and not IsInVehicle() then
						TriggerEvent('cancelando',true)                        
						vRP._playAnim(false,{{"anim@heists@ornate_bank@hack","hack_loop"}},true)
						laptop = CreateObject(GetHashKey("prop_laptop_01a"),x-0.6,y+0.2,z-1,true,true,true)
						SetEntityHeading(ped,85.77)
						SetEntityHeading(laptop,85.77)
						local puzzle = math.random(1,2)
						if puzzle == 1 then
						TriggerEvent("iniciarhacker")
						else
						TriggerEvent("mhacking:start",3,15,mycallback)
						TriggerEvent("mhacking:show")
						end

						RemoveBlip(blips)
						backentrega = selecionado
						while true do
							if backentrega == selecionado then
								selecionado = math.random(23)
							else
								break
							end
							Citizen.Wait(1)
						end
						CriandoBlip(locais,selecionado)
						TriggerEvent("Notify","importante","Vá até o próximo local e invada o sistema.")
					end
				end
			end
        end
        Citizen.Wait(kswait)	
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HACKEAR
-----------------------------------------------------------------------------------------------------------------------------------------
function mycallback(success,time)
	TriggerEvent("mhacking:hide")
	DeleteObject(laptop)
	vRP._stopAnim(false)
	TriggerEvent('cancelando',false)
	if success then	
		emP.checkPayment()
	else
		emP.MarcarOcorrencia()
        SetPedComponentVariation(PlayerPedId(),5,45,0,0)
	end
end

function leaveService()
    emservico = false
    RemoveBlip(blips)
    TriggerEvent("Notify","aviso","Você saiu de serviço.")
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local kswait = 1000
        if emservico then
            kswait = 4
			if IsControlJustPressed(0,121) then
			TriggerEvent("Notify","importante","Vá até o próximo local para invadir o sistema.")
			elseif IsControlJustPressed(0,168) then
				emservico = false
				RemoveBlip(blips)
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
			end
        end
        Citizen.Wait(kswait)
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

function CriandoBlip(locais,selecionado)
	blips = AddBlipForCoord(locais[selecionado].x,locais[selecionado].y,locais[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Hacker")
	EndTextCommandSetBlipName(blips)
end

function IsInVehicle()
	local ply = PlayerPedId()
	if IsPedSittingInAnyVehicle(ply) then
		return true
	else
		return false
	end
end


RegisterNetEvent("iniciarhacker")
AddEventHandler("iniciarhacker",function()
	FreezeEntityPosition(PlayerPedId(),true)
	scaleform = Initialize("HACKING_PC")
    UsingComputer = true
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.34, 0.34)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.001+ factor, 0.028, 0, 0, 0, 78)
end

function loadAnimDict( dict )  
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

local PalavrasSenha = "HACKERKS"
local Ipfinished = false

Citizen.CreateThread(function()
    function Initialize(scaleform)
        local scaleform = RequestScaleformMovieInteractive(scaleform)
        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end
        
        local CAT = 'hack'
        local CurrentSlot = 0
        while HasAdditionalTextLoaded(CurrentSlot) and not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
            Citizen.Wait(0)
            CurrentSlot = CurrentSlot + 1
        end
        
        if not HasThisAdditionalTextLoaded(CAT, CurrentSlot) then
            ClearAdditionalText(CurrentSlot, true)
            RequestAdditionalText(CAT, CurrentSlot)
            while not HasThisAdditionalTextLoaded(CAT, CurrentSlot) do
                Citizen.Wait(0)
            end
        end

        PushScaleformMovieFunction(scaleform, "SET_LABELS")
        ScaleformLabel("H_ICON_1")
        ScaleformLabel("H_ICON_2")
        ScaleformLabel("H_ICON_3")
        ScaleformLabel("H_ICON_4")
        ScaleformLabel("H_ICON_5")
        ScaleformLabel("H_ICON_6")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_BACKGROUND")
        PushScaleformMovieFunctionParameterInt(1)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(1.0)
        PushScaleformMovieFunctionParameterFloat(4.0)
        PushScaleformMovieFunctionParameterString("Meu Computador")
        PopScaleformMovieFunctionVoid()
        
        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterString("Desligar")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_LIVES")
        PushScaleformMovieFunctionParameterInt(lives)
        PushScaleformMovieFunctionParameterInt(5)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_LIVES")
        PushScaleformMovieFunctionParameterInt(lives)
        PushScaleformMovieFunctionParameterInt(5)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(0)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(1)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(2)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(3)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(4)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(5)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(6)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_COLUMN_SPEED")
        PushScaleformMovieFunctionParameterInt(7)
        PushScaleformMovieFunctionParameterInt(math.random(150,255))
        PopScaleformMovieFunctionVoid()
        

        return scaleform
    end
    scaleform = Initialize("HACKING_PC")
    while true do
        Citizen.Wait(0)
        if UsingComputer then
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            PushScaleformMovieFunction(scaleform, "SET_CURSOR")
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 239))
            PushScaleformMovieFunctionParameterFloat(GetControlNormal(0, 240))
            PopScaleformMovieFunctionVoid()
            if IsDisabledControlJustPressed(0,24) and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_SELECT")
                ClickReturn = PopScaleformMovieFunction()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 176) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_SELECT")
                ClickReturn = PopScaleformMovieFunction()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 25) and not Hacking and not SorF then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT_BACK")
                PopScaleformMovieFunctionVoid()
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 172) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(8)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 173) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(9)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 174) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(10)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
            elseif IsDisabledControlJustPressed(0, 175) and Hacking then
                PushScaleformMovieFunction(scaleform, "SET_INPUT_EVENT")
                PushScaleformMovieFunctionParameterInt(11)
                PlaySoundFrontend(-1, "HACKING_CLICK", "", true)
		    end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local kswait = 500
        if HasScaleformMovieLoaded(scaleform) and UsingComputer then
            kswait = 0
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            if GetScaleformMovieFunctionReturnBool(ClickReturn) then
                ProgramID = GetScaleformMovieFunctionReturnInt(ClickReturn)
                if ProgramID == 83 and not Hacking and Ipfinished then
                    chanceshack = 1
                    
                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(chanceshack)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()

                    PushScaleformMovieFunction(scaleform, "OPEN_APP")
                    PushScaleformMovieFunctionParameterFloat(1.0)
                    PopScaleformMovieFunctionVoid()
                    
                    PushScaleformMovieFunction(scaleform, "SET_ROULETTE_WORD")
                    PushScaleformMovieFunctionParameterString(PalavrasSenha)
                    PopScaleformMovieFunctionVoid()

                    Hacking = true
                elseif ProgramID == 82 and not Hacking and not Ipfinished then
                    chanceshack = 1

                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(chanceshack)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()

                    PushScaleformMovieFunction(scaleform, "OPEN_APP")
                    PushScaleformMovieFunctionParameterFloat(0.0)
                    PopScaleformMovieFunctionVoid()

                    Hacking = true
                elseif Hacking and ProgramID == 87 then
                    chanceshack = chanceshack - 1
                    PushScaleformMovieFunction(scaleform, "SET_LIVES")
                    PushScaleformMovieFunctionParameterInt(chanceshack)
                    PushScaleformMovieFunctionParameterInt(5)
                    PopScaleformMovieFunctionVoid()
                    PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                elseif Hacking and ProgramID == 84 then
                	Ipfinished = true
                    PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
                    PushScaleformMovieFunction(scaleform, "SET_IP_OUTCOME")
                    PushScaleformMovieFunctionParameterBool(true)
                    ScaleformLabel(0x18EBB648)
                    PopScaleformMovieFunctionVoid()
                    PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                    PopScaleformMovieFunctionVoid()
                    Hacking = false
                elseif Hacking and ProgramID == 85 then
                    PlaySoundFrontend(-1, "HACKING_CLICK_BAD", "", false)
                    PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                    PopScaleformMovieFunctionVoid()
                    Hacking = false
                    SorF = false
                elseif Hacking and ProgramID == 92 then
                    PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", "", false)
                elseif Hacking and ProgramID == 86 then
                    SorF = true
                    PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                    PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                    PushScaleformMovieFunctionParameterBool(true)
                    ScaleformLabel("WINBRUTE")
                    PopScaleformMovieFunctionVoid()
                    Wait(0)
                    PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                    PopScaleformMovieFunctionVoid()
                    Hacking = false
                    SorF = false    
                    mHacking = false
                    Ipfinished = false
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerEvent("Notify","sucesso","Hackeado com sucesso!")                                    
                    emP.checkPayment()
					DeleteObject(laptop)
					vRP._stopAnim(false)
                    UsingComputer = false
					TriggerEvent('cancelando',false)
                    Wait(1000)
                elseif ProgramID == 6 then
                    UsingComputer = false
                    SetScaleformMovieAsNoLongerNeeded(scaleform)
                    DisableControlAction(0, 24, false)
                    DisableControlAction(0, 25, false)
                    FreezeEntityPosition(PlayerPedId(), false)
                    Ipfinished = false
                    Hacking = false
                    SorF = false    
                    mHacking = false
                    TriggerEvent('cancelando',false)
                end
                
                if Hacking then
                    PushScaleformMovieFunction(scaleform, "SHOW_LIVES")
                    PushScaleformMovieFunctionParameterBool(true)
                    PopScaleformMovieFunctionVoid()
                    if chanceshack <= 0 then
                        SorF = true
                        PlaySoundFrontend(-1, "HACKING_FAILURE", "", true)
                        PushScaleformMovieFunction(scaleform, "SET_ROULETTE_OUTCOME")
                        PushScaleformMovieFunctionParameterBool(false)
                        ScaleformLabel("LOSEBRUTE")
                        PopScaleformMovieFunctionVoid()
                        Wait(300)
                        ClearPedTasks(PlayerPedId())
                        PushScaleformMovieFunction(scaleform, "CLOSE_APP")
                        PopScaleformMovieFunctionVoid()
                        SetScaleformMovieAsNoLongerNeeded(scaleform)
                        Hacking = false
                        SorF = false
                        mHacking = false
                        Ipfinished = false
                        TriggerEvent('cancelando',false)
                        TriggerEvent("Notify","aviso","Voce falhou ao tentar acessar o <b>sistema</b>.")
                        SetPedComponentVariation(PlayerPedId(),5,45,0,0)  
                        FreezeEntityPosition(PlayerPedId(),false)
                        UsingComputer = false
                        emP.MarcarOcorrencia()
						DeleteObject(laptop)
						vRP._stopAnim(false)
						TriggerEvent('cancelando',false)  
						FreezeEntityPosition(PlayerPedId(),false)
                    end
                end
            end
        else
            Wait(250)
        end
        Citizen.Wait(kswait)
    end
end)

function ScaleformLabel(label)
    BeginTextCommandScaleformString(label)
    EndTextCommandScaleformString()
end