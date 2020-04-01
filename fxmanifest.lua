--Create by
-- MrFr4g
-- Github: https://github.com/MrFr4g
-- Discord: 🐢 Matt 🔥#3030

fx_version 'adamant'

game 'gta5'

description 'A Character logout system for the esx_kashacters dependency.'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
	'config.lua'
}

dependency {
	'esx_kashacters'
}