local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
eGCLIENT = Tunnel.getInterface("sks_rotas")


eG = {}
Tunnel.bindInterface("sks_rotas",eG)

local cfg = module("sks_rotas", "config")

function eG.perm(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return vRP.hasPermission(user_id, perm)
	end
end

getInfos = function(job)
	for k,v in pairs(cfg.empregos) do
		if v.emprego == job then
			return v
		end
	end
end


function eG.checkReward(emprego)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local infos = getInfos(emprego)
		local payment = math.random(infos.minimo, infos.maximo)
		-- Verifica se 'infos.item' é uma tabela
		if type(infos.item) == "table" then
			for _, itemData in ipairs(infos.item) do
				-- Gera um numero aleatório para verificar
				local chance = math.random(1, 100)
				if chance <= itemData.dropChance then
					if vRP.getInventoryWeight(user_id) + vRP.getItemWeight(itemData.name) * payment <= vRP.getInventoryMaxWeight(user_id) then
						vRP.giveInventoryItem(user_id, itemData.name, payment)
					end
				end
			end
		else
			-- Caso 'infos.item' não seja uma tabela , trata como um único item
			if vRP.getInventoryWeight(user_id) + vRP.getItemWeight(infos.item) * payment <= vRP.getInventoryMaxWeight(user_id) then
				vRP.giveInventoryItem(user_id, infos.item, payment)
			end
		end
	end
end