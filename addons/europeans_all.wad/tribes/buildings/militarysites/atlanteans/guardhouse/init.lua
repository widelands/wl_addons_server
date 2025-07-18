push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/atlanteans/guardhouse/"

wl.Descriptions():new_militarysite_type {
   name = "europeans_atlanteans_guardhouse",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("atlanteans_building", "Guardhouse"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      planks = 1,
      granite = 1
   },
   return_on_dismantle = {
      granite = 1
   },

   aihints = {
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
      -- TRANSLATORS: Message sent by an Atlantean military site
      occupied = pgettext("atlanteans_building", "Your soldiers have occupied your guardhouse."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      aggressor = pgettext("atlanteans_building", "Your guardhouse discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      attack = pgettext("atlanteans_building", "Your guardhouse is under attack."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      defeated_enemy = pgettext("atlanteans_building", "The enemy defeated your soldiers at the guardhouse."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      defeated_you = pgettext("atlanteans_building", "Your soldiers defeated the enemy at the guardhouse.")
   },
}

pop_textdomain()
