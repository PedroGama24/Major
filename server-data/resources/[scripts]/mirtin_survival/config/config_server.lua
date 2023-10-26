local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("mirtin_survival",src)
Proxy.addInterface("mirtin_survival",src)

vCLIENT = Tunnel.getInterface("mirtin_survival")
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
cfg = {}

cfg.license = "" -- não mexa aqui ( isso server para updates exclusivos )
cfg.weebhook = "" -- WEEBHOOK
cfg.logo = "https://media.discordapp.net/attachments/969257137127690240/970327158276898826/PERFIL_AMSTERDAM.gif" -- IMAGEM DO WEEBHOOK
cfg.color = 6356736 -- COR DO WEEBHOOK

src.limparConta = function() -- FUNÇÃO QUE VEM DO CONFIG.CLIENT PARA EXECUTAR FUNÇÕES DIRETAS
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.clearInventory(user_id)
        TriggerEvent("clearInventory", user_id)
        -- FOME E SEDE NO MÁXIMO AO MORRER
		vRP.varyThirst(user_id,-100)
        vRP.varyHunger(user_id,-100)
    end
end

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

src.sendInfos = function()
    local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
	    local inventario = {}
        if data and data.inventory then
            local itens = ''
            for k,v in pairs(data.inventory) do
                if vRP.itemBodyList(k) then
                    itens = itens..''..vRP.itemIndexList(k)..' x'..parseInt(v.amount)..'\n'
                end
            end
            SendWebhookMessage('',"```prolog\n[ID]: "..user_id.." \n[INVENTÁRIO]: "..itens.." "..os.date("\n[MORREU AS]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
	end
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local webhooksocorro = "https://discord.com/api/webhooks/978496575619887144/6N3zUa5Qu7tOdFQ-ctSFbJ7hVejqNxC2aPo8cgYiC2aRfwKPQG437E4eTxTiyUiuqllb"

RegisterCommand('socorro',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	medicos = vRP.getUsersByPermission("paramedico.permissao")
	valor = 30000

    local timeLeft = vCLIENT.getTimeLeft(source)
    if timeLeft <= 100 then
        if #medicos == 0 then
            if vRPclient.isInComa(source) then
                if vRP.tryFullPayment(user_id,parseInt(valor)) then
                    vRPclient.killGod(source)
                    vRPclient.setHealth(source,140)
                    -- FOME E SEDE NO MÁXIMO AO DAR /SOCRRO
                    vRP.varyThirst(user_id,-100)
                    vRP.varyHunger(user_id,-100)
                    TriggerClientEvent("resetBleeding",source)
                    TriggerClientEvent("resetDiagnostic",source)
                    TriggerClientEvent("Notify",source,"sucesso","Você pagou <b>R$ "..vRP.format(parseInt(valor)).."</b> pelo socorro divino",10000)
                    
                    local identity = vRP.getUserIdentity(user_id)
                    SendWebhookMessage(webhooksocorro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[USOU SOCORRO] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                else
                    TriggerClientEvent("Notify",source,"importante","Você não possui dinheiro suficiente. R$ "..vRP.format(parseInt(valor)).."",10000)
                end
            else
                TriggerClientEvent("Notify",source,"importante","Você não está em coma.",10000)
            end
        else
            TriggerClientEvent("Notify",source,"importante","Você não pode utilizar o /socorro com médicos em serviço.",10000)
        end
    else
        TriggerClientEvent("Notify",source,"importante","Aguarde, até últimos 60 segundos de vida para dar o /socorro.",10000)
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LOG DEATH
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local weebhookitens = "https://discord.com/api/webhooks/978496677755379763/Omgs72NMxYLhUU8ZLFYCyufW-A5YKAcDM0SkQT8K7EX_bZ7MgsL2fmHk6fPNVxkwj5lD"

src.sendItensDeath = function()
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if user_id then
        local format = ""
        local data = vRP.getUserDataTable(user_id)

        for k,v in pairs(data.inventory) do
            format = format.. "Item: "..k.." Quantidade: "..v.amount.."\n"
        end

        SendWebhookMessage(weebhookitens,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."\n[ITENS]:\n"..format.." \n[DATA] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
    end
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE DISCONNECT
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerDropped", function(reason)
    local source = source
    local coords = GetEntityCoords(GetPlayerPed(source))
    local user_id = vRP.getUserId(source)
    if user_id then
        -- TriggerClientEvent("anticl", -1, user_id, coords, reason )
    end
end)