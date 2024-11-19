if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

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
   enhancement = { diking = "summer_clearing1" }
}

pop_textdomain()
