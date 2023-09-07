push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "biscuit",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("empire_ware", "Biscuit"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 6, 6 },
      },
   }
}

pop_textdomain()
