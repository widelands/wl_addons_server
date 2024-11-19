if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

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
   humidity = 995,
   fertility = 100,
   enhancement = { diking = "summer_wet_beach" }
}

pop_textdomain()
