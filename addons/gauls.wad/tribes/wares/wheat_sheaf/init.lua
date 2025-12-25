push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "wheat_sheaf",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Wheat Sheaf"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { -1, 6 },
      },
   }
}

pop_textdomain()
