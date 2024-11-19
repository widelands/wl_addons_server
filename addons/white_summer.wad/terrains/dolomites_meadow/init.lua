if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

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
   humidity = 550,
   fertility = 500,
}
pop_textdomain()
