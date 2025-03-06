cfg = cfg or {}

 local isServer = IsDuplicityVersion()

cfg.storeUrl = "https://discord.gg/hwMTUCk4xK"

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
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu um Audi R6 2021!",8000)
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
      model = "mercedesa45",
      name = "Mercedes45",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "mercedesa45"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Mercedes45 !", 8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "22g63",
      name = "Mercedes G63",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "22g63"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Mercedes G63!", 8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "mt07",
      name = "Mt07",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "mt07"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma MT 07!", 8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "h2carb",
      name = "Ninja H2 Carb",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "h2carb"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Ninja H2 Carb !", 8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "mazdarx7",
      name = "Mazda rx7",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "mazdarx7"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Mazda rx7!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "xre300",
      name = "XRE 300",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "xre300"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma XRE 300!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "nissan370z",
      name = "Nissan370z",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "nissan370z"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Nissan370z!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "nissangtr",
      name = "NissanGTR",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "nissangtr"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma NissanGTR!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "cayenneturbo",
      name = "Cayenne Turbo",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "cayenneturbo"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Cayenne Turbo!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "R1200GS",
      name = "R1200GS",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "R1200GS"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma R1200GS !",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "r1",
      name = "R1",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "r1"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma R1 !",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "r6",
      name = "R6",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "r6"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma R6 !",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "rrst",
      name = "Ranger Hover",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "rrst"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Ranger Hover !",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "civic2016",
      name = "Civic 2016",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "Civic 2016"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Civic 2016!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "civictper",
      name = "CivicTper R",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "civictper"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma CivicTper R!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "ferrariitalia",
      name = "Ferrari 458-italia",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "ferrariitalia"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Ferrari 458-italia!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "hornet",
      name = "Hornet",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "hornet"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Hornet!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "foxevo",
      name = "HuracanEvo",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "foxevo"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma HuracanEvo!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "foxevos",
      name = "HuracanEvos",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "foxevos"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma HuracanEvos!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "jetta2017",
      name = "Jetta 2017",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "jetta2017"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Jetta 2017!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "nissanskyliner34",
      name = "Skyline GTR R34",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "nissanskyliner34"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Skyline GTR R34!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "panamera17turbo",
      name = "Porsche Panamera Turbo S",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "panamera17turbo"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Porsche Panamera Turbo S!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "r1200",
      name = "R1200",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "r1200"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma R1200!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "s1000rr",
      name = "S1000r",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "s1000rr"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma S1000r!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "silvia",
      name = "Silvia",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "silvia"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Silvia!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "taycan21",
      name = "Porsche Taycan",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "taycan21"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Porsche Taycan!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "tenere1200",
      name = "Tenere 1200",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "tenere1200"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Tenere 1200!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "xj6",
      name = "XJ 6",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "xj6"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma xj6 !",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "bmwr1250rocam",
      name = "BMW R 1250",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "bmwr1250rocam"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma BMW R 1250!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "agerars",
      name = "Agera RS",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "agerars"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Agera RS!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "bmws",
      name = "S1000 ",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "bmws"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma S1000 !",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "armoredgle",
      name = "AMG GLE 53",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "armoredgle"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma AMG GLE 53  !",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "bmwi8",
      name = "BMW i8",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "bmwi8"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma BMW i8!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "huayrar",
      name = "Pagani",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "huayrar"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Pagani!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },

    {
      productType = "car",
      model = "polo2018",
      name = "Polo2018",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "polo2018"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Polo2018!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },
    {
      productType = "car",
      model = "911turbos",
      name = "911turbo",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "911turbos"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma 911 turbo!",8000)
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

    --- Carros para serem add depois na cidade como VIP
    
    --[[ {
      productType = "car",
      model = "fxxkevo",
      name = "Ferrari Evox",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "fxxkevo"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu um Ferrari Evox!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    },


    {
      productType = "car",
      model = "silvias15",
      name = "Silvia s15",
      price = 200,
      onBuy = function(source,user_id)
        if isServer then 
          local veiculo = "silvia"
          local ipva = 0 
          local carro = vRP.query("creative/get_vehicles", {user_id = user_id, ipva = ipva, vehicle = veiculo})
          TriggerClientEvent("Notify",source,"sucesso","Você adquiriu uma Silvia s15!",8000)
         vRP.execute("creative/add_vehicle", {user_id = user_id, ipva = ipva, vehicle = veiculo})
        end
      end
      
    }, ]]


  }
}

cfg.imagesUrl = "./images/"


cfg.identity = {
  sobrenome = "firstname", --[[ Nome do campo de sobrenome, nome baseado nas tabelas.]]
  nome      = "name",
}


cfg.onlyNotifyPlayersOnStore = true --

cfg.webhooks = {
  buy = "https://discord.com/api/webhooks/1174187184971063326/3kKi_NOPhvtt7M7fZahEzc7neZQQte5OdhiCTHx2K5QQJT9r2q9CHZsX3aQNTbIZ3mWC",
  roulette = "https://discord.com/api/webhooks/1174187184971063326/3kKi_NOPhvtt7M7fZahEzc7neZQQte5OdhiCTHx2K5QQJT9r2q9CHZsX3aQNTbIZ3mWC",
  commands = "https://discord.com/api/webhooks/1174187184971063326/3kKi_NOPhvtt7M7fZahEzc7neZQQte5OdhiCTHx2K5QQJT9r2q9CHZsX3aQNTbIZ3mWC",
  onremove = "https://discord.com/api/webhooks/1174187184971063326/3kKi_NOPhvtt7M7fZahEzc7neZQQte5OdhiCTHx2K5QQJT9r2q9CHZsX3aQNTbIZ3mWC",
  info = {
    title  = 'VIP',
    footer = ''
  }
}

return cfg