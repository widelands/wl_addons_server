push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "tallit_katan",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Tallit Katan"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 5, 10 },
      },
   }
}

pop_textdomain()
