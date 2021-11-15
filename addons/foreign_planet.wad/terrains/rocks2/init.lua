if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_rocks2",
   descname = _ "Rocks 2",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 5,
   textures = { terraindir .. "rocks2.png" },
   dither_layer = 253,
   temperature = 100,
   humidity = 200,
   fertility = 900,
}

pop_textdomain()
