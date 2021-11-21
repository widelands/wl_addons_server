if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_dust1",
   descname = _ "Dust 1",
   is = "walkable",
   valid_resources = {},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "dust1.png" },
   dither_layer = 23,
   temperature = 900,
   humidity = 10,
   fertility = 10,
}

pop_textdomain()
