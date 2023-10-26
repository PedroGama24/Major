resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

client_script {
	"@vrp/lib/utils.lua",
    "config.lua",
    "radialmenu.lua"
}


ui_page "html/menu.html"

files {
	"html/*.html",
	"html/*.min.js",
	--Veiculo
    "html/*.png",
}
