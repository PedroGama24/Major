cfg = {}

cfg.vehicles = { -- HASH DA CARRETINHA | DISTANCIA MINIMA
    [GetHashKey('carretinhajetski')] = 15.0
}

cfg.avaiables = {
    [GetHashKey('carretinhajetski')] = { -- HASH DA CARRETINHA
	[GetHashKey('seashark3')] = true, -- HASH DOS VEICULOS PERMITIDOS NELA
    [GetHashKey('seashark2')] = true, -- HASH DOS VEICULOS PERMITIDOS NELA
    [GetHashKey('seashark')] = true, -- HASH DOS VEICULOS PERMITIDOS NELA[GetHashKey('sanchez')] = true, -- HASH DOS VEICULOS PERMITIDOS NELA
    }
}