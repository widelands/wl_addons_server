push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Smelting Works"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 48, 60 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 48, 60 },
      },
      working = {
         fps = 5,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 48, 60 },
      },
    },
    
    size = "medium",

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "coal", amount = 10 },
        { name = "ore", amount = 8 },
        { name = "scrap_iron", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recycle_iron",
                "sleep=duration:15s",
                "call=smelting_ore",
                "sleep=duration:15s",
                "call=recycle_iron",
                "return=skipped"
            }
        },
        recycle_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start recyling iron because ...
            descname = pgettext("europeans_building", "recycling iron"),
            actions = {
                "return=skipped when economy needs coal and not economy needs iron",
                "consume=scrap_iron:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:2"
            }
        },
        smelting_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                "return=skipped when economy needs coal and not economy needs iron",
                "return=skipped when site has scrap_iron:2 and economy needs ore",
                "consume=ore:6 coal:6",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "animate=working duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:6"
            }
        }
    },
}

pop_textdomain()
