
-- IMPORTANTE: Alguns desses valores DEVEM ser definidos como um número de ponto flutuante. ou seja. 10,0 em vez de 10
Config = {
	deformationMultiplier = -1,					-- Quanto o veículo deve se deformar visualmente em uma colisão. Faixa de 0,0 a 10,0 Onde 0,0 é sem deformação e 10,0 é 10x deformação. -1 = Não toque. Dano visual não sincroniza bem com outros jogadores.
	deformationExponent = 0.2,					-- Quanto a configuração de deformação do arquivo de manuseio deve ser compactada para 1,0. (Tornar os carros mais parecidos). Um valor de 1 = nenhuma alteração. Valores mais baixos irão comprimir mais, valores acima de 1 irão expandir. Não defina como zero ou negativo.
	collisionDamageExponent = 0.3,				-- Quanto a configuração de deformação do arquivo de manuseio deve ser compactada para 1,0. (Tornar os carros mais parecidos). Um valor de 1 = nenhuma alteração. Valores mais baixos irão comprimir mais, valores acima de 1 irão expandir. Não defina como zero ou negativo.

	damageFactorEngine = 1.3,					-- Valores saudáveis ​​são de 1 a 100. Valores mais altos significam mais danos ao veículo. Um bom ponto de partida é 10
	damageFactorBody = 1.9,						-- Valores saudáveis ​​são de 1 a 100. Valores mais altos significam mais danos ao veículo. Um bom ponto de partida é 10
	damageFactorPetrolTank = 45.0,				-- Valores sãos são de 1 a 200. Valores mais altos significam mais danos ao veículo. Um bom ponto de partida é 64
	engineDamageExponent = 0.4,					-- Quanto a configuração de dano do mecanismo de arquivo de manipulação deve ser compactada para 1.0. (Tornar os carros mais parecidos). Um valor de 1 = nenhuma alteração. Valores mais baixos irão comprimir mais, valores acima de 1 irão expandir. Não defina como zero ou negativo.
	weaponsDamageMultiplier = 1.3,				-- Quanto dano o veículo deve receber do fogo das armas. Intervalo de 0,0 a 10,0, onde 0,0 é nenhum dano e 10,0 é 10x dano. -1 = não toque
	degradingHealthSpeedFactor = 5,			-- Velocidade de degradação lenta da saúde, mas não falha. O valor de 10 significa que levará cerca de 0,25 segundo por ponto de integridade, portanto, a degradação de 800 a 305 levará cerca de 2 minutos de condução limpa. Valores mais altos significam degradação mais rápida
	cascadingFailureSpeedFactor = 4.0,			-- Os valores saudáveis ​​são de 1 a 100. Quando a saúde do veículo cai abaixo de um certo ponto, a falha em cascata se instala e a saúde cai rapidamente até que o veículo morra. Valores mais altos significam falha mais rápida. Um bom ponto de partida é 8

	degradingFailureThreshold = 400.0,			-- Abaixo desse valor, a degradação lenta da saúde será definida em
	cascadingFailureThreshold = 180.0,			-- Abaixo desse valor, a falha em cascata de integridade será definida em
	engineSafeGuard = 100.0,					-- Valor final de falha. Defina-o muito alto e o veículo não fumará quando desativado. Ajuste muito baixo e o carro pegará fogo de uma única bala no motor. Com saúde 100, um carro típico pode levar de 3 a 4 balas no motor antes de pegar fogo.

	torqueMultiplierEnabled = true,				-- Diminua o torque do motor à medida que o motor fica cada vez mais danificado

	limpMode = false,							-- Se verdadeiro, o motor nunca falha completamente, então você sempre poderá ir a um mecânico, a menos que você vire seu veículo e preventVehicleFlip esteja definido como verdadeiro
	limpModeMultiplier = 0.09,					-- O multiplicador de torque a ser usado quando o veículo está mancando. Valores sãos são 0,05 a 0,25

	preventVehicleFlip = false,					-- Se for verdade, você não pode virar um veículo de cabeça para baixo

	sundayDriver = false,						-- Se for verdade, a resposta do acelerador é dimensionada para permitir uma condução lenta fácil. Não impedirá a aceleração total. Não funciona com aceleradores binários como um teclado. Defina como false para desabilitar. O recurso de parada sem reversão e retenção de luz de freio incluído também funciona para teclados.
	sundayDriverAcceleratorCurve = 7.5,			-- A curva de resposta a ser aplicada ao acelerador. Faixa de 0,0 a 10,0. Valores mais altos permitem uma condução lenta mais fácil, o que significa que é necessária mais pressão no acelerador para acelerar para a frente. Não faz nada para drivers de teclado
	sundayDriverBrakeCurve = 5.0,				-- A curva de resposta a ser aplicada ao freio. Faixa de 0,0 a 10,0. Valores mais altos permitem uma frenagem mais fácil, o que significa que é necessária mais pressão no acelerador para frear com força. Não faz nada para drivers de teclado

	compatibilityMode = false,					-- impede que outros scripts modifiquem a integridade do tanque de combustível para evitar falhas aleatórias do motor com BVA 2.01 (A desvantagem é a prevenção de explosão desabilitada)

	randomTireBurstInterval = 0,				-- Número de minutos (estatisticamente, não precisamente) para dirigir acima de 22 mph antes de ter um pneu furado. 0=recurso está desabilitado

	-- Multiplicador de Fator de Dano de Classe
	-- O fator de dano para motor, carroceria e tanque de gasolina será multiplicado por este valor, dependendo da classe do veículo
	-- Use-o para aumentar ou diminuir o dano de cada classe
	classDamageMultiplier = {
		[0] = 	0.9,		--	0: Compacts
				0.9,		--	1: Sedans
				0.9,		--	2: SUVs
				0.9,		--	3: Coupes
				0.9,		--	4: Muscle
				0.9,		--	5: Sports Classics
				0.9,		--	6: Sports
				0.9,		--	7: Super
				0.25,		--	8: Motorcycles
				0.5,		--	9: Off-road
				0.25,		--	10: Industrial
				0.9,		--	11: Utility
				0.9,		--	12: Vans
				0.9,		--	13: Cycles
				0.5,		--	14: Boats
				0.9,		--	15: Helicopters
				0.9,		--	16: Planes
				0.9,		--	17: Service
				0.5,		--	18: Emergency
				0.5,		--	19: Military
				0.9,		--	20: Commercial
				0.9			--	21: Trains
	}
}