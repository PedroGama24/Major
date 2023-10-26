config = {
  salvarAttachsDb = true, -- SALVAR OS ATTACHS APLICADOS NO BANCO DE DADOS
  perderAttachsAoMorrer = true,
}

blips = {
  { x = 461.41, y = -983.05, z = 30.69, perms = { "admin.permissao" }, pagarPelaModificacao = false, usarItens = false }
}

comandos = {
  { comando = "att", perms = { "admin.permissao" } },
 -- { comando = "ati", perms = { }, pagarPelaModificacao = true, usarItens = true },
  { comando = "attachs", perms = { }, pagarPelaModificacao = true, usarItens = false }
}

priceAttachs = {
  mira = 7500,
  cano = 10000,
  grip = 5000,
  lanterna = 4000,
  carregador = 20000,
  municao = 20000,
  textura = 3500,
  textura_slide = 3500,
  cor = 3500,
}

attachsDefault = {
  ["mira"] = { text = "MIRA", price = 1000, imgCategoria = "https://imgur.com/ilpm03u.png" },
  ["cano"] = { text = "CANO", price = 2000, imgCategoria = "https://imgur.com/tM06Mum.png" },
  ["grip"] = { text = "GRIP", price = 3000, imgCategoria = "https://imgur.com/vbRBfZK.png" },
  ["lanterna"] = { text = "LANTERNA", price = 4000, imgCategoria = "https://imgur.com/HWKYHIk.png" },
  ["carregador"] = { text = "CARREGADOR", price = 5000, imgCategoria = "https://imgur.com/LRE7qiJ.png" },
  ["municao"] = { text = "MUNIÇÃO", price = 6000, imgCategoria = "https://imgur.com/dfamhES.png" },
  ["cor"] = { text = "COR DA ARMA", price = 1000, imgCategoria = "https://imgur.com/dTVpWsH.png" },
  ["textura"] = { text = "TEXTURA DA ARMA", price = 3500, imgCategoria = "https://imgur.com/9zpIjgv.png" },
  ["textura_slide"] = { text = "TEXTURA DO SLIDE", price = 2000, imgCategoria = "https://imgur.com/9zpIjgv.png" },
}

attachsItens = {
  mira = "attmira",
  cano = "attcano",
  grip = "attgrip",
  lanterna = "attlanterna",
  carregador = "attcarregador",
  textura = "atttextura",
  textura_slide = "atttexturaslide",
  cor = "attlatatinta",
}