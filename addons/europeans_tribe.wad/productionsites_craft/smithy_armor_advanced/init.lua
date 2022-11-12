push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_armorsmithy_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Armorsmithy"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 50, 66 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 50, 66 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 50, 66 }
      },
      working = {
         fps = 5,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 50, 66 }
      },
    },

    size = "medium",
    
    aihints = {},

    working_positions = {
        europeans_smith_advanced = 2
    },

    inputs = {
        { name = "planks", amount = 8 },
        { name = "coal", amount = 12 },
        { name = "iron", amount = 12 },
        { name = "gold", amount = 8 },
        { name = "armor", amount = 4 },
        { name = "cloth", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_spear_wooden",
                "call=produce_helmet_mask",
                "call=produce_spear_advanced",
                "sleep=duration:10s",
                "call=produce_armor_chain",
                "call=produce_shield_steel",
                "call=produce_ax_broad",
                "sleep=duration:10s",
                "call=produce_armor_gilded",
                "call=produce_tabard_golden",
                "call=produce_shield_advanced",
                "call=produce_sword_broad",
                "sleep=duration:10s",
                "return=skipped"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped unless economy needs spear_wooden",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
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
                "animate=working duration:20s",
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
                "animate=working duration:20s",
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
                "animate=working duration:20s",
                "produce=armor_chain"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped unless economy needs shield_steel",
                "consume=coal iron",
                "animate=working duration:20s",
                "produce=shield_steel"
            }
        },
        produce_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = pgettext("europeans_building", "forging a broad ax"),
            actions = {
                "return=skipped unless economy needs ax_broad",
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
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
                "animate=working duration:20s",
                "produce=armor_gilded"
            }
        },
        produce_tabard_golden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of golden tabard because ...
            descname = pgettext("europeans_building", "tailoring a golden tabard"),
            actions = {
                "return=skipped unless economy needs tabard_golden",
                "consume=cloth coal iron gold",
                "animate=working duration:20s",
                "produce=tabard_golden"
            }
        },
        produce_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = pgettext("europeans_building", "forging an advanced shield"),
            actions = {
                "return=skipped unless economy needs shield_advanced",
                "consume=coal iron gold",
                "animate=working duration:20s",
                "produce=shield_advanced"
            }
        },
        produce_sword_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
            descname = pgettext("europeans_building", "forging a broadsword"),
            actions = {
                "return=skipped unless economy needs sword_broad",
                "consume=planks coal iron gold",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=sword_broad"
            }
        }
    },
}

pop_textdomain()
