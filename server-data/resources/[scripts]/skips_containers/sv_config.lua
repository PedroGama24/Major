config = {}

config.chanceLendario = 1 -- 1% de chance
config.chanceEpico = 6    -- 6% de chance
config.chanceRaro = 15    -- 15% de chance
config.chanceNormal = 25  -- 25% de chance
config.chanceComum =  53 -- 53% de chance
                          -----------------
                          -- Total = 100% de chance
                          
config.imagesIP = ""
config.precoBox = 25 --Quantas coins pra abrir uma BOX
config.precoPromoBox = 17 --Quantas coins pra abrir 6 BOX de uma vez

--AREA DOS COMANDOS
config.comandoAddCoins = 'addcoins'
config.permComandoAddCoins = 'admin.permissao' -- Permissão para utilizar o /addcoins
config.permAbrirLonge = 'containers.permissao' -- Permissão para utilizar o /containers
config.webhookAddCoins = "https://discord.com/api/webhooks/1174186482500636752/XWKdxJEiz1l-_fqreu8J4TLZ8jDHFWwt1-fW-NqvIp78x1m7UogTrhxD_EAFO-MTu7QN"

config.comandoAbrirMenu= 'box' --Comando retorna uma notify mostrando a quanto tempo que a pessoa está no servidor
config.comandoTempoOnline = 'online' --Comando retorna uma notify mostrando a quanto tempo que a pessoa está no servidor
config.comandoComprar = 'comprarbox'  --Comando compra 25 coins(1BOX) caso as configs abaixo estejam habilitadas
config.venderInGame = false --true: ativa / false: desativa
config.precoBoxInGame = 3000000 -- valor para comprar 25 coins, estipulei 3kk
config.webhookBuyInGame = "https://discord.com/api/webhooks/1174186482500636752/XWKdxJEiz1l-_fqreu8J4TLZ8jDHFWwt1-fW-NqvIp78x1m7UogTrhxD_EAFO-MTu7QN"

config.execute = false
config.prepare = {
    rewardShow = "raridade = 'Lendario' OR raridade = 'Epico' OR raridade = 'Raro'",
    tabelaTempoOn = "vrp_users",
    tabelaCoins = "vrp_users",
    tabelaVeiculos = "vrp_user_vehicles",
    vrpGerarPlaca = false,
    checkVeiculo = "SELECT * FROM vrp_user_vehicles WHERE vehicle = @vehicle AND user_id = @user_id",
    insertVeiculo = "INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle) VALUES(@user_id,@vehicle)",
}

return config 