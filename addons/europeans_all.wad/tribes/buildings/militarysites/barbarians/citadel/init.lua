include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/militarysites/barbarians/citadel/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_militarysite_type {
   name = "europeans_barbarians_citadel",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Citadel"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   size = "big",

   aihints = {},

   max_soldiers = 12,
   heal_per_second = 220,
   conquers = 12,
   prefer_heroes = true,

   messages = {
      -- TRANSLATORS: Message sent by a Barbarian military site
      occupied = pgettext("barbarians_building", "Your soldiers have occupied your citadel."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      aggressor = pgettext("barbarians_building", "Your citadel discovered an aggressor."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      attack = pgettext("barbarians_building", "Your citadel is under attack."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_enemy = pgettext("barbarians_building", "The enemy defeated your soldiers at the citadel."),
      -- TRANSLATORS: Message sent by a Barbarian military site
      defeated_you = pgettext("barbarians_building", "Your soldiers defeated the enemy at the citadel.")
   },
}

pop_textdomain()
