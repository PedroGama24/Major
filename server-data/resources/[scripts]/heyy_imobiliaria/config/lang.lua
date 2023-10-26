Lang = {
	playerHouseBlip = "~y~Residência: ~w~%s",
	availableHouseBlip = "~g~Disponível: ~w~%s",

	notifications = {
		maxCount = "Você já antingiu o número máximo de residências que pode adquirir!", -- NEW
		successfullyPurchased = "A residência foi adquirida com sucesso!",
		successfullySelled = "A residência foi vendida com sucesso!",
		taxSuccessfullyPaid = "A taxa da residência foi paga com sucesso!",
		successfullyUpgradedChest = "O baú da residência foi evoluído com sucesso!",
		arentOwner = "Você não é o dono desta residência!",
		arentAdded = "Você não possui permissão nesta residência!",
		alreadyOwned = "A residência desejada já foi adquirida por outra pessoa",
		alreadyAvailable = "Esta residência já foi vendida!",
		notAllowed = "Ninguém aceitou sua entrada na residência",
		unknownHouse = "A residência inserida é desconhecida por nossos agentes imobiliários",
		insufficientFunds = "Você não tem saldo suficiente para adquirir esta residência",
		insufficientTaxFunds = "Você não tem saldo suficiente para pagar a taxa desta residência",
		equalsOrLowerChestLevel = "O nível de baú inserido é igual ou inferior ao atual",
		invalidChestLevel = "O nível de baú inserido é inválido",
		
		buyHouse = "Deseja realizar a compra da residência <b>^houseName</b> por <b>R$^price</b>?",
		payTax = "Realizar renovação da taxa da residência <b>^houseName</b> por <b>R$^price</b>?",
		confirmChestUpgrade = "Deseja realizar o upgrade do baú por <b>R$^price</b>?",
		sellHouse = "Deseja vender a residência <b>^houseName</b> por <b>R$^price</b>?",

		sellTarget = "Insira o comprador da residência",
		notFoundSellTarget = "Não foi possível encontrar o alvo especificado",
		sellValue = "Insira o valor desejado pela residência",
		invalidSellValue = "O valor inserido não é válido",
		sellConfirmSent = "Confirmação de venda enviada ao destinatário, aguarde a resposta!",
		sellConfirmRejected = "Sua proposta de venda foi negada pelo destinatário!",
		buyHouseFromPlayer = "Você deseja adquirir a residência <b>^houseName</b> por <b>R$^price</b> de <b>^userName</b>?",

		visitTime = "Olá, seja bem-vindo a residência<b> ^houseName</b>! Você tem <b>^visitTime segundos</b> para avaliar a residência (metade no exterior e metade no interior).",
		visitEnded = "Seu tempo de visita acabou",
		
		housesListed = "As casas disponíveis foram listadas em seu GPS",

		notAdded = "O usuário não tem permissão na residência, adicione-a antes de tentar lhe adicionar a permissão de garagem.",

		clothingSaved = "Traje criado com sucesso!",
		clothingApplied = "Traje colocado com sucesso!",
		clothingRemoved = "Traje removido com sucesso!",

		actionNotFound = "Ação não encontrada",

		pendentTax = "A <b>Property Tax</b> da residência está atrasada.",
		daysToPay = "Faltam <b>^days dias</b> da casa <b>^houseName</b> vencer. Atente-se!",
		needPayment = "A taxa da casa <b>^houseName</b> está vencida!",

		scriptRestarted = "O sistema de casas foi reiniciado pela equipe, você foi teleportado para fora para não ficar preso em sua residência",

		managePermissions = {
			cantOwn = "Você não pode adicionar/remover suas próprias permissões da residência",

			generalAdd = "O usuário <b>^id</b> recebeu permissões em sua residência",
			generalRem = "O usuário <b>^id</b> teve suas permissões removidas da casa",

			garageAdd = "O usuário <b>^id</b> recebeu permissão de garagem em sua residência",
			garageRem = "O usuário <b>^id</b> teve sua permissão de garagem retirada"
		},

		houseEnter = {
			ring = "Esta casa já tem dono, deseja tocar a campainha da residência <b>^houseName</b>?",
			ringed = "Campainha da residência tocada... Aguardando resposta.",

			acceptEntrance = "<b>^nome ^sobrenome</b> tocou o interfone da residência <b>^houseName</b>. Deseja permitir a entrada do mesmo?"
		}
	},

	-- Menu de pause > Configurações > Teclado > FiveM (nome das configurações)
	-- Pause Menu > Configurations > Keyboard > FiveM (Config names)
	configs = {
		openImob = "Abrir imobiliária",
		openWardrobe = "Abrir guarda-roupas",
		openChest = "Abrir baú",
		enterHouse = "Entrar na casa (rápido)",
	},

	admin = {
		-- houseName = Nome da casa / House name
		-- nome = Nome do jogador / Player name
		-- sobrename = Sobrenome do jogador / Player surname
		addHouseConfirmation = "Você realmente deseja adicionar a casa <b>^houseName</b> para o jogador <b>^nome ^sobrenome</b>?",
		addHouseConfirmed = "Você adicionou a casa <b>^houseName</b> para o jogador <b>^nome ^sobrenome</b> com sucesso!",

		-- %s = Nome da casa / House name
		remHouseConfirmation = "Você realmente deseja remover TODOS OS DONOS da residência <b>%s</b>?",
		remHouseConfirmed = "TODOS OS DONOS da residência <b>%s</b> foram removidos!",
	},

	extras = {
		insertPresetName = "Qual será o nome do traje?",
		functions = {
			houseSteal = {
				minimumPolice = "Não há a quantidade mínima de policiais para iniciar o roubo",
				minimumItems = "Você não tem <b>^quantityx ^itemName</b> para iniciar o roubo",
				inCooldown = "Você precisa aguardar <b>^seconds segundos</b> para roubar esta casa novamente.",
				inGlobalCooldown = "Você precisa aguardar <b>^seconds segundos</b> para roubar outra casa novamente.",

				availableToStealBlip = "~r~Residência para Roubo",
				housesListed = "Uma casa aleatória, disponível para roubo, foi listada em seu GPS, verifique-o.",
				listCooldown = "Você precisa aguardar <b>^seconds segundos</b> para utilizar este comando novamente.",
				
				successfullyStoled = "Você roubou <b>^quantityx ^itemName</b> com sucesso!",
				pressToRobbery = "[~r~E~w~] Roubar",

				stealFailed = "Você forçou demais sua <b>Lockpick</b>, e não conseguiu abrir a porta.",

				enterMessage = "Você está roubando a residência de alguém. Cuidado! A polícia poderá ser alertada."
			}
		}
	}
}