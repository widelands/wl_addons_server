push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/trainingsites/barbarians/battlearena/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_battlearena_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Battle Arena"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 110, 72 }
      },
    },
    spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 110, 72 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 110, 72 }
      },
      working = {
         fps = 1,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 110, 72 }
      },
    },
    
    size = "big",
    destructible = true,
    enhancement = {
        name = "europeans_battlearena_level_1",
        enhancement_cost = {
            granite = 3,
            ironwood = 3,
            rope = 2,
            rubber = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 1,
            rope = 1,
            rubber = 1,
            gold = 1
        }
    },
    buildcost = {
        granite = 4,
        blackwood = 4,
        reed = 4,
        gold = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2,
        reed = 2,
        gold = 1
    },

    aihints = {
        trainingsites_max_percent = 5,
        prohibited_till = 10800,
        forced_after = 14400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        barbarians_trainer = 1
    },

    inputs = {
        { name = "meat", amount = 6 },
        { name = "fish", amount = 6 },
        { name = "barbarians_bread", amount = 8 },
        { name = "beer_strong", amount = 8 },
        { name = "boots_sturdy", amount = 4 }
    },

    programs = {
        sleep = {
            -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
            descname = _"sleeping",
            actions = {
                "sleep=duration:5s",
                "return=skipped",
            }
        },
        upgrade_soldier_evade_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:evade level:0", -- Fails when aren't any soldier of level 0 evade
                "return=failed unless site has boots_sturdy",
                "return=failed unless site has barbarians_bread",
                "return=failed unless site has fish,meat",
                "return=failed unless site has beer_strong",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:evade level:0", -- Because the soldier can be expelled by the player
                "consume=boots_sturdy barbarians_bread fish,meat beer_strong",
                "train=soldier:evade level:1"
            }
        },
    },
    
    soldier_capacity = 4,
    trainer_patience = 16,
    
    messages = {
        -- TRANSLATORS: Europeans training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Europeans training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()
