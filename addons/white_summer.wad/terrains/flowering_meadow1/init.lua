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
   humidity = 400,
   fertility = 300,
   enhancement = { amazons = "mountainmeadow" }
}
pop_textdomain()
