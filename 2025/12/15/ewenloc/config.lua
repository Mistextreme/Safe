config = {
    list = {
        -- Location standard
        downtown_rental = {
            marker = vector3(24.315577, -914.236572, 123.073135),
            blip = {
                label = "Location de véhicules",
                sprite = 225,
                color = 4
            },
            ped = {
                model = "s_m_y_dealer_01",
                pos = vector3(24.315577, -914.236572, 123.073135),
                heading = 180.0
            },
            spawns = {
                {pos = vector3(22.039545, -921.459473, 123.077698), heading = 121.46514129638672},
            },
            vehicles = {
                "bmx",
                "blista"
            }
        }
    },
    
    vehicles = {
        bmx = {price = 250},
        blista = {price = 600}
    }
}

return config