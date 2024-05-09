push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "sword_broad",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Broadsword"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 12, 9 },
      }
   },
}

pop_textdomain()
