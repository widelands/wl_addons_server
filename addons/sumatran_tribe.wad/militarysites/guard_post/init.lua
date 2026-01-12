push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "sumatran_guard_post",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("sumatran_building", "Guard Post"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 32, 76 },
      }
    },
    
    size = "small",
    destructible = true,
    
    buildcost = {
        log = 1,
        tropicalwood = 2,
    },
    return_on_dismantle = {
        log = 1,
        tropicalwood = 1,
    },
    
    aihints = {
--        expansion = true,
        very_weak_ai_limit = 6,
        weak_ai_limit = 6,
        normal_ai_limit = 6,
    },

    max_soldiers = 1,
    vision_range = 10,
    heal_per_second = 100,
    conquers = 6,
    prefer_heroes = false,

    messages = {
        -- TRANSLATORS: Message sent by a Sumatran military site
        occupied = pgettext("sumatran_building", "Your warrior has occupied your guard post."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        aggressor = pgettext("sumatran_building", "Your guard post discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        attack = pgettext("sumatran_building", "Your guard post is under attack."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_enemy = pgettext("sumatran_building", "The enemy defeated your warrior at the guard post."),
        -- TRANSLATORS: Message sent by a Sumatran military site
        defeated_you = pgettext("sumatran_building", "Your warriors defeated the enemy at the guard post.")
    },
}

pop_textdomain()
