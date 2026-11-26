include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/empire/sentry/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_empire_sentry",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Sentry"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "small",
   buildcost = {
      planks = 1,
      log = 1,
      granite = 1
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1
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
      -- TRANSLATORS: Message sent by an Empire military site
      occupied = pgettext("empire_building", "Your soldiers have occupied your sentry."),
      -- TRANSLATORS: Message sent by an Empire military site
      aggressor = pgettext("empire_building", "Your sentry discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Empire military site
      attack = pgettext("empire_building", "Your sentry is under attack."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_enemy = pgettext("empire_building", "The enemy defeated your soldiers at the sentry."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_you = pgettext("empire_building", "Your soldiers defeated the enemy at the sentry.")
   },
}

pop_textdomain()
