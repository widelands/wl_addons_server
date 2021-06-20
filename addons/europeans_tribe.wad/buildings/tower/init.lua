push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_militarysite_type {
   name = "europeans_tower",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Medium Tower"),
   icon = dirname .. "menu.png",
   size = "medium",
   vision_range = 16,

   enhancement = {
        name = "europeans_tower_high",
        enhancement_cost = {
            planks = 2,
            cloth = 2,
            granite = 1,
            quartz = 1
        },
        enhancement_return_on_dismantle = {
            planks = 1,
            granite = 1,
            quartz = 1
        },
   },

   buildcost = {
      blackwood = 3,
      reed = 3,
      granite = 2
   },
   return_on_dismantle = {
      blackwood = 2,
      reed = 1,
      granite = 1
   },

   aihints = {
      expansion = true,
      mountain_conqueror = true,
      prohibited_till = 1800
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 46, 58 },
      }
   },

   max_soldiers = 4,
   heal_per_second = 120,
   conquers = 8,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by an Europeans military site
      occupied = pgettext("europeans_building", "Your soldiers have occupied your tower."),
      -- TRANSLATORS: Message sent by an Europeans military site
      aggressor = pgettext("europeans_building", "Your tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Europeans military site
      attack = pgettext("europeans_building", "Your tower is under attack."),
      -- TRANSLATORS: Message sent by an Europeans military site
      defeated_enemy = pgettext("europeans_building", "The enemy defeated your soldiers at the tower."),
      -- TRANSLATORS: Message sent by an Europeans military site
      defeated_you = pgettext("europeans_building", "Your soldiers defeated the enemy at the tower.")
   },
}

pop_textdomain()
