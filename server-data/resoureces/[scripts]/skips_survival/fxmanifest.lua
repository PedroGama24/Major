--shared_script "@AlphaAC/natives.lua"
fx_version 'cerulean'
game 'gta5'
author 'SkipS#1234'

ui_page 'nui/ui.html'


files {
	"nui/**",
	"nui/*",
    "nui/**/*"
}

client_script {
	"@vrp/lib/utils.lua",
	"skips_config.lua",
	"cl-side/*.lua"	
}

server_scripts {
	"@vrp/lib/utils.lua",
	"skips_config.lua",
	"sv-side/*.lua"
}      



