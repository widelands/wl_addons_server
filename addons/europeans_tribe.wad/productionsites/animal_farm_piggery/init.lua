push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_piggery",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Piggery"),
    icon = dirname .. "menu.png",
    size = "big",
    
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

    enhancement = {
        name = "europeans_sheepfarm",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3,
            planks = 2,
            brick = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            blackwood = 2,
            planks = 1,
            granite = 3
        }
    },

    animation_directory = dirname,
    spritesheets = {
         idle = {
              frames = 1,
              columns = 1,
              rows = 1,
              hotspot = { 89, 82 },
         },
         working = {
             basename = "idle", -- TODO(GunChleoc): No animation yet.
             frames = 1,
             columns = 1,
             rows = 1,
             hotspot = { 89, 82 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
        basic_amount = 1,
        prohibited_till = 1800,
        forced_after = 2400
    },

    working_positions = {
          europeans_breeder_basic = 2
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "corn", amount = 8 },
        { name = "blackroot", amount = 8 },
        { name = "wheat", amount = 8 },
        { name = "rye", amount = 8 },
        { name = "barley", amount = 8 }
    },

    programs = {
       main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_meat_from_barley",
                "call=produce_meat_from_rye",
                "call=produce_meat_from_wheat",
                "call=produce_meat_from_corn",
                "call=produce_meat_from_blackroot",
                "call=produce_meat",
                "call=produce_meat",
                "call=produce_meat_idle",
                "return=skipped"
            }
        },
        produce_meat_from_barley = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "breeding pigs with barley"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped when economy needs beer or economy needs beer_strong or economy needs mead",
                "return=skipped unless site has water:4",
                "return=skipped unless site has barley:4",
                "consume=barley:4 water:4",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:3"
           }
        },
        produce_meat_from_rye = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "breeding pigs with rye"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped when economy needs flour",
                "return=skipped unless site has water:4",
                "return=skipped unless site has rye:4",
                "consume=rye:4 water:4",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:3"
           }
        },
        produce_meat_from_wheat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "breeding pigs with wheat"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped when economy needs flour",
                "return=skipped unless site has water:4",
                "return=skipped unless site has wheat:4",
                "consume=wheat:4 water:4",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:3"
           }
        },
        produce_meat_from_corn = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "breeding pigs with corn"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:4",
                "return=skipped unless site has corn:4",
                "consume=corn:4 water:4",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:3"
           }
        },
        produce_meat_from_blackroot = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "breeding pigs with blackroot"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:4",
                "return=skipped unless site has blackroot:4",
                "consume=blackroot:4 water:4",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:3"
           }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "breeding pigs"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:4",
                "consume=blackroot,corn,wheat,rye,barley:4 water:4",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:3"
           }
        },
        produce_meat_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
           actions = {
                "return=skipped when economy needs meat",
                "return=skipped when economy needs water",
                "consume=corn,blackroot,rye,wheat,barley:2 water:2",
                "sleep=duration:90s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat"
           }
        },
    },
}

pop_textdomain()
