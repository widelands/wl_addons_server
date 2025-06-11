push_textdomain("europeans_all.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_big_barracks",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Big Barracks"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 64, 106 }
      },
      working = {
         basename = "idle",
         hotspot = { 64, 106 }
      },
    },
    
    size = "big",
    destructible = true,
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
        prohibited_till = 10800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
        amazons_trainer = 1,
        atlanteans_trainer = 1,
        barbarians_trainer = 1,
        empire_trainer = 1,
        frisians_trainer = 1
    },

    inputs = {
        { name = "amazons_carrier", amount = 8 },
        { name = "tunic", amount = 8 },
        { name = "spear_wooden", amount = 8 },
        { name = "atlanteans_recruit", amount = 8 },
        { name = "tabard", amount = 8 },
        { name = "trident_light", amount = 8 },
        { name = "barbarians_recruit", amount = 8 },
        { name = "ax", amount = 8 },
        { name = "empire_recruit", amount = 8 },
        { name = "armor_helmet", amount = 8 },
        { name = "frisians_carrier", amount = 8 },
        { name = "sword_short", amount = 8 },
        { name = "fur_garment", amount = 8 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_amazons_soldier",
                "call=recruit_atlanteans_soldier",
                "call=recruit_barbarians_soldier",
                "call=recruit_empire_soldier",
                "return=skipped"
            }
        },
        recruit_amazons_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting amazons soldier"),
            actions = {
                -- time total: 15 + 15 = 30 sec
                "return=skipped unless economy needs europeans_soldier",
                "consume=spear_wooden tunic amazons_carrier",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "recruit=europeans_soldier"
            }
        },
        recruit_atlanteans_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting atlanteans soldier"),
            actions = {
                -- time total: 30 sec
                "return=skipped unless economy needs europeans_soldier",
                "consume=tabard trident_light atlanteans_recruit",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "recruit=europeans_soldier"
            }
        },
        recruit_barbarians_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting barbarians soldier"),
            actions = {
                -- time total: 30 sec
                "return=skipped unless economy needs europeans_soldier",
                "consume=ax barbarians_recruit",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "recruit=europeans_soldier"
            }
        },
        recruit_empire_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting empire soldier"),
            actions = {
                -- time total: 30 sec
                "return=skipped unless economy needs europeans_soldier",
                "consume=armor_helmet spear_wooden empire_recruit",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "recruit=europeans_soldier"
            }
        },
        recruit_frisians_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting frisians soldier"),
            actions = {
                -- time total: 30 sec
                "return=skipped unless economy needs europeans_soldier",
                "consume=sword_short fur_garment frisians_carrier",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "recruit=europeans_soldier"
            }
        },
    },
}

pop_textdomain()

