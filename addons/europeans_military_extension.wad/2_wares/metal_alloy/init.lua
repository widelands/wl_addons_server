push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "metal_alloy",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Mixed Metal Alloy"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 10, 10 },
      },
   }
}

pop_textdomain()
