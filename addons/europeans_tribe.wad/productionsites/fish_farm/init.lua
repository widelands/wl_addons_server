push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
     name = "europeans_fish_farm",
     -- TRANSLATORS: This is a building name used in lists of buildings
     descname = pgettext("europeans_building", "Fish Farm"),
    icon = dirname .. "menu.png",
    size = "medium",

    buildcost = {
        blackwood = 2,
        planks = 2,
        reed = 2,
        cloth = 2,
        brick = 2,
        grout = 2
    },
    return_on_dismantle = {
        blackwood = 1,
        planks = 1,
        granite = 2
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

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
        prohibited_till = 1800
    },

    working_positions = {
        europeans_fisher_basic = 2
    },

    inputs = {
        { name = "corn", amount = 6 },
        { name = "fruit", amount = 6 },
        { name = "water", amount = 6 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_fish",
                "call=produce_fish_idle",
                "return=skipped"
            }
        },
        produce_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fish because ...
            descname = _"producing fish",
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water:2 fruit:2 corn:2",
                "sleep=duration:10s",
                "animate=working duration:60s",
                "produce=fish:3"
            }
        },
        produce_fish_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs fish",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "consume=water fruit corn",
                "animate=working duration:60s",
                "produce=fish"
            }
        }
    },
}

pop_textdomain()
