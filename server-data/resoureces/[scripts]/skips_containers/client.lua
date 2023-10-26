-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
eG = Tunnel.getInterface("skips_containers")
local cFG = module("skips_containers","box_config")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local open = false
function ToggleActionMenu(tela)
    if tela == 'box' then
        if open == false then
            open = true
            SetNuiFocus(true,true)
            SendNUIMessage({type='openBox', rewards = cFG.box,coins = eG.checkCoins(), winers = GlobalState.winers, configImg = GlobalState.imagesIP, config = cFG.geral})
            StartScreenEffect("MenuMGSelectionIn", 0, true)
        else
            open = false
            SetNuiFocus(false,false)
            SetCursorLocation(0.5,0.5)
            SendNUIMessage({type = "closeBox"})
            StopScreenEffect("MenuMGSelectionIn")
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- box
-----------------------------------------------------------------------------------------------------------------------------------------
-- CASO QUEIRA REMOVER O COMANDO /containers COMENTE ESSA FUNÇÃO ABAIXO.
RegisterCommand('containers', function()
    if eG.checkPermissao() then
        ToggleActionMenu('box')
    end
end) 


-- COORDENADAS DO BLIP
local CoordenadaX =  -93.47  --  -93.47, -2462.47, 6.03
local CoordenadaY = -2462.47
local CoordenadaZ =  6.03

Citizen.CreateThread(function()
	while true do
		local skips = 1000
		local ped = PlayerPedId()

			if not IsPedInAnyVehicle(ped) then
				local x,y,z = table.unpack(GetEntityCoords(ped))
				if Vdist(x,y,z,CoordenadaX,CoordenadaY,CoordenadaZ) <= 10 then
					skips = 4
				--	DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.4, 0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)

                    DrawMarker(27,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 200, 0,150,0,0,0,1)
                     DrawMarker(21,CoordenadaX,CoordenadaY,CoordenadaZ-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 200, 0,155,0,0,0,1)

                     if Vdist(x,y,z,CoordenadaX,CoordenadaY,CoordenadaZ) <= 1.2 then
                        skips = 4
						if IsControlJustPressed(1,38) then
                            ToggleActionMenu('box')
						end
                    end
				end
			end

		Citizen.Wait(skips)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BoxClick
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("BoxClick", function(data, cb)
    if data.action == "closeNui" then
        ToggleActionMenu('box')
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendRewards
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('sendRewards', function(data, cb)
    local recompensas, raridades = eG.openBox(data.qtd)
    cb({recompensas = recompensas, raridades = raridades})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- sendRewards
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread( function()
        if not LocalPlayer.state.onlineTime then
            LocalPlayer.state:set('onlineTime', 0, true)
        end
        Citizen.Wait(60*1000)
        while true do
            local tempoOnline = LocalPlayer.state.onlineTime + 1
            LocalPlayer.state:set('onlineTime', tempoOnline, true)
            if tempoOnline % cFG.addCoinTime == 0 then
                eG.addCoin()
            end
            Citizen.Wait(60*1000)
        end
end)