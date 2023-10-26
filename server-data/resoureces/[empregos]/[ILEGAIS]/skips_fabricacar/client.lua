local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local processo = false
local segundos = 0


--[[ Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local Codenadas = GetEntityCoords(GetPlayerPed(-1))
		local Distancia = GetDistanceBetweenCoords(Codenadas.x,Codenadas.y,Codenadas.z, 2354.7309570313,3135.8442382813,48.2087059021, true)
		if Distancia < 15.0 then
			Opacidade = math.floor(255 - (Distancia * 7))
			DrawMarker(27, 2354.7309570313,3135.8442382813,47.2087059021, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0, 255, 255, 255, Opacidade, 0, 0, 0, 0)
			Texto3D(2354.7309570313,3135.8442382813,48.2087059021,"Pressione ~b~[E]~w~ Para coletar as ~r~peças", Opacidade)
		    if Distancia < 1.5 and IsControlPressed(1, Keys["E"]) then
				if not processo then
					processo = true    
					segundos = 5
					TriggerServerEvent("cpecas", source)		
				else
					ShowNotification("Aguarde: ~b~"..segundos.." Segundos ~w~Para clicar novamente")			
				end
			end
		end
	end
end) ]]

Citizen.CreateThread(function()
	while true do
		local skips = 1000
		local Codenadas = GetEntityCoords(GetPlayerPed(-1))
		local Distancia = GetDistanceBetweenCoords(Codenadas.x,Codenadas.y,Codenadas.z, 730.06256103516,-1072.0891113281,21.168779373169, true)
		if Distancia < 10.0 then
			Opacidade = math.floor(255 - (Distancia * 7))
			skips = 1
			DrawMarker(27, 730.06256103516,-1072.0891113281,21.268779373169, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0, 255, 255, 255, Opacidade, 0, 0, 0, 0)
			skips = 1
			Texto3D(730.06256103516,-1072.0891113281,22.168779373169,"Pressione ~b~[E]~w~ Para montar seu ~g~Veiculo", Opacidade)
		    if Distancia < 1.5 and IsControlPressed(1, Keys["E"]) then		
				TriggerServerEvent("carro", source)									
			end
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
            end
        end
    end
end)

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

function Texto3D(x,y,z, text, Opacidade)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.54, 0.54)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, Opacidade)
        SetTextDropshadow(0, 0, 0, 0, Opacidade)
        SetTextEdge(2, 0, 0, 0, 50)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end






