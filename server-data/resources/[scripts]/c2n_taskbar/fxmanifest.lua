fx_version "cerulean"
game "gta5"

description "Sistema de taskbar com teclas"
version "1.0"

ui_page "nui/index.html"

shared_scripts {
    "config-main.lua"
}

client_scripts {
    "src/client.lua"
}

server_scripts {
    "src/server.lua"
}

files {
    "nui/*.*"
}

exports {
    "getTaskBar"
}

server_exports {
    "getTaskBar"
}
