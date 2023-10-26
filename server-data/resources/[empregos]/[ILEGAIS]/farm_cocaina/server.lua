local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("farm_cocaina",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR DROGA
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkcocaina()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.giveInventoryItem(user_id,"cocaina",3) -- ITEM QUE O PLAYER IRÁ RECEBER
        TriggerClientEvent("Notify",source,"sucesso","Você produziu <b>3 Cocainas</b>.")
    end
end

function emP.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"verdes.permissao") then -- PERMISSÃO QUE O PLAYER NECESSITA
            if vRP.computeInvWeight(parseInt(user_id)) + vRP.itemWeightList("cocaina")*3 <= vRP.getBackpack(parseInt(user_id)) then
            else
                TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
                return false
            end
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Você não tem permissão para <b>produzir cocaína</b>.")
            return false
        end
    end
end