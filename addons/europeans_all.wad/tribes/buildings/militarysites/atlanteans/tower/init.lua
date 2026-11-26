include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/atlanteans/tower/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_atlanteans_tower",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("atlanteans_building", "Tower"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "medium",
   vision_range = 17,
   enhancement = {
      name = "europeans_atlanteans_tower_high",
      enhancement_cost = {
         log = 1,
         planks = 1,
         granite = 2
      },
      enhancement_return_on_dismantle = {
         granite = 1
      }
   },

   buildcost = {
      log = 2,
      planks = 3,
      granite = 4,
      spidercloth = 1
   },
   return_on_dismantle = {
      log = 1,
      planks = 1,
      granite = 3
   },

   aihints = {
      expansion = true,
      mountain_conqueror = true,
      prohibited_till = 400
   },

   max_soldiers = 4,
   heal_per_second = 120,
   conquers = 9,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by an Atlantean military site
      occupied = pgettext("atlanteans_building", "Your soldiers have occupied your tower."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      aggressor = pgettext("atlanteans_building", "Your tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      attack = pgettext("atlanteans_building", "Your tower is under attack."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      defeated_enemy = pgettext("atlanteans_building", "The enemy defeated your soldiers at the tower."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      defeated_you = pgettext("atlanteans_building", "Your soldiers defeated the enemy at the tower.")
   },
}

pop_textdomain()
