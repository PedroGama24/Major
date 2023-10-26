-- [DANO DAS ARMAS] -- SEM SER OS METAS PODE SE ALTERAR POR AQUI TBM

Citizen.CreateThread(function()
    while true do
		N_0xf4f2c0d4ee209e20() -- REMOVA CAMERA 3D
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL_MK2"), 2.18) -- TAZER [POLICIA/PARAMEDICOS]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPISTOL"), 2.11) -- GLOCK [POLICIA]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG"), 1.78) -- MP5 [POLICIA]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPDW"), 1.1) -- SIGSAUER [POLICIA]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE"), 1.85) -- M4A1 [POLICIA]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE_MK2"), 1.1) -- M4A1 [POLICIA]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_RAYPISTOL"), 0.0) -- M4A1 [POLICIA]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), 2.7) -- SHOTGUN [POLICIA]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PUMPSHOTGUN"), 1.7) -- SHOTGUN [POLICIA]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL"), 1.35) -- M1911 [PORTE DE ARMAS]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL_MK2"), 1.45) -- FIVESEVEN [ILEGAL]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHINEPISTOL"), 1.45) -- TEC-9 [ILEGAL]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MICROSMG"), 1.7) -- MICRO UZI [ILEGAL]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTSMG"), 1.80) -- MTAR-21 [ILEGAL]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GUSENBERG"), 1.82) -- THOMPSON [ILEGAL]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SPECIALCARBINE"), 1.87) -- CARABINA [ILEGAL]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE"), 1.1) -- AK103 [ILEGAL]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), 1.1) -- AK103 [ILEGAL]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MILITARYRIFLE"), 4.0) -- AK103 [ILEGAL]
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.1) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.1) 
        Wait(0)
		N_0x4757f00bc6323cfe(-1553120962, 0.0) 
		Wait(0)
    end
end)

-- [1 HS = 1 MORTE] --

Citizen.CreateThread(function()
    while true do
        Wait(4)
		SetPedSuffersCriticalHits(PlayerPedId(-1), true)
    end
end)
