include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/frisians/wooden_tower/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_frisians_wooden_tower",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("frisians_building", "Wooden Tower"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "small",
   vision_range = 14,
   enhancement = {
      name = "europeans_frisians_wooden_tower_high",
      enhancement_cost = {
         log = 2,
         reed = 1
      },
      enhancement_return_on_dismantle = {
         log = 1,
      }
   },

   buildcost = {
      log = 3,
      reed = 1
   },
   return_on_dismantle = {
      log = 2
   },

   aihints = {
      expansion = true,
      prohibited_till = 400
   },

   max_soldiers = 1,
   heal_per_second = 40,
   conquers = 5,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by a Frisian military site
      occupied = pgettext("frisians_building", "Your soldier has occupied your wooden tower."),
      -- TRANSLATORS: Message sent by a Frisian military site
      aggressor = pgettext("frisians_building", "Your wooden tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Frisian military site
      attack = pgettext("frisians_building", "Your wooden tower is under attack."),
      -- TRANSLATORS: Message sent by a Frisian military site
      defeated_enemy = pgettext("frisians_building", "The enemy defeated your soldiers at the wooden tower."),
      -- TRANSLATORS: Message sent by a Frisian military site
      defeated_you = pgettext("frisians_building", "Your soldiers defeated the enemy at the wooden tower.")
   },
}

pop_textdomain()
