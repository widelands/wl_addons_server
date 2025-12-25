push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "herbs",
   -- TRANSLATORS: This is a ware name.
   descname = pgettext("ware", "Herbs"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = { idle = { hotspot = {4, 6}}}
}

pop_textdomain()
