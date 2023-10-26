local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("vrp_skips",src)
Proxy.addInterface("vrp_skips",src)

vCLIENT = Tunnel.getInterface("vrp_skips")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.getAppleWatch()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.getInventoryItemAmount(user_id, "smartwatch") > 0 then
			return true
		end
    end
end

function src.chamarHospital()
	local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
		local x,y,z = vRPclient.getPosition(source,{})
		local aceito = false

		vRP.tryGetInventoryItem(user_id,"smartwatch",1)

		local hospital = vRP.getUsersByPermission("paramedico.permissao")
		if #hospital > 0 then
			for k,v in pairs(hospital) do
				local nuser_id = vRP.getUserId(parseInt(v))
				if nuser_id then
					async(function()
						if vRP.request(parseInt(v), "Você deseja aceitar o chamado? [SMART WATCH] Cidadão ferido.", 30) then
							if not aceito then
								aceito = true
								
								TriggerClientEvent("Notify",source,"sucesso","<b>[SMART WATCH]</b> um dos medicos aceitaram seu chamado.", 1000)
								TriggerClientEvent("Notify",parseInt(v),"sucesso","Você aceitou o chamado, marcamos uma rota em seu gps.", 10000)
								vCLIENT.criarRota(parseInt(v), x,y,z)
							else
								TriggerClientEvent("Notify",parseInt(v),"negado","<b>[SMART WATCH]</b> Este chamado ja foi aceito.", 10000)
							end
						end
					end)
				end
			end

			TriggerClientEvent("Notify",source,"sucesso","<b>[SMART WATCH]</b> Detectamos que seu batimento cardiaco esta muito baixo, chamamos uma ambulancia para o local..", 10000)
		else
			TriggerClientEvent("Notify",source,"negado","<b>[SMART WATCH]</b> Não possui membros do hospital no momento.", 10000)
		end
	end
end