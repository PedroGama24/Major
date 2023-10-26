fx_version 'adamant'
game 'gta5'

dependency "vrp"

server_scripts {
	"@vrp/lib/utils.lua",
	'server.lua',
	'lib/lib.lua',
}

client_scripts {
     "@vrp/lib/utils.lua",
	'client.lua'
}
