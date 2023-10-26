------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
open = false
segundos = 0
nearestCraft = {}
nearestArmazem = {}
mesaOppened = 0

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MAIN THREAD
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local time = 1000
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        if not open then
            if length(nearestCraft) > 0 then
                for k,v in pairs(nearestCraft) do
                    local distance = #(pedCoords - vec3(v.coords[1],v.coords[2],v.coords[3]))
                    if distance <= v.visible then
                        time = 5
                        config.marker("craft", v.coords)

                        if IsControlJustPressed(0, 38) and segundos <= 0 then
                            segundos = 5
                            if config_server.onetable then
                                if vSERVER.checkOppened(k) then
                                    if vSERVER.checkPermission(v.perm) then
                                        openNui(v.type)
                                    else
                                        config.lang['notPermiss']()
                                    end
                                end
                            else
                                if vSERVER.checkPermission(v.perm) then
                                    openNui(v.type)
                                else
                                    config.lang['notPermiss']()
                                end
                            end
                        end

                    end
                end
            end

            if length(nearestArmazem) > 0 then
                for k,v in pairs(nearestArmazem) do
                    local distance = #(pedCoords - vec3(v.coords[1],v.coords[2],v.coords[3]))
                    if distance <= v.visible then
                        time = 5
                        config.marker("armazem", v.coords)

                        if IsControlJustPressed(0, 38) and segundos <= 0 then
                            segundos = 5

                            if vSERVER.checkPermission(v.perm) then
                                vSERVER.getItensArmazem(k)
                            else
                                config.lang['notPermiss']()
                            end
                        end

                        if IsControlJustPressed(0, 47) and segundos <= 0 then
                            segundos = 5

                            if vSERVER.checkPermission(v.perm) then
                                vSERVER.guardarItensArmazem(k)
                            else
                                config.lang['notPermiss']()
                            end
                        end
                    end
                end
            end
        end

        Citizen.Wait(time)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
openNui = function(tipo)
    if config_server.table[tipo] ~= nil then
        SendNUIMessage({ show = true, items = config_server.table[tipo].craft, orgID = tipo, imgDir = config.imgDir })
        SetNuiFocus(true,true)
        open = true
    end
end

src.blockAnimation = function(anim, time, status)
    in_status = status
    anim1 = anim[1]
    anim2 = anim[2]
    getCoords = GetEntityCoords(PlayerPedId())
    getHeading = GetEntityHeading(PlayerPedId())

    Wait(5000)
    async(function()
        while true do
            local time = 1000
            
            if in_status then
                if not IsEntityPlayingAnim(PlayerPedId(), anim1, anim2,3) then
                    SetEntityHeading(PlayerPedId(), getHeading)
                    SetEntityCoords(PlayerPedId(), getCoords.x, getCoords.y, getCoords.z - 0.7)
                    src.playAnim(anim)
                end
            end

            Citizen.Wait(time)
        end
    end)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CALLBACKS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("craftItem", function(data)
    if data then
        vSERVER.craftItem(data.craftID, data.item, data.spawnID, data.amount)
    end
end)

local delay = false
RegisterNUICallback("closeNUI", function(data)
    if data.antiDump then
        if not delay then
            delay = true
            vSERVER.sendLogDump()

            SetTimeout(5000, function() delay = false end)
        end
    else
        SetNuiFocus(false,false)
        open = false
    end

    if config_server.onetable then
        vSERVER._closeOppened()
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREADS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local time = 1500
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        if config_server ~= nil then
            if config_server.craftLocations then
                for k in pairs(config_server.craftLocations) do
                    local distance = #(pedCoords - vec3(config_server.craftLocations[k].coords[1],config_server.craftLocations[k].coords[2],config_server.craftLocations[k].coords[3]))
                    if distance < 10 then
                        nearestCraft[k] = config_server.craftLocations[k]
                    elseif nearestCraft[k] then
                        nearestCraft[k] = nil
                    end 
                end
            end

            if config_server.armazemLocations then
                for k in pairs(config_server.armazemLocations) do
                    local distance = #(pedCoords - vec3(config_server.armazemLocations[k].coords[1],config_server.armazemLocations[k].coords[2],config_server.armazemLocations[k].coords[3]))
                    if distance < 10 then
                        nearestArmazem[k] = config_server.armazemLocations[k]
                    elseif nearestArmazem[k] then
                        nearestArmazem[k] = nil
                    end 
                end
            end
        end

        Citizen.Wait(time)
    end
end)

Citizen.CreateThread(function()
    while true do
        local time = 1000
        
        if segundos > 0 then
            segundos = segundos - 1
        end

        if segundos <= 0 then
            segundos = 0
        end

        Citizen.Wait(time)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Functions
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function length(array)
    local len = 0
    for i in pairs(array) do 
        if array[i] then
            len = len + 1
        end
    end
    return len
end    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    Wait(1500)
    config_server = vSERVER.ServerConfig() -- Não mexa aqui
end)