addon_dirname = path.dirname(__file__)
push_textdomain("barbarians_empire_economy_upgrade.wad", true)
-----------------------
--FISHING

wl.Descriptions():modify_unit("worker", "barbarians_fisher", "programs", "set", "independent_fishing", {
         "findspace=size:any radius:7 resource:resource_fish",
         "walk=coords",
         "animate=fish duration:12s",
         "mine=resource_fish radius:2",
         "createware=fish",
         "return"
      })
wl.Descriptions():modify_unit("worker", "empire_fisher", "programs", "set", "independent_fishing", {
         "findspace=size:any radius:7 resource:resource_fish",
         "walk=coords",
         "animate=fishing duration:12s",
         "mine=resource_fish radius:2",
         "createware=fish",
         "return"
      })
wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_independent_fishing_hut", { helptexts = {
                  purpose = _"The independent fisher works slowly but is able to fish in places where an ordinary fisher can't reach.",
                  note    = _"This fisher has a larger working area so you can get more fishes in total. It is useful only on open waters."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_independent_fishing_hut", { helptexts = {
                  purpose = _"The independent fisher works slowly but is able to fish in places where an ordinary fisher can't reach.",
                  note    = _"This fisher has a larger working area so you can get more fishes in total. It is useful only on open waters."
               }})
-----------------------
--SMELTING

wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_smelting_works_advanced", { helptexts = {
                  purpose = _"Advanced smelting works needs just one piece of coal to produce 2 pieces of iron or 2 bars of gold.",
                  note    = _"The building produces iron and gold faster than basic smelting works. When there are not 2 pieces of required ore in stock, the building operates as basic smelting works."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_smelting_works_advanced", { helptexts = { 
		  purpose = _"Advanced smelting works needs just one piece of coal to produce 2 pieces of iron or 2 bars of gold.",
                  note    = _"The building produces iron and gold faster than basic smelting works. When there are not 2 pieces of required ore in stock, the building operates as a basic smelting works."
               }})
-----------------------
--OTHER EMPIRE BUILDINGS

wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_stonemasons_house_advanced", { helptexts = { 
                  purpose = _"Advanced stonemason's house needs less marble to produce one marble column.",
                  note    = _"The building produces marble columns in bulk. To produce one bulk of 3 columns the building need 4 pieces of marble in stock."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_farm_small", { helptexts = { 
                  purpose = _"Produces wheat.",
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_mill_small", { helptexts = { 
                  purpose = _"Produces flour.",
               }})
-----------------------


pop_textdomain()
