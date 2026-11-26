include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/barbarians/tower/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_barbarians_tower",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Tower"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "medium",
   vision_range = 17,
   buildcost = {
      blackwood = 7,
      log = 1,
      granite = 4
   },
   return_on_dismantle = {
      blackwood = 3,
      granite = 3
   },

   aihints = {
      expansion = true,
      fighting = true,
      mountain_conqueror = true,
      prohibited_till = 400
   },

   max_soldiers = 5,
   heal_per_second = 150,
   conquers = 9,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Barbarian military site
      occupied = pgettext("barbarians_building", "Your soldiers have occupied your tower."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      aggressor = pgettext("barbarians_building", "Your tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      attack = pgettext("barbarians_building", "Your tower is under attack."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_enemy = pgettext("barbarians_building", "The enemy defeated your soldiers at the tower."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_you = pgettext("barbarians_building", "Your soldiers defeated the enemy at the tower.")
   },
}

pop_textdomain()
