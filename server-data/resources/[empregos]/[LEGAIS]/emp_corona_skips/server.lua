local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
job = {}
Tunnel.bindInterface("emp_corona_skips",job)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('emp_corona_skips:permissao')
AddEventHandler('emp_corona_skips:permissao',function()
	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	TriggerClientEvent('emp_corona_skips:permissao',player)
end)

RegisterServerEvent('emp_corona_skips:receber')
AddEventHandler('emp_corona_skips:receber', function(pagamento)
	local source = source
	local user_id = vRP.getUserId(source)
    if user_id then
		vRP.giveMoney(user_id,parseInt(pagamento))
		TriggerClientEvent("vrp_sound:source",source,'dinheiro',0.3)
	end
end)

RegisterServerEvent('emp_corona_skips:roupa')
AddEventHandler('emp_corona_skips:roupa', function()
	local source = source
	local user_id = vRP.getUserId(source)
    if user_id then
		vRP.removeCloak(source)
	end
end)

function job.SaveIdleCustom(old_custom)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.save_idle_custom(source,old_custom)
end