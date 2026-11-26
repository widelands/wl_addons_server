include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "campaigns/atl02.wmf/scripting/tribes/atlanteans_trader/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_worker_type {
   name = "atlanteans_trader",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("atlanteans_worker", "Trader"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = animations,
   spritesheets = spritesheets,

   vision_range = 3,

   buildcost = {
      atlanteans_scout = 1,
      atlanteans_horse = 1
   },

   programs = {
      coal_trade = {
         "findobject=attrib:tradepole radius:80",
         "createware=coal",
         "walk=object",
         "createware=coin_copper",
         "return"
      },
      iron_trade = {
         "findobject=attrib:tradepole radius:80",
         "createware=iron",
         "walk=object",
         "createware=coin_silver",
         "return"
      },
      gold_trade = {
         "findobject=attrib:tradepole radius:80",
         "createware=gold",
         "walk=object",
         "createware=coin_gold",
         "return"
      },
      find_pole = {
         "findobject=attrib:tradepole radius:80",
      }
   },
}

pop_textdomain()
