push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "eggs",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Eggs"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = { idle = { hotspot = {9, 17}}}
}

pop_textdomain()
