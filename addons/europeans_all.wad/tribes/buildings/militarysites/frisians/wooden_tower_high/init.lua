include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/frisians/wooden_tower_high/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_frisians_wooden_tower_high",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("frisians_building", "High Wooden Tower"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "small",
   vision_range = 17,

   aihints = {
      expansion = true,
   },

   max_soldiers = 2,
   heal_per_second = 70,
   conquers = 6,
   prefer_heroes = false,

   messages = {
      -- TRANSLATORS: Message sent by a Frisian military site
      occupied = pgettext("frisians_building", "Your soldiers have occupied your high wooden tower."),
      -- TRANSLATORS: Message sent by a Frisian military site
      aggressor = pgettext("frisians_building", "Your high wooden tower discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Frisian military site
      attack = pgettext("frisians_building", "Your high wooden tower is under attack."),
      -- TRANSLATORS: Message sent by a Frisian military site
      defeated_enemy = pgettext("frisians_building", "The enemy defeated your soldiers at the high wooden tower."),
      -- TRANSLATORS: Message sent by a Frisian military site
      defeated_you = pgettext("frisians_building", "Your soldiers defeated the enemy at the high wooden tower.")
   },
}

pop_textdomain()
