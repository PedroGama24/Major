Config = {
	licenseKey = "9kyUFTOrPLySBG35XZM18g",

	-- (PT) Se está, ou não, utilizando o inventário da DopeNUIs. Se não estiver, pode remover esta linha, ou deixar "false"
	-- (EN) If is, or not, using DopeNUI's Inventory. If not, you can delete, or set below line to "false"
	dopeInventory = true,

	commands = {
		-- (PT) Comando para abrir a interface
		-- (EN) Command to open interface 
		open = "casa",
		-- (PT) Comando para listar casas disponíveis
		-- (EN) Verify available houses (map blips)
		availableHouses = "casas",
		-- (PT) Comando para listar casas disponíveis para roubo
		-- (EN) Verify available houses to steal (map blips)
		availableHousesSteal = "roubarcasa",
	},

	keyBindings = {
		-- (PT) Entrar na casa ("BOTÃO". Você pode usar "false" = sem aspas, para desativado)
		-- (EN) Enter house keybind ("KEYBIND". You can use "false" = without quotes, for deactivated)
		enterHome = true, 
		 enterHome = "F", 
		-- (PT) Abrir baú da casa ("BOTÃO")
		-- (EN) Open house vault ("KEYBIND")
		chest = "E", 
		-- (PT) Abrir guarda-roupas da casa ("BOTÃO")
		-- (EN) Enter house keybind ("KEYBIND")
		wardrobe = "E", 
		-- (PT) Abrir interface imobiliária
		-- (EN) Open real estate office interface
		buyInterface = "E" 
	},

	permissions = {
		-- (PT) Permissão para adicionar uma casa à um usuário (ADMIN)
		-- (EN) Permission for add house to player (ADMIN)
		addHouse = "admin.permissao",
		-- (PT) Permissão para remover uma casa de um usuário (ADMIN)
		-- (EN) Permission for remove house from a player (ADMIN)
		remHouse = "admin.permissao",
		-- (PT) Ignorar permissões, permitir abrir o baú mesmo sem ser adicionado (ADMIN)
		-- (EN) Ignore permissions, allow chest open without permissions (ADMIN)
		bypassChest = "admin.permissao",
		-- (PT) Permissão para invadir a casa
		-- (EN) Permission for use Invade button
		invadeHouse = "policia.permissao",
		-- (PT) Permissões para ser isento à taxa
		-- (EN) Permissions for no property tax
		noTax = {
			"platina.permissao",
			"admin.permissao",
		},
	},

	locations = {
		-- (PT) Localização da imobiliária (comprar casas)
		-- (EN) Location to buy houses
		buyLocation = { x = -72.65, y = -815.94, z = 243.39 }
	},

	extras = {
		-- (PT) Blip de casas disponíveis (em segundos)
		-- (EN) Available houses blip time (in seconds)
		availableBlipsTime = 90,

		-- (PT) Valor, em porcentagem, que será recebido ao vender a casa (90% do valor original, por exemplo)
		-- (EN) Value, in percentage, to be received when sell the house (e.g. 90% of the original value)
		sellPercentage = 2,
		
		-- ! NEW
		-- (PT) Número máximo de casas por jogador
		-- (EN) Max number of houses per player
		maxUserHouses = {
			-- ["permission"] = MAXCOUNT,
			["default"] = 5,
			["platina.permissao"] = 10,
		},
		
		functions = {
			-- (PT) Roubo de casas
			houseSteal = {
				-- (PT) Status da função. "true" = ativado, "false" = desativado
				-- (EN) Function status. "true" = enabled, "false" = disabled
				enabled = true,
				availableHousesStealEnabled = true,

				-- (PT) Item necessário para roubar
				-- (EN) Necessary item to start robbery
				neededItem = "lockpick", 
				-- (PT) Quantidade de "neededItem" para começar
				-- (EN) Necessary quantity of "neededItem"
				neededItemQuantity = 1,
				-- (PT) Chance de sucesso ao clicar no botão roubar
				-- (EN) Success chance on click "Steal" button
				successChance = 60, 

				-- (PT) Distância do texto orientando apertar "E"
				-- (EN) Maximum distance of text "press E"
				textDistance = 3,

				policeWarning = {
					-- (PT) Permissão dos policiais, para realizar o aviso de roubo
					-- (EN) Cops permission for robbery callout
					policePermission = "policia.permissao",
					-- (PT) Quantidade mínima de policiais para iniciar o roubo
					-- (EN) Minimum police count to start house robbery
					minimumPolice = 0,

					-- (PT) Avisar polícia ao entrar na casa
					-- (EN) Warn police on start house steal
					onEnter = {
						-- (PT) Se usará os avisos ao entrar na casa ou não
						-- (EN) If will use warn on enter or not
						enabled = true,
						-- (PT) Porcantagem de chance para chamar a polícia (somente o número) (%)
						-- (EN) Police warning chance (only the number) (%)
						warnChance = 27,
					},

					-- (PT) Avisar polícia ao interagir com o blip
					-- (EN) Warn police on interact with blip
					onBlipInteract = {
						-- (PT) Se usará os avisos ao interagir com o blip na casa ou não
						-- (EN) If will warn police on interact with marker or not
						enabled = true,
						-- (PT) Porcantagem de chance para chamar a polícia (somente o número) (%)
						-- (EN) Police warning chance (only the number) (%)
						warnChance = 18,
					}
				},
				
				-- (PT) Cooldown até poder roubar a MESMA casa novamente
				-- (EN) Cooldown to can robbery the SAME house again
				houseCooldown = 1200,
				-- (PT) Cooldown até poder roubar OUTRA casa novamente
				-- (EN) Cooldown to can robbery the OTHER house again
				houseGlobalCooldown = 12,
				-- (PT) Tempo para marker/roubar um blip único (em segundos)
				-- (EN) Time to steal a marker/blip (in seconds)
				perMarkerTime = 8,

				-- (PT) Categorias de itens que serão aleatorizadas ao roubar casas
				-- (EN) Item categories to be randomized on steal
				itemBags = {
					["eletronics"] = { 
						[1] = { item = "tabletroubado", amount = 1 },
						[2] = { item = "vaperoubado", amount = 1 },
						[3] = { item = "calculadoraroubado", amount = 1 },
						[4] = { item = "jblroubado", amount = 1 },
						[5] = { item = "controleremotoroubado", amount = 1 },
						[6] = { item = "notebookroubado", amount = 1 },
						[7] = { item = "cartaoazul", amount = 1 },
						[8] = { item = "celularroubado", amount = 1 },
						[9] = { item = "radioroubado", amount = 1 },
						[10] = { item = "tabletroubado", amount = 1 },
						[11] = { item = "vaperoubado", amount = 1 },
						[12] = { item = "calculadoraroubado", amount = 1 },
						[13] = { item = "jblroubado", amount = 1 },
						[14] = { item = "controleremotoroubado", amount = 1 },
						[15] = { item = "jblroubado", amount = 1 },
						[16] = { item = "vaperoubado", amount = 1 },
						[17] = { item = "controleremotoroubado", amount = 1 },
						[18] = { item = "vaperoubado", amount = 1 },
						[19] = { item = "controleremotoroubado", amount = 1 },
						[20] = { item = "vaperoubado", amount = 1 },
					},
					["joias"] = { 
						[1] = { item = "colar", amount = 1 },
						[2] = { item = "anel", amount = 1 },
						[3] = { item = "relogio", amount = 1 },
						[4] = { item = "brinco", amount = 1 },
						[5] = { item = "bracelete", amount = 1 },
						[6] = { item = "coroa", amount = 1 },
						[7] = { item = "cartaovermelho", amount = 1 },
						[8] = { item = "coroa", amount = 1 },
						[9] = { item = "anel", amount = 1 },
						[10] = { item = "coroa", amount = 1 },
						[11] = { item = "bracelete", amount = 1 },
						[12] = { item = "bracelete", amount = 1 },
						[13] = { item = "relogio", amount = 1 },
						[14] = { item = "brinco", amount = 1 },
						[15] = { item = "relogio", amount = 1 },
						[16] = { item = "bracelete", amount = 1 },
					},
					["pessoal"] = { 
						[1] = { item = "vibrador", amount = 1 },
						[2] = { item = "camisinha", amount = 1 },
						[3] = { item = "kit", amount = 1 },
						[4] = { item = "algema", amount = 1 },
						[5] = { item = "wbody|WEAPON_SNSPISTOL", amount = 1 },
						[6] = { item = "cartaoverde", amount = 1 },
						[7] = { item = "perfume", amount = 1 },
						[8] = { item = "perfume", amount = 1 },
						[9] = { item = "camisinha", amount = 1 },
						[10] = { item = "vibrador", amount = 1 },
						[11] = { item = "perfume", amount = 1 },
						[12] = { item = "wammo|WEAPON_SNSPISTOL", amount = 20 },
						[13] = { item = "coca-alta", amount = 10 },
						[14] = { item = "maconha-alta", amount = 7 },
						[15] = { item = "coca-alta", amount = 8 },
						[16] = { item = "lsd-alta", amount = 5 },
						[17] = { item = "meta-alta", amount = 10 },
						[18] = { item = "maconha-alta", amount = 10 },
					},
					["roupas"] = { 
						[1] = { item = "bolsa", amount = 1 },
						[2] = { item = "calca", amount = 1 },
						[3] = { item = "cinto", amount = 1 },
						[4] = { item = "camisa", amount = 1 },
						[5] = { item = "tenis", amount = 1 },
						[6] = { item = "cartaoamarelo", amount = 1 },
						[7] = { item = "bone", amount = 1 },
						[8] = { item = "tenis", amount = 1 },
						[9] = { item = "cinto", amount = 1 },
						[10] = { item = "camisa", amount = 1 },
						[11] = { item = "bolsa", amount = 1 },
						[12] = { item = "calca", amount = 1 },
						[13] = { item = "bone", amount = 1 },
						[14] = { item = "bolsa", amount = 1 },
						[15] = { item = "bone", amount = 1 },
						[16] = { item = "calca", amount = 1 },
						[17] = { item = "bone", amount = 1 },
						[18] = { item = "camisa", amount = 1 },
						[19] = { item = "camisa", amount = 1 },
						[20] = { item = "bone", amount = 1 },
					},
				}
			}
		},
		
		tax = {
			-- (PT) Porcantagem da taxa da casa (somente o número) (%)
			-- (EN) Percentage of tax property (only the number) (%)
			taxPercentage = 8,
			-- (PT) Tempo para pagar a taxa (em dias)
			-- (EN) Time to pay tax (in days)
			taxDays = 15,
			-- (PT) Tempo para a casa ser removida caso a taxa não seja paga
			-- (EN) Time to the house be removed if tax is pendent
			removeDays = 18,
		},

		visitation = {
			-- (PT) Barra de progresso mostrando o restante do tempo na residência
			-- (EN) ProgressBar showing the time left in visitation 
			progressBar = true,
			-- (PT) Texto da barra de progresso (algumas progressbar não mostram)
			-- (EN) Progress Bar text (some progressbar don't use it)
			progressBarText = "Visitação",
			-- (PT) Tempo total na visitação (metade no exterior e metade no interior - em segundos)
			-- (EN) Total visiting time (half outdoors and half indoors - in seconds)
			visitTime = 60,
		}
	},

	chestLevels = {
		[1] = {
			name = "Nível 1",
			chestSize = 20,
			price = 0,
			default = true,
		},
		[2] = {
			name = "Nível 2",
			chestSize = 75,
			price = 30000,
		},
		[3] = {
			name = "Nível 3",
			chestSize = 120,
			price = 90000,
		},
		[4] = {
			name = "Nível 4",
			chestSize = 300,
			price = 225000,
		},
		[5] = {
			name = "Nível 5",
			chestSize = 1000,
			price = 750000,
		},
	},

	houseTypes = {
		["Simples"] = {
			description = "Residência modesta, e robusta. Conjunto habitacional.",

			insideLocation = { x = 266.08, y = -1006.06, z = -100.26, h = 5.28 },
			chestLocation = { x = 262.94, y = -1002.88, z = -99.0, distance = 1.5 },
			wardrobeLocation = { x = 259.72, y = -1003.94, z = -99.0, distance = 1.5 },

			stealLocations = {
				[1] = { x = 265.9, y = -999.35, z = -99.0, h = 271.51, rewardType = "eletronics" },
				[2] = { x = 257.14, y = -995.65, z = -99.0, h = 41.15, rewardType = "joias" },
				[3] = { x = 262.78, y = -1002.51, z = -99.0, h = 4.79, rewardType = "pessoal" },
				[4] = { x = 261.4, y = -1002.52, z = -99.0, h = 2.35, rewardType = "roupas" },
				[5] = { x = 262.06, y = -995.27, z = -99.0, h = 261.05, rewardType = "pessoal" },
			}
		},
		["Apartament"] = {
			description = "Residência mediana, mas com luxo em todos os cantos em que olhar.",

			-- interior = "apa_v_mp_h_01_a",
			insideLocation = { x = -781.91, y = 323.59, z = 223.26, h = 175.44 },
			chestLocation = { x = -773.39, y = 325.44, z = 223.27, distance = 3 },
			wardrobeLocation = { x = -760.66, y = 325.54, z = 217.07, distance = 3 },

			stealLocations = {
				[1] = { x = -754.53, y = 315.02, z = 221.86, h = 183.71, rewardType = "eletronics" },
				[2] = { x = -778.05, y = 327.88, z = 223.26, h = 55.57, rewardType = "roupas" },
				[3] = { x = -759.62, y = 316.92, z = 217.06, h = 278.12, rewardType = "pessoal" },
				[4] = { x = -761.52, y = 326.68, z = 217.06, h = 7.13, rewardType = "joias" },
				[5] = { x = -755.7, y = 331.18, z = 221.86, h = 6.52, rewardType = "roupas" },
			}
		},
		["Apartament2"] = {
			description = "Residência mediana, mas com luxo em todos os cantos em que olhar.",

			insideLocation = { x = -30.89, y = -595.17, z = 80.04, h = 248.73 },
			chestLocation = { x = -12.36, y = -597.32, z = 79.44, distance = 3 },
			wardrobeLocation = { x = -38.28, y = -589.56, z = 78.84, distance = 3 },

			stealLocations = {
				[1] = { x = -20.94, y = -580.02, z = 79.24, h = 45.36, rewardType = "eletronics" },
				[2] = { x = -27.72, y = -581.25, z = 79.24, h = 73.71, rewardType = "joias" },
				[3] = { x = -8.27, y = -593.82, z = 79.44, h = 0.0, rewardType = "roupas" },
				[4] = { x = -36.07, y = -580.6, z = 78.84, h = 68.04, rewardType = "pessoal" },
				[5] = { x = -34.4, y = -586.65, z = 78.84, h = 158.75, rewardType = "joias" },
			}
		},
		["Apartament3"] = {
			description = "Os interiores mais sofisticados disponíveis. Alto luxo, garagem e afins.",

			insideLocation = { x = -174.63, y = 497.77, z = 137.66, h = 228.67},
			chestLocation = { x = -858.27, y = 697.69, z = 145.26, distance = 3 },
			wardrobeLocation = { x=-175.63, y=493.2, z=130.05, distance = 3 },

			stealLocations = {
				
				[1] = { x=-169.58, y=490.95, z=130.05, h = 30.8, rewardType = "eletronics" },
				[2] = { x=-170.62, y=482.68, z=133.85, h = 99.46, rewardType = "joias" },
				[3] = { x=-168.07, y=487.99, z=133.85, h = 47.44, rewardType = "roupas" },
				[4] = { x=-165.89, y=495.29, z=133.86, h = 14.63, rewardType = "pessoal" },
				[5] = { x=-162.64, y=482.72, z=137.25, h = 249.13, rewardType = "eletronics" },
				[6] = { x=-162.66, y=482.27, z=133.87, h = 299.9, rewardType = "pessoal" },
			}
		},
		
		
	},

	houseList = {
		["FH01"] = {
			name = "Mansão FH01",
			type = "Apartament",
			entrada = {
				['x'] = -866.58, ['y'] = 457.3, ['z'] = 88.29
			},
			price = 5000000
	
		},
		["FH02"] = {
			name = "Mansão FH02",
			type = "Apartament",
			entrada = {
				['x'] = -884.19, ['y'] = 517.82, ['z'] = 92.45
			},
			price = 5000000
	
		},
		["FH03"] = {
			name = "Mansão FH03",
			type = "Apartament",
			entrada = {
				['x'] = -828.34,
				['y'] = 463.77,
				['z'] = 79.49
			},
			price = 5000000
	
		},
		["FH04"] = {
			name = "Mansão FH04",
			type = "Apartament",
			entrada = {
				['x'] = -848.24,
				['y'] = 519.68,
				['z'] = 82.76
			},
			price = 5000000
	
		},
		["FH05"] = {
			name = "Mansão FH05",
			type = "Apartament",
			entrada = {
				['x'] = -869.61, ['y'] = 551.57, ['z'] = 97.03
			},
			price = 5000000
	
		},
		["FH06"] = {
			name = "Mansão FH06",
			type = "Apartament",
			entrada = {
				['x'] = -885.85,
				['y'] = 606.30,
				['z'] = 87.57
			},
			price = 5000000
	
		},
		["FH07"] = {
			name = "Mansão FH07",
			type = "Apartament",
			entrada = {
				['x'] = -932.55,
				['y'] = 634.75,
				['z'] = 97.75
			},
			price = 5000000
	
		},
		["FH08"] = {
			name = "Mansão FH08",
			type = "Apartament",
			entrada = {
				['x'] = -912.08,
				['y'] = 529.13,
				['z'] = 80.97
			},
			price = 5000000
	
		},
		["FH09"] = {
			name = "Mansão FH09",
			type = "Apartament",
			entrada = {
				['x'] = -1029.37,
				['y'] = 567.66,
				['z'] = 87.99
			},
			price = 5000000
	
		},
		["FH10"] = {
			name = "Mansão FH10",
			type = "Apartament",
			entrada = {
				['x'] = -1066.45,
				['y'] = 555.39,
				['z'] = 86.57
			},
			price = 5000000
	
		},
		["FH11"] = {
			name = "Mansão FH11",
			type = "Apartament",
			entrada = {
				['x'] = -950.18,
				['y'] = 464.93,
				['z'] = 80.81
			},
			price = 5000000
	
		},
		["FH12"] = {
			name = "Mansão FH12",
			type = "Apartament",
			entrada = {
				['x'] = -953.19,
				['y'] = 527.85,
				['z'] = 74.11
			},
			price = 5000000
	
		},
		["FH13"] = {
			name = "Mansão FH13",
			type = "Apartament",
			entrada = {
				['x'] = -989.80,
				['y'] = 525.66,
				['z'] = 72.72
			},
			price = 5000000
	
		},
		["FH14"] = {
			name = "Mansão FH14",
			type = "Apartament",
			entrada = {
				['x'] = -1054.04,
				['y'] = 534.84,
				['z'] = 71.21
			},
			price = 5000000
	
		},
		["FH15"] = {
			name = "Mansão FH15",
			type = "Apartament",
			entrada = {
				['x'] = -1067.10,
				['y'] = 473.60,
				['z'] = 71.79
			},
			price = 5000000
	
		},
		["FH16"] = {
			name = "Mansão FH16",
			type = "Apartament",
			entrada = {
				['x'] = -1017.60,
				['y'] = 740.45,
				['z'] = 155.49
			},
			price = 5000000
	
		},
		["FH17"] = {
			name = "Mansão FH17",
			type = "Apartament",
			entrada = {
				['x'] = -1035.01,
				['y'] = 429.99,
				['z'] = 66.73
			},
			price = 5000000
	
		},
		["FH18"] = {
			name = "Mansão FH18",
			type = "Apartament",
			entrada = {
				['x'] = -1011.22,
				['y'] = 460.49,
				['z'] = 68.84
			},
			price = 5000000
	
		},
		["FH19"] = {
			name = "Mansão FH19",
			type = "Apartament",
			entrada = {
				['x'] = -965.87,
				['y'] = 437.78,
				['z'] = 70.18
			},
			price = 5000000
	
		},
		["FH20"] = {
			name = "Mansão FH20",
			type = "Apartament",
			entrada = {
				['x'] = -1115.30,
				['y'] = 603.96,
				['z'] = 95.35
			},
			price = 5000000
	
		},
		["FH21"] = {
			name = "Mansão FH21",
			type = "Apartament",
			entrada = {
				['x'] = -814.49,
				['y'] = 419.06,
				['z'] = 81.88
			},
			price = 5000000
	
		},
		["FH22"] = {
			name = "Mansão FH22",
			type = "Apartament",
			entrada = {
				['x'] = -760.33,
				['y'] = 407.34,
				['z'] = 87.16
			},
			price = 5000000
	
		},
		["FH23"] = {
			name = "Mansão FH23",
			type = "Apartament",
			entrada = {
				['x'] = -717.95, ['y'] = 448.92, ['z'] = 106.91
			},
			price = 5500000
	
		},
		["FH24"] = {
			name = "Mansão FH24",
			type = "Apartament",
			entrada = {
				['x'] = -731.10,
				['y'] = 508.84,
				['z'] = 101.76
			},
			price = 5000000
	
		},
		["FH25"] = {
			name = "Mansão FH25",
			type = "Apartament",
			entrada = {
				['x'] = -765.97,
				['y'] = 478.65,
				['z'] = 91.87
			},
			price = 5000000
	
		},
		["FH26"] = {
			name = "Mansão FH26",
			type = "Apartament",
			entrada = {
				['x'] = -680.98,
				['y'] = 523.37,
				['z'] = 100.84
			},
			price = 5000000
	
		},
		["FH27"] = {
			name = "Mansão FH27",
			type = "Apartament",
			entrada = {
				['x'] = -676.09,
				['y'] = 470.54,
				['z'] = 99.41
			},
			price = 5000000
	
		},
		["FH28"] = {
			name = "Mansão FH28",
			type = "Apartament",
			entrada = {
				['x'] = -640.76,
				['y'] = 519.56,
				['z'] = 100.74
			},
			price = 5000000
	
		},
		["FH29"] = {
			name = "Mansão FH29",
			type = "Apartament",
			entrada = {
				['x'] = -570.30,
				['y'] = 476.27,
				['z'] = 99.96
			},
			price = 5000000
	
		},
		["FH30"] = {
			name = "Mansão FH30",
			type = "Apartament",
			entrada = {
				['x'] = -624.58,
				['y'] = 469.88,
				['z'] = 97.81
			},
			price = 5000000
	
		},
		["FH31"] = {
			name = "Mansão FH31",
			type = "Apartament",
			entrada = {
				['x'] = -595.31, ['y'] = 529.79, ['z'] = 107.76
			},
			price = 5000000
	
		},
		["FH32"] = {
			name = "Mansão FH32",
			type = "Apartament",
			entrada = {
				['x'] = -552.73,
				['y'] = 386.80,
				['z'] = 82.86
			},
			price = 5000000
	
		},
		["FH33"] = {
			name = "Mansão FH33",
			type = "Apartament",
			entrada = {
				['x'] = -583.31,
				['y'] = 376.16,
				['z'] = 80.29
			},
			price = 5000000
	
		},
		["FH34"] = {
			name = "Mansão FH34",
			type = "Apartament",
			entrada = {
				['x'] = -482.06,
				['y'] = 360.78,
				['z'] = 93.38
			},
			price = 5000000
	
		},
		["FH35"] = {
			name = "Mansão FH35",
			type = "Apartament",
			entrada = {
				['x'] = -472.27,
				['y'] = 323.28,
				['z'] = 83.78
			},
			price = 5000000
	
		},
		["FH36"] = {
			name = "Mansão FH36",
			type = "Apartament",
			entrada = {
				['x'] = -426.24,
				['y'] = 323.96,
				['z'] = 82.83
			},
			price = 5000000
	
		},
		["FH37"] = {
			name = "Mansão FH37",
			type = "Apartament",
			entrada = {
				['x'] = -407.07,
				['y'] = 324.15,
				['z'] = 95.58
			},
			price = 5000000
	
		},
		["FH38"] = {
			name = "Mansão FH38",
			type = "Apartament",
			entrada = {
				['x'] = -330.08,
				['y'] = 348.45,
				['z'] = 99.14
			},
			price = 5000000
	
		},
		["FH39"] = {
			name = "Mansão FH39",
			type = "Apartament",
			entrada = {
				['x'] = -296.69,
				['y'] = 365.93,
				['z'] = 102.63
			},
			price = 5000000
	
		},
		["FH40"] = {
			name = "Mansão FH40",
			type = "Apartament",
			entrada = {
				['x'] = -246.52,
				['y'] = 387.60,
				['z'] = 100.54
			},
			price = 5000000
	
		},
		["FH41"] = {
			name = "Mansão FH41",
			type = "Apartament",
			entrada = {
				['x'] = -214.05, ['y'] = 400.08, ['z'] = 111.11
			},
			price = 5000000
	
		},
		["FH42"] = {
			name = "Mansão FH42",
			type = "Apartament",
			entrada = {
				['x'] = -166.42, ['y'] = 423.99, ['z'] = 111.81
			},
			price = 5000000
	
		},
		["FH43"] = {
			name = "Mansão FH43",
			type = "Apartament",
			entrada = {
				['x'] = -371.61, ['y'] = 408.16, ['z'] = 110.7
			},
			price = 5000000
	
		},
		["FH44"] = {
			name = "Mansão FH44",
			type = "Apartament",
			entrada = {
				['x'] = -305.0, ['y'] = 431.2, ['z'] = 110.47
			},
			price = 5000000
	
		},
		["FH45"] = {
			name = "Mansão FH45",
			type = "Apartament",
			entrada = {
				['x'] = -554.44, ['y'] = 541.12, ['z'] = 110.71
			},
			price = 5000000
	
		},
		["FH46"] = {
			name = "Mansão FH46",
			type = "Apartament",
			entrada = {
				['x'] = -516.51, ['y'] = 433.47, ['z'] = 97.81
			},
			price = 5000000
	
		},
		["FH47"] = {
			name = "Mansão FH47",
			type = "Apartament",
			entrada = {
				['x'] = -536.99, ['y'] = 477.61, ['z'] = 103.2
			},
			price = 5000000
	
		},
		["FH48"] = {
			name = "Mansão FH48",
			type = "Apartament",
			entrada = {
				['x'] = -526.77, ['y'] = 517.3, ['z'] = 112.95
			},
			price = 5000000
	
		},
		["FH49"] = {
			name = "Mansão FH49",
			type = "Apartament",
			entrada = {
				['x'] = -520.19, ['y'] = 594.38, ['z'] = 120.84
			},
			price = 5000000
	
		},
		["FH50"] = {
			name = "Mansão FH50",
			type = "Apartament",
			entrada = {
				['x'] = -474.42, ['y'] = 585.93, ['z'] = 128.69
			},
			price = 5000000
	
		},
		["FH51"] = {
			name = "Mansão FH51",
			type = "Apartament",
			entrada = {
				['x'] = -500.74, ['y'] = 552.06, ['z'] = 120.61
			},
			price = 5000000
	
		},
		["FH52"] = {
			name = "Mansão FH52",
			type = "Apartament",
			entrada = {
				['x'] = -459.11, ['y'] = 537.1, ['z'] = 121.46
			},
			price = 5000000
	
		},
		["FH53"] = {
			name = "Mansão FH53",
			type = "Apartament",
			entrada = {
				['x'] = -425.92, ['y'] = 535.39, ['z'] = 122.28
			},
			price = 5000000
	
		},
		["FH54"] = {
			name = "Mansão FH54",
			type = "Apartament",
			entrada = {
				['x'] = -386.92, ['y'] = 504.11, ['z'] = 120.41
			},
			price = 5000000
	
		},
		["FH55"] = {
			name = "Mansão FH55",
			type = "Apartament",
			entrada = {
				['x'] = -355.61, ['y'] = 469.68, ['z'] = 112.49
			},
			price = 5000000
	
		},
		["FH56"] = {
			name = "Mansão FH56",
			type = "Apartament",
			entrada = {
				['x'] = -406.35, ['y'] = 567.7, ['z'] = 124.6
			},
			price = 5000000
	
		},
		["FH57"] = {
			name = "Mansão FH57",
			type = "Apartament",
			entrada = {
				['x'] = -378.21, ['y'] = 548.39, ['z'] = 123.86
			},
			price = 5000000
	
		},
		["FH58"] = {
			name = "Mansão FH58",
			type = "Apartament",
			entrada = {
				['x'] = -348.96, ['y'] = 514.63, ['z'] = 120.65
			},
			price = 5000000
	
		},
		["FH59"] = {
			name = "Mansão FH59",
			type = "Apartament",
			entrada = {
				['x'] = -312.28, ['y'] = 474.58, ['z'] = 111.83
			},
			price = 5000000
	
		},
		["FH60"] = {
			name = "Mansão FH60",
			type = "Apartament",
			entrada = {
				['x'] = -615.64, ['y'] = 398.71, ['z'] = 101.43
			},
			price = 5000000
	
		},
		["FH61"] = {
			name = "Mansão FH61",
			type = "Apartament",
			entrada = {
				['x'] = -1193.05, ['y'] = 564.03, ['z'] = 100.34
			},
			price = 5000000
	
		},
		["FH62"] = {
			name = "Mansão FH62",
			type = "Apartament",
			entrada = {
				['x'] = -1122.6, ['y'] = 485.75, ['z'] = 82.17
			},
			price = 5000000
	
		},
		["FH63"] = {
			name = "Mansão FH63",
			type = "Apartament",
			entrada = {
				['x'] = -1159.13, ['y'] = 481.84, ['z'] = 86.1
			},
			price = 5000000
	
		},
		["FH64"] = {
			name = "Mansão FH64",
			type = "Apartament",
			entrada = {
				['x'] = -1215.85, ['y'] = 458.27, ['z'] = 92.07
			},
			price = 5000000
	
		},
		["FH65"] = {
			name = "Mansão FH65",
			type = "Apartament",
			entrada = {
				['x'] = -1174.52, ['y'] = 440.27, ['z'] = 86.85
			},
			price = 5000000
	
		},
		["FH66"] = {
			name = "Mansão FH66",
			type = "Apartament",
			entrada = {
				['x'] = -1105.39, ['y'] = 429.98, ['z'] = 75.84
			},
			price = 5000000
	
		},
		["FH67"] = {
			name = "Mansão FH67",
			type = "Apartament",
			entrada = {
				['x'] = -1308.04, ['y'] = 448.93, ['z'] = 100.97
			},
			price = 5000000
	
		},
		["FH68"] = {
			name = "Mansão FH68",
			type = "Apartament",
			entrada = {
				['x'] = -1371.82, ['y'] = 443.94, ['z'] = 105.86
			},
			price = 5000000
	
		},
		["FH69"] = {
			name = "Mansão FH69",
			type = "Apartament",
			entrada = {
				['x'] = -1413.75, ['y'] = 462.27, ['z'] = 109.21
			},
			price = 5000000
	
		},
		["FH70"] = {
			name = "Mansão FH70",
			type = "Apartament",
			entrada = {
				['x'] = -1343.17, ['y'] = 481.25, ['z'] = 102.76
			},
			price = 5000000
	
		},
		["FH71"] = {
			name = "Mansão FH71",
			type = "Apartament",
			entrada = {
				['x'] = -1500.68, ['y'] = 522.88, ['z'] = 118.28
			},
			price = 5000000
	
		},
		["FH72"] = {
			name = "Mansão FH72",
			type = "Apartament",
			entrada = {
				['x'] = -1452.47, ['y'] = 545.55, ['z'] = 120.8
			},
			price = 5000000
	
		},
		["FH73"] = {
			name = "Mansão FH73",
			type = "Apartament",
			entrada = {
				['x'] = -1405.13, ['y'] = 562.0, ['z'] = 125.41
			},
			price = 5000000
	
		},
		["FH74"] = {
			name = "Mansão FH74",
			type = "Apartament",
			entrada = {
				['x'] = -1364.45, ['y'] = 569.91, ['z'] = 134.98
			},
			price = 4500000
	
		},
		["FH75"] = {
			name = "Mansão FH75",
			type = "Apartament",
			entrada = {
				['x'] = -1366.94, ['y'] = 610.92, ['z'] = 133.9
			},
			price = 5000000
	
		},
		["FH76"] = {
			name = "Mansão FH76",
			type = "Apartament",
			entrada = {
				['x'] = -1291.76, ['y'] = 650.08, ['z'] = 141.51
			},
			price = 5000000
	
		},
		["FH77"] = {
			name = "Mansão FH77",
			type = "Apartament",
			entrada = {
				['x'] = -1241.31, ['y'] = 674.24, ['z'] = 142.82
			},
			price = 5000000
	
		},
		["FH78"] = {
			name = "Mansão FH78",
			type = "Apartament",
			entrada = {
				['x'] = -1218.77, ['y'] = 664.97, ['z'] = 144.54
			},
			price = 5000000
	
		},
		["FH79"] = {
			name = "Mansão FH79",
			type = "Apartament",
			entrada = {
				['x'] = -1197.37, ['y'] = 693.44, ['z'] = 147.42
			},
			price = 5000000
	
		},
		["FH80"] = {
			name = "Mansão FH80",
			type = "Apartament",
			entrada = {
				['x'] = -498.68, ['y'] = 682.87, ['z'] = 151.56
			},
			price = 5000000
	
		},
		["FH81"] = {
			name = "Mansão FH81",
			type = "Apartament",
			entrada = {
				['x'] = -446.01, ['y'] = 686.31, ['z'] = 153.12
			},
			price = 5000000
	
		},
		["FH82"] = {
			name = "Mansão FH82",
			type = "Apartament",
			entrada = {
				['x'] = -551.74, ['y'] = 686.99, ['z'] = 146.08
			},
			price = 5000000
	
		},
		["FH83"] = {
			name = "Mansão FH83",
			type = "Apartament",
			entrada = {
				['x'] = -533.28, ['y'] = 708.68, ['z'] = 152.94
			},
			price = 5000000
	
		},
		["FH84"] = {
			name = "Mansão FH84",
			type = "Apartament",
			entrada = {
				['x'] = -353.29, ['y'] = 668.39, ['z'] = 169.08
			},
			price = 5000000
	
		},
		["FH85"] = {
			name = "Mansão FH85",
			type = "Apartament",
			entrada = {
				['x'] = -495.44, ['y'] = 738.65, ['z'] = 163.04
			},
			price = 5000000
	
		},
		["FH86"] = {
			name = "Mansão FH86",
			type = "Apartament",
			entrada = {
				['x'] = -494.47, ['y'] = 796.27, ['z'] = 184.35
			},
			price = 5000000
	
		},
		["FH87"] = {
			name = "Mansão FH87",
			type = "Apartament",
			entrada = {
				['x'] = -599.49, ['y'] = 806.94, ['z'] = 191.12
			},
			price = 5000000
	
		},
		["FH88"] = {
			name = "Mansão FH88",
			type = "Apartament",
			entrada = {
				['x'] = -6.64, ['y'] = 408.89, ['z'] = 120.29
			},
			price = 5000000
	
		},
		-- ["FH89"] = {
		-- 	name = "Mansão FH89",
		-- 	type = "Apartament",
		-- 	entrada = {
		-- 		['x'] = -38.04,
		-- 		['y'] = 376.05,
		-- 		['z'] = 107.79
		-- 	},
		-- 	price = 5000000
		-- },
		["FH90"] = {
			name = "Mansão FH90",
			type = "Apartament",
			entrada = {
				['x'] = -1130.9, ['y'] = 784.41, ['z'] = 163.89
			},
			price = 5000000
	
		},
		["FH91"] = {
			name = "Mansão FH91",
			type = "Apartament",
			entrada = {
				['x'] = -962.75, ['y'] = 813.87, ['z'] = 177.57
			},
			price = 5000000
	
		},
		["FH92"] = {
			name = "Mansão FH92",
			type = "Apartament",
			entrada = {
				['x'] = -931.73, ['y'] = 808.78, ['z'] = 184.79
			},
			price = 5000000
	
		},
		["FH93"] = {
			name = "Mansão FH93",
			type = "Apartament",
			entrada = {
				['x'] = -997.92, ['y'] = 768.79, ['z'] = 171.42
			},
			price = 5000000
	
		},
		["FH94"] = {
			name = "Mansão FH94",
			type = "Apartament",
			entrada = {
				['x'] = -824.04, ['y'] = 806.1, ['z'] = 202.79
			},
			price = 5000000
	
		},
		["FH95"] = {
			name = "Mansão FH95",
			type = "Apartament",
			entrada = {
				['x'] = -109.93, ['y'] = 501.92, ['z'] = 143.48
			},
			price = 5000000
	
		},
		["FH96"] = {
			name = "Mansão FH96",
			type = "Apartament",
			entrada = {
				['x'] = -66.63, ['y'] = 490.57, ['z'] = 144.7
			},
			price = 5000000
	
		},
		["FH97"] = {
			name = "Mansão FH97",
			type = "Apartament",
			entrada = {
				['x'] = -7.71, ['y'] = 468.06, ['z'] = 145.86
			},
			price = 5000000
	
		},
		["FH98"] = {
			name = "Mansão FH98",
			type = "Apartament",
			entrada = {
				['x'] = 80.22, ['y'] = 486.04, ['z'] = 148.21
			},
			price = 5000000
	
		},
		["FH99"] = {
			name = "Mansão FH99",
			type = "Apartament",
			entrada = {
				['x'] = 119.99, 
				['y'] = 494.12,
				['z'] = 147.35
			},
			price = 5000000
	
		},
		["FH100"] = {
			name = "Mansão FH100",
			type = "Apartament",
			entrada = {
				['x'] = -96.05, ['y'] = 430.51, ['z'] = 113.1
			},
			price = 5000000
		},


		-----------------------------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------LUXURY--------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------	
		["LX01"] = {
			name = "Mansão LX01",
			type = "Apartament2",
			entrada = {
				['x'] = -842.22,
				['y'] = -25.13,
				['z'] = 40.39
			},
			price = 7000000
	
		},
		["LX02"] = {
			name = "Mansão LX02",
			type = "Apartament2",
			entrada = {
				['x'] = -896.48,
				['y'] = -5.14,
				['z'] = 43.79
			},
			price = 7000000
	
		},
		["LX03"] = {
			name = "Mansão LX03",
			type = "Apartament2",
			entrada = {
				['x'] = -888.44,
				['y'] = 42.44,
				['z'] = 49.14
			},
			price = 7000000
	
		},
		["LX04"] = {
			name = "Mansão LX04",
			type = "Apartament2",
			entrada = {
				['x'] = -971.41,
				['y'] = 122.07,
				['z'] = 57.04
			},
			price = 7000000
	
		},
		["LX05"] = {
			name = "Mansão LX05",
			type = "Apartament2",
			entrada = {
				['x'] = -1896.39,
				['y'] = 642.61,
				['z'] = 130.20
			},
			price = 7000000
	
		},
		["LX06"] = {
			name = "Mansão LX06",
			type = "Apartament2",
			entrada = {
				['x'] = -998.29,
				['y'] = 157.56,
				['z'] = 62.31
			},
			price = 7000000
	
		},
		["LX07"] = {
			name = "Mansão LX07",
			type = "Apartament2",
			entrada = {
				['x'] = -1038.57,
				['y'] = 222.41,
				['z'] = 64.37
			},
			price = 7000000
	
		},
		["LX08"] = {
			name = "Mansão LX08",
			type = "Apartament2",
			entrada = {
				['x'] = -949.43,
				['y'] = 196.57,
				['z'] = 67.39
			},
			price = 7000000
	
		},
		["LX09"] = {
			name = "Mansão LX09",
			type = "Apartament2",
			entrada = {
				['x'] = -903.10,
				['y'] = 191.68,
				['z'] = 69.44
			},
			price = 7000000
	
		},
		["LX10"] = {
			name = "Mansão LX10",
			type = "Apartament2",
			entrada = {
				['x'] = -913.72,
				['y'] = 108.30,
				['z'] = 55.51
			},
			price = 7000000
	
		},
		["LX11"] = {
			name = "Mansão LX11",
			type = "Apartament2",
			entrada = {
				['x'] = -930.20,
				['y'] = 19.26,
				['z'] = 48.52
			},
			price = 7000000
	
		},
		["LX12"] = {
			name = "Mansão LX12",
			type = "Apartament2",
			entrada = {
				['x'] = -830.80,
				['y'] = 115.13,
				['z'] = 55.83
			},
			price = 7000000
	
		},
		["LX13"] = {
			name = "Mansão LX13",
			type = "Apartament2",
			entrada = {
				['x'] = -1048.07,
				['y'] = 312.88,
				['z'] = 66.90
			},
			price = 7000000
	
		},
		["LX14"] = {
			name = "Mansão LX14",
			type = "Apartament2",
			entrada = {
				['x'] = -819.72,
				['y'] = 268.16,
				['z'] = 86.39
			},
			price = 7000000
	
		},
		["LX15"] = {
			name = "Mansão LX15",
			type = "Apartament2",
			entrada = {
				['x'] = -876.63,
				['y'] = 305.95,
				['z'] = 84.14
			},
			price = 7000000
	
		},
		["LX16"] = {
			name = "Mansão LX16",
			type = "Apartament2",
			entrada = {
				['x'] = -881.48,
				['y'] = 363.73,
				['z'] = 85.36
			},
			price = 7000000
	
		},
		["LX17"] = {
			name = "Mansão LX17",
			type = "Apartament2",
			entrada = {
				['x'] = -1026.13,
				['y'] = 360.53,
				['z'] = 71.36
			},
			price = 7000000
	
		},
		["LX18"] = {
			name = "Mansão LX18",
			type = "Apartament2",
			entrada = {
				['x'] = -1539.92,
				['y'] = 421.50,
				['z'] = 110.01
			},
			price = 7000000
	
		},
		["LX19"] = {
			name = "Mansão LX19",
			type = "Apartament2",
			entrada = {
				['x'] = -1189.94,
				['y'] = 291.96,
				['z'] = 69.89
			},
			price = 7000000
	
		},
		["LX20"] = {
			name = "Mansão LX20",
			type = "Apartament2",
			entrada = {
				['x'] = -1135.62,
				['y'] = 375.86,
				['z'] = 71.29
			},
			price = 7000000
	
		},
		["LX21"] = {
			name = "Mansão LX21",
			type = "Apartament2",
			entrada = {
				['x'] = -1467.65,
				['y'] = 34.79,
				['z'] = 54.54
			},
			price = 7000000
	
		},
		["LX22"] = {
			name = "Mansão LX22",
			type = "Apartament2",
			entrada = {
				['x'] = -1465.16,
				['y'] = -34.49,
				['z'] = 55.05
			},
			price = 7000000
	
		},
		["LX23"] = {
			name = "Mansão LX23",
			type = "Apartament2",
			entrada = {
				['x'] = -1515.37,
				['y'] = 23.78,
				['z'] = 56.82
			},
			price = 7000000
	
		},
		["LX24"] = {
			name = "Mansão LX24",
			type = "Apartament2",
			entrada = {
				['x'] = -1549.43,
				['y'] = -90.31,
				['z'] = 54.92
			},
			price = 7000000
	
		},
		["LX25"] = {
			name = "Mansão LX25",
			type = "Apartament2",
			entrada = {
				['x'] = -1580.37,
				['y'] = -33.93,
				['z'] = 57.56
			},
			price = 7000000
	
		},
		["LX26"] = {
			name = "Mansão LX26",
			type = "Apartament2",
			entrada = {
				['x'] = -1570.66,
				['y'] = 22.33,
				['z'] = 59.55
			},
			price = 7000000
	
		},
		["LX27"] = {
			name = "Mansão LX27",
			type = "Apartament2",
			entrada = {
				['x'] = -1629.95,
				['y'] = 36.41,
				['z'] = 62.93
			},
			price = 7000000
	
		},
		["LX28"] = {
			name = "Mansão LX28",
			type = "Apartament2",
			entrada = {
				['x'] = -1899.02,
				['y'] = 132.57,
				['z'] = 81.98
			},
			price = 7000000
	
		},
		["LX29"] = {
			name = "Mansão LX29",
			type = "Apartament2",
			entrada = {
				['x'] = -1931.75,
				['y'] = 163.07,
				['z'] = 84.65
			},
			price = 7000000
	
		},
		["LX30"] = {
			name = "Mansão LX30",
			type = "Apartament2",
			entrada = {
				['x'] = -1961.19,
				['y'] = 212.07,
				['z'] = 86.80
			},
			price = 7000000
	
		},
		["LX31"] = {
			name = "Mansão LX31",
			type = "Apartament2",
			entrada = {
				['x'] = -1970.28,
				['y'] = 246.14,
				['z'] = 87.81
			},
			price = 7000000
	
		},
		["LX32"] = {
			name = "Mansão LX32",
			type = "Apartament2",
			entrada = {
				['x'] = -1995.18,
				['y'] = 300.35,
				['z'] = 91.96
			},
			price = 7000000
	
		},
		["LX33"] = {
			name = "Mansão LX33",
			type = "Apartament2",
			entrada = {
				['x'] = -2009.04,
				['y'] = 367.39,
				['z'] = 94.81
			},
			price = 7000000
	
		},
		["LX34"] = {
			name = "Mansão LX34",
			type = "Apartament2",
			entrada = {
				['x'] = -2011.15,
				['y'] = 445.20,
				['z'] = 103.01
			},
			price = 7000000
	
		},
		["LX35"] = {
			name = "Mansão LX35",
			type = "Apartament2",
			entrada = {
				['x'] = -2014.85,
				['y'] = 499.98,
				['z'] = 107.17
			},
			price = 7000000
	
		},
		["LX36"] = {
			name = "Mansão LX36",
			type = "Apartament2",
			entrada = {
				['x'] = -1873.75,
				['y'] = 201.73,
				['z'] = 84.29
			},
			price = 7000000
	
		},
		["LX37"] = {
			name = "Mansão LX37",
			type = "Apartament2",
			entrada = {
				['x'] = -1905.64,
				['y'] = 253.00,
				['z'] = 86.45
			},
			price = 7000000
	
		},
		["LX38"] = {
			name = "Mansão LX38",
			type = "Apartament2",
			entrada = {
				['x'] = -1923.13,
				['y'] = 298.23,
				['z'] = 89.28
			},
			price = 7000000
	
		},
		["LX39"] = {
			name = "Mansão LX39",
			type = "Apartament2",
			entrada = {
				['x'] = -1931.74,
				['y'] = 362.46,
				['z'] = 93.78
			},
			price = 7000000
	
		},
		["LX40"] = {
			name = "Mansão LX40",
			type = "Apartament2",
			entrada = {
				['x'] = -1940.65,
				['y'] = 387.56,
				['z'] = 96.50
			},
			price = 7000000
	
		},
		["LX41"] = {
			name = "Mansão LX41",
			type = "Apartament2",
			entrada = {
				['x'] = -1942.79,
				['y'] = 449.69,
				['z'] = 102.92
			},
			price = 7000000
	
		},
		["LX42"] = {
			name = "Mansão LX42",
			type = "Apartament2",
			entrada = {
				['x'] = -1838.43,
				['y'] = 314.47,
				['z'] = 91.11
			},
			price = 7000000
	
		},
		["LX43"] = {
			name = "Mansão LX43",
			type = "Apartament2",
			entrada = {
				['x'] = -1808.04,
				['y'] = 333.11,
				['z'] = 89.56
			},
			price = 7000000
	
		},
		["LX44"] = {
			name = "Mansão LX44",
			type = "Apartament2",
			entrada = {
				['x'] = -1733.15,
				['y'] = 379.03,
				['z'] = 89.72
			},
			price = 7000000
	
		},
		["LX45"] = {
			name = "Mansão LX45",
			type = "Apartament2",
			entrada = {
				['x'] = -1673.26,
				['y'] = 385.62,
				['z'] = 89.34
			},
			price = 7000000
	
		},
		["LX46"] = {
			name = "Mansão LX46",
			type = "Apartament2",
			entrada = {
				['x'] = -1804.83,
				['y'] = 436.42,
				['z'] = 128.81
			},
			price = 7000000
	
		},
		["LX47"] = {
			name = "Mansão LX47",
			type = "Apartament2",
			entrada = {
				['x'] = -1996.35,
				['y'] = 591.42,
				['z'] = 118.09
			},
			price = 7000000
	
		},
		["LX48"] = {
			name = "Mansão LX48",
			type = "Apartament2",
			entrada = {
				['x'] = -1938.35,
				['y'] = 551.09,
				['z'] = 114.82
			},
			price = 7000000
	
		},
		["LX49"] = {
			name = "Mansão LX49",
			type = "Apartament2",
			entrada = {
				['x'] = -1929.00,
				['y'] = 595.34,
				['z'] = 122.28
			},
			price = 7000000
	
		},
		["LX50"] = {
			name = "Mansão LX50",
			type = "Apartament2",
			entrada = {
				['x'] = -1974.63,
				['y'] = 631.13,
				['z'] = 122.68
			},
			price = 7000000
	
		},
		["LX51"] = {
			name = "Mansão LX51",
			type = "Apartament2",
			entrada = {
				['x'] = -151.75,
				['y'] = 910.64,
				['z'] = 235.65
			},
			price = 7000000
	
		},
		["LX52"] = {
			name = "Mansão LX52",
			type = "Apartament2",
			entrada = {
				['x'] = -181.14,
				['y'] = 961.65,
				['z'] = 237.74
			},
			price = 7000000
	
		},
		["LX53"] = {
			name = "Mansão LX53",
			type = "Apartament2",
			entrada = {
				['x'] = -113.02,
				['y'] = 986.15,
				['z'] = 235.75
			},
			price = 7000000
	
		},
		["LX54"] = {
			name = "Mansão LX54",
			type = "Apartament2",
			entrada = {
				['x'] = -85.66,
				['y'] = 834.74,
				['z'] = 235.92
			},
			price = 7000000
	
		},
		["LX55"] = {
			name = "Mansão LX55",
			type = "Apartament2",
			entrada = {
				['x'] = 228.63,
				['y'] = 765.66,
				['z'] = 204.96
			},
			price = 7000000
	
		},
		["LX56"] = {
			name = "Mansão LX56",
			type = "Apartament2",
			entrada = {
				['x'] = 232.20,
				['y'] = 672.14,
				['z'] = 189.97
			},
			price = 7000000
	
		},
		["LX57"] = {
			name = "Mansão LX57",
			type = "Apartament2",
			entrada = {
				['x'] = 150.86,
				['y'] = 556.29,
				['z'] = 183.73
			},
			price = 7000000
	
		},
		["LX58"] = {
			name = "Mansão LX58",
			type = "Apartament2",
			entrada = {
				['x'] = 84.91,
				['y'] = 561.92,
				['z'] = 182.73
			},
			price = 7000000
	
		},
		["LX59"] = {
			name = "Mansão LX59",
			type = "Apartament2",
			entrada = {
				['x'] = 46.05,
				['y'] = 555.92,
				['z'] = 180.08
			},
			price = 7000000
	
		},
		["LX60"] = {
			name = "Mansão LX60",
			type = "Apartament2",
			entrada = {
				['x'] = -126.52,
				['y'] = 588.27,
				['z'] = 204.70
			},
			price = 7000000
	
		},
		["LX61"] = {
			name = "Mansão LX61",
			type = "Apartament2",
			entrada = {
				['x'] = -189.34,
				['y'] = 617.50,
				['z'] = 199.66
			},
			price = 7000000
	
		},
		["LX62"] = {
			name = "Mansão LX62",
			type = "Apartament2",
			entrada = {
				['x'] = -185.43,
				['y'] = 591.21,
				['z'] = 197.82
			},
			price = 7000000
	
		},
		["LX63"] = {
			name = "Mansão LX63",
			type = "Apartament2",
			entrada = {
				['x'] = -232.50,
				['y'] = 588.18,
				['z'] = 190.53
			},
			price = 7000000
	
		},
		["LX64"] = {
			name = "Mansão LX64",
			type = "Apartament2",
			entrada = {
				['x'] = -293.35,
				['y'] = 600.83,
				['z'] = 181.57
			},
			price = 7000000
	
		},
		["LX65"] = {
			name = "Mansão LX65",
			type = "Apartament2",
			entrada = {
				['x'] = -245.81,
				['y'] = 620.88,
				['z'] = 187.81
			},
			price = 7000000
	
		},
		["LX66"] = {
			name = "Mansão LX66",
			type = "Apartament2",
			entrada = {
				['x'] = -340.52,
				['y'] = 625.71,
				['z'] = 171.35
			},
			price = 7000000
	
		},
		["LX67"] = {
			name = "Mansão LX67",
			type = "Apartament2",
			entrada = {
				['x'] = 325.01,
				['y'] = 537.22,
				['z'] = 153.86
			},
			price = 7000000
	
		},
		["LX68"] = {
			name = "Mansão LX68",
			type = "Apartament2",
			entrada = {
				['x'] = 315.82,
				['y'] = 502.03,
				['z'] = 153.17
			},
			price = 7000000
	
		},
		["LX69"] = {
			name = "Mansão LX69",
			type = "Apartament2",
			entrada = {
				['x'] = 331.62,
				['y'] = 465.69,
				['z'] = 151.22
			},
			price = 7000000
	
		},
		["LX70"] = {
			name = "Mansão LX70",
			type = "Apartament2",
			entrada = {
				['x'] = 223.38,
				['y'] = 514.41,
				['z'] = 140.76
			},
			price = 7000000
	
		},
		["LX71"] = {
			name = "Mansão LX71",
			type = "Apartament2",
			entrada = {
				['x'] = 254.8, ['y'] = -1013.1, ['z'] = 29.27
			},
			price = 7000000
		},
		["LX72"] = {
			name = "Mansão LX72",
			type = "Apartament2",
			entrada = {
				['x'] = -747.31, ['y'] = 808.54, ['z'] = 215.04
			},
			price = 7000000
		},
		["LX73"] = {
			name = "Mansão LX73",
			type = "Apartament2",
			entrada = {
				['x'] = -655.16, ['y'] = 802.94, ['z'] = 199.0
			},
			price = 7000000
		},
		["LX74"] = {
			name = "Mansão LX74",
			type = "Apartament2",
			entrada = {
				['x'] = -599.73, ['y'] = 807.59, ['z'] = 191.53
			},
			price = 7000000
		},
		["LX75"] = {
			name = "Mansão LX75",
			type = "Apartament2",
			entrada = {
				['x'] = -595.77, ['y'] = 780.6, ['z'] = 189.12
			},
			price = 7000000
		},
		["LX76"] = {
			name = "Mansão LX76",
			type = "Apartament2",
			entrada = {
				['x'] = -664.51, ['y'] = 742.25, ['z'] = 174.29
			},
			price = 7000000
		},
		-----------------------------------------------------------------------------------------------------------------------------------------
		-----------------------------------------------------SAMIR-------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------
		["LS01"] = {
			name = "Casa LS01",
			type = "Apartament3",
			entrada = {
				['x'] = 1301.10,
				['y'] = -573.77,
				['z'] = 71.73
			},
			price = 350000
	
		},
		["LS02"] = {
			name = "Casa LS02",
			type = "Apartament3",
			entrada = {
				['x'] = 1323.42,
				['y'] = -583.00,
				['z'] = 73.24
			},
			price = 350000
	
		},
		["LS03"] = {
			name = "Casa LS03",
			type = "Apartament3",
			entrada = {
				['x'] = 1341.61,
				['y'] = -597.28,
				['z'] = 74.70
			},
			price = 350000
	
		},
		["LS04"] = {
			name = "Casa LS04",
			type = "Apartament3",
			entrada = {
				['x'] = 1367.20,
				['y'] = -606.17,
				['z'] = 74.71
			},
			price = 350000
	
		},
		["LS05"] = {
			name = "Casa LS05",
			type = "Apartament3",
			entrada = {
				['x'] = 1385.96,
				['y'] = -593.34,
				['z'] = 74.48
			},
			price = 350000
	
		},
		["LS06"] = {
			name = "Casa LS06",
			type = "Apartament3",
			entrada = {
				['x'] = 1388.90,
				['y'] = -569.55,
				['z'] = 74.49
			},
			price = 350000
	
		},
		["LS07"] = {
			name = "Casa LS07",
			type = "Apartament3",
			entrada = {
				['x'] = 1373.31,
				['y'] = -555.68,
				['z'] = 74.68
			},
			price = 350000
	
		},
		["LS08"] = {
			name = "Casa LS08",
			type = "Apartament3",
			entrada = {
				['x'] = 1348.21,
				['y'] = -546.84,
				['z'] = 73.89
			},
			price = 350000
	
		},
		["LS09"] = {
			name = "Casa LS09",
			type = "Apartament3",
			entrada = {
				['x'] = 1328.52,
				['y'] = -535.96,
				['z'] = 72.44
			},
			price = 350000
	
		},
		["LS10"] = {
			name = "Casa LS10",
			type = "Apartament3",
			entrada = {
				['x'] = 1303.12,
				['y'] = -527.50,
				['z'] = 71.46
			},
			price = 350000
	
		},
		["LS11"] = {
			name = "Casa LS11",
			type = "Apartament3",
			entrada = {
				['x'] = 1250.99,
				['y'] = -515.52,
				['z'] = 69.34
			},
			price = 350000
	
		},
		["LS12"] = {
			name = "Casa LS12",
			type = "Apartament3",
			entrada = {
				['x'] = 1251.52,
				['y'] = -494.13,
				['z'] = 69.90
			},
			price = 350000
	
		},
		["LS13"] = {
			name = "Casa LS13",
			type = "Apartament3",
			entrada = {
				['x'] = 1259.47,
				['y'] = -480.16,
				['z'] = 70.18
			},
			price = 350000
	
		},
		["LS14"] = {
			name = "Casa LS14",
			type = "Apartament3",
			entrada = {
				['x'] = 1265.66,
				['y'] = -458.08,
				['z'] = 70.51
			},
			price = 350000
	
		},
		["LS15"] = {
			name = "Casa LS15",
			type = "Apartament3",
			entrada = {
				['x'] = 1262.36,
				['y'] = -429.88,
				['z'] = 70.01
			},
			price = 350000
	
		},
		["LS16"] = {
			name = "Casa LS16",
			type = "Apartament3",
			entrada = {
				['x'] = 1241.33,
				['y'] = -566.37,
				['z'] = 69.65
			},
			price = 350000
	
		},
		["LS17"] = {
			name = "Casa LS17",
			type = "Apartament3",
			entrada = {
				['x'] = 1240.59,
				['y'] = -601.57,
				['z'] = 69.78
			},
			price = 350000
	
		},
		["LS18"] = {
			name = "Casa LS18",
			type = "Apartament3",
			entrada = {
				['x'] = 1250.85,
				['y'] = -620.87,
				['z'] = 69.57
			},
			price = 350000
	
		},
		["LS19"] = {
			name = "Casa LS19",
			type = "Apartament3",
			entrada = {
				['x'] = 1265.46,
				['y'] = -648.34,
				['z'] = 67.92
			},
			price = 350000
	
		},
		["LS20"] = {
			name = "Casa LS20",
			type = "Apartament3",
			entrada = {
				['x'] = 1270.94,
				['y'] = -683.62,
				['z'] = 66.03
			},
			price = 350000
	
		},
		["LS21"] = {
			name = "Casa LS21",
			type = "Apartament3",
			entrada = {
				['x'] = 1264.73,
				['y'] = -702.84,
				['z'] = 64.91
			},
			price = 350000
	
		},
		["LS22"] = {
			name = "Casa LS22",
			type = "Apartament3",
			entrada = {
				['x'] = 1229.60,
				['y'] = -725.43,
				['z'] = 60.95
			},
			price = 350000
	
		},
		["LS23"] = {
			name = "Casa LS23",
			type = "Apartament3",
			entrada = {
				['x'] = 1222.90,
				['y'] = -697.02,
				['z'] = 60.80
			},
			price = 350000
	
		},
		["LS24"] = {
			name = "Casa LS24",
			type = "Apartament3",
			entrada = {
				['x'] = 1221.36,
				['y'] = -669.07,
				['z'] = 63.49
			},
			price = 350000
	
		},
		["LS25"] = {
			name = "Casa LS25",
			type = "Apartament3",
			entrada = {
				['x'] = 1207.25,
				['y'] = -620.35,
				['z'] = 66.43
			},
			price = 350000
	
		},
		["LS26"] = {
			name = "Casa LS26",
			type = "Apartament3",
			entrada = {
				['x'] = 1203.63,
				['y'] = -598.60,
				['z'] = 68.06
			},
			price = 350000
	
		},
		["LS27"] = {
			name = "Casa LS27",
			type = "Apartament3",
			entrada = {
				['x'] = 1201.08,
				['y'] = -575.57,
				['z'] = 69.13
			},
			price = 350000
	
		},
		["LS28"] = {
			name = "Casa LS28",
			type = "Apartament3",
			entrada = {
				['x'] = 1204.88,
				['y'] = -557.77,
				['z'] = 69.61
			},
			price = 350000
	
		},
		["LS29"] = {
			name = "Casa LS29",
			type = "Apartament3",
			entrada = {
				['x'] = 1090.51,
				['y'] = -484.36,
				['z'] = 65.66
			},
			price = 350000
	
		},
		["LS30"] = {
			name = "Casa LS30",
			type = "Apartament3",
			entrada = {
				['x'] = 1098.63,
				['y'] = -464.48,
				['z'] = 67.31
			},
			price = 350000
	
		},
		["LS31"] = {
			name = "Casa LS31",
			type = "Apartament3",
			entrada = {
				['x'] = 1101.05,
				['y'] = -411.33,
				['z'] = 67.55
			},
			price = 350000
	
		},
		["LS32"] = {
			name = "Casa LS32",
			type = "Apartament3",
			entrada = {
				['x'] = 1114.38,
				['y'] = -391.38,
				['z'] = 68.94
			},
			price = 350000
	
		},
		["LS33"] = {
			name = "Casa LS33",
			type = "Apartament3",
			entrada = {
				['x'] = 1060.43,
				['y'] = -378.14,
				['z'] = 68.23
			},
			price = 350000
	
		},
		["LS34"] = {
			name = "Casa LS34",
			type = "Apartament3",
			entrada = {
				['x'] = 1029.29,
				['y'] = -408.86,
				['z'] = 65.94
			},
			price = 350000
	
		},
		["LS35"] = {
			name = "Casa LS35",
			type = "Apartament3",
			entrada = {
				['x'] = 1010.44,
				['y'] = -423.44,
				['z'] = 65.35
			},
			price = 350000
	
		},
		["LS36"] = {
			name = "Casa LS36",
			type = "Apartament3",
			entrada = {
				['x'] = 987.87,
				['y'] = -433.53,
				['z'] = 63.89
			},
			price = 350000
	
		},
		["LS37"] = {
			name = "Casa LS37",
			type = "Apartament3",
			entrada = {
				['x'] = 967.25,
				['y'] = -451.73,
				['z'] = 62.79
			},
			price = 350000
	
		},
		["LS38"] = {
			name = "Casa LS38",
			type = "Apartament3",
			entrada = {
				['x'] = 943.88,
				['y'] = -463.57,
				['z'] = 61.39
			},
			price = 350000
	
		},
		["LS39"] = {
			name = "Casa LS39",
			type = "Apartament3",
			entrada = {
				['x'] = 921.87,
				['y'] = -477.82,
				['z'] = 61.08
			},
			price = 350000
	
		},
		["LS40"] = {
			name = "Casa LS40",
			type = "Apartament3",
			entrada = {
				['x'] = 906.27,
				['y'] = -489.38,
				['z'] = 59.43
			},
			price = 350000
	
		},
		["LS41"] = {
			name = "Casa LS41",
			type = "Apartament3",
			entrada = {
				['x'] = 878.45,
				['y'] = -497.93,
				['z'] = 58.09
			},
			price = 350000
	
		},
		["LS42"] = {
			name = "Casa LS42",
			type = "Apartament3",
			entrada = {
				['x'] = 862.31,
				['y'] = -509.49,
				['z'] = 57.32
			},
			price = 350000
	
		},
		["LS43"] = {
			name = "Casa LS43",
			type = "Apartament3",
			entrada = {
				['x'] = 850.24,
				['y'] = -532.63,
				['z'] = 57.92
			},
			price = 350000
	
		},
		["LS44"] = {
			name = "Casa LS44",
			type = "Apartament3",
			entrada = {
				['x'] = 844.13,
				['y'] = -563.01,
				['z'] = 57.83
			},
			price = 350000
	
		},
		["LS45"] = {
			name = "Casa LS45",
			type = "Apartament3",
			entrada = {
				['x'] = 861.70,
				['y'] = -583.44,
				['z'] = 58.15
			},
			price = 350000
	
		},
		["LS46"] = {
			name = "Casa LS46",
			type = "Apartament3",
			entrada = {
				['x'] = 886.72,
				['y'] = -608.16,
				['z'] = 58.44
			},
			price = 350000
	
		},
		["LS47"] = {
			name = "Casa LS47",
			type = "Apartament3",
			entrada = {
				['x'] = 902.95,
				['y'] = -615.46,
				['z'] = 58.45
			},
			price = 350000
	
		},
		["LS48"] = {
			name = "Casa LS48",
			type = "Apartament3",
			entrada = {
				['x'] = 929.46,
				['y'] = -639.10,
				['z'] = 58.24
			},
			price = 350000
	
		},
		["LS49"] = {
			name = "Casa LS49",
			type = "Apartament3",
			entrada = {
				['x'] = 943.50,
				['y'] = -653.43,
				['z'] = 58.42
			},
			price = 350000
	
		},
		["LS50"] = {
			name = "Casa LS50",
			type = "Apartament3",
			entrada = {
				['x'] = 960.03,
				['y'] = -669.96,
				['z'] = 58.44
			},
			price = 350000
	
		},
		["LS51"] = {
			name = "Casa LS51",
			type = "Apartament3",
			entrada = {
				['x'] = 970.77,
				['y'] = -701.45,
				['z'] = 58.48
			},
			price = 350000
	
		},
		["LS52"] = {
			name = "Casa LS52",
			type = "Apartament3",
			entrada = {
				['x'] = 979.05,
				['y'] = -716.23,
				['z'] = 58.22
			},
			price = 350000
	
		},
		["LS53"] = {
			name = "Casa LS53",
			type = "Apartament3",
			entrada = {
				['x'] = 996.83,
				['y'] = -729.56,
				['z'] = 57.81
			},
			price = 350000
	
		},
		["LS54"] = {
			name = "Casa LS54",
			type = "Apartament3",
			entrada = {
				['x'] = 980.18,
				['y'] = -627.66,
				['z'] = 59.23
			},
			price = 350000
	
		},
		["LS55"] = {
			name = "Casa LS55",
			type = "Apartament3",
			entrada = {
				['x'] = 964.29,
				['y'] = -596.19,
				['z'] = 59.90
			},
			price = 350000
	
		},
		["LS56"] = {
			name = "Casa LS56",
			type = "Apartament3",
			entrada = {
				['x'] = 976.65,
				['y'] = -580.66,
				['z'] = 59.85
			},
			price = 350000
	
		},
		["LS57"] = {
			name = "Casa LS57",
			type = "Apartament3",
			entrada = {
				['x'] = 1009.69,
				['y'] = -572.47,
				['z'] = 60.59
			},
			price = 350000
	
		},
		["LS58"] = {
			name = "Casa LS58",
			type = "Apartament3",
			entrada = {
				['x'] = 930.79,
				['y'] = -245.09,
				['z'] = 69.00
			},
			price = 350000
	
		},
		["LS59"] = {
			name = "Casa LS59",
			type = "Apartament3",
			entrada = {
				['x'] = 999.65,
				['y'] = -593.96,
				['z'] = 59.63
			},
			price = 350000
	
		},
		["LS60"] = {
			name = "Casa LS60",
			type = "Apartament3",
			entrada = {
				['x'] = 919.72,
				['y'] = -569.63,
				['z'] = 58.36
			},
			price = 350000
	
		},
		["LS61"] = {
			name = "Casa LS61",
			type = "Apartament3",
			entrada = {
				['x'] = 965.65,
				['y'] = -542.59,
				['z'] = 59.35
			},
			price = 350000
	
		},
		["LS62"] = {
			name = "Casa LS62",
			type = "Apartament3",
			entrada = {
				['x'] = 987.84,
				['y'] = -525.75,
				['z'] = 60.69
			},
			price = 350000
	
		},
		["LS63"] = {
			name = "Casa LS63",
			type = "Apartament3",
			entrada = {
				['x'] = 1006.02,
				['y'] = -511.29,
				['z'] = 60.83
			},
			price = 350000
	
		},
		["LS64"] = {
			name = "Casa LS64",
			type = "Apartament3",
			entrada = {
				['x'] = 1046.15,
				['y'] = -497.75,
				['z'] = 64.07
			},
			price = 350000
	
		},
		["LS65"] = {
			name = "Casa LS65",
			type = "Apartament3",
			entrada = {
				['x'] = 1051.86,
				['y'] = -470.52,
				['z'] = 63.89
			},
			price = 350000
	
		},
		["LS66"] = {
			name = "Casa LS66",
			type = "Apartament3",
			entrada = {
				['x'] = 1056.21,
				['y'] = -449.00,
				['z'] = 66.25
			},
			price = 350000
	
		},
		["LS67"] = {
			name = "Casa LS67",
			type = "Apartament3",
			entrada = {
				['x'] = 1014.60,
				['y'] = -469.32,
				['z'] = 64.50
			},
			price = 350000
	
		},
		["LS68"] = {
			name = "Casa LS68",
			type = "Apartament3",
			entrada = {
				['x'] = 970.51,
				['y'] = -502.46,
				['z'] = 62.14
			},
			price = 350000
	
		},
		["LS69"] = {
			name = "Casa LS69",
			type = "Apartament3",
			entrada = {
				['x'] = 945.90,
				['y'] = -518.75,
				['z'] = 60.62
			},
			price = 350000
	
		},
		["LS70"] = {
			name = "Casa LS70",
			type = "Apartament3",
			entrada = {
				['x'] = 924.42,
				['y'] = -526.02,
				['z'] = 59.79
			},
			price = 350000
	
		},
		["LS71"] = {
			name = "Casa LS71",
			type = "Apartament3",
			entrada = {
				['x'] = 893.16,
				['y'] = -540.62,
				['z'] = 58.50
			},
			price = 350000
	
		},
		["LS72"] = {
			name = "Casa LS72",
			type = "Apartament3",
			entrada = {
				['x'] = 1099.52,
				['y'] = -437.99,
				['z'] = 67.60
			},
			price = 350000
	
		},
		---------------------------------------------------------------------------------------------------------
		-----------------------------------------BOLLINI---------------------------------------------------------
		---------------------------------------------------------------------------------------------------------
		["BL01"] = {
			name = "Casa BLO01",
			type = "Simples",
			entrada = {
				['x'] = 320.09,
				['y'] = -2100.91,
				['z'] = 18.24
			},
			price = 350000
	
		},
		["BL02"] = {
			name = "Casa BLO02",
			type = "Simples",
			entrada = {
				['x'] = 321.77,
				['y'] = -2100.12,
				['z'] = 18.24
			},
			price = 350000
	
		},
		["BL03"] = {
			name = "Casa BLO03",
			type = "Simples",
			entrada = {
				['x'] = 329.93,
				['y'] = -2095.28,
				['z'] = 18.24
			},
			price = 350000
	
		},
		["BL04"] = {
			name = "Casa BLO04",
			type = "Simples",
			entrada = {
				['x'] = 334.31,
				['y'] = -2092.83,
				['z'] = 18.24
			},
			price = 350000
	
		},
		["BL05"] = {
			name = "Casa BLO05",
			type = "Simples",
			entrada = {
				['x'] = 301.20,
				['y'] = -2076.28,
				['z'] = 17.70
			},
			price = 350000
	
		},
		["BL06"] = {
			name = "Casa BLO06",
			type = "Simples",
			entrada = {
				['x'] = 302.69,
				['y'] = -2080.27,
				['z'] = 17.70
			},
			price = 350000
	
		},
		["BL07"] = {
			name = "Casa BLO07",
			type = "Simples",
			entrada = {
				['x'] = 304.94,
				['y'] = -2086.69,
				['z'] = 17.70
			},
			price = 350000
	
		},
		["BL08"] = {
			name = "Casa BLO08",
			type = "Simples",
			entrada = {
				['x'] = 317.01,
				['y'] = -2043.61,
				['z'] = 20.93
			},
			price = 350000
	
		},
		["BL09"] = {
			name = "Casa BLO09",
			type = "Simples",
			entrada = {
				['x'] = 324.41,
				['y'] = -2049.79,
				['z'] = 20.93
			},
			price = 350000
	
		},
		["BL10"] = {
			name = "Casa BLO10",
			type = "Simples",
			entrada = {
				['x'] = 325.85,
				['y'] = -2051.00,
				['z'] = 20.93
			},
			price = 350000
	
		},
		["BL11"] = {
			name = "Casa BLO11",
			type = "Simples",
			entrada = {
				['x'] = 341.71,
				['y'] = -2064.42,
				['z'] = 20.93
			},
			price = 350000
	
		},
		["BL12"] = {
			name = "Casa BLO12",
			type = "Simples",
			entrada = {
				['x'] = 345.29,
				['y'] = -2067.42,
				['z'] = 20.93
			},
			price = 350000
	
		},
		["BL13"] = {
			name = "Casa BLO13",
			type = "Simples",
			entrada = {
				['x'] = 356.82,
				['y'] = -2074.60,
				['z'] = 21.88
			},
			price = 350000
	
		},
		["BL14"] = {
			name = "Casa BLO14",
			type = "Simples",
			entrada = {
				['x'] = 357.88,
				['y'] = -2073.32,
				['z'] = 21.74
			},
			price = 350000
	
		},
		["BL15"] = {
			name = "Casa BLO15",
			type = "Simples",
			entrada = {
				['x'] = 365.14,
				['y'] = -2064.67,
				['z'] = 21.88
			},
			price = 350000
	
		},
		["BL16"] = {
			name = "Casa BLO16",
			type = "Simples",
			entrada = {
				['x'] = 371.29,
				['y'] = -2057.33,
				['z'] = 21.74
			},
			price = 350000
	
		},
		["BL17"] = {
			name = "Casa BLO17",
			type = "Simples",
			entrada = {
				['x'] = 372.50,
				['y'] = -2055.89,
				['z'] = 21.88
			},
			price = 350000
	
		},
		["BL18"] = {
			name = "Casa BLO18",
			type = "Simples",
			entrada = {
				['x'] = 336.14,
				['y'] = -2021.69,
				['z'] = 22.49
			},
			price = 350000
	
		},
		["BL19"] = {
			name = "Casa BLO19",
			type = "Simples",
			entrada = {
				['x'] = 343.35,
				['y'] = -2027.71,
				['z'] = 22.35
			},
			price = 350000
	
		},
		["BL20"] = {
			name = "Casa BLO20",
			type = "Simples",
			entrada = {
				['x'] = 344.74,
				['y'] = -2028.89,
				['z'] = 22.35
			},
			price = 350000
	
		},
		["BL21"] = {
			name = "Casa BLO21",
			type = "Simples",
			entrada = {
				['x'] = 353.54,
				['y'] = -2036.26,
				['z'] = 22.35
			},
			price = 350000
	
		},
		["BL22"] = {
			name = "Casa BLO22",
			type = "Simples",
			entrada = {
				['x'] = 360.88,
				['y'] = -2042.34,
				['z'] = 22.35
			},
			price = 350000
	
		},
		["BL23"] = {
			name = "Casa BLO23",
			type = "Simples",
			entrada = {
				['x'] = 383.12,
				['y'] = -2037.89,
				['z'] = 23.40
			},
			price = 350000
	
		},
		["BL24"] = {
			name = "Casa BLO24",
			type = "Simples",
			entrada = {
				['x'] = 383.93,
				['y'] = -2035.98,
				['z'] = 23.40
			},
			price = 350000
	
		},
		["BL25"] = {
			name = "Casa BLO25",
			type = "Simples",
			entrada = {
				['x'] = 388.74,
				['y'] = -2025.84,
				['z'] = 23.54
			},
			price = 350000
	
		},
		["BL26"] = {
			name = "Casa BLO26",
			type = "Simples",
			entrada = {
				['x'] = 392.64,
				['y'] = -2017.31,
				['z'] = 23.54
			},
			price = 350000
	
		},
		["BL27"] = {
			name = "Casa BLO27",
			type = "Simples",
			entrada = {
				['x'] = 393.46,
				['y'] = -2015.53,
				['z'] = 23.40
			},
			price = 350000
	
		},
		["BL28"] = {
			name = "Casa BLO28",
			type = "Simples",
			entrada = {
				['x'] = 383.87,
				['y'] = -2006.43,
				['z'] = 24.24
			},
			price = 350000
	
		},
		["BL29"] = {
			name = "Casa BLO29",
			type = "Simples",
			entrada = {
				['x'] = 377.25,
				['y'] = -2004.02,
				['z'] = 24.38
			},
			price = 350000
	
		},
		["BL30"] = {
			name = "Casa BLO30",
			type = "Simples",
			entrada = {
				['x'] = 367.18,
				['y'] = -2000.52,
				['z'] = 24.24
			},
			price = 350000
	
		},
		["BL31"] = {
			name = "Casa BLO31",
			type = "Simples",
			entrada = {
				['x'] = 363.32,
				['y'] = -1998.95,
				['z'] = 24.24
			},
			price = 350000
	
		},
		["BL32"] = {
			name = "Casa BLO32",
			type = "Simples",
			entrada = {
				['x'] = 356.77,
				['y'] = -1996.57,
				['z'] = 24.24
			},
			price = 350000
	
		},
		-----------------------------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------KRONDORS------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------	
		--[[ ["KR01"] = {
			name = "Casa KR01",
			type = "Simples",
			entrada = {
				['x'] = 114.20,
				['y'] = -1961.19,
				['z'] = 21.33
			},
			price = 350000
	
		}, ]]
		["KR02"] = {
			name = "Casa KR02",
			type = "Simples",
			entrada = {
				['x'] = 72.19,
				['y'] = -1938.75,
				['z'] = 21.36
			},
			price = 350000
	
		},
		["KR03"] = {
			name = "Casa KR03",
			type = "Simples",
			entrada = {
				['x'] = 23.38,
				['y'] = -1896.55,
				['z'] = 22.96
			},
			price = 350000
	
		},
		["KR04"] = {
			name = "Casa KR04",
			type = "Simples",
			entrada = {
				['x'] = 100.92,
				['y'] = -1912.19,
				['z'] = 21.40
			},
			price = 350000
	
		},
		["KR05"] = {
			name = "Casa KR05",
			type = "Simples",
			entrada = {
				['x'] = 104.06,
				['y'] = -1885.34,
				['z'] = 24.31
			},
			price = 350000
	
		},
		["KR06"] = {
			name = "Casa KR06",
			type = "Simples",
			entrada = {
				['x'] = 148.71,
				['y'] = -1904.46,
				['z'] = 23.53
			},
			price = 350000
	
		},
		["KR07"] = {
			name = "Casa KR07",
			type = "Simples",
			entrada = {
				['x'] = 165.13,
				['y'] = -1944.99,
				['z'] = 20.23
			},
			price = 350000
	
		},
		["KR08"] = {
			name = "Casa KR08",
			type = "Simples",
			entrada = {
				['x'] = 149.06,
				['y'] = -1960.43,
				['z'] = 19.45
			},
			price = 350000
	
		},
		["KR09"] = {
			name = "Casa KR09",
			type = "Simples",
			entrada = {
				['x'] = 54.45,
				['y'] = -1873.19,
				['z'] = 22.80
			},
			price = 350000
	
		},
		["KR10"] = {
			name = "Casa KR10",
			type = "Simples",
			entrada = {
				['x'] = 45.97,
				['y'] = -1864.21,
				['z'] = 23.27
			},
			price = 350000
	
		},
		["KR11"] = {
			name = "Casa KR11",
			type = "Simples",
			entrada = {
				['x'] = -41.98,
				['y'] = -1792.16,
				['z'] = 27.82
			},
			price = 350000
	
		},
		["KR12"] = {
			name = "Casa KR12",
			type = "Simples",
			entrada = {
				['x'] = -50.47,
				['y'] = -1783.21,
				['z'] = 28.30
			},
			price = 350000
	
		},
		["KR13"] = {
			name = "Casa KR13",
			type = "Simples",
			entrada = {
				['x'] = 150.10,
				['y'] = -1864.80,
				['z'] = 24.59
			},
			price = 350000
	
		},
		["KR14"] = {
			name = "Casa KR14",
			type = "Simples",
			entrada = {
				['x'] = 192.41,
				['y'] = -1883.40,
				['z'] = 25.05
			},
			price = 350000
	
		},
		["KR15"] = {
			name = "Casa KR15",
			type = "Simples",
			entrada = {
				['x'] = 250.06,
				['y'] = -1730.82,
				['z'] = 29.66
			},
			price = 350000
	
		},
		["KR16"] = {
			name = "Casa KR16",
			type = "Simples",
			entrada = {
				['x'] = 282.07,
				['y'] = -1694.70,
				['z'] = 29.64
			},
			price = 350000
	
		},
		["KR17"] = {
			name = "Casa KR17",
			type = "Simples",
			entrada = {
				['x'] = 300.00,
				['y'] = -1783.76,
				['z'] = 28.43
			},
			price = 350000
	
		},
		["KR18"] = {
			name = "Casa KR18",
			type = "Simples",
			entrada = {
				['x'] = 320.69,
				['y'] = -1759.84,
				['z'] = 29.63
			},
			price = 350000
	
		},
		["KR19"] = {
			name = "Casa KR19",
			type = "Simples",
			entrada = {
				['x'] = 152.90,
				['y'] = -1823.49,
				['z'] = 27.86
			},
			price = 350000
	
		},
		["KR20"] = {
			name = "Casa KR20",
			type = "Simples",
			entrada = {
				['x'] = 85.58,
				['y'] = -1959.62,
				['z'] = 21.12
			},
			price = 350000
	
		},
		["KR21"] = {
			name = "Casa KR21",
			type = "Simples",
			entrada = {
				['x'] = 76.80,
				['y'] = -1948.28,
				['z'] = 21.17
			},
			price = 350000
	
		},
		["KR22"] = {
			name = "Casa KR22",
			type = "Simples",
			entrada = {
				['x'] = 56.50,
				['y'] = -1922.66,
				['z'] = 21.91
			},
			price = 350000
	
		},
		["KR23"] = {
			name = "Casa KR23",
			type = "Simples",
			entrada = {
				['x'] = 38.93,
				['y'] = -1911.67,
				['z'] = 21.95
			},
			price = 350000
	
		},
		["KR24"] = {
			name = "Casa KR24",
			type = "Simples",
			entrada = {
				['x'] = -4.81,
				['y'] = -1872.16,
				['z'] = 24.15
			},
			price = 350000
	
		},
		["KR25"] = {
			name = "Casa KR25",
			type = "Simples",
			entrada = {
				['x'] = 5.15,
				['y'] = -1884.32,
				['z'] = 23.69
			},
			price = 350000
	
		},
		["KR26"] = {
			name = "Casa KR26",
			type = "Simples",
			entrada = {
				['x'] = -20.46,
				['y'] = -1858.87,
				['z'] = 25.40
			},
			price = 350000
	
		},
		["KR27"] = {
			name = "Casa KR27",
			type = "Simples",
			entrada = {
				['x'] = -34.29,
				['y'] = -1847.22,
				['z'] = 26.19
			},
			price = 350000
	
		},
		["KR28"] = {
			name = "Casa KR28",
			type = "Simples",
			entrada = {
				['x'] = 126.78,
				['y'] = -1929.97,
				['z'] = 21.38
			},
			price = 350000
	
		},
		["KR29"] = {
			name = "Casa KR29",
			type = "Simples",
			entrada = {
				['x'] = 118.30,
				['y'] = -1920.93,
				['z'] = 21.32
			},
			price = 350000
	
		},
		["KR30"] = {
			name = "Casa KR30",
			type = "Simples",
			entrada = {
				['x'] = 115.40,
				['y'] = -1887.79,
				['z'] = 23.92
			},
			price = 350000
	
		},
		["KR31"] = {
			name = "Casa KR31",
			type = "Simples",
			entrada = {
				['x'] = 179.17,
				['y'] = -1923.90,
				['z'] = 21.37
			},
			price = 350000
	
		},
		["KR32"] = {
			name = "Casa KR32",
			type = "Simples",
			entrada = {
				['x'] = 144.16,
				['y'] = -1968.98,
				['z'] = 18.85
			},
			price = 350000
	
		},
		["KR33"] = {
			name = "Casa KR33",
			type = "Simples",
			entrada = {
				['x'] = 29.74,
				['y'] = -1854.86,
				['z'] = 24.06
			},
			price = 350000
	
		},
		["KR34"] = {
			name = "Casa KR34",
			type = "Simples",
			entrada = {
				['x'] = 21.27,
				['y'] = -1844.70,
				['z'] = 24.60
			},
			price = 350000
	
		},
		["KR35"] = {
			name = "Casa KR35",
			type = "Simples",
			entrada = {
				['x'] = 171.54,
				['y'] = -1871.52,
				['z'] = 24.40
			},
			price = 350000
	
		},
		["KR36"] = {
			name = "Casa KR36",
			type = "Simples",
			entrada = {
				['x'] = 208.54,
				['y'] = -1895.23,
				['z'] = 24.81
			},
			price = 350000
	
		},
		["KR37"] = {
			name = "Casa KR37",
			type = "Simples",
			entrada = {
				['x'] = 304.59,
				['y'] = -1775.41,
				['z'] = 29.10
			},
			price = 350000
	
		},
		["KR38"] = {
			name = "Casa KR38",
			type = "Simples",
			entrada = {
				['x'] = 288.67,
				['y'] = -1792.48,
				['z'] = 28.08
			},
			price = 350000
	
		},
		["KR39"] = {
			name = "Casa KR39",
			type = "Simples",
			entrada = {
				['x'] = 332.96,
				['y'] = -1740.90,
				['z'] = 29.73
			},
			price = 350000
	
		},
		["KR40"] = {
			name = "Casa KR40",
			type = "Simples",
			entrada = {
				['x'] = 257.47,
				['y'] = -1722.74,
				['z'] = 29.65
			},
			price = 350000
	
		},
		["KR41"] = {
			name = "Casa KR41",
			type = "Simples",
			entrada = {
				['x'] = 269.65,
				['y'] = -1712.85,
				['z'] = 29.66
			},
			price = 350000
	
		},
		-----------------------------------------------------------------------------------------------------------------------------------------
		----------------------------------------------------------GROOVEMOTEL--------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------
		["GR01"] = {
			name = "Casa GR01",
			type = "Simples",
			entrada = {
				['x'] = -216.70,
				['y'] = -1674.03,
				['z'] = 34.46
			},
			price = 350000
	
		},
		["GR02"] = {
			name = "Casa GR02",
			type = "Simples",
			entrada = {
				['x'] = -224.32,
				['y'] = -1674.12,
				['z'] = 34.46
			},
			price = 350000
	
		},
		["GR03"] = {
			name = "Casa GR03",
			type = "Simples",
			entrada = {
				['x'] = -224.77,
				['y'] = -1666.44,
				['z'] = 34.46
			},
			price = 350000
	
		},
		["GR04"] = {
			name = "Casa GR04",
			type = "Simples",
			entrada = {
				['x'] = -225.05,
				['y'] = -1649.08,
				['z'] = 35.26
			},
			price = 350000
	
		},
		["GR05"] = {
			name = "Casa GR05",
			type = "Simples",
			entrada = {
				['x'] = -216.39,
				['y'] = -1648.69,
				['z'] = 34.46
			},
			price = 350000
	
		},
		["GR06"] = {
			name = "Casa GR06",
			type = "Simples",
			entrada = {
				['x'] = -212.20,
				['y'] = -1660.76,
				['z'] = 34.46
			},
			price = 350000
	
		},
		["GR07"] = {
			name = "Casa GR07",
			type = "Simples",
			entrada = {
				['x'] = -212.47,
				['y'] = -1668.00,
				['z'] = 34.46
			},
			price = 350000
	
		},
		["GR08"] = {
			name = "Casa GR08",
			type = "Simples",
			entrada = {
				['x'] = -216.58,
				['y'] = -1674.39,
				['z'] = 37.63
			},
			price = 350000
	
		},
		["GR09"] = {
			name = "Casa GR09",
			type = "Simples",
			entrada = {
				['x'] = -224.21,
				['y'] = -1674.42,
				['z'] = 37.63
			},
			price = 350000
	
		},
		["GR10"] = {
			name = "Casa GR10",
			type = "Simples",
			entrada = {
				['x'] = -224.95,
				['y'] = -1666.36,
				['z'] = 37.63
			},
			price = 350000
	
		},
		["GR11"] = {
			name = "Casa GR11",
			type = "Simples",
			entrada = {
				['x'] = -224.90,
				['y'] = -1654.06,
				['z'] = 37.63
			},
			price = 350000
	
		},
		["GR12"] = {
			name = "Casa GR12",
			type = "Simples",
			entrada = {
				['x'] = -224.10,
				['y'] = -1648.57,
				['z'] = 38.44
			},
			price = 350000
	
		},
		["GR13"] = {
			name = "Casa GR13",
			type = "Simples",
			entrada = {
				['x'] = -216.62,
				['y'] = -1648.51,
				['z'] = 37.63
			},
			price = 350000
	
		},
		["GR14"] = {
			name = "Casa GR14",
			type = "Simples",
			entrada = {
				['x'] = -212.40,
				['y'] = -1660.81,
				['z'] = 37.63
			},
			price = 350000
	
		},
		["GR15"] = {
			name = "Casa GR15",
			type = "Simples",
			entrada = {
				['x'] = -212.19,
				['y'] = -1668.16,
				['z'] = 37.63
			},
			price = 350000
	
		},
		-----------------------------------------------------------------------------------------------------------------------------------------
		----------------------------------------------------------ALLSUELLMOTEL------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------	
		["AS01"] = {
			name = "Casa AS01",
			type = "Simples",
			entrada = {
				['x'] = -208.94,
				['y'] = -1600.58,
				['z'] = 34.86
			},
			price = 350000
	
		},
		["AS02"] = {
			name = "Casa AS02",
			type = "Simples",
			entrada = {
				['x'] = -210.10,
				['y'] = -1606.94,
				['z'] = 34.86
			},
			price = 350000
	
		},
		["AS03"] = {
			name = "Casa AS03",
			type = "Simples",
			entrada = {
				['x'] = -212.06,
				['y'] = -1617.16,
				['z'] = 34.86
			},
			price = 350000
	
		},
		["AS04"] = {
			name = "Casa AS04",
			type = "Simples",
			entrada = {
				['x'] = -213.24,
				['y'] = -1618.07,
				['z'] = 34.86
			},
			price = 350000
	
		},
		["AS05"] = {
			name = "Casa AS05",
			type = "Simples",
			entrada = {
				['x'] = -222.93,
				['y'] = -1617.39,
				['z'] = 34.86
			},
			price = 350000
	
		},
		["AS06"] = {
			name = "Casa AS06",
			type = "Simples",
			entrada = {
				['x'] = -223.06,
				['y'] = -1601.18,
				['z'] = 34.88
			},
			price = 350000
	
		},
		["AS07"] = {
			name = "Casa AS07",
			type = "Simples",
			entrada = {
				['x'] = -223.12,
				['y'] = -1585.80,
				['z'] = 34.86
			},
			price = 350000
	
		},
		["AS08"] = {
			name = "Casa AS08",
			type = "Simples",
			entrada = {
				['x'] = -219.23,
				['y'] = -1579.95,
				['z'] = 34.86
			},
			price = 350000
	
		},
		["AS09"] = {
			name = "Casa AS09",
			type = "Simples",
			entrada = {
				['x'] = -215.73,
				['y'] = -1576.33,
				['z'] = 34.86
			},
			price = 350000
	
		},
		["AS10"] = {
			name = "Casa AS10",
			type = "Simples",
			entrada = {
				['x'] = -205.59,
				['y'] = -1585.50,
				['z'] = 34.86
			},
			price = 350000
	
		},
		["AS12"] = {
			name = "Casa AS12",
			type = "Simples",
			entrada = {
				['x'] = -205.69,
				['y'] = -1585.57,
				['z'] = 38.05
			},
			price = 350000
	
		},
		["AS13"] = {
			name = "Casa AS13",
			type = "Simples",
			entrada = {
				['x'] = -215.67,
				['y'] = -1576.41,
				['z'] = 38.05
			},
			price = 350000
	
		},
		["AS14"] = {
			name = "Casa AS14",
			type = "Simples",
			entrada = {
				['x'] = -219.35,
				['y'] = -1580.01,
				['z'] = 38.05
			},
			price = 350000
	
		},
		["AS15"] = {
			name = "Casa AS15",
			type = "Simples",
			entrada = {
				['x'] = -223.10,
				['y'] = -1585.73,
				['z'] = 38.05
			},
			price = 350000
	
		},
		["AS16"] = {
			name = "Casa AS16",
			type = "Simples",
			entrada = {
				['x'] = -223.07,
				['y'] = -1601.21,
				['z'] = 38.05
			},
			price = 350000
	
		},
		["AS17"] = {
			name = "Casa AS17",
			type = "Simples",
			entrada = {
				['x'] = -223.04,
				['y'] = -1617.58,
				['z'] = 38.05
			},
			price = 350000
	
		},
		["AS18"] = {
			name = "Casa AS18",
			type = "Simples",
			entrada = {
				['x'] = -213.38,
				['y'] = -1618.15,
				['z'] = 38.05
			},
			price = 350000
	
		},
		["AS19"] = {
			name = "Casa AS19",
			type = "Simples",
			entrada = {
				['x'] = -212.10,
				['y'] = -1617.38,
				['z'] = 38.05
			},
			price = 350000
	
		},
		["AS20"] = {
			name = "Casa AS20",
			type = "Simples",
			entrada = {
				['x'] = -210.03,
				['y'] = -1607.10,
				['z'] = 38.04
			},
			price = 350000
	
		},
		["AS21"] = {
			name = "Casa AS21",
			type = "Simples",
			entrada = {
				['x'] = -208.71,
				['y'] = -1600.51,
				['z'] = 38.04
			},
			price = 350000
	
		},
		-----------------------------------------------------------------------------------------------------------------------------------------
		-----------------------------------------------------------PINKCAGEMOTEL-----------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------
		["PC01"] = {
			name = "Casa PC01",
			type = "Simples",
			entrada = {
				['x'] = 312.88,
				['y'] = -218.36,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC02"] = {
			name = "Casa PC02",
			type = "Simples",
			entrada = {
				['x'] = 310.87,
				['y'] = -217.76,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC03"] = {
			name = "Casa PC03",
			type = "Simples",
			entrada = {
				['x'] = 307.27,
				['y'] = -216.54,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC04"] = {
			name = "Casa PC04",
			type = "Simples",
			entrada = {
				['x'] = 307.50,
				['y'] = -213.30,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC05"] = {
			name = "Casa PC05",
			type = "Simples",
			entrada = {
				['x'] = 309.77,
				['y'] = -207.99,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC06"] = {
			name = "Casa PC06",
			type = "Simples",
			entrada = {
				['x'] = 311.58,
				['y'] = -203.49,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC07"] = {
			name = "Casa PC07",
			type = "Simples",
			entrada = {
				['x'] = 313.61,
				['y'] = -198.32,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC08"] = {
			name = "Casa PC08",
			type = "Simples",
			entrada = {
				['x'] = 315.75,
				['y'] = -194.90,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC09"] = {
			name = "Casa PC09",
			type = "Simples",
			entrada = {
				['x'] = 319.28,
				['y'] = -196.46,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC10"] = {
			name = "Casa PC10",
			type = "Simples",
			entrada = {
				['x'] = 321.34,
				['y'] = -197.13,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC11"] = {
			name = "Casa PC11",
			type = "Simples",
			entrada = {
				['x'] = 312.96,
				['y'] = -218.76,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC12"] = {
			name = "Casa PC12",
			type = "Simples",
			entrada = {
				['x'] = 310.94,
				['y'] = -217.95,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC13"] = {
			name = "Casa PC13",
			type = "Simples",
			entrada = {
				['x'] = 307.24,
				['y'] = -216.41,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC14"] = {
			name = "Casa PC14",
			type = "Simples",
			entrada = {
				['x'] = 307.79,
				['y'] = -213.45,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC15"] = {
			name = "Casa PC15",
			type = "Simples",
			entrada = {
				['x'] = 309.59,
				['y'] = -208.10,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC16"] = {
			name = "Casa PC16",
			type = "Simples",
			entrada = {
				['x'] = 311.35,
				['y'] = -203.39,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC17"] = {
			name = "Casa PC17",
			type = "Simples",
			entrada = {
				['x'] = 313.59,
				['y'] = -198.14,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC18"] = {
			name = "Casa PC18",
			type = "Simples",
			entrada = {
				['x'] = 315.75,
				['y'] = -194.84,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC19"] = {
			name = "Casa PC19",
			type = "Simples",
			entrada = {
				['x'] = 319.46,
				['y'] = -196.27,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC20"] = {
			name = "Casa PC20",
			type = "Simples",
			entrada = {
				['x'] = 321.33,
				['y'] = -197.06,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC21"] = {
			name = "Casa PC21",
			type = "Simples",
			entrada = {
				['x'] = 329.36,
				['y'] = -224.93,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC22"] = {
			name = "Casa PC22",
			type = "Simples",
			entrada = {
				['x'] = 331.43,
				['y'] = -225.68,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC23"] = {
			name = "Casa PC23",
			type = "Simples",
			entrada = {
				['x'] = 334.86,
				['y'] = -227.26,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC24"] = {
			name = "Casa PC24",
			type = "Simples",
			entrada = {
				['x'] = 337.09,
				['y'] = -224.72,
				['z'] = 54.23
			},
			-- entrada = {['x'] =  336.99, ['y'] = -224.65, ['z'] = 54.22},   
			price = 350000
	
		},
		["PC25"] = {
			name = "Casa PC25",
			type = "Simples",
			entrada = {
				['x'] = 338.93,
				['y'] = -219.46,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC26"] = {
			name = "Casa PC26",
			type = "Simples",
			entrada = {
				['x'] = 340.81,
				['y'] = -214.83,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC27"] = {
			name = "Casa PC27",
			type = "Simples",
			entrada = {
				['x'] = 342.61,
				['y'] = -209.53,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC28"] = {
			name = "Casa PC28",
			type = "Simples",
			entrada = {
				['x'] = 344.64,
				['y'] = -205.05,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC29"] = {
			name = "Casa PC29",
			type = "Simples",
			entrada = {
				['x'] = 346.67,
				['y'] = -199.78,
				['z'] = 54.22
			},
			price = 350000
	
		},
		["PC30"] = {
			name = "Casa PC30",
			type = "Simples",
			entrada = {
				['x'] = 329.41,
				['y'] = -225.09,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC31"] = {
			name = "Casa PC31",
			type = "Simples",
			entrada = {
				['x'] = 331.46,
				['y'] = -225.88,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC32"] = {
			name = "Casa PC32",
			type = "Simples",
			entrada = {
				['x'] = 334.99,
				['y'] = -227.21,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC33"] = {
			name = "Casa PC33",
			type = "Simples",
			entrada = {
				['x'] = 337.04,
				['y'] = -224.78,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC34"] = {
			name = "Casa PC34",
			type = "Simples",
			entrada = {
				['x'] = 339.01,
				['y'] = -219.49,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC35"] = {
			name = "Casa PC35",
			type = "Simples",
			entrada = {
				['x'] = 340.73,
				['y'] = -214.79,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC36"] = {
			name = "Casa PC36",
			type = "Simples",
			entrada = {
				['x'] = 342.70,
				['y'] = -209.69,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC37"] = {
			name = "Casa PC37",
			type = "Simples",
			entrada = {
				['x'] = 344.50,
				['y'] = -205.03,
				['z'] = 58.01
			},
			price = 350000
	
		},
		["PC38"] = {
			name = "Casa PC38",
			type = "Simples",
			entrada = {
				['x'] = 346.62,
				['y'] = -199.76,
				['z'] = 58.01
			},
			price = 350000
	
		},

		-----------------------------------------------------------------------------------------------------------------------------------------
		------------------------------------------------------------PALETOMOTEL------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------	
		["PL01"] = {
			name = "Casa PL01",
			type = "Simples",
			entrada = {
				['x'] = -111.15,
				['y'] = 6322.90,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL02"] = {
			name = "Casa PL02",
			type = "Simples",
			entrada = {
				['x'] = -114.31,
				['y'] = 6326.05,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL03"] = {
			name = "Casa PL03",
			type = "Simples",
			entrada = {
				['x'] = -120.24,
				['y'] = 6327.25,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL04"] = {
			name = "Casa PL04",
			type = "Simples",
			entrada = {
				['x'] = -111.11,
				['y'] = 6322.87,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL05"] = {
			name = "Casa PL05",
			type = "Simples",
			entrada = {
				['x'] = -114.30,
				['y'] = 6326.04,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL06"] = {
			name = "Casa PL06",
			type = "Simples",
			entrada = {
				['x'] = -120.26,
				['y'] = 6327.23,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL07"] = {
			name = "Casa PL07",
			type = "Simples",
			entrada = {
				['x'] = -103.43,
				['y'] = 6330.66,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL08"] = {
			name = "Casa PL08",
			type = "Simples",
			entrada = {
				['x'] = -106.70,
				['y'] = 6333.93,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL09"] = {
			name = "Casa PL09",
			type = "Simples",
			entrada = {
				['x'] = -107.61,
				['y'] = 6339.86,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL11"] = {
			name = "Casa PL11",
			type = "Simples",
			entrada = {
				['x'] = -98.96,
				['y'] = 6348.53,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL12"] = {
			name = "Casa PL12",
			type = "Simples",
			entrada = {
				['x'] = -93.54,
				['y'] = 6353.90,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL13"] = {
			name = "Casa PL13",
			type = "Simples",
			entrada = {
				['x'] = -90.26,
				['y'] = 6357.22,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL14"] = {
			name = "Casa PL14",
			type = "Simples",
			entrada = {
				['x'] = -84.83,
				['y'] = 6362.56,
				['z'] = 31.57
			},
			price = 350000
	
		},
		["PL15"] = {
			name = "Casa PL15",
			type = "Simples",
			entrada = {
				['x'] = -103.39,
				['y'] = 6330.68,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL16"] = {
			name = "Casa PL16",
			type = "Simples",
			entrada = {
				['x'] = -106.65,
				['y'] = 6333.97,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL17"] = {
			name = "Casa PL17",
			type = "Simples",
			entrada = {
				['x'] = -107.63,
				['y'] = 6339.85,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL18"] = {
			name = "Casa PL18",
			type = "Simples",
			entrada = {
				['x'] = -102.21,
				['y'] = 6345.27,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL19"] = {
			name = "Casa PL19",
			type = "Simples",
			entrada = {
				['x'] = -98.94,
				['y'] = 6348.54,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL20"] = {
			name = "Casa PL20",
			type = "Simples",
			entrada = {
				['x'] = -93.52,
				['y'] = 6353.94,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL21"] = {
			name = "Casa PL21",
			type = "Simples",
			entrada = {
				['x'] = -90.25,
				['y'] = 6357.18,
				['z'] = 35.50
			},
			price = 350000
	
		},
		["PL22"] = {
			name = "Casa PL22",
			type = "Simples",
			entrada = {
				['x'] = -84.88,
				['y'] = 6362.61,
				['z'] = 35.50
			},
			price = 350000
	
		},
		-----------------------------------------------------------------------------------------------------------------------------------------
		-------------------------------------------------------------PALETOBAY-------------------------------------------------------------------
		----------------------------------------------------------------------------------------------------------------------------------------- 
		["PB01"] = {
			name = "Casa PB01",
			type = "Simples",
			entrada = {
				['x'] = -442.29,
				['y'] = 6197.89,
				['z'] = 29.56
			},
			price = 350000
	
		},
		["PB02"] = {
			name = "Casa PB02",
			type = "Simples",
			entrada = {
				['x'] = -374.56,
				['y'] = 6190.99,
				['z'] = 31.73
			},
			price = 350000
	
		},
		["PB03"] = {
			name = "Casa PB03",
			type = "Simples",
			entrada = {
				['x'] = -356.61,
				['y'] = 6207.16,
				['z'] = 31.85
			},
			price = 350000
	
		},
		["PB04"] = {
			name = "Casa PB04",
			type = "Simples",
			entrada = {
				['x'] = -347.22,
				['y'] = 6225.07,
				['z'] = 31.89
			},
			price = 350000
	
		},
		["PB05"] = {
			name = "Casa PB05",
			type = "Simples",
			entrada = {
				['x'] = -379.82,
				['y'] = 6253.01,
				['z'] = 31.86
			},
			price = 350000
	
		},
		["PB06"] = {
			name = "Casa PB06",
			type = "Simples",
			entrada = {
				['x'] = -360.13,
				['y'] = 6260.73,
				['z'] = 31.91
			},
			price = 350000
	
		},
		["PB07"] = {
			name = "Casa PB07",
			type = "Simples",
			entrada = {
				['x'] = -437.79,
				['y'] = 6272.66,
				['z'] = 30.07
			},
			price = 350000
	
		},
		["PB08"] = {
			name = "Casa PB08",
			type = "Simples",
			entrada = {
				['x'] = -406.99,
				['y'] = 6313.96,
				['z'] = 28.95
			},
			price = 350000
	
		},
		["PB09"] = {
			name = "Casa PB09",
			type = "Simples",
			entrada = {
				['x'] = -359.36,
				['y'] = 6334.30,
				['z'] = 29.85
			},
			price = 350000
	
		},
		["PB10"] = {
			name = "Casa PB10",
			type = "Simples",
			entrada = {
				['x'] = -332.87,
				['y'] = 6302.55,
				['z'] = 33.09
			},
			price = 350000
	
		},
		["PB11"] = {
			name = "Casa PB11",
			type = "Simples",
			entrada = {
				['x'] = -302.59,
				['y'] = 6327.41,
				['z'] = 32.89
			},
			price = 350000
	
		},
		["PB12"] = {
			name = "Casa PB12",
			type = "Simples",
			entrada = {
				['x'] = -280.75,
				['y'] = 6351.00,
				['z'] = 32.61
			},
			price = 350000
	
		},
		["PB13"] = {
			name = "Casa PB13",
			type = "Simples",
			entrada = {
				['x'] = -248.23,
				['y'] = 6370.32,
				['z'] = 31.85
			},
			price = 350000
	
		},
		["PB14"] = {
			name = "Casa PB14",
			type = "Simples",
			entrada = {
				['x'] = -272.34,
				['y'] = 6400.45,
				['z'] = 31.51
			},
			price = 350000
	
		},
		["PB15"] = {
			name = "Casa PB15",
			type = "Simples",
			entrada = {
				['x'] = -227.29,
				['y'] = 6377.57,
				['z'] = 31.76
			},
			price = 350000
	
		},
		["PB16"] = {
			name = "Casa PB16",
			type = "Simples",
			entrada = {
				['x'] = -246.34,
				['y'] = 6414.13,
				['z'] = 31.47
			},
			price = 350000
	
		},
		["PB17"] = {
			name = "Casa PB17",
			type = "Simples",
			entrada = {
				['x'] = -213.88,
				['y'] = 6396.34,
				['z'] = 33.09
			},
			price = 350000
	
		},
		["PB18"] = {
			name = "Casa PB18",
			type = "Simples",
			entrada = {
				['x'] = -214.75,
				['y'] = 6444.67,
				['z'] = 31.32
			},
			price = 350000
	
		},
		["PB19"] = {
			name = "Casa PB19",
			type = "Simples",
			entrada = {
				['x'] = -188.95,
				['y'] = 6409.66,
				['z'] = 32.30
			},
			price = 350000
	
		},
		["PB20"] = {
			name = "Casa PB20",
			type = "Simples",
			entrada = {
				['x'] = -130.48,
				['y'] = 6551.63,
				['z'] = 29.53
			},
			price = 350000
	
		},
		["PB21"] = {
			name = "Casa PB21",
			type = "Simples",
			entrada = {
				['x'] = -105.55,
				['y'] = 6528.94,
				['z'] = 30.17
			},
			price = 350000
	
		},
		["PB22"] = {
			name = "Casa PB22",
			type = "Simples",
			entrada = {
				['x'] = -44.49,
				['y'] = 6582.28,
				['z'] = 32.18
			},
			price = 350000
	
		},
		["PB23"] = {
			name = "Casa PB23",
			type = "Simples",
			entrada = {
				['x'] = -15.07,
				['y'] = 6557.62,
				['z'] = 33.25
			},
			price = 350000
	
		},
		["PB24"] = {
			name = "Casa PB24",
			type = "Simples",
			entrada = {
				['x'] = 4.35,
				['y'] = 6568.17,
				['z'] = 33.08
			},
			price = 350000
	
		},
		["PB25"] = {
			name = "Casa PB25",
			type = "Simples",
			entrada = {
				['x'] = -26.75,
				['y'] = 6597.54,
				['z'] = 31.87
			},
			price = 350000
	
		},
		["PB26"] = {
			name = "Casa PB26",
			type = "Simples",
			entrada = {
				['x'] = -41.25,
				['y'] = 6637.17,
				['z'] = 31.09
			},
			price = 350000
	
		},
		["PB27"] = {
			name = "Casa PB27",
			type = "Simples",
			entrada = {
				['x'] = -9.24,
				['y'] = 6653.67,
				['z'] = 31.27
			},
			price = 350000
	
		},
		["PB28"] = {
			name = "Casa PB28",
			type = "Simples",
			entrada = {
				['x'] = 1.45,
				['y'] = 6613.03,
				['z'] = 31.88
			},
			price = 350000
	
		},
		["PB29"] = {
			name = "Casa PB29",
			type = "Simples",
			entrada = {
				['x'] = 31.19,
				['y'] = 6596.54,
				['z'] = 32.83
			},
			price = 350000
	
		},
		["PB30"] = {
			name = "Casa PB30",
			type = "Simples",
			entrada = {
				['x'] = 35.33,
				['y'] = 6662.84,
				['z'] = 32.20
			},
			price = 350000
	
		},
		["PB31"] = {
			name = "Casa PB31",
			type = "Simples",
			entrada = {
				['x'] = 56.6,
				['y'] = 6646.33,
				['z'] = 32.28
			},
			price = 350000
	
		},
		-----------------------------------------------------------------------------------------------------------------------------------------
		-----------------------------------------------------FAVELAS------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------
		["Barragem01"] = {
			name = "Morro da Barragem 01",
			type = "Simples",
			entrada = {
				['x'] = 1295.09, ['y'] = -243.7, ['z'] = 96.94
			},
			price = 100000
		},

		["Barragem02"] = {
			name = "Morro da Barragem 02",
			type = "Simples",
			entrada = {
				['x'] = 1275.19, ['y'] = -238.44, ['z'] = 98.41
			},
			price = 100000
		},

		["Barragem03"] = {
			name = "Morro da Barragem 03",
			type = "Simples",
			entrada = {
				['x'] = 1281.61, ['y'] = -224.91, ['z'] = 99.15
			},
			price = 100000
		},

		["Barragem04"] = {
			name = "Morro da Barragem 04",
			type = "Simples",
			entrada = {
				['x'] = 1279.43, ['y'] = -196.7, ['z'] = 102.35
			},
			price = 100000
		},

		["Barragem05"] = {
			name = "Morro da Barragem 05",
			type = "Simples",
			entrada = {
				['x'] = 1316.29, ['y'] = -172.54, ['z'] = 109.16
			},
			price = 100000
		},

		["Barragem06"] = {
			name = "Morro da Barragem 06",
			type = "Simples",
			entrada = {
				['x'] = 1333.92, ['y'] = -161.33, ['z'] = 111.93
			},
			price = 100000
		},

		["Barragem07"] = {
			name = "Morro da Barragem 07",
			type = "Simples",
			entrada = {
				['x'] = 1325.56, ['y'] = -141.08, ['z'] = 115.15
			},
			price = 100000
		},

		["Barragem08"] = {
			name = "Morro da Barragem 08",
			type = "Simples",
			entrada = {
				['x'] = 1332.73, ['y'] = -115.7, ['z'] = 120.13
			},
			price = 100000
		},

		["Barragem09"] = {
			name = "Morro da Barragem 09",
			type = "Simples",
			entrada = {
				['x'] = 1364.95, ['y'] = -118.99, ['z'] = 123.77
			},
			price = 100000
		},

		["Barragem10"] = {
			name = "Morro da Barragem 10",
			type = "Simples",
			entrada = {
				['x'] = 1307.53, ['y'] = -192.35, ['z'] = 106.56
			},
			price = 100000
		},

		["Barragem11"] = {
			name = "Morro da Barragem 11",
			type = "Simples",
			entrada = {
				['x'] = 1397.35, ['y'] = -116.06, ['z'] = 129.04
			},
			price = 100000
		},

		["Barragem12"] = {
			name = "Morro da Barragem 12",
			type = "Simples",
			entrada = {
				['x'] = 1417.39, ['y'] = -130.86, ['z'] = 132.68
			},
			price = 100000
		},

		["Barragem13"] = {
			name = "Morro da Barragem 13",
			type = "Simples",
			entrada = {
				['x'] = 1445.2, ['y'] = -130.44, ['z'] = 138.21
			},
			price = 100000
		},

		["Barragem14"] = {
			name = "Morro da Barragem 14",
			type = "Simples",
			entrada = {
				['x'] = 1453.74, ['y'] = -117.31, ['z'] = 140.4
			},
			price = 100000
		},

		["Barragem15"] = {
			name = "Morro da Barragem 15",
			type = "Simples",
			entrada = {
				['x'] = 1477.83, ['y'] = -107.76, ['z'] = 144.99
			},
			price = 100000
		},

		["Barragem16"] = {
			name = "Morro da Barragem 16",
			type = "Simples",
			entrada = {
				['x'] = 1498.17, ['y'] = -110.84, ['z'] = 147.99
			},
			price = 100000
		},

		["Barragem17"] = {
			name = "Morro da Barragem 17",
			type = "Simples",
			entrada = {
				['x'] = 1533.93, ['y'] = -88.23, ['z'] = 156.66
			},
			price = 100000
		},

		["Barragem18"] = {
			name = "Morro da Barragem 18",
			type = "Simples",
			entrada = {
				['x'] = 1574.16, ['y'] = -67.8, ['z'] = 160.94
			},
			price = 100000
		},

		["Barragem19"] = {
			name = "Morro da Barragem 19",
			type = "Simples",
			entrada = {
				['x'] = 1600.94, ['y'] = -69.86, ['z'] = 164.01
			},
			price = 100000
		},

		["Barragem20"] = {
			name = "Morro da Barragem 20",
			type = "Simples",
			entrada = {
				['x'] = 1627.48, ['y'] = -89.38, ['z'] = 167.07
			},
			price = 100000
		},

		["Barragem21"] = {
			name = "Morro da Barragem 21",
			type = "Simples",
			entrada = {
				['x'] = 1650.19, ['y'] = -80.23, ['z'] = 171.67
			},
			price = 100000
		},

		["Barragem22"] = {
			name = "Morro da Barragem 22",
			type = "Simples",
			entrada = {
				['x'] = 1244.86, ['y'] = -113.94, ['z'] = 64.17
			},
			price = 100000
		},

		["Barragem23"] = {
			name = "Morro da Barragem 23",
			type = "Simples",
			entrada = {
				['x'] = 1229.78, ['y'] = -129.26, ['z'] = 64.18
			},
			price = 100000
		},

		["Barragem24"] = {
			name = "Morro da Barragem 24",
			type = "Simples",
			entrada = {
				['x'] = 1236.22, ['y'] = -97.36, ['z'] = 64.18
			},
			price = 100000
		},

		["Barragem25"] = {
			name = "Morro da Barragem 25",
			type = "Simples",
			entrada = {
				['x'] = 1214.22, ['y'] = -115.75, ['z'] = 64.18
			},
			price = 100000
		},

		["França01"] = {
			name = "Morro da França 01",
			type = "Simples",
			entrada = {
				['x'] = -2403.95, ['y'] = 1760.21, ['z'] = 187.63
			},
			price = 100000
		},

		["França02"] = {
			name = "Morro da França 02",
			type = "Simples",
			entrada = {
				['x'] = -2416.67, ['y'] = 1777.81, ['z'] = 187.62
			},
			price = 100000
		},

		["França03"] = {
			name = "Morro da França 03",
			type = "Simples",
			entrada = {
				['x'] = -2442.25, ['y'] = 1805.43, ['z'] = 180.6
			},
			price = 100000
		},

		["França04"] = {
			name = "Morro da França 04",
			type = "Simples",
			entrada = {
				['x'] = -2460.75, ['y'] = 1820.13, ['z'] = 177.04
			},
			price = 100000
		},

		["França05"] = {
			name = "Morro da França 05",
			type = "Simples",
			entrada = {
				['x'] = -2488.05, ['y'] = 1849.19, ['z'] = 177.02
			},
			price = 100000
		},
		
		["França06"] = {
			name = "Morro da França 06",
			type = "Simples",
			entrada = {
				['x'] = -2513.86, ['y'] = 1864.9, ['z'] = 172.47
			},
			price = 100000
		},

		["França07"] = {
			name = "Morro da França 07",
			type = "Simples",
			entrada = {
				['x'] = -2441.28, ['y'] = 1823.81, ['z'] = 191.66
			},
			price = 100000
		},

		["França08"] = {
			name = "Morro da França 08",
			type = "Simples",
			entrada = {
				['x'] = -2454.94, ['y'] = 1836.32, ['z'] = 191.66
			},
			price = 100000
		},

		["França09"] = {
			name = "Morro da França 09",
			type = "Simples",
			entrada = {
				['x'] = -2473.84, ['y'] = 1855.63, ['z'] = 188.62
			},
			price = 100000
		},

		["França10"] = {
			name = "Morro da França 10",
			type = "Simples",
			entrada = {
				['x'] = -2493.37, ['y'] = 1883.16, ['z'] = 185.55
			},
			price = 100000
		},

		["França11"] = {
			name = "Morro da França 11",
			type = "Simples",
			entrada = {
				['x'] = -2395.83, ['y'] = 1790.79, ['z'] = 199.91
			},
			price = 100000
		},

		["França12"] = {
			name = "Morro da França 12",
			type = "Simples",
			entrada = {
				['x'] = -2406.39, ['y'] = 1803.63, ['z'] = 199.91
			},
			price = 100000
		},

		["França13"] = {
			name = "Morro da França 13",
			type = "Simples",
			entrada = {
				['x'] = -2424.13, ['y'] = 1820.33, ['z'] = 197.8
			},
			price = 100000
		},

		["França14"] = {
			name = "Morro da França 14",
			type = "Simples",
			entrada = {
				['x'] = -2444.02, ['y'] = 1836.66, ['z'] = 197.8
			},
			price = 100000
		},

		["França15"] = {
			name = "Morro da França 15",
			type = "Simples",
			entrada = {
				['x'] = -2446.97, ['y'] = 1844.41, ['z'] = 201.08
			},
			price = 100000
		},

		["França16"] = {
			name = "Morro da França 16",
			type = "Simples",
			entrada = {
				['x'] = -2380.25, ['y'] = 1721.18, ['z'] = 212.14
			},
			price = 100000
		},

		["França17"] = {
			name = "Morro da França 17",
			type = "Simples",
			entrada = {
				['x'] = -2371.98, ['y'] = 1773.64, ['z'] = 212.13
			},
			price = 100000
		},

		["França18"] = {
			name = "Morro da França 18",
			type = "Simples",
			entrada = {
				['x'] = -2388.01, ['y'] = 1801.4, ['z'] = 212.13
			},
			price = 100000
		},

		["França19"] = {
			name = "Morro da França 19",
			type = "Simples",
			entrada = {
				['x'] = -2386.4, ['y'] = 1835.28, ['z'] = 218.27
			},
			price = 100000
		},

		["França20"] = {
			name = "Morro da França 20",
			type = "Simples",
			entrada = {
				['x'] = -2369.29, ['y'] = 1842.17, ['z'] = 218.27
			},
			price = 100000
		},

		["França21"] = {
			name = "Morro da França 21",
			type = "Simples",
			entrada = {
				['x'] = -2369.05, ['y'] = 1852.31, ['z'] = 209.11
			},
			price = 100000
		},

		["França22"] = {
			name = "Morro da França 22",
			type = "Simples",
			entrada = {
				['x'] = -2404.69, ['y'] = 1884.19, ['z'] = 209.1
			},
			price = 100000
		},

		["França23"] = {
			name = "Morro da França 23",
			type = "Simples",
			entrada = {
				['x'] = -2436.98, ['y'] = 1873.44, ['z'] = 209.11
			},
			price = 100000
		},

		["França24"] = {
			name = "Morro da França 24",
			type = "Simples",
			entrada = {
				['x'] = -2468.31, ['y'] = 1902.08, ['z'] = 199.91
			},
			price = 100000
		},

		["França25"] = {
			name = "Morro da França 25",
			type = "Simples",
			entrada = {
				['x'] = -2483.22, ['y'] = 1887.43, ['z'] = 194.94
			},
			price = 100000
		},

		["CDD01"] = {
			name = "Cidade de Deus 01",
			type = "Simples",
			entrada = {
				['x'] = 448.64, ['y'] = 2471.57, ['z'] = 47.13
			},
			price = 100000
		},

		["CDD02"] = {
			name = "Cidade de Deus 02",
			type = "Simples",
			entrada = {
				['x'] = 476.73, ['y'] = 2469.42, ['z'] = 48.91
			},
			price = 100000
		},

		["CDD03"] = {
			name = "Cidade de Deus 03",
			type = "Simples",
			entrada = {
				['x'] = 503.08, ['y'] = 2450.91, ['z'] = 49.75
			},
			price = 100000
		},

		["CDD04"] = {
			name = "Cidade de Deus 04",
			type = "Simples",
			entrada = {
				['x'] = 485.08, ['y'] = 2493.45, ['z'] = 53.63
			},
			price = 100000
		},

		["CDD05"] = {
			name = "Cidade de Deus 05",
			type = "Simples",
			entrada = {
				['x'] = 546.99, ['y'] = 2462.84, ['z'] = 56.87
			},
			price = 100000
		},

		["CDD06"] = {
			name = "Cidade de Deus 06",
			type = "Simples",
			entrada = {
				['x'] = 573.23, ['y'] = 2497.98, ['z'] = 59.72
			},
			price = 100000
		},

		["CDD07"] = {
			name = "Cidade de Deus 07",
			type = "Simples",
			entrada = {
				['x'] = 556.6, ['y'] = 2523.33, ['z'] = 55.26
			},
			price = 100000
		},

		["CDD08"] = {
			name = "Cidade de Deus 08",
			type = "Simples",
			entrada = {
				['x'] = 546.63, ['y'] = 2557.2, ['z'] = 49.46
			},
			price = 100000
		},

		["CDD09"] = {
			name = "Cidade de Deus 09",
			type = "Simples",
			entrada = {
				['x'] = 529.24, ['y'] = 2576.79, ['z'] = 44.21
			},
			price = 100000
		},

		["CDD10"] = {
			name = "Cidade de Deus 10",
			type = "Simples",
			entrada = {
				['x'] = 565.04, ['y'] = 2633.95, ['z'] = 42.15
			},
			price = 100000
		},

		["CDD11"] = {
			name = "Cidade de Deus 11",
			type = "Simples",
			entrada = {
				['x'] = 623.04, ['y'] = 2422.25, ['z'] = 56.05
			},
			price = 100000
		},

		["CDD12"] = {
			name = "Cidade de Deus 12",
			type = "Simples",
			entrada = {
				['x'] = 667.13, ['y'] = 2407.35, ['z'] = 56.38
			},
			price = 100000
		},

		["CDD13"] = {
			name = "Cidade de Deus 13",
			type = "Simples",
			entrada = {
				['x'] = 692.84, ['y'] = 2372.91, ['z'] = 52.0
			},
			price = 100000
		},

		["CDD14"] = {
			name = "Cidade de Deus 14",
			type = "Simples",
			entrada = {
				['x'] = 729.97, ['y'] = 2399.49, ['z'] = 59.8
			},
			price = 100000
		},

		["CDD15"] = {
			name = "Cidade de Deus 15",
			type = "Simples",
			entrada = {
				['x'] = 725.61, ['y'] = 2443.72, ['z'] = 60.44
			},
			price = 100000
		},

		["CDD16"] = {
			name = "Cidade de Deus 16",
			type = "Simples",
			entrada = {
				['x'] = 695.44, ['y'] = 2465.31, ['z'] = 61.76
			},
			price = 100000
		},

		["CDD17"] = {
			name = "Cidade de Deus 17",
			type = "Simples",
			entrada = {
				['x'] = 674.28, ['y'] = 2499.29, ['z'] = 65.39
			},
			price = 100000
		},

		["CDD18"] = {
			name = "Cidade de Deus 18",
			type = "Simples",
			entrada = {
				['x'] = 650.39, ['y'] = 2545.69, ['z'] = 61.0
			},
			price = 100000
		},

		["CDD19"] = {
			name = "Cidade de Deus 19",
			type = "Simples",
			entrada = {
				['x'] = 637.81, ['y'] = 2580.98, ['z'] = 56.17
			},
			price = 100000
		},

		["CDD20"] = {
			name = "Cidade de Deus 20",
			type = "Simples",
			entrada = {
				['x'] = 648.88, ['y'] = 2634.47, ['z'] = 47.01
			},
			price = 100000
		},

		["CDD21"] = {
			name = "Cidade de Deus 21",
			type = "Simples",
			entrada = {
				['x'] = 698.97, ['y'] = 2671.53, ['z'] = 42.46
			},
			price = 100000
		},

		["CDD22"] = {
			name = "Cidade de Deus 22",
			type = "Simples",
			entrada = {
				['x'] = 746.36, ['y'] = 2679.05, ['z'] = 40.8
			},
			price = 100000
		},

		["CDD23"] = {
			name = "Cidade de Deus 23",
			type = "Simples",
			entrada = {
				['x'] = 604.85, ['y'] = 2663.26, ['z'] = 41.88
			},
			price = 100000
		},

		["CDD24"] = {
			name = "Cidade de Deus 24",
			type = "Simples",
			entrada = {
				['x'] = 538.15, ['y'] = 2621.54, ['z'] = 42.37
			},
			price = 100000
		},

		["CDD25"] = {
			name = "Cidade de Deus 25",
			type = "Simples",
			entrada = {
				['x'] = 680.38, ['y'] = 2340.79, ['z'] = 50.28
			},
			price = 100000
		},


		-----------------------------------------------------------------------------------------------------------------------------------------
		-----------------------------------------------------MANSAO------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------
		["MS01"] = {
			name = "Casa MS01",
			type = "Apartament3",
			entrada = {
				['x'] = 8.38,
				['y'] = 539.75,
				['z'] = 176.02
			},
			price = 15000000
	
		},
		["MS02"] = {
			name = "Casa MS02",
			type = "Apartament3",  -- -1165.18, 726.46, 155.61
			entrada = {
				['x'] = -1165.18,
				['y'] = 726.46,
				['z'] =  155.61
			},
			price = 15000000
	
		},
		["MS03"] = {
			name = "Casa MS03",
			type = "Apartament3",
			entrada = {
				['x'] = -658.53,
				['y'] = 886.48,
				['z'] = 229.24
			},
			price = 15000000
	
		},
		["MS04"] = {
			name = "Casa MS04",
			type = "Apartament3",
			entrada = {
				['x'] = -2588.00,
				['y'] = 1911.17,
				['z'] = 167.49
			},
			price = 15000000
	
		},
		["MS05"] = {
			name = "Casa MS05",
			type = "Apartament3",
			entrada = {
				['x'] = -3017.75,
				['y'] = 746.25,
				['z'] = 27.58
			},
			price = 15000000
	
		},
		["MS06"] = {
			name = "Casa MS06",
			type = "Apartament3",
			entrada = {
				['x'] = -2997.24,
				['y'] = 722.62,
				['z'] = 28.49
			},
			price = 15000000
	
		},
		["MS07"] = {
			name = "Casa MS07",
			type = "Apartament3",
			entrada = {
				['x'] = -2994.75,
				['y'] = 682.48,
				['z'] = 25.04
			},
			price = 15000000
	
		},
		["MS08"] = {
			name = "Casa MS08",
			type = "Apartament3",
			entrada = {
				['x'] = -2972.77,
				['y'] = 642.43,
				['z'] = 25.98
			},
			price = 15000000
	
		},
		["MS09"] = {
			name = "Casa MS09",
			type = "Apartament3",
			entrada = {
				['x'] = -1901.41,
				['y'] = -586.29,
				['z'] = 11.88
			},
			price = 15000000
	
		},
		-----------------------------------------------------------------------------------------------------------------------------------------
		-------------------------------------------------------------SANDYSHORE------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------------------------------
		["SS01"] = {
			name = "Casa SS01",
			type = "Simples",
			entrada = {
				['x'] = 1535.52,
				['y'] = 2231.96,
				['z'] = 77.70
			},
			price = 650000
	
		}
	}
}
