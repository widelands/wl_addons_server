push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "lutas_atlanteans_guardhall",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Guardhall"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      planks = 3,
      granite = 4,
      diamond = 1
   },
   return_on_dismantle = {
      log = 1,
      planks = 1,
      granite = 3
   },

   aihints = {
      prohibited_till = 2400
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 62, 73 },
      }
   },

   max_soldiers = 7,
   heal_per_second = 140,
   conquers = 7,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      occupied = pgettext("lutas_atlanteans_building", "Your soldiers have occupied your guardhall."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      aggressor = pgettext("lutas_atlanteans_building", "Your guardhall discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      attack = pgettext("lutas_atlanteans_building", "Your guardhall is under attack."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      defeated_enemy = pgettext("lutas_atlanteans_building", "The enemy defeated your soldiers at the guardhall."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      defeated_you = pgettext("lutas_atlanteans_building", "Your soldiers defeated the enemy at the guardhall.")
   },
}

pop_textdomain()
