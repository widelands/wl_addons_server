push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
    name = "europeans_advanced_castle",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Castle"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 98, 114 }
      }
    },
    
    size = "big",
    destructible = true,
    
    aihints = {},

    max_soldiers = 18,
    vision_range = 24,
    heal_per_second = 300,
    conquers = 24,
    prefer_heroes = true,

    messages = {
        -- TRANSLATORS: Message sent by an Europeans military site
        occupied = pgettext("europeans_building", "Your soldiers have occupied your advanced castle."),
        -- TRANSLATORS: Message sent by an Europeans military site
        aggressor = pgettext("europeans_building", "Your advanced castle discovered an aggressor."),
        -- TRANSLATORS: Message sent by an Europeans military site
        attack = pgettext("europeans_building", "Your advanced castle is under attack."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the advanced castle."),
        -- TRANSLATORS: Message sent by an Europeans military site
        defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the advanced castle.")
    },
}

pop_textdomain()
