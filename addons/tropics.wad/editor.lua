push_textdomain("tropics.wad", true)

local result = {
   terrains = {
      {
         name = "terrains_tropics",
         -- TRANSLATORS: A category in the editor for placing terrains on the map.
         descname = _"Tropics",
         picture = "addons/tropics.wad/terrains/terrain_menu.png",
         items_per_row = 6,
         items = {
            "tropics_soil1",
            "tropics_soil2",
            "tropics_soil3",
            "tropics_soil4",
            "tropics_rocky_soil1",
            "tropics_rocky_soil2",
            "tropics_forest_mountain1",
            "tropics_forest_mountain2",
            "tropics_forest_mountain3",
            "tropics_mountain1",
            "tropics_mountain2",
            "tropics_mountain3",
            "tropics_beach",
            "tropics_fen1",
            "tropics_fen2",
            "tropics_swamp",
            "tropics_water1",
            "tropics_water2",
         }
      }
   },
   immovables = {
      {
         name = "immovables_trees_tropics",
         -- TRANSLATORS: A category in the editor for placing immovables on the map.
         descname = _"Tropical Trees",
         picture = "addons/tropics.wad/immovables/trees/trees_menu.png",
         items_per_row = 8,
         items = {
            "palm_peach_tropic_sapling",
            "palm_peach_tropic_pole",
            "palm_peach_tropic_mature",
            "palm_peach_tropic_old",
            
            "palm_syargus_tropic_sapling",
            "palm_syargus_tropic_pole",
            "palm_syargus_tropic_mature",
            "palm_syargus_tropic_old",
            
            "ebony_tropic_sapling",
            "ebony_tropic_pole",
            "ebony_tropic_mature",
            "ebony_tropic_old",
            
            "kapok_tropic_sapling",
            "kapok_tropic_pole",
            "kapok_tropic_mature",
            "kapok_tropic_old",
            
            "corymbia_tropic_sapling",
            "corymbia_tropic_pole",
            "corymbia_tropic_mature",
            "corymbia_tropic_old",
            
            "lapacho_tropic_sapling",
            "lapacho_tropic_pole",
            "lapacho_tropic_mature",
            "lapacho_tropic_old",
            
            "mangrove_tropic_sapling",
            "mangrove_tropic_pole",
            "mangrove_tropic_mature",
            "mangrove_tropic_old",
         }
      }   
   },
   critters = {},
   resources = {},
}

pop_textdomain()
return result
