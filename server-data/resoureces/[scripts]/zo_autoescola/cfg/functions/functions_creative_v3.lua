notify = function(trigger, source, type, msg)
    if source then
        return trigger("Notify", source, type, msg)
    end
    
    trigger("Notify", type, msg)
end

zof = {
    getUserId = function(source)
        return vRP.getUserId(source)
    end,

    getName = function(id)
        local identity = zof.getUserIdentity(id)
        return identity.name .. " " .. identity.name2
    end,

    getInfosCnh = function(user_id, categorias)
        local identity = zof.getUserIdentity(user_id)

        return {
            nome = zof.getName(user_id),
            idade = "Sem informação",
            cpf = identity.id,
            categorias = categorias,
        }
    end,

    prompt = function(source, title, text)
        return vRP.prompt(source, title, text)
    end,

    hasPermission = function(user_id, group)
        return vRP.hasPermission(user_id, group)
    end,

    replaceWeapons = function(source, weapons)
        return vRPclient.replaceWeapons(source, weapons)
    end,

    giveInventoryItem = function(user_id, item, qtd)
        return vRP.giveInventoryItem(user_id, item, qtd)
    end,

    getUData = function(id, key)
        return json.encode(vRP.userData(id, key) or {}) 
    end,

    setUData = function(id, key, data)
        return vRP.execute("playerdata/setUserdata", { user_id = parseInt(id), key = key, value = data })
    end,

    getUserIdentity = function(user_id)
        return vRP.userIdentity(user_id)
    end,

    getNearestPlayer = function(source, range)
        return vRPclient.nearestPlayer(source, range)
    end,
    
    tryGetInventoryItem = function(user_id, item, qtd)
        return vRP.tryGetInventoryItem(user_id, item, qtd)
    end,
    
    tryPayment = function(user_id, value)
        return vRP.paymentFull(user_id, value)
    end,

    tryFullPayment = function(user_id, value)
        return vRP.paymentFull(user_id, value)
    end,
    
    getUserDataTable = function(user_id)
        return vRP.getDatatable(user_id)
    end,
    
    setUserData = function(user_id, data)
        return vRP.setUserData(user_id, data)
    end,

    giveWeapons = function(arma, municao)
        vRP.giveWeapons({
            [arma] = {
                ammo = municao
            }
        })
    end,

    _CarregarObjeto = function(dict,anim,prop,flag,hand,pos1,pos2,pos3,pos4,pos5,pos6)
        return vRP._CarregarObjeto(dict,anim,prop,flag,hand,pos1,pos2,pos3,pos4,pos5,pos6)
    end,

    _stopAnim = function(bool)
        return vRP._stopAnim(bool)
    end,

    _DeletarObjeto = function()
        return vRP._DeletarObjeto()
    end,

    spawnVehicle = function(type)
        local vhash = GetHashKey(type.vehicle)
    
        while not HasModelLoaded(vhash) do
            RequestModel(vhash)
            Citizen.Wait(10)
        end
        
        if HasModelLoaded(vhash) then
            nveh = CreateVehicle(vhash, type.spawnLoc[1], type.spawnLoc[2], type.spawnLoc[3], type.spawnLoc[4], true, false)
            local netveh = VehToNet(nveh)
            local id = NetworkGetNetworkIdFromEntity(nveh)
    
            NetworkRegisterEntityAsNetworked(nveh)
            while not NetworkGetEntityIsNetworked(nveh) do
                NetworkRegisterEntityAsNetworked(nveh)
                Citizen.Wait(1)
            end
    
            if NetworkDoesNetworkIdExist(netveh) then
                SetEntitySomething(nveh, true)
                if NetworkGetEntityIsNetworked(nveh) then
                    SetNetworkIdExistsOnAllMachines(netveh, true)
                end
            end
            
            local vehPlate = "VEH".. parseInt(math.random(10000,99999))
    
            SetNetworkIdCanMigrate(id, true)
            SetVehicleNumberPlateText(NetToVeh(netveh), vehPlate)
            SetEntityAsMissionEntity(NetToVeh(netveh), true, true)
            SetVehicleHasBeenOwnedByPlayer(NetToVeh(netveh), true)
            SetVehicleNeedsToBeHotwired(NetToVeh(netveh), false)
            SetModelAsNoLongerNeeded(nveh)
            SetVehRadioStation(NetToVeh(netveh), "OFF")
    
            TriggerServerEvent("engine:insertEngines", id, 100, "")
            TriggerServerEvent("plateHardness", vehPlate, 1)
            TriggerServerEvent("plateEveryone", vehPlate)
        end
        
        return nveh
    end
}