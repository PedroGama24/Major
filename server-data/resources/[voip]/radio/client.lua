local Tunnel = module('vrp','lib/Tunnel')
local Proxy = module('vrp','lib/Proxy')
vRP = Proxy.getInterface('vRP')
vSERVER = Tunnel.getInterface('radio')

---
local privateChannel = {
  {channel = 1, perm = "admin.permissao"},
  {channel = 190, perm = "policia.permissao"},
  {channel = 191, perm = "policia.permissao"},
  {channel = 192, perm = "paramedico.permissao"},
  {channel = 193, perm = "paramedico.permissao"},
  {channel = 443, perm = "mecanico.permissao"},
}

local GuiOpened = false

RegisterCommand("radio", function() if vSERVER.hasRadio() then--
    openGui()
       else

  TriggerEvent("Notify","negado","Você não possui um rádio.")
  end
  Wait(1)
end)

RegisterNetEvent('radioGui')
AddEventHandler('radioGui', function()
  if vSERVER.hasRadio() then
    openGui()
  else

   TriggerEvent("Notify","negado","Você não possui um rádio.")
  end
  Wait(1)
end)

-- --------------------------------------------------------------------------------------------------------------------------------
-- -- CHANGEVOLUME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("changevolume", function(data,cb)
	if parseInt(data["volume"]) ~= radioVolume then 
		radioVolume = parseInt(data["volume"])
		exports["pma-voice"]:setRadioVolume(parseInt(radioVolume))
	end
end)

function checkPermission(data)
  if privateChannel then
    for k, v in pairs(privateChannel) do
      local selectedChannel = tonumber(data) or nil
      if selectedChannel then
        if tonumber(v.channel) == selectedChannel then
          if not vSERVER.hasPermission(v.perm) then
          TriggerEvent("Notify","negado","Você não tem permissão para entrar nessa frequencia.")
            return false
          end
        end
      end
    end
  end
  return true
end

function openGui()
  if not GuiOpened then
    GuiOpened = true
    SetNuiFocus(true,true)
  	radioShow = true
	  SendNUIMessage({ show = true })
  else
    GuiOpened = false
    SetNuiFocus(false,false)
    radioShow = false
    SendNUIMessage({ show = false })
  end
   vRP._CarregarObjeto("cellphone@","cellphone_text_in","prop_cs_hand_radio",50,28422)
  --ExecuteCommand("hud")
end


RegisterNUICallback('click', function(data, cb)
  PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEFREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("activeFrequency", function(data,cb)
	local frequency = parseInt(data["freq"])
	if checkPermission(frequency) then
		exports["pma-voice"]:setRadioChannel(frequency)
		exports["pma-voice"]:setVoiceProperty('radioEnabled',true)
		-- TriggerEvent("hud:RadioDisplay",parseInt(frequency))
		TriggerEvent('hud:channel',parseInt(frequency))
    TriggerEvent("hud:RadioDisplay",frequency)
		TriggerEvent("Notify","aviso","Conectado <b>"..frequency..".00</b> MHz.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INATIVEFREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("inativeFrequency", function(data,cb)
	local frequency = parseInt(data["freq"])
	exports["pma-voice"]:removePlayerFromRadio()
	-- TriggerEvent("hud:RadioDisplay","")
	TriggerEvent('hud:channel',"N.A")
  
	TriggerEvent("Notify","aviso","Desconectado")
  TriggerEvent("hud:RadioDisplay",false)
end)

RegisterNUICallback('closeRadio', function(data, cb)
  TriggerEvent("InteractSound_CL:PlayOnOne","radioclick",0.6)
  GuiOpened = false
  SetNuiFocus(false,false)
  SendNUIMessage({ show = false })
  TriggerEvent("animation:radio",GuiOpened)
  vRP._DeletarObjeto()
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTSERVERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_radio:outServers")
AddEventHandler("vrp_radio:outServers",function()
	exports["pma-voice"]:removePlayerFromRadio()
	exports["pma-voice"]:setVoiceProperty('radioEnabled',false)
	TriggerEvent('hud:channel','N.A')
end)

Citizen.CreateThread(function()

  while GuiOpened do
    -- if GuiOpened then
      Citizen.Wait(1)
      DisableControlAction(0, 1, GuiOpened) -- LookLeftRight
      DisableControlAction(0, 2, GuiOpened) -- LookUpDown
      DisableControlAction(0, 14, GuiOpened) -- INPUT_WEAPON_WHEEL_NEXT
      DisableControlAction(0, 15, GuiOpened) -- INPUT_WEAPON_WHEEL_PREV
      DisableControlAction(0, 16, GuiOpened) -- INPUT_SELECT_NEXT_WEAPON
      DisableControlAction(0, 17, GuiOpened) -- INPUT_SELECT_PREV_WEAPON
      DisableControlAction(0, 99, GuiOpened) -- INPUT_VEH_SELECT_NEXT_WEAPON
      DisableControlAction(0, 100, GuiOpened) -- INPUT_VEH_SELECT_PREV_WEAPON
      DisableControlAction(0, 115, GuiOpened) -- INPUT_VEH_FLY_SELECT_NEXT_WEAPON
      DisableControlAction(0, 116, GuiOpened) -- INPUT_VEH_FLY_SELECT_PREV_WEAPON
      DisableControlAction(0, 142, GuiOpened) -- MeleeAttackAlternate
      DisableControlAction(0, 106, GuiOpened) -- VehicleMouseControlOverride
    -- else
    --   Citizen.Wait(20)
    -- end    
  end
end)

RegisterNetEvent('animation:radio')
AddEventHandler('animation:radio', function(enable)
  local lPed = PlayerPedId()
  inPhone = enable

  RequestAnimDict("cellphone@")
  while not HasAnimDictLoaded("cellphone@") do
    Citizen.Wait(0)
  end

  local intrunk = false
  if not intrunk then
    TaskPlayAnim(lPed, "cellphone@", "cellphone_text_in", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
  end
  Citizen.Wait(300)
  if inPhone then
    Citizen.Wait(150)
    while inPhone do

      local dead = false
      if dead then
        closeGui()
        inPhone = false
      end
      local intrunk = false
      if not intrunk and not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_text_read_base", 3) and not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_swipe_screen", 3) then
        TaskPlayAnim(lPed, "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
      end    
      Citizen.Wait(1)
    end
    local intrunk = false
    if not intrunk then
      ClearPedTasks(PlayerPedId())
    end
  else
    local intrunk = false
    if not intrunk then
      Citizen.Wait(100)
      ClearPedTasks(PlayerPedId())
      TaskPlayAnim(lPed, "cellphone@", "cellphone_text_out", 2.0, 1.0, 5.0, 49, 0, 0, 0, 0)
      Citizen.Wait(400)
      Citizen.Wait(400)
      ClearPedTasks(PlayerPedId())
    end
  end
end)

RegisterCommand("volume",function(source,args)
  if tonumber(args[1]) <= 100 and tonumber(args[1]) >= 10 then
      local volume = tonumber(args[1])
      exports["pma-voice"]:setRadioVolume(volume/100)
 -- TriggerEvent("nyo_notify", "#009933", "Sucesso", "<b>Volume:</b> "..volume.."%", 4000)
  TriggerEvent("Notify","sucesso","<b>Volume:</b> "..volume.."%")
  end
end)