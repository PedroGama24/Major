local cfg = {}

cfg.groups = {
	["admin"] = {
		"admin.permissao",
		"fix.permissao",
		"dv.permissao",
		"god.permissao",
		"wl.permissao",
		"kick.permissao",
		"ban.permissao",
		"unban.permissao",
		"spotify.permissao",
		"money.permissao",
		"noclip.permissao",
		"containers.permissao",
		"ticket.permissao",
		"tp.permissao",
		"spawncar.permissao",
		"msg.permissao"
	},
	["mod"] = {
		"admin.permissao",
		"fix.permissao",
		"dv.permissao",
		"god.permissao",
		"ticket.permissao",
		"wl.permissao",
		"kick.permissao",
		"spotify.permissao",
		"ban.permissao",
		"unban.permissao",
		"noclip.permissao",
		"tp.permissao",
		"spawncar.permissao",
		"msg.permissao"
	},
	["sup"] = {
		"admin.permissao",
		"ticket.permissao",
		"fix.permissao",
		"dv.permissao",
		"wl.permissao",
		"kick.permissao"
	},
	["aprovadorwl"] = {
		"wl.permissao"
	},
	---------------------------------------------------
	---------------------------------------------------
	["Concessionaria-Vendedor"] = {
		_config = {
			title = "Vendedor - Concessionaria",
			gtype = "job"
		},
		"conce.permissao",
		"salarioconce.permissao",
		"tribunal.permissao",
		"sem.permissao"
	},
	["DONOConcessionaria"] = {
		_config = {
			title = "Dono - Concessionaria",
			gtype = "job"
		},
		"tribunal.permissao",
		"conce.permissao",
		"salarioconcedono.permissao",
		"sem.permissao"
	},
---------------------------------------------------
---------------------------------------------------
	

	
	---------------------------------------------------
	
	["PMESP1Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"carropmesp.permissao",
		"portadp.permissao",
		"tribunal.permissao",
		"salariopmesp.recruta",
		"policiaheli.permissao",
		"polpar.permissao"
	},

	["PMESP1"] = {
		_config = {
			title = "PMESP Recruta",
			gtype = "job"
		},
		"tribunal.permissao",
		"portadp.permissao",
		"paisanapolicia.recruta"
	},
	---------------------------------------------------
	["PMESP2Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"carropmesp.permissao",
		"portadp.permissao",
		"tribunal.permissao",
		"pmesp.soldado",
		"salariopmesp.soldado",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PMESP2"] = {
		_config = {
			title = "PMESP Soldado",
			gtype = "job"
		},
		"tribunal.permissao",
		"portadp.permissao",
		"paisanapolicia.soldado"
	},
	---------------------------------------------------
	["PMESP3Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"pmesp.cabo",
		"tribunal.permissao",
		"carropmesp.permissao",
		"portadp.permissao",
		"salariopmesp.cabo",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PMESP3"] = {
		_config = {
			title = "PMESP Cabo",
			gtype = "job"
		},
		"tribunal.permissao",
		"portadp.permissao",
		"paisanapolicia.cabo"
	},
	---------------------------------------------------
	["PMESP4Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"pmesp.sargento",
		"tribunal.permissao",
		"portadp.permissao",
		"carropmesp.permissao",
		"salariopmesp.sargento",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PMESP4"] = {
		_config = {
			title = "PMESP Sargento",
			gtype = "job"
		},
		"tribunal.permissao",
		"portadp.permissao",
		"paisanapolicia.sargento"
	},
	---------------------------------------------------
	["PMESP5Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"pmesp.subtenente",
		"carropmesp.permissao",
		"portadp.permissao",
		"tribunal.permissao",
		"salariopmesp.subtenente",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PMESP5"] = {
		_config = {
			title = "PMESP Sub-Tenente",
			gtype = "job"
		},
		"tribunal.permissao",
		"portadp.permissao",
		"paisanapolicia.subtenente"
	},
	---------------------------------------------------
	["PMESP6Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"pmesp.tenente",
		"carropmesp.permissao",
		"salariopmesp.tenente",
		"tribunal.permissao",
		"portadp.permissao",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PMESP6"] = {
		_config = {
			title = "PMESP Tenente",
			gtype = "job"
		},
		"tribunal.permissao",
		"portadp.permissao",
		"paisanapolicia.tenente"
	},
	---------------------------------------------------
	["PMESP7Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"pmesp.capitao",
		"carropmesp.permissao",
		"portadp.permissao",
		"salariopmesp.capitao",
		"tribunal.permissao",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PMESP7"] = {
		_config = {
			title = "PMESP Capitão",
			gtype = "job"
		},
		"tribunal.permissao",
		"portadp.permissao",
		"paisanapolicia.capitao"
	},
	---------------------------------------------------
	["PMESP8Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"carropmesp.permissao",
		"pmesp.major",
		"tribunal.permissao",
		"portadp.permissao",
		"salariopmesp.major",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PMESP8"] = {
		_config = {
			title = "PMESP Major",
			gtype = "job"
		},
		"tribunal.permissao",
		"portadp.permissao",
		"paisanapolicia.major"
	},
	---------------------------------------------------
	["PMESP9Paycheck"] = {
		_config = {
		},
		"policia.permissao",
		"pmesp.permissao",
		"carropmesp.permissao",
		"pmesp.coronel",
		"tribunal.permissao",
		"salariopmesp.coronel",
		"portadp.permissao",
		"policiaheli.permissao",
		"polpar.permissao"
	},
	["PMESP9"] = {
		_config = {
			title = "PMESP Coronel",
			gtype = "job"
		},
		"tribunal.permissao",
		"portadp.permissao",
		"paisanapolicia.coronel"
	},
	---------------------------------------------------

	---------------------------------------------------
	-- SAMU / SAÚDE  
	---------------------------------------------------
	["Hospital1Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"tribunal.permissao",
		"reviver.permissao",
		"estagiario.permissao",
		"polpar.permissao"
	},
	["Hospital1"] = {
		_config = {
			title = "Estagiário(a) SAMU",
			gtype = "job"
		},
			"paisanaestagiario.permissao",
			"samucontratado.permissao",
			"tribunal.permissao",
			"portahospital.permissao"
	},
	-----------------
	["Hospital2Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"tribunal.permissao",
		"reviver.permissao",
		"enfermeiro.permissao",
		"polpar.permissao"
	},
	["Hospital2"] = {
		_config = {
			title = "Enfermeiro(a) SAMU",
			gtype = "job"
		},
			"paisanaenfermeiro.permissao",
			"tribunal.permissao",
			"samucontratado.permissao",
			"portahospital.permissao"
	},
	-----------------
	["Hospital3Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"reviver.permissao",
		"tribunal.permissao",
		"portahospital.permissao",
		"paramedicosamu.permissao",
		"polpar.permissao"
	},
	["Hospital3"] = {
		_config = {
			title = "Paramédico(a) SAMU",
			gtype = "job"
		},
		"paisanaparamedico.permissao",
		"samucontratado.permissao",
		"tribunal.permissao",
		"portahospital.permissao"
	},
	-----------------
	["Hospital4Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"reviver.permissao",
		"tribunal.permissao",
		"portahospital.permissao",
		"clinicogeral.permissao",
		"polpar.permissao"
	},
	["Hospital4"] = {
		_config = {
			title = "Clinico(a) Geral SAMU",
			gtype = "job"
		},
		"paisanaclinicogeral.permissao",
		"tribunal.permissao",
		"samucontratado.permissao",
		"portahospital.permissao"
	},
	-------------------
	["Hospital5Paycheck"] = {
				_config = {
				},
				"paramedico.permissao",
				"portahospital.permissao",
				"tribunal.permissao",
				"reviver.permissao",
				"vicediretor.permissao",
				"polpar.permissao"
			},
	["Hospital5"] = {
				_config = {
					title = "Vice-Diretor(a) SAMU",
					gtype = "job"
				},
					"paisanaenfermeiro.permissao",
					"tribunal.permissao",
					"portahospital.permissao"
			},
	-----------------
	["Hospital6Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"tribunal.permissao",
		"reviver.permissao",
		"portahospital.permissao",
		"diretorgeral.permissao",
		"polpar.permissao"
	},
	["Hospital6"] = {
		_config = {
			title = "Diretor(a) Geral SAMU",
			gtype = "job"
		},
		"paisanadiretorgeral.permissao",
		"tribunal.permissao",
		"portahospital.permissao"
	},
	

	---------------------------------------------------
	-- BOMBEIROS 
	---------------------------------------------------
	["Bombeiro1Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"tribunal.permissao",
		"reviver.permissao",
		"bombeiros.permissao",
		"bombeiro1.permissao",
		"polpar.permissao"
	},
	["Bombeiro1"] = {
		_config = {
			title = "Estagiário(a) Bombeiro",
			gtype = "job"
		},
			"paisanabombeiro1.permissao",
			"tribunal.permissao",
			"portahospital.permissao"
	},
	-----------------
	["Bombeiro2Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"tribunal.permissao",
		"bombeiros.permissao",
		"reviver.permissao",
		"bombeiro2.permissao",
		"polpar.permissao"
	},
	["Bombeiro2"] = {
		_config = {
			title = "Enfermeiro(a) Bombeiro",
			gtype = "job"
		},
			"paisanabombeiro2.permissao",
			"tribunal.permissao",
			"portahospital.permissao"
	},
	-----------------
	["Bombeiro3Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"tribunal.permissao",
		"bombeiros.permissao",
		"reviver.permissao",
		"bombeiro3.permissao",
		"polpar.permissao"
	},
	["Bombeiro3"] = {
		_config = {
			title = "Paramédico(a) Bombeiro",
			gtype = "job"
		},
		"paisanabombeiro3.permissao",
		"tribunal.permissao",
		"portahospital.permissao"
	},
	-----------------
	["Bombeiro4Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"reviver.permissao",
		"tribunal.permissao",
		"portahospital.permissao",
		"bombeiros.permissao",
		"bombeiro4.permissao",
		"polpar.permissao"
	},
	["Bombeiro4"] = {
		_config = {
			title = "Clinico(a) Geral Bombeiro",
			gtype = "job"
		},
		"paisanabombeiro4.permissao",
		"tribunal.permissao",
		"portahospital.permissao"
	},
	-------------------
	["Bombeiro5Paycheck"] = {
				_config = {
				},
				"paramedico.permissao",
				"portahospital.permissao",
				"tribunal.permissao",
				"bombeiros.permissao",
				"reviver.permissao",
				"bombeiro5.permissao",
				"polpar.permissao"
			},
	["Bombeiro5"] = {
				_config = {
					title = "Vice-Diretor(a) Bombeiro",
					gtype = "job"
				},
				"paisanabombeiro5.permissao",
					"tribunal.permissao",
					"portahospital.permissao"
			},
	-----------------
	["Bombeiro6Paycheck"] = {
		_config = {
		},
		"paramedico.permissao",
		"tribunal.permissao",
		"reviver.permissao",
		"portahospital.permissao",
		"bombeiros.permissao",
		"bombeiro6.permissao",
		"polpar.permissao"
	},
	["Bombeiro6"] = {
		_config = {
			title = "Diretor(a) Geral Bombeiro",
			gtype = "job"
		},
		"paisanabombeiro6.permissao",
		"tribunal.permissao",
		"portahospital.permissao"
	},
	

	
	---------------------------------------------------
	---------------------------------------------------
	["Lider-MecanicoPaycheck"] = {
		_config = {
		},
		"mecanico.permissao",
		"lidermecanico.permissao",
		"bennys.permissao",
		"furios.permissao",
		"tribunal.permissao",
		"fixarpneu.permissao",
		"furios.portas",
		"lidermecanico.permissao",
		"lsc.use"
	},
	["Lider-Mecanico"] = {
		_config = {
			title = "Chefe - East Customs",
			gtype = "job"
		},
		"paisanamecanicolider.permissao"
	},
	---------------------------------------------------
	["MecanicoPaycheck2"] = {
		_config = {
		},
		"mecanico.permissao",
		"lidermecanico.permissao",
		"bennys.permissao",
		"furios.permissao",
		"fixarpneu.permissao",
		"tribunal.permissao",
		"gerentemecanico.permissao",
		"furios.portas",
		"lidermecanico.permissao",
		"lsc.use"
	},
	["Mecanico2"] = {
		_config = {
			title = "Gerente - East Customs",
			gtype = "job"
		},
		"paisanamecanicolider.permissao"
	},
	---------------------------------------------------
	["MecanicoPaycheck1"] = {
		_config = {
		},
		"mecanico.permissao",
		"salariomecanico.permissao",
		"bennys.permissao",
		"fixarpneu.permissao",
		"tribunal.permissao",
		"furios.permissao",
		"furios.portas",
		"roubonpc.permissao",
		"lsc.use"
	},
	["Mecanico1"] = {
		_config = {
			title = "Membro - East Customs",
			gtype = "job"
		},
		"tribunal.permissao",
		"paisanamecanico.permissao"
	},

---------------------------------------------------
---------------------------------------------------
["FARC1"] = {
	_config = {
		title = "FARC Cabo",
		gtype = "job"
	},
	"farc.permissao",
	"tribunal.permissao",
	"polpar.permissao"
},
["FARC2"] = {
	_config = {
		title = "FARC Sargento",
		gtype = "job"
	},
	"farc.permissao",
	"tribunal.permissao",
	"polpar.permissao"
},
["FARC3"] = {
	_config = {
		title = "FARC Sub-Tenente",
		gtype = "job"
	},
	"farc.permissao",
	"tribunal.permissao",
	"polpar.permissao"
},
["FARC4"] = {
	_config = {
		title = "FARC Tenente",
		gtype = "job"
	},
	"farc.permissao",
	"tribunal.permissao",
	"polpar.permissao"
},
["FARC5"] = {
	_config = {
		title = "FARC Capitão",
		gtype = "job"
	},
	"farc.permissao",
	"tribunal.permissao",
	"polpar.permissao"
},
["FARC6"] = {
	_config = {
		title = "FARC Major",
		gtype = "job"
	},
	"farc.permissao",
	"tribunal.permissao",
	"polpar.permissao"
},
["FARC7"] = {
	_config = {
		title = "FARC Coronel",
		gtype = "job"
	},
	"farc.permissao",
	"tribunal.permissao",
	"polpar.permissao"
},

	---------------------------------------------------
	---------------------------------------------------
	["Advogado"] = {
		_config = {
			title = "Advogado",
			gtype = "job"
		},
		"tribunal.permissao"
	},
	["AdvogadoPaycheck"] = {
		_config = {
		},
		"tribunal.permissao",
		"advogado.permissao"
	},
	["Juiz"] = {
		_config = {
			title = "Juiz",
			gtype = "job"
		},
		"tribunal.permissao",
		"tribunal2.permissao"
	},
	["JuizPaycheck"] = {
		_config = {
		},
		"tribunal.permissao",
		"juiz.permissao"
	},

	["Civil"] = {
		_config = {
			title = "Civil",
			gtype = "job"
		},
		"tribunal.permissao",
		"roubonpc.permissao"
	},
	---------------------------------------------------
	---------------------------------------------------
	["TaxistaPaycheck"] = {
		_config = {
		},
		"taxista.permissao",
		"tribunal.permissao"
	},
	["Taxista"] = {
		_config = {
			title = "Membro - Taxista",
			gtype = "job"
		},
		"paisanataxista.permissao",
		"tribunal.permissao",
		"roubonpc.permissao"
	},

	["Lider-TaxistaPaycheck"] = {
		_config = {
		},
		"taxista.permissao",
		"tribunal.permissao"
	},
	["Lider-Taxista"] = {
		_config = {
			title = "Lider - Taxista",
			gtype = "job"
		},
		"paisanataxista.permissao",
		"tribunal.permissao",
		"lidertaxista.permissao",
		"roubonpc.permissao"
	},
	----------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------
	["Bronze"] = {
		_config = {
			title = "Bronze",
			gtype = "vip"
		},
		"bronze.permissao",
		"carrosvip.permissao"
	},
	["Prata"] = {
		_config = {
			title = "Prata",
			gtype = "vip"
		},
		"prata.permissao",
		"carrosvip.permissao"
	},
	["Ouro"] = {
		_config = {
			title = "Ouro",
			gtype = "vip"
		},
		"ouro.permissao",
		"spotify.permissao",
		"containers.permissao",
		"mochila.permissao",
		"carrosvip.permissao"
	},
	["Platina"] = {
		_config = {
			title = "Platina",
			gtype = "vip"
		},
		"platina.permissao",
		"mochila.permissao",
		"containers.permissao",
		"spotify.permissao",
		"carrosvip.permissao"
	},
	["Mochila"] = { --Grupo adicional para vips quando morrer não perderem a mochila (JÁ TEM NO OURO E PLATINA)
		_config = {
			title = "Mochila"
		},
		"mochila.permissao"
	},
	["Spotify"] = { --Grupo adicional para vips quando morrer não perderem a mochila (JÁ TEM NO OURO E PLATINA)
		_config = {
			title = "Spotify"
		},
		"spotify.permissao"
	},
	["VerificadoInsta"] = { --Grupo adicional para ganhar verificado no instagram
		_config = {
			title = "Spotify"
		},
		"instagram.verificado"
	},
	["VipArmas"] = { --Grupo adicional para vips poderem usar os comandos para acessorio da arma
		_config = {
			title = "VipArmas"
		},
		"armas.permissao"
	},
	----------------------------------------------------------------------------------------------
	----------------------------------------
	["BurguerShot1"] = {
		_config = {
			title = "BurguerShot - Funcionario",
			gtype = "job"
		},
		"tribunal.permissao",
		"portaburguershot.permissao",
		"portadosfundos.permissao"
	},
	["BurguerShot1Paycheck"] = {
		_config = {
		},
		"burguershot.permissao",
		"portaburguershot.permissao",
		"portadosfundos.permissao",
		"tribunal.permissao"
	},
	["BurguerShot2"] = {
		_config = {
			title = "BurguerShot - Gerente",
			gtype = "job"
		},
		"tribunal.permissao",
		"portaburguershot.permissao",
		"portadosfundos.permissao"
	},
	["BurguerShot2Paycheck"] = {
		_config = {
		},
		"burguershot.permissao",
		"portaburguershot.permissao",
		"portadosfundos.permissao",
		"tribunal.permissao"
	},
	["BurguerShot3"] = {
		_config = {
			title = "BurguerShot - Dono",
			gtype = "job"
		},
		"tribunal.permissao",
		"portaburguershot.permissao",
		"portadosfundos.permissao"
	},
	["BurguerShot3Paycheck"] = {
		_config = {
		},
		"burguershot.permissao",
		"portaburguershot.permissao",
		"portadosfundos.permissao",
		"tribunal.permissao"
	},
	----------------------------------------------------------------------------------------------
	----------------------------------------
	["Lider-Amarelos"] = {
		_config = {
			title = "Chefe -  Amarelos",
			gtype = "job"
		},
		"amarelos.permissao",
		"roubonpc.permissao",
		"tribunal.permissao",
		"lideramarelos.permissao",
		"entrada.permissao"
	},
	["Amarelos1"] = {
		_config = {
			title = "Amarelos - Membro",
			gtype = "job"
		},
		"amarelos.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Amarelos2"] = {
		_config = {
			title = "Amarelos - Gerente",
			gtype = "job"
		},
		"amarelos.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	----------------------------------------
	["Lider-Roxos"] = {
		_config = {
			title = "Chefe - Roxos",
			gtype = "job"
		},
		"roxos.permissao",
		"roubonpc.permissao",
		"tribunal.permissao",
		"liderroxos.permissao",
		"entrada.permissao"
	},
	["Roxos1"] = {
		_config = {
			title = "Roxos - Membro",
			gtype = "job"
		},
		"tribunal.permissao",
		"roxos.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Roxos2"] = {
		_config = {
			title = "Roxos - Gerente",
			gtype = "job"
		},
		"roxos.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	-------------------------------------------
	["Lider-Verdes"] = {
		_config = {
			title = "Chefe - Verdes",
			gtype = "job"
		},
		"verdes.permissao",
		"liderverdes.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Verdes1"] = {
		_config = {
			title = "Verdes - Membro",
			gtype = "job"
		},
		"tribunal.permissao",
		"roubonpc.permissao",
		"verdes.permissao",
		"entrada.permissao"
	},
	["Verdes2"] = {
		_config = {
			title = "Verdes - Gerente",
			gtype = "job"
		},
		"tribunal.permissao",
		"roubonpc.permissao",
		"verdes.permissao",
		"entrada.permissao"
	},
	-------------------------------------------
	["Lider-Anonymous"] = {
			_config = {
				title = "Anonymous - Master",
				gtype = "job"
			},
			"anonymous.permissao",
			"lideranonymous.permissao",
			"tribunal.permissao",
			"roubonpc.permissao",
			"entrada.permissao"
		},
		["Anonymous2"] = {
			_config = {
				title = "Anonymous - Pleno",
				gtype = "job"
			},
			"tribunal.permissao",
			"roubonpc.permissao",
			"anonymous.permissao",
			"entrada.permissao"
		},
		["Anonymous1"] = {
			_config = {
				title = "Anonymous - Trainee",
				gtype = "job"
			},
			"tribunal.permissao",
			"roubonpc.permissao",
			"anonymous.permissao",
			"entrada.permissao"
		},
		-------------------------------------------
		["Lider-Driftking"] = {
			_config = {
				title = "Lider - Driftking",
				gtype = "job"
			},
			"driftking.permissao",
			"liderdriftking.permissao",
			"tribunal.permissao",
			"fixarpneu.permissao",
			"roubonpc.permissao",
			"entrada.permissao"
		},
		["Driftking2"] = {
			_config = {
				title = "Driftking - Gerente",
				gtype = "job"
			},
			"driftking.permissao",
			"tribunal.permissao",
			"fixarpneu.permissao",
			"roubonpc.permissao",
			"entrada.permissao"
		},
		["Driftking1"] = {
			_config = {
				title = "Driftking - Membro",
				gtype = "job"
			},
			"driftking.permissao",
			"tribunal.permissao",
			"fixarpneu.permissao",
			"roubonpc.permissao",
			"entrada.permissao"
		},
	--------------------------------------------------------------------------------
	--ORGANIZAÇÕES FARM ARMA--
	-------------------------------------------------------------------------------
	["Lider-Bratva"] = {
		_config = {
			title = "Líder Bratva",
			gtype = "job"
		},
		"bratva.permissao",
		"lidermafia.permissao",
		"tribunal.permissao",
		"mafia.permissao",
		"mafiaarmas.permissao",
		"contrabandista.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Bratva2"] = {
		_config = {
			title = "Bratva - Gerente",
			gtype = "job"
		},
		"bratva.permissao",
		"tribunal.permissao",
		"mafia.permissao",
		"mafiaarmas.permissao",
		"contrabandista.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Bratva1"] = {
		_config = {
			title = "Bratva - Membro",
			gtype = "job"
		},
		"bratva.permissao",
		"mafia.permissao",
		"contrabandista.permissao",
		"mafiaarmas.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
    ----------------------
	["Lider-Cartel"] = {
		_config = {
			title = "Líder - Cartel",
			gtype = "job"
		},
		"cartel.permissao",
		"lidermafia.permissao",
		"mafia.permissao",
		"mafiaarmas.permissao",
		"tribunal.permissao",
		"contrabandista.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Cartel1"] = {
		_config = {
			title = "Cartel - Membro",
			gtype = "job"
		},
		"cartel.permissao",
		"tribunal.permissao",
		"mafiaarmas.permissao",
		"mafia.permissao",
		"contrabandista.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Cartel2"] = {
		_config = {
			title = "Cartel - Gerente",
			gtype = "job"
		},
		"cartel.permissao",
		"tribunal.permissao",
		"mafiaarmas.permissao",
		"mafia.permissao",
		"contrabandista.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	-------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
	--ORGANIZAÇÕES FARM MUNIÇÃO--
	-------------------------------------------------------------------------------
	["Lider-Soa"] = {
			_config = {
				title = "Líder - SoA",
				gtype = "job"
			},
			"motoclub.permissao",
			"tribunal.permissao",
			"contrabandista.permissao",
			"soa.permissao",
			"municoes.permissao",
			"lidermc.permissao",
			"roubonpc.permissao",
			"entrada.permissao"
		},
	["SOA1"] = {
			_config = {
				title = "SoA - Membro",
				gtype = "job"
			},
			"motoclub.permissao",
			"roubonpc.permissao",
			"municoes.permissao",
			"contrabandista.permissao",
			"soa.permissao",
			"tribunal.permissao",
			"entrada.permissao"
		},
		["SOA2"] = {
			_config = {
				title = "SoA - Gerente",
				gtype = "job"
			},
			"motoclub.permissao",
			"roubonpc.permissao",
			"municoes.permissao",
			"contrabandista.permissao",
			"soa.permissao",
			"tribunal.permissao",
			"entrada.permissao"
		},
 ----------------------
	["Lider-TheLost"] = {
			_config = {
				title = "Líder - The Lost",
				gtype = "job"
			},
			"motoclub.permissao",
			"thelost.permissao",
			"tribunal.permissao",
			"municoes.permissao",
			"lidermc.permissao",
			"contrabandista.permissao",
			"roubonpc.permissao",
			"entrada.permissao"
		},
	["TheLost2"] = {
			_config = {
				title = "The Lost - Gerente",
				gtype = "job"
			},
			"motoclub.permissao",
			"contrabandista.permissao",
			"thelost.permissao",
			"roubonpc.permissao",
			"tribunal.permissao",
			"municoes.permissao",
			"entrada.permissao"
		},
		["TheLost1"] = {
			_config = {
				title = "The Lost - Membro",
				gtype = "job"
			},
			"motoclub.permissao",
			"contrabandista.permissao",
			"thelost.permissao",
			"roubonpc.permissao",
			"municoes.permissao",
			"tribunal.permissao",
			"entrada.permissao"
		},
	-------------------------------------------------------------------------------
	["Lider-Vanilla"] = {
		_config = {
			title = "Líder - Vanilla",
			gtype = "job"
		},
		"vanilla.permissao",
		"lidervanilla.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Vanilla1"] = {
		_config = {
			title = "Vanilla - Membro",
			gtype = "job"
		},
		"vanilla.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Vanilla2"] = {
		_config = {
			title = "Vanilla - Gerente",
			gtype = "job"
		},
		"vanilla.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	
	-------------------------------------------------------------------------------
	["Lider-Casino"] = {
		_config = {
			title = "Líder - Casino",
			gtype = "job"
		},
		"casino.permissao",
		"lidercasino.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Casino1"] = {
		_config = {
			title = "Casino - Membro",
			gtype = "job"
		},
		"casino.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},
	["Casino2"] = {
		_config = {
			title = "Casino - Gerente",
			gtype = "job"
		},
		"casino.permissao",
		"tribunal.permissao",
		"roubonpc.permissao",
		"entrada.permissao"
	},


	-------------------------------------------------------------------------------
	["HabilitacaoA"] = {
		_config = {
			title = "HabilitacaoA",
		},
		"carteiraA.permissao",
	},
	["HabilitacaoB"] = {
		_config = {
			title = "HabilitacaoB",
		},
		"carteiraB.permissao",
	},
	["HabilitacaoAB"] = {
		_config = {
			title = "HabilitacaoAB",
		},
		"carteiraAB.permissao",
	},
}

cfg.users = {
	[1] = { "admin" },
	[2] = { "admin" },
}

cfg.selectors = {}

return cfg