Config = {}

Config.Locale = 'en'
Config.OpenControl = 289
Config.TrunkOpenControl = 47
Config.DeleteDropsOnStart = true
Config.HotKeyCooldown = 1000
Config.DrawDistance = 30
Config.Draw3DDistance = 5
Config.CheckLicense = true
Config.BagItem = 'bag'
Config.BagSkinCommand = 'cantagiy'
Config.CyberLicence = {
    true,
}


Config.Shops = {

    ['Shops'] = {
        coords = {
            vector3(2557.458, 382.282, 106.622),
            vector3(3038.939, 585.954, 106.622),
            vector3(-3038.939, 1001.462, 7.908),
            vector3(547.431, 2671.710, 42.156),
            vector3(1961.464, 3740.672, 32.343),
            vector3(2678.916, 3280.671, 55.241),
            vector3(1729.563, 6414.126, 36.037),
            vector3(26.18, -1347.37, 29.5),
            vector3(-48.519, -1757.514, 29.421),
            vector3(-707.501, -914.260, 19.215),
            vector3(-1820.523, 792.518, 138.118),
            vector3(1698.388, 4924.404, 42.063),
            vector3(-1222.98, -907.04, 12.33),
            vector3(373.74, 325.96, 103.57),
            vector3(1166.024, 2708.930, 37.177),
            vector3(1392.562, 3604.684, 34.0)
        },
        items = {
            { name = "bread", price = 10, count = 1 },
            { name = "water", price = 7, count = 1 },
            { name = "cigarett", price = 3, count = 1 },
            { name = "cocacola", price = 0, count = 1 },
            { name = "beer", price = 15, count = 1 },
            { name = "lighter", price = 10, count = 1 },
            { name = "chips", price = 15, count = 1 },
            { name = "chocolate", price = 0, count = 1 },
            { name = "coffee", price = 0, count = 1 },
            { name = "cupcake", price = 0, count = 1 }
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~g~E~w~ - Shop',
        show3D = true,
        enableBlip = true,
        job = 'all'
    },
    
    ['Weapon Shop'] = {
        coords = {
            vector3(-662.1, -935.3, 20.8),
			vector3(810.19, -2157.3, 29.62),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.7, 6083.97, 31.45),
			vector3(252.08, -50.26, 69.94),
			vector3(22.39, -1106.79, 29.8),
			vector3(2567.7, 294.75, 108.73),
			vector3(-1117.49, 2698.6, 18.55),
			vector3(842.41, -1033.4, 28.19)
        },
        items = {
        	{ name = "WEAPON_PISTOL", price = 1060, count = 1, grade = 0 },
        	{ name = "WEAPON_SMG", price = 1060, count = 1, grade = 0 },
        	{ name = "WEAPON_ADVANCEDRIFLE", price = 1060, count = 1, grade = 0 },
        	{ name = "WEAPON_CARBINERIFLE", price = 1060, count = 1, grade = 0 },
        	{ name = "bulletproof", price = 1060, count = 1, grade = 0 },
            { name = "suppressor", price = 150, count = 1, grade = 0 },
            { name = "sight", price = 100, count = 1, grade = 0 },
            { name = "grip", price = 50, count = 1, grade = 0 },
            { name = "extended", price = 500, count = 1},
            { name = "goldtint", price = 450, count = 1},
            { name = "cyber_ammo_pistol", price = 500, count = 1, grade = 0 },
            { name = "cyber_ammo_rifle", price = 1000, count = 1, grade = 0 },
            { name = "cyber_ammo_shotgun", price = 1060, count = 1, grade = 0 },
            { name = "cyber_ammo_smg", price = 900, count = 1, grade = 0 },
            { name = "cyber_ammo_snp", price = 900, count = 1, grade = 0 },
        },
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~g~E~w~ - Shop',
        show3D = true,
        weaponBlip = true,
        job = 'all'
  
    },
}

Config.Stash = {
    ['LSPD'] = {
        coords = vector3(-1102.82, -820.917, 14.282),
        markerType = 27,
        markerColour = { r = 255, g = 255, b = 255 },
        msg = '~g~E~w~ - Stash',
        show3D = true,
        enableBlip = true,
        job = 'all'
    },
}

Config.Steal = {
    black_money = false,
    cash = true
}

Config.Seize = {
    black_money = false,
    cash = true
}

Config.VehicleLimit = {
    ['Zentorno'] = 10,
    ['Panto'] = 1,
    ['Zion'] = 5
}

--Courtesy DoctorTwitch
Config.VehicleSlot = {
    [0] = 34, --Compact
    [1] = 48, --Sedan
    [2] = 50, --SUV
    [3] = 29, --Coupes
    [4] = 10, --Muscle
    [5] = 10, --Sports Classics
    [6] = 10, --Sports
    [7] = 0, --Super
    [8] = 2, --Motorcycles
    [9] = 56, --Off-road
    [10] = 58, --Industrial
    [11] = 50, --Utility
    [12] = 78, --Vans
    [13] = 0, --Cycles
    [14] = 0, --Boats
    [15] = 0, --Helicopters
    [16] = 0, --Planes
    [17] = 38, --Service
    [18] = 38, --Emergency
    [19] = 560, --Military
    [20] = 0, --Commercial
    [21] = 0 --Trains
}

Config.Throwables = {
    WEAPON_MOLOTOV = 615608432,
    WEAPON_GRENADE = -1813897027,
    WEAPON_STICKYBOMB = 741814745,
    WEAPON_PROXMINE = -1420407917,
    WEAPON_SMOKEGRENADE = -37975472,
    WEAPON_PIPEBOMB = -1169823560,
    WEAPON_SNOWBALL = 126349499
}

Config.FuelCan = 883325847

--Durability Settings
Config.TimerQuality = 10

Config.DurabilityInvs = {
    [1] = {name = "motel"},
    [2] = {name = "trunk"},
    [2] = {name = "bag"}
}

Config.ItemDurabilityList = {
-- Weapons	
    ["WEAPON_ADVANCEDRIFLE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_APPISTOL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_ASSAULTRIFLE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_KNIFE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_ASSAULTSHOTGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_ASSAULTSMG"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_AUTOSHOTGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_BALL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_BAT"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_BATTLEAXE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_BULLPUPRIFLE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_BULLPUPSHOTGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_BZGAS"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_CARBINERIFLE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_COMBATMG"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_COMBATPDW"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_COMBATPISTOL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_COMPACTLAUNCHER"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_COMPACTRIFLE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_CROWBAR"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_DBSHOTGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_DIGISCANNER"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_DOUBLEACTION"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_FIREEXTINGUISHER"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_FIREWORK"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_FLAREGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_FLASHLIGHT"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_GARBAGEBAG"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_GOLFCLUB"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_GRENADE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_GRENADELAUNCHER"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_GUSENBERG"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_HAMMER"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_HANDCUFFS"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_HATCHET"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_HEAVYPISTOL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_HEAVYSHOTGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_HEAVYSNIPER"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_HOMINGLAUNCHER"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_KNUCKLE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MACHETE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MACHINEPISTOL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MARKSMANPISTOL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MARKSMANRIFLE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MG"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MICROSMG"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MINIGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MINISMG"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MOLOTOV"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_MUSKET"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_NIGHTSTICK"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_PETROLCAN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_PIPEBOMB"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_PISTOL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_PISTOL50"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_POOLCUE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_PROXMINE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_PUMPSHOTGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_RAILGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_RPG"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_SAWNOFFSHOTGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_SMG"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_SMOKEGRENADE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_SNIPERRIFLE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_SNOWBALL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_SNSPISTOL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_SPECIALCARBINE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_STICKYBOMB"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_STINGER"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_STUNGUN"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_SWITCHBLADE"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_VINTAGEPISTOL"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_WRENCH"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["WEAPON_FLARE"] = {QualityUse = true, outdated = 0.20, usable = true},

-- Attachment
    ["suppressor"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["light"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["grip"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["goldtint"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["extended"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["sight"] = {QualityUse = true, outdated = 0.20, usable = true},
    ["bulletproof"] = {QualityUse = true, outdated = 0.20, usable = true},


-- Ammo
	["cyber_ammo_pistol"] = {QualityUse = true, outdated = 0.00, usable = true},
	["cyber_ammo_pistol_large"] = {QualityUse = true, outdated = 0.00, usable = true},
	["cyber_ammo_rifle"] = {QualityUse = true, outdated = 0.00, usable = true},
	["cyber_ammo_rifle_large"] = {QualityUse = true, outdated = 0.00, usable = true},
	["cyber_ammo_shotgun"] = {QualityUse = true, outdated = 0.00, usable = true},
	["cyber_ammo_shotgun_large"] = {QualityUse = true, outdated = 0.00, usable = true},
	["cyber_ammo_smg"] = {QualityUse = true, outdated = 0.00, usable = true},
	["cyber_ammo_smg_large"] = {QualityUse = true, outdated = 0.00, usable = true},
	["cyber_ammo_snp"] = {QualityUse = true, outdated = 0.00, usable = true},
	["cyber_ammo_snp_large"] = {QualityUse = true, outdated = 0.00, usable = true},


-- Random items
	["bread"] = {QualityUse = true, outdated = 0.00, usable = false},
	["water"] = {QualityUse = true, outdated = 0.00, usable = false},
	["cigarett"] = {QualityUse = true, outdated = 0.00, usable = false},
	["beer"] = {QualityUse = true, outdated = 0.00, usable = false},
	["lighter"] = {QualityUse = true, outdated = 0.00, usable = false},
	["chips"] = {QualityUse = true, outdated = 0.00, usable = false},
	["chocolate"] = {QualityUse = true, outdated = 0.00, usable = false},
	["coffee"] = {QualityUse = true, outdated = 0.00, usable = false},
	["milk"] = {QualityUse = true, outdated = 0.00, usable = false},
	["cupcake"] = {QualityUse = true, outdated = 0.00, usable = false},
	["phone"] = {QualityUse = true, outdated = 0.00, usable = false},
	["cash"] = {QualityUse = true, outdated = 0.00, usable = false},
	["cocacola"] = {QualityUse = true, outdated = 0.00, usable = false},
}

Config.ItemUniqList = {
    ["bag"] = {auto = true, writesql = false}, --don't touch
    ["phone"] = {auto = false, writesql = true, sql = 'insert', table = 'phone_uniq'},
}

Locales['en'] = {
 -- Client side
    ['used'] = "Used",
    ['keyshop'] = "Press ~INPUT_CONTEXT~ to open Shop",
    ['keystash'] = "Press ~INPUT_CONTEXT~ to open Stash",
-- Server side
    ['drop'] = "Drop",
    ['glove'] = "Glove box",
    ['player'] = "Player",
    ['shop'] = "Shop",
    ['stash'] = "Stash",
    ['trunk'] = "Trunk",
    ['added'] = "Added",
    ['removed'] = "Removed",
    ['uniqmatch'] = "Slota uniq bir item koyun",
    ['Bag'] = "Bag",
} 
