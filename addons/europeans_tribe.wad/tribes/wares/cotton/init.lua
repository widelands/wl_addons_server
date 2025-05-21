push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "cotton",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Cotton"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 8, 18 },
      },
   }
}

pop_textdomain()
