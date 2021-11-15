if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_mountain3",
   descname = _ "Mountain 3",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "mountain3.png" },
   dither_layer = 433,
   temperature = 10,
   humidity = 50,
   fertility = 500,
}

pop_textdomain()
