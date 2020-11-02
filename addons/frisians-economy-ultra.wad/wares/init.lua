dirname = path.dirname(__file__)

descriptions:new_ware_type {
   name = "barley_flour",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Barley Flour"),
   icon = dirname .. "menu_barley_flour.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "barley_flour",
         hotspot = {3, 6},
      }
   }
}

descriptions:new_ware_type {
   name = "rye",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Rye"),
   icon = dirname .. "menu_rye.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "rye",
         hotspot = {3, 6},
      }
   }
}

descriptions:new_ware_type {
   name = "rye_flour",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Rye Flour"),
   icon = dirname .. "menu_rye_flour.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "rye_flour",
         hotspot = {3, 6}
      },
   }
}

descriptions:new_ware_type {
   name = "salt",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Salt"),
   icon = dirname .. "menu_salt.png",

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "salt",
         hotspot = {5, 5},
      }
   }
}
