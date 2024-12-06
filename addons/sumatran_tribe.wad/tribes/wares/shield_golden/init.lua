push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "shield_golden",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Golden Shield"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 10, 17 },
      },
   }
}

pop_textdomain()
