if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

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
   humidity = 995,
   fertility = 100,
   enhancement = { diking = "summer_wet_beach" }
}

pop_textdomain()
