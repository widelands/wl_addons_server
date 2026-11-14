push_textdomain("europeans_all.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "rye_flour",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Rye Flour"),
   icon = dirname .. "menu_rye_flour.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "rye_flour",
         hotspot = {3, 6}
      },
   }
}
pop_textdomain()
