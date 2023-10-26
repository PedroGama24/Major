--shared_script "@vrp/lib/lib.lua"

fx_version 'bodacious'
game 'gta5'

ui_page "web-side/index.html"

server_scripts {
	"@vrp/lib/utils.lua",
	'server.lua',
	'box_config.lua',
	'sv_config.lua',
}
 
client_scripts {
	"@vrp/lib/utils.lua",
	'client.lua',
	'box_config.lua'
}

files {
	"web-side/**",
}             


-- SkipS#1234