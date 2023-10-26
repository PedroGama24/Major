

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp = {}
Tunnel.bindInterface("emp_cacador_skips",emp)

--[ COLLECT | FUNCTION ]--------------------------------------------------------------------------------------------------------

RegisterServerEvent('emp_cacador_skips:permissao')
AddEventHandler('emp_cacador_skips:permissao',function()
	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	TriggerClientEvent('emp_cacador_skips:permissao',player)
end)


function emp.checkWeight(mochila)
	local source = source
	local user_id = vRP.getUserId(source)
	if true then
		if user_id then
			numCouro = math.random(1,2)
			numCarne = math.random(1,2)
			if vRP.computeInvWeight(user_id)+vRP.itemWeightList("couro")*numCouro+vRP.itemWeightList("carnecrua")*numCarne <= vRP.getBackpack(user_id) then
				return true
			else
				return false
			end
		end
	end
end



RegisterServerEvent('emp_cacador_skips:abaterpronto')
AddEventHandler('emp_cacador_skips:abaterpronto',function(abaterpronto)
	local source = source
	local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	if true then
	vRP.giveInventoryItem(user_id,"carnecrua",numCarne)
--	TriggerClientEvent("itensNotify",source,"sucesso","Coletou","carnecrua",numCarne,vRP.format(vRP.itemWeightList("carnecrua")*parseInt(numCarne)))

    vRP.giveInventoryItem(user_id,"couro",numCouro)
	TriggerClientEvent("Notify",source,"sucesso","Você coletou carne e couro deste animal!")
--	TriggerClientEvent("itensNotify",source,"sucesso","Coletou","couro",numCouro,vRP.format(vRP.itemWeightList("couro")*parseInt(numCouro)))
	end
end)

RegisterServerEvent('emp_cacador_skips:enviarordens')
AddEventHandler('emp_cacador_skips:enviarordens',function()
	local source = source
	local user_id = vRP.getUserId(source)

--	vRP.giveInventoryItem(user_id,"WEAPON_MUSKET",1)
--	TriggerClientEvent("Notify",source,"sucesso","Você recebeu os equipamentos, equipe eles!")
--	TriggerClientEvent("itensNotify",source,"sucesso","Coletou","WEAPON_MUSKET",1,vRP.format(vRP.itemWeightList("WEAPON_MUSKET")*parseInt(1)))
--    vRP.giveInventoryItem(user_id,"WEAPON_WINCHESTER_AMMO",20)
--	TriggerClientEvent("itensNotify",source,"sucesso","Coletou","WEAPON_WINCHESTER_AMMO",1,vRP.format(vRP.itemWeightList("WEAPON_WINCHESTER_AMMO")*parseInt(20)))
--	vRP.giveInventoryItem(user_id,"WEAPON_KNIFE",1)
--	TriggerClientEvent("itensNotify",source,"sucesso","Coletou","WEAPON_KNIFE",1,vRP.format(vRP.itemWeightList("WEAPON_KNIFE")*parseInt(1)))
	
end)

RegisterServerEvent('emp_cacador_skips:coletararmas')
AddEventHandler('emp_cacador_skips:coletararmas',function()
	local source = source
	local user_id = vRP.getUserId(source)
	vRPclient.replaceWeapons(source,{})
	vRP.tryGetInventoryItem(user_id,"WEAPON_WINCHESTER_AMMO",20)
	vRP.tryGetInventoryItem(user_id,"WEAPON_KNIFE",1)
	vRP.tryGetInventoryItem(user_id,"WEAPON_MUSKET",1)
end)

function emp.checkCrimeRecord()
	local source = source
	local user_id = vRP.getUserId(source)
		if checagemCriminal == 1 then 
			 if user_id then
			 local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
			 local tempo = json.decode(value)
				 if tempo ~= nil then
					 TriggerClientEvent("Notify",source,"negado","Não contratamos pessoas com <b>Ficha Criminal</b>.",10000)
					 return false
				 else
					 return true
				 end
			 end
		else
			return true
		end
 end

 RegisterServerEvent('emp_cacador_skips:roupa')
AddEventHandler('emp_cacador_skips:roupa', function()
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