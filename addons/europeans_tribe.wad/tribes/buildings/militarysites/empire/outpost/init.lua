include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/empire/outpost/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_empire_outpost",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Outpost"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "medium",
   enhancement = {
      name = "europeans_empire_barrier",
      enhancement_cost = {
         log = 1,
         planks = 2,
         granite = 1,
         marble = 1
      },
      enhancement_return_on_dismantle = {
         planks = 1,
         granite = 1
      }
   },

   buildcost = {
      log = 1,
      planks = 1,
      granite = 1,
      marble = 1
   },
   return_on_dismantle = {
      granite = 1,
      marble = 1
   },

   aihints = {
      expansion = true,
      fighting = true
   },

   max_soldiers = 3,
   heal_per_second = 100,
   conquers = 7,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by an Empire military site
      occupied = pgettext("empire_building", "Your soldiers have occupied your outpost."),
      -- TRANSLATORS: Message sent by an Empire military site
      aggressor = pgettext("empire_building", "Your outpost discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Empire military site
      attack = pgettext("empire_building", "Your outpost is under attack."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_enemy = pgettext("empire_building", "The enemy defeated your soldiers at the outpost."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_you = pgettext("empire_building", "Your soldiers defeated the enemy at the outpost.")
   },
}

pop_textdomain()
