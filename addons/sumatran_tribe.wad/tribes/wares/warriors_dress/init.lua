push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "warriors_dress",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Warrior’s Dress"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = { idle = { hotspot = {6, 8}}}
}

pop_textdomain()
