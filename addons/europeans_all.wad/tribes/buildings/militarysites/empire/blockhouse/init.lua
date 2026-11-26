include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/empire/blockhouse/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_empire_blockhouse",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Blockhouse"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "small",
   enhancement = {
      name = "europeans_empire_sentry",
      enhancement_cost = {
         planks = 1,
         granite = 1
      },
      enhancement_return_on_dismantle = {
         granite = 1
      }
   },

   buildcost = {
      log = 1,
      planks = 2
   },
   return_on_dismantle = {
      planks = 1
   },

   aihints = {},

   max_soldiers = 1,
   heal_per_second = 60, -- very low -> smallest building
   conquers = 6,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by an Empire military site
      occupied = pgettext("empire_building", "Your soldier has occupied your blockhouse."),
      -- TRANSLATORS: Message sent by an Empire military site
      aggressor = pgettext("empire_building", "Your blockhouse discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Empire military site
      attack = pgettext("empire_building", "Your blockhouse is under attack."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_enemy = pgettext("empire_building", "The enemy defeated your soldiers at the blockhouse."),
      -- TRANSLATORS: Message sent by an Empire military site
      defeated_you = pgettext("empire_building", "Your soldiers defeated the enemy at the blockhouse.")
   },
}

pop_textdomain()
