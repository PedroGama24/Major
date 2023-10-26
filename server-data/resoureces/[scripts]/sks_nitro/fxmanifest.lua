
fx_version 'cerulean'

game 'gta5'

ui_page "turbo/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua"
}


server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}

files{
    'turbo/*.*'
}