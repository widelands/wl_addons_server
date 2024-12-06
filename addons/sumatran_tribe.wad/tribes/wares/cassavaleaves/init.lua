push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "cassavaleaves",
   -- TRANSLATORS: This is a ware name.
   descname = pgettext("ware", "Cassava Leaves"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = { idle = { hotspot = {4, 6}}}
}

pop_textdomain()
