push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "stone",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Stone"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 9, 9 },
      },
   }
}

pop_textdomain()
