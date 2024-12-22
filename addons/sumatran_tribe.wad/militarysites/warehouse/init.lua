push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
   name = "sumatran_warehouse",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Tribal Warehouse"),
   icon = dirname .. "menu.png",
   size = "big",

    buildcost = {
        stone = 3,
        tropicalwood = 3,
        cloth = 2,
        diamond = 3,
        reed = 1
    },
    return_on_dismantle = {
        stone = 2,
        tropicalwood = 1,
        cloth = 1,
        diamond = 2,
    },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 63, 68 }
      }
   },

   aihints = {
       prohibited_till = 900,
       forced_after = 1800,
       basic_amount = 1,
       very_weak_ai_limit = 4,
       weak_ai_limit = 6,
--       normal_ai_limit = 8,
   },

   heal_per_second = 170,
}

pop_textdomain()
