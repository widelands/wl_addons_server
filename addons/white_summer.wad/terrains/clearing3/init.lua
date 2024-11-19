if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_clearing3",
   descname = _"Clearing 3",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 6,
   textures = { terraindir .. "clearing3.png" },
   dither_layer = 349,
   temperature = 95,
   humidity = 750,
   fertility = 400,
   enhancement = { amazons = "summer_clearing2b" }
}

pop_textdomain()
