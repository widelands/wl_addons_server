if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)

world:new_terrain_type{
   name = "summer_forested_dolomites2",
   descname = _"Forested Dolomites 2",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "forested_dolomites2.png" },
   dither_layer = 67,
   temperature = 45,
   humidity = 750,
   fertility = 450,
}

pop_textdomain()
