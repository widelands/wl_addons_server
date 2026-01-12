push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "lutas_atlanteans_tower_low",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Low Tower"),
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
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      occupied = pgettext("lutas_atlanteans_building", "Your soldiers have occupied your low tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      aggressor = pgettext("lutas_atlanteans_building", "Your low tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      attack = pgettext("lutas_atlanteans_building", "Your low tower is under attack."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      defeated_enemy = pgettext("lutas_atlanteans_building", "The enemy defeated your soldiers at the low tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      defeated_you = pgettext("lutas_atlanteans_building", "Your soldiers defeated the enemy at the low tower.")
   },
}

pop_textdomain()
