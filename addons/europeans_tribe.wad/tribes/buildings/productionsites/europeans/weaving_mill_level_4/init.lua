push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/weaving_mill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaving_mill_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Weaving Mill Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 58}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 78},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {50, 78},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    
    size = "big",

    aihints = {
        supports_seafaring = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_advanced = 3
    },

    inputs = {
        { name = "cotton", amount = 8 },
        { name = "wool", amount = 8 },
        { name = "spider_silk", amount = 8 },
        { name = "liana", amount = 8 },
        { name = "rubber", amount = 4 },
        { name = "fur", amount = 4 },
        { name = "leather", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cloth",
                "sleep=duration:30s",
                "call=produce_spidercloth",
                "sleep=duration:30s",
                "call=produce_armor",
                "sleep=duration:30s",
                "call=produce_rope",
                "return=skipped"
            }
        },
        produce_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of armor"),
            actions = {
                "return=skipped unless economy needs armor",
                "return=skipped when economy needs cotton and economy needs spider_silk and economy needs wool and not economy needs armor",
                "return=skipped when economy needs leather and economy needs rubber and not economy needs armor",
                "return=skipped when economy needs cloth and not economy needs armor",
                "return=skipped when economy needs fur and not economy needs armor",
                "return=skipped when economy needs rope and not economy needs armor",
                "return=skipped when economy needs spidercloth and not economy needs armor",
                "consume=fur:2 cotton,spider_silk,wool:4 leather,rubber:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:3m",
                "produce=armor:4"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth",
                "return=skipped when economy needs cotton and economy needs wool and not economy needs cloth",
                "return=skipped when economy needs armor and not economy needs cloth",
                "return=skipped when economy needs rope and not economy needs cloth",
                "return=skipped when economy needs spidercloth and not economy needs cloth",
                "consume=cotton,wool:4",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=cloth:4"
            }
        },
        produce_rope = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving rope because ...
            descname = pgettext("europeans_building", "weaving rope"),
            actions = {
                "return=skipped unless economy needs rope",
                "return=skipped when economy needs liana and not economy needs rope",
                "return=skipped when economy needs armor and not economy needs rope",
                "return=skipped when economy needs cloth and not economy needs rope",
                "return=skipped when economy needs spidercloth and not economy needs rope",
                "consume=liana:4",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=rope:4"
            }
        },
        produce_spidercloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving spidercloth because ...
            descname = pgettext("europeans_building", "weaving spidercloth"),
            actions = {
                "return=skipped unless economy needs spidercloth",
                "return=skipped when economy needs spider_silk and not economy needs spidercloth",
                "return=skipped when economy needs armor and not economy needs spidercloth",
                "return=skipped when economy needs cloth and not economy needs spidercloth",
                "return=skipped when economy needs rope and not economy needs spidercloth",
                "consume=spider_silk:4",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=spidercloth:4"
            }
        },
    },
}

pop_textdomain()
