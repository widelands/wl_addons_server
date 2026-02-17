push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "hebrews_massada",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Massada"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      clay = 8,
      granite = 14,
   },
   return_on_dismantle = {
      clay = 3,
      granite = 5,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 59, 105 },
      },
   },

   aihints = {
      expansion = true,
      fighting = true,
      mountain_conqueror = true,
      prohibited_till = 1400
   },

   max_soldiers = 12,
   heal_per_second = 220,
   conquers = 12,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Hebrew military site
      occupied = pgettext("hebrews_building", "Your soldiers have occupied your castle."),
      -- TRANSLATORS: Message sent by a Hebrew military site
      aggressor = pgettext("hebrews_building", "Your castle discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Hebrew military site
      attack = pgettext("hebrews_building", "Your castle is under attack."),
      -- TRANSLATORS: Message sent by a Hebrew military site
      defeated_enemy = pgettext("hebrews_building", "The enemy defeated your soldiers at the castle."),
      -- TRANSLATORS: Message sent by a Hebrew military site
      defeated_you = pgettext("hebrews_building", "Your soldiers defeated the enemy at the castle.")
   },
}

pop_textdomain()
