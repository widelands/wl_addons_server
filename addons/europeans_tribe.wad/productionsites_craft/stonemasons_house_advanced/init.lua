push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemasons_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Stonemason’s House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 63, 64 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 63, 64 },
      },
    },
    
    size = "medium",

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "marble", amount = 8 },
        { name = "granite", amount = 6 },
        { name = "clay", amount = 6 },
        { name = "water", amount = 6 },
        { name = "coal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:15s",
                "call=pausing_production_for_outputs",
                "sleep=duration:15s",
                "call=sculpting_marble_column",
                "sleep=duration:15s",
                "call=mixing_grout",
                "sleep=duration:15s",
                "call=burning_bricks",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has granite:3 and site has water:3 and site has coal:2",
                "return=skipped when site has granite and site has clay:3 and site has coal:2",
                "return=skipped when site has marble:6",
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs grout",
                "return=skipped when economy needs brick",
                "return=skipped when economy needs marble_column",
                "sleep=duration:60m",
            }
        },
        mixing_grout = {
            -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
            descname = pgettext("europeans_building", "mixing grout"),
            actions = {
                "return=skipped when economy needs brick and not economy needs grout",
                "return=skipped when economy needs granite",
                "consume=coal:2 granite:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:30s",
                "consume=water:3",
                "playsound=sound/barbarians/mortar priority:60%",
                "animate=working duration:20s",
                "produce=grout:3"
            }
        },
        burning_bricks = {
            -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
            descname = pgettext("europeans_building", "burning bricks"),
            actions = {
                "return=skipped when economy needs grout and not economy needs brick",
                "return=skipped when economy needs granite",
                "consume=granite clay:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:20s",
                "consume=coal:2",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:30s",
                "produce=brick:3"
            }
        },
        sculpting_marble_column = {
            -- TRANSLATORS: Completed/Skipped/Did not start sculpting a marble column because ...
            descname = pgettext("europeans_building", "sculpting a marble column"),
            actions = {
                "return=skipped when economy needs marble",
                "consume=marble:3",
                "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=marble_column:2",
                "consume=marble:3",
                "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=marble_column:2"
            }
        }
    },
}

pop_textdomain()
