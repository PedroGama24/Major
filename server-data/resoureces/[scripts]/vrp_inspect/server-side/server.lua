-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
dRP = {}
Tunnel.bindInterface("vrp_inspect",dRP)
vCLIENT = Tunnel.getInterface("vrp_inspect")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local opened = {}
local cfgWeaponName = "|"
-----------------------------------------------------------------------------------------------------------------------------------------
-- REVISTAR
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand("revistar",function(source,args,rawCommand)

	local itemlist = {"dinheirosujo","algemas","capuz","lockpick","masterpick","maconha","placa","rebite","orgao","etiqueta","pendrive","relogioroubado","pulseiraroubada","anelroubado","colarroubado","brincoroubado","carteiraroubada","carregadorroubado","tabletroubado","sapatosroubado","vibradorroubado","perfumeroubado","maquiagemroubada","WEAPON_FLARE","WEAPON_KNIFE","WEAPON_DAGGER","WEAPON_KNUCKLE","WEAPON_MACHETE","WEAPON_SWITCHBLADE","WEAPON_WRENCH","WEAPON_HAMMER","WEAPON_GOLFCLUB","WEAPON_CROWBAR","WEAPON_HATCHET","WEAPON_FLASHLIGHT","WEAPON_BAT","WEAPON_BOTTLE","WEAPON_BATTLEAXE","WEAPON_POOLCUE","WEAPON_STONE_HATCHET","WEAPON_NIGHTSTICK","WEAPON_COMBATPISTOL","WEAPON_REVOLVER_MK2","WEAPON_PISTOL_MK2","WEAPON_PISTOL50","WEAPON_STUNGUN","WEAPON_CARBINERIFLE_MK2","WEAPON_ASSAULTRIFLE_MK2","WEAPON_COMPACTRIFLE","WEAPON_SM","WEAPON_MICROSMG","WEAPON_PUMPSHOTGUN_MK2","WEAPON_MUSKET",}

	local nplayer = vRPclient.getNearestPlayer(source,2)
        if nplayer then
            local identity = vRP.getUserIdentity(user_id)
            local nuser_id = vRP.getUserId(nplayer)
            if nuser_id then
                local nidentity = vRP.getUserIdentity(nuser_id)
                local weapons = vRPclient.replaceWeapons(nplayer,{})
                for k,v in pairs(weapons) do
                  --  vRP.giveInventoryItem(nuser_id,k,1)
					vRP.giveInventoryItem(nuser_id, "wbody" .. cfgWeaponName .. "" .. k, 1)
                        vRP.giveInventoryItem(nuser_id, "wammo" .. cfgWeaponName .. k, v.ammo)
                    if v.ammo > 0 then
                        vRP.giveInventoryItem(nuser_id,vRP.itemAmmoList(k),v.ammo)
                    end
                end

                local inv = vRP.getInventory(nuser_id)
                for k,v in pairs(itemlist) do
                    local amount = vRP.getInventoryItemAmount(nuser_id,v)
                    if amount > 0 then
                        local item_name,item_weight = vRP.getItemDefinition(v)
                        if item_name then
                            if vRP.tryGetInventoryItem(nuser_id,v,amount,true) then
                                vRP.giveInventoryItem(user_id,v,amount)
                            end
                        end
                    end
                end
            end
        end

	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,5)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)

				local weapons = vRPclient.getWeapons(nplayer)
				for k,v in pairs(weapons) do
					if v.ammo > 0 then
					end
				end

				vRPclient.updateWeapons(nplayer)
				if vRPclient.getHealth(nplayer) > 101 then

				if vRP.hasPermission(user_id, "admin.permissao") then
					vCLIENT.openInspect(source)
					opened[user_id] = parseInt(nuser_id)
					dRP.progress()

					local weapons = vRPclient.getWeapons(nplayer,{})
							for k,v in pairs(weapons) do
								if v.ammo > 0 then
								end
							end 

							vRPclient.updateWeapons(nplayer)
							opened[user_id] = parseInt(nuser_id)
							vCLIENT.openInspect(source)
					else

					local request = vRP.request(nplayer,"Você está sendo revistado, você permite?",60)
					if request then
						if not vCLIENT.openInspect(source) then
							vCLIENT.openInspect(source)
							opened[user_id] = parseInt(nuser_id)
							dRP.progress()

 
							local weapons = vRPclient.getWeapons(nplayer,{})
							for k,v in pairs(weapons) do
								if v.ammo > 0 then
								end
							end 

							vRPclient.updateWeapons(nplayer)
							opened[user_id] = parseInt(nuser_id)
							vCLIENT.openInspect(source)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Pedido de revista recusado.",5000)
					end

				end
				end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SAQUEAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('saquear',function(source,args,rawCommand)
	local itemlist = {"dinheirosujo","algemas","capuz","lockpick","masterpick","maconha","placa","rebite","orgao","etiqueta","pendrive","relogioroubado","pulseiraroubada","anelroubado","colarroubado","brincoroubado","carteiraroubada","carregadorroubado","tabletroubado","sapatosroubado","vibradorroubado","perfumeroubado","maquiagemroubada","WEAPON_FLARE","wbody|WEAPON_KNIFE","WEAPON_DAGGER","WEAPON_KNUCKLE","WEAPON_MACHETE","WEAPON_SWITCHBLADE","WEAPON_WRENCH","WEAPON_HAMMER","WEAPON_GOLFCLUB","WEAPON_CROWBAR","WEAPON_HATCHET","WEAPON_FLASHLIGHT","WEAPON_BAT","WEAPON_BOTTLE","WEAPON_BATTLEAXE","WEAPON_POOLCUE","WEAPON_STONE_HATCHET","WEAPON_NIGHTSTICK","WEAPON_COMBATPISTOL","WEAPON_REVOLVER_MK2","WEAPON_PISTOL_MK2","WEAPON_PISTOL50","WEAPON_STUNGUN","WEAPON_CARBINERIFLE_MK2","WEAPON_ASSAULTRIFLE_MK2","WEAPON_COMPACTRIFLE","WEAPON_SM","WEAPON_MICROSMG","WEAPON_PUMPSHOTGUN_MK2","WEAPON_MUSKET",}

	local nplayer = vRPclient.getNearestPlayer(source,2)
        if nplayer then
            local identity = vRP.getUserIdentity(user_id)
            local nuser_id = vRP.getUserId(nplayer)
            if nuser_id then
                local nidentity = vRP.getUserIdentity(nuser_id)
                local weapons = vRPclient.replaceWeapons(nplayer,{})
                for k,v in pairs(weapons) do
                 --   vRP.giveInventoryItem(nuser_id,k,1)
					vRP.giveInventoryItem(nuser_id, "wbody" .. cfgWeaponName .. "" .. k, 1)
                    vRP.giveInventoryItem(nuser_id, "wammo" .. cfgWeaponName .. k, v.ammo)
                    if v.ammo > 0 then
                        vRP.giveInventoryItem(nuser_id,vRP.itemAmmoList(k),v.ammo)
                    end
                end

                local inv = vRP.getInventory(nuser_id)
                for k,v in pairs(itemlist) do
                    local amount = vRP.getInventoryItemAmount(nuser_id,v)
                    if amount > 0 then
                        local item_name,item_weight = vRP.getItemDefinition(v)
                        if item_name then
                            if vRP.tryGetInventoryItem(nuser_id,v,amount,true) then
                                vRP.giveInventoryItem(user_id,v,amount)
                            end
                        end
                    end
                end
            end
        end

	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,5)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)

				local weapons = vRPclient.getWeapons(nplayer)
				for k,v in pairs(weapons) do
					if v.ammo > 0 then
					end
				end

				vRPclient.updateWeapons(nplayer)
				if vRPclient.getHealth(nplayer) <= 101 then


					if not vCLIENT.openInspect(source) then
						vCLIENT.openInspect(source)
						opened[user_id] = parseInt(nuser_id)

						local weapons = vRPclient.getWeapons(nplayer,{})
						for k,v in pairs(weapons) do
							if v.ammo > 0 then
							end
						end 

						vRPclient.updateWeapons(nplayer)
						opened[user_id] = parseInt(nuser_id)
						vCLIENT.openInspect(source)
					end
				else
					TriggerClientEvent('Notify', source, "negado", "Você não pode saquear alguém vivo!",5000)
				end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function dRP.openChest()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if opened[user_id] ~= nil then

			local ninventory = {}
			local myInv = vRP.getInventory(user_id)
			for k,v in pairs(myInv) do
				-- 	if string.sub(v.item,1,9) == "toolboxes" then
				-- 		local advFile = LoadResourceFile("logsystem","toolboxes.json")
				-- 		local advDecode = json.decode(advFile)
--
				-- 		v.durability = advDecode[v.item]
				-- 	end

				v.amount = parseInt(v.amount)
				v.name = vRP.itemNameList(v.item)
				v.peso = vRP.itemWeightList(v.item)
				v.index = vRP.itemIndexList(v.item)
				v.key = v.item
				v.slot = k

				ninventory[k] = v
			end

			local uinventory = {}
			local othInv = vRP.getInventory(opened[user_id])
			for k,v in pairs(othInv) do
				-- 	if string.sub(v.item,1,9) == "toolboxes" then
				-- 		local advFile = LoadResourceFile("logsystem","toolboxes.json")
				-- 		local advDecode = json.decode(advFile)
--
				-- 		v.durability = advDecode[v.item]
				-- 	end

				v.amount = parseInt(v.amount)
				v.name = vRP.itemNameList(v.item)
				v.peso = vRP.itemWeightList(v.item)
				v.index = vRP.itemIndexList(v.item)
				v.key = v.item
				v.slot = k

				uinventory[k] = v
			end

			local identity = vRP.getUserIdentity(user_id)
			return ninventory,uinventory,vRP.computeInvWeight(user_id),vRP.getBackpack(user_id),vRP.computeInvWeight(opened[user_id]),vRP.getBackpack(opened[user_id]),{ identity.name.." "..identity.firstname,user_id,vRP.getBankMoney(user_id),parseInt(vRP.getGmsId(user_id)),identity.phone,identity.registration }
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:populateSlot")
AddEventHandler("vrp_inspect:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			
			TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:updateSlot")
AddEventHandler("vrp_inspect:updateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(target)] and inv[tostring(slot)].item == inv[tostring(target)].item then
				if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
					
				end
			else
				vRP.swapSlot(user_id,slot,target)
			end
		end

		TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUMSLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:sumSlot")
AddEventHandler("vrp_inspect:sumSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(target)] and inv[tostring(target)].item == itemName then
				if vRP.tryGetInventoryItem(opened[user_id],itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
					TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUM2SLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:sum2Slot")
AddEventHandler("vrp_inspect:sum2Slot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(opened[user_id])
		if inv[tostring(target)] and inv[tostring(target)].item == item then
			if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
				vRP.giveInventoryItem(opened[user_id],itemName,amount,false,target)
				TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function dRP.storeItem(itemName,slot,amount,target)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		if user_id then
			if vRP.computeInvWeight(opened[user_id]) + vRP.itemWeightList(itemName) * parseInt(amount) <= vRP.getBackpack(opened[user_id]) then
				if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
					vRP.giveInventoryItem(opened[user_id],itemName,amount,true,target)
					TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
				end
			else
				TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function dRP.takeItem(itemName,slot,amount,target)
	local source = source
	if itemName then
		local user_id = vRP.getUserId(source)
		if user_id then
			if itemName ~= "identidade" then -- proibe roubar a identidade da
				
				if vRP.computeInvWeight(user_id) + vRP.itemWeightList(itemName) * parseInt(amount) <= vRP.getBackpack(user_id) then
					if vRP.tryGetInventoryItem(opened[user_id],itemName,amount,true,slot) then
						vRP.giveInventoryItem(user_id,itemName,amount,false,target)
						TriggerClientEvent("vrp_inspect:Update",source,"updateChest")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Mochila cheia.",5000)
				end

			else
				TriggerClientEvent("Notify", source, "negado", "Você não pode roubar a identificação dessa pessoa!")
				
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETINSPECT
-----------------------------------------------------------------------------------------------------------------------------------------
function dRP.resetInspect()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,5)
		if nplayer then
			vRPclient._stopAnim(nplayer,false)
			vCLIENT.toggleCarry(nplayer,source)
		end

		if opened[user_id] ~= nil then
			opened[user_id] = nil
		end
		TriggerClientEvent('segurarrevistar',nplayer,source)
		vRPclient._stopAnim(source,false)
		vRPclient._stopAnim(nplayer,false)
		TriggerClientEvent("Notify", nplayer, "aviso","Você foi revistado!", 8000)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- Barra de progresso
-----------------------------------------------------------------------------------------------------------------------------------------
function dRP.progress()
 	local source = source
 	local user_id = vRP.getUserId(source)
 	local nplayer = vRPclient.getNearestPlayer(source,2)
 	if nplayer then
 		if vRPclient.isInComa(nplayer) then
			vRPclient._playAnim(source,false,{{"amb@medic@standing@kneel@idle_a","idle_a"}},true)
 			TriggerClientEvent("progress",source,5000,"Revistando")
 			SetTimeout(5000,function()
 				vRPclient._stopAnim(source,false)
 			end)
 		else
 			TriggerClientEvent('segurarrevistar',nplayer,source)
 			vRPclient.playAnim(source,false,{{"misscarsteal4@director_grip","end_loop_grip"}},true)
 			vRPclient.playAnim(nplayer,false,{{"random@mugging3","handsup_standing_base"}},true)
 		--	TriggerClientEvent("progress",source,5000,"Revistando")
 		--	TriggerClientEvent("progress",nplayer,5000,"Sendo revistado")

			 TriggerClientEvent("Notify", nplayer, "aviso","Sendo revistado!", 8000)
 			--SetTimeout(5000,function()
 			--	vRPclient._stopAnim(source,false)
 			--	vRPclient._stopAnim(nplayer,false)
 			--	TriggerClientEvent('segurarrevistar',nplayer,source)
			 --TriggerClientEvent("Notify", nplayer, "aviso","Você foi revistado!")
 			--end)
 		end
 	end
end
