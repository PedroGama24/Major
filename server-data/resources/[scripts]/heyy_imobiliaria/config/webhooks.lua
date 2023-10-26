Webhooks = {}

local webhooksUrls = {
	buySellWebhook = "",
	invadeWebhook = "",
	stealWebhook = "",
	lostWebhook = "",
}

-- (PT) Webhook comprar/vender casa
-- (EN) Webhook buy/sell house
function Webhooks.sendBuySellWebhook(user_id, identity, homeName, price, bought)
	local action = "Comprada"
	local image = "https://i.imgur.com/UNl41CN.png"
	if bought == "sell" then
		action = "Vendida"
		image = "https://iconutopia.com/wp-content/uploads/2017/04/hero1.png"
	elseif bought == "tax" then
		action = "Taxa paga"
		image = "https://image.flaticon.com/icons/png/512/829/829464.png"
	end
	
	PerformHttpRequest(webhooksUrls.buySellWebhook, function(err, text, headers) end, 'POST', json.encode({
		embeds = {
			{ 
				title = "Casas - " .. action,
				thumbnail = {
					url = tostring(image)
				}, 
				fields = {
					{
						name = "👦 ID:",
						value = user_id .. " » " .. identity.name .. " " .. identity.firstname
					},
					{
						name = "🏠 Casa:",
						value = tostring(homeName)
					},
					{
						name = "💰 Valor:",
						value = "$" .. vRP.format(price)
					}
				}, 
				footer = { 
					text = GetCurrentResourceName() .. " - "..os.date("%d/%m/%Y | %H:%M:%S")
				},
				color = 3092790 
			}
		}
	}), { ['Content-Type'] = 'application/json' })
end

-- (PT) Webhook vender para outro jogador
-- (EN) Webhook sell house to another player
function Webhooks.sellToPlayer(sellerID, sellerIdentity, buyID, buyIdentity, houseName, price)
	PerformHttpRequest(webhooksUrls.buySellWebhook, function(err, text, headers) end, 'POST', json.encode({
		embeds = {
			{ 
				title = "Casas - Vendida para jogador",
				thumbnail = {
					url = "https://iconutopia.com/wp-content/uploads/2017/04/hero1.png"
				}, 
				fields = {
					{
						name = "👦 ID:",
						value = sellerID .. " » " .. sellerIdentity.name .. " " .. sellerIdentity.firstname
					},
					{
						name = "👦 Vendeu para:",
						value = buyID .. " » " .. buyIdentity.name .. " " .. buyIdentity.firstname
					},
					{
						name = "🏠 Casa:",
						value = tostring(houseName)
					},
					{
						name = "💰 Valor:",
						value = "$" .. vRP.format(price)
					}
				}, 
				footer = { 
					text = GetCurrentResourceName() .. " - "..os.date("%d/%m/%Y | %H:%M:%S")
				},
				color = 3092790 
			}
		}
	}), { ['Content-Type'] = 'application/json' })
end

-- (PT) Webhook ao invadir casa
-- (EN) Webhook when invade house
function Webhooks.sendInvadeWebhook(user_id, identity, homeName)
	PerformHttpRequest(webhooksUrls.invadeWebhook, function(err, text, headers) end, 'POST', json.encode({
		embeds = {
			{ 
				title = "Casas - Invadida:\n⠀",
				thumbnail = {
					url = "https://image.flaticon.com/icons/png/512/4073/4073816.png"
				}, 
				fields = {
					{
						name = "👮‍♂️ ID:",
						value = user_id .. " » " .. identity.name .. " " .. identity.firstname
					},
					{
						name = "🏠 Casa:",
						value = tostring(homeName)
					}
				}, 
				footer = { 
					text = GetCurrentResourceName() .. " - "..os.date("%d/%m/%Y | %H:%M:%S")
				},
				color = 3092790 
			}
		}
	}), { ['Content-Type'] = 'application/json' })
end


-- (PT) Webhook ao roubar casa
-- (EN) Webhook on house steal
-- policeWarned TRUE = polícia avisada, policeWarned FALSE = polícia não avisada
function Webhooks.sendStealWebhook(user_id, identity, homeName, policeWarned)
	local policeMessage = "Não, a polícia não foi avisada"
	if policeWarned then
		policeMessage = "Sim, a polícia foi avisada" 
	end

	PerformHttpRequest(webhooksUrls.stealWebhook, function(err, text, headers) end, 'POST', json.encode({
		embeds = {
			{ 
				title = "Casas - Roubada:\n⠀",
				thumbnail = {
					url = "https://cdn.iconscout.com/icon/free/png-256/thief-1659457-1409979.png"
				}, 
				fields = {
					{
						name = "🐱‍👤 ID:",
						value = user_id .. " » " .. identity.name .. " " .. identity.firstname
					},
					{
						name = "🏠 Casa:",
						value = tostring(homeName)
					},
					{
						name = "⚠ Polícia avisada?",
						value = tostring(policeMessage)
					}
				}, 
				footer = { 
					text = GetCurrentResourceName() .. " - "..os.date("%d/%m/%Y | %H:%M:%S")
				},
				color = 3092790 
			}
		}
	}), { ['Content-Type'] = 'application/json' })
end

-- (PT) Webhook ao roubar casa (INTERAGIR COM BLIP NO INTERIOR)
-- (EN) Webhook on house steal (INTERACT WITH INSIDE BLIP)
-- policeWarned TRUE = polícia avisada, policeWarned FALSE = polícia não avisada
function Webhooks.sendStealInteractWebhook(user_id, identity, homeName, policeWarned, item, amount)
	local policeMessage = "Não, a polícia não foi avisada"
	if policeWarned then
		policeMessage = "Sim, a polícia foi avisada" 
	end

	PerformHttpRequest(webhooksUrls.stealWebhook, function(err, text, headers) end, 'POST', json.encode({
		embeds = {
			{ 
				title = "Casas - Roubada:\n⠀",
				thumbnail = {
					url = "https://cdn.iconscout.com/icon/free/png-256/thief-1659457-1409979.png"
				}, 
				fields = {
					{
						name = "🐱‍👤 ID:",
						value = user_id .. " » " .. identity.name .. " " .. identity.firstname
					},
					{
						name = "🏠 Casa:",
						value = tostring(homeName)
					},
					{
						name = "⚠ Polícia avisada?",
						value = tostring(policeMessage)
					},
					{
						name = "📦 Item recebido",
						value = amount .. "x " .. Functions.getItemName(item)
					},
				}, 
				footer = { 
					text = GetCurrentResourceName() .. " - "..os.date("%d/%m/%Y | %H:%M:%S")
				},
				color = 3092790 
			}
		}
	}), { ['Content-Type'] = 'application/json' })
end


-- (PT) Webhook ao perder a casa por falta de pagamento de taxa
-- (EN) Webhook on lost house by pendent taxs
function Webhooks.sendLostByTaxWebhook(homeName, user_id, lastPaid)
	PerformHttpRequest(webhooksUrls.lostWebhook, function(err, text, headers) end, 'POST', json.encode({
		embeds = {
			{ 
				title = "Casas - Perdida:\n⠀",
				thumbnail = {
					url = "https://freeiconshop.com/wp-content/uploads/edd/minus-flat.png"
				}, 
				fields = {
					{
						name = "🏠 Casa:",
						value = tostring(homeName)
					},
					{
						name = "👦 Dono",
						value = tostring(user_id)
					},
					{
						name = "⚠ Último pagamento da taxa",
						value = tostring((lastPaid * 1000))
					}
				}, 
				footer = { 
					text = GetCurrentResourceName() .. " - "..os.date("%d/%m/%Y | %H:%M:%S")
				},
				color = 3092790 
			}
		}
	}), { ['Content-Type'] = 'application/json' })
end