dirname = path.dirname(__file__)

push_textdomain("frisians-economy-ultra.wad", true)

descriptions:new_ware_type {
   name = "leather",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Leather"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = { idle = { hotspot = {5, 5}}}
}
pop_textdomain()
