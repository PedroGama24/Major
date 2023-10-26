local _IsPedInAnyVehicle = false
local lastVehicle = nil
local polmav_hash = GetHashKey("polmav")
local helibpm_hash = GetHashKey("helibpm")
local paramedicoheli_hash = GetHashKey("paramedicoheli")
local helicoter = GetHashKey("helicoter")

-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPATCH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for i = 1,120 do
		EnableDispatchService(i,false)
	end
end)


AddEventHandler("gameEventTriggered", function(eventName,args) 
	if eventName == "CEventNetworkPlayerEnteredVehicle" then 
		local selectedPed = args[1]
		if args[1] == PlayerId() then 
			_IsPedInAnyVehicle = true 
			vehicle = args[2]

			REMOVEWEAPON()
			Drift()
			rodarPoliceRadar()
		

			while IsPedInAnyVehicle(PlayerPedId()) do
				Wait(100)
			end
			_IsPedInAnyVehicle = false 
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ ESTOURAR OS PNEUS ]------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	
	while true do
		local sleep = 1000
		local ped = PlayerPedId()
		local vehicleped = IsPedInAnyVehicle(ped) 
		if vehicleped then
			sleep = 5
			local vehicle = GetVehiclePedIsIn(ped)
			local assento = GetPedInVehicleSeat(vehicle,-1)
           if assento == ped then
               local speed = GetEntitySpeed(vehicle)*2.236936
				if speed >= 390 and math.random(100) >= 97 then
					local estourar = GetVehicleTyresCanBurst(vehicle)
                   if estourar == false then return end
                   local pneus = GetVehicleNumberOfWheels(vehicle)
                   local pneusEffects
                   if pneus == 2 then
                        pneusEffects = (math.random(2)-1)*4
                   elseif pneus == 4 then
                       pneusEffects = (math.random(4)-1)
                       if pneusEffects > 1 then
                           pneusEffects = pneusEffects + 2
                       end
                   elseif pneus == 6 then
                       pneusEffects = (math.random(6)-1)
                   else
                       pneusEffects = 0
                   end
                   SetVehicleTyreBurst(vehicle,pneusEffects,false,1000.0)
               end
           end
		end
		Citizen.Wait(sleep)
   end
end)

----------- RADAR -----------

local radar = {
	shown  = false,
	freeze = false,
	info   = "INICIANDO O SISTEMA DO RADAR",
	info2  = "INICIANDO O SISTEMA DO RADAR"
}

rodarPoliceRadar = function()
	Citizen.CreateThread(function()
		while true do
			local msec = 1000
			if _IsPedInAnyVehicle then 
				local ped = PlayerPedId()
			if IsPedInAnyPoliceVehicle(ped) or GetEntityModel(GetVehiclePedIsIn(ped, false)) == `trailft20` or GetEntityModel(GetVehiclePedIsIn(ped, false)) == `wrsxr` or GetEntityModel(GetVehiclePedIsIn(ped, false)) == `wrraptor` then
				msec = 5
				if IsControlJustPressed(1,306) then
					if radar.shown then
						radar.shown = false
					else
						radar.shown = true
					end
				end
				
				if IsControlJustPressed(1, 301) then
					if radar.freeze then
						radar.freeze = false
					else
						radar.freeze = true
					end
				end
				
				if radar.shown then
					if radar.freeze == false then
						local coordA        = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 1.0, 1.0)
						local coordB        = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 105.0, 0.0)
						local frontcar      = StartShapeTestCapsule(coordA, coordB, 3.0, 10, vehicle, 7)
						local _, _, _, _, e = GetShapeTestResult(frontcar)
						
						if IsEntityAVehicle(e) then
							local fmodel  = GetDisplayNameFromVehicleModel(GetEntityModel(e))
							local fvspeed = GetEntitySpeed(e) * 2.236936
							local fplate  = GetVehicleNumberPlateText(e)
							radar.info    = string.format("~y~PLACA: ~w~%s   ~y~MODELO: ~w~%s   ~y~VELOCIDADE: ~w~%s MPH", fplate, fmodel, math.ceil(fvspeed))
						end
						
						local bcoordB       = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -105.0, 0.0)
						local rearcar       = StartShapeTestCapsule(coordA, bcoordB, 3.0, 10, vehicle, 7)
						local _, _, _, _, j = GetShapeTestResult(rearcar)
						
						if IsEntityAVehicle(j) then
							local bmodel  = GetDisplayNameFromVehicleModel(GetEntityModel(j))
							local bvspeed = GetEntitySpeed(j) * 2.236936
							local bplate  = GetVehicleNumberPlateText(j)
							radar.info2   = string.format("~y~PLACA: ~w~%s   ~y~MODELO: ~w~%s   ~y~VELOCIDADE: ~w~%s MPH", bplate, bmodel, math.ceil(bvspeed))
						end
					end
					drawTxt(radar.info, 4, 0.50, 0.83, 0.50, 255, 255, 255, 180)
					drawTxt(radar.info2, 4, 0.50, 0.87, 0.50, 255, 255, 255, 180)
				end
			else 
				break
			end
			else 
				radar.shown = false
				break
			end
			Wait(msec)
		end
	end)
end
function drawTxt(text, font, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end



-----------------------------------------------------------------------------------------------------------------------------------------
-- [ REMOVER O Q ]-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local timing = 1000
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        if health >= 101 then
			timing = 5 
        DisableControlAction(0,44,true)
        end
		Citizen.Wait(timing)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER ARMA ABAIXO DE 40MPH DENTRO DO CARRO
-----------------------------------------------------------------------------------------------------------------------------------------
REMOVEWEAPON = function()
	Citizen.CreateThread(function()
		local sleep = 1000
		while _IsPedInAnyVehicle do
			local ped = PlayerPedId()
				local vehicle = GetVehiclePedIsIn(PlayerPedId())
				if GetPedInVehicleSeat(vehicle,-1) == ped then
					sleep = 5
					local speed = GetEntitySpeed(vehicle)*2.236936
					if speed >= 40 then
						
						SetPlayerCanDoDriveBy(PlayerId(),false)
					else
						SetPlayerCanDoDriveBy(PlayerId(),true)
					end
				end
			Citizen.Wait(sleep)
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DisablePlayerVehicleRewards(PlayerId()) --Nao mexer 
        RemoveAllPickupsOfType(0xDF711959) 
        RemoveAllPickupsOfType(0xF9AFB48F) 
        RemoveAllPickupsOfType(0xA9355DCD) 
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SE JOGAR NO CHÃO // DELETE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() 	
    while true do 		
        Citizen.Wait(4) 		
        if IsControlPressed(1, 178 --[[ "del" key ]]) then 		
            SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, true, true, false) 
        end 	
    end 
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TREM NO MAPA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SwitchTrainTrack(0, true)
	SwitchTrainTrack(3, true)
	N_0x21973bbf8d17edfa(0, 120000)
	SetRandomTrains(true)
  end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUS DO DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
local appid = 'appid'
local asset = 'assetid'
Citizen.CreateThread(function()
	while true do
		local player = PlayerId()
        local name = GetPlayerName(player)
		local id = GetPlayerServerId(player)
		SetRichPresence("ID: " .. id .. " | " .. name .. " | " .. #GetActivePlayers() .. "/2048")
        -- Este é o ID do aplicativo (substitua-o pelo seu)
		SetDiscordAppId(1037381404813701201)

        -- Aqui você terá que colocar o nome da imagem para o ícone "grande".
		SetDiscordRichPresenceAsset('logofb')

		-- Aqui você pode adicionar texto flutuante para o ícone "grande".
        SetDiscordRichPresenceAssetText('A comunidade mais completa para seu FiveM!')
       
        -- Aqui você deverá colocar o nome da imagem para o ícone "pequeno".
        SetDiscordRichPresenceAssetSmall('infofb')

        -- Aqui você pode adicionar texto de foco para o ícone "pequeno".
        SetDiscordRichPresenceAssetSmallText('discord.gg/ZzjSfmdaVG')

        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/ZzjSfmdaVG")
        SetDiscordRichPresenceAction(1, "Jogar", "fivem://connect/localhost:30120")

        -- Ele atualiza a cada minuto apenas no caso.
		Citizen.Wait(60000)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- BLACKOUT
-----------------------------------------------------------------------------------------------------------------------------------------
local blackOut = false
local oldSpeed = 0

local function blackout()
	if not blackOut then
		blackOut = true
		Citizen.CreateThread(function()
			DoScreenFadeOut(1000)
			SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())-40)
			while not IsScreenFadedOut() do
				Citizen.Wait(10)
			end
			Citizen.Wait(5000)
			DoScreenFadeIn(1000)
			blackOut = false
		end)
	end
end

Citizen.CreateThread(function()
	while true do
		local ORTiming = 500
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			ORTiming = 4
			local veh = GetVehiclePedIsIn(ped)
			if IsEntityAVehicle(veh) and GetPedInVehicleSeat(veh,-1) == ped and not IsPedOnAnyBike(ped) then
				local speed = GetEntitySpeed(veh) * 3.6
				if speed ~= oldSpeed then
					if not blackOut and ((oldSpeed - speed) >= 50) then
						blackout()
					end
					oldSpeed = speed
				end
			end

			if blackOut then
				DisableControlAction(0,71,true)
				DisableControlAction(0,72,true)
				DisableControlAction(0,63,true)
				DisableControlAction(0,64,true)
				DisableControlAction(0,75,true)
			end
		else
			blackOut = false
			oldSpeed = 0
			speed = 0
		end

		Citizen.Wait(ORTiming)
	end
end)

Citizen.CreateThread( function()
	SetPedHelmet(GetPlayerPed(-1), false)
	
		while true do
			Citizen.Wait(900000)		
			local playerPed = GetPlayerPed(-1)
			local playerVeh = GetVehiclePedIsUsing(playerPed)
	
			if gPlayerVeh ~= 30000 then RemovePedHelmet(playerPed,true) end
		end
		
	end)
	
	
-----------------------------------------------------------------------------------------------------------------------------------------
-- PEDLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local pedlist = {
	{ 2146.669921875,5006.4375,41.327373504639,135.82,0xFCFA9E1E,"A_C_Cow" },
	{ 2144.0952148438,5009.0532226562,41.284873962402,134.01,0xFCFA9E1E,"A_C_Cow" },
	{ 2140.4226074219,5005.3852539062,41.2864112854,310.13,0xFCFA9E1E,"A_C_Cow" },
	{ 2142.7431640625,5002.5434570312,41.310150146484,310.18,0xFCFA9E1E,"A_C_Cow" },

	{ 2139.4931640625,4999.4877929688,41.405204772949,134.88,0xFCFA9E1E,"A_C_Cow" },
	{ 2136.6149902344,5001.9057617188,41.382362365723,133.86,0xFCFA9E1E,"A_C_Cow" },
	{ 2132.6967773438,4997.9770507812,41.33219909668,314.0,0xFCFA9E1E,"A_C_Cow" },
	{ 2135.2331542969,4995.69140625,41.375423431396,311.46,0xFCFA9E1E,"A_C_Cow" },

	{ 2131.9477539062,4992.4755859375,41.303764343262,133.62,0xFCFA9E1E,"A_C_Cow" },
	{ 2129.2956542969,4994.6909179688,41.330619812012,133.38,0xFCFA9E1E,"A_C_Cow" },
	{ 2125.7878417969,4991.3608398438,41.273838043213,314.06,0xFCFA9E1E,"A_C_Cow" },
	{ 2128.1354980469,4988.9946289062,41.235546112061,308.71,0xFCFA9E1E,"A_C_Cow" },

	{ 2149.4958496094,5009.4228515625,41.333835601807,314.63,0xFCFA9E1E,"A_C_Cow" },
	{ 2146.5261230469,5012.1909179688,41.313365936279,309.32,0xFCFA9E1E,"A_C_Cow" },
	{ 2150.0971679688,5015.5014648438,41.354736328125,131.32,0xFCFA9E1E,"A_C_Cow" },
	{ 2153.0788574219,5013.0078125,41.326389312744,130.6,0xFCFA9E1E,"A_C_Cow" },

	{  915.18, -2099.4, 30.46,174.08,0xF7A74139,"mp_m_waremech_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- menica
	{  121.86, -3029.7, 7.05,265.59,0x441405EC,"s_m_y_xmech_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- driftking

	{  416.13, 6520.62, 27.74,266.07,0x0F977CEB,"s_m_y_chef_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- fazendeiro/graos
	{  70.3, -1758.15, 29.3,55.43,0x0F977CEB,"s_m_y_chef_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- padaria/graos

	{  722.1, -2016.26, 29.3,262.41,0xF6157D8F,"g_m_m_chemwork_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- eletricista

	{  153.29, -3208.29, 5.92,99.96,0xC9E5F56B,"s_m_m_ccrew_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- encanador
	{ -841.734375,5401.1674804688,34.615173339844,311.92,0xD7DA9E99,"s_m_y_construct_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },--lenhador
	{ -350.16586303711,-1569.8493652344,25.220918655396,300.48,0x14D7B4E0,"s_m_m_dockwork_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },--lixeiro
	{  1525.75, 3784.17, 34.51,219.38,0x6C9B2849,"a_m_m_hillbilly_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- central de pesca
	{  -1039.05, -2845.34, 27.72,104.13,0xF6D1E04E,"cs_solomon","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- banco aeroporto
	{  149.43, -1042.12, 29.37,342.86,0xF6D1E04E,"cs_solomon","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- banco
	{  -1211.87, -332.04, 37.79,24.18,0xF6D1E04E,"cs_solomon","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- banco
	{  -2961.09, 482.79, 15.7,86.16,0xF6D1E04E,"cs_solomon","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- banco
	{  -112.36, 6471.28, 31.63,140.22,0xF6D1E04E,"cs_solomon","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- banco
	{  313.76, -280.57, 54.17,343.58,0xF6D1E04E,"cs_solomon","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- banco
	{  -351.13, -51.45, 49.04,341.86,0xF6D1E04E,"cs_solomon","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- banco


	{  -72.08, -814.46, 243.39,165.75,0xF6D1E04E,"cs_solomon","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- imobiliaria

	{  -1127.41, -1439.21, 5.23,298.54,0x188232D0,"ig_marnie","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- loja skateshop

	{  -1070.71, -2836.04, 27.71,285.97,0x188232D0,"ig_marnie","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- loja aeroporto
	{ -1046.88, -2821.28, 27.7,226.9,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- roupa aeroporto
	{  67.01936340332,-1733.5880126953,29.290735244751,136.42,0x5244247D,"u_m_y_baygor","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- carrefour
	{  65.18, -1735.79, 29.3,136.42,0x5244247D,"u_m_y_baygor","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- carrefour
	{  63.15, -1738.0, 29.3,136.42,0x5244247D,"u_m_y_baygor","anim@heists@heist_corona@single_team","single_team_loop_boss" },  -- carrefour

	{  -656.94, -858.76, 24.5,4.75,0xD172497E,"a_m_m_afriamer_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- Digital den


	{ 1116.75, 220.05, -49.43,105.5,0xB7C61032,"a_f_y_business_04","timetable@ron@ig_5_p3","ig_5_p3_base" }, -- CASINO
	{ 1115.15, 253.36, -45.83,273.47,0x2799EFD8,"a_f_y_business_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },-- Casino

	{ -492.33, -342.57, 42.33,353.94,0xB353629E,"s_m_m_paramedic_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },-- Farmácia

	{ 44.37, 6303.98, 31.22,210.53,0xF0EC56E2,"u_m_m_aldinapoli","anim@heists@heist_corona@single_team","single_team_loop_boss" },-- Contrabandista
	{ 4504.77, -4555.31, 4.18,22.99,0xF0EC56E2,"u_m_m_aldinapoli","anim@heists@heist_corona@single_team","single_team_loop_boss" },-- Itens ilegais/FARC

	{ 148.77, 6362.33, 31.53,119.11,0xF0EC56E2,"u_m_m_aldinapoli","anim@heists@heist_corona@single_team","single_team_loop_boss" },-- Compra Cartões / Annoynmous

	-- { 24.49,-1347.31,29.5,271.34,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 2557.25,380.8,108.63,355.54,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 1164.71,-322.72,69.21,98.92,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { -706.11,-913.66,19.22,92.34,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { -46.71,-1757.96,29.43,50.34,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 372.54,326.38,103.57,254.31,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { -3242.27,999.97,12.84,354.9,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 1727.86,6415.24,35.04,241.92,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 549.1,2671.31,42.16,95.92,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 1960.1,3740.04,32.35,300.65,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 2678.1,3279.4,55.25,335.7,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 1698.09,4922.92,42.07,328.31,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { -1820.07,794.18,138.09,131.05,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 1392.81,3606.47,34.99,200.07,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { -2966.44,390.93,15.05,85.99,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { -3038.95,584.55,7.91,16.82,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 1134.2,-982.52,46.42,278.98,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 1165.87,2710.83,38.16,181.59,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { -1486.25,-378.0,40.17,132.59,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { -1221.92,-908.29,12.33,34.77,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	-- { 160.56,6641.64,31.72,225.9,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },

	{ 1692.2,3760.96,34.71,225.61,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 253.78,-50.57,69.95,65.21,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 842.46,-1035.24,28.2,357.31,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -331.59,6085.03,31.46,222.94,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -662.29,-933.6,21.83,179.34,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1304.08,-394.6,36.7,75.11,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1118.94,2699.81,18.56,220.65,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 2568.04,292.65,108.74,359.32,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -3173.56,1088.33,20.84,246.11,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 22.55,-1105.53,29.8,160.13,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 810.2,-2159.05,29.62,359.45,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },	
	
	{-693.62, -1666.81, 24.99,95.62,0xB7C61032,"a_f_y_business_04","timetable@ron@ig_5_p3","ig_5_p3_base" }, -- detran



	{ 73.98,-1392.81,29.38,267.12,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -708.34,-152.77,37.42,119.8,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -164.54,-301.92,39.74,246.23,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 427.07,-806.19,29.5,91.2,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -823.1,-1072.3,11.33,208.54,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1194.58,-767.5,17.32,212.84,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1449.72,-238.91,49.82,44.85,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 5.79,6511.36,31.88,40.19,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1695.35,4823.03,42.07,97.63,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 127.31,-223.42,54.56,68.28,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 612.99,2761.83,42.09,269.46,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1196.6,2711.64,38.23,177.03,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -3169.09,1044.05,20.87,64.38,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1102.51,2711.51,19.11,219.7,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },

	{ -680.21, 5838.59, 17.34,228.59,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },

	{ 16.64, -1110.76, 29.8,240.13,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },	
	{ 77.67, -1387.64, 29.38,180.9,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -618.13317871094,340.30654907227,85.192893981934,360.23,0x75D30A91,"s_m_y_dwservice_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, --corona
	{ -424.38986206055,-2789.7578125,6.5293717384338,311.92,0xD7DA9E99,"s_m_y_construct_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },--carteiro
	{ 533.62, -1844.72, 26.75,322.21,0xD7DA9E99,"s_m_y_construct_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- gas
	{ -1083.3,-245.93,37.77,206.79,0x2F8845A3,"ig_barry","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- empresas
	{ 77.3, -1749.27, 29.3,51.23,0x69F46BF3,"s_f_y_factory_01","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- vender peixe

	{ -92.72, -2462.87, 6.03,54.02,0xEE75A00F,"s_m_y_garbage","anim@heists@heist_corona@single_team","single_team_loop_boss" }, -- vender peixe

}


-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADPEDLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local localPeds = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))

		for k,v in pairs(pedlist) do
			local distance = GetDistanceBetweenCoords(x,y,z,v[1],v[2],v[3],true)
			if distance <= 30 then
				if localPeds[k] == nil then
					RequestModel(GetHashKey(v[6]))
					while not HasModelLoaded(GetHashKey(v[6])) do
						RequestModel(GetHashKey(v[6]))
						Citizen.Wait(10)
					end

					localPeds[k] = CreatePed(4,v[5],v[1],v[2],v[3]-1,v[4],false,false)
					SetEntityInvincible(localPeds[k],true)
					FreezeEntityPosition(localPeds[k],true)
					SetEntityAsMissionEntity(localPeds[k],true,true)
					SetBlockingOfNonTemporaryEvents(localPeds[k],true)

					if v[7] ~= nil then
						RequestAnimDict(v[7])
						while not HasAnimDictLoaded(v[7]) do
							RequestAnimDict(v[7])
							Citizen.Wait(10)
						end

						TaskPlayAnim(localPeds[k],v[7],v[8],8.0,0.0,-1,1,0,0,0,0)
					end
				end
			else
				if localPeds[k] then
					SetEntityAsMissionEntity(localPeds[k],false,false)
					DeleteEntity(localPeds[k])
					localPeds[k] = nil
				end
			end
		end
	end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- MUDAR DE ASSENTO
-----------------------------------------------------------------------------------------------------------------------------------------

lugares = {-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30}
for k,v in pairs(lugares) do
    RegisterCommand("p"..k, function(source, args)
        if vRP.isHandcuffed() then
            return
        end
        local ped = PlayerPedId()
        SetPedConfigFlag(ped, 184, true)
        SetPedIntoVehicle(ped, GetVehiclePedIsIn(ped), v)
    end)
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEDROPWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if not IsPedInAnyVehicle(PlayerPedId()) then
			local handle,ped = FindFirstPed()
			local finished = false

			repeat
				if not IsEntityDead(ped) then
					SetPedDropsWeaponsWhenDead(ped,false)
				end
				finished,ped = FindNextPed(handle)
			until not finished

			EndFindPed(handle)
		end
	end
end)

--[ DRIFT ]------------------------------------------------------------------------------------------------------------------------------

Drift = function()
	Citizen.CreateThread(function()
		while _IsPedInAnyVehicle do
				local msec    = 100
				local ped = PlayerPedId()
					local vehicle = GetVehiclePedIsIn(PlayerPedId())
						local speed = GetEntitySpeed(vehicle)*2.236936
						if GetPedInVehicleSeat(vehicle,-1) == ped 
							and (GetEntityModel(vehicle) ~= GetHashKey("coach") 
								and GetEntityModel(vehicle) ~= GetHashKey("bus") 
								and GetEntityModel(vehicle) ~= GetHashKey("youga2") 
								and GetEntityModel(vehicle) ~= GetHashKey("ratloader") 
								and GetEntityModel(vehicle) ~= GetHashKey("taxi") 
								and GetEntityModel(vehicle) ~= GetHashKey("boxville4") 
								and GetEntityModel(vehicle) ~= GetHashKey("trash2") 
								and GetEntityModel(vehicle) ~= GetHashKey("tiptruck") 
								and GetEntityModel(vehicle) ~= GetHashKey("rebel") 
								and GetEntityModel(vehicle) ~= GetHashKey("speedo") 
								and GetEntityModel(vehicle) ~= GetHashKey("phantom") 
								and GetEntityModel(vehicle) ~= GetHashKey("packer") 
								and GetEntityModel(vehicle) ~= GetHashKey("paramedicoambu")) then
								if speed <= 100.0 then
								if IsControlPressed(1,21) then
									SetVehicleReduceGrip(vehicle,true)
								else
									SetVehicleReduceGrip(vehicle,false)
								end
							end    
						end
			Wait(msec)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAZERTIME
-----------------------------------------------------------------------------------------------------------------------------------------

local tasertime = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(200)
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped) then
			SetPedToRagdoll(ped,10000,10000,0,0,0,0)
		end

		if IsPedBeingStunned(ped) and not tasertime then
			tasertime = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",1.0)
		elseif not IsPedBeingStunned(ped) and tasertime then
			tasertime = false
			SetTimeout(5000,function()
				SetTimecycleModifier("hud_def_desat_Trevor")
				SetTimeout(10000,function()
					SetTimecycleModifier("")
					SetTransitionTimecycleModifier("")
					StopGameplayCamShaking()
				end)
			end)
		end
	end
end)



-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local teleport = {



	["CASINO"] = {
		positionFrom = { 935.71343994141,47.387046813965,81.095710754395 },
		positionTo = { 1090.0213623047,205.79496765137,-48.999736785889 }
	},
	


	["IMOBILIARIA"] = {
		positionFrom = { -76.545257568359,-830.12133789062,243.38595581055 },
		positionTo = { -67.130035400391,-802.43444824219,44.227279663086 }
	},

	["IMOBILIARIA2"] = {
		positionFrom = { -71.106941223145,-800.96917724609,44.227294921875 },
		positionTo = {-75.7890625,-827.28070068359,243.38577270508 }
	},

	["IMOBILIARIA3"] = {
		positionFrom = { -78.866012573242,-829.36041259766,243.38577270508},
		positionTo = { -57.64811706543,-804.30535888672,44.227333068848 }
	},

	["AEROPORTO"] = {
		positionFrom = { -1065.46, -2797.94, 27.71},
		positionTo = { -1035.39, -2751.51, 14.6 }
	},
}


Citizen.CreateThread(function()
	while true do
		local ORTiming = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			
			
			local x,y,z = table.unpack(GetEntityCoords(ped))
			for k,v in pairs(teleport) do
				if GetDistanceBetweenCoords(v.positionFrom[1],v.positionFrom[2],v.positionFrom[3],x,y,z,true) <= 1.2 then
					ORTiming = 4
					if IsControlJustPressed(0,38) then
						DoScreenFadeOut(1000)
						SetTimeout(2000,function()
							SetEntityCoords(ped,v.positionTo[1]+0.0001,v.positionTo[2]+0.0001,v.positionTo[3]+0.0001-0.50,1,0,0,1)
							Citizen.Wait(750)
							DoScreenFadeIn(1000)
						end)
					end
				end

				if GetDistanceBetweenCoords(v.positionFrom[1],v.positionFrom[2],v.positionFrom[3],x,y,z,true) <= 10.0 then
					ORTiming = 4
					DrawMarker(21,-71.081558227539,-801.04827880859,44.227279663086-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)
					DrawMarker(21,-66.814315795898,-802.529296875,44.227283477783-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)

					DrawMarker(21,-75.588043212891,-827.19732666016,243.38575744629-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)
					DrawMarker(21,-76.75919342041,-830.13299560547,243.38575744629-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)

					DrawMarker(21,-1065.46, -2797.94, 27.71-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)

					DrawMarker(21,-72.78, -816.02, 243.39-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4, 255,50,0,90,0,0,0,1)
				
				end
				
				if GetDistanceBetweenCoords(v.positionTo[1],v.positionTo[2],v.positionTo[3],x,y,z,true) <= 1.2 then
					ORTiming = 4
					if IsControlJustPressed(0,38) then
						DoScreenFadeOut(1000)
						SetTimeout(2000,function()
							SetEntityCoords(ped,v.positionFrom[1]+0.0001,v.positionFrom[2]+0.0001,v.positionFrom[3]+0.0001-0.50,1,0,0,1)
							Citizen.Wait(750)
							DoScreenFadeIn(1000)
						end)
					end
				end
			end
		end
		Citizen.Wait(ORTiming)
	end
end)

