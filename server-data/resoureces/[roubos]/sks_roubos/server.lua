-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_robberys",src)
vCLIENT = Tunnel.getInterface("vrp_robberys")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbery = false
local timedown = 0
local idgens = Tools.newIDGenerator()
local blips = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookdepartamento = "ROUBOSBANCOS"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbers = {
	[1] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[2] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[3] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[4] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[5] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[6] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[7] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[8] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[9] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[10] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[11] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[12] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[13] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[14] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[15] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[16] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[17] = { ['place'] = "Lojinha", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	--====
	[18] = { ['place'] = "Banco", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[19] = { ['place'] = "Banco", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[20] = { ['place'] = "Banco", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[21] = { ['place'] = "Banco", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[22] = { ['place'] = "Banco", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
	[23] = { ['place'] = "Banco", ['seconds'] = 50, ['rewmin'] = 60000, ['rewmax'] = 100000 },
    --====
	[24] = { ['place'] = "ferrovelho", ['seconds'] = 50, ['rewmin'] = 400000, ['rewmax'] = 500000 },
	[25] = { ['place'] = "galinheiro", ['seconds'] = 50, ['rewmin'] = 400000, ['rewmax'] = 400000 },
	[26] = { ['place'] = "porto", ['seconds'] = 50, ['rewmin'] = 770000, ['rewmax'] = 1300000 },
	[27] = { ['place'] = "prefeitura", ['seconds'] = 50, ['rewmin'] = 512000, ['rewmax'] = 720000 },
	[28] = { ['place'] = "yellow", ['seconds'] = 50, ['rewmin'] = 140000, ['rewmax'] = 170000 }

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPolice()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia < 4 then 
			TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.",8000)
			return false
		elseif (os.time()-timedown) <= 60 then
			TriggerClientEvent("Notify",source,"aviso","Os cofres estão vazios, aguarde <b>"..vRP.format(parseInt((15000-(os.time()-timedown)))).." segundos</b> até que os civis efetuem depositos.",8000)
			return false
		end
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobbery(id,x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		robbery = true
		timedown = os.time()
		vRPclient._playAnim(source,false,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},false)
		vCLIENT.startRobbery(source,robbers[id].seconds,x,y,z)
		TriggerClientEvent("vrp_sound:source",source,'alarm',0.7)
		vRPclient.setStandBY(source,parseInt(600))

		local policia = vRP.getUsersByPermission("policia.permissao")
		for k,v in pairs(policia) do
			local policial = vRP.getUserSource(v)
			if policial then
				async(function()
					vCLIENT.startRobberyPolice(policial,x,y,z,robbers[id].place)
					vRPclient.playSound(policial,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
				--	blips[ids] = vRPclient.addBlip(policial,x,y,z,1,59,"Roubo em andamento",0.5,true)
					TriggerClientEvent("NotifyPush",policial,{ code = 31, title = "Roubo a " ..robbers[id].place.."", x = x, y = y, z = z, badge = "O alarme disparou, verifique o ocorrido" })

				end)
			end
		end
		SendWebhookMessage(webhookdepartamento,"```prolog\n[ID]: "..user_id.." "..identity.firstname.." "..identity.name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \n[Roubo]: Lojinha \r```")
		SetTimeout(robbers[id].seconds*1000,function()
			if robbery then
				robbery = false
				vRP.searchTimer(user_id,1800)
				vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(math.random(robbers[id].rewmin,robbers[id].rewmax)))
				for k,v in pairs(policia) do
					local policial = vRP.getUserSource(v)
					if policial then
						async(function()
							vCLIENT.stopRobberyPolice(policial)
							TriggerClientEvent('chatMessage',policial,"190",{64,64,255},"O roubo terminou, os assaltantes estão correndo antes que vocês cheguem.")
						end)
					end
				end
			end
		end)

	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.stopRobbery()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if robbery then
			robbery = false
			local policia = vRP.getUsersByPermission("policia.permissao")
			for k,v in pairs(policia) do
				local policial = vRP.getUserSource(v)
				if policial then
					async(function()
						vCLIENT.stopRobberyPolice(policial)
						TriggerClientEvent('chatMessage',policial,"190",{64,64,255},"O assaltante saiu correndo e deixou tudo para trás.")
					end)
				end
			end
		end
	end
end