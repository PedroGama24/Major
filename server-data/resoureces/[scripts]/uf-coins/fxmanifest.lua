fx_version 'cerulean'
game 'gta5'

ui_page "ui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"src/uf_coins_cl.lua",
	"config/config.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"src/uf_coins_sv.lua",
	"config/config.lua"
}

files {
	"ui/**",
}