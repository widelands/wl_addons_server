include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/barbarians/sentry/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_barbarians_sentry",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Sentry"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "small",
   buildcost = {
      blackwood = 2
   },
   return_on_dismantle = {
      blackwood = 1
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
      occupied = pgettext("barbarians_building", "Your soldiers have occupied your sentry."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      aggressor = pgettext("barbarians_building", "Your sentry discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      attack = pgettext("barbarians_building", "Your sentry is under attack."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_enemy = pgettext("barbarians_building", "The enemy defeated your soldiers at the sentry."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_you = pgettext("barbarians_building", "Your soldiers defeated the enemy at the sentry.")
   },
}

pop_textdomain()
