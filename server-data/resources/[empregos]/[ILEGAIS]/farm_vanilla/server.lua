local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("vrp_farms",func)
---------------------------------------------------------------------------------------------------------------------------------
--  VANILLA  - COLETAR LARANJAS
-----------------------------------------------------------------------------------------------------------------------------------------


RegisterServerEvent('vanillapegar')
AddEventHandler('vanillapegar', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.computeInvWeight(user_id)+vRP.itemWeightList("laranja") <= vRP.getBackpack(user_id) then
		vRP.giveInventoryItem(user_id,"laranja",1)
		TriggerClientEvent("Notify",source,"sucesso","Você pegou <b>1 Laranja</b>!")
		else
			TriggerClientEvent("Notify",source,"negado","Você não tem <b>espaço suficiente</b> no inventário!")
		return true
		end
	end
end)


RegisterServerEvent('vanillapegar2')
AddEventHandler('vanillapegar2', function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.computeInvWeight(user_id)+vRP.itemWeightList("morango") <= vRP.getBackpack(user_id) then
		vRP.giveInventoryItem(user_id,"morango",1)
		TriggerClientEvent("Notify",source,"sucesso","Você pegou <b>1 Morango</b>!")
		else
			TriggerClientEvent("Notify",source,"negado","Você não tem <b>espaço suficiente</b> no inventário!")
		return true
		end
	end
end)
