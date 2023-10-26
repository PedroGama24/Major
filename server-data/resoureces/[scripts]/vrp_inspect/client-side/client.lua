-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
dRP = {}
Tunnel.bindInterface("vrp_inspect",dRP)
vSERVER = Tunnel.getInterface("vrp_inspect")
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("chestClose",function(data)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideMenu" })
	vSERVER.resetInspect()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("takeItem",function(data)
	vSERVER.takeItem(data.item,data.slot,data.amount,data.target)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("storeItem",function(data)
	vSERVER.storeItem(data.item,data.slot,data.amount,data.target)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(data,cb)
	TriggerServerEvent("vrp_inspect:populateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(data,cb)
	TriggerServerEvent("vrp_inspect:updateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sumSlot",function(data,cb)
	TriggerServerEvent("vrp_inspect:sumSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sum2Slot",function(data,cb)
	TriggerServerEvent("vrp_inspect:sum2Slot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_INSPECT:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_inspect:Update")
AddEventHandler("vrp_inspect:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestChest",function(data,cb)
	local inventario,inventario2,peso,maxpeso,peso2,maxpeso2,infos = vSERVER.openChest()
	if inventario then
		cb({ inventario = inventario, inventario2 = inventario2, peso = peso, maxpeso = maxpeso, peso2 = peso2, maxpeso2 = maxpeso2, infos = infos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function dRP.openInspect()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "showMenu" })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOGGLECARRY
-----------------------------------------------------------------------------------------------------------------------------------------
-- local uCarry = nil
-- local iCarry = false
-- local sCarry = false
-- function dRP.toggleCarry(source)
-- 	uCarry = source
-- 	iCarry = not iCarry

-- 	local ped = PlayerPedId()
-- 	if iCarry and uCarry then
-- 		Citizen.InvokeNative(0x6B9BBD38AB0796DF,PlayerPedId(),GetPlayerPed(GetPlayerFromServerId(uCarry)),4103,11816,0.5,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
-- 		sCarry = true
-- 	else
-- 		if sCarry then
-- 			DetachEntity(ped,true,false)
-- 			sCarry = false
-- 		end
-- 	end	
-- end

-----------------------------------------------------------------------------------------------------------------------------------------
--[ CARREGAR ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
other = nil
drag = false
carregado = false
RegisterNetEvent("segurarrevistar")
AddEventHandler("segurarrevistar",function(p1)
    other = p1
    drag = not drag
end)

Citizen.CreateThread(function()
    while true do
    	Citizen.Wait(1)
		if drag and other then
			local ped = GetPlayerPed(GetPlayerFromServerId(other))
			Citizen.InvokeNative(0x6B9BBD38AB0796DF,PlayerPedId(),ped,4103,11816,0.48,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
			carregado = true
        else
        	if carregado then
				DetachEntity(PlayerPedId(),true,false)
				carregado = false
			end
        end
	end
end)
