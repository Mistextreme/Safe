return {


    ['capote_usager'] = {
        label = 'Capote Usagée',
        weight = 50,
        description = 'Un préservatif usagé, potentiellement contaminé.'
    },

    ['poile'] = {
        label = 'Poile de Cul',
        weight = 200,
        description = 'Sale et puante.'
    },

    ['plug_anal_sale'] = {
        label = 'Plug Anal Sale',
        weight = 120,
        description = 'Un plug anal sale nécessitant un nettoyage.'
    },

    ['brosse_a_dent_sale'] = {
        label = 'Brosse à Dents Sale',
        weight = 80,
        description = 'Une brosse à dents sale et malodorante.'
    },

    ['papier_pq_sale'] = {
        label = 'PQ Sale',
        weight = 30,
        description = 'Des feuilles de papier toilette sales et humides.'
    },

    ['doigt_coupe'] = {
        label = 'Doigt Coupé',
        weight = 20,
        description = 'Un doigt coupé, nécessitant des soins médicaux.'
    },

    ['nourriture_pourrie_verre'] = {
        label = 'Nourriture Pourrie',
        weight = 100,
        description = 'Nourriture pourrie avec des verres sales à l\'intérieur.'
    },

    ['mouchoir_sale'] = {
        label = 'Mouchoir Sale',
        weight = 10,
        description = 'Un mouchoir sale, imprégné de saleté.'
    },

    ['serviete_igienique_usager'] = {
        label = 'Serviette Hygiénique Usagée',
        weight = 40,
        description = 'Une serviette hygiénique usagée, nécessitant une élimination appropriée.'
    },

    ['culotte_sale'] = {
        label = 'Culotte Sale',
        weight = 30,
        description = 'Une culotte sale portée par un usager.'
    },










    ['ls_pickaxe'] = {
        label = 'Pioche',
        weight = 100,
        description = 'Outil utilisé pour miner des minerais.'
    },




    ['cartographers'] = {
        label = 'Cartographe',
        weight = 10,
        description = 'Outil utilisé pour cartographier des zones.',
        client = {
            event = 'core:openCartographers',
        }
    },
    ['spraycan'] = {
	    label = 'Spray Can',
	    weight = 160,
	    stack=false,
	    description="Get up to no good!",
	    client={
		    image="Spraypaint.png"
		    },
		server={
			export="jack-graffiti.spraycan"
		}
	},


    ['gode_sale'] = {
        label = 'Porte clé',
	    weight = 160,
	    stack=false,
		server={
			export="missKeys.UseKeysSlot"
		}
    },


    ["cleaningkit"] = {
	    label = "Cleaning Kit",
	    weight = 250,
	    stack = true,
	    close = true,
	    description = "A microfiber cloth with some soap will let your car sparkle again!",
	    durability = 100,
	    decay = true,
	    client = {
		    image = "cleaningkit.png",
		},
		server={
			export="jack-graffiti.cleaningkit"
		}
	},
    ['ciseaux'] = {
        label = 'Ciseaux',
        weight = 10,
        description = 'Outil utilisé pour couper les cheveux'
    },

    ['cafard'] = {
        label = 'Cafard',
        weight = 10,
        description = "C'est moche"
    },

    ['cooked_ratt'] = {
        label = 'Rat grillé',
        weight = 10,
        description = "De la viande de rat grillée prête à être consommée.",
        client = {
            status = { hunger = 20000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },

    ['sandwich_caffard'] = {
        label = 'Sandwich de Caffard',
        weight = 10,
        description = "Un sandwich dégoutant mais qui permet de reprendre des forces.",
        client = {
            status = { hunger = 20000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },

    ['rat'] = {
        label = 'Rat',
        weight = 10,
        description = "C'est poilu",
        client = {
            status = { hunger = 20000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },
    
    ['ls_copper_pickaxe'] = {
        label = 'Pioche en cuivre',
        weight = 10,
        description = 'Pioche fabriquée en cuivre, plus résistante.'
    },
    
    ['ls_iron_pickaxe'] = {
        label = 'Pioche en fer',
        weight = 10,
        description = 'Pioche robuste en fer, idéale pour miner des minerais plus durs.'
    },
    
    ['ls_silver_pickaxe'] = {
        label = 'Pioche en argent',
        weight = 100,
        description = 'Pioche précieuse en argent, efficace pour divers types de minage.'
    },
    
    ['ls_gold_pickaxe'] = {
        label = 'Pioche en or',
        weight = 10,
        description = 'Pioche luxueuse en or, très résistante et efficace.'
    },
    
    ['ls_copper_ore'] = {
        label = 'Minerai de cuivre',
        weight = 10,
        description = 'Minerai contenant du cuivre, utilisé pour la fabrication.'
    },
    
    ['ls_coal_ore'] = {
        label = 'Minerai de charbon',
        weight = 10,
        description = 'Minerai de charbon, source d\'énergie.'
    },
    
    ['ls_iron_ore'] = {
        label = 'Minerai de fer',
        weight = 10,
        description = 'Minerai de fer, utilisé pour fabriquer des outils et des structures.'
    },
    
    ['ls_silver_ore'] = {
        label = 'Minerai d\'argent',
        weight = 10,
        description = 'Minerai d\'argent, précieux pour la fabrication d\'objets.'
    },
    
    ['ls_gold_ore'] = {
        label = 'Minerai d\'or',
        weight = 10,
        description = 'Minerai d\'or, très précieux et utilisé pour divers artisanats.'
    },
    
    ['ls_copper_ingot'] = {
        label = 'Lingot de cuivre',
        weight = 150,
        description = 'Lingot raffiné de cuivre, utilisé pour la fabrication.'
    },
    
    ['ls_iron_ingot'] = {
        label = 'Lingot de fer',
        weight = 150,
        description = 'Lingot raffiné de fer, utilisé pour la fabrication d\'outils et structures.'
    },
    
    ['ls_silver_ingot'] = {
        label = 'Lingot d\'argent',
        weight = 150,
        description = 'Lingot raffiné d\'argent, utilisé pour des objets précieux.'
    },
    
    ['ls_gold_ingot'] = {
        label = 'Lingot d\'or',
        weight = 150,
        description = 'Lingot raffiné d\'or, utilisé pour des objets de grande valeur.'
    },

    ['basic_rod'] = {
        label = 'Canne à pêche basique',
        stack = true,
        weight = 250,
        description = 'Canne à pêche simple pour débuter la pêche.'
    },
    
    ['graphite_rod'] = {
        label = 'Canne en graphite',
        stack = true,
        weight = 350,
        description = 'Canne à pêche légère et résistante en graphite.'
    },
    
    ['titanium_rod'] = {
        label = 'Canne en titane',
        stack = true,
        weight = 450,
        description = 'Canne à pêche de haute qualité fabriquée en titane.'
    },
    
    ['worms'] = {
        label = 'Vers',
        weight = 10,
        description = 'Appât naturel pour la pêche.',
        degrade = 2880,
    },

    ['prop_container_03b'] = {
        label = 'Stockage',
        weight = 10,
        description = 'Un container pour stocker vos véhicules.',
        degrade = 2880,
    },
    ['artificial_bait'] = {
        label = 'Appât artificiel',
        weight = 30,
        description = 'Appât fabriqué artificiellement pour attirer les poissons.',
        degrade = 2880,
    },
    
    ['anchovy'] = {
        label = 'Anchois',
        weight = 20,
        description = 'Petits poissons utilisés comme appât ou en cuisine.',
        degrade = 2880,
    },
    
    ['grouper'] = {
        label = 'Mérou',
        weight = 3500,
        description = 'Grand poisson souvent recherché par les pêcheurs expérimentés.',
        degrade = 2880,
    },
    
    ['haddock'] = {
        label = 'Églefin',
        weight = 500,
        description = 'Poisson à chair délicate, apprécié en cuisine.',
        degrade = 2880,
    },
    
    ['mahi_mahi'] = {
        label = 'Mahi Mahi',
        weight = 3500,
        description = 'Poisson coloré, populaire pour sa saveur.'
    },
    
    ['piranha'] = {
        label = 'Piranha',
        weight = 1500,
        description = 'Poisson carnivore connu pour ses dents acérées.'
    },
    
    ['red_snapper'] = {
        label = 'Vivaneau rouge',
        weight = 2500,
        description = 'Poisson prisé pour sa chair savoureuse.'
    },
    
    ['salmon'] = {
        label = 'Saumon',
        weight = 1000,
        description = 'Poisson migrateur riche en nutriments.'
    },
    
    ['shark'] = {
        label = 'Requin',
        weight = 7500,
        description = 'Grand prédateur marin, souvent redouté.',
        degrade = 2880,
    },
    
    ['trout'] = {
        label = 'Truite',
        weight = 750,
        description = 'Poisson d\'eau douce apprécié par les pêcheurs.',
        degrade = 2880,
    },
    
    ['tuna'] = {
        label = 'Thon',
        weight = 10000,
        description = 'Grand poisson pélagique, très recherché.',
        degrade = 2880,
    },
    
    ["note"]  = {
        label = 'Note de survivant',
        weight = 0.0,
        allowArmed = true,
        description = 'Une note laissée par un survivant.',
        degrade = 2880,
    },

    ['huntingbait'] = {
        label = 'Appât de chasse',
        weight = 100,
        allowArmed = true,
        description = 'Appât utilisé pour attirer les animaux lors de la chasse.',
        degrade = 2880,
    },
    
    ['cooked_meat'] = {
        label = 'Viande cuite',
        weight = 200,
        description = 'Viande préparée pour être consommée.',
        client = {
            status = { hunger = 4000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },
    
    ['raw_meat'] = {
        label = 'Viande crue',
        weight = 200,
        description = 'Viande non cuite, nécessite préparation avant consommation.',
        degrade = 2880,
    },
    
    ['skin_deer_ruined'] = {
        label = 'Peau Déchirée',
        weight = 200,
        stack = true,
        description = 'Peau de cerf endommagée.'
    },
    
    ['skin_deer_low'] = {
        label = 'Peau usée',
        weight = 200,
        description = 'Peau de cerf montrant des signes d\'usure.'
    },
    
    ['skin_deer_medium'] = {
        label = 'Peau souple',
        weight = 200,
        description = 'Peau de cerf en bon état, souple au toucher.'
    },
    
    ['skin_deer_good'] = {
        label = 'Peau de première qualité',
        weight = 200,
        description = 'Peau de cerf de haute qualité, parfaite pour le travail du cuir.'
    },
    
    ['skin_deer_perfect'] = {
        label = 'Peau impeccable',
        weight = 200,
        description = 'Peau de cerf sans défauts, idéale pour les artisans.'
    },
    
    ['deer_horn'] = {
        label = 'Corne de cerf',
        weight = 1000,
        description = 'Corne retirée d\'un cerf, utilisée pour divers artisanats.'
    },
    
    -- Vêtements --
    ['outfit_cloth'] = {
        label = 'Tenue complète',
        weight = 100,
        stack = true, 
        close = false,
        description = 'Ensemble de vêtements complets.',
		buttons = {
			{
				label = 'Déchirée',
				action = function(slot)
                    TriggerServerEvent("core:destroyItem", slot)
                end
            },
        }
    },
    
    ['cloth_torso'] = {
        label = 'Veste',
        weight = 0,
        stack = true,
        close = false,
        description = 'Veste pour le haut du corps.',
		buttons = {
			{
				label = 'Déchirée',
				action = function(slot)
                    print("destroy")
                    TriggerServerEvent("core:destroyItem", slot)
                end
            },
        }
    },
    
    ['cloth_tshirt'] = {
        label = 'T-Shirt',
        weight = 0,
        stack = true,
        close = false,
        description = 'T-shirt basique.',
		buttons = {
			{
				label = 'Déchirée',
				action = function(slot)
                    TriggerServerEvent("core:destroyItem", slot)
                end
            },
        }
    },
    
    ['cloth_arms'] = {
        label = 'Manches',
        weight = 0,
        stack = true,
        close = false,
        description = 'Vêtements pour les bras.',
		buttons = {
			{
				label = 'Déchirée',
				action = function(slot)
                    TriggerServerEvent("core:destroyItem", slot)
                end
            },
        }
    },
    
    ['cloth_pants'] = {
        label = 'Pantalon',
        weight = 0,
        stack = true,
        close = false,
        description = 'Pantalon pour le bas du corps.',
		buttons = {
			{
				label = 'Déchirée',
				action = function(slot)
                    TriggerServerEvent("core:destroyItem", slot)
                end
            },
        }
    },
    
    ['cloth_shoes'] = {
        label = 'Chaussures',
        weight = 0,
        stack = true,
        close = false,
        description = 'Chaussures pour les pieds.',
		buttons = {
			{
				label = 'Déchirée',
				action = function(slot)
                    TriggerServerEvent("core:destroyItem", slot)
                end
            },
        }
    },
    
    ['cloth_decals'] = {
        label = 'Décals',
        weight = 0,
        stack = true,
        close = false,
        description = 'Décorations pour les vêtements.',
		buttons = {
			{
				label = 'Déchirée',
				action = function(slot)
                    TriggerServerEvent("core:destroyItem", slot)
                end
            },
        }
    },
    
    ['cloth_ears'] = {
        label = "Boucles d'oreilles",
        weight = 0,
        stack = true,
        close = false,
        description = 'Accessoires pour les oreilles.',
		buttons = {
			{
				label = 'Déchirée',
				action = function(slot)
                    TriggerServerEvent("core:destroyItem", slot)
                end
            },
        }
    },

    ['carkey'] = {
        label = 'Clé de véhicule',
    },
    
    ['lockpick'] = {
        label = 'Lockpick',
        weight = 160,
        decay = true,
        server = {
            export = 'mVehicle.lockpick'
        }
    },
    
    ['hotwire'] = {
        label = 'Cutter',
        weight = 160,
        server = {
            export = 'mVehicle.hotwire'
        }
    },
    
    ['fakeplate'] = {
        label = 'Fake Plate',
        consume = 0,
        server = {
            export = 'mVehicle.fakeplate'
        }
    },
    
    ['cloth_mask'] = {
        label = 'Masque',
        weight = 0,
        stack = true,
        close = false,
        description = 'Masque de protection ou de déguisement.'
    },
    
    ['cloth_bproof'] = {
        label= 'Gilet pare-balles',
        weight= 0,
        stack= false,
        close= false,
        description = 'Gilet de protection contre les balles.'
    },
    
    ['cloth_chain'] = {
        label = 'Collier',
        weight = 0,
        stack = true,
        close = false,
        description = 'Accessoire porté autour du cou.'
    },
    
    ['cloth_bags'] = {
        label = 'Sac',
        weight = 0,
        stack = true,
        close = false,
        description = 'Sac pour transporter des objets.'
    },
    
    ['cloth_glasses'] = {
        label = 'Lunettes',
        weight = 0,
        stack = true,
        close = false,
        description = 'Accessoire pour la vue.'
    },
    
    ['cloth_watches'] = {
        label = 'Montre',
        weight = 0,
        stack = true,
        close = false,
        description = 'Accessoire porté au poignet pour indiquer l\'heure.'
    },
    
    ['cloth_bracelets'] = {
        label = 'Bracelet',
        weight = 0,
        stack = true,
        close = false,
        description = 'Accessoire porté autour du poignet.'
    },
    
    ['cloth_helmet'] = {
        label = 'Casque',
        weight = 0,
        stack = true,
        close = false,
        description = 'Protection pour la tête.'
    },
    
    ['scrap'] = {
        label = 'Déchets métalliques',
        weight = 10,
        stack = true,
        close = false,
        description = 'Fragments de métal recyclables.'
    },
    ['boombox'] = {
        label = 'Boombox',
        weight = 10,
        stack = true,
        close = false,
        description = 'Radio portable pour écouter de la musique.'
    },
    
    ["fuel"] = {
        label = "Essence",
        weight = 100,
        stack = true,
        close = true,
        description = "Carburant utilisé pour les véhicules."
    },
    
    ["weap_bench"] = {
        label = "Banc d'armes",
        weight = 400,
        stack = true,
        close = true,
        description = "Banc pour fabriquer des armes.",
        client = {
            image = "pure_bench.png",
        }
    },
    
    ["misc_bench"] = {
        label = "Banc divers",
        weight = 400,
        stack = true,
        close = true,
        description = "Banc pour fabriquer des objets divers.",
        client = {
            image = "pure_bench.png",
        }
    },
    
    ['fish_cooked'] = {
        label = 'Poisson cuit',
        description = 'Poisson préparé à la cuisson pour la consommation.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },
    
    ['tomato'] = {
        label = 'Tomate',
        description = 'Fruit rouge utilisé en cuisine.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 78 * 60,
        client = {
            status = { hunger = 200 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },
    
    ['piece_of_wood'] = {
        label = 'Petit bout de bois',
        description = 'Un petit morceau de bois, utilisé pour divers artisanats.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
    },

    ['gps'] = {
        label = 'Gps',
        description = 'Appareil de navigation pour les véhicules.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['fishing_rod'] = {
        label = 'Canne à pêche',
        description = 'Outil utilisé pour attraper des poissons.',
        weight = 30,
        allowArmed = false,
        close = true,
        stack = true,
        client = {
            usetime = 1500,
            event = 'owx:startFishing',
        },
    },
    
    ['plastic'] = {
        label = 'Plastique',
        description = 'Morceaux de plastique divers et variés.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['screw'] = {
        label = 'Vis',
        description = 'Peuvent être utiles pour construire certaines choses.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['treated_wood'] = {
        label = 'Bois traité',
        description = 'Bois renforcé, utile pour des constructions durables.',
        weight = 50,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['fabrics'] = {
        label = 'Tissu',
        description = 'Morceaux de tissus divers et variés.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true, 
    },
    
    ['untreated_wood'] = {
        label = 'Bois brut',
        description = 'Bois non traité, nécessite un traitement pour une meilleure utilisation.',
        weight = 50,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['pile'] = {
        label = 'Pile',
        description = 'Utile pour certains objets électroniques.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['hinge'] = {
        label = 'Charnière',
        description = 'Peuvent être utiles pour construire certaines choses.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['plastic_bottle'] = {
        label = 'Bouteille en plastique',
        description = 'Contenant en plastique utilisé pour diverses applications.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['car_plug'] = {
        label = 'Bougie d\'allumage de voiture',
        description = 'Bougie utilisée dans les moteurs de voiture.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['cover'] = {
        label = 'Capot',
        description = 'Partie avant d\'un véhicule couvrant le moteur.',
        weight = 100,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['door'] = {
        label = 'Portière',
        description = 'Porte d\'un véhicule ou d\'un bâtiment.',
        weight = 100,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['printed_circuit'] = {
        label = 'Circuit imprimé',
        description = 'Composant électronique utilisé dans de nombreux appareils.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['steering_wheel'] = {
        label = 'Volant',
        description = 'Dispositif de contrôle directionnel pour véhicules.',
        weight = 80,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['bandage'] = {
        label = 'Bandage',
        description = 'Utilisé pour soigner les blessures.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        client = {
            status = { health = 2000 },
            anim = { dict = 'switch@franklin@plays_w_dog', clip = '001916_01_fras_v2_9_plays_w_dog_idle' },
            usetime = 5000,      
            cancel = true,
            notification = 'Vous avez appliqué un bandage.'
        }
    },
    
    ['dirt'] = {
        label = 'Terre',
        description = 'Matière organique utilisée dans la construction ou l\'agriculture.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['glass_bottle'] = {
        label = 'Bouteille en verre',
        description = 'Contenant en verre utilisé pour diverses applications.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['string'] = {
        label = 'Corde',
        description = 'Utilisée pour attacher ou suspendre des objets.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['adhesive_tape'] = {
        label = 'Ruban adhésif',
        description = 'Utilisé pour coller temporairement des objets.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['douille9'] = {
        label = 'Douille 9x19 mm',
        description = 'Matière première pour la fabrication de munitions 9x19 mm.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['douille45'] = {
        label = 'Douille 45 ACP',
        description = 'Matière première pour la fabrication de munitions 45 ACP.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['douille5'] = {
        label = 'Douille 5.56',
        description = 'Matière première pour la fabrication de munitions 5.56.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['douille7'] = {
        label = 'Douille 7.62',
        description = 'Matière première pour la fabrication de munitions 7.62.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['douille12'] = {
        label = 'Douille .12 Slug',
        description = 'Matière première pour la fabrication de munitions .12 Slug.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['balle9'] = {
        label = 'Balle 9x19 mm',
        description = 'Munition de calibre 9x19 mm.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['balle45'] = {
        label = 'Balle 45 ACP',
        description = 'Munition de calibre 45 ACP.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['balle7'] = {
        label = 'Balle 7.62',
        description = 'Munition de calibre 7.62.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['balle5'] = {
        label = 'Balle 5.56',
        description = 'Munition de calibre 5.56.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['balle12'] = {
        label = 'Balle .12 Slug',
        description = 'Munition de calibre .12 Slug.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['serflex'] = {
        label = 'Collier de serrage',
        description = 'Outil utilisé pour fixer ou maintenir des objets ensemble.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['sleeping_bag'] = {
        label = 'Sac de couchage',
        description = 'Équipement utilisé pour dormir à l\'extérieur.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['compress'] = {
        label = 'Compresse',
        description = 'Utilisée pour soigner les blessures ou pour appliquer des bandages.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['adrenalin'] = {
        label = 'Adrénaline',
        description = 'Substance médicale utilisée en cas d\'urgence.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['disinfectant'] = {
        label = 'Désinfectant',
        description = 'Produit utilisé pour nettoyer et désinfecter les plaies.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['vaccin'] = {
        label = 'Vaccin phase 1',
        description = 'Première phase de vaccination contre les infections.',
        weight = 30,
        degrade = 72000,
        client = {
            usetime = 1500,
        },
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['gunpowder'] = {
        label = 'Poudre à canon',
        description = 'Composant essentiel pour la fabrication de munitions.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['menotte'] = {
        label = 'Menottes',
        description = 'Outils de restriction utilisés par les forces de l\'ordre.',
        weight = 50,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['casserole'] = {
        label = 'Casserole',
        description = 'Ustensile de cuisine utilisé pour la cuisson.'
    },
    
    ['conserve_viande'] = {
        label = 'Conserve de viande',
        description = 'Viande conservée, prête à être consommée.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 4880,
    },
    
    ['conserve_legume'] = {
        label = 'Conserve de légumes',
        description = 'Légumes conservés, prêts à être consommés.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 4880,
    },
    
    ['brochette'] = {
        label = 'Brochette',
        description = 'Viande enfilée sur un bâton, prête à être cuite.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
        client = {
            status = { hunger = 8000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },
    
    ['conserve_cassoulet'] = {
        label = 'Conserve de cassoulet',
        description = 'Cassoulet en conserve, prêt à être réchauffé.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
        client = {
            status = { hunger = 20000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 4880,
    },
    
    ['coal'] = { 
        label = 'Charbon',
        description = 'Source d\'énergie utilisée pour le feu et la cuisson.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['bag_ciment'] = {
        label = 'Sac de ciment',
        description = 'Sac contenant du ciment pour la construction.',
        weight = 100,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['essence'] = {
        label = 'Essence',
        description = 'Carburant utilisé pour les moteurs à essence.',
        weight = 100,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['cadre_bmx'] = {
        label = 'Cadre de BMX',
        description = 'Structure principale d\'un vélo BMX.',
        weight = 80,
        allowArmed = false,
        close = false,
        stack = true,
    },
    ['bmx'] = {
        label = 'BMX',
        description = 'Vélo de type BMX.',
        weight = 1000,
        close = false,
        stack = false,
    },
    ['roue_bmx'] = {
        label = 'Roue de BMX',
        description = 'Roue utilisée pour les vélos BMX.',
        weight = 60,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['seringue'] = {
        label = 'Seringue',
        description = 'Instrument médical utilisé pour injecter des liquides.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['chimique'] = {
        label = 'Produits chimiques',
        description = 'Matières chimiques utilisées pour divers processus.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['souffre'] = {
        label = 'Soufre',
        description = 'Élément chimique utilisé dans diverses applications industrielles.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['map'] = {
        label = 'Carte',
        description = 'Carte indiquant les zones et les points d\'intérêt.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['lighter'] = {
        label = 'Briquet',
        description = 'Outil pour allumer des flammes.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },

    ['campfire'] = {
        label = 'Feu de camp',
        description = 'Allumez un feu pour se réchauffer ou cuisiner.',
        weight = 70,
        allowArmed = false,
        close = false,
        stack = true,
    },

    ['basic_tent'] = {
        label = 'Tente rudimentaire',
        description = 'Abri simple pour la nuit ou les activités en plein air.',
        weight = 100,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ["torch"] = {
        label = "Torche",
        weight = 1,
        stack = true,
        close = true,
        description = 'Source de lumière portable.',
        client = {
            image = 'torch.png',
            export = 'bzzz_torch_effect.useTorch'
        },
    },

    ['clean_fabric'] = {
        label = 'Tissu propre',
        description = 'Tissu nettoyé, prêt à être utilisé.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 10000 * 60,
    },
    
    ['clean_water_bottle'] = {
        label = "Bouteille d'eau traitée",
        description = 'Bouteille contenant de l\'eau purifiée.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['clean_water_bottle2'] = {
        label = "Gourde d'eau traitée",
        description = 'Gourde remplie d\'eau purifiée.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['gourde'] = {
        label = 'Gourde',
        description = 'Contenant pour transporter de l\'eau.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
        consume = 0,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },
    
    ['bicycle'] = {
        label = 'Vélo',
        description = 'Deux roues pour se déplacer rapidement.',
        weight = 100,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['box'] = {
        label = 'Coffre',
        description = 'Grand conteneur pour stocker des objets.',
        weight = 90,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['radio'] = {
        label = 'Radio',
        description = 'Appareil de communication sans fil.',
        weight = 35,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['medikit'] = {
        label = 'Trousse de secours',
        description = 'Kit de premiers secours pour soigner les blessures.',
        weight = 20,
        close = false,
        stack = true,
        client = {
            anim = { dict = 'switch@franklin@plays_w_dog', clip = '001916_01_fras_v2_9_plays_w_dog_idle' },
            usetime = 5000,      
            cancel = true,
            notification = 'Vous avez utilisé une trousse de secours.',
            export = 'core.useMedikit' -- Assurez-vous que 'core' est le nom de votre ressource
        }
    },
    
    
    ['testingkit'] = {
        label = 'Kit de test',
        description = 'Outils utilisés pour réaliser des tests ou des analyses.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['vaccin2'] = {
        label = 'Vaccin phase 2',
        description = 'Deuxième phase de vaccination contre les infections.',
        weight = 20,
        allowArmed = false,
        client = {
            usetime = 1500,
        },
        close = false,
        stack = true,
    },
    
    ['weed'] = {
        label = 'Cannabis',
        description = 'Plante utilisée à des fins récréatives ou médicales.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['meth'] = {
        label = 'Méthamphétamine',
        description = 'Stimulant puissant et illégal.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['hunting_knife'] = {  -- Correction de l'espace à la fin de la clé
        label = 'Couteau de chasse',
        description = 'Outil tranchant utilisé lors de la chasse.',
        weight = 50,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['machete'] = {
        label = 'Machette',
        description = 'Grand couteau utilisé pour couper la végétation dense.',
        weight = 50,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['molotov'] = {
        label = 'Cocktail Molotov',
        description = 'Dispositif incendiaire utilisé comme arme.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['battle_axe'] = {
        label = 'Hache de combat',
        description = 'Hache utilisée comme arme de mêlée.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['plomb'] = {
        label = 'Bille de plomb',
        description = 'Munition solide utilisée dans certaines armes.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['douille50'] = {
        label = 'Douille Cal.50',
        description = 'Matière première pour la fabrication de munitions Cal.50.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['balle50'] = {
        label = 'Balle Cal.50',
        description = 'Munition de calibre Cal.50.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['kevlar1'] = {
        label = 'Gilet pare-balles rudimentaire',
        description = 'Protection balistique de base.',
        weight = 50,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['kevlar2'] = {
        label = 'Gilet pare-balles expérimenté',
        description = 'Protection balistique avancée.',
        weight = 100,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['silentieux_pistol'] = {
        label = 'Silencieux pour pistolet',
        description = 'Accessoire pour réduire le bruit des tirs de pistolet.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['torche_pistol'] = {
        label = 'Torche pour pistolet',
        description = 'Accessoire lumineux pour pistolet.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },

    ['chargeur_pistol'] = {
        label = 'Chargeur grande capacité pour pistolet',
        description = 'Chargeur pouvant contenir plus de munitions pour pistolet.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['torche_pompe'] = {
        label = 'Torche pour pompe',
        description = 'Accessoire lumineux pour fusil à pompe.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['chargeur_mitraillette'] = {
        label = 'Chargeur grande capacité pour mitraillette',
        description = 'Chargeur pouvant contenir plus de munitions pour mitraillette.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['silentieux_mitraillette'] = {
        label = 'Silencieux pour mitraillette',
        description = 'Accessoire pour réduire le bruit des tirs de mitraillette.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['torche_mitraillette'] = {
        label = 'Torche pour mitraillette',
        description = 'Accessoire lumineux pour mitraillette.',
        weight = 300,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['charguer_fusil_assaut'] = {  -- Correction de la clé 'charguer' en 'chargeur'
        label = "Chargeur grande capacité pour fusil d'assaut",
        description = 'Chargeur pouvant contenir plus de munitions pour fusil d\'assaut.',
        weight = 300,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['silentieux_fusil_assaut'] = {
        label = "Silencieux pour fusil d'assaut",
        description = 'Accessoire pour réduire le bruit des tirs de fusil d\'assaut.',
        weight = 300,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['torche_fusil_assaut'] = {
        label = "Torche pour fusil d'assaut",
        description = 'Accessoire lumineux pour fusil d\'assaut.',
        weight = 300,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['moule_douille'] = {
        label = 'Moule à douille',
        description = 'Outil utilisé pour fabriquer des douilles de munitions.',
        weight = 800,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['generateur'] = {
        label = 'Générateur',
        description = 'Appareil produisant de l\'électricité.',
        weight = 1000,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['lamp_chantier'] = {
        label = 'Lampe de chantier',
        description = 'Source de lumière puissante pour les travaux.',
        weight = 900,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['frigo'] = {
        label = 'Réfrigérateur',
        description = 'Appareil pour conserver les aliments au frais.',
        weight = 2000,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['rateau'] = {
        label = 'Râteau',
        description = 'Outil de jardinage utilisé pour ratisser.',
        weight = 500,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['pelle'] = {
        label = 'Pelle',
        description = 'Outil utilisé pour creuser ou déplacer de la terre.',
        weight = 500,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['betonniere'] = {
        label = 'Bétonnière',
        description = 'Machine utilisée pour mélanger le béton.',
        weight = 800,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['plaque_metal'] = {
        label = 'Plaque de métal',
        description = 'Feuille de métal utilisée dans la construction.',
        weight = 700,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['pioche'] = {
        label = 'Pioche',
        description = 'Outil utilisé pour miner des minerais.',
        weight = 500,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['bidon'] = {
        label = "Bidon d'eau",
        description = 'Grand contenant pour transporter de l\'eau.',
        weight = 500,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['cement'] = {
        label = 'Ciment',
        description = 'Matériau de construction utilisé pour le béton.',
        weight = 200,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['plastic2'] = {
        label = 'Plastique renforcé',
        description = 'Plastique de haute résistance pour constructions robustes.',
        weight = 400,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['ressort'] = {
        label = 'Ressort',
        description = 'Composant mécanique utilisé dans divers dispositifs.',
        weight = 200,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['tournevis'] = {
        label = 'Tournevis',
        description = 'Outil utilisé pour visser ou dévisser des vis.',
        weight = 300,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['crochetage'] = {
        label = 'Outils de crochetage',
        description = 'Outils utilisés pour ouvrir les serrures sans clé.',
        weight = 400,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['hammer'] = {
        label = 'Marteau',
        description = 'Outil utilisé pour enfoncer des clous ou forcer des ouvertures.',
        weight = 400,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['arrosoir'] = {
        label = 'Arrosoir',
        description = 'Outil utilisé pour arroser les plantes.',
        weight = 500,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['poubelle'] = {
        label = 'Poubelle',
        description = 'Conteneur pour les déchets.',
        weight = 700,
        allowArmed = false,
        close = false,
        stack = true,
    },

    ['pneu'] = {
        label = 'Pneu',
        description = 'Composant circulaire utilisé sur les véhicules.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['battery'] = {
        label = 'Batterie',
        description = 'Source d\'énergie électrique rechargeable.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['chiffon'] = {
        label = 'Chiffon',
        description = 'Tissu utilisé pour le nettoyage.',
        weight = 40,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['repair_kit'] = {
        label = 'Kit de réparation',
        description = 'Ensemble d\'outils pour réparer des objets ou des équipements.',
        weight = 60,
        allowArmed = false,
        close = false,
        stack = true,
    },

    ['hammer_build'] = {
        label = 'Marteau de mécaniciens',
        description = 'Ensemble d\'outils pour réparer des objets ou des équipements.',
        weight = 60,
        allowArmed = false,
        close = false,
        stack = true,
    },

    ['english_key'] = {
        label = 'clé à molette',
        description = 'Ensemble d\'outils pour réparer des objets ou des équipements.',
        weight = 60,
        allowArmed = false,
        close = false,
        stack = true,
    },

    ['binoculars'] = {
        label = 'Jumelles',
        description = 'Dispositif optique pour observer à distance.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['ragout'] = {
        label = 'Ragout de viande',
        description = 'Plat à base de viande mijotée.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 2400 * 60,
        client = {
            status = { hunger = 18000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },

    ['vegetarian_curry'] = {
        label = 'Curry végétarien',
        description = 'Plat épicé à base de légumes.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        client = {
            status = { hunger = 18000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },

    ['smoked_fish'] = {
        label = 'Poisson fumé',
        description = 'Poisson préparé par fumage, conserve sa saveur.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 2880,
        client = {
            status = { hunger = 18000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        }
    },
    
    ['veg_skewer'] = {
        label = 'Brochette végétarienne',
        description = 'Brochette composée de légumes variés.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 2400 * 60,
        client = {
            status = { hunger = 18000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },

    ['soupe'] = {
        label = 'Soupe de légumes',
        description = 'Soupe chaude à base de divers légumes.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 2400 * 60,
        client = {
            status = { hunger = 80000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },
    
    ['fish'] = {
        label = 'Poisson',
        description = 'Poisson frais, prêt à être cuisiné.',
        weight = 100,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 2880,
    },
    
    ['sandwich'] = {
        label = 'Sandwich',
        description = 'Repas rapide composé de pain et de garnitures variées.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 2400 * 60,
        client = {
            status = { hunger = 9000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },
    
    ['jambon'] = {
        label = 'Jambon',
        description = 'Tranche de viande de porc, utilisée en cuisine.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 2400 * 60,
        client = {
            status = { hunger = 18000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },

    ['viande_cuite'] = {
        label = 'Viande cuite',
        description = 'Viande préparée pour être consommée.',
        weight = 20,
        allowArmed = false,
        close = false,
        stack = true,
        degrade = 2880,
    },
    
    ['alcool'] = {
        label = "Bouteille d'alcool",
        description = 'Contenant de boissons alcoolisées.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['valcool2'] = {
        label = 'Alcool (whisky, rhum, bière)',
        description = 'Boissons alcoolisées variées.',
        weight = 30,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['compost'] = {
        label = 'Compost',
        description = 'Matière organique décomposée utilisée comme engrais.',
        weight = 1200,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ['cuir'] = {
        label = 'Cuir',
        description = 'Matériau souple obtenu à partir de la peau des animaux.',
        weight = 10,
        allowArmed = false,
        close = false,
        stack = true,
    },
    
    ["bread"] = {
        label = "Pain",
        description = 'Produit de boulangerie à base de farine.',
        weight = 10,
        stack = true,
        close = true,
        client = {
            status = { hunger = 2000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_cs_steak',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },
    
    ["carokit"] = {
        label = "Kit de carrosserie",
        description = 'Ensemble de pièces pour réparer ou modifier une carrosserie de véhicule.',
        weight = 30,
        stack = true,
        close = true,
    },
    
    ["carotool"] = {
        label = "Outils de carrosserie",
        description = 'Outils spécialisés pour la réparation ou la modification des véhicules.',
        weight = 20,
        stack = true,
        close = true,
    },
    
    ["clothe"] = {
        label = "Tissu",
        description = 'Matière utilisée pour fabriquer des vêtements.',
        weight = 10,
        stack = true,
        close = true,
    },
    
    ["copper"] = {
        label = "Cuivre",
        description = 'Métal rougeâtre utilisé dans divers artisanats et constructions.',
        weight = 10,
        stack = true,
        close = true,
    },
    
    ["wood"] = {
        label = "Bois",
        description = 'Matériau naturel utilisé dans la construction et l\'artisanat.',
        weight = 100,
        stack = true,
        close = true,
    },
    
    ["fixkit"] = {
        label = "Kit de réparation",
        description = 'Ensemble d\'outils pour réparer des objets ou équipements.',
        weight = 3,
        stack = true,
        close = true,
    },
    
    ["fixtool"] = {
        label = "Outils de réparation",
        description = 'Outils nécessaires pour effectuer des réparations.',
        weight = 2,
        stack = true,
        close = true,
    },
    
    ["gazbottle"] = {
        label = "Bouteille de gaz",
        description = 'Contenant pour stocker du gaz.',
        weight = 2,
        stack = true,
        close = true,
    },
    
    ["iron"] = {
        label = "Fer",
        description = 'Métal utilisé dans de nombreux artisanats et constructions.',
        weight = 1,
        stack = true,
        close = true,
    },
    

    ["packaged_chicken"] = {
        label = "Filet de poulet emballé",
        description = 'Poulet préparé et emballé pour la consommation.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["packaged_plank"] = {
        label = "Planche emballée",
        description = 'Planche de bois préparée et emballée.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["petrol_raffin"] = {
        label = "Huile raffinée",
        description = 'Huile traitée et prête à être utilisée.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["stone"] = {
        label = "Pierre",
        description = 'Matière rocheuse utilisée dans la construction et l\'artisanat.',
        weight = 10,
        stack = true,
        close = true,
    },
    
    ["washed_stone"] = {
        label = "Pierre lavée",
        description = 'Pierre nettoyée, prête à être utilisée dans la construction.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["water"] = {
        label = "Eau",
        description = 'Liquide essentiel à la vie, utilisé pour boire et la cuisine.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["wool"] = {
        label = "Laine",
        description = 'Fibres textiles obtenues de certains animaux, utilisées pour fabriquer des vêtements.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["bkr_prop_biker_campbed_01"] = {
        label = "Lit en bois",
        description = 'Lit robuste en bois utilisé dans les camps de motards.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["bkr_prop_meth_table01a"] = {
        label = "Table médicale",
        description = 'Table utilisée pour les soins médicaux.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["gr_prop_gr_bench_02a"] = {
        label = "Table d\'armes",
        description = 'Station de travail pour fabriquer ou réparer des armes.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["gr_prop_gr_gunlocker_01a"] = {
        label = "Stockage métallique",
        description = 'Conteneur sécurisé pour stocker des objets métalliques.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["gr_prop_gr_hobo_stove_01"] = {
        label = "Feu de camp",
        description = 'Installation pour allumer un feu en extérieur.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_base_metal"] = {
        label = "Fondation métallique",
        description = 'Base en métal pour construire des structures.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_base_metal_triangle"] = {
        label = "Fondation métallique triangulaire",
        description = 'Base en métal avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_base_stone"] = {
        label = "Fondation en pierre",
        description = 'Base solide en pierre pour la construction.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_base_stone_triangle"] = {
        label = "Fondation en pierre triangulaire",
        description = 'Base en pierre avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_base_wood"] = {
        label = "Fondation en bois",
        description = 'Base en bois pour la construction.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_base_wood_triangle"] = {
        label = "Fondation en bois triangulaire",
        description = 'Base en bois avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_biggate_wood"] = {
        label = "Grande porte en bois",
        description = 'Grande porte robuste en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_biggateway_wood"] = {
        label = "Cadre de grande porte en bois",
        description = 'Structure de soutien pour une grande porte en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_bigwall_wood"] = {
        label = "Grande muraille en bois",
        description = 'Muraille imposante faite de bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceiling_metal"] = {
        label = "Plafond métallique",
        description = 'Plafond fabriqué en métal pour les structures.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceiling_metal_triangle"] = {
        label = "Plafond métallique triangulaire",
        description = 'Plafond en métal avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceiling_stone"] = {
        label = "Plafond en pierre",
        description = 'Plafond robuste en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceiling_stone_triangle"] = {
        label = "Plafond en pierre triangulaire",
        description = 'Plafond en pierre avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceiling_wood"] = {
        label = "Plafond en bois",
        description = 'Plafond fabriqué en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceiling_wood_triangle"] = {
        label = "Plafond en bois triangulaire",
        description = 'Plafond en bois avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceilingladder_metal_triangle"] = {
        label = "Échelle de plafond métallique triangulaire",
        description = 'Échelle intégrée au plafond avec une structure triangulaire en métal.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceilingladder_stone_triangle"] = {
        label = "Échelle de plafond en pierre triangulaire",
        description = 'Échelle intégrée au plafond avec une structure triangulaire en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceilingladder_wood_triangle"] = {
        label = "Échelle de plafond en bois triangulaire",
        description = 'Échelle intégrée au plafond avec une structure triangulaire en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceilingstairs_metal"] = {
        label = "Escaliers de plafond métalliques",
        description = 'Escaliers intégrés au plafond fabriqués en métal.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceilingstairs_stone"] = {
        label = "Escaliers de plafond en pierre",
        description = 'Escaliers intégrés au plafond fabriqués en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ceilingstairs_wood"] = {
        label = "Escaliers de plafond en bois",
        description = 'Escaliers intégrés au plafond fabriqués en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_door_metal"] = {
        label = "Porte métallique",
        description = 'Porte fabriquée en métal pour une meilleure sécurité.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_door_stone"] = {
        label = "Porte en pierre",
        description = 'Porte robuste en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_door_wood"] = {
        label = "Porte en bois",
        description = 'Porte traditionnelle en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_doorway_metal"] = {
        label = "Encadrement de porte métallique",
        description = 'Cadre de soutien pour portes métalliques.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_doorway_stone"] = {
        label = "Encadrement de porte en pierre",
        description = 'Cadre de soutien pour portes en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_doorway_wood"] = {
        label = "Encadrement de porte en bois",
        description = 'Cadre de soutien pour portes en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_gate_metal"] = {
        label = "Porte métallique",
        description = 'Grande porte fabriquée en métal.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_gate_stone"] = {
        label = "Porte en pierre",
        description = 'Grande porte robuste en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_gate_wood"] = {
        label = "Porte en bois",
        description = 'Grande porte traditionnelle en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_gateway_metal"] = {
        label = "Cadre de porte métallique",
        description = 'Structure de soutien pour grandes portes métalliques.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_gateway_stone"] = {
        label = "Cadre de porte en pierre",
        description = 'Structure de soutien pour grandes portes en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_gateway_wood"] = {
        label = "Cadre de porte en bois",
        description = 'Structure de soutien pour grandes portes en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_ladder_wood"] = {
        label = "Échelle en bois",
        description = 'Échelle fabriquée en bois pour accéder à des hauteurs.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_pillar_metal"] = {
        label = "Pylône métallique",
        description = 'Pylône de soutien fabriqué en métal.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_pillar_stone"] = {
        label = "Pylône en pierre",
        description = 'Pylône de soutien robuste en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_pillar_wood"] = {
        label = "Pylône en bois",
        description = 'Pylône de soutien fabriqué en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_stairs_metal"] = {
        label = "Escaliers métalliques",
        description = 'Escaliers fabriqués en métal pour les constructions.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_stairs_stone"] = {
        label = "Escaliers en pierre",
        description = 'Escaliers robustes en pierre pour les constructions.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_stairs_wood"] = {
        label = "Escaliers en bois",
        description = 'Escaliers traditionnels en bois pour les constructions.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_metal"] = {
        label = "Mur métallique",
        description = 'Mur fabriqué en métal pour une meilleure sécurité.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_metal_roof"] = {
        label = "Toit en métal",
        description = 'Toit robuste en métal pour les constructions.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_metal_roof_triangle"] = {
        label = "Toit triangulaire en métal",
        description = 'Toit en métal avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_metal_small"] = {
        label = "Petit mur métallique",
        description = 'Mur métallique de petite taille.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_metal_triangle"] = {
        label = "Mur métallique triangulaire",
        description = 'Mur en métal avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_stone"] = {
        label = "Mur en pierre",
        description = 'Mur robuste fabriqué en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_stone_roof"] = {
        label = "Toit en pierre",
        description = 'Toit robuste en pierre pour les constructions.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_stone_roof_triangle"] = {
        label = "Toit triangulaire en pierre",
        description = 'Toit en pierre avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_stone_small"] = {
        label = "Petit mur en pierre",
        description = 'Mur en pierre de petite taille.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_stone_triangle"] = {
        label = "Mur en pierre triangulaire",
        description = 'Mur en pierre avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_wood"] = {
        label = "Mur en bois",
        description = 'Mur traditionnel fabriqué en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_wood_roof"] = {
        label = "Toit en bois",
        description = 'Toit traditionnel en bois pour les constructions.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_wood_roof_triangle"] = {
        label = "Toit triangulaire en bois",
        description = 'Toit en bois avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_wood_small"] = {
        label = "Petit mur en bois",
        description = 'Mur en bois de petite taille.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_wall_wood_triangle"] = {
        label = "Mur en bois triangulaire",
        description = 'Mur en bois avec une structure triangulaire.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_window_metal"] = {
        label = "Fenêtre métallique",
        description = 'Fenêtre fabriquée en métal pour une meilleure sécurité.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_window_stone"] = {
        label = "Fenêtre en pierre",
        description = 'Fenêtre robuste en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_window_wood"] = {
        label = "Fenêtre en bois",
        description = 'Fenêtre traditionnelle en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_windowway_metal"] = {
        label = "Encadrement de fenêtre métallique",
        description = 'Structure de soutien pour fenêtres métalliques.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_windowway_stone"] = {
        label = "Encadrement de fenêtre en pierre",
        description = 'Structure de soutien pour fenêtres en pierre.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["model_windowway_wood"] = {
        label = "Encadrement de fenêtre en bois",
        description = 'Structure de soutien pour fenêtres en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["p_v_43_safe_s"] = {
        label = "Coffre-fort métallique Lv2",
        description = 'Coffre-fort de niveau 2 pour sécuriser des objets précieux.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["prop_box_wood01a"] = {
        label = "Stockage en bois",
        description = 'Conteneur en bois pour stocker des objets.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["prop_generator_01a"] = {
        label = "Générateur",
        description = 'Appareil produisant de l\'électricité.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["money"] = {
        label = "Capsule",
        description = 'Monnaie utilisée pour les transactions.',
        weight = 0.0,
        stack = true,
        close = true,
    },
    
    ["prop_money_bag_01"] = {
        label = "Sac d\'argent",
        description = 'Sac contenant de l\'argent.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["prop_planer_01"] = {
        label = "Machine de recyclage",
        description = 'Appareil utilisé pour recycler des matériaux.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["prop_tool_bench02_ld"] = {
        label = "Table de fabrication en bois",
        description = 'Station de travail pour fabriquer des objets en bois.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["prop_worklight_01a"] = {
        label = "Lampe de chantier 3",
        description = 'Source de lumière pour les travaux en chantier.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["prop_worklight_02a"] = {
        label = "Lampe de chantier",
        description = 'Source de lumière puissante pour les travaux.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["prop_worklight_04c"] = {
        label = "Lampe de chantier 2",
        description = 'Source de lumière supplémentaire pour les travaux.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["v_ind_cfcovercrate"] = {
        label = "Petit stock",
        description = 'Petit conteneur pour stocker des objets.',
        weight = 1,
        stack = true,
        close = true,
    },
    
    ["xm3_prop_xm3_whshelf_03a"] = {
        label = "Grand stock",
        description = 'Grand conteneur pour stocker de nombreux objets.',
        weight = 1,
        stack = true,
        close = true,
    },




    ["pomme"] = {
        label = "Pomme",
        description = 'Fruit frais et juteux.',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { hunger = 80000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_pineapple',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        },
        degrade = 2880,
    },

    ["citron"] = {
        label = "Citron",
        description = 'Citron frais et acidulé.',
        weight = 1,
        stack = true,
        close = true,
        degrade = 2880,
        client = {
            status = { hunger = 80000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_pineapple',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        }
    },

    ["ortie"] = {
        label = "Ortie",
        description = 'Plante utilisée pour ses vertus médicinales.',
        weight = 1,
        stack = true,
        close = true,
        degrade = 2880,
    },


    ["pissenlit"] = {
        label = "Pissenlit",
        description = 'Plante utilisée pour ses vertus médicinales.',
        weight = 1,
        stack = true,
        close = true,
        degrade = 2880,
    },

    ["houblons"] = {
        label = "houblons",
        description = 'Plante utilisée pour la fabrication de la bière.',
        weight = 1,
        stack = true,
        close = true,
        degrade = 2880,
    },

    ["poires"] = {
        label = "Poires",
        description = 'Fruit frais et juteux.',
        weight = 1,
        stack = true,
        close = true,
        degrade = 2880,
        client = {
            status = { hunger = 80000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_pineapple',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        }
    },

    ["canne_sucre"] = {
        label = "Canne à sucre",
        description = 'Plante utilisée pour la fabrication du sucre.',
        weight = 1,
        stack = true,
        degrade = 2880,
        close = true,
        client = {
            status = { hunger = 80000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_pineapple',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        }
    },

    ["abricot"] = {
        label = "Abricot",
        description = 'Fruit frais et juteux.',
        weight = 1,
        degrade = 2880,
        stack = true,
        close = true,
        client = {
            status = { hunger = 80000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = {
                model = 'prop_pineapple',
                pos = { x = 0.02, y = 0.02, z = -0.02},
                rot = { x = 0.0, y = 0.0, z = 0.0}
            },
            usetime = 2500,
        }
    },


    ["biere_ortie"] = {
        label = "Bière à l'ortie",
        description = 'Boisson alcoolisée à base d\'ortie.',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },

    ["liqueur_poire"] = {
        label = "Liqueur de poire",
        description = 'Boisson alcoolisée à base de poire.',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },

    ["liqueur_pomme"] = {
        label = "Liqueur de pomme",
        description = 'Boisson alcoolisée à base de pomme.',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },


    ["jus_pomme"] = {
        label = "Jus de pomme",
        description = 'Boisson non alcoolisée à base de pomme.',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },

    ["jus_abricot"] = {
        label = "Jus d'abricot",
        description = 'Boisson non alcoolisée à base d\'abricot.',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },

    ["jus_poire"] = {
        label = "Jus de poire",
        description = 'Boisson non alcoolisée à base de poire.',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },

    ["jus_citron"] = {
        label = "Jus de citron",
        description = 'Boisson non alcoolisée à base de citron.',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },

    ["limoncello"] = {
        label = "Limoncello",
        description = 'Boisson alcoolisée à base de citron.',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },

    ["sirop_sucre"] = {
        label = "Sirop de sucre",
        description = 'Sirop remplit de sucre',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },

    ["biere_artisanal"] = {
        label = "Bière Artisanal",
        description = 'Bière Artisanal maison',
        weight = 1,
        stack = true,
        close = true,
        client = {
            status = { thirst = 0 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
            usetime = 5000,
            cancel = true,
        }
    },
    


    ["plate_scrap"] = {
        label = "Plaque métalliques",
        description = 'Une plaque qui permet de créer de jolies choses',
        weight = 5,
        stack = true,
        close = true,
    },










	["alive_chicken"] = {
		label = "Living chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["gold"] = {
		label = "Gold",
		weight = 1,
		stack = true,
		close = true,
	},

	["marijuana"] = {
		label = "Marijuana",
		weight = 2,
		stack = true,
		close = true,
	},

	["slaughtered_chicken"] = {
		label = "Slaughtered chicken",
		weight = 1,
		stack = true,
		close = true,
	},

	["petrol"] = {
		label = "Oil",
		weight = 1,
		stack = true,
		close = true,
	},

	["cutted_wood"] = {
		label = "Cut wood",
		weight = 1,
		stack = true,
		close = true,
	},

	["diamond"] = {
		label = "Diamond",
		weight = 1,
		stack = true,
		close = true,
	},

	["phone"] = {
		label = "Phone",
		weight = 1,
		stack = true,
		close = true,
	},

	["fabric"] = {
		label = "Fabric",
		weight = 1,
		stack = true,
		close = true,
	},

	["cannabis"] = {
		label = "Cannabis",
		weight = 3,
		stack = true,
		close = true,
	},

	["blowpipe"] = {
		label = "Blowtorch",
		weight = 2,
		stack = true,
		close = true,
	},

	["grand_cru"] = {
		label = "Grand cru",
		weight = 1,
		stack = true,
		close = true,
	},

	["jus_raisin"] = {
		label = "Jus de raisin",
		weight = 1,
		stack = true,
		close = true,
	},

	["raisin"] = {
		label = "Raisin",
		weight = 1,
		stack = true,
		close = true,
	},

	["uvlight"] = {
		label = "UV Flashlight",
		weight = 1,
		stack = true,
		close = true,
	},

	["vine"] = {
		label = "Vin",
		weight = 1,
		stack = true,
		close = true,
	},
}