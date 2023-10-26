------------- SCRIPT BY: Skips1234 -------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emp = {}
Tunnel.bindInterface("emp_lixeiro_skips",emp)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------

local items = { 
"bateria",
"cobre",
"plastico",
"borracha",
"vidro",
"fioeletronico",
}

function emp.GerarLixo()
	local source = source
	local user_id = vRP.getUserId(source)
	local quantidade = math.random(1,3)		
	local lixo = items[math.random(1,#items)]
	if user_id then
		if vRP.computeInvWeight(user_id)+vRP.itemWeightList(lixo) <= vRP.getBackpack(user_id) then
			vRP.giveInventoryItem(user_id,lixo,quantidade,true)
			return true
		else
			TriggerClientEvent("Notify",source,"negado","<b>Mochila</b> cheia.") 
			return false
		end
	end
end

RegisterServerEvent('emp_lixeiro_skips:roupa')
AddEventHandler('emp_lixeiro_skips:roupa', function()
	local source = source
	local user_id = vRP.getUserId(source)
    if user_id then
		vRP.removeCloak(source)
	end
end)

function emp.SaveIdleCustom(old_custom)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.save_idle_custom(source,old_custom)
end

function emp.GerarRecompensa(bonus)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local money = math.random(25000,30000)
        vRP.giveMoney(user_id,parseInt(money))
        TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>R$"..vRP.format(parseInt(money)).." reais</b>.")
    end
end