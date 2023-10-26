

-- config array (!)
config = {}

-- permissão global da staff
config.globalPerm = "admin.permissao"
-- comando padrão para abrir o menu, use "z" no começo do comando para esconde-lo das dicas do chat
config.openCommand = "admin"


-- tipos de grupo permitidos (definidos no "gtype" do groups.lua) na página de grupos da interface, cheque o arquivo de configuração dos grupos e verifique se todos possuem a tabela _config e um gtype
config.allowedGtype = { 
    { "admin" },
    { "job" },
}
--testez

-- armas permitidas para serem pegas na página de armas
config.allowedWeapons = {
    -- observação: todas essas armas foram testadas e funcionam em quase todo tipo de servidor, adicionar qualquer outra não é de responsabilidade da marca ou desenvolvedor, assegure que tudo que adicionar é compatível no seu caso.
    -- os tipos de armas suportados são: melee, handgun, submachine, assault, shotgun, throwable, rifle, special. não troque os tipos por nenhum outro que não esteja listado aqui 
    -- a interface segue a ordem dessa array, se você deseja mudar a ordem, apenas troque a ordem aqui
    { ['id'] = "WEAPON_KNIFE", ['index'] = "Faca", ['type'] = "melee" },
    { ['id'] = "WEAPON_DAGGER", ['index'] = "Adaga", ['type'] = "melee" },
    { ['id'] = "WEAPON_BAT", ['index'] = "Beisebol", ['type'] = "melee" },
    { ['id'] = "WEAPON_BOTTLE", ['index'] = "Garrafa", ['type'] = "melee" },
    { ['id'] = "WEAPON_CROWBAR", ['index'] = "Cabra", ['type'] = "melee" },
    { ['id'] = "WEAPON_FLASHLIGHT", ['index'] = "Lanterna", ['type'] = "melee" },
    { ['id'] = "WEAPON_GOLFCLUB", ['index'] = "Golf", ['type'] = "melee" },
    { ['id'] = "WEAPON_HAMMER", ['index'] = "Martelo", ['type'] = "melee" },
    { ['id'] = "WEAPON_HATCHET", ['index'] = "Machado", ['type'] = "melee" },
    { ['id'] = "WEAPON_KNUCKLE", ['index'] = "Ingles", ['type'] = "melee" },
    { ['id'] = "WEAPON_MACHETE", ['index'] = "Machete", ['type'] = "melee" },
    { ['id'] = "WEAPON_SWITCHBLADE", ['index'] = "Canivete", ['type'] = "melee" },
    { ['id'] = "WEAPON_NIGHTSTICK", ['index'] = "Cassetete", ['type'] = "melee" },
    { ['id'] = "WEAPON_WRENCH", ['index'] = "Grifo", ['type'] = "melee" },
    { ['id'] = "WEAPON_BATTLEAXE", ['index'] = "Batalha", ['type'] = "melee" },
    { ['id'] = "WEAPON_POOLCUE", ['index'] = "Sinuca", ['type'] = "melee" },
    { ['id'] = "WEAPON_STONE_HATCHET", ['index'] = "Pedra", ['type'] = "melee" },
	
    -- handguns
    { ['id'] = "WEAPON_PISTOL", ['index'] = "Pistol", ['type'] = "handgun" },
    { ['id'] = "WEAPON_PISTOL_MK2", ['index'] = "Pistol MK2", ['type'] = "handgun" },
    { ['id'] = "WEAPON_COMBATPISTOL", ['index'] = "CombatPistol", ['type'] = "handgun" },
    { ['id'] = "WEAPON_APPISTOL", ['index'] = "APPistol", ['type'] = "handgun" },
    { ['id'] = "WEAPON_STUNGUN", ['index'] = "StunGun", ['type'] = "handgun" },
    { ['id'] = "WEAPON_PISTOL50", ['index'] = "Pistol 50", ['type'] = "handgun" },
    { ['id'] = "WEAPON_SNSPISTOL", ['index'] = "SNS Pistol", ['type'] = "handgun" },
    { ['id'] = "WEAPON_HEAVYPISTOL", ['index'] = "Revolver", ['type'] = "handgun" },
    -- submachine guns
    { ['id'] = "WEAPON_SMG", ['index'] = "SMG", ['type'] = "submachine" },
    { ['id'] = "WEAPON_ASSAULTSMG", ['index'] = "Assault SMG", ['type'] = "submachine" },
    { ['id'] = "WEAPON_MICROSMG", ['index'] = "UZI", ['type'] = "submachine" },
    { ['id'] = "WEAPON_MACHINEPISTOL", ['index'] = "UZI Pistol", ['type'] = "submachine" },
    -- assault rifles
    { ['id'] = "WEAPON_CARBINERIFLE", ['index'] = "Carbine Rifle", ['type'] = "assault" },
    { ['id'] = "WEAPON_ASSAULTRIFLE", ['index'] = "AK-47", ['type'] = "assault" },
    { ['id'] = "WEAPON_CARBINERIFLE_MK2", ['index'] = "Carbine Rifle MK2", ['type'] = "assault" },
    { ['id'] = "WEAPON_ASSAULTRIFLE_MK2", ['index'] = "AK-47 mk2", ['type'] = "assault" },
    { ['id'] = "WEAPON_SPECIALCARBINE", ['index'] = "Special Carbine", ['type'] = "assault" },
    -- shotguns
    { ['id'] = "WEAPON_PUMPSHOTGUN", ['index'] = "PumpShotgun", ['type'] = "shotgun" },
    { ['id'] = "WEAPON_PUMPSHOTGUN_MK2", ['index'] = "PumpShotgun MK2", ['type'] = "shotgun" },
    { ['id'] = "WEAPON_ASSAULTSHOTGUN", ['index'] = "AssaultShotgun", ['type'] = "shotgun" },
    { ['id'] = "WEAPON_MUSKET", ['index'] = "Musket", ['type'] = "shotgun" },
    { ['id'] = "WEAPON_HEAVYSHOTGUN", ['index'] = "Heavy Shotgun", ['type'] = "shotgun" },
    -- throwables
    { ['id'] = "WEAPON_MOLOTOV", ['index'] = "Molotov", ['type'] = "throwable" },
    { ['id'] = "WEAPON_STICKYBOMB", ['index'] = "StickyBomb", ['type'] = "throwable" },
    { ['id'] = "WEAPON_FLARE", ['index'] = "Flare", ['type'] = "throwable" },
    -- sniper rifles
    { ['id'] = "WEAPON_SNIPERRIFLE", ['index'] = "Sniper", ['type'] = "rifle" },
    { ['id'] = "WEAPON_HEAVYSNIPER", ['index'] = "Heavy Sniper", ['type'] = "rifle" },
    { ['id'] = "WEAPON_MARKSMANRIFLE", ['index'] = "Marks Rifle", ['type'] = "rifle" },
    -- special weapons
    { ['id'] = "WEAPON_RPG", ['index'] = "RPG", ['type'] = "special" },
    { ['id'] = "WEAPON_MINIGUN", ['index'] = "Minigun", ['type'] = "special" },
    { ['id'] = "WEAPON_RAILGUN", ['index'] = "Railgun", ['type'] = "special" },
    { ['id'] = "WEAPON_GRENADELAUNCHER", ['index'] = "Lança Granadas", ['type'] = "special" },
    { ['id'] = "WEAPON_RAYPISTOL", ['index'] = "RayPistol", ['type'] = "special" },
}


-- armas permitidas para serem pegas na página de armas
config.itens = {
	["agua"] = { name = "Água" },

    ["dinheirosujo"] = { name = "Dinheiro Sujo"},		
-----------HOSPITAL
	["bandagem"] = { name = "Bandagem"},	
	 --;;;;;; REMEDIOS
	 ["xerelto"] = { name = "Xerelto", filtro = "box", type = "usar", descricao = "Remédio Utilizado para curar algo em você!" },
	 ["r-xerelto"] = { name = "Receita Xerelto", filtro = "box", type = "usar", descricao = "Receita médica para o rémedio xerelto." },
	 ["comuadin"] = {  name = "Comuadin", filtro = "box", type = "usar", descricao = "Remédio Utilizado para curar algo em você!" },
	 ["r-comuadin"] = {  name = "Receita Comuadin", filtro = "box", type = "usar", descricao = "Receita médica para o rémedio comuadin." },
	 ["dorflex"] = { name = "Dorflex", filtro = "box", type = "usar", descricao = "Remédio Utilizado para curar algo em você!" },
	 ["r-dorflex"] = {  name = "Receita Dorflex", filtro = "box", type = "usar", descricao = "Receita médica para o rémedio dorflex." },
	 ["cicatricure"] = { name = "Cicatricure", filtro = "box", type = "usar", descricao = "Remédio Utilizado para curar algo em você!" },
	 ["r-cicatricure"] = { name = "Receita Cicatricure", filtro = "box", type = "usar", descricao = "Receita médica para o rémedio cicatricure." },
	 ["paracetanal"] = {  name = "Paracetanal", filtro = "box", type = "usar", descricao = "Remédio Utilizado para curar algo em você!" },
	 ["r-paracetanal"] = { name = "Receita Paracetanal", filtro = "box", type = "usar", descricao = "Receita médica para o rémedio paracetanal." },
	 ["atestado"] = {  name = "Atestado Médico", filtro = "box", type = "usar", descricao = "Atestado assinado por um médico." },
--	 ["Rebite"] = { index = "Rebite", name = "Rebite", filtro = "box", type = "usar", descricao = "Remédio Utilizado para curar algo em você!" },
--	 ["r-rebite"] = { index = "r-rebite", name = "Receita Rebite", filtro = "box", type = "usar", descricao = "Receita médica para o rémedio rebite." },
------------- BEBIDAS
	["cerveja"] = {  name = "Cerveja",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida alcoólica, somenta para +18 anos!" },
	["tequila"] = {  name = "Tequila",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida alcoólica, somenta para +18 anos!" },
	["vodka"] = { name = "Vodka",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida alcoólica, somenta para +18 anos!" },
	["whisky"] = {  name = "Whisky",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida alcoólica, somenta para +18 anos!" },
	["absinto"] = {  name = "Absinto",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida alcoólica, somenta para +18 anos!" },
	["conhaque"] = {  name = "Conhaque",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida alcoólica, somenta para +18 anos!" },
  
	["agua"] = { name = "Agua",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida refrescante" },
	["garrafaaguavazia"] = {  name = "Garrafa de água vazia",filtro = "soda", type = "usar", funcao = false, descricao = "Garrafa vazia, pode tentar enche-la" },
	["limonada"] = {  name = "Limonada",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida refrescante" },
	["refrigerante"] = {  name = "Refrigerante",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida gaseificada refrescante" },
	["cafe"] = {  name = "Café",filtro = "soda", type = "usar", funcao = false, descricao = "Bebida quente e energética!" },
	["energetico"] = {  name = "Energetico", filtro = "soda", type = "usar", funcao = false, descricao = "Bebida fria e energética!" },
	["coquetelvanilla"] = {  name = "Coquetel Laranja", filtro = "soda", type = "usar", funcao = false, descricao = "Bebida fria de laranja, energética!" },		
	["coquetelvanilla2"] = { name = "Coquetel Morango", filtro = "soda", type = "usar", funcao = false, descricao = "Bebida fria de morango, mais energética, porém com alguns efeitos." },		

	------------- COMIDAS
	["pao"] = {  name = "Pão",filtro = "food", type = "usar", funcao = false, descricao = "Fatia de pão, utilizada para fazer lanches!" },
	["tomate"] = {  name = "Tomate",filtro = "food", type = "usar", funcao = false, descricao = "Ingrediente utilizado na receita dos lanches" },
	["hamburguer"] = {  name = "Hamburguer",filtro = "food", type = "usar", funcao = false, descricao = "Ingrediente principal para a receita dos lanches!" },
	["salsicha"] = {  name = "Salsicha",filtro = "food", type = "usar", funcao = false, descricao = "Ingrediente principal para a receita do hot-dog!" },

	["batata"] = { name = "Batata", filtro = "food", type = "usar", funcao = false, descricao = "Ingrediente utilizado na receita das batatas fritas!" },
	["embalagem"] = {  name = "Embalagem", filtro = "food", type = "usar", funcao = false, descricao = "Embalagem utilizada para colocar as batatas" },
	["queijo"] = {  name = "Queijo",filtro = "food", type = "usar", funcao = false, descricao = "Ingrediente utilizado na receita dos lanches e pizzas!" },
	["alface"] = {  name = "Alface",filtro = "food", type = "usar", funcao = false, descricao = "Ingrediente utilizado na receita dos lanches!" },
	["calabresa"] = {  name = "Calabresa",filtro = "food", type = "usar", funcao = false, descricao = "Ingrediente utilizado na receita da pizza!" },
	["farinha"] = {  name = "Farinha",filtro = "food", type = "usar", funcao = false, descricao = "Ingrediente principal para a receita da pizza" },
	["chocolate"] = {  name = "Chocolate",filtro = "food", type = "usar", funcao = false, descricao = "Sobremesa com alta caloria" },
	["laranja"] = {  name = "Laranja",filtro = "food", type = "usar", funcao = false, descricao = "Fruta novinha, geralmente utilizada para sucos ou drinks!" },
	["morango"] = {  name = "Morango",filtro = "food", type = "usar", funcao = false, descricao = "Fruta novinha, geralmente utilizada para sucos ou drinks!" },

	["salgadinho"] = {  name = "Salgadinho",filtro = "food", type = "usar", funcao = false, descricao = "Alimento com alta caloria, mas com pouca sacies" },
	["rosquinha"] = { name = "Rosquinha",filtro = "food", type = "usar", funcao = false, descricao = "Alimento com alta caloria, mas com pouca sacies" },
	["xburguer"] = {  name = "X-Burguer",filtro = "food", type = "usar", funcao = false, descricao = "X-Burguer delicioso com ingredientes de qualidade" },
	["xtudo"] = {  name = "X-Tudo",filtro = "food", type = "usar", funcao = false, descricao = "X-Tudo delicioso com ingredientes de qualidade" },

	["pizza"] = {  name = "Pizza",filtro = "food", type = "usar", funcao = false, descricao = "Pizza gostosa boa para matar a fome mama mia" },
	["hotdog"] = { name = "HotDog",filtro = "food", type = "usar", funcao = false, descricao = "Alimento gostoso, muito bom para matar a fome!" },
	["taco"] = {  name = "Taco",filtro = "food", type = "usar", funcao = false, descricao = "Comida mexicana, muito deliciosa!" },
	["batatinha"] = {  name = "Batatinha Frita", filtro = "food", type = "usar", funcao = false, descricao = "Deliciosa laranja, colhida em um pé maduro" },

	["sorvete"] = {  name = "Sorvete",filtro = "food", type = "usar", funcao = false, descricao = "Sorvete delicioso e geladinho." },
        ["coxinha"] = {  name = "Coxinha",filtro = "food", type = "usar", funcao = false, descricao = "Coxinha crocante de frango" },
        ["paodequeijo"] = {  name = "Pão de Queijo",filtro = "food", type = "usar", funcao = false, descricao = "Pão de queijo quentinho." },
        ["pastel"] = {  name = "Pastel",filtro = "food", type = "usar", funcao = false, descricao = "Pastel de queijo com uma massa exclusiva" },
        ["frango"] = { name = "Frango",filtro = "food", type = "usar", funcao = false, descricao = "Ingrediente utilizado na receita dos lanches!" },
---------------------------
	["roupas"] = { name = "Roupas", filtro = "box", type = "usar", funcao = false, descricao = "Lindas roupas, com ele é possivel alterar suas roupas" },
	["oculos"] = { name = "Óculo", filtro = "box", type = "usar", funcao = false, descricao = "Lindos óculos, com ele é possivel alterar seus óculos" },
	["mascara"] = { name = "Mascara", filtro = "box", type = "usar", funcao = false, descricao = "Lindas máscaras, com ele é possivel alterar sua máscara" },
	["chapeu"] = { name = "Chaéu", filtro = "box", type = "usar", funcao = false, descricao = "Lindos Chapéus, com ele é possivel alterar seus chapéus" },


	["couro"] = {  name = "Couro de Animal", filtro = "box", type = "usar", funcao = false, descricao = "Couro retirado de algum animal com uma faca!" },
	["carnecrua"] = { index = "carnecrua", name = "Carne Crua", filtro = "box", type = "usar", funcao = false, descricao = "Carne crua, cheia de sangue de algum animal silvestre" },

	["serra"] = {  name = "Serra", filtro = "box", type = "usar", funcao = false, descricao = "Serra nova, geralmente utilizada para serrar grandes ferros/aços" },		
	["furadeira"] = {  name = "Furadeira", filtro = "box", type = "usar", funcao = false, descricao = "Furadeira nova, geralmente utilizada para furar pequenos ferros/aços" },	
	["bombaadesiva"] = {  name = "Bomba Adesiva", filtro = "box", type = "usar", funcao = false, descricao = "Bomba com cola, com grande quantidade de polvora!" },	
	["notebook"] = {  name = "Notebook", filtro = "box", type = "usar", funcao = false, descricao = "Notebook novo ainda na garantia." },
	["notebookroubado"] = { name = "Notebook Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Notebook Desbloqueado" },
	["cartao"] = { name = "Cartão Limpo", filtro = "box", type = "usar", funcao = false, descricao = "Cartão Liso, sem identificação!" },
	["cartao1"] = {  name = "Cartão Classic Clonado", filtro = "box", type = "usar", funcao = false, descricao = "Cartão Classic do Banco do Brasil, identificação desconhecida" },
	["cartao2"] = {  name = "Cartão Gold Clonado", filtro = "box", type = "usar", funcao = false, descricao = "Cartão Gold do Banco do Brasil, identificação desconhecida" },
	["cartao3"] = {  name = "Cartão Platinium Clonado", filtro = "box", type = "usar", funcao = false, descricao = "Cartão Platinium do Banco do Brasil, identificação desconhecida" },
	["cartao4"] = {  name = "Cartão Black Clonado", filtro = "box", type = "usar", funcao = false, descricao = "Cartão Black do Banco do Brasil, identificação desconhecida" },


	["suspensaoar"] = { name = "Suspensão a Ar",filtro = "box", type = "usar", funcao = false, descricao = "Peça de suspensão a ar, aplicável em qualquer veículo!" },
	["moduloxenon"] = {  name = "Módulo de Xenon",filtro = "box", type = "usar", funcao = false, descricao = "Módulo de Xenon, aplicável em qualquer veículo!" },
	["moduloneon"] = {  name = "Módulo de Neon",filtro = "box", type = "usar", funcao = false, descricao = "Módulo RGB de Neon, aplicável em qualquer veículo!" },


	["plantademaconha"] = {name = "Planta de maconha", filtro = "box", type = "usar", funcao = false, descricao = "Planta de maconha, verdinha!" },	
	["cigarrodemaconha"] = {  name = "Cigarro de maconha", filtro = "box", type = "usar", funcao = false, descricao = "Cigarro bem bolado de maconha, da boa!" },	
	["cigarro"] = {  name = "Cigarro", filtro = "box", type = "usar", funcao = false, descricao = "Unidade de uma carteira de cigarro" },
	["isqueiro"] = {  name = "Isqueiro", filtro = "box", type = "usar", funcao = false, descricao = "Isqueiro para acender seu cigarro" },
	["seda"] = {  name = "Seda", filtro = "box", type = "usar", funcao = false, descricao = "Seda de boa qualidade, para bolar seu baseado" },

	["rosa"] = {name = "Rosa", filtro = "box", type = "usar", funcao = false, descricao = "Uma rosa bela e cheirosa" },
	["identidade"] = {  name = "Identidade", filtro = "box", type = "usar", funcao = false, descricao = "Sua identificação." },
	
	["pecas"] = {  name = "Peças", filtro = "box", type = "usar", funcao = false, descricao = "Peças de veiculo, com a numeração raspada." },
	["pistao"] = {  name = "Pistão", filtro = "box", type = "usar", funcao = false, descricao = "Pistão de veiculo, com a numeração raspada." },
	["lataria"] = {  name = "Lataria", filtro = "box", type = "usar", funcao = false, descricao = "Lataria de veiculo, com a numeração raspada." },

------------------ COLETE/FUNção
	["colete1"] = {  name = "Colete Balistico Leve", filtro = "box", type = "usar", funcao = "Dar colete", descricao = "Utilize colete para maior segurança na troca de tiro" },
	["colete2"] = {  name = "Colete Balistico Médio", filtro = "box", type = "usar", funcao = "Dar colete", descricao = "Utilize colete para maior segurança na troca de tiro" },
	["colete3"] = {  name = "Colete Balistico Pesado", filtro = "box", type = "usar", funcao = "Dar colete", descricao = "Utilize colete para maior segurança na troca de tiro" },

	--------------------
	["radio"] = {  name = "Radio", filtro = "box", type = "usar", funcao = false, descricao = "Rádio com diversas estações para conexão." },
	["celular"] = {  name = "Celular", filtro = "box", type = "usar", funcao = false, descricao = "Celular de última geração." },
	["celularqueimado"] = {  name = "Celular Queimado", filtro = "box", type = "usar", funcao = false, descricao = "Celular inutilizável, está quiemado!" },
	["mochila"] = {  name = "Mochila Pequena", filtro = "box", type = "usar", funcao = false, descricao = "Uma linda mochila pequena, ótima para carregar mais coisas." },
	["mochila2"] = { name = "Mochila Média", filtro = "box", type = "usar", funcao = false, descricao = "Uma linda mochila média, ótima para carregar mais coisas." },
	["mochila3"] = { name = "Mochila Grande", filtro = "box", type = "usar", funcao = false, descricao = "Uma linda mochila grande, ótima para carregar mais coisas." },

	["alianca"] = {  name = "Aliança", filtro = "box", type = "usar", funcao = false, descricao = "Linda aliança de casamento!"},
	["repairkit"] = {  name = "Kit de reparo", filtro = "box", type = "usar", funcao = false, descricao = "Kit de ferramentas para reparar um veículo danificado." },
	["nitro"] = { name = "Nitro", filtro = "box", type = "usar", funcao = false, descricao = "Cilindro de nitro, utilizado em veiculos para topspeed" },
	["pneu"] = {  name = "Pneu", filtro = "box", type = "usar", funcao = false, descricao = "Pneu novo, direto da fábrica e com garantia." },

	["smartwatch"] = {  name = "SmartWatch", filtro = "box", type = "usar", funcao = false, descricao = "Celular tecnológico, funções importantes como chamar os paramédicos automático." },

	["chipvip"] = {  name = "Chip VIP", filtro = "box", type = "usar", funcao = false, descricao = "Chip VIP" },
	["identidadevip"] = {  name = "Identidade VIP", filtro = "box", type = "usar", funcao = false, descricao = "Identidade VIP" },

	["skate"] = {  name = "Skate", filtro = "box", type = "usar", funcao = false, descricao = "Skate novo, assinado pelo Tony Hawk" },
	["algemas"] = {  name = "Algemas", filtro = "box", type = "usar", funcao = false, descricao = "Algemas de metal, muito utilizada pelos tiras." },	
	["calculadora"] = {  name = "Calculadora", filtro = "box", type = "usar", funcao = false, descricao = "Calculadora simples, boa para calculos" },
	["militec"] = { name = "Militec-1", filtro = "box", type = "usar", funcao = false, descricao = "Militec" },	
	["rastreador"] = { name = "Rastreador Veicular", filtro = "box", type = "usar", funcao = false, descricao = "Rastreador para veiculos" },		

	["alvejante"] = {  name = "Alvejante", filtro = "box", type = "usar", funcao = false, descricao = "Alvejante, ótimo para limpezadas" },
	["borrifador"] = { name = "Borrifador", filtro = "box", type = "usar", funcao = false, descricao = "Frasco para borrifar liquidos." },

	["discofreio"] = { name = "Disco de Freio", filtro = "box", type = "usar", funcao = false, descricao = "Disco de freio de veiculo, com a numeração raspada." },
	["motorcarro"] = { name = "Motor de carro", filtro = "box", type = "usar", funcao = false, descricao = "Motor de veiculo, com a numeração raspada." },
	["portacarro"] = { name = "Porta de carro", filtro = "box", type = "usar", funcao = false, descricao = "Porta de veiculo, com a numeração raspada." },
	["volante"] = { name = "Volante", filtro = "box", type = "usar", funcao = false, descricao = "Volante de veiculo, com a numeração raspada." },
	["parachoque"] = {  name = "Parachoque", filtro = "box", type = "usar", funcao = false, descricao = "Parachoque de veiculo, com a numeração raspada." },

	["ficha"] = { name = "Fichas do Casino", filtro = "box", type = "usar", funcao = false, descricao = "Fichas para apostar e tentar a sorte no Casino Diamond!" },
	["ticketroleta"] = {  name = "Ticket Roleta", filtro = "box", type = "usar", funcao = false, descricao = "Ticket para as roletas luxuosas para apostar e tentar a sorte de conseguir ótimos premios no Casino Diamond!" },

	["tora"] = {  name = "Tora de madeira", filtro = "box", type = "usar", funcao = false, descricao = "Tora de madeira, isso vale dinheiro!" },
	["capuz"] = {  name = "Capuz", filtro = "box", type = "usar", funcao = false, descricao = "Capuz preto, quem vestir isso não vai ver nada!" },	
	["lockpick"] = { name = "LockPick", filtro = "box", type = "usar", funcao = false, descricao = "Chave mestra para abrir veiculos, cuidado com a policia!" },	
	["masterpick"] = {  name = "Masterpick", filtro = "box", type = "usar", funcao = false, descricao = "Chave mestra para abrir veiculos, cuidado com a policia!" },	
	["placa"] = { name = "Placa", filtro = "box", type = "usar", funcao = false, descricao = "Placa veicular, geralmente utilizam para clonagem ou detran." },	

	------------------DROGAS------------
	["cannabis"] = {  name = "Cannabis", filtro = "box", type = "usar", funcao = false, descricao = "Cannabis" },		
	["adubo"] = {  name = "Adubo", filtro = "box", type = "usar", funcao = false, descricao = "Utilizado para adubar terras de plantações" },		
	["maconha"] = {  name = "Maconha", filtro = "box", type = "usar", funcao = false, descricao = "Folha de maconhas, bem verde." },	
	
	["metanfetamina"] = { name = "Metanfetamina", filtro = "box", type = "usar", funcao = false, descricao = "Metanfetamina pura, cristal de qualidade." },	
	["anfetamina"] = { name = "Anfetamina", filtro = "box", type = "usar", funcao = false, descricao = "Material utilizado para criação da metanfetamina!" },	
	
	["cocaina"] = { name = "Cocaina", filtro = "box", type = "usar", funcao = false, descricao = "Cocaina pura, pó de qualidade." },	

	["ziplock"] = { name = "Ziplock", filtro = "box", type = "usar", funcao = false, descricao = "Embalagem plástica vazia, geralmente utilizada para transporte de drogas!" },
	["ziplockmaconha"] = {  name = "Ziplock com Maconha", filtro = "box", type = "usar", funcao = false, descricao = "Embalagem plastica com 1g de maconha dentro!" },	
	["ziplockcocaina"] = {  name = "Ziplock com Cocaina", filtro = "box", type = "usar", funcao = false, descricao = "Embalagem plastica com 1g de cocaina dentro!" },	
	["ziplockmeta"] = {  name = "Ziplock com Metanfetamina", filtro = "box", type = "usar", funcao = false, descricao = "Embalagem plastica com 1g de metanfetamina dentro!" },		


	["ouro"] = { name = "Ouro", filtro = "box", type = "usar", funcao = false, descricao = "Pedra muito valiosa, isso vale dinheiro!" },	
	["ferro2"] = {  name = "Ferro", filtro = "box", type = "usar", funcao = false, descricao = "Material pesado e valioso, isso vale dinheiro!" },	
	["diamante2"] = {  name = "Diamante", filtro = "box", type = "usar", funcao = false, descricao = "Pedra muito valiosa, isso vale dinheiro!" },	

	["graosimpuros"] = {  name = "Grãos Impuros", filtro = "box", type = "usar", funcao = false, descricao = "Grãos impuros, isso deve ser limpo para a venda!" },
	["graos"] = { name = "Grãos", filtro = "box", type = "usar", funcao = false, descricao = "Grãos limpos, isso vale dinheiro!" },

	["ferramenta"] = { name = "Ferramenta", filtro = "box", type = "usar", funcao = false, descricao = "Itens utilizados pelos mecânicos" },
	["encomenda"] = {  name = "Encomenda", filtro = "box", type = "usar", funcao = false, descricao = "Encomendas de outras pessoas" },
	["garrafavazia"] = {  name = "Garrafa Vazia", filtro = "box", type = "usar", funcao = false, descricao = "Garrafa vazia, geralmente usada para encher com leite!" },
	["garrafadeleite"] = {  name = "Garrafa com Leite", filtro = "box", type = "usar", funcao = false, descricao = "Garrafa cheia de leitinho da vaca!"},

	["vara"] = { name = "Vara Pesca", filtro = "box", type = "usar", funcao = false, descricao = "Vara para pescas de grandes peixes!" },
	["isca"] = {  name = "Isca Pesca", filtro = "box", type = "usar", funcao = false, descricao = "Iscas utilizadas para as pescas!" },
	["dourado"] = {  name = "Dourado", filtro = "box", type = "usar", funcao = false, descricao = "Um lindo peixe, isso vale dinheiro ou uma boa refeição!" },
	["corvina"] = {  name = "Corvina", filtro = "box", type = "usar", funcao = false, descricao = "Um lindo peixe, isso vale dinheiro ou uma boa refeição!" },
	["salmao"] = {  name = "Salmão", filtro = "box", type = "usar", funcao = false, descricao = "Um lindo peixe, isso vale dinheiro ou uma boa refeição!" },
	["pacu"] = {  name = "Pacú", filtro = "box", type = "usar", funcao = false, descricao = "Um lindo peixe, isso vale dinheiro ou uma boa refeição!" },
	["pintado"] = {  name = "Pintado", filtro = "box", type = "usar", funcao = false, descricao = "Um lindo peixe, isso vale dinheiro ou uma boa refeição!" },
	["pirarucu"] = {  name = "Pirarucu", filtro = "box", type = "usar", funcao = false, descricao = "Um lindo peixe, isso vale dinheiro ou uma boa refeição!" },
	["tilapia"] = {  name = "Tilapia", filtro = "box", type = "usar", funcao = false, descricao = "Um lindo peixe, isso vale dinheiro ou uma boa refeição!" },
	["tucunare"] = { name = "Tucunare", filtro = "box", type = "usar", funcao = false, descricao = "Um lindo peixe, isso vale dinheiro ou uma boa refeição!" },
	["lambari"] = { name = "Lambari", filtro = "box", type = "usar", funcao = false, descricao = "Um lindo peixe, isso vale dinheiro ou uma boa refeição!" },

	["orgao"] = { name = "Órgão", filtro = "box", type = "usar", funcao = false, descricao = "Orgão de pessoas, cuidado!" },
	["orgaoamassado"] = {  name = "Órgão Amassado", filtro = "box", type = "usar", funcao = false, descricao = "Orgão de alguma pessoa amassada, oque é isso?" },
	["tartaruga"] = {  name = "Tartaruga", filtro = "box", type = "usar", funcao = false, descricao = "Tartura pequena, oque vai fazer com isso?" },
	["carnedetartaruga"] = {  name = "Carne de Tartaruga", filtro = "box", type = "usar", funcao = false, descricao = "Carne de tartaruga pequena, isso vale dinheiro!" },
	["pecaeletronica"] = { name = "Peças eletronicas", filtro = "box", type = "usar", funcao = false, descricao = "Peças de computador, oque vai fazer com isso?" },
	["computadormontado"] = {  name = "Computador Montado", filtro = "box", type = "usar", funcao = false, descricao = "Computador gaming montado, isso vale dinheiro!" },
	["identidadedigital"] = {  name = "Identidade digital", filtro = "box", type = "usar", funcao = false, descricao = "Identidade com name desconhecido, oque vai fazer com isso?" },
	["identidadefisica"] = {  name = "Identidade física", filtro = "box", type = "usar", funcao = false, descricao = "Identidade fisica com name desconhecido, isso deve valer dinheiro!" },
	["tecido"] = {  name = "Tecido", filtro = "box", type = "usar", funcao = false, descricao = "Tecido leve para fabricação de alguma peça de roupa" },
	["lingerie"] = {  name = "Lingerie", filtro = "box", type = "usar", funcao = false, descricao = "Lingerie sexy e vulgar." },

	["corda"] = { name = "Corda", filtro = "box", type = "usar", funcao = false, descricao = "Corda utilizada para amarrar e carregar algo" },


	["pano"] = {  name = "Pano", filtro = "box", type = "usar", funcao = false, descricao = "Dinheiro obtido de maneira lícita" },
	["linha"] = {  name = "Linha", filtro = "box", type = "usar", funcao = false, descricao = "Dinheiro obtido de maneira lícita" },
	["fibra"] = {  name = "Fibra", filtro = "box", type = "usar", funcao = false, descricao = "Dinheiro obtido de maneira lícita" },
	["etiqueta"] = {  name = "Etiqueta", filtro = "box", type = "usar", funcao = false, descricao = "Dinheiro obtido de maneira lícita" },
	["pendrive"] = {  name = "Pendrive", filtro = "box", type = "usar", funcao = false, descricao = "Dinheiro obtido de maneira lícita" },

	["raceticket"] = { name = "Ticket de Corrida", filtro = "box", type = "usar", funcao = false, descricao = "Ticket utilizado para participar de corridas ilegais pela cidade!" },

	["relogioroubado"] = {  name = "Relogio Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["pulseiraroubada"] = {  name = "Pulseira Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["colarroubado"] = {  name = "Colar Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["brincoroubado"] = {  name = "Brinco Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["carteiraroubada"] = {  name = "Carteira Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["carregadorroubado"] = {  name = "Carregador Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["tabletroubado"] = {  name = "Tablet Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["sapatosroubado"] = {  name = "Sapatos Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["vibradorroubado"] = {  name = "Vibrador Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["perfumeroubado"] = {  name = "Perfume Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["maquiagemroubada"] = {  name = "Maquiagem Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },
	["anelroubado"] = {name = "Anel Roubado", filtro = "box", type = "usar", funcao = false, descricao = "Item roubado e com grande valor, isso deve valer dinheiro!" },

	--------------------------------------------------------	
	------------ARMAS
	["corpo-assaultsmg"] = {  name = "Corpo MTAR 21", filtro = "arma", type = "usar", funcao = false, descricao = "Corpo de uma arma de fogo, isso pode fazer um armamento letal!" },
	["corpo-microsmg"] = {  name = "Corpo Micro SMG", filtro = "arma", type = "usar", funcao = false, descricao = "Corpo de uma arma de fogo, isso pode fazer um armamento letal!" },
	["corpo-ak47"] = {  name = "Corpo AK-47", filtro = "arma", type = "usar", funcao = false, descricao = "Corpo de uma arma de fogo, isso pode fazer um armamento letal!" },
	["corpo-mp5"] = {  name = "Corpo MP5", filtro = "arma", type = "usar", funcao = false, descricao = "Corpo de uma arma de fogo, isso pode fazer um armamento letal!" },
	["corpo-pistolmk2"] = {  name = "Corpo FiveSeven", filtro = "arma", type = "usar", funcao = false, descricao = "Corpo de uma arma de fogo, isso pode fazer um armamento letal!" },
	["corpo-revolver"] = {  name = "Corpo Revolver", filtro = "arma", type = "usar", funcao = false, descricao = "Corpo de uma arma de fogo, isso pode fazer um armamento letal!" },
	["corpo-thompson"] = {  name = "Corpo Thompson", filtro = "arma", type = "usar", funcao = false, descricao = "Corpo de uma arma de fogo, isso pode fazer um armamento letal!" },
	["placademetal"] = {  name = "Placa de Metal", filtro = "arma", type = "usar", funcao = false, descricao = "Placa resistente e geralmente utilizada para criação de armas!" },

	["mola"] = {  name = "Mola", filtro = "arma", type = "usar", funcao = false, descricao = "Molas utilizadas para fabricação de uma arma de fogo" },
	["gatilho"] = { name = "Gatilho", filtro = "arma", type = "usar", funcao = false, descricao = "Gatilhos utilizadas para fabricação de uma arma de fogo" },
	["capsula"] = {  name = "Capsula", filtro = "arma", type = "usar", funcao = false, descricao = "Capsula utilizada para fabricação da munição de uma arma de fogo" },
	["polvora"] = {  name = "Polvora", filtro = "arma", type = "usar", funcao = false, descricao = "Polvora utilizada para fabricação da munição de uma arma de fogo" },
	["carbono"] = {  name = "Carbono", filtro = "arma", type = "usar", funcao = false, descricao = "Carbono utilizada para fabricação da munição de uma arma de fogo" },

	["aco"] = {  name = "Aço", filtro = "arma", type = "usar", funcao = false, descricao = "Aço utilizado para fabricação de arma de fogo" },
	["pecadearma"] = { name = "Peças de armas", filtro = "arma", type = "usar", funcao = false, descricao = "Peças de armas utilizada para fabricação de arma de fogo" },
		----------- [ PACOTE MUNIÇÃO DAS ARMAS ] ---------

	["P-WEAPON_ASSAULTRIFLE"] = { name = "Pacote M.Ak-47", filtro = "box", type = "usar", funcao = false, descricao = "Caixa com 30 munições para a arma Ak-103" },
	["P-WEAPON_PISTOL_MK2"] = {  name = "Pacote M.Five Seven", filtro = "box", type = "usar", funcao = false, descricao = "Caixa com 30 munições para a arma Pistol MK2" },
	["P-WEAPON_ASSAULTSMG"] = {  name = "Pacote M.MTAR 21", filtro = "box", type = "usar", funcao = false, descricao = "Caixa com 30 munições para a arma Assault SMG" },
	["P-WEAPON_MICROSMG"] = {  name = "Pacote M.Uzi", filtro = "box", type = "usar", funcao = false, descricao = "Caixa com 30 munições para a arma Micro SMG" },
	["P-WEAPON_SMG"] = {  name = "Pacote M.MP5", filtro = "box", type = "usar", funcao = false, descricao = "Caixa com 30 munições para a arma SMG" },
	["P-WEAPON_REVOLVER"] = {  name = "Pacote M.Magnum 44", filtro = "box", type = "usar", funcao = false, descricao = "Caixa com 30 munições para a arma Revolver" },
	["P-WEAPON_GUSENBERG"] = {  name = "Pacote M.Thompson", filtro = "box", type = "usar", funcao = false, descricao = "Caixa com 30 munições para a arma Thompson" },


	["GADGET_PARACHUTE"] = { name = "Paraquedas", type = "equipar" },
	

  

}


config.sets = {
    ["admin"] = { ["nome"] = "Admin" },
	["mod"] = { ["nome"] = "Moderador" },
	["sup"] = { ["nome"] = "Suporte" },
	["aprovadorwl"] = { ["nome"] = "Aprovador WL" },

	["Concessionaria"] = { ["nome"] = "Concessionaria" },
	["DONOConcessionaria"] = { ["nome"] = "DONO Concessionaria" },

	["COMANDANTE"] = { ["nome"] = "Comandante PM" },
	["SUBCOMANDANTE"] = { ["nome"] = "Sub-Comandante PM" },

	["ROCAM1"] = { ["nome"] = "ROCAM Cabo" },
	["ROCAM2"] = { ["nome"] = "ROCAM Sargento" },
	["ROCAM3"] = { ["nome"] = "ROCAM Sub-Tenente" },
	["ROCAM4"] = { ["nome"] = "ROCAM Tenente" },
	["ROCAM5"] = { ["nome"] = "ROCAM Capitão" },
	["ROCAM6"] = { ["nome"] = "ROCAM Major" },
	["ROCAM7"] = { ["nome"] = "ROCAM Coronel" },

	["GRPAE1"] = { ["nome"] = "GRPAe Primeira Classe" },
	["GRPAE2"] = { ["nome"] = "GRPAe Segunda Classe" },
	["GRPAE3"] = { ["nome"] = "GRPAe Terceira Classe" },

	["PMESP1"] = { ["nome"] = "PMESP Recruta" },
	["PMESP2"] = { ["nome"] = "PMESP Soldado" },
	["PMESP3"] = { ["nome"] = "PMESP Cabo" },
	["PMESP4"] = { ["nome"] = "PMESP Sargento" },
	["PMESP5"] = { ["nome"] = "PMESP Sub-Tenente" },
	["PMESP6"] = { ["nome"] = "PMESP Tenente" },
	["PMESP7"] = { ["nome"] = "PMESP Capitão" },
	["PMESP8"] = { ["nome"] = "PMESP Major" },
	["PMESP9"] = { ["nome"] = "PMESP Coronel" },

	["PC1"] = { ["nome"] = "PC Investigador" },
	["PC2"] = { ["nome"] = "PC Per.Criminal" },
	["PC3"] = { ["nome"] = "PC Escrivão" },
	["PC4"] = { ["nome"] = "PC Delegado" },

	["PRF1"] = { ["nome"] = "PRF - Terceira Classe" },
	["PRF2"] = { ["nome"] = "PRF - Segunda Classe" },
	["PRF3"] = { ["nome"] = "PRF - Primeira Classe" },
	["PRF4"] = { ["nome"] = "PRF - Especial" },

	["FT1"] = { ["nome"] = "FT Soldado" },
	["FT2"] = { ["nome"] = "FT Cabo" },
	["FT3"] = { ["nome"] = "FT Sargento" },
	["FT4"] = { ["nome"] = "FT Sub-Tenente" },
	["FT5"] = { ["nome"] = "FT Tenente" },
	["FT6"] = { ["nome"] = "FT Capitão" },
	["FT7"] = { ["nome"] = "FT Major" },
	["FT8"] = { ["nome"] = "FT Ten.Coronel" },
	["FT9"] = { ["nome"] = "FT Coronel" },

	["BAEP1"] = { ["nome"] = "BAEP Soldado" },
	["BAEP2"] = { ["nome"] = "BAEP Cabo" },
	["BAEP3"] = { ["nome"] = "BAEP Sargento" },
	["BAEP4"] = { ["nome"] = "BAEP Sub-Tenente" },
	["BAEP5"] = { ["nome"] = "BAEP Tenente" },
	["BAEP6"] = { ["nome"] = "BAEP Capitão" },
	["BAEP7"] = { ["nome"] = "BAEP Major" },
	["BAEP8"] = { ["nome"] = "BAEP Ten.Coronel" },
	["BAEP9"] = { ["nome"] = "BAEP Coronel" },

	["ROTA1"] = { ["nome"] = "ROTA Soldado" },
	["ROTA2"] = { ["nome"] = "ROTA Cabo" },
	["ROTA3"] = { ["nome"] = "ROTA Sargento" },
	["ROTA4"] = { ["nome"] = "ROTA Sub-Tenente" },
	["ROTA5"] = { ["nome"] = "ROTA Tenente" },
	["ROTA6"] = { ["nome"] = "ROTA Capitão" },
	["ROTA7"] = { ["nome"] = "ROTA Major" },
	["ROTA8"] = { ["nome"] = "ROTA Ten.Coronel" },
	["ROTA9"] = { ["nome"] = "ROTA Coronel" },

	["EB1"] = { ["nome"] = "EB Soldado" },
	["EB2"] = { ["nome"] = "EB Cabo" },
	["EB3"] = { ["nome"] = "EB Sargento" },
	["EB4"] = { ["nome"] = "EB Sub-Tenente" },
	["EB5"] = { ["nome"] = "EB Tenente" },
	["EB6"] = { ["nome"] = "EB Capitão" },
	["EB7"] = { ["nome"] = "EB Major" },
	["EB8"] = { ["nome"] = "EB Coronel" },

	["Hospital1"] = { ["nome"] = "SAMU Estagiário" },
	["Hospital2"] = { ["nome"] = "SAMU Enfermeiro" },
	["Hospital3"] = { ["nome"] = "SAMU Paramédico" },
	["Hospital4"] = { ["nome"] = "SAMU Clinico" },
	["Hospital5"] = { ["nome"] = "SAMU Vice-Diretor" },
	["Hospital6"] = { ["nome"] = "SAMU Diretor" },

	["Bombeiro1"] = { ["nome"] = "SAMU Estagiário" },
	["Bombeiro2"] = { ["nome"] = "SAMU Enfermeiro" },
	["Bombeiro3"] = { ["nome"] = "SAMU Paramédico" },
	["Bombeiro4"] = { ["nome"] = "SAMU Clinico" },
	["Bombeiro5"] = { ["nome"] = "SAMU Vice-Diretor" },
	["Bombeiro6"] = { ["nome"] = "SAMU Diretor" },

	["Lider-Mecanico"] = { ["nome"] = "MECANICO Lider" },
	["Mecanico2"] = { ["nome"] = "MECANICO Gerente" },
	["Mecanico1"] = { ["nome"] = "MECANICO Membro" },

	["FARC1"] = { ["nome"] = "FARC Cabo" },
	["FARC2"] = { ["nome"] = "FARC Sargento" },
	["FARC3"] = { ["nome"] = "FARC Sub-Tenente" },
	["FARC4"] = { ["nome"] = "FARC Tenente" },
	["FARC5"] = { ["nome"] = "FARC Capitão" },
	["FARC6"] = { ["nome"] = "FARC Major" },
	["FARC7"] = { ["nome"] = "FARC Coronel" },

	["Advogado"] = { ["nome"] = "Advogado" },
	["Juiz"] = { ["nome"] = "Juiz" },

	["Taxista"] = { ["nome"] = "Taxista" },
	["Lider-Taxista"] = { ["nome"] = "Lider Taxista" },

	["Bronze"] = { ["nome"] = "Bronze" },
	["Prata"] = { ["nome"] = "Prata" },
	["Ouro"] = { ["nome"] = "Ouro" },
	["Platina"] = { ["nome"] = "Platina" },
	["Mochila"] = { ["nome"] = "Mochila" },
	["Spotify"] = { ["nome"] = "Spotify" },
	["VerificadoInsta"] = { ["nome"] = "VerificadoInsta" },
	["VipArmas"] = { ["nome"] = "VipArmas" },

	["BurguerShot1"] = { ["nome"] = "BurguerShot Funcionario" },
	["BurguerShot2"] = { ["nome"] = "BurguerShot Gerente" },
	["BurguerShot3"] = { ["nome"] = "BurguerShot Dono" },

	["Lider-Amarelos"] = { ["nome"] = "Amarelos Chefe" },
	["Amarelos2"] = { ["nome"] = "Amarelos Gerente" },
	["Amarelos1"] = { ["nome"] = "Amarelos Membro" },

	["Lider-Roxos"] = { ["nome"] = "Roxos Chefe" },
	["Roxos2"] = { ["nome"] = "Roxos Gerente" },
	["Roxos1"] = { ["nome"] = "Roxos Membro" },

	["Lider-Verdes"] = { ["nome"] = "Verdes Chefe" },
	["Verdes2"] = { ["nome"] = "Verdes Gerente" },
	["Verdes1"] = { ["nome"] = "Verdes Membro" },

	["Lider-Anonymous"] = { ["nome"] = "Anonymous Master" },
	["Anonymous2"] = { ["nome"] = "Anonymous Pleno" },
	["Anonymous1"] = { ["nome"] = "Anonymous Trainee" },

	["Lider-Driftking"] = { ["nome"] = "Driftking Chefe" },
	["Driftking2"] = { ["nome"] = "Driftking Gerente" },
	["Driftking1"] = { ["nome"] = "Driftking Membro" },

	["Lider-Bratva"] = { ["nome"] = "Bratva Chefe" },
	["Bratva2"] = { ["nome"] = "Bratva Gerente" },
	["Bratva1"] = { ["nome"] = "Bratva Membro" },

	["Lider-Cartel"] = { ["nome"] = "Cartel Chefe" },
	["Cartel2"] = { ["nome"] = "Cartel Gerente" },
	["Cartel1"] = { ["nome"] = "Cartel Membro" },

	["Lider-Soa"] = { ["nome"] = "Soa Chefe" },
	["Soa2"] = { ["nome"] = "Soa Gerente" },
	["Soa1"] = { ["nome"] = "Soa Membro" },

	["Lider-TheLost"] = { ["nome"] = "TheLost Chefe" },
	["TheLost2"] = { ["nome"] = "TheLost Gerente" },
	["TheLost1"] = { ["nome"] = "TheLost Membro" },

	["Lider-Vanilla"] = { ["nome"] = "Vanilla Chefe" },
	["Vanilla2"] = { ["nome"] = "Vanilla Gerente" },
	["Vanilla1"] = { ["nome"] = "Vanilla Membro" },

	["Lider-Casino"] = { ["nome"] = "Casino Chefe" },
	["Casino2"] = { ["nome"] = "Casino Gerente" },
	["Casino1"] = { ["nome"] = "Casino Membro" },

	["HabilitacaoA"] = { ["nome"] = "HabilitacaoA" },
	["HabilitacaoB"] = { ["nome"] = "HabilitacaoB" },
	["HabilitacaoAB"] = { ["nome"] = "HabilitacaoAB" },


}




-- all menu actions permissions
-- be aware that, this are global permissions, changing one action permission, will change all permissions related to this action in a global way in the panel
-- who can spawn vehicles
config.perm_QuickActions_SpawnVeh = {
    {"admin.permissao"},
}
-- who can kill a specified id
config.perm_QuickActions_Kill =  { 
    {"admin.permissao"},
}
-- who can kill all in the server
config.perm_QuickActions_KillAll = { 
    {"admin.permissao"},
}
-- who can revive, specified id or itself
config.perm_QuickActions_Revive = { 
    {"admin.permissao"},
}
-- who can revive all in the server
config.perm_QuickActions_ReviveAll = { 
    {"admin.permissao"},
}
-- who can upgrade it own vehicle
config.perm_QuickActions_UpgradeVeh = { 
    {"admin.permissao"},
}
-- who can add/remove people from whitelist and access the wl management page
config.perm_QuickActions_WLManage = { 
    {"admin.permissao"},
}
-- who can ban or unban people from the server
config.perm_QuickActions_BanManage = { 
    {"admin.permissao"},
}
-- who can kick all in the server
config.perm_QuickActions_KickAll = { 
    {"admin.permissao"},
}
-- who can kick a specified id
config.perm_QuickActions_KickID = { 
    {"admin.permissao"},
}

-- who can add/remove a group from any user and access the groups page
config.perm_GroupManagement = { 
    {"admin.permissao"},
}
-- who can take or give any item to any player including itself, and access the items page
config.perm_ItemManagement = {
    {"admin.permissao"},
}
-- who can add/remove a vehicle from any person's garage, and access the items page
config.perm_VehicleManagement = {
    {"admin.permissao"},
}
-- who can access the playerlist page and search an id
config.perm_PlayerManagement = {
    {"admin.permissao"},
}
-- who can notify any player, or the whole server
config.perm_NotifyPlayers = {
    {"admin.permissao"},
}
-- who can get itself's coordinates
config.perm_GetCoordinates = {
    {"admin.permissao"},
}
-- who can teleport itself to other players, or teleport other players to itself, or teleport itself to a waypoint
config.perm_TeleportPlayer = {
    {"admin.permissao"},
}
-- who can give/remove weapons to/from other players or itself
config.perm_WeaponManagement = {
    {"admin.permissao"},
}
-- who can give/set itself or other's money, and access the economy page
config.perm_MoneyManagement = {
    {"admin.permissao"},
}
-- who can see all menu logs
config.perm_SeeLogs = {
    {"admin.permissao"},
}
-- who can delete all menu logs
config.perm_EditLogs = {
    {"admin.permissao"},
}

-- images directory for item list
config.ItemDirectory = "http://181.215.253.55/skips/inventario"
-- images directory for vehicle list
config.VehicleDirectory = "http://181.215.253.55/skips/vehicles"
-- images directory for weapon list
config.WeaponDirectory = "http://181.215.253.55/skips/inventario/armas"

-- this is a test for the future ticket system, leave it blank.
config.openTicketCommand = "f6"

-- returns all config data (!)
return config