local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local webhookadmin = "COLOQUE O LINK AQUI"

--------------------------------------------------------------------------------------------------------------------------------
-- [ PLAYERS ONLINE ] --
--------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('players',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local users = vRP.getUsers()
        local players = ""
        local quantidade = 0
        for k,v in pairs(users) do
            if k ~= #users then
                players = players..", "
            end
            players = players..k
            quantidade = quantidade + 1
        end
        TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{255,160,0},quantidade)
        TriggerClientEvent('chatMessage',source,"ID's ONLINE",{255,160,0},players)
    end
end)


RegisterCommand('uncuff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"admin.permissao") then
			TriggerClientEvent("admcuff",source)
		end
	end
end)

-- SKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('skin',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if parseInt(args[1]) then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                TriggerClientEvent("skinmenu",nplayer,args[2])
				
				vRPclient.setHealth(nplayer,400)
                TriggerClientEvent("Notify",source,"sucesso","Voce setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.")
            end
        end
    end
end)
--------------------------------------------------------------------------------------------------------------------------------
-- bvida
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ RegisterCommand('bvida',function(source,rawCommand)
    local user_id = vRP.getUserId(source)
        vRPclient._setCustomization(source,vRPclient.getCustomization(source))
        vRP.removeCloak(source)
end) ]]

RegisterCommand("allcmds", function(source,args,rawCommand)
    local commands = GetRegisteredCommands()
    local allCmds = {}
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        for _,command in pairs(commands) do
            if IsAceAllowed(('command.%s'):format(command.name)) and command.name ~= 'toggleChat' then
            table.insert(allCmds, command["name"])
            end
        end
        allCmds = table.concat(allCmds, ", ")
        vRP.prompt(source,"TODOS OS COMANDOS:", allCmds)
        print(allCmds)
    end
end)

RegisterCommand("allcmds2", function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        TriggerClientEvent('allCmds',source)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ RENOMEAR ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('renomear',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "god.permissao") then
        local idjogador = vRP.prompt(source, "Qual id do jogador?", "")
        local nome = vRP.prompt(source, "Novo nome", "")
        local firstname = vRP.prompt(source, "Novo sobrenome", "")
        local idade = vRP.prompt(source, "Nova idade", "")
        local identity = vRP.getUserIdentity(parseInt(user_id))
        vRP.execute("vRP/update_user_identity",{
            user_id = idjogador,
            firstname = firstname,
            name = nome,
            age = idade,
            registration = identity.registration,
            phone = identity.phone
        })
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MUDAR COR DO CARRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('carcolor',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local vehicle = vRPclient.getNearestVehicle(source,7)
        if vehicle then
            local rgb = vRP.prompt(source,"RGB Color(255 255 255):","")
            rgb = sanitizeString(rgb,"\"[]{}+=?!_()#@%/\\|,.",false)
            local r,g,b = table.unpack(splitString(rgb," "))

            local oficialid = vRP.getUserIdentity(user_id)

            PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE COMANDO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
						}, 
						fields = {
							{ 
								name = "**COMANDO UTILIZADO:**", 
								value = " `/carcolor` "
							},
							{ 
								name = "**QUEM UTILIZOU?:**", 
								value = "`[ID]: "..user_id.." | "..oficialid.name.." "..oficialid.firstname.." `"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
						},
						color = 0225500 
					}
				}
            }), { ['Content-Type'] = 'application/json' })

            TriggerClientEvent('vcolorv',source,vehicle,tonumber(r),tonumber(g),tonumber(b))
            TriggerClientEvent('Notify',source,"sucesso","Cor Alterada")
        end
    end
end) 

function SendWebhookMessage(webhook,message)
    if webhook ~= "none" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEVEH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteveh")
AddEventHandler("trydeleteveh",function(index)
	TriggerClientEvent("syncdeleteveh",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEPED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteped")
AddEventHandler("trydeleteped",function(index)
	TriggerClientEvent("syncdeleteped",-1,index)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPARINV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(
    "limparinv",
    function(source, args, rawCommand)
        local user_id = vRP.getUserId(source)
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id, "god.permissao") then
            local tuser_id = tonumber(args[1])
            local tplayer = vRP.getUserSource(tonumber(tuser_id))
            local tplayerID = vRP.getUserId(tonumber(tplayer))
            if tplayerID ~= nil then
                local ndata = vRP.getUserDataTable(tplayerID)
                if ndata ~= nil then
                    if ndata.inventory ~= nil then
                        for k, v in pairs(ndata.inventory) do
                            if v.item == "dinheiro" or v.item == "identidade" then
                            else
                                vRP.tryGetInventoryItem(tplayerID, v.item, v.amount)
                            end
                        end
                    end
                end
                local identity = vRP.getUserIdentity(tplayerID)
                TriggerClientEvent("Notify",source,"sucesso","Limpou inventario do <id>" .. identity.name .. " " .. identity.firstname .. "</b>.")
            else
                TriggerClientEvent("Notify", source, "negado", "O usuário não foi encontrado ou está offline.")
            end
        end
    end
)



RegisterCommand('hash',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"god.permissao") then
		TriggerClientEvent('vehash',source)
	end
end)


RegisterCommand('status',function(source,args,rawCommand)
    local onlinePlayers = GetNumPlayerIndices()
    local policia = vRP.getUsersByPermission("policia.permissao")
    local paramedico = vRP.getUsersByPermission("paramedico.permissao")
    local mec = vRP.getUsersByPermission("mecanico.permissao")
    local staff = vRP.getUsersByPermission("ticket.permissao")
    local user_id = vRP.getUserId(source)        
	TriggerClientEvent("Notify",source,"importante",
	"<bold><b>Jogadores</b>: <b>"..onlinePlayers..
	"<br>Suporte</b>: <b>"..#staff..
	"<br>Policiais</b>: <b>"..#policia..
	"<br>Paramédicos</b>: <b>"..#paramedico..
	"<br>Mecânicos</b>:  <b>"..#mec..
	"</b></bold>.",9000)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REVIVER TODOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteped")
RegisterCommand('reviveall', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local rusers = vRP.getUsers()
        for k,v in pairs(rusers) do
            local rsource = vRP.getUserSource(k)
            vRPclient.setHealth(rsource, 400)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PUXAR TODOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpall', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    local x,y,z = vRPclient.getPosition(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local rusers = vRP.getUsers()
        for k,v in pairs(rusers) do
            local rsource = vRP.getUserSource(k)
            if rsource ~= source then
                vRPclient.teleport(rsource,x,y,z)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEOBJ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteobj")
AddEventHandler("trydeleteobj",function(index)
	TriggerClientEvent("syncdeleteobj",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"fix.permissao") then
        local vehicle = vRPclient.getNearestVehicle(source,7)
        local oficialid = vRP.getUserIdentity(user_id)
        PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
            embeds = {
                { 
                    title = "REGISTRO DE COMANDO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    thumbnail = {
                    url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
                    }, 
                    fields = {
                        { 
                            name = "**COMANDO UTILIZADO:**", 
                            value = " `/fix` "
                        },
                        { 
                            name = "**QUEM UTILIZOU?:**", 
                            value = "`[ID]: "..user_id.." | "..oficialid.name.." "..oficialid.firstname.." `"
                        }
                    }, 
                    footer = { 
                        text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
                        icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
                    },
                    color = 0225500 
                }
            }
        }), { ['Content-Type'] = 'application/json' })
		if vehicle then
            TriggerClientEvent('reparar',source,vehicle)
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limparea',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent("syncarea",-1,x,y,z)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VER VEICULOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uservehs',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"god.permissao") then
        	local nuser_id = parseInt(args[1])
            if nuser_id > 0 then 
                local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(nuser_id) })
                local car_names = {}
                for k,v in pairs(vehicle) do
                	table.insert(car_names, "<b>" .. vRP.vehicleName(v.vehicle) .. "</b>")
                end
                car_names = table.concat(car_names, ", ")
                local identity = vRP.getUserIdentity(nuser_id)
                TriggerClientEvent("Notify",source,"importante","Veículos de <b>"..identity.name.." " .. identity.firstname.. " ("..#vehicle..")</b>: "..car_names,10000)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ GOD ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ RegisterCommand('god',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local cargo = ""

    if vRP.hasPermission(user_id,"god.permissao") then
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
			local nuser_id = vRP.getUserId(nplayer)
			local identitynu = vRP.getUserIdentity(nuser_id)
            if nplayer then
           --     vRPclient.killGod(nplayer)
				vRPclient.setHealth(nplayer,200)
                TriggerClientEvent("resetBleeding",nplayer)
				TriggerClientEvent("resetDiagnostic",nplayer)
				vRP.varyThirst(nplayer,-15)
				vRP.varyHunger(nplayer,-15)
				--PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({embeds = {{ title = "REGISTRO DE COMANDO /GOD:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",thumbnail = {url = "https://cdn.discordapp.com/attachments/740912067095035955/757142616054824970/fivembrasil.png"}, fields = {{ name = "**Quem usou o comando:**", value = "` "..identity.name.." "..identity.firstname.." ` "},{ name = "**Nº do Passaporte:**", value = "` "..user_id.." ` "},{ name = "**Cargo na equipe:**", value = "` "..cargo.." ` "},{ name = "**Reviveu o jogador:**", value = "` "..identitynu.name.." "..identitynu.firstname.." ` "},{ name = "**Nº do Passaporte:**", value = "` "..nuser_id.." ` "},}, footer = { text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), icon_url = "https://cdn.discordapp.com/attachments/740912067095035955/757142616054824970/fivembrasil.png" },color = 15914080 }}}), { ['Content-Type'] = 'application/json' })
            end
        else
  --          vRPclient.killGod(source)
			vRPclient.setHealth(source,200)
			vRP.varyThirst(user_id,-100)
			vRP.varyHunger(user_id,-100)
            TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
		--	PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({embeds = {{ title = "REGISTRO DE COMANDO /GOD:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",thumbnail = {url = "https://cdn.discordapp.com/attachments/740912067095035955/757142616054824970/fivembrasil.png"}, fields = {{ name = "**Quem usou o comando:**", value = "` "..identity.name.." "..identity.firstname.." ` "},{ name = "**Nº do Passaporte:**", value = "` "..user_id.." ` "},{ name = "**Cargo na equipe:**", value = "` "..cargo.." ` "},}, footer = { text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), icon_url = "https://cdn.discordapp.com/attachments/740912067095035955/757142616054824970/fivembrasil.png" },color = 15914080 }}}), { ['Content-Type'] = 'application/json' })
        end
    end
end) ]]


-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('debug',function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"fundador.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
            TriggerClientEvent("ToggleDebug",player)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GASOLINA CHEIA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('100fuel',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"god.permissao") then
			TriggerClientEvent("100fuel",source)
		end	
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOQUE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('estoque',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            vRP.execute("creative/set_estoque",{ vehicle = args[1], quantidade = args[2] })
            TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o carro <b>"..args[1].."</b>.") 
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('addcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserId(parseInt(args[2]))
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/add_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) }) 
            vRP.execute("creative/set_ipva",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) })
            TriggerClientEvent("Notify",source,"sucesso","Voce adicionou o veículo <b>"..args[1].."</b> para o Passaporte: <b>"..parseInt(args[2]).."</b>.") 

            SendWebhookMessage(webhookadmin,"```\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ADICIONOU]: "..args[1].." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 


        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('remcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserId(parseInt(args[2]))
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            vRP.execute("creative/rem_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time())  }) 
            TriggerClientEvent("Notify",source,"sucesso","Voce removeu o veículo <b>"..args[1].."</b> do Passaporte: <b>"..parseInt(args[2]).."</b>.") 
            SendWebhookMessage(webhookadmin,"```\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[REMOVEU]: "..args[1].." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
--RegisterCommand('hash',function(source,args,rawCommand)
--	local user_id = vRP.getUserId(source)
--	if vRP.hasPermission(user_id,"admin.permissao") then
--		local vehicle = vRPclient.getNearestVehicle(source,7)
--		if vehicle then
--			TriggerClientEvent('vehash',source,vehicle)
--		end
--	end
--end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tuning',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
        if vehicle then
            local oficialid = vRP.getUserIdentity(user_id)
			PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE COMANDO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
						}, 
						fields = {
							{ 
								name = "**COMANDO UTILIZADO:**", 
								value = " `/tuning` "
							},
							{ 
								name = "**QUEM UTILIZOU?:**", 
								value = "`[ID]: "..user_id.." | "..oficialid.name.." "..oficialid.firstname.." `"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
						},
						color = 0225500 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
			TriggerClientEvent('vehtuning',source,vehicle)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('wl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"wl.permissao") then
		if args[1] then
			vRP.setWhitelisted(parseInt(args[1]),true)
            TriggerClientEvent("Notify",source,"sucesso","Voce aprovou o passaporte <b>"..args[1].."</b> na whitelist.")
			
			local idwhite = parseInt(args[1])

			PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE WHITELIST:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
						}, 
						fields = {
							{ 
								name = "**Quem adicionou:**", 
								value = "` "..identity.name.." "..identity.firstname.." ` "
							},
							{ 
								name = "**Nº de Passaporte:**", 
								value = "` "..user_id.." ` "
							},
							{ 
								name = "**ID adicionado a Whitelist:**", 
								value = "` "..idwhite.." ` "
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
						},
						color = 0225500 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unwl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"wl.permissao") then
		if args[1] then
            vRP.setWhitelisted(parseInt(args[1]),false)
            TriggerClientEvent("Notify",source,"sucesso","Voce retirou o passaporte <b>"..args[1].."</b> da whitelist.")
            local idwhite = parseInt(args[1])

			PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE WHITELIST:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
						}, 
						fields = {
							{ 
								name = "**Quem removeu:**", 
								value = "` "..identity.name.." "..identity.firstname.." ` "
							},
							{ 
								name = "**Nº de Passaporte:**", 
								value = "` "..user_id.." ` "
							},
							{ 
								name = "**ID removido da Whitelist:**", 
								value = "` "..idwhite.." ` "
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
						},
						color = 0225500 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kick',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"kick.permissao") then
		if args[1] then
			local id = vRP.getUserSource(parseInt(args[1]))
			if id then
                vRP.kick(id,"Você foi expulso da cidade.")
				TriggerClientEvent("Notify",source,"sucesso","Voce kickou o passaporte <b>"..args[1].."</b> da cidade.")
				
				local kikado = parseInt(args[1])

				PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 
							title = "REGISTRO DE KICKS:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
							thumbnail = {
							url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
							}, 
							fields = {
								{ 
									name = "**Quem kickou:**", 
									value = "` "..identity.name.." "..identity.firstname.." ` "
								},
								{ 
									name = "**Nº de Passaporte:**", 
									value = "` "..user_id.." ` "
								},
								{ 
									name = "**ID que foi kickado:**", 
									value = "` "..kikado.." ` "
								}
							}, 
							footer = { 
								text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
								icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
							},
							color = 0225500 
						}
					}
				}), { ['Content-Type'] = 'application/json' })

			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ban',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"ban.permissao") then
        if args[1] then
            local id = vRP.getUserSource(parseInt(args[1]))
            local t_user_id = vRP.getUserSource(parseInt(args[1]))

			vRP.setBanned(parseInt(args[1]),true)
			vRP.kick(t_user_id,"Você foi banido! [ Mais informações em: discord.gg/Bp6ZMsS ]")
			TriggerClientEvent("Notify",source,"sucesso","Voce baniu o passaporte <b>"..args[1].."</b> da cidade.")

			PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE BANIMENTO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
						}, 
						fields = {
							{ 
								name = "**QUEM FOI BANIDO:**", 
								value = "` ["..t_user_id.."] `"
							},
							{ 
								name = "**QUEM BANIU:**", 
								value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
						},
						color = 0225500 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('unban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"unban.permissao") then
		if args[1] then
            vRP.setBanned(parseInt(args[1]),false)
            TriggerClientEvent("Notify",source,"sucesso","Voce desbaniu o passaporte <b>"..args[1].."</b> da cidade.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MONEY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('money',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"money.permissao") then
		if args[1] then
            vRP.giveMoney(user_id,parseInt(args[1]))

            local idwhite = parseInt(args[1])
            
            PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE MONEY:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
						}, 
						fields = {
							{ 
								name = "**QUANTO FOI SPAWNADO:**", 
								value = " `"..idwhite.."` "
							},
							{ 
								name = "**QUEM SPAWNOU:**", 
								value = "` "..identity.name.." "..identity.firstname.." ["..user_id.."] `"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
						},
						color = 0225500 
					}
				}
            }), { ['Content-Type'] = 'application/json' })
            
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('nc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"noclip.permissao") then
		vRPclient.toggleNoclip(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpcds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"tp.permissao") then
		local fcoords = vRP.prompt(source,"Cordenadas:","")
		if fcoords == "" then
			return
		end
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
			table.insert(coords,parseInt(coord))
		end
		vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
--[ COORDENADAS ]-------------------------------
------------------------------------------------
RegisterCommand('cds',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local x,y,z = vRPclient.getPosition(source)
        heading = GetEntityHeading(GetPlayerPed(-1))
        vRP.prompt(source,"Cordenadas:","['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z))
    end
end)

RegisterCommand('cds2',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local x,y,z = vRPclient.getPosition(source)
        vRP.prompt(source,"Cordenadas:",tD(x)..", "..tD(y)..", "..tD(z))
    end
end)

RegisterCommand('cds3',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local x,y,z = vRPclient.getPosition(source)
        vRP.prompt(source,"Cordenadas:","{name='ATM', id=277, x="..tD(x)..", y="..tD(y)..", z="..tD(z).."},")
    end
end)

RegisterCommand('cds4',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local x,y,z = vRPclient.getPosition(source)
        vRP.prompt(source,"Cordenadas:","x = "..tD(x)..", y = "..tD(y)..", z = "..tD(z))
    end
end)


function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('group',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao")  or vRP.hasPermission(user_id,"leif.permissao")  or vRP.hasPermission(user_id,"mod.permissao") then
		if args[1] and args[2] then
			vRP.addUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Voce setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.")
            

            PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE SETAGEM:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
						}, 
						fields = {
							{ 
								name = "**QUEM FOI SETADO?:**", 
								value = " `[ID]: "..args[1].." | [GRUPO]: "..args[2].."` "
							},
							{ 
								name = "**QUEM SETOU?:**", 
								value = "`[ID]: "..user_id.." | "..identity.name.." "..identity.firstname.." `"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
						},
						color = 0225500 
					}
				}
            }), { ['Content-Type'] = 'application/json' })

		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ungroup',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao")  or vRP.hasPermission(user_id,"leif.permissao")  or vRP.hasPermission(user_id,"mod.permissao") then
		if args[1] and args[2] then
			vRP.removeUserGroup(parseInt(args[1]),args[2])
            TriggerClientEvent("Notify",source,"sucesso","Voce removeu o passaporte <b>"..parseInt(args[1]).."</b> do grupo <b>"..args[2].."</b>.")
            
            PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE SETAGEM:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
						}, 
						fields = {
							{ 
								name = "**DE QUEM FOI RETIRADO A SETAGEM?:**", 
								value = " `[ID]: "..args[1].." | [GRUPO]: "..args[2].."` "
							},
							{ 
								name = "**QUEM RETIROU?:**", 
								value = "`[ID]: "..user_id.." | "..identity.name.." "..identity.firstname.." `"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
						},
						color = 0225500 
					}
				}
            }), { ['Content-Type'] = 'application/json' })

		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tptome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"tp.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local x,y,z = vRPclient.getPosition(source)
			if tplayer then
				vRPclient.teleport(tplayer,x,y,z)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"tp.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then
				vRPclient.teleport(source,vRPclient.getPosition(tplayer))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpway',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"tp.permissao") then
		TriggerClientEvent('tptoway',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"owner.permissao") or vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			TriggerClientEvent('spawnarveiculo',source,args[1])
            
            PerformHttpRequest(webhookadmin, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE CARROS:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png"
						}, 
						fields = {
							{ 
								name = "**QUE VEICULO FOI SPAWNADO?:**", 
								value = " `"..(args[1]).."` "
							},
							{ 
								name = "**QUEM SPAWNOU?:**", 
								value = "`[ID]: "..user_id.." | "..identity.name.." "..identity.firstname.." `"
							}
						}, 
						footer = { 
							text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/646940778664427520/733569720909037618/FIVEM_BRASIL_PNG.png" 
						},
						color = 0225500 
					}
				}
            }), { ['Content-Type'] = 'application/json' })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('delnpcs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent('delnpcs',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MSG ADM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local cargo = ""
	if user_id then
		if vRP.hasPermission(user_id,"god.permissao") then
			local mensagem = vRP.prompt(source,"Mensagem:","")
			local nome = vRP.prompt(source,"Nome:","")
			if mensagem == "" or nome == "" then
				return
			end
			PerformHttpRequest(logAdmin, function(err, text, headers) end, 'POST', json.encode({embeds = {{ title = "REGISTRO DE COMANDO /ADM:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",thumbnail = {url = "https://cdn.discordapp.com/attachments/740912067095035955/757142616054824970/fivembrasil.png"}, fields = {{ name = "**Nome informado:**", value = "` "..nome.." ` "},{ name = "**Mensagem:**", value = "` "..mensagem.." ` "},{ name = "**Membro que enviou:**", value = "` "..identity.name.." "..identity.firstname.." ` "},{ name = "**Nº do Passaporte:**", value = "` "..user_id.." ` "},{ name = "**Cargo na equipe:**", value = "` "..cargo.." ` "}}, footer = { text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), icon_url = "https://cdn.discordapp.com/attachments/740912067095035955/757142616054824970/fivembrasil.png" },color = 15914080 }}}), { ['Content-Type'] = 'application/json' })
			TriggerClientEvent("Notify",-1,"aviso",mensagem.."<br><b>Mensagem enviada por:</b> "..nome,100000)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Ver roupas
-----------------------------------------------------------------------------------------------------------------------------------------


local player_customs = {}

RegisterCommand('vroupas',function(source,args,rawCommand)
    local custom = vRPclient.getCustomization(source)
    if player_customs[source] then -- hide
      player_customs[source] = nil
      vRPclient._removeDiv(source,"customization")
    else -- show
      local content = ""
    for k,v in pairs(custom) do
        content = content..k.." => "..json.encode(v).."<br />" 
      end
        player_customs[source] = true
      vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content)
 end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- EMERGENCYBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local system = {}

RegisterServerEvent("eblips:add")
AddEventHandler("eblips:add", function(person)
	system[person.src] = person
	for k,v in pairs(system) do
		TriggerClientEvent("eblips:updateAll",k,system)
	end
	TriggerClientEvent("eblips:toggle",person.src,true)
end)

RegisterServerEvent("eblips:remove")
AddEventHandler("eblips:remove",function(src)
	system[src] = nil
	for k,v in pairs(system) do
		TriggerClientEvent("eblips:remove",tonumber(k),src)
	end
	TriggerClientEvent("eblips:toggle",src,false)
end)

AddEventHandler("playerDropped",function()
	if system[source] then
		system[source] = nil
	end
end)