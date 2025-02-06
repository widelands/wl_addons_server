push_textdomain("barbarians_empire_economy_upgrade.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "empire_independent_fishing_hut",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("empire_building", "Independent Fishing Hut"),
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
    
    buildcost = {
        log = 3,
        granite = 1
    },
    return_on_dismantle = {
        log = 1
    },

    aihints = {
        needs_water = true,
        basic_amount = 3
    },

    working_positions = {
        empire_fisher = 1
    },


    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"fishing",
            actions = {
                "callworker=independent_fishing",
                "sleep=duration:30s",
            }
        }
        
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Fishes",
        heading = _"Out of Fishes",
        message = pgettext("empire_building", "The fisher working at this fisher’s hut can’t find any fishes in his work area."),
        productivity_threshold = 35
    },
}

pop_textdomain()
