addon_dirname = path.dirname(__file__)
push_textdomain("barbarians_empire_economy_upgrade.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-- For lore texts
-- TRANSLATORS: Format string for a latin quote and its translation
quote_with_translation_format = pgettext("empire_lore", "‘%1%’<br>(%2%)")
function latin_lore(latin, translation)
   return quote_with_translation_format:bformat(latin, translation)
end

-----------------------
--FISHING

wl.Descriptions():modify_unit("worker", "barbarians_fisher", "programs", "set", "independent_fishing", {
         "findspace=size:any radius:7 resource:resource_fish",
         "walk=coords",
         "animate=fish duration:10s",
         "mine=resource_fish radius:2",
         "createware=fish",
         "return"
      })

wl.Descriptions():modify_unit("worker", "empire_fisher", "programs", "set", "independent_fishing", {
         "findspace=size:any radius:7 resource:resource_fish",
         "walk=coords",
         "animate=fishing duration:10s",
         "mine=resource_fish radius:2",
         "createware=fish",
         "return"
      })

wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_independent_fishing_hut", { helptexts = {
                  -- TRANSLATORS: Lore helptext for a Barbarian production site: Independent Fishing Hut
                  lore = pgettext("barbarians_building", "‘What do you mean, my fish ain’t fresh?!’"),
                  -- TRANSLATORS: Lore author helptext for a Barbarian production site: Independent Fishing Hut
                  lore_author = pgettext("barbarians_building", "Frequent response of a Barbarian fisherman,<br>often followed by an enjoyable brawl"),
                  purpose = _"Fishes on the coast near the fisher’s hut.",
                  note    = _"The independent fisher works slowly but is able to catch fish in places where an ordinary fisher can't reach. Thanks to his larger reach, you can get more fishes in total. It is useful only for open water.",
                  performance = {
                    -- TRANSLATORS: Performance helptext for an Empire production site: Independent Fishing Hut, part 1
                    pgettext("empire_building", "The fisher needs %1$s on average to catch one fish."):bformat(format_minutes_seconds(1, 5)),
                    -- TRANSLATORS: Performance helptext for an Empire production site: Independent Fishing Hut, part 2
                    pgettext("empire_building", "In case of slopes or obstacles in the way, the time is increased.")
               }}})

wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_independent_fishing_hut", { helptexts = {
                  lore = latin_lore(
                     -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                     --    Classical Latin quote meaning:
                     --    "Make haste slowly."
                     _("Festina lente."),
                     -- TRANSLATORS: Lore helptext for an Empire production site: Independent Fishing Hut
                     --    Translation for the classical Latin quote:
                     --    "Festina lente."
                     _("Make haste slowly.")),
                  -- TRANSLATORS: Lore author helptext for an Empire production site: Independent Fishing Hut
                  lore_author = pgettext("empire_building", "Fisherman’s secret to catch more fishes"),
                  purpose = _"Fishes on the coast near the fisher’s hut.",
                  note    = _"The independent fisher works slowly but is able to catch fish in places where an ordinary fisher can't reach. Thanks to his larger reach, you can get more fishes in total. It is useful only for open water.",
                  performance = {
                    -- TRANSLATORS: Performance helptext for an Empire production site: Independent Fishing Hut, part 1
                    pgettext("empire_building", "The fisher needs %1$s on average to catch one fish."):bformat(format_minutes_seconds(1, 5)),
                    -- TRANSLATORS: Performance helptext for an Empire production site: Independent Fishing Hut, part 2
                    pgettext("empire_building", "In case of slopes or obstacles in the way, the time is increased.")
               }}})
-----------------------
-- EMPIRE BUILDINGS

wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_stonemasons_house_advanced", { helptexts = { 
                  lore = latin_lore(
                     -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                     --    Classical Latin quote meaning:
                     --    optional translation: "Let us improve life through science and art."
                     _("Inventas vitam iuvat excoluisse per artes."),
                     -- TRANSLATORS: Lore helptext for an Empire production site: Advanced Stonemason's House
                     --    Translation for the classical Latin quote:
                     --    "Inventas vitam iuvat excoluisse per artes."
                     _("An innovative lifestyle helps to cultivate through art.")),
                  -- TRANSLATORS: Lore author helptext for an Empire production site: Advanced Stonemason's House
                  lore_author = pgettext("empire_building", "Motto of the Stonemasons’ Guild"),
                  purpose = _"Carves marble columns out of marble.",
                  note    = _"Advanced stonemason's house needs less marble to produce one marble column. To produce one bulk of 3 columns, 4 pieces of marble are needed.",
                  performance = pgettext("empire_building", "The stonemason needs %1% on average to carve one marble column."):bformat(format_seconds(46))
               }})

wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_farm_small", { helptexts = { 
                  lore = latin_lore(
                     -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                     --    Classical Latin quote meaning:
                     --    "Eggs today are better than chickens tomorrow."
                     _("Ad praesens ova cras pullis sunt meliora."),
                     -- TRANSLATORS: Lore helptext for an Empire production site: Small Farm
                     --    Translation for the adapted classical Latin quote:
                     --    "Ad praesens ova cras pullis sunt meliora."
                     _("Eggs today are better than chickens tomorrow.")),
                  -- TRANSLATORS: Lore author helptext for an Empire production site: Small Farm
                  lore_author = pgettext("empire_building", "An impatient farmer considers building a small farm while sitting in a warehouse during marble shortage"),
                  purpose = _"Sows and harvests wheat.",
                  note    = _"Production of two small farms is approximately equal to production of one normal farm."
               }})

wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_mill_small", { helptexts = { 
                  lore = latin_lore(
                     -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                     --    Classical Latin quote meaning:
                     --    "Work conquers all things."
                     _("Labor omnia vincit."),
                     -- TRANSLATORS: Lore helptext for an Empire production site: Small Mill
                     --    Translation for the classical Latin quote:
                     --    "Labor omnia vincit."
                     _("Work conquers all things.")),
                  -- TRANSLATORS: Lore author helptext for an Empire production site: Small Mill
                  lore_author = pgettext("empire_building", "A miller answering question whether his job wouldn’t be easier if he had a better mill"),
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
-- BARBARIANS BUILDINGS

wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_weaving_mill_small", { helptexts = { 
                  lore = pgettext("barbarians_building", [[‘Fine cloth and jewelry mean nothing to a true Barbarian.<br>]] ..
                                          [[But a noble sail in the wind will please his eyes.’]]),
                  lore_author = pgettext("barbarians_building", "Khantarakh, ‘The Modern Barbarian Economy’,<br>9ᵗʰ cowhide ‘Seafaring and Conquest’"),
                  purpose = _"Weaves cloth out of reed.",
                  note = _"This building operates as an ordinary weaving mill only 20% slower.",
                  performance = pgettext("barbarians_building", "The weaver needs %1% on average to weave reed into a piece of cloth."):bformat(format_seconds(60))
               }})

wl.Descriptions():modify_unit("building", "barbarians_weaving_mill_small", "enhancement", {
        name = "barbarians_weaving_mill",
        enhancement_cost = {
            log = 3,
            granite = 1,
        },
        enhancement_return_on_dismantle = {
            log = 1,
            granite = 1,

        },
    })

wl.Descriptions():modify_unit("productionsite", "barbarians_weaving_mill", "programs", "set", "main", {
      -- TRANSLATORS: Completed/Skipped/Did not start working because ...
      descname = _("weaving"),
      actions = {
            "sleep=duration:17s",
            "return=skipped unless economy needs cloth",
            "consume=reed:2",
            "playsound=sound/barbarians/weaver priority:90%",
            "animate=working duration:25s",
            "produce=cloth"
       }})


-----------------------
--SMELTING

wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_smelting_works_advanced", { helptexts = {
                  -- TRANSLATORS: Lore helptext for a Barbarian production site: Advanced Smelting Works
                  lore = pgettext("barbarians_building", [[‘From inferior looking rubble they form shiny gold and gleaming iron.<br>]] ..
                                          [[The smelters are real magicians among our craftsmen.’]]),
                  -- TRANSLATORS: Lore author helptext for a Barbarian production site: Advanced Smelting Works
                  lore_author = pgettext("barbarians_building", "Chat’Karuth<br>at the 5ᵗʰ conference of master craftsmen"),
                  -- TRANSLATORS: Purpose helptext for a Barbarian production site: Advanced Smelting Works
                  purpose = _"Smelts iron ore into iron and gold ore into gold.",
                  note    = _"Advanced smelting works needs just one lump of coal to produce 2 iron ingots or 2 bars of gold. The building produces iron and gold faster than a basic smelting works. When there are not 2 pieces of required ore in stock, the building operates as a basic smelting works.",
                  -- TRANSLATORS: Performance helptext for a Barbarian production site: Advanced Smelting Works
                  performance = pgettext("barbarians_building", "If this building is fully supplied and all metals are needed by the economy, production of four iron ingots and two gold bars takes %1$s on average. If only one kind of metal is needed by the economy, production of one iron ingot takes %2$s on average and production of one gold bar takes %3$s on average."):bformat(format_minutes_seconds(5, 6), format_seconds(41), format_minutes_seconds(1, 11))
               }})

wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_smelting_works_advanced", { helptexts = { 
                  lore = latin_lore(
                     -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                     --    Classical Latin quote meaning:
                     --    "Who gives promptly, gives twice."
                     _("Bis dat, qui cito dat."),
                     -- TRANSLATORS: Lore helptext for an Empire production site: Advanced Smelting Works
                     --    Translation for the classical Latin quote:
                     --    "Bis dat, qui cito dat."
                     _("Who gives promptly, gives twice.")),
                  -- TRANSLATORS: Lore author helptext for an Empire production site: Advanced Smelting Works
                  lore_author = pgettext("empire_building", "An old proverb which was, by invention of Advanced Smelting Works, proven to be correct"),
                  -- TRANSLATORS: Purpose helptext for an Empire production site: Advanced Smelting Works
		  purpose = _"Smelts iron ore into iron and gold ore into gold.",
                  note    = _"Advanced smelting works needs just one lump of coal to produce 2 iron ingots or 2 bars of gold. The building produces iron and gold faster than a basic smelting works. When there are not 2 pieces of required ore in stock, the building operates as a basic smelting works.",
                  -- TRANSLATORS: Performance helptext for an Empire production site: Advanced Smelting Works
                  performance = pgettext("empire_building", "If this building is fully supplied and all metals are needed by the economy, production of four iron ingots and two gold bars takes %1$s on average. If only one kind of metal is needed by the economy, production of one iron ingot takes %2$s on average and production of one gold bar takes %3$s on average."):bformat(format_minutes_seconds(4, 40), format_seconds(37), format_minutes_seconds(1, 6))
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
wl.Descriptions():modify_unit("building", "empire_blockhouse", "buildcost", "remove", "log")
--wl.Descriptions():modify_unit("militarysite", "empire_blockhouse", "conquers", 5)


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
wl.Descriptions():modify_unit("building", "empire_blockhouse", "enhancement", {
      name = "empire_sentry",
      enhancement_cost = {
         granite = 1
      },
      enhancement_return_on_dismantle = {
         granite = 1
      }
   })


-----------------------


pop_textdomain()
