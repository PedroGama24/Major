local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emp = {}
Tunnel.bindInterface("entrega_drogas",emp) 
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES META
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('entrega_metafetamina:permissao')
AddEventHandler('entrega_metafetamina:permissao',function()
	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	if vRP.hasPermission(user_id,"amarelos.permissao") then 
	    TriggerClientEvent('entrega_metafetamina:permissao', player)
	end
end)

RegisterServerEvent('entrega_metafetamina:itensReceber')
AddEventHandler('entrega_metafetamina:itensReceber', function(quantidademeta)
	local src = source
	local user_id = vRP.getUserId(src)
    local pagamentometa = math.random(300,350)
    if user_id then
    --    local new_weight = vRP.computeInvWeight(user_id)+vRP.itemWeightList("dinheirosujo")*pagamentometa*quantidademeta
      --  if new_weight <= vRP.getBackpack(user_id) then
            if vRP.tryGetInventoryItem(user_id,"ziplockmeta",quantidademeta,true) then
                vRPclient._playAnim(src,true,{{"mp_common","givetake1_a",1}},false)
				vRP.giveInventoryItem(user_id,"dinheirosujo",pagamentometa*quantidademeta,false)
                local typemessage = "sucesso"
                TriggerClientEvent("Notify",src,"sucesso","Você recebeu R$"..pagamentometa*quantidademeta..".",5000)
                SetTimeout(5000,function()
                    vRPclient.removeDiv(src, "Alerta")
                end)
                quantidademeta = nil
            else
                TriggerClientEvent("Notify",src,"sucesso","Você não tem a quantidade necessária de droga no ziplock para a entrega.",5000)
            end
    --    end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES COCA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('entrega_coca:permissao')
AddEventHandler('entrega_coca:permissao',function()
	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	if vRP.hasPermission(user_id,"verdes.permissao") then 
	    TriggerClientEvent('entrega_coca:permissao', player)
	end
end)

RegisterServerEvent('entrega_coca:itensReceber')
AddEventHandler('entrega_coca:itensReceber', function(quantidadecoca)
	local src = source
	local user_id = vRP.getUserId(src)
    local pagamentococa = math.random(300,350)  
    if user_id then
   --     local new_weight = vRP.computeInvWeight(user_id)+vRP.itemWeightList("dinheirosujo")*pagamentococa*quantidadecoca
     --   if new_weight <= vRP.getBackpack(user_id) then
            if vRP.tryGetInventoryItem(user_id,"ziplockcocaina",quantidadecoca,true) then
                vRPclient._playAnim(src,true,{{"mp_common","givetake1_a",1}},false)
				vRP.giveInventoryItem(user_id,"dinheirosujo",pagamentococa*quantidadecoca,false)
                local typemessage = "sucesso"
                 TriggerClientEvent("Notify",src,"sucesso","Você recebeu R$"..pagamentococa*quantidadecoca..".",5000)
                SetTimeout(5000,function()
                    vRPclient.removeDiv(src, "Alerta")
                end)
                quantidadecoca = nil
            else
                TriggerClientEvent("Notify",src,"sucesso","Você não tem a quantidade necessária de droga no ziplock para a entrega.",5000)
            end
     --   end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES MACONHA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('entrega_maconha:permissao')
AddEventHandler('entrega_maconha:permissao',function()
	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
    if vRP.hasPermission(user_id,"roxos.permissao") then
	    TriggerClientEvent('entrega_maconha:permissao', player)
	end
end)

RegisterServerEvent('entrega_maconha:itensReceber')
AddEventHandler('entrega_maconha:itensReceber', function(quantidademaconha)
	local src = source
	local user_id = vRP.getUserId(src)
    local pagamentomaconha = math.random(300,350)
    if user_id then
  --      local new_weight = vRP.computeInvWeight(user_id)+vRP.itemWeightList("dinheirosujo")*pagamentomaconha*quantidademaconha
    --    if new_weight <= vRP.getBackpack(user_id) then
            if vRP.tryGetInventoryItem(user_id,"ziplockmaconha",quantidademaconha,true) then
                vRPclient._playAnim(src,true,{{"mp_common","givetake1_a",1}},false)
				vRP.giveInventoryItem(user_id,"dinheirosujo",pagamentomaconha*quantidademaconha,false)
                local typemessage = "sucesso"
                TriggerClientEvent("Notify",src,"sucesso","Você recebeu R$"..pagamentomaconha*quantidademaconha..".",5000)
                SetTimeout(5000,function()
                    vRPclient.removeDiv(src, "Alerta")
                end)
                quantidademaconha = nil
            else
                TriggerClientEvent("Notify",src,"sucesso","Você não tem a quantidade necessária de droga no ziplock para a entrega.",5000)
            
            end
    --    end
	end
end)
