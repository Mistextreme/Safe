Config = {}

Config.Command = {
    use = true,
    commandName = "fb_garage",
    event = "fb_garage:open", -- Avoid changing for security reasons

    jobs = {
        "police",
        "cardealer",
        "mecano",
        "ambulance"
    },

    types = {
        "Company",
        "Personal"
    },

    coords = {
        {
            id = 1,
            name = "Garage 1",
            jobs = {
                "police",
                "mecano"
            },
            garage = { x = 216.685715, y = -809.775818, z = 30.712036 },
            spawn = { x = 219.890106, y = -785.195618, z = 30.779541 },
            types = {
                "Company",
                "Impound"
            }
        },
        {
            id = 2,
            name = "Garage 2",
            jobs = { "ambulance" },
            garage = {
                x = 231.837372, y = -786.870300, z = 30.644653
            },
            spawn = {
                x = 225.613190, y = -765.876892, z = 30.796387
            },
            types = {
                "Company",
                "Impound",
                "Personal"
            }
        }
    },
    message = "Press ~INPUT_PICKUP~ to open the garage",
    vehicles = {
        {
            name = "Blista",
            model = "blista",
            brand = "Declasse",
            plate = "ABC123",
            owner = "VY.E",
            location = {
                "Company"
            }
        },
        {
            name = "Blista",
            model = "blista",
            brand = "Declasse",
            plate = "ABC123222",
            owner = "VY.ssssssE",
            location = "Company"
        },
        {
            name = "Blista",
            model = "blista",
            brand = "Declasse",
            plate = "ABC123222",
            owner = "VY.dsqdqsE",
            location = {
                "Company",
                "Impound"
            }
        },
        {
            name = "BITCH",
            model = "sultan2",
            brand = "Declasse",
            plate = "ABC123222",
            owner = "VY.dsqdqsE",
            location = {
                "Company",
                "Impound"
            }
        },
    }
}