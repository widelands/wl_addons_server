push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_terraformers_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Terraformer’s House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 44, 49 },
      },
    },
    spritesheets = {
      build = {
         frames = 3,
         columns = 3,
         rows = 1,
         hotspot = { 44, 49 },
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_terraformers_house_normal",
        enhancement_cost = {
            blackwood = 1,
            grout = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1
        },
    },
    buildcost = {
        log = 2,
        granite = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        needs_water = true,
        requires_supporters = true,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        --normal_ai_limit = 8,
    },

    working_positions = {
        europeans_terraformer_basic = 1
    },

    inputs = {
        { name = "log", amount = 12 },
        { name = "water", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "return=skipped unless site has log:8",
                "sleep=duration:10s",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "sleep=duration:10s",
                "callworker=check_pond_water",
                "call=terraforming_pond_water",
                "callworker=check_pond_dry",
                "call=terraforming_pond_dry",
                "sleep=duration:10s",
                "return=skipped"
            }
        },
        terraforming_coast = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming coast because ...
            descname = pgettext("europeans_building", "terraforming coast"),
            actions = {
                "consume=log:2",
                "callworker=terraform_coast",
                "consume=log:2",
                "callworker=terraform_coast"
            }
        },
        terraforming_pond_water = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming pond with water because ...
            descname = pgettext("europeans_building", "terraforming pond with water"),
            actions = {
                "callworker=check_pond_water",
                "callworker=terraform_pond_water",
                "return=skipped"
            }
        },
        terraforming_pond_dry = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming dry pond because ...
            descname = pgettext("europeans_building", "terraforming dry pond"),
            actions = {
                "return=skipped when economy needs water",
                "return=skipped unless site has water",
                "callworker=check_pond_dry",
                "consume=water",
                "callworker=terraform_pond_dry",
                "return=skipped"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = _"dummy program",
            actions = {
                "callworker=check_water_fish",
                "callworker=check_water_breed_fish",
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
