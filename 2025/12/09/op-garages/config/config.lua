Config                  = {}
Config.Locale = 'en' -- Script language, available: NL/PL/DE/EN/ES/SE
Config.FontAwesomeUrl = "https://kit.fontawesome.com/bbb738372b.js" -- to avoid icons dissapper change it to your own kit.
Config.FrameWork = "ESX" -- ESX OR QBCORE!
Config.FuelDependency = "none" -- none, cdn-fuel, ox-fuel, LegacyFuel, qs-fuel, rcore-fuel, codem-xfuel
Config.KeysDependency = "none" -- qs-keys, qb-keys, wasabi_carlock, sna-vehiclekeys
Config.DebugMode = false -- enable/disable debuging.

Config.Misc = {
    Notify = "esx", -- esx / qbcore / op-hud
    Target = "none",  -- none / ox-target / qb-target
    Icons = { -- target icons
        Vehicle = "fa-solid fa-square-parking",
        Boat = "fa-solid fa-sailboat",
        Plane = "fa-solid fa-plane",
        Helicopter = "fa-solid fa-helicopter"
    }, 
    RepairPrice = 2000,
    ToggleRepairFunction = true,
    TowingPrice = 2000,
    RepairTime = 5, -- in seconds
    TowingTime = 5, -- in seconds
    Blips = {
        Vehicle = {
            BlipId = 524, 
            BlipLabel = "Garage",
            BlipColor = 52,
            BlipSize = 0.8,
        },
        Plane = {
            BlipId = 569, 
            BlipLabel = "Airplane Hangar",
            BlipColor = 51,
            BlipSize = 0.8,
        },
        Helicopter = {
            BlipId = 360, 
            BlipLabel = "HeliPad",
            BlipColor = 29,
            BlipSize = 0.8,
        },
        Boat = {
            BlipId = 410, 
            BlipLabel = "Boats",
            BlipColor = 38,
            BlipSize = 0.8,
        },
    },
    Peds = {
        Toggle = true, 
        Boat = {
            Model = "u_m_y_party_01",
            Gender = "male",
            Marker = {
                Color = {r = 255, g = 255, b = 255}, -- When using markers
                ZoneSize = {x = 1.6, y = 1.6, z = 1.6},
                Icon = "fa-solid fa-money-bill-wave", -- When using target
            },
        },
        Plane = {
            Model = "a_m_y_hasjew_01",
            Gender = "male",
            Marker = {
                Color = {r = 255, g = 255, b = 255}, -- When using markers
                ZoneSize = {x = 1.6, y = 1.6, z = 1.6},
                Icon = "fa-solid fa-money-bill-wave", -- When using target
            },
        },
        Vehicle = {
            Model = "a_m_y_hasjew_01",
            Gender = "male",
            Marker = {
                Color = {r = 255, g = 255, b = 255}, -- When using markers
                ZoneSize = {x = 1.6, y = 1.6, z = 1.6},
                Icon = "fa-solid fa-money-bill-wave", -- When using target
            },
        },
        Helicopter = {
            Model = "a_m_m_eastsa_02",
            Gender = "male",
            Marker = {
                Color = {r = 255, g = 255, b = 255}, -- When using markers
                ZoneSize = {x = 1.6, y = 1.6, z = 1.6},
                Icon = "fa-solid fa-money-bill-wave", -- When using target
            },
            --[[Animation = {
                Prop = {
                    Prop = "prop_security_case_01",
                    PropBone = 57005,
                    PropPlacement = {
                        0.13,
                        0.0,
                        -0.01,
                        0.0,
                        280.0,
                        90.0
                    }
                },
                Dict = "move_weapon@jerrycan@generic",
                Lib = "idle"
            }--]] -- Example animation with prop.
        }
    }
} 

Config.PlayerAnimation = { -- Animation in garage.
    Toggle = true, 
    Prop = {
        Prop = "sf_p_sf_grass_gls_s_01a",
        PropBone = 28422,
        PropPlacement = {
            0.0000,
            0.0000,
            -0.1400,
            0.0000,
            0.0000,
            9.0000
        }
    },
    Dict = "amb@world_human_drinking@coffee@male@idle_a",
    Lib = "idle_c"
}

Config.ShowRoom = {
    Marker = {
        Color = {r = 255, g = 255, b = 255}, -- When using markers
        ZoneSize = {x = 1.6, y = 1.6, z = 1.6},
        Icon = "fa-solid fa-square-parking", -- When using target
    },
    EntranceCoords = vec4(1295.2756, 261.7921, -50.0573, 174.5392),
    ParkingSlots = {
        {
            Coords = vec4(1281.2789, 240.9465, -49.4692, 243.5022),
        },
        {
            Coords = vec4(1281.3644, 250.2220, -49.4689, 242.7067),
        },
        {
            Coords = vec4(1280.8601, 258.3342, -49.4696, 239.6884),
        },
        {
            Coords = vec4(1295.1112, 249.0047, -49.4691, 177.1261),
        },
        {
            Coords = vec4(1295.1277, 241.2695, -49.4692, 180.6348),
        },
        {
            Coords = vec4(1295.1410, 231.9178, -49.4692, 178.8318),
        },
        {
            Coords = vec4(1309.6279, 230.9311, -49.4691, 52.8349),
        },
        {
            Coords = vec4(1309.7224, 241.4225, -49.4700, 54.4629),
        },
        {
            Coords = vec4(1309.9415, 249.3070, -49.4696, 62.1490),
        },
        {
            Coords = vec4(1309.5300, 258.2726, -49.4688, 63.7715),
        },
    }
}