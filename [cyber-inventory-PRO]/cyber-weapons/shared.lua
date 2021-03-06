Config = {}

Config.Weapons = {
	-- // WEAPONS
	[GetHashKey("weapon_unarmed")] 				 = {["name"] = "weapon_unarmed", 		 	  	["label"] = "Hands", 					["type"] = "weapon",	["ammotype"] = nil},
	[GetHashKey("weapon_knife")] 				 = {["name"] = "weapon_knife", 			 	  	["label"] = "Knife", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_nightstick")] 			 = {["name"] = "weapon_nightstick", 		 	["label"] = "Nightstick", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_hammer")] 				 = {["name"] = "weapon_hammer", 			 	["label"] = "Hammer", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_bat")] 					 = {["name"] = "weapon_bat", 			 	  	["label"] = "Bat", 					    ["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_golfclub")] 			 = {["name"] = "weapon_golfclub", 		 	  	["label"] = "Golfclub", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_crowbar")] 				 = {["name"] = "weapon_crowbar", 		 	  	["label"] = "Crowbar", 				    ["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_pistol")] 				 = {["name"] = "weapon_pistol", 			 	["label"] = "Pistol", 					["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_pistol_mk2")] 			 = {["name"] = "weapon_pistol_mk2", 			["label"] = "Pistol Mk II", 			["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_combatpistol")] 		 = {["name"] = "weapon_combatpistol", 	 	  	["label"] = "Combat Pistol", 			["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_appistol")] 			 = {["name"] = "weapon_appistol", 		 	  	["label"] = "AP Pistol", 				["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_pistol50")] 			 = {["name"] = "weapon_pistol50", 		 	  	["label"] = "Pistol .50 Cal", 			["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_microsmg")] 			 = {["name"] = "weapon_microsmg", 		 	  	["label"] = "Micro SMG", 				["type"] = "weapon", 	["ammotype"] = "AMMO_SMG"},
	[GetHashKey("weapon_smg")] 				 	 = {["name"] = "weapon_smg", 			 	  	["label"] = "SMG", 						["type"] = "weapon", 	["ammotype"] = "AMMO_SMG"},
	[GetHashKey("weapon_assaultsmg")] 			 = {["name"] = "weapon_assaultsmg", 		 	["label"] = "Assault SMG", 				["type"] = "weapon", 	["ammotype"] = "AMMO_SMG"},
	[GetHashKey("weapon_assaultrifle")] 		 = {["name"] = "weapon_assaultrifle", 	 	  	["label"] = "Assault Rifle", 			["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE"},
	[GetHashKey("weapon_carbinerifle")] 		 = {["name"] = "weapon_carbinerifle", 	 	  	["label"] = "Carbine Rifle", 			["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE"},
	[GetHashKey("weapon_advancedrifle")] 		 = {["name"] = "weapon_advancedrifle", 	 	  	["label"] = "Advanced Rifle", 			["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE"},
	[GetHashKey("weapon_mg")] 					 = {["name"] = "weapon_mg", 				 	["label"] = "Machinegun", 				["type"] = "weapon", 	["ammotype"] = "AMMO_MG"},
	[GetHashKey("weapon_combatmg")] 			 = {["name"] = "weapon_combatmg", 		 	  	["label"] = "Combat MG", 				["type"] = "weapon", 	["ammotype"] = "AMMO_MG"},
	[GetHashKey("weapon_pumpshotgun")] 			 = {["name"] = "weapon_pumpshotgun", 	 	  	["label"] = "Pump Shotgun", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN"},
	[GetHashKey("weapon_sawnoffshotgun")] 		 = {["name"] = "weapon_sawnoffshotgun", 	 	["label"] = "Sawn-off Shotgun", 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN"},
	[GetHashKey("weapon_assaultshotgun")] 		 = {["name"] = "weapon_assaultshotgun", 	 	["label"] = "Assault Shotgun", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN"},
	[GetHashKey("weapon_bullpupshotgun")] 		 = {["name"] = "weapon_bullpupshotgun", 	 	["label"] = "Bullpup Shotgun", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN"},
	[GetHashKey("weapon_stungun")] 				 = {["name"] = "weapon_stungun", 		 	  	["label"] = "Taser", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_sniperrifle")] 			 = {["name"] = "weapon_sniperrifle", 	 	  	["label"] = "Sniper Rifle", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER"},
	[GetHashKey("weapon_heavysniper")] 			 = {["name"] = "weapon_heavysniper", 	 	  	["label"] = "Heavy Sniper", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER"},
	[GetHashKey("weapon_remotesniper")] 		 = {["name"] = "weapon_remotesniper", 	 	  	["label"] = "Remote Sniper", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER_REMOTE"},
	[GetHashKey("weapon_grenadelauncher")] 		 = {["name"] = "weapon_grenadelauncher", 	  	["label"] = "Grenade Launcher", 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER"},
	[GetHashKey("weapon_grenadelauncher_smoke")] = {["name"] = "weapon_grenadelauncher_smoke", 	["label"] = "Smoke Grenade Launcher", 	["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER"},
	[GetHashKey("weapon_rpg")] 					 = {["name"] = "weapon_rpg", 			      	["label"] = "RPG", 						["type"] = "weapon", 	["ammotype"] = "AMMO_RPG"},
	[GetHashKey("weapon_minigun")] 				 = {["name"] = "weapon_minigun", 		      	["label"] = "Minigun", 					["type"] = "weapon", 	["ammotype"] = "AMMO_MINIGUN"},
	[GetHashKey("weapon_grenade")] 				 = {["name"] = "weapon_grenade", 		      	["label"] = "Grenade", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_stickybomb")] 			 = {["name"] = "weapon_stickybomb", 		    ["label"] = "C4", 						["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_smokegrenade")] 		 = {["name"] = "weapon_smokegrenade", 	      	["label"] = "Rookbom", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_bzgas")] 				 = {["name"] = "weapon_bzgas", 			      	["label"] = "BZ Gas", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_molotov")] 				 = {["name"] = "weapon_molotov", 		      	["label"] = "Molotov", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_fireextinguisher")] 	 = {["name"] = "weapon_fireextinguisher",      	["label"] = "Brandblusser", 			["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_petrolcan")] 			 = {["name"] = "weapon_petrolcan", 		 	  	["label"] = "Benzineblik", 				["type"] = "weapon", 	["ammotype"] = "AMMO_PETROLCAN"},
	[GetHashKey("weapon_briefcase")] 			 = {["name"] = "weapon_briefcase", 		 	  	["label"] = "Suitcase", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_briefcase_02")] 		 = {["name"] = "weapon_briefcase_02", 	 	  	["label"] = "Suitcase", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_ball")] 				 = {["name"] = "weapon_ball", 			 	  	["label"] = "Bal", 						["type"] = "weapon", 	["ammotype"] = "AMMO_BALL"},
	[GetHashKey("weapon_flare")] 				 = {["name"] = "weapon_flare", 			 	  	["label"] = "Flare pistol", 			["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE"},
	[GetHashKey("weapon_snspistol")] 			 = {["name"] = "weapon_snspistol", 		 	  	["label"] = "SNS Pistol", 				["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_bottle")] 				 = {["name"] = "weapon_bottle", 			 	["label"] = "Gebroken fles", 			["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_gusenberg")] 			 = {["name"] = "weapon_gusenberg", 		 	  	["label"] = "Thompson SMG", 			["type"] = "weapon", 	["ammotype"] = "AMMO_MG"},
	[GetHashKey("weapon_specialcarbine")] 		 = {["name"] = "weapon_specialcarbine", 	 	["label"] = "Special Carbine", 			["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE"},
	[GetHashKey("weapon_heavypistol")] 			 = {["name"] = "weapon_heavypistol", 	 	  	["label"] = "Heavy Pistol", 			["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_bullpuprifle")] 		 = {["name"] = "weapon_bullpuprifle", 	 	  	["label"] = "Bullpup Rifle", 			["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE"},
	[GetHashKey("weapon_dagger")] 				 = {["name"] = "weapon_dagger", 			 	["label"] = "Dagger", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_vintagepistol")] 		 = {["name"] = "weapon_vintagepistol", 	 	  	["label"] = "Vintage Pistol", 			["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_firework")] 			 = {["name"] = "weapon_firework", 		 	  	["label"] = "Firework Launcher", 		["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_musket")] 			     = {["name"] = "weapon_musket", 			 	["label"] = "Musket", 					["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN"},
	[GetHashKey("weapon_heavyshotgun")] 		 = {["name"] = "weapon_heavyshotgun", 	 	  	["label"] = "Heavy Shotgun", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN"},
	[GetHashKey("weapon_marksmanrifle")] 		 = {["name"] = "weapon_marksmanrifle", 	 	  	["label"] = "Marksman Rifle", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER"},
	[GetHashKey("weapon_hominglauncher")] 		 = {["name"] = "weapon_hominglauncher", 	 	["label"] = "Homing Launcher", 			["type"] = "weapon", 	["ammotype"] = "AMMO_STINGER"},
	[GetHashKey("weapon_proxmine")] 			 = {["name"] = "weapon_proxmine", 		 	  	["label"] = "Proxmine Grenade", 		["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_snowball")] 		     = {["name"] = "weapon_snowball", 		 	  	["label"] = "Sneeuwbal", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_flaregun")] 			 = {["name"] = "weapon_flaregun", 		 	  	["label"] = "Flare Gun", 				["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE"},
	[GetHashKey("weapon_garbagebag")] 			 = {["name"] = "weapon_garbagebag", 		 	["label"] = "Vuilniszak", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_handcuffs")] 			 = {["name"] = "weapon_handcuffs", 		 	  	["label"] = "Handboeien", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_combatpdw")] 			 = {["name"] = "weapon_combatpdw", 		 	  	["label"] = "Combat PDW", 				["type"] = "weapon", 	["ammotype"] = "AMMO_SMG"},
	[GetHashKey("weapon_marksmanpistol")] 		 = {["name"] = "weapon_marksmanpistol", 	 	["label"] = "Marksman Pistol", 			["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_knuckle")] 				 = {["name"] = "weapon_knuckle", 		 	  	["label"] = "Knuckle", 				    ["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_hatchet")] 				 = {["name"] = "weapon_hatchet", 		 	  	["label"] = "Hatchet", 					["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_railgun")] 				 = {["name"] = "weapon_railgun", 		 	  	["label"] = "Railgun", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_machete")] 				 = {["name"] = "weapon_machete", 		 	  	["label"] = "Machete", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_machinepistol")] 		 = {["name"] = "weapon_machinepistol", 	 	  	["label"] = "Tec-9", 					["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_switchblade")] 			 = {["name"] = "weapon_switchblade", 	 	  	["label"] = "Switchblade", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_revolver")] 			 = {["name"] = "weapon_revolver", 		 	  	["label"] = "Revolver", 				["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL"},
	[GetHashKey("weapon_dbshotgun")] 			 = {["name"] = "weapon_dbshotgun", 		 	  	["label"] = "Double-barrel Shotgun", 	["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN"},
	[GetHashKey("weapon_compactrifle")] 		 = {["name"] = "weapon_compactrifle", 	 	  	["label"] = "Compact Rifle", 			["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE"},
	[GetHashKey("weapon_autoshotgun")] 			 = {["name"] = "weapon_autoshotgun", 	 	  	["label"] = "Auto Shotgun", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN"},
	[GetHashKey("weapon_battleaxe")] 			 = {["name"] = "weapon_battleaxe", 		 	  	["label"] = "Battle Axe", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_compactlauncher")] 		 = {["name"] = "weapon_compactlauncher",  	  	["label"] = "Compact Launcher", 		["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_minismg")] 				 = {["name"] = "weapon_minismg", 		 	  	["label"] = "Mini SMG", 				["type"] = "weapon", 	["ammotype"] = "AMMO_SMG"},
	[GetHashKey("weapon_pipebomb")] 			 = {["name"] = "weapon_pipebomb", 		 	  	["label"] = "Pipe bom", 				["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_poolcue")] 				 = {["name"] = "weapon_poolcue", 		 	  	["label"] = "Poolcue", 					["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_wrench")] 				 = {["name"] = "weapon_wrench", 			 	["label"] = "Wrench", 				    ["type"] = "weapon", 	["ammotype"] = nil},
	[GetHashKey("weapon_autoshotgun")] 		 	 = {["name"] = "weapon_autoshotgun", 	 		["label"] = "Sweeper Shotgun", 			["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN"},
}