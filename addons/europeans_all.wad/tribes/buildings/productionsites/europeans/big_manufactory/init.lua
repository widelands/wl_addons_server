push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/weaving_mill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_big_manufactory",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Big Manufactory"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 66, 71 },
        },
        working = {
            basename = "idle",
            hotspot = { 66, 71 },
        }
    },
    
    size = "big",
    buildcost = {
        log = 2,
        granite = 2,
        blackwood = 2,
        grout = 2,
        reed = 2,
        planks = 2,
        brick = 2,
        marble = 2,
        rope = 2,
        spidercloth = 2,
        quartz = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 1,
        marble = 1,
        grout = 1,
        reed = 1,
        rope = 1,
        brick = 1,
        quartz = 1
    },
    
    aihints = {
        prohibited_till = 900,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },
    
    working_positions = {
        amazons_dressmaker = 1,
        amazons_stone_carver = 1,
        atlanteans_weaver = 1,
        barbarians_weaver = 1,
        empire_weaver = 1,
        frisians_seamstress = 1
    },

    inputs = {
        { name = "reed", amount = 8 },
        { name = "rubber", amount = 8 },
        { name = "cotton", amount = 8 },
        { name = "wool", amount = 8 },
        { name = "fur", amount = 8 },
        { name = "fur_garment_old", amount = 8 },
        { name = "leather", amount = 8 },
        { name = "spider_silk", amount = 8 },
        { name = "rope", amount = 6 },
        { name = "blackwood", amount = 6 },
        { name = "balsa", amount = 6 },
        { name = "ironwood", amount = 6 },
        { name = "granite", amount = 6 },
        { name = "quartz", amount = 6 },
        { name = "gold_thread", amount = 6 },
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_armor_wooden",
                "call=produce_basket",
                "call=produce_boots_hero",
                "call=produce_boots_sturdy",
                "call=produce_boots_swift",
                "call=produce_chisel",
                "call=produce_cloth_fur",
                "call=produce_cloth_reed",
                "call=produce_cloth_wool",
                "call=produce_felling_ax",
                "call=produce_firestones",
                "call=produce_fishing_net_reed",
                "call=produce_fishing_net_silk",
                "call=produce_fur_garment",
                "call=produce_hammer",
                "call=produce_helmet_wooden",
                "call=produce_hunting_bow",
                "call=produce_kitchen_tools",
                "call=produce_machete",
                "call=produce_needles",
                "call=produce_pick",
                "call=produce_protector_padded",
                "call=produce_shovel",
                "call=produce_spear_hardened",
                "call=produce_spear_stone_tipped",
                "call=produce_spear_wooden",
                "call=produce_spidercloth",
                "call=produce_stone_bowl",
                "call=produce_tabard",
                "call=produce_tabard_golden",
                "call=produce_tunic",
                "call=produce_vest_padded",
                "call=produce_warriors_coat",
            }
        },
        produce_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a light wooden armor because ...
            descname = _("making a light wooden armor"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs armor_wooden",
                "consume=balsa:2 rope cotton",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=armor_wooden"
            },
        },
        produce_basket = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
            descname = _("making a basket"),
            actions = {
                -- time: 31.567 + 35 + 3.6 = 70.167 sec
                "return=skipped unless economy needs basket",
                "consume=reed blackwood",
                "sleep=duration:31s567ms",
                "animate=working duration:35s",
                "produce=basket"
            },
        },
        produce_boots_hero = {
            -- TRANSLATORS: Completed/Skipped/Did not start making hero boots because ...
            descname = _("making hero boots"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs boots_hero",
                "consume=rubber:3 gold_thread",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=boots_hero"
            },
        },
        produce_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making sturdy boots because ...
            descname = _("making sturdy boots"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs boots_sturdy",
                "consume=rubber balsa",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=boots_sturdy"
            },
        },
        produce_boots_swift = {
            -- TRANSLATORS: Completed/Skipped/Did not start making swift boots because ...
            descname = _("making swift boots"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs boots_swift",
                "consume=rubber:3",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=boots_swift"
            },
        },
        produce_chisel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a chisel because ...
            descname = _("making a chisel"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs chisel",
                "consume=quartz",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=chisel"
            },
        },
        produce_cloth_fur = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = _("weaving cloth out of fur"),
            actions = {
                -- time total: 25.4 + 20 + 3.6 = 49 sec
                "return=skipped unless economy needs cloth",
                "consume=fur,fur_garment_old",
                "sleep=duration:25s400ms",
                "animate=working duration:20s",
                "produce=cloth"
            },
        },
        produce_cloth_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving because ...
            descname = _("weaving cloth out of reed"),
            actions = {
                -- time total: 25.4 + 20 + 3.6 = 49 sec
                "sleep=duration:25s400ms",
                "return=skipped unless economy needs cloth",
                "consume=reed",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:20s",
                "produce=cloth"
            }
        },
        produce_cloth_wool = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving because ...
            descname = _("weaving cloth out of wool"),
            actions = {
                -- time total: 20.4 + 15 + 5 + 3.6 = 44 sec
                "return=skipped unless economy needs cloth",
                "consume=wool",
                "sleep=duration:20s400ms",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:15s", -- Unsure of balancing CW
                "sleep=duration:5s",
                "produce=cloth"
            }
        },
        produce_felling_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
            descname = _("making a felling ax"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs felling_ax",
                "consume=blackwood quartz",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=felling_ax"
            },
        },
        produce_firestones = {
            -- TRANSLATORS: Completed/Skipped/Did not start making firestones because ...
            descname = _("making firestones"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs firestones",
                "consume=quartz",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=firestones"
            },
        },
        produce_fishing_net_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a fishing net because ...
            descname = _("making a fishing net"),
            actions = {
                -- time: 31.567 + 35 + 3.6 = 70.167 sec
                "return=skipped unless economy needs fishing_net",
                "consume=reed:2",
                "sleep=duration:31s567ms",
                "animate=working duration:35s",
                "produce=fishing_net"
            },
        },
        produce_fishing_net_silk = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a fishing net because ...
            descname = _("making a fishing net"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs fishing_net",
                "consume=spider_silk:2",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=fishing_net"
            }
        },
        produce_fur_garment = {
            -- TRANSLATORS: Completed/Skipped/Did not start sewing fur garment because ...
            descname = _("sewing fur garment"),
            actions = {
                -- time total: 20.4 + 20 + 3.6 = 44 sec
                "return=skipped unless economy needs fur_garment or workers need experience",
                "consume=fur,fur_garment_old leather",
                "sleep=duration:20s400ms",
                "animate=working duration:20s",
                "produce=fur_garment"
            },
        },
        produce_hammer = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
            descname = _("making a hammer"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs hammer",
                "consume=blackwood granite",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=hammer"
            },
        },
        produce_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = _("making a wooden helmet"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs helmet_wooden",
                "consume=ironwood rubber",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=helmet_wooden"
            },
        },
        produce_hunting_bow = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hunting bow because ...
            descname = _("making a hunting bow"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs hunting_bow",
                "consume=blackwood spider_silk",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=hunting_bow"
            }
        },
        produce_kitchen_tools = {
            -- TRANSLATORS: Completed/Skipped/Did not start making kitchen tools because ...
            descname = _("making kitchen tools"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs kitchen_tools",
                "consume=blackwood granite",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=kitchen_tools"
            },
        },
        produce_machete = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a machete because ...
            descname = _("making a machete"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs machete",
                "consume=blackwood quartz",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=machete"
            },
        },
        produce_needles = {
            -- TRANSLATORS: Completed/Skipped/Did not start making needles because ...
            descname = _("making needles"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs needles",
                "consume=quartz",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=needles"
            },
        },
        produce_pick = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
            descname = _("making a pick"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs pick",
                "consume=blackwood quartz",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=pick"
            },
        },
        produce_protector_padded = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a padded protector because ...
            descname = _("making a padded protector"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs protector_padded",
                "consume=cotton:2 rubber:2 rope:2 balsa gold_thread",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=protector_padded"
            },
        },
        produce_shovel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
            descname = _("making a shovel"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs shovel",
                "consume=blackwood ironwood",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=shovel"
            },
        },
        produce_spear_hardened = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hardened spear because ...
            descname = _("making a hardened spear"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs spear_hardened",
                "consume=ironwood blackwood quartz",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=spear_hardened"
            },
        },
        produce_spear_stone_tipped = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a stone-tipped spear because ...
            descname = _("making a stone-tipped spear"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs spear_stone_tipped",
                "consume=ironwood quartz",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=spear_stone_tipped"
            },
        },
        produce_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden spear because ...
            descname = _("making a wooden spear"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs spear_wooden",
                "consume=ironwood",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=spear_wooden"
            },
        },
        produce_spidercloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving spidercloth because ...
            descname = _("weaving spidercloth"),
            actions = {
                -- time: 20.4 + 20 + 3.6 = 44 sec
                "return=skipped unless economy needs spidercloth",
                "consume=spider_silk",
                "sleep=duration:20s400ms",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:20s",
                "produce=spidercloth"
            }
        },
        produce_stone_bowl = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a stone bowl because ...
            descname = _("making a stone bowl"),
            actions = {
                -- time: 30.4 + 35 + 3.6 = 69 sec
                "return=skipped unless economy needs stone_bowl",
                "consume=granite",
                "sleep=duration:30s400ms",
                "animate=working duration:35s",
                "produce=stone_bowl"
            },
        },
        produce_tabard = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a tabard because ...
            descname = _("tailoring a tabard"),
            actions = {
                -- time: 20.4 + 20 + 3.6 = 44 sec
                "return=skipped unless economy needs tabard",
                "consume=spider_silk",
                "sleep=duration:20s400ms",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:20s",
                "produce=tabard"
            }
        },
        produce_tabard_golden = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a golden tabard because ...
            descname = _("tailoring a golden tabard"),
            actions = {
                -- time: 20.4 + 20 + 3.6 = 44 sec
                "return=skipped unless economy needs tabard_golden",
                "consume=spider_silk gold_thread",
                "sleep=duration:20s400ms",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:20s",
                "produce=tabard_golden"
            }
        },
        produce_tunic = {
            -- TRANSLATORS: Completed/Skipped/Did not start sewing a tunic because ...
            descname = _("sewing a tunic"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs tunic",
                "consume=cotton rubber rope",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=tunic"
            },
        },
        produce_vest_padded = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a padded vest because ...
            descname = _("making a padded vest"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs vest_padded",
                "consume=cotton:2 rubber:2 rope:2",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=vest_padded"
            },
        },
        produce_warriors_coat = {
            -- TRANSLATORS: Completed/Skipped/Did not start sewing a warrior’s coat because ...
            descname = _("sewing a warrior’s coat"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs warriors_coat",
                "consume=ironwood balsa:2 rubber gold_thread",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=warriors_coat"
            },
        },
    },

}

pop_textdomain()
