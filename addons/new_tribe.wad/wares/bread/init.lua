push_textdomain("new_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_ware_type {
   name = "newtribe_bread",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("newtribe_ware", "Bread"),
   icon = dirname .. "menu.png",

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle.png"),
         hotspot = { 9, 13 },
      },
   }
}

pop_textdomain()
