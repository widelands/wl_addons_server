push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_toolsmithy_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Toolsmithy"),
    icon = dirname .. "menu.png",
    
   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 61 },
      },
      working = {
         basename = "idle",
         hotspot = { 56, 61 },
      }
   },
    
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
  
    aihints = {},

    working_positions = {
        europeans_worker_normal = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "planks", amount = 10 },
        { name = "iron", amount = 10 },
        { name = "coal", amount = 10 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production",
                "sleep=duration:15s",
                "call=produce_buckets",
                "call=produce_basket",
                "sleep=duration:15s",
                "call=produce_felling_ax",
                "call=produce_scythe",
                "sleep=duration:15s",
                "call=produce_buckets",
                "call=produce_basket",
                "sleep=duration:15s",
                "call=produce_pick",
                "call=produce_shovel",
                "sleep=duration:15s",
                "call=produce_hammer",
                "call=produce_saw",
                "sleep=duration:15s",
                "call=produce_fire_tongs",
                "call=produce_needles",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for planks, iron and coal"),
            actions = {
                "return=skipped when site has planks:8 and site has iron:8 and site has coal:8",
                "sleep=duration:5m",
            }
        },
        produce_basket = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
            descname = pgettext("europeans_building", "making baskets"),
            actions = {
                "return=skipped unless economy needs basket or workers need experience",
                "return=skipped when economy needs buckets and not economy needs basket",
                "return=skipped when economy needs felling_ax and not economy needs basket",
                "return=skipped when economy needs fire_tongs and not economy needs basket",
                "return=skipped when economy needs hammer and not economy needs basket",
                "return=skipped when economy needs needles and not economy needs basket",
                "return=skipped when economy needs pick and not economy needs basket",
                "return=skipped when economy needs saw and not economy needs basket",
                "return=skipped when economy needs scythe and not economy needs basket",
                "return=skipped when economy needs shovel and not economy needs basket",
                "consume=planks iron coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=basket:2"
            }
        },
        produce_buckets = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
            descname = pgettext("europeans_building", "making buckets"),
            actions = {
                "return=skipped unless economy needs buckets or workers need experience",
                "return=skipped when economy needs basket and not economy needs buckets",
                "return=skipped when economy needs felling_ax and not economy needs buckets",
                "return=skipped when economy needs fire_tongs and not economy needs buckets",
                "return=skipped when economy needs hammer and not economy needs buckets",
                "return=skipped when economy needs needles and not economy needs buckets",
                "return=skipped when economy needs pick and not economy needs buckets",
                "return=skipped when economy needs saw and not economy needs buckets",
                "return=skipped when economy needs scythe and not economy needs buckets",
                "return=skipped when economy needs shovel and not economy needs buckets",
                "consume=planks iron coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=buckets:2"
            }
        },
        produce_felling_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
            descname = pgettext("europeans_building", "making felling axes"),
            actions = {
                "return=skipped unless economy needs felling_ax or workers need experience",
                "return=skipped when economy needs basket and not economy needs felling_ax",
                "return=skipped when economy needs buckets and not economy needs felling_ax",
                "return=skipped when economy needs fire_tongs and not economy needs felling_ax",
                "return=skipped when economy needs hammer and not economy needs felling_ax",
                "return=skipped when economy needs needles and not economy needs felling_ax",
                "return=skipped when economy needs pick and not economy needs felling_ax",
                "return=skipped when economy needs saw and not economy needs felling_ax",
                "return=skipped when economy needs scythe and not economy needs felling_ax",
                "return=skipped when economy needs shovel and not economy needs felling_ax",
                "consume=planks iron coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=felling_ax:2"
            }
        },
        produce_fire_tongs = {
            -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
            descname = pgettext("europeans_building", "making fire tongs"),
            actions = {
                "return=skipped unless economy needs fire_tongs or workers need experience",
                "return=skipped when economy needs basket and not economy needs fire_tongs",
                "return=skipped when economy needs buckets and not economy needs fire_tongs",
                "return=skipped when economy needs felling_ax and not economy needs fire_tongs",
                "return=skipped when economy needs hammer and not economy needs fire_tongs",
                "return=skipped when economy needs needles and not economy needs fire_tongs",
                "return=skipped when economy needs pick and not economy needs fire_tongs",
                "return=skipped when economy needs saw and not economy needs fire_tongs",
                "return=skipped when economy needs scythe and not economy needs fire_tongs",
                "return=skipped when economy needs shovel and not economy needs fire_tongs",
                "consume=planks iron coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=fire_tongs:2"
            }
        },
        produce_hammer = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
            descname = pgettext("europeans_building", "making hammers"),
            actions = {
                "return=skipped unless economy needs hammer or workers need experience",
                "return=skipped when economy needs basket and not economy needs hammer",
                "return=skipped when economy needs buckets and not economy needs hammer",
                "return=skipped when economy needs felling_ax and not economy needs hammer",
                "return=skipped when economy needs fire_tongs and not economy needs hammer",
                "return=skipped when economy needs needles and not economy needs hammer",
                "return=skipped when economy needs pick and not economy needs hammer",
                "return=skipped when economy needs saw and not economy needs hammer",
                "return=skipped when economy needs scythe and not economy needs hammer",
                "return=skipped when economy needs shovel and not economy needs hammer",
                "consume=planks iron coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=hammer:2"
            }
        },
        produce_needles = {
            -- TRANSLATORS: Completed/Skipped/Did not start making needles because ...
            descname = pgettext("europeans_building", "making needles"),
            actions = {
                "return=skipped unless economy needs needles or workers need experience",
                "return=skipped when economy needs basket and not economy needs needles",
                "return=skipped when economy needs buckets and not economy needs needles",
                "return=skipped when economy needs felling_ax and not economy needs needles",
                "return=skipped when economy needs fire_tongs and not economy needs needles",
                "return=skipped when economy needs hammer and not economy needs needles",
                "return=skipped when economy needs pick and not economy needs needles",
                "return=skipped when economy needs saw and not economy needs needles",
                "return=skipped when economy needs scythe and not economy needs needles",
                "return=skipped when economy needs shovel and not economy needs needles",
                "consume=coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=needles:2"
            }
        },
        produce_pick = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
            descname = pgettext("europeans_building", "making picks"),
            actions = {
                "return=skipped unless economy needs pick or workers need experience",
                "return=skipped when economy needs basket and not economy needs pick",
                "return=skipped when economy needs buckets and not economy needs pick",
                "return=skipped when economy needs felling_ax and not economy needs pick",
                "return=skipped when economy needs fire_tongs and not economy needs pick",
                "return=skipped when economy needs hammer and not economy needs pick",
                "return=skipped when economy needs needles and not economy needs pick",
                "return=skipped when economy needs saw and not economy needs pick",
                "return=skipped when economy needs scythe and not economy needs pick",
                "return=skipped when economy needs shovel and not economy needs pick",
                "consume=planks iron coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=pick:2"
            }
        },
        produce_saw = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
            descname = pgettext("europeans_building", "making saws"),
            actions = {
                "return=skipped unless economy needs saw or workers need experience",
                "return=skipped when economy needs basket and not economy needs saw",
                "return=skipped when economy needs buckets and not economy needs saw",
                "return=skipped when economy needs felling_ax and not economy needs saw",
                "return=skipped when economy needs fire_tongs and not economy needs saw",
                "return=skipped when economy needs hammer and not economy needs saw",
                "return=skipped when economy needs needles and not economy needs saw",
                "return=skipped when economy needs pick and not economy needs saw",
                "return=skipped when economy needs scythe and not economy needs saw",
                "return=skipped when economy needs shovel and not economy needs saw",
                "consume=planks iron coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=saw:2"
            }
        },
        produce_scythe = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
            descname = pgettext("europeans_building", "making sycthes"),
            actions = {
                "return=skipped unless economy needs scythe or workers need experience",
                "return=skipped when economy needs basket and not economy needs scythe",
                "return=skipped when economy needs buckets and not economy needs scythe",
                "return=skipped when economy needs felling_ax and not economy needs scythe",
                "return=skipped when economy needs fire_tongs and not economy needs scythe",
                "return=skipped when economy needs hammer and not economy needs scythe",
                "return=skipped when economy needs needles and not economy needs scythe",
                "return=skipped when economy needs pick and not economy needs scythe",
                "return=skipped when economy needs saw and not economy needs scythe",
                "return=skipped when economy needs shovel and not economy needs scythe",
                "consume=planks iron coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=scythe:2"
            }
        },
        produce_shovel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
            descname = pgettext("europeans_building", "making shovels"),
            actions = {
                "return=skipped unless economy needs shovel or workers need experience",
                "return=skipped when economy needs basket and not economy needs shovel",
                "return=skipped when economy needs buckets and not economy needs shovel",
                "return=skipped when economy needs felling_ax and not economy needs shovel",
                "return=skipped when economy needs fire_tongs and not economy needs shovel",
                "return=skipped when economy needs hammer and not economy needs shovel",
                "return=skipped when economy needs needles and not economy needs shovel",
                "return=skipped when economy needs pick and not economy needs shovel",
                "return=skipped when economy needs saw and not economy needs shovel",
                "return=skipped when economy needs scythe and not economy needs shovel",
                "consume=planks iron coal",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:90s",
                "produce=shovel:2"
            }
        },
    },
}

pop_textdomain()
