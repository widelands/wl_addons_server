push_textdomain("foreign_planet.wad", true)

local result = {
   terrains = {
      {
         name = "terrains_foreignplanet",
         -- TRANSLATORS: A category in the editor for placing terrains on the map.
         descname = _ "Foreign Planet",
         picture = "addons/foreign_planet.wad/terrains/rocks2/rocks2.png",
         items_per_row = 6,
         items = {
            "foreignplanet_rocks1",
            "foreignplanet_rocks2",
            "foreignplanet_rocks3",
            "foreignplanet_rocks4",
            "foreignplanet_rocks5",
            "foreignplanet_rocks6",
            "foreignplanet_mountain1",
            "foreignplanet_mountain2",
            "foreignplanet_mountain3",
            "foreignplanet_beach",
            "foreignplanet_dust1",
            "foreignplanet_dust2",
            "foreignplanet_water1",
            "foreignplanet_water2",
         }
      }
   },
   immovables = {},
   critters = {},
   resources = {},
}

pop_textdomain()
return result
