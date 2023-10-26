
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
----------------------------------------------------------------------------------------------------------------------------------
--[ CONEXÃO ]---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
oC = {}
Tunnel.bindInterface("sks_gps",oC)
----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playersSpawn",function(user_id,source,first_spawn)
	local source = source
    local user_id = vRP.getUserId(source)
    
	if user_id then
        TriggerClientEvent("sks_gps:coords", source)
	end
end)

RegisterCommand('atualizarmapa',function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    
    TriggerClientEvent("sks_gps:coords", source)
end)
----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------

function oC.farc()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"farc.permissao") then
        return true
    end
end


function oC.amarelos()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"amarelos.permissao") then
        return true
    end
end

function oC.verdes()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"verdes.permissao") then
        return true
    end
end


function oC.anoynmous()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"anoynmous.permissao") then
        return true
    end
end

function oC.roxos()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"roxos.permissao") then
        return true
    end
end

function oC.bratva()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"bratva.permissao") then
        return true
    end
end

function oC.cartel()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"cartel.permissao") then
        return true
    end
end

function oC.soa()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"soa.permissao") then
        return true
    end
end

function oC.thelost()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"thelost.permissao") then
        return true
    end
end


function oC.driftking()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"driftking.permissao") then
        return true
    end
end


function oC.vanilla()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"vanilla.permissao") then
        return true
    end
end

function oC.casino()
    local source = source
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"casino.permissao") then
        return true
    end
end
