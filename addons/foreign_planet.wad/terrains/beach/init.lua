if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_beach",
   descname = _ "Beach",
   is = "walkable",
   valid_resources = {"resource_water"},
   default_resource = "resource_water",
   default_resource_amount = 2,
   textures = { terraindir .. "beach.png" },
   dither_layer = 943,
   temperature = 250,
   humidity = 990,
   fertility = 10,
}

pop_textdomain()
