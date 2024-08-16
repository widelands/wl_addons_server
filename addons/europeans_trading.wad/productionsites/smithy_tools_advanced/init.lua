push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_toolsmithy_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Toolsmithy"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 63, 64 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 63, 64 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_weaponsmithy_advanced",
        enhancement_cost = {
            marble_column = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            marble = 1,
            diamond = 1
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "planks", amount = 12 },
        { name = "metal_alloy", amount = 12 },
        { name = "coal", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_hammer",
                "call=produce_saw",
                "sleep=duration:10s",
                "call=produce_buckets",
                "call=produce_basket",
                "sleep=duration:10s",
                "call=produce_hammer",
                "call=produce_saw",
                "sleep=duration:10s",
                "call=produce_buckets",
                "call=produce_basket",
                "sleep=duration:10s",
                "call=produce_felling_ax",
                "call=produce_scythe",
                "sleep=duration:10s",
                "call=produce_pick",
                "call=produce_shovel",
                "return=skipped"
            }
        },
        produce_basket = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
            descname = pgettext("europeans_building", "making baskets"),
            actions = {
                "return=skipped when economy needs planks and not economy needs basket",
                "return=skipped when economy needs metal_alloy and not economy needs basket",
                "return=skipped when economy needs buckets and not economy needs basket",
                "return=skipped when economy needs felling_ax and not economy needs basket",
                "return=skipped when economy needs hammer and not economy needs basket",
                "return=skipped when economy needs pick and not economy needs basket",
                "return=skipped when economy needs saw and not economy needs basket",
                "return=skipped when economy needs scythe and not economy needs basket",
                "return=skipped when economy needs shovel and not economy needs basket",
                "consume=planks metal_alloy coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=basket:2"
            }
        },
        produce_buckets = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
            descname = pgettext("europeans_building", "making buckets"),
            actions = {
                "return=skipped when economy needs planks and not economy needs buckets",
                "return=skipped when economy needs metal_alloy and not economy needs buckets",
                "return=skipped when economy needs basket and not economy needs buckets",
                "return=skipped when economy needs felling_ax and not economy needs buckets",
                "return=skipped when economy needs hammer and not economy needs buckets",
                "return=skipped when economy needs pick and not economy needs buckets",
                "return=skipped when economy needs saw and not economy needs buckets",
                "return=skipped when economy needs scythe and not economy needs buckets",
                "return=skipped when economy needs shovel and not economy needs buckets",
                "consume=planks metal_alloy coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=buckets:2"
            }
        },
        produce_felling_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
            descname = pgettext("europeans_building", "making felling axes"),
            actions = {
                "return=skipped when economy needs planks and not economy needs felling_ax",
                "return=skipped when economy needs metal_alloy and not economy needs felling_ax",
                "return=skipped when economy needs basket and not economy needs felling_ax",
                "return=skipped when economy needs buckets and not economy needs felling_ax",
                "return=skipped when economy needs hammer and not economy needs felling_ax",
                "return=skipped when economy needs pick and not economy needs felling_ax",
                "return=skipped when economy needs saw and not economy needs felling_ax",
                "return=skipped when economy needs scythe and not economy needs felling_ax",
                "return=skipped when economy needs shovel and not economy needs felling_ax",
                "consume=planks metal_alloy coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=felling_ax:2"
            }
        },
        produce_hammer = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
            descname = pgettext("europeans_building", "making hammers"),
            actions = {
                "return=skipped when economy needs planks and not economy needs hammer",
                "return=skipped when economy needs metal_alloy and not economy needs hammer",
                "return=skipped when economy needs basket and not economy needs hammer",
                "return=skipped when economy needs buckets and not economy needs hammer",
                "return=skipped when economy needs felling_ax and not economy needs hammer",
                "return=skipped when economy needs pick and not economy needs hammer",
                "return=skipped when economy needs saw and not economy needs hammer",
                "return=skipped when economy needs scythe and not economy needs hammer",
                "return=skipped when economy needs shovel and not economy needs hammer",
                "consume=planks metal_alloy coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=hammer:3"
            }
        },
        produce_pick = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
            descname = pgettext("europeans_building", "making picks"),
            actions = {
                "return=skipped when economy needs planks and not economy needs pick",
                "return=skipped when economy needs metal_alloy and not economy needs pick",
                "return=skipped when economy needs basket and not economy needs pick",
                "return=skipped when economy needs buckets and not economy needs pick",
                "return=skipped when economy needs felling_ax and not economy needs pick",
                "return=skipped when economy needs hammer and not economy needs pick",
                "return=skipped when economy needs saw and not economy needs pick",
                "return=skipped when economy needs scythe and not economy needs pick",
                "return=skipped when economy needs shovel and not economy needs pick",
                "consume=planks metal_alloy coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=pick:2"
            }
        },
        produce_saw = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
            descname = pgettext("europeans_building", "making saws"),
            actions = {
                "return=skipped when economy needs planks and not economy needs saw",
                "return=skipped when economy needs metal_alloy and not economy needs saw",
                "return=skipped when economy needs basket and not economy needs saw",
                "return=skipped when economy needs buckets and not economy needs saw",
                "return=skipped when economy needs felling_ax and not economy needs saw",
                "return=skipped when economy needs hammer and not economy needs saw",
                "return=skipped when economy needs pick and not economy needs saw",
                "return=skipped when economy needs scythe and not economy needs saw",
                "return=skipped when economy needs shovel and not economy needs saw",
                "consume=planks metal_alloy coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=saw:3"
            }
        },
        produce_scythe = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
            descname = pgettext("europeans_building", "making sycthes"),
            actions = {
                "return=skipped when economy needs planks and not economy needs scythe",
                "return=skipped when economy needs metal_alloy and not economy needs scythe",
                "return=skipped when economy needs basket and not economy needs scythe",
                "return=skipped when economy needs buckets and not economy needs scythe",
                "return=skipped when economy needs felling_ax and not economy needs scythe",
                "return=skipped when economy needs hammer and not economy needs scythe",
                "return=skipped when economy needs pick and not economy needs scythe",
                "return=skipped when economy needs saw and not economy needs scythe",
                "return=skipped when economy needs shovel and not economy needs scythe",
                "consume=planks metal_alloy coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=scythe:2"
            }
        },
        produce_shovel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
            descname = pgettext("europeans_building", "making shovels"),
            actions = {
                "return=skipped when economy needs planks and not economy needs shovel",
                "return=skipped when economy needs metal_alloy and not economy needs shovel",
                "return=skipped when economy needs basket and not economy needs shovel",
                "return=skipped when economy needs buckets and not economy needs shovel",
                "return=skipped when economy needs felling_ax and not economy needs shovel",
                "return=skipped when economy needs hammer and not economy needs shovel",
                "return=skipped when economy needs pick and not economy needs shovel",
                "return=skipped when economy needs saw and not economy needs shovel",
                "return=skipped when economy needs scythe and not economy needs shovel",
                "consume=planks metal_alloy coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=shovel:2"
            }
        },
    },
}

pop_textdomain()
