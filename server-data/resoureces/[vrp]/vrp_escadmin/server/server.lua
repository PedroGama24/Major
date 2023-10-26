local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_escadmin")

local cfg = module("vrp", "cfg/groups")
local groups = cfg.groups


removeGroups = { -- GRUPOS A SEREM REMOVIDOS
    "admin",
    "mod",
    "sup",
    "aprovadorwl",
}

RegisterNetEvent('vrp_escadmin:buscarGrupos')
AddEventHandler('vrp_escadmin:buscarGrupos',function(id)
    local user_id = vRP.getUserId(source)
    local playerId = tonumber(id)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local ssgrupo = {}
        local ppgrupo = {}
        for s_grupos, k in pairs(groups) do
            if s_grupos ~= (removeGroups[1]) and s_grupos ~= (removeGroups[2]) and s_grupos ~= (removeGroups[3])and s_grupos ~= (removeGroups[4]) then
                table.insert(ssgrupo, s_grupos)
            end
        end


        p_grupos = vRP.getUserGroups(playerId)
        for x, y in pairs(p_grupos) do
            if x ~= "user" then table.insert(ppgrupo, x) end
        end

        table.sort(ppgrupo)
        table.sort(ssgrupo)

        TriggerClientEvent("vrp_escadmin:abrirAdminG", source, ssgrupo, ppgrupo, playerId)
    end
end)

RegisterNetEvent('vrp_escadmin:aceito')
AddEventHandler('vrp_escadmin:aceito',function(grupos, playerId)
    local player = tonumber(playerId)

    p_grupos = vRP.getUserGroups(player)
    for x, y in pairs(p_grupos) do
            if x ~= "user" then
                vRP.removeUserGroup(player, x)
            end
        --print(x)
    end

    for a,b in pairs(grupos) do
        vRP.addUserGroup(player,b)
    end
end)

-- RegisterCommand("limpar", function(source, args)
--     TriggerClientEvent('vrp_escconcessionaria:limpar',-1)
-- end)
