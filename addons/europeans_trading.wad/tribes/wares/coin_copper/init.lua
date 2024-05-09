push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "coin_copper",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Copper Coin"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 10, 17 },
      },
   }
}

pop_textdomain()
