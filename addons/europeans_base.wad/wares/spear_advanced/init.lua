push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "spear_advanced",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Advanced Spear"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 7, 10 },
      },
   }
}

pop_textdomain()
