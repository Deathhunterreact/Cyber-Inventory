resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'cyber-developer.com'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "shared.lua",
    "server/main.lua",
}

client_scripts {
    "shared.lua",
	"client/main.lua",
}

files {
    'weaponsnspistol.meta',
}

data_file 'WEAPONINFO_FILE_PATCH' 'weaponsnspistol.meta'