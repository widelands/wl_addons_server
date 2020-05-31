dirname = path.dirname(__file__)

tribes:new_ware_type {
   msgctxt = "ware",
   name = "barley_flour",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Barley Flour"),
   helptext_script = dirname .. "helptexts_barley_flour.lua",
   icon = dirname .. "menu_barley_flour.png",
   default_target_quantity = {
      frisians = 15
   },
   preciousness = {
      frisians = 25
   },

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "barley_flour",
         hotspot = {3, 6},
      }
   }
}

tribes:new_ware_type {
   msgctxt = "ware",
   name = "rye",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Rye"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu_rye.png",
   default_target_quantity = {},
   preciousness = {
      frisians = 25
   },

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "rye",
         hotspot = {3, 6},
      }
   }
}

tribes:new_ware_type {
   msgctxt = "ware",
   name = "rye_flour",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Rye Flour"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu_rye_flour.png",
   default_target_quantity = {},
   preciousness = {
      frisians = 25
   },

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "rye_flour",
         hotspot = {3, 6}
      },
   }
}

tribes:new_ware_type {
   msgctxt = "ware",
   name = "salt",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Salt"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu_salt.png",
   default_target_quantity = {},
   preciousness = {
      frisians = 25
   },

   animation_directory = dirname,
   animations = {
      idle = {
         basename = "salt",
         hotspot = {5, 5},
      }
   }
}
