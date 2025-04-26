push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "lutas_atlanteans_tower_high",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "High Tower"),
   icon = dirname .. "menu.png",
   size = "medium",
   vision_range = 21,

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 53, 85 },
      }
   },

   aihints = {
      fighting = true,
      prohibited_till = 1500
   },

   max_soldiers = 5,
   heal_per_second = 170,
   conquers = 9,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      occupied = pgettext("lutas_atlanteans_building", "Your soldiers have occupied your high tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      aggressor = pgettext("lutas_atlanteans_building", "Your high tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      attack = pgettext("lutas_atlanteans_building", "Your high tower is under attack."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      defeated_enemy = pgettext("lutas_atlanteans_building", "The enemy defeated your soldiers at the high tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlanteans’ military site
      defeated_you = pgettext("lutas_atlanteans_building", "Your soldiers defeated the enemy at the high tower.")
   },
}

pop_textdomain()
