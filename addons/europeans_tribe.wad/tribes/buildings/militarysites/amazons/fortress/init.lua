include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/amazons/fortress/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_amazons_fortress",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("amazons_building", "Fortress"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "big",
   vision_range = 15,
   enhancement = {
      name = "europeans_amazons_fortification",
      enhancement_cost = {
         ironwood = 4,
         granite = 2,
         quartz = 2,
         rope = 2
      },
      enhancement_return_on_dismantle = {
         ironwood = 2,
         granite = 1,
         quartz = 1,
      }
   },

   buildcost = {
      ironwood = 6,
      granite = 5,
      quartz = 1,
      log = 2,
      rubber = 2
   },
   return_on_dismantle = {
      ironwood = 3,
      granite = 3,
      log = 1,
      rubber = 1
   },

   aihints = {
      expansion = true,
      fighting = true,
      mountain_conqueror = true,
      prohibited_till = 1400
   },

   max_soldiers = 8,
   heal_per_second = 170,
   conquers = 11,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by an Amazon military site
      occupied = pgettext("amazons_building", "Your soldiers have occupied your fortress."),
      -- TRANSLATORS: Message sent by an Amazon military site
      aggressor = pgettext("amazons_building", "Your fortress discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Amazon military site
      attack = pgettext("amazons_building", "Your fortress is under attack."),
      -- TRANSLATORS: Message sent by an Amazon military site
      defeated_enemy = pgettext("amazons_building", "The enemy defeated your soldiers at the fortress."),
      -- TRANSLATORS: Message sent by an Amazon military site
      defeated_you = pgettext("amazons_building", "Your soldiers defeated the enemy at the fortress.")
   },
}

pop_textdomain()
