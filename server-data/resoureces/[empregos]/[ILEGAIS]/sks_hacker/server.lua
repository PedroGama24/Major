local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

emP = {}
Tunnel.bindInterface("sks_hacker",emP)
local idgens = Tools.newIDGenerator()
local porcentagem = 0
local itemname = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function emP.Quantidade()
	local source = source
	if quantidade[source] == nil then
	   quantidade[source] = math.random(1,2)	
	end
end


function emP.checkPayment()
	emP.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then

		porcentagem = math.random(100)
		if porcentagem <= 70 then -- 70%
			itemname = "cartao1"
		elseif porcentagem >= 40 and porcentagem <= 60 then  -- 20%
			itemname = "cartao2"
		elseif porcentagem >= 20 and porcentagem <= 35 then -- 15%
			itemname = "cartao3"
		elseif porcentagem >= 10 and porcentagem <= 17 then -- 7%
			itemname = "cartao4"
		end
	end


	if vRP.computeInvWeight(user_id)+vRP.itemWeightList(itemname) <= vRP.getBackpack(user_id) then
		vRP.giveInventoryItem(user_id,itemname,quantidade[source])
		TriggerClientEvent("Notify",source,"sucesso","Você hackeou o sistema com sucesso!",8000)
		quantidade[source] = nil
		emP.Quantidade()
		return true
	else
		TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.") 
		return false
	end
end

--vRP.tryGetInventoryItem(user_id,"roupas",1)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkTimers()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.computeInvWeight(user_id)+vRP.itemWeightList("cartao") <= vRP.getBackpack(user_id) then
		if vRP.getInventoryItemAmount(user_id,"notebook") >= 1 then
			if vRP.getInventoryItemAmount(user_id,"cartao") >= 1 then
						if vRP.tryGetInventoryItem(user_id,"cartao",1) then
	
							return true
						end
			else
				TriggerClientEvent("Notify",source,"negado","Você precisa de um <b>Cartão Limpo</b>.")
			end
		else
			TriggerClientEvent("Notify",source,"negado","Você não tem um <b>Notebook</b> na mochila.")
		end
	else
		TriggerClientEvent("Notify",source,"negado","Espaço insuficiente na mochila.")
	end
end




function emP.checkPolice()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia >= 0 then
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Não há policiais suficientes em serviço.") 
			return false
		end
	end
end

local blips = {}
function emP.MarcarOcorrencia()
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
		local soldado = vRP.getUsersByPermission("policia.permissao")
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player then
				async(function()
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,153,84,"Ocorrência",0.5,false)
					vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
					TriggerClientEvent('chatMessage',player,"911",{64,64,255},"Recebemos a denuncia de um hacker, verifique o ocorrido.")
					SetTimeout(15000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK TIMER
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.setSearch()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.searchTimer(user_id,parseInt(300))
	end
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSAO
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"anonymous.permissao")
end