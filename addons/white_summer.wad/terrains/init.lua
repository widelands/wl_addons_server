if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_flowering_meadow1",
   descname = _"Flowering Meadow 1",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 10,
   textures = { terraindir .. "flowering_meadow1.png" },
   dither_layer = 336,
   temperature = 95,
   humidity = 500,
   fertility = 200,
   enhancement = { amazons = "summer_flowering_meadow3" }
}
world:new_terrain_type{
   name = "summer_flowering_meadow2",
   descname = _"Flowering Meadow 2",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 10,
   textures = { terraindir .. "flowering_meadow2.png" },
   dither_layer = 337,
   temperature = 95,
   humidity = 500,
   fertility = 380,
   enhancement = { amazons = "summer_clearing2" }
}
world:new_terrain_type{
   name = "summer_flowering_meadow3",
   descname = _"Flowering Meadow 3",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 10,
   textures = { terraindir .. "flowering_meadow3.png" },
   dither_layer = 338,
   temperature = 100,
   humidity = 500,
   fertility = 350,
   enhancement = { amazons = "summer_clearing2" }
}
world:new_terrain_type{
   name = "summer_flowering_meadow4",
   descname = _"Flowering Meadow 4",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 10,
   textures = { terraindir .. "flowering_meadow4.png" },
   dither_layer = 339,
   temperature = 100,
   humidity = 450,
   fertility = 300,
   enhancement = { amazons = "summer_clearing3" }
}
world:new_terrain_type{
   name = "summer_clearing1",
   descname = _"Clearing 1",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 6,
   textures = { terraindir .. "clearing1.png" },
   dither_layer = 347,
   temperature = 90,
   humidity = 650,
   fertility = 700,
}
world:new_terrain_type{
   name = "summer_clearing2",
   descname = _"Clearing 2",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 6,
   textures = { terraindir .. "clearing2.png" },
   dither_layer = 348,
   temperature = 90,
   humidity = 680,
   fertility = 650,
}

world:new_terrain_type{
   name = "summer_clearing3",
   descname = _"Clearing 3",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 6,
   textures = { terraindir .. "clearing3.png" },
   dither_layer = 349,
   temperature = 95,
   humidity = 720,
   fertility = 600,
}

world:new_terrain_type{
   name = "summer_forested_dolomites1",
   descname = _"Forested Dolomites 1",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "resource_stones",
   default_resource_amount = 10,
   textures = { terraindir .. "forested_dolomites1.png" },
   dither_layer = 66,
   temperature = 75,
   humidity = 705,
   fertility = 680,
}

world:new_terrain_type{
   name = "summer_forested_dolomites2",
   descname = _"Forested Dolomites 2",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "resource_stones",
   default_resource_amount = 10,
   textures = { terraindir .. "forested_dolomites2.png" },
   dither_layer = 67,
   temperature = 70,
   humidity = 725,
   fertility = 655,
}

world:new_terrain_type{
   name = "summer_forested_dolomites3",
   descname = _"Forested Dolomites 3",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "resource_stones",
   default_resource_amount = 10,
   textures = { terraindir .. "forested_dolomites3.png" },
   dither_layer = 68,
   temperature = 65,
   humidity = 750,
   fertility = 600,
   enhancement = { amazons = "summer_forested_dolomites1" }
}

world:new_terrain_type{
   name = "summer_dolomites1",
   descname = _"Dolomites 1",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "resource_stones",
   default_resource_amount = 10,
   textures = { terraindir .. "dolomites1.png" },
   dither_layer = 76,
   temperature = 60,
   humidity = 700,
   fertility = 5,
   enhancement = { amazons = "summer_forested_dolomites3" }
}

world:new_terrain_type{
   name = "summer_dolomites2",
   descname = _"Dolomites 2",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "resource_stones",
   default_resource_amount = 10,
   textures = { terraindir .. "dolomites2.png" },
   dither_layer = 77,
   temperature = 65,
   humidity = 800,
   fertility = 5,
   enhancement = { amazons = "summer_forested_dolomites3" }
}

world:new_terrain_type{
   name = "summer_dolomites_meadow",
   descname = _"Dolomites Meadow",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 4,
   textures = path.list_files(terraindir .. "dolomites_meadow.png"),
   dither_layer = 65,
   temperature = 80,
   humidity = 650,
   fertility = 730,
}
world:new_terrain_type{
   name = "summer_wet_beach",
   descname = _"Clay Soil",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 12,
   textures = path.list_files(terraindir .. "wet_beach.png"),
   dither_layer = 59,
   temperature = 95,
   humidity = 900,
   fertility = 730,
}

world:new_terrain_type{
   name = "summer_green_water1",
   descname = _"Green Water 1",
   is = "water",
   valid_resources = {"resource_fish"},
   default_resource = "resource_fish",
   default_resource_amount = 4,
   textures = path.list_files(terraindir .. "green_water1_??.png"),
   dither_layer = 176,
   fps = 14,
   temperature = 90,
   humidity = 994,
   fertility = 190,
}

world:new_terrain_type{
   name = "summer_green_water2",
   descname = _"Green Water 2",
   is = "water",
   valid_resources = {"resource_fish"},
   default_resource = "resource_fish",
   default_resource_amount = 4,
   textures = path.list_files(terraindir .. "green_water2_??.png"),
   dither_layer = 177,
   fps = 14,
   temperature = 85,
   humidity = 994,
   fertility = 190,
}

world:new_terrain_type{
   name = "summer_green_water3",
   descname = _"Green Water 3",
   is = "water",
   valid_resources = {"resource_fish"},
   default_resource = "resource_fish",
   default_resource_amount = 2,
   textures = path.list_files(terraindir .. "green_water3_??.png"),
   dither_layer = 178,
   fps = 14,
   temperature = 80,
   humidity = 994,
   fertility = 190,
}

world:new_terrain_type{
   name = "summer_muddy_water",
   descname = _"Muddy Water",
   is = "water",
   valid_resources = {"resource_fish"},
   default_resource = "resource_fish",
   default_resource_amount = 2,
   textures = path.list_files(terraindir .. "muddy_water_??.png"),
   dither_layer = 179,
   fps = 14,
   temperature = 90,
   humidity = 994,
   fertility = 300,
}

pop_textdomain()
