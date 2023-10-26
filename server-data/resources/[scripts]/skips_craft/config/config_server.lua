local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("skips_craft",src)
Proxy.addInterface("skips_craft",src)

vCLIENT = Tunnel.getInterface("skips_craft")
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config = {}
config.token = "6efb3b8d332c777b0f9a762773b24528"  -- configure aqui seu token [ DEFINA-SEU-TOKEN-AQUI ]
config.delayCraft = 5 -- Segundos ( Delay de cada mesa de craft, para evitar floods )
config.weebdump = "" -- WEEBHOOK QUANDO NEGO TENTAR DUMPAR DESLIGANDO A INTERNET. 

config.weebhook = {
    logo = "https://cdn.discordapp.com/attachments/1001361166125248573/1029223970785992806/Logo_sem_fundo.png", -- LOGO do Servidor
    color =  6356736,
    footer = "FiveMBrasil",
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG CRAFT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.table = {
    ["Cartel"] = { -- NUNCA REPITIR O MESMO NOME
        armazem = false, -- Caso coloque true, configure a localização do armazem. ( false os items precisam está no inventario .)
        weebhook = "", -- WEEBHOOK DAS TRANSACOES FEITAS AQUI [ CRAFT / ARMAZEM ] [ PASSAR PARA SERVER SIDE AQUI TUDO ]

        craft = {
            ["ak47"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_ASSAULTRIFLE", -- SPAWN DO ITEM
                nameItem = "AK-47", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-ak47", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 10 },
                    { item = "mola", amount = 3 },
                    { item = "gatilho", amount = 1 },
                }
            },  

            ["fiveseven"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_PISTOL_MK2", -- SPAWN DO ITEM
                nameItem = "Five Seven", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-pistolmk2", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 3 },
                    { item = "mola", amount = 1 },
                    { item = "gatilho", amount = 1 },
                }
            },   
            
            ["mtar21"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_ASSAULTSMG", -- SPAWN DO ITEM
                nameItem = "MTAR-21", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-assaultsmg", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 8 },
                    { item = "mola", amount = 3 },
                    { item = "gatilho", amount = 1 },
                }
            },   

            ["uzi"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_MICROSMG", -- SPAWN DO ITEM
                nameItem = "UZI", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-microsmg", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 6 },
                    { item = "mola", amount = 5 },
                    { item = "gatilho", amount = 1 },
                }
            },   

            ["smg"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_SMG", -- SPAWN DO ITEM
                nameItem = "MP5", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-mp5", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 5 },
                    { item = "mola", amount = 4 },
                    { item = "gatilho", amount = 1 },
                }
            },   

            ["magnum44"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_REVOLVER", -- SPAWN DO ITEM
                nameItem = "Magnum 44", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-revolver", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 6 },
                    { item = "mola", amount = 2 },
                    { item = "gatilho", amount = 1 },
                }
            },  

            ["thompson"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_GUSENBERG", -- SPAWN DO ITEM
                nameItem = "Thompson", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-thompson", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 8 },
                    { item = "mola", amount = 5 },
                    { item = "gatilho", amount = 1 },
                }
            },  

            ["corpo-ak47"] = { -- IMAGEM DO ITEM
                spawnID = "corpo-ak47", -- SPAWN DO ITEM
                nameItem = "Corpo AK-47", -- NOME DO ITEM
                maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "pecadearma", amount = 100 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                }
            }, 

            ["corpo-pistolmk2"] = { -- IMAGEM DO ITEM
                spawnID = "corpo-pistolmk2", -- SPAWN DO ITEM
                nameItem = "Corpo Five Seven", -- NOME DO ITEM
                maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "pecadearma", amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                }
            }, 

            ["corpo-assaultsmg"] = { -- IMAGEM DO ITEM
            spawnID = "corpo-assaultsmg", -- SPAWN DO ITEM
            nameItem = "Corpo MTAR-21", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pecadearma", amount = 90 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
            }
              }, 

        ["corpo-microsmg"] = { -- IMAGEM DO ITEM
        spawnID = "corpo-microsmg", -- SPAWN DO ITEM
        nameItem = "Corpo UZI", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecadearma", amount = 70 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
         }, 

        ["corpo-mp5"] = { -- IMAGEM DO ITEM
        spawnID = "corpo-mp5", -- SPAWN DO ITEM
        nameItem = "Corpo MP5", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecadearma", amount = 75 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
        }, 

        ["corpo-revolver"] = { -- IMAGEM DO ITEM
        spawnID = "corpo-revolver", -- SPAWN DO ITEM
        nameItem = "Corpo Revolver", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecadearma", amount = 40 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
        }, 

        ["corpo-thompson"] = { -- IMAGEM DO ITEM
        spawnID = "corpo-thompson", -- SPAWN DO ITEM
        nameItem = "Corpo Thompson", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecadearma", amount = 105 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
        }, 

               
        }
    },   
    ["Bratva"] = { -- NUNCA REPITIR O MESMO NOME
        armazem = false, -- Caso coloque true, configure a localização do armazem. ( false os items precisam está no inventario .)
        weebhook = "", -- WEEBHOOK DAS TRANSACOES FEITAS AQUI [ CRAFT / ARMAZEM ] [ PASSAR PARA SERVER SIDE AQUI TUDO ]

        craft = {
            ["ak47"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_ASSAULTRIFLE", -- SPAWN DO ITEM
                nameItem = "AK-47", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-ak47", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 10 },
                    { item = "mola", amount = 3 },
                    { item = "gatilho", amount = 1 },
                }
            },  

            ["fiveseven"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_PISTOL_MK2", -- SPAWN DO ITEM
                nameItem = "Five Seven", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-pistolmk2", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 3 },
                    { item = "mola", amount = 1 },
                    { item = "gatilho", amount = 1 },
                }
            },   
            
            ["mtar21"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_ASSAULTSMG", -- SPAWN DO ITEM
                nameItem = "MTAR-21", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-assaultsmg", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 8 },
                    { item = "mola", amount = 3 },
                    { item = "gatilho", amount = 1 },
                }
            },   

            ["uzi"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_MICROSMG", -- SPAWN DO ITEM
                nameItem = "UZI", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-microsmg", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 6 },
                    { item = "mola", amount = 5 },
                    { item = "gatilho", amount = 1 },
                }
            },   

            ["smg"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_SMG", -- SPAWN DO ITEM
                nameItem = "MP5", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-mp5", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 5 },
                    { item = "mola", amount = 4 },
                    { item = "gatilho", amount = 1 },
                }
            },   

            ["magnum44"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_REVOLVER", -- SPAWN DO ITEM
                nameItem = "Magnum 44", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-revolver", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 6 },
                    { item = "mola", amount = 2 },
                    { item = "gatilho", amount = 1 },
                }
            },  

            ["thompson"] = { -- IMAGEM DO ITEM
                spawnID = "wbody|WEAPON_GUSENBERG", -- SPAWN DO ITEM
                nameItem = "Thompson", -- NOME DO ITEM
                maxAmount = 5, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "corpo-thompson", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "placademetal", amount = 8 },
                    { item = "mola", amount = 5 },
                    { item = "gatilho", amount = 1 },
                }
            },  

            ["corpo-ak47"] = { -- IMAGEM DO ITEM
                spawnID = "corpo-ak47", -- SPAWN DO ITEM
                nameItem = "Corpo AK-47", -- NOME DO ITEM
                maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "pecadearma", amount = 100 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                }
            }, 

            ["corpo-pistolmk2"] = { -- IMAGEM DO ITEM
                spawnID = "corpo-pistolmk2", -- SPAWN DO ITEM
                nameItem = "Corpo Five Seven", -- NOME DO ITEM
                maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "pecadearma", amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                }
            }, 

            ["corpo-assaultsmg"] = { -- IMAGEM DO ITEM
            spawnID = "corpo-assaultsmg", -- SPAWN DO ITEM
            nameItem = "Corpo MTAR-21", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pecadearma", amount = 90 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
            }
              }, 

        ["corpo-microsmg"] = { -- IMAGEM DO ITEM
        spawnID = "corpo-microsmg", -- SPAWN DO ITEM
        nameItem = "Corpo UZI", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecadearma", amount = 70 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
         }, 

        ["corpo-mp5"] = { -- IMAGEM DO ITEM
        spawnID = "corpo-mp5", -- SPAWN DO ITEM
        nameItem = "Corpo MP5", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecadearma", amount = 75 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
        }, 

        ["corpo-revolver"] = { -- IMAGEM DO ITEM
        spawnID = "corpo-revolver", -- SPAWN DO ITEM
        nameItem = "Corpo Revolver", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecadearma", amount = 40 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
        }, 

        ["corpo-thompson"] = { -- IMAGEM DO ITEM
        spawnID = "corpo-thompson", -- SPAWN DO ITEM
        nameItem = "Corpo Thompson", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecadearma", amount = 105 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
        }, 

               
        }
    },   

    ["TheLost"] = { -- NUNCA REPITIR O MESMO NOME
        armazem = false, -- Caso coloque true, configure a localização do armazem. ( false os items precisam está no inventario .)
        weebhook = "", -- WEEBHOOK DAS TRANSACOES FEITAS AQUI [ CRAFT / ARMAZEM ] [ PASSAR PARA SERVER SIDE AQUI TUDO ]

        craft = {
            ["m-ak47"] = { -- IMAGEM DO ITEM
                spawnID = "P-WEAPON_ASSAULTRIFLE", -- SPAWN DO ITEM
                nameItem = "Pacote M.Ak-47", -- NOME DO ITEM
                maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "polvora", amount = 200 },
                }
            },  
            ["m-fiveseven"] = { -- IMAGEM DO ITEM
                spawnID = "P-WEAPON_PISTOL_MK2", -- SPAWN DO ITEM
                nameItem = "Pacote M.Five Seven", -- NOME DO ITEM
                maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "polvora", amount = 50 },
                }
            }, 

            ["m-mtar21"] = { -- IMAGEM DO ITEM
            spawnID = "P-WEAPON_ASSAULTSMG", -- SPAWN DO ITEM
            nameItem = "Pacote M.MTAR 21", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "polvora", amount = 170 },
            }
        }, 

        ["m-uzi"] = { -- IMAGEM DO ITEM
        spawnID = "P-WEAPON_MICROSMG", -- SPAWN DO ITEM
        nameItem = "Pacote M.MP5", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
            { item = "polvora", amount = 150 },
        }
         }, 

         ["m-mp5"] = { -- IMAGEM DO ITEM
         spawnID = "P-WEAPON_SMG", -- SPAWN DO ITEM
         nameItem = "Pacote M.MP5", -- NOME DO ITEM
         maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
         customAmount = 1, -- Caso queira colocar um valor x por unidade.
         tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
         anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)
 
         requires = {
             { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
             { item = "polvora", amount = 160 },
         }
          }, 

          ["m-magnum44"] = { -- IMAGEM DO ITEM
          spawnID = "P-WEAPON_REVOLVER", -- SPAWN DO ITEM
          nameItem = "Pacote M.Magnum 44", -- NOME DO ITEM
          maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
          customAmount = 1, -- Caso queira colocar um valor x por unidade.
          tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
          anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)
  
          requires = {
              { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
              { item = "polvora", amount = 60 },
          }
           }, 

           ["m-thompson"] = { -- IMAGEM DO ITEM
           spawnID = "P-WEAPON_GUSENBERG", -- SPAWN DO ITEM
           nameItem = "Pacote M.Thompson", -- NOME DO ITEM
           maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
           customAmount = 1, -- Caso queira colocar um valor x por unidade.
           tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
           anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)
   
           requires = {
               { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
               { item = "polvora", amount = 190 },
           }
            }, 


         
        }
    },   

    ["SoA"] = { -- NUNCA REPITIR O MESMO NOME
        armazem = false, -- Caso coloque true, configure a localização do armazem. ( false os items precisam está no inventario .)
        weebhook = "", -- WEEBHOOK DAS TRANSACOES FEITAS AQUI [ CRAFT / ARMAZEM ] [ PASSAR PARA SERVER SIDE AQUI TUDO ]

        craft = {
            ["m-ak47"] = { -- IMAGEM DO ITEM
                spawnID = "P-WEAPON_ASSAULTRIFLE", -- SPAWN DO ITEM
                nameItem = "Pacote M.Ak-47", -- NOME DO ITEM
                maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "polvora", amount = 200 },
                }
            },  
            ["m-fiveseven"] = { -- IMAGEM DO ITEM
                spawnID = "P-WEAPON_PISTOL_MK2", -- SPAWN DO ITEM
                nameItem = "Pacote M.Five Seven", -- NOME DO ITEM
                maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
                customAmount = 1, -- Caso queira colocar um valor x por unidade.
                tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
                anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

                requires = {
                    { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    { item = "polvora", amount = 50 },
                }
            }, 

            ["m-mtar21"] = { -- IMAGEM DO ITEM
            spawnID = "P-WEAPON_ASSAULTSMG", -- SPAWN DO ITEM
            nameItem = "Pacote M.MTAR 21", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "polvora", amount = 170 },
            }
        }, 

        ["m-uzi"] = { -- IMAGEM DO ITEM
        spawnID = "P-WEAPON_MICROSMG", -- SPAWN DO ITEM
        nameItem = "Pacote M.MP5", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
            { item = "polvora", amount = 150 },
        }
         }, 

         ["m-mp5"] = { -- IMAGEM DO ITEM
         spawnID = "P-WEAPON_SMG", -- SPAWN DO ITEM
         nameItem = "Pacote M.MP5", -- NOME DO ITEM
         maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
         customAmount = 1, -- Caso queira colocar um valor x por unidade.
         tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
         anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)
 
         requires = {
             { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
             { item = "polvora", amount = 160 },
         }
          }, 

          ["m-magnum44"] = { -- IMAGEM DO ITEM
          spawnID = "P-WEAPON_REVOLVER", -- SPAWN DO ITEM
          nameItem = "Pacote M.Magnum 44", -- NOME DO ITEM
          maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
          customAmount = 1, -- Caso queira colocar um valor x por unidade.
          tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
          anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)
  
          requires = {
              { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
              { item = "polvora", amount = 60 },
          }
           }, 

           ["m-thompson"] = { -- IMAGEM DO ITEM
           spawnID = "P-WEAPON_GUSENBERG", -- SPAWN DO ITEM
           nameItem = "Pacote M.Thompson", -- NOME DO ITEM
           maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
           customAmount = 1, -- Caso queira colocar um valor x por unidade.
           tempo = 25, -- Tempo de craft por Unidade [ em segundos ]
           anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)
   
           requires = {
               { item = "capsula", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
               { item = "polvora", amount = 190 },
           }
            }, 


         
        }
    },   


    ["Vanilla"] = { -- NUNCA REPITIR O MESMO NOME
    armazem = false, -- Caso coloque true, configure a localização do armazem. ( false os items precisam está no inventario .)
    weebhook = "", -- WEEBHOOK DAS TRANSACOES FEITAS AQUI [ CRAFT / ARMAZEM ] [ PASSAR PARA SERVER SIDE AQUI TUDO ]

    craft = {
        ["coquetelvanilla"] = { -- IMAGEM DO ITEM
            spawnID = "coquetelvanilla", -- SPAWN DO ITEM
            nameItem = "Coquetel Laranja", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 15, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "laranja", amount = 5 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "vodka", amount = 2 },
            }
        },   
        
        ["coquetelvanilla2"] = { -- IMAGEM DO ITEM
        spawnID = "coquetelvanilla2", -- SPAWN DO ITEM
        nameItem = "Coquetel Morango", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 15, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "morango", amount = 5 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
            { item = "vodka", amount = 2 },
        }
    }, 
    }
},   

    ["DriftKing"] = { -- NUNCA REPITIR O MESMO NOME
    armazem = false, -- Caso coloque true, configure a localização do armazem. ( false os items precisam está no inventario .)
    weebhook = "", -- WEEBHOOK DAS TRANSACOES FEITAS AQUI [ CRAFT / ARMAZEM ] [ PASSAR PARA SERVER SIDE AQUI TUDO ]

    craft = {
        ["pistao"] = { -- IMAGEM DO ITEM
            spawnID = "pistao", -- SPAWN DO ITEM
            nameItem = "Pistão", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pecas", amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
            }
        },   
    ["lataria"] = { -- IMAGEM DO ITEM
        spawnID = "lataria", -- SPAWN DO ITEM
        nameItem = "Lataria", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecas", amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
    }, 
    ["discofreio"] = { -- IMAGEM DO ITEM
        spawnID = "discofreio", -- SPAWN DO ITEM
        nameItem = "Disco de Freio", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecas", amount = 10 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
    },
    ["portacarro"] = { -- IMAGEM DO ITEM
        spawnID = "portacarro", -- SPAWN DO ITEM
        nameItem = "Porta do Carro", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecas", amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
    },
    ["volante"] = { -- IMAGEM DO ITEM
        spawnID = "volante", -- SPAWN DO ITEM
        nameItem = "Volante", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecas", amount = 15 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
    },
    ["motorcarro"] = { -- IMAGEM DO ITEM
        spawnID = "motorcarro", -- SPAWN DO ITEM
        nameItem = "Motor do Carro", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "pecas", amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
    },  
        
        
      }
    },   

    ["FARC"] = { -- NUNCA REPITIR O MESMO NOME
    armazem = false, -- Caso coloque true, configure a localização do armazem. ( false os items precisam está no inventario .)
    weebhook = "", -- WEEBHOOK DAS TRANSACOES FEITAS AQUI [ CRAFT / ARMAZEM ] [ PASSAR PARA SERVER SIDE AQUI TUDO ]

    craft = {
        ["mochila"] = { -- IMAGEM DO ITEM
            spawnID = "mochila", -- SPAWN DO ITEM
            nameItem = "Mochila Pequena", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pano", amount = 25 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "linha", amount = 25 },
            }
        }, 
        ["mochila2"] = { -- IMAGEM DO ITEM
            spawnID = "mochila2", -- SPAWN DO ITEM
            nameItem = "Mochila Média", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pano", amount = 30 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "linha", amount = 30 },
            }
        },
        ["mochila3"] = { -- IMAGEM DO ITEM
            spawnID = "mochila3", -- SPAWN DO ITEM
            nameItem = "Mochila Grande", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pano", amount = 40 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "linha", amount = 40 },
            }
        },
        ["colete1"] = { -- IMAGEM DO ITEM
            spawnID = "colete1", -- SPAWN DO ITEM
            nameItem = "Colete Leve", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pano", amount = 50 }, 
                { item = "fibra", amount = 10 },
                { item = "linha", amount = 33 },
            }
        },
        ["colete2"] = { -- IMAGEM DO ITEM
            spawnID = "colete2", -- SPAWN DO ITEM
            nameItem = "Colete Médio", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pano", amount = 65 }, 
                { item = "fibra", amount = 15 },
                { item = "linha", amount = 40 },
            }
        },
        ["colete3"] = { -- IMAGEM DO ITEM
            spawnID = "colete3", -- SPAWN DO ITEM
            nameItem = "Colete Pesado", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 50, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pano", amount = 75 }, 
                { item = "fibra", amount = 20 },
                { item = "linha", amount = 50 },
            }
        }, 
             
    }
},   

    ["BurguerShot"] = { -- NUNCA REPITIR O MESMO NOME
    armazem = false, -- Caso coloque true, configure a localização do armazem. ( false os items precisam está no inventario .)
    weebhook = "", -- WEEBHOOK DAS TRANSACOES FEITAS AQUI [ CRAFT / ARMAZEM ] [ PASSAR PARA SERVER SIDE AQUI TUDO ]

    craft = {
        ["hotdog"] = { -- IMAGEM DO ITEM
            spawnID = "hotdog", -- SPAWN DO ITEM
            nameItem = "Hotdog", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 15, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pao", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "salsicha", amount = 1 },
            }
        }, 
        ["xburguer"] = { -- IMAGEM DO ITEM
            spawnID = "xburguer", -- SPAWN DO ITEM
            nameItem = "X-Burguer", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 20, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pao", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "salsicha", amount = 1 },
            }
        }, 
        ["xtudo"] = { -- IMAGEM DO ITEM
            spawnID = "xtudo", -- SPAWN DO ITEM
            nameItem = "X-Tudo", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "pao", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "hamburguer", amount = 2 },
                { item = "queijo", amount = 2 },
                { item = "alface", amount = 2 },
                { item = "tomate", amount = 2 },
            }
        }, 
        ["pizza"] = { -- IMAGEM DO ITEM
            spawnID = "pizza", -- SPAWN DO ITEM
            nameItem = "Pizza", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "farinha", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "queijo", amount = 1 },
                { item = "calabresa", amount = 1 },
                { item = "tomate", amount = 1 },
            }
        }, 

        ["taco"] = { -- IMAGEM DO ITEM
            spawnID = "taco", -- SPAWN DO ITEM
            nameItem = "Taco", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "farinha", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "hamburguer", amount = 1 },
                { item = "calabresa", amount = 1 },
                { item = "tomate", amount = 1 },
                { item = "alface", amount = 1 },
            }
        }, 

        ["batatinha"] = { -- IMAGEM DO ITEM
            spawnID = "batatinha", -- SPAWN DO ITEM
            nameItem = "Batata Frita", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "embalagem", amount = 1 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "batata", amount = 2 },
            }
        }, 

        ["pao"] = { -- IMAGEM DO ITEM
        spawnID = "pao", -- SPAWN DO ITEM
        nameItem = "Pão", -- NOME DO ITEM
        maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
        customAmount = 1, -- Caso queira colocar um valor x por unidade.
        tempo = 15, -- Tempo de craft por Unidade [ em segundos ]
        anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

        requires = {
            { item = "farinha", amount = 3 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
        }
        }, 

        ["paodequeijo"] = { -- IMAGEM DO ITEM
            spawnID = "paodequeijo", -- SPAWN DO ITEM
            nameItem = "Pão de queijo", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "farinha", amount = 2 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "queijo", amount = 1 },
            }
        }, 

        ["pastel"] = { -- IMAGEM DO ITEM
            spawnID = "pastel", -- SPAWN DO ITEM
            nameItem = "Pastel", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "farinha", amount = 2 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "queijo", amount = 1 },
                { item = "frango", amount = 1 },
            }
        }, 

        ["coxinha"] = { -- IMAGEM DO ITEM
            spawnID = "coxinha", -- SPAWN DO ITEM
            nameItem = "Coxinha", -- NOME DO ITEM
            maxAmount = 10, -- Quantidade maxima de Craft [ VALOR DA INPUT < >]
            customAmount = 1, -- Caso queira colocar um valor x por unidade.
            tempo = 30, -- Tempo de craft por Unidade [ em segundos ]
            anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }, -- ANIMAÇÃO DURANTE O CRAFT. (SE O TEMPO ESTIVER 0 DESCONSIDERAR)

            requires = {
                { item = "farinha", amount = 2 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                { item = "batata", amount = 1 },
                { item = "frango", amount = 2 },
            }
        }, 
        
            
    }
    },
    
          
}

config.craftLocations = {
    [1] = { type = "Cartel", perm = 'admin.permissao', coords = vec3(-1518.31, 125.5, 48.66), visible = 1.0 },
    [2] = { type = "Bratva", perm = 'admin.permissao', coords = vec3(-1870.46, 2061.79, 135.44), visible = 1.0 },
    [3] = { type = "TheLost", perm = 'admin.permissao', coords = vec3(2518.97, 4107.51, 35.59), visible = 1.0 },
    [4] = { type = "SoA", perm = 'admin.permissao', coords = vec3(1002.58, -128.0, 74.07), visible = 1.0 },
    [5] = { type = "Vanilla", perm = 'admin.permissao', coords = vec3(129.43, -1284.05, 29.27), visible = 1.0 },
    [6] = { type = "DriftKing", perm = 'admin.permissao', coords = vec3(135.19, -3050.56, 7.05), visible = 1.0 },
    [7] = { type = "FARC", perm = 'admin.permissao', coords = vec3(713.2, -967.78, 30.4), visible = 1.0 },
    [8] = { type = "BurguerShot", perm = 'admin.permissao', coords = vec3(-1197.38, -900.08, 14.0), visible = 1.0 },
}

config.armazemLocations = {
    ["Cartel"] = { perm = "admin.permissao", coords = vec3(-1505.89, 132.9, 42.18), visible = 2.0 },
}


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.checkPermission = function(permission)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if permission == nil then
            return true
        end

        if vRP.hasPermission(user_id, permission) then
            return true
        end

        return false
    end
end

src.getItemName = function(item)
    return item
end

src.giveInventoryItem = function(user_id, item, amount)
    vRP.giveInventoryItem(user_id, item, amount)
end

src.getInventoryItemAmount = function(user_id, item)
    return vRP.getInventoryItemAmount(user_id, item)
end

src.tryGetInventoryItem = function(user_id, item, amount)
    return vRP.tryGetInventoryItem(user_id, item, amount)
end

src.checkInventoryWeight = function(user_id, spawnID, amount)
    if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(tostring(spawnID))*parseInt(amount) > vRP.getInventoryMaxWeight(user_id) then -- CASO ESTIVER CHEIO
        return false
    end

    return true
end

src.playAnim = function(source, anim1, anim2) 
    vRPclient._playAnim(source, false,{{anim1, anim2}},true)
end

src.stopAnim = function(source) 
    vRPclient._stopAnim(source, false)
end

src.progressBar = function(user_id, time)
    local source = vRP.getUserSource(user_id)
    TriggerClientEvent("progress", source, time*1000) -- Caso use em segundos
    -- TriggerClientEvent("progress", source, time*1000) -- Caso use em milissegundos
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LANGS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.lang = {
    notArmazemItem = function(source, mensagem, tipo) if tipo == "armazem" then TriggerClientEvent("Notify",source,"negado","O Armazem possui: <br>" ..mensagem, 10000) else TriggerClientEvent("Notify",source,"negado","Você precisa dos itens: <br>" ..mensagem, 20000) end end,
    erroFabricar = function(source) TriggerClientEvent("Notify",source,"sucesso","Ocorreu um erro ao tentar fabricar esse item, tente novamente!", 10000) end,
    waitCraft = function(source, segundos) TriggerClientEvent("Notify",source,"sucesso","Aguarde, <b>"..segundos.." segundo(s)</b> para continuar.", 10000) end,
    armazemItens = function(source, mensagem) TriggerClientEvent("Notify",source,"importante","Itens do Armazem:<br> ".. mensagem, 10000)  end,
    notArmazemItens = function(source) TriggerClientEvent("Notify",source,"importante","Esse Armazem, não possui <b>itens</b>.", 10000)  end,
    notStoreItens = function(source) TriggerClientEvent("Notify",source,"importante","Você não possui itens que possa ser guardado no armazem.", 10000)  end,
    storeItens = function(source, mensagem) TriggerClientEvent("Notify",source,"importante","Você guardou:<br> "..mensagem, 10000)  end,
    backpackFull = function(source) TriggerClientEvent("Notify",source,"negado","Sua Mochila está cheia",10000)  end,
    fabricandoItem = function(source) TriggerClientEvent("Notify",source,"negado","Aguarde, Você ja está fabricando um item.", 10000)  end,
}

