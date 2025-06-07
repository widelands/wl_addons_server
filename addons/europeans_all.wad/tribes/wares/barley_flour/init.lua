dirname = path.dirname(__file__)

push_textdomain("tribes")

wl.Descriptions():new_ware_type {
   name = "barley_flour",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Barley Flour"),
   icon = dirname .. "menu_barley_flour.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "barley_flour",
         hotspot = {3, 6},
      }
   }
}
pop_textdomain()
