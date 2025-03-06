local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

config = {}
Proxy.addInterface("nation_garages", config)

----------------------------------------------
----------------- CONFIG ---------------------
----------------------------------------------

config.detido = 20 -- taxa para ser paga quando o veiculo for detido (porcentagem do valor do veiculo)
config.seguradora = 20 -- taxa para ser paga quando o veiculo estiver apreendido (porcentagem do valor do veiculo)
config.use_tryFullPayment = true -- quando true, aceita pagamentos de taxas com o dinheiro do banco
config.dv_permission = "player.noclip" -- permissao para dv
config.guardar_veiculo_proximo = false -- mostrar botão de guardar veículo próximo
config.server_side_check = true -- checa se o veículo já foi retirado da garagem pelo player via server-side (o player não conseguirá retirar o veículo até guardá-lo novamente / DV)


----------------------------------------------
----------------- MARKERS --------------------
----------------------------------------------


--- TIPOS DE MARKERS (DEFINIDO NO ATRIBUTO MARKER DE CADA GARAGEM) ---
config.markers = {
	["avião"] = 33,
	["helicóptero"] = 34,
	["barco"] = 35,
	["carro"] = 36,
	["moto"] = 37,
	["bicicleta"] = 38,
	["truck"] = 39,
}

config.drawMarker = function(coords,marker) -- funcao para desenhar os markers das garagens no chão
	local idTop = config.markers[marker] or config.markers["carro"] 
	local idBase = 27
	DrawMarker(idTop,coords,0,0,0,0,0,0,1.0,1.0,1.0,255, 255, 255,155,1,1,1,1)
	DrawMarker(idBase,coords.x,coords.y,coords.z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 255, 255,155,0,0,0,1)
end

----------------------------------------------
----------------- BLIPS ----------------------
----------------------------------------------

config.showBlips = true -- quando true, mostra os blips das garagens públicas no mapa
config.blipId = 357 -- id do blip
config.blipColor = 3 -- cor do blip
config.blipSize = 0.6 -- tamanho do blip

----------------------------------------------
----------------------------------------------
----------------------------------------------


----------------------------------------------
-------- DELETAR VEICULOS INATIVOS -----------
----------------------------------------------

config.reset = false -- quando true, deleta os veículos que estão parados durante um determinado tempo
config.tempoReset = 60 -- tempo para deletar um veículo inativo (em minutos)

----------------------------------------------
----------------------------------------------
----------------------------------------------

----------------------------------------------
----------------- IMAGENS --------------------
----------------------------------------------

config.defaultImg = "https://svgsilh.com/svg/160895.svg" -- imagem default
config.imgDir = "http://181.215.253.55/skips/vehicles/" -- url ou diretorio das imagens

----------------------------------------------
----------------------------------------------
----------------------------------------------



----------------------------------------------
----------- LISTA DE VEÍCULOS ----------------
----------------------------------------------



config.vehList = {
	{ hash = -344943009, name = 'blista', price = 50000, banido = false, modelo = 'Blista', capacidade = 30, tipo = 'carros' },
	{ hash = 1549126457, name = 'brioso', price = 50000, banido = false, modelo = 'Brioso', capacidade = 20, tipo = 'carros' },
	{ hash = -1130810103, name = 'dilettante', price = 40000, banido = false, modelo = 'Dilettante', capacidade = 30, tipo = 'carros' },
	{ hash = -1177863319, name = 'issi2', price = 80000, banido = false, modelo = 'Issi', capacidade = 20, tipo = 'carros' },
	{ hash = 931280609, name = 'issi3', price = 35000, banido = false, modelo = 'Issi 1980', capacidade = 20, tipo = 'carros' },
	{ hash = -431692672, name = 'panto', price = 32000, banido = false, modelo = 'Panto', capacidade = 30, tipo = 'carros' },
	{ hash = -1450650718, name = 'prairie', price = 40000, banido = false, modelo = 'Prairie', capacidade = 30, tipo = 'carros' },
	{ hash = 841808271, name = 'rhapsody', price = 30000, banido = false, modelo = 'Rhapsody', capacidade = 30, tipo = 'carros' },

	{ hash = GetHashKey("asbo"), name = 'asbo', price = 100000, banido = false, modelo = 'Asbo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("club"), name = 'club', price = 120000, banido = false, modelo = 'Club', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("kanjo"), name = 'kanjo', price = 150000, banido = false, modelo = 'Kanjo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("brioso2"), name = 'brioso2', price = 100000, banido = false, modelo = 'Brioso2', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("weevil"), name = 'weevil', price = 100000, banido = false, modelo = 'Weevil', capacidade = 20, tipo = 'carros' },

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

	{ hash = GetHashKey("previon"), name = 'previon', price = 200000, banido = false, modelo = 'Previon', capacidade = 50, tipo = 'carros' },

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

	{ hash = GetHashKey("stryder"), name = 'stryder', price = 300000, banido = false, modelo = 'stryder', capacidade = 15, tipo = 'motos' },


	 ------------------------MUSCLE-------------------------------------------
	 { hash = -1205801634, name = 'blade', price = 110000, banido = false, modelo = 'Blade', capacidade = 40, tipo = 'carros' },
	 { hash = 784565758, name = 'coquette3', price = 195000, banido = false, modelo = 'Coquette3', capacidade = 40, tipo = 'carros' },
	 { hash = -682211828, name = 'buccaneer', price = 130000, banido = false, modelo = 'Buccaneer', capacidade = 50, tipo = 'carros' },
	 { hash = -1013450936, name = 'buccaneer2', price = 260000, banido = false, modelo = 'Buccaneer2', capacidade = 60, tipo = 'carros' },
	 { hash = -1361687965, name = 'chino2', price = 200000, banido = false, modelo = 'Chino2', capacidade = 60, tipo = 'work' },
	 { hash = 6944621, name = 'dominator3', price = 370000, banido = false, modelo = 'Dominator3', capacidade = 30, tipo = 'carros' },
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
	{ hash = GetHashKey("chino"), name = 'chino', price = 190000, banido = false, modelo = 'Chino', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("deviant"), name = 'deviant', price = 300000, banido = false, modelo = 'Deviant', capacidade = 35, tipo = 'carros' },
	{ hash = GetHashKey("gauntlet3"), name = 'gauntlet3', price = 265000, banido = false, modelo = 'gauntlet3', capacidade = 35, tipo = 'carros' },
	{ hash = GetHashKey("gauntlet4"), name = 'gauntlet4', price = 300000, banido = false, modelo = 'gauntlet4', capacidade = 35, tipo = 'carros' },
	{ hash = GetHashKey("lurcher"), name = 'lurcher', price = 200000, banido = false, modelo = 'lurcher', capacidade = 70, tipo = 'carros' },
	{ hash = GetHashKey("peyote2"), name = 'peyote2', price = 400000, banido = false, modelo = 'peyote2', capacidade = 15, tipo = 'carros' },
	{ hash = GetHashKey("tulip"), name = 'tulip', price = 170000, banido = false, modelo = 'tulip', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("yosemite3"), name = 'yosemite3', price = 475000, banido = false, modelo = 'yosemite3', capacidade = 80, tipo = 'carros' },
	{ hash = GetHashKey("dominator7"), name = 'dominator7', price = 500000, banido = false, modelo = 'dominator7', capacidade = 30, tipo = 'carros' },

	------------------------Off-Road-------------------------------------------
	{ hash = 1126868326, name = 'bfinjection', price = 80000, banido = false, modelo = 'Bfinjection', capacidade = 20, tipo = 'carros' },
	{ hash = -2064372143, name = 'mesa3', price = 200000, banido = false, modelo = 'Mesa3', capacidade = 60, tipo = 'carros' },
	{ hash = -349601129, name = 'bifta', price = 190000, banido = false, modelo = 'Bifta', capacidade = 20, tipo = 'carros' },
	{ hash = -1237253773, name = 'dubsta3', price = 300000, banido = false, modelo = 'Dubsta3', capacidade = 80, tipo = 'carros' },
	{ hash = 1645267888, name = 'rancherxl', price = 220000, banido = false, modelo = 'Rancherxl', capacidade = 70, tipo = 'carros' },
	{ hash = -1532697517, name = 'riata', price = 250000, banido = false, modelo = 'Riata', capacidade = 70, tipo = 'carros' },
	{ hash = -1189015600, name = 'sandking', price = 400000, banido = false, modelo = 'Sandking', capacidade = 100, tipo = 'carros' },
	{ hash = 989381445, name = 'sandking2', price = 370000, banido = false, modelo = 'Sandking2', capacidade = 100, tipo = 'carros' },
	
	{ hash = GetHashKey("caracara2"), name = 'caracara2', price = 500000, banido = false, modelo = 'caracara2', capacidade = 90, tipo = 'carros' },
	{ hash = GetHashKey("everon"), name = 'everon', price = 600000, banido = false, modelo = 'everon', capacidade = 90, tipo = 'carros' },
	{ hash = GetHashKey("freecrawler"), name = 'freecrawler', price = 300000, banido = false, modelo = 'freecrawler', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("hellion"), name = 'hellion', price = 320000, banido = false, modelo = 'hellion', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("kalahari"), name = 'kalahari', price = 100000, banido = false, modelo = 'kalahari', capacidade = 10, tipo = 'carros' },
	{ hash = GetHashKey("outlaw"), name = 'outlaw', price = 450000, banido = false, modelo = 'outlaw', capacidade = 10, tipo = 'carros' },
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
	{ hash = GetHashKey("landstalker2"), name = 'landstalker2', price = 200000, banido = false, modelo = 'landstalker2', capacidade = 70, tipo = 'carros' },
	{ hash = GetHashKey("novak"), name = 'novak', price = 370000, banido = false, modelo = 'novak', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("rebla"), name = 'rebla', price = 440000, banido = false, modelo = 'rebla', capacidade = 50, tipo = 'carros' },
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
	{ hash = GetHashKey("glendale2"), name = 'glendale2', price = 150000, banido = false, modelo = 'rebla', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("stafford"), name = 'stafford', price = 900000, banido = false, modelo = 'stafford', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("surge"), name = 'surge', price = 300000, banido = false, modelo = 'surge', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("tailgater2"), name = 'tailgater2', price = 600000, banido = false, modelo = 'tailgater2', capacidade = 50, tipo = 'carros' },
	
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
	{ hash = GetHashKey("comet2"), name = 'comet2', price = 500000, banido = false, modelo = 'comet2', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("comet3"), name = 'comet3', price = 600000, banido = false, modelo = 'comet3', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("comet5"), name = 'comet5', price = 700000, banido = false, modelo = 'comet5', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("coquette4"), name = 'coquette4', price = 700000, banido = false, modelo = 'coquette4', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("drafter"), name = 'drafter', price = 650000, banido = false, modelo = 'drafter', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("deveste"), name = 'deveste', price = 1150000, banido = false, modelo = 'deveste', capacidade = 15, tipo = 'carros' },
	{ hash = GetHashKey("komoda"), name = 'komoda', price = 450000, banido = false, modelo = 'komoda', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("imorgon"), name = 'imorgon', price = 550000, banido = false, modelo = 'imorgon', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("issi7"), name = 'issi7', price = 850000, banido = false, modelo = 'issi7', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("jugular"), name = 'jugular', price = 750000, banido = false, modelo = 'jugular', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("locust"), name = 'locust', price = 1350000, banido = false, modelo = 'locust', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("neo"), name = 'neo', price = 1050000, banido = false, modelo = 'neo', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("paragon"), name = 'paragon', price = 850000, banido = false, modelo = 'paragon', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("penumbra2"), name = 'penumbra2', price = 850000, banido = false, modelo = 'penumbra2', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("sultan2"), name = 'sultan2', price = 550000, banido = false, modelo = 'sultan2', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("vstr"), name = 'vstr', price = 750000, banido = false, modelo = 'vstr', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("italirsx"), name = 'italirsx', price = 1550000, banido = false, modelo = 'italirsx', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("zr350"), name = 'zr350', price = 1350000, banido = false, modelo = 'zr350', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("calico"), name = 'calico', price = 1450000, banido = false, modelo = 'calico', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("euros"), name = 'euros', price = 1450000, banido = false, modelo = 'euros', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("jester4"), name = 'jester4', price = 1450000, banido = false, modelo = 'jester4', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("remus"), name = 'remus', price = 450000, banido = false, modelo = 'remus', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("comet6"), name = 'comet6', price = 1400000, banido = false, modelo = 'comet6', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("growler"), name = 'growler', price = 1400000, banido = false, modelo = 'growler', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("vectre"), name = 'vectre', price = 1000000, banido = false, modelo = 'vectre', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("cypher"), name = 'cypher', price = 1100000, banido = false, modelo = 'cypher', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sultan3"), name = 'sultan3', price = 700000, banido = false, modelo = 'sultan3', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("rt3000"), name = 'rt3000', price = 700000, banido = false, modelo = 'rt3000', capacidade = 40, tipo = 'carros' },
    ------------------------ CLASSICS -------------------------------------------
	{ hash = 117401876, name = 'btype', price = 200000, banido = false, modelo = 'Btype', capacidade = 40, tipo = 'work' },
	{ hash = 941800958, name = 'casco', price = 355000, banido = false, modelo = 'Casco', capacidade = 40, tipo = 'carros' },
	{ hash = 8501280, name = 'cheburek', price = 170000, banido = false, modelo = 'Cheburek', capacidade = 50, tipo = 'carros' },
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
	{ hash = GetHashKey("dynasty"), name = 'dynasty', price = 500000, banido = false, modelo = 'dynasty', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("fagaloa"), name = 'fagaloa', price = 450000, banido = false, modelo = 'fagaloa', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("nebula"), name = 'nebula', price = 500000, banido = false, modelo = 'nebula', capacidade = 40, tipo = 'carros' },

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
	{ hash = GetHashKey("furia"), name = 'furia', price = 700000, banido = false, modelo = 'furia', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("emerus"), name = 'emerus', price = 840000, banido = false, modelo = 'emerus', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("krieger"), name = 'krieger', price = 900000, banido = false, modelo = 'krieger', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("sheava"), name = 'sheava', price = 800000, banido = false, modelo = 'sheava', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("thrax"), name = 'thrax', price = 1000000, banido = false, modelo = 'thrax', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("zorrusso"), name = 'zorrusso', price = 100000, banido = false, modelo = 'zorrusso', capacidade = 20, tipo = 'carros' },

     ------------------------ VANS -------------------------------------------
	 { hash = -1346687836, name = 'burrito', price = 260000, banido = false, modelo = 'Burrito', capacidade = 100, tipo = 'work' },
	 { hash = -1743316013, name = 'burrito3', price = 260000, banido = false, modelo = 'Burrito3', capacidade = 100, tipo = 'work' },
     { hash = -310465116, name = 'minivan', price = 200000, banido = false, modelo = 'Minivan', capacidade = 70, tipo = 'work' },
	 { hash = -1745203402, name = 'gburrito', price = 200000, banido = false, modelo = 'GBurrito', capacidade = 100, tipo = 'work' },
	 { hash = 1488164764, name = 'paradise', price = 260000, banido = false, modelo = 'Paradise', capacidade = 100, tipo = 'work' },
	 { hash = 943752001, name = 'pony2', price = 260000, banido = false, modelo = 'Pony2', capacidade = 100, tipo = 'work' },
	 { hash = 1475773103, name = 'rumpo3', price = 350000, banido = false, modelo = 'Rumpo3', capacidade = 100, tipo = 'work' },
	 { hash = -810318068, name = 'speedo', price = 200000, banido = false, modelo = 'Speedo', capacidade = 100, tipo = 'work' },
	 { hash = 699456151, name = 'surfer', price = 55000, banido = false, modelo = 'Surfer', capacidade = 80, tipo = 'work' },
	 { hash = 65402552, name = 'youga', price = 260000, banido = false, modelo = 'Youga', capacidade = 100, tipo = 'work' },
	 { hash = GetHashKey("ratloader"), name = 'ratloader', price = 260000, banido = false, modelo = 'ratloader', capacidade = 60, tipo = 'work' },
	 
	-------------------------------------------------------EXCLUSIVES ADD-ONS BRASIL----------------------------------------------------------------
	{ hash = GetHashKey("fox"), name = 'fox', price = 80000, banido = false, modelo = 'Fox', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("amarok"), name = 'amarok', price = 300000, banido = false, modelo = 'Amarok', capacidade = 80, tipo = 'carros' },
	{ hash = GetHashKey("vwbeetlenaj"), name = 'vwbeetlenaj', price = 50000, banido = false, modelo = 'Fusca', capacidade = 20, tipo = 'carros' },
	{ hash = GetHashKey("defender21"), name = 'defender21', price = 300000, banido = false, modelo = 'Defender 2021', capacidade = 70, tipo = 'carros' },
	{ hash = GetHashKey("gcmcorolla20cn"), name = 'gcmcorolla20cn', price = 250000, banido = false, modelo = 'Corolla', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("gcmsentra20"), name = 'gcmsentra20', price = 100000, banido = false, modelo = 'Sentra 2020', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("golfgti7"), name = 'golfgti7', price = 250000, banido = false, modelo = 'Golf GTI', capacidade = 45, tipo = 'carros' },
	{ hash = GetHashKey("jettagli"), name = 'jettagli', price = 350000, banido = false, modelo = 'Jetta GLI', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("polo2018"), name = 'polo2018', price = 80000, banido = false, modelo = 'Polo', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("savaoriginal"), name = 'savaoriginal', price = 60000, banido = false, modelo = 'Saveiro Surf', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("taigun21"), name = 'taigun21', price = 100000, banido = false, modelo = 'Taigun', capacidade = 60, tipo = 'carros' },
	{ hash = GetHashKey("uptsi"), name = 'uptsi', price = 120000, banido = false, modelo = 'UP TSI', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("veloster"), name = 'veloster', price = 80000, banido = false, modelo = 'Veloster', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("cox2013"), name = 'cox2013', price = 120000, banido = false, modelo = 'New Beetle', capacidade = 40, tipo = 'carros' },
	-- ADD-ON motos
	{ hash = GetHashKey("v4sf"), name = 'Ducati v4S', price = 600000, banido = false, modelo = 'Ducati', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("mt03"), name = 'MT-03', price = 150000, banido = false, modelo = 'MT-03', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("fz07"), name = 'MT-07', price = 200000, banido = false, modelo = 'MT-07', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("R1200GS"), name = 'R1200GS', price = 1100000, banido = false, modelo = 'R1200GS', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("cg160"), name = 'CG Auto Escola', price = 50000, banido = false, modelo = 'CG 160', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("cg1602"), name = 'CG 160', price = 50000, banido = false, modelo = 'CG 160', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("xre300"), name = 'XRE 300', price = 100000, banido = false, modelo = 'XRE 300', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("hcbr17"), name = 'CBR 1000RR', price = 900000, banido = false, modelo = 'CBR 1000RR', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("z1000"), name = 'z1000', price = 1000000, banido = false, modelo = 'z1000', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("r1"), name = 'Yamaha R1', price = 300000, banido = false, modelo = 'Yamaha R1', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("gsxr"), name = 'Suzuki XR', price = 300000, banido = false, modelo = 'Suzuki XR', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("h2carb"), name = 'Ninja H2 Carb', price = 800000, banido = false, modelo = 'Ninja H2 Carb', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("hayabusa"), name = 'Hayabusa', price = 700000, banido = false, modelo = 'Hayabusa', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("hornet"), name = 'Hornet', price = 200000, banido = false, modelo = 'Hornet', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("r6"), name = 'Yamaha R6', price = 400000, banido = false, modelo = 'Yamaha R6', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("s1000docandidato"), name = 'Bmw S1000', price = 1000000, banido = false, modelo = 'Bmw S1000', capacidade = 15, tipo = 'motos' },
	-- ADD-ON carros
	{ hash = GetHashKey("2019chiron"), name = '2019chiron', price = 2800000, banido = false, modelo = 'Bugatti', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("21camaro"), name = '21camaro', price = 2000000, banido = false, modelo = 'Camaro', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("911turbos"), name = '911turbos', price = 2500000, banido = false, modelo = 'Porche 911', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("audirs6"), name = 'audirs6', price = 2200000, banido = false, modelo = 'Audi RS6', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("audirs7"), name = 'audirs7', price = 2600000, banido = false, modelo = 'Audi RS7', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("bmci"), name = 'bmci', price = 1700000, banido = false, modelo = 'BMW M4', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("bmwm3f80"), name = 'bmwm3f80', price = 1500000, banido = false, modelo = 'BMW M3', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("bmwm4gts"), name = 'bmwm4gts', price = 1700000, banido = false, modelo = 'BMW M4 GTS', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("dodgechargersrt"), name = 'dodgechargersrt', price = 1500000, banido = false, modelo = 'Dodge Charger', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("ferrariitalia"), name = 'ferrariitalia', price = 3000000, banido = false, modelo = 'Ferrari Italia', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("focusrs"), name = 'focusrs', price = 1600000, banido = false, modelo = 'Focus RS', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("fordmustang"), name = 'fordmustang', price = 2000000, banido = false, modelo = 'Ford Mustang', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("fpacehm"), name = 'fpacehm', price = 2000000, banido = false, modelo = 'Jaguar F-pace', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("lancerevolution9"), name = 'lancerevolution9', price = 1500000, banido = false, modelo = 'Lance Evo 9', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("lancerevolutionx"), name = 'lancerevolutionx', price = 1800000, banido = false, modelo = 'Lance Evo X', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("macan"), name = 'macan', price = 1800000, banido = false, modelo = 'Porsche Macan', capacidade = 65, tipo = 'import' },
	{ hash = GetHashKey("mazdarx7"), name = 'mazdarx7', price = 1500000, banido = false, modelo = 'Mazda RX7', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("mercedesa45"), name = 'mercedesa45', price = 1500000, banido = false, modelo = 'Mercedes A45', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("nissan370z"), name = 'nissan370z', price = 1500000, banido = false, modelo = 'Nissan 370Z', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("nissangtr"), name = 'nissangtr', price = 2000000, banido = false, modelo = 'Nissan GTR', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("nissanskyliner34"), name = 'nissanskyliner34', price = 2200000, banido = false, modelo = 'Skyline', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("p1"), name = 'p1', price = 3000000, banido = false, modelo = 'Mclaren P1', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("panamera17turbo"), name = 'panamera17turbo', price = 2800000, banido = false, modelo = 'Panamera Turbo', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("raptor2017"), name = 'raptor2017', price = 2200000, banido = false, modelo = 'Raptor', capacidade = 70, tipo = 'import' },
	{ hash = GetHashKey("rs6c8"), name = 'rs6c8', price = 2600000, banido = false, modelo = 'Audi RS6 Sedan', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("teslaprior"), name = 'teslaprior', price = 3100000, banido = false, modelo = 'Tesla Prior', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("velociraptor"), name = 'velociraptor', price = 3000000, banido = false, modelo = 'Velociraptor', capacidade = 70, tipo = 'import' },
	{ hash = GetHashKey("rrst"), name = 'rrst', price = 1800000, banido = false, modelo = 'Range Rover', capacidade = 70, tipo = 'import' },
	{ hash = GetHashKey("bmwg7"), name = 'bmwg7', price = 2800000, banido = false, modelo = 'Bmw X7', capacidade = 70, tipo = 'import' },
	{ hash = GetHashKey("cayenneturbo"), name = 'cayenneturbo', price = 2000000, banido = false, modelo = 'Porsche Cayenne', capacidade = 70, tipo = 'import' },
	{ hash = GetHashKey("22g63"), name = '22g63', price = 2200000, banido = false, modelo = 'Mercedes G63', capacidade = 40, tipo = 'import' },
	{ hash = GetHashKey("velar"), name = 'velar', price = 3000000, banido = false, modelo = 'Velar', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("x6m"), name = 'x6m', price = 3100000, banido = false, modelo = 'BMW x6M', capacidade = 60, tipo = 'import' },
	{ hash = GetHashKey("teslax"), name = 'teslax', price = 3100000, banido = false, modelo = 'Tesla Model X', capacidade = 50, tipo = 'import' },
	{ hash = GetHashKey("ttrs"), name = 'ttrs', price = 2000000, banido = false, modelo = 'Audi TT', capacidade = 30, tipo = 'import' },
	{ hash = GetHashKey("cdaaltafome"), name = 'cdaaltafome', price = 800000, banido = false, modelo = 'C160', capacidade = 0, tipo = 'motos' },
	{ hash = GetHashKey("cdaavalanches"), name = 'cdaavalanches', price = 800000, banido = false, modelo = 'C160 Ifood', capacidade = 0, tipo = 'motos' },
	{ hash = GetHashKey("cdacaddy"), name = 'cdacaddy', price = 800000, banido = false, modelo = 'Van Sedex', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("cdacaddy2"), name = 'cdacaddy2', price = 800000, banido = false, modelo = 'Van Ifood', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("cdagas"), name = 'cdagas', price = 800000, banido = false, modelo = 'Carro Gás', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("cdaraptor"), name = 'cdaraptor', price = 800000, banido = false, modelo = 'Raptor', capacidade = 50, tipo = 'carros' },
	{ hash = GetHashKey("cdauno"), name = 'cdauno', price = 800000, banido = false, modelo = 'Uno', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("l20021"), name = 'l20021', price = 800000, banido = false, modelo = 'L200 Bombeiros', capacidade = 40, tipo = 'carros' },
	{ hash = GetHashKey("basepm2"), name = 'basepm2', price = 800000, banido = false, modelo = 'Van PMESP', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("paliopmrp1"), name = 'paliopmrp1', price = 800000, banido = false, modelo = 'Palio PMESP', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("spacepm1"), name = 'spacepm1', price = 800000, banido = false, modelo = 'Space PMESP', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("spinpc1"), name = 'spinpc1', price = 800000, banido = false, modelo = 'Spin PCESP', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sw4pc1"), name = 'sw4pc1', price = 800000, banido = false, modelo = 'SW4 PCESP', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sw4rota"), name = 'sw4rota', price = 800000, banido = false, modelo = 'SW4 ROTA', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trailcfp"), name = 'trailcfp', price = 800000, banido = false, modelo = 'Trail COMANDO', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("africaprf"), name = 'africaprf', price = 800000, banido = false, modelo = 'Africa PRF', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("as350"), name = 'as350', price = 800000, banido = false, modelo = 'Heli PMESP', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("as350prf"), name = 'as350prf', price = 800000, banido = false, modelo = 'Heli PRF', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("corprf"), name = 'corprf', price = 800000, banido = false, modelo = 'Corolla PRF', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("cruzeprf2"), name = 'cruzeprf2', price = 800000, banido = false, modelo = 'Cruze PRF', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("Frogger2"), name = 'Frogger2', price = 800000, banido = false, modelo = 'Heli PCESP', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("golpm"), name = 'golpm', price = 800000, banido = false, modelo = 'Gol PM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("l200prf"), name = 'l200prf', price = 800000, banido = false, modelo = 'L200 PRF', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("motosamu"), name = 'motosamu', price = 800000, banido = false, modelo = 'Moto SAMU', capacidade = 15, tipo = 'motos' },
	{ hash = GetHashKey("stretcher"), name = 'stretcher', price = 800000, banido = false, modelo = 'Maca', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("iak_wheelchair"), name = 'iak_wheelchair', price = 800000, banido = false, modelo = 'Cadeira de rodas', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("pbus"), name = 'pbus', price = 800000, banido = false, modelo = 'Onibus PM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("supervolito"), name = 'supervolito', price = 800000, banido = false, modelo = 'Heli SAMU', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("speedo2"), name = 'speedo2', price = 800000, banido = false, modelo = 'IML', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("taxi"), name = 'taxi', price = 800000, banido = false, modelo = 'Táxi', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trailprf"), name = 'trailprf', price = 800000, banido = false, modelo = 'Trail PRF', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sprinter"), name = 'sprinter', price = 800000, banido = false, modelo = 'Sprinter Bombeiro', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("firetruk"), name = 'firetruk', price = 800000, banido = false, modelo = 'Caminhão Bombeiro', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("xt660cb2"), name = 'xt660cb2', price = 800000, banido = false, modelo = 'XT Bombeiro', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("amarokeb"), name = 'amarokeb', price = 800000, banido = false, modelo = 'Amarok EB', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("eb350"), name = 'eb350', price = 800000, banido = false, modelo = 'Heli EB', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("s10eb"), name = 's10eb', price = 800000, banido = false, modelo = 'S10 EB', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sw4eb"), name = 'sw4eb', price = 800000, banido = false, modelo = 'SW4 EB', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("duster20pm"), name = 'duster20pm', price = 800000, banido = false, modelo = 'Duster PM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("spin15pm"), name = 'spin15pm', price = 800000, banido = false, modelo = 'Spin PM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("spin20pm"), name = 'spin20pm', price = 800000, banido = false, modelo = 'Spin 2020', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trailcpm"), name = 'trailcpm', price = 800000, banido = false, modelo = 'Trail CPM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("xt2017pm"), name = 'xt2017pm', price = 800000, banido = false, modelo = 'XT PM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trailprf"), name = 'trailprf', price = 800000, banido = false, modelo = 'Trail PM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("xre2020pm"), name = 'xre2020pm', price = 800000, banido = false, modelo = 'XRE PM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("tiger800pm"), name = 'tiger800pm', price = 800000, banido = false, modelo = 'T800 PM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trail22ft"), name = 'trail22ft', price = 800000, banido = false, modelo = 'Trail 22 FT', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("s10pcivil"), name = 's10pcivil', price = 800000, banido = false, modelo = 'S10 PC', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("duster20pc"), name = 'duster20pc', price = 800000, banido = false, modelo = 'Duster PC', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trail21garra"), name = 'trail21garra', price = 800000, banido = false, modelo = 'Trail 21 GARRA', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sw4rota"), name = 'sw4rota', price = 800000, banido = false, modelo = 'SW4 ROTA', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trail20rota"), name = 'trail20rota', price = 800000, banido = false, modelo = 'Trail 20 ROTA', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trail21rota"), name = 'trail21rota', price = 800000, banido = false, modelo = 'Trail 21 ROTA', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trail22rota"), name = 'trail22rota', price = 800000, banido = false, modelo = 'Trail 22 ROTA', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("s10p"), name = 's10p', price = 800000, banido = false, modelo = 'S10 Bombeiro', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("as350pc"), name = 'as350pc', price = 800000, banido = false, modelo = 'Heli PC', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("as3502"), name = 'as3502', price = 800000, banido = false, modelo = 'Heli PM', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trailft20"), name = 'trailft20', price = 800000, banido = false, modelo = 'Trail 2020', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sw4pm"), name = 'sw4pm', price = 800000, banido = false, modelo = 'SW4 FT', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("s10sap"), name = 's10sap', price = 800000, banido = false, modelo = 'S10 SAP', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sw4baep"), name = 'sw4baep', price = 800000, banido = false, modelo = 'SW4 BAEP', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trail20baep"), name = 'trail20baep', price = 800000, banido = false, modelo = 'Trail BAEP 20', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trail17baep"), name = 'trail17baep', price = 800000, banido = false, modelo = 'Trail BAEP 17', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trail20eb"), name = 'trail20eb', price = 800000, banido = false, modelo = 'Trail 20 EB', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("trail21eb"), name = 'trail21eb', price = 800000, banido = false, modelo = 'Trail 21 EB', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("cruiser"), name = 'cruiser', price = 0, banido = false, modelo = 'Bicicleta', capacidade = 30, tipo = 'motos' },
	{ hash = GetHashKey("mi4"), name = 'mi4', price = 800000, banido = false, modelo = 'Onibus', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("comet2"), name = 'comet2', price = 800000, banido = false, modelo = 'Uno Escada', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("dinghy2"), name = 'dinghy2', price = 800000, banido = false, modelo = 'Bote Pequeno', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("boxville4"), name = 'boxville4', price = 800000, banido = false, modelo = 'Van Entrega', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("annihilator"), name = 'annihilator', price = 800000, banido = false, modelo = 'Helicoptero EB', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("sato"), name = 'sato', price = 800000, banido = false, modelo = 'Blindado', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("hiluxpe"), name = 'hiluxpe', price = 800000, banido = false, modelo = 'Hilux EB', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("VRraptor"), name = 'VRraptor', price = 800000, banido = false, modelo = 'Raptor EB', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("sprintereb"), name = 'sprintereb', price = 800000, banido = false, modelo = 'Sprinter EB', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("barracks"), name = 'barracks', price = 800000, banido = false, modelo = 'Barracks EB', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("trail20eb"), name = 'trail20eb', price = 800000, banido = false, modelo = 'Trail EB', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("stockade"), name = 'stockade', price = 800000, banido = false, modelo = 'Carro Forte', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("trail22pc"), name = 'trail22pc', price = 800000, banido = false, modelo = 'Trail 22 PC', capacidade = 0, tipo = 'carros' },
	{ hash = GetHashKey("a80"), name = 'a80', price = 800000, banido = false, modelo = 'Supra22', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("2f2fgtr34"), name = '2f2fgtr34', price = 800000, banido = false, modelo = 'GtrR34', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("18performante"), name = '18performante', price = 800000, banido = false, modelo = 'Huracan', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("23s63l"), name = '23s63l', price = 800000, banido = false, modelo = 'S63', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("150"), name = '150', price = 800000, banido = false, modelo = 'Cg150', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("370z"), name = '370z', price = 800000, banido = false, modelo = '370z', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("675ltsp"), name = '675ltsp', price = 800000, banido = false, modelo = '675', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("718b"), name = '718b', price = 800000, banido = false, modelo = '718', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("918s"), name = '918s', price = 800000, banido = false, modelo = '918s', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("adr8"), name = 'adr8', price = 800000, banido = false, modelo = 'R8', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("africat"), name = 'africat', price = 800000, banido = false, modelo = 'Africa Twin', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("agerars"), name = 'agerars', price = 800000, banido = false, modelo = 'Agerars', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("amarok"), name = 'amarok', price = 800000, banido = false, modelo = 'Amarok', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("audirs7"), name = 'audirs7', price = 800000, banido = false, modelo = 'Audirs7', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("bikelete"), name = 'bikelete', price = 800000, banido = false, modelo = 'bikelete', capacidade = 30, tipo = 'carros' },
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
	{ hash = GetHashKey("dm1200"), name = 'dm1200', price = 800000, banido = false, modelo = 'Ducati MultiStrada', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("evo9"), name = 'evo9', price = 800000, banido = false, modelo = 'Evo9', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("f150"), name = 'f150', price = 800000, banido = false, modelo = 'F150', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("f850"), name = 'f850', price = 800000, banido = false, modelo = 'Gs850', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("fc15"), name = 'fc15', price = 800000, banido = false, modelo = 'ferrari california ', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("fd"), name = 'fd', price = 800000, banido = false, modelo = 'Rx7', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("ferrariitalia"), name = 'ferrariitalia', price = 800000, banido = false, modelo = 'ferrariitalia', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxc8wb"), name = 'foxc8wb', price = 800000, banido = false, modelo = 'C8 Sport', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxevo"), name = 'foxevo', price = 800000, banido = false, modelo = 'huracanEvo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxevos"), name = 'foxevos', price = 800000, banido = false, modelo = 'huracanEvos', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxgt2"), name = 'foxgt2', price = 800000, banido = false, modelo = 'Gt2', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("foxsenna"), name = 'foxsenna', price = 800000, banido = false, modelo = 'Senna', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("fxxkevo"), name = 'fxxkevo', price = 800000, banido = false, modelo = 'Ferrari Evo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("giuliagta"), name = 'giuliagta', price = 800000, banido = false, modelo = 'Giulia Gta', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("gle53"), name = 'gle53', price = 800000, banido = false, modelo = 'Gle 53 Amg', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("gs2013"), name = 'gs2013', price = 800000, banido = false, modelo = 'Gs1200 ADV', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("gsxr"), name = 'gsxr', price = 800000, banido = false, modelo = 'Suzuke Gsxr', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("hcej1"), name = 'hcej1', price = 800000, banido = false, modelo = 'Honda 98 Tuning', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("hornet"), name = 'hornet', price = 800000, banido = false, modelo = 'hornet', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("huayrar"), name = 'huayrar', price = 800000, banido = false, modelo = 'Pagani', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("jetta2017"), name = 'jetta2017', price = 800000, banido = false, modelo = 'jetta2017', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("lancerevolutionx"), name = 'lancerevolutionx', price = 800000, banido = false, modelo = 'lancerevolutionx', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("lexuslfa"), name = 'lexuslfa', price = 800000, banido = false, modelo = 'lexuslfa', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("m3e46"), name = 'm3e46', price = 800000, banido = false, modelo = 'M3e46', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("macanturbo"), name = 'macanturbo', price = 800000, banido = false, modelo = 'Macan Turbo', capacidade = 30, tipo = 'carros' },

	{ hash = GetHashKey("mt07"), name = 'mt07', price = 800000, banido = false, modelo = 'Mt07', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("nissangtr"), name = 'nissangtr', price = 800000, banido = false, modelo = 'nissangtr', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("nissanskyliner34"), name = 'nissanskyliner34', price = 800000, banido = false, modelo = 'nissanskyliner34', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("palio"), name = 'palio', price = 800000, banido = false, modelo = 'palio', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("palio2"), name = 'palio2', price = 800000, banido = false, modelo = 'Palio rebaixado', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("panamera17turbo"), name = 'panamera17turbo', price = 800000, banido = false, modelo = 'panamera17turbo', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("PCX"), name = 'PCX', price = 800000, banido = false, modelo = 'PCX', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("pistaspider19"), name = 'pistaspider19', price = 800000, banido = false, modelo = 'spider', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("r1200"), name = 'r1200', price = 800000, banido = false, modelo = 'r1200', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodbentleygt"), name = 'rmodbentleygt', price = 800000, banido = false, modelo = 'Bentley gt', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodcharger69"), name = 'rmodcharger69', price = 800000, banido = false, modelo = 'Charger69', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodf12tdf"), name = 'rmodf12tdf', price = 800000, banido = false, modelo = 'F12tdf', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodf40"), name = 'rmodf40', price = 800000, banido = false, modelo = 'F40', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodgt63"), name = 'rmodgt63', price = 800000, banido = false, modelo = 'Gt 63', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodgtr50"), name = 'rmodgtr50', price = 800000, banido = false, modelo = 'Gtr 50', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodjesko"), name = 'rmodjesko', price = 800000, banido = false, modelo = 'Jesko', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodmartin"), name = 'rmodmartin', price = 800000, banido = false, modelo = 'Aston Martin DBS', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rmodsianr"), name = 'rmodsianr', price = 800000, banido = false, modelo = 'Sianr', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("rs520"), name = 'rs520', price = 800000, banido = false, modelo = 'Rs520', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("s10"), name = 's10', price = 800000, banido = false, modelo = 's10', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("s1000rr"), name = 's1000rr', price = 800000, banido = false, modelo = 's1000rr', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("silvia"), name = 'silvia', price = 800000, banido = false, modelo = 'silvia', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("silvias15"), name = 'silvias15', price = 800000, banido = false, modelo = 'silvias15', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("sjdodge"), name = 'sjdodge', price = 800000, banido = false, modelo = 'Dodge SRT', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("taycan21"), name = 'taycan21', price = 800000, banido = false, modelo = 'taycan21', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("tenere1200"), name = 'tenere1200', price = 800000, banido = false, modelo = 'tenere1200', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("xj6"), name = 'xj6', price = 800000, banido = false, modelo = 'xj6', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("xt660vip"), name = 'xt660vip', price = 800000, banido = false, modelo = 'xt660vip', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("a45flkpolice"), name = 'a45flkpolice', price = 800000, banido = false, modelo = 'a45flkpolice', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("wrsgle63"), name = 'wrsgle63', price = 800000, banido = false, modelo = 'Gle63', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("wrsm760"), name = 'wrsm760', price = 800000, banido = false, modelo = 'bmw760', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("wrsurus"), name = 'wrsurus', price = 800000, banido = false, modelo = 'Urus', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("bmwm3"), name = 'bmwm3', price = 800000, banido = false, modelo = 'bmwm3', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("bmwm4"), name = 'bmwm4', price = 800000, banido = false, modelo = 'bmwm4', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("bmwm5"), name = 'bmwm5', price = 800000, banido = false, modelo = 'bmwm5', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("jettagli"), name = 'jettagli', price = 800000, banido = false, modelo = 'jettagli', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("nkamarok"), name = 'nkamarok', price = 800000, banido = false, modelo = 'nkamarok', capacidade = 30, tipo = 'carros' },
	{ hash = GetHashKey("tiger"), name = 'tiger', price = 800000, banido = false, modelo = 'tiger', capacidade = 30, tipo = 'carros' },


}
----------------------------------------------
----------------------------------------------
----------------------------------------------


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



-----------------------------------------------------------------
------------- GARAGENS PÚBLICAS E DE SERVIÇO --------------------
-----------------------------------------------------------------
--1991.13,3778.13,32.19 GARAGEM 2
config.garages = {
	[1] = { type = 'public', coords = vec3(55.71,-876.25,30.67), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(50.92,-872.85,30.45), h = 156.36 },
		[2] = { vec3(47.57,-871.51,30.46), h = 156.36 },
		[3] = { vec3(44.3,-870.4,30.47), h = 156.36 },
	  },
	},
	[2] = { type = 'public', coords = vec3(596.62,91.2,93.13), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(598.34,98.45,92.91), h = 247.07 },
		[2] = { vec3(599.25,102.28,92.91), h = 247.07 },
	  },
	},
	[3] = { type = 'public', coords = vec3(-340.76,265.97,85.67), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-339.78,279.26,85.56), h = 274.01 },
		[2] = { vec3(-340.03,283.23,85.47), h = 274.01 },
		[3] = { vec3(-340.12,286.96,85.47), h = 274.01 },
	  },
	},
	[4] = { type = 'public', coords = vec3(-2030.01,-465.97,11.6), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-2024.02,-471.84,11.41), h = 140.96 },
		[2] = { vec3(-2021.72,-473.69,11.42), h = 140.96 },
		[3] = { vec3(-2019.4,-475.67,11.42), h = 140.96 },
	  },
	},
	[5] = { type = 'public', coords = vec3(-1184.92,-1510.0,4.64), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1183.0,-1495.58,4.38), h = 121.36 },
		[2] = { vec3(-1184.47,-1492.54,4.38), h = 121.36 },
		[3] = { vec3(-1186.43,-1490.15,4.38), h = 121.36 },
	  },
	},
	[6] = { type = 'public', coords = vec3(100.99,-1073.55,29.38), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(104.26,-1078.98,29.2), h = 342.08 },
		[2] = { vec3(107.9,-1080.11,29.2), h = 342.08 },
		[3] = { vec3(111.09,-1081.08,29.2), h = 342.08 },
	  },
	},
	[7] = { type = 'public', coords = vec3(-348.88,-874.02,31.31), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-343.64,-874.54,31.08), h = 170.99 },
		[2] = { vec3(-339.85,-875.7,31.08), h = 170.99 },
		[3] = { vec3(-336.39,-876.49,31.08), h = 170.99 },
	  },
	},
	[8] = { type = 'public', coords = vec3(-777.27,5593.78,33.64), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-771.15,5578.3,33.49), h = 87.87 },
		[2] = { vec3(-771.48,5575.17,33.49), h = 87.87 },
		[3] = { vec3(-771.69,5572.38,33.49), h = 87.87 },
	  },
	},
	[9] = { type = 'public', coords = vec3(541.94, 2663.76, 42.18), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(540.34, 2658.19, 41.64), h = 96.83 },

	  },
	},
	[10] = { type = 'public', coords = vec3(-423.78332519531,-342.98828125,24.229396820068), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-432.16662597656,-335.10076904297,23.623687744141), h = 197.62 },
		[2] = { vec3(-428.24481201172,-333.22442626953,23.623924255371), h = 199.36 },
	  },
	},

	
	[11] = { type = 'service', coords = vec3(2540.21,-336.15,94.13), perm = 'pmesp.permissao',
	  vehiclePositions = {
		[1] = { vec3(  2538.57,  -372.1,  93.0), h = 350.36 },
	  },
	  vehicles = {
		{ vehicle = 'a45flkpolice', modelo = 'a45flkpolice' },
		{ vehicle = 'wrsgle63', modelo = 'Gle63' },
		{ vehicle = 'wrsm760', modelo = 'Bwm760' },
		{ vehicle = 'wrsurus', modelo = 'Urus' },
		{ vehicle = 'bmwm3', modelo = 'bmwm3' },
		{ vehicle = 'bmwm5', modelo = 'bmwm5' },
		{ vehicle = 'tiger', modelo = 'tiger' },
	  }
	},
	[12] = { type = 'service', coords = vec3(1294.92, -749.1, 65.51), perm = 'grpae.permissao',
	  vehiclePositions = {
		[1] = { vec3(1294.88, -756.54, 65.51), h = 281.79 },
		[2] = { vec3(1284.72, -751.67, 65.51), h = 281.79 },
	  },
	  vehicles = {
		{ vehicle = 'as350', modelo = 'Heli GRPAe [1]' },
		{ vehicle = 'as3502', modelo = 'Heli GRPAe [2]' },
	  }
	},
	[13] = { type = 'service', coords = vec3(2619.0014648438,5364.3813476562,47.310840606689), perm = 'prf.permissao',
	  vehiclePositions = {
		[1] = { vec3(2616.4248046875,5359.8305664062,46.730770111084), h = 105.45 },
		[2] = { vec3(2617.3598632812,5356.4697265625,46.730632781982), h = 105.06 },
	  },
	  vehicles = {
		{ vehicle = 'africaprf', modelo = 'Africa' },
		{ vehicle = 'corprf', modelo = 'Corolla' },
		{ vehicle = 'cruzeprf2', modelo = 'Cruze' },
		{ vehicle = 'l200prf', modelo = 'L200' },
		{ vehicle = 'trailprf', modelo = 'Trail' },
	  }
	},
	[14] = { type = 'service', coords = vec3(286.51, -324.13, 46.22), perm = 'pcivil.permissao',
	  vehiclePositions = {
		[1] = { vec3(289.57, -326.04, 45.49 ), h = 248.82 },
		[2] = { vec3(288.05, -328.76, 45.48 ), h = 248.61 },
	  },
	  vehicles = {
		{ vehicle = 'trail22pc', modelo = 'Trail Civil' },
		{ vehicle = 's10pcivil', modelo = 'S10 Cabine' },
		{ vehicle = 'spin20pm', modelo = 'Spin' },
		{ vehicle = 'duster20pc', modelo = 'Duster PC' },
		{ vehicle = 'trail21garra', modelo = 'Trail Garra' },
	  }
	},
	[15] = { type = 'service', coords = vec3(1332.23, -726.64, 65.67), perm = 'ft.permissao',
	  vehiclePositions = {
		[1] = { vec3(1336.65, -721.15, 65.06), h = 334.33 },
		[2] = { vec3(1330.4, -718.81, 65.06), h = 330.67 },
	  },
	  vehicles = {
		{ vehicle = 'sw4pm', modelo = 'SW4' },
		{ vehicle = 'trailft20', modelo = 'Trail 2020' },
		{ vehicle = 'trail22ft', modelo = 'Trail 2022' },
	  }
	},
	[16] = { type = 'service', coords = vec3(-2053.48, -531.62, 12.22), perm = 'rota.permissao',
	  vehiclePositions = {
		[1] = { vec3(-2046.98, -519.02, 11.59), h = 50.56 },
		[2] = { vec3(-2044.16, -515.89, 11.59), h = 51.61 },
		[2] = { vec3(-2041.72, -512.84, 11.59), h = 51.2 },
	  },
	  vehicles = {
		{ vehicle = 'sw4rota', modelo = 'SW4 ROTA' },
		{ vehicle = 'trail20rota', modelo = 'Trail 2020' },
		{ vehicle = 'trail21rota', modelo = 'Trail 2021' },
		{ vehicle = 'trail22rota', modelo = 'Trail 2022' },
	  }
	},
	[17] = { type = 'service', coords = vec3(-1134.07, -1703.48, 5.05), perm = 'bombeiros.permissao',
	  vehiclePositions = {
		[1] = { vec3(-1128.56, -1721.3, 4.81), h = 213.73 },
		[2] = { vec3(-1123.04, -1719.94, 4.81), h = 214.83 },
		[3] = { vec3(-1117.21, -1715.53, 4.81), h = 214.41 },
		[4] = { vec3(-1113.91, -1712.61, 4.42), h = 213.78 },
	  },
	  vehicles = {
		{ vehicle = 'xt660cb2', modelo = 'XT' },
		{ vehicle = 'firetruk', modelo = 'Caminhão' },
		{ vehicle = 'l20021', modelo = 'L200' },
		{ vehicle = 's10p', modelo = 'S10' },
		{ vehicle = 'sprinter', modelo = 'Ambulância' },
	  }
	},
	[18] = { type = 'service', coords = vec3(-2322.8754882812,3258.2661132812,33.08135223), perm = 'exercito.permissao',
	  vehiclePositions = {
		[1] = { vec3(-2327.1511230469,3254.4228515625,32.220561981201), h = 61.66 },
	  },
	  vehicles = {
		{ vehicle = 'annihilator', modelo = 'Avião' },
		{ vehicle = 'sato', modelo = 'Blindado' },
		{ vehicle = 'hiluxpe', modelo = 'Hilux' },
		{ vehicle = 'VRraptor', modelo = 'Raptor' },
		{ vehicle = 'sprintereb', modelo = 'Sprinter' },
		{ vehicle = 'barracks', modelo = 'Caminhão' },
		{ vehicle = 'trail20eb', modelo = 'Trail' },
	  }
	},
	[19] = { type = 'service', coords = vec3(-421.01, -349.37, 24.23), perm = 'paramedico.permissao',
	  vehiclePositions = {
		[1] = { vec3(-419.04, -358.73, 23.93), h = 20.02 },
		[2] = { vec3(-422.92, -360.34, 23.93), h = 20.02 },
	  },
	  vehicles = {
		{ vehicle = 'stretcher', modelo = 'Maca' },
		{ vehicle = 'motosamu', modelo = 'Moto' },
		{ vehicle = 'iak_wheelchair', modelo = 'Cadeira de rodas' },
	  }
	},

	[20] = { type = 'service', coords = vec3(-447.14, -330.13, 78.17), perm = 'paramedico.permissao',
	  vehiclePositions = {
		[1] = { vec3(-448.05, -312.61, 78.02), h = 198.91 },
	  },
	  vehicles = {
		{ vehicle = 'supervolito', modelo = 'Resgate Aéreo' },
	  }
	},

	[21] = { type = 'public', coords = vec3(-1533.43, 80.68, 56.78), perm = nil, -- bratva
	vehiclePositions = {
	  [1] = { vec3(-1528.87, 82.74, 56.05), h = 280.74 },
	},
    },
	[22] = { type = 'public', coords = vec3(-1924.53, 2050.37, 140.84), perm = nil, -- cartel
	vehiclePositions = {
	  [1] = { vec3(-1920.75, 2048.91, 140.13), h = 256.06 },
	},
    },
	[23] = { type = 'service', coords = vec3(853.02, -2132.72, 30.55), perm = 'mecanico.permissao',
	  vehiclePositions = {
		[1] = { vec3(863.16, -2134.57, 30.61), h = 355.36 },
	  },
	  vehicles = {
		{ vehicle = 'flatbed3', modelo = 'Prancha' },
		{ vehicle = 'towtruck', modelo = 'Guincho' },
		{ vehicle = 'cdaraptor', modelo = 'Raptor' },
	  }
	},

	[24] = { type = 'service', coords = vec3(-1010.08, -2746.28, 13.76), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1008.8, -2742.51, 13.76), h = 324.05 },
		[2] = { vec3(-1007.17, -2743.65, 13.15), h = 328.76 },
		[3] = { vec3(-1005.44, -2744.89, 13.15), h = 333.39 },
	  },
	  vehicles = {
		{ vehicle = 'cruiser', modelo = 'Bicicleta' },
	  }
	},

	--[[ [25] = { type = 'service', coords = vec3(901.99, -178.49, 73.96), perm = 'taxista.permissao',
	  vehiclePositions = {
		[1] = { vec3(899.72, -180.7, 73.42), h = 238.41 },
		[2] = { vec3(897.7, -183.66, 73.34), h = 236.5 },
	  },
	  vehicles = {
		{ vehicle = 'taxi', modelo = 'Táxi' },
	  }
	}, ]]

	[25] = { type = 'public', coords = vec3(-2428.81, 1759.13, 187.97), perm = nil, -- verdes
	  vehiclePositions = {
		[1] = { vec3(-2427.41, 1757.36, 187.37), h = 313.27 },
	  },
	},

	[26] = { type = 'public', coords = vec3(857.34, -2095.42, 30.55), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(850.06, -2098.24, 30.01), h = 263.3 },
		[2] = { vec3(850.43, -2101.9, 29.98), h = 265.09 },
		[3] = { vec3(849.67, -2105.29, 30.0), h = 268.6 },
	  },
	},

	[27] = { type = 'public', coords = vec3(110.62, -138.68, 54.76), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(109.43, -133.97, 54.15), h = 69.5 },
		[2] = { vec3(110.65, -130.67, 54.15), h = 66.59 },
	  },
	},

	[28] = { type = 'service', coords = vec3(1528.87, 3810.03, 32.171), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1524.44, 3818.36, 30.37), h = 34.8 },
	  },
	  vehicles = {
		{ vehicle = 'dinghy2', modelo = 'Bote Pequeno' },
	  }
	},

	[29] = { type = 'public', coords = vec3(161.91, -1307.1, 29.36), perm = nil, -- vanilla
	  vehiclePositions = {
		[1] = { vec3(155.79, -1303.25, 28.6), h = 58.02 },
	  },
	},

	[30] = { type = 'public', coords = vec3(159.82, -3011.99, 6.0), perm = nil, --driftking
	  vehiclePositions = {
		[1] = { vec3(163.82, -3012.24, 5.3), h = 270.61 },
	  },
	},

	[31] = { type = 'public', coords = vec3(742.57, -1913.65, 29.3), perm = nil, --annonymous
	  vehiclePositions = {
		[1] = { vec3(740.3, -1916.86, 28.69), h = 176.39 },
	  },
	},

	[32] = { type = 'public', coords = vec3(935.98, 1.42, 78.77), perm = nil, -- casino
	  vehiclePositions = {
		[1] = { vec3(933.45, -3.33, 78.16), h = 148.04 },
	  },
	},

	[33] = { type = 'public', coords = vec3(4431.94, -4479.04, 4.33), perm = nil, -- farc
	  vehiclePositions = {
		[1] = { vec3(4437.28, -4474.74, 3.73), h = 289.15 },
	  },
	},

	[34] = { type = 'public', coords = vec3(2485.15, 4107.5, 38.02), perm = nil, -- the lost
	  vehiclePositions = {
		[1] = { vec3(2483.92, 4113.45, 37.46), h = 337.02 },
	  },
	},

	[35] = { type = 'public', coords = vec3(1662.15, -69.61, 174.17), perm = nil, -- roxos
	  vehiclePositions = {
		[1] = { vec3(1670.25, -63.0, 173.2), h = 250.47 },
	  },
	},

	[36] = { type = 'service', coords = vec3(-1178.48, -891.97, 13.8), perm = 'burguershot.permissao',
	  vehiclePositions = {
		[1] = { vec3(-1174.81, -892.19, 13.34), h = 307.76 },
	  },
	  vehicles = {
		{ vehicle = 'cdaaltafome', modelo = 'CG160' },
	  }
	},

	[37] = { type = 'service', coords = vec3(2621.2, 5364.82, 47.3), perm = 'prf.permissao',
	  vehiclePositions = {
		[1] = { vec3(2613.53, 5371.75, 48.83), h = 142.61 },
	  },
	  vehicles = {
		{ vehicle = 'as350prf', modelo = 'Heli PRF' },
	  }
	},

	[38] = { type = 'service', coords = vec3(44.87, 6518.58, 32.34), perm = 'baep.permissao',
	  vehiclePositions = {
		[1] = { vec3(52.14, 6512.06, 32.0), h = 313.65 },
		[2] = { vec3(54.86, 6509.38, 32.0), h = 315.17 },
		[2] = { vec3(57.72, 6506.66, 32.0), h = 315.45 },
	  },
	  vehicles = {
		{ vehicle = 'sw4baep', modelo = 'SW4' },
		{ vehicle = 'trail17baep', modelo = 'Trail 2017' },
		{ vehicle = 'trail20baep', modelo = 'Trail 2020' },
	  }
	},
	
	[39] = { type = 'service', coords = vec3(279.49, -336.46, 53.29), perm = 'pcivil.permissao',
	  vehiclePositions = {
		[1] = { vec3(286.79, -342.75, 53.24 ), h = 292.57 },
	  },
	  vehicles = {
		{ vehicle = 'as350pc', modelo = 'Águia PC' },
	  }
	},

	[40] = { type = 'service', coords = vec3(-447.97, -329.51, 34.51), perm = 'paramedico.permissao',
	  vehiclePositions = {
		[1] = { vec3(-447.53, -331.18, 34.51), h = 182.82 },
	  },
	  vehicles = {
		{ vehicle = 'iak_wheelchair', modelo = 'Cadeira de rodas' },
	  }
	},

  }
 
-----------------------------------------------------------------
-----------------------------------------------------------------

-----------------------------------------------------------------
------------------ GARAGENS DAS CASAS ---------------------------
-----------------------------------------------------------------

config.homeGarages = {
	[1] = { type = 'home', coords = vec3(21.41,548.3,176.02),
	  vehiclePositions = {
		[1] = { vec3(14.98,549.89,175.5), h = 60.7 },
	  },
	  home = 'MS01'
	},
	[2] = { type = 'home', coords = vec3(-681.48,901.64,230.57),
	  vehiclePositions = {
		[1] = { vec3(-675.44,903.59,229.73), h = 326.35 },
	  },
	  home = 'MS03'
	},
	[3] = { type = 'home', coords = vec3(-2596.87,1927.04,167.31),
	  vehiclePositions = {
		[1] = { vec3(-2588.73,1929.85,166.46), h = 275.01 },
	  },
	  home = 'MS04'
	},
	[4] = { type = 'home', coords = vec3(-3014.84,740.75,27.58),
	  vehiclePositions = {
		[1] = { vec3(-3019.92,740.24,26.63), h = 103.34 },
	  },
	  home = 'MS05'
	},
	[5] = { type = 'home', coords = vec3(-1890.29,-572.99,11.82),
	  vehiclePositions = {
		[1] = { vec3(-1886.63,-571.43,10.93), h = 319.54 },
	  },
	  home = 'MS09'
	},
	[6] = { type = 'home', coords = vec3(1551.96,2190.1,78.85),
	  vehiclePositions = {
		[1] = { vec3(1554.26,2196.07,78.5), h = 352.11 },
	  },
	  home = 'SS01'
	},
	[7] = { type = 'home', coords = vec3(-2977.14,650.92,25.78),
	  vehiclePositions = {
		[1] = { vec3(-2982.74,654.65,25.015), h = 106.83 },
	  },
	  home = 'MS08'
	},
	[8] = { type = 'home', coords = vec3(1398.36,1115.1,114.84),
	  vehiclePositions = {
		[1] = { vec3(1401.95,1118.01,114.84), h = 355.97 },
	  },
	  home = 'FZ01'
	},
	[9] = { type = 'home', coords = vec3(-1937.07,577.96,119.56),
	  vehiclePositions = {
		[1] = { vec3(-1943.92,583.37,118.79), h = 255.987 },
	  },
	  home = 'LX41'
	},
	[10] = { type = 'home', coords = vec3(-491.13,751.51,162.84),
	  vehiclePositions = {
		[1] = { vec3(-492.05,745.92,162.84), h = 329.81 },
	  },
	  home = 'FH85'
	},
	[11] = { type = 'home', coords = vec3(-877.56,497.95,91.02),
	  vehiclePositions = {
		[1] = { vec3(-872.97,499.76,90.47), h = 106.56 },
	  },
	  home = 'FH02'
	},
	[12] = { type = 'home', coords = vec3(-1005.17,715.55,164.0),
	  vehiclePositions = {
		[1] = { vec3(-1006.29,709.66,162.37), h = 344.07 },
	  },
	  home = 'FH16'
	},
	[13] = { type = 'home', coords = vec3(151.2,568.06,183.98),
	  vehiclePositions = {
		[1] = { vec3(148.7,572.69,183.95), h = 86.85 },
	  },
	  home = 'LX57'
	},
	[14] = { type = 'home', coords = vec3(-864.47,463.46,88.22),
	  vehiclePositions = {
		[1] = { vec3(-861.31,462.66,86.93), h = 276.73 },
	  },
	  home = 'FH01'
	},
	[15] = { type = 'home', coords = vec3(-850.62,522.18,90.62),
	  vehiclePositions = {
		[1] = { vec3(-851.05,514.29,90.15), h = 106.56 },
	  },
	  home = 'FH04'
	},
	[16] = { type = 'home', coords = vec3(-938.56,445.34,80.42),
	  vehiclePositions = {
		[1] = { vec3(-942.71,443.81,79.99), h = 198.88 },
	  },
	  home = 'FH11'
	},
	[17] = { type = 'home', coords = vec3(-1074.27,468.75,77.82),
	  vehiclePositions = {
		[1] = { vec3(-1079.1,465.49,76.79), h = 144.79 },
	  },
	  home = 'FH15'
	},
	[18] = { type = 'home', coords = vec3(-971.31,455.98,79.82),
	  vehiclePositions = {
		[1] = { vec3(-967.03,450.03,78.97), h = 199.58 },
	  },
	  home = 'FH19'
	},
	[19] = { type = 'home', coords = vec3(-736.59,439.85,106.9),
	  vehiclePositions = {
		[1] = { vec3(-736.19,446.59,105.88), h = 3.21 },
	  },
	  home = 'FH23'
	},
	[20] = { type = 'home', coords = vec3(-716.59,500.53,109.27),
	  vehiclePositions = {
		[1] = { vec3(-716.94,495.36,108.43), h = 206.78 },
	  },
	  home = 'FH24'
	},
	[21] = { type = 'home', coords = vec3(-692.91,507.84,110.36),
	  vehiclePositions = {
		[1] = { vec3(-688.85,500.77,109.21), h = 201.51 },
	  },
	  home = 'FH26'
	},
	[22] = { type = 'home', coords = vec3(-574.21,492.54,106.97),
	  vehiclePositions = {
		[1] = { vec3(-573.79,498.15,105.38), h = 9.46 },
	  },
	  home = 'FH29'
	},
	[23] = { type = 'home', coords = vec3(-589.59,531.83,108.17),
	  vehiclePositions = {
		[1] = { vec3(-586.67,526.68,106.72), h = 215.41 },
	  },
	  home = 'FH31'
	},
	[24] = { type = 'home', coords = vec3(-574.01,394.76,100.67),
	  vehiclePositions = {
		[1] = { vec3(-574.73,401.65,99.82), h = 19.61 },
	  },
	  home = 'FH32'
	},
	[25] = { type = 'home', coords = vec3(-447.07,376.54,104.77),
	  vehiclePositions = {
		[1] = { vec3(-456.49,372.48,103.93), h = 358.58 },
	  },
	  home = 'FH45'
	},
	[26] = { type = 'home', coords = vec3(-523.67,525.26,112.44),
	  vehiclePositions = {
		[1] = { vec3(-526.66,530.68,110.95), h = 44.11 },
	  },
	  home = 'FH48'
	},
	[27] = { type = 'home', coords = vec3(-517.36,578.31,120.84),
	  vehiclePositions = {
		[1] = { vec3(-511.63,577.15,119.52), h = 97.85 },
	  },
	  home = 'FH49'
	},
	[28] = { type = 'home', coords = vec3(-470.24,538.11,121.46),
	  vehiclePositions = {
		[1] = { vec3(-468.04,542.62,119.92), h = 355.06 },
	  },
	  home = 'FH52'
	},
	[29] = { type = 'home', coords = vec3(-397.25,512.34,120.19),
	  vehiclePositions = {
		[1] = { vec3(-398.63,518.94,119.68), h = 355.21 },
	  },
	  home = 'FH54'
	},
	[30] = { type = 'home', coords = vec3(-356.43,473.56,112.52),
	  vehiclePositions = {
		[1] = { vec3(-351.33,474.7,111.89), h = 299.59 },
	  },
	  home = 'FH55'
	},
	[31] = { type = 'home', coords = vec3(-357.14,517.38,120.15),
	  vehiclePositions = {
		[1] = { vec3(-362.62,514.72,118.67), h = 134.89 },
	  },
	  home = 'FH58'
	},
	[32] = { type = 'home', coords = vec3(-312.45,483.18,113.46),
	  vehiclePositions = {
		[1] = { vec3(-320.42,480.85,111.44), h = 118.55 },
	  },
	  home = 'FH59'
	},
	[33] = { type = 'home', coords = vec3(-1371.63,451.89,105.34),
	  vehiclePositions = {
		[1] = { vec3(-1376.73,453.26,104.04), h = 80.28 },
	  },
	  home = 'FH68'
	},
	[34] = { type = 'home', coords = vec3(-463.57,676.11,148.54),
	  vehiclePositions = {
		[1] = { vec3(-467.37,673.46,146.8), h = 148.4 },
	  },
	  home = 'FH81'
	},
	[35] = { type = 'home', coords = vec3(-956.88,804.188,177.56),
	  vehiclePositions = {
		[1] = { vec3(-958.62,800.59,176.76), h = 152.94 },
	  },
	  home = 'FH91'
	},
	[36] = { type = 'home', coords = vec3(-921.15,813.8,184.33),
	  vehiclePositions = {
		[1] = { vec3(-920.0,806.38,183.37), h = 189.06 },
	  },
	  home = 'FH92'
	},
	[37] = { type = 'home', coords = vec3(-1004.0,783.99,171.38),
	  vehiclePositions = {
		[1] = { vec3(-997.95,786.76,171.06), h = 293.5 },
	  },
	  home = 'FH93'
	},
	[38] = { type = 'home', coords = vec3(-810.25,803.55,202.18),
	  vehiclePositions = {
		[1] = { vec3(-811.6,809.51,201.24), h = 19.71 },
	  },
	  home = 'FH94'
	},
	[39] = { type = 'home', coords = vec3(-876.54,-57.11,38.05),
	  vehiclePositions = {
		[1] = { vec3(-869.45,-54.25,37.6), h = 281.38 },
	  },
	  home = 'LX01'
	},
	[40] = { type = 'home', coords = vec3(-890.55,-17.35,43.1),
	  vehiclePositions = {
		[1] = { vec3(-885.98,-16.18,42.15), h = 304.12 },
	  },
	  home = 'LX02'
	},
	[41] = { type = 'home', coords = vec3(-872.28,51.35,48.78),
	  vehiclePositions = {
		[1] = { vec3(-875.02,46.86,48.39), h = 195.46 },
	  },
	  home = 'LX03'
	},
	[42] = { type = 'home', coords = vec3(-969.08,107.74,55.66),
	  vehiclePositions = {
		[1] = { vec3(-960.77,109.36,55.49), h = 314.26 },
	  },
	  home = 'LX04'
	},
	[43] = { type = 'home', coords = vec3(-1885.63,629.92,129.99),
	  vehiclePositions = {
		[1] = { vec3(-1890.51,626.0,129.15), h = 136.16 },
	  },
	  home = 'LX05'
	},
	[44] = { type = 'home', coords = vec3(-997.43,142.37,60.66),
	  vehiclePositions = {
		[1] = { vec3(-992.02,144.19,59.81), h = 269.99 },
	  },
	  home = 'LX06'
	},
	[45] = { type = 'home', coords = vec3(-1045.16,224.98,63.76),
	  vehiclePositions = {
		[1] = { vec3(-1048.01,219.47,62.91), h = 184.73 },
	  },
	  home = 'LX07'
	},
	[46] = { type = 'home', coords = vec3(-923.9,212.7,67.46),
	  vehiclePositions = {
		[1] = { vec3(-933.57,210.69,66.61), h = 163.52 },
	  },
	  home = 'LX08'
	},
	[47] = { type = 'home', coords = vec3(-905.04,196.27,69.5),
	  vehiclePositions = {
		[1] = { vec3(-911.78,190.68,68.59), h = 179.92 },
	  },
	  home = 'LX09'
	},
	[48] = { type = 'home', coords = vec3(-915.48,114.68,55.31),
	  vehiclePositions = {
		[1] = { vec3(-920.41,112.49,54.47), h = 84.9 },
	  },
	  home = 'LX10'
	},
	[49] = { type = 'home', coords = vec3(-931.72,13.37,47.91),
	  vehiclePositions = {
		[1] = { vec3(-925.27,9.31,46.87), h = 214.83 },
	  },
	  home = 'LX11'
	},
	[50] = { type = 'home', coords = vec3(-835.07,119.47,55.46),
	  vehiclePositions = {
		[1] = { vec3(-839.12,112.3,54.43), h = 210.36 },
	  },
	  home = 'LX12'
	},
	[51] = { type = 'home', coords = vec3(-1058.75,299.58,66.0),
	  vehiclePositions = {
		[1] = { vec3(-1061.49,305.25,65.13), h = 353.81 },
	  },
	  home = 'LX13'
	},
	[52] = { type = 'home', coords = vec3(-827.87,267.95,86.2),
	  vehiclePositions = {
		[1] = { vec3(-824.72,273.44,85.68), h = 342.78 },
	  },
	  home = 'LX14'
	},
	[53] = { type = 'home', coords = vec3(-869.56,322.71,83.97),
	  vehiclePositions = {
		[1] = { vec3(-870.29,317.83,83.13), h = 186.23 },
	  },
	  home = 'LX15'
	},
	[54] = { type = 'home', coords = vec3(-1026.73,363.75,71.36),
	  vehiclePositions = {
		[1] = { vec3(-1011.08,360.01,70.05), h = 331.43 },
	  },
	  home = 'LX17'
	},
	[55] = { type = 'home', coords = vec3(-1555.85,426.75,109.62),
	  vehiclePositions = {
		[1] = { vec3(-1547.98,426.58,109.09), h = 272.82 },
	  },
	  home = 'LX18'
	},
	[56] = { type = 'home', coords = vec3(-1211.88,274.79,69.51),
	  vehiclePositions = {
		[1] = { vec3(-1204.83,267.12,68.69), h = 284.35 },
	  },
	  home = 'LX19'
	},
	[57] = { type = 'home', coords = vec3(-1101.71,354.46,68.48),
	  vehiclePositions = {
		[1] = { vec3(-1096.63,360.3,67.69), h = 357.45 },
	  },
	  home = 'LX20'
	},
	[58] = { type = 'home', coords = vec3(-1490.24,18.76,54.71),
	  vehiclePositions = {
		[1] = { vec3(-1490.16,23.07,53.88), h = 354.88 },
	  },
	  home = 'LX21'
	},
	[59] = { type = 'home', coords = vec3(-1457.65,-50.22,54.65),
	  vehiclePositions = {
		[1] = { vec3(-1455.68,-55.37,52.6), h = 240.6 },
	  },
	  home = 'LX22'
	},
	[60] = { type = 'home', coords = vec3(-1504.43,19.84,56.4),
	  vehiclePositions = {
		[1] = { vec3(-1503.75,26.86,55.15), h = 8.38 },
	  },
	  home = 'LX23'
	},
	[61] = { type = 'home', coords = vec3(-1581.46,-81.3,54.2),
	  vehiclePositions = {
		[1] = { vec3(-1577.19,-86.02,53.29), h = 270.66 },
	  },
	  home = 'LX24'
	},
	[62] = { type = 'home', coords = vec3(-1585.69,-55.63,56.48),
	  vehiclePositions = {
		[1] = { vec3(-1582.02,-61.06,55.64), h = 270.18 },
	  },
	  home = 'LX25'
	},
	[63] = { type = 'home', coords = vec3(-1558.52,17.86,58.83),
	  vehiclePositions = {
		[1] = { vec3(-1552.69,22.78,57.7), h = 347.5 },
	  },
	  home = 'LX26'
	},
	[64] = { type = 'home', coords = vec3(-1616.73,14.71,62.17),
	  vehiclePositions = {
		[1] = { vec3(-1613.07,20.02,61.32), h = 335.94 },
	  },
	  home = 'LX27'
	},
	[65] = { type = 'home', coords = vec3(-1892.99,120.59,81.64),
	  vehiclePositions = {
		[1] = { vec3(-1887.23,123.26,80.86), h = 338.84 },
	  },
	  home = 'LX28'
	},
	[66] = { type = 'home', coords = vec3(-1940.13,179.1,84.66),
	  vehiclePositions = {
		[1] = { vec3(-1932.93,182.84,83.68), h = 307.83 },
	  },
	  home = 'LX29'
	},
	[67] = { type = 'home', coords = vec3(-2000.65,296.59,91.76),
	  vehiclePositions = {
		[1] = { vec3(-1994.21,290.29,90.85), h = 221.21 },
	  },
	  home = 'LX32'
	},
	[68] = { type = 'home', coords = vec3(-2013.18,453.64,102.67),
	  vehiclePositions = {
		[1] = { vec3(-2006.95,454.86,101.79), h = 276.63 },
	  },
	  home = 'LX34'
	},
	[69] = { type = 'home', coords = vec3(-2016.62,485.7,107.18),
	  vehiclePositions = {
		[1] = { vec3(-2011.39,482.71,106.07), h = 255.38 },
	  },
	  home = 'LX35'
	},
	[70] = { type = 'home', coords = vec3(-1868.36,192.09,84.29),
	  vehiclePositions = {
		[1] = { vec3(-1874.17,194.45,83.77), h = 126.46 },
	  },
	  home = 'LX36'
	},
	[71] = { type = 'home', coords = vec3(-1899.62,241.7,86.26),
	  vehiclePositions = {
		[1] = { vec3(-1904.45,242.14,85.6), h = 27.89 },
	  },
	  home = 'LX37'
	},
	[72] = { type = 'home', coords = vec3(-1918.91,285.25,89.07),
	  vehiclePositions = {
		[1] = { vec3(-1925.28,283.01,88.23), h = 182.84 },
	  },
	  home = 'LX38'
	},
	[73] = { type = 'home', coords = vec3(-1935.69,366.09,93.82),
	  vehiclePositions = {
		[1] = { vec3(-1940.58,360.31,92.55), h = 160.68 },
	  },
	  home = 'LX39'
	},
	[74] = { type = 'home', coords = vec3(-1938.82,386.17,96.5),
	  vehiclePositions = {
		[1] = { vec3(-1943.95,385.19,95.6), h = 96.89 },
	  },
	  home = 'LX40'
	},
	[75] = { type = 'home', coords = vec3(-1937.4,462.55,102.42),
	  vehiclePositions = {
		[1] = { vec3(-1947.37,462.9,101.12), h = 99.05 },
	  },
	  home = 'LX41'
	},
	[76] = { type = 'home', coords = vec3(-1856.34,322.6,88.72),
	  vehiclePositions = {
		[1] = { vec3(-1857.45,328.42,87.8), h = 11.41 },
	  },
	  home = 'LX42'
	},
	[77] = { type = 'home', coords = vec3(-1789.94,345.73,88.55),
	  vehiclePositions = {
		[1] = { vec3(-1790.72,353.87,87.72), h = 64.22 },
	  },
	  home = 'LX43'
	},
	[78] = { type = 'home', coords = vec3(-1745.31,368.33,89.72),
	  vehiclePositions = {
		[1] = { vec3(-1750.77,365.56,88.85), h = 114.91 },
	  },
	  home = 'LX44'
	},
	[79] = { type = 'home', coords = vec3(-1665.21,385.25,89.49),
	  vehiclePositions = {
		[1] = { vec3(-1663.42,391.43,88.39), h = 9.57 },
	  },
	  home = 'LX45'
	},
	[80] = { type = 'home', coords = vec3(-1785.52,456.14,128.3),
	  vehiclePositions = {
		[1] = { vec3(-1794.11,459.4,127.46), h = 98.09 },
	  },
	  home = 'LX46'
	},
	[81] = { type = 'home', coords = vec3(-1991.66,605.61,117.9),
	  vehiclePositions = {
		[1] = { vec3(-1985.63,602.72,117.28), h = 238.48 },
	  },
	  home = 'LX47'
	},
	[82] = { type = 'home', coords = vec3(-1937.7,529.39,110.73),
	  vehiclePositions = {
		[1] = { vec3(-1944.07,521.99,108.31), h = 71.0 },
	  },
	  home = 'LX48'
	},
	[83] = { type = 'home', coords = vec3(-1977.58,624.88,122.53),
	  vehiclePositions = {
		[1] = { vec3(-1971.35,620.69,121.14), h = 246.1 },
	  },
	  home = 'LX50'
	},
	[84] = { type = 'home', coords = vec3(-165.4,919.61,235.65),
	  vehiclePositions = {
		[1] = { vec3(-162.36,926.68,234.8), h = 234.16 },
	  },
	  home = 'LX51'
	},
	[85] = { type = 'home', coords = vec3(-172.67,966.12,237.53),
	  vehiclePositions = {
		[1] = { vec3(-167.03,970.73,235.79), h = 316.56 },
	  },
	  home = 'LX52'
	},
	[86] = { type = 'home', coords = vec3(-124.76,1010.75,235.73),
	  vehiclePositions = {
		[1] = { vec3(-127.89,1001.16,234.88), h = 198.68 },
	  },
	  home = 'LX53'
	},
	[87] = { type = 'home', coords = vec3(-101.17,823.95,235.72),
	  vehiclePositions = {
		[1] = { vec3(-105.63,832.61,234.86), h = 10.25 },
	  },
	  home = 'LX54'
	},
	[88] = { type = 'home', coords = vec3(220.71,755.29,204.85),
	  vehiclePositions = {
		[1] = { vec3(215.84,759.38,203.83), h = 47.56 },
	  },
	  home = 'LX55'
	},
	[89] = { type = 'home', coords = vec3(100.21,563.99,182.94),
	  vehiclePositions = {
		[1] = { vec3(93.13,575.77,182.13), h = 86.85 },
	  },
	  home = 'LX58'
	},
	[90] = { type = 'home', coords = vec3(52.84,559.77,180.21),
	  vehiclePositions = {
		[1] = { vec3(53.19,563.71,179.54), h = 21.7 },
	  },
	  home = 'LX59'
	},
	[91] = { type = 'home', coords = vec3(-143.65,593.14,203.9),
	  vehiclePositions = {
		[1] = { vec3(-142.21,597.23,203.12), h = 358.34 },
	  },
	  home = 'LX60'
	},
	[92] = { type = 'home', coords = vec3(-196.6,621.58,197.91),
	  vehiclePositions = {
		[1] = { vec3(-199.24,615.31,196.21), h = 178.98 },
	  },
	  home = 'LX61'
	},
	[93] = { type = 'home', coords = vec3(-174.92,590.04,197.63),
	  vehiclePositions = {
		[1] = { vec3(-178.23,587.21,197.03), h = 359.63 },
	  },
	  home = 'LX62'
	},
	[94] = { type = 'home', coords = vec3(-224.87,588.93,190.02),
	  vehiclePositions = {
		[1] = { vec3(-221.77,593.25,189.61), h = 331.22 },
	  },
	  home = 'LX63'
	},
	[95] = { type = 'home', coords = vec3(-271.65,599.1,181.68),
	  vehiclePositions = {
		[1] = { vec3(-272.26,603.6,181.15), h = 346.6 },
	  },
	  home = 'LX64'
	},
	[96] = { type = 'home', coords = vec3(-241.91,614.9,187.77),
	  vehiclePositions = {
		[1] = { vec3(-244.12,610.79,186.09), h = 149.22 },
	  },
	  home = 'LX65'
	},
	[97] = { type = 'home', coords = vec3(1290.05,-585.69,71.75),
	  vehiclePositions = {
		[1] = { vec3(1295.49,-567.62,71.49), h = 344.65 },
	  },
	  home = 'LS01'
	},
	[98] = { type = 'home', coords = vec3(1311.03,-593.07,72.93),
	  vehiclePositions = {
		[1] = { vec3(1319.19,-575.18,73.25), h = 336.97 },
	  },
	  home = 'LS02'
	},
	[99] = { type = 'home', coords = vec3(1344.65,-609.86,74.36),
	  vehiclePositions = {
		[1] = { vec3(1348.97,-603.76,74.64), h = 334.73 },
	  },
	  home = 'LS03'
	},
	[100] = { type = 'home', coords = vec3(1359.91,-620.48,74.34),
	  vehiclePositions = {
		[1] = { vec3(1360.55,-601.83,74.62), h = 359.42 },
	  },
	  home = 'LS04'
	},
	[101] = { type = 'home', coords = vec3(1392.87,-607.72,74.35),
	  vehiclePositions = {
		[1] = { vec3(1378.33,-596.21,74.61), h = 52.88 },
	  },
	  home = 'LS05'
	},
	[102] = { type = 'home', coords = vec3(1404.84,-570.68,74.35),
	  vehiclePositions = {
		[1] = { vec3(1387.73,-577.37,74.62), h = 113.2 },
	  },
	  home = 'LS06'
	},
	[103] = { type = 'home', coords = vec3(1366.95,-544.46,74.34),
	  vehiclePositions = {
		[1] = { vec3(1363.05,-551.94,74.62), h = 157.25 },
	  },
	  home = 'LS07'
	},
	[104] = { type = 'home', coords = vec3(1360.66,-536.8,73.78),
	  vehiclePositions = {
		[1] = { vec3(1352.89,-553.3,74.31), h = 156.76 },
	  },
	  home = 'LS08'
	},
	[105] = { type = 'home', coords = vec3(1322.0,-524.9,72.13),
	  vehiclePositions = {
		[1] = { vec3(1318.24,-532.96,72.35), h = 160.86 },
	  },
	  home = 'LS09'
	},
	[106] = { type = 'home', coords = vec3(1314.79,-516.59,71.41),
	  vehiclePositions = {
		[1] = { vec3(1307.96,-533.58,71.56), h = 160.38 },
	  },
	  home = 'LS10'
	},
	[107] = { type = 'home', coords = vec3(1245.08,-518.7,69.0),
	  vehiclePositions = {
		[1] = { vec3(1247.17,-522.7,69.25), h = 257.36 },
	  },
	  home = 'LS11'
	},
	[108] = { type = 'home', coords = vec3(1251.25,-490.29,69.5),
	  vehiclePositions = {
		[1] = { vec3(1260.63,-494.22,69.59), h = 255.66 },
	  },
	  home = 'LS12'
	},
	[109] = { type = 'home', coords = vec3(1259.55,-477.81,70.19),
	  vehiclePositions = {
		[1] = { vec3(1280.06,-472.81,69.24), h = 170.02 },
	  },
	  home = 'LS13'
	},
	[110] = { type = 'home', coords = vec3(1268.56,-461.81,69.84),
	  vehiclePositions = {
		[1] = { vec3(1270.98,-463.9,69.87), h = 328.18 },
	  },
	  home = 'LS14'
	},
	[111] = { type = 'home', coords = vec3(1261.12,-426.7,69.81),
	  vehiclePositions = {
		[1] = { vec3(1261.45,-419.35,69.58), h = 297.04 },
	  },
	  home = 'LS15'
	},
	[112] = { type = 'home', coords = vec3(1234.75,-578.25,69.49),
	  vehiclePositions = {
		[1] = { vec3(1243.86,-579.36,69.64), h = 271.53 },
	  },
	  home = 'LS16'
	},
	[113] = { type = 'home', coords = vec3(1236.79,-589.55,69.79),
	  vehiclePositions = {
		[1] = { vec3(1242.92,-586.85,69.55), h = 269.57 },
	  },
	  home = 'LS17'
	},
	[114] = { type = 'home', coords = vec3(1250.47,-626.17,69.35),
	  vehiclePositions = {
		[1] = { vec3(1259.06,-624.91,69.58), h = 296.96 },
	  },
	  home = 'LS18'
	},
	[115] = { type = 'home', coords = vec3(1257.67,-660.38,67.93),
	  vehiclePositions = {
		[1] = { vec3(1271.84,-659.12,68.0), h = 293.69 },
	  },
	  home = 'LS19'
	},
	[116] = { type = 'home', coords = vec3(1267.25,-673.65,65.75),
	  vehiclePositions = {
		[1] = { vec3(1276.75,-673.42,66.25), h = 277.48 },
	  },
	  home = 'LS20'
	},
	[117] = { type = 'home', coords = vec3(1259.79,-711.08,64.72),
	  vehiclePositions = {
		[1] = { vec3(1263.72,-716.66,64.75), h = 239.07 },
	  },
	  home = 'LS21'
	},
	[118] = { type = 'home', coords = vec3(1225.19,-723.04,60.64),
	  vehiclePositions = {
		[1] = { vec3(1223.46,-730.21,60.4), h = 163.48 },
	  },
	  home = 'LS22'
	},
	[119] = { type = 'home', coords = vec3(1228.5,-703.47,60.68),
	  vehiclePositions = {
		[1] = { vec3(1217.85,-704.09,60.7), h = 97.24 },
	  },
	  home = 'LS23'
	},
	[120] = { type = 'home', coords = vec3(1220.91,-664.18,63.13),
	  vehiclePositions = {
		[1] = { vec3(1214.36,-665.12,62.85), h = 103.07 },
	  },
	  home = 'LS24'
	},
	[121] = { type = 'home', coords = vec3(1206.75,-614.0,66.12),
	  vehiclePositions = {
		[1] = { vec3(1199.98,-612.47,65.36), h = 94.4 },
	  },
	  home = 'LS25'
	},
	[122] = { type = 'home', coords = vec3(1192.48,-597.08,64.01),
	  vehiclePositions = {
		[1] = { vec3(1188.28,-595.06,64.23), h = 34.45 },
	  },
	  home = 'LS26'
	},
	[123] = { type = 'home', coords = vec3(1189.79,-573.78,64.32),
	  vehiclePositions = {
		[1] = { vec3(1185.82,-569.96,64.56), h = 25.68 },
	  },
	  home = 'LS27'
	},
	[124] = { type = 'home', coords = vec3(1191.61,-554.97,64.71),
	  vehiclePositions = {
		[1] = { vec3(1187.47,-550.38,64.83), h = 86.85 },
	  },
	  home = 'LS28'
	},
	[125] = { type = 'home', coords = vec3(1089.59,-495.42,65.07),
	  vehiclePositions = {
		[1] = { vec3(1084.78,-493.34,64.4), h = 79.01 },
	  },
	  home = 'LS29'
	},
	[126] = { type = 'home', coords = vec3(1101.7,-468.42,67.06),
	  vehiclePositions = {
		[1] = { vec3(1091.28,-470.87,65.47), h = 77.7 },
	  },
	  home = 'LS30'
	},
	[127] = { type = 'home', coords = vec3(1111.03,-417.0,67.16),
	  vehiclePositions = {
		[1] = { vec3(1111.15,-419.57,67.43), h = 83.31 },
	  },
	  home = 'LS31'
	},
	[128] = { type = 'home', coords = vec3(1112.77,-394.29,68.74),
	  vehiclePositions = {
		[1] = { vec3(1106.07,-399.24,68.2), h = 78.01 },
	  },
	  home = 'LS32'
	},
	[129] = { type = 'home', coords = vec3(1057.42,-384.09,67.86),
	  vehiclePositions = {
		[1] = { vec3(1056.9,-388.45,68.09), h = 221.13 },
	  },
	  home = 'LS33'
	},
	[130] = { type = 'home', coords = vec3(1021.13,-414.33,65.95),
	  vehiclePositions = {
		[1] = { vec3(1022.37,-419.52,66.05), h = 219.15 },
	  },
	  home = 'LS34'
	},
	[131] = { type = 'home', coords = vec3(1009.82,-418.88,64.96),
	  vehiclePositions = {
		[1] = { vec3(1015.92,-423.87,65.32), h = 217.1 },
	  },
	  home = 'LS35'
	},
	[132] = { type = 'home', coords = vec3(987.71,-438.07,63.75),
	  vehiclePositions = {
		[1] = { vec3(995.76,-435.43,64.23), h = 271.01 },
	  },
	  home = 'LS36'
	},
	[133] = { type = 'home', coords = vec3(971.53,-447.94,62.41),
	  vehiclePositions = {
		[1] = { vec3(975.54,-454.41,62.86), h = 213.74 },
	  },
	  home = 'LS37'
	},
	[134] = { type = 'home', coords = vec3(939.3,-463.22,61.26),
	  vehiclePositions = {
		[1] = { vec3(942.05,-469.79,61.53), h = 212.33 },
	  },
	  home = 'LS38'
	},
	[135] = { type = 'home', coords = vec3(928.77,-475.65,60.7),
	  vehiclePositions = {
		[1] = { vec3(933.31,-480.49,60.88), h = 203.27 },
	  },
	  home = 'LS39'
	},
	[136] = { type = 'home', coords = vec3(909.42,-489.73,59.02),
	  vehiclePositions = {
		[1] = { vec3(914.46,-490.17,59.29), h = 204.27 },
	  },
	  home = 'LS40'
	},
	[137] = { type = 'home', coords = vec3(873.98,-503.77,57.5),
	  vehiclePositions = {
		[1] = { vec3(874.77,-507.45,57.72), h = 226.29 },
	  },
	  home = 'LS41'
	},
	[138] = { type = 'home', coords = vec3(854.95,-516.17,57.33),
	  vehiclePositions = {
		[1] = { vec3(858.81,-522.39,57.59), h = 227.66 },
	  },
	  home = 'LS42'
	},
	[139] = { type = 'home', coords = vec3(848.57,-540.12,57.33),
	  vehiclePositions = {
		[1] = { vec3(853.51,-542.76,57.6), h = 266.06 },
	  },
	  home = 'LS43'
	},
	[140] = { type = 'home', coords = vec3(842.1,-567.41,57.71),
	  vehiclePositions = {
		[1] = { vec3(849.29,-567.47,57.99), h = 279.71 },
	  },
	  home = 'LS44'
	},
	[141] = { type = 'home', coords = vec3(868.47,-594.02,58.3),
	  vehiclePositions = {
		[1] = { vec3(872.86,-590.11,58.28), h = 317.23 },
	  },
	  home = 'LS45'
	},
	[142] = { type = 'home', coords = vec3(875.58,-602.34,58.45),
	  vehiclePositions = {
		[1] = { vec3(875.55,-598.36,58.45), h = 316.61 },
	  },
	  home = 'LS46'
	},
	[143] = { type = 'home', coords = vec3(912.15,-631.81,58.05),
	  vehiclePositions = {
		[1] = { vec3(917.67,-627.46,58.32), h = 319.36 },
	  },
	  home = 'LS47'
	},
	[144] = { type = 'home', coords = vec3(913.03,-645.12,57.87),
	  vehiclePositions = {
		[1] = { vec3(917.96,-639.77,58.14), h = 318.18 },
	  },
	  home = 'LS48'
	},
	[145] = { type = 'home', coords = vec3(946.14,-657.5,58.02),
	  vehiclePositions = {
		[1] = { vec3(951.67,-654.13,58.16), h = 309.34 },
	  },
	  home = 'LS49'
	},
	[146] = { type = 'home', coords = vec3(940.18,-672.19,58.02),
	  vehiclePositions = {
		[1] = { vec3(946.99,-669.22,58.29), h = 297.96 },
	  },
	  home = 'LS50'
	},
	[147] = { type = 'home', coords = vec3(969.7,-688.32,57.95),
	  vehiclePositions = {
		[1] = { vec3(973.59,-685.58,57.91), h = 309.99 },
	  },
	  home = 'LS51'
	},
	[148] = { type = 'home', coords = vec3(976.24,-713.97,57.87),
	  vehiclePositions = {
		[1] = { vec3(982.5,-709.42,57.88), h = 312.02 },
	  },
	  home = 'LS52'
	},
	[149] = { type = 'home', coords = vec3(1004.32,-734.1,57.46),
	  vehiclePositions = {
		[1] = { vec3(1008.02,-731.13,57.88), h = 311.05 },
	  },
	  home = 'LS53'
	},
	[150] = { type = 'home', coords = vec3(981.21,-614.8,58.84),
	  vehiclePositions = {
		[1] = { vec3(973.52,-619.61,59.1), h = 128.1 },
	  },
	  home = 'LS54'
	},
	[151] = { type = 'home', coords = vec3(959.79,-601.7,59.5),
	  vehiclePositions = {
		[1] = { vec3(955.45,-598.08,59.65), h = 27.96 },
	  },
	  home = 'LS55'
	},
	[152] = { type = 'home', coords = vec3(984.25,-579.14,59.28),
	  vehiclePositions = {
		[1] = { vec3(982.93,-572.6,59.53), h = 31.32 },
	  },
	  home = 'LS56'
	},
	[153] = { type = 'home', coords = vec3(1008.54,-565.15,60.2),
	  vehiclePositions = {
		[1] = { vec3(1012.51,-563.56,60.44), h = 263.72 },
	  },
	  home = 'LS57'
	},
	[154] = { type = 'home', coords = vec3(943.81,-243.89,68.63),
	  vehiclePositions = {
		[1] = { vec3(939.22,-250.12,68.69), h = 150.37 },
	  },
	  home = 'LS58'
	},
	[155] = { type = 'home', coords = vec3(1003.79,-588.12,59.14),
	  vehiclePositions = {
		[1] = { vec3(1009.07,-590.25,59.2), h = 258.95 },
	  },
	  home = 'LS59'
	},
	[156] = { type = 'home', coords = vec3(922.71,-564.06,57.97),
	  vehiclePositions = {
		[1] = { vec3(926.46,-567.39,58.24), h = 206.14 },
	  },
	  home = 'LS60'
	},
	[157] = { type = 'home', coords = vec3(956.87,-546.73,59.53),
	  vehiclePositions = {
		[1] = { vec3(957.91,-552.49,59.55), h = 211.12 },
	  },
	  home = 'LS61'
	},
	[158] = { type = 'home', coords = vec3(981.96,-530.0,60.12),
	  vehiclePositions = {
		[1] = { vec3(983.27,-536.41,60.19), h = 211.11 },
	  },
	  home = 'LS62'
	},
	[159] = { type = 'home', coords = vec3(1001.36,-510.47,60.7),
	  vehiclePositions = {
		[1] = { vec3(1003.89,-518.48,60.98), h = 205.24 },
	  },
	  home = 'LS63'
	},
	[160] = { type = 'home', coords = vec3(1045.95,-495.92,64.08),
	  vehiclePositions = {
		[1] = { vec3(1049.91,-488.79,64.19), h = 257.03 },
	  },
	  home = 'LS64'
	},
	[161] = { type = 'home', coords = vec3(1049.12,-479.89,64.1),
	  vehiclePositions = {
		[1] = { vec3(1056.64,-483.32,64.11), h = 257.85 },
	  },
	  home = 'LS65'
	},
	[162] = { type = 'home', coords = vec3(1055.36,-445.56,65.97),
	  vehiclePositions = {
		[1] = { vec3(1062.56,-445.67,66.16), h = 257.58 },
	  },
	  home = 'LS66'
	},
	[163] = { type = 'home', coords = vec3(1020.06,-464.4,63.9),
	  vehiclePositions = {
		[1] = { vec3(1019.04,-459.29,64.37), h = 38.05 },
	  },
	  home = 'LS67'
	},
	[164] = { type = 'home', coords = vec3(966.19,-505.37,61.74),
	  vehiclePositions = {
		[1] = { vec3(960.86,-500.52,61.65), h = 29.8 },
	  },
	  home = 'LS68'
	},
	[165] = { type = 'home', coords = vec3(950.42,-516.97,60.25),
	  vehiclePositions = {
		[1] = { vec3(948.5,-511.66,60.5), h = 29.22 },
	  },
	  home = 'LS69'
	},
	[166] = { type = 'home', coords = vec3(921.11,-527.47,59.58),
	  vehiclePositions = {
		[1] = { vec3(915.83,-522.63,59.03), h = 25.35 },
	  },
	  home = 'LS70'
	},
	[167] = { type = 'home', coords = vec3(893.88,-547.44,58.17),
	  vehiclePositions = {
		[1] = { vec3(888.36,-551.92,58.24), h = 115.0 },
	  },
	  home = 'LS71'
	},
	[168] = { type = 'home', coords = vec3(1103.28,-429.62,67.4),
	  vehiclePositions = {
		[1] = { vec3(1097.86,-428.24,66.68), h = 80.97 },
	  },
	  home = 'LS72'
	},
	[169] = { type = 'home', coords = vec3(102.82,-1959.78,20.84),
	  vehiclePositions = {
		[1] = { vec3(104.57,-1954.94,20.95), h = 355.58 },
	  },
	  home = 'KR01'
	},
	[170] = { type = 'home', coords = vec3(72.16,-1935.47,20.99),
	  vehiclePositions = {
		[1] = { vec3(81.72,-1932.41,21.02), h = 316.63 },
	  },
	  home = 'KR02'
	},
	[171] = { type = 'home', coords = vec3(14.13,-1886.93,23.24),
	  vehiclePositions = {
		[1] = { vec3(18.48,-1880.11,23.28), h = 320.5 },
	  },
	  home = 'KR03'
	},
	[172] = { type = 'home', coords = vec3(98.75,-1907.55,21.07),
	  vehiclePositions = {
		[1] = { vec3(89.81,-1917.18,20.98), h = 140.59 },
	  },
	  home = 'KR04'
	},
	[173] = { type = 'home', coords = vec3(101.95,-1883.62,24.02),
	  vehiclePositions = {
		[1] = { vec3(105.76,-1879.36,24.22), h = 319.71 },
	  },
	  home = 'KR05'
	},
	[174] = { type = 'home', coords = vec3(157.6,-1901.16,23.0),
	  vehiclePositions = {
		[1] = { vec3(162.82,-1899.28,23.26), h = 334.81 },
	  },
	  home = 'KR06'
	},
	[175] = { type = 'home', coords = vec3(163.9,-1954.67,19.32),
	  vehiclePositions = {
		[1] = { vec3(165.73,-1959.08,19.43), h = 227.78 },
	  },
	  home = 'KR07'
	},
	[176] = { type = 'home', coords = vec3(152.53,-1960.61,19.08),
	  vehiclePositions = {
		[1] = { vec3(152.79,-1965.88,19.04), h = 228.5 },
	  },
	  home = 'KR08'
	},
	[177] = { type = 'home', coords = vec3(58.69,-1878.41,22.39),
	  vehiclePositions = {
		[1] = { vec3(52.14,-1878.42,22.53), h = 136.83 },
	  },
	  home = 'KR09'
	},
	[178] = { type = 'home', coords = vec3(45.4,-1849.13,22.84),
	  vehiclePositions = {
		[1] = { vec3(41.44,-1853.34,23.11), h = 135.2 },
	  },
	  home = 'KR10'
	},
	[179] = { type = 'home', coords = vec3(-45.22,-1791.79,27.45),
	  vehiclePositions = {
		[1] = { vec3(-53.0,-1801.42,27.36), h = 50.04 },
	  },
	  home = 'KR11'
	},
	[180] = { type = 'home', coords = vec3(-54.09,-1781.86,27.88),
	  vehiclePositions = {
		[1] = { vec3(-57.67,-1785.85,28.12), h = 136.73 },
	  },
	  home = 'KR12'
	},
	[181] = { type = 'home', coords = vec3(140.35,-1866.11,24.32),
	  vehiclePositions = {
		[1] = { vec3(136.94,-1869.3,24.4), h = 155.02 },
	  },
	  home = 'KR13'
	},
	[182] = { type = 'home', coords = vec3(189.37,-1872.27,24.73),
	  vehiclePositions = {
		[1] = { vec3(186.58,-1877.13,24.85), h = 154.49 },
	  },
	  home = 'KR14'
	},
	[183] = { type = 'home', coords = vec3(248.21,-1732.71,29.38),
	  vehiclePositions = {
		[1] = { vec3(244.51,-1728.83,29.5), h = 49.0 },
	  },
	  home = 'KR15'
	},
	[184] = { type = 'home', coords = vec3(272.34,-1704.01,29.31),
	  vehiclePositions = {
		[1] = { vec3(268.09,-1700.73,29.57), h = 49.31 },
	  },
	  home = 'KR16'
	},
	[185] = { type = 'home', coords = vec3(291.46,-1783.92,28.26),
	  vehiclePositions = {
		[1] = { vec3(297.45,-1791.53,28.19), h = 228.58 },
	  },
	  home = 'KR17'
	},
	[186] = { type = 'home', coords = vec3(319.33,-1769.51,29.08),
	  vehiclePositions = {
		[1] = { vec3(321.52,-1773.31,28.93), h = 229.23 },
	  },
	  home = 'KR18'
	},
	[187] = { type = 'home', coords = vec3(142.93,-1832.74,27.07),
	  vehiclePositions = {
		[1] = { vec3(138.97,-1830.69,27.29), h = 49.32 },
	  },
	  home = 'KR19'
	},
	[188] = { type = 'home', coords = vec3(83.64,-1973.9,20.93),
	  vehiclePositions = {
		[1] = { vec3(87.72,-1968.8,21.03), h = 319.25 },
	  },
	  home = 'KR20'
	},
	[189] = { type = 'home', coords = vec3(80.39,-1949.55,20.8),
	  vehiclePositions = {
		[1] = { vec3(89.19,-1934.65,20.91), h = 217.76 },
	  },
	  home = 'KR21'
	},
	[190] = { type = 'home', coords = vec3(54.53,-1921.05,21.66),
	  vehiclePositions = {
		[1] = { vec3(62.29,-1910.55,21.78), h = 230.76 },
	  },
	  home = 'KR22'
	},
	[191] = { type = 'home', coords = vec3(37.3,-1926.34,21.8),
	  vehiclePositions = {
		[1] = { vec3(42.47,-1920.65,21.94), h = 320.78 },
	  },
	  home = 'KR23'
	},
	[192] = { type = 'home', coords = vec3(-10.49,-1883.78,24.15),
	  vehiclePositions = {
		[1] = { vec3(0.4,-1878.23,23.07), h = 319.84 },
	  },
	  home = 'KR24'
	},
	[193] = { type = 'home', coords = vec3(7.46,-1884.39,23.32),
	  vehiclePositions = {
		[1] = { vec3(15.62,-1871.47,23.56), h = 228.24 },
	  },
	  home = 'KR25'
	},
	[194] = { type = 'home', coords = vec3(-23.09,-1857.7,25.04),
	  vehiclePositions = {
		[1] = { vec3(-22.28,-1852.32,25.35), h = 318.16 },
	  },
	  home = 'KR26'
	},
	[195] = { type = 'home', coords = vec3(-33.91,-1855.64,26.01),
	  vehiclePositions = {
		[1] = { vec3(-36.14,-1861.29,26.03), h = 318.25 },
	  },
	  home = 'KR27'
	},
	[196] = { type = 'home', coords = vec3(123.49,-1927.1,21.01),
	  vehiclePositions = {
		[1] = { vec3(118.66,-1940.02,20.95), h = 86.06 },
	  },
	  home = 'KR28'
	},
	[197] = { type = 'home', coords = vec3(116.48,-1918.75,20.94),
	  vehiclePositions = {
		[1] = { vec3(109.49,-1924.84,21.03), h = 159.44 },
	  },
	  home = 'KR29'
	},
	[198] = { type = 'home', coords = vec3(112.4,-1884.8,23.59),
	  vehiclePositions = {
		[1] = { vec3(125.42,-1877.96,23.98), h = 245.04 },
	  },
	  home = 'KR30'
	},
	[199] = { type = 'home', coords = vec3(163.74,-1922.7,21.2),
	  vehiclePositions = {
		[1] = { vec3(166.25,-1929.66,21.29), h = 230.07 },
	  },
	  home = 'KR31'
	},
	[200] = { type = 'home', coords = vec3(142.93,-1970.81,18.86),
	  vehiclePositions = {
		[1] = { vec3(153.95,-1978.59,18.55), h = 139.63 },
	  },
	  home = 'KR32'
	},
	[201] = { type = 'home', coords = vec3(28.49,-1852.1,23.68),
	  vehiclePositions = {
		[1] = { vec3(20.42,-1863.32,23.63), h = 50.07 },
	  },
	  home = 'KR33'
	},
	[202] = { type = 'home', coords = vec3(11.84,-1843.19,24.53),
	  vehiclePositions = {
		[1] = { vec3(8.43,-1845.9,24.64), h = 139.44 },
	  },
	  home = 'KR34'
	},
	[203] = { type = 'home', coords = vec3(167.84,-1854.07,24.29),
	  vehiclePositions = {
		[1] = { vec3(165.62,-1861.16,24.41), h = 155.81 },
	  },
	  home = 'KR35'
	},
	[204] = { type = 'home', coords = vec3(206.99,-1892.89,24.43),
	  vehiclePositions = {
		[1] = { vec3(198.9,-1897.55,24.5), h = 142.92 },
	  },
	  home = 'KR36'
	},
	[205] = { type = 'home', coords = vec3(302.56,-1777.35,29.1),
	  vehiclePositions = {
		[1] = { vec3(312.42,-1785.76,28.42), h = 229.27 },
	  },
	  home = 'KR37'
	},
	[206] = { type = 'home', coords = vec3(289.96,-1789.91,27.7),
	  vehiclePositions = {
		[1] = { vec3(297.45,-1791.53,28.19), h = 228.58 },
	  },
	  home = 'KR38'
	},
	[207] = { type = 'home', coords = vec3(311.04,-1735.44,29.54),
	  vehiclePositions = {
		[1] = { vec3(315.43,-1739.08,29.73), h = 231.04 },
	  },
	  home = 'KR39'
	},
	[208] = { type = 'home', coords = vec3(269.11,-1728.64,29.65),
	  vehiclePositions = {
		[1] = { vec3(264.26,-1718.68,29.56), h = 49.25 },
	  },
	  home = 'KR40'
	},
	[209] = { type = 'home', coords = vec3(269.79,-1710.52,29.34),
	  vehiclePositions = {
		[1] = { vec3(257.55,-1701.71,29.31), h = 320.02 },
	  },
	  home = 'KR41'
	},
	[210] = { type = 'home', coords = vec3(248.94,-1936.94,24.35),
	  vehiclePositions = {
		[1] = { vec3(240.16,-1927.99,24.39), h = 319.7 },
	  },
	  home = 'LV01'
	},
	[211] = { type = 'home', coords = vec3(269.8,-1932.86,25.44),
	  vehiclePositions = {
		[1] = { vec3(263.07,-1921.28,25.41), h = 54.74 },
	  },
	  home = 'LV02'
	},
	[212] = { type = 'home', coords = vec3(270.61,-1914.8,25.81),
	  vehiclePositions = {
		[1] = { vec3(270.12,-1905.53,26.78), h = 51.02 },
	  },
	  home = 'LV03'
	},
	[213] = { type = 'home', coords = vec3(279.17,-1899.45,26.89),
	  vehiclePositions = {
		[1] = { vec3(269.73,-1892.82,26.83), h = 319.63 },
	  },
	  home = 'LV04'
	},
	[214] = { type = 'home', coords = vec3(318.07,-1856.29,27.11),
	  vehiclePositions = {
		[1] = { vec3(305.2,-1850.27,27.0), h = 320.21 },
	  },
	  home = 'LV05'
	},
	[215] = { type = 'home', coords = vec3(340.81,-1849.98,27.77),
	  vehiclePositions = {
		[1] = { vec3(335.81,-1835.98,27.61), h = 44.87 },
	  },
	  home = 'LV06'
	},
	[216] = { type = 'home', coords = vec3(344.21,-1828.31,27.95),
	  vehiclePositions = {
		[1] = { vec3(333.16,-1817.23,27.99), h = 320.18 },
	  },
	  home = 'LV07'
	},
	[217] = { type = 'home', coords = vec3(350.15,-1811.51,28.8),
	  vehiclePositions = {
		[1] = { vec3(342.37,-1806.23,28.48), h = 319.97 },
	  },
	  home = 'LV08'
	},
	[218] = { type = 'home', coords = vec3(404.54,-1753.91,29.37),
	  vehiclePositions = {
		[1] = { vec3(403.61,-1739.39,29.54), h = 46.7 },
	  },
	  home = 'LV09'
	},
	[219] = { type = 'home', coords = vec3(430.66,-1741.22,29.61),
	  vehiclePositions = {
		[1] = { vec3(431.33,-1735.54,28.65), h = 50.2 },
	  },
	  home = 'LV10'
	},
	[220] = { type = 'home', coords = vec3(434.96,-1715.43,29.33),
	  vehiclePositions = {
		[1] = { vec3(430.06,-1715.87,28.69), h = 49.34 },
	  },
	  home = 'LV11'
	},
	[221] = { type = 'home', coords = vec3(442.86,-1698.41,29.38),
	  vehiclePositions = {
		[1] = { vec3(442.78,-1693.12,28.66), h = 51.33 },
	  },
	  home = 'LV12'
	},
	[222] = { type = 'home', coords = vec3(498.38,-1698.89,29.41),
	  vehiclePositions = {
		[1] = { vec3(498.01,-1702.77,29.64), h = 236.28 },
	  },
	  home = 'LV13'
	},
	[223] = { type = 'home', coords = vec3(479.02,-1718.03,29.37),
	  vehiclePositions = {
		[1] = { vec3(490.02,-1721.93,29.62), h = 251.19 },
	  },
	  home = 'LV14'
	},
	[224] = { type = 'home', coords = vec3(464.62,-1740.78,29.11),
	  vehiclePositions = {
		[1] = { vec3(473.8,-1744.08,29.21), h = 250.4 },
	  },
	  home = 'LV15'
	},
	[225] = { type = 'home', coords = vec3(475.52,-1755.13,28.76),
	  vehiclePositions = {
		[1] = { vec3(488.5,-1757.75,28.71), h = 163.16 },
	  },
	  home = 'LV16'
	},
	[226] = { type = 'home', coords = vec3(475.02,-1772.84,28.7),
	  vehiclePositions = {
		[1] = { vec3(478.21,-1779.06,28.93), h = 270.19 },
	  },
	  home = 'LV17'
	},
	[227] = { type = 'home', coords = vec3(511.46,-1778.19,28.51),
	  vehiclePositions = {
		[1] = { vec3(499.79,-1777.14,28.64), h = 201.67 },
	  },
	  home = 'LV18'
	},
	[228] = { type = 'home', coords = vec3(504.82,-1799.04,28.49),
	  vehiclePositions = {
		[1] = { vec3(500.19,-1792.86,28.65), h = 161.09 },
	  },
	  home = 'LV19'
	},
	[229] = { type = 'home', coords = vec3(504.77,-1808.65,28.51),
	  vehiclePositions = {
		[1] = { vec3(491.87,-1805.02,28.65), h = 138.92 },
	  },
	  home = 'LV20'
	},
	[230] = { type = 'home', coords = vec3(487.7,-1826.73,28.53),
	  vehiclePositions = {
		[1] = { vec3(479.28,-1819.72,28.1), h = 139.7 },
	  },
	  home = 'LV21'
	},
	[231] = { type = 'home', coords = vec3(431.96,-1828.9,28.18),
	  vehiclePositions = {
		[1] = { vec3(437.06,-1837.91,28.21), h = 223.26 },
	  },
	  home = 'LV22'
	},
	[232] = { type = 'home', coords = vec3(428.72,-1839.65,28.08),
	  vehiclePositions = {
		[1] = { vec3(434.57,-1841.14,28.23), h = 222.18 },
	  },
	  home = 'LV23'
	},
	[233] = { type = 'home', coords = vec3(401.5,-1849.32,27.32),
	  vehiclePositions = {
		[1] = { vec3(394.61,-1849.77,26.41), h = 225.55 },
	  },
	  home = 'LV24'
	},
	[234] = { type = 'home', coords = vec3(396.69,-1872.65,26.25),
	  vehiclePositions = {
		[1] = { vec3(397.28,-1877.44,26.35), h = 222.91 },
	  },
	  home = 'LV25'
	},
	[235] = { type = 'home', coords = vec3(385.03,-1890.77,25.32),
	  vehiclePositions = {
		[1] = { vec3(384.63,-1896.36,25.21), h = 222.83 },
	  },
	  home = 'LV26'
	},
	[236] = { type = 'home', coords = vec3(360.06,-1894.9,24.99),
	  vehiclePositions = {
		[1] = { vec3(357.8,-1896.77,25.08), h = 227.0 },
	  },
	  home = 'LV27'
	},
	[237] = { type = 'home', coords = vec3(315.73,-1937.5,24.82),
	  vehiclePositions = {
		[1] = { vec3(315.5,-1942.05,24.92), h = 230.52 },
	  },
	  home = 'LV28'
	},
	[238] = { type = 'home', coords = vec3(310.66,-1965.91,23.74),
	  vehiclePositions = {
		[1] = { vec3(316.82,-1970.62,23.69), h = 138.57 },
	  },
	  home = 'LV29'
	},
	[239] = { type = 'home', coords = vec3(299.42,-1971.96,22.49),
	  vehiclePositions = {
		[1] = { vec3(306.82,-1982.39,22.39), h = 139.63 },
	  },
	  home = 'LV30'
	},
	[240] = { type = 'home', coords = vec3(282.89,-1980.29,21.4),
	  vehiclePositions = {
		[1] = { vec3(285.64,-1985.85,21.41), h = 229.16 },
	  },
	  home = 'LV31'
	},
	[241] = { type = 'home', coords = vec3(280.83,-1991.24,20.46),
	  vehiclePositions = {
		[1] = { vec3(286.37,-1992.54,20.81), h = 228.61 },
	  },
	  home = 'LV32'
	},
	[242] = { type = 'home', coords = vec3(256.42,-2026.71,18.86),
	  vehiclePositions = {
		[1] = { vec3(267.58,-2029.38,18.82), h = 142.23 },
	  },
	  home = 'LV33'
	},
	[243] = { type = 'home', coords = vec3(240.68,-2021.42,18.71),
	  vehiclePositions = {
		[1] = { vec3(246.74,-2035.94,18.53), h = 228.9 },
	  },
	  home = 'LV34'
	},
	[244] = { type = 'home', coords = vec3(241.9,-2042.78,18.02),
	  vehiclePositions = {
		[1] = { vec3(245.74,-2053.88,18.1), h = 134.18 },
	  },
	  home = 'LV35'
	},
  }
  
-----------------------------------------------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------


config.payTax = function(source,user_id,vehicle)
    if source and user_id then
     --   local value = vRP.getUData(parseInt(user_id),"vRP:multas")
		local value = vRP.query("SkS/selectMultas",{ user_id = user_id })
        local multas = json.decode(value[1].multas) or 0

        if parseInt(multas) == 0 then
            return true
        else
			TriggerClientEvent("Notify",source,"negado","Você tem multas pendentes, quite as dividas antes de retirar um veículo")
        end
    end
    return false
end

--------------------------------------------------------------------------------
-- função para checar se o player é dono da casa para poder acessar à garagem --
--------------------------------------------------------------------------------
config.hasHome = function(source,user_id,home)
	local hasHome = vRP.query("homes/get_homepermissions", {user_id = user_id, home = home})
	if hasHome and #hasHome > 0 then
		return true
	end
	TriggerClientEvent("Notify",source,"negado","Você não tem acesso à essa residência.",3000)
	return false
end
  















