local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","CVR_OnService")

ykP = {}
Tunnel.bindInterface("vrp_emservico",ykP)

local multa = 250

local webhookadmin = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


RegisterCommand('ptr', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade = vRP.getUsersByPermission("policia.permissao")

	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(35, 142, 219,0.9) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://cdn-icons-png.flaticon.com/512/3113/3113169.png"> COPOM:<br>{0} </div>',
            args = { "Existem "..#quantidade.." PM's em Serviço no momento." }
        })
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('med', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("paramedico.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 12, 87,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://cdn-icons-png.flaticon.com/512/2869/2869655.png"> HOSPITAL:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." SAMU's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('advogado', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("advogado.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(211, 211, 211,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://cdn-icons-png.flaticon.com/512/3528/3528772.png"> ESCRITÓRIO:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." ADVOGADOS's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('taxista', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("taxista.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 162, 12,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://cdn-icons-png.flaticon.com/512/3228/3228678.png"> TAXISTAS:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." TAXISTA's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('mec', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("mecanico.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(125, 125, 125,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://cdn-icons-png.flaticon.com/512/1995/1995470.png"> MECÂNICA:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." MECÂNICOS's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('conce', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("conce.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 50, 12,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://cdn-icons-png.flaticon.com/512/560/560268.png"> CONCESSINÁRIA:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." VENDEDORES's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

RegisterCommand('burgershot', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local quantidade2 = vRP.getUsersByPermission("burgershot.permissao")
	if vRP.tryPayment(user_id,multa) then
		TriggerClientEvent('chat:addMessage', player, {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(237, 50, 12,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 18px" src="https://cdn-icons-png.flaticon.com/512/1909/1909994.png"> BURGERSHOT:<br>{0}</div>',
			args = { "Existem "..#quantidade2.." VENDEDORES's em Serviço no momento." }
		})
		TriggerClientEvent("Notify",player,"sucesso","Você pagou R$"..multa.." pela informação.")
	else 
	TriggerClientEvent("Notify",player,"negado","Você precisa ter R$"..multa.." para saber desta informação.")
end
end)

function ykP.emServico()
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)

--------------------------
--	Concessionaria
--------------------------
	if vRP.hasGroup(user_id,"Concessionaria") then
		vRP.addUserGroup(user_id,"ConcessionariaPaycheck")
		return true
	 elseif vRP.hasGroup(user_id,"DONOConcessionaria") then
		vRP.addUserGroup(user_id,"DONOConcessionariaPaycheck")
		return true
		--------------------------
---------POLICIAIS		
	elseif vRP.hasGroup(user_id,"COMANDANTE") then
		vRP.addUserGroup(user_id,"COMANDANTEPaycheck")
		TriggerEvent('eblips:add',{ name = "Comandante", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
--			["WEAPON_PISTOL_MK2"] = {ammo=90},
--			["WEAPON_SMG"] = {ammo=250},
--			["WEAPON_NIGHTSTICK"] = {ammo=1},
--			["WEAPON_STUNGUN"] = {ammo=1},
--			["WEAPON_FLASHLIGHT"] = {ammo=1}
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"SUBCOMANDANTE") then
		vRP.addUserGroup(user_id,"SUBCOMANDANTEPaycheck")
		TriggerEvent('eblips:add',{ name = "Sub Comandante", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROCAM1") then
		vRP.addUserGroup(user_id,"ROCAM1Paycheck")
		TriggerEvent('eblips:add',{ name = "ROCAM", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROCAM2") then
		vRP.addUserGroup(user_id,"ROCAM2Paycheck")
		TriggerEvent('eblips:add',{ name = "ROCAM", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROCAM3") then
		vRP.addUserGroup(user_id,"ROCAM3Paycheck")
		TriggerEvent('eblips:add',{ name = "ROCAM", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROCAM4") then
		vRP.addUserGroup(user_id,"ROCAM4Paycheck")
		TriggerEvent('eblips:add',{ name = "ROCAM", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROCAM5") then
		vRP.addUserGroup(user_id,"ROCAM5Paycheck")
		TriggerEvent('eblips:add',{ name = "ROCAM", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROCAM6") then
		vRP.addUserGroup(user_id,"ROCAM6Paycheck")
		TriggerEvent('eblips:add',{ name = "ROCAM", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROCAM7") then
		vRP.addUserGroup(user_id,"ROCAM7Paycheck")
		TriggerEvent('eblips:add',{ name = "ROCAM", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true


	elseif vRP.hasGroup(user_id,"GRPAE1") then
		vRP.addUserGroup(user_id,"GRPAE1Paycheck")
		TriggerEvent('eblips:add',{ name = "GRPAE", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"GRPAE2") then
		vRP.addUserGroup(user_id,"GRPAE2Paycheck")
		TriggerEvent('eblips:add',{ name = "GRPAE", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"GRPAE3") then
		vRP.addUserGroup(user_id,"GRPAE3Paycheck")
		TriggerEvent('eblips:add',{ name = "GRPAE", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true

	elseif vRP.hasGroup(user_id,"PMESP1") then
		vRP.addUserGroup(user_id,"PMESP1Paycheck")
		TriggerEvent('eblips:add',{ name = "PMESP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMESP2") then
		vRP.addUserGroup(user_id,"PMESP2Paycheck")
		TriggerEvent('eblips:add',{ name = "PMESP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMESP3") then
		vRP.addUserGroup(user_id,"PMESP3Paycheck")
		TriggerEvent('eblips:add',{ name = "PMESP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMESP4") then
		vRP.addUserGroup(user_id,"PMESP4Paycheck")
		TriggerEvent('eblips:add',{ name = "PMESP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMESP5") then
		vRP.addUserGroup(user_id,"PMESP5Paycheck")
		TriggerEvent('eblips:add',{ name = "PMESP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMESP6") then
		vRP.addUserGroup(user_id,"PMESP6Paycheck")
		TriggerEvent('eblips:add',{ name = "PMESP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMESP7") then
		vRP.addUserGroup(user_id,"PMESP7Paycheck")
		TriggerEvent('eblips:add',{ name = "PMESP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMESP8") then
		vRP.addUserGroup(user_id,"PMESP8Paycheck")
		TriggerEvent('eblips:add',{ name = "PMESP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PMESP9") then
		vRP.addUserGroup(user_id,"PMESP9Paycheck")
		TriggerEvent('eblips:add',{ name = "PMESP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true


	elseif vRP.hasGroup(user_id,"PC1") then
		vRP.addUserGroup(user_id,"PC1Paycheck")
		TriggerEvent('eblips:add',{ name = "PC", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PC2") then
		vRP.addUserGroup(user_id,"PC2Paycheck")
		TriggerEvent('eblips:add',{ name = "PC", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PC3") then
		vRP.addUserGroup(user_id,"PC3Paycheck")
		TriggerEvent('eblips:add',{ name = "PC", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PC4") then
		vRP.addUserGroup(user_id,"PC4Paycheck")
		TriggerEvent('eblips:add',{ name = "PC", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true

	elseif vRP.hasGroup(user_id,"PRF1") then
		vRP.addUserGroup(user_id,"PRF1Paycheck")
		TriggerEvent('eblips:add',{ name = "PRF", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PRF2") then
		vRP.addUserGroup(user_id,"PRF2Paycheck")
		TriggerEvent('eblips:add',{ name = "PRF", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PRF3") then
		vRP.addUserGroup(user_id,"PRF3Paycheck")
		TriggerEvent('eblips:add',{ name = "PRF", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"PRF4") then
		vRP.addUserGroup(user_id,"PRF4Paycheck")
		TriggerEvent('eblips:add',{ name = "PRF", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true

	elseif vRP.hasGroup(user_id,"FT1") then
		vRP.addUserGroup(user_id,"FT1Paycheck")
		TriggerEvent('eblips:add',{ name = "FT", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT2") then
		vRP.addUserGroup(user_id,"FT2Paycheck")
		TriggerEvent('eblips:add',{ name = "FT", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT3") then
		vRP.addUserGroup(user_id,"FT3Paycheck")
		TriggerEvent('eblips:add',{ name = "FT", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT4") then
		vRP.addUserGroup(user_id,"FT4Paycheck")
		TriggerEvent('eblips:add',{ name = "FT", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT5") then
		vRP.addUserGroup(user_id,"FT5Paycheck")
		TriggerEvent('eblips:add',{ name = "FT", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT6") then
		vRP.addUserGroup(user_id,"FT6Paycheck")
		TriggerEvent('eblips:add',{ name = "FT", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT7") then
		vRP.addUserGroup(user_id,"FT7Paycheck")
		TriggerEvent('eblips:add',{ name = "FT", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT8") then
		vRP.addUserGroup(user_id,"FT8Paycheck")
		TriggerEvent('eblips:add',{ name = "FT", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"FT9") then
		vRP.addUserGroup(user_id,"FT9Paycheck")
		TriggerEvent('eblips:add',{ name = "FT", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true


	elseif vRP.hasGroup(user_id,"BAEP1") then
		vRP.addUserGroup(user_id,"BAEP1Paycheck")
		TriggerEvent('eblips:add',{ name = "BAEP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP2") then
		vRP.addUserGroup(user_id,"BAEP2Paycheck")
		TriggerEvent('eblips:add',{ name = "BAEP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP3") then
		vRP.addUserGroup(user_id,"BAEP3Paycheck")
		TriggerEvent('eblips:add',{ name = "BAEP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP4") then
		vRP.addUserGroup(user_id,"BAEP4Paycheck")
		TriggerEvent('eblips:add',{ name = "BAEP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP5") then
		vRP.addUserGroup(user_id,"BAEP5Paycheck")
		TriggerEvent('eblips:add',{ name = "BAEP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP6") then
		vRP.addUserGroup(user_id,"BAEP6Paycheck")
		TriggerEvent('eblips:add',{ name = "BAEP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP7") then
		vRP.addUserGroup(user_id,"BAEP7Paycheck")
		TriggerEvent('eblips:add',{ name = "BAEP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP8") then
		vRP.addUserGroup(user_id,"BAEP8Paycheck")
		TriggerEvent('eblips:add',{ name = "BAEP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"BAEP9") then
		vRP.addUserGroup(user_id,"BAEP9Paycheck")
		TriggerEvent('eblips:add',{ name = "BAEP", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true



	elseif vRP.hasGroup(user_id,"ROTA1") then
		vRP.addUserGroup(user_id,"ROTA1Paycheck")
		TriggerEvent('eblips:add',{ name = "ROTA", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA2") then
		vRP.addUserGroup(user_id,"ROTA2Paycheck")
		TriggerEvent('eblips:add',{ name = "ROTA", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA3") then
		vRP.addUserGroup(user_id,"ROTA3Paycheck")
		TriggerEvent('eblips:add',{ name = "ROTA", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA4") then
		vRP.addUserGroup(user_id,"ROTA4Paycheck")
		TriggerEvent('eblips:add',{ name = "ROTA", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA5") then
		vRP.addUserGroup(user_id,"ROTA5Paycheck")
		TriggerEvent('eblips:add',{ name = "ROTA", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA6") then
		vRP.addUserGroup(user_id,"ROTA6Paycheck")
		TriggerEvent('eblips:add',{ name = "ROTA", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA7") then
		vRP.addUserGroup(user_id,"ROTA7Paycheck")
		TriggerEvent('eblips:add',{ name = "ROTA", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA8") then
		vRP.addUserGroup(user_id,"ROTA8Paycheck")
		TriggerEvent('eblips:add',{ name = "ROTA", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"ROTA9") then
		vRP.addUserGroup(user_id,"ROTA9Paycheck")
		TriggerEvent('eblips:add',{ name = "ROTA", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true

	elseif vRP.hasGroup(user_id,"EB1") then
		vRP.addUserGroup(user_id,"EB1Paycheck")
		TriggerEvent('eblips:add',{ name = "EB", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"EB2") then
		vRP.addUserGroup(user_id,"EB2Paycheck")
		TriggerEvent('eblips:add',{ name = "EB", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"EB3") then
		vRP.addUserGroup(user_id,"EB3Paycheck")
		TriggerEvent('eblips:add',{ name = "EB", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"EB4") then
		vRP.addUserGroup(user_id,"EB4Paycheck")
		TriggerEvent('eblips:add',{ name = "EB", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"EB5") then
		vRP.addUserGroup(user_id,"EB5Paycheck")
		TriggerEvent('eblips:add',{ name = "EB", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"EB6") then
		vRP.addUserGroup(user_id,"EB6Paycheck")
		TriggerEvent('eblips:add',{ name = "EB", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"EB7") then
		vRP.addUserGroup(user_id,"EB7Paycheck")
		TriggerEvent('eblips:add',{ name = "EB", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"EB8") then
		vRP.addUserGroup(user_id,"EB8Paycheck")
		TriggerEvent('eblips:add',{ name = "EB", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	
---------HOSPITAL	
elseif vRP.hasGroup(user_id,"Hospital1") then
	vRP.addUserGroup(user_id,"Hospital1Paycheck")
	TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
	vRPclient.giveWeapons(player,{
	},false,true)
	return true
	elseif vRP.hasGroup(user_id,"Hospital2") then
		vRP.addUserGroup(user_id,"Hospital2Paycheck")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Hospital3") then
		vRP.addUserGroup(user_id,"Hospital3Paycheck")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Hospital4") then
		vRP.addUserGroup(user_id,"Hospital4Paycheck")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Hospital5") then
		vRP.addUserGroup(user_id,"Hospital5Paycheck")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Hospital6") then
		vRP.addUserGroup(user_id,"Hospital6Paycheck")
		TriggerEvent('eblips:add',{ name = "Médico", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true

---------Bombeiros	
elseif vRP.hasGroup(user_id,"Bombeiro1") then
	vRP.addUserGroup(user_id,"Bombeiro1Paycheck")
	TriggerEvent('eblips:add',{ name = "Bombeiro", src = player, color = 47 })
	vRPclient.giveWeapons(player,{
	},false,true)
	return true
	elseif vRP.hasGroup(user_id,"Bombeiro2") then
		vRP.addUserGroup(user_id,"Bombeiro2Paycheck")
		TriggerEvent('eblips:add',{ name = "Bombeiro", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Bombeiro3") then
		vRP.addUserGroup(user_id,"Bombeiro3Paycheck")
		TriggerEvent('eblips:add',{ name = "Bombeiro", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Bombeiro4") then
		vRP.addUserGroup(user_id,"Bombeiro4Paycheck")
		TriggerEvent('eblips:add',{ name = "Bombeiro", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Bombeiro5") then
		vRP.addUserGroup(user_id,"Bombeiro5Paycheck")
		TriggerEvent('eblips:add',{ name = "Bombeiro", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
	elseif vRP.hasGroup(user_id,"Bombeiro6") then
		vRP.addUserGroup(user_id,"Bombeiro6Paycheck")
		TriggerEvent('eblips:add',{ name = "Bombeiro", src = player, color = 47 })
		vRPclient.giveWeapons(player,{
		},false,true)
		return true
---------Mecanico	
elseif vRP.hasGroup(user_id,"Mecanico1") then
	vRP.addUserGroup(user_id,"MecanicoPaycheck1")
	return true
elseif vRP.hasGroup(user_id,"Mecanico2") then
	vRP.addUserGroup(user_id,"MecanicoPaycheck2")
	return true
elseif vRP.hasGroup(user_id,"Lider-Mecanico") then
    vRP.addUserGroup(user_id,"Lider-MecanicoPaycheck")
	return true 

	---------Burgershot	
elseif vRP.hasGroup(user_id,"BurguerShot1") then
	vRP.addUserGroup(user_id,"BurguerShot1Paycheck")
	return true
elseif vRP.hasGroup(user_id,"BurguerShot2") then
	vRP.addUserGroup(user_id,"BurguerShot2Paycheck")
	return true
elseif vRP.hasGroup(user_id,"BurguerShot3") then
    vRP.addUserGroup(user_id,"BurguerShot3Paycheck")
	return true 
	
	---------Advogado	
elseif vRP.hasGroup(user_id,"Advogado") then
	vRP.addUserGroup(user_id,"AdvogadoPaycheck")
	return true
elseif vRP.hasGroup(user_id,"Juiz") then
    vRP.addUserGroup(user_id,"JuizPaycheck")
	return true 
	
	
--------Taxi
elseif vRP.hasGroup(user_id,"Taxista") then
	vRP.addUserGroup(user_id,"TaxistaPaycheck")
	return true
elseif vRP.hasGroup(user_id,"Lider-Taxista") then
    vRP.addUserGroup(user_id,"Lider-TaxistaPaycheck")
	return true 
	
	end
end

function ykP.offService()
	local source = source
	local user_id = vRP.getUserId(source)
	TriggerEvent('eblips:remove',source)

--Concessionaria
vRP.removeUserGroup(user_id,"ConcessionariaPaycheck")
vRP.removeUserGroup(user_id,"DONOConcessionariaPaycheck")
--Policia
vRP.removeUserGroup(user_id,"COMANDANTEPaycheck")
vRP.removeUserGroup(user_id,"SUBCOMANDANTEPaycheck")

vRP.removeUserGroup(user_id,"ROCAM1Paycheck")
vRP.removeUserGroup(user_id,"ROCAM2Paycheck")
vRP.removeUserGroup(user_id,"ROCAM3Paycheck")
vRP.removeUserGroup(user_id,"ROCAM4Paycheck")
vRP.removeUserGroup(user_id,"ROCAM5Paycheck")
vRP.removeUserGroup(user_id,"ROCAM6Paycheck")
vRP.removeUserGroup(user_id,"ROCAM7Paycheck")

vRP.removeUserGroup(user_id,"GRPAE1Paycheck")
vRP.removeUserGroup(user_id,"GRPAE2Paycheck")
vRP.removeUserGroup(user_id,"GRPAE3Paycheck")

vRP.removeUserGroup(user_id,"PMESP1Paycheck")
vRP.removeUserGroup(user_id,"PMESP2Paycheck")
vRP.removeUserGroup(user_id,"PMESP3Paycheck")
vRP.removeUserGroup(user_id,"PMESP4Paycheck")
vRP.removeUserGroup(user_id,"PMESP5Paycheck")
vRP.removeUserGroup(user_id,"PMESP6Paycheck")
vRP.removeUserGroup(user_id,"PMESP7Paycheck")
vRP.removeUserGroup(user_id,"PMESP8Paycheck")
vRP.removeUserGroup(user_id,"PMESP9Paycheck")

vRP.removeUserGroup(user_id,"PC1Paycheck")
vRP.removeUserGroup(user_id,"PC2Paycheck")
vRP.removeUserGroup(user_id,"PC3Paycheck")
vRP.removeUserGroup(user_id,"PC4Paycheck")

vRP.removeUserGroup(user_id,"PRF1Paycheck")
vRP.removeUserGroup(user_id,"PRF2Paycheck")
vRP.removeUserGroup(user_id,"PRF3Paycheck")
vRP.removeUserGroup(user_id,"PRF4Paycheck")

vRP.removeUserGroup(user_id,"FT1Paycheck")
vRP.removeUserGroup(user_id,"FT2Paycheck")
vRP.removeUserGroup(user_id,"FT3Paycheck")
vRP.removeUserGroup(user_id,"FT4Paycheck")
vRP.removeUserGroup(user_id,"FT5Paycheck")
vRP.removeUserGroup(user_id,"FT6Paycheck")
vRP.removeUserGroup(user_id,"FT7Paycheck")
vRP.removeUserGroup(user_id,"FT8Paycheck")
vRP.removeUserGroup(user_id,"FT9Paycheck")

vRP.removeUserGroup(user_id,"BAEP1Paycheck")
vRP.removeUserGroup(user_id,"BAEP2Paycheck")
vRP.removeUserGroup(user_id,"BAEP3Paycheck")
vRP.removeUserGroup(user_id,"BAEP4Paycheck")
vRP.removeUserGroup(user_id,"BAEP5Paycheck")
vRP.removeUserGroup(user_id,"BAEP6Paycheck")
vRP.removeUserGroup(user_id,"BAEP7Paycheck")
vRP.removeUserGroup(user_id,"BAEP8Paycheck")
vRP.removeUserGroup(user_id,"BAEP9Paycheck")

vRP.removeUserGroup(user_id,"ROTA1Paycheck")
vRP.removeUserGroup(user_id,"ROTA2Paycheck")
vRP.removeUserGroup(user_id,"ROTA3Paycheck")
vRP.removeUserGroup(user_id,"ROTA4Paycheck")
vRP.removeUserGroup(user_id,"ROTA5Paycheck")
vRP.removeUserGroup(user_id,"ROTA6Paycheck")
vRP.removeUserGroup(user_id,"ROTA7Paycheck")
vRP.removeUserGroup(user_id,"ROTA8Paycheck")
vRP.removeUserGroup(user_id,"ROTA9Paycheck")

vRP.removeUserGroup(user_id,"EB1Paycheck")
vRP.removeUserGroup(user_id,"EB2Paycheck")
vRP.removeUserGroup(user_id,"EB3Paycheck")
vRP.removeUserGroup(user_id,"EB4Paycheck")
vRP.removeUserGroup(user_id,"EB5Paycheck")
vRP.removeUserGroup(user_id,"EB6Paycheck")
vRP.removeUserGroup(user_id,"EB7Paycheck")
vRP.removeUserGroup(user_id,"EB8Paycheck")

--Hospital
vRP.removeUserGroup(user_id,"Hospital1Paycheck")
vRP.removeUserGroup(user_id,"Hospital2Paycheck")
vRP.removeUserGroup(user_id,"Hospital3Paycheck")
vRP.removeUserGroup(user_id,"Hospital4Paycheck")
vRP.removeUserGroup(user_id,"Hospital5Paycheck")
vRP.removeUserGroup(user_id,"Hospital6Paycheck")
--Bombeiros
vRP.removeUserGroup(user_id,"Bombeiro1Paycheck")
vRP.removeUserGroup(user_id,"Bombeiro2Paycheck")
vRP.removeUserGroup(user_id,"Bombeiro3Paycheck")
vRP.removeUserGroup(user_id,"Bombeiro4Paycheck")
vRP.removeUserGroup(user_id,"Bombeiro5Paycheck")
vRP.removeUserGroup(user_id,"Bombeiro6Paycheck")
--Mecanica
vRP.removeUserGroup(user_id,"Lider-MecanicoPaycheck")
vRP.removeUserGroup(user_id,"MecanicoPaycheck2")
vRP.removeUserGroup(user_id,"MecanicoPaycheck1")

vRP.removeUserGroup(user_id,"BurguerShot1Paycheck")
vRP.removeUserGroup(user_id,"BurguerShot2Paycheck")
vRP.removeUserGroup(user_id,"BurguerShot3Paycheck")

vRP.removeUserGroup(user_id,"TaxistaPaycheck")
vRP.removeUserGroup(user_id,"Lider-TaxistaPaycheck")

vRP.removeUserGroup(user_id,"AdvogadoPaycheck")
vRP.removeUserGroup(user_id,"JuizPaycheck")
end