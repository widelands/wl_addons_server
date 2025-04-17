addon_dirname = path.dirname(__file__)

push_textdomain("empire_defense_training.wad", true)

wl.Descriptions():modify_unit("tribe", "empire", "add_ware", "shield_steel", 4, 2, 1, { helptexts = { purpose =
                  _"This steel shield is produced in the armor smithy and used in the arena – together with food – to train soldiers from defense level 0 to level 1."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_ware", "shield_advanced", 4, 2, 1, { helptexts = { purpose =
                  _"These advanced shields are used by the best soldiers of the Empire. They are produced in the armor smithy and used in the colosseum – together with food – to train soldiers from defense level 1 to level 2."
               }})
               
wl.Descriptions():modify_unit("tribe", "empire", "add_ware", "wheat", 1, 32, 12, { helptexts = { purpose =
                  _"Wheat is produced by farms and used by mills and breweries. Donkey farms, sheep farms and piggeries also need to be supplied with wheat."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_ware", "grape", 1, 32, 10, { helptexts = { purpose =
                  _"These grapes are the base for a tasty wine. They are harvested in a vineyard and processed in a winery."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_ware", "wine", 1, 32, 8, { helptexts = { purpose =
                  _"This tasty wine is drunk by the miners working the marble and gold mines. It is produced in a winery."
               }})

pop_textdomain()
