push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "sheep2",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Sheep"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 8, 14 },
      },
   }
}

pop_textdomain()
