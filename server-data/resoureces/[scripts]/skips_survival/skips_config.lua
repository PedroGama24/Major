

skips = {}


---- ABAIXO ESTA AS CONFIGURAÇÕES DO SISTEMA DE MORTE

skips.permgod = "god.permissao"  --PERMISSÃO PARA PODER USAR O COMANDO /GOD
skips.permgodadmin = "god.permissao"  --PERMISSÃO PARA PODER USAR O COMANDO /GODADMIN
skips.permgodall = "god.permissao"  --PERMISSÃO PARA PODER USAR O COMANDO /GODALL

skips.permre = "paramedico.permissao"  --PERMISSÃO PARA PODER USAR O COMANDO /RE
skips.permpolicia = "policia.permissao"  --PERMISSÃO PARA O POLICIA PODER USAR /RE SE NÃO HOUVER MEDICO


---- [ AQUI ABAIXO COLOQUE ALGUNS ITEMS PARA O PLAYER PODER PROCURAR NOS TUMULOS APÓS DESISTIR ] ----

skips.itemtumulo = { --- ITENS DE ALTA PROBABILIDADE AO PROCURAR NOS TUMULOS
	[1] = { ['item'] = "garrafaaguavazia" }, 
	[2] = { ['item'] = "graosimpuros" } 
}

skips.itemtumulo2 = { --- ITENS DE MEDIA PROBABILIDADE AO PROCURAR NOS TUMULOS
	[1] = { ['item'] = "roupas" },
	[2] = { ['item'] = "carnecrua" }
}

skips.itemtumulo3 = { --- ITENS DE BAIXA PROBABILIDADE AO PROCURAR NOS TUMULOS
	[1] = { ['item'] = "dinheirosujo" },
	[2] = { ['item'] = "celular" },
	[3] = { ['item'] = "garrafaaguavazia" }
}

skips.prim_vis = false

skips.cutscene_pos_morte = true
skips.cutscene_pos_desistir = false

skips.respawn_pos_morte = vector3(-435.87, -359.0, 34.95) 
skips.heading_do_ped_p_m = 0.01

skips.respawn_pos_desistir = vector3(-1763.02,-262.65,48.22) 
skips.heading_do_ped_p_d = 144.20

skips.tempo_morte = 600
skips.timepdeath = 480
-----------------------------------------------------------------------------------------------------------------------------------------
-- [ LOGS DOS COMANDOS ] ----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

skips.loggod = ""  --LOG COMANDO GOD
skips.loggodadmin = ""  --LOG COMANDO GODADMIN
skips.loggodall = ""  --LOG COMANDO GODALL
skips.logre = ""  --LOG COMANDO RE
skips.killlog = "" --LOG DAS KILLs



return skips