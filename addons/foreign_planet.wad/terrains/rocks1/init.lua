if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_rocks1",
   descname = _ "Rocks 1",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "rocks1.png" },
   dither_layer = 353,
   temperature = 100,
   humidity = 150,
   fertility = 800,
}

pop_textdomain()
