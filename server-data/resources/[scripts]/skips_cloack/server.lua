local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
mapreedev = {}
Tunnel.bindInterface(GetCurrentResourceName(),mapreedev)
cfg = module(GetCurrentResourceName(), "config")

function mapreedev.save_idle_custom(player,custom)
	local r_idle = {}
	local user_id = vRP.getUserId(player)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			if data.cloakroom_idle == nil then
				data.cloakroom_idle = custom
			end

			for k,v in pairs(data.cloakroom_idle) do
				r_idle[k] = v
			end
		end
	end
	return r_idle
end

function mapreedev.removeCloak(player)
	local user_id = vRP.getUserId(player)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			if data.cloakroom_idle ~= nil then
				vRPclient._setCustomization(player,data.cloakroom_idle)
				data.cloakroom_idle = nil
			end
		end
	end
end

function mapreedev.setPreset(org,name)
    local source = source
    local user_id = vRP.getUserId(source)
    if name ~= "remover" then
        if vRP.hasPermission(user_id, cfg.cloackroom[org][name].perm) then
            local custom = cfg.cloackroom[org][name]
            if custom then
                local old_custom = vRPclient.getCustomization(source)
				local idle_copy = {}

				idle_copy = vRP.save_idle_custom(source,old_custom)
				idle_copy.modelhash = nil

				for l,w in pairs(custom[old_custom.modelhash]) do
					idle_copy[l] = w
				end
                vRPclient._setCustomization(source,idle_copy)
            end
        else
            TriggerClientEvent("Notify", source, "negado","Você não pode colocar esta farda")
        end
    else	
		vRP.removeCloak(source)
    end
end

function mapreedev.checkPerm(org)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, cfg.cloackroom[org].perm) then
        return true
    else
        return false
    end
end