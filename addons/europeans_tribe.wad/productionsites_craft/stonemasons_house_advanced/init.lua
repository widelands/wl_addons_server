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
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 63, 64 },
      },
    },
    
    size = "medium",

    aihints = {
    },

    working_positions = {
        europeans_stonemason_advanced = 1,
        europeans_stonemason_basic = 2
    },

    inputs = {
        { name = "marble", amount = 9 },
        { name = "granite", amount = 9 },
        { name = "clay", amount = 6 },
        { name = "water", amount = 6 },
        { name = "coal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=sculpting_marble_column",
                "call=mixing_grout",
                "call=burning_bricks",
                "call=burning_bricks_idle",
                "return=skipped"
            }
        },
        mixing_grout = {
            -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
            descname = pgettext("europeans_building", "mixing grout"),
            actions = {
                "return=skipped when economy needs granite",
                "return=skipped when economy needs water and not economy needs grout",
                "return=skipped when economy needs coal and not economy needs grout",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has granite:3",
                "return=skipped unless site has water:3",
                "consume=coal:2 granite:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:30s",
                "consume=water:3",
                "playsound=sound/barbarians/mortar priority:60%",
                "produce=grout:3"
            }
        },
        burning_bricks = {
            -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
            descname = pgettext("europeans_building", "burning bricks"),
            actions = {
                "return=skipped when economy needs granite",
                "return=skipped when economy needs coal and not economy needs brick",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has clay:3",
                "consume=granite clay:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:5s",
                "consume=coal:2",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:25s",
                "produce=brick:3"
            }
        },
        sculpting_marble_column = {
            -- TRANSLATORS: Completed/Skipped/Did not start sculpting a marble column because ...
            descname = pgettext("europeans_building", "sculpting a marble column"),
            actions = {
                "return=skipped unless economy needs marble_column or workers need experience",
                "return=skipped when economy needs marble",
                "return=skipped unless site has marble:6",
                "consume=marble:3",
                "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=marble_column:2",
                "consume=marble:3",
                "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=marble_column:2"
            }
        },
        burning_bricks_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs marble_column",
                "return=skipped when economy needs brick",
                "return=skipped when economy needs grout",
                "return=skipped when economy needs granite",
                "return=skipped when economy needs coal",
                "return=skipped when economy needs water",
                "consume=granite clay",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:5s",
                "consume=coal",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:25s",
                "produce=brick",
                "sleep=duration:180s",
                "consume=coal granite",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:25s",
                "consume=water",
                "playsound=sound/barbarians/mortar priority:60%",
                "animate=working duration:5s",
                "produce=grout",
                "sleep=duration:180s"
            }
        }
    },
}

pop_textdomain()
