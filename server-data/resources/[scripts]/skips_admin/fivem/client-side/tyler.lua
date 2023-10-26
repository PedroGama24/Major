local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface("skips_admin",src)
vALYSON = Tunnel.getInterface("skips_admin")

UIOpened = false
function InteractUI()
    if UIOpened then
        UIOpened = false
        SendNUIMessage({ action = 'closeMenu' })
        SetNuiFocus(false)
        TriggerEvent("bdl:triggerhud")
        StopScreenEffect("MenuMGSelectionIn")
    else
        UIOpened = true
        SendNUIMessage({ action = 'showMenu' })
        SetNuiFocus(true, true)
        TriggerEvent("bdl:triggerhud")
        StartScreenEffect("MenuMGSelectionIn", 0, true)
    end
end

TicketOpened = false
function InteractTicketUI()
    if TicketOpened then
        TicketOpened = false
        SendNUIMessage({ taction = 'closeTicket' })
        SetNuiFocus(false)
        TriggerEvent("bdl:triggerhud")
    else
        TicketOpened = true
        SendNUIMessage({ taction = 'showTicket' })
        SetNuiFocus(true, true)
        TriggerEvent("bdl:triggerhud")
    end
end

RegisterNUICallback('spawnVehicle',function(data)
    local vehicle = tostring(data.vehicle)
    vALYSON.adminSpawnVeh(vehicle)
end)

RegisterNUICallback('killid',function(data)
    local id = tostring(data.id)
    vALYSON.Kill(id)
end)

RegisterNUICallback('ykill',function(data)
    vALYSON.Kill()
end)

RegisterNUICallback('killall',function(data)
    vALYSON.killAll()
end)

RegisterNUICallback('reviveid',function(data)
    local id = tostring(data.id)
    vALYSON.Revive(id)
end)

RegisterNUICallback('yrevive',function(data)
    vALYSON.Revive()
end)

RegisterNUICallback('reviveall',function(data)
    vALYSON.reviveAll()
end)

RegisterNUICallback('upgradevehicle',function(data)
    if IsPedInAnyVehicle(PlayerPedId()) then
        SendNUIMessage({ isInVeh = true })
    else
        SendNUIMessage({ isInVeh = false })
    end
    vALYSON.upgradeVeh()
end)

RegisterNUICallback('addwl',function(data)
    local id = data.id
    vALYSON.addWl(id)
end)

RegisterNUICallback('kickid',function(data)
    local id = data.id
    vALYSON.kickSpecified(id)
end)

RegisterNUICallback('kickall',function()
    vALYSON.kickAll()
end)

RegisterNUICallback('banid',function(data)
    local id = data.id
    vALYSON.banSpecified(id)
end)

--testez
RegisterNUICallback('unbanid',function(data)
    local id = data.id
    vALYSON.unbanSpecified(id)
end)

RegisterNUICallback('removewl',function(data)
    local id = data.id
    vALYSON.removeWl(id)
end)

RegisterNUICallback('requestGroups',function(data,cb)
    local groups, name = vALYSON.GetGroups()
    if groups then
        cb({ groups = groups, name = name })
    end
end)

RegisterNUICallback('requestVehicles',function(data,cb)
    local vehicle, name, tipo = vALYSON.GetVehiclesList()
    if vehicle then
        cb({ vehicle = vehicle, name = name, tipo = tipo })
    end
end)

RegisterNUICallback('setUserGroup',function(data)
    local group = data.group
    local id = data.id
    vALYSON.setUserGroup(group, id)
end)

RegisterNUICallback('removeUserGroup',function(data)
    local group = data.group
    local id = data.id
    vALYSON.removeUserGroup(group, id)
end)

RegisterNUICallback('requestItemList',function(data,cb)
    local item, name = vALYSON.GetItemList()
    if item then
        cb({ item = item, name = name })
    end
end)

RegisterNUICallback('takeItem',function(data,cb)
    local item = data.item
    local amount = data.amount
    vALYSON.takeItem(item, amount)
end)

RegisterNUICallback('giveItemToID',function(data,cb)
    local user = data.user
    local amount = data.amount
    local item = data.item
    vALYSON.giveItem(user, amount, item)
end)

RegisterNUICallback('clearInv',function(data,cb)
    local user = data.id
    vALYSON.clearUserInv(user)
end)

RegisterNUICallback('addToGarage',function (data)
    local id = data.id
    local veh = data.veh
    vALYSON.addToGarage(id,veh)
end)

RegisterNUICallback('remFromGarage',function (data)
    local id = data.id
    local veh = data.veh
    vALYSON.remFromGarage(id,veh)
end)

RegisterNUICallback('requestPlayers',function(data,cb)
    local players = vALYSON.GetOnlinePlayers()
    if players then
        cb({ players = players })
    end
end)

RegisterNUICallback('TeleportToMe',function(data)
    local id = data.id
    vALYSON.teleportToMe(id)
end)

RegisterNUICallback("TPToPlayer",function(data,cb)
    local id = tonumber(data.id)
    vALYSON.TeleportToPlayer(id)
end)

RegisterNUICallback("TPWay",function(data)
    if IsWaypointActive() then
        vALYSON.TeleportWaypoint()
    else
        TriggerEvent("Notify","negado","Waypoint não encontrado.",6000)
    end
end)

RegisterNUICallback('requestWeapons',function(data,cb)
    local weapons = vALYSON.getWeapons(data.type)
    if weapons then
        cb({ weapons = weapons })
    end
end)

RegisterNUICallback('giveWeaponToPlayer',function(data)
    local weapon = data.weapon
    local id = data.id
    local ammo = data.ammo
    vALYSON.giveWeapon(weapon, id, ammo)
end)

RegisterNUICallback('clearPlayerWeapons',function(data)
    local id = data.id
    vALYSON.clearWeapons(id)
end)

RegisterNUICallback('getSpecifiedPlayer',function(data, cb)
    local id = data.id
    local name,lastname, state = vALYSON.getSpecifiedPlayer(id)
    cb({ name = name ,lastname = lastname, state = state })
end)

RegisterNUICallback("AdminNotify",function(data)
    local specified,id,message, signature = data.specified,data.id,data.message, data.signature
    vALYSON.AdminNotify(specified, id, message, signature)
end)

RegisterNUICallback("GetPlayerCoords",function(data, cb)
    local coords = vALYSON.GetEntityCoords()
    local heading = tostring(GetEntityHeading(PlayerPedId()))
    heading = math.ceil(heading * 100) / 100
    cb({ coords = coords, heading = heading })
end)

RegisterNUICallback("GiveMoney",function(data)
    local place,id,amount = data.place,data.id, data.amount
    vALYSON.GiveMoney(place,id,amount)
end)

RegisterNUICallback("SetMoney",function(data)
    local place,id,amount = data.place,data.id, data.amount
    vALYSON.SetMoney(place,id,amount)
end)

RegisterNUICallback("GetMoneyList",function(data,cb)
    local moneys = vALYSON.GetUserMoney()
    cb({moneys = moneys})
end)

RegisterNUICallback("GetLogs",function(data,cb)
    local all_logs = vALYSON.GetPanelLogs()
    cb({all_logs = all_logs})
end)

RegisterNUICallback("GetWhitelisted",function(data,cb)
    local whitelisted = vALYSON.GetWhitelisted()
    cb({whitelisted = whitelisted})
end)

RegisterNUICallback("GetNonWhitelisted",function(data,cb)
    local non_whitelisted = vALYSON.GetNonWhitelisted()
    cb({non_whitelisted = non_whitelisted})
end)

RegisterNUICallback("GetPlayerInfos",function(data,cb)
    local id = data.id
    local name,lastname = vALYSON.GetPlayerInfos(id)
    cb({ name = name, lastname = lastname })
end)

RegisterNUICallback("TryGiveMoney",function(data,cb)
    local id,amount,place = data.id,data.amount,data.place
    local state = vALYSON.CheckPlayer(id)
    vALYSON.GiveMoney(place,id,amount)
    cb({ state = state })
end)

RegisterNUICallback("TrySetMoney",function(data,cb)
    local id,amount,place = data.id,data.amount,data.place
    local state = vALYSON.CheckPlayer(id)
    vALYSON.SetMoney(place,id,amount)
    cb({ state = state })
end)

RegisterNUICallback("CheckOnlinePlayer",function(data,cb)
    local id = data.id
    local state = vALYSON.CheckPlayer(id)
    cb({state = state})
end)

RegisterNUICallback("eraseLog",function(data)
    local log_id = data.id
    vALYSON.EraseLog(log_id)
end)

RegisterNUICallback("eraseAllLogs",function()
    vALYSON.WipeLogs()
end)
--testez
--testez
--testez

RegisterNUICallback('checkPermission',function (data,cb)
    if data.action == "spawn_veh" then
        if vALYSON.VerifyPerm("spawn_veh") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "kill" then
        if vALYSON.VerifyPerm("kill") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "kill_all" then
        if vALYSON.VerifyPerm("kill_all") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "revive" then
        if vALYSON.VerifyPerm("revive") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "revive_all" then
        if vALYSON.VerifyPerm("revive_all") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "upgrade_veh" then
        if vALYSON.VerifyPerm("upgrade_veh") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "wl_manage" then
        if vALYSON.VerifyPerm("wl_manage") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "ban_manage" then
        if vALYSON.VerifyPerm("ban_manage") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "kick_id" then
        if vALYSON.VerifyPerm("kick_id") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "kick_all" then
        if vALYSON.VerifyPerm("kick_all") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    end
end)

RegisterNUICallback("checkManagementPerm",function (data,cb)
    if data.action == "groups" then
        if vALYSON.VerifyPerm("manage_groups") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "items" then
        if vALYSON.VerifyPerm("manage_items") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "vehicles" then
        if vALYSON.VerifyPerm("manage_vehicles") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "players" then
        if vALYSON.VerifyPerm("manage_players") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end

    elseif data.action == "notify" then
        if vALYSON.VerifyPerm("manage_notify") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    
    elseif data.action == "coordinates" then
        if vALYSON.VerifyPerm("get_coordinates") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end

    elseif data.action == "revive" then
        if vALYSON.VerifyPerm("revive") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "kill" then
        if vALYSON.VerifyPerm("kill") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "teleport" then
        if vALYSON.VerifyPerm("teleport") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "weapons" then
        if vALYSON.VerifyPerm("weapons") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "money" then
        if vALYSON.VerifyPerm("money") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "wl_manage" then
        if vALYSON.VerifyPerm("wl_manage") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "see_logs" then
        if vALYSON.VerifyPerm("see_logs") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    elseif data.action == "edit_logs" then
        if vALYSON.VerifyPerm("edit_logs") then
            cb({ isAllowed = true })
        else
            cb({ isAllowed = false })
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vehtuning")
AddEventHandler("vehtuning",function(vehicle)
	local ped = PlayerPedId()
    local vehicle = vRP.getNearestVehicle(7)
    
	if IsEntityAVehicle(vehicle) then
		SetVehicleModKit(vehicle,0)
		SetVehicleWheelType(vehicle,7)
		SetVehicleMod(vehicle,0,GetNumVehicleMods(vehicle,0)-1,false)
		SetVehicleMod(vehicle,1,GetNumVehicleMods(vehicle,1)-1,false)
		SetVehicleMod(vehicle,2,GetNumVehicleMods(vehicle,2)-1,false)
		SetVehicleMod(vehicle,3,GetNumVehicleMods(vehicle,3)-1,false)
		SetVehicleMod(vehicle,4,GetNumVehicleMods(vehicle,4)-1,false)
		SetVehicleMod(vehicle,5,GetNumVehicleMods(vehicle,5)-1,false)
		SetVehicleMod(vehicle,6,GetNumVehicleMods(vehicle,6)-1,false)
		SetVehicleMod(vehicle,7,GetNumVehicleMods(vehicle,7)-1,false)
		SetVehicleMod(vehicle,8,GetNumVehicleMods(vehicle,8)-1,false)
		SetVehicleMod(vehicle,9,GetNumVehicleMods(vehicle,9)-1,false)
		SetVehicleMod(vehicle,10,GetNumVehicleMods(vehicle,10)-1,false)
		SetVehicleMod(vehicle,11,GetNumVehicleMods(vehicle,11)-1,false)
		SetVehicleMod(vehicle,12,GetNumVehicleMods(vehicle,12)-1,false)
		SetVehicleMod(vehicle,13,GetNumVehicleMods(vehicle,13)-1,false)
		SetVehicleMod(vehicle,14,16,false)
		SetVehicleMod(vehicle,15,GetNumVehicleMods(vehicle,15)-2,false)
		SetVehicleMod(vehicle,16,GetNumVehicleMods(vehicle,16)-1,false)
		ToggleVehicleMod(vehicle,17,true)
		ToggleVehicleMod(vehicle,18,true)
		ToggleVehicleMod(vehicle,19,true)
		ToggleVehicleMod(vehicle,20,true)
		ToggleVehicleMod(vehicle,21,true)
		ToggleVehicleMod(vehicle,22,true)
		SetVehicleMod(vehicle,23,1,false)
		SetVehicleMod(vehicle,24,1,false)
		SetVehicleMod(vehicle,25,GetNumVehicleMods(vehicle,25)-1,false)
		SetVehicleMod(vehicle,27,GetNumVehicleMods(vehicle,27)-1,false)
		SetVehicleMod(vehicle,28,GetNumVehicleMods(vehicle,28)-1,false)
		SetVehicleMod(vehicle,30,GetNumVehicleMods(vehicle,30)-1,false)
		SetVehicleMod(vehicle,33,GetNumVehicleMods(vehicle,33)-1,false)
		SetVehicleMod(vehicle,34,GetNumVehicleMods(vehicle,34)-1,false)
		SetVehicleMod(vehicle,35,GetNumVehicleMods(vehicle,35)-1,false)
		SetVehicleMod(vehicle,38,GetNumVehicleMods(vehicle,38)-1,true)
		SetVehicleTyreSmokeColor(vehicle,0,0,127)
		SetVehicleWindowTint(vehicle,1)
		SetVehicleTyresCanBurst(vehicle,false)
		--SetVehicleNumberPlateText(vehicle,"FiveM Brasil")
		SetVehicleNumberPlateTextIndex(vehicle,5)
		SetVehicleModColor_1(vehicle,4,12,0)
		SetVehicleModColor_2(vehicle,4,12)
		SetVehicleColours(vehicle,12,12)
		SetVehicleExtraColours(vehicle,70,141)
	end
end)



RegisterNetEvent('tptoway')
AddEventHandler('tptoway',function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsUsing(ped)
	if IsPedInAnyVehicle(ped) then
		ped = veh
    end
	local waypointBlip = GetFirstBlipInfoId(8)
	local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09,waypointBlip,Citizen.ResultAsVector()))
	local ground
	local groundFound = false
	local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }
	for i,height in ipairs(groundCheckHeights) do
		SetEntityCoordsNoOffset(ped,x,y,height,0,0,1)

		RequestCollisionAtCoord(x,y,z)
		while not HasCollisionLoadedAroundEntity(ped) do
			RequestCollisionAtCoord(x,y,z)
			Citizen.Wait(1)
		end
		Citizen.Wait(20)

		ground,z = GetGroundZFor_3dCoord(x,y,height)
		if ground then
			z = z + 1.0
			groundFound = true
			break;
		end
	end
	if not groundFound then
		z = 1200
		GiveDelayedWeaponToPed(PlayerPedId(),0xFBAB5776,1,0)
	end
	RequestCollisionAtCoord(x,y,z)
	while not HasCollisionLoadedAroundEntity(ped) do
		RequestCollisionAtCoord(x,y,z)
		Citizen.Wait(1)
	end
	SetEntityCoordsNoOffset(ped,x,y,z,0,0,1)
end)

RegisterCommand(config.openCommand, function()
    if vALYSON.checkGlobalPermission() then
        InteractUI()
    end
end)

RegisterCommand(config.openTicketCommand, function()
    InteractTicketUI()
end)



RegisterNUICallback("TriggerUI",function(data)
    InteractUI()
end)

RegisterNUICallback("TriggerTicketUI",function(data)
    InteractTicketUI()
end)



