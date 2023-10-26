fx_version "adamant"
game "gta5"

client_scripts {
    "@vrp/lib/utils.lua",
    "client.lua",
    "config.lua"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "server.lua",
    "config.lua"
}

files {
    "nui/**",
    "nui/img/**",
    "config.lua"
}

ui_page "nui/index.html"