if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_rocks5",
   descname = _ "Rocks 5",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "rocks5.png" },
   dither_layer = 363,
   temperature = 10,
   humidity = 900,
   fertility = 900,
}

pop_textdomain()
