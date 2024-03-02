push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaponsmithy_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Weaponsmithy"),
    icon = dirname .. "menu.png",
    
   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 67 },
      },
      working = {
         basename = "idle",
         hotspot = { 56, 67 },
      }
   },
    
    size = "medium",
    enhancement = {
        name = "europeans_weaponsmithy_advanced",
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
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "blackwood", amount = 6 },
        { name = "iron", amount = 6 },
        { name = "coal", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:15s",
                "call=produce_helmet_wooden",
                "sleep=duration:15s",
                "call=produce_spear_wooden",
                "sleep=duration:15s",
                "call=produce_helmet_mask",
                "call=produce_spear_advanced",
                "sleep=duration:15s",
                "call=produce_shield_steel",
                "call=produce_ax_broad",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has blackwood:4 and site has iron:4 and site has coal:4",
                "return=skipped when economy needs iron", -- for statistical reason
                "sleep=duration:5m",
            }
        },
        produce_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped unless economy needs helmet_wooden or workers need experience",
                "consume=blackwood",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:150s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=helmet_wooden:2"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped unless economy needs spear_wooden or workers need experience",
                "consume=blackwood",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:150s",
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
                "animate=working duration:150s",
                "produce=helmet_mask:2"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped unless economy needs shield_steel or workers need experience",
                "consume=coal iron",
                "animate=working duration:150s",
                "produce=shield_steel:2"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped unless economy needs spear_advanced or workers need experience",
                "consume=blackwood coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:150s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
        produce_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = pgettext("europeans_building", "forging a broad ax"),
            actions = {
                "return=skipped unless economy needs ax_broad or workers need experience",
                "consume=blackwood coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:150s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=ax_broad:2"
            }
        },
    },
}

pop_textdomain()
