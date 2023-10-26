local cfg = {}

cfg.items = {
	["ferramenta"] = { "Ferramenta",3 },
	["encomenda"] = { "Encomenda",1.5 },
	["sacodelixo"] = { "Saco de Lixo",2 },
	["garrafavazia"] = { "Garrafa Vazia",0.2 },
	["garrafadeleite"] = { "Garrafa de Leite",0.5 },
	["tora"] = { "Tora de Madeira",0.6 },
	["alianca"] = { "Aliança",0 },
	["bandagem"] = { "Bandagem",0.7 },
	["cerveja"] = { "Cerveja",0.7 },
	["tequila"] = { "Tequila",0.7 },
	["roupas"] = { "Roupas",1.0 },
	["vodka"] = { "Vodka",0.7 },
	["furadeira"] = { "furadeira",3.0 },
	["serra"] = { "Serra",4.0 },
	["bombaadesiva"] = { "Bomba Adesiva",0.5 },
	["whisky"] = { "Whisky",0.7 },
	["plantademaconha"] = { "Pé de Maconha",0.7 },
	["rpprotecao"] = { "Colete Médico",1.0 },
	
	["colete1"] = { "Colete Leve",0.5 },
	["colete2"] = { "Colete Médio",1.0 },
	["colete3"] = { "Colete Pesado",1.5 },

	["xerelto"] = { "Xerelto",0.2 },
	["r-xerelto"] = { "Receita Xerelto",0.2 },
	["coumadin"] = { "Coumadin",0.2 },

	["cartaodebito"] = { "Cartão Débito",0 },

	["radio"] = { "Rádio",0.1 },
	["laudoteoricocnh"] = { "Laudo T. CNH",  0.1 },

	["r-coumadin"] = { "Receita Coumadin",0.2 },
	["dorflex"] = { "Dorflex",0.2 },
	["r-dorflex"] = { "Receita Dorflex",0.2 },
	["cicatricure"] = { "Cicatricure",0.2 },
	["r-cicatricure"] = { "Receita Cicatricure",0.2 },
	["paracetanal"] = { "Paracetanal",0.2 },
	["r-paracetanal"] = { "Receita Paracetanal",0.2 },
	["r-rebite"] = { "Receita Rebite",0.2 },
	["atestado"] = { "Atestado Médico",0.2 },

	["discofreio"] = { "Disco de Freio",1.0 },
	["motorcarro"] = { "Motor de Carro",1.0 },
	["motormoto"] = { "Motor de Moto",1.0 },
	["rodacarro"] = { "Roda de Carro",1.0 },
	["portacarro"] = { "Porta de Carro",1.0 },
	["volante"] = { "Volante de Carro",1.0 },
	["rodamoto"] = { "Roda de Moto",1.0 },
	["parachoque"] = { "Parachoque de Veículo",1.0 },

	["conhaque"] = { "Conhaque",0.7 },
	["absinto"] = { "Absinto",0.7 },
	["dinheirosujo"] = { "Dinheiro Sujo",0.0 },
	["dinheiro"] = { "Dinheiro",0.0 },
	["repairkit"] = { "Kit de Reparos",1.0 },
	["algemas"] = { "Algemas",1.0 },
	["calculadora"] = { "Calculadora",0.3 },
	["celular"] = { "Celular",0.5 },
	["capuz"] = { "Capuz",0.5 },
	["pneus"] = { "Pneus",1.0 },
	["smartwatch"] = { "SmartWatch",0.3 },
	["lockpick"] = { "Lockpick",10 },
	["masterpick"] = { "Masterpick",10 },
	["militec"] = { "Militec-1",0.8 },
	["carnedecormorao"] = { "Carne de Cormorão",0.7 },
	["carnedecorvo"] = { "Carne de Corvo",0.7 },

	["chipvip"] = { "chipvip",0.1 },
	["identidadevip"] = { "identidadevip",0.1 },

	["carnecrua"] = { "Carne Crua",0.2 },
	["couro"] = { "Couro de Animal",0.2 },
	["identidade"] = { "Identidade",0.0 },
	["rastreador"] = { "Rastreador",0.5 },
	["croquettes"] = { "Ração",0.05 },
	["cannabis"] = { "Cannabis",0.5 },
	["pseudoefedrina"] = { "Pseudoefedrina",0.5 },
	["anfetamina"] = { "Anfetamina",0.5 },
	["ritalina"] = { "Ritalina",0.5 },
	["metasuja"] = { "Metanfetamina Suja",0.5 },
	["nitro"] = { "nitro",0.5 },
	["acetofenetidina"] = { "Acetofenetidina",0.5 },
	["benzoilecgonina"] = { "Benzoilecgonina",0.5 },
	["cloridratoecgonina"] = { "Cloridratoecgonina",0.5 },
	["cloridratococa"] = { "Cloridratococa",0.5 },
	["pastadecoca"] = { "Pasta de Cocaina",0.5 },	
	["mouro"] = { "Ouro",0.8 },	
	["mferro"] = { "Ferro",0.5 },	
	["mbronze"] = { "Bronze",0.3 },	
	["mesmeralda"] = { "Esmeralda",0.6 },	
	["mrubi"] = { "Rubi",0.6 },	
	["diamante"] = { "Diamante",0.5 },	
    ["graosimpuros"] = { "Grãos impuros",0.2 },	
    ["graos"] = { "Grãos",0.2 },	
---------------------------------
    ["agua"] = { "Água",0.5 },	
    ["limonada"] = { "Limonada",0.4 },	
    ["refrigerante"] = { "Refrigerante",0.4 },	
    ["cafe"] = { "Café",0.4 },	
    ["pao"] = { "Pão",0.1 },	
    ["sanduiche"] = { "Sanduiche",0.1 },
    ["chocolate"] = { "chocolate",0.1 },
    ["salgadinho"] = { "salgadinho",0.1 },
    ["rosquinha"] = { "rosquinha",0.1 },
    ["pizza"] = { "pizza",0.2 },	


	["sorvete"] = { "sorvete",0.1 },
    ["coxinha"] = { "coxinha",0.1 },
    ["paodequeijo"] = { "paodequeijo",0.1 },
    ["pastel"] = { "pastel",0.1 },
    ["frango"] =	{ "frango",0.1 },
-------------------------------------------
	["corpo-assaultsmg"] = { "Corpo MTAR 21",0.8 },	
	["corpo-pistolmk2"] = { "Corpo Pistola MK2",0.4 },
	["corpo-microsmg"] = { "Corpo Micro SMG",0.8 },
	["corpo-ak47"] = { "Corpo AK-47",0.8 },
	["corpo-mp5"] = { "Corpo MP5",0.8 },
	["corpo-revolver"] = { "Corpo Revolver",0.4 },
	["corpo-thompson"] = { "Corpo Thompson",0.8 },
	["placademetal"] = { "Placa de Metal",0.6 },
	["mola"] = { "Mola",0.2 },
	["gatilho"] = { "Gatilho",0.2 },

	["capsula"] = { "Cápsula",0.03 },
	["polvora"] = { "Pólvora",0.03 },

	["carbono"] = { "Carbono",0.0038 },
	["ferro"] = { "Ferro",0.0038 },
	["aco"] = { "Aço",0.0015 },
	["pecadearma"] = { "pecadearma",0.0015 },
	-------------------------------------------
	-------------------------------------------

	["carnedeaguia"] = { "Carne de Águia",0.8 },
	["carnedecervo"] = { "Carne de Cervo",0.9 },
	["carnedecoelho"] = { "Carne de Coelho",0.7 },
	["carnedecoyote"] = { "Carne de Coyote",1 },
	["carnedelobo"] = { "Carne de Lobo",1 },
	["carnedepuma"] = { "Carne de Puma",1.3 },
	["carnedejavali"] = { "Carne de Javali",1.4 },
	["isca"] = { "Isca",0.6 },
	["dourado"] = { "Dourado",0.6 },
	["corvina"] = { "Corvina",0.6 },
	["salmao"] = { "Salmão",0.6 },
	["pacu"] = { "Pacu",0.6 },
	["pintado"] = { "Pintado",0.6 },
	["pirarucu"] = { "Pirarucu",0.6 },
	["tilapia"] = { "Tilápia",0.6 },
	["tucunare"] = { "Tucunaré",0.6 },
	["lambari"] = { "Lambari",0.6 },
	["energetico"] = { "Energético",0.3 },
	["mochila"] = { "Mochila",1 },
	["adubo"] = { "Adubo",0.8 },
	["fertilizante"] = { "Fertilizante",0.8 },
	["maconha"] = { "Maconha",0.8 },
	["placa"] = { "Placa",0.8 },
	["rebite"] = { "Rebite",0.8 },
	["orgao"] = { "Órgão",1.2 },


	["ficha"] = { "Ficha Casino",0.0 },
	["ticketroleta"] = { "Ticket Roleta",0.0 },

	["corda"] = { "Corda",0.3 },

	["pano"] = { "Pano",0.5 },
	["linha"] = { "Linha",0.3 },
	["fibra"] = { "Fibra",0.3 },


	["etiqueta"] = { "Etiqueta",0 },
	["pendrive"] = { "Pendrive",0.1 },
	["relogioroubado"] = { "Relógio Roubado",0.3 },
	["pulseiraroubada"] = { "Pulseira Roubada",0.2 },
	["anelroubado"] = { "Anel Roubado",0.2 },
	["colarroubado"] = { "Colar Roubado",0.2 },
	["brincoroubado"] = { "Brinco Roubado",0.2 },
	["carteiraroubada"] = { "Carteira Roubada",0.2 },
	["carregadorroubado"] = { "Carregador Roubado",0.2 },
	["tabletroubado"] = { "Tablet Roubado",0.2 },
	["sapatosroubado"] = { "Sapatos Roubado",0.2 },
	["vibradorroubado"] = { "Vibrador Roubado",0.2 },
	["perfumeroubado"] = { "Perfume Roubado",0.2 },
	["maquiagemroubada"] = { "Maquiagem Roubada",0.2 },
	
	-- Farm de Metanfetamina
	["acucar"] = { "Açucar",0.8 },
	["xarope"] = { "Xarope",0.8 },
	["metanfetamina"] = { "Metanfetamina",0.8 },
	
	-- Farm de Cocaína
	["folhacoca"] = { "Folha Cocaina",0.3 },
	["po"] = { "Pó",0.3 },
	["cocaina"] = { "Cocaína",0.5 }
}

local function load_item_pack(name)
	local items = module("cfg/item/"..name)
	if items then
		for k,v in pairs(items) do
			cfg.items[k] = v
		end
	end
end

load_item_pack("armamentos")

return cfg