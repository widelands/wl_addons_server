push_textdomain("white_summer.wad", true)

local result = {
   terrains = {
      {
         name = "white_summer",
         descname = _ "White Summer",
         picture = "addons/white_summer.wad/summer_ter.png",
         items_per_row = 6,
         items = {
            "summer_flowering_meadow1",
            "summer_flowering_meadow2",
            "summer_flowering_meadow3",
            "summer_flowering_meadow4",
            "summer_clearing1",
            "summer_clearing1b",
            "summer_clearing2",
            "summer_clearing2b",
            "summer_clearing3",
            "summer_forested_dolomites1",
            "summer_forested_dolomites2",
            "summer_forested_dolomites3",
            "summer_dolomites1",
            "summer_dolomites2",
            "summer_dolomites_meadow",
            "summer_green_water1",
            "summer_green_water2",
            "summer_green_water3",
            "summer_muddy_water",
            "summer_wet_beach",
            "summer_wet_beach2",
         }
      },
   },
   immovables = {
{
         name = "immovables_white_summer",
         descname = _"White Summer",
         picture = "addons/white_summer.wad/summer_imm.png",
         items_per_row = 8,
         items = {
            "linden_summer_sapling",
            "linden_summer_pole",
            "linden_summer_mature",
            "linden_summer_old",
            
            "red_maple_summer_sapling",
            "red_maple_summer_pole",
            "red_maple_summer_mature",
            "red_maple_summer_old",
            
            "pine_summer_sapling",
            "pine_summer_pole",
            "pine_summer_mature",
            "pine_summer_old",
         }
      }
},
   critters = {},
   resources = {},
}

pop_textdomain()
return result
