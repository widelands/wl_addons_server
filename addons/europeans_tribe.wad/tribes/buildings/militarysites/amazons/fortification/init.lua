include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/amazons/fortification/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_amazons_fortification",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("amazons_building", "Fortification"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "big",
   vision_range = 16,

   aihints = {
      expansion = true,
      fighting = true,
      mountain_conqueror = true
   },

   max_soldiers = 12,
   heal_per_second = 220,
   conquers = 12,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by an Amazon military site
      occupied = pgettext("amazons_building", "Your soldiers have occupied your fortification."),
      -- TRANSLATORS: Message sent by an Amazon military site
      aggressor = pgettext("amazons_building", "Your fortification discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Amazon military site
      attack = pgettext("amazons_building", "Your fortification is under attack."),
      -- TRANSLATORS: Message sent by an Amazon military site
      defeated_enemy = pgettext("amazons_building", "The enemy defeated your soldiers at the fortification."),
      -- TRANSLATORS: Message sent by an Amazon military site
      defeated_you = pgettext("amazons_building", "Your soldiers defeated the enemy at the fortification.")
   },
}

pop_textdomain()
