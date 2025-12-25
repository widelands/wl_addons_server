push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "potion",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Potion"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 4, 14 },
      },
   }
}

pop_textdomain()
