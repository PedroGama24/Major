-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("sks_nitro",func)  


function func.getNitro()
    local user_id = vRP.getUserId(source)
    if vRP.tryGetInventoryItem(user_id,"nitro",1) then
        return true
    else
        return false    
    end
end

-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->
-- DISCORD: SkipS#1234 -->