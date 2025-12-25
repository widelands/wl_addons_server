push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "copper",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Copper"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",

   animations = {
      idle = {
         hotspot = { 10, 10 },
      }
   },
}

pop_textdomain()
