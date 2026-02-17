push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "hebrews_tent_small",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Small army tent"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      cloth = 2,
      branch = 2,
   },
   return_on_dismantle = {
      cloth = 2,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 40, 55 },
      },
   },

   aihints = {
      expansion = true,
      fighting = true,
      prohibited_till = 300
   },

   max_soldiers = 3,
   heal_per_second = 60, -- very low -> smallest building
   conquers = 6,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by a Hebrew military site
      occupied = pgettext("hebrews_building", "Your soldiers have occupied your small tent."),
      -- TRANSLATORS: Message sent by a Hebrew military site
      aggressor = pgettext("hebrews_building", "Your small tent discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Hebrew military site
      attack = pgettext("hebrews_building", "Your small tent is under attack."),
      -- TRANSLATORS: Message sent by a Hebrew military site
      defeated_enemy = pgettext("hebrews_building", "The enemy defeated your soldiers at the small tent."),
      -- TRANSLATORS: Message sent by a Hebrew military site
      defeated_you = pgettext("hebrews_building", "Your soldiers defeated the enemy at the small tent.")
   },
}

pop_textdomain()
