push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "lutas_atlanteans_tower_cone_shaped",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Cone Shaped Tower"),
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
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      occupied = pgettext("lutas_atlanteans_building", "Your soldiers have occupied your cone shaped tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      aggressor = pgettext("lutas_atlanteans_building", "Your cone shaped tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      attack = pgettext("lutas_atlanteans_building", "Your cone shaped tower is under attack."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      defeated_enemy = pgettext("lutas_atlanteans_building", "The enemy defeated your soldiers at the cone shaped tower."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      defeated_you = pgettext("lutas_atlanteans_building", "Your soldiers defeated the enemy at the cone shaped tower.")
   },
}

pop_textdomain()
