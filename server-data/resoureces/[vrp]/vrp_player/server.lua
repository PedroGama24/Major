local discord_webhook = "link WEBHOOK"

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()

-----------------------------------------------------------------------------------------------------------------------------------------
--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_player",src)
vCLIENT = Tunnel.getInterface("vrp_player")

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- USER VEHS [ADMIN]
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('uservehs',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"admin.permissao") then
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
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('item',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] and vRP.itemNameList(args[1]) ~= nil then
            vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))
			TriggerEvent('logs:ToDiscord', discord_webhook , "ABUSER", "```ADM "..user_id.." pegou o item: "..args[1].." Quantidade: "..args[2].."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ENVIAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('enviar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	local identity = vRP.getUserIdentity(user_id)
  	local identitynu = vRP.getUserIdentity(nuser_id)

	if nuser_id and parseInt(args[1]) > 0 then
		if vRP.tryPayment(user_id,parseInt(args[1])) then
			vRP.giveMoney(nuser_id,parseInt(args[1]))
			vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",source,"sucesso","Enviou <b>R$"..vRP.format(parseInt(args[1])).." reais</b>.",8000)
			vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
			TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>R$"..vRP.format(parseInt(args[1])).." reais</b>.",8000)
			SendWebhookMessage(webhookenviardinheiro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[ENVIOU]: $"..vRP.format(parseInt(args[1])).." \n[PARA O ID]: "..nuser_id.." "..identitynu.name.." "..identitynu.firstname.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		else
			TriggerClientEvent("Notify",source,"negado","Não tem a quantia que deseja enviar.",8000)
		end
	end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- ID PROXIMO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('idp',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.nearestPlayer(source,10)
	if nplayer then
		local nuser_id = vRP.getUserId(nplayer)
        TriggerClientEvent("Notify",source,"importante","Jogador próximo: <b>ID:"..nuser_id.."</b>.")
    else
        TriggerClientEvent("Notify",source,"aviso","<b>Nenhum Jogador Próximo</b>")
    end
end)

-- RegisterCommand('roubar',function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	local nplayer = vRPclient.getNearestPlayer(source,2)
-- 	if nplayer then
-- 		local nuser_id = vRP.getUserId(nplayer)
-- 		local policia = vRP.getUsersByPermission("policia.permissao")
-- 		if not vRP.hasPermission(user_id,"garmas.permissao") then
-- 			if vRP.request(nplayer,"Você está sendo roubado, deseja passar tudo?",30) then
-- 				local vida = vRPclient.getHealth(nplayer)
-- 				if vida <= 100 then
-- 					TriggerClientEvent('cancelando',source,true)
-- 					vRPclient._playAnim(source,false,{{"amb@medic@standing@kneel@idle_a","idle_a"}},true)
-- 					TriggerClientEvent("progress",source,30000,"roubando")
-- 					SetTimeout(30000,function()
-- 						local ndata = vRP.getUserDataTable(nuser_id)
-- 						if ndata ~= nil then
-- 							if ndata.inventory ~= nil then
-- 								for k,v in pairs(ndata.inventory) do
-- 									if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
-- 										if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
-- 											vRP.giveInventoryItem(user_id,v.item,v.amount)
-- 										end
-- 									else
-- 										TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome.."</b> por causa do peso.")
-- 									end
-- 								end
-- 							end
-- 						end
-- 						local weapons = vRPclient.replaceWeapons(nplayer,{})
-- 						for k,v in pairs(weapons) do
-- 							vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
-- 							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
-- 								if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
-- 									vRP.giveInventoryItem(user_id,"wbody|"..k,1)
-- 								end
-- 							else
-- 								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..itemlist["wbody"..k].nome.."</b> por causa do peso.")
-- 							end
-- 							if v.ammo > 0 then
-- 								vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
-- 								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
-- 									if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
-- 										vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
-- 									end
-- 								else
-- 									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..itemlist["wammo|"..k].nome.."</b> por causa do peso.")
-- 								end
-- 							end
-- 						end
-- 						local nmoney = vRP.getMoney(nuser_id)
-- 						if vRP.tryPayment(nuser_id,nmoney) then
-- 							vRP.giveMoney(user_id,nmoney)
-- 						end
-- 						vRPclient.setStandBY(source,parseInt(600))
-- 						vRPclient._stopAnim(source,false)
-- 						TriggerClientEvent('cancelando',source,false)
-- 						TriggerClientEvent("Notify",source,"importante","Roubo concluido com sucesso.")
-- 						TriggerEvent('logs:ToDiscord', discord_webhook1 , "ROUBO", "```Player "..user_id.." roubou o ID: "..nuser_id.."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
-- 					end)
-- 				else
-- 					local ndata = vRP.getUserDataTable(nuser_id)
-- 					if ndata ~= nil then
-- 						if ndata.inventory ~= nil then
-- 							for k,v in pairs(ndata.inventory) do
-- 								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(k)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
-- 									if vRP.tryGetInventoryItem(nuser_id,k,v.amount) then
-- 										vRP.giveInventoryItem(user_id,v.item,v.amount)
-- 									end
-- 								else
-- 									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..itemlist[k].nome.."</b> por causa do peso.")
-- 								end
-- 							end
-- 						end
-- 					end
-- 					local weapons = vRPclient.replaceWeapons(nplayer,{})
-- 					for k,v in pairs(weapons) do
-- 						vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
-- 						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
-- 							if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
-- 								vRP.giveInventoryItem(user_id,"wbody|"..k,1)
-- 							end
-- 						else
-- 							TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..itemlist["wbody|"..k].nome.."</b> por causa do peso.")
-- 						end
-- 						if v.ammo > 0 then
-- 							vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
-- 							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
-- 								if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
-- 									vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
-- 								end
-- 							else
-- 								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..itemlist["wammo|"..k].nome.."</b> por causa do peso.")
-- 							end
-- 						end
-- 					end
-- 					local nmoney = vRP.getMoney(nuser_id)
-- 					if vRP.tryPayment(nuser_id,nmoney) then
-- 						vRP.giveMoney(user_id,nmoney)
-- 					end
-- 					vRPclient.setStandBY(source,parseInt(600))
-- 					TriggerClientEvent("Notify",source,"importante","Roubo concluido com sucesso.")
-- 					TriggerEvent('logs:ToDiscord', discord_webhook1 , "ROUBO", "```Player "..user_id.." roubou o ID: "..nuser_id.."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
-- 				end
-- 			else
-- 				TriggerClientEvent("Notify",source,"aviso","A pessoa está resistindo ao roubo.")
-- 			end
-- 		else
-- 			TriggerClientEvent("Notify",source,"negado","Policiais não podem ser roubados.")
-- 		end
-- 	end
-- end)

-- RegisterCommand('revistar',function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	local nplayer = vRPclient.getNearestPlayer(source,2)
-- 	local nuser_id = vRP.getUserId(nplayer)
-- 	if nuser_id then
-- 		local identity = vRP.getUserIdentity(user_id)
-- 		local weapons = vRPclient.getWeapons(nplayer)
-- 		local money = vRP.getMoney(nuser_id)
-- 		local data = vRP.getUserDataTable(nuser_id)

-- 		TriggerClientEvent('cancelando',source,true)
-- 		TriggerClientEvent('cancelando',nplayer,true)
-- 		TriggerClientEvent('carregar',nplayer,source)
-- 		vRPclient._playAnim(source,false,{{"misscarsteal4@director_grip","end_loop_grip"}},true)
-- 		vRPclient._playAnim(nplayer,false,{{"random@mugging3","handsup_standing_base"}},true)
-- 		TriggerClientEvent("progress",source,5000,"revistando")
-- 		SetTimeout(5000,function()

-- 			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5M O C H I L A^4  - - - - - - - - - - - - - - - - - - - - - - - - - - -  [  ^3"..string.format("%.2f",vRP.getInventoryWeight(nuser_id)).."kg^4  /  ^3"..string.format("%.2f",vRP.getInventoryMaxWeight(nuser_id)).."kg^4  ]  - -")
-- 			if data and data.inventory then
-- 				for k,v in pairs(data.inventory) do
-- 					TriggerClientEvent('chatMessage',source,"",{},"     "..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(v.item))
-- 				end
-- 			end
-- 			TriggerClientEvent('chatMessage',source,"",{},"^4- -  ^5E Q U I P A D O^4  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
-- 			for k,v in pairs(weapons) do
-- 				if v.ammo < 1 then
-- 					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wbody|"..k))
-- 				else
-- 					TriggerClientEvent('chatMessage',source,"",{},"     1x "..vRP.itemNameList("wbody|"..k).." | "..vRP.format(parseInt(v.ammo)).."x Munições")
-- 				end
-- 			end

-- 			vRPclient._stopAnim(source,false)
-- 			vRPclient._stopAnim(nplayer,false)
-- 			TriggerClientEvent('cancelando',source,false)
-- 			TriggerClientEvent('cancelando',nplayer,false)
-- 			TriggerClientEvent('carregar',nplayer,source)
-- 			TriggerClientEvent('chatMessage',source,"",{},"     $"..vRP.format(parseInt(money)).." Dólares")
-- 		end)
-- 		TriggerClientEvent("Notify",nplayer,"aviso","Você está sendo <b>Revistado</b>.")
-- 	end
-- end)

-- RegisterCommand('saquear',function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	local nplayer = vRPclient.getNearestPlayer(source,2)
-- 	if nplayer then
-- 		if vRPclient.isInComa(nplayer) then
-- 			local identity_user = vRP.getUserIdentity(user_id)
-- 			local nuser_id = vRP.getUserId(nplayer)
-- 			local nidentity = vRP.getUserIdentity(nuser_id)
-- 			local policia = vRP.getUsersByPermission("policia.permissao")
-- 			local itens_saque = {}
-- 			if #policia >= 0 then
-- 				local vida = vRPclient.getHealth(nplayer)
-- 				TriggerClientEvent('cancelando',source,true)
-- 				vRPclient._playAnim(source,false,{{"amb@medic@standing@tendtodead@idle_a","idle_a"}},true)
-- 				TriggerClientEvent("progress",source,8000,"saqueando")
-- 				SetTimeout(8000,function()
-- 					if not vRP.hasPermission(nuser_id, "policia.permissao") then
-- 						local ndata = vRP.getUserDataTable(nuser_id)
-- 						if ndata ~= nil then
-- 							if ndata.inventory ~= nil then
-- 								for k,v in pairs(ndata.inventory) do
-- 									if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item)*v.amount <= vRP.getInventoryMaxWeight(user_id) then
-- 										if vRP.tryGetInventoryItem(nuser_id,v.item,v.amount) then
-- 											vRP.giveInventoryItem(user_id,v.item,v.amount)
-- 											table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList(v.item).." [QUANTIDADE]: "..v.amount)
-- 										end
-- 									else
-- 										TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.amount)).."x "..vRP.itemNameList(v.item).."</b> por causa do peso.")
-- 									end
-- 								end
-- 							end
-- 						end
-- 						local weapons = vRPclient.replaceWeapons(nplayer,{})
-- 						for k,v in pairs(weapons) do
-- 							vRP.giveInventoryItem(nuser_id,"wbody|"..k,1)
-- 							if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wbody|"..k) <= vRP.getInventoryMaxWeight(user_id) then
-- 								if vRP.tryGetInventoryItem(nuser_id,"wbody|"..k,1) then
-- 									vRP.giveInventoryItem(user_id,"wbody|"..k,1)
-- 									table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList("wbody|"..k).." [QUANTIDADE]: "..1)
-- 								end
-- 							else
-- 								TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>1x "..vRP.itemNameList("wbody|"..k).."</b> por causa do peso.")
-- 							end
-- 							if v.ammo > 0 then
-- 								vRP.giveInventoryItem(nuser_id,"wammo|"..k,v.ammo)
-- 								if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("wammo|"..k)*v.ammo <= vRP.getInventoryMaxWeight(user_id) then
-- 									if vRP.tryGetInventoryItem(nuser_id,"wammo|"..k,v.ammo) then
-- 										vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
-- 										table.insert(itens_saque, "[ITEM]: "..vRP.itemNameList("wammo|"..k).." [QTD]: "..v.ammo)
-- 									end
-- 								else
-- 									TriggerClientEvent("Notify",source,"negado","Mochila não suporta <b>"..vRP.format(parseInt(v.ammo)).."x "..vRP.itemNameList("wammo|"..k).."</b> por causa do peso.")
-- 								end
-- 							end
-- 						end
-- 						local nmoney = vRP.getMoney(nuser_id)
-- 						if vRP.tryPayment(nuser_id,nmoney) then
-- 							vRP.giveMoney(user_id,nmoney)
-- 						end
-- 					elseif vRP.tryGetInventoryItem(nuser_id,"distintivopolicial",1) then
-- 						vRP.giveInventoryItem(user_id,"distintivopolicial",1)
-- 					end
-- 					vRPclient.setStandBY(source,parseInt(8000))
-- 					vRPclient._stopAnim(source,false)
-- 					TriggerClientEvent('cancelando',source,false)
-- 					local apreendidos = table.concat(itens_saque, "\n")
-- 					TriggerClientEvent("Notify",source,"importante","Saque concluido com sucesso.")
-- 					SendWebhookMessage(webhooksaquear,"```prolog\n[ID]: "..user_id.." "..identity_user.name.." "..identity_user.firstname.."\n[SAQUEOU]: "..nuser_id.." "..nidentity.name.." " ..nidentity.firstname .. "\n" .. apreendidos ..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-- 					Citizen.Wait(8000)
-- 				end)
-- 			else
-- 				TriggerClientEvent("Notify",source,"aviso","Número insuficiente de policiais no momento.")
-- 			end
-- 		else
-- 			TriggerClientEvent("Notify",source,"negado","Você só pode saquear quem está em coma.")
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GUARDAR COLETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rcolete',function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    local armourlevel = vRPclient.getArmour(source)
  --  local descricao = vRP.prompt(source,"Deseja guardar seu colete?  DIGITE: sim","")
    
	--if descricao == "sim" or descricao == "Sim" or descricao == "SIM" then
	if not vRP.hasPermission(user_id,"policia.permissao") then
        if vRPclient.getHealth(source) > 101 then
			
            if armourlevel >= 95 then
                 if not vRPclient.isHandcuffed(source) then
                    if not vRP.searchReturn(source,user_id) then
                        if user_id then
							vRPclient.setArmour(source, 0)
							vRPclient._CarregarObjeto(source,"clothingshirt","try_shirt_positive_d","prop_armour_pickup",49,28422)
	                      	TriggerClientEvent("progress",source,10000,"Retirando Colete")
							TriggerClientEvent('cancelando',source,false)
							SetTimeout(10000,function()
							TriggerClientEvent("tirandocolete",source,args[10],args[20])								vRP.giveInventoryItem(user_id,'colete3',1)
							TriggerClientEvent("Notify",source,"sucesso","Você guardou o seu <b>Colete</b>.")
							vRPclient._DeletarObjeto(source)
	                        vRPclient._stopAnim(source,false)                     
							end)
						end
                    end
                    else
                        TriggerClientEvent("Notify",source,"negado","Esta algemado!")
                    end

					elseif armourlevel >= 45 then
						if not vRPclient.isHandcuffed(source) then
							if not vRP.searchReturn(source,user_id) then
								if user_id then
									vRPclient.setArmour(source, 0)
									vRPclient._CarregarObjeto(source,"clothingshirt","try_shirt_positive_d","prop_armour_pickup",49,28422)
									  TriggerClientEvent("progress",source,10000,"Retirando Colete")
									TriggerClientEvent('cancelando',source,false)
									SetTimeout(10000,function()
									TriggerClientEvent("tirandocolete",source,args[10],args[20])
									vRP.giveInventoryItem(user_id,'colete2',1)
									TriggerClientEvent("Notify",source,"sucesso","Você guardou o seu <b>Colete</b>.")
									vRPclient._DeletarObjeto(source)
									vRPclient._stopAnim(source,false)
								 
								end)
							end
						end
						else
							TriggerClientEvent("Notify",source,"negado","Esta algemado!")
						end

					elseif armourlevel >= 20 then
						if not vRPclient.isHandcuffed(source) then
							if not vRP.searchReturn(source,user_id) then
								if user_id then
									vRPclient.setArmour(source, 0)
									vRPclient._CarregarObjeto(source,"clothingshirt","try_shirt_positive_d","prop_armour_pickup",49,28422)
									  TriggerClientEvent("progress",source,10000,"Retirando Colete")
									TriggerClientEvent('cancelando',source,false)
									SetTimeout(10000,function()
									TriggerClientEvent("tirandocolete",source,args[10],args[20])
									vRP.giveInventoryItem(user_id,'colete1',1)
									TriggerClientEvent("Notify",source,"sucesso","Você guardou o seu <b>Colete</b>.")
									vRPclient._DeletarObjeto(source)
									vRPclient._stopAnim(source,false)
								 
								end)
							end
						end
						else
							TriggerClientEvent("Notify",source,"negado","Esta algemado!")
						end
                else
                    TriggerClientEvent("Notify",source,"negado","Você não tem colete!") 
                end
			
        else
			TriggerClientEvent("Notify",source,"negado","Morto não se meche!")
		end   
	else
		TriggerClientEvent("Notify",source,"negado","Policiais não podem guardar o armamento na mochila.")
	end 
    
end)

-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
-- MASCARA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,1700,"Trocando a mascara")
	if vRP.getInventoryItemAmount(user_id,"mascara") >= 1 then
		TriggerClientEvent('mascara',source,args[1],args[2])
	else
		TriggerClientEvent('Notify',source,"importante","Você precisa de uma <b>Máscara</b> para alterar sua máscara.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLUSA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,5000,"Trocando a blusa")
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('blusa',source,args[1],args[2])
	else
		TriggerClientEvent('Notify',source,"importante","Você precisa de uma <b>Roupa</b> para alterar sua blusa.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- JAQUETA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,5000,"Trocando a jaqueta")
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('jaqueta',source,args[1],args[2])
	else
		TriggerClientEvent('Notify',source,"importante","Você precisa de uma <b>Roupa</b> para alterar sua jaqueta.")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------
---- CALCA
-------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,2500,"Trocando a calça")
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('calca',source,args[1],args[2])
	else
		TriggerClientEvent('Notify',source,"importante","Você precisa de uma <b>Roupa</b> para alterar sua calca.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,2500,"Trocando as luvas")
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('maos',source,args[1],args[2])
	else
		TriggerClientEvent('Notify',source,"importante","Você precisa de uma <b>Roupa</b> para alterar suas luvas.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACESSORIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('acessorios',source,args[1],args[2])
	else
		TriggerClientEvent('Notify',source,"importante","Você precisa de uma <b>Roupa</b> para alterar seus acessórios.")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------
---- SAPATO
-------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,3000,"Trocando os sapatos")
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		TriggerClientEvent('sapatos',source,args[1],args[2])
	else
		TriggerClientEvent('Notify',source,"importante","Você precisa de uma <b>Roupa</b> para alterar seus sapatos.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAPEU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("progress",source,1700,"Trocando o chapéu")
	if vRP.getInventoryItemAmount(user_id,"chapeu") >= 1 then
		TriggerClientEvent('chapeu',source,args[1],args[2])
	else
		TriggerClientEvent('Notify',source,"importante","Você precisa de um <b>Chapéu</b> para alterar seu chapéu.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OCULOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"oculos") >= 1 then
		TriggerClientEvent('oculos',source,args[1],args[2])
	else
		TriggerClientEvent('Notify',source,"importante","Você precisa de um <b>Óculos</b> para alterar seu óculos.")
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- NOCARJACK
-----------------------------------------------------------------------------------------------------------------------------------------
local veiculos = {}
veiculos["CLONADOS"] = true
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /SEQUESTRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sequestro',function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRPclient.isHandcuffed(nplayer) then
			if not vRPclient.getNoCarro(source) then
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					if vRPclient.getCarroClass(source,vehicle) then
						vRPclient.setMalas(nplayer)
					end
				end
			elseif vRPclient.isMalas(nplayer) then
				vRPclient.setMalas(nplayer)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.")
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- GARMAS
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('garmas',function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
   -- local descricao = vRP.prompt(source,"Deseja guardar suas armas?  DIGITE: sim","")
    
  --  if descricao == "sim" or descricao == "Sim" or descricao == "SIM" then
		if not vRP.hasPermission(user_id,"policia.permissao") then
			if user_id then
				vRPclient._CarregarObjeto(source,"clothingshoes","check_out_a","bot_01b_bit_03",49,10422)
				TriggerClientEvent("progress",source,5000,"Guardando armamento")
				TriggerClientEvent('cancelando',source,false)
				SetTimeout(5000,function()
				local weapons = vRPclient.replaceWeapons(source,{})
				
			for k,v in pairs(weapons) do
				vRP.giveInventoryItem(user_id,"wbody|"..k,1)
				if v.ammo > 0 then
				vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
				end
			end
			end)

			Citizen.Wait(5000)
			TriggerClientEvent("Notify",source,"sucesso","Você guardou o seu <b>Armamento</b>.")
				vRPclient._DeletarObjeto(source)
				vRPclient._stopAnim(source,false)


		end
	else
		TriggerClientEvent("Notify",source,"negado","Policiais não podem guardar o armamento na mochila.")
		end
--	else
--	TriggerClientEvent("Notify",source,"negado","Você não confirmou!") 
--	end
end)

--[[ RegisterCommand('garmas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local weapons = vRPclient.replaceWeapons(source,{})
		for k,v in pairs(weapons) do
			TriggerClientEvent("Notify",source,"aviso","<b>Aguarde</b><br>Suas armas estão sendo desequipadas.",9500)
	        TriggerClientEvent("progress",source,5000,"guardando")
			Citizen.Wait(math.random(5000,6000))
			vRP.giveInventoryItem(user_id,"wbody|"..k,1)
			if v.ammo > 0 then
				vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
			end
            SendWebhookMessage(webhookgarmas,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU]: "..vRP.itemNameList("wbody|"..k).." \n[QUANTIDADE DE MUNIÇÃO]: "..v.ammo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
		TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você guardou seu armamento na mochila.")
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytow")
AddEventHandler("trytow",function(nveh,rveh)
	TriggerClientEvent("synctow",-1,nveh,rveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WINS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)
--[[ -----------------------------------------------------------------------------------------------------------------------------------------
-- CALL
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
RegisterCommand('chamar',function(source,args,rawCommand)
	local source = source
	local answered = false
	local user_id = vRP.getUserId(source)
	local rows = vRP.get_estafinalizado(user_id)
		local rows2 = vRP.get_estasempulso(user_id)
		if #rows > 0 then
			TriggerClientEvent("Notify",source,"negado","Você foi finalizado e não pode chamar os serviços essenciais!")
			vRPclient._stopAnim(source,false)
			vRPclient._DeletarObjeto(source)
			return
		elseif #rows2 > 0 then
			TriggerClientEvent("Notify",source,"negado","Você já está sem pulso e não pode chamar os serviços essenciais!")
			vRPclient._stopAnim(source,false)
			vRPclient._DeletarObjeto(source)
			return
		else

	if user_id then
		local players = {}
		if args[1] == "190" then
			players = vRP.getUsersByPermission("policia.permissao")
		elseif args[1] == "192" then
			players = vRP.getUsersByPermission("paramedico.permissao")
		elseif args[1] == "mecanico" then
			players = vRP.getUsersByPermission("mecanico.permissao")
		elseif args[1] == "taxi" then
			players = vRP.getUsersByPermission("taxista.permissao")
		elseif args[1] == "god" then
			players = vRP.getUsersByPermission("admin.permissao")
		elseif args[1] == "advogado" then
			players = vRP.getUsersByPermission("advogado.permissao")
		else
			TriggerClientEvent("Notify",source,"negado","Serviço inexistente.")
			return
		end

		local descricao = vRP.prompt(source,"Descrição:","")
		if descricao == "" then
			return
		end

		local identitys = vRP.getUserIdentity(user_id)
		TriggerClientEvent("Notify",source,"sucesso","Chamado enviado com sucesso.")
		TriggerEvent('logs:ToDiscord', discord_webhook2 , "CHAMADO", "```Player: "..user_id.." \nFez um chamado para: "..args[1].."\nMensagem: "..descricao.."```", "https://www.tumarcafacil.com/wp-content/uploads/2017/06/RegistroDeMarca-01-1.png", false, false)
		for l,w in pairs(players) do
			local player = vRP.getUserSource(parseInt(w))
			local nuser_id = vRP.getUserId(player)
			local x,y,z = vRPclient.getPosition(source)
			local uplayer = vRP.getUserSource(user_id)
			if player and player ~= uplayer then
				async(function()
					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},"Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0, "..descricao)
					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
					if ok then
						if not answered then
							answered = true
							local identity = vRP.getUserIdentity(nuser_id)
							TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							vRPclient._setGPS(player,x,y)
						else
							TriggerClientEvent("Notify",player,"negado","Chamado ja foi atendido por outra pessoa.")
							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
						end
					end
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
	end
end
end) ]]

RegisterServerEvent('offred:qthPolice')
AddEventHandler('offred:qthPolice', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local typemessage = "info"
		local messagedesc = "Enviou sua localização para a central"
		vRPclient.setDiv(source, "local","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
		SetTimeout(5000,function()
			vRPclient.removeDiv(source,"local")
		end)
		local soldado = vRP.getUsersByPermission("policia.permissao")
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player and player ~= uplayer then
				async(function()
					local id = idgens:gen()
					policia[id] = vRPclient.addBlip(player,x,y,z,153,84,"Localização de "..identity.name.." "..identity.firstname,0.5)
					TriggerClientEvent('criarblipp',player,x,y,z, "Localização de "..identity.name.." "..identity.firstname)
					local typemessage = "info"
					local messagedesc = "Localização recebida de "..identity.name.." "..identity.firstname..""
					TriggerClientEvent('chatMessage',player,"COPOM",{65,130,255},"Localização recebida de ^1"..identity.name.." "..identity.firstname.."^0.")
					SetTimeout(60000,function() vRPclient.removeBlip(player,policia[id]) idgens:free(id) end)
					vRPclient.setDiv(player, "local","body {font-family: 'Source Sans Pro', 'Helvetica Neue', Arial, sans-serif;color: #34495e;-webkit-font-smoothing: antialiased;line-height: 1.6em;}p {margin: 0;}.notice {margin: 1em;background: #F9F9F9;padding: 1em 1em 1em 2em;border-left: 4px solid #DDD;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.125);bottom: 7%;right: 1%;line-height: 22px;position: absolute;max-width: 500px;-webkit-border-radius: 5px; -webkit-animation: fadein 2s; -moz-animation: fadein 2s; -ms-animation: fadein 2s; -o-animation: fadein 2s; animation: fadein 2s;}.notice:before {position: absolute;top: 50%;margin-top: -17px;left: -17px;background-color: #DDD;color: #FFF;width: 30px;height: 30px;text-align: center;line-height: 30px;font-weight: bold;font-family: Georgia;text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}.info {border-color: #0074D9;}.info:before {content: \"i\";background-color: #0074D9;}.sucesso {border-color: #2ECC40;}.sucesso:before {content: \"√\";background-color: #2ECC40;}.aviso {border-color: #FFDC00;}.aviso:before {content: \"!\";background-color: #FFDC00;}.error {border-color: #FF4136;}.error:before {content: \"X\";background-color: #FF4136;}@keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-moz-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-webkit-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-ms-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}@-o-keyframes fadein {from { opacity: 0; }to   { opacity: 1; }}","<div class=\"notice "..typemessage.."\"><p>"..messagedesc.."</p></div>")
					SetTimeout(5000,function()
						vRPclient.removeDiv(player,"local")
					end)
					TriggerClientEvent('InteractSound_CL:PlayOnOne',player,'beep',0.7)
					SetTimeout(30000,function() TriggerClientEvent('removerblipp',-1) end)
				end)
			end
		end
	end
end)



--[[ -----------------------------------------------------------------------------------------------------------------------------------------
-- ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
local roupas = {
	["minerador"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 99,1 },
			[4] = { 89,20 },
			[5] = { -1,0 },
			[6] = { 82,2 },
			[7] = { -1,0 },
			[8] = { 90,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 273,0 },
			["p1"] = { 23,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 114,1 },
			[4] = { 92,20 },
			[5] = { -1,0 },
			[6] = { 86,2 },
			[7] = { -1,0 },
			[8] = { 54,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 286,0 },
			["p1"] = { 25,0 }
		}
	},
    ["lixeiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 17,0 },
			[4] = { 36,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { -1,0 },
			[8] = { 59,0 },
			[10] = { -1,0 },
			[11] = { 57,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 18,0 },
			[4] = { 35,0 },
			[5] = { -1,0 },
			[6] = { 26,0 },
			[7] = { -1,0 },
			[8] = { 36,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 50,0 }
		}
	},
	["carteiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 17,10 },
			[5] = { 40,0 },
			[6] = { 7,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 242,3 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 14,1 },
			[5] = { 40,0 },
			[6] = { 10,1 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 250,3 }
		}
	},
	["fazendeiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 37,0 },
			[4] = { 7,0 },
			[5] = { -1,0 },
			[6] = { 15,6 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 95,2 },
			["p0"] = { 105,23 },
			["p1"] = { 5,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 45,0 },
			[4] = { 25,10 },
			[5] = { -1,0 },
			[6] = { 21,1 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 171,4 },
			["p0"] = { 104,23 },
			["p1"] = { 11,2 }
		}
	},
	["lenhador"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 62,0 },
			[4] = { 89,23 },
			[5] = { -1,0 },
			[6] = { 12,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 15,0 },
			["p0"] = { 77,13 },
			["p1"] = { 23,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 71,0 },
			[4] = { 92,23 },
			[5] = { -1,0 },
			[6] = { 69,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 15,0 },
			["p1"] = { 25,0 }
		}
	},
	["taxista"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 11,0 },
			[4] = { 35,0 },
			[5] = { -1,0 },
			[6] = { 10,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 13,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 112,0 },
			[5] = { -1,0 },
			[6] = { 6,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 27,0 }
		}
	},
	["caminhoneiro"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 63,0 },
			[5] = { -1,0 },
			[6] = { 27,0 },
			[7] = { -1,0 },
			[8] = { 81,0 },
			[10] = { -1,0 },
			[11] = { 173,3 },
			["p1"] = { 8,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 14,0 },
			[4] = { 74,5 },
			[5] = { -1,0 },
			[6] = { 9,0 },
			[7] = { -1,0 },
			[8] = { 92,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 175,3 },
			["p1"] = { 11,0 }
		}
	},
	["fivembrasil"] = {
		[1885233650] = {                                      
			[1] = { 90,0 },
			[2] = { 30,0 },
			[3] = { 0,0 },
			[4] = { 87,2 },
			[5] = { -1,0 },
			[6] = { 6,1 },
			[7] = { 17,0 },
			[8] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 271,1 },
			["p0"] = { 104,1 },
			["p6"] = { 3,0 },
			["p1"] = { 15,0 }
		},
	},
	["motocross"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 111,0 },
			[4] = { 67,3 },
			[5] = { -1,0 },
			[6] = { 47,3 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 152,0 },
			["p1"] = { 25,5 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 128,0 },
			[4] = { 69,3 },
			[5] = { -1,0 },
			[6] = { 48,3 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 149,0 },
			["p1"] = { 27,5 }
		}
	},
	["mergulho"] = {
		[1885233650] = {
			[1] = { 122,0 },
			[3] = { 31,0 },
			[4] = { 94,0 },
			[5] = { -1,0 },
			[6] = { 67,0 },
			[7] = { -1,0 },
			[8] = { 123,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 243,0 },			
			["p0"] = { -1,0 },
			["p1"] = { 26,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { 122,0 },
			[3] = { 18,0 },
			[4] = { 97,0 },
			[5] = { -1,0 },
			[6] = { 70,0 },
			[7] = { -1,0 },
			[8] = { 153,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 251,0 },
			["p0"] = { -1,0 },
			["p1"] = { 28,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["pelado"] = {
		[1885233650] = {                                      
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 21,0 },
			[5] = { -1,0 },
			[6] = { 34,0 },
			[7] = { -1,0 },
			[8] = { 15,0 },
			[10] = { -1,0 },
			[11] = { 15,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 21,0 },
			[5] = { -1,0 },
			[6] = { 35,0 },
			[7] = { -1,0 },
			[8] = { 6,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 82,0 }
		}
	},
	["paciente"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 15,0 },
			[4] = { 61,0 },
			[5] = { -1,0 },
			[6] = { 16,0 },
			[7] = { -1,0 },			
			[8] = { 15,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 104,0 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 0,0 },
			[4] = { 57,0 },
			[5] = { -1,0 },
			[6] = { 16,0 },
			[7] = { -1,0 },		
			[8] = { 7,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 105,0 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["gesso"] = {
		[1885233650] = {
			[1] = { -1,0 },
			[3] = { 1,0 },
			[4] = { 84,9 },
			[5] = { -1,0 },
			[6] = { 13,0 },
			[7] = { -1,0 },			
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 186,9 },			
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 },
			[3] = { 3,0 },
			[4] = { 86,9 },
			[5] = { -1,0 },
			[6] = { 12,0 },
			[7] = { -1,0 },		
			[8] = { -1,0 },
			[9] = { -1,0 },
			[10] = { -1,0 },
			[11] = { 188,9 },
			["p0"] = { -1,0 },
			["p1"] = { -1,0 },
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["leiteiro"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 74,0 }, -- maos
			[4] = { 89,22 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 51,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 271,0 }, -- jaqueta		
			["p0"] = { 105,22 }, -- chapeu
			["p1"] = { 23,0 }, -- oculos
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 85,0 }, -- maos
			[4] = { 92,22 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 52,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 141,0 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 3,9 }, -- oculos
		}
	},
	["motorista"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 0,0 }, -- maos
			[4] = { 10,0 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 21,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 242,1 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 7,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 14,0 }, -- maos
			[4] = { 37,0 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 27,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { -1,0 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 250,1 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["cacador"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 97,18 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { 2,2 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 244,19 }, -- jaqueta		
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 20,0 }, -- maos
			[4] = { 100,18 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { 44,1 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 252,19 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { -1,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	},
	["pescador"] = {
		[1885233650] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 0,0 }, -- maos
			[4] = { 98,19 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 }, -- acessorios		
			[8] = { 85,2 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 247,12 }, -- jaqueta		
			["p0"] = { 104,20 }, -- chapeu
			["p1"] = { 5,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		},
		[-1667301416] = {
			[1] = { -1,0 }, -- máscara
			[3] = { 14,0 }, -- maos
			[4] = { 101,19 }, -- calça
			[5] = { -1,0 }, -- mochila
			[6] = { 24,0 }, -- sapato
			[7] = { -1,0 },  -- acessorios		
			[8] = { 88,1 }, -- blusa
			[9] = { -1,0 }, -- colete
			[10] = { -1,0 }, -- adesivo
			[11] = { 255,13 }, -- jaqueta
			["p0"] = { -1,0 }, -- chapeu
			["p1"] = { 11,0 }, -- oculos
			["p2"] = { -1,0 },
			["p6"] = { -1,0 },
			["p7"] = { -1,0 }
		}
	}
}


RegisterCommand('roupas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 then
		if args[1] then
			local custom = roupas[tostring(args[1])]
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
			vRP.removeCloak(source)
		end
		else
		TriggerClientEvent('chatMessage',source,"ALERTA",{255,70,50},"Você precisa de ^1Roupas ^0para mudar de roupa.")
	end
end) ]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- PERDER ITEM NA AGUA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('perdeitem:nadando')
AddEventHandler('perdeitem:nadando', function(qtddinheiro)
    local user_id = vRP.getUserId(source)
    local mochila = vRP.getInventoryItemAmount(user_id,'celular')
    local dinheiro = vRP.getMoney(user_id)
    local perdeuitem = 0
    local qtddinheiroperdido = (dinheiro / 800) * 1

    if mochila > 0 then
       vRP.tryGetInventoryItem(user_id,'celular',mochila)
	   vRP.giveInventoryItem(user_id,'celularqueimado',mochila)
       perdeuitem = 1
    end

    if perdeuitem == 1 then
       TriggerClientEvent("Notify", source, "sucesso", "Voce se molhou e queimou seu celular!")
    end

end)
