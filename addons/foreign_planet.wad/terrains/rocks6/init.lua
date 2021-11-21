if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_rocks6",
   descname = _ "Rocks 6",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "rocks6.png" },
   dither_layer = 443,
   temperature = 500,
   humidity = 500,
   fertility = 500,
}

pop_textdomain()
