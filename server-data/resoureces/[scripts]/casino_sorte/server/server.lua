local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

isRoll = false
amount = 4000
-- 
RegisterServerEvent('casino_luckywheel:getLucky')
AddEventHandler('casino_luckywheel:getLucky', function()
    local source = source
    local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	--local ticket = vRP.getInventoryItemAmount(user_id,"ticketrol")
	TriggerClientEvent("invarte", player)
    if not isRoll then
        if user_id ~= nil then
			if vRP.tryGetInventoryItem(user_id,"ticketroleta",1,true) then
          --  if ticket >= amount then
           --     vRP.tryGetInventoryItem(user_id,"ticketrol",amount)
				-- spin the wheel
                isRoll = true
                local _randomPrice = math.random(1,100)
				
				if _randomPrice == 1 then
				local _subRan = math.random(1,10)
                    if _subRan == 1 then
                        _priceIndex = 1 -- win car
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
						_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 11 -- loose
                end
				elseif _randomPrice > 1 and _randomPrice <= 6 then
				local _subRan = math.random(1,4)
                    if _subRan == 1 then
                        _priceIndex = 2 -- win
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
							_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 12 -- loose
                end
				elseif _randomPrice > 6 and _randomPrice <= 15 then
				local _subRan = math.random(1,4)
                    if _subRan == 1 then
                        _priceIndex = 3 -- win
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
							_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 11 -- loose
                end
				elseif _randomPrice > 15 and _randomPrice <= 25 then
				local _subRan = math.random(1,4)
                    if _subRan == 1 then
                        _priceIndex = 4 -- win
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
							_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 11 -- loose
                end
				elseif _randomPrice > 25 and _randomPrice <= 40 then
				local _subRan = math.random(1,4)
                    if _subRan == 1 then
                        _priceIndex = 5 -- win
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
							_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 12 -- loose
                end
				elseif _randomPrice > 40 and _randomPrice <= 60 then
				local _subRan = math.random(1,4)
                    if _subRan == 1 then
                        _priceIndex = 6 -- win
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
							_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 11 -- loose
                end
				elseif _randomPrice > 60 and _randomPrice <= 100 then
				local _subRan = math.random(1,4)
                    if _subRan == 1 then
                        _priceIndex = 7 -- win
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
							_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 11 -- loose
                end
				elseif _randomPrice > 60 and _randomPrice <= 100 then
				local _subRan = math.random(1,4)
                    if _subRan == 1 then
                        _priceIndex = 8 -- win
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
							_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 11 -- loose
                end
				elseif _randomPrice > 60 and _randomPrice <= 100 then
				local _subRan = math.random(1,4)
                    if _subRan == 1 then
                        _priceIndex = 9 -- win
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
							_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 11 -- loose
                end
				elseif _randomPrice > 60 and _randomPrice <= 100 then
				local _subRan = math.random(1,4)
                    if _subRan == 1 then
                        _priceIndex = 10 -- win
					elseif _subRan == 4 then
						local final = math.random(1,5)
						if final == 1 then
							_priceIndex = 12
						else
						_priceIndex = 11 -- loose
						end
                    else
                        _priceIndex = 11 -- loose
                end
				end
				-- prize index
                SetTimeout(2000, function()
                    isRoll = false
                    if _priceIndex == 1 then
                    local source = source
	                local user_id = vRP.getUserId(source)
					local vehicle = "sultanrs"
					vRP.execute("creative/add_vehicle",{ user_id = parseInt(user_id), vehicle = vehicle, ipva = parseInt(os.time()) }) 

					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou um Sultan RS!",5500)

					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou um Tesla Prior!',
					--	duration = 5500,
					--	sound  =  false
					--})
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CAR', 0.1)
                    elseif _priceIndex == 2 then
					vRP.giveInventoryItem(user_id,"ficha",50)
					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou 50 fichas!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou 1000 fichas!',
					--	duration = 5500,
					--	sound  =  false
					--})
                    TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)					
					elseif _priceIndex == 3 then
					vRP.giveInventoryItem(user_id,"ficha",100)
					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou 100 fichas!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou 2000 fichas!',
					--	duration = 5500,
					--	sound  =  false
					--})
                    TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)					
					elseif _priceIndex == 4 then
					vRP.giveInventoryItem(user_id,"ficha",150)
					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou 150 fichas!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou 5000 fichas!',
					--	duration = 5500,
					--	sound  =  false
					--})				
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
					elseif _priceIndex == 5 then
					vRP.giveInventoryItem(user_id,"ficha",300)
					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou 300 fichas!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou 8,000 fichas!',
					--	duration = 5500,
					--	sound  =  false
					--})					
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
					elseif _priceIndex == 6 then
					vRP.giveInventoryItem(user_id,"ficha",500)
					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou 500 fichas!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou 10,000 fichas!',
					--	duration = 5500,
					--	sound  =  false
					--})				
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
					elseif _priceIndex == 7 then
					vRP.giveBankMoney(user_id,30000)
					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou R$ 30,000!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou R$ 30,000!',
					--	duration = 5500,
					--	sound  =  false
					--})					
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CASH', 0.1)
					elseif _priceIndex == 8 then
					vRP.giveBankMoney(user_id,50000)
					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou R$ 50,000!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou R$ 50,000!',
					--	duration = 5500,
					--	sound  =  false
					--})					
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CASH', 0.1)
					elseif _priceIndex == 9 then
					vRP.giveBankMoney(user_id,100000)
					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou R$ 100,000!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou R$ 200,000!',
					--	duration = 5500,
					--	sound  =  false
					--})					
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CASH', 0.1)
					elseif _priceIndex == 10 then
					vRP.giveBankMoney(user_id,250000)
					TriggerClientEvent("Notify",source,"importante","Você ganhou: Parabéns você ganhou R$ 250,000!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'success',
					--	message = 'Você ganhou: Parabéns você ganhou R$ 500,000!',
					--	duration = 5500,
					--	sound  =  false
					--})
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_STEREO_WIN_STINGER_GENERAL', 0.1)
					elseif _priceIndex == 11 then
					TriggerClientEvent("Notify",source,"importante","Você perdeu: Por favor, tente novamente!",5500)
					--TriggerClientEvent('t-notify:client:Custom', source, {
					--	style = 'error',
					--	message = 'Você perdeu: Por favor, tente novamente!',
					--	duration = 5500,
					--	sound  =  false
					--})
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'TD_NO_WIN_03', 0.1)
					elseif _priceIndex == 12 then
						TriggerClientEvent("Notify",source,"importante","Você perdeu: Por favor, tente novamente!",5500)
						
                    end
                    TriggerClientEvent("casino_luckywheel:rollFinished", -1)
                end)
                TriggerClientEvent("casino_luckywheel:doRoll", -1, _priceIndex)
            else
                TriggerClientEvent("casino_luckywheel:rollFinished", -1)
				TriggerClientEvent("Notify",source,"importante","Infelizmente você não tem mais Ticket!",5500)
				--TriggerClientEvent('t-notify:client:Custom', source, {
				--	style = 'error',
				--	message = 'Infelizmente você não tem mais Ticket!',
				--	duration = 5500,
				--	sound  =  true
				--})
            end
        end
    end
end)