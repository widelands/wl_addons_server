push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "menorah",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Menorah"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 10, 29 },
      },
   }
}

pop_textdomain()
