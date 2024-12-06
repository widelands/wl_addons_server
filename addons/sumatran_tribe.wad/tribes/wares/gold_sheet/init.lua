push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "gold_sheet",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Gold Sheet"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = { idle = { hotspot = {10, 10}}}
}

pop_textdomain()
