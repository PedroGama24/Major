

-- Menu configuration, array of menus to display
menuConfigs = {
    ['mrp_menu'] = {
        enableMenu = function()
            return true
        end,
        data = {
            keybind = "F3",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:geral.png", "imgsrc:andar.png", "imgsrc:policia.png", "imgsrc:medico.png", "imgsrc:veiculo.png", "imgsrc:casa.png"},
                    commands = {"submenu1Geral", "submenu2Andar", "submenu3Policia", "submenu4Medico", "submenu5Veiculo", "submenu6Casa"}
                }
            }
        }
    }
}

-- Submenu configuration
subMenuConfigs = {
    ['submenu1Geral'] = {
        data = {
            keybind = "F3",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:roubarIndividuo.png", "imgsrc:saquearIndividuo.png", "imgsrc:sequestrarIndividuo.png", "imgsrc:carregarIndividuo.png"},
                    commands = {"roubar", "saquear",  "sequestro", "carregar",}
                },
                {
                navAngle = 285,                 -- Oritentation of wheel
                minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                labels = { "imgsrc:guardararmas2.png", "imgsrc:tirarcolete.png","imgsrc:tirarmochila.png"},
                commands = {"garmas","rcolete","retirarmochila"}
                }
            }
        }
    },



    ['submenu2Andar'] = {
        data = {
            keybind = "F3",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.3,
                    maxRadiusPercent = 0.6,
                    labels = {"imgsrc:andarDepressivo.png", "imgsrc:andarEmpresario.png", "imgsrc:andarFerido.png", "imgsrc:andarApressado.png", "imgsrc:andarBebado.png", "imgsrc:andarMulher.png"},
                    commands = {"depressivo", "empresario", "ferido", "apressado", "bebado3", "mulher"}
                },
				{
                    navAngle = 285,                 -- Oritentation of wheel
                    minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:andarDeterminado.png", "imgsrc:andarEstiloso.png", "imgsrc:andarInfeliz.png", "imgsrc:andarCorridinha.png", "imgsrc:andarEstilosa.png", "imgsrc:andarIntimidado.png"},
                    commands = {"determinado", "estiloso", "infeliz", "corridinha", "estilosa", "intimidado"}
                }
            }
        }
    },
	['submenu3Policia'] = {
        data = {
            keybind = "F3",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
			wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:apreenderTudo.png", "imgsrc:revistarSuspeito.png", "imgsrc:carregarIndividuo.png", "imgsrc:retirarPassageiro.png", "imgsrc:colocarPassageiro.png"},
					commands = {"apreender", "revistar", "carregar", "rv", "cv"}
                },
                {
                    navAngle = 285,                 -- Oritentation of wheel
                    minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:retirarMascara.png", "imgsrc:retirarChapeu.png", "imgsrc:placa.png", "imgsrc:tablet.png", "imgsrc:barreira.png", "imgsrc:identidade.png", "imgsrc:painel.png"},
                    commands = {"rmascara", "rchapeu", "placa", "mdt", "blitz", "id", "painel"}
                }
            }
        }
    },
	['submenu4Medico'] = {
        data = {
            keybind = "F3",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
			wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:retirarMascara.png", "imgsrc:retirarChapeu.png", "imgsrc:carregarIndividuo.png", "imgsrc:retirarPassageiro.png", "imgsrc:colocarPassageiro.png"},
					commands = {"rmascara", "rchapeu", "carregar", "rv", "cv"}
                },
                {
                    navAngle = 285,                 -- Oritentation of wheel
                    minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:ficha.png", "imgsrc:painel.png", "imgsrc:reanimar.png", "imgsrc:tratar.png"},
                    commands = {"fichahp", "painel", "re", "tratamento"}
                }
            }
        }
    },
    ['submenu5Veiculo'] = {
        data = {
            keybind = "F3",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:painelcarro.png","imgsrc:abrirportas.png", "imgsrc:abrirmalas.png", "imgsrc:abrircapo.png", "imgsrc:infoveiculo.png"},
                    commands = {"vehcontrol","porta", "malas", "capo", "vtuning"}
                }
            }
        }
    },
    ['submenu6Casa'] = {
        data = {
            keybind = "F3",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#3399ff', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 270,
                    minRadiusPercent = 0.25,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:entrarCasa.png", "imgsrc:sairCasa.png", "imgsrc:infoCasas.png"},
                    commands = {"casa", "casa", "casas"}
                }
            }
        }
    },
}