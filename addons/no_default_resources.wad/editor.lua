push_textdomain("no_default_resources.wad", true)
local result = {
   terrains = {
      {
         name = "summer_dry",
         -- TRANSLATORS: A category in the editor for placing terrains on the map.
         descname = _ "Summer terrains without default resources",
         picture = "addons/no_default_resources.wad/menu_pics/summer.png",
         items_per_row = 6,
         items = {
            "summer_meadow1_dry",
            "summer_meadow2_dry",
            "summer_meadow3_dry",
            "summer_meadow4_dry",
            "summer_steppe_dry",
            "summer_steppe_barren_dry",
            "summer_swamp_dry",
            "summer_water_no_fish",
         }
      },
      {
         name = "wasteland_dry",
         -- TRANSLATORS: A category in the editor for placing terrains on the map.
         descname = _ "Wasteland terrains without default resources",
         picture = "addons/no_default_resources.wad/menu_pics/wasteland.png",
         items_per_row = 6,
         items = {
            "hardground1_dry",
            "hardground2_dry",
            "hardground3_dry",
            "hardground4_dry",
            "ashes1_dry",
            "ashes2_dry",
            "wasteland_water_no_fish",
         }
      },
      {
         name = "winter_dry",
         -- TRANSLATORS: A category in the editor for placing terrains on the map.
         descname = _ "Winter terrains without default resources",
         picture = "addons/no_default_resources.wad/menu_pics/winter.png",
         items_per_row = 6,
         items = {
            "taiga_dry",
            "tundra_dry",
            "tundra2_dry",
            "tundra3_dry",
            "tundra_taiga_dry",
            "winter_water_no_fish",
         }
      },
      {
         name = "desert_dry",
         -- TRANSLATORS: A category in the editor for placing terrains on the map.
         descname = _ "Desert terrains without default resources",
         picture = "addons/no_default_resources.wad/menu_pics/desert.png",
         items_per_row = 6,
         items = {
            "meadow_dry",
            "desert_steppe_dry",
            "drysoil_dry",
            "desert4_dry",
            "desert_water_no_fish",
         }
      },
   },
   immovables = {},
   critters = {},
   resources = {},
}
pop_textdomain()
return result
