push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemasons_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Lime Kiln"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_stonemasons_house_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            grout = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2,
            marble = 2,
            planks = 1
        }
    },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 54, 74 },
      },
   },

   spritesheets = {
      working = {
         fps = 20,
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 54, 74 },
      },
   },

   aihints = {},

    working_positions = {
        europeans_stonemason_normal = 1,
        europeans_stonemason_basic = 2
    },

    inputs = {
        { name = "granite", amount = 6 },
        { name = "clay", amount = 6 },
        { name = "water", amount = 6 },
        { name = "coal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=mixing_grout",
                "call=burning_bricks",
                "call=burning_bricks_idle",
                "return=skipped"
            }
        },
        mixing_grout = {
            -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
            descname = pgettext("europeans_building", "mixing grout"),
            actions = {
                "return=skipped when economy needs granite",
                "return=skipped when economy needs water and not economy needs grout",
                "return=skipped when economy needs coal and not economy needs grout",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has granite:3",
                "return=skipped unless site has water:3",
                "consume=coal:2 granite:3 water:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:40s",
                "playsound=sound/barbarians/mortar priority:60%",
                "sleep=duration:3s",
                "produce=grout:3",
                "sleep=duration:30s"
            }
        },
        burning_bricks = {
            -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
            descname = pgettext("europeans_building", "burning bricks"),
            actions = {
                "return=skipped when economy needs granite",
                "return=skipped when economy needs coal and not economy needs brick",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has clay:3",
                "consume=coal:2 granite clay:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:40s",
                "sleep=duration:3s",
                "produce=brick:3",
                "sleep=duration:30s"
            }
        },
        burning_bricks_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs brick",
                "return=skipped when economy needs grout",
                "return=skipped when economy needs granite",
                "return=skipped when economy needs coal and not workers need experience",
                "return=skipped when economy needs water and not workers need experience",
                "consume=coal:2 granite:2 water clay",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:20s",
                "sleep=duration:3s",
                "produce=brick",
                "sleep=duration:90s",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:20s",
                "playsound=sound/barbarians/mortar priority:60%",
                "sleep=duration:3s",
                "produce=grout",
                "sleep=duration:120s"
            }
        }
    },
}

pop_textdomain()

