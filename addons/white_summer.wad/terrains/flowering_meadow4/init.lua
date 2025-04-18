if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_flowering_meadow4",
   descname = _"Flowering Meadow 4",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 10,
   textures = { terraindir .. "flowering_meadow4.png" },
   dither_layer = 339,
   temperature = 102,
   humidity = 550,
   fertility = 300,
   enhancement = { amazons = "highmountainmeadow" }
}

pop_textdomain()
