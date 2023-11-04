push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_manufactory_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Big Manufactory"),
    icon = dirname .. "menu.png",
    
   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 57, 76 },
      },
      unoccupied = {
         hotspot = { 57, 76 },
      },
   },
   spritesheets = {
      build = {
         frames = 5,
         rows = 3,
         columns = 2,
         hotspot = { 57, 76 }
      },
      working = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 57, 76 }
      },
   },
   
    size = "big",
    destructible = true,
    
    enhancement = {
        name = "europeans_manufactory_normal",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3,
            grout = 3,
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 2
        }
    },
    buildcost = {
        log = 4,
        reed = 4,
        granite = 4
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 3
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        --normal_ai_limit = 2,
    },
    
    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 3
    },
    
    inputs = {
        { name = "log", amount = 16 },
        { name = "reed", amount = 12 },
        { name = "coal", amount = 12 },
        { name = "iron", amount = 12 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=processing_log",
                "call=processing_log",
                "call=processing_reed",
                "call=processing_reed",
                "call=processing_iron",
                "return=skipped"
            }
        },
        pausing_production_for_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production for input wares because ...
            descname = pgettext("europeans_building", "pausing production because lack of log"),
            actions = {
                "return=skipped when site has log:8",
                "return=skipped when site has log:6 and economy needs blackwood",
                "sleep=duration:5m",
            }
        },
        processing_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing log for input wares because ...
            descname = pgettext("europeans_building", "processing log to create tools and weapons"),
            actions = {
                "call=pausing_production_for_log",
                "call=producing_blackwood",
                "call=producing_blackwood",
                "call=producing_armor_wooden",
                "call=producing_boots_wooden",
                "call=producing_helmet_wooden",
                "call=producing_spear_wooden",
            }
        },
        pausing_production_for_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production for input wares because ...
            descname = pgettext("europeans_building", "pausing production because lack of reed"),
            actions = {
                "return=skipped when site has reed:8",
                "return=skipped when site has reed:6 and economy needs cloth",
                "sleep=duration:5m",
            }
        },
        processing_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing reed for input wares because ...
            descname = pgettext("europeans_building", "processing reed to create tools and armor"),
            actions = {
                "call=pausing_production_for_reed",
                "call=producing_cloth",
                "call=producing_armor_processed",
                "call=producing_boots_sturdy",
            }
        },
        pausing_production_for_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production for input wares because ...
            descname = pgettext("europeans_building", "pausing production because lack of iron or coal"),
            actions = {
                "return=skipped when site has coal:8 and site has iron:8",
                "sleep=duration:10m",
            }
        },
        processing_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing iron for input wares because ...
            descname = pgettext("europeans_building", "processing iron to create tools and weapons"),
            actions = {
                "call=pausing_production_for_iron",
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
            }
        },
        producing_blackwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped unless economy needs blackwood or workers need experience",
                "return=skipped when economy needs log and not economy needs blackwood",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:25s",
                "produce=scrap_wood",
                "consume=log:2",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:25s",
                "produce=scrap_wood",
                "produce=blackwood:4"
            }
        },
        producing_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped unless economy needs armor_wooden or workers need experience",
                "return=skipped when economy needs log and not economy needs armor_wooden",
                "return=skipped when economy needs blackwood and not economy needs armor_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs armor_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs armor_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs armor_wooden",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:180s",
                "playsound=sound/barbarians/blackwood priority:60%",
                "produce=armor_wooden:2"
            }
        },
        producing_boots_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden boots because ...
            descname = pgettext("europeans_building", "making a pair of wooden boots"),
            actions = {
                "return=skipped unless economy needs boots_wooden or workers need experience",
                "return=skipped when economy needs log and not economy needs boots_wooden",
                "return=skipped when economy needs blackwood and not economy needs boots_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs boots_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs boots_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs boots_wooden",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:180s",
                "playsound=sound/barbarians/blackwood priority:60%",
                "produce=boots_wooden:2"
            }
        },
        producing_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped unless economy needs helmet_wooden or workers need experience",
                "return=skipped when economy needs log and not economy needs helmet_wooden",
                "return=skipped when economy needs blackwood and not economy needs helmet_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_wooden",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:180s",
                "playsound=sound/barbarians/blackwood priority:60%",
                "produce=helmet_wooden:2"
            }
        },
        producing_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped unless economy needs spear_wooden or workers need experience",
                "return=skipped when economy needs log and not economy needs spear_wooden",
                "return=skipped when economy needs blackwood and not economy needs spear_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_wooden",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:180s",
                "playsound=sound/barbarians/blackwood priority:60%",
                "produce=spear_wooden:2"
            }
        },
        producing_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth or workers need experience",
                "return=skipped when economy needs reed and not economy needs cloth",
                "consume=reed:4",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:90s",
                "produce=cloth:4"
            }
        },
        producing_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring processed armor because ...
            descname = pgettext("europeans_building", "tailoring processed armor"),
            actions = {
                "return=skipped unless economy needs armor_processed or workers need experience",
                "return=skipped when economy needs reed and not economy needs armor_processed",
                "return=skipped when economy needs cloth and not economy needs armor_processed",
                "return=skipped when economy needs boots_sturdy and not economy needs armor_processed",
                "consume=reed:3",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:180s",
                "produce=armor_processed:2"
            }
        },
        producing_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making study boots because ...
            descname = pgettext("europeans_building", "making study boots"),
            actions = {
                "return=skipped unless economy needs boots_sturdy or workers need experience",
                "return=skipped when economy needs log and not economy needs boots_sturdy",
                "return=skipped when economy needs reed and not economy needs boots_sturdy",
                "return=skipped when economy needs cloth and not economy needs boots_sturdy",
                "return=skipped when economy needs armor_processed and not economy needs boots_sturdy",
                "consume=log reed:2",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:180s",
                "produce=boots_sturdy:2"
            }
        },
        producing_basket = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
            descname = pgettext("europeans_building", "making baskets"),
            actions = {
                "return=skipped unless economy needs basket or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs basket",      
                "consume=log coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=basket:2"
            }
        },
        producing_buckets = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
            descname = pgettext("europeans_building", "making buckets"),
            actions = {
                "return=skipped unless economy needs buckets or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs buckets",    
                "consume=log coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=buckets:2"
            }
        },
        producing_felling_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
            descname = pgettext("europeans_building", "making felling axes"),
            actions = {
                "return=skipped unless economy needs felling_ax or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs felling_ax", 
                "consume=log coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=felling_ax:2"
            }
        },
        producing_fire_tongs = {
            -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
            descname = pgettext("europeans_building", "making fire tongs"),
            actions = {
                "return=skipped unless economy needs fire_tongs or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs fire_tongs", 
                "consume=log coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=fire_tongs:2"
            }
        },
        producing_hammer = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
            descname = pgettext("europeans_building", "making hammers"),
            actions = {
                "return=skipped unless economy needs hammer or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs hammer", 
                "consume=log coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=hammer:2"
            }
        },
        producing_needles = {
            -- TRANSLATORS: Completed/Skipped/Did not start making needles because ...
            descname = pgettext("europeans_building", "making needles"),
            actions = {
                "return=skipped unless economy needs needles or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs needles", 
                "consume=coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=needles:2"
            }
        },
        producing_pick = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
            descname = pgettext("europeans_building", "making picks"),
            actions = {
                "return=skipped unless economy needs pick or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs pick", 
                "consume=log coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=pick:2"
            }
        },
        producing_saw = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
            descname = pgettext("europeans_building", "making saws"),
            actions = {
                "return=skipped unless economy needs saw or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs saw", 
                "consume=log coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=saw:2"
            }
        },
        producing_scythe = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
            descname = pgettext("europeans_building", "making sycthes"),
            actions = {
                "return=skipped unless economy needs scythe or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs scythe", 
                "consume=log coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=scythe:2"
            }
        },
        producing_shovel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
            descname = pgettext("europeans_building", "making shovels"),
            actions = {
                "return=skipped unless economy needs shovel or workers need experience",
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
                "return=skipped when economy needs spear_advanced and not economy needs shovel", 
                "consume=log coal iron",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=shovel:2"
            }
        },
        producing_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped unless economy needs helmet_mask or workers need experience",
                "return=skipped when economy needs coal and not economy needs helmet_mask",
                "return=skipped when economy needs iron and not economy needs helmet_mask",
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
                "return=skipped when economy needs spear_advanced and not economy needs helmet_mask",
                "consume=coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:180s",
                "produce=helmet_mask:2"
            }
        },
        producing_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped unless economy needs spear_advanced or workers need experience",
                "return=skipped when economy needs log and not economy needs spear_advanced",
                "return=skipped when economy needs coal and not economy needs spear_advanced",
                "return=skipped when economy needs iron and not economy needs spear_advanced",
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
                "return=skipped when economy needs helmet_mask and not economy needs spear_advanced",
                "consume=log coal iron",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:180s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
    }
}

pop_textdomain()
