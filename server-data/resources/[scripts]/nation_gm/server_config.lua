Proxy = module("vrp", "lib/Proxy")
Tunnel = module("vrp", "lib/Tunnel")
vRP = Proxy.getInterface("vRP")
func = {}
Tunnel.bindInterface("nation_gm", func)
fclient = Tunnel.getInterface("nation_gm")
vRP_groups = module("vrp", "cfg/groups").groups
config = {}
groups = {}
config.groups = {
    ["hospital"] = {
        [1] = { onService = "Hospital6", outService = "Hospital6Paycheck" },
        [2] = { onService = "Hospital5", outService = "Hospital5Paycheck" },
        [3] = { onService = "Hospital4", outService = "Hospital4Paycheck" },
        [4] = { onService = "Hospital3", outService = "Hospital3Paycheck" },
        [5] = { onService = "Hospital2", outService = "Hospital2Paycheck" },
        [6] = { onService = "Hospital1", outService = "Hospital1Paycheck" },
    },
    ["bombeiros"] = {
        [1] = { onService = "Bombeiro6", outService = "Bombeiro6Paycheck" },
        [2] = { onService = "Bombeiro5", outService = "Bombeiro5Paycheck" },
        [3] = { onService = "Bombeiro4", outService = "Bombeiro4Paycheck" },
        [4] = { onService = "Bombeiro3", outService = "Bombeiro3Paycheck" },
        [5] = { onService = "Bombeiro2", outService = "Bombeiro2Paycheck" },
        [6] = { onService = "Bombeiro1", outService = "Bombeiro1Paycheck" },
    },
    ["mecanico"] = {
        [1] = { onService = "Lider-Mecanico", outService = "Lider-MecanicoPaycheck" },
        [2] = { onService = "Mecanico2", outService = "MecanicoPaycheck2" },
        [3] = { onService = "Mecanico1", outService = "MecanicoPaycheck1" },
    },

    ["concessionaria"] = {
        [1] = { onService = "DONOConcessionaria", outService = "DONOConcessionariaPaycheck" },
        [2] = { onService = "Concessionaria", outService = "ConcessionariaPaycheck" },
    },

    ["pmesp"] = {
        [1] = { onService = "COMANDANTE", outService = "COMANDANTEPaycheck" },
        [2] = { onService = "SUBCOMANDANTE", outService = "SUBCOMANDANTEPaycheck" },
        [3] = { onService = "PMESP9", outService = "PMESP9Paycheck" },
        [4] = { onService = "PMESP8", outService = "PMESP8Paycheck" },
        [5] = { onService = "PMESP7", outService = "PMESP7Paycheck" },
        [6] = { onService = "PMESP6", outService = "PMESP6Paycheck" },
        [7] = { onService = "PMESP5", outService = "PMESP5Paycheck" },
        [8] = { onService = "PMESP4", outService = "PMESP4Paycheck" },
        [9] = { onService = "PMESP3", outService = "PMESP3Paycheck" },
        [10] = { onService = "PMESP2", outService = "PMESP2Paycheck" },
        [11] = { onService = "PMESP1", outService = "PMESP1Paycheck" },
    },
    ["rocam"] = {
        [1] = { onService = "ROCAM7", outService = "ROCAM7Paycheck" },
        [2] = { onService = "ROCAM6", outService = "ROCAM6Paycheck" },
        [3] = { onService = "ROCAM5", outService = "ROCAM5Paycheck" },
        [4] = { onService = "ROCAM4", outService = "ROCAM4Paycheck" },
        [5] = { onService = "ROCAM3", outService = "ROCAM3Paycheck" },
        [6] = { onService = "ROCAM2", outService = "ROCAM2Paycheck" },
        [7] = { onService = "ROCAM1", outService = "ROCAM1Paycheck" },
    },
    ["grpae"] = {
        [1] = { onService = "GRPAE3", outService = "GRPAE3Paycheck" },
        [2] = { onService = "GRPAE2", outService = "GRPAE2Paycheck" },
        [3] = { onService = "GRPAE1", outService = "GRPAE1Paycheck" },
    },
    ["pc"] = {
        [1] = { onService = "PC4", outService = "PC4Paycheck" },
        [2] = { onService = "PC3", outService = "PC3Paycheck" },
        [3] = { onService = "PC2", outService = "PC2Paycheck" },
        [3] = { onService = "PC1", outService = "PC1Paycheck" },
    },
    ["prf"] = {
        [1] = { onService = "PRF4", outService = "PRF4Paycheck" },
        [2] = { onService = "PRF3", outService = "PRF3Paycheck" },
        [3] = { onService = "PRF2", outService = "PRF2Paycheck" },
        [3] = { onService = "PRF1", outService = "PRF1Paycheck" },
    },
    ["ft"] = {
        [1] = { onService = "FT9", outService = "FT9Paycheck" },
        [2] = { onService = "FT8", outService = "FT8Paycheck" },
        [3] = { onService = "FT7", outService = "FT7Paycheck" },
        [4] = { onService = "FT6", outService = "FT6Paycheck" },
        [5] = { onService = "FT5", outService = "FT5Paycheck" },
        [6] = { onService = "FT4", outService = "FT4Paycheck" },
        [7] = { onService = "FT3", outService = "FT3Paycheck" },
        [8] = { onService = "FT2", outService = "FT2Paycheck" },
        [9] = { onService = "FT1", outService = "FT1Paycheck" },
    },
    ["baep"] = {
        [1] = { onService = "BAEP9", outService = "BAEP9Paycheck" },
        [2] = { onService = "BAEP8", outService = "BAEP8Paycheck" },
        [3] = { onService = "BAEP7", outService = "BAEP7Paycheck" },
        [4] = { onService = "BAEP6", outService = "BAEP6Paycheck" },
        [5] = { onService = "BAEP5", outService = "BAEP5Paycheck" },
        [6] = { onService = "BAEP4", outService = "BAEP4Paycheck" },
        [7] = { onService = "BAEP3", outService = "BAEP3Paycheck" },
        [8] = { onService = "BAEP2", outService = "BAEP2Paycheck" },
        [9] = { onService = "BAEP1", outService = "BAEP1Paycheck" },
    },
    ["rota"] = {
        [1] = { onService = "ROTA9", outService = "ROTA9Paycheck" },
        [2] = { onService = "ROTA8", outService = "ROTA8Paycheck" },
        [3] = { onService = "ROTA7", outService = "ROTA7Paycheck" },
        [4] = { onService = "ROTA6", outService = "ROTA6Paycheck" },
        [5] = { onService = "ROTA5", outService = "ROTA5Paycheck" },
        [6] = { onService = "ROTA4", outService = "ROTA4Paycheck" },
        [7] = { onService = "ROTA3", outService = "ROTA3Paycheck" },
        [8] = { onService = "ROTA2", outService = "ROTA2Paycheck" },
        [9] = { onService = "ROTA1", outService = "ROTA1Paycheck" },
    },
    ["eb"] = {
        [1] = { onService = "EB8", outService = "EB8Paycheck" },
        [2] = { onService = "EB7", outService = "EB7Paycheck" },
        [3] = { onService = "EB6", outService = "EB6Paycheck" },
        [4] = { onService = "EB5", outService = "EB5Paycheck" },
        [5] = { onService = "EB4", outService = "EB4Paycheck" },
        [6] = { onService = "EB3", outService = "EB3Paycheck" },
        [7] = { onService = "EB2", outService = "EB2Paycheck" },
        [8] = { onService = "EB1", outService = "EB1Paycheck" },
    },
    ["farc"] = {
        [1] = { onService = "FARC7", outService = "FARC7" },
        [2] = { onService = "FARC6", outService = "FARC6" },
        [3] = { onService = "FARC5", outService = "FARC5" },
        [4] = { onService = "FARC4", outService = "FARC4" },
        [5] = { onService = "FARC3", outService = "FARC3" },
        [6] = { onService = "FARC2", outService = "FARC2" },
        [7] = { onService = "FARC1", outService = "FARC1" },
    },
    ["burguershot"] = {
        [1] = { onService = "BurguerShot3", outService = "BurguerShot3Paycheck" },
        [2] = { onService = "BurguerShot2", outService = "BurguerShot2Paycheck" },
        [3] = { onService = "BurguerShot1", outService = "BurguerShot1Paycheck" },
    },
    ["amarelos"] = {
        [1] = { onService = "Lider-Amarelos", outService = "Lider-Amarelos" },
        [2] = { onService = "Amarelos2", outService = "Amarelos2" },
        [3] = { onService = "Amarelos1", outService = "Amarelos1" },
    },
    ["verdes"] = {
        [1] = { onService = "Lider-Verdes", outService = "Lider-Verdes" },
        [2] = { onService = "Verdes2", outService = "Verdes2" },
        [3] = { onService = "Verdes1", outService = "Verdes1" },
    },
    ["roxos"] = {
        [1] = { onService = "Lider-Roxos", outService = "Lider-Roxos" },
        [2] = { onService = "Roxos2", outService = "Roxos2" },
        [3] = { onService = "Roxos1", outService = "Roxos1" },
    },
    ["anonymous"] = {
        [1] = { onService = "Lider-Anonymous", outService = "Lider-Anonymous" },
        [2] = { onService = "Anonymous2", outService = "Anonymous2" },
        [3] = { onService = "Anonymous1", outService = "Anonymous1" },
    },
    ["taxi"] = {
        [1] = { onService = "Lider-Taxista", outService = "Lider-TaxistaPaycheck" },
        [2] = { onService = "Taxista", outService = "TaxistaPaycheck" },
    },
    ["cartel"] = {
        [1] = { onService = "Lider-Cartel", outService = "Lider-Cartel" },
        [2] = { onService = "Cartel2", outService = "Cartel2" },
        [3] = { onService = "Cartel1", outService = "Cartel1" },
    },
    ["bratva"] = {
        [1] = { onService = "Lider-Bratva", outService = "Lider-Bratva" },
        [2] = { onService = "Bratva2", outService = "Bratva2" },
        [3] = { onService = "Bratva1", outService = "Bratva1" },
    },
    ["soa"] = {
        [1] = { onService = "Lider-Soa", outService = "Lider-Soa" },
        [2] = { onService = "SOA2", outService = "SOA2" },
        [3] = { onService = "SOA1", outService = "SOA1" },
    },
    ["thelost"] = {
        [1] = { onService = "Lider-TheLost", outService = "Lider-TheLost" },
        [2] = { onService = "TheLost2", outService = "TheLost2" },
        [3] = { onService = "TheLost1", outService = "TheLost1" },
    },
    ["vanilla"] = {
        [1] = { onService = "Lider-Vanilla", outService = "Lider-Vanilla" },
        [2] = { onService = "Vanilla2", outService = "Vanilla2" },
        [3] = { onService = "Vanilla1", outService = "Vanilla1" },
    },
    ["casino"] = {
        [1] = { onService = "Lider-Casino", outService = "Lider-Casino" },
        [2] = { onService = "Casino2", outService = "Casino2" },
        [3] = { onService = "Casino1", outService = "Casino1" },
    },
    ["driftking"] = {
        [1] = { onService = "Lider-Driftking", outService = "Lider-Driftking" },
        [2] = { onService = "Driftking2", outService = "Driftking2" },
        [3] = { onService = "Driftking1", outService = "Driftking1" },
    },
}

config.admin_permission = "admin.permissao"


vRP._prepare("nation_gm/getAllDataTables","SELECT * FROM vrp_user_data WHERE dkey = 'vRP:datatable'")
Citizen.CreateThread(function()
    for org in pairs(config.groups) do
        groups[org] = {}
    end
    local dataTables = vRP.query("nation_gm/getAllDataTables")
    for i, t in ipairs(dataTables) do
        local dataTable = json.decode(t.dvalue or {})
        if dataTable and dataTable.groups then
            local userOrg, userGroup = getUserInfo(dataTable.groups)
            if userOrg and userGroup then
                table.insert(groups[userOrg], { user_id = t.user_id,  group = userGroup or "none" })
            end
        end
    end
end)




function getUserInfo(userGroups)
    for org, t in pairs(config.groups) do 
        for i, v in ipairs(t) do
            if hasUserGroup(userGroups, v.onService) then
                return org, v.onService
            elseif hasUserGroup(userGroups, v.outService) then
                return org, v.outService
            end
        end
    end
end



function getServiceGroup(org,outService)
    if config.groups[org] then
        for i, t in ipairs(config.groups[org]) do
            if outService == t.outService or outService == t.onService then
                return t.onService
            end
        end
    end
    return false
end

function isUserInService(user_id)
    if not user_id or not vRP.getUserSource(user_id) then
        return false
    end
    local userOrg = getUserOrg(user_id)
    local group = vRP.getUserGroupByType(user_id,"job")
    if userOrg and group then
        for i, t in ipairs(config.groups[userOrg]) do
            if group == t.onService then
                return true
            end
        end
    end
    return false
end




function getUserData(user_id, group)
    local identity = vRP.getUserIdentity(user_id)
    if identity then
        local name = identity.name.." "..identity.firstname
        local phone = identity.phone
        local org = getOrgByGroup(group)
        local group = getServiceGroup(org,group) or group
        local groupIndex = getGroupIndex(group)
        group = vRP.getGroupTitle(group) or group
        local inService = isUserInService(user_id)
        local rg = identity.registration 
        local age = identity.age
        return { user_id = user_id, name = name, phone = phone, group = group or "none", service = inService, age = age, rg = rg, groupIndex = groupIndex }
    end
end

function func.getUserInfo(user_id)
    local group = getUserGroup(user_id)
    local info = getUserData(user_id, group)
    return info
end


function getUserOrg(user_id)
    local userGroup = getUserGroup(user_id)
    for org, t in pairs(config.groups) do
        for i, v in ipairs(t) do
            if v.onService == userGroup or v.outService == userGroup then
                return org, user_id
            end
        end
    end
    return false
end

function func.getUserOrg(user_id)
    local source = source
    local user_id = user_id or vRP.getUserId(source)
    local userGroup = getUserGroup(user_id)
    for org in pairs(config.groups) do
        if config.groups[org][1].onService == userGroup or config.groups[org][1].outService == userGroup then
            return org, user_id
        end
    end
    return false
end


function func.getOrgInfo(orgName)
    local org = {}
    if groups[orgName] then
        for i,t in ipairs(groups[orgName]) do
            local user_id = t.user_id
            local group = t.group
            local info = getUserData(user_id, group)
            table.insert(org, info)
        end
        table.sort(org, function(a, b) return a.user_id < b.user_id end)
    end
    return org
end

function getUserGroup(user_id)
    local src = vRP.getUserSource(user_id)
    if src then
        local dataTable = vRP.getUserDataTable(user_id)
        local org, group = getUserInfo(dataTable.groups)
        if not group then
            group = vRP.getUserGroupByType(user_id,"job")
        end
        return group
    else
        local dataTable = json.decode(vRP.getUData(user_id,"vRP:datatable") or {})
        if dataTable and dataTable.groups then
            local org, group = getUserInfo(dataTable.groups)
            if not group then
                for k,v in pairs(dataTable.groups) do
                    local kgroup = vRP_groups[k]
                    if kgroup then
                        if kgroup._config and kgroup._config.gtype and kgroup._config.gtype == "job" then
                            group = k
                            break
                        end
                    end
                end
            end
            return group
        end
    end
    return false
end

function getOrgByGroup(group)
    for org, t in pairs(config.groups) do
        for i, v in ipairs(t) do
            if group == v.onService or group == v.outService then
                return org
            end
        end
    end
    return false
end


function hasUserGroup(userGroups,group)
    if userGroups[group] then return true end
    return false
end


function getUserTempOrg(user_id)
    for org, t in pairs(groups) do
        for i,v in ipairs(t) do
            if v.user_id == user_id then
                return org, i
            end
        end
    end
end


function getGroupIndex(group)
    for org, t in pairs(config.groups) do
        for i,v in ipairs(t) do
            if v.onService == group or v.outService == group then
                return i
            end
        end
    end
end



function func.getSelectedGroup(type, group, org)
    local source = source or 0
    local user_id = vRP.getUserId(source)
    if not group then
        group = getUserGroup(user_id)
        org = getOrgByGroup(group)
        group = getServiceGroup(org,group)
    end
    if groups[org] then
        local promoteGroup = group
        local groupIndex = #config.groups[org]
        for i, t in ipairs(config.groups[org]) do
            if group == t.onService then
                groupIndex = i 
                break
            end
        end
        if type == "promote" then
            if groupIndex == 1 then
                return false
            end
            groupIndex = groupIndex-1
        elseif type == "demote" then
            if groupIndex == #config.groups[org] then
                return false
            end
            groupIndex = groupIndex+1
        end
        promoteGroup = config.groups[org][groupIndex].onService
        return promoteGroup, vRP.getGroupTitle(promoteGroup)
    end
    return false
end





local manageTypes = {
    recruit = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            if userOrg and userOrg == org then
                return {success = false, title = "Cidadão já está na organização", text = ""}
            end
            local i = #config.groups[org]
            local group = config.groups[org][i].onService
          
            local src = vRP.getUserSource(user_id)
            if src then
                if not vRP.hasGroup(user_id,group) then
                    Citizen.CreateThread(function()
                        if vRP.request(src,"Você aceita fazer parte da organização <b>"..string.upper(org).."</b> ?", 30) then
                            vRP.addUserGroup(user_id, group)
                            TriggerClientEvent("Notify", source, "importante", "O passaporte <b>"..user_id.."</b> aceitou a solicitação para entrar na organização.")
                            TriggerClientEvent("Notify", src, "importante", "Você entrou para a organização <b>"..string.upper(org).."</b>.")
                            fclient.updateGM(source)
                        else
                            TriggerClientEvent("Notify", source, "aviso", "O passaporte <b>"..user_id.."</b> recusou a solicitação para entrar na organização.")
                        end
                    end)
                    return {success = true, title = "Solicitação enviada com sucesso!", text = ""}
                end
            else
                return {success = false, title = "Cidadão fora da cidade!", text = ""}
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    promove = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            local i = getGroupIndex(getUserGroup(user_id))
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local promoteGroup, groupTitle = func.getSelectedGroup("promote",userGroup, userOrg)
                if promoteGroup then
                    local title = "Sucesso!"
                    local text = name.." #"..user_id.." promovido para o cargo de "..string.upper(groupTitle or promoteGroup)
                    local src = vRP.getUserSource(user_id)
                    if src then
                        vRP.addUserGroup(user_id, promoteGroup)
                        TriggerClientEvent("Notify", src, "importante", "Você foi promovido para <b>"..string.upper(groupTitle or promoteGroup).."</b>.")
                        fclient.updateGM(source)
                        return {success = true, title = title, text = text}
                    else
                        local dataTable = json.decode(vRP.getUData(user_id, "vRP:datatable") or {})
                        if dataTable and dataTable.groups then
                            local group = getUserGroup(user_id)
                            if group and dataTable.groups[group] then
                                dataTable.groups[group] = nil
                                dataTable.groups[promoteGroup] = true
                                vRP._setUData(user_id, "vRP:datatable", json.encode(dataTable))
                                removePlayerFromOrg(user_id, org)
                                addPlayerToOrg(user_id, org)
                                fclient.updateGM(source)
                                return {success = true, title = title, text = text}
                            end
                        end
                    end
                else
                    local title = "Erro!"
                    local text = "Cargo máximo já atingido!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    demote = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            local group = getUserGroup(user_id)
            local i = getGroupIndex(group)
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local demoteGroup, groupTitle = func.getSelectedGroup("demote",userGroup, userOrg)
                if demoteGroup then
                    local title = "Sucesso!"
                    local text = name.." #"..user_id.." rebaixado para o cargo de "..string.upper(groupTitle or demoteGroup)
                    local src = vRP.getUserSource(user_id)
                    if src then
                        vRP.addUserGroup(user_id, demoteGroup)
                        TriggerClientEvent("Notify", src, "importante", "Você foi rebaixado para <b>"..string.upper(groupTitle or demoteGroup).."</b>.")
                        if user_id == vRP.getUserId(source) then
                            fclient.closeNui(source)
                        else
                            fclient.updateGM(source)
                        end

                        return {success = true, title = title, text = text, close = user_id == vRP.getUserId(source)}
                    else
                        local dataTable = json.decode(vRP.getUData(user_id, "vRP:datatable") or {})
                        if dataTable and dataTable.groups then
                            if group and dataTable.groups[group] then
                                dataTable.groups[group] = nil
                                dataTable.groups[demoteGroup] = true
                                vRP._setUData(user_id, "vRP:datatable", json.encode(dataTable))
                                removePlayerFromOrg(user_id, org)
                                addPlayerToOrg(user_id, org)
                                fclient.updateGM(source)
                                return {success = true, title = title, text = text}
                            end
                        end
                    end
                else
                    local title = "Erro!"
                    local text = "Cargo mínimo já identificado!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    dismiss = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            if not userOrg or userOrg ~= org then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            elseif user_id == vRP.getUserId(source) then
                return {success = false, title = "Você não pode se demitir!", text = ""}
            end
            local group = getUserGroup(user_id)
            local src = vRP.getUserSource(user_id)
            if src then
                if group then
                    vRP.removeUserGroup(user_id, group)
                end
                TriggerClientEvent("Notify", source, "importante", "O passaporte <b>"..user_id.."</b> não faz mais parte da organização.")
                TriggerClientEvent("Notify", src, "importante", "Você foi demitido da organização <b>"..string.upper(org).."</b>.")
                fclient.updateGM(source)
                return {success = true, title = "Sucesso!", text = "Passaporte "..user_id.." demitido com sucesso!"}
            else
                local dataTable = json.decode(vRP.getUData(user_id, "vRP:datatable") or {})
                if dataTable and dataTable.groups then
                    if group and dataTable.groups[group] then
                        dataTable.groups[group] = nil
                        vRP._setUData(user_id, "vRP:datatable", json.encode(dataTable))
                        removePlayerFromOrg(user_id, org)
                        fclient.updateGM(source)
                        return {success = true, title = "Sucesso!", text = "Passaporte #"..user_id.." demitido com sucesso!"}
                    else
                        return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
                    end
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,
}



function func.managePlayer(player_id, type, adminOrg)
    local source = source
    local user_id = vRP.getUserId(source)
    local org = func.getUserOrg(user_id) or adminOrg
    if vRP.hasPermission(user_id,config.admin_permission) or (org and player_id and type) then
        if manageTypes[type] then
            return manageTypes[type](player_id, org or func.getUserOrg(player_id), source)
        end
    end
    return {success = false, title = "Erro!", text = ""}
end





local serverResponses = {
    recruit = function(user_id, org, source)
        local userOrg = getUserTempOrg(user_id)
        if userOrg and userOrg == org then
            return {success = false, title = "Cidadão já está na organização", text = ""}
        elseif not vRP.getUserSource(user_id) then
            return {success = false, title = "Cidadão fora da cidade!", text = ""}
        end
        local identity = vRP.getUserIdentity(user_id)
        if identity then
            local title = "Confirmação de Recrutamento"
            local name = string.upper(identity.name.." "..identity.firstname)
            local text = "Deseja admitir "..name.." #"..user_id.." ?"
            return {success = true, title = title, text = text}
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    promove = function(user_id, org, source)
        if groups[org] then
            local userOrg,i = getUserTempOrg(user_id)
            local i = getGroupIndex(getUserGroup(user_id))
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local promoteGroup, groupTitle = func.getSelectedGroup("promote",userGroup, userOrg)
                if promoteGroup then
                    local title = "Confirmação de Promoção"
                    local text = "Deseja promover "..name.." #"..user_id.." para o cargo de "..string.upper(groupTitle or promoteGroup).." ?"
                    return {success = true, title = title, text = text}
                else
                    local title = "Erro!"
                    local text = "Cargo máximo já atingido!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    demote = function(user_id, org, source)
        if groups[org] then
            local userOrg,i = getUserTempOrg(user_id)
            local i = getGroupIndex(getUserGroup(user_id))
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local demoteGroup, groupTitle = func.getSelectedGroup("demote",userGroup, userOrg)
                if demoteGroup then
                    local title = "Confirmação de Rebaixamento"
                    local text = "Deseja rebaixar "..name.." #"..user_id.." para o cargo de "..string.upper(groupTitle or demoteGroup).." ?"
                    return {success = true, title = title, text = text}
                else
                    local title = "Erro!"
                    local text = "Cargo mínimo já identificado!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    dismiss = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            if not userOrg or userOrg ~= org  then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            elseif user_id == vRP.getUserId(source) then
                return {success = false, title = "Você não pode se demitir!", text = ""}
            end
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local title = "Confirmação de Demissão"
                local name = string.upper(identity.name.." "..identity.firstname)
                local text = "Deseja demitir "..name.." #"..user_id.." ?"
                return {success = true, title = title, text = text}
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,
}

function func.getServerResponse(player_id, type, adminOrg)
    local source = source
    local user_id = vRP.getUserId(source)
    local org = func.getUserOrg(user_id) or adminOrg
    if vRP.hasPermission(user_id,config.admin_permission) or (org and player_id and type) then
        if serverResponses[type] then
            return serverResponses[type](player_id, org or func.getUserOrg(player_id), source)
        end
    end
    return {success = false, title = "Erro!", text = ""}
end



function addPlayerToOrg(user_id, org)
    local userGroup = getUserGroup(user_id)
    local org = org or getOrgByGroup(userGroup)
    if userGroup and org and groups[org] then
        userGroup = getServiceGroup(org,userGroup) or userGroup
        table.insert(groups[org], { user_id = user_id, group = userGroup or "none" })
        -- print("ID "..user_id.." colocado na org "..org)
        return true
    end
    return false
end

function removePlayerFromOrg(user_id, org)
    local userGroup = getUserGroup(user_id)
    local org = org or getOrgByGroup(userGroup)
    local userTempOrg, i = getUserTempOrg(user_id)
    if groups[org] and userTempOrg and org == userTempOrg and i and groups[org][i] then
        table.remove(groups[org], i)
        -- print("ID "..user_id.." removido dar org "..org)
        return true
    end
    return false
end



function func.getAdminOrg()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,config.admin_permission) then
        local org = vRP.prompt(source,"Digite a organização: ","")
        if org and groups[org] then
            return org,user_id
        else
            TriggerClientEvent("Notify",source,"negado","Organização inexistente.")
        end
    end
    return false
end


 AddEventHandler('vRP:playerJoinGroup',function(user_id,group,gtype)
    if user_id and group and gtype and gtype == "job" then
        addPlayerToOrg(user_id)
    end
 end)

 AddEventHandler('vRP:playerLeaveGroup',function(user_id,group,gtype)
    if user_id and group and gtype and gtype == "job" then
        removePlayerFromOrg(user_id)
    end
 end)


