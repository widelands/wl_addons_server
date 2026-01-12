push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "lutas_atlanteans_guard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Guard"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      planks = 1,
      granite = 1
   },
   return_on_dismantle = {
      log = 1,
      granite = 1
   },

   aihints = {
      basic_amount = 5,
      expansion = true,
      mountain_conqueror = true
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 40, 47 },
      }
   },

   max_soldiers = 2,
   heal_per_second = 75,
   conquers = 6,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      occupied = pgettext("lutas_atlanteans_building", "Your soldiers have occupied your guard."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      aggressor = pgettext("lutas_atlanteans_building", "Your guard discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      attack = pgettext("lutas_atlanteans_building", "Your guard is under attack."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      defeated_enemy = pgettext("lutas_atlanteans_building", "The enemy defeated your soldiers at the guard."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      defeated_you = pgettext("lutas_atlanteans_building", "Your soldiers defeated the enemy at the guard.")
   },
}

pop_textdomain()
