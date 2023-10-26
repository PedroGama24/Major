local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


-- [[SQL BOLADO]]
vRP._prepare("vRP/add_carro_fabrica","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle) VALUES(@user_id,@vehicle)")
vRP._prepare("vRP/ver_vehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")

-- [[COLETANDO FERRAMENTAS]]

--[[ RegisterServerEvent("cpecas")
AddEventHandler("cpecas", function()
    local source = source
    local user_id = vRP.getUserId(source) 
    local player = vRP.getUserSource(user_id)
  --  if vRP.hasPermission(user_id,"trafico.liberado") then     
        if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("pecas") <= vRP.getInventoryMaxWeight(user_id) then
            vRPclient.playAnim(player,false,{task = "PROP_HUMAN_PARKING_METER"},false)
            TriggerClientEvent("Notify",source,"sucesso","Obtendo peças")
            TriggerClientEvent("progress",source,5000,"Obtendo")
            SetTimeout(5000, function()
                TriggerClientEvent("Notify",source,"sucesso","1x Peça adquirida")
                vRPclient._stopAnim(source,false)                
                vRP.giveInventoryItem(user_id,"pecas",1,true)                                  
            end)   
        else
            TriggerClientEvent("Notify",source,"negado","Seu inventário esta cheio!")    
        end  
    --else
     --   TriggerClientEvent("Notify",source,"negado","Você nao tem permissao!")    
   -- end
end) ]]

-- [[Montando veiculo]]

RegisterServerEvent("carro")
AddEventHandler("carro", function()
    local source = source
    local user_id = vRP.getUserId(source) 
    local player = vRP.getUserSource(user_id)
    if vRP.hasPermission(user_id,"driftking.permissao") then  
        if user_id then
            local menu = {name="Fabrica", css={top="75px",header_color="rgba(255,125,0,0.75)"}}
            menu["coquette3"] = {function(player,choice)       
                local modelo = "coquette3"
                local pistao = 4
                local lataria = 3
                local discofreio = 4
                local motorcarro = 1
                local portacarro = 2
                local volante = 1
                TriggerEvent('fabrica',player, modelo, pistao, lataria, discofreio,motorcarro,portacarro,volante)
                vRP.closeMenu(player)       
            end,"<img src='https://cdn.discordapp.com/attachments/879508287198990336/916394457992159253/800px-Coquette3.png' height='162' width='280' />"}

            menu["hotknife"] = {function(player,choice)       
                local modelo = "hotknife"
                local pistao = 6
                local lataria = 4
                local discofreio = 4
                local motorcarro = 1
                local portacarro = 2
                local volante = 1
                TriggerEvent('fabrica',player, modelo, pistao, lataria, discofreio,motorcarro,portacarro,volante)
                vRP.closeMenu(player)       
            end,"<img src='https://cdn.discordapp.com/attachments/879508287198990336/916397553170382898/800px-Hotknife.png' height='162' width='280' />"}
            
            menu["moonbeam"] = {function(player,choice)       
                local modelo = "moonbeam"
                local pistao = 4
                local lataria = 6
                local discofreio = 4
                local motorcarro = 1
                local portacarro = 4
                local volante = 1
                TriggerEvent('fabrica',player, modelo, pistao, lataria, discofreio,motorcarro,portacarro,volante)
                vRP.closeMenu(player)       
            end,"<img src='https://cdn.discordapp.com/attachments/879508287198990336/916400750593183814/800px-Moonbeam.png' height='162' width='280' />"}
            
            menu["retinue"] = {function(player,choice)       
                local modelo = "retinue"
                local pistao = 4
                local lataria = 3
                local discofreio = 4
                local motorcarro = 1
                local portacarro = 2
                local volante = 1
                TriggerEvent('fabrica',player, modelo, pistao, lataria, discofreio,motorcarro,portacarro,volante)
                vRP.closeMenu(player)       
            end,"<img src='https://cdn.discordapp.com/attachments/879508287198990336/916400699053600808/800px-Retinue.png' height='162' width='280' />"}
            
            menu["glendale"] = {function(player,choice)       
                local modelo = "glendale"
                local pistao = 4
                local lataria = 4
                local discofreio = 2
                local motorcarro = 1
                local portacarro = 4
                local volante = 1
                TriggerEvent('fabrica',player, modelo, pistao, lataria, discofreio,motorcarro,portacarro,volante)
                vRP.closeMenu(player)       
            end,"<img src='https://cdn.discordapp.com/attachments/879508287198990336/916401220149706792/800px-Glendale.png' height='162' width='280' />"}

            menu["warrener"] = {function(player,choice)       
                local modelo = "warrener"
                local pistao = 4
                local lataria = 3
                local discofreio = 2
                local motorcarro = 1
                local portacarro = 4
                local volante = 1
                TriggerEvent('fabrica',player, modelo, pistao, lataria, discofreio,motorcarro,portacarro,volante)
                vRP.closeMenu(player)       
            end,"<img src='https://cdn.discordapp.com/attachments/879508287198990336/916401888960839731/800px-Warrener.png' height='162' width='280' />"}

            menu["streiter"] = {function(player,choice)       
                local modelo = "streiter"
                local pistao = 4
                local lataria = 5
                local discofreio = 4
                local motorcarro = 1
                local portacarro = 4
                local volante = 1
                TriggerEvent('fabrica',player, modelo, pistao, lataria, discofreio,motorcarro,portacarro,volante)
                vRP.closeMenu(player)       
            end,"<img src='https://cdn.discordapp.com/attachments/879508287198990336/916401905163436032/800px-Streiter.png' height='162' width='280' />"}

            
            vRP.openMenu(player,menu)            
            Citizen.Wait(5000)
        end
    else
        TriggerClientEvent("Notify",source,"negado","Você não tem permissao")
    end
end)


AddEventHandler("fabrica", function(source,modelo,pistao,lataria,discofreio,motorcarro,portacarro,volante)
    local source = source
    local user_id = vRP.getUserId(source) 
    local player = vRP.getUserSource(user_id)   
    local vehicle = modelo  
    local rows = vRP.query("vRP/ver_vehicle", {user_id = user_id, vehicle = vehicle})
    if #rows > 0 then            
        TriggerClientEvent("Notify",source,"negado","Você já tem esse veículo..")
    else            
        if vRP.tryGetInventoryItem(user_id,"discofreio",discofreio) and vRP.tryGetInventoryItem(user_id,"lataria",lataria) and vRP.tryGetInventoryItem(user_id,"pistao",pistao) and vRP.tryGetInventoryItem(user_id,"motorcarro",motorcarro) and vRP.tryGetInventoryItem(user_id,"portacarro",portacarro) and vRP.tryGetInventoryItem(user_id,"volante",volante) then
            vRPclient.playAnim(player,false,{task = "PROP_HUMAN_PARKING_METER"},false)                
            TriggerClientEvent("Notify",source,"sucesso","Fabricado veiculo: "..modelo)  
            TriggerClientEvent("progress",source,120000,"Fabricando") 
            SetTimeout(120000, function()
                vRPclient._stopAnim(source,false)     
                TriggerClientEvent("Notify",source,"sucesso","Voce fabricou seu novo veiculo")                     
                vRP.execute("vRP/add_carro_fabrica", {
                    user_id = user_id,
                    vehicle = vehicle,
                })                  
            end)   
        else
            TriggerClientEvent("Notify",source,"negado","Voce nao tem os itens necessários")   
            TriggerClientEvent("Notify",source,"negado","Itens necessários: | <u>Pistao:</u> "..pistao.. " | |<u>Lataria:</u> "..lataria.." | <u>Motor:</u> "..motorcarro.." | <u>Porta:</u> "..portacarro.." | <u>Volante:</u> "..volante.." | <u>Disco de Freio:</u> "..discofreio.." |"  )   
        end  
    end          
end)


