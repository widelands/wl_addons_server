push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "grout",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Grout"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 5, 12 },
      },
   }
}

pop_textdomain()
