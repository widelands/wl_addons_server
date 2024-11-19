if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_flowering_meadow3",
   descname = _"Flowering Meadow 3",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 10,
   textures = { terraindir .. "flowering_meadow3.png" },
   dither_layer = 338,
   temperature = 95,
   humidity = 450,
   fertility = 350,
   enhancement = { amazons = "summer_meadow4" }
}
pop_textdomain()
