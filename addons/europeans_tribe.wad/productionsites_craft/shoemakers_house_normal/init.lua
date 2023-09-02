push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_shoemakers_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Shoemakers House"),
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
        name = "europeans_shoemakers_house_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2
        },
    },

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "planks", amount = 6 },
        { name = "cloth", amount = 4 },
        { name = "leather", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_boots_wooden",
                "sleep=duration:10s",
                "call=produce_boots_sturdy",
                "sleep=duration:10s",
                "call=produce_boots_swift",
                "sleep=duration:10s",
                "return=skipped"
            }
        },
        produce_boots_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden boots because ...
                        descname = pgettext("europeans_building", "making a pair of wooden boots"),
            actions = {
                "return=skipped unless economy needs boots_wooden or workers need experience",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:60s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=boots_wooden:2"
            }
        },
        produce_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making study boots because ...
            descname = pgettext("europeans_building", "making study boots"),
            actions = {
                "return=skipped unless economy needs boots_sturdy or workers need experience",
                "return=skipped when economy needs boots_swift and not economy needs boots_sturdy",
                "consume=planks leather cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:60s",
                "produce=boots_sturdy:2"
            }
        },
        produce_boots_swift = {
            -- TRANSLATORS: Completed/Skipped/Did not start making swift boots because ...
            descname = pgettext("europeans_building", "making swift boots"),
            actions = {
                "return=skipped unless economy needs boots_swift or workers need experience",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_swift",
                "consume=planks leather cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:60s",
                "produce=boots_swift:2"
            }
        }
    },
}

pop_textdomain()
