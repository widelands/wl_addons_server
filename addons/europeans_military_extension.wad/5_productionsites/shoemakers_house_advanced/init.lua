push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/toolsmithy/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_shoemakers_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Shoemakers House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 63, 64 },
        },
        working = {
            basename = "idle",
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 63, 64 },
        },
    },

    size = "medium",
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "planks", amount = 8 },
        { name = "cloth", amount = 8 },
        { name = "leather", amount = 8 },
        { name = "rubber", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_boots_wooden",
                "sleep=duration:15s",
                "call=produce_boots_sturdy",
                "sleep=duration:15s",
                "call=produce_boots_swift",
                "sleep=duration:15s",
                "call=produce_boots_advanced",
                "return=skipped"
            }
        },
        produce_boots_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden boots because ...
            descname = pgettext("europeans_building", "making a pair of wooden boots"),
            actions = {
                "return=skipped when economy needs planks and not economy needs boots_wooden",
                "return=skipped when economy needs cloth and not economy needs boots_wooden",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_wooden",
                "return=skipped when economy needs boots_swift and not economy needs boots_wooden",
                "return=skipped when economy needs boots_advanced and not economy needs boots_wooden",
                "consume=planks",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:2m",
                "consume=cloth",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=boots_wooden:2"
            }
        },
        produce_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making study boots because ...
            descname = pgettext("europeans_building", "making study boots"),
            actions = {
                "return=skipped when economy needs planks and not economy needs boots_sturdy",
                "return=skipped when economy needs cloth and not economy needs boots_sturdy",
                "return=skipped when economy needs rubber and economy needs leather and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_wooden and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_swift and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_advanced and not economy needs boots_sturdy",
                "consume=planks",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:2m",
                "consume=cloth leather,rubber",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=boots_sturdy:2"
            }
        },
        produce_boots_swift = {
            -- TRANSLATORS: Completed/Skipped/Did not start making swift boots because ...
            descname = pgettext("europeans_building", "making swift boots"),
            actions = {
                "return=skipped when economy needs planks and not economy needs boots_swift",
                "return=skipped when economy needs cloth and not economy needs boots_swift",
                "return=skipped when economy needs rubber and economy needs leather and not economy needs boots_swift",
                "return=skipped when economy needs boots_wooden and not economy needs boots_swift",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_swift",
                "return=skipped when economy needs boots_advanced and not economy needs boots_swift",
                "consume=planks",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:2m",
                "consume=cloth leather,rubber:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=boots_swift:2"
            }
        },
        produce_boots_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start making advanced boots because ...
            descname = pgettext("europeans_building", "making advanced boots"),
            actions = {
                "return=skipped when economy needs planks and not economy needs boots_advanced",
                "return=skipped when economy needs cloth and not economy needs boots_advanced",
                "return=skipped when economy needs rubber and economy needs leather and not economy needs boots_advanced",
                "return=skipped when economy needs boots_wooden and not economy needs boots_advanced",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_advanced",
                "return=skipped when economy needs boots_swift and not economy needs boots_advanced",
                "consume=planks",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:2m",
                "consume=cloth:2 leather,rubber:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=boots_advanced:2"
            }
        }
    },
}

pop_textdomain()
