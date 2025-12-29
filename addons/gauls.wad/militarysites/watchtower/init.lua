push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "gauls_watchtower",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("gauls_building", "Watchtower"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 28, 97 },
      }
    },
    
    size = "small",
    destructible = true,
    
    buildcost = {
        log = 2,
        granite = 2,
        planks = 2,
        cloth = 1
    },
    return_on_dismantle = {
        log = 1,
        granite = 2,
        planks = 1,
        cloth = 1
    },
    
    aihints = {
        prohibited_till = 1200,
--        basic_amount = 1,
        fighting = true,
    },

    max_soldiers = 3,
    vision_range = 13,
    heal_per_second = 120,
    conquers = 6,
    prefer_heroes = false,

    messages = {
        -- TRANSLATORS: Message sent by a Gallic military site
        occupied = pgettext("gauls_building", "Your warriors have occupied your watchtower."),
        -- TRANSLATORS: Message sent by a Gallic military site
        aggressor = pgettext("gauls_building", "Your watchtower discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Gallic military site
        attack = pgettext("gauls_building", "Your watchtower is under attack."),
        -- TRANSLATORS: Message sent by a Gallic military site
        defeated_enemy = pgettext("gauls_building", "The enemy defeated your warriors at the watchtower."),
        -- TRANSLATORS: Message sent by a Gallic military site
        defeated_you = pgettext("gauls_building", "Your warriors defeated the enemy at the watchtower.")
    },
}

pop_textdomain()
