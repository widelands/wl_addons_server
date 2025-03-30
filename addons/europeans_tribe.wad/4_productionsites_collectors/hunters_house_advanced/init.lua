push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/hunters_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_hunters_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Hunter’s House"),
    icon = dirname .. "menu.png",
    size = "small",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 55, 57 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
        europeans_gamekeeper = 1
    },
    
    inputs = {
        { name = "water", amount = 12 },
        { name = "honey", amount = 12 },
        { name = "fruit", amount = 12 },
        { name = "grape", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=releasing",
                "sleep=duration:5s",
                "call=catching_ox",
                "sleep=duration:5s",
                "call=releasing",
                "sleep=duration:5s",
                "call=catching_donkey",
                "sleep=duration:5s",
                "call=releasing",
                "sleep=duration:5s",
                "call=catching_horse",
                "sleep=duration:5s",
                "call=releasing",
                "sleep=duration:5s",
                "call=catching_reindeer",
                "sleep=duration:5s",
                "call=releasing",
                "sleep=duration:5s",
                "call=hunting",
                "sleep=duration:5s",
                "call=hunting",
                "return=skipped"
            }
        },
        releasing = {
            -- TRANSLATORS: Completed/Skipped/Did not start releasing because ...
            descname = pgettext("europeans_building", "releasing"),
            actions = {
                "return=skipped when economy needs water and not economy needs leather and not economy needs wool",
                "return=skipped when economy needs honey and not economy needs leather and not economy needs wool",
                "return=skipped when economy needs fruit and not economy needs leather and not economy needs wool",
                "return=skipped when economy needs grape and not economy needs leather and not economy needs wool",
                "consume=water honey fruit grape",
                "sleep=duration:1m",
                "callworker=release"
            }
        },
        hunting = {
            -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
            descname = pgettext("europeans_building", "hunting"),
            actions = {
                "return=skipped unless economy needs leather or economy needs wool",
                "callworker=hunt",
                "sleep=duration:1m",
                "produce=wool"
            }
        },
        catching_ox = {
            -- TRANSLATORS: Completed/Skipped/Did not start catching because ...
            descname = pgettext("europeans_building", "catching ox"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox",
                "callworker=catch_ox",
                "sleep=duration:1m",
                "recruit=europeans_carrier_ox"
            }
        },
        catching_donkey = {
            -- TRANSLATORS: Completed/Skipped/Did not start catching because ...
            descname = pgettext("europeans_building", "catching donkey"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_donkey",
                "callworker=catch_donkey",
                "sleep=duration:1m",
                "recruit=europeans_carrier_donkey"
            }
        },
        catching_horse = {
            -- TRANSLATORS: Completed/Skipped/Did not start catching because ...
            descname = pgettext("europeans_building", "catching horse"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_horse",
                "callworker=catch_horse",
                "sleep=duration:1m",
                "recruit=europeans_carrier_horse"
            }
        },
        catching_reindeer = {
            -- TRANSLATORS: Completed/Skipped/Did not start catching because ...
            descname = pgettext("europeans_building", "catching reindeer"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_reindeer",
                "callworker=catch_reindeer",
                "sleep=duration:1m",
                "recruit=europeans_carrier_reindeer"
            }
        }
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of Game" for a resource
        title = _("No Game"),
        -- TRANSLATORS: "Game" means animals that you can hunt
        heading = _("Out of Game"),
        -- TRANSLATORS: "game" means animals that you can hunt
        message = pgettext("europeans_building", "The hunter working out of this hunter’s house can’t find any game in his work area."),
        productivity_threshold = 0
    },
}

pop_textdomain()
