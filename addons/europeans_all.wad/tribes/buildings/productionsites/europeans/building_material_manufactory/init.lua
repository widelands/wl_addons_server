push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/frisians/brick_kiln/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_building_material_manufactory",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Building Materials Manufactory"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 58}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 72},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {50, 75},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "big",
    buildcost = {
        log = 4,
        granite = 4,
        reed = 4
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        reed = 2
    },

    aihints = {
        prohibited_till = 600,
        basic_amount = 2,
        very_weak_ai_limit = 2,
        weak_ai_limit = 3
    },
    
    working_positions = {
        amazons_liana_cutter = 1,
        atlanteans_sawyer = 1,
        barbarians_lime_burner = 1,
        empire_carpenter = 1,
        frisians_brickmaker = 1
    },

    inputs = {
        { name = "log", amount = 16 },
        { name = "liana", amount = 8 },
        { name = "marble", amount = 8 },
        { name = "granite", amount = 6 },
        { name = "clay", amount = 6 },
        { name = "water", amount = 6 },
        { name = "coal", amount = 6 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_blackwood",
                "call=produce_planks",
                "call=produce_rope",
                "call=produce_grout",
                "call=produce_bricks",
                "call=produce_marble_column",
                "return=skipped"
            }
        },
        produce_blackwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped unless economy needs blackwood",
                "return=skipped when economy needs log and not economy needs blackwood",
                "return=skipped when economy needs planks and not economy needs blackwood",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "produce=blackwood:8",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "produce=blackwood:8"
            }
        },
        produce_bricks = {
            -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
            descname = pgettext("europeans_building", "burning bricks"),
            actions = {
                "return=skipped unless economy needs brick",
                "return=skipped when economy needs grout and not economy needs brick",
                "return=skipped when economy needs granite and not economy needs brick",
                "return=skipped when economy needs coal and not economy needs brick",
                "consume=granite:2 clay:4",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:1m",
                "consume=coal:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:2m",
                "produce=brick:4"
            }
        },
        produce_grout = {
            -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
            descname = pgettext("europeans_building", "mixing grout"),
            actions = {
                "return=skipped unless economy needs grout",
                "return=skipped when economy needs brick and not economy needs grout",
                "return=skipped when economy needs granite and not economy needs grout",
                "return=skipped when economy needs coal and not economy needs grout",
                "return=skipped when economy needs water and not economy needs grout",
                "consume=coal:3 granite:4",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:2m",
                "consume=water:4",
                "playsound=sound/barbarians/mortar priority:60%",
                "animate=working duration:1m",
                "produce=grout:4"
            }
        },
        produce_marble_column = {
            -- TRANSLATORS: Completed/Skipped/Did not start sculpting a marble column because ...
            descname = pgettext("europeans_building", "sculpting a marble column"),
            actions = {
                "return=skipped unless economy needs marble_column",
                "return=skipped when economy needs marble and not economy needs marble_column",
                "consume=marble:3",
                "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
                "animate=working duration:1m",
                "produce=marble_column:2",
                "consume=marble:3",
                "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
                "animate=working duration:1m",
                "produce=marble_column:2"
            }
        },
        produce_planks = {
            -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
            descname = pgettext("europeans_building", "sawing logs"),
            actions = {
                "return=skipped unless economy needs planks",
                "return=skipped when economy needs log and not economy needs planks",
                "return=skipped when economy needs blackwood and not economy needs planks",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "produce=planks:8",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "consume=log:2",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:45s",
                "produce=scrap_wood:2",
                "produce=planks:8"
            }
        },
        produce_rope = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = _("making a rope"),
            actions = {
                "return=skipped when economy needs liana and not economy needs rope",
                "consume=liana:2",
                "sleep=duration:20s",
                "animate=working duration:35s",
                "produce=rope"
            },
        }
    },

}

pop_textdomain()
