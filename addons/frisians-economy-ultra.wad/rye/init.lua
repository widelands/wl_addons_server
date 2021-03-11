dirname = path.dirname(__file__)

push_textdomain("frisians-economy-ultra.wad", true)

descriptions:new_ware_type {
   name = "rye",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Rye"),
   icon = dirname .. "menu_rye.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "rye",
         hotspot = {3, 6},
      }
   }
}
pop_textdomain()
