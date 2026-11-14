push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/mill/"

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
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        atlanteans_miller = 1,
        empire_miller = 1
    },

    inputs = {
        { name = "barley", amount = 6 },
        { name = "oat", amount = 6 },
        { name = "rye", amount = 6 },
        { name = "wheat", amount = 6 },
        { name = "corn", amount = 6 },
        { name = "blackroot", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                -- time total: 4 * 19 + 2 * 22 = 120 sec
                "call=produce_barley_flour",
                "call=produce_oat_flour",
                "call=produce_rye_flour",
                "call=produce_wheat_flour",
                "call=produce_cornmeal",
                "call=produce_blackroot_flour"
            }
        },
        produce_barley_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding barley because ...
            descname = _("grinding barley"),
            actions = {
                -- time total: 5.4 + 10 + 3.6 = 19 sec
                "return=skipped when site has blackroot and economy needs blackroot_flour and not economy needs barley_flour",
                "return=skipped when site has corn and economy needs cornmeal and not economy needs barley_flour",
                "return=skipped when site has oat and economy needs oat_flour and not economy needs barley_flour",
                "return=skipped when site has rye and economy needs rye_flour and not economy needs barley_flour",
                "return=skipped when site has wheat and economy needs flour and not economy needs barley_flour",
                "return=skipped unless economy needs barley_flour",
                "sleep=duration:5s400ms",
                "consume=barley",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:10s",
                "produce=barley_flour"
            }
        },
        produce_blackroot_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding blackroot because ...
            descname = _("grinding blackroot"),
            actions = {
                -- time: 3.4 + 15 + 3.6 = 22 sec
                -- No check whether we need blackroot_flour because blackroots cannot be used for anything else.
                "return=skipped when site has barley and economy needs barley_flour and not economy needs blackroot_flour",
                "return=skipped when site has corn and economy needs cornmeal and not economy needs blackroot_flour",
                "return=skipped when site has oat and economy needs oat_flour and not economy needs blackroot_flour",
                "return=skipped when site has rye and economy needs rye_flour and not economy needs blackroot_flour",
                "return=skipped when site has wheat and economy needs flour and not economy needs blackroot_flour",
                "return=skipped unless economy needs blackroot_flour",
                "consume=blackroot",
                "sleep=duration:3s400ms",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:15s",
                "produce=blackroot_flour"
            }
        },
        produce_cornmeal = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding corn because ...
            descname = _("grinding corn"),
            actions = {
                -- time: 3.4 + 15 + 3.6 = 22 sec
                "return=skipped when site has barley and economy needs barley_flour and not economy needs cornmeal",
                "return=skipped when site has blackroot and economy needs blackroot_flour and not economy needs cornmeal",
                "return=skipped when site has oat and economy needs oat_flour and not economy needs cornmeal",
                "return=skipped when site has rye and economy needs rye_flour and not economy needs cornmeal",
                "return=skipped when site has wheat and economy needs flour and not economy needs cornmeal",
                "return=skipped unless economy needs cornmeal",
                "sleep=duration:3s400ms",
                "consume=corn",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:15s",
                "produce=cornmeal"
            }
        },
        produce_oat_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding oat because ...
            descname = _("grinding oat"),
            actions = {
                -- time total: 5.4 + 10 + 3.6 = 19 sec
                -- No check whether we need oat_flour because oats cannot be used for anything else.
                "return=skipped when site has barley and economy needs barley_flour and not economy needs oat_flour",
                "return=skipped when site has blackroot and economy needs blackroot_flour and not economy needs oat_flour",
                "return=skipped when site has corn and economy needs cornmeal and not economy needs oat_flour",
                "return=skipped when site has rye and economy needs rye_flour and not economy needs oat_flour",
                "return=skipped when site has wheat and economy needs flour and not economy needs oat_flour",
                "return=skipped unless economy needs oat_flour",
                "consume=oat",
                "sleep=duration:5s400ms",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:10s",
                "produce=oat_flour"
            }
        },
        produce_rye_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding rye because ...
            descname = _("grinding rye"),
            actions = {
                -- time total: 5.4 + 10 + 3.6 = 19 sec
                "return=skipped when site has barley and economy needs barley_flour and not economy needs rye_flour",
                "return=skipped when site has blackroot and economy needs blackroot_flour and not economy needs rye_flour",
                "return=skipped when site has corn and economy needs cornmeal and not economy needs rye_flour",
                "return=skipped when site has oat and economy needs oat_flour and not economy needs rye_flour",
                "return=skipped when site has wheat and economy needs flour and not economy needs rye_flour",
                "return=skipped unless economy needs rye_flour",
                "consume=rye",
                "sleep=duration:5s400ms",
                "playsound=sound/mill/mill_turning priority:90% allow_multiple",
                "animate=working duration:10s",
                "produce=rye_flour"
            }
        },
        produce_wheat_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding wheat because ...
            descname = _("grinding wheat"),
            actions = {
                -- time total: 5.4 + 10 + 3.6 = 19 sec
                "return=skipped when site has barley and economy needs barley_flour and not economy needs flour",
                "return=skipped when site has blackroot and economy needs blackroot_flour and not economy needs flour",
                "return=skipped when site has corn and economy needs cornmeal and not economy needs flour",
                "return=skipped when site has oat and economy needs oat_flour and not economy needs flour",
                "return=skipped when site has rye and economy needs rye_flour and not economy needs flour",
                "return=skipped unless economy needs flour",
                "consume=wheat",
                "sleep=duration:5s400ms",
                "playsound=sound/mill/mill_turning priority:90% allow_multiple",
                "animate=working duration:10s",
                "produce=flour"
            }
        },
    },
}

pop_textdomain()
