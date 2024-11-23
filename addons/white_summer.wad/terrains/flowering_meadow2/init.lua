if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_flowering_meadow2",
   descname = _"Flowering Meadow 2",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 10,
   textures = { terraindir .. "flowering_meadow2.png" },
   dither_layer = 337,
   temperature = 100,
   humidity = 450,
   fertility = 300,
   enhancement = { amazons = "summer_meadow3" }
}

pop_textdomain()
