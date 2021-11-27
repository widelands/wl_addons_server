if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_water2",
   descname = _ "Water 2",
   is = "water",
   valid_resources = {"resource_fish"},
   default_resource = "",
   default_resource_amount = 0,
   textures = path.list_files(terraindir .. "water2_??.png"),
   dither_layer = 13,
   fps = 14,
   temperature = 500,
   humidity = 999,
   fertility = 1,
}

pop_textdomain()
