push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaponsmithy_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Weaponsmithy"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 48, 65 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 48, 65 },
      },
      unoccupied = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 48, 65 },
      },
      working = {
         fps = 2,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 48, 65 },
      },
    },
    

    size = "medium",
    
    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_normal = 1
    },

    inputs = {
        { name = "planks", amount = 6 },
        { name = "iron", amount = 6 },
        { name = "coal", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:10s",
                "call=produce_helmet_wooden",
                "sleep=duration:10s",
                "call=produce_spear_wooden",
                "sleep=duration:10s",
                "call=produce_helmet_mask",
                "sleep=duration:10s",
                "call=produce_spear_advanced",
                "sleep=duration:10s",
                "call=produce_shield_steel",
                "sleep=duration:10s",
                "call=produce_ax_broad",
                "sleep=duration:10s",
                "call=produce_shield_advanced",
                "sleep=duration:10s",
                "call=produce_sword_broad",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has planks:4 and site has iron:4 and site has coal:4",
                "return=skipped when economy needs iron", -- for statistical reason
                "sleep=duration:5m",
            }
        },
        produce_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped unless economy needs helmet_wooden or workers need experience",
                "return=skipped when economy needs helmet_mask and not economy needs helmet_wooden",
                "return=skipped when economy needs shield_steel and not economy needs helmet_wooden",
                "return=skipped when economy needs shield_advanced and not economy needs helmet_wooden",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:120s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=helmet_wooden:2"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped unless economy needs spear_wooden or workers need experience",
                "return=skipped when economy needs spear_advanced and not economy needs spear_wooden",
                "return=skipped when economy needs ax_broad and not economy needs spear_wooden",
                "return=skipped when economy needs sword_broad and not economy needs spear_wooden",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:120s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        produce_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped unless economy needs helmet_mask or workers need experience",
                "return=skipped when economy needs shield_steel and not economy needs helmet_mask",
                "return=skipped when economy needs shield_advanced and not economy needs helmet_mask",
                "consume=coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=helmet_mask:2"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped unless economy needs shield_steel or workers need experience",
                "return=skipped when economy needs helmet_mask and not economy needs shield_steel",
                "return=skipped when economy needs shield_advanced and not economy needs shield_steel",
                "consume=coal iron",
                "animate=working duration:120s",
                "produce=shield_steel:2"
            }
        },
        produce_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = pgettext("europeans_building", "forging an advanced shield"),
            actions = {
                "return=skipped unless economy needs shield_advanced or workers need experience",
                "return=skipped when economy needs helmet_mask and not economy needs shield_advanced",
                "return=skipped when economy needs shield_steel and not economy needs shield_advanced",
                "consume=coal iron:2",
                "animate=working duration:120s",
                "produce=shield_advanced:2"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped unless economy needs spear_advanced or workers need experience",
                "return=skipped when economy needs ax_broad and not economy needs spear_advanced",
                "return=skipped when economy needs sword_broad and not economy needs spear_advanced",
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:120s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
        produce_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = pgettext("europeans_building", "forging a broad ax"),
            actions = {
                "return=skipped unless economy needs ax_broad or workers need experience",
                "return=skipped when economy needs spear_advanced and not economy needs ax_broad",
                "return=skipped when economy needs sword_broad and not economy needs ax_broad",
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:120s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=ax_broad:2"
            }
        },
        produce_sword_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
            descname = pgettext("europeans_building", "forging a broadsword"),
            actions = {
                "return=skipped unless economy needs sword_broad or workers need experience",
                "return=skipped when economy needs spear_advanced and not economy needs sword_broad",
                "return=skipped when economy needs ax_broad and not economy needs sword_broad",
                "consume=planks coal iron:2",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:120s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=sword_broad:2"
            }
        }
    },
}

pop_textdomain()
