
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
        TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.6vw; margin: 0.1vw; background-image: linear-gradient(to right, rgba(17, 17, 17,1) 5%, rgba(36, 211, 242,0) 95%); border-radius: 30px 30px 30px 30px;"><i class="fab fa-twitter"></i> @{0}: {1}</div>',
        args = { fal, message }
        })

    end
 end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

   -- if not WasEventCanceled() then
      --  TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, '/' .. command) 
    --end

    CancelEvent()
    end)

-- player join messages


-- command suggestions for clients
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                    })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
    end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
    end)
	
    ---------------------------------------------------------
--[[     RegisterCommand('tw', function(source, args, rawCommand)
        local message = rawCommand:sub(3)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-image: linear-gradient(to right, rgba(36, 211, 242,1) 3%, rgba(0, 0, 0,0) 95%); border-radius: 15px 50px 30px 5px;"><img style="width: 20px" src="https://www.flaticon.com/svg/static/icons/svg/733/733579.svg"> @{0}: {1}</div>',
        args = { fal, message }
        })
    end) ]]


    RegisterCommand('ilegal', function(source, args, rawCommand)
        local message = rawCommand:sub(8)
        local user_id = vRP.getUserId(source)
        if user_id ~= nil then
            for k, v in pairs(vRP.getUsers()) do
                if not vRP.hasPermission(k, "policia.permissao") then
                    TriggerClientEvent('chat:addMessage', v, {
                        template = '<div style="padding: 0.6vw; margin: 0.1vw; background-image: linear-gradient(to right, rgba(0, 0, 0,0.7) 3%, rgba(0, 0, 0,0) 95%); border-radius: 30px 30px 30px 30px;"><i class="fab fa-twitter"></i> @Anônimo: {1}</div>',
                        args = { fal, message }
                    })
                else 
                    TriggerClientEvent("Notify",source,"negado","Você é um policial?!",8000)
                end
                
            end
        
        end
    end)

    
    RegisterCommand('pm', function(source, args, rawCommand)
        local message = rawCommand:sub(4)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
        if vRP.hasPermission(user_id, "policia.permissao") then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.6vw; margin: 0.1vw; background-image: linear-gradient(to right, rgba(35, 142, 219,0.3) 3%, rgba(0, 0, 0,0) 95%); border-radius: 30px 30px 30px 30px;"><img style="width: 18px" src=""> 👮 [Policial] @{0}: {1}</div>',
            args = { fal, message }
        })
         else 
        TriggerClientEvent("Notify",source,"negado","Você não é um policial",8000)
        end
    end, false)

    RegisterCommand('hos', function(source, args, rawCommand)
        local message = rawCommand:sub(4)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
        if vRP.hasPermission(user_id, "paramedico.permissao") then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.6vw; margin: 0.1vw; background-image: linear-gradient(to right, rgba(255, 10, 10,0.3) 3%, rgba(0, 0, 0,0) 95%); border-radius: 30px 30px 30px 30px;"><img style="width: 18px" src=""> 👨‍⚕️ [Médico] @{0}: {1}</div>',
            args = { fal, message }
        })
         else 
        TriggerClientEvent("Notify",source,"negado","Você não é um médico",8000)
        end
    end, false)
    
    
    RegisterCommand('pft', function(source, args, rawCommand)
        local message = rawCommand:sub(4)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
        if vRP.hasPermission(user_id, "admin.permissao") then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.6vw; margin: 0.1vw; background-image: linear-gradient(to right, rgba(255, 255, 10,0.3) 20%, rgba(0, 0, 0,0) 80%); border-radius: 30px 30px 30px 30px;"><img style="width: 18px" src=""> 🌈 [PREFEITURA]: {1}</div>',
            args = { fal, message }
        })
        end
    end, false)
    
--[[     RegisterCommand('admin', function(source, args, rawCommand)
        local message = rawCommand:sub(6)
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        fal = identity.name.. " " .. identity.firstname
        if vRP.hasPermission(user_id, "admin.permissao") then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.4vw; margin: 0.1vw; background-image: linear-gradient(to right, rgba(255, 10, 10,0.3) 3%, rgba(0, 0, 0,0) 95%); border-radius: 30px 30px 30px 30px;"><img style="width: 17px" src=""> 🌈 [PREFEITURA]: {1}</div>',

            args = { fal, message }
        })
        end
    end, false) ]]
    
    RegisterCommand('limpachat', function(source)
        local user_id = vRP.getUserId(source);
        if user_id ~= nil then
            if vRP.hasPermission(user_id, "admin.permissao") then
                TriggerClientEvent("chat:clear", -1);
            --  TriggerClientEvent("chatMessage", source, " ");
            else
                TriggerClientEvent("chat:clear", source);
                --TriggerClientEvent("chatMessage", source, "Você não tem permissão");
            end
        end
    end)