push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_manufactory_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Big Manufactory"),
    icon = dirname .. "menu.png",
    
   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 48, 65 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 48, 65 },
      },
      unoccupied = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 48, 65 },
      },
      working = {
         fps = 2,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 48, 65 },
      },
   },

    size = "big",
    destructible = true,
    
    aihints = {},
    
    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_normal = 2,
        europeans_worker_basic = 2,
    },
    
    inputs = {
        { name = "log", amount = 16 },
        { name = "reed", amount = 12 },
        { name = "cotton", amount = 12 },
        { name = "wool", amount = 12 },
        { name = "rubber", amount = 12 },
        { name = "leather", amount = 12 },
        { name = "coal", amount = 12 },
        { name = "iron", amount = 12 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=processing_log",
                "call=processing_reed_cotton_wool",
                "call=processing_iron",
                "call=processing_log",
                "call=processing_reed_cotton_wool",
                "call=processing_iron",
                "return=skipped"
            }
        },
        processing_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing log for input wares because ...
            descname = pgettext("europeans_building", "processing log to create tools and weapons"),
            actions = {
                "call=producing_armor_wooden",
                "call=producing_boots_wooden",
                "call=producing_helmet_wooden",
                "call=producing_spear_wooden",
            }
        },
        processing_reed_cotton_wool = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing reed or cottion for input wares because ...
            descname = pgettext("europeans_building", "processing reed or cotton or wool to create tools and armor"),
            actions = {
                "call=producing_armor",
                "call=producing_armor",
                "call=producing_armor_processed",
                "call=producing_boots_sturdy",
                "call=producing_armor_compressed",
                "call=producing_boots_swift",
                "call=producing_armor_advanced",
                "call=producing_boots_advanced",
            }
        },
        processing_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing iron for input wares because ...
            descname = pgettext("europeans_building", "processing iron to create tools and weapons"),
            actions = {
                "call=producing_buckets",
                "call=producing_basket",
                "call=producing_felling_ax",
                "call=producing_scythe",
                "call=producing_pick",
                "call=producing_shovel",
                "call=producing_hammer",
                "call=producing_saw",
                "call=producing_fire_tongs",
                "call=producing_needles",
                "call=producing_helmet_mask",
                "call=producing_spear_advanced",
                "call=producing_shield_steel",
                "call=producing_ax_broad",
                "call=producing_shield_advanced",
                "call=producing_sword_broad",
            }
        },
        producing_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped when economy needs log and not economy needs armor_wooden",
                "return=skipped when economy needs blackwood and not economy needs armor_wooden",
                "return=skipped when economy needs planks and not economy needs armor_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs armor_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs armor_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs armor_wooden",
                "return=skipped when economy needs basket and not economy needs armor_wooden",
                "return=skipped when economy needs buckets and not economy needs armor_wooden",
                "return=skipped when economy needs felling_ax and not economy needs armor_wooden",
                "return=skipped when economy needs fire_tongs and not economy needs armor_wooden",
                "return=skipped when economy needs hammer and not economy needs armor_wooden",
                "return=skipped when economy needs needles and not economy needs armor_wooden",
                "return=skipped when economy needs pick and not economy needs armor_wooden",
                "return=skipped when economy needs saw and not economy needs armor_wooden",
                "return=skipped when economy needs scythe and not economy needs armor_wooden",
                "return=skipped when economy needs shovel and not economy needs armor_wooden",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=armor_wooden:2"
            }
        },
        producing_boots_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden boots because ...
            descname = pgettext("europeans_building", "making a pair of wooden boots"),
            actions = {
                "return=skipped when economy needs log and not economy needs boots_wooden",
                "return=skipped when economy needs blackwood and not economy needs boots_wooden",
                "return=skipped when economy needs planks and not economy needs boots_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs boots_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs boots_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs boots_wooden",
                "return=skipped when economy needs basket and not economy needs boots_wooden",
                "return=skipped when economy needs buckets and not economy needs boots_wooden",
                "return=skipped when economy needs felling_ax and not economy needs boots_wooden",
                "return=skipped when economy needs fire_tongs and not economy needs boots_wooden",
                "return=skipped when economy needs hammer and not economy needs boots_wooden",
                "return=skipped when economy needs needles and not economy needs boots_wooden",
                "return=skipped when economy needs pick and not economy needs boots_wooden",
                "return=skipped when economy needs saw and not economy needs boots_wooden",
                "return=skipped when economy needs scythe and not economy needs boots_wooden",
                "return=skipped when economy needs shovel and not economy needs boots_wooden",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=boots_wooden:2"
            }
        },
        producing_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped when economy needs log and not economy needs helmet_wooden",
                "return=skipped when economy needs blackwood and not economy needs helmet_wooden",
                "return=skipped when economy needs planks and not economy needs helmet_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs basket and not economy needs helmet_wooden",
                "return=skipped when economy needs buckets and not economy needs helmet_wooden",
                "return=skipped when economy needs felling_ax and not economy needs helmet_wooden",
                "return=skipped when economy needs fire_tongs and not economy needs helmet_wooden",
                "return=skipped when economy needs hammer and not economy needs helmet_wooden",
                "return=skipped when economy needs needles and not economy needs helmet_wooden",
                "return=skipped when economy needs pick and not economy needs helmet_wooden",
                "return=skipped when economy needs saw and not economy needs helmet_wooden",
                "return=skipped when economy needs scythe and not economy needs helmet_wooden",
                "return=skipped when economy needs shovel and not economy needs helmet_wooden",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=helmet_wooden:2"
            }
        },
        producing_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped when economy needs log and not economy needs spear_wooden",
                "return=skipped when economy needs blackwood and not economy needs spear_wooden",
                "return=skipped when economy needs planks and not economy needs spear_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs basket and not economy needs spear_wooden",
                "return=skipped when economy needs buckets and not economy needs spear_wooden",
                "return=skipped when economy needs felling_ax and not economy needs spear_wooden",
                "return=skipped when economy needs fire_tongs and not economy needs spear_wooden",
                "return=skipped when economy needs hammer and not economy needs spear_wooden",
                "return=skipped when economy needs needles and not economy needs spear_wooden",
                "return=skipped when economy needs pick and not economy needs spear_wooden",
                "return=skipped when economy needs saw and not economy needs spear_wooden",
                "return=skipped when economy needs scythe and not economy needs spear_wooden",
                "return=skipped when economy needs shovel and not economy needs spear_wooden",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        producing_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of armor"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs armor",
                "return=skipped when economy needs cloth and not economy needs armor",
                "return=skipped when economy needs basket and not economy needs armor",
                "return=skipped when economy needs buckets and not economy needs armor",
                "return=skipped when economy needs felling_ax and not economy needs armor",
                "return=skipped when economy needs fire_tongs and not economy needs armor",
                "return=skipped when economy needs hammer and not economy needs armor",
                "return=skipped when economy needs needles and not economy needs armor",
                "return=skipped when economy needs pick and not economy needs armor",
                "return=skipped when economy needs saw and not economy needs armor",
                "return=skipped when economy needs scythe and not economy needs armor",
                "return=skipped when economy needs shovel and not economy needs armor",
                "consume=cotton,wool:4",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:3m",
                "produce=armor:3"
            }
        },
        producing_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring processed armor because ...
            descname = pgettext("europeans_building", "tailoring processed armor"),
            actions = {
                "return=skipped when economy needs reed and not economy needs armor_processed",
                "return=skipped when economy needs cotton and not economy needs armor_processed",
                "return=skipped when economy needs cloth and not economy needs armor_processed",
                "return=skipped when economy needs armor and not economy needs armor_processed",
                "return=skipped when economy needs armor_compressed and not economy needs armor_processed",
                "return=skipped when economy needs armor_advanced and not economy needs armor_processed",
                "return=skipped when economy needs boots_sturdy and not economy needs armor_processed",
                "return=skipped when economy needs boots_swift and not economy needs armor_processed",
                "return=skipped when economy needs boots_advanced and not economy needs armor_processed",
                "return=skipped when economy needs basket and not economy needs armor_processed",
                "return=skipped when economy needs buckets and not economy needs armor_processed",
                "return=skipped when economy needs felling_ax and not economy needs armor_processed",
                "return=skipped when economy needs fire_tongs and not economy needs armor_processed",
                "return=skipped when economy needs hammer and not economy needs armor_processed",
                "return=skipped when economy needs needles and not economy needs armor_processed",
                "return=skipped when economy needs pick and not economy needs armor_processed",
                "return=skipped when economy needs saw and not economy needs armor_processed",
                "return=skipped when economy needs scythe and not economy needs armor_processed",
                "return=skipped when economy needs shovel and not economy needs armor_processed",
                "consume=reed cotton,wool:3",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=armor_processed:2"
            }
        },
        producing_armor_compressed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of chain armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of chain armor"),
            actions = {
                "return=skipped when economy needs reed and not economy needs armor_compressed",
                "return=skipped when economy needs cotton and not economy needs armor_compressed",
                "return=skipped when economy needs rubber and not economy needs armor_compressed",
                "return=skipped when economy needs cloth and not economy needs armor_compressed",
                "return=skipped when economy needs armor and not economy needs armor_compressed",
                "return=skipped when economy needs armor_processed and not economy needs armor_compressed",
                "return=skipped when economy needs armor_advanced and not economy needs armor_compressed",
                "return=skipped when economy needs boots_sturdy and not economy needs armor_compressed",
                "return=skipped when economy needs boots_swift and not economy needs armor_compressed",
                "return=skipped when economy needs boots_advanced and not economy needs armor_compressed",
                "return=skipped when economy needs basket and not economy needs armor_compressed",
                "return=skipped when economy needs buckets and not economy needs armor_compressed",
                "return=skipped when economy needs felling_ax and not economy needs armor_compressed",
                "return=skipped when economy needs fire_tongs and not economy needs armor_compressed",
                "return=skipped when economy needs hammer and not economy needs armor_compressed",
                "return=skipped when economy needs needles and not economy needs armor_compressed",
                "return=skipped when economy needs pick and not economy needs armor_compressed",
                "return=skipped when economy needs saw and not economy needs armor_compressed",
                "return=skipped when economy needs scythe and not economy needs armor_compressed",
                "return=skipped when economy needs shovel and not economy needs armor_compressed",
                "consume=reed:2 cotton,wool:2 rubber,leather",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=armor_compressed:2"
            }
        },
        producing_armor_advanced= {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of advanced armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of advanced armor"),
            actions = {
                "return=skipped when economy needs reed and not economy needs armor_advanced",
                "return=skipped when economy needs cotton and not economy needs armor_advanced",
                "return=skipped when economy needs rubber and not economy needs armor_advanced",
                "return=skipped when economy needs cloth and not economy needs armor_advanced",
                "return=skipped when economy needs armor and not economy needs armor_advanced",
                "return=skipped when economy needs armor_processed and not economy needs armor_advanced",
                "return=skipped when economy needs armor_compressed and not economy needs armor_advanced",
                "return=skipped when economy needs boots_sturdy and not economy needs armor_advanced",
                "return=skipped when economy needs boots_swift and not economy needs armor_advanced",
                "return=skipped when economy needs boots_advanced and not economy needs armor_advanced",
                "return=skipped when economy needs basket and not economy needs armor_advanced",
                "return=skipped when economy needs buckets and not economy needs armor_advanced",
                "return=skipped when economy needs felling_ax and not economy needs armor_advanced",
                "return=skipped when economy needs fire_tongs and not economy needs armor_advanced",
                "return=skipped when economy needs hammer and not economy needs armor_advanced",
                "return=skipped when economy needs needles and not economy needs armor_advanced",
                "return=skipped when economy needs pick and not economy needs armor_advanced",
                "return=skipped when economy needs saw and not economy needs armor_advanced",
                "return=skipped when economy needs scythe and not economy needs armor_advanced",
                "return=skipped when economy needs shovel and not economy needs armor_advanced",
                "consume=reed:2 cotton,wool:2 rubber,leather:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=armor_advanced:2"
            }
        },
        producing_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making study boots because ...
            descname = pgettext("europeans_building", "making study boots"),
            actions = {
                "return=skipped when economy needs log and not economy needs boots_sturdy",
                "return=skipped when economy needs cotton and not economy needs boots_sturdy",
                "return=skipped when economy needs cloth and not economy needs boots_sturdy",
                "return=skipped when economy needs armor and not economy needs boots_sturdy",
                "return=skipped when economy needs armor_processed and not economy needs boots_sturdy",
                "return=skipped when economy needs armor_compressed and not economy needs boots_sturdy",
                "return=skipped when economy needs armor_advanced and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_swift and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_advanced and not economy needs boots_sturdy",
                "return=skipped when economy needs basket and not economy needs boots_sturdy",
                "return=skipped when economy needs buckets and not economy needs boots_sturdy",
                "return=skipped when economy needs felling_ax and not economy needs boots_sturdy",
                "return=skipped when economy needs fire_tongs and not economy needs boots_sturdy",
                "return=skipped when economy needs hammer and not economy needs boots_sturdy",
                "return=skipped when economy needs needles and not economy needs boots_sturdy",
                "return=skipped when economy needs pick and not economy needs boots_sturdy",
                "return=skipped when economy needs saw and not economy needs boots_sturdy",
                "return=skipped when economy needs scythe and not economy needs boots_sturdy",
                "return=skipped when economy needs shovel and not economy needs boots_sturdy",
                "consume=log cotton,wool:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=boots_sturdy:2"
            }
        },
        producing_boots_swift = {
            -- TRANSLATORS: Completed/Skipped/Did not start making swift boots because ...
            descname = pgettext("europeans_building", "making swift boots"),
            actions = {
                "return=skipped when economy needs log and not economy needs boots_swift",
                "return=skipped when economy needs cotton and not economy needs boots_swift",
                "return=skipped when economy needs rubber and not economy needs boots_swift",
                "return=skipped when economy needs cloth and not economy needs boots_swift",
                "return=skipped when economy needs armor and not economy needs boots_swift",
                "return=skipped when economy needs armor_processed and not economy needs boots_swift",
                "return=skipped when economy needs armor_compressed and not economy needs boots_swift",
                "return=skipped when economy needs armor_advanced and not economy needs boots_swift",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_swift",
                "return=skipped when economy needs boots_advanced and not economy needs boots_swift",
                "return=skipped when economy needs basket and not economy needs boots_swift",
                "return=skipped when economy needs buckets and not economy needs boots_swift",
                "return=skipped when economy needs felling_ax and not economy needs boots_swift",
                "return=skipped when economy needs fire_tongs and not economy needs boots_swift",
                "return=skipped when economy needs hammer and not economy needs boots_swift",
                "return=skipped when economy needs needles and not economy needs boots_swift",
                "return=skipped when economy needs pick and not economy needs boots_swift",
                "return=skipped when economy needs saw and not economy needs boots_swift",
                "return=skipped when economy needs scythe and not economy needs boots_swift",
                "return=skipped when economy needs shovel and not economy needs boots_swift",
                "consume=log cotton,wool:2 rubber,leather",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=boots_swift:2"
            }
        },
        producing_boots_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start making advanced boots because ...
            descname = pgettext("europeans_building", "making advanced boots"),
            actions = {
                "return=skipped when economy needs log and not economy needs boots_advanced",
                "return=skipped when economy needs cotton and not economy needs boots_advanced",
                "return=skipped when economy needs rubber and not economy needs boots_advanced",
                "return=skipped when economy needs cloth and not economy needs boots_advanced",
                "return=skipped when economy needs armor and not economy needs boots_advanced",
                "return=skipped when economy needs armor_processed and not economy needs boots_advanced",
                "return=skipped when economy needs armor_compressed and not economy needs boots_advanced",
                "return=skipped when economy needs armor_advanced and not economy needs boots_advanced",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_advanced",
                "return=skipped when economy needs boots_swift and not economy needs boots_advanced",
                "return=skipped when economy needs basket and not economy needs boots_advanced",
                "return=skipped when economy needs buckets and not economy needs boots_advanced",
                "return=skipped when economy needs felling_ax and not economy needs boots_advanced",
                "return=skipped when economy needs fire_tongs and not economy needs boots_advanced",
                "return=skipped when economy needs hammer and not economy needs boots_advanced",
                "return=skipped when economy needs needles and not economy needs boots_advanced",
                "return=skipped when economy needs pick and not economy needs boots_advanced",
                "return=skipped when economy needs saw and not economy needs boots_advanced",
                "return=skipped when economy needs scythe and not economy needs boots_advanced",
                "return=skipped when economy needs shovel and not economy needs boots_advanced",
                "consume=log cotton,wool:2 rubber,leather",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=boots_advanced:2"
            }
        },
        producing_basket = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
            descname = pgettext("europeans_building", "making baskets"),
            actions = {
                "return=skipped when economy needs log and not economy needs basket",
                "return=skipped when economy needs coal and not economy needs basket",
                "return=skipped when economy needs iron and not economy needs basket",
                "return=skipped when economy needs buckets and not economy needs basket",
                "return=skipped when economy needs felling_ax and not economy needs basket",
                "return=skipped when economy needs fire_tongs and not economy needs basket",
                "return=skipped when economy needs hammer and not economy needs basket",
                "return=skipped when economy needs needles and not economy needs basket",
                "return=skipped when economy needs pick and not economy needs basket",
                "return=skipped when economy needs saw and not economy needs basket",
                "return=skipped when economy needs scythe and not economy needs basket",
                "return=skipped when economy needs shovel and not economy needs basket",
                "return=skipped when economy needs helmet_mask and not economy needs basket",
                "return=skipped when economy needs shield_steel and not economy needs basket",
                "return=skipped when economy needs shield_advanced and not economy needs basket",
                "return=skipped when economy needs spear_advanced and not economy needs basket",
                "return=skipped when economy needs ax_broad and not economy needs basket",
                "return=skipped when economy needs sword_broad and not economy needs basket",
                "consume=log:2 coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=basket:3"
            }
        },
        producing_buckets = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
            descname = pgettext("europeans_building", "making buckets"),
            actions = {
                "return=skipped when economy needs log and not economy needs buckets",
                "return=skipped when economy needs coal and not economy needs buckets",
                "return=skipped when economy needs iron and not economy needs buckets",
                "return=skipped when economy needs basket and not economy needs buckets",
                "return=skipped when economy needs felling_ax and not economy needs buckets",
                "return=skipped when economy needs fire_tongs and not economy needs buckets",
                "return=skipped when economy needs hammer and not economy needs buckets",
                "return=skipped when economy needs needles and not economy needs buckets",
                "return=skipped when economy needs pick and not economy needs buckets",
                "return=skipped when economy needs saw and not economy needs buckets",
                "return=skipped when economy needs scythe and not economy needs buckets",
                "return=skipped when economy needs shovel and not economy needs buckets",
                "return=skipped when economy needs helmet_mask and not economy needs buckets",
                "return=skipped when economy needs shield_steel and not economy needs buckets",
                "return=skipped when economy needs shield_advanced and not economy needs buckets",
                "return=skipped when economy needs spear_advanced and not economy needs buckets",
                "return=skipped when economy needs ax_broad and not economy needs buckets",
                "return=skipped when economy needs sword_broad and not economy needs buckets",
                "consume=log:2 coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=buckets:3"
            }
        },
        producing_felling_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
            descname = pgettext("europeans_building", "making felling axes"),
            actions = {
                "return=skipped when economy needs log and not economy needs felling_ax",
                "return=skipped when economy needs coal and not economy needs felling_ax",
                "return=skipped when economy needs iron and not economy needs felling_ax",
                "return=skipped when economy needs basket and not economy needs felling_ax",
                "return=skipped when economy needs buckets and not economy needs felling_ax",
                "return=skipped when economy needs fire_tongs and not economy needs felling_ax",
                "return=skipped when economy needs hammer and not economy needs felling_ax",
                "return=skipped when economy needs needles and not economy needs felling_ax",
                "return=skipped when economy needs pick and not economy needs felling_ax",
                "return=skipped when economy needs saw and not economy needs felling_ax",
                "return=skipped when economy needs scythe and not economy needs felling_ax",
                "return=skipped when economy needs shovel and not economy needs felling_ax",
                "return=skipped when economy needs helmet_mask and not economy needs felling_ax",
                "return=skipped when economy needs shield_steel and not economy needs felling_ax",
                "return=skipped when economy needs shield_advanced and not economy needs felling_ax",
                "return=skipped when economy needs spear_advanced and not economy needs felling_ax",
                "return=skipped when economy needs ax_broad and not economy needs felling_ax",
                "return=skipped when economy needs sword_broad and not economy needs felling_ax",
                "consume=log:2 coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=felling_ax:3"
            }
        },
        producing_fire_tongs = {
            -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
            descname = pgettext("europeans_building", "making fire tongs"),
            actions = {
                "return=skipped when economy needs log and not economy needs fire_tongs",
                "return=skipped when economy needs coal and not economy needs fire_tongs",
                "return=skipped when economy needs iron and not economy needs fire_tongs",
                "return=skipped when economy needs basket and not economy needs fire_tongs",
                "return=skipped when economy needs buckets and not economy needs fire_tongs",
                "return=skipped when economy needs felling_ax and not economy needs fire_tongs",
                "return=skipped when economy needs hammer and not economy needs fire_tongs",
                "return=skipped when economy needs needles and not economy needs fire_tongs",
                "return=skipped when economy needs pick and not economy needs fire_tongs",
                "return=skipped when economy needs saw and not economy needs fire_tongs",
                "return=skipped when economy needs scythe and not economy needs fire_tongs",
                "return=skipped when economy needs shovel and not economy needs fire_tongs",
                "return=skipped when economy needs helmet_mask and not economy needs fire_tongs",
                "return=skipped when economy needs shield_steel and not economy needs fire_tongs",
                "return=skipped when economy needs shield_advanced and not economy needs fire_tongs",
                "return=skipped when economy needs spear_advanced and not economy needs fire_tongs",
                "return=skipped when economy needs ax_broad and not economy needs fire_tongs",
                "return=skipped when economy needs sword_broad and not economy needs fire_tongs",
                "consume=log:2 coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=fire_tongs:3"
            }
        },
        producing_hammer = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
            descname = pgettext("europeans_building", "making hammers"),
            actions = {
                "return=skipped when economy needs log and not economy needs hammer",
                "return=skipped when economy needs coal and not economy needs hammer",
                "return=skipped when economy needs iron and not economy needs hammer",
                "return=skipped when economy needs basket and not economy needs hammer",
                "return=skipped when economy needs buckets and not economy needs hammer",
                "return=skipped when economy needs felling_ax and not economy needs hammer",
                "return=skipped when economy needs fire_tongs and not economy needs hammer",
                "return=skipped when economy needs needles and not economy needs hammer",
                "return=skipped when economy needs pick and not economy needs hammer",
                "return=skipped when economy needs saw and not economy needs hammer",
                "return=skipped when economy needs scythe and not economy needs hammer",
                "return=skipped when economy needs shovel and not economy needs hammer",
                "return=skipped when economy needs helmet_mask and not economy needs hammer",
                "return=skipped when economy needs shield_steel and not economy needs hammer",
                "return=skipped when economy needs shield_advanced and not economy needs hammer",
                "return=skipped when economy needs spear_advanced and not economy needs hammer",
                "return=skipped when economy needs ax_broad and not economy needs hammer",
                "return=skipped when economy needs sword_broad and not economy needs hammer",
                "consume=log:2 coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=hammer:3"
            }
        },
        producing_needles = {
            -- TRANSLATORS: Completed/Skipped/Did not start making needles because ...
            descname = pgettext("europeans_building", "making needles"),
            actions = {
                "return=skipped when economy needs coal and not economy needs needles",
                "return=skipped when economy needs iron and not economy needs needles",
                "return=skipped when economy needs basket and not economy needs needles",
                "return=skipped when economy needs buckets and not economy needs needles",
                "return=skipped when economy needs felling_ax and not economy needs needles",
                "return=skipped when economy needs fire_tongs and not economy needs needles",
                "return=skipped when economy needs hammer and not economy needs needles",
                "return=skipped when economy needs pick and not economy needs needles",
                "return=skipped when economy needs saw and not economy needs needles",
                "return=skipped when economy needs scythe and not economy needs needles",
                "return=skipped when economy needs shovel and not economy needs needles",
                "return=skipped when economy needs helmet_mask and not economy needs needles",
                "return=skipped when economy needs shield_steel and not economy needs needles",
                "return=skipped when economy needs shield_advanced and not economy needs needles",
                "return=skipped when economy needs spear_advanced and not economy needs needles",
                "return=skipped when economy needs ax_broad and not economy needs needles",
                "return=skipped when economy needs sword_broad and not economy needs needles",
                "consume=coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=needles:3"
            }
        },
        producing_pick = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
            descname = pgettext("europeans_building", "making picks"),
            actions = {
                "return=skipped when economy needs log and not economy needs pick",
                "return=skipped when economy needs coal and not economy needs pick",
                "return=skipped when economy needs iron and not economy needs pick",
                "return=skipped when economy needs basket and not economy needs pick",
                "return=skipped when economy needs buckets and not economy needs pick",
                "return=skipped when economy needs felling_ax and not economy needs pick",
                "return=skipped when economy needs fire_tongs and not economy needs pick",
                "return=skipped when economy needs hammer and not economy needs pick",
                "return=skipped when economy needs needles and not economy needs pick",
                "return=skipped when economy needs saw and not economy needs pick",
                "return=skipped when economy needs scythe and not economy needs pick",
                "return=skipped when economy needs shovel and not economy needs pick",
                "return=skipped when economy needs helmet_mask and not economy needs pick",
                "return=skipped when economy needs shield_steel and not economy needs pick",
                "return=skipped when economy needs shield_advanced and not economy needs pick",
                "return=skipped when economy needs spear_advanced and not economy needs pick",
                "return=skipped when economy needs ax_broad and not economy needs pick",
                "return=skipped when economy needs sword_broad and not economy needs pick",
                "consume=log:2 coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=pick:3"
            }
        },
        producing_saw = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
            descname = pgettext("europeans_building", "making saws"),
            actions = {
                "return=skipped when economy needs log and not economy needs saw",
                "return=skipped when economy needs coal and not economy needs saw",
                "return=skipped when economy needs iron and not economy needs saw",
                "return=skipped when economy needs basket and not economy needs saw",
                "return=skipped when economy needs buckets and not economy needs saw",
                "return=skipped when economy needs felling_ax and not economy needs saw",
                "return=skipped when economy needs fire_tongs and not economy needs saw",
                "return=skipped when economy needs hammer and not economy needs saw",
                "return=skipped when economy needs needles and not economy needs saw",
                "return=skipped when economy needs pick and not economy needs saw",
                "return=skipped when economy needs scythe and not economy needs saw",
                "return=skipped when economy needs shovel and not economy needs saw",
                "return=skipped when economy needs helmet_mask and not economy needs saw",
                "return=skipped when economy needs shield_steel and not economy needs saw",
                "return=skipped when economy needs shield_advanced and not economy needs saw",
                "return=skipped when economy needs spear_advanced and not economy needs saw",
                "return=skipped when economy needs ax_broad and not economy needs saw",
                "return=skipped when economy needs sword_broad and not economy needs saw",
                "consume=log:2 coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=saw:3"
            }
        },
        producing_scythe = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
            descname = pgettext("europeans_building", "making sycthes"),
            actions = {
                "return=skipped when economy needs log and not economy needs scythe",
                "return=skipped when economy needs coal and not economy needs scythe",
                "return=skipped when economy needs iron and not economy needs scythe",
                "return=skipped when economy needs basket and not economy needs scythe",
                "return=skipped when economy needs buckets and not economy needs scythe",
                "return=skipped when economy needs felling_ax and not economy needs scythe",
                "return=skipped when economy needs fire_tongs and not economy needs scythe",
                "return=skipped when economy needs hammer and not economy needs scythe",
                "return=skipped when economy needs needles and not economy needs scythe",
                "return=skipped when economy needs pick and not economy needs scythe",
                "return=skipped when economy needs saw and not economy needs scythe",
                "return=skipped when economy needs shovel and not economy needs scythe",
                "return=skipped when economy needs helmet_mask and not economy needs scythe",
                "return=skipped when economy needs shield_steel and not economy needs scythe",
                "return=skipped when economy needs shield_advanced and not economy needs scythe",
                "return=skipped when economy needs spear_advanced and not economy needs scythe",
                "return=skipped when economy needs ax_broad and not economy needs scythe",
                "return=skipped when economy needs sword_broad and not economy needs scythe",
                "consume=log:2 coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=scythe:3"
            }
        },
        producing_shovel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
            descname = pgettext("europeans_building", "making shovels"),
            actions = {
                "return=skipped when economy needs log and not economy needs shovel",
                "return=skipped when economy needs coal and not economy needs shovel",
                "return=skipped when economy needs iron and not economy needs shovel",
                "return=skipped when economy needs basket and not economy needs shovel",
                "return=skipped when economy needs buckets and not economy needs shovel",
                "return=skipped when economy needs felling_ax and not economy needs shovel",
                "return=skipped when economy needs fire_tongs and not economy needs shovel",
                "return=skipped when economy needs hammer and not economy needs shovel",
                "return=skipped when economy needs needles and not economy needs shovel",
                "return=skipped when economy needs pick and not economy needs shovel",
                "return=skipped when economy needs saw and not economy needs shovel",
                "return=skipped when economy needs scythe and not economy needs shovel",
                "return=skipped when economy needs helmet_mask and not economy needs shovel",
                "return=skipped when economy needs shield_steel and not economy needs shovel",
                "return=skipped when economy needs shield_advanced and not economy needs shovel",
                "return=skipped when economy needs spear_advanced and not economy needs shovel",
                "return=skipped when economy needs ax_broad and not economy needs shovel",
                "return=skipped when economy needs sword_broad and not economy needs shovel",
                "consume=log:2 coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=shovel:3"
            }
        },
        producing_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped when economy needs coal and not economy needs helmet_mask",
                "return=skipped when economy needs iron and not economy needs helmet_mask",
                "return=skipped when economy needs shield_steel and not economy needs helmet_mask",
                "return=skipped when economy needs shield_advanced and not economy needs helmet_mask",
                "return=skipped when economy needs spear_advanced and not economy needs helmet_mask",
                "return=skipped when economy needs ax_broad and not economy needs helmet_mask",
                "return=skipped when economy needs sword_broad and not economy needs helmet_mask",
                "return=skipped when economy needs basket and not economy needs helmet_mask",
                "return=skipped when economy needs buckets and not economy needs helmet_mask",
                "return=skipped when economy needs felling_ax and not economy needs helmet_mask",
                "return=skipped when economy needs fire_tongs and not economy needs helmet_mask",
                "return=skipped when economy needs hammer and not economy needs helmet_mask",
                "return=skipped when economy needs needles and not economy needs helmet_mask",
                "return=skipped when economy needs pick and not economy needs helmet_mask",
                "return=skipped when economy needs saw and not economy needs helmet_mask",
                "return=skipped when economy needs scythe and not economy needs helmet_mask",
                "return=skipped when economy needs shovel and not economy needs helmet_mask",
                "consume=coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "produce=helmet_mask:2"
            }
        },
        producing_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped when economy needs coal and not economy needs shield_steel",
                "return=skipped when economy needs iron and not economy needs shield_steel",
                "return=skipped when economy needs helmet_mask and not economy needs shield_steel",
                "return=skipped when economy needs shield_advanced and not economy needs shield_steel",
                "return=skipped when economy needs spear_advanced and not economy needs shield_steel",
                "return=skipped when economy needs ax_broad and not economy needs shield_steel",
                "return=skipped when economy needs sword_broad and not economy needs shield_steel",
                "return=skipped when economy needs basket and not economy needs shield_steel",
                "return=skipped when economy needs buckets and not economy needs shield_steel",
                "return=skipped when economy needs felling_ax and not economy needs shield_steel",
                "return=skipped when economy needs fire_tongs and not economy needs shield_steel",
                "return=skipped when economy needs hammer and not economy needs shield_steel",
                "return=skipped when economy needs needles and not economy needs shield_steel",
                "return=skipped when economy needs pick and not economy needs shield_steel",
                "return=skipped when economy needs saw and not economy needs shield_steel",
                "return=skipped when economy needs scythe and not economy needs shield_steel",
                "return=skipped when economy needs shovel and not economy needs shield_steel",
                "consume=coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "produce=shield_steel:2"
            }
        },
        producing_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = pgettext("europeans_building", "forging an advanced shield"),
            actions = {
                "return=skipped when economy needs coal and not economy needs shield_advanced",
                "return=skipped when economy needs iron and not economy needs shield_advanced",
                "return=skipped when economy needs helmet_mask and not economy needs shield_advanced",
                "return=skipped when economy needs shield_steel and not economy needs shield_advanced",
                "return=skipped when economy needs spear_advanced and not economy needs shield_advanced",
                "return=skipped when economy needs ax_broad and not economy needs shield_advanced",
                "return=skipped when economy needs sword_broad and not economy needs shield_advanced",
                "return=skipped when economy needs basket and not economy needs shield_advanced",
                "return=skipped when economy needs buckets and not economy needs shield_advanced",
                "return=skipped when economy needs felling_ax and not economy needs shield_advanced",
                "return=skipped when economy needs fire_tongs and not economy needs shield_advanced",
                "return=skipped when economy needs hammer and not economy needs shield_advanced",
                "return=skipped when economy needs needles and not economy needs shield_advanced",
                "return=skipped when economy needs pick and not economy needs shield_advanced",
                "return=skipped when economy needs saw and not economy needs shield_advanced",
                "return=skipped when economy needs scythe and not economy needs shield_advanced",
                "return=skipped when economy needs shovel and not economy needs shield_advanced",
                "consume=coal iron:2",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "produce=shield_advanced:2"
            }
        },
        producing_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped when economy needs log and not economy needs spear_advanced",
                "return=skipped when economy needs coal and not economy needs spear_advanced",
                "return=skipped when economy needs iron and not economy needs spear_advanced",
                "return=skipped when economy needs helmet_mask and not economy needs spear_advanced",
                "return=skipped when economy needs shield_steel and not economy needs spear_advanced",
                "return=skipped when economy needs shield_advanced and not economy needs spear_advanced",
                "return=skipped when economy needs ax_broad and not economy needs spear_advanced",
                "return=skipped when economy needs sword_broad and not economy needs spear_advanced",
                "return=skipped when economy needs basket and not economy needs spear_advanced",
                "return=skipped when economy needs buckets and not economy needs spear_advanced",
                "return=skipped when economy needs felling_ax and not economy needs spear_advanced",
                "return=skipped when economy needs fire_tongs and not economy needs spear_advanced",
                "return=skipped when economy needs hammer and not economy needs spear_advanced",
                "return=skipped when economy needs needles and not economy needs spear_advanced",
                "return=skipped when economy needs pick and not economy needs spear_advanced",
                "return=skipped when economy needs saw and not economy needs spear_advanced",
                "return=skipped when economy needs scythe and not economy needs spear_advanced",
                "return=skipped when economy needs shovel and not economy needs spear_advanced",
                "consume=log coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
        producing_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = pgettext("europeans_building", "forging a broad ax"),
            actions = {
                "return=skipped when economy needs log and not economy needs ax_broad",
                "return=skipped when economy needs coal and not economy needs ax_broad",
                "return=skipped when economy needs iron and not economy needs ax_broad",
                "return=skipped when economy needs helmet_mask and not economy needs ax_broad",
                "return=skipped when economy needs shield_steel and not economy needs ax_broad",
                "return=skipped when economy needs shield_advanced and not economy needs ax_broad",
                "return=skipped when economy needs spear_advanced and not economy needs ax_broad",
                "return=skipped when economy needs sword_broad and not economy needs ax_broad",
                "return=skipped when economy needs basket and not economy needs ax_broad",
                "return=skipped when economy needs buckets and not economy needs ax_broad",
                "return=skipped when economy needs felling_ax and not economy needs ax_broad",
                "return=skipped when economy needs fire_tongs and not economy needs ax_broad",
                "return=skipped when economy needs hammer and not economy needs ax_broad",
                "return=skipped when economy needs needles and not economy needs ax_broad",
                "return=skipped when economy needs pick and not economy needs ax_broad",
                "return=skipped when economy needs saw and not economy needs ax_broad",
                "return=skipped when economy needs scythe and not economy needs ax_broad",
                "return=skipped when economy needs shovel and not economy needs ax_broad",
                "consume=log coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=ax_broad:2"
            }
        },
        producing_sword_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
            descname = pgettext("europeans_building", "forging a broadsword"),
            actions = {
                "return=skipped when economy needs log and not economy needs sword_broad",
                "return=skipped when economy needs coal and not economy needs sword_broad",
                "return=skipped when economy needs iron and not economy needs sword_broad",
                "return=skipped when economy needs helmet_mask and not economy needs sword_broad",
                "return=skipped when economy needs shield_steel and not economy needs sword_broad",
                "return=skipped when economy needs shield_advanced and not economy needs sword_broad",
                "return=skipped when economy needs spear_advanced and not economy needs sword_broad",
                "return=skipped when economy needs ax_broad and not economy needs sword_broad",
                "return=skipped when economy needs basket and not economy needs sword_broad",
                "return=skipped when economy needs buckets and not economy needs sword_broad",
                "return=skipped when economy needs felling_ax and not economy needs sword_broad",
                "return=skipped when economy needs fire_tongs and not economy needs sword_broad",
                "return=skipped when economy needs hammer and not economy needs sword_broad",
                "return=skipped when economy needs needles and not economy needs sword_broad",
                "return=skipped when economy needs pick and not economy needs sword_broad",
                "return=skipped when economy needs saw and not economy needs sword_broad",
                "return=skipped when economy needs scythe and not economy needs sword_broad",
                "return=skipped when economy needs shovel and not economy needs sword_broad",
                "consume=log coal iron:2",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=sword_broad:2"
            }
        }
    }
}

pop_textdomain()
