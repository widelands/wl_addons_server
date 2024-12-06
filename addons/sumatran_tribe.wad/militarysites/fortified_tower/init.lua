push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "sumatran_fortified_tower",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Fortified Tower"),
   icon = dirname .. "menu.png",
   size = "medium",
   vision_range = 19,

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 40, 107 },
      }
   },

   aihints = {
      prohibited_till = 780,
      fighting = true,
   },

   max_soldiers = 6,
   heal_per_second = 170,
   conquers = 9,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Sumatran military site
      occupied = pgettext("sumatran_building", "Your soldiers have occupied your fortified tower."),
      -- TRANSLATORS: Message sent by a Sumatran military site
      aggressor = pgettext("sumatran_building", "Your fortified tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Sumatran military site
      attack = pgettext("sumatran_building", "Your fortified tower is under attack."),
      -- TRANSLATORS: Message sent by a Sumatran military site
      defeated_enemy = pgettext("sumatran_building", "The enemy defeated your soldiers at the fortified tower."),
      -- TRANSLATORS: Message sent by a Sumatran military site
      defeated_you = pgettext("sumatran_building", "Your soldiers defeated the enemy at the fortified tower.")
   },
}

pop_textdomain()
