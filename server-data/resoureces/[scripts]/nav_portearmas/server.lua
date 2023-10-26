local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR PORTE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("comprar-portearmas")
AddEventHandler("comprar-portearmas",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local consulta = vRP.getUData(user_id,"vRP:arma:license")
	local resultado = json.decode(consulta) or {}
	resultado.possui = resultado.possui or 0
	if user_id then
		if resultado.possui == 1 then
			TriggerClientEvent("Notify",source,"negado","Você já possui porte de arma.")
		else
			if vRP.tryPayment(user_id,50000) then
				TriggerClientEvent("Notify", source, "sucesso","Agora Você tem Um Porte Mentalise /mporte Para Chegar Seu Porte!")
				vRP.setUData(user_id,"vRP:arma:license",json.encode({possui = 1}))
				status = true
				TriggerEvent("AMG_Logs:portearmas", source, user_id, user_id, status)
			else
				TriggerClientEvent("Notify", source, "negado","Você não tem dinheiro!")
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("porte",function(source,args) --policial consultar porte
    local source = source
	local user_id = vRP.getUserId(source)
	local nuser_id = parseInt(args[1])
	if vRP.hasPermission(user_id,"policia.permissao") then
		if args[1] == nil then
			TriggerClientEvent("Notify", source, "negado","Cidadão não localizado.")
		else
			if vRP.getUserSource(nuser_id) then
	  			local consulta = vRP.getUData(nuser_id,"vRP:arma:license")
	  			local resultado = json.decode(consulta) or {}
				resultado.possui = resultado.possui or 0
				if resultado.possui == 1 then
					TriggerClientEvent("Notify",source,"sucesso","Cidadão possui porte de armas.")
				else
					TriggerClientEvent("Notify",source,"negado","Cidadão não possui porte de armas.")
				end
			else
				TriggerClientEvent("Notify", source, "negado","Cidadão não localizado.")
			end
		end
	else
		TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
	end 
end)

RegisterCommand("rporte",function(source,args) --remover porte
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local nuser_id = parseInt(args[1])
		if vRP.getUserSource(nuser_id) then
			vRP.setUData(nuser_id,"vRP:arma:license",json.encode({possui = 0}))
			TriggerClientEvent("Notify",source,"sucesso","Porte De Arma removido do passaporte: "..parseInt(args[1]).."")
			status = false
			TriggerEvent("AMG_Logs:portearmas", source, user_id, nuser_id, status)
		else
			TriggerClientEvent("Notify", source, "negado","Cidadão não localizado.")
		end
	else    
		TriggerClientEvent("Notify",source,"negado","Você não é um polícial")
	end  
end)

RegisterCommand("mporte",function(source,args) --mostrar se você tem porte
	local source = source
	local user_id = vRP.getUserId(source)
	local consulta = vRP.getUData(user_id,"vRP:arma:license")
	local resultado = json.decode(consulta) or {}
	resultado.possui = resultado.possui or 0
	if user_id then
		if resultado.possui == 1 then
			TriggerClientEvent("Notify",source,"sucesso","Você possui porte de arma.")
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui porte de arma.")
		end
	end
end)

