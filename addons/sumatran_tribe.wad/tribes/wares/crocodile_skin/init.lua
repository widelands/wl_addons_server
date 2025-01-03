push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "crocodile_skin",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Crocodile Skin"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 4, 12 },
      },
   }
}

pop_textdomain()
