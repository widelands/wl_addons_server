push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "starch",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Starch"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",

   animations = {
      idle = {
         hotspot = { 6, 6 },
      }
   },
}

pop_textdomain()
