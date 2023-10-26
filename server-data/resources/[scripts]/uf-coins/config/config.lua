cfg = cfg or {}

 local isServer = IsDuplicityVersion()

cfg.storeUrl = "https://discord.gg/fivembrasil"

cfg.columnName = "coins"

cfg.commands = {
  openUi = "loja" --[[ /loja ]],
  admin = {
    give = {
      command = "addmoeda",
      permission = "admin.permissao"
    },
    remove = {
      command = "removermoeda",
      permission = "admin.permissao"
    },
    set = {
      command = "setarmoeda",
      permission = "admin.permissao"
    },
    giveall = {
      command = "coinstoall",
      permission = "admin.permissao",
    }
  }
}

-- if isServer then 
   
-- end


cfg.roulette = {
  price = 20,
  types = {
    ["lendario"] = {
      porcent = 0.1,
      notifyAll = {
        chat = {
          enabled = true,
          message = "{nome} {sobrenome} pegou um item LENDÁRIO na Roleta da Sorte! ({item})",
          chat_template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(255, 200, 0, 1) 3%, rgba(46, 128, 255,0) 95%);border-radius: 5px;">{0}</div>'
        }, 
        notify = true
      },
    },
    ["epico"] = {
      porcent = 0.2,
      notifyAll = {
        chat = {
          enabled = true,
          message = "{nome} {sobrenome} pegou um item ÉPICO na Roleta da Sorte! ({item})",
          chat_template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(255, 0, 43, 0.8) 3%, rgba(46, 128, 255,0) 95%);border-radius: 5px;">{0}</div>'
        }, 
        notify = true
      },
    },
    ["raro"] = {
      porcent = 0.6,
      notifyAll = {
        chat = {
          enabled = true,
          chat_template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, #00ddff 3%, rgba(46, 128, 255,0) 95%);border-radius: 5px;">{0}</div>',
          message = "{nome} {sobrenome} pegou um item RARO na Roleta da Sorte! ({item})"
        }, 
        notify = true
      },
    },
    ["normal"] = {
      porcent = 30.0,
      notifyAll = {
        chat = {
          chat_template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(42,255,142,1) 3%, rgba(46, 128, 255,0) 95%);border-radius: 5px;">{0}</div>',
          enabled = false,
          message = "{nome} {sobrenome} pegou um item NORMAL na Roleta da Sorte! ({item})"
        }, 
        notify = true
      },
    }
  },
  items = {
    {
      productType = "item",
      idname = "vipouro",
      name = "VIP OURO",
      amount = 1,
      type = 'lendario',
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.addUserGroup(user_id,"Ouro")
          TriggerClientEvent("Notify",source,"sucesso","VIP OURO aplicado com sucesso!",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end,
      temporary = {
        enable = true,
        days = 30,
        onRemove = function(source,user_id)
        end
      },
    },
    {
      productType = "item",
      idname = "vipprata",
      name = "VIP PRATA",
      amount = 1,
      type = 'epico',
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.addUserGroup(user_id,"Prata")
          TriggerClientEvent("Notify",source,"sucesso","VIP PRATA aplicado com sucesso!",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end,
      temporary = {
        enable = true,
        days = 30,
        onRemove = function(source,user_id)
        end
      },
    },
      {
        productType = "item",
        idname = "lockpick",
        name = "Lockpick",
        amount = 1,
        type = "normal",
        onBuy = function(source,user_id)
          if isServer then 
            local user_id = vRP.getUserId(source)
            vRP.giveInventoryItem(user_id,"lockpick",1)
            TriggerClientEvent("Notify",source,"sucesso","Você ganhou um lockpick!",8000)
            --execute this content server-side after buy action
          else 
            --execute this content client-side after buy action
          end
        end,
      }, 
      {
        productType = "item",
        idname = "corda",
        name = "Corda",
        amount = 1,
        type = "normal",
        onBuy = function(source,user_id)
          if isServer then 
            local user_id = vRP.getUserId(source)
            vRP.giveInventoryItem(user_id,"corda",1)
            TriggerClientEvent("Notify",source,"sucesso","Você ganhou uma corda!",8000)
            --execute this content server-side after buy action
          else 
            --execute this content client-side after buy action
          end
        end,
      },
      {
        productType = "item",
        idname = "agua",
        name = "Água",
        amount = 3,
        type = "normal",
        onBuy = function(source,user_id)
          if isServer then 
            local user_id = vRP.getUserId(source)
            vRP.giveInventoryItem(user_id,"agua",3)
            TriggerClientEvent("Notify",source,"sucesso","Você ganhou 3 águas!",8000)
            --execute this content server-side after buy action
          else 
            --execute this content client-side after buy action
          end
        end,
      },
      {
        productType = "item",
        idname = "maletacouro",
        name = "Maleta Couro",
        amount = 1,
        type = 'raro',
        onBuy = function(source,user_id)
          if isServer then 
            local user_id = vRP.getUserId(source)
            vRP.giveMoney(user_id,100000)
            TriggerClientEvent("Notify",source,"sucesso","Você ganhou 100K!",8000)
            --execute this content server-side after buy action
          else 
            --execute this content client-side after buy action
          end
        end,
      },

      {
        productType = "item",
        idname = "maletaprata",
        name = "Maleta Prata",
        amount = 1,
        type = 'raro',
        onBuy = function(source,user_id)
          if isServer then 
            local user_id = vRP.getUserId(source)
            vRP.giveMoney(user_id,200000)
            TriggerClientEvent("Notify",source,"sucesso","Você ganhou 200K!",8000)
            --execute this content server-side after buy action
          else 
            --execute this content client-side after buy action
          end
        end,
      },
     
  }
}


cfg.coinName = 'Coins'

cfg.products = {
  ["Itens"] = {
    {
      productType = "item",
      idname = "vipplatina",
      name = "VIP PLATINA",
      amount = 1,
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.addUserGroup(user_id,"Platina")
          TriggerClientEvent("Notify",source,"sucesso","VIP PLATINA aplicado com sucesso!",8000)
    --      vRP.giveMoney(user_id,1000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end,
      temporary = {
        enable = true,
        days = 30,
        onRemove = function(source,user_id)
        end
      },
    },
    {
      productType = "item",
      idname = "vipouro",
      name = "VIP OURO",
      amount = 1,
      price = 150,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.addUserGroup(user_id,"Ouro")
          TriggerClientEvent("Notify",source,"sucesso","VIP OURO aplicado com sucesso!",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end,
      temporary = {
        enable = true,
        days = 30,
        onRemove = function(source,user_id)
        end
      },
    },
    {
      productType = "item",
      idname = "vipprata",
      name = "VIP PRATA",
      amount = 1,
      price = 100,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.addUserGroup(user_id,"Prata")
          TriggerClientEvent("Notify",source,"sucesso","VIP PRATA aplicado com sucesso!",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end,
      temporary = {
        enable = true,
        days = 30,
        onRemove = function(source,user_id)
        end
      },
    },
    {
      productType = "item",
      idname = "vipbronze",
      name = "VIP BRONZE",
      amount = 1,
      price = 50,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.addUserGroup(user_id,"Bronze")
          TriggerClientEvent("Notify",source,"sucesso","VIP BRONZE aplicado com sucesso!",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end,
      temporary = {
        enable = true,
        days = 30,
        onRemove = function(source,user_id)
        end
      },
    },

    {
      productType = "item",
      idname = "maletacouro",
      name = "R$100.000 Reais",
      amount = 1,
      price = 20,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.giveMoney(user_id,100000)
          TriggerClientEvent("Notify",source,"financeiro","Você recebeu R$100.000",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end
      --[[temporary = {
        enable = true,
        days = 10,
        onRemove = function(source,user_id)
        end
      },]]--
    },
    {
      productType = "item",
      idname = "maletaprata",
      name = "R$200.000 Reais",
      amount = 1,
      price = 30,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          --vRP.addUserGroup(user_id,"InstaVerify")
          vRP.giveMoney(user_id,200000)
          TriggerClientEvent("Notify",source,"financeiro","Você recebeu R$200.000",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end
    },
    {
      productType = "item",
      idname = "maletaouro",
      name = "R$500.000 Reais",
      amount = 1,
      price = 50,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          --vRP.addUserGroup(user_id,"InstaVerify")
          vRP.giveMoney(user_id,500000)
          TriggerClientEvent("Notify",source,"financeiro","Você recebeu R$500.000",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end
    },

    {
      productType = "item",
      idname = "instaverificado",
      name = "Insta Verificado",
      amount = 1,
      price = 15,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.addUserGroup(user_id,"VerificadoInsta")
          TriggerClientEvent("Notify",source,"sucesso","Você agora é verificado no instagram!",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end
    },

    {
      productType = "item",
      idname = "identidadevip",
      name = "Identidade VIP",
      amount = 1,
      price = 25,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.giveInventoryItem(user_id,"identidadevip",1)
            TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Identidade VIP!",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end
    },

    {
      productType = "item",
      idname = "chipvip",
      name = "Chip VIP",
      amount = 1,
      price = 25,
      onBuy = function(source,user_id)
        if isServer then 
          local user_id = vRP.getUserId(source)
          vRP.giveInventoryItem(user_id,"chipvip",1)
            TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Chip VIP!",8000)
          --execute this content server-side after buy action
        else 
          --execute this content client-side after buy action
        end
      end
    },



  },
  ["Veiculos"] = {
    {
      productType = "car",
      model = "rs6c8",
      name = "Audi R6 2021",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "rs6c8"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu um Audi R6!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "p1",
      name = "Mclaren P1",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "p1"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma McLaren P1!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "defender21",
      name = "Defender 2021",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "defender21"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Defender 2021!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "golfgti7",
      name = "Golf GTI",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "golfgti7"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Golf GTI!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "gs310",
      name = "GS 310",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "gs310"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma GS 310!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "500x",
      name = "CB 500x",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "500x"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma CB 500x!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "sultanrs",
      name = "Sultan RS",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "sultanrs"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu um Sultan RS!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "lancerevolutionx",
      name = "Lancer Evolution X",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "lancerevolutionx"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu um Lancer Evolution X!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },


  }
}

cfg.imagesUrl = "./images/"


cfg.identity = {
  sobrenome = "firstname", --[[ Nome do campo de sobrenome, nome baseado nas tabelas.]]
  nome      = "name",
}


cfg.onlyNotifyPlayersOnStore = true --

cfg.webhooks = {
  buy = "https://discord.com/api/webhooks/943742295440752671/TtN2i5-Zm_HwfQqPVjWqfdYplq0QMmg2oRlcnKLfvZE4W4vUojcINX4r_myYC0Bf_i5H",
  roulette = "https://discord.com/api/webhooks/943742295440752671/TtN2i5-Zm_HwfQqPVjWqfdYplq0QMmg2oRlcnKLfvZE4W4vUojcINX4r_myYC0Bf_i5H",
  commands = "https://discord.com/api/webhooks/943742295440752671/TtN2i5-Zm_HwfQqPVjWqfdYplq0QMmg2oRlcnKLfvZE4W4vUojcINX4r_myYC0Bf_i5H",
  onremove = "https://discord.com/api/webhooks/943742295440752671/TtN2i5-Zm_HwfQqPVjWqfdYplq0QMmg2oRlcnKLfvZE4W4vUojcINX4r_myYC0Bf_i5H",
  info = {
    title  = 'VIP',
    footer = ''
  }
}

return cfg