push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/mill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_mill_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Mill"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 44, 90 },
      },
      build = {
         frames = 2,
         columns = 2,
         rows = 1,
         hotspot = { 44, 90 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 44, 90 },
      },
      working = {
         fps = 15,
         frames = 19,
         columns = 10,
         rows = 2,
         hotspot = { 44, 90 },
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
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "wheat", amount = 8 },
        { name = "rye", amount = 8 },
        { name = "barley", amount = 6 },
        { name = "oat", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_wheat_flour",
                "call=produce_rye_flour",
                "call=produce_barley_flour",
                "call=produce_oat_flour",
                "return=skipped"
            }
        },
        produce_barley_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding barley because ...
            descname = pgettext("europeans_building", "grinding barley"),
            actions = {
                "return=skipped when economy needs barley and not economy needs barley_flour",
                "return=skipped unless economy needs barley_flour",
                "consume=barley",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:1m30s",
                "consume=barley",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:1m30s",
                "produce=barley_flour:2"
            }
        },
        produce_oat_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding oat because ...
            descname = pgettext("europeans_building", "grinding oat"),
            actions = {
                "return=skipped when economy needs oat and not economy needs oat_flour",
                "return=skipped unless economy needs oat_flour",
                "consume=oat",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:1m30s",
                "consume=oat",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:1m30s",
                "produce=oat_flour:2"
            }
        },
        produce_rye_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding rye because ...
            descname = pgettext("europeans_building", "grinding rye"),
            actions = {
                "return=skipped when economy needs rye and not economy needs rye_flour",
                "return=skipped unless economy needs rye_flour",
                "consume=rye",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:1m30s",
                "consume=rye",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:1m30s",
                "produce=rye_flour:2"
            }
        },
        produce_wheat_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding wheat because ...
            descname = pgettext("europeans_building", "grinding wheat"),
            actions = {
                "return=skipped when economy needs wheat and not economy needs wheat_flour",
                "return=skipped unless economy needs wheat_flour",
                "consume=wheat",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:1m30s",
                "consume=wheat",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:1m30s",
                "produce=wheat_flour:2"
            }
        },
    },
}

pop_textdomain()
