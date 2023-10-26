
local coefflouze = 0.1 --Coeficient multiplicateur qui en fonction de la distance definit la paie
--INIT--

local isInJobMec = false
local livr = 0
local plateab = "POPJOBS"
local isToHouse = false
local isToMcdonalds = false
local paie = 0

local pourboire = 0
local posibilidad = 0
local px = 0
local py = 0
local pz = 0


Citizen.CreateThread(function()

    RequestIpl("lafa2k_bkr_biker_dlc_int_02")
    interiorID = GetInteriorAtCoords(889.67889404297,-2102.9304199219,30.761777877808)
        if IsValidInterior(interiorID) then
        
            EnableInteriorProp(interiorID, "walls_01")
            EnableInteriorProp(interiorID, "lower_walls_default")
            EnableInteriorProp(interiorID, "furnishings_02")
            EnableInteriorProp(interiorID, "mural_03")
            EnableInteriorProp(interiorID, "decorative_02")
            EnableInteriorProp(interiorID, "gun_locker")
            EnableInteriorProp(interiorID, "mod_booth")
            
            --Objetos ilegais espalhados pelo motoclube (meta, dinheiro, maconha, coca, documentos ilegais)
            
            EnableInteriorProp(interiorID, "meth_small")
            EnableInteriorProp(interiorID, "meth_medium")
            EnableInteriorProp(interiorID, "meth_large")
            EnableInteriorProp(interiorID, "cash_small")
            EnableInteriorProp(interiorID, "cash_medium")
            EnableInteriorProp(interiorID, "cash_large")
            EnableInteriorProp(interiorID, "weed_small")
            EnableInteriorProp(interiorID, "weed_medium")
            EnableInteriorProp(interiorID, "weed_large")
            EnableInteriorProp(interiorID, "coke_small")
            EnableInteriorProp(interiorID, "coke_medium")
            EnableInteriorProp(interiorID, "coke_large")
            EnableInteriorProp(interiorID, "counterfeit_small")
            EnableInteriorProp(interiorID, "counterfeit_medium")
            EnableInteriorProp(interiorID, "counterfeit_large")
            EnableInteriorProp(interiorID, "id_small")
            EnableInteriorProp(interiorID, "id_medium")
            EnableInteriorProp(interiorID, "id_large")
            -- Opções de cores para as paredes (mudar o numero no final)
            -- Verde e cinza = 1,
            -- multicolor = 2,
            -- Laranja e Cinza = 3,
            -- Azul = 4,
            -- Azul claro = 5,
            -- Verde e vermelho = 6,
            -- Amarelo e Cinza = 7,
            -- Vermelho = 8,
            -- Rosa e cinza = 9
            SetInteriorPropColor(interiorID, "walls_01", 8)
            SetInteriorPropColor(interiorID, "lower_walls_default", 8)
            
            RefreshInterior(interiorID)
        end
    end)

    ------------------------------- BENNYS ---------------------------
    local pdl = GetInteriorAtCoords(440.84, -983.14, 30.69)
LoadInterior(pdl)


local bennys = GetInteriorAtCoords(-210.29,-1321.87,30.89)
LoadInterior(bennys)

Citizen.CreateThread(function()
RequestIpl("lafa2k_bkr_biker_dlc_int_02")
interiorID = GetInteriorAtCoords(889.67889404297,-2102.9304199219,30.761777877808)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "walls_01")
		EnableInteriorProp(interiorID, "lower_walls_default")
		EnableInteriorProp(interiorID, "furnishings_02")
		EnableInteriorProp(interiorID, "mural_03")
		EnableInteriorProp(interiorID, "decorative_02")
		EnableInteriorProp(interiorID, "gun_locker")
		EnableInteriorProp(interiorID, "mod_booth")
		EnableInteriorProp(interiorID, "meth_small")
		EnableInteriorProp(interiorID, "meth_medium")
		EnableInteriorProp(interiorID, "meth_large")
		EnableInteriorProp(interiorID, "cash_small")
		EnableInteriorProp(interiorID, "cash_medium")
		EnableInteriorProp(interiorID, "cash_large")
		EnableInteriorProp(interiorID, "weed_small")
		EnableInteriorProp(interiorID, "weed_medium")
		EnableInteriorProp(interiorID, "weed_large")
		EnableInteriorProp(interiorID, "coke_small")
		EnableInteriorProp(interiorID, "coke_medium")
		EnableInteriorProp(interiorID, "coke_large")
		EnableInteriorProp(interiorID, "counterfeit_small")
		EnableInteriorProp(interiorID, "counterfeit_medium")
		EnableInteriorProp(interiorID, "counterfeit_large")
		EnableInteriorProp(interiorID, "id_small")
		EnableInteriorProp(interiorID, "id_medium")
		EnableInteriorProp(interiorID, "id_large")
		SetInteriorPropColor(interiorID, "walls_01", 8)
		SetInteriorPropColor(interiorID, "lower_walls_default", 8)
		RefreshInterior(interiorID)
	end

interiorID = GetInteriorAtCoords(2845.278,4441.969,47.50344)
	if IsValidInterior(interiorID) then
		RefreshInterior(interiorID)
	end	

RequestIpl("imp_impexp_interior_placement_interior_1_impexp")
interiorID = GetInteriorAtCoords(941.10520000,-971.67590000,39.39997000)
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "branded_style_set")
		EnableInteriorProp(interiorID, "car_floor_hatch")
		EnableInteriorProp(interiorID, "door_blocker")
		RefreshInterior(interiorID)
	end		
end)


Citizen.CreateThread(function()

    RequestIpl("igro45_cardealer_milo_")
        local interiorID = GetInteriorAtCoords(145.1106, -1532.807, 36.68647)
        
        if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "igro45_cardealer_porps_room02")
        EnableInteriorProp(interiorID, "igro45_cardealer_porps_room01")
    
        RefreshInterior(interiorID)
        end
    end)
    

    Citizen.CreateThread(function()


        RequestIpl("gabz_biker_milo_")
        
            interiorID = GetInteriorAtCoords(994.47870000, -122.99490000, 73.11467000)
            
            
            if IsValidInterior(interiorID) then
            EnableInteriorProp(interiorID, "walls_02")
            SetInteriorPropColor(interiorID, "walls_02", 8)
            EnableInteriorProp(interiorID, "Furnishings_02")
            SetInteriorPropColor(interiorID, "Furnishings_02", 8)
            EnableInteriorProp(interiorID, "decorative_02")
            EnableInteriorProp(interiorID, "mural_03")
            EnableInteriorProp(interiorID, "lower_walls_default")
            SetInteriorPropColor(interiorID, "lower_walls_default", 8)
            EnableInteriorProp(interiorID, "mod_booth")
            EnableInteriorProp(interiorID, "gun_locker")
            EnableInteriorProp(interiorID, "cash_small")
            EnableInteriorProp(interiorID, "id_small")
            EnableInteriorProp(interiorID, "weed_small")
            
            RefreshInterior(interiorID)
            
            end
            
        end)
        