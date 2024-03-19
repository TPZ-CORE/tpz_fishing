fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Nosmakos'
description 'TPZ-CORE Fishing'
version '1.0.0'

shared_scripts {
	"config.lua",
	"locales.lua",
}

client_scripts {
	'client/*.js',
	'client/*.lua'
}

server_script {
	'server/*.lua'
}

exports {
	'GET_TASK_FISHING_DATA',
	'SET_TASK_FISHING_DATA',
	'VERTICAL_PROBE'
}

lua54 'yes'