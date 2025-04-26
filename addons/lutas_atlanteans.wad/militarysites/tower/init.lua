push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "lutas_atlanteans_tower",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Tower"),
   icon = dirname .. "menu.png",
   size = "medium",
   vision_range = 17,

   enhancement = {
      name = "lutas_atlanteans_tower_high",
      enhancement_cost = {
         log = 1,
         planks = 1,
         granite = 2
      },
      enhancement_return_on_dismantle = {
         planks = 1,
         granite = 1
      }
   },

   buildcost = {
      log = 2,
      planks = 4,
      granite = 3,
      spidercloth = 1
   },
   return_on_dismantle = {
      log = 1,
      planks = 2,
      granite = 2
   },

   aihints = {
      expansion = true,
      mountain_conqueror = true,
      prohibited_till = 900
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 53, 85 },
      }
   },

   max_soldiers = 4,
   heal_per_second = 120,
   conquers = 9,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      occupied = pgettext("lutas_atlanteans_building", "Your soldiers have occupied your tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      aggressor = pgettext("lutas_atlanteans_building", "Your tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      attack = pgettext("lutas_atlanteans_building", "Your tower is under attack."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      defeated_enemy = pgettext("lutas_atlanteans_building", "The enemy defeated your soldiers at the tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      defeated_you = pgettext("lutas_atlanteans_building", "Your soldiers defeated the enemy at the tower.")
   },
}

pop_textdomain()
