push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_armorsmithy_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Armorsmithy"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_armorsmithy_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2
        },
        enhancement_return_on_dismantle = {
            blackwood = 1
        },
    },
    
    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        log = 2,
        granite = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 65, 83 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 65, 83 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 65, 83 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 65, 83 },
            fps = 20
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 1,
        prohibited_till = 7200,
        forced_after = 9000
    },

    working_positions = {
        europeans_smith_basic = 2
    },

    inputs = {
        { name = "planks", amount = 4 },
        { name = "coal", amount = 4 },
        { name = "iron", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_spear_wooden",
                "call=produce_spear_advanced",
                "call=produce_helmet_mask",
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
                "sleep=duration:10s",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:50s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:10s",
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
                "animate=working duration:50s",
                "produce=helmet_mask"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = _"forging an advanced spear",
            actions = {
                "return=skipped unless economy needs spear_advanced",
                "consume=planks coal iron",
                "sleep=duration:10s",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:50s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:10s",
                "produce=spear_advanced"
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
                "return=skipped when economy needs planks",
                "return=skipped when economy needs coal",
                "return=skipped when economy needs iron",
                "sleep=duration:120s",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=spear_wooden",
                "sleep=duration:90s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=helmet_mask",
                "sleep=duration:90s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=spear_advanced"
            }
        }
    },
}

pop_textdomain()
