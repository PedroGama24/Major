--[[
    PROPOSTA:



]]

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")

blzr = {}
Tunnel.bindInterface("sks_desmanche", blzr)

vCLIENT = Tunnel.getInterface("sks_desmanche")

local desmanche = "https://discord.com/api/webhooks/1174170425941561344/POTEjh7_BJXr-HjRGvtvQAINAazyeIvBi_QrwM3IS_LLYPqi5DYMNolEsI2Nx9Xee-nz"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

------------------------------------------------------
-- CONFIG 
------------------------------------------------------
local RestritoParaDesmanche = true -- É restrito para quem tiver só a permissão do desmanche? (TRUE/FALSE)
local PermissaoDesmanche = 'driftking.permissao' -- or 'outrocargo.permissao' -- Se RestritoParaDesmanche for TRUE, aqui deverá ter a permissão que será verifiada.

local PrecisaDeItem = false -- Precisa de item para iniciar o desmanche? (TRUE/FALSE)
local ItemNecessario = 'nomedoitem' -- Qual item precisa para iniciar o desmanche?
local QtdNecessaria = 1 -- Quantos itens precisará para iniciar o desmanche?


local CarrosDesmanches = {

-------------------------------------------------------------------------|
----- CONCESSIONÁRIA ----------------------------------------------------|
-------------------------------------------------------------------------| 
    
["blista"] = 5000,
["brioso"] = 5000,
["dilettante"] = 4000,
["issi2"] = 8000,
["issi3"] = 3500,
["panto"] = 3200,
["prairie"] = 4000,
["rhapsody"] = 3000,
--COUPES
["cogcabrio"] = 10000,
["exemplar"] = 12000,
["f620"] = 10000,
["felon"] = 7000,
["felon2"] = 9000,
["jackal"] = 7000,
["oracle"] = 7000,
["oracle2"] = 9000,
["sentinel"] = 8000,
["sentinel2"] = 10000,
["windsor"] = 12000,
["windsor2"] = 15000,
["zion"] = 6000,
["zion2"] = 8000,

--MUSCLE
["blade"] = 6000,
["coquette3"] = 11000,
["buccaneer"] = 13000,
["buccaneer2"] = 26000,
["chino"] = 13000,
["chino2"] = 13000,
["dominator"] = 19500,
["dukes"] = 15000,
["faction"] = 15000,
["gauntlet"] = 35000,
["hermes"] = 16500,
["hotknife"] = 16500,
["impaler"] = 28000,
["moonbeam"] = 18000,
["nightshade"] = 22000,
["phoenix"] = 25000,
["picador"] = 27000,
["ratloader2"] = 15000,
["ruiner"] = 15000,
["sabregt"] = 26000,
["stalion"] = 15000,
["tampa"] = 18000,
["vamos"] = 23000,
["vigero"] = 15000,
["virgo"] = 15000,
["voodoo"] = 17000,
["yosemite"] = 35000,
--Off-Road
["bfinjection"] = 8000,
["mesa3"] = 19000,
["bifta"] = 17000,
["dubsta3"] = 25000,
["rancherxl"] = 40000,
["riata"] = 40000,
["sandking"] = 30000,
["sandking2"] = 20000,
 --- SUVS
["baller"] = 22000,
["baller3"] = 32000,
["sadler"] = 19000,
["bjxl"] = 21000,
["cavalcade"] = 17000,
["dubsta"] = 31000,
["granger"] = 34500,
["gresley"] = 20000,
["huntley"] = 18000,
["landstalker"] = 15000,
["mesa"] = 15000,
["patriot"] = 28000,
["toros"] = 52000,
["seminole"] = 13000,
["serrano"] = 15000,
["xls"] = 19000,
["xls2"] = 35000,
 --- SEDANS
["asea"] = 8000,
["asterope"] = 9000,
["cog55"] = 20000,
["cog552"] = 40000,
["cognoscenti"] = 28000,
["emperor"] = 8000,
["fugitive"] = 15000,
["glendale"] = 8000,
["intruder"] = 11000,
["ingot"] = 16000,
["premier"] = 8000,
["primo"] = 13000,
["stretch"] = 52000,
["stanier"] = 10000,
["stratum"] = 12000,
["warrener"] = 9000,
--- SPORTS
["alpha"] = 23000,
["banshee"] = 30000,
["bestiagts"] = 29000,
["blista2"] = 5500,
["buffalo"] = 30000,
["carbonizzare"] = 29000,
["jester3"] = 34500,
["flashgt"] = 37000,
["coquette"] = 25000,
["elegy"] = 35000,
["elegy2"] = 35500,
["feltzer2"] = 25500,
["furoregt"] = 29000,
["fusilade"] = 21000,
["futo"] = 17000,
["italigto"] = 80000,
["jester"] = 15000,
["khamelion"] = 21000,
["kuruma"] = 33000,
["massacro"] = 30000,
["lynx"] = 37000,
["neon"] = 37000,
["ninef"] = 29000,
["ninef"] = 29000,
["pariah"] = 50000,
["penumbra"] = 15000,
["raiden"] = 24000,
["rapidgt"] = 25000,
["schafter3"] = 27500,
["schafter5"] = 27500,
["schwarzer"] = 17000,
["sentinel3"] = 17000,
["seven70"] = 37000,
["specter"] = 32000,
["sultan"] = 21000,
["surano"] = 31000,
["verlierer2"] = 38000,
---- CLASSICS
["btype"] = 20000,
["casco"] = 35500,
["cheburek"] = 17000,
["coquette2"] = 28500,
["feltzer3"] = 22000,
["gt500"] = 25000,
["mamba"] = 30000,
["manana"] = 13000,
["monroe"] = 26000,
["peyote"] = 15000,
["pigalle"] = 25000,
["rapidgt3"] = 22000,
["retinue"] = 15000,
["stinger"] = 22000,
["tornado"] = 15000,
["ztype"] = 40000,
["cheetah2"] = 44000,
-- SUPER
["adder"] = 62000,
["banshee2"] = 57000,
["bullet"] = 50000,
["cheetah"] = 52500,
["taipan"] = 62000,
["entity2"] = 55000,
["cyclone"] = 92000,
["entityxf"] = 56000,
["fmj"] = 52000,
["gp1"] = 50000,
["infernus"] = 52000,
["italigtb"] = 60000,
["nero"] = 51000,
["osiris"] = 51000,
["penetrator"] = 51000,
["pfister811"] = 53000,
["prototipo"] = 103000,
["reaper"] = 62000,
["sc1"] = 50500,
["sultanrs"] = 51000,
["t20"] = 67000,
["tempesta"] = 60000,
["turismor"] = 62000,
["vacca"] = 62000,
["vagner"] = 68000,
["visione"] = 69000,
["voltic"] = 50000,
["xa21"] = 63000,
["zentorno"] = 92000,
["tyrant"] = 69000,
 ---VANS
["bison"] = 22000,
["bobcatxl"] = 26000,
["burrito"] = 26000,
["burrito3"] = 26000,
["minivan"] = 20000,
["gburrito"] = 20000,
["paradise"] = 26000,
["pony2"] = 26000,
["rumpo3"] = 35000,
["Speedo"] = 20000,
["Surfer"] = 5500,
["Youga"] = 26000,
-- MOTORCYCLES
["akuma"] = 50000,
["avarus"] = 44000,
["bagger"] = 30000,
["bati"] = 37000,
["bati2"] = 30000,
["bf400"] = 32000,
["carbonrs"] = 37000,
["chimera"] = 34500,
["cliffhanger"] = 31000,
["daemon"] = 20000,
["daemon2"]  = 24000,
["defiler"] = 46000,
["diablous"] = 43000,
["diablous2"] = 46000,
["double"] = 37000,
["enduro"] = 19500,
["esskey"] = 32000,
["faggio"] = 400,
["faggio2"] = 500,
["faggio3"] = 500,
["fcr"] = 39000,
["fcr2"] = 39000,
["gargoyle"] = 34500,
["hakuchou"] = 38000,
["hakuchou2"] = 55000,
["hexer"] = 25000,
["innovation"] = 25000,
["lectro"] = 38000,
["manchez"] = 35500,
["nemesis"] = 34500,
["nightblade"] = 41500,
["pcj"] = 23000,
["ruffian"] = 34500,
["sanchez"] = 18500,
["sanchez2"] = 18500,
["sovereign"] = 28500,
["thrust"] = 37500,
["vader"] = 34500,
["vindicator"] = 34000,
["vortex"] = 37500,
["wolfsbane"] = 29000,
["zombiea"] = 29000,
["zombieb"] = 30000,
["shotaro"] = 100000,
["ratbike"] = 23000,
["blazer"] = 23000,
["blazer4"] = 37000,
-- ADD-ONS
["amggtr"] = 1500000,
	["2019chiron"] = 2800000, 
	["21camaro"] = 2000000,
	["911turbos"] = 2500000,
	["audirs6"]  = 2200000, 
	["audirs7"]  = 2600000, 
	["b63s"] = 1600000, 
	["bmci"] = 1700000, 
	["bmwm3f80"] = 1500000,
	["bmwm4gts"] = 1700000,
	["dodgechargersrt"] = 1500000, 
	["ferrariitalia"]  = 3000000,  
	["focusrs"] = 1600000, 
	["fordmustang"] = 2000000, 
	["fpacehm"] = 2000000, 
	["lamborghinihuracan"] = 2600000,
	["lancerevolution9"] = 1500000, 
	["lancerevolutionx"] = 1800000, 
	["macan"] = 1800000,
	["mazdarx7"]  = 1500000,
	["mercedesa45"] = 1500000, 
	["mers63c"] = 1700000, 
	["nissan370z"] = 1500000,
	["nissangtr"] = 2000000, 
	["nissanskyliner34"] = 2200000, 
	["p1"]  = 3000000, 
	["panamera17turbo"]  = 2800000, 
	["raptor2017"] = 2200000,
	["rs6c8"]  = 2600000, 
	["teslaprior"] = 3100000, 
	["toyotasupra"] = 2000000, 
	["velociraptor"] = 3000000, 
	["rrst"] = 1800000,
	["bmwg7"] = 2800000, 
	["cayenneturbo"] = 2000000,
	["22g63"] = 1900000,  
	["velar"] = 3000000,  
	["x6m"] = 3100000,
	["teslax"] = 3100000, 
	["ttrs"] =  2000000, 

    ["biz25"] = 60000,
	["bros60"] =  80000, 
	["v4sf"] = 300000,
	["mt03"] =  100000,
	["fz07"] =  130000, 
	["R1200GS"] =  300000, 
	["cg160"] = 50000,
	["xre300"] = 80000, 
	["500x"] = 150000,
	["hcbr17"] = 260000, 
	["z1000"] = 20000,
	["r1"] = 125000,
	["f800"] =  220000,
	["gs310"] = 180000,
	["gsxr"] =  130000,
	["h2carb"] = 210000, 
	["hayabusa"] = 230000,
	["hornet"] = 150000,
	["r6"] = 200000,
	["s1000docandidato"] = 260000,

    ["fox"] = 80000, 
	["amarok"] = 300000,
	["vwbeetlenaj"] = 50000,
	["defender21"] = 300000,
	["gcmcerato18"] =  100000, 
	["gcmcorolla20cn"] =  250000,
	["gcmhighlanderxse"] =  300000, 
	["gcmoutlanderls"] = 300000,
	["gcmsentra20"] = 100000,
	["gcmcity14"] = 90000,
	["golfgti7"] = 250000,
	["hilux2019"] =  300000, 
	["jettagli"] = 350000, 
	["nf17"] =  270000, 
	["pajero4"] = 100000, 
	["polo2018"] = 80000, 
	["savaoriginal"] = 60000, 
	["taigun21"] =  100000,
	["uptsi"] = 120000,
	["veloster"] =  80000, 
	["cox2013"] = 120000, 

}

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


-- RETORNA VEICULOS PERMITIDOS
function blzr.GetVehs()
    return CarrosDesmanches
end


-- FUNÇÃO VERIFICAR PERMISSÃO DO DESMANCHE
function blzr.CheckPerm()
    local source = source
    local user_id = vRP.getUserId(source)
    if RestritoParaDesmanche then
        if vRP.hasPermission(user_id, PermissaoDesmanche) then
            return true
        end
        return false
    end
    return true
end

-- FUNÇÃO PRA VERIFICAR SE POSSUI O ITEM
function blzr.CheckItem()
    local source = source
    local user_id = vRP.getUserId(source)
    if PrecisaDeItem then
        if vRP.tryGetInventoryItem(user_id,ItemNecessario,QtdNecessaria) then
            return true
        end
        return false
    end
    return true
end


-- FUNÇÃO PARA GERAR O PAGAMENTO E OS ITENS
function blzr.GerarPagamento(placa, nomeFeio, nomeBonito)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    for k, v in pairs(CarrosDesmanches) do
        if string.upper(k) == string.upper(nomeFeio) then
            local pagamento = v/3 -- O valor do veiculo dividido por 3
            -- vRP.giveMoney(user_id,pagamento) -- DINHEIRO LIMPO
            vRP.giveInventoryItem(user_id,'dinheirosujo',pagamento) -- DINHEIRO SUJO
            vRP.giveInventoryItem(user_id,'pecas',10) -- PEÇAS

            local puser_id = vRP.getUserByRegistration(placa)
            if puser_id then

				

               -- local value = vRP.getUData(puser_id,'vRP:multas')
                --local multas = json.decode(value) or 0
                --multas = multas + pagamento
              --  vRP.setUData(puser_id,'vRP:multas',json.encode(parseInt(multas)))

				local consult = vRP.query("SkS/selectMultas",{ user_id = puser_id })
				vRP.execute("SkS/multarSKS",{ user_id = puser_id, multas = consult[1].multas+pagamento}) 

                local nsource = vRP.getUserSource(puser_id)
                if nsource then
                    TriggerClientEvent('Notify', nsource, 'aviso', 'Você foi multado em <b>R$' .. vRP.format(pagamento) .. '</b> referente ao seguro do veículo <b>' .. nomeBonito .. ' (' .. nomeFeio .. ')</b>.')
                end
            end
            TriggerClientEvent('Notify', source, 'sucesso', 'Você recebeu <b>R$'..vRP.format(pagamento)..'</b> pelo desmanche de um <b>'..nomeBonito..' ('.. nomeFeio..' - PLACA [' .. placa .. '])</b>.' )
            SendWebhookMessage(desmanche,"```prolog\n[PASSAPORTE]: "..user_id.." \n[NOME]: "..identity.name.." "..identity.firstname.." \n[DESMANCHOU]: "..nomeBonito.."  \n[PLACA]: ".. placa .." \n[E RECEBEU]: ".. vRP.format(pagamento) .." "..os.date("\n[Data]: %d/%m/%y \n[Hora]: %H/%M/%S").." \r```")
        end
    end
end

