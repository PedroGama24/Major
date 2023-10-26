local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_leiteiro_skips",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------







function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.computeInvWeight(parseInt(user_id)) + vRP.itemWeightList("garrafadeleite")*2 <= vRP.getBackpack(parseInt(user_id)) then
			if vRP.getInventoryItemAmount(user_id,"garrafavazia") >= 2 then
			TriggerClientEvent("progress",source,5000,"Ordenhando a vaca")
			vRPclient._playAnim(source,false,{{"amb@code_human_cower@female@base","base"}},true)
			SetTimeout(5000,function()
				vRPclient._stopAnim(source,false)
				vRP.tryGetInventoryItem(user_id,"garrafavazia",2)
				vRP.giveInventoryItem(user_id,"garrafadeleite",2)
				TriggerClientEvent("Notify",source,"sucesso","Você ordenhou 2 garrafas!")
			end)
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Você não tem <b>2 Garrafas vazias</b>!")
		end
		
		else
			TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
		end
		
	end
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function emP.Quantidade()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(1,5)
	end
end

function emP.checkPayment1()
	emP.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)

	local valorencomenda = math.random(70,90)
	local pagamento = valorencomenda*quantidade[source]

	if user_id then
		
		if vRP.tryGetInventoryItem(user_id,"garrafadeleite",quantidade[source]) then

			vRP.giveMoney(user_id,parseInt(pagamento))
			TriggerClientEvent("Notify",source,"sucesso","<b>Leite</b> entregue, você recebeu <b>R$"..pagamento.."</b>!")

			quantidade[source] = nil
			return true
		else
			TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>"..quantidade[source].."x Garrafas de Leite</b>.")
		end
	end
end