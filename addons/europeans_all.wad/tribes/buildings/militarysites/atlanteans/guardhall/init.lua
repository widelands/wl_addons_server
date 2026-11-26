include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/atlanteans/guardhall/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_atlanteans_guardhall",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("atlanteans_building", "Guardhall"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "medium",
   buildcost = {
      log = 2,
      planks = 3,
      granite = 4,
      diamond = 1
   },
   return_on_dismantle = {
      log = 1,
      planks = 1,
      granite = 3
   },

   aihints = {
      fighting = true
   },

   max_soldiers = 7,
   heal_per_second = 140,
   conquers = 7,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by an Atlantean military site
      occupied = pgettext("atlanteans_building", "Your soldiers have occupied your guardhall."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      aggressor = pgettext("atlanteans_building", "Your guardhall discovered an aggressor."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      attack = pgettext("atlanteans_building", "Your guardhall is under attack."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      defeated_enemy = pgettext("atlanteans_building", "The enemy defeated your soldiers at the guardhall."),
      -- TRANSLATORS: Message sent by an Atlantean military site
      defeated_you = pgettext("atlanteans_building", "Your soldiers defeated the enemy at the guardhall.")
   },
}

pop_textdomain()
