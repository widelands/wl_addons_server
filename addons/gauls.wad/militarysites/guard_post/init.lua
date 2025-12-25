push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "gauls_guard_post",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("gauls_building", "Guard Post"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
   animations = {
      unoccupied = {
         hotspot = { 39, 40 }
      }
   },
   spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 39, 40 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 39, 40 }
      },
   },
    
    size = "small",
    destructible = true,
    
    buildcost = {
        log = 1,
        planks = 1,
        reed = 1
    },
    return_on_dismantle = {
        planks = 1,
        reed = 1
    },
    
    aihints = {
        expansion = true,
        very_weak_ai_limit = 8,
        weak_ai_limit = 8,
        normal_ai_limit = 8,
    },

    max_soldiers = 1,
    vision_range = 10,
    heal_per_second = 60,
    conquers = 6,
    prefer_heroes = false,

    messages = {
        -- TRANSLATORS: Message sent by a Gauls military site
        occupied = pgettext("gauls_building", "Your warrior has occupied your guard post."),
        -- TRANSLATORS: Message sent by a Gauls military site
        aggressor = pgettext("gauls_building", "Your guard post discovered an aggressor."),
        -- TRANSLATORS: Message sent by a Gauls military site
        attack = pgettext("gauls_building", "Your guard post is under attack."),
        -- TRANSLATORS: Message sent by a Gauls military site
        defeated_enemy = pgettext("gauls_building", "The enemy defeated your warrior at the guard post."),
        -- TRANSLATORS: Message sent by a Gauls military site
        defeated_you = pgettext("gauls_building", "Your warriors defeated the enemy at the guard post.")
    },
}

pop_textdomain()
