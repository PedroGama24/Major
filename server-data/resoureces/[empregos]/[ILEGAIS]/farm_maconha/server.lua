local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = {}
Tunnel.bindInterface("farm_maconha",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUANTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function emP.Quantidade()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(3,3)
	end
end

function emP.Checkmaconha()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(3,3)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSÃO
-----------------------------------------------------------------------------------------------------------------------------------------

function emP.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"roxos.permissao") then -- PERMISSÃO QUE O PLAYER NECESSITA
            if vRP.computeInvWeight(parseInt(user_id)) + vRP.itemWeightList("maconha")*3 <= vRP.getBackpack(parseInt(user_id)) then
            else
                TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
                return false
            end
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Você não tem permissão para <b>produzir maconha</b>.")
            return false
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment()
	emP.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.computeInvWeight(user_id)+vRP.itemWeightList("adubo")*quantidade[source] <= vRP.getBackpack(user_id) then 
		vRP.giveInventoryItem(user_id,"maconha",quantidade[source]) -- ITEM QUE IRÁ RECEBER
		quantidade[source] = nil
		return true
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES EXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.freezy()
	local source = source
	FreezeEntityPosition(source, true)
	SetTimeout(2000,function()
		FreezeEntityPosition(source, false)
	end)
end