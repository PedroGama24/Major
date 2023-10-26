-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
eG = {}
Tunnel.bindInterface("nxgroup-box",eG)
local cFG = module("nxgroup-box","box_config")
local scFG = module("nxgroup-box","sv_config")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end 
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUERYES
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("EG/updateTime", "UPDATE "..scFG.prepare.tabelaTempoOn.." SET tempoTotal = tempoTotal + @time WHERE id = @id")

vRP.prepare("EG/getWiners", "SELECT * FROM nxgroup_box WHERE "..scFG.prepare.rewardShow.." ORDER BY id DESC limit 10")
vRP.prepare("EG/insertWiner", "INSERT INTO nxgroup_box(user_id,nome,sobrenome,reward,raridade) VALUES(@user_id,@nome,@sobrenome,@reward,@raridade)")
vRP.prepare("EG/getCoins", "SELECT coins FROM "..scFG.prepare.tabelaCoins.." WHERE id = @user_id")
vRP.prepare("EG/removeCoins", "UPDATE "..scFG.prepare.tabelaCoins.." SET coins = coins - @preco WHERE id = @user_id")
vRP.prepare("EG/addCoins", "UPDATE "..scFG.prepare.tabelaCoins.." SET coins = coins + @coins WHERE id = @user_id")
vRP.prepare("EG/getCar", "SELECT * FROM "..scFG.prepare.tabelaVeiculos.." WHERE vehicle = @vehicle AND user_id = @user_id")
vRP.prepare("EG/add_vehicleBox","INSERT IGNORE INTO "..scFG.prepare.tabelaVeiculos.."(user_id,vehicle) VALUES(@user_id,@vehicle)")

vRP.prepare("EG/alterTableMoney","ALTER TABLE "..scFG.prepare.tabelaCoins.." ADD COLUMN IF NOT EXISTS coins INT DEFAULT '0'")
vRP.prepare("EG/alterTableUserIdentities","ALTER TABLE "..scFG.prepare.tabelaTempoOn.." ADD COLUMN IF NOT EXISTS tempoTotal INT DEFAULT '0'")
vRP.prepare("EG/createTable","CREATE TABLE IF NOT EXISTS `nxgroup_box` (`id` int(11) NOT NULL AUTO_INCREMENT,`user_id` int(11) DEFAULT NULL,`nome` varchar(50) DEFAULT NULL,`sobrenome` varchar(50) DEFAULT NULL,`reward` varchar(50) DEFAULT NULL,`raridade` varchar(50) DEFAULT NULL, `hora` varchar(50) DEFAULT curtime(),`data` varchar(50) DEFAULT curdate(),PRIMARY KEY (`id`)) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;")
-----------------------------------------------------------------------------------------------------------------------------------------
-- tempoOnline
-----------------------------------------------------------------------------------------------------------------------------------------
local tempoOnline = {}
AddEventHandler('vRP:playerSpawn', function(user_id, source)
    local user_id = user_id
    if user_id then
        if tempoOnline[user_id] then
            Player(source).state.onlineTime = tempoOnline[user_id]
		else
			Player(source).state.onlineTime = 0
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- addCoin
-----------------------------------------------------------------------------------------------------------------------------------------
function eG.addCoin()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.execute("EG/addCoins", {coins = 1, user_id = user_id})
		TriggerClientEvent("Notify",source,"sucesso","Você ficou 1 hora online na cidade, e foi recompensado com <b>"..cFG.geral.name.."</b>.")
		TriggerClientEvent("Notify",source,"sucesso","Para tentar a sorte com elas, utilize o comando <b>/box</b>.")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- playerDropped
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerDropped",function(reason)
	local source = source
	local user_id = vRP.getUserId(source)
	local timeOn = 0
	if user_id then
		if not tempoOnline[user_id] then
			timeOn = Player(source).state.onlineTime
		else
			if tempoOnline[user_id] > 0 then
				if Player(source).state.onlineTime == nil then 
					Player(source).state.onlineTime = 0
				end 
				timeOn = Player(source).state.onlineTime - tempoOnline[user_id]
			end
		end
		tempoOnline[user_id] = Player(source).state.onlineTime
		
		if timeOn then
			vRP.execute("EG/updateTime", {time = timeOn, id = user_id})
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- comandoTempoOnline
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(scFG.comandoTempoOnline, function(source)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("Notify",source,"sucesso","Você está online na cidade há <b>"..Player(source).state.onlineTime.." minutos</b>.")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- comandoAddCoins
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(scFG.comandoAddCoins, function(source,args)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, scFG.permComandoAddCoins) then
		if args[1] then
			if args[2] then
				vRP.execute("EG/addCoins", {coins = args[2], user_id = args[1]})
				TriggerClientEvent("Notify",source,"sucesso","COINS ADICIONADAS.")
				SendWebhookMessage(scFG.webhookAddCoins,"```lua\n[ID]: "..user_id.." \n[ADICIONOU]: "..args[2].." COINS \n[PARA O ID]: "..args[1].."```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Images
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() 
	vRP.execute("EG/createTable")
	vRP.execute("EG/alterTableMoney")
	vRP.execute("EG/alterTableUserIdentities")
	GlobalState.imagesIP = scFG.imagesIP 
	getWinners()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- getWinners
-----------------------------------------------------------------------------------------------------------------------------------------
function getWinners()
	if scFG.execute then
		local winers = vRP.execute("EG/getWiners")
		GlobalState.winers = winers
	else
		local winers = vRP.query("EG/getWiners")
		GlobalState.winers = winers
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- allCoins
-----------------------------------------------------------------------------------------------------------------------------------------
local allCoins = {}
function eG.checkCoins()
	local source = source
	local user_id = vRP.getUserId(source)
	
	if scFG.execute then
		local coins = vRP.execute("EG/getCoins", { user_id = user_id})
		allCoins[user_id] = coins[1].coins
	else
		local coins = vRP.query("EG/getCoins", { user_id = user_id})
		allCoins[user_id] = coins[1].coins
	end
	
	return allCoins[user_id]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- openBox
-----------------------------------------------------------------------------------------------------------------------------------------
function eG.openBox(qtd)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local recebeu = 0
	local recompensas = {}
	local raridades = {}
	local cor = {}
	local qtdInicial = qtd
	local precoCoins = scFG.precoBox

	if qtd > 2 then
		precoCoins = scFG.precoPromoBox
	end

	if allCoins[user_id] >= precoCoins * qtd then
		while qtd > 0 do
			local luck = math.random(1, 100)
			
			if luck <= scFG.chanceLendario then
				raridades[qtd] = "Lendario"
				cor[qtd] = {255, 100, 0}
			elseif luck <= scFG.chanceEpico then
				raridades[qtd] = "Epico"
				cor[qtd] = {100, 0, 120}
			elseif luck <= scFG.chanceRaro then
				raridades[qtd] = "Raro"
				cor[qtd] = {0, 150, 255}
			elseif luck <= scFG.chanceNormal then 
				raridades[qtd] = "Normal"
				cor[qtd] = {0, 255, 0}
			elseif luck <= scFG.chanceComum then
				raridades[qtd] = "Comum"
				cor[qtd] = {100,100,100}
			end

			for k,v in pairs(cFG.box[1].categorias) do 
				if v.raridade == raridades[qtd] then 
					recompensas[qtd] = v.items[math.random(1,#v.items)]
					if recompensas[qtd].type == "carro" then 
						
						if scFG.execute then
							local hasCar = vRP.execute("EG/getCar", { vehicle = recompensas[qtd].item, user_id = user_id})
							if hasCar[1] then
								recebeu = 0
							else
								vRP.execute("EG/add_vehicleBox",{ user_id = user_id,  vehicle = recompensas[qtd].item}) 
								recebeu = 1
							end
						else
							local hasCar = vRP.query("EG/getCar", { vehicle = recompensas[qtd].item, user_id = user_id})
							if hasCar[1] then
								recebeu = 0
							else
								vRP.execute("EG/add_vehicleBox",{ user_id = user_id,  vehicle = recompensas[qtd].item}) 
								recebeu = 1
							end
						end
					elseif recompensas[qtd].type == "item" then
						vRP.giveInventoryItem(user_id,recompensas[qtd].item,recompensas[qtd].qtd)
						recebeu = 1
					elseif recompensas[qtd].type == "arma" then
						vRP.giveInventoryItem(user_id,recompensas[qtd].spawn,recompensas[qtd].qtd)
						recebeu = 1
					elseif recompensas[qtd].type == "dinheiro" then
						vRP.giveBankMoney(user_id,parseInt(recompensas[qtd].qtd))
						recebeu = 1
					end

					if recebeu == 1 then
						if qtdInicial == 1 then
							allCoins[user_id] = allCoins[user_id] - scFG.precoBox
							vRP.execute("EG/removeCoins", {preco = scFG.precoBox, user_id = user_id})
							vRP.execute("EG/insertWiner", {user_id = user_id, nome = identity.name, sobrenome = identity.firstname, reward = recompensas[qtd].itemName, raridade = raridades[qtd] })
						else
							allCoins[user_id] = allCoins[user_id] - scFG.precoPromoBox
							vRP.execute("EG/removeCoins", {preco = scFG.precoPromoBox, user_id = user_id})
							vRP.execute("EG/insertWiner", {user_id = user_id, nome = identity.name, sobrenome = identity.firstname, reward = recompensas[qtd].itemName, raridade = raridades[qtd] })
						end
					end
				end
			end
			TriggerClientEvent('chatMessage',-1,"/BOX",cor[qtd],identity.name..' '..identity.firstname..' ^2ganhou: ^0'..recompensas[qtd].itemName..'')
			qtd = qtd - 1
		end
		getWinners()
		return recompensas, raridades
	else
		TriggerClientEvent("Notify",source,"negado","Você não tem coins suficientes.")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- comandoComprar
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(scFG.comandoComprar, function(source)
	local user_id = vRP.getUserId(source)
	if scFG.venderInGame then
		if vRP.tryFullPayment(user_id,parseInt(scFG.precoBoxInGame)) then 
			vRP.execute("EG/addCoins", {coins = 25, user_id = user_id})
			TriggerClientEvent("Notify",source,"sucesso","Você comprou 25 coins.")
			SendWebhookMessage(scFG.webhookBuyInGame,"```prolog[ID]: "..user_id.." COMPROU UMA BOX```")
		else
			TriggerClientEvent("Notify",source,"negado","Você não tem $"..scFG.precoBoxInGame.." para comprar 25 coins.")
		end
	end
end)