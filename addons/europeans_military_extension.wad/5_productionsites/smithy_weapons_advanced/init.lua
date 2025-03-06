push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/weaponsmithy/"

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
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic= 1
    },

    inputs = {
        { name = "blackwood", amount = 6 },
        { name = "metal_alloy", amount = 6 },
        { name = "coal", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
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
        produce_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs helmet_wooden",
                "return=skipped when economy needs helmet_mask and not economy needs helmet_wooden",
                "return=skipped when economy needs shield_steel and not economy needs helmet_wooden",
                "return=skipped when economy needs shield_advanced and not economy needs helmet_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs spear_advanced and not economy needs helmet_wooden",
                "return=skipped when economy needs ax_broad and not economy needs helmet_wooden",
                "return=skipped when economy needs sword_broad and not economy needs helmet_wooden",
                "consume=blackwood",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:6m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=helmet_wooden:2"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs spear_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs helmet_mask and not economy needs spear_wooden",
                "return=skipped when economy needs shield_steel and not economy needs spear_wooden",
                "return=skipped when economy needs shield_advanced and not economy needs spear_wooden",
                "return=skipped when economy needs spear_advanced and not economy needs spear_wooden",
                "return=skipped when economy needs ax_broad and not economy needs spear_wooden",
                "return=skipped when economy needs sword_broad and not economy needs spear_wooden",
                "consume=blackwood",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:6m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        produce_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped when economy needs helmet_wooden and not economy needs helmet_mask",
                "return=skipped when economy needs shield_steel and not economy needs helmet_mask",
                "return=skipped when economy needs shield_advanced and not economy needs helmet_mask",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_mask",
                "return=skipped when economy needs spear_advanced and not economy needs helmet_mask",
                "return=skipped when economy needs ax_broad and not economy needs helmet_mask",
                "return=skipped when economy needs sword_broad and not economy needs helmet_mask",
                "consume=coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=helmet_mask:2"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped when economy needs helmet_wooden and not economy needs shield_steel",
                "return=skipped when economy needs helmet_mask and not economy needs shield_steel",
                "return=skipped when economy needs shield_advanced and not economy needs shield_steel",
                "return=skipped when economy needs spear_wooden and not economy needs shield_steel",
                "return=skipped when economy needs spear_advanced and not economy needs shield_steel",
                "return=skipped when economy needs ax_broad and not economy needs shield_steel",
                "return=skipped when economy needs sword_broad and not economy needs shield_steel",
                "consume=coal metal_alloy",
                "animate=working duration:6m",
                "produce=shield_steel:2"
            }
        },
        produce_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = pgettext("europeans_building", "forging an advanced shield"),
            actions = {
                "return=skipped when economy needs helmet_wooden and not economy needs shield_advanced",
                "return=skipped when economy needs helmet_mask and not economy needs shield_advanced",
                "return=skipped when economy needs shield_steel and not economy needs shield_advanced",
                "return=skipped when economy needs spear_wooden and not economy needs shield_advanced",
                "return=skipped when economy needs spear_advanced and not economy needs shield_advanced",
                "return=skipped when economy needs ax_broad and not economy needs shield_advanced",
                "return=skipped when economy needs sword_broad and not economy needs shield_advanced",
                "consume=coal metal_alloy:2",
                "animate=working duration:6m",
                "produce=shield_advanced:2"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs spear_advanced",
                "return=skipped when economy needs spear_wooden and not economy needs spear_advanced",
                "return=skipped when economy needs ax_broad and not economy needs spear_advanced",
                "return=skipped when economy needs sword_broad and not economy needs spear_advanced",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_advanced",
                "return=skipped when economy needs helmet_mask and not economy needs spear_advanced",
                "return=skipped when economy needs shield_steel and not economy needs spear_advanced",
                "return=skipped when economy needs shield_advanced and not economy needs spear_advanced",
                "consume=blackwood coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:6m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
        produce_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = pgettext("europeans_building", "forging a broad ax"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs ax_broad",
                "return=skipped when economy needs spear_wooden and not economy needs ax_broad",
                "return=skipped when economy needs spear_advanced and not economy needs ax_broad",
                "return=skipped when economy needs sword_broad and not economy needs ax_broad",
                "return=skipped when economy needs helmet_wooden and not economy needs ax_broad",
                "return=skipped when economy needs helmet_mask and not economy needs ax_broad",
                "return=skipped when economy needs shield_steel and not economy needs ax_broad",
                "return=skipped when economy needs shield_advanced and not economy needs ax_broad",
                "consume=blackwood coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:6m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=ax_broad:2"
            }
        },
        produce_sword_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
            descname = pgettext("europeans_building", "forging a broadsword"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs sword_broad",
                "return=skipped when economy needs spear_wooden and not economy needs sword_broad",
                "return=skipped when economy needs spear_advanced and not economy needs sword_broad",
                "return=skipped when economy needs ax_broad and not economy needs sword_broad",
                "return=skipped when economy needs helmet_wooden and not economy needs sword_broad",
                "return=skipped when economy needs helmet_mask and not economy needs sword_broad",
                "return=skipped when economy needs shield_steel and not economy needs sword_broad",
                "return=skipped when economy needs shield_advanced and not economy needs sword_broad",
                "consume=blackwood coal metal_alloy:2",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:6m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=sword_broad:2"
            }
        }
    },
}

pop_textdomain()
