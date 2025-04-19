addon_dirname = path.dirname(__file__)
push_textdomain("lutas_atlanteans.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-----------------------
-- NEW MINES

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_low_ironmine", { 
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Low Iron Mine
            purpose = pgettext("building", "Digs iron ore out of the ground in mountain terrain."),
            -- TRANSLATORS: Lore helptext for an Atlantean production site: Low Iron Mine
           lore = pgettext("atlanteans_building", [[‘Way down here in this low mine<br>]] ..
                                          [[where the sun it dare not shine,<br>]] ..
                                          [[I sweat and toil till day is done,<br>]] ..
                                          [[but I’ll be back with morning come.’]]),
            -- TRANSLATORS: Lore author helptext for an Atlantean production site:  Low Iron Mine
            lore_author = pgettext("atlanteans_building", "Song from the miners’ guild"),
            -- TRANSLATORS: Performance helptext for an Atlantean production site: Low Iron Mine
            performance = pgettext("atlanteans_building", "If the food supply is steady, this mine can produce iron ore in %s on average."):bformat(format_seconds(25))
         }})

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_low_coalmine", { 
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Low Coal Mine
            purpose = pgettext("building", "Digs coal out of the ground in mountain terrain."),
            -- TRANSLATORS: Lore helptext for an Atlantean production site: Low Coal Mine
            lore = pgettext("atlanteans_building", [[‘Way down here in this low mine<br>]] ..
                                          [[where the sun it dare not shine,<br>]] ..
                                          [[I sweat and toil till day is done,<br>]] ..
                                          [[but I’ll be back with morning come.’]]),
            -- TRANSLATORS: Lore author helptext for an Atlantean production site:  Low Coal Mine
            lore_author = pgettext("atlanteans_building", "Song from the miners’ guild"),
            -- TRANSLATORS: Performance helptext for an Atlantean production site: Low Coal Mine
            performance = pgettext("atlanteans_building", "If the food supply is steady, this mine can produce coal in %s on average."):bformat(format_seconds(19))
         }})

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_low_crystalmine", { 
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Low Crystal Mine
            purpose = pgettext("atlanteans_building", "Carves precious (and normal) stones out of the rock in mountain terrain."),
            -- TRANSLATORS: Lore helptext for an Atlantean production site: Low Crystal Mine
            lore = pgettext("atlanteans_building", "No, no, there is no need to build a deep mine. This low mine ensures a quick supply of sufficient amount of the hardest diamonds for our double tridents."),
            -- TRANSLATORS: Lore author helptext for an Atlantean production site: Low Crystal Mine
            lore_author = pgettext("atlanteans_building", "An impatient trainer can’t wait his first double trident delivery"),
            -- TRANSLATORS: Performance helptext for an Atlantean production site: Low Crystal Mine
            performance = pgettext("atlanteans_building", "If this building is fully supplied and all minerals are needed by the economy, production of one granite takes %1$s, one quartz takes %2$s and one diamond takes %3$s on average. If only one kind of mineral is needed by the economy, production of one granite takes %4$s, one quartz takes %5$s and one diamond takes %6$s on average."):bformat(format_seconds(43), format_minutes_seconds(1, 37), format_minutes_seconds(3, 14), format_seconds(29), format_seconds(42), format_seconds(58))
         }})

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_low_goldmine", { 
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Low Gold Mine
            purpose = pgettext("building", "Digs gold ore out of the ground in mountain terrain."),
            -- TRANSLATORS: Lore helptext for an Atlantean production site: Low Gold Mine
            lore = pgettext("atlanteans_building", "We Atlanteans are very proud of our weaving abilities and we are especially proud of our golden tabards. That is why a quick supply of gold into our spinning mills is question of honour for us."),
            -- TRANSLATORS: Lore author helptext for an Atlantean production site: Low Gold Mine
            lore_author = pgettext("atlanteans_building", "A priestess is ashamed by not having golden tabards for soldiers"),
            -- TRANSLATORS: Performance helptext for an Atlantean production site: Low Gold Mine
            performance = pgettext("atlanteans_building", "If the food supply is steady, this mine can produce gold ore in %s on average."):bformat(format_seconds(39))
         }})

wl.Descriptions():modify_unit("building", "atlanteans_low_ironmine", "enhancement", {
        name = "atlanteans_ironmine",
        enhancement_cost = {
            log = 3,
            planks = 3
        },
        enhancement_return_on_dismantle = {
            log = 1,
            planks = 1
        },
    })
wl.Descriptions():modify_unit("building", "atlanteans_low_coalmine", "enhancement", {
        name = "atlanteans_coalmine",
        enhancement_cost = {
            log = 3,
            planks = 3
        },
        enhancement_return_on_dismantle = {
            log = 1,
            planks = 1
        },
    })
wl.Descriptions():modify_unit("building", "atlanteans_low_crystalmine", "enhancement", {
        name = "atlanteans_crystalmine",
        enhancement_cost = {
            log = 3,
            planks = 3
        },
        enhancement_return_on_dismantle = {
            log = 1,
            planks = 1
        },
    })
wl.Descriptions():modify_unit("building", "atlanteans_low_goldmine", "enhancement", {
        name = "atlanteans_goldmine",
        enhancement_cost = {
            log = 3,
            planks = 3
        },
        enhancement_return_on_dismantle = {
            log = 1,
            planks = 1
        },
    })

-----------------------
--IMMOVABLES

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_immovable", "seashell1", { helptexts = { purpose =
                  _"Fishers can collect this type of seashells for meat. They appear on shores around temple when priestess prays to the God Lutas before improving soldiers health."
               }})
wl.Descriptions():modify_unit("tribe", "atlanteans", "add_immovable", "seashell2", { helptexts = { purpose =
                  _"Fishers can collect this type of seashells for meat. They appear on shores around temple when priestess prays to the God Lutas before improving soldiers health."
               }})

-----------------------
--WORKERS

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_worker", "atlanteans_priestess", 4, nil, nil, { 
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean worker: Priestess
            purpose = pgettext("building", "Works in temple and improves soldiers in ‘Health’."),
            -- TRANSLATORS: Note helptext for an Atlantean worker: Priestess
            note = pgettext("atlanteans_building", "The priestess has to pray to the God Lutas on a shore. Make sure she has free access to water. Lutas is showing her his favour when a seashell appears on the cost. This seashell can be collected by a fisher for meat later."),
         }})

-----------------------
-- BUILDINGS

wl.Descriptions():modify_unit("productionsite", "atlanteans_weaponsmithy", "input", "add_ware", "diamond", 4)

-- Fisher's house and woodcutter's house added only because of helptext change

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_fishers_house", { 
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Fisher's House
            purpose = pgettext("atlanteans_building", "Fishes on the coast near the fisher’s house and collects seashells too."),
            note = {
               -- TRANSLATORS: Note helptext for an Atlantean production site: Fisher's House, part 1
               pgettext("atlanteans_building", "The fisher’s house needs water full of fish within the work area."),
               -- TRANSLATORS: Note helptext for an Atlantean production site: Fisher's House, part 2
               pgettext("atlanteans_building", "Build a fish breeder’s house close to the fisher’s house to make sure that you don’t run out of fish."),
               -- TRANSLATORS: Note helptext for an Atlantean production site: Fisher's House, part 3
               pgettext("atlanteans_building", "Roads and trees along the shoreline block fishing."),
            },
            -- TRANSLATORS: Note lore for an Atlantean production site: Fisher's House use some local fiser song as you like
            lore = pgettext("atlanteans_building", [[‘Take your net and come to the sea<br>]] ..
                                          [[In the early morning the moon ya still see<br>]] ..
                                          [[Collect ya catch by net or by spear,<br>]] ..
                                          [[and don’t forget to give Lutas his share.’]]),
            -- TRANSLATORS: Note lore_author for an Atlantean production site: Fisher's House
            lore_author = pgettext("atlanteans_building", "A song from the fishers’ guild"),
            performance = {
               -- TRANSLATORS: Performance helptext for an Atlantean production site: Fisher's House, part 1
               pgettext("atlanteans_building", "The fisher can catch two fishes and collect one seashell between %1$s and %2$s, depending on how far he has to walk. If there are no seashells, it takes between %3$s and %4$s to catch one fish."):bformat(format_minutes_seconds(1, 11), format_minutes_seconds(2, 37), format_seconds(26), format_seconds(55)),
               -- TRANSLATORS: Performance helptext for an Atlantean production site: Fisher's House, part 2
               pgettext("atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }})

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_woodcutters_house", { 
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Woodcutter's House
            purpose = pgettext("building", "Fells trees in the surrounding area and processes them into logs."),
            -- TRANSLATORS: Note helptext for an Atlantean production site: Woodcutter's House
            note = pgettext("atlanteans_building", "The woodcutter’s house needs trees to fell within the work area. The woodcutter in this house is 3 seconds faster than a normal Atlantean woodcutter."),
            -- TRANSLATORS: Note lore for an Atlantean production site: Woodcutter's House
            lore = pgettext("atlanteans_building", "We want to fell trees in a clean and dignified way, therefore we use saws. An ax is a tool used by other tribes only."),
            -- TRANSLATORS: Note lore_author for an Atlantean production site: Woodcutter's House
            lore_author = pgettext("atlanteans_building", "Atlantean woodcutter asked why saws are used to cut trees"),
            performance = {
               -- TRANSLATORS: Performance helptext for an Atlantean production site: Woodcutter's House, part 1
               pgettext("atlanteans_building", "This building can produce one log between %1$s and %2$s, depending on how far the woodcutter has to walk."):bformat(format_seconds(46), format_minutes_seconds(1, 26)),
               -- TRANSLATORS: Performance helptext for an Atlantean production site: Woodcutter's House, part 2
               pgettext("atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }})

--new training site

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_temple", { 
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Temple
            purpose = pgettext("building", "Improves soldiers in ‘Health’."),
            -- TRANSLATORS: Note helptext for an Atlantean production site: Temple
            note = pgettext("atlanteans_building", "The priestess has to pray to the God Lutas on a shore. Make sure she has free access to water. Lutas is showing her his favour when a seashell appears on the cost. This seashell can be collected by a fisher for meat."),
            -- TRANSLATORS: Lore helptext for an Atlantean training site: Temple
            lore = pgettext("atlanteans_building", "She spells seashells on the seashore of shallow sea. S-E-A-S-H-E-L-L-S."),
            -- TRANSLATORS: Lore author helptext for an Atlantean production site: Temple
            lore_author = pgettext("atlanteans_building", "An Atlantean spell, which is to be repeated ten times in quick pace"),
         }})

-----------------------
--SOLDIER BALANCE

wl.Descriptions():modify_unit("productionsite", "atlanteans_weaving_mill", "programs", "set", "produce_tabard_golden", {
         -- TRANSLATORS: Completed/Skipped/Did not start tailoring a golden tabard because ...
         descname = _("tailoring a golden tabard"),
         actions = {
            -- time: 20.4 + 20 + 3.6 = 44 sec
            "return=skipped unless economy needs tabard_golden",
            "consume=spider_silk gold_thread:2", -- one gold more to balance double trident
            "sleep=duration:20s400ms",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:20s",
            "produce=tabard_golden"
      }})

wl.Descriptions():modify_unit("productionsite", "atlanteans_weaponsmithy", "programs", "set", "produce_trident_double", {
      -- TRANSLATORS: Completed/Skipped/Did not start forging a diamond double trident because ...
      descname = _"forging a diamond double trident", 
      actions = {
            -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
            "return=skipped unless economy needs trident_double",
            "consume=iron coal:2 diamond planks", -- replaced one gold with one diamond to improve balance of soldiers without gold
                                                  -- and to increase need for crystals which is very low
            "sleep=duration:32s400ms",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=trident_double"
      }})

wl.Descriptions():modify_unit("productionsite", "atlanteans_weaponsmithy", "programs", "set", "produce_trident_heavy_double", {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a heavy double trident because ...
         descname = _("forging a heavy double trident"),
         actions = {
            -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
            "return=skipped unless economy needs trident_heavy_double",
            "consume=iron coal:2 diamond planks gold", -- replaced one iron with one diamond to increase need for crystals 
            "sleep=duration:32s400ms",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=trident_heavy_double"
      }})

-----------------------
--MILITARY SITES

wl.Descriptions():modify_unit("building", "atlanteans_guardhouse", "return_on_dismantle", "set", "log", 1) -- log added

-----------------------


pop_textdomain()
