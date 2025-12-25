push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "milk",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Milk"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 4, 14 },
      },
   }
}

pop_textdomain()
