if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_dolomites2",
   descname = _"Dolomites 2",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "resource_stones",
   default_resource_amount = 10,
   textures = { terraindir .. "dolomites2.png" },
   dither_layer = 77,
   temperature = 65,
   humidity = 800,
   fertility = 5
}
pop_textdomain()
