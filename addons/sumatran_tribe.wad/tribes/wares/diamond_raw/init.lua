push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "diamond_raw",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Raw Diamond"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 8, 8 },
      },
   }
}

pop_textdomain()
