Config = {}

Config.UseESX = false --Enable if you are using ESX so you can use the esx permissions.
Config.Command = 'tempo' --Customise the command name to open the UI.
Config.Notification_Type = 'chat' ----chat / mythic_old / mythic_new / esx / custom
Config.Language = 'EN' --EN / FR / ES

Config.TimeCycleSpeed = 2000 -- a suspensão desse valor afetará o ciclo de dia/noite, diminuindo a velocidade, aumentando a velocidade. No momento, é semelhante ao ciclo de tempo padrão do gta5. (em milissegundos).
Config.DynamicWeather = true --Ative se quiser permitir clima dinâmico.
Config.DynamicWeather_time = 10 --Se o clima dinâmico estiver ativado, este valor é quanto tempo até que o clima mude (em minutos).
Config.RainChance = 5 --A porcentagem de chance de chover em 100.
Config.SnowChance = 1 --A porcentagem de chance de nevar em 100.
Config.ThunderChance = 10 --A porcentagem de chance de trovejar ao chover de 100.

Config.WeatherGroups = { --
    [1] = {'CLEAR', 'OVERCAST','EXTRASUNNY', 'CLOUDS'},--clear
    [2] = {'CLEARING', 'RAIN', 'NEUTRAL', 'THUNDER'},--rain
    [3] = {'SMOG', 'FOGGY'},--foggy
    [4] = {'SNOWLIGHT', 'SNOW', 'BLIZZARD', 'XMAS'},--snow
}
