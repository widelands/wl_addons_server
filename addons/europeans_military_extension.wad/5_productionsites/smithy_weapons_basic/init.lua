push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/ax_workshop/"

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
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 57, 64 }
        },
        working = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 57, 75 }
        }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_weaponsmithy_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2
        }
    },
    buildcost = {
        granite = 3,
        planks = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_basic = 2
    },

    inputs = {
        { name = "blackwood", amount = 6 },
        { name = "ironwood", amount = 6 },
        { name = "metal_alloy", amount = 4 },
        { name = "coal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
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
        produce_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs helmet_wooden",
                "return=skipped when economy needs ironwood and not economy needs helmet_wooden",
                "return=skipped when economy needs helmet_mask and not economy needs helmet_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs spear_advanced and not economy needs helmet_wooden",
                "consume=blackwood ironwood",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:10m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=helmet_wooden:2"
            }
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs spear_wooden",
                "return=skipped when economy needs ironwood and not economy needs spear_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs helmet_mask and not economy needs spear_wooden",
                "return=skipped when economy needs spear_advanced and not economy needs spear_wooden",
                "consume=blackwood ironwood",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:10m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        produce_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped when economy needs helmet_wooden and not economy needs helmet_mask",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_mask",
                "return=skipped when economy needs spear_advanced and not economy needs helmet_mask",
                "consume=coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:10m",
                "produce=helmet_mask:2"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs spear_advanced",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_advanced",
                "return=skipped when economy needs helmet_mask and not economy needs spear_advanced",
                "return=skipped when economy needs spear_wooden and not economy needs spear_advanced",
                "consume=blackwood coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:10m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
    },
}

pop_textdomain()
