cfg_policeWebhookRendezVousPolice = "https://discord.com/api/webhooks/939530952810561577/hImbGVk6oO_lL0R3TC7JBOZ72hQW2xuiLA3IoPnc-OF7FYrD799_jn-zSVWLJlvHrkp8" -- Metez le webhook de votre salon disocrd cfg_policeure pour le job ems 


cfg_police = {

     MarkerType = 22, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
     MarkerSizeLargeur = 0.3, -- Largeur du marker
     MarkerSizeEpaisseur = 0.3, -- Épaisseur du marker
     MarkerSizeHauteur = 0.3, -- Hauteur du marker
     MarkerDistance = 6.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
     MarkerColorR = 69, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorG = 112, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorB = 246, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
     MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
     MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

     TextCoffre = "Appuyez sur ~p~[E] ~s~pour accèder au ~p~coffre ~s~!",  -- Text Menu coffre
     TextVestaire = "Appuyez sur ~p~[E] ~s~pour pour accèder au ~p~vestaire ~s~!", -- Text Menu Vestaire
     TextGarageVehicule = "Appuyez sur ~p~[E] ~s~pour accèder au ~p~garage ~s~!",  -- Text Garage Voiture
     TextRentreVehicule = "Appuyez sur ~p~[E] ~s~pour renger le ~p~véhicule ~s~!",  -- Text Rentré Voiture
     TextGarageHeli = "Appuyez sur ~p~[E] ~s~pour accèder au ~p~garage ~s~!",  -- Text Garage Hélico
     TextAccueil = "Appuyez sur ~p~[E] ~s~pour parler a la secrétaire ~s~!",  -- Text Ascenseur

 VehiculesPolice = { 
       {buttoname = "Police - Vélo", disc = "Uniquement à partir de Recrue", rightlabel = "→→", spawnname = "scorcher", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "Police - Cruiser", disc = "Uniquement à partir de Recrue", rightlabel = "→→", spawnname = "police", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "Police - Interceptor", disc = "Uniquement à partir de Officier I", rightlabel = "→→", spawnname = "police3", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "Police - Buffalo", disc = "Uniquement à partir de Officier II", rightlabel = "→→", spawnname = "police2", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "Police - Lexus GS 350", disc = "Uniquement à partir de Sergent I", rightlabel = "→→", spawnname = "polgs350", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "SWAT - Granger", disc = "Uniquement à partir de Sergent I", rightlabel = "→→", spawnname = "fbi2", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "SWAT - RIOT", disc = "Uniquement à partir de Sergent I", rightlabel = "→→", spawnname = "riot", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "SWAT - Insurgent", disc = "Uniquement à partir de Sergent I", rightlabel = "→→", spawnname = "insurgent2", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "Police - Felon Banalisée", disc = "Uniquement à partir de Lieutenant", rightlabel = "→→", spawnname = "policefelon", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "Police - Range Rover", disc = "Uniquement à partir de Capitaine", rightlabel = "→→", spawnname = "rover", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
       {buttoname = "Police - Maserati", disc = "Uniquement à partir de Commandant", rightlabel = "→→", spawnname = "ghispo2", spawnzone = vector3(437.0840, -986.215, 25.69), headingspawn = 270.174}, -- Garage Voiture
},

HelicoPolice = { 
 	{buttonameheli = "Hélicoptère", rightlabel = "→→", spawnnameheli = "polmav", spawnzoneheli = vector3(449.1641, -981.3759, 43.6913), headingspawnheli = 93.3062}, -- Garage Hélico
},

 amende = {
    ["amende "] = {
        {label = 'Usage abusif du klaxon', price = 1500},
        {label = 'Franchir une ligne continue', price = 1500},
        {label = 'Circulation à contresens', price = 1500},
        {label = 'Demi-tour non autorisé', price = 1500},
        {label = 'Circulation hors-route', price = 1500},
        {label = 'Non-respect des distances de sécurité', price = 1500},
        {label = 'Arrêt dangereux / interdit', price = 1500},
        {label = 'Stationnement gênant / interdit', price = 1500},
        {label = 'Non respect  de la priorité à droite', price = 1500},
        {label = 'Non-respect à un véhicule prioritaire', price = 1500},
        {label = 'Non-respect d\'un stop', price = 1500},
        {label = 'Non-respect d\'un feu rouge', price = 1500},
        {label = 'Dépassement dangereux', price = 1500},
        {label = 'Véhicule non en état', price = 1500},
        {label = 'Conduite sans permis', price = 1500},
        {label = 'Délit de fuite', price = 1500},
        {label = 'Excès de vitesse < 5 kmh', price = 1500},
        {label = 'Excès de vitesse 5-15 kmh', price = 1500},
        {label = 'Excès de vitesse 15-30 kmh', price = 1500},
        {label = 'Excès de vitesse > 30 kmh', price = 1500},
        {label = 'Entrave de la circulation', price = 1500},
        {label = 'Dégradation de la voie publique', price = 1500},
        {label = 'Trouble à l\'ordre publique', price = 1500},
        {label = 'Entrave opération de police', price = 1500},
        {label = 'Insulte envers / entre civils', price = 1500},
        {label = 'Outrage à agent de police', price = 1500},
        {label = 'Menace verbale ou intimidation envers civil', price = 1500},
        {label = 'Menace verbale ou intimidation envers policier', price = 1500},
        {label = 'Manifestation illégale', price = 1500},
        {label = 'Tentative de corruption', price = 1500},
        {label = 'Arme blanche sortie en ville', price = 1500},
        {label = 'Arme léthale sortie en ville', price = 1500},
        {label = 'Port d\'arme non autorisé (défaut de license)', price = 1500},
        {label = 'Port d\'arme illégal', price = 1500},
        {label = 'Pris en flag lockpick', price = 1500},
        {label = 'Vol de voiture', price = 1500},
        {label = 'Vente de drogue', price = 1500},
        {label = 'Fabriquation de drogue', price = 1500},
        {label = 'Possession de drogue', price = 1500},
        {label = 'Prise d\'ôtage civil', price = 1500},
        {label = 'Prise d\'ôtage agent de l\'état', price = 1500},
        {label = 'Braquage particulier', price = 1500},
        {label = 'Braquage magasin', price = 1500},
        {label = 'Braquage de banque', price = 1500},
        {label = 'Tir sur civil', price = 1500},
        {label = 'Tir sur agent de l\'état', price = 1500},
        {label = 'Tentative de meurtre sur civil', price = 1500},
        {label = 'Tentative de meurtre sur agent de l\'état', price = 1500},
        {label = 'Meurtre sur civil', price = 1500},
        {label = 'Meurte sur agent de l\'état', price = 1500}, 
        {label = 'Escroquerie à l\'entreprise', price = 1500},
    }
},

PoliceCloak = {
    clothes = {
        specials = {
            [0] = {
                label = "Reprendre sa tenue : ~y~Civile",
                 minimum_grade = 0,
                variations = {male = {}, female = {}},
                onEquip = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },

        grades = {

            [1] = {
                label = "S'équiper de la tenue : ~b~Cadet",
                minimum_grade = 0,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 55,   ['torso_2'] = 0,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 2,
                        ['pants_1'] = 33,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['helmet_1'] = 46,  ['helmet_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 5,   ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 48,   ['torso_2'] = 0,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 14,
                        ['pants_1'] = 32,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['helmet_1'] = 45,  ['helmet_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 3,  ['bproof_2'] = 1,
                    }
                },
                onEquip = function()
                end
            },

            [2] = {
                label = "S'équiper de la tenue : ~b~Officier",
                minimum_grade = 1,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 55,   ['torso_2'] = 0,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 2,
                        ['pants_1'] = 33,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 5,   ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 48,   ['torso_2'] = 0,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 14,
                        ['pants_1'] = 32,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 3,   ['bproof_2'] = 1,
                    }
                },
                onEquip = function()
                end
            },

            [3] = {
                label = "S'équiper de la tenue : ~b~Sergent",
                minimum_grade = 4,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 111,  ['torso_2'] = 0,
                        ['decals_1'] = 78,  ['decals_2'] = 0,
                        ['arms'] = 4,
                        ['pants_1'] = 33,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 5,   ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 79,   ['torso_2'] = 0,
                        ['decals_1'] = 87,   ['decals_2'] = 0,
                        ['arms'] = 14,
                        ['pants_1'] = 32,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 3,  ['bproof_2'] = 1,
                    }
                },
                onEquip = function()
                end
            },

            [4] = {
                label = "S'équiper de la tenue : ~b~Lieutenant",
                minimum_grade = 6,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 50,   ['torso_2'] = 0,
                        ['decals_1'] = 78,   ['decals_2'] = 0,
                        ['arms'] = 4,
                        ['pants_1'] = 33,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 5,   ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 43,   ['torso_2'] = 0,
                        ['decals_1'] = 87,  ['decals_2'] = 0,
                        ['arms'] = 3,
                        ['pants_1'] = 32,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 3,   ['bproof_2'] = 1,
                    }
                },
                onEquip = function()
                end
            },

            [5] = {
                label = "S'équiper de la tenue : ~b~Capitaine",
                minimum_grade = 7,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 321,  ['torso_2'] = 0,
                        ['decals_1'] = 78,  ['decals_2'] = 0,
                        ['arms'] = 4,
                        ['pants_1'] = 33,   ['pants_2'] = 0,
                        ['shoes_1'] = 10,    ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 3,
                        ['bproof_1'] = 5,   ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 103,  ['torso_2'] = 1,
                        ['decals_1'] = 87,  ['decals_2'] = 0,
                        ['arms'] = 0,
                        ['pants_1'] = 32,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 3,   ['bproof_2'] = 1,
                    }
                },
                onEquip = function()
                end
            },

            [6] = {
                label = "S'équiper de la tenue : ~b~Commandant",
                minimum_grade = 8,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 384,   ['torso_2'] = 0,
                        ['decals_1'] = 78,   ['decals_2'] = 0,
                        ['arms'] = 1,
                        ['pants_1'] = 33,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 5,
                        ['bproof_1'] = 5,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 101,  ['tshirt_2'] = 0,
                        ['torso_1'] = 139,   ['torso_2'] = 1,
                        ['decals_1'] = 87,   ['decals_2'] = 0,
                        ['arms'] = 0,
                        ['pants_1'] = 32,   ['pants_2'] = 0,
                        ['shoes_1'] = 24,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 44,     ['bags_2'] = 0,
                        ['bproof_1'] = 3,  ['bproof_2'] = 1,
                    }
                },
                onEquip = function()
                end
            },
        }
    }
},

armurie = {
    {
        grade = "Recruit",
        minimum_grade = 0,
        weapons = {
            "weapon_flashlight",
            "weapon_stungun",
            "WEAPON_NIGHTSTICK"
        }
    },
    {
        grade = "Officier I",
        minimum_grade = 1,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
        }
    },
    {
        grade = "Officier II",
        minimum_grade = 2,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
        }
    },
    {
        grade = "Officier III",
        minimum_grade = 3,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
        }
    },
    {
        grade = "SLO",
        minimum_grade = 4,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
        }
    },
    {
        grade = "Sergent I",
        minimum_grade = 5,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            --"WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "Sergent II",
        minimum_grade = 6,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            --"WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "lieutenant",
        minimum_grade = 7,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "Capitaine",
        minimum_grade = 8,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "Commandant",
        minimum_grade = 9,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "Debuty Chief",
        minimum_grade = 10,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "Assistance Chief",
        minimum_grade = 11,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "Chief",
        minimum_grade = 12,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            "WEAPON_SNIPERRIFLE"
        }
    }
},

Position = {
 	    Coffre = {vector3(448.94113, -997.3993, 30.6895)}, -- Menu coffre 
        Vestaire = {vector3(461.07910, -996.447937, 30.6895)}, -- Menu Vestaire 
        Accueil = {vector3(441.15133, -981.8668, 30.68)}, -- Menu Pour Accueil 
        GarageVehicule = {vector3(441.53, -984.64, 25.7)}, -- Menu Garage Vehicule
        RentreVehicule = {vector3(452.05, -986.62, 25.7)}, -- Menu Garage Vehicule
 	    GarageHeli = {vector3(449.17761, -981.4251, 43.6913)}, -- Menu Garage Helico
    },

    props = {
        {label = "Police Barrière", prop = "prop_barrier_work05"},
        {label = "Cone", prop = "prop_roadcone02a"},
        {label = "Herse", prop = "p_ld_stinger_s"}
    }
}