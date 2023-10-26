
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "comprar-portearmas" then
		ToggleActionMenu()
		TriggerServerEvent("comprar-portearmas")
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local tempo = 1000
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),-1112.0921630859,-830.96789550781,34.360904693604,true)
		if distance <= 5 then
			tempo = 1
			DrawMarker(21,-1112.0921630859,-830.96789550781,34.360904693604-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,0,255,50,0,0,0,1)
			if distance <= 1.1 then
				if IsControlJustPressed(0,38) then
					ToggleActionMenu()
				end
			end
		end
		Citizen.Wait(tempo)
	end
end)
