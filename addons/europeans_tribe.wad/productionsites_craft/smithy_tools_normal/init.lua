push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_toolsmithy_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Toolsmithy"),
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_toolsmithy_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2
        },
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 57, 76 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 57, 76 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 57, 76 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 57, 76 },
            fps = 10
        },
    },

    aihints = {},

    working_positions = {
        europeans_smith_normal = 1,
        europeans_smith_basic = 1
    },

    inputs = {
        { name = "planks", amount = 8 },
        { name = "coal", amount = 8 },
        { name = "iron", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "return=skipped unless site has planks:8",
                "return=skipped unless site has coal:8",
                "return=skipped unless site has iron:8",
                "call=produce_buckets",
                "call=produce_basket",
                "call=produce_felling_ax",
                "call=produce_scythe",
                "call=produce_pick",
                "call=produce_shovel",
                "call=produce_saw",
                "call=produce_hammer",
                "sleep=duration:15s",
                "return=skipped unless site has planks:4",
                "return=skipped unless site has coal:4",
                "return=skipped unless site has iron:4",
                "call=produce_buckets",
                "call=produce_basket",
                "call=produce_fire_tongs",
                "call=produce_bread_paddle",
                "call=produce_hook_pole",
                "call=produce_kitchen_tools",
                "call=produce_needles",
                "call=produce_idle",
                "sleep=duration:15s",
                "return=skipped"
            }
        },
        produce_basket = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
            descname = pgettext("europeans_building", "making baskets"),
            actions = {
                "return=skipped unless economy needs basket",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=basket:3"
            }
        },
        produce_bread_paddle = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a bread paddle because ...
            descname = pgettext("europeans_building", "making bread paddles"),
            actions = {
                "return=skipped unless economy needs bread_paddle",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=bread_paddle:3"
            }
        },
        produce_buckets = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
            descname = pgettext("europeans_building", "making buckets"),
            actions = {
                "return=skipped unless economy needs buckets",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=buckets:3"
            }
        },
        produce_felling_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
            descname = pgettext("europeans_building", "making felling axes"),
            actions = {
                "return=skipped unless economy needs felling_ax",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=felling_ax:3"
            }
        },
        produce_fire_tongs = {
            -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
            descname = pgettext("europeans_building", "making fire tongs"),
            actions = {
                "return=skipped unless economy needs fire_tongs",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=fire_tongs:3"
            }
        },
        produce_hammer = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
            descname = pgettext("europeans_building", "making hammers"),
            actions = {
                "return=skipped unless economy needs hammer",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=hammer:3"
            }
        },
        produce_hook_pole = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hook pole because ...
            descname = pgettext("europeans_building", "making hook poles"),
            actions = {
                "return=skipped unless economy needs hook_pole",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=hook_pole:3"
            }
        },
        produce_kitchen_tools = {
            -- TRANSLATORS: Completed/Skipped/Did not start making kitchen tools because ...
            descname = pgettext("europeans_building", "making kitchen tools"),
            actions = {
                "return=skipped unless economy needs kitchen_tools",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=kitchen_tools:3"
            }
        },
        produce_needles = {
            -- TRANSLATORS: Completed/Skipped/Did not start making needles because ...
            descname = pgettext("europeans_building", "making needles"),
            actions = {
                "return=skipped unless economy needs needles",
                "consume=coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=needles:3"
            }
        },
        produce_pick = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
            descname = pgettext("europeans_building", "making picks"),
            actions = {
                "return=skipped unless economy needs pick",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=pick:3"
            }
        },
        produce_saw = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
            descname = pgettext("europeans_building", "making saws"),
            actions = {
                "return=skipped unless economy needs saw",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=saw:3"
            }
        },
        produce_scythe = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
            descname = pgettext("europeans_building", "making sycthes"),
            actions = {
                "return=skipped unless economy needs scythe",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=scythe:3"
            }
        },
        produce_shovel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
            descname = pgettext("europeans_building", "making shovels"),
            actions = {
                "return=skipped unless economy needs shovel",
                "consume=planks:2 coal:2 iron:2",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:40s",
                "produce=shovel:3"
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
                "return=skipped when economy needs needles",
                "return=skipped when economy needs bread_paddle",
                "return=skipped when economy needs hook_pole",
                "return=skipped when economy needs kitchen_tools",
                "return=skipped when economy needs iron",
                "return=skipped when economy needs gold",
                "sleep=duration:360s",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=basket",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=buckets",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=shovel",
                "consume=planks coal iron",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=saw",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=hammer",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=fire_tongs",
                "consume=planks coal iron",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=pick",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=felling_ax",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=scythe",
                "consume=planks coal iron",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=needles",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=bread_paddle",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=hook_pole",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=kitchen_tools",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=basket:2",
                "sleep=duration:60s",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:15s",
                "produce=buckets:2"
            }
        }
    },
}

pop_textdomain()
