push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_farm_fruit",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Fruit Farm"),
    icon = dirname .. "menu.png",
    size = "medium",

    buildcost = {
        log = 3,
        reed = 3,
        granite = 2,
        marble_column = 1
    },
    return_on_dismantle = {
        log = 2,
        reed = 3,
        granite = 1,
        marble = 1
    },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 59, 65 },
        },
    },

    aihints = {
        space_consumer = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
        basic_amount = 1,
        prohibited_till = 2400,
        forced_after = 3000
    },

    working_positions = {
        europeans_farmer_basic = 1
    },
    
    inputs = {
        { name = "water", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=plant_berrybush",
                "call=plant_grape",
                "call=harvest_berry",
                "call=harvest_grape",
                "return=skipped"
            }
        },
        plant_berrybush = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting berrybush because ...
            descname = pgettext("europeans_building", "planting berrybush"),
            actions = {
                "return=skipped unless economy needs fruit or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water:2",
                "callworker=plant_berrybush",
                "sleep=duration:1s"
            }
        },
        plant_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting grape because ...
            descname = pgettext("europeans_building", "planting grape"),
            actions = {
                "return=skipped unless economy needs grape or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:2",
                "callworker=plant_grape",
                "sleep=duration:1s"
            }
        },
        harvest_berry = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting berry because ...
            descname = pgettext("europeans_building", "harvesting berry"),
            actions = {
                "return=skipped unless economy needs fruit or workers need experience",
                "sleep=duration:5s",
                "callworker=harvest_berrybush",
                "sleep=duration:5s",
                "produce=fruit"
            }
        },
        harvest_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting grape because ...
            descname = pgettext("europeans_building", "harvesting grape"),
            actions = {
                "return=skipped unless economy needs grape or workers need experience",
                "sleep=duration:5s",
                "callworker=harvest_grape",
                "sleep=duration:5s",
                "produce=grape"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The farmer working at this farm has no cleared soil to plant his seeds."),
        productivity_threshold = 30
    },
}

pop_textdomain()
