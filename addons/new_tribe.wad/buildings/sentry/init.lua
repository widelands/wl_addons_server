push_textdomain("new_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_militarysite_type {
   name = "newtribe_sentry",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("newtribe_building", "Sentry"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      granite = 2, log = 1
   },
   return_on_dismantle = {
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 39, 40 },
         fps = 10
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 39, 40 },
      },
      unoccupied = {
         pictures = path.list_files(dirname .. "unoccupied_??.png"),
         hotspot = { 39, 40 }
      }
   },

   aihints = {
      expansion = true,
      fighting = true,
      mountain_conqueror = true
   },

   max_soldiers = 2,
   heal_per_second = 80,
   conquers = 6,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by a Barbarian military site
      occupied = pgettext("newtribe_building", "Your soldiers have occupied your sentry."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      aggressor = pgettext("newtribe_building", "Your sentry discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      attack = pgettext("newtribe_building", "Your sentry is under attack."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_enemy = pgettext("newtribe_building", "The enemy defeated your soldiers at the sentry."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_you = pgettext("newtribe_building", "Your soldiers defeated the enemy at the sentry.")
   },
}

pop_textdomain()
