push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/smokery/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_smokery_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Smokery"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 54, 74 },
        },

    },
    spritesheets = {
        working = {
            fps = 20,
            frames = 5,
            columns = 5,
            rows = 1,
            hotspot = { 54, 74 },
        },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_smokery_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            reed = 1
        },
        enhancement_return_on_dismantle = {
            brick = 2
        }
    },
    buildcost = {
        granite = 3,
        planks = 3
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2
    },

    aihints = {
        prohibited_till = 4200,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        atlanteans_smoker = 1
    },

    inputs = {
        { name = "fish", amount = 4 },
        { name = "meat", amount = 4 },
        { name = "log", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- time total: 3 * 68 = 204 sec
                "call=smoke_fish",
                "call=smoke_meat",
                "call=smoke_fish_2",
            }
        },
        smoke_meat = {
            -- TRANSLATORS: Completed/Skipped/Did not start smoking meat because ...
            descname = _("smoking meat"),
            actions = {
                -- time: 30.8 + 30 + 2 * 3.6 = 68
                "return=skipped unless economy needs smoked_meat",
                "consume=meat:2 log",
                "animate=working duration:30s800ms",
                "sleep=duration:30s",
                "produce=smoked_meat:2"
            }
        },
        -- 2 identical programs for fish to prevent unnecessary skipping penalty
        smoke_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start smoking fish because ...
            descname = _("smoking fish"),
            actions = {
                -- time: 30.8 + 30 + 2 * 3.6 = 68
                "return=skipped unless economy needs smoked_fish",
                "consume=fish:2 log",
                "animate=working duration:30s800ms",
                "sleep=duration:30s",
                "produce=smoked_fish:2"
            }
        },
        smoke_fish_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start smoking fish because ...
            descname = _("smoking fish"),
            actions = {
                -- time: 30.8 + 30 + 2 * 3.6 = 68
                "return=skipped unless economy needs smoked_fish",
                "consume=fish:2 log",
                "animate=working duration:30s800ms",
                "sleep=duration:30s",
                "produce=smoked_fish:2"
            }
        },
    },
}

pop_textdomain()
