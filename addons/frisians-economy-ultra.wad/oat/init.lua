dirname = path.dirname(__file__)

push_textdomain("frisians-economy-ultra.wad", true)

descriptions:new_ware_type {
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
