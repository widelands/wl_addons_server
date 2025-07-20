push_textdomain("europeans_all.wad", true)

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
        prohibited_till = 600,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        frisians_seamstress = 2
    },

    inputs = {
        { name = "cotton", amount = 8 },
        { name = "wool", amount = 8 },
        { name = "spider_silk", amount = 8 },
        { name = "liana", amount = 8 },
        { name = "fur", amount = 4 },
        { name = "fur_garment_old", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cloth_wool",
                "sleep=duration:30s",
                "call=produce_spidercloth",
                "sleep=duration:30s",
                "call=produce_cloth_fur",
                "sleep=duration:30s",
                "call=produce_rope",
                "return=skipped"
            }
        },
        produce_cloth_fur = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = _("weaving cloth out of fur"),
            actions = {
                -- time total: 25.4 + 20 + 3.6 = 49 sec
                "return=skipped unless economy needs cloth",
                "consume=fur,fur_garment_old",
                "sleep=duration:25s400ms",
                "animate=working duration:20s",
                "produce=cloth"
            },
        },
        produce_cloth_wool = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving because ...
            descname = _("weaving cloth out of wool"),
            actions = {
                -- time total: 20.4 + 15 + 5 + 3.6 = 44 sec
                "return=skipped unless economy needs cloth",
                "consume=wool:4",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:3m",
                "sleep=duration:5s",
                "produce=cloth:4"
            }
        },
        produce_rope = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving rope because ...
            descname = pgettext("europeans_building", "weaving rope"),
            actions = {
                "return=skipped unless economy needs rope",
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
                "consume=spider_silk:4",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=spidercloth:4"
            }
        },
    },
}

pop_textdomain()
