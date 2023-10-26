Functions = {}

-- (PT) Método de pagamento para compra da casa
-- (EN) Payment method for house buy
function Functions.buyMethod(user_id, houseName, price)
	return vRP.tryPayment(user_id, price)
end

-- (PT) Método de pagamento para taxa da casa
-- (EN) Payment method for house tax
function Functions.payTaxMethod(user_id, houseName, price)
	return vRP.tryPayment(user_id, price)
end

-- (PT) Método de pagamento para upgrade do baú
-- (EN) Payment method for chest upgrade
function Functions.upgradeChestMethod(user_id, houseName, price)
	return vRP.tryPayment(user_id, price)
end

-- (PT) Método de pagamento para venda da casa
-- (EN) Payment method for house sell
function Functions.sellMethod(user_id, houseName, value)
	vRP.giveBankMoney(user_id, value)
end

-- (PT) Qualquer verificação que deverá ser feita antes do jogador entrar na residência. Se for retornado FALSE, a entrada será negada.
-- (EN) Any verification that must be made before the player enters the residence. If false, the entry is denied.
function Functions.houseEnterChecks(user_id, houseName, source, isInvading)
	return not vRP.searchReturn(source, user_id)
end

-- (PT) Método de pagamento para venda da casa
-- (EN) Payment method for house sell
function Functions.warnSteal(robberSource, robberID, x, y, z, houseName, policePermission, enteringHouse)
	for _, policeID in pairs(vRP.getUsersByPermission(policePermission)) do
		local policeSource = vRP.getUserSource(policeID)
		local blip = vRPclient.addBlip(policeSource, x, y, z, 374, 44, "~y~Roubo: ~w~Residência", 0.5, true)
		vRPclient.playSound(policeSource, "Oneshot_Final", "MP_MISSION_COUNTDOWN_SOUNDSET")
		TriggerClientEvent('chatMessage', policeSource, "190", {64, 64, 255}, "Um alarme silencioso da residência ^1" .. houseName .. " ^0foi acionado. Verifique o ocorrido!")
		SetTimeout(60000, function()
			vRPclient.removeBlip(policeSource, blip)
		end)
	end
end

function Functions.requestConfirmation(source, text, time)
	return vRP.request(source, text, time)
end

function Functions.barbershopPlayer(source, user_id)
	TriggerEvent("dpn_barber:setPedServer", source)
end

function Functions.playAnim(a, t, b)
	vRP.playAnim(a, {t}, b)
end

function Functions.getItemName(item)
	local itemName = vRP.itemNameList(item)
	if not itemName then
		print("Erro ao encontrar o nome do item", item, itemName)
	end
	return itemName
end

function Functions.onLogoutInHouse(source, user_id, houseName)
	local userData = vRP.getUserDataTable(user_id)
	userData.position = {
		x = Config.houseList[houseName].entrada.x,
		y = Config.houseList[houseName].entrada.y,
		z = Config.houseList[houseName].entrada.z,
	}
	Wait(5000)
	vRP.setUData(user_id, "vRP:datatable", json.encode(userData))
end

function Functions.drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end