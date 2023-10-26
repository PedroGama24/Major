local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 217, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config              = {}
Config.OpenMenuSpawn= {x = 266.62, y = -1354.23, z = 24.53}

Config.Hash = {
	{hash = "f450ambo", detection = 2.4, depth = -1.0, height = 0.0},
	{hash = "e450ambo", detection = 2.4, depth = -1.0, height = 0.0},
	{hash = "16ramambo", detection = 2.4, depth = -1.0, height = 0.0},
	{hash = "20ramambo", detection = 2.4, depth = -1.0, height = 0.0},
}

Config.Press = {
	open_menu = Keys["Y"],
	take_bed = Keys["E"],
	do_action = Keys["E"],
	out_vehicle_bed = Keys["E"],
	release_bed = Keys["B"],
	in_vehicle_bed = Keys["E"],
	go_out_bed = Keys["E"],
	open_close_doors = Keys["E"],
	extend_powerload = Keys["Z"],
	take_stow_stretcher = Keys["G"],
	extra_1 = Keys["CAPS"],
}


Config.Language = {
	name_hospital = 'Stretcher',
	open_menu = 'Pressione ~b~E',
	do_action = 'Pressione ~INPUT_CONTEXT~ para interagir com a maca',
	take_bed = "Pressione ~INPUT_CONTEXT~ para levar maca",
	release_bed = "Pressione ~INPUT_SPECIAL_ABILITY_SECONDARY~ para soltar a maca",
	in_vehicle_bed = "Pressione ~INPUT_CONTEXT~ para guardar a maca",
	out_vehicle_bed = "Pressione ~INPUT_CONTEXT~ para recuperar maca",
	go_out_bed = "Levantar da cama",
	delete_bed = "Remover cama",
	toggle_backboard = "Alternar tabela",
	toggle_seat = "Alternar apoio de cabeça",
	lit_1 = "Cama sem matela",
	anim = {
		spawn_command = "Litter",
		lie_back = "Deitado",
		sit_right = "Sentar virado para direita",
		sit_left = "Sentar virado para esquerda",
		convulse = "Recieve CPR",
		pls = "Deitado de lado",
	}
}