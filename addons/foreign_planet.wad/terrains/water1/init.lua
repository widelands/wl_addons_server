if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("foreign_planet.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type {
   name = "foreignplanet_water1",
   descname = _ "Water 1",
   is = "water",
   valid_resources = {"resource_fish"},
   default_resource = "resource_fish",
   default_resource_amount = 4,
   textures = path.list_files(terraindir .. "water1_??.png"),
   dither_layer = 683,
   fps = 14,
   temperature = 50,
   humidity = 999,
   fertility = 1,
}

pop_textdomain()
