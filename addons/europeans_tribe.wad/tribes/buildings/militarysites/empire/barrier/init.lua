include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/empire/barrier/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_empire_barrier",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Barrier"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "medium",
   buildcost = {
      log = 2,
      planks = 2,
      granite = 2,
      marble = 1
   },
   return_on_dismantle = {
      log = 1,
      planks = 1,
      granite = 1
   },

   aihints = {
      fighting = true
   },

   max_soldiers = 5,
   heal_per_second = 130,
   conquers = 8,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by an Empire military site
      occupied = pgettext("empire_building", "Your soldiers have occupied your barrier."),
      -- TRANSLATORS: Message sent by an Empire military site
      aggressor = pgettext("empire_building", "Your barrier discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Empire military site
      attack = pgettext("empire_building", "Your barrier is under attack."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_enemy = pgettext("empire_building", "The enemy defeated your soldiers at the barrier."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_you = pgettext("empire_building", "Your soldiers defeated the enemy at the barrier.")
   },
}

pop_textdomain()
