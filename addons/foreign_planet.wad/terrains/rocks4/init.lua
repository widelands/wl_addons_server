if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_rocks4",
   descname = _ "Rocks 4",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 10,
   textures = { terraindir .. "rocks4.png" },
   dither_layer = 53,
   temperature = 800,
   humidity = 10,
   fertility = 10,
}

pop_textdomain()
