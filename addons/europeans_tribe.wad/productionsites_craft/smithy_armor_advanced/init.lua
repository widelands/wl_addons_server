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
        europeans_smith_advanced = 1,
        europeans_smith_normal = 1
    },

    inputs = {
        { name = "planks", amount = 6 },
        { name = "coal", amount = 6 },
        { name = "iron", amount = 6 },
        { name = "armor", amount = 6 },
        { name = "cloth", amount = 6 },
        { name = "leather", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_armor_wooden",
                "call=produce_helmet_wooden",
                "call=produce_spear_wooden",
                "call=produce_armor_processed",
                "call=produce_boots_sturdy",
                "call=produce_helmet_mask",
                "call=produce_spear_advanced",
                "sleep=duration:10s",
                "call=produce_armor_chain",
                "call=produce_boots_swift",
                "call=produce_shield_steel",
                "call=produce_ax_broad",
                "sleep=duration:10s",
                "call=produce_armor_advanced",
                "call=produce_boots_advanced",
                "call=produce_shield_advanced",
                "call=produce_sword_broad",
                "sleep=duration:10s",
                "return=skipped"
            }
        },
        produce_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped unless economy needs armor_wooden or workers need experience",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=armor_wooden:2"
            }
        },
        produce_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped unless economy needs helmet_wooden or workers need experience",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=helmet_wooden:2"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped unless economy needs spear_wooden or workers need experience",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        produce_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start making processed armor because ...
            descname = pgettext("europeans_building", "making processed armor"),
            actions = {
                "return=skipped unless economy needs armor_processed or workers need experience",
                "consume=armor cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=armor_processed:2"
            }
        },
        produce_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making study boots because ...
            descname = pgettext("europeans_building", "making study boots"),
            actions = {
                "return=skipped unless economy needs boots_sturdy or workers need experience",
                "consume=planks leather cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=boots_sturdy:2"
            }
        },
        produce_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped unless economy needs helmet_mask or workers need experience",
                "consume=coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
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
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
        produce_armor_chain = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of chain armor because ...
            descname = pgettext("europeans_building", "forging a suit of chain armor"),
            actions = {
                "return=skipped unless economy needs armor_chain or workers need experience",
                "consume=armor coal iron",
                "animate=working duration:20s",
                "produce=armor_chain:2"
            }
        },
        produce_boots_swift = {
            -- TRANSLATORS: Completed/Skipped/Did not start making swift boots because ...
            descname = pgettext("europeans_building", "making swift boots"),
            actions = {
                "return=skipped unless economy needs boots_swift or workers need experience",
                "consume=planks leather cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=boots_swift:2"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped unless economy needs shield_steel or workers need experience",
                "consume=coal iron",
                "animate=working duration:20s",
                "produce=shield_steel:2"
            }
        },
        produce_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = pgettext("europeans_building", "forging a broad ax"),
            actions = {
                "return=skipped unless economy needs ax_broad or workers need experience",
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=ax_broad:2"
            }
        },
        produce_armor_advanced= {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of advanced armor because ...
            descname = pgettext("europeans_building", "forging a suit of advanced armor"),
            actions = {
                "return=skipped unless economy needs armor_advanced or workers need experience",
                "consume=armor cloth coal iron",
                "animate=working duration:20s",
                "produce=armor_advanced:2"
            }
        },
        produce_boots_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start making advanced boots because ...
            descname = pgettext("europeans_building", "making advanced boots"),
            actions = {
                "return=skipped unless economy needs boots_advanced or workers need experience",
                "consume=planks leather cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=boots_advanced:2"
            }
        },
        produce_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = pgettext("europeans_building", "forging an advanced shield"),
            actions = {
                "return=skipped unless economy needs shield_advanced or workers need experience",
                "consume=coal iron:2",
                "animate=working duration:20s",
                "produce=shield_advanced:2"
            }
        },
        produce_sword_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
            descname = pgettext("europeans_building", "forging a broadsword"),
            actions = {
                "return=skipped unless economy needs sword_broad or workers need experience",
                "consume=planks coal iron:2",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:20s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=sword_broad:2"
            }
        }
    },
}

pop_textdomain()
