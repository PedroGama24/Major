fx_version 'bodacious'
game 'gta5'

client_scripts {
	'@vrp/lib/utils.lua',
	'config/config_client.lua',
	'client.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'config/config_server.lua',
	'server.lua'
}

ui_page 'html/ui.html'

files {
	'html/**',
	"images/*"
}              