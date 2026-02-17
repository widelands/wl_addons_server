push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "bread_hebrews",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("hebrews_ware", "Unleavened Bread"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 9, 9 },
      },
   }
}

pop_textdomain()
