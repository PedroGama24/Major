local config = {}


config.currency       = "R$" --text to currency log of bank organization
config.textwithdrawal = "Retirado por" --text to withdrawal log of bank organization
config.textdeposit    = "Depositado por" --text to deposit log of bank organization
config.texttake       = "Retirado por" --text to take log of chest organization
config.textstore      = "Colocado por" --text to store log of chest organization
config.IPImages       = "http://181.215.253.55/skips/items/" --link of images the server
config.command        = "org" --command to open system
config.keybind        = "F11" --bind to open system
config.webhooklink    = "https://discord.com/api/webhooks/1174178604763066450/ucs9dHqCapWCmi1EWs-hI0Y-95AzgduE6RA7c4N-de_liUF8spPWw_egj_xvVKiQPIBW" --webhook discord of logs system
config.webhookimage   = "https://discord.com/api/webhooks/1174178604763066450/ucs9dHqCapWCmi1EWs-hI0Y-95AzgduE6RA7c4N-de_liUF8spPWw_egj_xvVKiQPIBW" --image of webhook discord

config.blacklist = {
    --command to blacklist manager
    --(ex add: /blacklist add user_id days)
    --(ex remove: /blacklist rem user_id)
    command = "blacklist",
    permissions = { --permissions of manager blacklist
        "admin.permissao"
    }
}


config.groups = {
    ["hospital"] = { --organization name
        chest     = "Hospital", --chest name of logs
        bank      = true, --active bank (true|false)
        members   = 99, --maxmembers of organization
        blacklist = {
            active = true, --active blacklist (true|false)
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Hospital6", --group in service 
                offservice = "", --group off service 
                withdraw   = true, --permission to withdraw (true|false)
                manager    = true --permission to manager members (true|false)
            },
            [2] = { 
                inservice  = "Hospital5",
                offservice = "",
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Hospital4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [4] = { 
                inservice  = "Hospital3",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [5] = { 
                inservice  = "Hospital2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [6] = { 
                inservice  = "Hospital1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
        }
    },
    ["bombeiros"] = {
        chest     = "bombeiros",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Bombeiro6", --group in service 
                offservice = "", --group off service 
                withdraw   = true, --permission to withdraw (true|false)
                manager    = true --permission to manager members (true|false)
            },
            [2] = { 
                inservice  = "Bombeiro5",
                offservice = "",
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Bombeiro4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [4] = { 
                inservice  = "Bombeiro3",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [5] = { 
                inservice  = "Bombeiro2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [6] = { 
                inservice  = "Bombeiro1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
        }
    },
    ["mecanico"] = {
        chest     = "mecanico",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Mecanico",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Mecanico2",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [3] = { 
                inservice  = "Mecanico1",
                offservice = false,
                withdraw   = false,
                manager    = true
            }
        }
    },
    ["concessionaria"] = {
        chest     = "concessionaria",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "DONOConcessionaria",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Concessionaria",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
        }
    },
    ["policia"] = {
        chest     = "policia",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "COMANDANTE",
                offservice = "",
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "SUBCOMANDANTE",
                offservice = "",
                withdraw   = true,
                manager    = true
            },
            [3] = { 
                inservice  = "PMESP9",
                offservice = "",
                withdraw   = false,
                manager    = true
            },
            [4] = { 
                inservice  = "PMESP8",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [5] = { 
                inservice  = "PMESP7",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [6] = { 
                inservice  = "PMESP5",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [7] = { 
                inservice  = "PMESP4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [8] = { 
                inservice  = "PMESP4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [9] = { 
                inservice  = "PMESP2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [10] = { 
                inservice  = "PMESP2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [11] = { 
                inservice  = "PMESP1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [12] = { 
                inservice  = "ROCAM7",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [13] = { 
                inservice  = "ROCAM5",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [14] = { 
                inservice  = "ROCAM4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [15] = { 
                inservice  = "ROCAM4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [16] = { 
                inservice  = "ROCAM2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [17] = { 
                inservice  = "ROCAM2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [18] = { 
                inservice  = "ROCAM1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [19] = { 
                inservice  = "GRPAE3",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [20] = { 
                inservice  = "GRPAE2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [21] = { 
                inservice  = "GRPAE1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [22] = { 
                inservice  = "PC4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [23] = { 
                inservice  = "PC3",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [24] = { 
                inservice  = "PC2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [25] = { 
                inservice  = "PC1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [26] = { 
                inservice  = "PRF4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [27] = { 
                inservice  = "PRF3",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [28] = { 
                inservice  = "PRF2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [29] = { 
                inservice  = "PRF1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [30] = { 
                inservice  = "FT9",
                offservice = "",
                withdraw   = false,
                manager    = true
            },
            [31] = { 
                inservice  = "FT8",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [32] = { 
                inservice  = "FT7",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [33] = { 
                inservice  = "FT5",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [34] = { 
                inservice  = "FT4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [35] = { 
                inservice  = "FT4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [36] = { 
                inservice  = "FT2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [37] = { 
                inservice  = "FT2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [38] = { 
                inservice  = "FT1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [39] = { 
                inservice  = "BAEP9",
                offservice = "",
                withdraw   = false,
                manager    = true
            },
            [40] = { 
                inservice  = "BAEP8",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [41] = { 
                inservice  = "BAEP7",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [42] = { 
                inservice  = "BAEP5",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [43] = { 
                inservice  = "BAEP4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [44] = { 
                inservice  = "BAEP4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [45] = { 
                inservice  = "BAEP2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [46] = { 
                inservice  = "BAEP2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [47] = { 
                inservice  = "BAEP1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [48] = { 
                inservice  = "ROTA9",
                offservice = "",
                withdraw   = false,
                manager    = true
            },
            [49] = { 
                inservice  = "ROTA8",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [50] = { 
                inservice  = "ROTA7",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [51] = { 
                inservice  = "ROTA5",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [52] = { 
                inservice  = "ROTA4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [53] = { 
                inservice  = "ROTA4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [54] = { 
                inservice  = "ROTA2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [55] = { 
                inservice  = "ROTA2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [56] = { 
                inservice  = "ROTA1",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
        }
    },
    ["Mecanica"] = {
        chest     = "Mecanica",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Mecanico",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Mecanico2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Mecanico1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["FARC"] = {
        chest     = "FARC",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "FARC7",
                offservice = "",
                withdraw   = false,
                manager    = true
            },
            [2] = { 
                inservice  = "FARC6",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [3] = { 
                inservice  = "FARC5",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [4] = { 
                inservice  = "FARC4",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [5] = { 
                inservice  = "FARC3",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [6] = { 
                inservice  = "FARC2",
                offservice = "",
                withdraw   = false,
                manager    = false
            },
            [7] = { 
                inservice  = "FARC1",
                offservice = "",
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Taxista"] = {
        chest     = "Taxista",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Taxista",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Taxista",
                offservice = false,
                withdraw   = false,
                manager    = true
            }
        }
    },

    ["Burguershot"] = {
        chest     = "Burguershot",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "BurguerShot1",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "BurguerShot2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "BurguerShot3",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Roxos"] = {
        chest     = "Roxos",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Roxos",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Roxos2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Roxos1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Amarelos"] = {
        chest     = "Amarelos",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Amarelos",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Amarelos2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Amarelos1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Verdes"] = {
        chest     = "Verdes",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Verdes",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Verdes2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Verdes1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Anonymous"] = {
        chest     = "Anonymous",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Anonymous",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Anonymous2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Anonymous1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Driftking"] = {
        chest     = "Driftking",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Driftking",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Driftking2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Driftking1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Bratva"] = {
        chest     = "Bratva",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Bratva",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Bratva2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Bratva1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Cartel"] = {
        chest     = "Cartel",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Cartel",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Cartel2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Cartel1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Soa"] = {
        chest     = "Soa",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Soa",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "SOA2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "SOA1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["TheLost"] = {
        chest     = "TheLost",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-TheLost",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "TheLost2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "TheLost1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Vanilla"] = {
        chest     = "Vanilla",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Vanilla",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Vanilla2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Vanilla1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    ["Casino"] = {
        chest     = "Casino",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "Lider-Casino",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "Casino2",
                offservice = false,
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "Casino1",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    }
}

config.starttablet = function()
    vRP._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a","idle_b","prop_cs_tablet",49,60309)
end

config.stoptablet = function()
	vRP._DeletarObjeto()
	vRP._stopAnim(false)
end

return config