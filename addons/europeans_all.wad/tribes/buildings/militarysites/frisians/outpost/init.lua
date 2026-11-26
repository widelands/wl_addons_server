include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/frisians/outpost/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_frisians_outpost",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("frisians_building", "Outpost"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "medium",
   buildcost = {
      brick = 5,
      granite = 1,
      log = 1,
      reed = 2
   },
   return_on_dismantle = {
      brick = 2,
      log = 1,
      reed = 1
   },

   aihints = {
      expansion = true,
      fighting = true,
      mountain_conqueror = true
   },

   max_soldiers = 6,
   heal_per_second = 160,
   conquers = 9,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Frisian military site
      occupied = pgettext("frisians_building", "Your soldiers have occupied your outpost."),
      -- TRANSLATORS: Message sent by a Frisian military site
      aggressor = pgettext("frisians_building", "Your outpost discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Frisian military site
      attack = pgettext("frisians_building", "Your outpost is under attack."),
      -- TRANSLATORS: Message sent by a Frisian military site
      defeated_enemy = pgettext("frisians_building", "The enemy defeated your soldiers at the outpost."),
      -- TRANSLATORS: Message sent by a Frisian military site
      defeated_you = pgettext("frisians_building", "Your soldiers defeated the enemy at the outpost.")
   },
}

pop_textdomain()
