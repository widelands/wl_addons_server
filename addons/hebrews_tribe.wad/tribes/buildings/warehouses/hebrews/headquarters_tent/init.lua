push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
   name = "hebrews_headquarters_tent",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Tabernacle"),
   icon = dirname .. "menu.png",
   size = "big",
   destructible = false,

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 102, 86 },
      },
   },

   aihints = {},

   heal_per_second = 170,
   conquers = 9,
   max_garrison = 20,
}

pop_textdomain()
