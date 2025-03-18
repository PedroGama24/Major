fx_version "bodacious"
game "gta5"

author "Will IV#8996"

ui_page "web-side/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
    "Config.lua",
	"client-side/client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
    "Config.lua",
	"server-side/server.lua"
}

files {
	"web-side/**/*",
}

escrow_ignore {
	"Config.lua",
}