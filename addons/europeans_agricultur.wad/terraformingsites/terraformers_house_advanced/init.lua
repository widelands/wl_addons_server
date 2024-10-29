push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_terraformers_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Terraformer’s House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 60, 59 },
        },
        working = {
            basename = "idle",
            hotspot = { 60, 59 },
        },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_tree_nursery_advanced",
        enhancement_cost = {
            planks = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1
        }
    },

    aihints = {
        needs_water = true,
        requires_supporters = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_terraformer_advanced = 1
    },

    inputs = {
        { name = "blackwood", amount = 12 },
        { name = "water", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_land",
                "call=terraforming_land_dry",
                "sleep=duration:10s",
                "callworker=check_dig_space",
                "call=digging_pond",
                "sleep=duration:5s",
                "callworker=check_pond_dry",
                "call=filling_pond_dry",
                "sleep=duration:5s",
                "callworker=check_land",
                "call=terraforming_land_dry",
                "sleep=duration:10s",
                "callworker=check_dig_space",
                "call=digging_pond",
                "sleep=duration:5s",
                "callworker=check_pond_dry",
                "call=filling_pond_dry",
                "sleep=duration:5s",
                "callworker=check_land",
                "call=terraforming_land_dry",
                "sleep=duration:10s",
                "callworker=check_dig_space",
                "call=digging_pond",
                "sleep=duration:5s",
                "callworker=check_pond_dry",
                "call=filling_pond_dry",
                "sleep=duration:5s",
                "return=skipped"
            }
        },
        terraforming_land_dry = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming dry land because ...
            descname = pgettext("europeans_building", "terraforming dry land"),
            actions = {
                "return=skipped when economy needs water",
                "return=skipped unless site has water:2",
                "callworker=check_land",
                "consume=water",
                "animate=working duration:1s",
                "callworker=terraform_land",
                "return=skipped"
            }
        },
        digging_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging pond because ...
            descname = pgettext("europeans_building", "digging a dry pond"),
            actions = {
                "callworker=check_dig_space",
                "callworker=dig_pond"
            }
        },
        filling_pond_dry = {
            -- TRANSLATORS: Completed/Skipped/Did not start filling pond because ...
            descname = pgettext("europeans_building", "filling pond with water"),
            actions = {
                "callworker=check_pond_dry",
                "return=skipped unless site has water",
                "consume=water",
                "animate=working duration:1s",
                "callworker=fill_pond_dry"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = _"dummy program",
            actions = {
                "callworker=check_dike",
                "sleep=duration:1s",
                "callworker=dike",
                "sleep=duration:10s",
                "produce=clay"
            }
        }
    },
}

pop_textdomain()
