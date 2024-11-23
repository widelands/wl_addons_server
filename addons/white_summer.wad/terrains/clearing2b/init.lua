if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_clearing2b",
   descname = _"Clearing 2b",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 6,
   textures = { terraindir .. "clearing2b.png" },
   dither_layer = 848,
   temperature = 100,
   humidity = 650,
   fertility = 400,
}
pop_textdomain()
