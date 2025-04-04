push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "tropicalwood",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Tropical Wood"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",

   animations = {
      idle = {
         hotspot = { 8, 7 },
      }
   },
}

pop_textdomain()
