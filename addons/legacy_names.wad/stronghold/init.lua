local dirname = path.dirname(__file__)

push_textdomain("legacy_names.wad", true)

wl.Descriptions():new_militarysite_type {
   name = "barbarians_stronghold",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Stronghold"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      blackwood = 3,
      granite = 3
   },
   return_on_dismantle = {
      blackwood = 2,
      granite = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 47, 44 },
         fps = 10,
      },
      build = {
         hotspot = { 47, 44 },
      },
      unoccupied = {
         hotspot = { 47, 44 },
      },
   },

   aihints = {},

   max_soldiers = 3,
   heal_per_second = 130,
   conquers = 7,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by a Barbarian military site
      occupied = pgettext("barbarians_building", "Your soldiers have occupied your stronghold."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      aggressor = pgettext("barbarians_building", "Your stronghold discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      attack = pgettext("barbarians_building", "Your stronghold is under attack."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_enemy = pgettext("barbarians_building", "The enemy defeated your soldiers at the stronghold."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_you = pgettext("barbarians_building", "Your soldiers defeated the enemy at the stronghold.")
   },
}

pop_textdomain()
