push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
   name = "gauls_warehouse",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Warehouse"),
   icon = dirname .. "menu.png",
   size = "big",

    buildcost = {
        granite = 3,
        planks = 2,
        cloth = 3,
        brick = 3,
        reed = 1
    },
    return_on_dismantle = {
        granite = 2,
        planks = 1,
        cloth = 1,
        brick = 1,
    },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {55, 73}},
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
