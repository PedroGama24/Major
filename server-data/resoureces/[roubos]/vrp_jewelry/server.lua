local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

func = {}
Tunnel.bindInterface("vrp_jewelry",func)
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
local timers = os.time()
local andamento = false
local roubando = false
local segundos = 600
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKJEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkJewelry(x,y,z,h,sec,tipo)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		if vRP.returnAction() then
			TriggerClientEvent("Notify",source,"aviso","System currently unavailable, please check back later.",5000)
		elseif #policia <= 4 then
			TriggerClientEvent("Notify",source,"aviso","Sistema indisponível no momento.",8000)

		else
			if vRP.getInventoryItemAmount(user_id,"pendrive") >= 1 and not roubando then
				roubando = true
				vRPclient._playAnim(source,false,{{"anim@heists@prison_heistig1_p1_guard_checks_bus","loop"}},true)
				TriggerClientEvent('iniciandojewelry',source,x,y,z,h,sec,tipo,true)
				local firewall = math.random(100)
				SetTimeout(sec*1000,function()
					if firewall >= 50 then
						segundos = 600
						andamento = true
						timers = os.time()
						TriggerClientEvent('iniciandojewelry',source,x,y,z,h,sec,tipo,false)
						if vRP.tryGetInventoryItem(user_id,"pendrive",1) then
						TriggerClientEvent("Notify",source,"sucesso","A proteção do <b>Baidu Antivirus</b> foi comprometida e todos os balcões foram liberados.",8000)
						SetTimeout(50000,function()
							vRP.searchTimer(user_id,600)
							func.callPolice(x,y,z)
						end)
					end
					else
						roubando = false
						func.callPolice(x,y,z)
						TriggerClientEvent('iniciandojewelry',source,x,y,z,h,sec,tipo,false)
						if vRP.tryGetInventoryItem(user_id,"pendrive",1) then
						TriggerClientEvent("Notify",source,"aviso","O computador é protegido pelo <b>Baidu Antivirus</b>, ele bloqueou sua conexão, tente novamente.",8000)
					end
				end
				end)
			else
				TriggerClientEvent("Notify",source,"importante","Precisa de um <b>Pendrive</b> para hackear as câmeras de segurança.",8000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALLPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function func.callPolice(x,y,z)
	local source = source
	TriggerClientEvent("vrp_sound:fixed",-1,source,x,y,z,100,"alarm",0.5)
	local policia = vRP.getUsersByPermission("policia.permissao")
	for l,w in pairs(policia) do
		local player = vRP.getUserSource(parseInt(w))
		if player then
			async(function()
				local ids = idgens:gen()
				vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
				blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Roubo em andamento",0.5,true)
				TriggerClientEvent("NotifyPush",player,{ code = 31, title = "Roubo ao Caixa Eletrônico", x = x, y = y, z = z, badge = "O alarme disparou, verifique o ocorrido" })

				SetTimeout(20000,function()
					vRPclient.removeBlip(player,blips[ids])
					idgens:free(ids)
					blips[ids] = nil
				end)
			end)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURNJEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------
function func.returnJewelry()
	return andamento
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
local timers = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timers) do
			if v > 0 then
				timers[k] = v - 1
			end
		end
		if andamento then
			segundos = segundos - 1
			if segundos <= 0 then
				timers = {}
				andamento = false
				roubando = false
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKJEWELS
-----------------------------------------------------------------------------------------------------------------------------------------
local jewels = {
	[1] = { item = "relogioroubado" },
	[2] = { item = "pulseiraroubada" },
	[3] = { item = "anelroubado" },
	[4] = { item = "colarroubado" },
	[5] = { item = "brincoroubado" }
}

function func.checkJewels(id,x,y,z,h,tipo)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if timers[id] == 0 or not timers[id] then
			timers[id] = 300
			TriggerClientEvent('iniciandojewelry',source,x,y,z,h,10,tipo,true)
			vRPclient._playAnim(source,false,{{"oddjobs@shop_robbery@rob_till","loop"}},true)
			SetTimeout(10000,function()
				vRP.searchTimer(user_id,120)
				vRP.giveInventoryItem(user_id,jewels[parseInt(math.random(#jewels))].item,math.random(3,5))
			end)
		else
			TriggerClientEvent("Notify",source,"aviso","O balcão está vazio, aguarde <b>"..vRP.format(parseInt(timers[id])).." segundos</b> até que a loja se recupera do ultimo roubo.")
		end
	end
end