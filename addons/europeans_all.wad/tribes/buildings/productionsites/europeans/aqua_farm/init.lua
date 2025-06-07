push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/frisians/aqua_farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_aqua_farm",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Aqua Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {40, 53}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {40, 71},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "small",
    buildcost = {
        brick = 2,
        grout = 2,
        reed = 2
    },
    return_on_dismantle = {
        brick = 1,
        grout = 1,
        reed = 1
    },

    aihints = {
        requires_supporters = true,
        prohibited_till = 4800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        atlanteans_fishbreeder = 1,
        frisians_fisher = 1
    },

    inputs = {
        { name = "water", amount = 5 },
        { name = "fruit", amount = 2 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=breed_fish",
                "call=fish_pond",
            },
        },
        breed_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding fish because ...
            descname = _("breeding fish"),
            actions = {
                "return=skipped unless economy needs fish",
                "return=failed unless site has water:2",
                "return=failed unless site has fruit",
                "callworker=breed_in_pond",
                "consume=fruit water:2",
                "sleep=duration:23s",
            },
        },
        fish_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _("fishing"),
            actions = {
                "return=skipped unless economy needs fish",
                "sleep=duration:9s",
                "callworker=fish_in_pond",
            },
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=fruit water:2",
                "produce=fish",
            },
        },
    },

    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Ponds"),
        heading = _("Out of Fish Ponds"),
        message = pgettext ("europeans_building", "The fisher working at this aqua farm can’t find any fish ponds in his work area. Please make sure there is a working clay pit nearby and the aqua farm is supplied with all needed wares, or consider dismantling or destroying this building."),
        productivity_threshold = 12
    },
}

pop_textdomain()
