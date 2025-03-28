if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_wet_beach2",
   descname = _"Wet Beach 2",
   is = "walkable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 12,
   textures = path.list_files(terraindir .. "wet_beach2.png"),
   dither_layer = 849,
   temperature = 90,
   humidity = 850,
   fertility = 100,
}

pop_textdomain()
