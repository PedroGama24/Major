local block_fabricar = {}
local fabricando = {}
local delay = {}

local playerCraft = {}
local itemAmount = {}
local itemTime = {}

local workOpenned = {}

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.craftItem = function(craftid, item, spawnID, amount)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local idCraft = craftid        
        if delay[idCraft] ~= nil then
            config.lang['waitCraft'](source, delay[idCraft])
            return
        end

        if fabricando[user_id] then
            config.lang['fabricandoItem'](source)
            return
        end

        local craft = config.table[tostring(idCraft)]
        if craft ~= nil then
            delay[idCraft] = config.delayCraft
            spawnID = config.table[tostring(idCraft)].craft[tostring(item)].spawnID or false
            
            if not spawnID then
                print("error")
                return
            end

            if parseInt(amount) <= 0 then
                amount = 1
            end

            playerCraft[user_id] = {
                idItem = item,
                idSpawn = spawnID,
                idAmount = amount,
                craftID = idCraft
            }
            
            if craft.armazem then
                if config.armazemLocations[idCraft] then
                    local data = vRP.getSData("armazem:"..idCraft)
                    local items = json.decode(data) or {}
                    if items then
                        local checkItem = craft.craft[playerCraft[user_id].idItem]
                        if checkItem ~= nil then
                            if not src.checkInventoryWeight(user_id, playerCraft[user_id].idSpawn, playerCraft[user_id].idAmount) then
                                config.lang['backpackFull'](source)
                                return
                            end

                            local getItens = checkItem.requires
                            local mensagem = ""

                            for k,v in pairs(getItens) do
                                requireItem = v.item
                                requireAmount = parseInt(v.amount * playerCraft[user_id].idAmount)

                                if items[tostring(requireItem)] ~= nil then
                                    itemAmount[user_id] = items[tostring(requireItem)].amount

                                    if itemAmount[user_id] < requireAmount then
                                        block_fabricar[parseInt(user_id)] = true
                                        mensagem = mensagem.."Item: <b>"..src.getItemName(requireItem).. "</b> na quantidade <b>"..itemAmount[user_id].."/"..requireAmount.."</b><br>"
                                    end
                                else
                                    if items[tostring(requireItem)] == nil then
                                        itemAmount[user_id] = 0
                                    end

                                    block_fabricar[parseInt(user_id)] = true
                                    mensagem = mensagem.."Item: <b>"..src.getItemName(requireItem).. "</b> na quantidade <b>"..itemAmount[user_id].."/"..requireAmount.."</b><br>"
                                end
                            end

                            if not block_fabricar[parseInt(user_id)] then
                                for k,v in pairs(getItens) do
                                    requireItem = v.item
                                    requireAmount = parseInt(v.amount * playerCraft[user_id].idAmount)
                                    itemAmount[user_id] = items[tostring(requireItem)].amount

                                    if itemAmount[user_id] >= requireAmount then
                                        items[tostring(requireItem)].amount =  itemAmount[user_id] - requireAmount

                                        if itemAmount[user_id] <= 0 then
                                            itemAmount[user_id] = 0
                                        end
                                    else
                                        block_fabricar[parseInt(user_id)] = true
                                    end
                                end

                                if not block_fabricar[parseInt(user_id)] then
                                    itemAmount[user_id] = checkItem.customAmount * playerCraft[user_id].idAmount
                                    itemTime[user_id] = checkItem.tempo * playerCraft[user_id].idAmount

                                    corpoHook = { { ["color"] = config.weebhook['color'], ["title"] = "**".. ":man_construction_worker: | Craft de Item " .."**\n", ["thumbnail"] = { ["url"] = config.weebhook['logo'] }, ["description"] = "**USER_ID:**\n```cs\n"..user_id.."```\n**CRAFTOU:** ```css\n".. src.getItemName(playerCraft[user_id].idSpawn) .." " .. parseInt(playerCraft[user_id].idAmount) .."x```\n**MESA:**\n ```cs\n"..playerCraft[user_id].craftID.."```", ["footer"] = { ["text"] = config.weebhook['footer'], }, } }

                                    if itemTime[user_id] == 0 then
                                        src.giveInventoryItem(user_id, playerCraft[user_id].idSpawn, itemAmount[user_id])
                                        sendToDiscord(craft.weebhook, corpoHook)
                                    else
                                        src.progressBar(user_id, itemTime[user_id])
                                        src.playAnim(source, checkItem.anim[1],checkItem.anim[2])
                                        fabricando[user_id] = true

                                        SetTimeout(itemTime[user_id]*1000, function() 
                                            fabricando[user_id] = nil
                                            src.giveInventoryItem(user_id, playerCraft[user_id].idSpawn, itemAmount[user_id])
                                            src.stopAnim(source)
                                            vCLIENT.blockAnimation(source, checkItem.anim, itemTime[user_id], false)
                                            
                                            sendToDiscord(craft.weebhook, corpoHook)
                                        end)

                                        vCLIENT.blockAnimation(source, checkItem.anim, itemTime[user_id], true)
                                    end

                                    vRP.setSData("armazem:"..idCraft, json.encode(items))
                                else
                                    config.lang['erroFabricar'](source)
                                end
                            end

                            if mensagem ~= "" then
                                config.lang['notArmazemItem'](source, mensagem, "armazem")
                            end

                            block_fabricar[parseInt(user_id)] = nil
                        else
                            print("Erro: O Item "..item.." não foi encontrado na mesa ("..idCraft.. ").")
                        end
                    end
                else
                    print("Erro: Armazem ("..idCraft.. ") não foi encontrada.")
                end
            else
                local checkItem = craft.craft[playerCraft[user_id].idItem]
                if checkItem ~= nil then
                    if not src.checkInventoryWeight(user_id, playerCraft[user_id].idSpawn, playerCraft[user_id].idAmount) then
                        config.lang['backpackFull'](source)
                        return
                    end

                    local getItens = checkItem.requires
                    local mensagem = ""

                    for k,v in pairs(getItens) do
                        requireItem = v.item
                        requireAmount = parseInt(v.amount * playerCraft[user_id].idAmount)

                        local amount = src.getInventoryItemAmount(user_id, requireItem)
                        if amount < requireAmount then
                            mensagem = mensagem.."Item: <b>"..src.getItemName(requireItem).. "</b> na quantidade <b>"..amount.."/"..requireAmount.."</b><br>"
                            block_fabricar[parseInt(user_id)] = true
                        end
                    end

                    if not block_fabricar[parseInt(user_id)] then
                        for k,v in pairs(getItens) do
                            requireItem = v.item
                            requireAmount = parseInt(v.amount * playerCraft[user_id].idAmount)
                           
                            local amount = src.getInventoryItemAmount(user_id, requireItem)
                            if amount >= requireAmount then
                                src.tryGetInventoryItem(user_id, requireItem, requireAmount)
                            else
                                block_fabricar[parseInt(user_id)] = true
                            end
                        end

                        if not block_fabricar[parseInt(user_id)] then
                            itemAmount[user_id] = checkItem.customAmount * playerCraft[user_id].idAmount
                            itemTime[user_id] = checkItem.tempo * playerCraft[user_id].idAmount

                            corpoHook = { { ["color"] = config.weebhook['color'], ["title"] = "**".. ":man_construction_worker: | Craft de Item " .."**\n", ["thumbnail"] = { ["url"] = config.weebhook['logo'] }, ["description"] = "**USER_ID:**\n```cs\n"..user_id.."```\n**CRAFTOU:** ```css\n".. src.getItemName(playerCraft[user_id].idSpawn) .." " .. parseInt(playerCraft[user_id].idAmount) .."x```\n**MESA:**\n ```cs\n"..playerCraft[user_id].craftID.."```\n**DATA:** ```cs\n"..os.date("\n%d/%m/%Y as %H:%M:%S").."```", ["footer"] = { ["text"] = config.weebhook['footer'], }, } }

                            if itemTime[user_id] == 0 then
                                src.giveInventoryItem(user_id, playerCraft[user_id].idSpawn, itemAmount[user_id])
                                sendToDiscord(craft.weebhook, corpoHook)
                            else
                                src.progressBar(user_id, itemTime[user_id])
                                src.playAnim(source, checkItem.anim[1],checkItem.anim[2])
                                fabricando[user_id] = true

                                SetTimeout(itemTime[user_id]*1000, function() 
                                    fabricando[user_id] = nil
                                    src.giveInventoryItem(user_id, playerCraft[user_id].idSpawn, itemAmount[user_id])
                                    src.stopAnim(source)
                                    vCLIENT.blockAnimation(source, checkItem.anim, itemTime, false)
                                    
                                    sendToDiscord(craft.weebhook, corpoHook)
                                end)

                                vCLIENT.blockAnimation(source, checkItem.anim, itemTime[user_id], true)
                            end

                        else
                            config.lang['erroFabricar'](source)
                        end
                    end

                    if mensagem ~= "" then
                        config.lang['notArmazemItem'](source, mensagem, "pessoal")
                    end

                    block_fabricar[parseInt(user_id)] = nil
                end
            end
        else
            print("Erro: Mesa de Craft ("..idCraft.. ") não foi encontrada.")
        end
    end
end

src.checkOppened = function(id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if workOpenned[id] == nil or not workOpenned[id] then
            workOpenned[id] = user_id 

            return true
        end

        TriggerClientEvent("Notify",source,"negado","Está mesa já esta aberta por outra pessoa.", 5000)
    end
end

src.closeOppened = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        for k in pairs(workOpenned) do
            if workOpenned[k] == user_id then
                workOpenned[k] = nil 
            end
        end
    end
end

src.getItensArmazem = function(tipo)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local data = vRP.getSData("armazem:"..tipo)
        local items = json.decode(data) or {}
        local mensagem = ""

        if items then
            for k,v in pairs(items) do
                mensagem = mensagem.."Item: <b>"..src.getItemName(k).."</b> Quantidade: <b>"..v.amount.."x</b><br> "
            end

            if mensagem == "" then
                config.lang['notArmazemItens'](source)
                return
            end

            config.lang['armazemItens'](source, mensagem)
        end
    end
end

src.guardarItensArmazem = function(tipo)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if config.table[tostring(tipo)] ~= nil then
            local craft = config.table[tostring(tipo)].craft
            local itensArmazem = {}
            local mensagem = ""
            local storeMensagem = ""

            for k,v in pairs(craft) do
                for k2,v2 in pairs(v.requires) do
                    itensArmazem[v2.item] = true
                end
            end

            local data = vRP.getSData("armazem:"..tipo)
            local items = json.decode(data) or {}
            if items then
                for k,v in pairs(itensArmazem) do
                    local amount = src.getInventoryItemAmount(user_id, k)
                    if amount > 0 then
                        if src.tryGetInventoryItem(user_id, k, amount) then
                            mensagem = mensagem.. "Item <b>"..src.getItemName(k).."</b> quantidade <b>"..amount.."x</b><br>"
                            storeMensagem = storeMensagem.. src.getItemName(k) .." "..amount.."x\n"

                            if items[k] ~= nil then
                                items[k] = { amount = items[k].amount + amount }
                            else
                                items[k] = { amount = amount }
                            end
                        end
                    end
                end
                

                if mensagem == "" then
                    config.lang['notStoreItens'](source)
                    return
                end

                config.lang['storeItens'](source, mensagem)
                vRP.setSData("armazem:"..tipo, json.encode(items))

                if storeMensagem ~= nil then
                    corpoHook = { { ["color"] = config.weebhook['color'], ["title"] = "**".. ":man_construction_worker: | Guardar Item " .."**\n", ["thumbnail"] = { ["url"] = config.weebhook['logo'] }, ["description"] = "**USER_ID:**\n```cs\n"..user_id.."```\n**GUARDOU:** ```css\n".. storeMensagem .."```\n**MESA:**\n ```cs\n"..tipo.."```\n**DATA:** ```cs\n"..os.date("\n%d/%m/%Y as %H:%M:%S").."```", ["footer"] = { ["text"] = config.weebhook['footer'], }, } }
                    sendToDiscord(config.table[tostring(tipo)].weebhook, corpoHook)
                end
            end
        else
            print("Erro: Mesa de Craft ("..tipo.. ") não foi encontrada.")
        end
    end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREADS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local time = 1000

        for k,v in pairs(delay) do
            delay[k] = v - 1

            if delay[k] <= 0 then
                delay[k] = nil
            end
        end

        Citizen.Wait(time)
    end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OUTRAS FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.ServerConfig = function()
    return config
end

src.sendLogDump = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        corpoHook = { { ["color"] = config.weebhook['color'], ["title"] = "**".. ":man_construction_worker: | ANTI DUMP " .."**\n", ["thumbnail"] = { ["url"] = config.weebhook['logo'] }, ["description"] = "**USER_ID:**\n```cs\n"..user_id.."```\n**DATA:** ```cs\n"..os.date("\n%d/%m/%Y as %H:%M:%S").."```", ["footer"] = { ["text"] = config.weebhook['footer'], }, } }
        sendToDiscord(config.weebdump, corpoHook)  
    end
end

function sendToDiscord(weebhook, message)
    PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({embeds = message}), { ['Content-Type'] = 'application/json' })
end
