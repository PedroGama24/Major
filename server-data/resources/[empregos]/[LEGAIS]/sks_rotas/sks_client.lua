local Tunnel = module("vrp","lib/Tunnel")

local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")



local cfg = module("sks_rotas", "config")

eG = Tunnel.getInterface("sks_rotas")

----------------------------------------------------------------------------------------------------------------

-- VARIAVEIS ---------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------

local blipmap = false

local trabalhando = false

local destino = 1

local empregos = cfg.empregos

local rotas = cfg.rotas

local veiculo = nil

local emprego = nil

local perm = nil

local text2 = nil

----------------------------------------------------------------------------------------------------------------

-- THREAD ------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()

    local ui = GetMinimapAnchor()

    while true do

        local egsleep = 2000

        local ped = PlayerPedId()

        local x,y,z = table.unpack(GetEntityCoords(ped))

        if not trabalhando then

            for k,v in pairs(empregos) do

                local distance = Vdist(x,y,z,v.x,v.y,v.z)

                if distance <= 6 then

                    cfg.drawMarker(v.x,v.y,v.z)

                    egsleep = 5

                    if distance <= 2 then

                        drawTxt2(ui.right_x+0.25,ui.bottom_y-0.100,0.50,v.text)

                        if IsControlJustPressed(0,38) then

                            if eG.perm(v.perm) then

                                perm = v.perm

                                emprego = v.emprego

                                text2 = v.text2

                                veiculo = v.onCar

                                trabalhando = true

                                CriandoBlip(rotas[emprego][destino],emprego)

                                TriggerEvent("Notify","sucesso","Você entrou em serviço.")

                            else

                                TriggerEvent("Notify","negado","Você não trabalha aqui.")

                            end

                        end

                    end

                end

            end

        elseif trabalhando then

            egsleep = 5

            drawTxt2(ui.right_x+0.25,ui.bottom_y-0.100,0.50,text2)

            local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),rotas[emprego][destino].x,rotas[emprego][destino].y,rotas[emprego][destino].z,true)

            if distance <= 30 then

                cfg.drawMarkerRota(rotas[emprego][destino].x,rotas[emprego][destino].y,rotas[emprego][destino].z)

                if distance <= 8 then

                    if IsControlJustPressed(0,38) then

                        vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)

                        RemoveBlip(blip)

                        if destino == #rotas[emprego] then

                            destino = 1

                        else

                            destino = destino + 1

                        end



                        if eG.perm(perm) then

                            eG.checkReward(emprego)

                        end



                        CriandoBlip(rotas[emprego][destino],emprego)

                    end

                end

            end

        end

        Citizen.Wait(egsleep)

    end

end)

----------------------------------------------------------------------------------------------------------------

-- FUNCOES -----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()

	while true do

        egsleep = 2000

        if trabalhando then

            egsleep = 5

            if IsControlJustPressed(0,168) then

                trabalhando = false

                emprego = nil

                perm = nil

                destino = 1

                if blipmap then

				    RemoveBlip(blip)

                    RemoveBlip(blip)

                end

                TriggerEvent("Notify","aviso","Você saiu de serviço.")

            end

        end

        Citizen.Wait(egsleep)

	end

end)



function contador(segundos)

    CreateThread(function()

        while segundos > 0 do

            cooldown = segundos

            segundos = segundos - 1

            Wait(1000)

        end

        trabalhando = false

    end)

end



function CriandoBlip(entregas,emprego)

    blipmap = true

	blip = AddBlipForCoord(entregas.x,entregas.y,entregas.z)

	SetBlipSprite(blip,1)

	SetBlipColour(blip,75)

	SetBlipScale(blip,0.90)

	SetBlipAsShortRange(blip,false)

	SetBlipRoute(blip,true)

	BeginTextCommandSetBlipName("STRING")

	AddTextComponentString("Rota de "..emprego)

	EndTextCommandSetBlipName(blip)

end



function drawTxt(text,font,x,y,scale,r,g,b,a)

	SetTextFont(font)

	SetTextScale(scale,scale)

	SetTextColour(r,g,b,a)

	SetTextOutline()

	SetTextCentre(1)

	SetTextEntry("STRING")

	AddTextComponentString(text)

	DrawText(x,y)

end



function drawTxt2(x,y,scale,text)

	SetTextFont(4)

	SetTextScale(scale,scale)

	SetTextColour(255,255,255,255)

	SetTextEdge(2,0,0,0,255)

	SetTextOutline()

	SetTextEntry("STRING")

	AddTextComponentString(text)

	DrawText(x,y)

end



function GetMinimapAnchor()

	local safezone = GetSafeZoneSize()

	local safezone_x = 1.0 / 20.0

	local safezone_y = 1.0 / 20.0

	local aspect_ratio = GetAspectRatio(0)

	local res_x, res_y = GetActiveScreenResolution()

	local xscale = 1.0 / res_x

	local yscale = 1.0 / res_y

	local Minimap = {}

	Minimap.width = xscale * (res_x / (4 * aspect_ratio))

	Minimap.height = yscale * (res_y / 5.674)

	Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))

	Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))

	Minimap.right_x = Minimap.left_x + Minimap.width

	Minimap.top_y = Minimap.bottom_y - Minimap.height

	Minimap.x = Minimap.left_x

	Minimap.y = Minimap.top_y

	Minimap.xunit = xscale

	Minimap.yunit = yscale

	return Minimap

end
