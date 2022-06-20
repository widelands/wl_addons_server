push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_toolsmithy_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Toolsmithy"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 58, 61 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 58, 61 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_smith_advanced = 1,
        europeans_smith_normal = 1
    },

    inputs = {
        { name = "planks", amount = 12 },
        { name = "coal", amount = 12 },
        { name = "iron", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "return=skipped unless site has planks:12",
                "return=skipped unless site has coal:12",
                "return=skipped unless site has iron:12",
                "call=produce_buckets",
                "call=produce_basket",
                "call=produce_felling_ax",
                "call=produce_scythe",
                "call=produce_pick",
                "call=produce_shovel",
                "call=produce_saw",
                "call=produce_hammer",
                "sleep=duration:10s",
                "return=skipped unless site has planks:8",
                "return=skipped unless site has coal:8",
                "return=skipped unless site has iron:8",
                "call=produce_buckets",
                "call=produce_basket",
                "call=produce_fire_tongs",
                "call=produce_bread_paddle",
                "call=produce_hook_pole",
                "call=produce_kitchen_tools",
                "call=produce_needles",
                "call=produce_idle",
                "sleep=duration:10s",
                "return=skipped"
            }
        },
        produce_basket = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
            descname = pgettext("europeans_building", "making baskets"),
            actions = {
                "return=skipped unless economy needs basket",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=basket:3"
            }
        },
        produce_bread_paddle = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a bread paddle because ...
            descname = pgettext("europeans_building", "making bread paddles"),
            actions = {
                "return=skipped unless economy needs bread_paddle",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=bread_paddle:3"
            }
        },
        produce_buckets = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
            descname = pgettext("europeans_building", "making buckets"),
            actions = {
                "return=skipped unless economy needs buckets",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=buckets:3"
            }
        },
        produce_felling_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
            descname = pgettext("europeans_building", "making felling axes"),
            actions = {
                "return=skipped unless economy needs felling_ax",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=felling_ax:3"
            }
        },
        produce_fire_tongs = {
            -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
            descname = pgettext("europeans_building", "making fire tongs"),
            actions = {
                "return=skipped unless economy needs fire_tongs",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=fire_tongs:3"
            }
        },
        produce_hammer = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
            descname = pgettext("europeans_building", "making hammers"),
            actions = {
                "return=skipped unless economy needs hammer",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=hammer:3"
            }
        },
        produce_hook_pole = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hook pole because ...
            descname = pgettext("europeans_building", "making hook poles"),
            actions = {
                "return=skipped unless economy needs hook_pole",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=hook_pole:3"
            }
        },
        produce_kitchen_tools = {
            -- TRANSLATORS: Completed/Skipped/Did not start making kitchen tools because ...
            descname = pgettext("europeans_building", "making kitchen tools"),
            actions = {
                "return=skipped unless economy needs kitchen_tools",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=kitchen_tools:3"
            }
        },
        produce_needles = {
            -- TRANSLATORS: Completed/Skipped/Did not start making needles because ...
            descname = pgettext("europeans_building", "making needles"),
            actions = {
                "return=skipped unless economy needs needles",
                "consume=coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=needles:3"
            }
        },
        produce_pick = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
            descname = pgettext("europeans_building", "making picks"),
            actions = {
                "return=skipped unless economy needs pick",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=pick:3"
            }
        },
        produce_saw = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
            descname = pgettext("europeans_building", "making saws"),
            actions = {
                "return=skipped unless economy needs saw",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=saw:3"
            }
        },
        produce_scythe = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
            descname = pgettext("europeans_building", "making sycthes"),
            actions = {
                "return=skipped unless economy needs scythe",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=scythe:3"
            }
        },
        produce_shovel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
            descname = pgettext("europeans_building", "making shovels"),
            actions = {
                "return=skipped unless economy needs shovel",
                "consume=planks coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:25s",
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
                "return=skipped when economy needs planks",
                "return=skipped when economy needs coal",
                "return=skipped when economy needs iron",
                "sleep=duration:180s",
                "consume=planks:4 coal:4 iron:4",
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
                "produce=kitchen_tools"
            }
        }
    },
}

pop_textdomain()
