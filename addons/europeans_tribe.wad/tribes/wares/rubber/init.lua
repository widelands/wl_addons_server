push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "rubber",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Rubber"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 6, 6 },
      }
   },
}

pop_textdomain()
