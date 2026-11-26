include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/empire/fortress/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_empire_fortress",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Fortress"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "big",
   enhancement = {
      name = "europeans_empire_castle",
      enhancement_cost = {
         planks = 5,
         marble_column = 4,
         marble = 4,
         granite = 2
      },
      enhancement_return_on_dismantle = {
         planks = 2,
         marble_column = 2,
         marble = 3,
         granite = 1
      }
   },

   buildcost = {
      planks = 5,
      log = 2,
      granite = 8,
      marble = 2,
      marble_column = 2
   },
   return_on_dismantle = {
      planks = 2,
      log = 1,
      granite = 5,
      marble = 1,
      marble_column = 1
   },

   aihints = {
      expansion = true,
      fighting = true,
      mountain_conqueror = true,
      prohibited_till=1400
   },

   max_soldiers = 8,
   heal_per_second = 170,
   conquers = 11,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by an Empire military site
      occupied = pgettext("empire_building", "Your soldiers have occupied your fortress."),
      -- TRANSLATORS: Message sent by an Empire military site
      aggressor = pgettext("empire_building", "Your fortress discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Empire military site
      attack = pgettext("empire_building", "Your fortress is under attack."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_enemy = pgettext("empire_building", "The enemy defeated your soldiers at the fortress."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_you = pgettext("empire_building", "Your soldiers defeated the enemy at the fortress.")
   },
}

pop_textdomain()
