push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_clay_pit_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Clay Pit"),
    icon = dirname .. "menu.png",
    size = "small",
    
    enhancement = {
        name = "europeans_clay_pit_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        },
    },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 40, 50 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 40, 50 },
      },
   },

    aihints = {},

    working_positions = {
        europeans_claydigger_normal = 1
    },

    inputs = {
        { name = "water", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_dig",
                "call=digging_clay",
                "callworker=check_dig",
                "call=making_pond_idle",
                "return=skipped"
            }
        },
        digging_clay = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging clay because ...
            descname = pgettext("europeans_building", "digging clay"),
            actions = {
                "return=skipped unless economy needs clay or workers need experience",
                "return=skipped unless site has water:2",
                "callworker=dig",
                "consume=water",
                "animate=working duration:15s",
                "produce=clay"
            }
        },
        making_pond_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs clay",
                "return=skipped when economy needs water",
                "callworker=dig",
                "consume=water",
                "animate=working duration:15s",
                "sleep=duration:90s"
            }
        }
    },
}

pop_textdomain()
