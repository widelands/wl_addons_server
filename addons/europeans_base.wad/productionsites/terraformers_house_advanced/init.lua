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
                "sleep=duration:10s",
                "callworker=check_dig_space",
                "call=digging_pond",
                "sleep=duration:5s",
                "callworker=check_pond_dry",
                "call=filling_pond_dry",
                "sleep=duration:5s",
                "callworker=check_coast",
                "call=terraforming_coast",
                "sleep=duration:5s",
                "callworker=check_coast",
                "call=terraforming_coast",
                "sleep=duration:5s",
                "callworker=check_coast",
                "call=terraforming_coast",
                "sleep=duration:10s",
                "callworker=check_dig_space",
                "call=digging_pond",
                "sleep=duration:5s",
                "callworker=check_pond_dry",
                "call=filling_pond_dry",
                "sleep=duration:5s",
                "callworker=check_coast",
                "call=terraforming_coast",
                "sleep=duration:5s",
                "callworker=check_coast",
                "call=terraforming_coast",
                "sleep=duration:5s",
                "callworker=check_coast",
                "call=terraforming_coast",
                "return=skipped"
            }
        },
        terraforming_coast = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming coast because ...
            descname = pgettext("europeans_building", "terraforming coast"),
            actions = {
                "return=skipped unless site has blackwood:4",
                "return=skipped unless site has water:2",
                "consume=blackwood",
                "animate=working duration:1s",
                "callworker=terraform_coast",
                "consume=blackwood",
                "animate=working duration:1s",
                "callworker=terraform_coast",
                "consume=water",
                "animate=working duration:1s",
                "produce=clay",
                "consume=blackwood",
                "animate=working duration:1s",
                "callworker=terraform_coast",
                "consume=blackwood",
                "animate=working duration:1s",
                "callworker=terraform_coast",
                "consume=water",
                "animate=working duration:1s",
                "produce=clay"
            }
        },
        digging_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging pond because ...
            descname = pgettext("europeans_building", "digging a dry pond"),
            actions = {
                "return=skipped unless economy needs clay",
                "callworker=check_dig_space",
                "return=skipped unless site has water",
                "callworker=dig_pond",
                "consume=water",
                "produce=clay"
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
        }
    },
}

pop_textdomain()
