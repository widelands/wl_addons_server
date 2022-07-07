push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemasons_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Lime Kiln"),
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_stonemasons_house_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
        },
        enhancement_return_on_dismantle = {
            blackwood = 1
        },
    },

    buildcost = {
        log = 3,
        reed = 3,
        granite = 2
    },
    return_on_dismantle = {
        log = 2,
        granite = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 45, 53 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 45, 53 },
        },
    },

    aihints = {
        prohibited_till = 4200,
        forced_after = 5400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
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
                "consume=coal:2 granite:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:55s",
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
                "animate=working duration:15s",
                "consume=coal:2",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:45s",
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
                "animate=working duration:15s",
                "consume=coal",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:45s",
                "produce=brick",
                "sleep=duration:180s",
                "consume=coal granite",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:55s",
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
