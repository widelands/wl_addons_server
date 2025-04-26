push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "lutas_atlanteans_tower_small",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Small Tower"),
   icon = dirname .. "menu.png",
   size = "small",
   vision_range = 13,

   buildcost = {
      log = 1,
      planks = 2,
      granite = 2
   },
   return_on_dismantle = {
      planks = 1,
      granite = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 46, 71 },
      }
   },

   aihints = {
      fighting = true,
      prohibited_till = 900
   },

   max_soldiers = 3,
   heal_per_second = 100,
   conquers = 5,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      occupied = pgettext("lutas_atlanteans_building", "Your soldiers have occupied your small tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      aggressor = pgettext("lutas_atlanteans_building", "Your small tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      attack = pgettext("lutas_atlanteans_building", "Your small tower is under attack."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      defeated_enemy = pgettext("lutas_atlanteans_building", "The enemy defeated your soldiers at the small tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      defeated_you = pgettext("lutas_atlanteans_building", "Your soldiers defeated the enemy at the small tower.")
   },
}

pop_textdomain()
