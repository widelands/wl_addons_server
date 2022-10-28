push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_armorsmithy_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Armorsmithy"),
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
    enhancement = {
        name = "europeans_armorsmithy_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 1,
            marble_column = 1,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            scrap_metal_mixed = 1
        },
    },

    aihints = {},

    working_positions = {
        europeans_smith_normal = 1,
        europeans_smith_advanced = 1
    },

    inputs = {
        { name = "planks", amount = 8 },
        { name = "cloth", amount = 4 },
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
                "sleep=duration:15s",
                "call=produce_armor_gilded",
                "call=produce_tabard_golden",
                "call=produce_shield_advanced",
                "call=produce_sword_broad",
                "sleep=duration:15s",
                "return=skipped"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped unless economy needs spear_wooden or workers need experience",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden"
            }
        },
        produce_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped unless economy needs helmet_mask",
                "consume=coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=helmet_mask"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped unless economy needs spear_advanced",
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced"
            }
        },
        produce_armor_chain = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of chain armor because ...
            descname = pgettext("europeans_building", "forging a suit of chain armor"),
            actions = {
                "return=skipped unless economy needs armor_chain",
                "consume=armor coal iron",
                "animate=working duration:30s",
                "produce=armor_chain"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped unless economy needs shield_steel",
                "consume=coal:2 iron:2",
                "animate=working duration:30s",
                "produce=shield_steel"
            }
        },
        produce_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = pgettext("europeans_building", "forging a broad ax"),
            actions = {
                "return=skipped unless economy needs ax_broad",
                "consume=planks coal:2 iron:2",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=ax_broad"
            }
        },
        produce_armor_gilded = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of gilded armor because ...
            descname = pgettext("europeans_building", "forging a suit of gilded armor"),
            actions = {
                "return=skipped unless economy needs armor_gilded",
                "consume=armor coal iron gold",
                "animate=working duration:30s",
                "produce=armor_gilded"
            }
        },
        produce_tabard_golden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of golden tabard because ...
            descname = pgettext("europeans_building", "forging a suit of golden tabard"),
            actions = {
                "return=skipped unless economy needs tabard_golden",
                "consume=cloth coal iron gold",
                "animate=working duration:30s",
                "produce=tabard_golden"
            }
        },
        produce_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = pgettext("europeans_building", "forging an advanced shield"),
            actions = {
                "return=skipped unless economy needs shield_advanced",
                "consume=coal:2 iron:2 gold",
                "animate=working duration:30s",
                "produce=shield_advanced"
            }
        },      
        produce_sword_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
            descname = pgettext("europeans_building", "forging a broadsword"),
            actions = {
                "return=skipped unless economy needs sword_broad",
                "consume=planks coal:2 iron:2",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=sword_broad"
            }
        }
    },
}

pop_textdomain()
