if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("tropics.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "tropics_soil1",
   descname = _"Wet Soil 1",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 16,
   textures = { terraindir .. "soil1.png" },
   dither_layer = 354,
   temperature = 190,
   humidity = 955,
   fertility = 170,
}
world:new_terrain_type{
   name = "tropics_soil2",
   descname = _"Wet Soil 2",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 15,
   textures = { terraindir .. "soil2.png" },
   dither_layer = 264,
   temperature = 195,
   humidity = 945,
   fertility = 180,
}
world:new_terrain_type{
   name = "tropics_soil3",
   descname = _"Muddy Soil 1",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 12,
   textures = { terraindir .. "soil3.png" },
   dither_layer = 184,
   temperature = 200,
   humidity = 970,
   fertility = 190,
}
world:new_terrain_type{
   name = "tropics_soil4",
   descname = _"Muddy Soil 2",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 10,
   textures = { terraindir .. "soil4.png" },
   dither_layer = 17,
   temperature = 204,
   humidity = 960,
   fertility = 205,
}
world:new_terrain_type{
   name = "tropics_rocky_soil1",
   descname = _"Rocky Soil 1",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 6,
   textures = { terraindir .. "rocky_soil1.png" },
   dither_layer = 364,
   temperature = 180,
   humidity = 885,
   fertility = 230,
}
world:new_terrain_type{
   name = "tropics_rocky_soil2",
   descname = _"Rocky Soil 2",
   is = "arable",
   valid_resources = {},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "rocky_soil2.png" },
   dither_layer = 444,
   temperature = 170,
   humidity = 870,
   fertility = 250,
}

world:new_terrain_type{
   name = "tropics_forest_mountain1",
   descname = _"Forested Mountain 1",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "forest_mountain1.png" },
   dither_layer = 34,
   temperature = 180,
   humidity = 860,
   fertility = 200,
}
world:new_terrain_type{
   name = "tropics_forest_mountain2",
   descname = _"Forested Mountain 2",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "forest_mountain2.png" },
   dither_layer = 174,
   temperature = 170,
   humidity = 845,
   fertility = 195,
}
world:new_terrain_type{
   name = "tropics_forest_mountain3",
   descname = _"Forested Mountain 3",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "forest_mountain3.png" },
   dither_layer = 564,
   temperature = 190,
   humidity = 825,
   fertility = 225,
}
world:new_terrain_type{
   name = "tropics_mountain1",
   descname = _"Mountain 1",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "mountain1.png" },
   dither_layer = 434,
   temperature = 160,
   humidity = 640,
   fertility = 60,
   enhancement = { amazons = "tropics_forest_mountain1" }
}
world:new_terrain_type{
   name = "tropics_mountain2",
   descname = _"Mountain 2",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "mountain2.png" },
   dither_layer = 474,
   temperature = 150,
   humidity = 620,
   fertility = 16,
   enhancement = { amazons = "tropics_forest_mountain2" }
}
world:new_terrain_type{
   name = "tropics_mountain3",
   descname = _"Mountain 3",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "mountain3.png" },
   dither_layer = 484,
   temperature = 140,
   humidity = 600,
   fertility = 5,
   enhancement = { amazons = "tropics_forest_mountain3" }
}

world:new_terrain_type{
   name = "tropics_beach",
   descname = _"Beach",
   is = "walkable",
   valid_resources = {},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "beach.png" },
   dither_layer = 924,
   temperature = 210,
   humidity = 990,
   fertility = 192,
}
world:new_terrain_type{
   name = "tropics_fen1",
   descname = _"Tropical Fen 1",
   is = "walkable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 8,
   textures = { terraindir .. "fen1.png" },
   dither_layer = 714,
   temperature = 208,
   humidity = 978,
   fertility = 202,
}
world:new_terrain_type{
   name = "tropics_fen2",
   descname = _"Tropical Fen 2",
   is = "walkable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 7,
   textures = { terraindir .. "fen2.png" },
   dither_layer = 724,
   temperature = 198,
   humidity = 968,
   fertility = 205,
}
world:new_terrain_type{
   name = "tropics_swamp",
   descname = _"Tropical Swamp",
   is = "unwalkable",
   valid_resources = {"resource_fish"},
   default_resource = "resource_fish",
   default_resource_amount = 7,
   textures =  path.list_files(terraindir .. "swamp_??.png"),
   dither_layer = 374,
   fps = 5,
   temperature = 212,
   humidity = 994,
   fertility = 201,
}

world:new_terrain_type{
   name = "tropics_water1",
   descname = _"Tropical Water",
   is = "water",
   valid_resources = {"resource_fish"},
   default_resource = "resource_fish",
   default_resource_amount = 9,
   textures = path.list_files(terraindir .. "water1_??.png"),
   dither_layer = 494,
   fps = 8,
   temperature = 130,
   humidity = 999,
   fertility = 12,
}
world:new_terrain_type{
   name = "tropics_water2",
   descname = _"Muddy river water",
   is = "water",
   valid_resources = {"resource_fish"},
   default_resource = "resource_fish",
   default_resource_amount = 5,
   textures = path.list_files(terraindir .. "water2_??.png"),
   dither_layer = 944,
   fps = 6,
   temperature = 209,
   humidity = 994,
   fertility = 190,
}

pop_textdomain()
