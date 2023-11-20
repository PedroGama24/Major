ConfigRevistar = {}

ConfigRevistar = {
    revistar = true,
    command = "revistar",
    policial = false, -- 'true' caso policial precise pedir para revistar alguem
    normalPlayer = true, -- 'true' caso o player normal precise pedir permissão para revistar alguem
    morto = false, -- 'true' caso precise pedir permissão para revistar os mortos
    deadLife = 101, -- Vida do personagem quando estiver morto
    revistPolice = true, -- 'false' caso não seja permitido revistar policial
    messageRevist = "Você está sendo revistado, deseja aceitar?", -- Mensagem que aparecerá para quem estiver sendo revistado
    messageNegado = "A pessoa negou ser revistada", -- Mensagem que aparecerá quando a pessoa a ser revistada negar
    messageRevistPolice = "Você não pode revistar um policial", -- Mensagem que aparecerá quando alguem tentar revistar um policial
    webhookRoubado = "https://discord.com/api/webhooks/1174177578328784896/G_n4jIDfhLlj2Vg3R44Ehmrx__6w6onwuCtDsJq27cDz2GnhDrS0cfutTjC-fUp2fUWM", -- Webhook pra quando alguem roubar um item
    webhookDevolvido = "https://discord.com/api/webhooks/1174177578328784896/G_n4jIDfhLlj2Vg3R44Ehmrx__6w6onwuCtDsJq27cDz2GnhDrS0cfutTjC-fUp2fUWM", -- Webhook pra quando alguem devolver um item
    nameMoney = "reais", -- Nome da sua moeda
    blacklist = {
        'identidade'
    } -- blacklist de itens que não pdoem ser roubados
}
