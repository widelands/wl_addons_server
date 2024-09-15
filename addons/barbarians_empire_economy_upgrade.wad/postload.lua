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
                  purpose = _"Fishes on the coast near the fisher’s house.",
                  note    = _"The independent fisher works slowly but is able to fish in places where an ordinary fisher can't reach. He has a larger working area so you can get more fishes in total. It is useful only on open waters."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_independent_fishing_hut", { helptexts = {
                  purpose = _"Fishes on the coast near the fisher’s house.",
                  note    = _"The independent fisher works slowly but is able to fish in places where an ordinary fisher can't reach. He has a larger working area so you can get more fishes in total. It is useful only on open waters."
               }})
-----------------------
-- EMPIRE BUILDINGS

wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_stonemasons_house_advanced", { helptexts = { 
                  purpose = _"Carves marble columns out of marble.",
                  note    = _"Advanced stonemason's house needs less marble to produce one marble column. To produce one bulk of 3 columns the building need 4 pieces of marble in stock."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_farm_small", { helptexts = { 
                  purpose = _"Sows and harvests wheat.",
                  note    = _"Production of two small farms is approximately equal to production of one normal farm."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_mill_small", { helptexts = { 
                  purpose = _"Grinds wheat to produce flour.",
                  performance = pgettext("empire_building", "The miller needs %1% on average to grind wheat into a sack of flour."):bformat(format_seconds(34))
               }})
wl.Descriptions():modify_unit("building", "empire_stonemasons_house", "enhancement", {
        name = "empire_stonemasons_house_advanced",
        enhancement_cost = {
            log = 1,
            granite = 1,
            marble = 1,
            marble_column = 1,
            planks = 1
        },
        enhancement_return_on_dismantle = {
            log = 1,
            marble = 1,
            planks = 1
        },
    })
wl.Descriptions():modify_unit("building", "empire_farm_small", "enhancement", {
        name = "empire_farm",
        enhancement_cost = {
            marble = 1,
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            marble = 1,
            marble_column = 1
        },
    })
wl.Descriptions():modify_unit("building", "empire_mill_small", "enhancement", {
        name = "empire_mill",
        enhancement_cost = {
            log = 1,
            granite = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1
        },
    })

-----------------------
--SMELTING

wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_smelting_works_advanced", { helptexts = {
                  purpose = _"Smelts iron ore into iron and gold ore into gold.",
                  note    = _"Advanced smelting works needs just one lump of coal to produce 2 iron ingots or 2 bars of gold. The building produces iron and gold faster than basic smelting works. When there are not 2 pieces of required ore in stock, the building operates as a basic smelting works."
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_smelting_works_advanced", { helptexts = { 
		  purpose = _"Smelts iron ore into iron and gold ore into gold.",
                  note    = _"Advanced smelting works needs just one lump of coal to produce 2 iron ingots or 2 bars of gold. The building produces iron and gold faster than basic smelting works. When there are not 2 pieces of required ore in stock, the building operates as a basic smelting works."
               }})
wl.Descriptions():modify_unit("building", "barbarians_smelting_works", "enhancement", {
        name = "barbarians_smelting_works_advanced",
        enhancement_cost = {
            reed = 1,
            granite = 1,
            blackwood = 1,
            grout = 1
        },
        enhancement_return_on_dismantle = {
            reed = 1,
            grout = 1
        },
    })
wl.Descriptions():modify_unit("building", "empire_smelting_works", "enhancement", {
        name = "empire_smelting_works_advanced",
        enhancement_cost = {
            marble_column = 1,
            planks = 2
        },
        enhancement_return_on_dismantle = {
            marble = 1,
            planks = 1
        },
    })

-----------------------
--MILITARY SITES

wl.Descriptions():modify_unit("building", "barbarians_tower", "buildcost", "set", "blackwood", 4)
wl.Descriptions():modify_unit("building", "barbarians_tower", "buildcost", "set", "cloth", 1)

wl.Descriptions():modify_unit("building", "barbarians_fortress", "enhancement", {
      name = "barbarians_citadel",
      enhancement_cost = {
         blackwood = 2,
         cloth = 2,
         grout = 2
      },
      enhancement_return_on_dismantle = {
         blackwood = 1,
         cloth = 1,
         grout = 1
      }
   })
wl.Descriptions():modify_unit("building", "empire_fortress", "enhancement", {
      name = "empire_castle",
      enhancement_cost = {
         planks = 3,
         cloth = 1,
         marble_column = 3
      },
      enhancement_return_on_dismantle = {
         planks = 1,
         marble_column = 2
      }
   })

-----------------------


pop_textdomain()
