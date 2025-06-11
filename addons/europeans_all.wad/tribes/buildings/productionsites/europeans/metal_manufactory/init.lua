push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/armorsmithy/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_metal_manufactory",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Metal Manufactory"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 50, 66 },
        },
        unoccupied = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 50, 66 },
        },
        build = {
            frames = 4,
            columns = 4,
            rows = 1,
            hotspot = { 50, 66 }
        },
        working = {
            fps = 5,
            frames = 20,
            columns = 10,
            rows = 2,
            hotspot = { 50, 66 }
        },
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
        atlanteans_armorsmith = 1,
        atlanteans_toolsmith = 1,
        atlanteans_weaponsmith = 1,
        barbarians_blacksmith = 1,
        barbarians_blacksmith_master = 1,
        barbarians_helmsmith = 1,
        empire_armorsmith = 1,
        empire_toolsmith = 1,
        empire_weaponsmith = 1,
        frisians_blacksmith = 1,
        frisians_blacksmith_master = 1,
        frisians_seamstress_master = 1
    },

    inputs = {
        { name = "coal", amount = 32 },
        { name = "iron", amount = 32 },
        { name = "gold", amount = 16 },
        { name = "blackwood", amount = 12 },
        { name = "planks", amount = 12 },
        { name = "cloth", amount = 12 },
        { name = "fur_garment", amount = 12 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_armor",
                "call=produce_armor_chain",
                "call=produce_armor_gilded",
                "call=produce_armor_helmet",
                "call=produce_ax",
                "call=produce_ax_battle",
                "call=produce_ax_broad",
                "call=produce_ax_bronze",
                "call=produce_ax_sharp",
                "call=produce_ax_warriors",
                "call=produce_basket",
                "call=produce_bread_paddle",
                "call=produce_buckets",
                "call=produce_felling_ax",
                "call=produce_fire_tongs",
                "call=produce_fishing_rod",
                "call=produce_fur_garment_golden",
                "call=produce_fur_garment_studded",
                "call=produce_hammer",
                "call=produce_helmet",
                "call=produce_helmet_golden",
                "call=produce_helmet_mask",
                "call=produce_helmet_warhelm",
                "call=produce_hook_pole",
                "call=produce_hunting_spear",
                "call=produce_kitchen_tools",
                "call=produce_milking_tongs",
                "call=produce_needles",
                "call=produce_pick",
                "call=produce_saw",
                "call=produce_scythe",
                "call=produce_shield_advanced",
                "call=produce_shield_steel",
                "call=produce_shovel",
                "call=produce_spear",
                "call=produce_spear_advanced",
                "call=produce_spear_heavy",
                "call=produce_spear_war",
                "call=produce_sword_broad",
                "call=produce_sword_double",
                "call=produce_sword_long",
                "call=produce_sword_short",
                "call=produce_trident_double",
                "call=produce_trident_heavy_double",
                "call=produce_trident_light",
                "call=produce_trident_long",
                "call=produce_trident_steel",
            }
        },
        produce_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of armor because ...
            descname = _("forging a suit of armor"),
            actions = {
                -- time: 32.4 + 45 + 3.6 = 81 sec
                "return=skipped unless economy needs armor",
                "consume=iron coal cloth",
                "sleep=duration:32s400ms",
                "animate=working duration:45s",
                "produce=armor"
            }
        },
        produce_armor_chain = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of chain armor because ...
            descname = _("forging a suit of chain armor"),
            actions = {
                -- time: 32.4 + 45 + 3.6 = 81 sec
                "return=skipped unless economy needs armor_chain",
                "consume=iron:2 coal cloth",
                "sleep=duration:32s400ms",
                "animate=working duration:45s",
                "produce=armor_chain"
            }
        },
        produce_armor_gilded = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of gilded armor because ...
            descname = _("forging a suit of gilded armor"),
            actions = {
                -- time: 32.4 + 45 + 3.6 = 81 sec
                "return=skipped unless economy needs armor_gilded",
                "consume=iron:2 coal:2 cloth gold",
                "sleep=duration:32s400ms",
                "animate=working duration:45s",
                "produce=armor_gilded"
            }
        },
        produce_armor_helmet = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a helmet because ...
            descname = _("forging a helmet"),
            actions = {
                -- time: 47.4 + 20 + 3.6 = 71 sec
                "return=skipped unless economy needs armor_helmet",
                "consume=iron coal",
                "sleep=duration:47s400ms",
                "animate=working duration:20s",
                "produce=armor_helmet"
            }
        },
        produce_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an ax because ...
            descname = _("forging an ax"),
            actions = {
                -- time: 23.4 + 22 + 9 + 3.6 = 58 sec
                "return=skipped unless economy needs ax",
                "consume=coal iron",
                "sleep=duration:23s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:22s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=ax"
            }
        },
        produce_ax_battle = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a battle ax because ...
            descname = _("forging a battle ax"),
            actions = {
                -- time: 23.4 + 22 + 9 + 3.6 = 58 sec
                "return=skipped unless economy needs ax_battle",
                "consume=coal gold iron:2",
                "sleep=duration:23s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:22s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=ax_battle"
            }
        },
        produce_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = _("forging a broad ax"),
            actions = {
                -- time: 23.4 + 22 + 9 + 3.6 = 58 sec
                "return=skipped unless economy needs ax_broad",
                "consume=coal:2 iron:2",
                "sleep=duration:23s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:22s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=ax_broad"
            }
        },
        produce_ax_bronze = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a bronze ax because ...
            descname = _("forging a bronze ax"),
            actions = {
                -- time: 23.4 + 22 + 9 + 3.6 = 58 sec
                "return=skipped unless economy needs ax_bronze",
                "consume=coal:2 iron:2",
                "sleep=duration:23s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:22s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=ax_bronze"
            }
        },
        produce_ax_sharp = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a sharp ax because ...
            descname = _("forging a sharp ax"),
            actions = {
                -- time: 23.4 + 22 + 9 + 3.6 = 58 sec
                "return=skipped unless economy needs ax_sharp",
                "consume=coal iron:2",
                "sleep=duration:23s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:22s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=ax_sharp"
            }
        },
        produce_ax_warriors = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a warrior’s ax because ...
            descname = _("forging a warrior’s ax"),
            actions = {
                -- time: 23.4 + 22 + 9 + 3.6 = 58 sec
                "return=skipped unless economy needs ax_warriors",
                "consume=coal:2 gold:2 iron:2",
                "sleep=duration:23s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:22s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=ax_warriors"
            }
        },
        produce_basket = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
            descname = _("making a basket"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs basket",
                "consume=iron blackwood",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=basket"
            }
        },
        produce_bread_paddle = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a bread paddle because ...
            descname = _("making a bread paddle"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs bread_paddle",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=bread_paddle"
            }
        },
        produce_buckets = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
            descname = _("making a pair of buckets"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs buckets",
                "consume=iron blackwood",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=buckets"
            }
        },
        produce_felling_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
            descname = _("making a felling ax"),
            actions = {
                -- time: 31.4 + 35 + 3.6 = 70 sec
                "return=skipped unless economy needs felling_ax",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=felling_ax"
            }
        },
        produce_fire_tongs = {
            -- TRANSLATORS: Completed/Skipped/Did not start making fire tongs because ...
            descname = _("making fire tongs"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs fire_tongs",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=fire_tongs"
            }
        },
        produce_fishing_rod = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a fishing rod because ...
            descname = _("making a fishing rod"),
            actions = {
                -- time: 31.4 + 35 + 3.6 = 70 sec
                "return=skipped unless economy needs fishing_rod",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=fishing_rod"
            }
        },
        produce_fur_garment_golden = {
            -- TRANSLATORS: Completed/Skipped/Did not start sewing golden fur garment because ...
            descname = _("sewing golden fur garment"),
            actions = {
                -- time: 20.4 + 25 + 3.6 = 49 sec
                "return=skipped unless economy needs fur_garment_golden",
                "consume=fur_garment iron gold",
                "sleep=duration:20s400ms",
                "animate=working duration:25s",
                "produce=fur_garment_golden"
            },
        },
        produce_fur_garment_studded = {
            -- TRANSLATORS: Completed/Skipped/Did not start sewing studded fur garment because ...
            descname = _("sewing studded fur garment"),
            actions = {
                -- time: 20.4 + 25 + 3.6 = 49 sec
                "return=skipped unless economy needs fur_garment_studded",
                "consume=fur_garment iron",
                "sleep=duration:20s400ms",
                "animate=working duration:25s",
                "produce=fur_garment_studded"
            },
        },
        produce_hammer = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
            descname = _("making a hammer"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs hammer",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=hammer"
            }
        },
        produce_helmet = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a helmet because ...
            descname = _("forging a helmet"),
            actions = {
                -- time: 27.4 + 37 + 3.6 = 68 sec
                "return=skipped unless economy needs helmet",
                "consume=coal iron",
                "sleep=duration:27s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:37s",
                "produce=helmet"
            }
        },
        produce_helmet_golden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a golden helmet because ...
            descname = _("forging a golden helmet"),
            actions = {
                -- time: 28.2 + 37 + 3.6 = 68.8 sec
                "return=skipped unless economy needs helmet_golden",
                "consume=coal:2 iron:2 gold",
                "sleep=duration:28s200ms",
                "animate=working duration:37s",
                "produce=helmet_golden"
            },
        },
        produce_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = _("forging a mask"),
            actions = {
                -- time: 32.4 + 45 + 3.6 = 81 sec
                "return=skipped unless economy needs helmet_mask",
                "consume=coal iron:2",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:45s",
                "produce=helmet_mask"
            }
        },
        produce_helmet_warhelm = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a warhelm because ...
            descname = _("forging a warhelm"),
            actions = {
                -- time: 32.4 + 55 + 3.6 = 91 sec
                "return=skipped unless economy needs helmet_warhelm",
                "consume=coal gold iron:2",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:55s",
                "produce=helmet_warhelm"
            }
        },
        produce_hook_pole = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hook pole because ...
            descname = _("making a hook pole"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs hook_pole",
                "consume=iron blackwood",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=hook_pole"
            }
        },
        produce_hunting_spear = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hunting spear because ...
            descname = _("making a hunting spear"),
            actions = {
                -- time: 31.4 + 35 + 3.6 = 70 sec
                "return=skipped unless economy needs hunting_spear",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=hunting_spear"
            }
        },
        produce_kitchen_tools = {
            -- TRANSLATORS: Completed/Skipped/Did not start making kitchen tools because ...
            descname = _("making kitchen tools"),
            actions = {
                -- time: 31.4 + 35 + 3.6 = 70 sec
                "return=skipped unless economy needs kitchen_tools",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=kitchen_tools"
            }
        },
        produce_milking_tongs = {
            -- TRANSLATORS: Completed/Skipped/Did not start making milking tongs because ...
            descname = _("making milking tongs"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs milking_tongs",
                "consume=iron blackwood",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=milking_tongs"
            }
        },
        produce_needles = {
            -- TRANSLATORS: Completed/Skipped/Did not start making needles because ...
            descname = _("making needles"),
            actions = {
                -- time: 27.967 + 35 + 2 * 3.6 = 70.167 sec
                "return=skipped unless economy needs needles",
                "consume=iron",
                "sleep=duration:27s967ms",
                "animate=working duration:35s",
                "produce=needles:2"
            },
        },
        produce_pick = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
            descname = _("making a pick"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs pick",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=pick"
            }
        },
        produce_saw = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
            descname = _("making a saw"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs saw",
                "consume=iron blackwood",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=saw"
            }
        },
        produce_scythe = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
            descname = _("making a scythe"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs scythe",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=scythe"
            }
        },
        produce_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = _("forging an advanced shield"),
            actions = {
                -- time: 32.4 + 45 + 3.6 = 81 sec
                "return=skipped unless economy needs shield_advanced",
                "consume=iron:2 coal:2 gold",
                "sleep=duration:32s400ms",
                "animate=working duration:45s",
                "produce=shield_advanced"
            }
        },
        produce_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = _("forging a steel shield"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs shield_steel",
                "consume=iron:2 coal:2",
                "sleep=duration:32s400ms",
                "animate=working duration:35s",
                "produce=shield_steel"
            }
        },
        produce_shovel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
            descname = _("making a shovel"),
            actions = {
                -- time: 32.4 + 35 + 3.6 = 71 sec
                "return=skipped unless economy needs shovel",
                "consume=iron blackwood",
                "sleep=duration:31s400ms",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:35s",
                "produce=shovel"
            }
        },
        produce_spear = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a spear because ...
            descname = _("forging a spear"),
            actions = {
                -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
                "return=skipped unless economy needs spear",
                "consume=coal iron planks",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:36s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=spear"
            }
        },
        produce_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = _("forging an advanced spear"),
            actions = {
                -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
                "return=skipped unless economy needs spear_advanced",
                "consume=coal iron:2 planks",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:36s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=spear_advanced"
            }
        },
        produce_spear_heavy = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a heavy spear because ...
            descname = _("forging a heavy spear"),
            actions = {
                -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
                "return=skipped unless economy needs spear_heavy",
                "consume=coal:2 gold iron planks",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:36s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=spear_heavy"
            }
        },
        produce_spear_war = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a war spear because ...
            descname = _("forging a war spear"),
            actions = {
                -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
                "return=skipped unless economy needs spear_war",
                "consume=coal:2 gold iron:2 planks",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:36s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=spear_war"
            }
        },
        produce_sword_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
            descname = _("forging a broadsword"),
            actions = {
                -- time: 22.2 + 24 + 9 + 3.6 = 58.8 sec
                "return=skipped unless economy needs sword_broad",
                "consume=coal iron:2 gold",
                "sleep=duration:22s200ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:24s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=sword_broad"
            },
        },
        produce_sword_double = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a double-edged sword because ...
            descname = _("forging a double-edged sword"),
            actions = {
                -- time: 22.2 + 24 + 9 + 3.6 = 58.8 sec
                "return=skipped unless economy needs sword_double",
                "consume=coal:2 iron:2 gold",
                "sleep=duration:22s200ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:24s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=sword_double"
            },
        },
        produce_sword_long = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a long sword because ...
            descname = _("forging a long sword"),
            actions = {
                -- time: 21.4 + 24 + 9 + 3.6 = 58 sec
                "return=skipped unless economy needs sword_long",
                "consume=coal iron:2",
                "sleep=duration:21s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:24s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=sword_long"
            },
        },
        produce_sword_short = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a short sword because ...
            descname = _("forging a short sword"),
            actions = {
                -- time: 21.4 + 24 + 9 + 3.6 = 58 sec
                "return=skipped unless economy needs sword_short",
                "consume=coal iron",
                "sleep=duration:21s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:24s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=sword_short"
            },
        },
        produce_trident_double = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a double trident because ...
            descname = _("forging a double trident"),
            actions = {
                -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
                "return=skipped unless economy needs trident_double",
                "consume=iron coal:2 planks gold",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:36s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=trident_double"
            }
        },
        produce_trident_heavy_double = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a heavy double trident because ...
            descname = _("forging a heavy double trident"),
            actions = {
                -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
                "return=skipped unless economy needs trident_heavy_double",
                "consume=iron:2 coal:2 planks gold",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:36s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=trident_heavy_double"
            }
        },
        produce_trident_light = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a light trident because ...
            descname = _("forging a light trident"),
            actions = {
                -- time: 20.4 + 21 + 9 + 3.6 = 54 sec
                "return=skipped unless economy needs trident_light",
                "consume=iron planks",
                "sleep=duration:20s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:21s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=trident_light"
            }
        },
        produce_trident_long = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a long trident because ...
            descname = _("forging a long trident"),
            actions = {
                -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
                "return=skipped unless economy needs trident_long",
                "consume=iron coal planks",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:36s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=trident_long"
            }
        },
        produce_trident_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel trident because ...
            descname = _("forging a steel trident"),
            actions = {
                -- time: 32.4 + 36 + 9 + 3.6 = 81 sec
                "return=skipped unless economy needs trident_steel",
                "consume=iron:2 coal planks",
                "sleep=duration:32s400ms",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:36s",
                "playsound=sound/smiths/sharpening priority:90%",
                "sleep=duration:9s",
                "produce=trident_steel"
            }
        },
    },
}

pop_textdomain()
