local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("emp_lenhador_skips",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES COLETA
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function emP.Quantidade()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(3)
	end
end

function emP.checkPayment()
	emP.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("tora")*quantidade[source] <= vRP.getInventoryMaxWeight(user_id) then
			vRP.giveInventoryItem(user_id,"tora",quantidade[source])
			quantidade[source] = nil
			return true
		end
	end
end




-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES ENTREGA
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function emP.Quantidade1()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(2,4)
	end
end

function emP.checkPayment1()
	emP.Quantidade1()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,"tora",quantidade[source]) then
			vRP.giveMoney(user_id,math.random(90,120)*quantidade[source])
			quantidade[source] = nil
			return true
		else
			TriggerClientEvent("Notify",source,"aviso","Você precisa de <b>"..quantidade[source].."x Toras de Madeira</b>.")
		end
	end
end


RegisterServerEvent('emp_lenhador_skips:roupa')
AddEventHandler('emp_lenhador_skips:roupa', function()
	local source = source
	local user_id = vRP.getUserId(source)
    if user_id then
		vRP.removeCloak(source)
	end
end)

function emP.SaveIdleCustom(old_custom)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.save_idle_custom(source,old_custom)
end
