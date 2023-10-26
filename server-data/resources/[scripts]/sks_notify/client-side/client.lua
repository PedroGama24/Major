-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Notify")
AddEventHandler("Notify",function(css,mensagem,timer,position)
	if not timer or timer == "" then
		timer = 10000
	end

	SendNUIMessage({ css = css, mensagem = mensagem, timer = timer, position = position })
end)

RegisterNetEvent("NotifyAdm")
AddEventHandler("NotifyAdm",function(nomeadm,mensagem,position)
	SendNUIMessage({ css = "aviso", mensagem = ""..mensagem.."<br>Comunicado de: <b> "..nomeadm.."</b>", timer = 60000, position = "center" })
end)
