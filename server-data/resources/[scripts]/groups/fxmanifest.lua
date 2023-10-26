shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

---                   PROJETINHO FIVEM 
---             https://discord.gg/KYhm2J4axM

fx_version 'bodacious'
game 'gta5'

author 'Pequi Shop'
description 'Script for groups manager'
version '1.0.2'

ui_page 'html/index.html'

shared_scripts {
    "config.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server/*.lua"
}

client_scripts {
	'@vrp/lib/utils.lua',
	'client/*.lua'
}

files {
	'html/*',
	'html/**/*'
}

dependencies {
    'vrp'
}              