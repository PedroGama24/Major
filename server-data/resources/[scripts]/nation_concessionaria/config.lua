local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

config = {}
Proxy.addInterface("nation_concessionaria", config)


config.imgDir = "http://127.0.0.1/vrp_images/" -- DIRETORIO DAS IMAGENS DOS VEÍCULOS

-- LISTA DOS VEÍCULOS EM DESTAQUE

config.topVehicles = {	 
	"cog552",
	"italigto"
}

config.logo = "https://media.discordapp.net/attachments/1148611885256691753/1166452683511693323/logo_major.png?ex=6553c537&is=65415037&hm=c8e5a667055c0a66f5b981735af81701d8ff22a6ea1214fc675811221cefeedb&=" -- LOGO DO SERVIDOR

config.defaultImg = "https://cdn.discordapp.com/attachments/760919789065207910/879443659706236958/carro.png" -- IMAGEM DEFAULT (SERÁ EXIBIDA QUANDO NÃO EXISTIR A IMAGEM DE ALGUM VEÍCULO NO DIRETÓRIO ESPECIFICADO)

config.openconce_permission = nil -- permissao para abrir a concessionaria

config.updateconce_permission = "conce.permissao" -- permissao para abrir o menu de gerenciamento da conce

config.porcentagem_venda = 50 -- porcentagem de venda dos veículos possuidos

config.porcentagem_testdrive = 0.1 -- porcentagem do valor do veículo paga para a realização do test drive

config.tempo_testdrive = 45 -- tempo de duração do test drive em segundos

config.maxDistance = 310 -- distância máxima (em radius(raio)) que o player poderá ir quando estiver realizando o test drive

config.porcentagem_aluguel = 1 -- porcentagem do valor do veículo paga para alugar

-- CLASSES QUE APARECEM NO MENU DA CONCE

config.conceClasses = {
	{ class = "sedans", img = "https://cdn.discordapp.com/attachments/879508287198990336/879514948491968532/skipssedan.png" },
	{ class = "suvs", img = "https://cdn.discordapp.com/attachments/879508287198990336/879515984849948712/skipssuv.png" },
	{ class = "imports", img = "https://cdn.discordapp.com/attachments/879508287198990336/879510729965838386/skipsimports.png" },
	{ class = "trucks", img = "https://cdn.discordapp.com/attachments/879508287198990336/879513037420245082/skipstrucks.png" },
	{ class = "motos", img = "https://cdn.discordapp.com/attachments/879508287198990336/879517014979403776/skipsmotos.png" },
	{ class = "outros", img = "https://cdn.discordapp.com/attachments/879508287198990336/879518123353571348/skipsoutros.png" },
}

-- IMAGEM QUE APARECE NA SEÇÃO DE 'MEUS VEÍCULOS'

config.myVehicles_img = "https://cdn.discordapp.com/attachments/879508287198990336/879519059379634186/skipsgaragem.png"

-- CLASSES DOS VEÍCULOS INSERIDAS DENTRO DAS CLASSES QUE APARECEM NA CONCE

config.availableClasses = {
	["sedans"] = {"sedan"},
	["suvs"] = {"suv"},
	["imports"] = {"classic", "sport", "super"},  
	["trucks"] = {"industrial", "utility", "commercial"},
	["motos"] = {"moto", "cycle"},
	["outros"] = {"compact", "coupé", "muscle", "off-road",  "boat",  "helicopter",  "plane",  "service", "emergency",  "military",  "train", "van"}
}

-- ÍCONES DA CONCE

config.miscIcons = {
	{ description = "Força e velocidade necessárias para aquela dose de adrenalina.", img = "https://cdn.discordapp.com/attachments/879508287198990336/938886246367887390/skipsturbo.png" },
	{ description = "Incríveis opções econômicas que cabem no seu bolso!", img = "https://cdn.discordapp.com/attachments/879508287198990336/938886246141415455/skipspoupanca.png" },
	{ description = "Para você que valoriza a eficácia e praticidade.", img = "https://cdn.discordapp.com/attachments/879508287198990336/938886246627938384/skipspositivo.png" },
}

-- DESCONTOS POR PERMISSAO

config.descontos = {
	{ perm = "admin.permissao", porcentagem =  25 },
	{ perm = "conce.permissao", porcentagem =  15 },
	{ perm = "platina.permissao", porcentagem =  10 },
	{ perm = "ouro.permissao", porcentagem =  5 },
	{ perm = "prata.permissao", porcentagem = 2 }
}

-- cada veículo deve conter => { hash, name, price, banido, modelo, capacidade, tipo }

config.vehList = {
	------------------------  COMPACTS  -------------------------------------------
	{ hash = -344943009, name = 'blista', price = 50000, banido = false, modelo = 'Blista', capacidade = 30, tipo = 'carros' },
	{ hash = 1549126457, name = 'brioso', price = 50000, banido = false, modelo = 'Brioso', capacidade = 20, tipo = 'carros' },
	{ hash = -1130810103, name = 'dilettante', price = 40000, banido = false, modelo = 'Dilettante', capacidade = 30, tipo = 'carros' },
	{ hash = -1177863319, name = 'issi2', price = 80000, banido = false, modelo = 'Issi', capacidade = 20, tipo = 'carros' },
	{ hash = 931280609, name = 'issi3', price = 35000, banido = false, modelo = 'Issi 1980', capacidade = 20, tipo = 'carros' },
	{ hash = -431692672, name = 'panto', price = 32000, banido = false, modelo = 'Panto', capacidade = 30, tipo = 'carros' },
	{ hash = -1450650718, name = 'prairie', price = 40000, banido = false, modelo = 'Prairie', capacidade = 30, tipo = 'carros' },
	{ hash = 841808271, name = 'rhapsody', price = 30000, banido = false, modelo = 'Rhapsody', capacidade = 30, tipo = 'carros' },

	------------------------COUPES-------------------------------------------
	{ hash = 330661258, name = 'cogcabrio', price = 100000, banido = false, modelo = 'Cogcabrio', capacidade = 50, tipo = 'carros' },
	{ hash = -5153954, name = 'exemplar', price = 120000, banido = false, modelo = 'Exemplar', capacidade = 50, tipo = 'carros' },
	{ hash = -591610296, name = 'f620', price = 100000, banido = false, modelo = 'F620', capacidade = 40, tipo = 'carros' },
	{ hash = -391594584, name = 'felon', price = 70000, banido = false, modelo = 'Felon', capacidade = 60, tipo = 'carros' },
	{ hash = -89291282, name = 'felon2', price = 90000, banido = false, modelo = 'Felon Conv.', capacidade = 40, tipo = 'work' },
	{ hash = -624529134, name = 'jackal', price = 70000, banido = false, modelo = 'Jackal', capacidade = 60, tipo = 'carros' },
	{ hash = 1348744438, name = 'oracle', price = 70000, banido = false, modelo = 'Oracle', capacidade = 60, tipo = 'carros' },
	{ hash = -511601230, name = 'oracle2', price = 90000, banido = false, modelo = 'Oracle Conv.', capacidade = 40, tipo = 'carros' },
	{ hash = 1349725314, name = 'sentinel', price = 80000, banido = false, modelo = 'Sentinel', capacidade = 40, tipo = 'carros' },
	{ hash = 873639469, name = 'sentinel2', price = 100000, banido = false, modelo = 'Sentinel Conv.', capacidade = 40, tipo = 'carros' },
	{ hash = 1581459400, name = 'windsor', price = 120000, banido = false, modelo = 'Windsor', capacidade = 40, tipo = 'carros' },
	{ hash = -1930048799, name = 'windsor2', price = 150000, banido = false, modelo = 'Windsor Conv.', capacidade = 40, tipo = 'carros' },
	{ hash = -1122289213, name = 'zion', price = 60000, banido = false, modelo = 'Zion', capacidade = 40, tipo = 'carros' },
	{ hash = -1193103848, name = 'zion2', price = 80000, banido = false, modelo = 'Zion Conv.', capacidade = 40, tipo = 'carros' },

    ------------------------TRUCKS-------------------------------------------
	{ hash = 2053223216, name = 'benson', price = 700000, banido = false, modelo = 'Benson', capacidade = 250, tipo = 'work' },
	{ hash = 904750859, name = 'mule', price = 500000, banido = false, modelo = 'Mule', capacidade = 150, tipo = 'work' },
	{ hash = 2112052861, name = 'pounder', price = 1000000, banido = false, modelo = 'Pounder', capacidade = 320, tipo = 'work' },

	{ hash = -2107990196, name = 'guardian', price = 540000, banido = false, modelo = 'Guardian', capacidade = 150, tipo = 'carros' },

    ------------------------MOTORCYCLES-------------------------------------------
	{ hash = 1672195559, name = 'akuma', price = 500000, banido = false, modelo = 'Akuma', capacidade = 15, tipo = 'motos' },
	{ hash = -2115793025, name = 'avarus', price = 300000, banido = false, modelo = 'Avarus', capacidade = 15, tipo = 'motos' },
	{ hash = -2140431165, name = 'bagger', price = 320000, banido = false, modelo = 'Bagger', capacidade = 40, tipo = 'motos' },
	{ hash = -114291515, name = 'bati', price = 370000, banido = false, modelo = 'Bati', capacidade = 15, tipo = 'motos' },
	{ hash = -891462355, name = 'bati2', price = 400000, banido = false, modelo = 'Bati2', capacidade = 15, tipo = 'motos' },
	{ hash = 86520421, name = 'bf400', price = 320000, banido = false, modelo = 'Bf400', capacidade = 15, tipo = 'motos' },
	{ hash = 11251904, name = 'carbonrs', price = 400000, banido = false, modelo = 'Carbonrs', capacidade = 15, tipo = 'motos' },
	{ hash = 6774487, name = 'chimera', price = 450000, banido = false, modelo = 'Chimera', capacidade = 15, tipo = 'motos' },
	{ hash = 390201602, name = 'cliffhanger', price = 310000, banido = false, modelo = 'Cliffhanger', capacidade = 15, tipo = 'motos' },
	{ hash = 2006142190, name = 'daemon', price = 200000, banido = false, modelo = 'Daemon', capacidade = 15, tipo = 'work' },
	{ hash = -1404136503, name = 'daemon2', price = 240000, banido = false, modelo = 'Daemon2', capacidade = 15, tipo = 'motos' },
	{ hash = 822018448, name = 'defiler', price = 460000, banido = false, modelo = 'Defiler', capacidade = 15, tipo = 'motos' },
	{ hash = -239841468, name = 'diablous', price = 430000, banido = false, modelo = 'Diablous', capacidade = 15, tipo = 'motos' },
	{ hash = 1790834270, name = 'diablous2', price = 460000, banido = false, modelo = 'Diablous2', capacidade = 15, tipo = 'motos' },
	{ hash = -1670998136, name = 'double', price = 400000, banido = false, modelo = 'Double', capacidade = 15, tipo = 'motos' },
	{ hash = 1753414259, name = 'enduro', price = 100000, banido = false, modelo = 'Enduro', capacidade = 15, tipo = 'motos' },
	{ hash = 2035069708, name = 'esskey', price = 280000, banido = false, modelo = 'Esskey', capacidade = 15, tipo = 'motos' },
	{ hash = -1842748181, name = 'faggio', price = 30000, banido = false, modelo = 'Faggio', capacidade = 30, tipo = 'motos' },
	{ hash = 55628203, name = 'faggio2', price = 20000, banido = false, modelo = 'Faggio 90', capacidade = 30, tipo = 'motos' },
	{ hash = -1289178744, name = 'faggio3', price = 12000, banido = false, modelo = 'Faggio 79', capacidade = 30, tipo = 'motos' },
	{ hash = 627535535, name = 'fcr', price = 250000, banido = false, modelo = 'Fcr', capacidade = 15, tipo = 'motos' },
	{ hash = -757735410, name = 'fcr2', price = 300000, banido = false, modelo = 'Fcr2', capacidade = 15, tipo = 'motos' },
	{ hash = 741090084, name = 'gargoyle', price = 190000, banido = false, modelo = 'Gargoyle', capacidade = 15, tipo = 'motos' },
	{ hash = 1265391242, name = 'hakuchou', price = 380000, banido = false, modelo = 'Hakuchou', capacidade = 15, tipo = 'motos' },
	{ hash = -255678177, name = 'hakuchou2', price = 550000, banido = false, modelo = 'Hakuchou2', capacidade = 15, tipo = 'motos' },
	{ hash = 301427732, name = 'hexer', price = 250000, banido = false, modelo = 'Hexer', capacidade = 15, tipo = 'motos' },
	{ hash = -159126838, name = 'innovation', price = 250000, banido = false, modelo = 'Innovation', capacidade = 15, tipo = 'motos' },
	{ hash = 640818791, name = 'lectro', price = 380000, banido = false, modelo = 'Lectro', capacidade = 15, tipo = 'motos' },
	{ hash = -1523428744, name = 'manchez', price = 300000, banido = false, modelo = 'Manchez', capacidade = 15, tipo = 'motos' },
	{ hash = -634879114, name = 'nemesis', price = 345000, banido = false, modelo = 'Nemesis', capacidade = 15, tipo = 'motos' },
	{ hash = -1606187161, name = 'nightblade', price = 415000, banido = false, modelo = 'Nightblade', capacidade = 15, tipo = 'motos' },
	{ hash = -909201658, name = 'pcj', price = 230000, banido = false, modelo = 'Pcj', capacidade = 15, tipo = 'motos' },
	{ hash = -893578776, name = 'ruffian', price = 345000, banido = false, modelo = 'Ruffian', capacidade = 15, tipo = 'motos' },
	{ hash = -1453280962, name = 'sanchez2', price = 185000, banido = false, modelo = 'Sanchez2', capacidade = 15, tipo = 'motos' },
	{ hash = 1491277511, name = 'sanctus', price = 220000, banido = false, modelo = 'Sanctus', capacidade = 15, tipo = 'work' },
	{ hash = 743478836, name = 'sovereign', price = 285000, banido = false, modelo = 'Sovereign', capacidade = 50, tipo = 'motos' },
	{ hash = 1836027715, name = 'thrust', price = 375000, banido = false, modelo = 'Thrust', capacidade = 15, tipo = 'motos' },
	{ hash = -140902153, name = 'vader', price = 345000, banido = false, modelo = 'Vader', capacidade = 15, tipo = 'motos' },
	{ hash = -1353081087, name = 'vindicator', price = 340000, banido = false, modelo = 'Vindicator', capacidade = 15, tipo = 'motos' },
	{ hash = -609625092, name = 'vortex', price = 375000, banido = false, modelo = 'Vortex', capacidade = 15, tipo = 'motos' },
	{ hash = -618617997, name = 'wolfsbane', price = 290000, banido = false, modelo = 'Wolfsbane', capacidade = 15, tipo = 'motos' },
	{ hash = -1009268949, name = 'zombiea', price = 290000, banido = false, modelo = 'Zombiea', capacidade = 15, tipo = 'motos' },
	{ hash = -570033273, name = 'zombieb', price = 300000, banido = false, modelo = 'Zombieb', capacidade = 15, tipo = 'motos' },
	{ hash = -2128233223, name = 'blazer', price = 230000, banido = true, modelo = 'Blazer', capacidade = 15, tipo = 'motos' },
	{ hash = -440768424, name = 'blazer4', price = 370000, banido = true, modelo = 'Blazer4', capacidade = 15, tipo = 'motos' },
	{ hash = 1873600305, name = 'ratbike', price = 150000, banido = false, modelo = 'Ratbike', capacidade = 15, tipo = 'motos' },


	 ------------------------MUSCLE-------------------------------------------
	 { hash = -1205801634, name = 'blade', price = 110000, banido = false, modelo = 'Blade', capacidade = 40, tipo = 'carros' },
	 { hash = 784565758, name = 'coquette3', price = 195000, banido = false, modelo = 'Coquette3', capacidade = 40, tipo = 'carros' },
	 { hash = -682211828, name = 'buccaneer', price = 130000, banido = false, modelo = 'Buccaneer', capacidade = 50, tipo = 'carros' },
	 { hash = -1013450936, name = 'buccaneer2', price = 260000, banido = false, modelo = 'Buccaneer2', capacidade = 60, tipo = 'carros' },
	 { hash = -1361687965, name = 'chino2', price = 200000, banido = false, modelo = 'Chino2', capacidade = 60, tipo = 'work' },
	 { hash = -986944621, name = 'dominator3', price = 370000, banido = false, modelo = 'Dominator3', capacidade = 30, tipo = 'carros' },
    { hash = 80636076, name = 'dominator', price = 230000, banido = false, modelo = 'Dominator', capacidade = 50, tipo = 'carros' },
	{ hash = 723973206, name = 'dukes', price = 150000, banido = false, modelo = 'Dukes', capacidade = 40, tipo = 'carros' },
	{ hash = -2119578145, name = 'faction', price = 150000, banido = false, modelo = 'Faction', capacidade = 50, tipo = 'carros' },
	{ hash = -1800170043, name = 'gauntlet', price = 165000, banido = false, modelo = 'Gauntlet', capacidade = 40, tipo = 'carros' },
	{ hash = 15219735, name = 'hermes', price = 280000, banido = false, modelo = 'Hermes', capacidade = 50, tipo = 'carros' },
	{ hash = 37348240, name = 'hotknife', price = 180000, banido = false, modelo = 'Hotknife', capacidade = 30, tipo = 'carros' },
	{ hash = -2096690334, name = 'impaler', price = 320000, banido = false, modelo = 'Impaler', capacidade = 60, tipo = 'carros' },
	{ hash = 525509695, name = 'moonbeam', price = 220000, banido = false, modelo = 'Moonbeam', capacidade = 80, tipo = 'carros' },
	{ hash = -1943285540, name = 'nightshade', price = 270000, banido = false, modelo = 'Nightshade', capacidade = 30, tipo = 'carros' },
	{ hash = 1507916787, name = 'picador', price = 150000, banido = false, modelo = 'Picador', capacidade = 90, tipo = 'carros' },
	{ hash = -589178377, name = 'ratloader2', price = 150000, banido = false, modelo = 'Ratloader2', capacidade = 85, tipo = 'work' },
	{ hash = -227741703, name = 'ruiner', price = 150000, banido = false, modelo = 'Ruiner', capacidade = 50, tipo = 'carros' },
	{ hash = -1685021548, name = 'sabregt', price = 260000, banido = false, modelo = 'Sabregt', capacidade = 60, tipo = 'carros' },
	{ hash = 1923400478, name = 'stalion', price = 150000, banido = false, modelo = 'Stalion', capacidade = 30, tipo = 'carros' },
	{ hash = 972671128, name = 'tampa', price = 170000, banido = false, modelo = 'Tampa', capacidade = 40, tipo = 'carros' },
	{ hash = -49115651, name = 'vamos', price = 320000, banido = false, modelo = 'Vamos', capacidade = 60, tipo = 'carros' },
	{ hash = -825837129, name = 'vigero', price = 170000, banido = false, modelo = 'Vigero', capacidade = 30, tipo = 'carros' },
	{ hash = -498054846, name = 'virgo', price = 150000, banido = false, modelo = 'Virgo', capacidade = 60, tipo = 'carros' },
	{ hash = 2006667053, name = 'voodoo', price = 220000, banido = false, modelo = 'Voodoo', capacidade = 60, tipo = 'carros' },
	{ hash = 1871995513, name = 'yosemite', price = 350000, banido = false, modelo = 'Yosemite', capacidade = 90, tipo = 'carros' },

	------------------------Off-Road-------------------------------------------
	{ hash = 1126868326, name = 'bfinjection', price = 80000, banido = false, modelo = 'Bfinjection', capacidade = 20, tipo = 'carros' },
	{ hash = -2064372143, name = 'mesa3', price = 200000, banido = false, modelo = 'Mesa3', capacidade = 60, tipo = 'carros' },
	{ hash = -349601129, name = 'bifta', price = 190000, banido = false, modelo = 'Bifta', capacidade = 20, tipo = 'carros' },
	{ hash = -1237253773, name = 'dubsta3', price = 300000, banido = false, modelo = 'Dubsta3', capacidade = 80, tipo = 'carros' },
	{ hash = 1645267888, name = 'rancherxl', price = 220000, banido = false, modelo = 'Rancherxl', capacidade = 70, tipo = 'carros' },
	{ hash = -1532697517, name = 'riata', price = 250000, banido = false, modelo = 'Riata', capacidade = 70, tipo = 'carros' },
	{ hash = -1189015600, name = 'sandking', price = 400000, banido = false, modelo = 'Sandking', capacidade = 100, tipo = 'carros' },
	{ hash = 989381445, name = 'sandking2', price = 370000, banido = false, modelo = 'Sandking2', capacidade = 100, tipo = 'carros' },
	
	------------------------ SUVS -------------------------------------------
	{ hash = -808831384, name = 'baller', price = 220000, banido = false, modelo = 'Baller', capacidade = 50, tipo = 'carros' },
	{ hash = 1878062887, name = 'baller3', price = 320000, banido = false, modelo = 'Baller3', capacidade = 50, tipo = 'carros' },
	{ hash = -599568815, name = 'sadler', price = 180000, banido = false, modelo = 'Sadler', capacidade = 70, tipo = 'carros' },
	{ hash = 850565707, name = 'bjxl', price = 210000, banido = false, modelo = 'Bjxl', capacidade = 50, tipo = 'carros' },
	{ hash = 2006918058, name = 'cavalcade', price = 170000, banido = false, modelo = 'Cavalcade', capacidade = 60, tipo = 'carros' },
	{ hash = 1177543287, name = 'dubsta', price = 310000, banido = false, modelo = 'Dubsta', capacidade = 70, tipo = 'carros' },
	{ hash = -1775728740, name = 'granger', price = 345000, banido = false, modelo = 'Granger', capacidade = 100, tipo = 'carros' },
	{ hash = -1543762099, name = 'gresley', price = 200000, banido = false, modelo = 'Gresley', capacidade = 50, tipo = 'carros' },
	{ hash = 486987393, name = 'huntley', price = 180000, banido = false, modelo = 'Huntley', capacidade = 60, tipo = 'carros' },
	{ hash = 1269098716, name = 'landstalker', price = 150000, banido = false, modelo = 'Landstalker', capacidade = 70, tipo = 'carros' },
	{ hash = 914654722, name = 'mesa', price = 150000, banido = false, modelo = 'Mesa', capacidade = 50, tipo = 'carros' },
	{ hash = -808457413, name = 'patriot', price = 280000, banido = false, modelo = 'Patriot', capacidade = 70, tipo = 'carros' },
	{ hash = -1168952148, name = 'toros', price = 520000, banido = false, modelo = 'Toros', capacidade = 50, tipo = 'carros' },	
	{ hash = 1221512915, name = 'seminole', price = 130000, banido = false, modelo = 'Seminole', capacidade = 60, tipo = 'carros' },
	{ hash = 1337041428, name = 'serrano', price = 150000, banido = false, modelo = 'Serrano', capacidade = 50, tipo = 'carros' },
	{ hash = 1203490606, name = 'xls', price = 190000, banido = false, modelo = 'Xls', capacidade = 50, tipo = 'carros' },
	{ hash = -432008408, name = 'xls2', price = 350000, banido = false, modelo = 'Xls2', capacidade = 50, tipo = 'carros' },
	
    ------------------------ SEDANS -------------------------------------------
	{ hash = -1809822327, name = 'asea', price = 80000, banido = false, modelo = 'Asea', capacidade = 60, tipo = 'carros' },
	{ hash = -1903012613, name = 'asterope', price = 90000, banido = false, modelo = 'Asterope', capacidade = 60, tipo = 'carros' },
	{ hash = 906642318, name = 'cog55', price = 200000, banido = false, modelo = 'Cog55', capacidade = 60, tipo = 'work' },
	{ hash = 704435172, name = 'cog552', price = 400000, banido = false, modelo = 'Cog552', capacidade = 60, tipo = 'carros' },
	{ hash = -2030171296, name = 'cognoscenti', price = 280000, banido = false, modelo = 'Cognoscenti', capacidade = 60, tipo = 'carros' },
	{ hash = -685276541, name = 'emperor', price = 80000, banido = false, modelo = 'Emperor', capacidade = 60, tipo = 'carros' },
	{ hash = 1909141499, name = 'fugitive', price = 150000, banido = false, modelo = 'Fugitive', capacidade = 50, tipo = 'carros' },
	{ hash = 75131841, name = 'glendale', price = 80000, banido = false, modelo = 'Glendale', capacidade = 50, tipo = 'carros' },
	{ hash = 886934177, name = 'intruder', price = 110000, banido = false, modelo = 'Intruder', capacidade = 50, tipo = 'carros' },
	{ hash = -1289722222, name = 'ingot', price = 160000, banido = false, modelo = 'Ingot', capacidade = 60, tipo = 'carros' },	
	{ hash = -1883869285, name = 'premier', price = 80000, banido = false, modelo = 'Premier', capacidade = 50, tipo = 'carros' },
	{ hash = -1150599089, name = 'primo', price = 130000, banido = false, modelo = 'Primo', capacidade = 50, tipo = 'carros' },
	{ hash = -1961627517, name = 'stretch', price = 520000, banido = false, modelo = 'Stretch', capacidade = 60, tipo = 'carros' },
	{ hash = -1477580979, name = 'stanier', price = 100000, banido = false, modelo = 'Stanier', capacidade = 60, tipo = 'carros' },
	{ hash = 1723137093, name = 'stratum', price = 120000, banido = false, modelo = 'Stratum', capacidade = 70, tipo = 'carros' },
	{ hash = 1373123368, name = 'warrener', price = 90000, banido = false, modelo = 'Warrener', capacidade = 40, tipo = 'carros' },
	
    ------------------------ SPORTS -------------------------------------------
	{ hash = 767087018, name = 'alpha', price = 230000, banido = false, modelo = 'Alpha', capacidade = 40, tipo = 'carros' },
	{ hash = -1041692462, name = 'banshee', price = 300000, banido = false, modelo = 'Banshee', capacidade = 30, tipo = 'carros' },
	{ hash = 1274868363, name = 'bestiagts', price = 290000, banido = false, modelo = 'Bestiagts', capacidade = 60, tipo = 'carros' },
	{ hash = 1039032026, name = 'blista2', price = 55000, banido = false, modelo = 'Blista2', capacidade = 40, tipo = 'carros' },
	{ hash = -304802106, name = 'buffalo', price = 300000, banido = false, modelo = 'Buffalo', capacidade = 50, tipo = 'carros' },
	{ hash = 2072687711, name = 'carbonizzare', price = 290000, banido = false, modelo = 'Carbonizzare', capacidade = 30, tipo = 'carros' },
	{ hash = 108773431, name = 'coquette', price = 250000, banido = false, modelo = 'Coquette', capacidade = 30, tipo = 'carros' },
	{ hash = 196747873, name = 'elegy', price = 350000, banido = false, modelo = 'Elegy', capacidade = 30, tipo = 'carros' },
	{ hash = -566387422, name = 'elegy2', price = 355000, banido = false, modelo = 'Elegy2', capacidade = 30, tipo = 'carros' },
	{ hash = -1995326987, name = 'feltzer2', price = 255000, banido = false, modelo = 'Feltzer2', capacidade = 40, tipo = 'carros' },
	{ hash = -1089039904, name = 'furoregt', price = 290000, banido = false, modelo = 'Furoregt', capacidade = 30, tipo = 'carros' },
	{ hash = 499169875, name = 'fusilade', price = 210000, banido = false, modelo = 'Fusilade', capacidade = 40, tipo = 'carros' },
	{ hash = 2016857647, name = 'futo', price = 170000, banido = false, modelo = 'Futo', capacidade = 40, tipo = 'carros' },
	{ hash = -331467772, name = 'italigto', price = 800000, banido = false, modelo = 'Italigto', capacidade = 30, tipo = 'carros' },
	{ hash = -1297672541, name = 'jester', price = 150000, banido = false, modelo = 'Jester', capacidade = 30, tipo = 'carros' },
	{ hash = 544021352, name = 'khamelion', price = 210000, banido = false, modelo = 'Khamelion', capacidade = 50, tipo = 'carros' },
	{ hash = -1372848492, name = 'kuruma', price = 330000, banido = false, modelo = 'Kuruma', capacidade = 50, tipo = 'carros' },
	{ hash = -142942670, name = 'massacro', price = 330000, banido = false, modelo = 'Massacro', capacidade = 40, tipo = 'carros' },
	{ hash = 482197771, name = 'lynx', price = 370000, banido = false, modelo = 'Lynx', capacidade = 30, tipo = 'carros' },
	{ hash = -1848994066, name = 'neon', price = 370000, banido = false, modelo = 'Neon', capacidade = 30, tipo = 'carros' },
	{ hash = 1032823388, name = 'ninef', price = 290000, banido = false, modelo = 'Ninef', capacidade = 40, tipo = 'carros' },
	{ hash = -1461482751, name = 'ninef2', price = 290000, banido = false, modelo = 'Ninef2', capacidade = 40, tipo = 'carros' },
	{ hash = 867799010, name = 'pariah', price = 500000, banido = false, modelo = 'Pariah', capacidade = 30, tipo = 'carros' },
	{ hash = -377465520, name = 'penumbra', price = 150000, banido = false, modelo = 'Penumbra', capacidade = 40, tipo = 'carros' },
	{ hash = -1529242755, name = 'raiden', price = 240000, banido = false, modelo = 'Raiden', capacidade = 50, tipo = 'carros' },
	{ hash = -1934452204, name = 'rapidgt', price = 250000, banido = false, modelo = 'Rapidgt', capacidade = 20, tipo = 'carros' },
	{ hash = -1485523546, name = 'schafter3', price = 275000, banido = false, modelo = 'Schafter3', capacidade = 50, tipo = 'carros' },
	{ hash = -888242983, name = 'schafter5', price = 275000, banido = false, modelo = 'Schafter5', capacidade = 50, tipo = 'carros' },
	{ hash = -746882698, name = 'schwarzer', price = 170000, banido = false, modelo = 'Schwarzer', capacidade = 50, tipo = 'carros' },
	{ hash = 1104234922, name = 'sentinel3', price = 170000, banido = false, modelo = 'Sentinel3', capacidade = 30, tipo = 'carros' },
	{ hash = -1757836725, name = 'seven70', price = 370000, banido = false, modelo = 'Seven70', capacidade = 20, tipo = 'carros' },
	{ hash = 1886268224, name = 'specter', price = 320000, banido = false, modelo = 'Specter', capacidade = 20, tipo = 'carros' },
	{ hash = 970598228, name = 'sultan', price = 210000, banido = false, modelo = 'Sultan', capacidade = 50, tipo = 'carros' },
	{ hash = 384071873, name = 'surano', price = 310000, banido = false, modelo = 'Surano', capacidade = 30, tipo = 'carros' },
	{ hash = 1102544804, name = 'verlierer2', price = 380000, banido = false, modelo = 'Verlierer2', capacidade = 20, tipo = 'carros' },

    ------------------------ CLASSICS -------------------------------------------
	{ hash = 117401876, name = 'btype', price = 200000, banido = false, modelo = 'Btype', capacidade = 40, tipo = 'work' },
	{ hash = 941800958, name = 'casco', price = 355000, banido = false, modelo = 'Casco', capacidade = 40, tipo = 'carros' },
	{ hash = -988501280, name = 'cheburek', price = 170000, banido = false, modelo = 'Cheburek', capacidade = 50, tipo = 'carros' },
	{ hash = 1011753235, name = 'coquette2', price = 285000, banido = false, modelo = 'Coquette2', capacidade = 40, tipo = 'carros' },
	{ hash = -1566741232, name = 'feltzer3', price = 220000, banido = false, modelo = 'Feltzer3', capacidade = 40, tipo = 'carros' },
	{ hash = -2079788230, name = 'gt500', price = 250000, banido = false, modelo = 'Gt500', capacidade = 40, tipo = 'carros' },
	{ hash = -1660945322, name = 'mamba', price = 300000, banido = false, modelo = 'Mamba', capacidade = 30, tipo = 'carros' },
	{ hash = -2124201592, name = 'manana', price = 130000, banido = false, modelo = 'Manana', capacidade = 30, tipo = 'carros' },
	{ hash = -433375717, name = 'monroe', price = 260000, banido = false, modelo = 'Monroe', capacidade = 20, tipo = 'carros' },
	{ hash = 1830407356, name = 'peyote', price = 150000, banido = false, modelo = 'Peyote', capacidade = 50, tipo = 'carros' },
	{ hash = 1078682497, name = 'pigalle', price = 250000, banido = false, modelo = 'Pigalle', capacidade = 30, tipo = 'carros' },
	{ hash = 2049897956, name = 'rapidgt3', price = 220000, banido = false, modelo = 'Rapidgt3', capacidade = 40, tipo = 'carros' },
	{ hash = 1841130506, name = 'retinue', price = 150000, banido = false, modelo = 'Retinue', capacidade = 40, tipo = 'carros' },
	{ hash = 1545842587, name = 'stinger', price = 220000, banido = false, modelo = 'Stinger', capacidade = 20, tipo = 'carros' },
	{ hash = 464687292, name = 'tornado', price = 150000, banido = false, modelo = 'Tornado', capacidade = 30, tipo = 'carros' },
    { hash = 758895617, name = 'ztype', price = 400000, banido = false, modelo = 'Ztype', capacidade = 20, tipo = 'carros' },
	{ hash = 223240013, name = 'cheetah2', price = 440000, banido = false, modelo = 'Cheetah2', capacidade = 20, tipo = 'carros' },

    ------------------------ SUPER -------------------------------------------
	{ hash = -1216765807, name = 'adder', price = 620000, banido = false, modelo = 'Adder', capacidade = 20, tipo = 'carros' },
	{ hash = 633712403, name = 'banshee2', price = 570000, banido = false, modelo = 'Banshee2', capacidade = 20, tipo = 'carros' },
	{ hash = -1696146015, name = 'bullet', price = 500000, banido = false, modelo = 'Bullet', capacidade = 20, tipo = 'carros' },
	{ hash = -1311154784, name = 'cheetah', price = 525000, banido = false, modelo = 'Cheetah', capacidade = 20, tipo = 'carros' },
	{ hash = -1134706562, name = 'taipan', price = 620000, banido = false, modelo = 'Taipan', capacidade = 20, tipo = 'carros' },
	{ hash = -2120700196, name = 'entity2', price = 550000, banido = false, modelo = 'Entity2', capacidade = 20, tipo = 'carros' },
	{ hash = 1392481335, name = 'cyclone', price = 920000, banido = false, modelo = 'Cyclone', capacidade = 20, tipo = 'carros' },
	{ hash = -1291952903, name = 'entityxf', price = 560000, banido = false, modelo = 'Entityxf', capacidade = 20, tipo = 'carros' },
	{ hash = 1426219628, name = 'fmj', price = 520000, banido = false, modelo = 'Fmj', capacidade = 20, tipo = 'carros' },
	{ hash = 1234311532, name = 'gp1', price = 500000, banido = false, modelo = 'Gp1', capacidade = 20, tipo = 'carros' },
	{ hash = 418536135, name = 'infernus', price = 520000, banido = false, modelo = 'Infernus', capacidade = 20, tipo = 'carros' },
	{ hash = -2048333973, name = 'italigtb', price = 600000, banido = false, modelo = 'Italigtb', capacidade = 20, tipo = 'carros' },
	{ hash = 1034187331, name = 'nero', price = 510000, banido = false, modelo = 'Nero', capacidade = 20, tipo = 'carros' },
	{ hash = 1987142870, name = 'osiris', price = 510000, banido = false, modelo = 'Osiris', capacidade = 20, tipo = 'carros' },
	{ hash = -1758137366, name = 'penetrator', price = 510000, banido = false, modelo = 'Penetrator', capacidade = 20, tipo = 'carros' },
	{ hash = -1829802492, name = 'pfister811', price = 530000, banido = false, modelo = 'Pfister811', capacidade = 20, tipo = 'carros' },
	{ hash = 2123327359, name = 'prototipo', price = 1030000, banido = false, modelo = 'Prototipo', capacidade = 20, tipo = 'carros' },
	{ hash = 234062309, name = 'reaper', price = 620000, banido = false, modelo = 'Reaper', capacidade = 20, tipo = 'carros' },
	{ hash = 1352136073, name = 'sc1', price = 505000, banido = false, modelo = 'Sc1', capacidade = 20, tipo = 'carros' },
	{ hash = -295689028, name = 'sultanrs', price = 510000, banido = false, modelo = 'Sultan RS', capacidade = 30, tipo = 'carros' },
	{ hash = 1663218586, name = 't20', price = 670000, banido = false, modelo = 'T20', capacidade = 20, tipo = 'carros' },
	{ hash = 272929391, name = 'tempesta', price = 600000, banido = false, modelo = 'Tempesta', capacidade = 20, tipo = 'carros' },
	{ hash = 408192225, name = 'turismor', price = 620000, banido = false, modelo = 'Turismor', capacidade = 20, tipo = 'carros' },
    { hash = 338562499, name = 'vacca', price = 620000, banido = false, modelo = 'Vacca', capacidade = 30, tipo = 'carros' },
	{ hash = 1939284556, name = 'vagner', price = 680000, banido = false, modelo = 'Vagner', capacidade = 20, tipo = 'carros' },
	{ hash = -998177792, name = 'visione', price = 690000, banido = false, modelo = 'Visione', capacidade = 20, tipo = 'carros' },
	{ hash = -1622444098, name = 'voltic', price = 500000, banido = false, modelo = 'Voltic', capacidade = 20, tipo = 'carros' },
	{ hash = 917809321, name = 'xa21', price = 630000, banido = false, modelo = 'Xa21', capacidade = 20, tipo = 'carros' },
	{ hash = -1403128555, name = 'zentorno', price = 920000, banido = false, modelo = 'Zentorno', capacidade = 20, tipo = 'carros' },
	{ hash = -376434238, name = 'tyrant', price = 690000, banido = false, modelo = 'Tyrant', capacidade = 30, tipo = 'carros' },

     ------------------------ VANS -------------------------------------------
--	 { hash = -1346687836, name = 'burrito', price = 260000, banido = false, modelo = 'Burrito', capacidade = 100, tipo = 'work' },
--	 { hash = -1743316013, name = 'burrito3', price = 260000, banido = false, modelo = 'Burrito3', capacidade = 100, tipo = 'work' },
  --   { hash = -310465116, name = 'minivan', price = 200000, banido = false, modelo = 'Minivan', capacidade = 70, tipo = 'work' },
	-- { hash = -1745203402, name = 'gburrito', price = 200000, banido = false, modelo = 'GBurrito', capacidade = 100, tipo = 'work' },
--	 { hash = 1488164764, name = 'paradise', price = 260000, banido = false, modelo = 'Paradise', capacidade = 100, tipo = 'work' },
--	 { hash = 943752001, name = 'pony2', price = 260000, banido = false, modelo = 'Pony2', capacidade = 100, tipo = 'work' },
--	 { hash = 1475773103, name = 'rumpo3', price = 350000, banido = false, modelo = 'Rumpo3', capacidade = 100, tipo = 'work' },
--	 { hash = -810318068, name = 'speedo', price = 200000, banido = false, modelo = 'Speedo', capacidade = 100, tipo = 'work' },
--	 { hash = 699456151, name = 'surfer', price = 55000, banido = false, modelo = 'Surfer', capacidade = 80, tipo = 'work' },
--	 { hash = 65402552, name = 'youga', price = 260000, banido = false, modelo = 'Youga', capacidade = 100, tipo = 'work' },
	 
	-------------------------------------------------------EXCLUSIVES ADD-ONS----------------------------------------------------------------
	-------------------------------------------------------EXCLUSIVES ADD-ONS BRASIL----------------------------------------------------------------
	{ hash = GetHashKey("fox"), name = 'fox', price = 80000, banido = false, modelo = 'Fox', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("amarok"), name = 'amarok', price = 300000, banido = false, modelo = 'Amarok', capacidade = 80, tipo = 'carros' },
	{ hash = GetHashKey("vwbeetlenaj"), name = 'vwbeetlenaj', price = 50000, banido = false, modelo = 'Fusca', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("defender21"), name = 'defender21', price = 300000, banido = false, modelo = 'Defender 2021', capacidade = 70, tipo = 'carros' },
	{ hash = GetHashKey("gcmcerato18"), name = 'gcmcerato18', price = 100000, banido = false, modelo = 'Cerato', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("gcmcorolla20cn"), name = 'gcmcorolla20cn', price = 250000, banido = false, modelo = 'Corolla', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("gcmhighlanderxse"), name = 'gcmhighlanderxse', price = 300000, banido = false, modelo = 'HighLander XSE', capacidade = 80, tipo = 'carros' },
	{ hash = GetHashKey("gcmoutlanderls"), name = 'gcmoutlanderls', price = 300000, banido = false, modelo = 'OutLander LS', capacidade = 80, tipo = 'carros' },
	{ hash = GetHashKey("gcmsentra20"), name = 'gcmsentra20', price = 100000, banido = false, modelo = 'Sentra 2020', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("gcmcity14"), name = 'gcmcity14', price = 90000, banido = false, modelo = 'Honda City', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("golfgti7"), name = 'golfgti7', price = 250000, banido = false, modelo = 'Golf GTI', capacidade = 45, tipo = 'carros' },
	{ hash = GetHashKey("hilux2019"), name = 'hilux2019', price = 300000, banido = false, modelo = 'Hilux', capacidade = 80, tipo = 'carros' },
	{ hash = GetHashKey("jettagli"), name = 'jettagli', price = 350000, banido = false, modelo = 'Jetta GLI', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("nf17"), name = 'nf17', price = 270000, banido = false, modelo = 'Frontier', capacidade = 80, tipo = 'carros' },
	{ hash = GetHashKey("pajero4"), name = 'pajero4', price = 100000, banido = false, modelo = 'Pajero', capacidade = 70, tipo = 'carros' },
	{ hash = GetHashKey("polo2018"), name = 'polo2018', price = 80000, banido = false, modelo = 'Polo', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("savaoriginal"), name = 'savaoriginal', price = 60000, banido = false, modelo = 'Saveiro Surf', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("taigun21"), name = 'taigun21', price = 100000, banido = false, modelo = 'Taigun', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("uptsi"), name = 'uptsi', price = 120000, banido = false, modelo = 'UP TSI', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("veloster"), name = 'veloster', price = 80000, banido = false, modelo = 'Veloster', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("cox2013"), name = 'cox2013', price = 120000, banido = false, modelo = 'New Beetle', capacidade = 40, tipo = 'carros' },

	-- ADD-ON motos
	{ hash = GetHashKey("biz25"), name = 'Bis', price = 60000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("bros60"), name = 'Bros', price = 80000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("v4sf"), name = 'Ducati v4S', price = 600000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("mt03"), name = 'MT-03', price = 150000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("fz07"), name = 'MT-07', price = 200000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("R1200GS"), name = 'R1200GS', price = 1100000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("cg160"), name = 'CG 160', price = 50000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("xre300"), name = 'XRE 300', price = 100000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("500x"), name = 'CB 500x', price = 500000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("hcbr17"), name = 'CBR 1000RR', price = 900000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("z1000"), name = 'z1000', price = 1000000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("r1"), name = 'Yamaha R1', price = 300000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("f800"), name = 'BMW F800', price = 700000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("gs310"), name = 'BMW F310', price = 500000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("gsxr"), name = 'Suzuki XR', price = 300000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("h2carb"), name = 'Ninja H2 Carb', price = 800000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("hayabusa"), name = 'Hayabusa', price = 700000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("hornet"), name = 'Hornet', price = 200000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("r6"), name = 'Yamaha R6', price = 400000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("s1000docandidato"), name = 'Bmw S1000', price = 1000000, banido = false, modelo = 'Onibus', capacidade = 15, tipo = 'motos' },
	-- ADD-ON carros
	{ hash = GetHashKey("amggtr"), name = 'amggtr', price = 1500000, banido = false, modelo = 'AMG GTR', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("2019chiron"), name = '2019chiron', price = 2800000, banido = false, modelo = 'Bugatti', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("21camaro"), name = '21camaro', price = 2000000, banido = false, modelo = 'Camaro', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("911turbos"), name = '911turbos', price = 2500000, banido = false, modelo = 'Porche 911', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("audirs6"), name = 'audirs6', price = 2200000, banido = false, modelo = 'Audi RS6', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("audirs7"), name = 'audirs7', price = 2600000, banido = false, modelo = 'Audi RS7', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("b63s"), name = 'b63s', price = 1600000, banido = false, modelo = 'Brabus B63', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("bmci"), name = 'bmci', price = 1700000, banido = false, modelo = 'BMW M4', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("bmwm3f80"), name = 'bmwm3f80', price = 1500000, banido = false, modelo = 'BMW M3', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("bmwm4gts"), name = 'bmwm4gts', price = 1700000, banido = false, modelo = 'BMW M4 GTS', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("dodgechargersrt"), name = 'dodgechargersrt', price = 1500000, banido = false, modelo = 'Dodge Charger', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("ferrariitalia"), name = 'ferrariitalia', price = 3000000, banido = false, modelo = 'Ferrari Italia', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("focusrs"), name = 'focusrs', price = 1600000, banido = false, modelo = 'Focus RS', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("fordmustang"), name = 'fordmustang', price = 2000000, banido = false, modelo = 'Ford Mustang', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("fpacehm"), name = 'fpacehm', price = 2000000, banido = false, modelo = 'Jaguar F-pace', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("lamborghinihuracan"), name = 'lamborghinihuracan', price = 2600000, banido = false, modelo = 'Lambo Huracan', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("lancerevolution9"), name = 'lancerevolution9', price = 1500000, banido = false, modelo = 'Lance Evo 9', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("lancerevolutionx"), name = 'lancerevolutionx', price = 1800000, banido = false, modelo = 'Lance Evo X', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("macan"), name = 'macan', price = 1800000, banido = false, modelo = 'Porsche Macan', capacidade = 65, tipo = 'import' },
	{ hash = GetHashKey("mazdarx7"), name = 'mazdarx7', price = 1500000, banido = false, modelo = 'Mazda RX7', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("mercedesa45"), name = 'mercedesa45', price = 1500000, banido = false, modelo = 'Mercedes A45', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("mers63c"), name = 'mers63c', price = 1700000, banido = false, modelo = 'Mercedes 63C', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("nissan370z"), name = 'nissan370z', price = 1500000, banido = false, modelo = 'Nissan 370Z', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("nissangtr"), name = 'nissangtr', price = 2000000, banido = false, modelo = 'Nissan GTR', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("nissanskyliner34"), name = 'nissanskyliner34', price = 2200000, banido = false, modelo = 'Skyline', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("p1"), name = 'p1', price = 3000000, banido = false, modelo = 'Mclaren P1', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("panamera17turbo"), name = 'panamera17turbo', price = 2800000, banido = false, modelo = 'Panamera Turbo', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("raptor2017"), name = 'raptor2017', price = 2200000, banido = false, modelo = 'Raptor', capacidade = 70, tipo = 'import' },
	{ hash = GetHashKey("rs6c8"), name = 'rs6c8', price = 2600000, banido = false, modelo = 'Audi RS6 Sedan', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("teslaprior"), name = 'teslaprior', price = 3100000, banido = false, modelo = 'Tesla Prior', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("toyotasupra"), name = 'toyotasupra', price = 2000000, banido = false, modelo = 'Toyota Supra', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("velociraptor"), name = 'velociraptor', price = 3000000, banido = false, modelo = 'Velociraptor', capacidade = 70, tipo = 'import' },
	{ hash = GetHashKey("rrst"), name = 'rrst', price = 1800000, banido = false, modelo = 'Range Rover', capacidade = 70, tipo = 'import' },
	{ hash = GetHashKey("cayenneturbo"), name = 'cayenneturbo', price = 2000000, banido = false, modelo = 'Porsche Cayenne', capacidade = 70, tipo = 'import' },
	{ hash = GetHashKey("22g63"), name = '22g63', price = 2200000, banido = false, modelo = 'Mercedes G63', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("velar"), name = 'velar', price = 3000000, banido = false, modelo = 'Velar', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("x6m"), name = 'x6m', price = 3100000, banido = false, modelo = 'BMW x6M', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("teslax"), name = 'teslax', price = 3100000, banido = false, modelo = 'Tesla Model X', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("ttrs"), name = 'ttrs', price = 2000000, banido = false, modelo = 'Audi TT', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("armoredvelar"), name = 'armoredvelar', price = 2000000, banido = false, modelo = 'Velar blindado', capacidade = 95, tipo = 'import' },
	{ hash = GetHashKey("armoredgle"), name = 'armoredgle', price = 2000000, banido = false, modelo = 'Gle blindado', capacidade = 95, tipo = 'import' },
	{ hash = GetHashKey("armoredx6"), name = 'armoredx6', price = 2000000, banido = false, modelo = 'X6m blindado', capacidade = 95, tipo = 'import' },
	{ hash = GetHashKey("a80"), name = 'a80', price = 800000, banido = false, modelo = 'Supra22', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("2f2fgtr34"), name = '2f2fgtr34', price = 800000, banido = false, modelo = 'GtrR34', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("18performante"), name = '18performante', price = 800000, banido = false, modelo = 'Huracan', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("22macgt"), name = '22macgt', price = 800000, banido = false, modelo = 'Macgt', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("23s63l"), name = '23s63l', price = 800000, banido = false, modelo = 'S63', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("150"), name = '150', price = 800000, banido = false, modelo = 'Cg150', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("350z"), name = '350z', price = 800000, banido = false, modelo = '350z', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("370z"), name = '370z', price = 800000, banido = false, modelo = '370z', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("675ltsp"), name = '675ltsp', price = 800000, banido = false, modelo = '675', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("718b"), name = '718b', price = 800000, banido = false, modelo = '718', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("911r"), name = '911r', price = 800000, banido = false, modelo = '911r', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("918s"), name = '918s', price = 800000, banido = false, modelo = '918s', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("a452"), name = 'a452', price = 800000, banido = false, modelo = 'A452', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("adr8"), name = 'adr8', price = 800000, banido = false, modelo = 'R8', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("africat"), name = 'africat', price = 800000, banido = false, modelo = 'Africa Twin', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("agerars"), name = 'agerars', price = 800000, banido = false, modelo = 'Agerars', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("amarok"), name = 'amarok', price = 800000, banido = false, modelo = 'Amarok', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("amggtc"), name = 'amggtc', price = 800000, banido = false, modelo = 'AmgGtc', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("amgone"), name = 'amgone', price = 800000, banido = false, modelo = 'AMG ONE', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("audirs7"), name = 'audirs7', price = 800000, banido = false, modelo = 'Audirs7', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("bikelete"), name = 'bikelete', price = 800000, banido = false, modelo = 'bikelete', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("bmwg07"), name = 'bmwg07', price = 800000, banido = false, modelo = 'BMW X7', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("bmwi8"), name = 'bmwi8', price = 800000, banido = false, modelo = 'I8', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("bmwm4gts"), name = 'bmwm4gts', price = 800000, banido = false, modelo = 'M4 gts', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("bmwr1250rocam"), name = 'bmwr1250rocam', price = 800000, banido = false, modelo = 'GS 1250', capacidade = 30, tipo = 'motos' },
	{ hash = GetHashKey("bmws"), name = 'bmws', price = 800000, banido = false, modelo = 'S1000s', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("c7"), name = 'c7', price = 800000, banido = false, modelo = 'c7', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("c8z0623"), name = 'c8z0623', price = 800000, banido = false, modelo = 'C8', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("caveiraopmerj"), name = 'caveiraopmerj', price = 800000, banido = false, modelo = 'caveiraopmerj', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("celta"), name = 'celta', price = 800000, banido = false, modelo = 'celta', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("chevette"), name = 'chevette', price = 800000, banido = false, modelo = 'chevette', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("chironss"), name = 'chironss', price = 800000, banido = false, modelo = 'Chiron SS', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("civic2016"), name = 'civic2016', price = 800000, banido = false, modelo = 'civic2016', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("civictyper"), name = 'civictyper', price = 800000, banido = false, modelo = 'civictyper', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("dd911gtrsr"), name = 'dd911gtrsr', price = 800000, banido = false, modelo = '911 GtrSr', capacidade = 30, tipo = 'motos' },
	{ hash = GetHashKey("dm1200"), name = 'dm1200', price = 800000, banido = false, modelo = 'Ducati MultiStrada', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("ds4"), name = 'ds4', price = 800000, banido = false, modelo = 'Citroen Ds4', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("eletran17"), name = 'eletran17', price = 800000, banido = false, modelo = 'Hyundai elantra 17', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("er34n"), name = 'er34n', price = 800000, banido = false, modelo = 'R34n', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("etrongt22"), name = 'etrongt22', price = 800000, banido = false, modelo = 'Etrongt22', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("evo9"), name = 'evo9', price = 800000, banido = false, modelo = 'Evo9', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("evoque"), name = 'evoque', price = 800000, banido = false, modelo = 'Evoque', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("f150"), name = 'f150', price = 800000, banido = false, modelo = 'F150', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("F250Deboxe"), name = 'F250Deboxe', price = 800000, banido = false, modelo = 'F250Deboxe', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("f850"), name = 'f850', price = 800000, banido = false, modelo = 'Gs850', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("fc15"), name = 'fc15', price = 800000, banido = false, modelo = 'ferrari california ', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("fd"), name = 'fd', price = 800000, banido = false, modelo = 'Rx7', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("ferrariitalia"), name = 'ferrariitalia', price = 800000, banido = false, modelo = 'ferrariitalia', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("fiat"), name = 'fiat', price = 800000, banido = false, modelo = 'Fit 147', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("fiatstilo"), name = 'fiatstilo', price = 800000, banido = false, modelo = 'fiatstilo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("fox720m"), name = 'fox720m', price = 800000, banido = false, modelo = '720s', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxc8wb"), name = 'foxc8wb', price = 800000, banido = false, modelo = 'C8 Sport', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxct"), name = 'foxct', price = 800000, banido = false, modelo = 'Cybertruck', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxevo"), name = 'foxevo', price = 800000, banido = false, modelo = 'huracanEvo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxevos"), name = 'foxevos', price = 800000, banido = false, modelo = 'huracanEvos', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxgt2"), name = 'foxgt2', price = 800000, banido = false, modelo = 'Gt2', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxsenna"), name = 'foxsenna', price = 800000, banido = false, modelo = 'Senna', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("fxxkevo"), name = 'fxxkevo', price = 800000, banido = false, modelo = 'Ferrari Evo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("giuliagta"), name = 'giuliagta', price = 800000, banido = false, modelo = 'Giulia Gta', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("gle53"), name = 'gle53', price = 800000, banido = false, modelo = 'Gle 53 Amg', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("golf7gti"), name = 'golf7gti', price = 800000, banido = false, modelo = 'Golf Gti', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("gs2013"), name = 'gs2013', price = 800000, banido = false, modelo = 'Gs1200 ADV', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("gsxr"), name = 'gsxr', price = 800000, banido = false, modelo = 'Suzuke Gsxr', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("hcej1"), name = 'hcej1', price = 800000, banido = false, modelo = 'Honda 98 Tuning', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("hornet"), name = 'hornet', price = 800000, banido = false, modelo = 'hornet', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("huayrar"), name = 'huayrar', price = 800000, banido = false, modelo = 'Pagani', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("jetta2017"), name = 'jetta2017', price = 800000, banido = false, modelo = 'jetta2017', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("lancerevolutionx"), name = 'lancerevolutionx', price = 800000, banido = false, modelo = 'lancerevolutionx', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("lexuslfa"), name = 'lexuslfa', price = 800000, banido = false, modelo = 'lexuslfa', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("m2f22"), name = 'm2f22', price = 800000, banido = false, modelo = 'M2 2020', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("m3e46"), name = 'm3e46', price = 800000, banido = false, modelo = 'M3e46', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("m3g80c"), name = 'm3g80c', price = 800000, banido = false, modelo = 'M3g80c', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("macanturbo"), name = 'macanturbo', price = 800000, banido = false, modelo = 'Macan Turbo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("mansgt"), name = 'mansgt', price = 800000, banido = false, modelo = 'Mclaren Gt', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("mbc"), name = 'mbc', price = 800000, banido = false, modelo = 'Mcb', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("monza"), name = 'monza', price = 800000, banido = false, modelo = 'monza', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("mt07"), name = 'mt07', price = 800000, banido = false, modelo = 'Mt07', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("nh2r"), name = 'nh2r', price = 800000, banido = false, modelo = 'H2r', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("nissangtr"), name = 'nissangtr', price = 800000, banido = false, modelo = 'nissangtr', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("nissanskyliner34"), name = 'nissanskyliner34', price = 800000, banido = false, modelo = 'nissanskyliner34', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("palio"), name = 'palio', price = 800000, banido = false, modelo = 'palio', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("palio2"), name = 'palio2', price = 800000, banido = false, modelo = 'Palio rebaixado', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("panamera17turbo"), name = 'panamera17turbo', price = 800000, banido = false, modelo = 'panamera17turbo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("panigale"), name = 'panigale', price = 800000, banido = false, modelo = 'panigale', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("pboxstergts"), name = 'pboxstergts', price = 800000, banido = false, modelo = 'Porche Gts', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("PCX"), name = 'PCX', price = 800000, banido = false, modelo = 'PCX', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("pistaspider19"), name = 'pistaspider19', price = 800000, banido = false, modelo = 'spider', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("r1200"), name = 'r1200', price = 800000, banido = false, modelo = 'r1200', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodbentleygt"), name = 'rmodbentleygt', price = 800000, banido = false, modelo = 'Bentley gt', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodcamaro"), name = 'rmodcamaro', price = 800000, banido = false, modelo = 'Camaro', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodcharger69"), name = 'rmodcharger69', price = 800000, banido = false, modelo = 'Charger69', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodf12tdf"), name = 'rmodf12tdf', price = 800000, banido = false, modelo = 'F12tdf', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodf40"), name = 'rmodf40', price = 800000, banido = false, modelo = 'F40', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodgt63"), name = 'rmodgt63', price = 800000, banido = false, modelo = 'Gt 63', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodgtr50"), name = 'rmodgtr50', price = 800000, banido = false, modelo = 'Gtr 50', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodjesko"), name = 'rmodjesko', price = 800000, banido = false, modelo = 'Jesko', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodmartin"), name = 'rmodmartin', price = 800000, banido = false, modelo = 'Aston Martin DBS', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodsianr"), name = 'rmodsianr', price = 800000, banido = false, modelo = 'Sianr', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rs7c821"), name = 'rs7c821', price = 800000, banido = false, modelo = 'ram226x6', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rs520"), name = 'rs520', price = 800000, banido = false, modelo = 'Rs520', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("s10"), name = 's10', price = 800000, banido = false, modelo = 's10', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("s1000rr"), name = 's1000rr', price = 800000, banido = false, modelo = 's1000rr', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("silvia"), name = 'silvia', price = 800000, banido = false, modelo = 'silvia', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("silvias15"), name = 'silvias15', price = 800000, banido = false, modelo = 'silvias15', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sjdodge"), name = 'sjdodge', price = 800000, banido = false, modelo = 'Dodge SRT', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("subwrx"), name = 'subwrx', price = 800000, banido = false, modelo = 'subwrx', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("taycan21"), name = 'taycan21', price = 800000, banido = false, modelo = 'taycan21', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("tenere1200"), name = 'tenere1200', price = 800000, banido = false, modelo = 'tenere1200', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("xj6"), name = 'xj6', price = 800000, banido = false, modelo = 'xj6', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("xt660vip"), name = 'xt660vip', price = 800000, banido = false, modelo = 'xt660vip', capacidade = 30, tipo = 'carros' },
}


-- RETORNA A LISTA DE VEÍCULOS
config.getVehList = function()
	return config.vehList
end

-- RETORNA AS INFORMAÇÕES CONTIDAS NA LISTA DE UM VEÍCULO ESPECÍFICO
config.getVehicleInfo = function(vehicle)
	for i in ipairs(config.vehList) do
		if vehicle == config.vehList[i].hash or vehicle == config.vehList[i].name then
            return config.vehList[i]
        end
    end
    return false
end

-- RETORNA O MODELO DE UM VEÍCULO ESPECÍFICO (NOME BONITINHO)
config.getVehicleModel = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.modelo or vehicle
	end
	return vehicle
end

-- RETORNA A CAPACIDADE DO PORTA-MALAS DE UM VEÍCULO ESPECÍFICO
config.getVehicleTrunk = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.capacidade or 0
	end
	return 0
end

-- RETORNA O PREÇO DE UM VEÍCULO ESPECÍFICO
config.getVehiclePrice = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.price or 0
	end
	return 0
end

-- RETORNA O TIPO DE UM VEÍCULO ESPECÍFICO
config.getVehicleType = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.tipo or 0
	end
	return "none"
end

-- RETORNA O STATUS DE BANIDO DE UM VEÍCULO ESPECÍFICO
config.isVehicleBanned = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.banido
	end
	return false
end



-- RETORNA AS INFORMAÇÕES DO VEÍCULO REFERENTE À LISTA DE VEÍCULOS (VEHLIST)
config.getVehicleInfo = function(vehicle)
	for i in ipairs(config.vehList) do
		if vehicle == config.vehList[i].hash or vehicle == config.vehList[i].name then
            return config.vehList[i]
        end
    end
    return false
end

-------------------------------


 --- MYSQL---

 vRP._prepare("nation_conce/getConceVehicles","SELECT * FROM nation_concessionaria WHERE estoque > 0")

vRP._prepare("nation_conce/hasVehicle","SELECT vehicle, alugado FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")

vRP._prepare("nation_conce/hasFullVehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND alugado = 0")

vRP._prepare("nation_conce/hasRentedVehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND alugado = 1")

vRP._prepare("nation_conce/getMyVehicles", "SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND alugado = 0")

vRP._prepare("nation_conce/deleteRentedVehicles", "DELETE FROM vrp_user_vehicles WHERE alugado = 1 AND data_alugado != @data_alugado")

vRP._prepare("nation_conce/updateUserVehicle","UPDATE vrp_user_vehicles SET alugado = 0 WHERE user_id = @user_id AND vehicle = @vehicle")

vRP.prepare("nation_conce/addUserVehicle",[[
	INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,detido,time,engine,body,fuel,ipva) 
	VALUES(@user_id,@vehicle,@detido,@time,@engine,@body,@fuel,@ipva);
]])

vRP.prepare("nation_conce/addUserRentedVehicle",[[
	INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,detido,time,engine,body,fuel,ipva,alugado,data_alugado) 
	VALUES(@user_id,@vehicle,@detido,@time,@engine,@body,@fuel,@ipva,1,@data_alugado);
]])

vRP._prepare("nation_conce/removeUserVehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")

-----------

function getConceList(cb)
	Citizen.CreateThread(function()
		local vehicles = vRP.query("nation_conce/getConceVehicles") or {}
		cb(vehicles)
	end)
end


function getTopList()
	getConceList(function(list)
		local vehicleList = {}
		for k,v in ipairs(list) do
			local vehInfo = config.getVehicleInfo(v.vehicle)
			if vehInfo then
				vehicleList[#vehicleList+1] = { 
					vehicle = v.vehicle, price = vehInfo.price
				}
			end
		end
		if #vehicleList >= 5 then
			table.sort(vehicleList, function(a, b) return a.price > b.price end)
			for i = 1, 5 do
				local veh = vehicleList[i]
				config.topVehicles[i] = veh.vehicle 
			end
		end
	end)
end


-- NOMES DAS CLASSES DOS VEÍCULOS

config.vehicleClasses = {
	[0] = "compact",  
	[1] = "sedan",  
	[2] = "suv",  
	[3] = "coupé",  
	[4] = "muscle",  
	[5] = "classic",  
	[6] = "sport",  
	[7] = "super",  
	[8] = "moto",  
	[9] = "off-road",  
	[10] = "industrial",  
	[11] = "utility",
	[12] = "van",
	[13] = "cycle",  
	[14] = "boat",  
	[15] = "helicopter",  
	[16] = "plane",  
	[17] = "service", 
	[18] = "emergency",  
	[19] = "military",  
	[20] = "commercial",  
	[21] = "train" 
}


-- FUNCÃO DE COMPRA DO VEÍCULO

config.tryBuyVehicle = function(source, user_id, vehicle, color, price, mods)
	if source and user_id and vehicle and color and price and mods then
		local data = vRP.query("nation_conce/hasVehicle", {user_id = user_id, vehicle = vehicle})
		local hasVehicle = #data > 0
		local isRented = data[1] and data[1].alugado > 0
		if hasVehicle and not isRented then
			return false, "veículo já possuído"
		end
		if vRP.tryFullPayment(user_id,price) then
			Citizen.CreateThread(function()
				if isRented then
					vRP.execute("nation_conce/updateUserVehicle", {
						user_id = user_id, vehicle = vehicle
					})
				else 
					vRP.execute("nation_conce/addUserVehicle", {
						user_id = user_id, vehicle = vehicle, detido = 0, time = 0, engine = 1000, body = 1000, fuel = 100, ipva = os.time()
					})
				end
				mods.customPcolor = color
				vRP.setSData("custom:u"..user_id.."veh_"..vehicle,json.encode(mods))
			end)
			return true, "sucesso!"
		else
			return false, "falha no pagamento"
		end
	end
	return false, "erro inesperado"
end




-- FUNÇÃO DE VENDA DO VEÍCULO

config.trySellVehicle = function(source, user_id, vehicle, price)
	if source and user_id and vehicle and price then
		local hasVehicle = #vRP.query("nation_conce/hasFullVehicle", {user_id = user_id, vehicle = vehicle}) > 0
		if hasVehicle then
			Citizen.CreateThread(function()
				vRP.execute("nation_conce/removeUserVehicle", {user_id = user_id, vehicle = vehicle})
				vRP.giveMoney(user_id,parseInt(price))
			end)
			return true, "sucesso!"
		else
			return false, "veículo alugado ou já vendido"
		end
	end
	return false, "erro inesperado"
end



-- VERIFICAÇÃO DE TEST DRIVE

config.tryTestDrive = function(source, user_id, info)
	if source and user_id and info then
		local price = parseInt(info.price * (config.porcentagem_testdrive / 100))
		return true, "deseja pagar <b>$ "..vRP.format(price).."</b> para realizar o test drive em um(a) <b>"..info.modelo.."</b> ?"
	end
	return false, "erro inesperado"
end



-- VERIFICAÇÃO DO PAGAMENTO DO TEST DRIVE

config.payTest = function(source,user_id, info)
	if source and user_id and info then
		local price = parseInt(info.price * (config.porcentagem_testdrive / 100))
		if vRP.tryFullPayment(user_id, price) then
			return true, "sucesso!", price
		else
			return false, "falha no pagamento"
		end
	end
	return false, "erro inesperado"
end


-- DEVOLVER O DINHEIRO CASO NÃO DÊ PARA FAZER O TEST

config.chargeBack = function(source,user_id, price)
	if source and user_id and price then
		vRP.giveMoney(user_id,price)
		TriggerClientEvent("Notify",source,"aviso", "Você recebeu seus <b>$ "..vRP.format(price).."</b> de volta.", 3000)
	end
end



-- VERIFICAÇÃO DE ALUGUEL DO VEÍCULO

config.tryRentVehicle = function(source, user_id, info)
	if source and user_id and info then
		local hasVehicle = #vRP.query("nation_conce/hasVehicle", {user_id = user_id, vehicle = info.name}) > 0
		if hasVehicle then
			return false, "veículo já possuído"
		end
		local price = parseInt(info.price * (config.porcentagem_aluguel / 100))
		return true, "deseja pagar <b>$ "..vRP.format(price).."</b> para alugar um(a) <b>"..info.modelo.."</b> por 1 dia?"
	end
	return false, "erro inesperado"
end




-- VERIFICAÇÃO DO PAGAMENTO DO ALUGUEL DO VEÍCULO

config.tryPayRent = function(source,user_id, info)
	if source and user_id and info then
		local price = parseInt(info.price * (config.porcentagem_aluguel / 100))
		if vRP.tryFullPayment(user_id, price) then
			Citizen.CreateThread(function()
				vRP.execute("nation_conce/addUserRentedVehicle", {
					user_id = user_id, vehicle = info.name, detido = 0, time = 0, engine = 1000, body = 1000, fuel = 100, ipva = os.time(), data_alugado = os.date("%d/%m/%Y")
				})
			end)
			return true, "sucesso!"
		else
			return false, "falha no pagamento"
		end
	end
	return false, "erro inesperado"
end

getTopList() -- pega os veículos mais caros da conce e coloca na lista de destaque


-- LOCAIS DAS CONCESSIONARIAS E REALIZAÇÃO DE TESTES

config.locais = {
	{ 
		conce = vec3(-55.46,-1095.27,26.42),  -- -55.462665557861,-1095.2722167969,26.422332763672
		test_locais = {
			{ coords = vec3(-11.25,-1080.46,26.68), h = 129.4 },
			{ coords = vec3(-14.11,-1079.84,26.67), h = 122.02 },
			{ coords = vec3(-16.43,-1078.62,26.67), h = 126.74 },
			{ coords = vec3(-8.45,-1081.58,26.67), h = 117.45 },
		}
	},
	{ 
		conce = vec3(118.99,-145.04,54.87),
		test_locais = {
			{ coords = vec3(99.24,-146.67,54.79), h = 204.54 },
		} 
	},
}



