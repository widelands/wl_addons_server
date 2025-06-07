dirname = path.dirname(__file__)

push_textdomain("tribes")

wl.Descriptions():new_ware_type {
   name = "oat_flour",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Oat Flour"),
   icon = dirname .. "menu_oat_flour.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "oat_flour",
         hotspot = {3, 6}
      },
   }
}
pop_textdomain()
