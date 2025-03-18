-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
will = {}
Tunnel.bindInterface("will_garages",will)
vSERVER = Tunnel.getInterface("will_garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local GaragesTable = Config.garages
local nearestGarages = {}
local inGarage = false
local inAction = false
local renderVehicles = {}
local VehiclesOut = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------

local function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end

local function CountTable(tab)
    local i = 0
    for _,_ in pairs(tab) do i = i + 1 end
    return i
end

local function isEmptyTable(tab)
    if type(tab) ~= "table" then return false end
    if not next(tab) then return true end
    return false
end

local function deepCopy(table)
	local final_table = {}
	for k, v in pairs(table) do
		if type(v) == "table" then
			v = deepCopy(v)
		end
		final_table[k] = v
	end
	return final_table
end

function table.clone(table)
	return deepCopy(table)
end

local function requestingCollision(x,y,z)
    RequestCollisionAtCoord(x,y,z)
    while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
        RequestCollisionAtCoord(x,y,z)
        Citizen.Wait(10)
    end
end

local function loadModel(modelo,cb)
    Citizen.CreateThread(function()
        if not IsModelInCdimage(modelo) then 
            print("Model vehicle ("..tostring(modelo)..") it was not found.")
            cb(false) return
        end
        RequestModel(modelo)
        local i = 0
        while not HasModelLoaded(modelo) and i < 20000 do
            i = i + 1
            RequestModel(modelo)
            Citizen.Wait(10)
        end
        if i >= 20000 then cb(false) return end
        cb(true) return
    end)
end

local function checkBlackList(garageIndex,vehicle)
    if Config.blacklist[garageIndex] then
        for k,v in pairs(Config.blacklist[garageIndex]) do
            if v == vehicle then
                return false
            end
        end
    end
    if Config.exclusive_vehicles[garageIndex] then
        for k,v in pairs(Config.exclusive_vehicles[garageIndex]) do
            if v == vehicle then
                return true
            end
        end
    else
        return true
    end
end

local function reqControl(entity) NetworkRequestControlOfEntity(entity) cpt = 0 while not (NetworkHasControlOfEntity(entity)) do Wait(0) NetworkRequestControlOfEntity(entity) cpt = cpt +1 if cpt > 50 then break; end end end

local function HasVehClosestFromCoords(x,y,z,range)
    local handle, veh = FindFirstVehicle()
    local pointSpawn = vec3(x,y,z)
    local success
    repeat
        local pos = GetEntityCoords(veh)
        local distance = Vdist2(pointSpawn, pos, true)
        if distance <= range then
            EndFindVehicle(handle)
            return true
        end
    success, veh = FindNextVehicle(handle)
    until not success
    EndFindVehicle(handle)
    return false
end

--######################--
--## APLICAR TUNAGEM ###--
--######################--

local function vehicleMods(veh,custom)
	if custom and veh then
		SetVehicleModKit(veh,0)
		if custom.color then
			SetVehicleColours(veh,tonumber(custom.color[1]),tonumber(custom.color[2]))
			SetVehicleExtraColours(veh,tonumber(custom.extracolor[1]),tonumber(custom.extracolor[2]))
		end
		
		if custom.customPcolor then
			SetVehicleCustomPrimaryColour(veh,custom.customPcolor[1],custom.customPcolor[2],custom.customPcolor[3])
		end

		if custom.customScolor then
			SetVehicleCustomSecondaryColour(veh,custom.customScolor[1],custom.customScolor[2],custom.customScolor[3])
		end

		if custom.smokecolor then
			ToggleVehicleMod(veh,20,true)
			SetVehicleTyreSmokeColor(veh,tonumber(custom.smokecolor[1]),tonumber(custom.smokecolor[2]),tonumber(custom.smokecolor[3]))
		end

		if custom.neon then
			SetVehicleNeonLightEnabled(veh,0,true)
			SetVehicleNeonLightEnabled(veh,1,true)
			SetVehicleNeonLightEnabled(veh,2,true)
			SetVehicleNeonLightEnabled(veh,3,true)
			SetVehicleNeonLightsColour(veh,tonumber(custom.neoncolor[1]),tonumber(custom.neoncolor[2]),tonumber(custom.neoncolor[3]))
		else
			SetVehicleNeonLightEnabled(veh,0,false)
			SetVehicleNeonLightEnabled(veh,1,false)
			SetVehicleNeonLightEnabled(veh,2,false)
			SetVehicleNeonLightEnabled(veh,3,false)
		end

		if custom.xenoncolor then
			ToggleVehicleMod(veh,22,true)
			SetVehicleXenonLightsColour(veh,tonumber(custom.xenoncolor))
		end

		if custom.plateindex then
			SetVehicleNumberPlateTextIndex(veh,tonumber(custom.plateindex))
		end

		if custom.windowtint then
			SetVehicleWindowTint(veh,tonumber(custom.windowtint))
		end

		--if custom.bulletProofTyres >= 0 then
			SetVehicleTyresCanBurst(veh,custom.bulletProofTyres)
		--end

		if custom.wheeltype then
			SetVehicleWheelType(veh,tonumber(custom.wheeltype))
		end
		if custom.mods then
			SetVehicleMod(veh,0,custom.mods["0"].mod)
			SetVehicleMod(veh,1,custom.mods["1"].mod)
			SetVehicleMod(veh,2,custom.mods["2"].mod)
			SetVehicleMod(veh,3,custom.mods["3"].mod)
			SetVehicleMod(veh,4,custom.mods["4"].mod)
			SetVehicleMod(veh,5,custom.mods["5"].mod)
			SetVehicleMod(veh,6,custom.mods["6"].mod)
			SetVehicleMod(veh,7,custom.mods["7"].mod)
			SetVehicleMod(veh,8,custom.mods["8"].mod)
			SetVehicleMod(veh,10,custom.mods["10"].mod)
			SetVehicleMod(veh,11,custom.mods["11"].mod)
			SetVehicleMod(veh,12,custom.mods["12"].mod)
			SetVehicleMod(veh,13,custom.mods["13"].mod)
			SetVehicleMod(veh,14,custom.mods["14"].mod)
			SetVehicleMod(veh,15,custom.mods["15"].mod)
			SetVehicleMod(veh,16,custom.mods["16"].mod)
			SetVehicleMod(veh,23,custom.mods["23"].mod,custom.mods["23"].variation)
			SetVehicleMod(veh,24,custom.mods["24"].mod,custom.mods["24"].variation)
			SetVehicleMod(veh,25,custom.mods["25"].mod)
			SetVehicleMod(veh,26,custom.mods["26"].mod)
			SetVehicleMod(veh,27,custom.mods["27"].mod) 
			SetVehicleMod(veh,28,custom.mods["28"].mod)
			SetVehicleMod(veh,29,custom.mods["29"].mod)
			SetVehicleMod(veh,30,custom.mods["30"].mod)
			SetVehicleMod(veh,31,custom.mods["31"].mod)
			SetVehicleMod(veh,32,custom.mods["32"].mod)
			SetVehicleMod(veh,33,custom.mods["33"].mod)
			SetVehicleMod(veh,34,custom.mods["34"].mod)
			SetVehicleMod(veh,35,custom.mods["35"].mod)
			SetVehicleMod(veh,36,custom.mods["36"].mod)
			SetVehicleMod(veh,37,custom.mods["37"].mod) 
			SetVehicleMod(veh,38,custom.mods["38"].mod)
			SetVehicleMod(veh,39,custom.mods["39"].mod)
			SetVehicleMod(veh,40,custom.mods["40"].mod)
			SetVehicleMod(veh,41,custom.mods["41"].mod)
			SetVehicleMod(veh,42,custom.mods["42"].mod)
			SetVehicleMod(veh,43,custom.mods["43"].mod)
			SetVehicleMod(veh,44,custom.mods["44"].mod)
			SetVehicleMod(veh,45,custom.mods["45"].mod)
			SetVehicleMod(veh,46,custom.mods["46"].mod)
			SetVehicleMod(veh,48,custom.mods["48"].mod)

			ToggleVehicleMod(veh,18,custom.mods["18"].mod)
		end
    end
end

local function applyModifiesVeh(vehicle,engine,body,fuel,tuning,plate,doorsStats,winsStats,tyresStats,vname)
    if engine then SetVehicleEngineHealth(vehicle,engine+0.0) else SetVehicleEngineHealth(vehicle,1000.0) end
    if body then SetVehicleBodyHealth(vehicle,body+0.0) else SetVehicleBodyHealth(vehicle,1000.0) end
    if fuel then SetVehicleFuelLevel(vehicle,fuel+0.0) else SetVehicleFuelLevel(vehicle,100.0) end
    if plate and GetVehicleNumberPlateText(vehicle) ~= plate then 
        SetTimeout(1500,function() 
            SetVehicleNumberPlateText(vehicle,plate) 
            while GetVehicleNumberPlateText(vehicle) ~= plate do Wait(0) end
            SetTimeout(500,function() vSERVER._refreshOwnerVehicle(VehToNet(vehicle)) end)
            -- vSERVER.editOwnerPlate(VehToNet(vehicle),plate)
        end) 
    end
    if doorsStats ~= nil and type(doorsStats) == "table" then for k,v in pairs(doorsStats) do if v then SetVehicleDoorBroken(vehicle,parseInt(k),parseInt(v)) end end end
    if winsStats ~= nil and type(winsStats) == "table" then for k,v in pairs(winsStats) do if not v then SmashVehicleWindow(vehicle,parseInt(k)) end end end
    if vehTyres ~= nil and type(tyresStats) == "table" then for k,v in pairs(tyresStats) do if v < 2 then SetVehicleTyreBurst(vehicle,parseInt(k),(v == 1),1000.01) end end end
    vehicleMods(vehicle,tuning)
end

local function spawnVeh(vname,plate,x,y,z,h,cb)
    Citizen.CreateThread(function()
        if not HasVehClosestFromCoords(x,y,z,0.25) then
            local hash = vname
            if type(vname) == "string" then hash = GetHashKey(vname) end
            local _bol
            loadModel(hash,function(data) _bol = data end)
            while type(_bol) == "nil" and inGarage do Wait(0) end
            if _bol and inGarage then
                local vehicle = CreateVehicle(hash,x,y,z+0.1,h,true,false)

                NetworkRegisterEntityAsNetworked(vehicle)
                while not NetworkGetEntityIsNetworked(vehicle) do
                    NetworkRegisterEntityAsNetworked(vehicle)
                    Citizen.Wait(1)
                end

                SetVehicleNumberPlateText(vehicle,plate)
                NetworkRegisterEntityAsNetworked(vehicle)
                SetEntityAsMissionEntity(vehicle,true,true)
                SetVehicleNeedsToBeHotwired(verhicle,false)
                SetVehicleOnGroundProperly(vehicle)
                SetVehRadioStation(vehicle,"OFF")
                -- SetVehicleDoorsLockedForAllPlayers(vehicle,false)
                SetVehicleDoorsLocked(vehicle,1)
                
                SetNetworkIdCanMigrate(VehToNet(vehicle),true)
                NetworkSetNetworkIdDynamic(VehToNet(vehicle),false)
                SetNetworkIdExistsOnAllMachines(VehToNet(vehicle),true)
                SetVehicleOnGroundProperly(vehicle)
                SetVehicleDoorsLocked(vehicle,1)
                SetModelAsNoLongerNeeded(hash)
                -- while not DoesEntityExist(vehicle) do Wait(0) end
                cb(VehToNet(vehicle)) return
            end
        end
        cb(false) return
    end)
end

local function rendernizeVehicles(vehList,_interiorConfig,flags)
    local createdInVaga = {}
    local inLoading = {}
    local function totalLoaded()
        local c=0
        for _,status in pairs(inLoading) do
            if status == 'created' or status == 'canceled' then
                c = c + 1
            end
        end
        return c
    end
    Citizen.CreateThread(function()
        repeat
            vSERVER.updateVehiclesInBucket(renderVehicles)
            Wait(1000)
        until (CountTable(vehList) == totalLoaded())
        vSERVER.updateVehiclesInBucket(renderVehicles)
    end)
    for _,_data in pairs(vehList) do
            if (_data.work and _data.work == "false") or (_data.work == nil) then
                if not VehiclesOut[flags.garage] or (VehiclesOut[flags.garage] and not VehiclesOut[flags.garage][_data.name]) then

                    local _garageConfig = GaragesTable[inGarage]
                    if (_garageConfig.interior and checkBlackList(_garageConfig.interior,_data.name) or _garageConfig.name and checkBlackList(_garageConfig.name,_data.name)) and _data.detido ~= 3 then
                    -- if checkBlackList(inGarage,flags.name) and _data.detido ~= 3 then
                        local checkSlot = CountTable(createdInVaga) + 1
                        createdInVaga[checkSlot] = true
                        inLoading[checkSlot] = 'started'
                        if checkSlot > flags.maxSlots then 
                            break
                        else
                            Citizen.CreateThread(function()
                                local x,y,z,h = _interiorConfig['spawns'][checkSlot][1],_interiorConfig['spawns'][checkSlot][2],_interiorConfig['spawns'][checkSlot][3],_interiorConfig['spawns'][checkSlot][4]
                                local _bol,nveh
                                spawnVeh(_data.name,vRP.getRegistrationNumber(),x,y,z,h,function(data)
                                    if data == false then
                                        _bol = false
                                    else
                                        _bol = true
                                        nveh = data
                                    end
                                end)
                                while type(_bol) == "nil" and type(nveh) == "nil" and inGarage do 
                                    DrawMarker(32, x,y,z+1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.25, 1.25, 1.25, 158, 52, 235, 150, false, true, 2, nil, nil, false)
                                    Wait(0) 
                                end
                                
                                if _bol and inGarage then
                                    inLoading[checkSlot] = 'created'
                                    if _data.detido and _data.detido ~= 0 then
                                        SetEntityAlpha(NetToVeh(nveh),200,false)
                                    end
                                    if not _data.inGarage then
                                        SetEntityAlpha(NetToVeh(nveh),50,false)
                                    end
                                    applyModifiesVeh(NetToVeh(nveh),_data.engine,_data.body,_data.fuel,_data.tuning,_data.plate,_data.vehDoors,_data.vehWindows,_data.vehTyres,_data.name)
                                    if nveh ~= nil then 
                                        if _data.inGarage then 
                                            table.insert(renderVehicles,{nveh = nveh,inGarage = inGarage}) 
                                        else
                                            table.insert(renderVehicles,{nveh = nveh,inGarage = false}) 
                                        end
                                    end
                                else
                                    inLoading[checkSlot] = 'canceled'
                                    createdInVaga[checkSlot] = nil
                                end
                            end)
                        end
                    end
                end
            end
    end
    
end

local function clearGarages(exceptNveh)
    for _id,_data in pairs(renderVehicles) do
        if NetworkDoesNetworkIdExist(_data.nveh) and _data.nveh ~= exceptNveh then

            if _data.inGarage then
                will.deleteVehicle(NetToVeh(_data.nveh),nil,_data.inGarage)
            else
                will.deleteVehicle(NetToVeh(_data.nveh),nil)
            end
            renderVehicles[_id] = nil
        end
    end
    if CountTable(renderVehicles) == 0 then renderVehicles = {} end
    vSERVER.updateVehiclesInBucket(renderVehicles)
end

local function exitGarages()
    if inGarage then
        DoScreenFadeOut(300)
        Citizen.Wait(300)
        local _id = inGarage
        inGarage = nil
        local _garageConfig = GaragesTable[_id]
        clearGarages()
        vSERVER.exitBucket()
        local x2,y2,z2
        if _garageConfig then
            if _garageConfig.entrada then
                x2,y2,z2 = _garageConfig.entrada['blip'][1],_garageConfig.entrada['blip'][2],_garageConfig.entrada['blip'][3]
            elseif type(_garageConfig[4]) == "string" then
                x2,y2,z2 = _garageConfig[1], _garageConfig[2], _garageConfig[3]
            elseif _garageConfig[1] then
                x2,y2,z2 = _garageConfig[1].x,_garageConfig[1].y,_garageConfig[1].z
            else
                x2,y2,z2 = 50.72,-874.15,30.43
            end
            SetEntityCoords(PlayerPedId(),x2,y2,z2)
            requestingCollision(x2,y2,z2)
            SetEntityCoords(PlayerPedId(),x2,y2,z2)
        end
        Citizen.Wait(400)
        DoScreenFadeIn(300)
    end
end

local function exitGarageWithVehicle(nveh)
    DoScreenFadeOut(300)
    Citizen.Wait(300)
    local _id = inGarage
    local _garageConfig = GaragesTable[_id]
    local _interiorConfig 
    if _garageConfig.interior then
        _interiorConfig = Config.interior_garages[_garageConfig.interior]
    else
        _interiorConfig = Config.interior_garages[_garageConfig.name]
    end
    clearGarages(nveh)
    vSERVER.exitBucket(nveh)
    local x2,y2,z2,h2
    if _garageConfig.saida then
        x2,y2,z2,h2 = _garageConfig.saida[1],_garageConfig.saida[2],_garageConfig.saida[3],_garageConfig.saida[4]
    elseif _garageConfig.entrada then
        x2,y2,z2,h2 = _garageConfig.entrada['veiculo'][1],_garageConfig.entrada['veiculo'][2],_garageConfig.entrada['veiculo'][3],_garageConfig.entrada['veiculo'][4]
    elseif type(_garageConfig[4]) == "string" then
        x2,y2,z2 = _garageConfig[1], _garageConfig[2], _garageConfig[3]
    elseif _garageConfig[1] then
        x2,y2,z2,h2 = _garageConfig[1].x,_garageConfig[1].y,_garageConfig[1].z,_garageConfig[1].h
    end
    if h2 == nil then h2 = 0.0 end
    DecorSetInt(NetToVeh(nveh),'rCollisionTime',GetNetworkTime()+Config.collision_stop['Time']*1000)
    SetEntityCoords(NetToVeh(nveh),x2,y2,z2)
    SetEntityHeading(NetToVeh(nveh),h2 or 0.0)
    requestingCollision(x2,y2,z2)
    SetEntityCoords(NetToVeh(nveh),x2,y2,z2)
    SetEntityHeading(NetToVeh(nveh),h2 or 0.0)
    SetPedIntoVehicle(PlayerPedId(),NetToVeh(nveh),-1)
    vSERVER._refreshOwnerVehicle(nveh)
    Citizen.Wait(400)
    DoScreenFadeIn(300)
    inGarage = nil
    SetTimeout(1000,function()
        SetPedIntoVehicle(PlayerPedId(),NetToVeh(nveh),-1)
        Citizen.CreateThread(function()
            local x2,y2,z2 = x2,y2,z2
            while #(GetEntityCoords(PlayerPedId()) - vec3(x2,y2,z2)) < Config.collision_stop['Distance'] and IsPedInAnyVehicle(PlayerPedId(),false) and DecorExistOn(GetVehiclePedIsIn(PlayerPedId(),false),'rCollisionTime') do
                Citizen.Wait(250) 
            end
            if NetworkDoesNetworkIdExist(nveh) then
                local ent = NetworkGetEntityFromNetworkId(nveh)
                if ent and DoesEntityExist(ent) then
                    if DecorExistOn(ent,'rCollisionTime') then
                        DecorRemove(ent,'rCollisionTime')
                    end
                end
            end
        end)
    end)

end

local function drawTxtS(x,y ,width,height,scale, text, r,g,b,a,flags)
    local _scale = {0.25,0.25}
    if type(scale) == "table" then _scale = {scale[1],scale[2]} else _scale = {scale,scale} end
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(_scale[1], _scale[2])
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    if not flags or flags and flags.font == nil then SetTextFont(7) else 
        if type(flags.font) == "string" then
            SetTextFont(exports['core_stream']:GetAddonFont(flags.font))
        else
            SetTextFont(flags.font) 
        end
    end
    if not flags or flags and flags.outline == nil or flags.outline == true then SetTextOutline() end
    if not flags or flags and flags.shadow == nil or flags.shadow == true then SetTextDropShadow(0, 0, 0, 0,255) end
    if flags and flags.justify then SetTextJustification(flags.justify) end
    DrawText(x - width/2, y - height/2 + 0.005)
end

local rad, cos, sin = math.rad, math.cos, math.sin
local function rotate(origin, point, theta)
  if theta == 0.0 then return point end

  local p = point - origin
  local pX, pY = p.x, p.y
  theta = rad(theta)
  local cosTheta = cos(theta)
  local sinTheta = sin(theta)
  local x = pX * cosTheta - pY * sinTheta
  local y = pX * sinTheta + pY * cosTheta
  return vector2(x, y) + origin
end

local _thread_inGarages = false
function thread_inGarages(enter_x,enter_y)
    if _thread_inGarages then return end
    _thread_inGarages = true
    local _id = inGarage
    local exitingBlip = false
    local _garageConfig = GaragesTable[_id]
    local _interiorConfig 
    if _garageConfig.interior then
        _interiorConfig = Config.interior_garages[_garageConfig.interior]
    else
        _interiorConfig = Config.interior_garages[_garageConfig.name]
    end
    local interiorId = GetInteriorAtCoords(_interiorConfig.saida['blip'][1],_interiorConfig.saida['blip'][2],_interiorConfig.saida['blip'][3])
    while interiorId == nil or interiorId == 0 or interiorId == '' or interiorId == "nil" do
        interiorId = GetInteriorAtCoords(_interiorConfig.saida['blip'][1],_interiorConfig.saida['blip'][2],_interiorConfig.saida['blip'][3])
        Wait(10)
    end
    local CenterPos,rotX,rotY,rotZ,rotW,minX,minY,minZ,maxX,maxY,maxZ
    if interiorId ~= parseInt(0) then
        minX, minY, minZ, maxX, maxY, maxZ = GetInteriorEntitiesExtents(interiorId)
        CenterPos = vec3((minX+maxX)/parseInt(2), (minY+maxY)/parseInt(2),(minZ+maxZ)/parseInt(2))
        rotX,rotY,rotZ,rotW = GetInteriorRotation(interiorId)
    end

    Citizen.CreateThread(function()
        local breakIt = false
        while _thread_inGarages and inGarage and not breakIt do
            --// VERIFY USE EXIT HIT BOX GARAGES
            local coords = GetEntityCoords(PlayerPedId())
            local rotatedPoint = rotate(CenterPos.xy, coords.xy, -(rotZ or parseInt(0)))
            local pX, pY, pZ = rotatedPoint.x, rotatedPoint.y, coords.z
            if pX < minX or pX > maxX or pY < minY or pY > maxY then breakIt = true end
            if (minZ and pZ < minZ) or (maxZ and pZ > maxZ) then breakIt = true end

            if not IsMinimapInInterior() then
                SetPlayerBlipPositionThisFrame(enter_x,enter_y)
                HideMinimapInteriorMapThisFrame()
            else
                SetRadarZoomToDistance(parseInt(200))
                HideMinimapExteriorMapThisFrame()
            end
            Wait(4)
        end
        if _thread_inGarages and inGarage and breakIt and not exitingBlip then exitGarages() end
    end)

    Citizen.CreateThread(function()
        while _thread_inGarages and inGarage do
            local idle = 1000
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)

            if GetEntityHealth(ped) <= 101 then exitingBlip = true exitGarages() end
            if IsPedInAnyVehicle(ped,false) or GetVehiclePedIsTryingToEnter(ped) ~= 0 then
                DisableControlAction(0,86,true)
                local veh = GetVehiclePedIsUsing(ped,false)
                idle = 4
                local alpha = GetEntityAlpha(veh)
                if alpha == 255 then
                    if IsDisabledControlPressed(0,86) and not inAction and GetPedInVehicleSeat(veh,-1) == ped then
                        inAction = true
                        exitingBlip = true
                        exitGarageWithVehicle(VehToNet(veh))
                        SetTimeout(1500,function() inAction = false end)
                    end
                elseif alpha == 50 then
                    if GetIsVehicleEngineRunning(veh) then SetVehicleEngineOn(veh,false,true,true) end
                    DisableAllControlActions(0)
                    EnableControlAction(0,0,true)
                    EnableControlAction(0,1,true)
                    EnableControlAction(0,2,true)
                    EnableControlAction(0,3,true)
                    EnableControlAction(0,4,true)
                    EnableControlAction(0,5,true)
                    EnableControlAction(0,6,true)
                    EnableControlAction(0,75,true)
                    if not inAction then
                        drawTxtS(0.485,0.95,0.0,0.0,0.4,"Veiculo em outra ~r~Garagem~w~.", 255, 255, 255, 255,{justify = 0, font = 4})
                    end
                else
                    if GetIsVehicleEngineRunning(veh) then SetVehicleEngineOn(veh,false,true,true) end
                    DisableAllControlActions(0)
                    EnableControlAction(0,0,true)
                    EnableControlAction(0,1,true)
                    EnableControlAction(0,2,true)
                    EnableControlAction(0,3,true)
                    EnableControlAction(0,4,true)
                    EnableControlAction(0,5,true)
                    EnableControlAction(0,6,true)
                    EnableControlAction(0,75,true)
                    if not inAction then
                        drawTxtS(0.485,0.5,0.0,0.0,0.5,"Veiculo ~r~Desmanchado~w~", 255, 255, 255, 255,{justify = 0, font = 4})
                        drawTxtS(0.485,0.95,0.0,0.0,0.4,"Pressione ~p~E~w~ para quita-lo.", 255, 255, 255, 255,{justify = 0, font = 4})
                    end
                    if IsDisabledControlPressed(0,86) and not inAction then
                        inAction = true
                        Citizen.CreateThread(function()
                            if vSERVER.paymentArrestVehicle(vRP.getVehicleNameFromHash(GetEntityModel(veh))) then
                                ResetEntityAlpha(veh)
                                SetVehicleEngineOn(veh,true,true,false)
                                SetTimeout(1500,function()
                                    inAction = false
                                end)
                            else
                                SetTimeout(1500,function()
                                    inAction = false
                                end)
                            end
                        end)
                    end
                end
            else
                local _coords = vec3(_interiorConfig.saida['blip'][1],_interiorConfig.saida['blip'][2],_interiorConfig.saida['blip'][3])
                local dist = #(coords - _coords)
                if (dist < Config.blip_distance['Normal']) and (not IsPedInAnyVehicle(ped,false)) then
                    idle = 4
                    DrawText3D(_coords.x,_coords.y,_coords.z, Config.texts["Exit_garage"])
                    if IsControlJustPressed(1,38) and not inAction then
                        inAction = true
                        exitingBlip = true
                        exitGarages()
                        inAction = false
                    end
                end
            end
            Citizen.Wait(idle)
        end
        _thread_inGarages = false
    end)
end

-- FUNCTION DE ENTRAR NA GARAGEM
local function enterGarage(_id,veh,vehList)
    if inGarage then return end
    inGarage = _id
    local ped = PlayerPedId()
    local _garageConfig = GaragesTable[_id]
    local _interiorConfig 
    if _garageConfig.interior then
        _interiorConfig = Config.interior_garages[_garageConfig.interior]
    else
        _interiorConfig = Config.interior_garages[_garageConfig.name]
    end
    -- local _workConfig = Config.workgarage[_garageConfig.name]
    local teleportCoords
    local teleportHeading

    if not vehList or isEmptyTable(vehList) then
        vehList = vSERVER.myVehicles(_id) or {}
    else
        local vehicles_service = vehList
        vehList = {}
        for k,v in pairs(vehicles_service) do
            table.insert(vehList,{ inGarage = true, name = v, vname = v, plate = nil, engine = 1000, body = 1000, fuel = 100, tuning = {} })
            -- vehList[k] = { name = v, vname = v, plate = nil, engine = 1000, body = 1000, fuel = 100, tuning = {} }
        end
        vehList = vSERVER.filterList(vehList)
    end
    local _garageConfig = GaragesTable[_id]
    for _vehId,_dataVeh in pairs(vehList) do
        if (_garageConfig.interior and not checkBlackList(_garageConfig.interior,_dataVeh.name) or _garageConfig.name and not checkBlackList(_garageConfig.name,_dataVeh.name)) then
            table.remove(vehList,_vehId)
        end 
    end


    local selected_Vehs = {}

    if vehList and CountTable(vehList) > CountTable(_interiorConfig['spawns']) then
        -- DESENHAR NUI
        local nui_vehList = {}

        
        local plate = vRP.getRegistrationNumber()
        for _id,data in pairs(vehList) do
            local vname = vRP.GetVehicleInfo(data.name)
            local _vname = (vname and vname.modelo) or data.name
            vehList[_id].vname = _vname

            table.insert(nui_vehList,data)
            if plate ~= nui_vehList[#nui_vehList].plate then 
                nui_vehList[#nui_vehList].vname2 = nui_vehList[#nui_vehList].vname
                nui_vehList[#nui_vehList].vname = nui_vehList[#nui_vehList].vname.." (Roubado)"
            end
            nui_vehList[#nui_vehList].name = nui_vehList[#nui_vehList].name.."#"..nui_vehList[#nui_vehList].plate
            nui_vehList[#nui_vehList].id = _id
        end
        
        local ending = false
        SetNuiFocus(true,true)
        SendNUIMessage({ action = "openMenu", vehicles = vehList, type = "myvehicles", imgDiret = Config.imgDiret })
        RegisterNUICallback("carsPicked",function(data,cb)
            SetNuiFocus(false,false)
            SendNUIMessage({ action = "closeMenu" })
            ending = true
            selected_Vehs = data.vehicles
        end)
        RegisterNUICallback("close",function(data,cb)
            SetNuiFocus(false,false)
            ending = "close"
        end)
        while not ending do Citizen.Wait(100) end
        UnregisterRawNuiCallback("carsPicked")
        UnregisterRawNuiCallback("close")
        if ending == "close" then
            return false
        end

        if #selected_Vehs > 0 then
            local _vehList = table.clone(vehList)
            vehList = {}
            for _,_vehicle in pairs(selected_Vehs) do
                for _id,_data in pairs(nui_vehList) do
                    if tonumber(_vehicle) == _id then 
                        table.insert(vehList, _vehList[_data.id] ) 
                        break 
                    end
                end
            end
        end
        for _id,_data in pairs(vehList) do
            local args = splitString(_data.name,'#')
            _data.name = args[1]
            if _data.vname2 then
                _data.vname = _data.vname2
                _data.vname2 = nil
            end
        end
    end
    Wait(1)
    local x2,y2,z2
    if _garageConfig.blip then
        x2,y2,z2 = _garageConfig.blip[1],_garageConfig.blip[2],_garageConfig.blip[3]
    elseif not _garageConfig.blip and _garageConfig.entrada then
        x2,y2,z2 = _garageConfig.entrada['blip'][1],_garageConfig.entrada['blip'][2],_garageConfig.entrada['blip'][3]
    elseif _garageConfig[1] then
        x2,y2,z2 = _garageConfig[1].x,_garageConfig[1].y,_garageConfig[1].z
    end

    if veh and DoesEntityExist(veh) then
        -- ENTER IN GARAGE WITH VEHICLE
        ped = veh
        teleportCoords = vec3(_interiorConfig.saida['veiculo'][1],_interiorConfig.saida['veiculo'][2],_interiorConfig.saida['veiculo'][3])
        teleportHeading = _interiorConfig.saida['veiculo'][4]
        vSERVER.SetVehicleInGarage(VehToNet(veh),_id)
        vSERVER.placeInNewBucket(VehToNet(veh),vec3(x2,y2,z2))

        local nveh = VehToNet(veh)
        renderVehicles = {}

        table.insert(renderVehicles,{nveh = VehToNet(veh), inGarage = _id})
    else
        -- ENTER IN GARAGE WITHOUT VEHICLE
        teleportCoords = vec3(_interiorConfig.saida['blip'][1],_interiorConfig.saida['blip'][2],_interiorConfig.saida['blip'][3])
        vSERVER.placeInNewBucket({},vec3(x2,y2,z2))
    end
    local flags = {}
    flags.name = _garageConfig.name
    flags.maxSlots = CountTable(_interiorConfig['spawns'])
    if Config.workgarage[_garageConfig.name] then flags.garage = _garageConfig 
    else
        flags.garage = "personal"
    end
    DoScreenFadeOut(300)
	Citizen.Wait(300)
    requestingCollision(table.unpack(teleportCoords))
    SetEntityCoordsNoOffset(ped,teleportCoords + vec3(0.0,0.0,0.1),0,0,1)
    if teleportHeading then SetEntityHeading(ped,teleportHeading) end
    rendernizeVehicles(vehList,_interiorConfig,flags)

    thread_inGarages(teleportCoords.x,teleportCoords.y)
    Citizen.Wait(500)
    DoScreenFadeIn(400)
    return true
end

local function isServiceGarages(garageId)
    local _garageConfig = GaragesTable[garageId]
    if Config.workgarage[_garageConfig.name] then return true else return false end
end

local function isPublicGarages(garageId)
    local _garageConfig = GaragesTable[garageId]
    if not _garageConfig.interior and not Config.workgarage[_garageConfig.name] then 
        return true
    end
    return false
    -- if Config.workgarage[_garageConfig.name] then return true else return false end
end

local function isResidencialGaragesAndHasAccess(garageId)
    local _garageConfig = GaragesTable[garageId]
    if _garageConfig.interior and vSERVER.checkHasPermInHouse(_garageConfig.name) then
        return true
    end
    return false
end

-- FUNCTION DE DESENHAR A OPÇÃO DE ENTRAR (COM VEICULO)
local function enterDrawInVehicle(ped,veh,coords,_id,_data,vehList)
    local dist = #(vec3(_data.entrada['veiculo'][1],_data.entrada['veiculo'][2],_data.entrada['veiculo'][3]) - coords)
    if (dist <= Config.blip_distance['Normal'] ) then
        idle = 4
        DrawText3D(_data.entrada['veiculo'][1],_data.entrada['veiculo'][2],_data.entrada['veiculo'][3],Config.texts["Enter_garage"])
        DisableControlAction(0,86,true)
        if IsDisabledControlPressed(0,86) and not inAction and (isPublicGarages(_id) or isServiceGarages(_id) or isResidencialGaragesAndHasAccess(_id)) then
        -- if IsDisabledControlPressed(0,86) and not inAction and (not _data.interior or (_data.interior and (flags.garage == "personal" or vSERVER.checkHasPermInHouse(_data.name)) )) then
            inAction = true
            local veh = GetVehiclePedIsIn(ped,false)
            if not vSERVER.checkSearch() then
                if not _data.perm or vSERVER.checkPermission(_data.perm) then
                    if vehList == nil and vSERVER.isOwnerOrStoledVehicle(vRP.getVehicleNameFromHash(GetEntityModel(veh)),GetVehicleNumberPlateText(veh)) then
                        if not enterGarage(_id,veh,vehList) then inGarage = false end
                    else
                        if NetworkGetEntityIsNetworked(veh) then 
                            if vehList == nil then 
                                if vSERVER.requestStoledVehicle(vRP.getVehicleNameFromHash(GetEntityModel(veh)),GetVehicleNumberPlateText(veh)) then
                                    will.deleteVehicle(veh,nil,_id) 
                                    SetTimeout(500,function()
                                        TriggerEvent("Notify","sucesso","Você roubou o veiculo com sucesso!",5000)
                                    end)
                                else
                                    will.deleteVehicle(veh,nil,_id) 
                                    SetTimeout(500,function()
                                        TriggerEvent("Notify","sucesso","Você devolveu o veiculo com sucesso!",5000)
                                    end)
                                end
                            else 
                                will.deleteVehicle(veh,nil) 
                                SetTimeout(500,function()
                                    TriggerEvent("Notify","sucesso","Você devolveu o veiculo com sucesso!",5000)
                                end)
                            end
                        end
                        if not enterGarage(_id,nil,vehList) then inGarage = false end
                    end
                    
                end
            end
            SetTimeout(1500,function()
                inAction = false
            end)
        end
    end
end

-- FUNCTION DE DESENHAR A OPÇÃO DE ENTRAR (SEM VEICULO)
local function enterDrawOutVehicle(ped,coords,_id,_data,vehList)
    local _garageConfig = GaragesTable[_id]
    local flags = {}
    flags.name = _garageConfig.name
    -- flags.maxSlots = CountTable(_interiorConfig['spawns'])
    if Config.workgarage[_garageConfig.name] then flags.garage = _garageConfig 
    else
        flags.garage = "personal"
    end

    local dist,xyz
    if _data.blip and _data.blip[1] then
        dist,xyz = #(vec3(_data.blip[1],_data.blip[2],_data.blip[3]) - coords),vec3(_data.blip[1],_data.blip[2],_data.blip[3]) 
    elseif _data.entrada and _data.entrada['blip'] then
        dist,xyz = #(vec3(_data.entrada['blip'][1],_data.entrada['blip'][2],_data.entrada['blip'][3]) - coords),vec3(_data.entrada['blip'][1],_data.entrada['blip'][2],_data.entrada['blip'][3])
    elseif (_data.x and _data.y and _data.z) then
        dist,xyz = #(vec3(_data.x,_data.y,_data.z) - coords),vec3(_data.x,_data.y,_data.z) 
    end
    if (dist <= Config.blip_distance['Normal'] ) then
        idle = 4
        DrawText3D(xyz.x,xyz.y,xyz.z,Config.texts["Enter_garage"])
        if IsControlJustPressed(1,38) and not inAction and (isPublicGarages(_id) or isServiceGarages(_id) or isResidencialGaragesAndHasAccess(_id)) then
        -- if IsControlJustPressed(1,38) and not inAction and (not _data.interior or (_data.interior and (flags.garage ~= "nil" or vSERVER.checkHasPermInHouse(_data.name)) )) then
            inAction = true
            if not vSERVER.checkSearch() then
                if not _data.perm or vSERVER.checkPermission(_data.perm) then
                    if not enterGarage(_id,nil,vehList) then inGarage = false end
                end
            end
            SetTimeout(1500,function()
                inAction = false
            end)
        end
    end
end

-- FUNCTION DE DESENHAR A OPÇÃO DE INTERAGIR (GARAGEM SEM INTERIOR)
local function interactGarages(_id,_data,vehList,hasNPC,pessoalVehicles)
    if not vSERVER.checkSearch() and not _data.perm or vSERVER.checkPermission(_data.perm) and (not _data.payment or vSERVER.payGarage(_data.payment)) then

        local vehsService = {}

        if not pessoalVehicles then
            for k,v in pairs(vehList) do
                local _garageConfig = GaragesTable[inGarage]
                local vname = vRP.GetVehicleInfo(GetHashKey(v))
                vname = (vname and vname.modelo) or v
                vehsService[k] = { name = v, vname = vname }
            end
        else
            local plate = vRP.getRegistrationNumber()
            for k,v in pairs(vehList) do
                if v.inGarage then
                    table.insert(vehsService,v)
                    if plate ~= vehsService[#vehsService].plate then
                        vehsService[#vehsService].vname2 = vehsService[#vehsService].vname
                        vehsService[#vehsService].vname = vehsService[#vehsService].vname.." (Roubado)"
                    end
                    vehsService[#vehsService].id = k
                end
            end
        end
        local ending = false
        local selectedVeh
        SendNUIMessage({ action = "openMenu", vehicles = vehsService, type = "work", imgDiret = Config.imgDiret })
        SetNuiFocus(true,true)
        RegisterNUICallback("spawnVehicles",function(data)
            SendNUIMessage({ action = "closeMenu" })
            SetNuiFocus(false,false)
            ending = true
            local _sdata = vehList[tonumber(data.name)]
            if _sdata then 
                selectedVeh = {_sdata.name,_sdata.plate,data.name} 
            else 
                selectedVeh = {data.name} 
            end
        end)
        RegisterNUICallback("close",function(data,cb)
            SetNuiFocus(false,false)
            ending = "close"
        end)
        while not ending do Wait(100) end
        UnregisterRawNuiCallback("spawnVehicles")
        UnregisterRawNuiCallback("close")
        if ending == 'close' or not selectedVeh then return false end

        if not vSERVER.verifyIsHashOutGarages(GetHashKey(selectedVeh[1]),selectedVeh[2] or vRP.getRegistrationNumber()) then
            local selectedVehId = selectedVeh[3]
            selectedVeh = selectedVeh[1]
            if ending and selectedVeh then 
                inGarage = _id
                if hasNPC then
                    -- USING NPC
                else
                    -- DONT USING NPC
                    local _bol,nveh

                    if _data['Coords_to'] and _data['Coords_to'][1] then
                        if (type(_data['Coords_to'][1]) == 'number') then
                            local x,y,z,h = _data['Coords_to'][1], _data['Coords_to'][2], _data['Coords_to'][3], _data['Coords_to'][4]
                            spawnVeh(selectedVeh,vRP.getRegistrationNumber(),x,y,z,h,function(data)
                                if data == false then
                                    _bol = false
                                else
                                    _bol = true
                                    nveh = data
                                end
                            end)
                            while type(_bol) == "nil" do Wait(100) end
                            if _bol then
                                applyModifiesVeh(NetToVeh(nveh),1000.0,1000.0,100.0,{},nil,{},{},{},selectedVeh)
                            else
                                inGarage = false
                                return false
                            end
                        else
                            local spawning = false
                            for _slotId,_dSlot in pairs(_data['Coords_to']) do
                                local x,y,z,h = _dSlot[1], _dSlot[2], _dSlot[3], _dSlot[4]
                                if not HasVehClosestFromCoords(x,y,z,2.0) then
                                    local nveh
                                    spawning = true
                                    spawnVeh(selectedVeh,vRP.getRegistrationNumber(),x,y,z,h,function(data)
                                        if data == false then
                                            _bol = false
                                        else
                                            _bol = true
                                            nveh = data
                                        end
                                    end)
                                    while type(_bol) == "nil" do Wait(100) end
                                    if _bol then
                                        applyModifiesVeh(NetToVeh(nveh),1000.0,1000.0,100.0,{},nil,{},{},{},selectedVeh)
                                    else
                                        inGarage = false
                                        return false
                                    end
                                end
                            end
                            if not spawning then
                                TriggerEvent("Notify","aviso","Não há Vagas para retirar o veiculo.")
                                inGarage = false
                                return false
                            end
                        end
                    elseif #_data > 0 then
                        local spawning = false
                        for _slotId,data in pairs(_data) do
                            if type(_slotId) == "number" then
                                local x,y,z,h = data.x,data.y,data.z,data.h
                                if not HasVehClosestFromCoords(x,y,z,2.0) then
                                    local nveh
                                    spawning = true
                                    spawnVeh(selectedVeh,vRP.getRegistrationNumber(),x,y,z,h,function(data)
                                        if data == false then
                                            _bol = false
                                        else
                                            _bol = true
                                            nveh = data
                                        end
                                    end)
                                    while type(_bol) == "nil" do Wait(100) end
                                    if _bol then
                                        local data = vehList[tonumber(selectedVehId)]

                                        if data then applyModifiesVeh(NetToVeh(nveh),data.engine,data.body,data.fuel,data.tuning,data.plate,data.vehDoors,data.vehWindows,data.vehTyres,selectedVeh) end
                                    else
                                        inGarage = false
                                        return false
                                    end
                                end
                            end
                        end
                        if not spawning then
                            TriggerEvent("Notify","aviso","Não há Vagas para retirar o veiculo.")
                            inGarage = false
                            return false
                        end
                    end

                end
                inGarage = false
            else
                return false
            end
        else
            TriggerEvent("Notify","negado","Você já tem um veiculo desse modelo fora da garagem!",5000)
            return false
        end
    else
        return false
    end
end

-- THREAD START NEAREST GARAGENS
local _thread = false
function thread(tab)
    nearestGarages = tab
    if _thread then return end
    _thread = true
    local _nearestGarages = nearestGarages
    Citizen.CreateThread(function()
        while _thread and not isEmptyTable(_nearestGarages) and not inGarage do
            local idle = 1000
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            _nearestGarages = nearestGarages or {}
            for _id,_data in pairs(_nearestGarages) do
                if Config.workgarage[_data.name] then 
                    -- GARAGEM DE SERVIÇO (THREAD)
                    if _data.interior then
                        -- USING INTERIOR
                        if IsPedInAnyVehicle(ped) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped,false),-1) == ped then
                            idle = 4
                            enterDrawInVehicle(ped,veh,coords,_id,_data,Config.workgarage[_data.name])
                        else
                            idle = 4
                            enterDrawOutVehicle(ped,coords,_id,_data,Config.workgarage[_data.name])
                        end
                    else
                        -- DON'T USING INTERIOR
                        if not IsPedInAnyVehicle(ped) then
                            local dist = #(vec3(_data.blip[1],_data.blip[2],_data.blip[3]) - coords)
                            if (dist <= Config.blip_distance['Normal'] ) then
                                idle = 4
                                DrawText3D(_data.blip[1],_data.blip[2],_data.blip[3], "[~g~E~w~] ".._data.text)
                                if IsControlJustPressed(1,38) and not inAction then
                                    inAction = true
                                    interactGarages(_id,_data,Config.workgarage[_data.name],_data.npc)
                                    SetTimeout(1500,function()
                                        inAction = false
                                    end)
                                end
                            end
                        else
                            if type(_data.Coords_to[1]) == 'number' then
                                local dist = #(vec3(_data.Coords_to[1],_data.Coords_to[2],_data.Coords_to[3]) - coords)
                                if (dist <= Config.blip_distance['Veiculo'] ) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped,false),-1) == ped then
                                    idle = 4
                                    DrawText3D(_data.Coords_to[1],_data.Coords_to[2],_data.Coords_to[3], Config.texts["Del_vehicle"])
                                    if IsControlJustPressed(0,38) and not inAction then
                                        inAction = true
                                        DoScreenFadeOut(300)
                                        Citizen.Wait(600)

                                        will.deleteVehicle(GetVehiclePedIsIn(ped,false))
                                        SetEntityCoords(PlayerPedId(),_data.blip[1],_data.blip[2],_data.blip[3])
                                        Citizen.Wait(500)
                                        DoScreenFadeIn(400)
                                        inAction = false
                                    end
                                end
                            else
                                for _slotId,dSlot in pairs(_data.Coords_to) do
                                    local dist = #(vec3(dSlot[1],dSlot[2],dSlot[3]) - coords)
                                    if (dist <= Config.blip_distance['Veiculo'] ) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped,false),-1) == ped then
                                        idle = 4
                                        
                                        DrawText3D(dSlot[1],dSlot[2],dSlot[3], Config.texts["Del_vehicle"])
                                        if IsControlJustPressed(0,38) and not inAction then
                                            inAction = true
                                            DoScreenFadeOut(300)
                                            Citizen.Wait(600)
                                            -- vSERVER.deleteVehicleSync(VehToNet(GetVehiclePedIsIn(ped,false)))
                                            will.deleteVehicle(GetVehiclePedIsIn(ped,false))
                                            SetEntityCoords(PlayerPedId(),_data.blip[1],_data.blip[2],_data.blip[3])
                                            Citizen.Wait(500)
                                            DoScreenFadeIn(400)
                                            inAction = false
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif Config.interior_garages[_data.name] or (_data.interior and (Config.interior_garages[_data.interior])) then
                    -- GARAGEM DE PUBLICA (THREAD) [INTERIOR]
                    if IsPedInAnyVehicle(ped) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped,false),-1) == ped then
                        -- IN CAR
                        local dist = #(vec3(_data.entrada['veiculo'][1],_data.entrada['veiculo'][2],_data.entrada['veiculo'][3]) - coords)
                        if (dist <= Config.blip_distance['Normal'] ) then
                            idle = 4
                            enterDrawInVehicle(ped,veh,coords,_id,_data)
                        end
                    else
                        -- OUT CAR
                        idle = 4
                        enterDrawOutVehicle(ped,coords,_id,_data)
                    end

                else
                    if not IsPedInAnyVehicle(ped) then
                        local dist = #(vec3(_data.x,_data.y,_data.z) - coords)
                        if (dist <= Config.blip_distance['Normal'] ) then
                            idle = 4
                            DrawText3D(_data.x,_data.y,_data.z,Config.texts["Enter_garage"])
                            if IsControlJustPressed(0,38) and not inAction then
                                inAction = true 
                                if vSERVER.checkHasPermInHouse(_data.name) then
                                    interactGarages(_id,_data,vSERVER.myVehicles(_id) or {},nil,true)
                                end
                                SetTimeout(1500,function() inAction = false end)
                            end
                        end
                    elseif #_data > 0 and GetEntitySpeed(GetVehiclePedIsIn(ped))*3.6 < 5.0 then
                        for _slotId,data in pairs(_data) do
                            if type(_slotId) == "number" then
                                local dist = #(vec3(data.x,data.y,data.z) - coords)
                                if (dist <= Config.blip_distance['Veiculo'] ) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped,false),-1) == ped then
                                    idle = 4
                                    DrawText3D(data.x,data.y,data.z, Config.texts["Del_vehicle"])
                                    if IsControlJustPressed(0,38) and not inAction and vSERVER.checkHasPermInHouse(_data.name) then
                                        inAction = true
                                        DoScreenFadeOut(300)
                                        Citizen.Wait(600)

                                        local veh = GetVehiclePedIsIn(ped,false)

                                        if vSERVER.isOwnerOrStoledVehicle(vRP.getVehicleNameFromHash(GetEntityModel(veh)),GetVehicleNumberPlateText(veh)) then
                                            will.deleteVehicle(veh,nil,_id)
                                        else
                                            if vSERVER.requestStoledVehicle(vRP.getVehicleNameFromHash(GetEntityModel(veh)),GetVehicleNumberPlateText(veh)) then
                                                will.deleteVehicle(veh,nil,_id) 
                                                SetTimeout(500,function()
                                                    TriggerEvent("Notify","sucesso","Você roubou o veiculo com sucesso!",5000)
                                                end)
                                            else
                                                will.deleteVehicle(veh,nil) 
                                                SetTimeout(500,function()
                                                    TriggerEvent("Notify","sucesso","Você devolveu o veiculo com sucesso!",5000)
                                                end)
                                            end
                                        end
                                        -- if GetVehicleNumberPlateText(GetVehiclePedIsIn(ped,false)) == vRP.getRegistrationNumber() then
                                        -- if vSERVER.isOwnerOrStoledVehicle(vRP.getVehicleNameFromHash(GetEntityModel(veh)),GetVehicleNumberPlateText(veh)) then
                                        --     will.deleteVehicle(veh,nil,_id)
                                        -- else
                                        --     will.deleteVehicle(veh)
                                        -- end
                                        
                                        -- vSERVER.deleteVehicleSync(VehToNet(GetVehiclePedIsIn(ped,false)))
                                        -- will.deleteVehicle(GetVehiclePedIsIn(ped,false))
                                        SetEntityCoords(PlayerPedId(),_data.x,_data.y,_data.z)
                                        Citizen.Wait(500)
                                        DoScreenFadeIn(400)
                                        inAction = false
                                    end
                                end
                            end
                        end
                    end
                end
            end
            Citizen.Wait(idle)
        end
        _thread = false
    end)
end

-- GET NEAREST GARAGES
Citizen.CreateThread(function()
    DoScreenFadeIn(400)
    while true do   
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local __nearestGarages = {}
        if not inGarage then
            local i = 100
            for _id,_data in pairs(GaragesTable) do
                if Config.workgarage[_data.name] then
                    local dist = #(vec3(_data.blip[1],_data.blip[2],_data.blip[3]) - coords)
                    if (dist < 100.0) then
                        __nearestGarages[_id] = _data
                    end
                elseif Config.interior_garages[_data.name] or (_data.interior and (Config.interior_garages[_data.interior])) then
                    if _data.entrada then
                        local dist = #(vec3(_data.entrada['blip'][1],_data.entrada['blip'][2],_data.entrada['blip'][3]) - coords)
                        local dist2 = #(vec3(_data.entrada['veiculo'][1],_data.entrada['veiculo'][2],_data.entrada['veiculo'][3]) - coords)
                        if (dist < 100.0) or (IsPedInAnyVehicle(ped) and (dist2 < 100.0)) then
                            __nearestGarages[_id] = _data
                        end
                    end
                else
                    if (_data.x and _data.y and _data.z) then
                        local dist = #(vec3(_data.x,_data.y,_data.z) - coords)
                        if (dist < 100.0) then
                            __nearestGarages[_id] = _data
                        end
                    end
                end
                i = i - 1
                if i <= 0 then i = 100 Wait(1) end 
            end
        end
        if not isEmptyTable(__nearestGarages) then thread(__nearestGarages) end
        Citizen.Wait(2000)
    end
end)

function getNearestVehiclesHasDecor(radius)
	local r = {}
	local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId()))

	local vehs = {}
	local it,veh = FindFirstVehicle()
	if veh then
		table.insert(vehs,veh)
	end
	local ok
	repeat
		ok,veh = FindNextVehicle(it)
		if ok and veh then
			table.insert(vehs,veh)
		end
	until not ok
	EndFindVehicle(it)
    local networkTime = GetNetworkTime()
	for _,veh in pairs(vehs) do
		local x,y,z = table.unpack(GetEntityCoords(veh))
		local distance = #(vec3(x,y,z) - vec3(px,py,pz))
		if distance <= radius and DecorExistOn(veh,'rCollisionTime') then
            if networkTime > DecorGetInt(veh,'rCollisionTime') then 
                DecorRemove(veh,'rCollisionTime') 
            else
                r[veh] = distance
            end
		end
	end
	return r
end

-- THREAD REMOVE COLLISION (VISUAL SYNC)
local vehListDecor = {}
local vehAlphaList = {}
local _thread_alpha = false
local function thread_alpha()
    if _thread_alpha then return end
    _thread_alpha = true
    Citizen.CreateThread(function()
        while CountTable(vehAlphaList) > 0 do
            local networkTime = GetNetworkTime()
            for _veh,data in pairs(vehAlphaList) do
                if DoesEntityExist(_veh) then
                    if data[2] and networkTime > data[2] or not DecorExistOn(_veh,'rCollisionTime') then
                        vehAlphaList[_veh] = nil
                        ResetEntityAlpha(_veh)
                    else
                        if GetEntityAlpha(_veh) ~= 255 then
                            ResetEntityAlpha(_veh)
                        else
                            SetEntityAlpha(_veh, 50, false)
                        end
                    end
                else
                    vehAlphaList[_veh] = nil
                end
            end
            Wait(250)
        end
        _thread_alpha = false
    end)
end

local _thread_collision = false
local function thread_collision()
    if _thread_collision then return end
    _thread_collision = true
    local _vehDecor = vehListDecor
    Citizen.CreateThread(function()
        while CountTable(_vehDecor) > 0 do
            _vehDecor = vehListDecor
            if CountTable(_vehDecor) == 0 then break end
            local idle = 10
            for _veh01,_ in pairs(_vehDecor) do
                if not vehAlphaList[_veh01] then vehAlphaList[_veh01] = {true,DecorGetInt(_veh01,'rCollisionTime')} thread_alpha() end
                local vehs = vRP.getNearestVehicles(10.0)
                for _veh02,_ in pairs(vehs) do
                    SetEntityNoCollisionEntity(_veh01, _veh02, true)
                    SetEntityNoCollisionEntity(_veh02, _veh01, true)
                end
            end
            Citizen.Wait(idle)
        end
        _thread_collision = false
    end)
end

Citizen.CreateThread(function()
    DecorRegister('rCollisionTime',3)
    while true do
        vehListDecor = getNearestVehiclesHasDecor(500.0)
        if CountTable(vehListDecor) > 0 then thread_collision() end
        Citizen.Wait(500)
    end
end)

local function getVehDamage(vehicle)
    local vehDoors = {}
    for i = 0,5 do
        vehDoors[i] = IsVehicleDoorDamaged(vehicle,i)
    end
    local vehWindows = {}
    for i = 0,7 do
        vehWindows[i] = IsVehicleWindowIntact(vehicle,i)
    end
    local vehTyres = {}
    for i = 0,7 do
        local tyre_state = 2
        if IsVehicleTyreBurst(vehicle,i,true) then
            tyre_state = 1
        elseif IsVehicleTyreBurst(vehicle,i,false) then
            tyre_state = 0
        end
        vehTyres[i] = tyre_state
    end
    return vehDoors, vehWindows, vehTyres
end

function will.deleteVehicle(vehicle,bydv,garageId)
	if vehicle and IsEntityAVehicle(vehicle) then
        local vehplate = GetVehicleNumberPlateText(vehicle)
        local vehDoors, vehWindows, vehTyres = getVehDamage(vehicle)
        if vehplate then
            vSERVER.tryDelete(VehToNet(vehicle),GetVehicleEngineHealth(vehicle),GetVehicleBodyHealth(vehicle),GetVehicleFuelLevel(vehicle),vehplate,vehDoors,vehWindows,vehTyres,bydv,garageId)
        end

        if DecorExistOn(vehicle,'DependencyVehs') and DecorGetInt(vehicle,'DependencyVehs') ~= 0 then
            local _vehicle = NetToVeh(DecorGetInt(vehicle,'DependencyVehs'))
            if DoesEntityExist(_vehicle) then will.deleteVehicle(_vehicle,true) end
        end
	end
end

function will.tryDeleteNearestVehicle()
    local vehicle = vRP.getNearestVehicle(7)
    if vehicle then
        will.deleteVehicle(vehicle,nil)
    end
end

function will.getModel(nveh)
    return GetEntityModel(NetToVeh(nveh))
end

RegisterNetEvent('_handle:4sa4h12')
AddEventHandler('_handle:4sa4h12',function(p0)
    local ent = NetToVeh(p0)
    will.deleteVehicle(ent,true)
end)