config = {}




config.drawMarker = function(x,y,z) -- funcao para desenhar os markers para startar

	DrawMarker(27,x,y,z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 200, 0,150,0,0,0,1)
    DrawMarker(21,x,y,z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 200, 0,155,0,0,0,1)
end



config.drawMarkerRota = function(x,y,z) -- funcao para desenhar os markers da rota

	DrawMarker(27,x,y,z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 200, 0,155,0,0,0,1)

	DrawMarker(21,x,y,z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,255, 200, 0,155,0,0,0,1)

end



config.empregos = {

	

    {emprego = "Anonymous", item = "cartao", minimo = 1, maximo = 1, onCar = false,

        text = "PRESSIONE ~y~E~w~ PARA COLETAR OS ~y~CARTÕES LIMPOS",

        text2 = "VÁ ATÉ A ROTA DOS ~y~CARTÕES~w~ EM SEU MAPA",

        x = 754.0, y = -1904.4, z = 29.47, perm = "anonymous.permissao"  

    },



    {emprego = "FARC", item = "fibra", minimo = 1, maximo = 2, onCar = false,

    text = "PRESSIONE ~y~E~w~ PARA IR COLETAR AS ~y~FIBRAS",

    text2 = "VÁ ATÉ A ROTA DAS ~y~FIBRAS~w~ EM SEU MAPA",

    x = 4427.58, y = -4451.86, z = 7.24, perm = "farc.permissao"  

    },



    {emprego = "Bratva", item = "pecadearma", minimo = 1, maximo = 2, onCar = false,

        text = "PRESSIONE ~y~E~w~  PARA IR COLETAR AS ~y~PEÇAS DE ARMA",

        text2 = "VÁ ATÉ A ROTA DAS ~y~PEÇAS DE ARMA~w~ EM SEU MAPA",

        x = -1521.56, y = 133.07, z = 48.65, perm = "bratva.permissao"

    },



    {emprego = "Cartel", item = "pecadearma", minimo = 1, maximo = 2, onCar = false,

        text = "PRESSIONE ~y~E~w~ PARA A ROTA DE ~y~PEÇAS DE ARMA",

        text2 = "VÁ ATÉ A ROTA DAS ~y~PEÇAS DE ARMA~w~ EM SEU MAPA",

        x = -1865.99, y = 2061.14, z = 135.43, perm = "cartel.permissao"

    },

 
    {emprego = "SoA", item = "polvora", minimo = 1, maximo = 2, onCar = false,

    text = "PRESSIONE ~y~E~w~ PARA A ROTA DE ~y~POLVORAS",

    text2 = "VÁ ATÉ A ROTA DAS ~y~POLVORAS~w~ EM SEU MAPA",

    x = 989.47, y = -136.24, z = 74.07, perm = "soa.permissao"

    },

    {emprego = "TheLost", item = "polvora", minimo = 1, maximo = 2, onCar = false,

    text = "PRESSIONE ~y~E~w~ PARA A ROTA DE ~y~POLVORAS",

    text2 = "VÁ ATÉ A ROTA DAS ~y~POLVORAS~w~ EM SEU MAPA",

    x = 2514.0, y = 4100.0, z = 35.58, perm = "thelost.permissao"

    },


    {emprego = "BurguerShot", item = "embalagem", minimo = 1, maximo = 2, onCar = false,

    text = "PRESSIONE ~y~E~w~ PARA A ROTA DAS ~y~EMBALAGENS",

    text2 = "VÁ ATÉ A ROTA DAS ~y~EMBALAGENS~w~ EM SEU MAPA",

    x = -1196.32, y = -904.08, z = 14.0, perm = "admin.permissao"

    },

  





}



config.rotas = {

  

    ["Anonymous"] = {

        { x= -38.0156,y= -1379.94,z=  29.34},	 
        { x= 196.85,y= -1020.41, z= 29.46},
        { x= 5.117,y= -745.35,z=  44.272}, 
        { x= 53.653,y= -277.514,z=  47.61544},  
        { x= 483.90,y= -139.9975, z= 58.8837}, 
        { x= 934.0247,y= -625.685,z=  57.533}, 
        { x= 1383.63,y= -573.30,z=  74.43}, 
        { x= 825.92,y= -1932.39, z= 29.0561},  
        { x= -610.99841,y= -1787.43,z=  23.676},   
        { x= -1168.330,y= -1478.071,z=  4.379},  
        { x= -1225.20,y= -1094.238,z=  8.1545}, 
        { x=  -1509.6488,y= -219.43,z=  51.749},
        { x= -1288.79,y= 640.91,z=  138.509}, 
        { x= -600.71,y= 858.78,z=  210.526}, 
        { x= -229.03,y= 597.205, z= 189.99},

    },

    ["FARC"] = {

        {x = -3068.87,y=  3328.0,z= 8.8 }, 
        {x = 439.38, y= 3561.53,z= 33.24 }, 
        {x = 1601.67,y=  3562.69,z= 35.37 }, 
        {x = 1310.24, y= 4386.92,z= 41.23 }, 
        {x = 1943.85, y= 4647.04,z= 40.63 }, 
        {x = 1736.61,y=  6423.25,z= 34.39 }, 
        {x = -758.16,y=  5600.44, z=33.83 }, 
        {x = 264.26, y= 3096.01,z= 42.79 }, 
        {x = 2867.29, y= 1506.66,z= 24.57 }, 
        {x = 2544.2, y= 377.0, z=108.62 }, 
        {x = 2505.42,y=  -333.5,z= 93.0 }, 
        {x = 1126.87, y= -1302.52,z= 34.73 },


    },

    ["Bratva"] = {

        {x = -3068.87,y=  3328.0,z= 8.8 }, 
        {x = 439.38, y= 3561.53,z= 33.24 }, 
        {x = 1601.67,y=  3562.69,z= 35.37 }, 
        {x = 1310.24, y= 4386.92,z= 41.23 }, 
        {x = 1943.85, y= 4647.04,z= 40.63 }, 
        {x = 1736.61,y=  6423.25,z= 34.39 }, 
        {x = -758.16,y=  5600.44, z=33.83 }, 
        {x = 264.26, y= 3096.01,z= 42.79 }, 
        {x = 2867.29, y= 1506.66,z= 24.57 }, 
        {x = 2544.2, y= 377.0, z=108.62 }, 
        {x = 2505.42,y=  -333.5,z= 93.0 }, 
        {x = 1126.87, y= -1302.52,z= 34.73 },

    },

    ["Cartel"] = {
        { x= -3068.87,y=  3328.0,z= 8.8 }, 
        { x= 439.38, y= 3561.53,z= 33.24 }, 
        { x= 1601.67,y=  3562.69,z= 35.37 }, 
        { x= 1310.24, y= 4386.92,z= 41.23 }, 
        { x= 1943.85,y=  4647.04,z= 40.63 }, 
        { x= 1736.61,y=  6423.25, z=34.39 }, 
        { x= -758.16,y=  5600.44, z=33.83 }, 
        { x= 264.26, y= 3096.01,z= 42.79 }, 
        { x= 2867.29,y=  1506.66, z=24.57 }, 
        { x= 2544.2,y=  377.0,z= 108.62 }, 
        { x= 2505.42,y=  -333.5,z= 93.0 }, 
        { x= 1126.87, y= -1302.52, z=34.73 },

    },

    ["SoA"] = {

        { x= 780.98, y= -2383.83,z=  22.23 }, 
        { x= -277.74, y= -2469.23,z=  7.29 }, 
        { x= 1090.17,y=  -2283.14,z=  30.16 }, 
        { x= -1516.11,y=  -889.61, z= 10.19 }, 
        { x= -180.25,y=  321.27, z= 97.80 }, 
        { x= 2355.92, y= 2564.40,z=  47.08 }, 
        { x= 1744.02, y= 3308.85, z= 41.48 }, 
        { x= -1128.60, y= 2691.94, z= 18.80 }, 
        { x= 524.71,y=  3080.24,z=  40.66 }, 
        { x= -769.16, y= 5597.12, z= 33.60 }, 
        { x= 2349.15, y= 4869.26,z=  41.80 }, 
        { x= -103.62, y= 6483.30, z= 31.39 },

    },



    ["TheLost"] = {

	

        { x= 780.98, y= -2383.83,z=  22.23 }, 
        { x= -277.74,y=  -2469.23,z=  7.29 }, 
        { x= 1090.17,y=  -2283.14,z=  30.16 }, 
        { x= -1516.11,y=  -889.61, z= 10.19 }, 
        { x= -180.25,y=  321.27, z= 97.80 }, 
        { x= 2355.92, y= 2564.40, z= 47.08 }, 
        { x= 1744.02, y= 3308.85, z= 41.48 }, 
        { x= -1128.60, y= 2691.94, z= 18.80 }, 
        { x= 524.71,y=  3080.24,z=  40.66 }, 
        { x= -769.16, y= 5597.12, z= 33.60 }, 
        { x= 2349.15,y=  4869.26, z= 41.80 }, 
        { x= -103.62, y= 6483.30,z=  31.39 },

    },



    ["BurguerShot"] = {


       { x= 27.21,  y = -1338.91,z=  29.5 }, 
       { x= 2549.01, y = 383.58, z= 108.63 }, 
       { x= 1163.33, y = -314.08,z=  69.21 }, 
       { x= -706.17, y = -905.17,z=  19.22 }, 
       { x= -41.26,y =  -1751.55,z=  29.42 }, 
       { x= 377.01,y =  333.86, z= 103.57 }, 
       { x= -3250.33, y = 1003.21, z= 12.84 }, 
       { x= 1733.94,y =  6421.49, z= 35.04 }, 
       { x= 548.68, y = 2662.89,z=  42.16 }, 
       { x= 1957.32, y = 3748.05, z= 32.35 },

    },




    

    

}



return config