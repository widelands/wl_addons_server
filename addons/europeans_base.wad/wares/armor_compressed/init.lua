push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "armor_compressed",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Compressed Armor"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 3, 11 },
      },
   }
}

pop_textdomain()
