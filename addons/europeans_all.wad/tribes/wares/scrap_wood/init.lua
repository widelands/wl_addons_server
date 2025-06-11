push_textdomain("europeans_all.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "scrap_wood",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Scrap wood"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 8, 7 },
      }
   },
}

pop_textdomain()
