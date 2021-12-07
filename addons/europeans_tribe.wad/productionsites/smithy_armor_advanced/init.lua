push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_armorsmithy_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Armorsmithy"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 50, 62 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 50, 62 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 50, 62 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 50, 62 },
            fps = 5
        },
    },

    aihints = {},

    working_positions = {
        europeans_smith_advanced = 2
    },

    inputs = {
        { name = "planks", amount = 4 },
        { name = "spidercloth", amount = 4 },
        { name = "armor", amount = 4 },
        { name = "coal", amount = 8 },
        { name = "iron", amount = 8 },
        { name = "gold", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_spear_wooden",
                "call=produce_helmet_mask",
                "call=produce_spear_advanced",
                "call=produce_armor_chain",
                "call=produce_shield_steel",
                "call=produce_ax_broad",
                "call=produce_armor_gilded",
                "call=produce_tabard_golden",
                "call=produce_shield_advanced",
                "call=produce_sword_broad",
                "call=produce_idle",
                "return=skipped"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = _"forging a wooden spear",
            actions = {
                "return=skipped unless economy needs spear_wooden",
                "consume=planks",
                "sleep=duration:5s",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:5s",
                "produce=spear_wooden"
            }
        },
        produce_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = _"forging a mask",
            actions = {
                "return=skipped unless economy needs helmet_mask",
                "consume=coal iron",
                "sleep=duration:10s",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=helmet_mask"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = _"forging an advanced spear",
            actions = {
                "return=skipped unless economy needs spear_advanced",
                "consume=planks coal iron",
                "sleep=duration:5s",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:5s",
                "produce=spear_advanced"
            }
        },
        produce_armor_chain = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of chain armor because ...
            descname = _"forging a suit of chain armor",
            actions = {
                "return=skipped unless economy needs armor_chain",
                "consume=armor coal iron",
                "sleep=duration:10s",
                "animate=working duration:20s",
                "produce=armor_chain"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = _"forging a steel shield",
            actions = {
                "return=skipped unless economy needs shield_steel",
                "consume=coal:2 iron:2",
                "sleep=duration:10s",
                "animate=working duration:20s",
                "produce=shield_steel"
            }
        },
        produce_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = _"forging a broad ax",
            actions = {
                "return=skipped unless economy needs ax_broad",
                "consume=planks coal:2 iron:2",
                "sleep=duration:5s",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:5s",
                "produce=ax_broad"
            }
        },
        produce_armor_gilded = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of gilded armor because ...
            descname = _"forging a suit of gilded armor",
            actions = {
                "return=skipped unless economy needs armor_gilded",
                "consume=armor coal iron gold",
                "sleep=duration:10s",
                "animate=working duration:20s",
                "produce=armor_gilded"
            }
        },
        produce_tabard_golden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of golden tabard because ...
            descname = _"forging a suit of golden tabard",
            actions = {
                "return=skipped unless economy needs tabard_golden",
                "consume=spidercloth coal iron gold",
                "sleep=duration:10s",
                "animate=working duration:20s",
                "produce=tabard_golden"
            }
        },
        produce_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = _"forging an advanced shield",
            actions = {
                "return=skipped unless economy needs shield_advanced",
                "consume=coal:2 iron:2 gold",
                "sleep=duration:10s",
                "animate=working duration:20s",
                "produce=shield_advanced"
            }
        },
        produce_sword_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
            descname = _"forging a broadsword",
            actions = {
                "return=skipped unless economy needs sword_broad",
                "consume=planks coal:2 iron:2",
                "sleep=duration:5s",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:5s",
                "produce=sword_broad"
            }
        },
        produce_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs buckets",
                "return=skipped when economy needs shovel",
                "return=skipped when economy needs saw",
                "return=skipped when economy needs hammer",
                "return=skipped when economy needs pick",
                "return=skipped when economy needs felling_ax",
                "return=skipped when economy needs fire_tongs",
                "return=skipped when economy needs scythe",
                "return=skipped when economy needs basket",
                "return=skipped when economy needs milking_tongs",
                "return=skipped when economy needs needles",
                "return=skipped when economy needs fishing_rod",
                "return=skipped when economy needs fishing_net",
                "return=skipped when economy needs hunting_bow",
                "return=skipped when economy needs hunting_spear",
                "return=skipped when economy needs bread_paddle",
                "return=skipped when economy needs hook_pole",
                "return=skipped when economy needs kitchen_tools",
                "return=skipped when economy needs spear_wooden",
                "return=skipped when economy needs helmet_mask",
                "return=skipped when economy needs spear_advanced",
                "return=skipped when economy needs armor_chain",
                "return=skipped when economy needs shield_steel",
                "return=skipped when economy needs ax_broad",
                "return=skipped when economy needs armor_gilded",
                "return=skipped when economy needs tabard_golden",
                "return=skipped when economy needs shield_advanced",
                "return=skipped when economy needs sword_broad",
                "return=skipped when economy needs planks",
                "return=skipped when economy needs coal",
                "return=skipped when economy needs iron",
                "return=skipped when economy needs gold",
                "sleep=duration:120s",
                "consume=planks coal:4 iron:4 gold",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:45s",
                "produce=shield_advanced",
                "sleep=duration:120s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:45s",
                "produce=sword_broad"
            }
        }
    },
}

pop_textdomain()
