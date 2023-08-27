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
        { name = "planks", amount = 6 },
        { name = "coal", amount = 6 },
        { name = "iron", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_helmet_wooden",
                "call=produce_spear_wooden",
                "sleep=duration:10s",
                "call=produce_helmet_mask",
                "call=produce_spear_advanced",
                "sleep=duration:10s",
                "call=produce_shield_steel",
                "call=produce_ax_broad",
                "sleep=duration:10s",
                "return=skipped"
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
                "animate=working duration:30s",
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
                "animate=working duration:30s",
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
                "consume=coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=helmet_mask:2"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped unless economy needs shield_steel or workers need experience",
                "return=skipped when economy needs helmet_mask and not economy needs shield_steel",
                "consume=coal iron",
                "animate=working duration:30s",
                "produce=shield_steel:2"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped unless economy needs spear_advanced or workers need experience",
                "return=skipped when economy needs ax_broad and not economy needs spear_advanced",
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
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
                "consume=planks coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=ax_broad:2"
            }
        },
    },
}

pop_textdomain()
