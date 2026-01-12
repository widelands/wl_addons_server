push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_militarysite_type {
   name = "lutas_atlanteans_diamond_castle",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Diamond Castle"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 5,
      planks = 5,
      granite = 7,
      spidercloth = 2,
      diamond = 2,
      quartz = 2
   },
   return_on_dismantle = {
      log = 2,
      planks = 2,
      granite = 4,
      spidercloth = 1,
      diamond = 1,
      quartz = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 101, 101 },
      }
   },

   aihints = {
      expansion = true,
      fighting = true,
      mountain_conqueror = true,
      prohibited_till = 2160
   },

   max_soldiers = 12,
   heal_per_second = 200,
   conquers = 12,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      occupied = pgettext("lutas_atlanteans_building", "Your soldiers have occupied your castle."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      aggressor = pgettext("lutas_atlanteans_building", "Your castle discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      attack = pgettext("lutas_atlanteans_building", "Your castle is under attack."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      defeated_enemy = pgettext("lutas_atlanteans_building", "The enemy defeated your soldiers at the castle."),
      -- TRANSLATORS: Message sent by a Lutas’ Atlantean military site
      defeated_you = pgettext("lutas_atlanteans_building", "Your soldiers defeated the enemy at the castle.")
   },
}

pop_textdomain()
