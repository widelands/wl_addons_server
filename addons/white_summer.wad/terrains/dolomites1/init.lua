if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_dolomites1",
   descname = _"Dolomites 1",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "resource_stones",
   default_resource_amount = 10,
   textures = { terraindir .. "dolomites1.png" },
   dither_layer = 76,
   temperature = 60,
   humidity = 700,
   fertility = 5
}
pop_textdomain()
