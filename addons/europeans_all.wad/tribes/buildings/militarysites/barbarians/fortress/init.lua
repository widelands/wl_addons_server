include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/barbarians/fortress/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_barbarians_fortress",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Fortress"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "big",
   enhancement = {
      name = "europeans_barbarians_citadel",
      enhancement_cost = {
         blackwood = 9,
         log = 5,
         granite = 4,
         grout = 2
      },
      enhancement_return_on_dismantle = {
         blackwood = 4,
         log = 2,
         granite = 3,
         grout = 1
      }
   },

   buildcost = {
      blackwood = 9,
      log = 5,
      granite = 4,
      grout = 2
   },
   return_on_dismantle = {
      blackwood = 4,
      log = 2,
      granite = 2,
      grout = 1
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
      -- TRANSLATORS: Message sent by a Barbarian military site
      occupied = pgettext("barbarians_building", "Your soldiers have occupied your fortress."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      aggressor = pgettext("barbarians_building", "Your fortress discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      attack = pgettext("barbarians_building", "Your fortress is under attack."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_enemy = pgettext("barbarians_building", "The enemy defeated your soldiers at the fortress."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_you = pgettext("barbarians_building", "Your soldiers defeated the enemy at the fortress.")
   },
}

pop_textdomain()
