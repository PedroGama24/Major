--[ VARIAVEL ]----------------------------------------------------------------------------------------------------------------

Config = {}

--[ LICENÇA ]--------------------------------------------------------------------------------------------------------------------

Config.licenca = '727674669280395286-cc_mdt-txgfi' -- Licença do script; Não lembra? Envie no privado de nosso bot Carioca Auth, o comando: .subinfo !

--[ CONFIGURAÇÃO ]----------------------------------------------------------------------------------------------------------------
--[ LOGO ]--------------------------------------------------------------------------------------------------------------------

Config.logo = 'https://cdn.discordapp.com/attachments/1001361166125248573/1027609132670406748/Logo_.png'

--[ WEBHOOKS ]--------------------------------------------------------------------------------------------------------------------

Config.webhookCriarBoletim = 'https://discord.com/api/webhooks/1174173225362661428/oR2Qp2ESF5YaPb1sQoqr4F0_FSqe5MNJ9QQz4plFlkT4ir6PihnaQ6xHeFQRdtuBMsBf' -- Webhook para criação de boletins;

Config.webhookDelBoletim = 'https://discord.com/api/webhooks/1174173225362661428/oR2Qp2ESF5YaPb1sQoqr4F0_FSqe5MNJ9QQz4plFlkT4ir6PihnaQ6xHeFQRdtuBMsBf' -- Webhook para o deletamento de boletins de ocorrência;

Config.webhookPrender = 'https://discord.com/api/webhooks/1174173225362661428/oR2Qp2ESF5YaPb1sQoqr4F0_FSqe5MNJ9QQz4plFlkT4ir6PihnaQ6xHeFQRdtuBMsBf' -- Webhook quando um boletim for finalizado e o criminoso preso;

Config.webhookDelCadastro = 'https://discord.com/api/webhooks/1174173225362661428/oR2Qp2ESF5YaPb1sQoqr4F0_FSqe5MNJ9QQz4plFlkT4ir6PihnaQ6xHeFQRdtuBMsBf' -- Webhook quando um administrador, deletar um cadastro;

--[ COMANDO ]--------------------------------------------------------------------------------------------------------------------

Config.comandoAbrir = 'mdt' -- Comando para abrir o Tablet;

--[ PERMISSOES ]--------------------------------------------------------------------------------------------------------------------

Config.permissaoPolicial = 'policia.permissao' -- Permissão para abrir o MDT;

Config.permissaoAdministrativa = '.coronel' -- Permissão que consiguirá acessar a pagina Gerenciar Oficiais;

--[ PRENDER SOMENTE DENTRO DE ZONA ]-------------------------------------------------------------------------------------------------

Config.enablePrenderEmZona = false -- Somente será possível finalizar um boletim dentro de uma zona;

Config.coordenadaZona = vector3(0,0,0) -- Coodernada da zona;

Config.raioZona = 20 -- Raio da zona;

--[ PATENTE ]--------------------------------------------------------------------------------------------------------------------

Config.gtypePatente = 'job' -- Gtype de promoções;

--[ MAPA ]--------------------------------------------------------------------------------------------------------------------

Config.tipoDeMapa = 'Mainmap'

--[ PERSONALIZAÇÃO ]--------------------------------------------------------------------------------------------------------------------

Config.carroCutScene = 'pbus' -- Carro em que será spawnado, durante a Cut Scene da prisão;

Config.roupaDetento = { -- Roupa em que o prisioneiro será vestido; Após o fim de sua sentença, ela será retirada;
        [1885233650] = {
                [1] = { -1,0 }, -- máscara
                [3] = { 0,0 }, -- maos
                [4] = { 5,7 }, -- calça
                [5] = { -1,0 }, -- mochila
                [6] = { 5,2 }, -- sapato
                [7] = { -1,0 },  -- acessorios
                [8] = { -1,0 }, -- blusa
                [9] = { -1,0 }, -- colete
                [10] = { -1,0 }, -- adesivo
                [11] = { 22,0 }, -- jaqueta	
                ["p0"] = { -1,0 }, -- chapeu
                ["p1"] = { -1,0 },
                ["p2"] = { -1,0 },
                ["p6"] = { -1,0 },
                ["p7"] = { -1,0 }
        },
        [-1667301416] = {
                [1] = { -1,0 },
                [2] = { 72,0 },
                [3] = { 11,0 },
                [4] = { 66,6 },
                [5] = { -1,0 },
                [6] = { 5,0 },
                [7] = { -1,0 },
                [8] = { 6,0 },
                [9] = { -1,0 },
                [10] = { -1,0 },
                [11] = { 118,0 },
                ["p0"] = { -1,0 },
                ["p1"] = { -1,0 },
                ["p2"] = { -1,0 },
                ["p6"] = { -1,0 },
                ["p7"] = { -1,0 }
        }
}

--[ AVANÇADO ]--------------------------------------------------------------------------------------------------------------------
--[ UPLOAD IMAGENS ]---------------------------------------------------------------------------------------------------------------------

Config.qualidadeDoUpload = 0.1 -- Qualidade de upload. Quanto mais baixo, mais rapido será, mas sua qualidade irá diminuir;

--[ PRENDER ]---------------------------------------------------------------------------------------------------------------------

Config.penaMaxima = 500 -- Pena maxima permitida;

--[ URL IMAGEM CARROS ]------------------------------------------------------------------------------------------------------------------

Config.urlImagemCarros = 'http://181.215.254.113/skips/vehicles/' -- URL em que seus carros ficam hospedados;

--[ CODIGO PENAL ]--------------------------------------------------------------------------------------------------------------

Config.codigoPenal = {
        {
                ["descricao"] = "Homicidio Doloso Qualificado", -- Descrição do crime;
                ["pena"] = 5, -- Pena do crime;
                ["multa"] = 30000, -- Multa do crime;
                ["fianca"] = false -- Fiança do crime; Caso for inafiançável, deve se colocar: false ;
        },
        {
                ["descricao"] = "Homicidio Doloso",
                ["pena"] = 70,
                ["multa"] = 25000,
                ["fianca"] = false
        },
        {
                ["descricao"] = "Tentativa de Homicidio",
                ["pena"] = 50,
                ["multa"] = 20000,
                ["fianca"] = false
        },
        {
                ["descricao"] = "Homicidio Culposo",
                ["pena"] = 40,
                ["multa"] = 15000,
                ["fianca"] = 100000
        },
        {
                ["descricao"] = "Homicidio Culposo no Transito",
                ["pena"] = 35,
                ["multa"] = 10000,
                ["fianca"] = false
        },
        {
                ["descricao"] = "Lesão corporal",
                ["pena"] = 25,
                ["multa"] = 5000,
                ["fianca"] = 62500
        },
        {
                ["descricao"] = "Terrorismo",
                ["pena"] = 50,
                ["multa"] = 20000,
                ["fianca"] = false
        },
        {
                ["descricao"] = "Sequestro",
                ["pena"] = 70,
                ["multa"] = 30000,
                ["fianca"] = false
        },
        {
                ["descricao"] = "Desmanche de Carros",
                ["pena"] = 50,
                ["multa"] = 25000,
                ["fianca"] = 125000
        },
        {
                ["descricao"] = "Furto",
                ["pena"] = 30,
                ["multa"] = 15000,
                ["fianca"] = 75000
        },
        {
                ["descricao"] = "Roubo de Veículos",
                ["pena"] = 40,
                ["multa"] = 20000,
                ["fianca"] = 100000
        },
        {
                ["descricao"] = "Roubo",
                ["pena"] = 35,
                ["multa"] = 15000,
                ["fianca"] = 87500
        },
        {
                ["descricao"] = "Roubo a Banco",
                ["pena"] = 100,
                ["multa"] = 50000,
                ["fianca"] = false
        },
        {
                ["descricao"] = "Roubo a Loja",
                ["pena"] = 45,
                ["multa"] = 20000,
                ["fianca"] = 112500
        },
        {
                ["descricao"] = "Roubo Joalheiria",
                ["pena"] = 70,
                ["multa"] = 35000,
                ["fianca"] = false
        },
        {
                ["descricao"] = "Furto a Caixa eletronico",
                ["pena"] = 30,
                ["multa"] = 15000,
                ["fianca"] = 75000
        },
        {
                ["descricao"] = "Posse de Dinheiro sujo",
                ["pena"] = 40,
                ["multa"] = 40000,
                ["fianca"] = false
        },
        {
                ["descricao"] = "Posse de peças de armas",
                ["pena"] = 30,
                ["multa"] = 25000,
                ["fianca"] = 75000
        },
        {
                ["descricao"] = "Tráfico de Armas",
                ["pena"] = 100,
                ["multa"] = 50000,
                ["fianca"] = 250000
        },
        {
                ["descricao"] = "Porte de Arma Ilegal",
                ["pena"] = 50,
                ["multa"] = 25000,
                ["fianca"] = 125000
        },
        {
                ["descricao"] = "Trafico de Munição",
                ["pena"] = 80,
                ["multa"] = 40000,
                ["fianca"] = 200000
        },
        {
                ["descricao"] = "Posse de Componentes Narcoticos",
                ["pena"] = 30,
                ["multa"] = 20000,
                ["fianca"] = 75000
        },
        {
                ["descricao"] = "Tráfico de Drogas",
                ["pena"] = 80,
                ["multa"] = 30000,
                ["fianca"] = 200000
        },
        {
                ["descricao"] = "Direção Perigosa",
                ["pena"] = 0,
                ["multa"] = 20000,
                ["fianca"] = false
        }
}

--[ ATENUANTES ]--------------------------------------------------------------------------------------------------------------
    
Config.atenuantesPenal = {
        {
                ["descricao"] = "Réu Primário", -- Descrição do atenuante;
                ["porcentagem"] = 40 -- Porcentagem que será reduzida do crime;
        },
        {
                ["descricao"] = "Presença de um Advogado;",
                ["porcentagem"] = 10
        },
        {
                ["descricao"] = "Colaboração com a investigação;",
                ["porcentagem"] = 30
        }
}

--[ AGRAVANTES ]--------------------------------------------------------------------------------------------------------------
    
Config.agravantesPenal = {
        {
                ["descricao"] = "Resistência a prisão;", -- Descrição do agravante;
                ["porcentagem"] = 30 -- Porcentagem que será aumentada do crime;
        },
        {
                ["descricao"] = "Criminoso reincidente;",
                ["porcentagem"] = 20
        }
}