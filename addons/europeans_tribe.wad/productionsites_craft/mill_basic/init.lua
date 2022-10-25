push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_mill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Mill"),
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_mill_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 4,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2
        },
    },

    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 41, 58 },
      },
      unoccupied = {
         hotspot = { 41, 58 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 41, 58 },
      },
   },

    aihints = {
        basic_amount = 1,
        prohibited_till = 1800,
        forced_after = 2400
    },

    working_positions = {
        europeans_miller_basic = 1
    },

    inputs = {
        { name = "rye", amount = 4 },
        { name = "wheat", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_mixed_flour",
                "call=produce_mixed_flour_idle",
                "return=skipped"
            }
        },
        produce_mixed_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding rye and wheat because ...
            descname = pgettext("europeans_building", "grinding rye and wheat"),
            actions = {
                "return=skipped unless economy needs flour or workers need experience",
                "return=skipped when economy needs meat and not economy needs flour",
                "return=skipped unless site has rye",
                "return=skipped unless site has wheat",
                "consume=rye",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:20s",
                "consume=wheat",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:25s",
                "produce=flour:2"
            }
        },
        produce_mixed_flour_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs flour",
                "consume=rye",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:20s",
                "consume=wheat",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:25s",
                "produce=flour",
                "sleep=duration:120s"
            }
        }
    },
}

pop_textdomain()
