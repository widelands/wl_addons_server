push_textdomain("new_soldiers.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_ware_type {
   name = "shield_wooden",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Wooden Shield"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 10, 12 },
      },
   }
}

pop_textdomain()
