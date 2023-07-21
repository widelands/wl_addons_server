push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemasons_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Lime Kiln"),
    icon = dirname .. "menu.png",
    
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
    
    size = "medium",
    enhancement = {
        name = "europeans_stonemasons_house_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2
        }
    },

   aihints = {},

    working_positions = {
        europeans_stonemason_normal = 1,
        europeans_stonemason_basic = 1
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
                "consume=coal:2 granite:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:40s",
                "consume=water:3",
                "playsound=sound/barbarians/mortar priority:60%",
                "animate=working duration:5s",
                "produce=grout:3"
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
                "consume=granite clay:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:10s",
                "consume=coal:2",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:35s",
                "produce=brick:3"
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
                "consume=granite clay",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:10s",
                "consume=coal",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:35s",
                "produce=brick",
                "sleep=duration:180s",
                "consume=coal granite",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:40s",
                "consume=water",
                "playsound=sound/barbarians/mortar priority:60%",
                "animate=working duration:5s",
                "produce=grout",
                "sleep=duration:180s"
            }
        }
    },
}

pop_textdomain()

