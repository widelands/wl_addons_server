dirname = path.dirname(__file__)

push_textdomain("frisians-economy-ultra.wad", true)

wl.Descriptions():new_ware_type {
   name = "salt",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Salt"),
   icon = dirname .. "menu_salt.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "salt",
         hotspot = {5, 5},
      }
   }
}
pop_textdomain()
