push_textdomain("sumatran_world.wad", true)

local result = {
   terrains = {},
   immovables = {
      {
         name = "immovables_sumatra",
         descname = _("Sumatra"),
         picture = "addons/sumatrian_world.wad/sumatra_imm.png",
         items_per_row = 8,
         items = {
            "ironwood_amazons_sapling",
            "ironwood_amazons_pole",
            "ironwood_amazons_mature",
            "ironwood_amazons_old",

            "rubber_amazons_sapling",
            "rubber_amazons_pole",
            "rubber_amazons_mature",
            "rubber_amazons_old",

            "balsa_amazons_sapling",
            "balsa_amazons_pole",
            "balsa_amazons_mature",
            "balsa_amazons_old",

            "dipterocarpus_sapling",
            "dipterocarpus_pole",
            "dipterocarpus_mature",
            "dipterocarpus_old",

         }
      },
},
   critters = {
      {
         name = "critters_sumatra",
         -- TRANSLATORS: A category in the editor for placing animals on the map.
         descname = _("Sumatra"),
         picture = "addons/sumetrian_world.wad/sumatra_crt.png",
         items_per_row = 10,
         items = {
            "rhinoceros",
            "crocodile",
         }
      },
},
   resources = {},
}

pop_textdomain()
return result
