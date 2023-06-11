push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "europeans_advanced_barrier",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Barrier"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 52, 79 }
      }
    },
    
    size = "medium",

    aihints = {},

    max_soldiers = 6,
    vision_range = 12,
    heal_per_second = 180,
    conquers = 10,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by an Empire military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your advanced barrier."),
        -- TRANSLATORS: Message sent by an Empire military site
        aggressor = pgettext("europeans_building", "Your advanced barrier discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Empire military site
        attack = pgettext("europeans_building", "Your advanced barrier is under attack."),
        -- TRANSLATORS: Message sent by an Empire military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the advanced barrier."),
        -- TRANSLATORS: Message sent by an Empire military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the advanced barrier.")
    },
}

pop_textdomain()
