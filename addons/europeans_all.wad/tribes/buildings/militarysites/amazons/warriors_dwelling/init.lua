include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/amazons/warriors_dwelling/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_amazons_warriors_dwelling",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("amazons_building", "Warriors’ Dwelling"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "medium",
   vision_range = 11,
   buildcost = {
      ironwood = 3,
      granite = 4,
   },
   return_on_dismantle = {
      ironwood = 2,
      granite = 2,
   },

   aihints = {
      fighting = true,
      mountain_conqueror = true,
      prohibited_till = 500
   },

   max_soldiers = 5,
   heal_per_second = 150,
   conquers = 8,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by an Amazon military site
      occupied = pgettext("amazons_building", "Your soldiers have occupied your warriors’ dwelling."),
      -- TRANSLATORS: Message sent by an Amazon military site
      aggressor = pgettext("amazons_building", "Your warriors’ dwelling discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Amazon military site
      attack = pgettext("amazons_building", "Your warriors’ dwelling is under attack."),
      -- TRANSLATORS: Message sent by an Amazon military site
      defeated_enemy = pgettext("amazons_building", "The enemy defeated your soldiers at the warriors’ dwelling."),
      -- TRANSLATORS: Message sent by an Amazon military site
      defeated_you = pgettext("amazons_building", "Your soldiers defeated the enemy at the warriors’ dwelling.")
   },
}

pop_textdomain()
