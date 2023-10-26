vehs = {}

vehs.vehglobal = {
	-- Boats
	["dinghy"] = { ['name'] = "Dinghy", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1033245328, ['banned'] = true, ['class'] = "vip" },
	["jetmax"] = { ['name'] = "Jetmax", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 861409633, ['banned'] = true, ['class'] = "vip" },
	["marquis"] = { ['name'] = "Marquis", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1043459709, ['banned'] = true, ['class'] = "vip" },
	["seashark3"] = { ['name'] = "Seashark3", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -311022263, ['banned'] = true, ['class'] = "vip" },
	["speeder"] = { ['name'] = "Speeder", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 231083307, ['banned'] = true, ['class'] = "vip" },
	["speeder2"] = { ['name'] = "Speeder2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 437538602, ['banned'] = true, ['class'] = "vip" },
	["squalo"] = { ['name'] = "Squalo", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 400514754, ['banned'] = true, ['class'] = "vip" },
	["suntrap"] = { ['name'] = "Suntrap", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -282946103, ['banned'] = true },
	["toro"] = { ['name'] = "Toro", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1070967343, ['banned'] = true },
	["toro2"] = { ['name'] = "Toro2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 908897389, ['banned'] = true },
	["tropic"] = { ['name'] = "Tropic", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 290013743, ['banned'] = true },
	["tropic2"] = { ['name'] = "Tropic2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = GetHashKey("tropic2"), ['banned'] = true },

	-- Commercials
	["mule4"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = 1945374990, ['banned'] = false },
	["packer"] = { ['name'] = "Packer", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 569305213, ['banned'] = true },
	["phantom"] = { ['name'] = "Phantom", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -2137348917, ['banned'] = true },
	["pounder"] = { ['name'] = "Pounder", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 2112052861, ['banned'] = false },

	-- Compacts
	["blista"] = { ['name'] = "Blista", ['price'] = 32000, ['tipo'] = "carros",  ['hash'] = -344943009, ['banned'] = false },
	["brioso"] = { ['name'] = "Brioso", ['price'] = 35000, ['tipo'] = "carros",  ['hash'] = 1549126457, ['banned'] = false },
	["dilettante"] = { ['name'] = "Dilettante", ['price'] = 17000, ['tipo'] = "carros",  ['hash'] = -1130810103, ['banned'] = false },
	["issi2"] = { ['name'] = "Issi2", ['price'] = 90000, ['tipo'] = "carros",  ['hash'] = -1177863319, ['banned'] = false },
	["issi3"] = { ['name'] = "Issi3", ['price'] = 190000, ['tipo'] = "carros",  ['hash'] = 931280609, ['banned'] = false },
	["panto"] = { ['name'] = "Panto", ['price'] = 22000, ['tipo'] = "carros",  ['hash'] = -431692672, ['banned'] = false },
	["prairie"] = { ['name'] = "Prairie", ['price'] = 27000, ['tipo'] = "carros",  ['hash'] = -1450650718, ['banned'] = false},
	["rhapsody"] = { ['name'] = "Rhapsody", ['price'] = 20000, ['tipo'] = "carros",  ['hash'] = 841808271, ['banned'] = false},

	-- Coupes
	["cogcabrio"] = { ['name'] = "Cogcabrio", ['price'] = 130000, ['tipo'] = "carros",  ['hash'] = 330661258, ['banned'] = false },
	["exemplar"] = { ['name'] = "Exemplar", ['price'] = 80000, ['tipo'] = "carros",  ['hash'] = -5153954, ['banned'] = false },
	["f620"] = { ['name'] = "F620", ['price'] = 55000, ['tipo'] = "carros",  ['hash'] = -591610296, ['banned'] = false },
	["felon"] = { ['name'] = "Felon", ['price'] = 80000, ['tipo'] = "carros",  ['hash'] = -391594584, ['banned'] = false },
	["felon2"] = { ['name'] = "Felon2", ['price'] = 80000, ['tipo'] = "carros",  ['hash'] = -89291282, ['banned'] = false },
	["jackal"] = { ['name'] = "Jackal", ['price'] = 70000, ['tipo'] = "carros",  ['hash'] = -624529134, ['banned'] = false },
	["oracle"] = { ['name'] = "Oracle", ['price'] = 28000, ['tipo'] = "carros",  ['hash'] = 1348744438, ['banned'] = false },
	["oracle2"] = { ['name'] = "Oracle2", ['price'] = 80000, ['tipo'] = "carros",  ['hash'] = -511601230, ['banned'] = false },
	["sentinel"] = { ['name'] = "Sentinel", ['price'] = 50000, ['tipo'] = "carros",  ['hash'] = 1349725314, ['banned'] = false },
	["sentinel2"] = { ['name'] = "Sentinel2", ['price'] = 60000, ['tipo'] = "carros",  ['hash'] = 873639469, ['banned'] = false },
	["windsor"] = { ['name'] = "Windsor", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 1581459400, ['banned'] = false },
	["windsor2"] = { ['name'] = "Windsor2", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = -1930048799, ['banned'] = false },
	["zion"] = { ['name'] = "Zion", ['price'] = 50000, ['tipo'] = "carros",  ['hash'] = -1122289213, ['banned'] = false },
	["zion2"] = { ['name'] = "Zion2", ['price'] = 60000, ['tipo'] = "carros",  ['hash'] = -1193103848, ['banned'] = false },

	-- Cycles
	["bmx"] = { ['name'] = "Bmx", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1131912276, ['banned'] = true },
	["cruiser"] = { ['name'] = "Cruiser", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 448402357, ['banned'] = true },
	["fixter"] = { ['name'] = "Fixter", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -836512833, ['banned'] = true },
	["scorcher"] = { ['name'] = "Scorcher", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -186537451, ['banned'] = true },
	["tribike"] = { ['name'] = "Tribike", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1127861609, ['banned'] = true },
	["tribike2"] = { ['name'] = "Tribike2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1233807380, ['banned'] = true },
	["tribike3"] = { ['name'] = "Tribike3", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -400295096, ['banned'] = true },
	
	-- Emergency
--	["ambulance"] = { ['name'] = "Ambulância", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1171614426, ['banned'] = true },
	["pbus"] = { ['name'] = "Echo", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -2007026063, ['banned'] = true },

	-- Helicopters
	["buzzard2"] = { ['name'] = "Buzzard2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 745926877, ['banned'] = true },
	["cargobob2"] = { ['name'] = "Cargo Bob", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1621617168, ['banned'] = true },
	["frogger"] = { ['name'] = "Frogger", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 744705981, ['banned'] = true },
	["maverick"] = { ['name'] = "Maverick", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1660661558, ['banned'] = true },
	["supervolito"] = { ['name'] = "Supervolito", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 710198397, ['banned'] = true },
	["supervolito2"] = { ['name'] = "Supervolito2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1671539132, ['banned'] = true },
	["volatus"] = { ['name'] = "Volatus", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1845487887, ['banned'] = true },

	-- Industrial
	["flatbed"] = { ['name'] = "Reboque", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1353720154, ['banned'] = true },
	["flatbed3"] = { ['name'] = "Prancha", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 2037834373, ['banned'] = true },
	["cdaraptor"] = { ['name'] = "Raptor", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1857884084, ['banned'] = true },
	["guardian"] = { ['name'] = "Guardian", ['price'] = 540000, ['tipo'] = "carros",  ['hash'] = -2107990196, ['banned'] = false },
	["rubble"] = { ['name'] = "Caminhão", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1705304628, ['banned'] = true },
	["tiptruck"] = { ['name'] = "Tiptruck", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 48339065, ['banned'] = false },

	-- Military

	-- Motorcycles
	["akuma"] = { ['name'] = "Akuma", ['price'] = 510000000, ['tipo'] = "motos",  ['hash'] = 1672195559, ['banned'] = false },
	["avarus"] = { ['name'] = "Avarus", ['price'] = 440000, ['tipo'] = "motos",  ['hash'] = -2115793025, ['banned'] = false },
	["bagger"] = { ['name'] = "Bagger", ['price'] = 300000, ['tipo'] = "motos",  ['hash'] = -2140431165, ['banned'] = false },
	["bati"] = { ['name'] = "Bati", ['price'] = 380000, ['tipo'] = "motos",  ['hash'] = -114291515, ['banned'] = false },
	["bati2"] = { ['name'] = "Bati2", ['price'] = 300000, ['tipo'] = "motos",  ['hash'] = -891462355, ['banned'] = false },
	["bf400"] = { ['name'] = "Bf400", ['price'] = 320000, ['tipo'] = "motos",  ['hash'] = 86520421, ['banned'] = false },
	["carbonrs"] = { ['name'] = "Carbonrs", ['price'] = 370000, ['tipo'] = "motos",  ['hash'] = 11251904, ['banned'] = false },
	["chimera"] = { ['name'] = "Chimera", ['price'] = 345000, ['tipo'] = "motos",  ['hash'] = 6774487, ['banned'] = false },
	["cliffhanger"] = { ['name'] = "Cliffhanger", ['price'] = 310000000, ['tipo'] = "motos",  ['hash'] = 390201602, ['banned'] = false },
	["daemon"] = { ['name'] = "Daemon", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = 2006142190, ['banned'] = false },
	["daemon2"]  = { ['name'] = "Daemon2", ['price'] = 240000, ['tipo'] = "motos",  ['hash'] = -1404136503, ['banned'] = false },
	["defiler"] = { ['name'] = "Defiler", ['price'] = 460000, ['tipo'] = "motos",  ['hash'] = 822018448, ['banned'] = false },
	["diablous"] = { ['name'] = "Diablous", ['price'] = 430000, ['tipo'] = "motos",  ['hash'] = -239841468, ['banned'] = false },
	["diablous2"] = { ['name'] = "Diablous2", ['price'] = 460000, ['tipo'] = "motos",  ['hash'] = 1790834270, ['banned'] = false },
	["double"] = { ['name'] = "Double", ['price'] = 370000, ['tipo'] = "motos",  ['hash'] = -1670998136, ['banned'] = false },
	["enduro"] = { ['name'] = "Enduro", ['price'] = 28000, ['tipo'] = "motos",  ['hash'] = 1753414259, ['banned'] = false },
	["esskey"] = { ['name'] = "Esskey", ['price'] = 320000, ['tipo'] = "motos",  ['hash'] = 2035069708, ['banned'] = false },
	["faggio"] = { ['name'] = "Faggio", ['price'] = 12000, ['tipo'] = "motos",  ['hash'] = -1842748181, ['banned'] = false },
	["faggio2"] = { ['name'] = "Faggio2", ['price'] = 5000, ['tipo'] = "motos",  ['hash'] = 55628203, ['banned'] = false },
	["faggio3"] = { ['name'] = "Faggio3", ['price'] = 5000, ['tipo'] = "motos",  ['hash'] = -1289178744, ['banned'] = false },
	["fcr"] = { ['name'] = "Fcr", ['price'] = 390000, ['tipo'] = "motos",  ['hash'] = 627535535, ['banned'] = false },
	["fcr2"] = { ['name'] = "Fcr2", ['price'] = 390000, ['tipo'] = "motos",  ['hash'] = -757735410, ['banned'] = false },
	["gargoyle"] = { ['name'] = "Gargoyle", ['price'] = 345000, ['tipo'] = "motos",  ['hash'] = 741090084, ['banned'] = false },
	["hakuchou"] = { ['name'] = "Hakuchou", ['price'] = 380000, ['tipo'] = "motos",  ['hash'] = 1265391242, ['banned'] = false },
	["hakuchou2"] = { ['name'] = "Hakuchou2", ['price'] = 550000, ['tipo'] = "motos",  ['hash'] = -255678177, ['banned'] = false },
	["hexer"] = { ['name'] = "Hexer", ['price'] = 250000, ['tipo'] = "motos",  ['hash'] = 301427732, ['banned'] = false },
	["innovation"] = { ['name'] = "Innovation", ['price'] = 250000, ['tipo'] = "motos",  ['hash'] = -159126838, ['banned'] = false },
	["lectro"] = { ['name'] = "Lectro", ['price'] = 380000, ['tipo'] = "motos",  ['hash'] = 640818791, ['banned'] = false },
	["manchez"] = { ['name'] = "Manchez", ['price'] = 355000, ['tipo'] = "motos",  ['hash'] = -1523428744, ['banned'] = false },
	["nemesis"] = { ['name'] = "Nemesis", ['price'] = 345000, ['tipo'] = "motos",  ['hash'] = -634879114, ['banned'] = false },
	["nightblade"] = { ['name'] = "Nightblade", ['price'] = 415000, ['tipo'] = "motos",  ['hash'] = -1606187161, ['banned'] = false },
	["pcj"] = { ['name'] = "Pcj", ['price'] = 32000, ['tipo'] = "motos",  ['hash'] = -909201658, ['banned'] = false },
	["ruffian"] = { ['name'] = "Ruffian", ['price'] = 345000, ['tipo'] = "motos",  ['hash'] = -893578776, ['banned'] = false },
	["sanchez"] = { ['name'] = "Sanchez", ['price'] = 195000, ['tipo'] = "motos",  ['hash'] = 788045382, ['banned'] = false },
	["sanchez2"] = { ['name'] = "Sanchez2", ['price'] = 185000, ['tipo'] = "motos",  ['hash'] = -1453280962, ['banned'] = false },
	["sanctus"] = { ['name'] = "Sanctus", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = 1491277511, ['banned'] = false },
	["sovereign"] = { ['name'] = "Sovereign", ['price'] = 285000, ['tipo'] = "motos",  ['hash'] = 743478836, ['banned'] = false },
	["thrust"] = { ['name'] = "Thrust", ['price'] = 375000, ['tipo'] = "motos",  ['hash'] = 1836027715, ['banned'] = false },
	["vader"] = { ['name'] = "Vader", ['price'] = 345000, ['tipo'] = "motos",  ['hash'] = -140902153, ['banned'] = false },
	["vindicator"] = { ['name'] = "Vindicator", ['price'] = 340000, ['tipo'] = "motos",  ['hash'] = -1353081087, ['banned'] = false },
	["vortex"] = { ['name'] = "Vortex", ['price'] = 395000, ['tipo'] = "motos",  ['hash'] = -609625092, ['banned'] = false },
	["wolfsbane"] = { ['name'] = "Wolfsbane", ['price'] = 290000, ['tipo'] = "motos",  ['hash'] = -618617997, ['banned'] = false },
	["zombiea"] = { ['name'] = "Zombiea", ['price'] = 290000, ['tipo'] = "motos",  ['hash'] = -1009268949, ['banned'] = false },
	["zombieb"] = { ['name'] = "Zombieb", ['price'] = 300000, ['tipo'] = "motos",  ['hash'] = -570033273, ['banned'] = false },
	["shotaro"] = { ['name'] = "Shotaro", ['price'] = 1000000, ['tipo'] = "motos",  ['hash'] = -405626514, ['banned'] = false },
	["ratbike"] = { ['name'] = "Ratbike", ['price'] = 230000, ['tipo'] = "motos",  ['hash'] = 1873600305, ['banned'] = false },

	-- Muscle
	["blade"] = { ['name'] = "Blade", ['price'] = 110000000, ['tipo'] = "carros",  ['hash'] = -1205801634, ['banned'] = false },
	["buccaneer"] = { ['name'] = "Buccaneer", ['price'] = 130000, ['tipo'] = "carros",  ['hash'] = -682211828, ['banned'] = false },
	["buccaneer2"] = { ['name'] = "Buccaneer2", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = -1013450936, ['banned'] = false },
	["chino"] = { ['name'] = "Chino", ['price'] = 130000, ['tipo'] = "carros",  ['hash'] = 349605904, ['banned'] = false },
	["chino2"] = { ['name'] = "Chino2", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = -1361687965, ['banned'] = false },
	["clique"] = { ['name'] = "Clique", ['price'] = 360000, ['tipo'] = "carros",  ['hash'] = -1566607184, ['banned'] = false },
	["coquette3"] = { ['name'] = "Coquette3", ['price'] = 195000, ['tipo'] = "carros",  ['hash'] = 784565758, ['banned'] = false },
	["deviant"] = { ['name'] = "Deviant", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = 1279262537, ['banned'] = false },
	["dominator"] = { ['name'] = "Dominator", ['price'] = 230000, ['tipo'] = "carros",  ['hash'] = 80636076, ['banned'] = false },
	["dominator2"] = { ['name'] = "Dominator2", ['price'] = 230000, ['tipo'] = "carros",  ['hash'] = -915704871, ['banned'] = false },
	["dominator3"] = { ['name'] = "Dominator3", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = -986944621, ['banned'] = false },
	["dukes"] = { ['name'] = "Dukes", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 784565758, ['banned'] = false },
	["faction"] = { ['name'] = "Faction", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = -2119578145, ['banned'] = false },
	["faction2"] = { ['name'] = "Faction2", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = -1790546981, ['banned'] = false },
	["faction3"] = { ['name'] = "Faction3", ['price'] = 350000, ['tipo'] = "carros",  ['hash'] = -2039755226, ['banned'] = false },
	["ellie"] = { ['name'] = "Ellie", ['price'] = 320000, ['tipo'] = "carros",  ['hash'] = -1267543371, ['banned'] = false },
	["gauntlet"] = { ['name'] = "Gauntlet", ['price'] = 165000, ['tipo'] = "carros",  ['hash'] = -1800170043, ['banned'] = false },
	["gauntlet2"] = { ['name'] = "Gauntlet2", ['price'] = 165000, ['tipo'] = "carros",  ['hash'] = 349315417, ['banned'] = false },
	["hermes"] = { ['name'] = "Hermes", ['price'] = 280000, ['tipo'] = "carros",  ['hash'] = 15219735, ['banned'] = false },
	["hotknife"] = { ['name'] = "Hotknife", ['price'] = 180000, ['tipo'] = "carros",  ['hash'] = 37348240, ['banned'] = false },
	["impaler"] = { ['name'] = "Impaler", ['price'] = 320000, ['tipo'] = "carros",  ['hash'] = -2096690334, ['banned'] = false },
	["lurcher"] = { ['name'] = "Lurcher", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 2068293287, ['banned'] = false },
	["moonbeam"] = { ['name'] = "Moonbeam", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = 525509695, ['banned'] = false },
	["moonbeam2"] = { ['name'] = "Moonbeam2", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = 1896491931, ['banned'] = false },
	["nightshade"] = { ['name'] = "Nightshade", ['price'] = 270000, ['tipo'] = "carros",  ['hash'] = -1943285540, ['banned'] = false },
	["phoenix"] = { ['name'] = "Phoenix", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -2095439403, ['banned'] = false },
	["picador"] = { ['name'] = "Picador", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 1507916787, ['banned'] = false },
	["ratloader"] = { ['name'] = "Caminhão", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -667151410, ['banned'] = false },
	["ratloader2"] = { ['name'] = "Ratloader2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -589178377, ['banned'] = false },
	["ruiner"] = { ['name'] = "Ruiner", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = -227741703, ['banned'] = false },
	["sabregt"] = { ['name'] = "Sabregt", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = -1685021548, ['banned'] = false },
	["sabregt2"] = { ['name'] = "Sabregt2", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 223258115, ['banned'] = false },
	["slamvan"] = { ['name'] = "Slamvan", ['price'] = 180000, ['tipo'] = "carros",  ['hash'] = 729783779, ['banned'] = false },
	["slamvan2"] = { ['name'] = "Slamvan2", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = 833469436, ['banned'] = false },
	["slamvan3"] = { ['name'] = "Slamvan3", ['price'] = 230000, ['tipo'] = "carros",  ['hash'] = 1119641113, ['banned'] = false },
	["stalion"] = { ['name'] = "Stalion", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 1923400478, ['banned'] = false },
	["stalion2"] = { ['name'] = "Stalion2", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = -401643538, ['banned'] = false },
	["tampa"] = { ['name'] = "Tampa", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = 972671128, ['banned'] = false },
	["tulip"] = { ['name'] = "Tulip", ['price'] = 320000, ['tipo'] = "carros",  ['hash'] = 1456744817, ['banned'] = false },
	["vamos"] = { ['name'] = "Vamos", ['price'] = 320000, ['tipo'] = "carros",  ['hash'] = -49115651, ['banned'] = false },
	["vigero"] = { ['name'] = "Vigero", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = -825837129, ['banned'] = false },
	["virgo"] = { ['name'] = "Virgo", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = -498054846, ['banned'] = false },
	["virgo2"] = { ['name'] = "Virgo2", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -899509638, ['banned'] = fals },
	["virgo3"] = { ['name'] = "Virgo3", ['price'] = 180000, ['tipo'] = "carros",  ['hash'] = 16646064, ['banned'] = false },
	["voodoo"] = { ['name'] = "Voodoo", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = 2006667053, ['banned'] = false },
	["voodoo2"] = { ['name'] = "Voodoo2", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = 523724515, ['banned'] = false },
	["yosemite"] = { ['name'] = "Yosemite", ['price'] = 350000, ['tipo'] = "carros",  ['hash'] = 1871995513, ['banned'] = false },
	
	-- Off-Road
	["bfinjection"] = { ['name'] = "Bfinjection", ['price'] = 80000, ['tipo'] = "carros",  ['hash'] = 1126868326, ['banned'] = false },
	["bifta"] = { ['name'] = "Bifta", ['price'] = 190000, ['tipo'] = "carros",  ['hash'] = -349601129, ['banned'] = false },
	["blazer"] = { ['name'] = "Blazer", ['price'] = 230000, ['tipo'] = "motos",  ['hash'] = -2128233223, ['banned'] = true },
	["blazer4"] = { ['name'] = "Blazer4", ['price'] = 370000, ['tipo'] = "motos",  ['hash'] = -440768424, ['banned'] = true },
	["bodhi2"] = { ['name'] = "Bodhi2", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = -1435919434, ['banned'] = false },
	["brawler"] = { ['name'] = "Brawler", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -1479664699, ['banned'] = false },
	["dloader"] = { ['name'] = "Dloader", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 1770332643, ['banned'] = false },
	["dubsta3"] = { ['name'] = "Dubsta3", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = -1237253773, ['banned'] = false },
	["freecrawler"] = { ['name'] = "Freecrawler", ['price'] = 350000, ['tipo'] = "carros",  ['hash'] = -54332285, ['banned'] = false },
	["kamacho"] = { ['name'] = "Kamacho", ['price'] = 460000, ['tipo'] = "carros",  ['hash'] = -121446169, ['banned'] = false },
	["mesa3"] = { ['name'] = "Mesa3", ['price'] = 200000, ['tipo'] = "carros",  ['hash'] = -2064372143, ['banned'] = false },
	["rancherxl"] = { ['name'] = "Rancherxl", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = 1645267888, ['banned'] = false },
	["rebel"] = { ['name'] = "Rebel", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1207771834, ['banned'] = false },
	["rebel2"] = { ['name'] = "Rebel2", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -2045594037, ['banned'] = false },
	["riata"] = { ['name'] = "Riata", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -1532697517, ['banned'] = false },
	["sandking"] = { ['name'] = "Sandking", ['price'] = 400000, ['tipo'] = "carros",  ['hash'] = -1189015600, ['banned'] = false },
	["sandking2"] = { ['name'] = "Sandking2", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = 989381445, ['banned'] = false },
	["trophytruck"] = { ['name'] = "Trophytruck", ['price'] = 400000, ['tipo'] = "carros",  ['hash'] = 101905590, ['banned'] = false },
	["trophytruck2"] = { ['name'] = "Trophytruck2", ['price'] = 400000, ['tipo'] = "carros",  ['hash'] = -663299102, ['banned'] = false },

	-- Open Wheel

	-- Planes
	["cuban800"] = { ['name'] = "Cuban800", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -644710429, ['banned'] = true },
	["mammatus"] = { ['name'] = "Mammatus", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1746576111, ['banned'] = true },
	["vestra"] = { ['name'] = "Vestra", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1341619767, ['banned'] = true },
	["velum2"] = { ['name'] = "Velum2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1077420264, ['banned'] = true },
	
	-- SUVs
	["baller"] = { ['name'] = "Baller", ['price'] = 160000, ['tipo'] = "carros",  ['hash'] = -808831384, ['banned'] = false },
--	["baller2"] = { ['name'] = "Baller2", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = 142944341, ['banned'] = false },
	["baller3"] = { ['name'] = "Baller3", ['price'] = 185000, ['tipo'] = "carros",  ['hash'] = 1878062887, ['banned'] = false },
--	["baller4"] = { ['name'] = "Baller4", ['price'] = 195000, ['tipo'] = "carros",  ['hash'] = 634118882, ['banned'] = false },
--	["baller5"] = { ['name'] = "Baller5", ['price'] = 280000, ['tipo'] = "carros",  ['hash'] = 470404958, ['banned'] = false },
--	["baller6"] = { ['name'] = "Baller6", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = 666166960, ['banned'] = false },
	["bjxl"] = { ['name'] = "Bjxl", ['price'] = 110000000, ['tipo'] = "carros",  ['hash'] = 850565707, ['banned'] = false },
	["cavalcade"] = { ['name'] = "Cavalcade", ['price'] = 120000, ['tipo'] = "carros",  ['hash'] = 2006918058, ['banned'] = false },
	["cavalcade2"] = { ['name'] = "Cavalcade2", ['price'] = 140000, ['tipo'] = "carros",  ['hash'] = -789894171, ['banned'] = false },
	["contender"] = { ['name'] = "Contender", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = 683047626, ['banned'] = false },
	["dubsta"] = { ['name'] = "Dubsta", ['price'] = 210000000, ['tipo'] = "carros",  ['hash'] = 1177543287, ['banned'] = false },
	["dubsta2"] = { ['name'] = "Dubsta2", ['price'] = 240000, ['tipo'] = "carros",  ['hash'] = -394074634, ['banned'] = false },
	["fq2"] = { ['name'] = "Fq2", ['price'] = 110000000, ['tipo'] = "carros",  ['hash'] = -1137532101, ['banned'] = false },
	["granger"] = { ['name'] = "Granger", ['price'] = 345000, ['tipo'] = "carros",  ['hash'] = -1775728740, ['banned'] = false },
	["gresley"] = { ['name'] = "Gresley", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = -1543762099, ['banned'] = false },
	["habanero"] = { ['name'] = "Habanero", ['price'] = 110000000, ['tipo'] = "carros",  ['hash'] = 884422927, ['banned'] = false },
	["huntley"] = { ['name'] = "Huntley", ['price'] = 110000000, ['tipo'] = "carros",  ['hash'] = 486987393, ['banned'] = false },
	["landstalker"] = { ['name'] = "Landstalker", ['price'] = 130000, ['tipo'] = "carros",  ['hash'] = 1269098716, ['banned'] = false  },
	["mesa"] = { ['name'] = "Mesa", ['price'] = 100000000, ['tipo'] = "carros",  ['hash'] = 914654722, ['banned'] = false },
	["patriot"] = { ['name'] = "Patriot", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -808457413, ['banned'] = false },
	["patriot2"] = { ['name'] = "Patriot2", ['price'] = 550000, ['tipo'] = "carros",  ['hash'] = -420911112, ['banned'] = false },
	["radi"] = { ['name'] = "Radi", ['price'] = 110000000, ['tipo'] = "carros",  ['hash'] = -1651067813, ['banned'] = false },
	["rocoto"] = { ['name'] = "Rocoto", ['price'] = 120000, ['tipo'] = "carros",  ['hash'] = 2136773105, ['banned'] = false },
	["seminole"] = { ['name'] = "Seminole", ['price'] = 49000, ['tipo'] = "carros",  ['hash'] = 1221512915, ['banned'] = false },
	["serrano"] = { ['name'] = "Serrano", ['price'] = 160000, ['tipo'] = "carros",  ['hash'] = 1337041428, ['banned'] = false },
	["toros"] = { ['name'] = "Toros", ['price'] = 520000, ['tipo'] = "carros",  ['hash'] = -1168952148, ['banned'] = false },
	["xls"] = { ['name'] = "Xls", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 1203490606, ['banned'] = false },
	["xls2"] = { ['name'] = "Xls2", ['price'] = 350000, ['tipo'] = "carros",  ['hash'] = -432008408, ['banned'] = false },
	
	-- Sedans
	["asea"] = { ['name'] = "Asea", ['price'] = 42000, ['tipo'] = "carros",  ['hash'] = -1809822327, ['banned'] = false },
	["asterope"] = { ['name'] = "Asterope", ['price'] = 59000, ['tipo'] = "carros",  ['hash'] = -1903012613, ['banned'] = false },	
	["cog55"] = { ['name'] = "Cog55", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = 906642318, ['banned'] = false },
	["cog552"] = { ['name'] = "Cog552", ['price'] = 400000, ['tipo'] = "carros",  ['hash'] = 704435172, ['banned'] = false },
	["cognoscenti"] = { ['name'] = "Cognoscenti", ['price'] = 280000, ['tipo'] = "carros",  ['hash'] = -2030171296, ['banned'] = false },
	["cognoscenti2"] = { ['name'] = "Cognoscenti2", ['price'] = 400000, ['tipo'] = "carros",  ['hash'] = -604842630, ['banned'] = false },
	["emperor"] = { ['name'] = "Emperor", ['price'] = 7000, ['tipo'] = "carros",  ['hash'] = -685276541, ['banned'] = false },
	["emperor2"] = { ['name'] = "Emperor 2", ['price'] = 50000, ['tipo'] = "carros",  ['hash'] = -1883002148, ['banned'] = false },
	["fugitive"] = { ['name'] = "Fugitive", ['price'] = 50000, ['tipo'] = "carros",  ['hash'] = 1909141499, ['banned'] = false },
	["glendale"] = { ['name'] = "Glendale", ['price'] = 70000, ['tipo'] = "carros",  ['hash'] = 75131841, ['banned'] = false },
	["ingot"] = { ['name'] = "Ingot", ['price'] = 160000, ['tipo'] = "carros",  ['hash'] = -1289722222, ['banned'] = false },
	["intruder"] = { ['name'] = "Intruder", ['price'] = 21000000, ['tipo'] = "carros",  ['hash'] = 886934177, ['banned'] = false },
	["premier"] = { ['name'] = "Premier", ['price'] = 37000, ['tipo'] = "carros",  ['hash'] = -1883869285, ['banned'] = false },
	["primo"] = { ['name'] = "Primo", ['price'] = 9500, ['tipo'] = "carros",  ['hash'] = -1150599089, ['banned'] = false },
	["primo2"] = { ['name'] = "Primo2", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = -2040426790, ['banned'] = false },
	["stafford"] = { ['name'] = "Stafford", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = 321186144, ['banned'] = false },
	["stanier"] = { ['name'] = "Stanier", ['price'] = 28000, ['tipo'] = "carros",  ['hash'] = -1477580979, ['banned'] = false },
	["stratum"] = { ['name'] = "Stratum", ['price'] = 90000, ['tipo'] = "carros",  ['hash'] = 1723137093, ['banned'] = false },
	["stretch"] = { ['name'] = "Stretch", ['price'] = 520000, ['tipo'] = "carros",  ['hash'] = -1961627517, ['banned'] = false },
	["superd"] = { ['name'] = "Superd", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = 1123216662, ['banned'] = false },
	["surge"] = { ['name'] = "Surge", ['price'] = 110000000, ['tipo'] = "carros",  ['hash'] = -1894894188, ['banned'] = false },
	["tailgater"] = { ['name'] = "Tailgater", ['price'] = 120000, ['tipo'] = "carros",  ['hash'] = -1008861746, ['banned'] = false },
	["warrener"] = { ['name'] = "Warrener", ['price'] = 90000, ['tipo'] = "carros",  ['hash'] = 1373123368, ['banned'] = false },
	["washington"] = { ['name'] = "Washington", ['price'] = 130000, ['rentalPrice'] = 2000, ['tipo'] = "rental",  ['hash'] = 1777363799, ['banned'] = false },

	-- Service
	["bus"] = { ['name'] = "Ônibus", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -713569950, ['banned'] = true },
	["coach"] = { ['name'] = "Coach", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -2072933068, ['banned'] = true },
	["rallytruck"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = -2103821244, ['banned'] = false },
	["taxi"] = { ['name'] = "Taxi", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -956048545, ['banned'] = true },
	["trash2"] = { ['name'] = "Caminhão", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1255698084, ['banned'] = false },

	-- Sports
	["alpha"] = { ['name'] = "Alpha", ['price'] = 230000, ['tipo'] = "carros",  ['hash'] = 767087018, ['banned'] = false },
	["banshee"] = { ['name'] = "Banshee", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = -1041692462, ['banned'] = false },
	["bestiagts"] = { ['name'] = "Bestiagts", ['price'] = 290000, ['tipo'] = "carros",  ['hash'] = 1274868363, ['banned'] = false },
	["blista2"] = { ['name'] = "Blista2", ['price'] = 55000, ['tipo'] = "carros",  ['hash'] = 1039032026, ['banned'] = false },
	["blista3"] = { ['name'] = "Blista3", ['price'] = 80000, ['tipo'] = "carros",  ['hash'] = -591651781, ['banned'] = false },
	["buffalo"] = { ['name'] = "Buffalo", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = -304802106, ['banned'] = false },
	["buffalo2"] = { ['name'] = "Buffalo2", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = 736902334, ['banned'] = false },
	["buffalo3"] = { ['name'] = "Buffalo3", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = 237764926, ['banned'] = false },
	["carbonizzare"] = { ['name'] = "Carbonizzare", ['price'] = 290000, ['tipo'] = "carros",  ['hash'] = 2072687711, ['banned'] = false },
	["comet2"] = { ['name'] = "Comet2", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -1045541610, ['banned'] = false },
	["comet3"] = { ['name'] = "Comet3", ['price'] = 290000, ['tipo'] = "carros",  ['hash'] = -2022483795, ['banned'] = false },
	["comet5"] = { ['name'] = "Comet5", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = 661493923, ['banned'] = false },
	["coquette"] = { ['name'] = "Coquette", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = 108773431, ['banned'] = false },
	["deveste"] = { ['name'] = "Deveste", ['price'] = 920000, ['tipo'] = "carros",  ['hash'] = 1591739866, ['banned'] = false },
	["elegy"] = { ['name'] = "Elegy", ['price'] = 350000, ['tipo'] = "carros",  ['hash'] = 196747873, ['banned'] = false },
	["elegy2"] = { ['name'] = "Elegy2", ['price'] = 355000, ['tipo'] = "carros",  ['hash'] = -566387422, ['banned'] = false },
	["feltzer2"] = { ['name'] = "Feltzer2", ['price'] = 255000, ['tipo'] = "carros",  ['hash'] = -1995326987, ['banned'] = false },
	["flashgt"] = { ['name'] = "Flashgt", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = -1259134696, ['banned'] = false },
	["furoregt"] = { ['name'] = "Furoregt", ['price'] = 290000, ['tipo'] = "carros",  ['hash'] = -1089039904, ['banned'] = false },
	["fusilade"] = { ['name'] = "Fusilade", ['price'] = 210000000, ['tipo'] = "carros",  ['hash'] = 499169875, ['banned'] = false },
	["futo"] = { ['name'] = "Futo", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = 2016857647, ['banned'] = false },
	["gb200"] = { ['name'] = "Gb200", ['price'] = 195000, ['tipo'] = "carros",  ['hash'] = 1909189272, ['banned'] = false },
	["hotring"] = { ['name'] = "Hotring", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = 1115909093, ['banned'] = false },
	["italigto"] = { ['name'] = "Italigto", ['price'] = 800000, ['tipo'] = "carros",  ['hash'] = -331467772, ['banned'] = false },
	["jester"] = { ['name'] = "Jester", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = -1297672541, ['banned'] = false },
	["jester3"] = { ['name'] = "Jester3", ['price'] = 345000, ['tipo'] = "carros",  ['hash'] = -214906006, ['banned'] = false },
	["khamelion"] = { ['name'] = "Khamelion", ['price'] = 210000000, ['tipo'] = "carros",  ['hash'] = 544021352, ['banned'] = false },
	["kuruma"] = { ['name'] = "Kuruma", ['price'] = 330000, ['tipo'] = "carros",  ['hash'] = -1372848492, ['banned'] = false },
	["lynx"] = { ['name'] = "Lynx", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = 482197771, ['banned'] = false },
	["massacro"] = { ['name'] = "Massacro", ['price'] = 330000, ['tipo'] = "carros",  ['hash'] = -142942670, ['banned'] = false },
	["massacro2"] = { ['name'] = "Massacro2", ['price'] = 330000, ['tipo'] = "carros",  ['hash'] = -631760477, ['banned'] = false },
	["neon"] = { ['name'] = "Neon", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = -1848994066, ['banned'] = false },
	["ninef"] = { ['name'] = "Ninef", ['price'] = 290000, ['tipo'] = "carros",  ['hash'] = 1032823388 , ['banned'] = false },
	["ninef2"] = { ['name'] = "Ninef2", ['price'] = 290000, ['tipo'] = "carros",  ['hash'] = -1461482751, ['banned'] = false },
	["omnis"] = { ['name'] = "Omnis", ['price'] = 240000, ['tipo'] = "carros",  ['hash'] = -777172681, ['banned'] = false },
	["pariah"] = { ['name'] = "Pariah", ['price'] = 500000, ['tipo'] = "carros",  ['hash'] = 867799010, ['banned'] = false },
	["penumbra"] = { ['name'] = "Penumbra", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = -377465520, ['banned'] = false },
	["raiden"] = { ['name'] = "Raiden", ['price'] = 240000, ['tipo'] = "carros",  ['hash'] = -1529242755, ['banned'] = false },
	["rapidgt"] = { ['name'] = "Rapidgt", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -1934452204, ['banned'] = false },
	["rapidgt2"] = { ['name'] = "Rapidgt2", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = 1737773231, ['banned'] = false },
	["raptor"] = { ['name'] = "Raptor", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = -674927303, ['banned'] = false },
	["ruston"] = { ['name'] = "Ruston", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = 719660200, ['banned'] = false },
	["schafter3"] = { ['name'] = "Schafter3", ['price'] = 275000, ['tipo'] = "carros",  ['hash'] = -1485523546, ['banned'] = false },
	["schafter4"] = { ['name'] = "Schafter4", ['price'] = 275000, ['tipo'] = "carros",  ['hash'] = 1489967196, ['banned'] = false },
	["schafter5"] = { ['name'] = "Schafter5", ['price'] = 275000, ['tipo'] = "carros",  ['hash'] = -888242983, ['banned'] = false },
	["schlagen"] = { ['name'] = "Schlagen", ['price'] = 690000, ['tipo'] = "carros",  ['hash'] = -507495760, ['banned'] = false },
	["schwarzer"] = { ['name'] = "Schwarzer", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = -746882698, ['banned'] = false },
	["sentinel3"] = { ['name'] = "Sentinel3", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = 1104234922, ['banned'] = false },
	["seven70"] = { ['name'] = "Seven70", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = -1757836725, ['banned'] = false },
	["specter"] = { ['name'] = "Specter", ['price'] = 320000, ['tipo'] = "carros",  ['hash'] = 1886268224, ['banned'] = false },
	["specter2"] = { ['name'] = "Specter2", ['price'] = 355000, ['tipo'] = "carros",  ['hash'] = 1074745671, ['banned'] = false },
	["streiter"] = { ['name'] = "Streiter", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = 1741861769, ['banned'] = false },
	["sultan"] = { ['name'] = "Sultan", ['price'] = 210000000, ['tipo'] = "carros",  ['hash'] = 970598228, ['banned'] = false },
	["surano"] = { ['name'] = "Surano", ['price'] = 310000000, ['tipo'] = "carros",  ['hash'] = 384071873, ['banned'] = false },
	["tampa2"] = { ['name'] = "Tampa2", ['price'] = 200000, ['tipo'] = "carros",  ['hash'] = -1071380347, ['banned'] = false },
	["tropos"] = { ['name'] = "Tropos", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = 1887331236, ['banned'] = false },
	["verlierer2"] = { ['name'] = "Verlierer2", ['price'] = 380000, ['tipo'] = "carros",  ['hash'] = 1102544804, ['banned'] = false },
	
	-- ADICIONADOS DPS
	['asbo'] = { ['name'] = 'Asbo', ['price'] = 15000, ['tipo'] = 'carros',  ['hash'] = 1118611807, ['banned'] = false },
	['club'] = { ['name'] = 'Club', ['price'] = 25000, ['tipo'] = 'carros',  ['hash'] = -2098954619, ['banned'] = false },
	['kanjo'] = { ['name'] = 'Kanjo', ['price'] = 30000, ['tipo'] = 'carros',  ['hash'] = 409049982, ['banned'] = false },
	['weevil'] = { ['name'] = 'Weevil', ['price'] = 25000, ['tipo'] = 'carros',  ['hash'] = 1644055914, ['banned'] = false },
	['yosemite2'] = { ['name'] = 'Yosemite2', ['price'] = 400000, ['tipo'] = 'carros',  ['hash'] = 1693751655, ['banned'] = false },
	['caracara2'] = { ['name'] = 'Caracara2', ['price'] = 800000, ['tipo'] = 'carros',  ['hash'] = -1349095620, ['banned'] = false },
	['everon'] = { ['name'] = 'Everon', ['price'] = 700000, ['tipo'] = 'carros',  ['hash'] = -1756021720, ['banned'] = false },
	['hellion'] = { ['name'] = 'Hellion', ['price'] = 500000, ['tipo'] = 'carros',  ['hash'] = -362150785, ['banned'] = false },
	['outlaw'] = { ['name'] = 'Outlaw', ['price'] = 450000, ['tipo'] = 'carros',  ['hash'] = 408825843, ['banned'] = false },
	['novak'] = { ['name'] = 'Novak ', ['price'] = 620000, ['tipo'] = 'carros',  ['hash'] = -1829436850, ['banned'] = false },
	['rebla'] = { ['name'] = 'Rebla', ['price'] = 700000, ['tipo'] = 'carros',  ['hash'] = 83136452, ['banned'] = false },
	['coquette4'] = { ['name'] = 'Coquette 4', ['price'] = 1000000, ['tipo'] = 'carros',  ['hash'] = -1728685474, ['banned'] = false },
	['drafter'] = { ['name'] = 'Drafter', ['price'] = 450000, ['tipo'] = 'carros',  ['hash'] = 686471183, ['banned'] = false },
	['komoda'] = { ['name'] = 'Komoda', ['price'] = 500000, ['tipo'] = 'carros',  ['hash'] = -834353991, ['banned'] = false },
	['imorgon'] = { ['name'] = 'Imorgon', ['price'] = 320000, ['tipo'] = 'carros',  ['hash'] = -1132721664, ['banned'] = false },
	['penumbra2'] = { ['name'] = 'Penumbra2 ', ['price'] = 300000, ['tipo'] = 'carros',  ['hash'] = -631322662, ['banned'] = false },
	['paragon'] = { ['name'] = 'Paragon', ['price'] = 450000, ['tipo'] = 'carros',  ['hash'] = -447711397, ['banned'] = false },
	['sugoi'] = { ['name'] = 'Sugoi', ['price'] = 450000, ['tipo'] = 'carros',  ['hash'] = 987469656, ['banned'] = false },
	['sultan2'] = { ['name'] = 'Sultan 2', ['price'] = 700000, ['tipo'] = 'carros',  ['hash'] = 872704284, ['banned'] = false },
	['vstr'] = { ['name'] = 'Vstr', ['price'] = 350000, ['tipo'] = 'carros',  ['hash'] = 1456336509, ['banned'] = false },
	['furia'] = { ['name'] = 'Furia', ['price'] = 800000, ['tipo'] = 'carros',  ['hash'] = 960812448, ['banned'] = false },
	['krieger'] = { ['name'] = 'Krieger', ['price'] = 1000000, ['tipo'] = 'carros', ['mala'] = 80, ['slots'] = 10, ['hash'] = -664141241, ['banned'] = false },
	['thrax'] = { ['name'] = 'Thrax', ['price'] = 1100000000, ['tipo'] = 'carros',  ['hash'] = 1044193113, ['banned'] = false },
	['manchez2'] = { ['name'] = 'Manchez2', ['price'] = 180000, ['tipo'] = 'moto',  ['hash'] = 1086534307, ['banned'] = false },
	['jugular'] = { ['name'] = 'Jugular', ['price'] = 800000, ['tipo'] = 'carros',  ['hash'] = -208911803, ['banned'] = false },
	['gauntlet5'] = { ['name'] = 'Gauntlet5 ', ['price'] = 250000, ['tipo'] = 'carros',  ['hash'] = -2122646867, ['banned'] = false },
	['gauntlet4'] = { ['name'] = 'Gauntlet4 ', ['price'] = 300000, ['tipo'] = 'carros',  ['hash'] = 1934384720, ['banned'] = false },

	-- Sports Classic
	["btype"] = { ['name'] = "Btype", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = 117401876, ['banned'] = false },
	["btype2"] = { ['name'] = "Btype2", ['price'] = 460000, ['tipo'] = "carros",  ['hash'] = -831834716, ['banned'] = false },
	["btype3"] = { ['name'] = "Btype3", ['price'] = 390000, ['tipo'] = "carros",  ['hash'] = -602287871, ['banned'] = false },
	["casco"] = { ['name'] = "Casco", ['price'] = 355000, ['tipo'] = "carros",  ['hash'] = 941800958, ['banned'] = false },
	["cheetah2"] = { ['name'] = "Cheetah2", ['price'] = 240000, ['tipo'] = "carros",  ['hash'] = 223240013, ['banned'] = false },
	["coquette2"] = { ['name'] = "Coquette2", ['price'] = 285000, ['tipo'] = "carros",  ['hash'] = 1011753235, ['banned'] = false },
	["fagaloa"] = { ['name'] = "Fagaloa", ['price'] = 320000, ['tipo'] = "carros",  ['hash'] = 1617472902, ['banned'] = false },
	["feltzer3"] = { ['name'] = "Feltzer3", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = -1566741232, ['banned'] = false },
	["gt500"] = { ['name'] = "Gt500", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -2079788230, ['banned'] = false },
	["infernus2"] = { ['name'] = "Infernus2", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -1405937764, ['banned'] = false },
	["jb700"] = { ['name'] = "Jb700", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = 1051415893, ['banned'] = false },
	["mamba"] = { ['name'] = "Mamba", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = -1660945322, ['banned'] = false },
	["manana"] = { ['name'] = "Manana", ['price'] = 130000, ['tipo'] = "carros",  ['hash'] = -2124201592, ['banned'] = false },
	["michelli"] = { ['name'] = "Michelli", ['price'] = 160000, ['tipo'] = "carros",  ['hash'] = 1046206681, ['banned'] = false },
	["monroe"] = { ['name'] = "Monroe", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = -433375717, ['banned'] = false },
	["peyote"] = { ['name'] = "Peyote", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 1830407356, ['banned'] = false },
	["pigalle"] = { ['name'] = "Pigalle", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = 1078682497, ['banned'] = false },
	["rapidgt3"] = { ['name'] = "Rapidgt3", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = 2049897956, ['banned'] = false },
	["retinue"] = { ['name'] = "Retinue", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 1841130506, ['banned'] = false },
	["stinger"] = { ['name'] = "Stinger", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = 1545842587, ['banned'] = false },
	["stingergt"] = { ['name'] = "Stingergt", ['price'] = 230000, ['tipo'] = "carros",  ['hash'] = -2098947590, ['banned'] = false },
	["swinger"] = { ['name'] = "Swinger", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = 500482303, ['banned'] = false },
	["torero"] = { ['name'] = "Torero", ['price'] = 160000, ['tipo'] = "carros",  ['hash'] = 1504306544, ['banned'] = false },
	["tornado"] = { ['name'] = "Tornado", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = 464687292, ['banned'] = false },
	["tornado2"] = { ['name'] = "Tornado2", ['price'] = 160000, ['tipo'] = "carros",  ['hash'] = 1531094468, ['banned'] = false },
	["tornado5"] = { ['name'] = "Tornado5", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = -1797613329, ['banned'] = false },
	["tornado6"] = { ['name'] = "Tornado6", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -1558399629, ['banned'] = false },
	["turismo2"] = { ['name'] = "Turismo2", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = -982130927, ['banned'] = false },
	["z190"] = { ['name'] = "Z190", ['price'] = 350000, ['tipo'] = "carros",  ['hash'] = 838982985, ['banned'] = false },
	["ztype"] = { ['name'] = "Ztype", ['price'] = 400000, ['tipo'] = "carros",  ['hash'] = 758895617, ['banned'] = false },
	["cheburek"] = { ['name'] = "Cheburek", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = -988501280, ['banned'] = false },
	
	-- Super
	["adder"] = { ['name'] = "Adder", ['price'] = 620000, ['tipo'] = "carros",  ['hash'] = -1216765807, ['banned'] = false },
	--["autarch"] = { ['name'] = "Autarch", ['price'] = 760000, ['tipo'] = "carros",  ['hash'] = -313185164, ['banned'] = false },
	["banshee2"] = { ['name'] = "Banshee2", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = 633712403, ['banned'] = false },
	["bullet"] = { ['name'] = "Bullet", ['price'] = 400000, ['tipo'] = "carros",  ['hash'] = -1696146015, ['banned'] = false },
	["cheetah"] = { ['name'] = "Cheetah", ['price'] = 425000, ['tipo'] = "carros",  ['hash'] = -1311154784, ['banned'] = false },
	["cyclone"] = { ['name'] = "Cyclone", ['price'] = 920000, ['tipo'] = "carros",  ['hash'] = 1392481335, ['banned'] = false },
	["entity2"] = { ['name'] = "Entity2", ['price'] = 550000, ['tipo'] = "carros",  ['hash'] = -2120700196, ['banned'] = false },
	["entityxf"] = { ['name'] = "Entityxf", ['price'] = 460000, ['tipo'] = "carros",  ['hash'] = -1291952903, ['banned'] = false },
	["fmj"] = { ['name'] = "Fmj", ['price'] = 520000, ['tipo'] = "carros",  ['hash'] = 1426219628, ['banned'] = false },
	["gp1"] = { ['name'] = "Gp1", ['price'] = 495000, ['tipo'] = "carros",  ['hash'] = 1234311532, ['banned'] = false },
	["infernus"] = { ['name'] = "Infernus", ['price'] = 470000, ['tipo'] = "carros",  ['hash'] = 418536135, ['banned'] = false },
	["italigtb"] = { ['name'] = "Italigtb", ['price'] = 600000, ['tipo'] = "carros",  ['hash'] = -2048333973, ['banned'] = false },
	["italigtb2"] = { ['name'] = "Italigtb2", ['price'] = 610000000, ['tipo'] = "carros",  ['hash'] = -482719877, ['banned'] = false },
	["le7b"] = { ['name'] = "Le7b", ['price'] = 700000, ['tipo'] = "carros",  ['hash'] = -1232836011, ['banned'] = false },
	["nero"] = { ['name'] = "Nero", ['price'] = 450000, ['tipo'] = "carros",  ['hash'] = 1034187331, ['banned'] = false },
	["nero2"] = { ['name'] = "Nero2", ['price'] = 480000, ['tipo'] = "carros",  ['hash'] = 1093792632, ['banned'] = false },
	["osiris"] = { ['name'] = "Osiris", ['price'] = 460000, ['tipo'] = "carros",  ['hash'] = 1987142870, ['banned'] = false },
	["penetrator"] = { ['name'] = "Penetrator", ['price'] = 480000, ['tipo'] = "carros",  ['hash'] = -1758137366, ['banned'] = false },
	["pfister811"] = { ['name'] = "Pfister811", ['price'] = 530000, ['tipo'] = "carros",  ['hash'] = -1829802492, ['banned'] = false },
	["prototipo"] = { ['name'] = "Prototipo", ['price'] = 1030000, ['tipo'] = "carros",  ['hash'] = 2123327359, ['banned'] = false },
	["reaper"] = { ['name'] = "Reaper", ['price'] = 620000, ['tipo'] = "carros",  ['hash'] = 234062309, ['banned'] = false },
	["sc1"] = { ['name'] = "Sc1", ['price'] = 495000, ['tipo'] = "carros",  ['hash'] = 1352136073, ['banned'] = false },
	["sheava"] = { ['name'] = "Sheava", ['price'] = 700000, ['tipo'] = "carros",  ['hash'] = 819197656, ['banned'] = false },
	["sultanrs"] = { ['name'] = "Sultan RS", ['price'] = 450000, ['tipo'] = "carros",  ['hash'] = -295689028, ['banned'] = false },
	["t20"] = { ['name'] = "T20", ['price'] = 670000, ['tipo'] = "carros",  ['hash'] = 1663218586, ['banned'] = false },
	["taipan"] = { ['name'] = "Taipan", ['price'] = 620000, ['tipo'] = "carros",  ['hash'] = -1134706562, ['banned'] = false },
	["tempesta"] = { ['name'] = "Tempesta", ['price'] = 600000, ['tipo'] = "carros",  ['hash'] = 272929391, ['banned'] = false },
	["tezeract"] = { ['name'] = "Tezeract", ['price'] = 920000, ['tipo'] = "carros",  ['hash'] = 1031562256, ['banned'] = false },
	["turismor"] = { ['name'] = "Turismor", ['price'] = 620000, ['tipo'] = "carros",  ['hash'] = 408192225, ['banned'] = false },
	["tyrant"] = { ['name'] = "Tyrant", ['price'] = 690000, ['tipo'] = "carros",  ['hash'] = -376434238, ['banned'] = false },
	["tyrus"] = { ['name'] = "Tyrus", ['price'] = 620000, ['tipo'] = "carros",  ['hash'] = 2067820283, ['banned'] = false },
	["vacca"] = { ['name'] = "Vacca", ['price'] = 620000, ['tipo'] = "carros",  ['hash'] = 338562499, ['banned'] = false },
	["vagner"] = { ['name'] = "Vagner", ['price'] = 680000, ['tipo'] = "carros",  ['hash'] = 1939284556, ['banned'] = false },
	["visione"] = { ['name'] = "Visione", ['price'] = 690000, ['tipo'] = "carros",  ['hash'] = -998177792, ['banned'] = false },
	["voltic"] = { ['name'] = "Voltic", ['price'] = 440000, ['tipo'] = "carros",  ['hash'] = -1622444098, ['banned'] = false },
	["xa21"] = { ['name'] = "Xa21", ['price'] = 630000, ['tipo'] = "carros",  ['hash'] = 917809321, ['banned'] = false },
	["zentorno"] = { ['name'] = "Zentorno", ['price'] = 920000, ['tipo'] = "carros",  ['hash'] = -1403128555, ['banned'] = false },

	-- Trailer
	["tanker2"] = { ['name'] = "Gas", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1956216962, ['banned'] = true },
	["armytanker"] = { ['name'] = "Diesel", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1207431159, ['banned'] = true },
	["tvtrailer"] = { ['name'] = "Show", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1770643266, ['banned'] = true },
	["trailerlogs"] = { ['name'] = "Woods", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 2016027501, ['banned'] = true },
	["tr4"] = { ['name'] = "Cars", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 2091594960, ['banned'] = true },
	
	-- Trains

	-- Utility
	["sadler"] = { ['name'] = "Sadler", ['price'] = 180000, ['tipo'] = "carros",  ['hash'] = -599568815, ['banned'] = false },
	["towtruck"] = { ['name'] = "Towtruck", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -1323100960, ['banned'] = true },
	["towtruck2"] = { ['name'] = "Towtruck2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -442313018, ['banned'] = true },
	["tractor2"] = { ['name'] = "Tractor2", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -2076478498, ['banned'] = false },

	-- Vans
--	["bison"] = { ['name'] = "Bison", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = -16948145, ['banned'] = false },
--	["bison2"] = { ['name'] = "Bison2", ['price'] = 180000, ['tipo'] = "carros",  ['hash'] = 2072156101, ['banned'] = false },
	["bobcatxl"] = { ['name'] = "Bobcatxl", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = 1069929536, ['banned'] = false },
	["boxville2"] = { ['name'] = "Caminhão", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = -233098306, ['banned'] = false },
	["boxville4"] = { ['name'] = "Caminhão", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 444171386, ['banned'] = false },
	["burrito"] = { ['name'] = "Burrito", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = -1346687836, ['banned'] = false },
	["burrito2"] = { ['name'] = "Burrito2", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = -907477130, ['banned'] = false },
	["burrito3"] = { ['name'] = "Burrito3", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = -1743316013, ['banned'] = false },
	["burrito4"] = { ['name'] = "Burrito4", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = 893081117, ['banned'] = false },
	["gburrito"] = { ['name'] = "GBurrito", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = -1745203402, ['banned'] = false },
	["minivan"] = { ['name'] = "Minivan", ['price'] = 110000000, ['tipo'] = "carros",  ['hash'] = -310465116, ['banned'] = false },
	["minivan2"] = { ['name'] = "Minivan2", ['price'] = 220000, ['tipo'] = "carros",  ['hash'] = -1126264336, ['banned'] = false },
	["paradise"] = { ['name'] = "Paradise", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = 1488164764, ['banned'] = false },
	["pony"] = { ['name'] = "Pony", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = -119658072, ['banned'] = false },
	["pony2"] = { ['name'] = "Pony2", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = 943752001, ['banned'] = false },
	["rumpo"] = { ['name'] = "Rumpo", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = 1162065741, ['banned'] = false },
	["rumpo2"] = { ['name'] = "Rumpo2", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = -1776615689, ['banned'] = false },
	["rumpo3"] = { ['name'] = "Rumpo3", ['price'] = 350000, ['tipo'] = "carros",  ['hash'] = 1475773103, ['banned'] = false },
	["speedo"] = { ['name'] = "Speedo", ['price'] = 200000, ['tipo'] = "work",  ['hash'] = -810318068, ['banned'] = false },
	["surfer"] = { ['name'] = "Surfer", ['price'] = 55000, ['tipo'] = "carros",  ['hash'] = 699456151, ['banned'] = false },
	["youga"] = { ['name'] = "Youga", ['price'] = 260000, ['tipo'] = "carros",  ['hash'] = 65402552, ['banned'] = false },
	["youga2"] = { ['name'] = "Youga XL", ['price'] = 1000000, ['tipo'] = "work",  ['hash'] = 1026149675, ['banned'] = false },
	
	-- ADD-ON BRASIL
	["fox"] = { ['name'] = "Fox", ['price'] = 80000, ['tipo'] = "carros",  ['hash'] = GetHashKey("fox"), ['banned'] = false },
	["amarok"] = { ['name'] = "Amarok", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("amarok"), ['banned'] = false },
	["vwbeetlenaj"] = { ['name'] = "Fusca", ['price'] = 50000, ['tipo'] = "carros",  ['hash'] = GetHashKey("vwbeetlenaj"), ['banned'] = false },
	["defender21"] = { ['name'] = "Defender 2021", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("defender21"), ['banned'] = false },
	["gcmcerato18"] = { ['name'] = "Cerato", ['price'] = 100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("gcmcerato18"), ['banned'] = false },
	["gcmcorolla20cn"] = { ['name'] = "Corolla", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = GetHashKey("gcmcorolla20cn"), ['banned'] = false },
	["gcmhighlanderxse"] = { ['name'] = "HighLander", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("gcmhighlanderxse"), ['banned'] = false },
	["gcmoutlanderls"] = { ['name'] = "Outlander", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("gcmoutlanderls"), ['banned'] = false },
	["gcmsentra20"] = { ['name'] = "Sentra 2020", ['price'] = 100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("gcmsentra20"), ['banned'] = false },
	["gcmcity14"] = { ['name'] = "Honda City", ['price'] = 90000, ['tipo'] = "carros",  ['hash'] = GetHashKey("gcmcity14"), ['banned'] = false },
	["golfgti7"] = { ['name'] = "Golf GTI", ['price'] = 250000, ['tipo'] = "carros",  ['hash'] = GetHashKey("golfgti7"), ['banned'] = false },
	["hilux2019"] = { ['name'] = "Hilux", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("hilux2019"), ['banned'] = false },
	["jettagli"] = { ['name'] = "Jetta GLI", ['price'] = 350000, ['tipo'] = "carros",  ['hash'] = GetHashKey("jettagli"), ['banned'] = false },
	["nf17"] = { ['name'] = "Frontier", ['price'] = 270000, ['tipo'] = "carros",  ['hash'] = GetHashKey("nf17"), ['banned'] = false },
	["pajero4"] = { ['name'] = "Pajero", ['price'] = 100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("pajero4"), ['banned'] = false },
	["polo2018"] = { ['name'] = "Polo Sedan", ['price'] = 80000, ['tipo'] = "carros",  ['hash'] = GetHashKey("polo2018"), ['banned'] = false },
	["savaoriginal"] = { ['name'] = "Saveiro Surf", ['price'] = 60000, ['tipo'] = "carros",  ['hash'] = GetHashKey("savaoriginal"), ['banned'] = false },
	["taigun21"] = { ['name'] = "Taigun", ['price'] = 100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("taigun21"), ['banned'] = false },
	["uptsi"] = { ['name'] = "UP TSI", ['price'] = 120000, ['tipo'] = "carros",  ['hash'] = GetHashKey("uptsi"), ['banned'] = false },
	["veloster"] = { ['name'] = "Veloster", ['price'] = 80000, ['tipo'] = "carros",  ['hash'] = GetHashKey("veloster"), ['banned'] = false },
	["mi4"] = { ['name'] = "Onibus", ['price'] = 0, ['tipo'] = "carros",  ['hash'] = GetHashKey("mi4"), ['banned'] = false },

	["cox2013"] = { ['name'] = "New Beetle", ['price'] = 120000, ['tipo'] = "carros",  ['hash'] = GetHashKey("cox2013"), ['banned'] = false },
	-- ADD-ON motos
	["biz25"] = { ['name'] = "Bis", ['price'] = 60000, ['tipo'] = "motos",  ['hash'] = GetHashKey("biz25"), ['banned'] = false },
	["bros60"] = { ['name'] = "Bros", ['price'] = 80000, ['tipo'] = "motos",  ['hash'] = GetHashKey("bros60"), ['banned'] = false },
	["v4sf"] = { ['name'] = "Ducati v4S", ['price'] = 300000, ['tipo'] = "motos",  ['hash'] = GetHashKey("v4sf"), ['banned'] = false },
	["mt03"] = { ['name'] = "MT-03", ['price'] = 100000, ['tipo'] = "motos",  ['hash'] = GetHashKey("mt03"), ['banned'] = false },
	["fz07"] = { ['name'] = "MT-07", ['price'] = 130000, ['tipo'] = "motos",  ['hash'] = GetHashKey("fz07"), ['banned'] = false },
	["R1200GS"] = { ['name'] = "R1200", ['price'] = 300000, ['tipo'] = "motos",  ['hash'] = GetHashKey("R1200GS"), ['banned'] = false },
	["cg160"] = { ['name'] = "CG 160", ['price'] = 50000, ['tipo'] = "motos",  ['hash'] = GetHashKey("cg160"), ['banned'] = false },
	["xre300"] = { ['name'] = "XRE 300", ['price'] = 80000, ['tipo'] = "motos",  ['hash'] = GetHashKey("xre300"), ['banned'] = false },
	["500x"] = { ['name'] = "CB 500x", ['price'] = 150000, ['tipo'] = "motos",  ['hash'] = GetHashKey("500x"), ['banned'] = false },
	["hcbr17"] = { ['name'] = "CBR 1000RR", ['price'] = 260000, ['tipo'] = "motos",  ['hash'] = GetHashKey("hcbr17"), ['banned'] = false },
	["z1000"] = { ['name'] = "z1000", ['price'] = 220000, ['tipo'] = "motos",  ['hash'] = GetHashKey("z1000"), ['banned'] = false },
	["r1"] = { ['name'] = "Yamaha R1", ['price'] = 125000, ['tipo'] = "motos",  ['hash'] = GetHashKey("r1"), ['banned'] = false },
	["f800"] = { ['name'] = "BMW F800", ['price'] = 220000, ['tipo'] = "motos",  ['hash'] = GetHashKey("f800"), ['banned'] = false },
	["gs310"] = { ['name'] = "BMW F310", ['price'] = 180000, ['tipo'] = "motos",  ['hash'] = GetHashKey("gs310"), ['banned'] = false },
	["gsxr"] = { ['name'] = "Suzuki XR", ['price'] = 130000, ['tipo'] = "motos",  ['hash'] = GetHashKey("gsxr"), ['banned'] = false },
	["h2carb"] = { ['name'] = "Ninja H2 Carb", ['price'] = 210000, ['tipo'] = "motos",  ['hash'] = GetHashKey("h2carb"), ['banned'] = false },
	["hayabusa"] = { ['name'] = "Hayabusa", ['price'] = 230000, ['tipo'] = "motos",  ['hash'] = GetHashKey("hayabusa"), ['banned'] = false },
	["hornet"] = { ['name'] = "Hornet", ['price'] = 150000, ['tipo'] = "motos",  ['hash'] = GetHashKey("hornet"), ['banned'] = false },
	["r6"] = { ['name'] = "Yamaha R6", ['price'] = 200000, ['tipo'] = "motos",  ['hash'] = GetHashKey("r6"), ['banned'] = false },
	["s1000docandidato"] = { ['name'] = "Bmw S1000", ['price'] = 260000, ['tipo'] = "motos",  ['hash'] = GetHashKey("s1000docandidato"), ['banned'] = false },
	-- ADD-ON carros
	["amggtr"] = { ['name'] = "AMG GTR", ['price'] = 1500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("amggtr"), ['banned'] = false },
	["2019chiron"] = { ['name'] = "Bugatti", ['price'] = 2800000, ['tipo'] = "carros",  ['hash'] = GetHashKey("2019chiron"), ['banned'] = false },
	["21camaro"] = { ['name'] = "Camaro", ['price'] = 2000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("21camaro"), ['banned'] = false },
	["911turbos"] = { ['name'] = "Porche 911", ['price'] = 2500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("911turbos"), ['banned'] = false },
	["audirs6"] = { ['name'] = "Audi RS6", ['price'] = 2200000, ['tipo'] = "carros",  ['hash'] = GetHashKey("audirs6"), ['banned'] = false },
	["audirs7"] = { ['name'] = "Audi RS7", ['price'] = 2600000, ['tipo'] = "carros",  ['hash'] = GetHashKey("audirs7"), ['banned'] = false },
	["b63s"] = { ['name'] = "Brabus B63", ['price'] = 1600000, ['tipo'] = "carros",  ['hash'] = GetHashKey("b63s"), ['banned'] = false },
	["bmci"] = { ['name'] = "BMW M4", ['price'] = 1700000, ['tipo'] = "carros",  ['hash'] = GetHashKey("bmci"), ['banned'] = false },
	["bmwm3f80"] = { ['name'] = "BMW M3", ['price'] = 1500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("bmwm3f80"), ['banned'] = false },
	["bmwm4gts"] = { ['name'] = "BMW M4 GTS", ['price'] = 1700000, ['tipo'] = "carros",  ['hash'] = GetHashKey("bmwm4gts"), ['banned'] = false },
	["dodgechargersrt"] = { ['name'] = "Dodge Charger", ['price'] = 1500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("dodgechargersrt"), ['banned'] = false },
	["ferrariitalia"] = { ['name'] = "Ferrari Italia", ['price'] = 3000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("ferrariitalia"), ['banned'] = false },
	["focusrs"] = { ['name'] = "Focus RS", ['price'] = 1600000, ['tipo'] = "carros",  ['hash'] = GetHashKey("focusrs"), ['banned'] = false },
	["fordmustang"] = { ['name'] = "Ford Mustang", ['price'] = 2000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("fordmustang"), ['banned'] = false },
	["fpacehm"] = { ['name'] = "Jaguar F-pace", ['price'] = 2000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("fpacehm"), ['banned'] = false },
	["lamborghinihuracan"] = { ['name'] = "Lambo Huracan", ['price'] = 2600000, ['tipo'] = "carros",  ['hash'] = GetHashKey("lamborghinihuracan"), ['banned'] = false },
	["lancerevolution9"] = { ['name'] = "Lance Evo 9", ['price'] = 1500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("lancerevolution9"), ['banned'] = false },
	["lancerevolutionx"] = { ['name'] = "Lance Evo X", ['price'] = 1800000, ['tipo'] = "carros",  ['hash'] = GetHashKey("lancerevolutionx"), ['banned'] = false },
	["macan"] = { ['name'] = "Porsche Macan", ['price'] = 1800000, ['tipo'] = "carros",  ['hash'] = GetHashKey("macan"), ['banned'] = false },
	["mazdarx7"] = { ['name'] = "Mazda RX7", ['price'] = 1500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("mazdarx7"), ['banned'] = false },
	["mercedesa45"] = { ['name'] = "Mercedes A45", ['price'] = 1500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("mercedesa45"), ['banned'] = false },
	["mers63c"] = { ['name'] = "Mercedes 63C", ['price'] = 1700000, ['tipo'] = "carros",  ['hash'] = GetHashKey("mers63c"), ['banned'] = false },
	["nissan370z"] = { ['name'] = "Nissan 370Z", ['price'] = 1500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("nissan370z"), ['banned'] = false },
	["nissangtr"] = { ['name'] = "Nissan GTR", ['price'] = 2000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("nissangtr"), ['banned'] = false },
	["nissanskyliner34"] = { ['name'] = "Skyline", ['price'] = 2200000, ['tipo'] = "carros",  ['hash'] = GetHashKey("nissanskyliner34"), ['banned'] = false },
	["p1"] = { ['name'] = "Mclaren P1", ['price'] = 3000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("p1"), ['banned'] = false },
	["panamera17turbo"] = { ['name'] = "Panamera Turbo", ['price'] = 2800000, ['tipo'] = "carros",  ['hash'] = GetHashKey("panamera17turbo"), ['banned'] = false },
	["raptor2017"] = { ['name'] = "Raptor", ['price'] = 2200000, ['tipo'] = "carros",  ['hash'] = GetHashKey("raptor2017"), ['banned'] = false },
	["rs6c8"] = { ['name'] = "Audi RS6 Sedan", ['price'] = 2600000, ['tipo'] = "carros",  ['hash'] = GetHashKey("rs6c8"), ['banned'] = false },
	["teslaprior"] = { ['name'] = "Tesla Prior", ['price'] = 3100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("teslaprior"), ['banned'] = false },
	["toyotasupra"] = { ['name'] = "Toyota Supra", ['price'] = 2000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("toyotasupra"), ['banned'] = false },
	["velociraptor"] = { ['name'] = "Velociraptor", ['price'] = 3000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("velociraptor"), ['banned'] = false },
	["rrst"] = { ['name'] = "Range Rover", ['price'] = 1800000, ['tipo'] = "carros",  ['hash'] = GetHashKey("rrst"), ['banned'] = false },
	["cayenneturbo"] = { ['name'] = "Porsche Cayenne", ['price'] = 2000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("cayenneturbo"), ['banned'] = false },
	["22g63"] = { ['name'] = "Mercedes G63", ['price'] = 1900000, ['tipo'] = "carros",  ['hash'] = GetHashKey("22g63"), ['banned'] = false },
	["velar"] = { ['name'] = "Velar", ['price'] = 3000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("velar"), ['banned'] = false },
	["x6m"] = { ['name'] = "BMW x6M", ['price'] = 3100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("x6m"), ['banned'] = false },
	["teslax"] = { ['name'] = "Tesla Model X", ['price'] = 3100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("teslax"), ['banned'] = false },
	["ttrs"] = { ['name'] = "Audi TT", ['price'] = 2000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("ttrs"), ['banned'] = false },
	--==== PM SP
	["xt2017pm"] = { ['name'] = "xt2017pm", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("xt2017pm"), ['banned'] = false },
	["as350"] = { ['name'] = "as350", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("as350"), ['banned'] = false },
	["as350pc"] = { ['name'] = "as350pc", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("as350pc"), ['banned'] = false },
	["s10sap"] = { ['name'] = "s10sap", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("s10sap"), ['banned'] = false },
	["sprinter"] = { ['name'] = "sprinter", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("sprinter"), ['banned'] = false },
	["sw4pm"] = { ['name'] = "sw4pm", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("sw4pm"), ['banned'] = false },
	["trail20eb"] = { ['name'] = "trail20eb", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("trail20eb"), ['banned'] = false },
	["sw4baep"] = { ['name'] = "sw4baep", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("sw4baep"), ['banned'] = false },
	["trail20baep"] = { ['name'] = "trail20baep", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("trail20baep"), ['banned'] = false },
	["trail17baep"] = { ['name'] = "trail17baep", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("trail17baep"), ['banned'] = false },
	["trailft20"] = { ['name'] = "Trail FT 20", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("trailft20"), ['banned'] = false },
	["s10sap"] = { ['name'] = "s10sap", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("s10sap"), ['banned'] = false },
	["stretcher"] = { ['name'] = "stretcher", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("stretcher"), ['banned'] = false },
	["motosamu"] = { ['name'] = "motosamu", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("motosamu"), ['banned'] = false },
	["20ramambo"] = { ['name'] = "20ramambo", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("20ramambo"), ['banned'] = false },
	["dinghy2"] = { ['name'] = "Bote Pequeno", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("dinghy2"), ['banned'] = false },
	["comet2"] = { ['name'] = "Uno Escada", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("comet2"), ['banned'] = false },
	["boxville4"] = { ['name'] = "Van Entrega", ['price'] = 1000, ['tipo'] = "work",  ['hash'] = GetHashKey("boxville4"), ['banned'] = false },

	["asbo"] = { ['name'] = "asbo", ['price'] = 100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("asbo"), ['banned'] = false },
	["club"] = { ['name'] = "club", ['price'] = 120000, ['tipo'] = "carros",  ['hash'] = GetHashKey("club"), ['banned'] = false },
	["kanjo"] = { ['name'] = "kanjo", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = GetHashKey("kanjo"), ['banned'] = false },
	["brioso2"] = { ['name'] = "brioso2", ['price'] = 100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("brioso2"), ['banned'] = false },
	["weevil"] = { ['name'] = "weevil", ['price'] = 100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("weevil"), ['banned'] = false },
	["previon"] = { ['name'] = "previon", ['price'] = 200000, ['tipo'] = "carros",  ['hash'] = GetHashKey("previon"), ['banned'] = false },
	["stryder"] = { ['name'] = "stryder", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("stryder"), ['banned'] = false },
	["chino"] = { ['name'] = "chino", ['price'] = 190000, ['tipo'] = "carros",  ['hash'] = GetHashKey("chino"), ['banned'] = false },
	["deviant"] = { ['name'] = "deviant", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("deviant"), ['banned'] = false },
	["gauntlet3"] = { ['name'] = "gauntlet3", ['price'] = 265000, ['tipo'] = "carros",  ['hash'] = GetHashKey("gauntlet3"), ['banned'] = false },
	["gauntlet4"] = { ['name'] = "gauntlet4", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("gauntlet4"), ['banned'] = false },
	["lurcher"] = { ['name'] = "lurcher", ['price'] = 200000, ['tipo'] = "carros",  ['hash'] = GetHashKey("lurcher"), ['banned'] = false },
	["peyote2"] = { ['name'] = "peyote2", ['price'] = 400000, ['tipo'] = "carros",  ['hash'] = GetHashKey("peyote2"), ['banned'] = false },
	["tulip"] = { ['name'] = "tulip", ['price'] = 170000, ['tipo'] = "carros",  ['hash'] = GetHashKey("tulip"), ['banned'] = false },
	["vamos"] = { ['name'] = "vamos", ['price'] = 140000, ['tipo'] = "carros",  ['hash'] = GetHashKey("vamos"), ['banned'] = false },
	["yosemite3"] = { ['name'] = "yosemite3", ['price'] = 475000, ['tipo'] = "carros",  ['hash'] = GetHashKey("yosemite3"), ['banned'] = false },
	["dominator7"] = { ['name'] = "dominator7", ['price'] = 500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("dominator7"), ['banned'] = false },
	["caracara2"] = { ['name'] = "caracara2", ['price'] = 500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("caracara2"), ['banned'] = false },
	["everon"] = { ['name'] = "everon", ['price'] = 600000, ['tipo'] = "carros",  ['hash'] = GetHashKey("everon"), ['banned'] = false },
	["freecrawler"] = { ['name'] = "freecrawler", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("freecrawler"), ['banned'] = false },
	["hellion"] = { ['name'] = "hellion", ['price'] = 320000, ['tipo'] = "carros",  ['hash'] = GetHashKey("hellion"), ['banned'] = false },
	["kalahari"] = { ['name'] = "kalahari", ['price'] = 100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("kalahari"), ['banned'] = false },
	["outlaw"] = { ['name'] = "outlaw", ['price'] = 450000, ['tipo'] = "carros",  ['hash'] = GetHashKey("outlaw"), ['banned'] = false },
	["landstalker2"] = { ['name'] = "landstalker2", ['price'] = 200000, ['tipo'] = "carros",  ['hash'] = GetHashKey("landstalker2"), ['banned'] = false },
	["novak"] = { ['name'] = "novak", ['price'] = 370000, ['tipo'] = "carros",  ['hash'] = GetHashKey("novak"), ['banned'] = false },
	["rebla"] = { ['name'] = "rebla", ['price'] = 440000, ['tipo'] = "carros",  ['hash'] = GetHashKey("rebla"), ['banned'] = false },
	["glendale2"] = { ['name'] = "glendale2", ['price'] = 150000, ['tipo'] = "carros",  ['hash'] = GetHashKey("glendale2"), ['banned'] = false },
	["stafford"] = { ['name'] = "stafford", ['price'] = 900000, ['tipo'] = "carros",  ['hash'] = GetHashKey("stafford"), ['banned'] = false },
	["surge"] = { ['name'] = "surge", ['price'] = 300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("surge"), ['banned'] = false },

	["comet2"] = { ['name'] = "comet2", ['price'] = 500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("comet2"), ['banned'] = false },
	["comet3"] = { ['name'] = "comet3", ['price'] = 600000, ['tipo'] = "carros",  ['hash'] = GetHashKey("comet3"), ['banned'] = false },
	["comet5"] = { ['name'] = "comet5", ['price'] = 700000, ['tipo'] = "carros",  ['hash'] = GetHashKey("comet5"), ['banned'] = false },
	["coquette4"] = { ['name'] = "coquette4", ['price'] = 700000, ['tipo'] = "carros",  ['hash'] = GetHashKey("coquette4"), ['banned'] = false },
	["drafter"] = { ['name'] = "drafter", ['price'] = 650000, ['tipo'] = "carros",  ['hash'] = GetHashKey("drafter"), ['banned'] = false },
	["deveste"] = { ['name'] = "deveste", ['price'] = 1150000, ['tipo'] = "carros",  ['hash'] = GetHashKey("deveste"), ['banned'] = false },
	["komoda"] = { ['name'] = "komoda", ['price'] = 450000, ['tipo'] = "carros",  ['hash'] = GetHashKey("komoda"), ['banned'] = false },
	["imorgon"] = { ['name'] = "imorgon", ['price'] = 550000, ['tipo'] = "carros",  ['hash'] = GetHashKey("imorgon"), ['banned'] = false },
	["issi7"] = { ['name'] = "issi7", ['price'] = 850000, ['tipo'] = "carros",  ['hash'] = GetHashKey("issi7"), ['banned'] = false },
	["jugular"] = { ['name'] = "jugular", ['price'] = 750000, ['tipo'] = "carros",  ['hash'] = GetHashKey("jugular"), ['banned'] = false },
	["locust"] = { ['name'] = "locust", ['price'] = 1350000, ['tipo'] = "carros",  ['hash'] = GetHashKey("locust"), ['banned'] = false },
	["neo"] = { ['name'] = "neo", ['price'] = 1050000, ['tipo'] = "carros",  ['hash'] = GetHashKey("neo"), ['banned'] = false },
	["paragon"] = { ['name'] = "paragon", ['price'] = 850000, ['tipo'] = "carros",  ['hash'] = GetHashKey("paragon"), ['banned'] = false },
	["penumbra2"] = { ['name'] = "penumbra2", ['price'] = 850000, ['tipo'] = "carros",  ['hash'] = GetHashKey("penumbra2"), ['banned'] = false },
	["sultan2"] = { ['name'] = "sultan2", ['price'] = 550000, ['tipo'] = "carros",  ['hash'] = GetHashKey("sultan2"), ['banned'] = false },
	["vstr"] = { ['name'] = "vstr", ['price'] = 750000, ['tipo'] = "carros",  ['hash'] = GetHashKey("vstr"), ['banned'] = false },
	["italirsx"] = { ['name'] = "italirsx", ['price'] = 1550000, ['tipo'] = "carros",  ['hash'] = GetHashKey("italirsx"), ['banned'] = false },
	["zr350"] = { ['name'] = "zr350", ['price'] = 1350000, ['tipo'] = "carros",  ['hash'] = GetHashKey("zr350"), ['banned'] = false },
	--["calico"] = { ['name'] = "calico", ['price'] = 1450000, ['tipo'] = "carros",  ['hash'] = GetHashKey("calico"), ['banned'] = false },
	["euros"] = { ['name'] = "euros", ['price'] = 1450000, ['tipo'] = "carros",  ['hash'] = GetHashKey("euros"), ['banned'] = false },
	["remus"] = { ['name'] = "remus", ['price'] = 450000, ['tipo'] = "carros",  ['hash'] = GetHashKey("remus"), ['banned'] = false },
--	["comet6"] = { ['name'] = "comet6", ['price'] = 1400000, ['tipo'] = "carros",  ['hash'] = GetHashKey("comet6"), ['banned'] = false },
	["growler"] = { ['name'] = "growler", ['price'] = 1400000, ['tipo'] = "carros",  ['hash'] = GetHashKey("growler"), ['banned'] = false },
	["vectre"] = { ['name'] = "vectre", ['price'] = 1000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("vectre"), ['banned'] = false },
	["cypher"] = { ['name'] = "cypher", ['price'] = 1100000, ['tipo'] = "carros",  ['hash'] = GetHashKey("cypher"), ['banned'] = false },
	["sultan3"] = { ['name'] = "sultan3", ['price'] = 700000, ['tipo'] = "carros",  ['hash'] = GetHashKey("sultan3"), ['banned'] = false },
	["rt3000"] = { ['name'] = "rt3000", ['price'] = 700000, ['tipo'] = "carros",  ['hash'] = GetHashKey("rt3000"), ['banned'] = false },

	["dynasty"] = { ['name'] = "dynasty", ['price'] = 500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("dynasty"), ['banned'] = false },
	["fagaloa"] = { ['name'] = "fagaloa", ['price'] = 450000, ['tipo'] = "carros",  ['hash'] = GetHashKey("fagaloa"), ['banned'] = false },
	["nebula"] = { ['name'] = "nebula", ['price'] = 500000, ['tipo'] = "carros",  ['hash'] = GetHashKey("nebula"), ['banned'] = false },
	["furia"] = { ['name'] = "furia", ['price'] = 700000, ['tipo'] = "carros",  ['hash'] = GetHashKey("furia"), ['banned'] = false },
	["emerus"] = { ['name'] = "emerus", ['price'] = 840000, ['tipo'] = "carros",  ['hash'] = GetHashKey("emerus"), ['banned'] = false },
	["krieger"] = { ['name'] = "krieger", ['price'] = 900000, ['tipo'] = "carros",  ['hash'] = GetHashKey("krieger"), ['banned'] = false },
	["sheava"] = { ['name'] = "sheava", ['price'] = 800000, ['tipo'] = "carros",  ['hash'] = GetHashKey("sheava"), ['banned'] = false },
	["thrax"] = { ['name'] = "thrax", ['price'] = 1000000, ['tipo'] = "carros",  ['hash'] = GetHashKey("thrax"), ['banned'] = false },
	["zorrusso"] = { ['name'] = "zorrusso", ['price'] = 1300000, ['tipo'] = "carros",  ['hash'] = GetHashKey("zorrusso"), ['banned'] = false },
}

function vRP.save_idle_custom(player,custom)
	local r_idle = {}
	local user_id = vRP.getUserId(player)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			if data.cloakroom_idle == nil then
				data.cloakroom_idle = custom
			end

			for k,v in pairs(data.cloakroom_idle) do
				r_idle[k] = v
			end
		end
	end
	return r_idle
end

function vRP.removeCloak(player)
	local user_id = vRP.getUserId(player)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			if data.cloakroom_idle ~= nil then
				vRPclient._setCustomization(player,data.cloakroom_idle)
				data.cloakroom_idle = nil
			end
		end
	end
end

--[ VEHICLEGLOBAL ]-------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleGlobal()
	return vehs.vehglobal
end

--[ VEHICLENAME ]---------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleName(vname)
	return vehs.vehglobal[vname].name
end

--[ VEHICLERENTALPRICE ]--------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleRentalPrice(vname)
	return vehs.vehglobal[vname].rentalPrice
end


--[ VEHICLECHEST ]--------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleChest(vname)
	return vehs.vehglobal[vname].mala
end

--[ VEHICLESLOT ]---------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleSlot(vname)
	if vehs.vehglobal[vname].slots == nil then
		return 5
	end
	return vehs.vehglobal[vname].slots
end

--[ VEHICLEPRICE ]--------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehiclePrice(vname)
	return vehs.vehglobal[vname].price
end

--[ VEHICLETYPE ]---------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleType(vname)
	return vehs.vehglobal[vname].tipo
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	["mochila"] = {
		index = "mochila",
		name = "Mochila P",
		type = "use",
		weight = 1.0
	},
	["mochila2"] = {
		index = "mochila2",
		name = "Mochila M",
		type = "use",
		weight = 2.0
	},
	["mochila3"] = {
		index = "mochila3",
		name = "Mochila G",
		type = "use",
		weight = 3.0
	},
	["mochila4"] = {
		index = "mochila4",
		name = "Mochila X",
		type = "use",
		weight = 4.0
	},
	----------------------------------------------
	["dinheiro"] = {
		index = "dinheiro",
		name = "Dinheiro",
		type = "use",
		weight = 0.0
	},
	["dinheirosujo"] = {
		index = "dinheirosujo",
		name = "Dinheiro Sujo",
		type = "use",
		weight = 0.0
	},
	----------------------------------------------

	["ferramenta"] = {
		index = "ferramenta",
		name = "Ferramenta",
		type = "use",
		weight = 2.0
	},
	["encomenda"] = {
		index = "encomenda",
		name = "Encomenda",
		type = "use",
		weight = 1.5
	},
	["garrafavazia"] = {
		index = "garrafavazia",
		name = "Garrafa Vazia",
		type = "use",
		weight = 0.2
	},
	["garrafadeleite"] = {
		index = "garrafadeleite",
		name = "Garrafa de Leite",
		type = "use",
		weight = 0.5
	},
	["alianca"] = {
		index = "alianca",
		name = "Aliança",
		type = "use",
		weight = 0.0
	},
	["bandagem"] = {
		index = "bandagem",
		name = "Bandagem",
		type = "use",
		weight = 0.7
	},
	["cerveja"] = {
		index = "cerveja",
		name = "Cerveja",
		type = "use",
		weight = 0.7
	},
	["tequila"] = {
		index = "tequila",
		name = "Tequila",
		type = "use",
		weight = 0.7
	},

	["roupas"] = {
		index = "roupas",
		name = "Roupas",
		type = "use",
		weight = 0.6
	},
	["oculos"] = {
		index = "oculos",
		name = "Óculos",
		type = "use",
		weight = 0.2
	},
	["mascara"] = {
		index = "mascara",
		name = "Máscara",
		type = "use",
		weight = 0.2
	},
	["couro"] = {
		index = "couro",
		name = "Couro de Animal",
		type = "use",
		weight = 0.2
	},
	["carnecrua"] = {
		index = "carnecrua",
		name = "Carne Crua",
		type = "use",
		weight = 0.2
	},
	["chapeu"] = {
		index = "chapeu",
		name = "Chapéu",
		type = "use",
		weight = 0.2
	},
-------------------------
	["vodka"] = {
		index = "vodka",
		name = "Vodka",
		type = "use",
		weight = 0.7
	},
	["furadeira"] = {
		index = "furadeira",
		name = "Furadeira",
		type = "use",
		weight = 3.0
	},
	["serra"] = {
		index = "serra",
		name = "Serra",
		type = "use",
		weight = 4.0
	},
	["bombaadesiva"] = {
		index = "bombaadesiva",
		name = "Bomba Adesiva",
		type = "use",
		weight = 0.5
	},
	["whisky"] = {
		index = "whisky",
		name = "Whisky",
		type = "use",
		weight = 0.7
	},
	["plantademaconha"] = {
		index = "plantademaconha",
		name = "Pé de Maconha",
		type = "use",
		weight = 0.5
	},
	["cigarrodemaconha"] = {
		index = "cigarrodemaconha",
		name = "Baseado",
		type = "use",
		weight = 0.5
	},
	["cigarro"] = {
		index = "cigarro",
		name = "cigarro",
		type = "use",
		weight = 0.5
	},
	["identidade"] = {
		index = "identidade",
		name = "identidade",
		type = "use",
		weight = 0.0
	},



	["fogosdeartificio"] = {
		index = "fogosdeartificio",
		name = "Caixa de fogos",
		type = "use",
		weight = 1.0
	},
	["garrafaaguavazia"] = {
		index = "garrafaaguavazia",
		name = "Água Vazia",
		type = "use",
		weight = 0.2
	},
	["corda"] = {
		index = "corda",
		name = "Corda",
		type = "use",
		weight = 0.3
	},
	["vape"] = {
		index = "vape",
		name = "vape",
		type = "use",
		weight = 1.0
	},
	["rosa"] = {
		index = "rosa",
		name = "rosa",
		type = "use",
		weight = 0.7
	},

	["isqueiro"] = {
		index = "isqueiro",
		name = "isqueiro",
		type = "use",
		weight = 0.1
	},
	["seda"] = {
		index = "seda",
		name = "seda",
		type = "use",
		weight = 0.1
	},
	["rpprotecao"] = {
		index = "rpprotecao",
		name = "Colete Médico",
		type = "use",
		weight = 1.0
	},
-----------
	["colete1"] = {
		index = "colete1",
		name = "Colete Leve",
		type = "use",
		weight = 0.5
	},
	["colete2"] = {
		index = "colete2",
		name = "Colete Médo",
		type = "use",
		weight = 1.0
	},
	["colete3"] = {
		index = "colete3",
		name = "Colete Pesado",
		type = "use",
		weight = 1.5
	},

	["pecas"] = {
		index = "pecas",
		name = "Peças",
		type = "use",
		weight = 0.5
	},
	["couro"] = {
		index = "couro",
		name = "Couro",
		type = "use",
		weight = 0.5
	},
	["pistao"] = {
		index = "pistao",
		name = "Pistão",
		type = "use",
		weight = 3.0
	},
	["lataria"] = {
		index = "lataria",
		name = "Lataria",
		type = "use",
		weight = 10.0
	},
	["banco"] = {
		index = "banco",
		name = "Banco",
		type = "use",
		weight = 3.0
	},
------
	["notebook"] = {
		index = "notebook",
		name = "Notebook",
		type = "use",
		weight = 2.0
	},
	["notebookroubado"] = {
		index = "notebookroubado",
		name = "Notebook Roubado",
		type = "use",
		weight = 2.0
	},
	["cartao"] = {
		index = "cartao",
		name = "Cartão Limpo",
		type = "use",
		weight = 0.2
	},
	["cartao1"] = {
		index = "cartao1",
		name = "Cartão Clássico Clonado",
		type = "use",
		weight = 0.2
	},
	["cartao2"] = {
		index = "cartao2",
		name = "Cartão Gold Clonado",
		type = "use",
		weight = 0.2
	},
	["cartao3"] = {
		index = "cartao3",
		name = "Cartão Platinium Clonado",
		type = "use",
		weight = 0.2
	},
	["cartao4"] = {
		index = "cartao4",
		name = "Cartão Black Clonado",
		type = "use",
		weight = 0.2
	},
	
	["xerelto"] = {
		index = "xerelto",
		name = "Xerelto",
		type = "use",
		weight = 0.2
	},
	["r-xerelto"] = {
		index = "r-xerelto",
		name = "Receita Xerelto",
		type = "use",
		weight = 0.2
	},
	["comuadin"] = {
		index = "comuadin",
		name = "Comuadin",
		type = "use",
		weight = 0.2
	},
	["r-comuadin"] = {
		index = "r-comuadin",
		name = "Receita Comuadin",
		type = "use",
		weight = 0.2
	},
	["dorflex"] = {
		index = "dorflex",
		name = "Dorflex",
		type = "use",
		weight = 0.2
	},
	["r-dorflex"] = {
		index = "r-dorflex",
		name = "Receita Dorflex",
		type = "use",
		weight = 0.2
	},
	["cicatricure"] = {
		index = "cicatricure",
		name = "Cicatricure",
		type = "use",
		weight = 0.2
	},
	["r-cicatricure"] = {
		index = "r-cicatricure",
		name = "Receita Cicatricure",
		type = "use",
		weight = 0.2
	},
	["raceticket"] = {
		index = "raceticket",
		name = "Ticket de Corrida",
		type = "use",
		weight = 0.2
	},
	["paracetanal"] = {
		index = "paracetanal",
		name = "Paracetanal",
		type = "use",
		weight = 0.2
	},
	["r-paracetanal"] = {
		index = "r-paracetanal",
		name = "Receita Paracetanal",
		type = "use",
		weight = 0.2
	},
	["atestado"] = {
		index = "atestado",
		name = "Atestado Médico",
		type = "use",
		weight = 0.2
	},
	["r-rebite"] = {
		index = "r-rebite",
		name = "Receita Rebite",
		type = "use",
		weight = 0.2
	},

	["radio"] = {
		index = "radio",
		name = "Rádio",
		type = "use",
		weight = 0.1
	},

	["alvejante"] = {
		index = "alvejante",
		name = "Alvejante",
		type = "use",
		weight = 0.2
	},
	["borrifador"] = {
		index = "borrifador",
		name = "Borrifador",
		type = "use",
		weight = 0.2
	},

	["discofreio"] = {
		index = "discofreio",
		name = "Disco de Freio",
		type = "use",
		weight = 1.0
	},
	["motorcarro"] = {
		index = "motorcarro",
		name = "Motor de Carro",
		type = "use",
		weight = 20.0
	},
	["portacarro"] = {
		index = "portacarro",
		name = "Porta de Carro",
		type = "use",
		weight = 1.0
	},
	["volante"] = {
		index = "volante",
		name = "Volante",
		type = "use",
		weight = 1.0
	},
	["parachoque"] = {
		index = "parachoque",
		name = "Parachoque",
		type = "use",
		weight = 1.0
	},
	["ficha"] = {
		index = "ficha",
		name = "Fichas Casino",
		type = "use",
		weight = 0.0
	},
	["ticketroleta"] = {
		index = "ticketroleta",
		name = "Ticket Roleta",
		type = "use",
		weight = 0.0
	},
	["conhaque"] = {
		index = "conhaque",
		name = "Conhaque",
		type = "use",
		weight = 0.7
	},
	["absinto"] = {
		index = "absinto",
		name = "Absinto",
		type = "use",
		weight = 0.7
	},
	["repairkit"] = {
		index = "repairkit",
		name = "Kit de Reparos",
		type = "use",
		weight = 1.0
	},
	["algemas"] = {
		index = "algemas",
		name = "Algemas",
		type = "use",
		weight = 1.0
	},
	["calculadora"] = {
		index = "calculadora",
		name = "calculadora",
		type = "use",
		weight = 0.3
	},
	["cartaodebito"] = {
		index = "cartaodebito",
		name = "Cartão Débito",
		type = "use",
		weight = 0
	},

	["chipvip"] = {
		index = "chipvip",
		name = "Chip VIP",
		type = "use",
		weight = 0.1
	},
	["identidadevip"] = {
		index = "identidadevip",
		name = "Identidade VIP",
		type = "use",
		weight = 0.1
	},
	["smartwatch"] = {
		index = "smartwatch",
		name = "SmartWatch",
		type = "use",
		weight = 0.3
	},
	["celular"] = {
		index = "celular",
		name = "celular",
		type = "use",
		weight = 0.5
	},
	["celularqueimado"] = {
		index = "celularqueimado",
		name = "celular queimado",
		type = "use",
		weight = 0.5
	},

     ["tora"] = {
		index = "tora",
		name = "Tora de madeira",
		type = "use",
		weight = 0.5
	},

	["capuz"] = {
		index = "capuz",
		name = "capuz",
		type = "use",
		weight = 0.5
	},
	["pneu"] = {
		index = "pneu",
		name = "pneu",
		type = "use",
		weight = 1.0
	},
	["lockpick"] = {
		index = "lockpick",
		name = "lockpick",
		type = "use",
		weight = 0.5
	},
	["masterpick"] = {
		index = "masterpick",
		name = "masterpick",
		type = "use",
		weight = 0.5
	},
	["militec"] = {
		index = "militec",
		name = "Militec-1",
		type = "use",
		weight = 0.5
	},


	["laudoteoricocnh"] = {
		index = "laudoteoricocnh",
		name = "Laudo Teórico",
		type = "use",
		weight = 0.2
	},

	["rastreador"] = {
		index = "rastreador",
		name = "rastreador",
		type = "use",
		weight = 0.5
	},
	["croquettes"] = {
		index = "croquettes",
		name = "Ração",
		type = "use",
		weight = 0.05
	},
	["cannabis"] = {
		index = "cannabis",
		name = "cannabis",
		type = "use",
		weight = 0.5
	},
	["anfetamina"] = {
		index = "anfetamina",
		name = "anfetamina",
		type = "use",
		weight = 0.5
	},

	["mouro"] = {
		index = "mouro",
		name = "Ouro",
		type = "use",
		weight = 0.8
	},
	["mferro"] = {
		index = "mferro",
		name = "Ferro",
		type = "use",
		weight = 0.5
	},
	["mbronze"] = {
		index = "mbronze",
		name = "Bronze",
		type = "use",
		weight = 0.3
	},
	["mesmeralda"] = {
		index = "mesmeralda",
		name = "Esmeralda",
		type = "use",
		weight = 0.6
	},
	["TanqueDeOxigenio"] = {
		index = "TanqueDeOxigenio",
		name = "Tanque de Oxigenio",
		type = "use",
		weight = 1.0
	},
	["trajemergulho"] = {
		index = "trajemergulho",
		name = "Traje de Mergulho",
		type = "use",
		weight = 0.5
	},
	["mrubi"] = {
		index = "mrubi",
		name = "Rubi",
		type = "use",
		weight = 0.6
	},
	["diamante"] = {
		index = "diamante",
		name = "diamante",
		type = "use",
		weight = 0.5
	},
	["graosimpuros"] = {
		index = "graosimpuros",
		name = "Grãos impuros",
		type = "use",
		weight = 0.2
	},
	["graos"] = {
		index = "graos",
		name = "Grãos",
		type = "use",
		weight = 0.2
	},

	["agua"] = {
		index = "agua",
		name = "Água",
		type = "use",
		weight = 0.5
	},
	["limonada"] = {
		index = "limonada",
		name = "Limonada",
		type = "use",
		weight = 0.4
	},
	["refrigerante"] = {
		index = "refrigerante",
		name = "refrigerante",
		type = "use",
		weight = 0.4
	},
	["cafe"] = {
		index = "cafe",
		name = "Café",
		type = "use",
		weight = 0.4
	},
	["pao"] = {
		index = "pao",
		name = "Pão",
		type = "use",
		weight = 0.2
	},
	["hotdog"] = {
		index = "hotdog",
		name = "HotDog",
		type = "use",
		weight = 0.3
	},
--------------------------
	["tomate"] = {
		index = "tomate",
		name = "tomate",
		type = "use",
		weight = 0.1
	},
	["hamburguer"] = {
		index = "hamburguer",
		name = "Hamburguer",
		type = "use",
		weight = 0.1
	},
	["xburguer"] = {
		index = "xburguer",
		name = "X-Burguer",
		type = "use",
		weight = 0.4
	},
	["xtudo"] = {
		index = "xtudo",
		name = "X-Tudo",
		type = "use",
		weight = 0.4
	},
	["salsicha"] = {
		index = "salsicha",
		name = "Salsicha",
		type = "use",
		weight = 0.1
	},
	["queijo"] = {
		index = "queijo",
		name = "queijo",
		type = "use",
		weight = 0.1
	},

	["batatinha"] = {
		index = "batatinha",
		name = "Batata Frita",
		type = "use",
		weight = 0.3
	},

	["skate"] = {
		index = "skate",
		name = "Skate",
		type = "use",
		weight = 0.3
	},

	["embalagem"] = {
		index = "embalagem",
		name = "Embalagem",
		type = "use",
		weight = 0.3
	},

	["batata"] = {
		index = "batata",
		name = "Batata",
		type = "use",
		weight = 0.1
	},
	["alface"] = {
		index = "alface",
		name = "alface",
		type = "use",
		weight = 0.1
	},
	["calabresa"] = {
		index = "calabresa",
		name = "Calabresa",
		type = "use",
		weight = 0.1
	},
	["farinha"] = {
		index = "farinha",
		name = "Farinha",
		type = "use",
		weight = 0.1
	},
--------------------------
	["chocolate"] = {
		index = "chocolate",
		name = "Chocolate",
		type = "use",
		weight = 0.2
	},
	["laranja"] = {
		index = "laranja",
		name = "Laranja",
		type = "use",
		weight = 0.2
	},
	["morango"] = {
		index = "morango",
		name = "Morango",
		type = "use",
		weight = 0.2
	},
	["salgadinho"] = {
		index = "salgadinho",
		name = "Salgadinho",
		type = "use",
		weight = 0.2
	},
	["rosquinha"] = {
		index = "rosquinha",
		name = "rosquinha",
		type = "use",
		weight = 0.2
	},
	["pizza"] = {
		index = "pizza",
		name = "Pizza",
		type = "use",
		weight = 0.3
	},

	["sorvete"] = {
		index = "sorvete",
		name = "Sorvete",
		type = "use",
		weight = 0.1
	},

	["coxinha"] = {
		index = "coxinha",
		name = "Coxinha",
		type = "use",
		weight = 0.1
	},

	["paodequeijo"] = {
		index = "paodequeijo",
		name = "Pão de Queijo",
		type = "use",
		weight = 0.1
	},

	["pastel"] = {
		index = "pastel",
		name = "Pastel",
		type = "use",
		weight = 0.1
	},

	["frango"] = {
		index = "frango",
		name = "Frango",
		type = "use",
		weight = 0.1
	},



	["taco"] = {
		index = "taco",
		name = "Taco",
		type = "use",
		weight = 0.3
	},

	["corpo-assaultsmg"] = {
		index = "corpo-assaultsmg",
		name = "Corpo MTAR 21",
		type = "use",
		weight = 0.8
	},
	["corpo-pistolmk2"] = {
		index = "corpo-pistolmk2",
		name = "Corpo Pistola MK2",
		type = "use",
		weight = 0.4
	},
	["corpo-microsmg"] = {
		index = "corpo-microsmg",
		name = "Corpo Micro SMG",
		type = "use",
		weight = 0.8
	},
	["corpo-ak47"] = {
		index = "corpo-ak47",
		name = "Corpo AK-47",
		type = "use",
		weight = 0.8
	},
	["corpo-mp5"] = {
		index = "corpo-mp5",
		name = "Corpo MP5",
		type = "use",
		weight = 0.8
	},
	["corpo-revolver"] = {
		index = "corpo-revolver",
		name = "Corpo Revolver",
		type = "use",
		weight = 0.4
	},
	["corpo-thompson"] = {
		index = "corpo-thompson",
		name = "Corpo Thompson",
		type = "use",
		weight = 0.8
	},
	["placademetal"] = {
		index = "placademetal",
		name = "Placa de Metal",
		type = "use",
		weight = 0.6
	},
	["mola"] = {
		index = "mola",
		name = "mola",
		type = "use",
		weight = 0.2
	},
	["gatilho"] = {
		index = "gatilho",
		name = "gatilho",
		type = "use",
		weight = 0.2
	},
	["capsula"] = {
		index = "capsula",
		name = "capsula",
		type = "use",
		weight = 0.1
	},
	["polvora"] = {
		index = "polvora",
		name = "polvora",
		type = "use",
		weight = 0.05
	},
	["carbono"] = {
		index = "carbono",
		name = "carbono",
		type = "use",
		weight = 0.0038
	},
	["ferro"] = {
		index = "ferro",
		name = "ferro",
		type = "use",
		weight = 0.0038
	},
	["aco"] = {
		index = "aco",
		name = "Aço",
		type = "use",
		weight = 0.0015
	},
	["pecadearma"] = {
		index = "pecadearma",
		name = "Peças de Armas",
		type = "use",
		weight = 0.0015
	},

	["isca"] = {
		index = "isca",
		name = "isca",
		type = "use",
		weight = 0.6
	},

	["vara"] = {
		index = "vara",
		name = "vara",
		type = "use",
		weight = 0.6
	},
	["dourado"] = {
		index = "dourado",
		name = "dourado",
		type = "use",
		weight = 0.6
	},
	["corvina"] = {
		index = "corvina",
		name = "corvina",
		type = "use",
		weight = 0.3
	},
	["salmao"] = {
		index = "salmao",
		name = "salmao",
		type = "use",
		weight = 0.35
	},
	["pacu"] = {
		index = "pacu",
		name = "pacu",
		type = "use",
		weight = 0.3
	},
	["pintado"] = {
		index = "pintado",
		name = "pintado",
		type = "use",
		weight = 0.3
	},
	["pirarucu"] = {
		index = "pirarucu",
		name = "pirarucu",
		type = "use",
		weight = 0.4
	},
	["tilapia"] = {
		index = "tilapia",
		name = "tilapia",
		type = "use",
		weight = 0.3
	},
	["tucunare"] = {
		index = "tucunare",
		name = "tucunare",
		type = "use",
		weight = 0.4
	},
	["lambari"] = {
		index = "lambari",
		name = "lambari",
		type = "use",
		weight = 0.6
	},

	["energetico"] = {
		index = "energetico",
		name = "energético",
		type = "use",
		weight = 0.3
	},

	["suspensaoar"] = {
		index = "suspensaoar",
		name = "Suspensão a Ar",
		type = "use",
		weight = 3.0
	},
	["moduloxenon"] = {
		index = "moduloxenon",
		name = "Módulo de Xenon",
		type = "use",
		weight = 1.0
	},
	["moduloneon"] = {
		index = "moduloneon",
		name = "Módulo de Neon",
		type = "use",
		weight = 1.0
	},

	["coquetelvanilla"] = {
		index = "coquetelvanilla",
		name = "Coquetel Laranja",
		type = "use",
		weight = 0.3
	},
	["coquetelvanilla2"] = {
		index = "coquetelvanilla2",
		name = "Coquetel Morango",
		type = "use",
		weight = 0.3
	},
	["adubo"] = {
		index = "adubo",
		name = "adubo",
		type = "use",
		weight = 0.8
	},
	["maconha"] = {
		index = "maconha",
		name = "maconha",
		type = "use",
		weight = 0.5
	},

	["ziplockmaconha"] = {
		index = "ziplockmaconha",
		name = "Maconha no ziplock",
		type = "use",
		weight = 0.7
	},
	["ziplockmeta"] = {
		index = "ziplockmeta",
		name = "Metafentamina no ziplock",
		type = "use",
		weight = 0.7
	},
	["ziplockcocaina"] = {
		index = "ziplockcocaina",
		name = "Cocaina no ziplock",
		type = "use",
		weight = 0.7
	},

	["ziplock"] = {
		index = "ziplock",
		name = "Ziplock",
		type = "use",
		weight = 0.1
	},

	["placa"] = {
		index = "placa",
		name = "placa",
		type = "use",
		weight = 0.8
	},
	["rebite"] = {
		index = "rebite",
		name = "rebite",
		type = "use",
		weight = 0.8
	},


	["orgao"] = {
		index = "orgao",
		name = "Órgão",
		type = "use",
		weight = 1.0
	},
	["orgaoamassado"] = {
		index = "orgaoamassado",
		name = "Órgão Amassado",
		type = "use",
		weight = 1.0
	},

	["tartaruga"] = {
		index = "tartaruga",
		name = "tartaruga",
		type = "use",
		weight = 2.0
	},
	["carnedetartaruga"] = {
		index = "carnedetartaruga",
		name = "Carne de Tartaruga",
		type = "use",
		weight = 1.0
	},
	["pecaeletronica"] = {
		index = "pecaeletronica",
		name = "Peças Eletronica",
		type = "use",
		weight = 0.5
	},
	["computadormontado"] = {
		index = "computadormontado",
		name = "Computador Montado",
		type = "use",
		weight = 2.0
	},
	["identidadedigital"] = {
		index = "identidadedigital",
		name = "Identidade Digital",
		type = "use",
		weight = 0.09
	},
	["identidadefisica"] = {
		index = "identidadefisica",
		name = "Identidade Física",
		type = "use",
		weight = 0.5
	},

	["ouro"] = {
		index = "ouro",
		name = "Pepita Ouro",
		type = "use",
		weight = 0.5
	},
	["ferro2"] = {
		index = "ferro2",
		name = "Pepita Ferro",
		type = "use",
		weight = 0.5
	},
	["diamante2"] = {
		index = "diamante2",
		name = "Pepita Diamante",
		type = "use",
		weight = 0.5
	},
	["tecido"] = {
		index = "tecido",
		name = "tecido",
		type = "use",
		weight = 0.5
	},
	["lingerie"] = {
		index = "lingerie",
		name = "lingerie",
		type = "use",
		weight = 1.0
	},
	["pano"] = {
		index = "pano",
		name = "pano",
		type = "use",
		weight = 0.5
	},
	["linha"] = {
		index = "linha",
		name = "linha",
		type = "use",
		weight = 0.3
	},
	["fibra"] = {
		index = "fibra",
		name = "fibra",
		type = "use",
		weight = 0.3
	},
	["etiqueta"] = {
		index = "etiqueta",
		name = "etiqueta",
		type = "use",
		weight = 0.2
	},
	["pendrive"] = {
		index = "pendrive",
		name = "pendrive",
		type = "use",
		weight = 0.2
	},
	["relogioroubado"] = {
		index = "relogioroubado",
		name = "Relógio Roubado",
		type = "use",
		weight = 0.2
	},

	["pulseiraroubada"] = {
		index = "pulseiraroubada",
		name = "Pulseira Roubado",
		type = "use",
		weight = 0.2
	},

	["colarroubado"] = {
		index = "colarroubado",
		name = "colar Roubado",
		type = "use",
		weight = 0.2
	},

	["brincoroubado"] = {
		index = "brincoroubado",
		name = "brinco Roubado",
		type = "use",
		weight = 0.2
	},

	["carteiraroubada"] = {
		index = "carteiraroubada",
		name = "carteira Roubada",
		type = "use",
		weight = 0.2
	},

	["carregadorroubado"] = {
		index = "carregadorroubado",
		name = "carregador Roubado",
		type = "use",
		weight = 0.2
	},

	["tabletroubado"] = {
		index = "tabletroubado",
		name = "tablet Roubado",
		type = "use",
		weight = 0.2
	},

	["sapatosroubado"] = {
		index = "sapatosroubado",
		name = "sapatos Roubado",
		type = "use",
		weight = 0.2
	},

	["nitro"] = {
		index = "nitro",
		name = "nitro",
		type = "use",
		weight = 0.2
	},

	["vibradorroubado"] = {
		index = "vibradorroubado",
		name = "vibrador Roubado",
		type = "use",
		weight = 0.2
	},

	["perfumeroubado"] = {
		index = "perfumeroubado",
		name = "perfume Roubado",
		type = "use",
		weight = 0.2
	},

	["maquiagemroubada"] = {
		index = "maquiagemroubada",
		name = "maquiagem Roubado",
		type = "use",
		weight = 0.2
	},

	["anelroubado"] = {
		index = "anelroubado",
		name = "anel Roubado",
		type = "use",
		weight = 0.2
	},

	["metanfetamina"] = {
		index = "metanfetamina",
		name = "metanfetamina",
		type = "use",
		weight = 0.5
	},
	["cocaina"] = {
		index = "cocaina",
		name = "cocaina",
		type = "use",
		weight = 0.5
	},
---------------------------------
-----------------------------------------------------------------
------------------------------------
	["wbody|WEAPON_KNIFE"] = { --
		index = "faca",
		name = "Faca",
		type = "equip",
		weight = 0.50
	},
	["wbody|WEAPON_HATCHET"] = { --
		index = "machado",
		name = "Machado",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_BAT"] = { --
		index = "beisebol",
		name = "Bastão de Beisebol",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_BATTLEAXE"] = { --
		index = "batalha",
		name = "Machado de Batalha",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_BOTTLE"] = { --
		index = "garrafa",
		name = "Garrafa",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_CROWBAR"] = { --
		index = "cabra",
		name = "Pé de Cabra",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_DAGGER"] = { --o
		index = "adaga",
		name = "Adaga",
		type = "equip",
		weight = 0.50
	},
	["wbody|WEAPON_GOLFCLUB"] = { --
		index = "golf",
		name = "Taco de Golf",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_HAMMER"] = { --
		index = "martelo",
		name = "Martelo",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_MACHETE"] = { --
		index = "machete",
		name = "Facão",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_POOLCUE"] = { --
		index = "sinuca",
		name = "Taco de Sinuca",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_STONE_HATCHET"] = { --
		index = "pedra",
		name = "Machado de Pedra",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_SWITCHBLADE"] = { --
		index = "canivete",
		name = "Canivete",
		type = "equip",
		weight = 0.50
	},
	["wbody|WEAPON_WRENCH"] = { --
		index = "grifo",
		name = "Chave Inglesa",
		type = "equip",
		weight = 0.75
	},
	["wbody|WEAPON_KNUCKLE"] = { --
		index = "ingles",
		name = "Soco Inglês",
		type = "equip",
		weight = 0.50
	},
	["wbody|WEAPON_FLASHLIGHT"] = { --
		index = "lanterna",
		name = "Lanterna",
		type = "equip",
		weight = 0.50
	},
	["wbody|WEAPON_NIGHTSTICK"] = { --
		index = "cassetete",
		name = "Cassetete",
		type = "equip",
		weight = 0.75
	},



	["wbody|WEAPON_RAYPISTOL"] = {
		index = "raypistol",
		name = "Raypistol",
		type = "equip",
		weight = 0.1
	},


	["wbody|WEAPON_PISTOL"] = {
		index = "m1911",
		name = "M1911",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.25
	},

	["wbody|WEAPON_COMBATPISTOL"] = {
		index = "glock",
		name = "Glock 19",
		type = "equip",
		ammo = "wammo|WEAPON_COMBATPISTOL",
		weight = 1.25
	},

	["wammo|WEAPON_COMBATPISTOL"] = {
		index = "pistolammo",
		name = "M.Glock 19",
		type = "recharge",
		weight = 0.02
	},

	["wammo|WEAPON_APPISTOL"] = {
		index = "pistolammo",
		name = "M.Koch VP9",
		type = "recharge",
		weight = 0.02
	},

	["wammo|WEAPON_PISTOL"] = {
		index = "pistolammo",
		name = "M.M1911",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_PISTOL_MK2"] = {
		index = "pistolammo",
		name = "M.FN Five Seven",
		type = "recharge",
		weight = 0.02
	},

	["wammo|WEAPON_PISTOL50"] = {
		index = "pistolammo",
		name = "M.Desert Eagle",
		type = "recharge",
		weight = 0.02
	},

	["wammo|WEAPON_STUNGUN"] = {
		index = "m-taser",
		name = "M.Taser",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_SNSPISTOL"] = {
		index = "pistolammo",
		name = "M.AMT 380",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_VINTAGEPISTOL"] = {
		index = "pistolammo",
		name = "M.M1922",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_REVOLVER"] = {
		index = "pistolammo",
		name = "M.Magnum 44",
		type = "recharge",
		weight = 0.02
	},

	["wammo|WEAPON_MUSKET"] = {
		index = "sniperammo",
		name = "M.Winchester 22",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_MICROSMG"] = {
		index = "smgammo",
		name = "M.Uzi",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_SMG"] = {
		index = "smgammo",
		name = "M.MP5",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_ASSAULTSMG"] = {
		index = "smgammo",
		name = "M.MTAR-21",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_MACHINEPISTOL"] = {
		index = "smgammo",
		name = "M.Tec-9",
		type = "recharge",
		weight = 0.02
	},

	["wammo|WEAPON_CARBINERIFLE"] = {
		index = "rifleammo",
		name = "M.M4A1",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_ASSAULTRIFLE"] = {
		index = "rifleammo",
		name = "M.AK-47",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_GUSENBERG"] = {
		index = "rifleammo",
		name = "M.Thompson",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_COMPACTRIFLE"] = {
		index = "rifleammo",
		name = "M.Tec",
		type = "recharge",
		weight = 0.02
	},
	["wammo|WEAPON_SPECIALCARBINE"] = {
		index = "rifleammo",
		name = "M.Parafall",
		type = "recharge",
		weight = 0.02
	},



	

	["wbody|WEAPON_PISTOL_MK2"] = {
		index = "fiveseven",
		name = "FN Five Seven",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.50
	},
	["WEAPON_COMPACTRIFLE"] = {
		index = "akcompact",
		name = "AK Compact",
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 2.25
	},
	["wbody|WEAPON_APPISTOL"] = {
		index = "appistol",
		name = "Koch Vp9",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.25
	},
	["WEAPON_HEAVYPISTOL"] = {
		index = "atifx45",
		name = "Ati FX45",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.50
	},
	["wbody|WEAPON_MACHINEPISTOL"] = {
		index = "tec9",
		name = "Tec-9",
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 1.75
	},
	["wbody|WEAPON_MICROSMG"] = {
		index = "uzi",
		name = "Uzi",
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 1.25
	},
	["WEAPON_MINISMG"] = {
		index = "skorpionv61",
		name = "Skorpion V61",
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 1.75
	},
	["wbody|WEAPON_SNSPISTOL"] = {
		index = "amt380",
		name = "AMT 380",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.0
	},
	["wbody|WEAPON_SNSPISTOL_MK2"] = {
		index = "hkp7m10",
		name = "HK P7M10",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.0
	},
	["wbody|WEAPON_VINTAGEPISTOL"] = {
		index = "m1922",
		name = "M1922",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.0
	},
	["wbody|WEAPON_PISTOL50"] = {
		index = "desert",
		name = "Desert Eagle",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.50
	},
	["wbody|WEAPON_REVOLVER"] = {
		index = "magnum44",
		name = "Magnum 44",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.50
	},

	["wbody|WEAPON_MUSKET"] = {
		index = "winchester22",
		name = "Winchester 22",
		type = "equip",
		ammo = "wammo|WEAPON_MUSKET",
		weight = 1.50
	},

	["wbody|WEAPON_CARBINERIFLE"] = {
		index = "m4a1",
		name = "M4A1",
		type = "equip",
		ammo = "WEAPON_RIFLE_AMMO",
		weight = 8.0
	},
	["wbody|WEAPON_SPECIALCARBINE"] = { --
		index = "parafall",
		name = "PARAFALL",
		type = "equip",
		ammo = "WEAPON_RIFLE_AMMO",
		weight = 8.0
	},
	["wbody|WEAPON_PUMPSHOTGUN"] = {
		index = "remington",
		name = "Remington",
		type = "equip",
		ammo = "WEAPON_SHOTGUN_AMMO",
		weight = 6.0
	},
	["wbody|WEAPON_PUMPSHOTGUN_MK2"] = {
		index = "remington870",
		name = "Remington 870",
		type = "equip",
		ammo = "WEAPON_SHOTGUN_AMMO",
		weight = 6.0
	},
	["wbody|WEAPON_SAWNOFFSHOTGUN"] = {
		index = "mossberg590",
		name = "Mossberg 590",
		type = "equip",
		ammo = "WEAPON_SHOTGUN_AMMO",
		weight = 6.0
	},
	["wbody|WEAPON_SMG"] = {
		index = "mp5",
		name = "MP5",
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 4.0
	},
	["wbody|WEAPON_ASSAULTRIFLE"] = {
		index = "ak47",
		name = "AK-47",
		type = "equip",
		ammo = "WEAPON_RIFLE_AMMO",
		weight = 8.0
	},
	-------------- pacotes de munição-----------
	["P-WEAPON_ASSAULTRIFLE"] = {
		index = "m-ak47",
		name = "Pacote M.Ak103",
		type = "use",
		weight = 0.6
	},
	["P-WEAPON_PISTOL_MK2"] = {
		index = "m-pistolmk2",
		name = "Pacote M.Pistol MK2",
		type = "use",
		weight = 0.6
	},
	["P-WEAPON_ASSAULTSMG"] = {
		index = "m-mtar21",
		name = "Pacote M.MTAR 21",
		type = "use",
		weight = 0.6
	},
	["P-WEAPON_MICROSMG"] = {
		index = "m-uzi",
		name = "Pacote M.Uzi",
		type = "use",
		weight = 0.6
	},
	["P-WEAPON_SMG"] = {
		index = "m-mp5",
		name = "Pacote M.MP5",
		type = "use",
		weight = 0.6
	},
	["P-WEAPON_REVOLVER"] = {
		index = "m-magnum44",
		name = "Pacote M.Magnum 44",
		type = "use",
		weight = 0.6
	},
	["P-WEAPON_GUSENBERG"] = {
		index = "m-thompson",
		name = "Pacote M.Thompson",
		type = "use",
		weight = 0.6
	},
	------------------------------------

	["wbody|WEAPON_ASSAULTRIFLE_MK2"] = {
		index = "ak74",
		name = "AK-74",
		type = "equip",
		ammo = "WEAPON_RIFLE_AMMO",
		weight = 8.0
	},
	["wbody|WEAPON_ASSAULTSMG"] = {
		index = "mtar21",
		name = "MTAR-21",
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 5.0
	},
	["WEAPON_COMBATPDW"] = {
		index = "sigsauer",
		name = "Sig Sauer MPX",
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 5.0
	},
	["wbody|WEAPON_GUSENBERG"] = {
		index = "thompson",
		name = "Thompson",
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 6.0
	},
	["wbody|WEAPON_PETROLCAN"] = { --
		index = "combustivel",
		name = "Galão",
		type = "equip",
		ammo = "WEAPON_PETROLCAN_AMMO",
		weight = 1.25
	},
	["GADGET_PARACHUTE"] = { --
		index = "paraquedas",
		name = "Paraquedas",
		type = "use",
		weight = 2.25
	},
	["wbody|WEAPON_STUNGUN"] = { --
		index = "stungun",
		name = "Tazer",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_FIREEXTINGUISHER"] = { --
		index = "extinguisher",
		name = "Extintor",
		type = "equip",
		weight = 2.25
	},

	["WEAPON_PISTOL_AMMO"] = {
		index = "pistolammo",
		name = "M. Pistola",
		type = "recharge",
		weight = 0.02
	},
	["WEAPON_SMG_AMMO"] = {
		index = "smgammo",
		name = "M. Sub Metralhadora",
		type = "recharge",
		weight = 0.03
	},
	["WEAPON_RIFLE_AMMO"] = {
		index = "rifleammo",
		name = "M. Rifle",
		type = "recharge",
		weight = 0.04
	},
	["WEAPON_SHOTGUN_AMMO"] = {
		index = "shotgunammo",
		name = "M. Escopeta",
		type = "recharge",
		weight = 0.05
	},
	["WEAPON_PETROLCAN_AMMO"] = {
		index = "fuel",
		name = "Combustível",
		type = "recharge",
		weight = 0.001
	}
}

function vRP.getItemDefinition(item)
	if itemlist[item] then
		return vRP.itemNameList(item),vRP.itemWeightList(item)
	end
	return nil,nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATE:ADVTOOLBOX
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ for i = 1,99 do
	itemlist["toolboxes"..i] = {
		index = "toolbox",
		name = "+ Caixa de Ferramentas",
		type = "use",
		weight = 5.0
	}
end ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBODYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemBodyList(item)
	if itemlist[item] then
		return itemlist[item]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMINDEXLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemIndexList(item)
	if itemlist[item] then
		return itemlist[item].index
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMNAMELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemNameList(item)
	if itemlist[item] then
		return itemlist[item].name
	end
	return "Deleted"
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTYPELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemTypeList(item)
	if itemlist[item] then
		return itemlist[item].type
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMAMMOLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemAmmoList(item)
	if itemlist[item] then
		return itemlist[item].ammo
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMWEIGHTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemWeightList(item)
	if itemlist[item] then
		return itemlist[item].weight
	end
	return 0
end

function vRP.getItemWeight(item)
	if itemlist[item] then
		return itemlist[item].weight
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPUTEINVWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.computeInvWeight(user_id)
	local weight = 0
	local inventory = vRP.getInventory(user_id)
	if inventory then
		for k,v in pairs(inventory) do
			if vRP.itemBodyList(v.item) then
				weight = weight + vRP.itemWeightList(v.item) * parseInt(v.amount)
			end
		end
		return weight
	end
	return 0
end

function vRP.getInventoryWeight(user_id)
	local weight = 0
	local inventory = vRP.getInventory(user_id)
	if inventory then
		for k,v in pairs(inventory) do
			if vRP.itemBodyList(v.item) then
				weight = weight + vRP.itemWeightList(v.item) * parseInt(v.amount)
			end
		end
		return weight
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPUTECHESTWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.computeChestWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		if vRP.itemBodyList(k) then
			weight = weight + vRP.itemWeightList(k) * parseInt(v.amount)
		end
	end
	return weight
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETINVENTORYITEMAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getUserDataTable(user_id)
	local quantidade = 0
	if data and data.inventory then
		for k,v in pairs(data.inventory) do
			if v.item == idname then
				quantidade = parseInt(quantidade) + parseInt(v.amount)
			end
		end
		return quantidade
	end
	return 0
end

function vRP.computeItemsWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		local iweight = vRP.getItemWeight(v.item)
		weight = weight+iweight*v.amount
	end
	return weight
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SWAPSLOT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.swapSlot(user_id,slot,target)
	local data = vRP.getInventory(user_id)
	if data then
		local temp = data[tostring(slot)]
		data[tostring(slot)] = data[tostring(target)]
		data[tostring(target)] = temp
	end
end
--[[-----------------------------------------------------------------------------------------------------------------------------------------
-- MAXITEMS
-----------------------------------------------------------------------------------------------------------------------------------------
local maxItems = {
	["water"] = 5,
	["hamburger"] = 5,
	["donut"] = 5,
	["hotdog"] = 5
}--]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function returnList(item)
	if itemlist[item] ~= nil then
		return itemlist[item]
	end
end

function vRP.giveInventoryItem(user_id,idname,amount,notify,slot)
	local amount = parseInt(amount)
	local inventory = vRP.getUserDataTable(user_id)
	local data = inventory.inventory
	local stop = false
	local newSlotPlayer = 0

	if data and amount > 0 then
		if tostring(slot) == tostring('true') or  tostring(slot) == tostring('false') then
			slot = nil
		end
		if idname then
			if slot then
				if data[tostring(slot)] == nil then
					data[tostring(slot)] = { item = idname, amount = parseInt(amount) }
				else
					if idname == data[tostring(slot)].item then
						data[tostring(slot)].amount = parseInt(data[slot].amount) + parseInt(amount)
					end
				end


				--notify
			if true and vRP.itemBodyList(idname) then
				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
			end

			else
				for k,v in pairs(inventory.inventory) do
					if v.item == idname then
						local slot = k
						data[tostring(slot)].amount = parseInt(data[slot].amount) + parseInt(amount)
						stop = true
						break
					end
				end
	
				if stop == false then
					repeat
						newSlotPlayer = newSlotPlayer + 1
					until data[tostring(newSlotPlayer)] == nil or (data[tostring(newSlotPlayer)] and data[tostring(newSlotPlayer)].item == idname)
					newSlotPlayer = tostring(newSlotPlayer)
					data[tostring(newSlotPlayer)] = { item = idname, amount = parseInt(amount) }
				end

				--notify
				if true and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYGETINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ function vRP.tryGetInventoryItem(user_id, itemName, amount, slot)
    if type(slot) ~= "number" then
        slot = nil
    end

    local dataTable = vRP.getUserDataTable(user_id)
    if dataTable and dataTable.inventory then
        local playerInventory = dataTable.inventory
        if slot then
            slot = tostring(slot)
            if playerInventory[slot] then
                if playerInventory[slot].item == itemName then
                    if playerInventory[slot].amount >= amount then
                        if playerInventory[slot].amount == amount then
                            playerInventory[slot] = nil
                        else
                            playerInventory[slot].amount = (playerInventory[slot].amount - amount)
                        end
                        return true
                    end
                end
            end
        else
            if vRP.getInventoryItemAmount(user_id, itemName) < amount then 
                return false 
            end

            local totalQuantity = 0
            for k,v in pairs(playerInventory) do
                if v.item == itemName then
                    totalQuantity = totalQuantity + v.amount                    
                    if totalQuantity >= amount then
                        playerInventory[k].amount = (totalQuantity - amount)
                        if totalQuantity == amount then
                            playerInventory[k] = nil
                        end
                        return true
                    else
                        playerInventory[k] = nil
                    end
                end
            end
        end
    end
    return false
end ]]

function vRP.tryGetInventoryItem(user_id,idname,amount,notify,slot)
	local table = vRP.getUserDataTable(user_id)
	local data = table.inventory
	local paraTry = false
	if tostring(slot) == tostring('true') or  tostring(slot) == tostring('false') then
		slot = nil
	end
	if slot then
		local slot = tostring(slot)
		if data[slot] then
			if data[slot].amount >= parseInt(amount) then
				data[slot].amount = parseInt(data[slot].amount) - parseInt(amount) -- Tira o amount tendo o slot
				if parseInt(data[tostring(slot)].amount) <= 0 then
					data[tostring(slot)] = nil
				end -- Verifica se é nulo
				return true
			else
				return false
			end
		end
	
	elseif not slot then
		for k,v in pairs(data) do
		
			if tostring(v.item) == tostring(idname) then
				local slotRemove = tostring(k)
			
				if parseInt(data[slotRemove].amount) >=  parseInt(amount) then
				--	print(slotRemove)
					data[slotRemove].amount = parseInt(data[slotRemove].amount) - parseInt(amount) -- Tira o amount

					if parseInt(data[tostring(slotRemove)].amount) <= 0 then
						data[tostring(slotRemove)] = nil
					end -- Verifica se é nulo
					paraTry = true

						--notify
						if true and vRP.itemBodyList(idname) then
							TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVIDO",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
						end

					return true
				else
					return false
				end
				if paraTry == true then
					break
				end
			end
		end
	end
end

function vRP.delteItem(user_id,idname)
	local table = vRP.getUserDataTable(user_id)
	local data = table.inventory
	for k,v in pairs(data) do
		if tostring(v.item) == tostring(idname) then
			data[tostring(k)] = nil
		end
	end
end

function vRP.updateItens(user_id,idname)
	local table = vRP.getUserDataTable(user_id)
	local data = table.inventory
	for k,v in pairs(data) do
		if tostring(k) == tostring(idname) then
			data[tostring(idname)] = nil
			return true
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.removeInventoryItem(user_id,idname,amount,notify)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
				v.amount = parseInt(v.amount) - parseInt(amount)

				if parseInt(v.amount) <= 0 then
					data[k] = nil
				end

				--notify
				if true and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVIDO",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end
			

				break
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEDURABILITY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.createDurability(itemName)
	local advFile = LoadResourceFile("logsystem","toolboxes.json")
	local advDecode = json.decode(advFile)

	if advDecode[itemName] then
		advDecode[itemName] = advDecode[itemName] - 1

		if advDecode[itemName] <= 0 then
			advDecode[itemName] = nil
			vRP.removeInventoryItem(user_id,itemName,1,true)
		end
	else
		advDecode[itemName] = 9
	end

	SaveResourceFile("logsystem","toolboxes.json",json.encode(advDecode),-1)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVED
-----------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
local activedAmount = {}
Citizen.CreateThread(function()
	while true do
		local slyphe = 500
		if actived then
			slyphe = 100
			for k,v in pairs(actived) do
				if actived[k] > 0 then
					actived[k] = v - 1
					if actived[k] <= 0 then
						actived[k] = nil
					end
				end
			end
		end
		Citizen.Wait(slyphe)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARLOGS
-----------------------------------------------------------------------------------------------------------------------------------------
local policeLogs = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYCHESTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.tryChestItem(user_id,chestData,itemName,amount,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		if data and items ~= nil then
			if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then

				if parseInt(amount) > 0 then
					activedAmount[user_id] = parseInt(amount)
				else
					activedAmount[user_id] = parseInt(items[itemName].amount)
				end

				local new_weight = vRP.computeInvWeight(user_id) + vRP.itemWeightList(itemName) * parseInt(activedAmount[user_id])
				if new_weight <= vRP.getBackpack(user_id) then
					vRP.giveInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot)

					items[itemName].amount = parseInt(items[itemName].amount) - parseInt(activedAmount[user_id])

					if chestData == "chest:Police" then
						vRP.createWeebHook(policeLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if parseInt(items[itemName].amount) <= 0 then
						items[itemName] = nil
					end

					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAR INV
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("clearInventory")
AddEventHandler("clearInventory", function()
    local source = source
	local user_id = vRP.getUserId(source)
	
    if user_id then
        local data = vRP.getUserDataTable(user_id)
        if data then
            data.inventory = {}
        end

        vRP.varyThirst(user_id, -25)
		vRP.varyHunger(user_id, -25)
        vRPclient._clearWeapons(source)
        vRPclient._setHandcuffed(source, false)
		vRP.giveInventoryItem(user_id,"identidade",1)
		
		if not vRP.hasPermission(user_id,"mochila.permissao") then
			vRP.setBackpack(user_id,5)
       		vRP.setExp(user_id, "physical", "strength", 20)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORECHESTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.storeChestItem(user_id,chestData,itemName,amount,chestWeight,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local slot = tostring(slot)
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		if data and items ~= nil then

			if parseInt(amount) > 0 then
				activedAmount[user_id] = parseInt(amount)
			else
				local inv = vRP.getInventory(user_id)
				if inv[slot] then
					activedAmount[user_id] = parseInt(inv[slot].amount)
				end
			end

			local new_weight = vRP.computeChestWeight(items) + vRP.itemWeightList(itemName) * parseInt(activedAmount[user_id])
			if new_weight <= chestWeight then
				if vRP.tryGetInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot) then
					if items[itemName] ~= nil then
						items[itemName].amount = parseInt(items[itemName].amount) + parseInt(activedAmount[user_id])
					else
						items[itemName] = { amount = parseInt(activedAmount[user_id]) }
					end

					if chestData == "chest:Police" then
						vRP.createWeebHook(policeLogs,"```PASSAPORTE: "..user_id.." ( GUARDOU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end

function vRP.updateSlot(user_id,item,oldSlot,newSlot,amount)
	local inventory = vRP.getUserDataTable(user_id)
	local data = inventory.inventory
	if data and parseInt(amount) > -1 then
		local amountTotal = vRP.getInventoryItemAmountSlot(user_id,tostring(newSlot))
		local amountTotalAntiga = vRP.getInventoryItemAmountSlot(user_id,tostring(oldSlot))

		if data[tostring(newSlot)] then
			local entrada = data[tostring(newSlot)]
			if entrada.item == item then
				local fixo = vRP.getInventoryItemAmountSlot(user_id,tostring(newSlot))
				if parseInt(amount) <= parseInt(amountTotalAntiga) then
					data[tostring(oldSlot)].amount = parseInt(amountTotalAntiga) - parseInt(amount)
					data[tostring(newSlot)].amount = parseInt(amount) + parseInt(fixo)
				end
				if parseInt(data[tostring(oldSlot)].amount) <= 0 then
					data[tostring(oldSlot)] = nil
				end
			end
		else
			if parseInt(amountTotalAntiga) == parseInt(amount) then
				local temp = data[tostring(oldSlot)]
				data[tostring(oldSlot)] = data[tostring(newSlot)]
				data[tostring(newSlot)] = temp
			elseif parseInt(amountTotalAntiga) ~= parseInt(amount) then
				if parseInt(amount) <= parseInt(amountTotalAntiga) then
					data[tostring(oldSlot)].amount = parseInt(amountTotalAntiga) - parseInt(amount)
					data[tostring(newSlot)] = { item = item, amount = parseInt(amount) }
				end
			end
		end

	end
end

function vRP.getInventoryItemAmountSlot(user_id,slot)
	local data = vRP.getUserDataTable(user_id)
	if data and data.inventory then
		local item = data.inventory[slot]
		if item then
			return item.amount
		end
	end
	return 0
end

AddEventHandler("vRP:playersJoin", function(user_id,source,name)
	local data = vRP.getUserDataTable(user_id)
	if not data.inventory then
		data.inventory = {}
	end
end)
function vRP.ItemList()
	return itemlist
end
