push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaponsmithy_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Weaponsmithy"),
    icon = dirname .. "menu.png",
    
   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 57, 76 },
      },
      unoccupied = {
         hotspot = { 57, 76 },
      },
   },
   spritesheets = {
      build = {
         frames = 5,
         rows = 3,
         columns = 2,
         hotspot = { 57, 76 }
      },
      working = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 57, 76 }
      },
   },
    
    size = "medium",
    enhancement = {
        name = "europeans_weaponsmithy_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2
        },
    },
    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {},

    working_positions = {
        europeans_worker_basic = 2
    },

    inputs = {
        { name = "planks", amount = 6 },
        { name = "iron", amount = 4 },
        { name = "coal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production",
                "sleep=duration:5s",
                "call=pausing_production_tools",
                "sleep=duration:10s",
                "call=produce_helmet_wooden",
                "sleep=duration:15s",
                "call=produce_spear_wooden",
                "sleep=duration:15s",
                "call=produce_helmet_mask",
                "sleep=duration:15s",
                "call=produce_spear_advanced",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production for tools because ...
            descname = pgettext("europeans_building", "pausing production for planks, iron and coal"),
            actions = {
                "return=skipped when not economy needs planks and not economy needs iron and not economy needs coal",
                "sleep=duration:5m",
            }
        },
        pausing_production_tools = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production for tools because ...
            descname = pgettext("europeans_building", "pausing production for tools"),
            actions = {
                "return=skipped when not economy needs basket and not economy needs buckets and not economy needs felling_ax and not economy needs felling_ax and not economy needs fire_tongs and not economy needs hammer and not economy needs needles and not economy needs pick and not economy needs saw and not economy needs scythe and not economy needs shovel",
                "sleep=duration:5m",
            }
        },
        produce_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped unless economy needs helmet_wooden or workers need experience",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_wooden",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:180s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=helmet_wooden:2"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped unless economy needs spear_wooden or workers need experience",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_wooden",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:180s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        produce_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped unless economy needs helmet_mask or workers need experience",
                "consume=coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:180s",
                "produce=helmet_mask:2"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped unless economy needs spear_advanced or workers need experience",
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:180s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
    },
}

pop_textdomain()
