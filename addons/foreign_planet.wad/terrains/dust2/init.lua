if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_dust2",
   descname = _ "Dust 2",
   is = "unwalkable",
   valid_resources = {},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "dust2.png" },
   dither_layer = 623,
   temperature = 900,
   humidity = 10,
   fertility = 10,
}

pop_textdomain()
