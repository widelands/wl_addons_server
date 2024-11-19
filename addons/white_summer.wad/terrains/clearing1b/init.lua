if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_clearing1b",
   descname = _"Clearing 1b",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 6,
   textures = { terraindir .. "clearing1b.png" },
   dither_layer = 847,
   temperature = 110,
   humidity = 750,
   fertility = 500,
}

pop_textdomain()
