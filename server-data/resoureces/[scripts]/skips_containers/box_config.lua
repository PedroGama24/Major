config = {}

config.addCoinTime = 60 --Tempo em minutos que vai adicionar coin para a pessoa, no caso 60 = 60 Minutos = 1 hora
config.geral = {
    name = "Containers",
    nameCoins = "Five Coins",
    dataValidade = "03/02/2023 00:55:00",
    
}

config.box = {
    {
        box = 1, name= "Caixa 01", categorias = {
            {raridade = "Lendario", items = {
                {item = "teslax", type="carro", itemName="Tesla Model X", qtd="1"},
                {item = "dinheiro", type="dinheiro", itemName="1KK Limpo", qtd="1000000"},
            }},
            {raridade = "Epico", items = {
                {item = "gs310", type="carro", itemName="BMW GS310", qtd="1"},
                {item = "ttrs", type="carro", itemName="Audi TT", qtd="1"},
                {item = "ak47", type="arma", spawn = "wbody|WEAPON_ASSAULTRIFLE", itemName="AK-47", qtd="1"},
                {item = "dinheiro", type="dinheiro", itemName="100k Limpo", qtd="100000"},
                {item = "dinheirosujo", type="item", itemName="200k Sujo", qtd="200000"},
            }},
            {raridade = "Raro", items = {
                {item = "fiveseven", type="arma", spawn = "wbody|WEAPON_PISTOL_MK2", itemName="Five Seven", qtd="1"},
                {item = "cg1602", type="carro", itemName="CG 160", qtd="1"},
                {item = "dinheirosujo", type="item", itemName="150k Sujo", qtd="85000"},
                {item = "algemas", type="dinheiro", itemName="algemas", qtd="1"},
                {item = "capuz", type="item", itemName="Capuz", qtd="1"},
            }},
            {raridade = "Normal", items = {
                {item = "dinheiro", type="dinheiro", itemName="50k Limpo", qtd="50000"},
                {item = "dinheirosujo", type="item", itemName="100k Sujo", qtd="100000"},
                {item = "corda", type="item", itemName="Corda", qtd="1"},
                {item = "celular", type="item", itemName="Celular", qtd="1"},
                {item = "colete1", type="item", itemName="Colete", qtd="1"},
                {item = "raceticket", type="item", itemName="Ticket Corrida", qtd="1"},
            }},
            {raridade = "Comum", items = {
       --         {item = "ak47mk2", type="q    ", spawn = "wammo|WEAPON_ASSAULTRIFLE_MK2", itemName="M.AK-47 MK2", qtd="100"},
         --       {item = "fiveseven", type="arma", spawn = "wammo|WEAPON_PISTOL_MK2", itemName="M.Five Seven", qtd="100"},
          --      {item = "dinheirosujo", type="item", itemName="10K Sujo", qtd="10000"},
                {item = "mochila", type="item", itemName="Mochila", qtd="1"},
                {item = "agua", type="item", itemName="Agua", qtd="1"},
                {item = "xtudo", type="item", itemName="X-Tudo", qtd="1"},
                {item = "lockpick", type="item", itemName="Lockpick", qtd="1"},
                {item = "bombaadesiva", type="item", itemName="bombaadesiva", qtd="1"},
            }},
        },
    },
    {
        box = 2, name= "Caixa 02", categorias = {
            {raridade = "Lendario", items = {
                {item = "teslax", type="carro", itemName="Tesla Model X", qtd="1"},
                {item = "dinheiro", type="dinheiro", itemName="1KK Limpo", qtd="1000000"},
            }},
            {raridade = "Epico", items = {
                {item = "gs310", type="carro", itemName="BMW GS310", qtd="1"},
                {item = "ttrs", type="carro", itemName="Audi TT", qtd="1"},
                {item = "ak47", type="arma", spawn = "wbody|WEAPON_ASSAULTRIFLE", itemName="AK-47", qtd="1"},
                {item = "dinheiro", type="dinheiro", itemName="100k Limpo", qtd="100000"},
                {item = "dinheirosujo", type="item", itemName="200k Sujo", qtd="200000"},
            }},
            {raridade = "Raro", items = {
                {item = "fiveseven", type="arma", spawn = "wbody|WEAPON_PISTOL_MK2", itemName="Five Seven", qtd="1"},
                {item = "cg1602", type="carro", itemName="CG 160", qtd="1"},
                {item = "dinheiro", type="dinheiro", itemName="10k Limpo", qtd="100000"},
                {item = "dinheirosujo", type="item", itemName="150k Sujo", qtd="150000"},
                {item = "algemas", type="dinheiro", itemName="algemas", qtd="1"},
            }},
            {raridade = "Normal", items = {
                {item = "dinheiro", type="dinheiro", itemName="50k Limpo", qtd="50000"},
                {item = "dinheirosujo", type="item", itemName="100k Sujo", qtd="100000"},
                {item = "corda", type="item", itemName="Corda", qtd="1"},
                {item = "colete", type="item", itemName="Colete", qtd="1"},
                {item = "raceticket", type="item", itemName="Ticket Corrida", qtd="1"},
            }},
            {raridade = "Comum", items = {
       --         {item = "ak47mk2", type="q    ", spawn = "wammo|WEAPON_ASSAULTRIFLE_MK2", itemName="M.AK-47 MK2", qtd="100"},
         --       {item = "fiveseven", type="arma", spawn = "wammo|WEAPON_PISTOL_MK2", itemName="M.Five Seven", qtd="100"},
          --      {item = "dinheirosujo", type="item", itemName="10K Sujo", qtd="10000"},
                {item = "mochila", type="item", itemName="Mochila", qtd="1"},
                {item = "agua", type="item", itemName="Agua", qtd="1"},
                {item = "xtudo", type="item", itemName="X-Tudo", qtd="1"},
                {item = "lockpick", type="item", itemName="Lockpick", qtd="1"},
                {item = "bombaadesiva", type="item", itemName="bombaadesiva", qtd="1"},
            }},
        },
    },
}
 
return config