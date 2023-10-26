fx_version "adamant"
game "gta5"

dependency 'vrp'

author "RossiniJS powered by E&G Resources"
version "1.0.0"
contact "https://discord.gg/bABGBEX (E&G Resources) | Edu#0069 (RossiniJS) | https://github.com/rossinijs"

ui_page "web-source/aurora.html"

client_scripts {
    "@vrp/lib/utils.lua",
    "fivem/cfg/config.lua",
    "fivem/client-side/tyler.lua",
}

server_scripts {
    "@vrp/lib/utils.lua",
    "fivem/cfg/config.lua",
    "fivem/server-side/alyson.lua",
}

files {
    "web-source/aurora.html",
    "web-source/css/aurora.css",
    "web-source/js/*.js",
    "web-source/media/*.png",
    "web-source/media/*.jpg",
    "web-source/media/*.jpeg",
    "web-source/media/*.woff",
    "web-source/media/*.ttf",
}