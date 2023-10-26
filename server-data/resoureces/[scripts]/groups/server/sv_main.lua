-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy  = module("vrp","lib/Proxy")
local config = module(GetCurrentResourceName(), "config")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
psRP = {}
Tunnel.bindInterface("groups",psRP)
vCLIENT = Tunnel.getInterface("groups")
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUERYES
-----------------------------------------------------------------------------------------------------------------------------------------
DB.prepare("groups/get_all_datatables","SELECT * FROM vrp_user_data WHERE dkey = 'vRP:datatable'")
DB.prepare("groups/get_user_datatables","SELECT * FROM vrp_user_data WHERE dkey = 'vRP:datatable' AND user_id = @user_id")
DB.prepare("groups/get_blacklist","SELECT * FROM groups_blacklist WHERE user_id = @user_id")
DB.prepare("groups/add_blacklist","INSERT INTO groups_blacklist (user_id, time) VALUES (@user_id, @time)")
DB.prepare("groups/edit_blacklist","UPDATE groups_blacklist SET time = @time WHERE user_id = @user_id")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local groupslist = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- getConfig
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.getConfig()
	local source = source
	local user_id = getUserId(source)
	if user_id then

		local check        = false
		local permissionid = 0
		local organization = nil
        local data         = {}

		for k, v in pairs(groupslist) do
			for _, ndata in pairs(v) do
				if user_id == ndata.user_id then
					check        = true
					permissionid = ndata.id
					organization = k
				end
			end
		end

        if check then
            local groups       = config.groups
            local bank         = false
            local manager      = false
            local withdraw     = false
            local members      = {}
            local ngroups      = {}
            local check        = false
            local bankmoney    = 0
            
            if groups[organization] and groups[organization].permissions[permissionid] then
                bank     = groups[organization].bank
                manager  = groups[organization].permissions[permissionid].manager
                withdraw = groups[organization].permissions[permissionid].withdraw
    
                for k,v in pairs(groupslist[organization]) do
                        check = true
                        local id        = getUserSource(tonumber(v.user_id))
                        local name      = getUserFullName(tonumber(v.user_id))
                        local image     = getUserImage(tonumber(v.user_id))
                        local identity  = getUserIdentity(tonumber(v.user_id))
                        local groupname = getGroupTitle(v.group)
        
                        local member = {
                            permissionid = v.id,
                            user_id      = tonumber(v.user_id),
                            name         = name,
                            image        = image,
                            phone        = identity.phone,
                            group        = v.group,
                            groupname    = groupname,
                            online       = false,
                            myuser       = false
                        }
    
                        if id then
                            member.online = true
                        end
    
                        if tonumber(v.user_id) == user_id then
                            member.myuser = true
                        end
        
                        table.insert(members, member)
                end
    
                for k, v in pairs(groups[organization].permissions) do
                    if k > permissionid then
                        if v.inservice ~= nil then
                            local group = {
                                group = v.inservice,
                                name  = getGroupTitle(v.inservice)
                            }
        
                            table.insert(ngroups, group)
                        end
                    end
                end
    
                if bank then
                    local money = getServerData("groups:"..organization..":bank") or 0
                    bankmoney   = tonumber(money) or 0
                end
    
            end
    
            data = {
                organization = organization,
                permissionid = permissionid,
                bank         = bank,
                manager      = manager,
                withdraw     = withdraw,
                members      = members,
                bankmoney    = bankmoney,
                groups       = ngroups
            }
        end

		return check,data
	end
	return false,nil,nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- searchUser
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.searchUser(data)
    local source  = source
    local user_id = getUserId(source)
    local ndata    = {}

    if user_id then

        if data.user_id ~= nil then
            local nuser_id = tonumber(data.user_id)
			local identity = getUserIdentity(nuser_id)

			if identity ~= nil then
				ndata.user_id  = nuser_id
				ndata.name     = getUserFullName(nuser_id)
				ndata.image    = getUserImage(nuser_id)
				ndata.identity = identity
				ndata.phone    = identity.phone
			end
        end
    end

    return ndata
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- addUserGroup
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.addUserGroup(data)
    local source  = source
    local user_id = getUserId(source)

    if user_id then

		local check        = false
		local nuser_id     = tonumber(data.user_id)
		local group        = data.group
		local organization = data.organization
		local groups       = config.groups

		for k, v in pairs(groupslist) do
			for _, data in pairs(v) do
				if nuser_id == v.user_id then
					check = true
				end
			end
		end

		if check then
			sendnotify(source, "negado", "Essa pessoa já está em uma organização", 10000)
			return false
		end
		
		if groups[organization] then
			if #groupslist[organization] >= groups[organization].members then
				sendnotify(source, "negado", "Essa organização atingiu o limite de membros", 10000)
				return false
			end

			local blacklist = groups[organization].blacklist

			if blacklist.active then
				local time = os.time() + tonumber(blacklist.time * 24 * 60 * 60)
				local getblacklist = DB.query("groups/get_blacklist", { user_id = nuser_id })

				if #getblacklist > 0 then
					if os.time() < tonumber(getblacklist[1].time) then
						sendnotify(source, "negado", "Essa pessoa se encontra na blacklist", 10000)
						return false
					end
				end
			end

			local nsource = getUserSource(nuser_id)

			if nsource then				
				local ok = requestAcceptorNot(nsource,"Você aceita fazer parte da organização <b>"..string.upper(organization).."</b> ?",60)

				if ok then
					addUserGroup(nuser_id, group)
					sendnotify(source, "sucesso", "O passaporte <b>#"..nuser_id.."</b> agora faz parte da sua organização", 10000)
					sendnotify(nsource, "sucesso", "Você entrou para a organização <b>"..string.upper(organization).."</b>", 10000)

					local name = getUserFullName(user_id)
					local name2 = getUserFullName(nuser_id)

					local datawebhook = {
						{ 
							title = "REGISTRO DE CONTRATAÇÃO:",
							thumbnail = {
								url = config.webhookimage
							}, 
							fields = {
								{ 
									name = "**ORGANIZAÇÃO:**",
									value = string.upper(organization)
								},
								{ 
									name = "**IDENTIFICAÇÃO DO PLAYER:**",
									value = "**"..name.."** [**"..user_id.."**]"
								},
								{ 
									name = "**IDENTIFICAÇÃO DO CONTRATADO:**",
									value = "**"..name2.."** [**"..nuser_id.."**]"
								},
								{ 
									name = "**GRUPO:**",
									value = group
								},
			
							},
							footer = { 
								text = "PEQUISHOP "..os.date("%d/%m/%Y | %H:%M:%S"), 
								icon_url = config.webhookimage
							},
							color = 15906321
						}
					}
			
					sendwebhook(config.webhooklink, datawebhook)

					return true
				else
					sendnotify(source, "aviso", "O passaporte <b>#"..nuser_id.."</b> recusou entrar na organização", 10000)
					return false
				end				
			else
				sendnotify(source, "negado", "Cidadão não se encontra na cidade no momento", 10000)
				return false
			end
		end
    end

    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- remUserGroup
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.remUserGroup(data)
    local source  = source
    local user_id = getUserId(source)

    if user_id then

		local check        = false
		local nuser_id     = tonumber(data.user_id)
		local organization = data.organization
		local groups       = config.groups
		local group        = nil

		for k, v in pairs(groupslist) do
			for _, data in pairs(v) do
				if nuser_id == data.user_id then
					check = true
					group = data.group
				end
			end
		end

		if not check and group == nil then
			sendnotify(source, "negado", "Essa pessoa não está em uma organização", 10000)
			return false
		end
		
		if groups[organization] then

			local blacklist = groups[organization].blacklist

			if blacklist.active then
				local time = os.time() + tonumber(blacklist.time * 24 * 60 * 60)
				local getblacklist = DB.query("groups/get_blacklist", { user_id = nuser_id })

				if #getblacklist > 0 then
					DB.execute("groups/edit_blacklist", { user_id = nuser_id, time = time })
				else
					DB.execute("groups/add_blacklist", { user_id = nuser_id, time = time })
				end
				
				local name = getUserFullName(nuser_id)

				local datawebhook = {
					{ 
						title = "REGISTRO DE BLACKLIST:",
						thumbnail = {
							url = config.webhookimage
						}, 
						fields = {
							{ 
								name = "**ORGANIZAÇÃO:**",
								value = string.upper(organization)
							},
							{ 
								name = "**IDENTIFICAÇÃO DO PLAYER:**",
								value = "**"..name.."** [**"..nuser_id.."**]"
							},
			
						},
						footer = { 
							text = "PEQUISHOP "..os.date("%d/%m/%Y | %H:%M:%S"), 
							icon_url = config.webhookimage
						},
						color = 15906321
					}
				}
			
				sendwebhook(config.webhooklink, datawebhook)
			end

			local nsource = getUserSource(nuser_id)

			if nsource then
				remUserGroup(nuser_id, group)
				sendnotify(source, "sucesso", "O passaporte <b>#"..nuser_id.."</b> foi demitido com sucesso", 10000)
				sendnotify(nsource, "sucesso", "Você foi demitido da organização <b>"..string.upper(organization).."</b>", 10000)

				local name = getUserFullName(user_id)
				local name2 = getUserFullName(nuser_id)

				local datawebhook = {
					{ 
						title = "REGISTRO DE DEMISSÃO:",
						thumbnail = {
							url = config.webhookimage
						}, 
						fields = {
							{ 
								name = "**ORGANIZAÇÃO:**",
								value = string.upper(organization)
							},
							{ 
								name = "**IDENTIFICAÇÃO DO PLAYER:**",
								value = "**"..name.."** [**"..user_id.."**]"
							},
							{ 
								name = "**IDENTIFICAÇÃO DO DEMITIDO:**",
								value = "**"..name2.."** [**"..nuser_id.."**]"
							},
							{ 
								name = "**GRUPO:**",
								value = group
							},
			
						},
						footer = { 
							text = "PEQUISHOP "..os.date("%d/%m/%Y | %H:%M:%S"), 
							icon_url = config.webhookimage
						},
						color = 15906321
					}
				}
			
				sendwebhook(config.webhooklink, datawebhook)

				return true
			else
                local dataTable = json.decode(vRP.getUData(nuser_id, "vRP:datatable") or {})
                if dataTable and dataTable.groups then
                    if group and dataTable.groups[group] then
                        dataTable.groups[group] = nil
                        setUserData(nuser_id, "vRP:datatable", json.encode(dataTable))
                        psRP.removePlayerToGroupList(nuser_id, group)
						sendnotify(source, "sucesso", "O passaporte <b>#"..nuser_id.."</b> foi demitido com sucesso", 10000)

						local name = getUserFullName(user_id)
						local name2 = getUserFullName(nuser_id)
		
						local datawebhook = {
							{ 
								title = "REGISTRO DE DEMISSÃO:",
								thumbnail = {
									url = config.webhookimage
								}, 
								fields = {
									{ 
										name = "**ORGANIZAÇÃO:**",
										value = string.upper(organization)
									},
									{ 
										name = "**IDENTIFICAÇÃO DO PLAYER:**",
										value = "**"..name.."** [**"..user_id.."**]"
									},
									{ 
										name = "**IDENTIFICAÇÃO DO DEMITIDO:**",
										value = "**"..name2.."** [**"..nuser_id.."**]"
									},
									{ 
										name = "**GRUPO:**",
										value = group
									},
					
								},
								footer = { 
									text = "PEQUISHOP "..os.date("%d/%m/%Y | %H:%M:%S"), 
									icon_url = config.webhookimage
								},
								color = 15906321
							}
						}
					
						sendwebhook(config.webhooklink, datawebhook)
						return true
                    else
						sendnotify(source, "negado", "Essa pessoa não faz parte da organização", 10000)
						return false
                    end
                end
				return false
			end
		end
    end

    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- editUserGroup
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.editUserGroup(data)
    local source  = source
    local user_id = getUserId(source)

    if user_id then

		local check        = false
		local nuser_id     = tonumber(data.user_id)
		local organization = data.organization
		local group        = data.group
		local groupname    = getGroupTitle(group)
		local groups       = config.groups
		local ngroup       = nil
		local ngroup2       = nil

		for k, v in pairs(groupslist) do
			for _, data in pairs(v) do
				if nuser_id == data.user_id then
					check  = true
					ngroup = data.group
				end

				if user_id == data.user_id then
					ngroup2 = data.group
				end
			end
		end

		if not check or ngroup == nil then
			sendnotify(source, "negado", "Essa pessoa não está em uma organização", 10000)
			return false
		end

		if ngroup2 == nil then
			sendnotify(source, "negado", "Você não está em uma organização", 10000)
			return false
		end
		
		if groups[organization] then

            local permissionid1 = 1
            local permissionid2 = 0

            for k, v in pairs(groups[organization].permissions) do
                if v.inservice == ngroup2 then
                    permissionid1 = k
                end
                if v.offservice == ngroup2 then
                    permissionid1 = k
                end

                if v.inservice == ngroup then
                    permissionid2 = k
                end
                if v.offservice == ngroup then
                    permissionid2 = k
                end
            end

            if permissionid1 > permissionid2 then
                sendnotify(source, "negado", "Você não pode editar um cargo acima do seu", 10000)
                return false
            end

			local nsource = getUserSource(nuser_id)

			if nsource then
				addUserGroup(nuser_id, group)
				sendnotify(source, "sucesso", "O passaporte <b>#"..nuser_id.."</b> agora é "..string.upper(groupname).."", 10000)
				sendnotify(nsource, "sucesso", "Você agora é "..string.upper(groupname).." na organização <b>"..string.upper(organization).."</b>", 10000)

				local name = getUserFullName(user_id)
				local name2 = getUserFullName(nuser_id)

				local datawebhook = {
					{ 
						title = "REGISTRO DE EDIÇÃO:",
						thumbnail = {
							url = config.webhookimage
						}, 
						fields = {
							{ 
								name = "**ORGANIZAÇÃO:**",
								value = string.upper(organization)
							},
							{ 
								name = "**IDENTIFICAÇÃO DO PLAYER:**",
								value = "**"..name.."** [**"..user_id.."**]"
							},
							{ 
								name = "**IDENTIFICAÇÃO DO EDITADO:**",
								value = "**"..name2.."** [**"..nuser_id.."**]"
							},
							{ 
								name = "**GRUPO ANTIGO:**",
								value = ngroup
							},
							{ 
								name = "**GRUPO NOVO:**",
								value = group
							},
			
						},
						footer = { 
							text = "PEQUISHOP "..os.date("%d/%m/%Y | %H:%M:%S"), 
							icon_url = config.webhookimage
						},
						color = 15906321
					}
				}
			
				sendwebhook(config.webhooklink, datawebhook)
				return true
			else
                local dataTable = json.decode(vRP.getUData(nuser_id, "vRP:datatable") or {})
                if dataTable and dataTable.groups then
                    if group and dataTable.groups[ngroup] then
                        dataTable.groups[ngroup] = nil
                        dataTable.groups[group] = true
                        setUserData(nuser_id, "vRP:datatable", json.encode(dataTable))
                        psRP.removePlayerToGroupList(nuser_id, ngroup)
                        psRP.addPlayerToGroupList(nuser_id, group)
						sendnotify(source, "sucesso", "O passaporte <b>#"..nuser_id.."</b> agora é "..string.upper(groupname).."", 10000)

						local name = getUserFullName(user_id)
						local name2 = getUserFullName(nuser_id)
		
						local datawebhook = {
							{ 
								title = "REGISTRO DE EDIÇÃO:",
								thumbnail = {
									url = config.webhookimage
								}, 
								fields = {
									{ 
										name = "**ORGANIZAÇÃO:**",
										value = string.upper(organization)
									},
									{ 
										name = "**IDENTIFICAÇÃO DO PLAYER:**",
										value = "**"..name.."** [**"..user_id.."**]"
									},
									{ 
										name = "**IDENTIFICAÇÃO DO EDITADO:**",
										value = "**"..name2.."** [**"..nuser_id.."**]"
									},
									{ 
										name = "**GRUPO ANTIGO:**",
										value = ngroup
									},
									{ 
										name = "**GRUPO NOVO:**",
										value = group
									},
					
								},
								footer = { 
									text = "PEQUISHOP "..os.date("%d/%m/%Y | %H:%M:%S"), 
									icon_url = config.webhookimage
								},
								color = 15906321
							}
						}
					
						sendwebhook(config.webhooklink, datawebhook)
						return true
                    else
						sendnotify(source, "negado", "Essa pessoa não faz parte da organização", 10000)
						return false
                    end
                end
				return false
			end
		end
    end

    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getOrgChestLogs
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.getOrgChestLogs(data)
    local source  = source
    local user_id = getUserId(source)
	local logs    = {}

    if user_id then
		local organization = data.organization

		local nlogs = getServerData("groups:"..organization..":chestlogs") or ""
		nlogs = json.decode(nlogs)

		if nlogs ~= nil then
			logs = nlogs
		end
    end

    return logs
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- getOrgBankLogs
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.getOrgBankLogs(data)
    local source  = source
    local user_id = getUserId(source)
	local logs    = {}

    if user_id then
		local organization = data.organization

		local nlogs = getServerData("groups:"..organization..":banklogs") or ""
		nlogs = json.decode(nlogs)

		if nlogs ~= nil then
			logs = nlogs
		end
    end

    return logs
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- addOrgBank
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.addOrgBank(data)
    local source  = source
    local user_id = getUserId(source)

    if user_id then
		local organization = data.organization
		local amount       = numberToInt(data.amount)
		local bank         = getBankMoney(user_id)
		local currency     = config.currency
		local text         = config.textdeposit

		if amount > 0 then
			if bank > amount then
		
				local money = numberToInt(getServerData("groups:"..organization..":bank")) or 0
				local total = money + amount

				setServerData("groups:"..organization..":bank", total)
				remBankMoney(user_id, amount)

				local logs  = {}
				local nlogs = getServerData("groups:"..organization..":banklogs") or ""
				nlogs = json.decode(nlogs)

				if nlogs ~= nil then
					for k, v in pairs(nlogs) do
						table.insert(logs, v)
					end
				end

				local data = {
					type  = "up",
					title = text.." #"..user_id.." - "..getUserFullName(user_id),
					text  = currency.." "..amount
				}

				table.insert(logs, data)

				logs = json.encode(logs)

				setServerData("groups:"..organization..":banklogs", logs)
				sendnotify(source, "sucesso", "Depósito feito com sucesso", 10000)
				return true
			else
				sendnotify(source, "negado", "Você não tem dinheiro suficiente no banco", 10000)
				return false
			end
		else
			sendnotify(source, "negado", "Você não pode depositar um valor abaixo de 0", 10000)
			return false
		end
    end

    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- remOrgBank
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.remOrgBank(data)
    local source  = source
    local user_id = getUserId(source)

    if user_id then
		local organization = data.organization
		local amount       = numberToInt(data.amount)
		local bank         = numberToInt(getServerData("groups:"..organization..":bank")) or 0
		local currency     = config.currency
		local text         = config.textwithdrawal

		if amount > 0 then
			if bank > amount then
				local total = bank - amount

				setServerData("groups:"..organization..":bank", total)
				addBankMoney(user_id, amount)

				local logs  = {}
				local nlogs = getServerData("groups:"..organization..":banklogs") or ""
				nlogs = json.decode(nlogs)

				if nlogs ~= nil then
					for k, v in pairs(nlogs) do
						table.insert(logs, v)
					end
				end

				local data = {
					type  = "down",
					title = text.." #"..user_id.." - "..getUserFullName(user_id),
					text  = currency.." "..amount
				}

				table.insert(logs, data)

				logs = json.encode(logs)

				setServerData("groups:"..organization..":banklogs", logs)
				sendnotify(source, "sucesso", "Saque feito com sucesso", 10000)
				return true
			else
				sendnotify(source, "negado", "A organização não tem dinheiro suficiente no banco", 10000)
				return false
			end
		else
			sendnotify(source, "negado", "Você não pode sacar um valor abaixo de 0", 10000)
			return false
		end
    end

    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- groups:SetClothe
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("groups:chestlogs",function(user_id, chest, item, amount, typelog)
	local source = source
	if user_id and chest and item and amount and typelog then
		local organization = nil
		local groups       = config.groups
		local ipimages     = config.IPImages

		chest = string.gsub(chest,"chest:","")

		for k, v in pairs(groups) do
			if chest == v.chest then
				organization = k
			end
		end

		if organization ~= nil then
			if typelog == "up" then
				local text  = config.textstore
				local logs  = {}
				local nlogs = getServerData("groups:"..organization..":chestlogs") or ""
				nlogs = json.decode(nlogs)

				if nlogs ~= nil then
					for k, v in pairs(nlogs) do
						table.insert(logs, v)
					end
				end

				local data = {
					type  = "up",
					title = text.." #"..user_id.." - "..getUserFullName(user_id).." | Item: "..getItemName(item),
					text  = "X"..amount,
					image = ipimages..""..item..".png"
				}

				table.insert(logs, data)

				logs = json.encode(logs)

				setServerData("groups:"..organization..":chestlogs", logs)
			end

			if typelog == "down" then
				local text  = config.texttake
				local logs  = {}
				local nlogs = getServerData("groups:"..organization..":chestlogs") or ""
				nlogs = json.decode(nlogs)

				if nlogs ~= nil then
					for k, v in pairs(nlogs) do
						table.insert(logs, v)
					end
				end

				local data = {
					type  = "down",
					title = text.." #"..user_id.." - "..getUserFullName(user_id).." | Item: "..getItemName(item),
					text  = "X"..amount,
					image = ipimages..""..item..".png"
				}

				table.insert(logs, data)

				logs = json.encode(logs)

				setServerData("groups:"..organization..":chestlogs", logs)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- addPlayerToGroupList
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.addPlayerToGroupList(user_id, group)
	if user_id and group then
		local groups = config.groups

		for org, v in pairs(groups) do
			if groupslist[org] == nil then
				groupslist[org] = {}
			end

			for _,ngroup in pairs(v.permissions) do
				if group == ngroup.inservice then
					table.insert(groupslist[org], { user_id = user_id, group = ngroup.inservice or nil, id = _ })
				end

				if group == ngroup.offservice then
					table.insert(groupslist[org], { user_id = user_id, group = ngroup.offservice or nil, id = _ })
				end
			end
		end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- removePlayerToGroupList
-----------------------------------------------------------------------------------------------------------------------------------------
function psRP.removePlayerToGroupList(user_id, group)
	if user_id and group then
		local groups = config.groups
		local norg   = 0
		local id     = 0

		for k, v in pairs(groupslist) do
			for _, data in pairs(v) do
				if user_id == data.user_id then
					id   = _
					norg = k
				end
			end
		end

		if id > 0 then
			if groupslist[norg] ~= nil and groupslist[norg][id] ~= nil then
				local nuser_id = groupslist[norg][id].user_id
				table.remove(groupslist[norg], id)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- blacklist command
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(config.blacklist.command,function(source,args,rawCommand)
	local source = source
	local user_id = getUserId(source)
	if user_id then
		local check = false

		for k, v in pairs(config.blacklist.permissions) do
			if getHasPermission(user_id, v) then
				check = true
			end 
		end

		if check and args[1] ~= nil and args[2] ~= nil then
			if args[1] == "add" and args[3] ~= nil then
				local time = os.time() + tonumber(args[3] * 24 * 60 * 60)
				local getblacklist = DB.query("groups/get_blacklist", { user_id = tonumber(args[2]) })

				if #getblacklist > 0 then
					DB.execute("groups/edit_blacklist", { user_id = tonumber(args[2]), time = time })
				else
					DB.execute("groups/add_blacklist", { user_id = tonumber(args[2]), time = time })
				end

				sendnotify(source, "sucesso", "Blacklist aplicada com sucesso por <b>"..args[3].." dias</b>", 5000)

				local name = getUserFullName(user_id)
				local name2 = getUserFullName(tonumber(args[2]))

				local datawebhook = {
					{ 
						title = "REGISTRO DE NOVA BLACKLIST:",
						thumbnail = {
							url = config.webhookimage
						}, 
						fields = {
							{ 
								name = "**MEMBRO DA EQUIPE:**",
								value = "**"..name.."** [**"..user_id.."**]"
							},
							{ 
								name = "**IDENTIFICAÇÃO DO PLAYER:**",
								value = "**"..name2.."** [**"..tonumber(args[2]).."**]"
							},
							{ 
								name = "**DIAS:**",
								value = args[3]
							},
			
						},
						footer = { 
							text = "PEQUISHOP "..os.date("%d/%m/%Y | %H:%M:%S"), 
							icon_url = config.webhookimage
						},
						color = 15906321
					}
				}
			
				sendwebhook(config.webhooklink, datawebhook)
			end

			if args[1] == "rem" then
				local time = os.time()
				local getblacklist = DB.query("groups/get_blacklist", { user_id = tonumber(args[2]) })

				if #getblacklist > 0 then
					DB.execute("groups/edit_blacklist", { user_id = tonumber(args[2]), time = time })
					sendnotify(source, "sucesso", "Blacklist removida com sucesso", 5000)

					local name = getUserFullName(user_id)
					local name2 = getUserFullName(tonumber(args[2]))
	
					local datawebhook = {
						{ 
							title = "REGISTRO DE REMOÇÃO BLACKLIST:",
							thumbnail = {
								url = config.webhookimage
							}, 
							fields = {
								{ 
									name = "**MEMBRO DA EQUIPE:**",
									value = "**"..name.."** [**"..user_id.."**]"
								},
								{ 
									name = "**IDENTIFICAÇÃO DO PLAYER:**",
									value = "**"..name2.."** [**"..tonumber(args[2]).."**]"
								}
				
							},
							footer = { 
								text = "PEQUISHOP "..os.date("%d/%m/%Y | %H:%M:%S"), 
								icon_url = config.webhookimage
							},
							color = 15906321
						}
					}
				
					sendwebhook(config.webhooklink, datawebhook)
				else
					sendnotify(source, "negado", "Essa pessoa não está na blacklist", 5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- get_all_datatables
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    if GetCurrentResourceName() == "groups" then

		local datatables = DB.query("groups/get_all_datatables")

		for _, data in ipairs(datatables) do
			local datatable = json.decode(data.dvalue or "{}")
        	if datatable and datatable.groups then
				local groups = config.groups

				for org, v in pairs(groups) do
					if groupslist[org] == nil then
						groupslist[org] = {}
					end
					for _,group in pairs(v.permissions) do
						if datatable.groups[group.inservice] then
							table.insert(groupslist[org], { user_id = data.user_id, group = group.inservice or nil, id = _ })
						end

						if datatable.groups[group.offservice] then
							table.insert(groupslist[org], { user_id = data.user_id, group = group.offservice or nil, id = _ })
						end
					end
				end
			end
		end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- vRP:playerJoinGroup
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('vRP:playerJoinGroup',function(user_id,group)
	if user_id and group then
        psRP.addPlayerToGroupList(user_id,group)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- vRP:playerLeaveGroup
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('vRP:playerLeaveGroup',function(user_id,group)
    if user_id and group then
        psRP.removePlayerToGroupList(user_id,group)
    end
end)