push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "vegetable",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Vegetable"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = { idle = { hotspot = {9, 17}}}
}

pop_textdomain()
