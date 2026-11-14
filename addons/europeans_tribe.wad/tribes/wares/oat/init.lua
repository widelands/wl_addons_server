push_textdomain("europeans_all.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "oat",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Oat"),
   icon = dirname .. "menu_oat.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "oat",
         hotspot = {3, 6},
      }
   }
}
pop_textdomain()
