
----------------------------------------------------------------
--------------------- BY: SkipS#1234
----------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

aTx = {}
Tunnel.bindInterface("sks_empresas",aTx)
Proxy.addInterface("sks_empresas",aTx)

local idgens = Tools.newIDGenerator()
local blips = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------


vRP._prepare("astrax/comprar_empresa","INSERT IGNORE INTO vrp_empresas(user_id,empresa) VALUES(@user_id,@empresa)")
vRP._prepare("astrax/vender_empresa","DELETE FROM vrp_empresas WHERE user_id = @user_id AND empresa = @empresa")
vRP._prepare("astrax/ver_empresa","SELECT * FROM vrp_empresas WHERE user_id = @user_id AND empresa = @empresa")
vRP._prepare("astrax/ver_empresa2","SELECT empresa,salario FROM vrp_empresas WHERE user_id = @user_id")
vRP._prepare("astrax/ver_empresa3","SELECT empresa FROM vrp_empresas WHERE user_id = @user_id")

-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local empresas = {
	{ empresa = "Ammunation", nome = "Ammunation",						compra = 1260000, venda = 900000, salario = 22000}, --50 reais
	{ empresa = "LojaDeRoupas", nome = "Loja De Roupas",    			compra = 530000, venda = 360000, salario = 15000 }, --60 reais
	{ empresa = "Tatto", nome = "Loja De Tatuagens", 					compra = 500000, venda = 300000, salario = 12500 }, --50 reais
	{ empresa = "Mercadinho", nome = "Mercadinho", 						compra = 480000, venda = 350000, salario = 10000 }, --70 reais
	{ empresa = "TeQuilala", nome = "TeQuilala", 						compra = 1100000, venda = 890000, salario = 20000 }, --60 reais
	{ empresa = "PostoDeCombustivel", nome = "Posto De Combustivel", 	compra = 1860000, venda = 1390000, salario = 30000 }, --80 reais
	{ empresa = "Concessionaria", nome = "Concessionaria",				compra = 4300000, venda = 3610000, salario = 45000 }, --120 reais
	{ empresa = "LosSantos", nome = "LS Customs", 						compra = 1450000, venda = 910000, salario = 25000 }, --50 reais
	{ empresa = "Joalheiria", nome = "Joalheiria",			 			compra = 4000000, venda = 3410000, salario = 43000 }, --140 reais
	{ empresa = "BancoFlecca", nome = "Banco Flecca", 					compra = 5600000, venda = 4100000, salario = 50000 } --90 reais
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("comprar")
AddEventHandler("comprar",function(empresa)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
	local consulta = vRP.query("astrax/ver_empresa3",{ user_id = user_id}) 
		if not consulta[1] then
			for k,v in pairs(empresas) do
			if empresa == v.empresa then
				if vRP.tryPayment(user_id,parseInt(v.compra)) then
					vRP.giveInventoryItem(user_id,v.item,parseInt(v.quantidade))
					vRP.execute("astrax/comprar_empresa",{ user_id = user_id , empresa = empresa })
					return TriggerClientEvent("Notify",source,"sucesso","Comprou <b>"..v.nome.."</b> por <b>R$"..vRP.format(parseInt(v.compra)).." reais</b>.")
				else 
					return TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
					end
				end					
			end
		else return TriggerClientEvent("Notify",source,"negado","você já tem o limite de empresas, venda a sua para comprar outra!")
		end
	end
end)

RegisterServerEvent("vender")
AddEventHandler("vender",function(empresa)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local consulta = vRP.query("astrax/ver_empresa",{ user_id = user_id, empresa = empresa}) 
		if consulta[1] then 
			for k,v in pairs(empresas) do
				if empresa == v.empresa then
					vRP.giveMoney(user_id,v.venda)
					vRP.execute("astrax/vender_empresa",{ user_id = user_id , empresa = empresa})
					return TriggerClientEvent("Notify",source,"sucesso","Você vendeu <b>"..v.nome.."</b> por <b>R$"..vRP.format(parseInt(v.venda)).." reais</b>.")								
				end
			end
		else return TriggerClientEvent("Notify",source,"negado","você não tem essa empresa para poder vende-lá!")	
		end
	end
end)


RegisterServerEvent("salarioempresa")
AddEventHandler("salarioempresa",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local consulta = vRP.query("astrax/ver_empresa3",{ user_id = user_id}) 
	if consulta[1] then 
		for k,v in pairs(empresas) do
			if consulta[1].empresa == v.empresa then
				vRP.giveBankMoney(user_id,v.salario)
				return TriggerClientEvent("Notify",source,"sucesso","sua empresa <b>"..v.nome.."</b> lhe rendeu <b>R$"..vRP.format(parseInt(v.salario)).." reais</b>.")
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR DINHEIRO SUJO
-----------------------------------------------------------------------------------------------------------------------------------------
function aTx.checkDinheiro()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"dinheirosujo") >= 10000 then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Dinheiro sujo insuficiente.") 
			return false
		end
	end
end

function aTx.propietario()
	local source = source
	local user_id = vRP.getUserId(source)
	local consulta = vRP.query("astrax/ver_empresa3",{ user_id = user_id}) 
	if user_id then
		if consulta[1] then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","você não tem uma empresa para lavar dinheiro!")	 
			return false
		end
	end
end

function aTx.checkPayment()
    local source = source
    local user_id = vRP.getUserId(source)
    local policia = vRP.getUsersByPermission("policia.permissao")
    if user_id then
        random = math.random(50,60)
        if vRP.tryGetInventoryItem(user_id,"dinheirosujo",10000) then	
            if #policia == 0 then
                vRP.giveMoney(user_id,parseInt(10000*("0."..random)))

            else 
                vRP.giveMoney(user_id,parseInt(10000*("0."..random))+(#policia*200))					

            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAMANDO POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
function aTx.lavagemPolicia(id,x,y,z,head)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
			TriggerClientEvent('iniciandolavagem',source,head,x,y,z)
			vRPclient._playAnim(source,false,{{"anim@heists@prison_heistig1_p1_guard_checks_bus","loop"}},true)
	--		TriggerClientEvent("Notify",source,"sucesso","lavagem de dinheiro iniciada!")	
			TriggerClientEvent("progress",source,9000,"Lavando seu dinheiro sujo..")
			local random = math.random(100)
			if random >= 50 then
				vRPclient.setStandBY(source,parseInt(60))
				for l,w in pairs(policia) do
					local player = vRP.getUserSource(parseInt(w))
					if player then
						async(function()
							local ids = idgens:gen()
							blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Ocorrencia",0.5,true)
							TriggerClientEvent('chatMessage',player,"911",{64,64,255},"^1Lavagem^0 de dinheiro em andamento.")
							SetTimeout(10000,function() vRPclient.removeBlip(player,blips[ids]) idgens:free(ids) end)
							
						end)
					end
				end
			end	


		end
	end

	----------------------------------------------------------------
--------------------- BY: SkipS#1234
----------------------------------------------------------------