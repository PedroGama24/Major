----[vRP TUNNEL/PROXY]----
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
--[SURVIVAL TUNNEL/PROXY]--
Skips = {}
Skips = Tunnel.getInterface("skips_survival")
Tunnel.bindInterface("skips_survival",Skips)
Proxy.addInterface("skips_survival",Skips)
skips = module("skips_survival","skips_config")
emP = {}
Tunnel.bindInterface("ai_samu",emP)

vRP._prepare("attachs/DELETE","DELETE FROM zo_attachs WHERE user_id = @user_id")



function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- [ COMANDO PARA REVIVER ] -------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

--[[ RegisterCommand('god',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if vRP.hasPermission(user_id,skips['permgod']) then
        if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local identity2 = vRP.getUserIdentity(nuser_id)

				TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)

                vRPclient.killGod(nplayer)
				vRPclient.setHealth(nplayer,200)
				TriggerClientEvent("hud:SetShow",true,nplayer)
				TriggerClientEvent("Skips:life",nplayer)
				PerformHttpRequest(skips['loggod'], function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	------------------------------------------------------------
							title = "LOGS DE GOD:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
							url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif"
							}, 
							fields = {
								{ 
									name = "**O STAFF DE :**", 
									value = "[ *PASSAPORTE :*  **"..user_id.."** ]"
								},
								{
									name = "**APLICOU :**",
									value = "*GOD NO PASSAPORTE :*  **"..nplayer.."**"
								}
							}, 
							footer = { 
								text = "skips "..os.date("%d/%m/%Y |: %H:%M:%S"), 
								icon_url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif" 
							},
							color = 16431885 
						}
					}
				}), { ['Content-Type'] = 'application/json' })
            end
		else


			TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
			TriggerClientEvent("hud:SetShow",true,source)
            vRPclient.killGod(source)
			vRPclient.setHealth(source,200)
			TriggerClientEvent("Skips:life",source)

			PerformHttpRequest(skips['loggod'], function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	------------------------------------------------------------
						title = "LOGS DE GOD:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif"
						}, 
						fields = {
							{ 
								name = "**O STAFF :**", 
								value = "[ *PASSAPORTE :*  **"..user_id.."** ]"
							},
							{
								name = "**APLICOU :**",
								value = "**GOD EM SI MESMO**⠀"
							}
						}, 
						footer = { 
							text = "skips "..os.date("%d/%m/%Y |: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif" 
						},
						color = 16431885 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
        end
    end
end) ]]


-----------------------------------------------------------------------------------------------------------------------------------------
-- [ COMANDO PARA REVIVER ADMIN ] -------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('god',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	if vRP.hasPermission(user_id,skips['permgodadmin']) then
        if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local identity2 = vRP.getUserIdentity(nuser_id)

				TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
				TriggerClientEvent("hud:SetShow",true,nplayer)
                vRPclient.killGod(nplayer)
				vRPclient.setHealth(nplayer,200)
				TriggerClientEvent("Skips:ForceNuiOff",nplayer)
				vRP.varyThirst(nplayer,-15)
				vRP.varyHunger(nplayer,-15)
		

				PerformHttpRequest(skips['loggodadmin'], function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	------------------------------------------------------------
							title = "LOGS DE GODADMIN:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
							url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif"
							}, 
							fields = {
								{ 
									name = "**O STAFF DE :**", 
									value = "[ *PASSAPORTE :*  **"..user_id.."** ]"
								},
								{
									name = "**APLICOU :**",
									value = "*GOD NO PASSAPORTE :*  **"..nplayer.."**"
								}
							}, 
							footer = { 
								text = "skips "..os.date("%d/%m/%Y |: %H:%M:%S"), 
								icon_url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif" 
							},
							color = 16431885 
						}
					}
				}), { ['Content-Type'] = 'application/json' })
            end
		else


			TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)
			TriggerClientEvent("hud:SetShow",true,source)
            vRPclient.killGod(source)
			vRPclient.setHealth(source,200)
			vRP.varyThirst(user_id,-100)
			vRP.varyHunger(user_id,-100)
			TriggerClientEvent("Skips:ForceNuiOff",source)

			PerformHttpRequest(skips['loggodadmin'], function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	------------------------------------------------------------
						title = "LOGS DE GODADMIN:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
						url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif"
						}, 
						fields = {
							{ 
								name = "**O STAFF :**", 
								value = "[ *PASSAPORTE :*  **"..user_id.."** ]"
							},
							{
								name = "**APLICOU :**",
								value = "**GOD EM SI MESMO**⠀"
							}
						}, 
						footer = { 
							text = "skips "..os.date("%d/%m/%Y |: %H:%M:%S"), 
							icon_url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif" 
						},
						color = 16431885 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- [ COMANDO PARA REVIVER TODOS ] -------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('godall',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,skips['permgodall']) then
    	local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
				TriggerClientEvent("hud:SetShow",true,id)
		--		TriggerClientEvent("Skips:life",id)
            	TriggerClientEvent("resetBleeding",id)
            	TriggerClientEvent("resetDiagnostic",id)
            	vRPclient.killGod(id)
				vRPclient.setHealth(id,200)
            end
		end
		PerformHttpRequest(skips['loggodall'], function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	------------------------------------------------------------
					title = "LOGS DE GODALL:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
					url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif"
					}, 
					fields = {
						{ 
							name = "**O STAFF :**", 
							value = "[ *PASSAPORTE :*  **"..user_id.."** ]"
						},
						{
							name = "**APLICOU :**",
							value = "**COMANDO GODALL**⠀"
						}
					}, 
					footer = { 
						text = "skips "..os.date("%d/%m/%Y |: %H:%M:%S"), 
						icon_url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif" 
					},
					color = 16431885 
				}
			}
		}), { ['Content-Type'] = 'application/json' })
    end
end)


--[[ 
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ COMANDO /RE DO PARAMEDICO ] --------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('re',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,skips['permre']) then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		
		if nplayer then
			if vRPclient.isInComa(nplayer) then
				local identity_user = vRP.getUserIdentity(user_id)
				local nuser_id = vRP.getUserId(nplayer)
				local identity_coma = vRP.getUserIdentity(nuser_id)
				
				local set_user = "Departamento Médico"

				TriggerClientEvent('cancelando',source,true)
				vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
				TriggerClientEvent("Progrees:skipsmorte",source,30000,"reanimando")

				SetTimeout(30000,function()	
					vRPclient.killGod(nplayer)
					vRPclient._stopAnim(source,false)
					TriggerClientEvent("hud:SetShow",true,nplayer)
					TriggerClientEvent("resetBleeding",nplayer)
					TriggerClientEvent("Skips:NuiOff",nplayer)
					TriggerClientEvent('cancelando',source,false)
				end)

				PerformHttpRequest(skips['logre'], function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	------------------------------------------------------------
							title = "LOGS DE REANIMAR:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
							url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif"
							}, 
							fields = {
								{ 
									name = "**O PARAMEDICO OU POLICIAL DE :**", 
									value = "[ *PASSAPORTE :*  **"..user_id.."** ]"
								},
								{
									name = "**APLICOU :**",
									value = "*/RE NO PASSAPORTE :*  **"..nplayer.."**"
								}
							}, 
							footer = { 
								text = "skips "..os.date("%d/%m/%Y |: %H:%M:%S"), 
								icon_url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif" 
							},
							color = 16431885 
						}
					}
				}), { ['Content-Type'] = 'application/json' })
				

			else
				TriggerClientEvent("Notify",source,"importante","A pessoa precisa estar em coma para prosseguir.")
			end
		else
			TriggerClientEvent("Notify",source,"importante","Chegue mais perto do paciente.")
		end
	elseif vRP.hasPermission(user_id,skips['permpolicia']) then
		if Skips.checkServices() then
			if nplayer then
				if vRPclient.isInComa(nplayer) then
					local identity_user = vRP.getUserIdentity(user_id)
					local nuser_id = vRP.getUserId(nplayer)
					local identity_coma = vRP.getUserIdentity(nuser_id)
					
					local set_user = "Departmanto de Polícia"
	
					TriggerClientEvent('cancelando',source,true)
					vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
					TriggerClientEvent("Progrees:skipsmorte",source,30000,"reanimando")
					
					SetTimeout(30000,function()
						vRPclient.killGod(nplayer)
						vRPclient._stopAnim(source,false)
						TriggerClientEvent("hud:SetShow",true,nplayer)
						TriggerClientEvent("resetBleeding",nplayer)
						TriggerClientEvent("Skips:NuiOff",nplayer)
						TriggerClientEvent('cancelando',source,false)
					end)
					PerformHttpRequest(skips['logre'], function(err, text, headers) end, 'POST', json.encode({
						embeds = {
							{ 	------------------------------------------------------------
								title = "LOGS DE REANIMAR:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
								thumbnail = {
								url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif"
								}, 
								fields = {
									{ 
										name = "**O PARAMEDICO OU POLICIAL DE :**", 
										value = "[ *PASSAPORTE :*  **"..user_id.."** ]"
									},
									{
										name = "**APLICOU :**",
										value = "*/RE NO PASSAPORTE :*  **"..nplayer.."**"
									}
								}, 
								footer = { 
									text = "skips "..os.date("%d/%m/%Y |: %H:%M:%S"), 
									icon_url = "https://cdn.discordapp.com/attachments/1025211196632207390/1030207922065641532/death-unscreen.gif" 
								},
								color = 16431885 
							}
						}
					}), { ['Content-Type'] = 'application/json' })
				else
					TriggerClientEvent("Notify",source,"importante","A pessoa precisa estar em coma para prosseguir.")
				end
			end
		else
			TriggerClientEvent("Notify",source,"negado","Existem membros do Departamento Médico em serviço!")
		end 
	end
end) ]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- [ CHECAGEM DO TEMPO DE DESISTENCIA ] -------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

function Skips.checkTimeDesistir()
	local user_id = vRP.getUserId(source)
	local nuser_id = vRP.getUserId(nplayer)	
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		local value = vRP.getUData(parseInt(user_id),"vRP:skips_survival")
		local tempo = json.decode(value) or 0
		if tempo > 0 then
	--		print("O player "..user_id.." não pôde desistir agora "..tempo.." Restante")
		else
	--		print("O player "..user_id.." desistiu")
			return tempo
		end
	end
end

function Skips.removeAttachs()
	local user_id = vRP.getUserId(source)

	if user_id then

		Citizen.CreateThread(function()
			vRP.execute("attachs/DELETE", {
				user_id = user_id,
			})
		end)
		
	end
	
end

function Skips.timedesistencia()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local value = vRP.getUData(parseInt(user_id),"vRP:skips_survival")
		local timer = json.decode(value) or 0
		if user_id then
			return timer
		end
	end
end

-- [ SETAGEM DO TEMPO DE DESISTENCIA ] --------------------------------------------------------------------------------------------------

function Skips.SetTimeDesistir()
	local source = source
	local user_id = vRP.getUserId(source)
	vRP.setUData(parseInt(user_id),"vRP:skips_survival",json.encode(parseInt(skips['timepdeath'])))
end


-- [ DIMINUIÇÃO DO TEMPO DE DESISTENCIA ] -----------------------------------------------------------------------------------------------

function Skips.diminuirtimedesistencia()
	local source = source
	local user_id = vRP.getUserId(source)
	local value = vRP.getUData(parseInt(user_id),"vRP:skips_survival")
	local tempo = json.decode(value) or 0
	if tempo >= 1 then
		vRP.setUData(parseInt(user_id),"vRP:skips_survival",json.encode(parseInt(tempo)-1))
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- [ CHECAGEM DO ID DA PESSOA ] ---------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

function Skips.checkuserid()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return true
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FORCE GOD ] ------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

function Skips.forcegod()
	local user_id = vRP.getUserId(source)
	if user_id then
		TriggerClientEvent("resetBleeding",user_id)
        TriggerClientEvent("resetDiagnostic",user_id)
        vRPclient.killGod(user_id)
		vRPclient.setHealth(user_id,200)
	end
end


function createWeebHook(webhook,message)
	if webhook ~= "" then
		PerformHttpRequest(webhook,function(err,text,headers) end,"POST",json.encode({ content = message }),{ ['Content-Type'] = "application/json" })
	end
end



-----------------------------------------------------------------------------------------------------------------------------------------
-- [ FUTUCANDO TUMULOS ] ----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

local amount = {}
local amountMoney = {}
local pagamento = ""


--[ THREAD ]-------------------------------------------------------------------------

local timers = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timers) do
			if v > 0 then
				timers[k] = v - 1
			end
		end
	end
end)

--[ FUNCTION ]-----------------------------------------------------------------------

function Skips.amount()
	local source = source
	if amount[source] == nil then
		amount[source] = math.random(1,2)
	end
end

function skips.amountMoney()
	local source = source
	if amountMoney[source] == nil then
		amountMoney[source] = math.random(30,150)
	end
end

function Skips.futucartumulos(id)
	Skips.amount()
	Skips.amountMoney()

	local source = source
	local user_id = vRP.getUserId(source)
	local chance = math.random(1,1000)

	if user_id then
		if timers[id] == 0 or not timers[id] then
			if chance >= 985 then
				if vRP.getInventoryWeight(user_id) + vRP.getItemWeight(pagamento)*amountMoney[source] <= vRP.getInventoryMaxWeight(user_id) then
					TriggerClientEvent("skips:Anim",source)
					pagamento = "dinheiro"
					timers[id] = 600
					return true
				else
					TriggerClientEvent("Notify",source,"negado","Sua mochila está muito <b>cheia</b>.")
					return false
				end
			elseif chance >= 930 and chance <= 984 then
				if vRP.getInventoryWeight(user_id) + vRP.getItemWeight(pagamento)*amount[source] <= vRP.getInventoryMaxWeight(user_id) then
					TriggerClientEvent("skips:Anim",source)
					pagamento = skips['itemtumulo3'][math.random(3)].item
					timers[id] = 600
					return true
				else
					TriggerClientEvent("Notify",source,"negado","Sua mochila está muito <b>cheia</b>.")
					return false
				end
			elseif chance >= 850 and chance <= 929 then
				if vRP.getInventoryWeight(user_id) + vRP.getItemWeight(pagamento)*amount[source] <= vRP.getInventoryMaxWeight(user_id) then
					TriggerClientEvent("skips:Anim",source)
					pagamento = skips['itemtumulo2'][math.random(2)].item
					timers[id] = 600
					return true
				else
					TriggerClientEvent("Notify",source,"negado","Sua mochila está muito <b>cheia</b>.")
					return false
				end
			elseif chance >= 700 and chance <= 849 then
				if vRP.getInventoryWeight(user_id) + vRP.getItemWeight(pagamento)*amount[source] <= vRP.getInventoryMaxWeight(user_id) then
					TriggerClientEvent("skips:Anim",source)
					pagamento = skips['itemtumulo'][math.random(2)].item
					timers[id] = 600
					return true
				else
					TriggerClientEvent("Notify",source,"negado","Sua mochila está muito <b>cheia</b>.")
					return false
				end
			elseif chance >= 450 and chance <= 699 then
				TriggerClientEvent("skips:Anim",source)
				pagamento = "nadinha"
				timers[id] = 600	
				return true
			else
				TriggerClientEvent("skips:Anim",source)
				pagamento = ""
				timers[id] = 600
				return true
			end
		else
			TriggerClientEvent("Notify",source,"negado","Tumulo está <b>vazio</b>.")
		end
	end
end

function Skips.pagamentoporfutucartumulos()
	local source = source
	local user_id = vRP.getUserId(source)
	
	if user_id then
		if pagamento ~= "" and pagamento ~= "nadinha" then
			if pagamento == "dinheiro" then
				vRP.giveInventoryItem(user_id,pagamento,amountMoney[source])
				TriggerClientEvent("Notify",source,"sucesso","Você encontrou <b>R$"..amountMoney[source].." reais</b>.")
			else
				vRP.giveInventoryItem(user_id,pagamento,amount[source])
				TriggerClientEvent("Notify",source,"sucesso","Você encontrou <b>x"..amount[source].." "..vRP.itemNameList(pagamento).."</b>.")
			end
			amount[source] = nil
			amountMoney[source] = nil
		elseif pagamento == "nadinha" then
			TriggerClientEvent("Notify",source,"negado","Não havia nada e agora suas mãos estão cheias de Terra!")
			amount[source] = nil
			amountMoney[source] = nil
		else
			TriggerClientEvent("Notify",source,"negado","Nada por aqui ..")
			amount[source] = nil
			amountMoney[source] = nil
		end
	end
end



--[ KILLLOG ]-----------------------------------------------------------------------


function Skips.sendKillLog(death_source, weapon)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if tonumber(death_source) then
			local nuser_id = vRP.getUserId(tonumber(death_source))
			if nuser_id then
				local identity = vRP.getUserIdentity(user_id)
				local uidentity = vRP.getUserIdentity(nuser_id)
				local x,y,z = vRPclient.getPosition(source)
				local x2,y2,z2 = vRPclient.getPosition(death_source)

                SendWebhookMessage(skips['killlog'], "```\n[Nome de quem morreu]: "..identity.firstname.." ("..user_id..") \n[Nome do assassino]: "..uidentity.firstname.." ("..nuser_id..") \n[Arma usada]: "..weapon.."\n[Localização do assassino]: "..tD(x)..","..tD(y)..","..tD(z).."\n[Localização da vítima]: "..tD(x2)..","..tD(y2)..","..tD(z2).." ```")
			end
		end
	end
	return true
end

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end



function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryFullPayment(user_id, 2000) then
			TriggerClientEvent("Skips:ForceNuiOff",nplayer)
			return true
		end
	end
end





