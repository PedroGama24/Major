
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
----------------------------------------------------------------------------------------------------------------------------------
--[ CONEXÃO ]---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
oC = Tunnel.getInterface("sks_gps")
----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]---------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("sks_gps:coords")
AddEventHandler("sks_gps:coords", function(source)
	if oC.farc() then
		setBlip(713.2, -967.78, 30.4,501,16,"Costura")
		setBlip(4504.34, -4554.52, 4.18 ,480,16,"Fornecedor")
		setBlip(4427.55, -4451.87, 7.24 ,761,16,"Rotas")
		setBlip(4504.34, -4554.52, 4.18 ,587,16,"Báu")
	elseif oC.amarelos() then
		setBlip(581.75, 2434.4, 58.8,761,5,"Rotas")
		setBlip(678.92, 2367.31, 51.51,587,5,"Báu")
		setBlip(-1238.82, -1112.1, 0.79,473,5,"Galpão")
------------------------------------------------------------------------------------------------------------
	elseif oC.roxos() then
		setBlip(1260.65, -216.97, 99.99,587,7,"Báu")
		setBlip(606.08532714844,-422.87652587891,17.6237,473,7,"Galpão")
		setBlip(1563.1, -66.08, 158.56,761,7,"Rotas")
		
	elseif oC.verdes() then
		setBlip(-2399.82, 1736.41, 197.15,587,2,"Báu")
		setBlip(172.14, -1713.04, 22.21,473,2,"Galpão")
		setBlip(-2408.31, 1750.26, 187.63,761,2,"Rotas")

	elseif oC.anoynmous() then
		setBlip(747.17315673828,-1905.1430664062,29.4619903,587,14,"Báu")
		setBlip(755.42, -1910.92, 29.47,181,14,"Base")
		setBlip(148.24, 6361.76, 31.53,181,14,"Venda Cartões")
	elseif oC.driftking() then
		setBlip(730.06256103516,-1072.0891113281,21.268779,735,15,"Fábrica de carro")
		setBlip(1564.2563476562,3527.7150878906,36.1199913,659,15,"Desmanche")
		setBlip(135.38, -3050.54, 7.05,592,15,"Produção")
		setBlip(128.43, -3013.57, 7.05,587,15,"Báu")
		setBlip(135.1, -3050.63, 7.04,181,15,"Base")
------------------------------------------------------------------------------------------------------------
    elseif oC.bratva() then
		setBlip(-1521.7, 133.4, 48.65,761,10,"Rotas")
		setBlip(-1521.26, 121.48, 48.65,587,10,"Báu")
		setBlip(-1560.59, 123.05, 64.69,181,10,"Base")
    elseif oC.cartel() then
		setBlip(-1865.970, 2061.27, 135.43,761,10,"Rotas")
		setBlip(-1863.39, 2054.27, 135.46,587,10,"Báu")
		setBlip(-1888.98, 2031.94, 148.68,181,10,"Base")
------------------------------------------------------------------------------------------------------------
	elseif oC.soa() then 
		setBlip(989.28, -136.18, 74.07,761,10,"Rotas")
		setBlip(977.1, -104.05, 74.85,587,10,"Báu")
		setBlip(948.98, -130.58, 85.78,181,10,"Base")
	elseif oC.thelost() then 
		setBlip(2514.22, 4100.45, 35.59,761,10,"Rotas")
		setBlip(2519.4, 4100.73, 35.59,587,10,"Báu")
		setBlip(2502.49, 4106.42, 41.32,181,10,"Base")
	elseif oC.vanilla() then 
		setBlip(377.62771606445,6517.5278320312,28.377,77,48,"Coleta de Laranjas")
		setBlip(1829.82, 4998.35, 54.21,78,48,"Coleta de Morango")
		setBlip(106.88, -1299.24, 28.77,587,48,"Báu")
		setBlip(136.14, -1309.61, 36.42,181,48,"Base")
	elseif oC.casino() then 
		setBlip(1108.7030029297,250.02006530762,-45.841,761,32,"Rotas")
		setBlip(930.38,-1473.44,23.05,500,32,"Base Lavagem")
		setBlip(943.21, -1486.78, 23.05,587,32,"Báu")
		setBlip(917.35, 35.42, 96.91,181,32,"Base")

    end
end)
----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
function setBlip(x,y,z,id,color,text)
	local blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(blip,id)
	SetBlipAsShortRange(blip,true)
	SetBlipColour(blip,color)
	SetBlipScale(blip,0.5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end