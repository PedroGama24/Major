local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_pescador_skips",emP)

vTASKBAR = Tunnel.getInterface("vrp_taskbar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
local peixes = {
	[1] = { x = "dourado" },
	[2] = { x = "corvina" },
	[3] = { x = "salmao" },
	[4] = { x = "pacu" },
	[5] = { x = "pintado" },
	[6] = { x = "pirarucu" },
	[7] = { x = "tilapia" },
	[8] = { x = "tucunare" }
}

function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
	local taskResult = exports['c2n_taskbar']:getTaskBar(source,"facil","Fisgar peixe")
    if taskResult then
			if vRP.computeInvWeight(user_id)+vRP.itemWeightList("dourado") <= vRP.getBackpack(user_id) then
				if vRP.tryGetInventoryItem(user_id,"isca",1) then
					if math.random(100) >= 98 then
					else
						vRP.giveInventoryItem(user_id,peixes[math.random(8)].x,1)
						TriggerClientEvent("Notify",source,"negado","Você fisgou um peixe, verifique sua mochila!") 
					end
					return true
				else
					TriggerClientEvent("Notify",source,"negado","Acabou suas iscas, vá comprar mais!") 
				end
			else
				TriggerClientEvent("Notify",source,"negado","Sua mochila está cheia, esvazie!") 
			end
		else
			TriggerClientEvent("Notify",source,"negado","Você deixou o peixe escapar, tente novamente!") 
		end
	end
end



function emP.checkItens()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"isca") >= 1 then
			if vRP.getInventoryItemAmount(user_id,"vara") >= 1 then
				return true 
			else
				TriggerClientEvent("Notify",source,"negado","Você não possui uma vara de pesca!") 
				return false
			end
		else
			TriggerClientEvent("Notify",source,"negado","Acabou suas iscas, vá comprar mais.") 
		end
	end
end
