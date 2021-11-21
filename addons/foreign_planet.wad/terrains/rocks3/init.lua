if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_rocks3",
   descname = _ "Rocks 3",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "rocks3.png" },
   dither_layer = 153,
   temperature = 100,
   humidity = 250,
   fertility = 350,
}

pop_textdomain()
