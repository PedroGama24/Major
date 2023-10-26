fx_version 'adamant'
game 'gta5'

author 'iLucasUS'
contact 'iLucasUS#2557'
version '1.0'

client_scripts {
	"@vrp/lib/utils.lua",
	'config/config.lua',
	"client.lua"
}

server_scripts {
	'@vrp/lib/utils.lua',
	'config/config.lua',
	'server.lua'
}

files {
	'nui/FuseBox.html',
	'nui/FuseBox.js',
	'nui/FuseBox.css'
}

ui_page 'nui/FuseBox.html'