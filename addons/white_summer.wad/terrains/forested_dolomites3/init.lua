if wl.Game then egbase = wl.Game() else egbase = wl.Editor() end
world = wl.Descriptions()

push_textdomain("white_summer.wad", true)

terraindir = path.dirname(__file__)


world:new_terrain_type{
   name = "summer_forested_dolomites3",
   descname = _"Forested Dolomites 3",
   is = "mineable",
   valid_resources = {"resource_coal", "resource_iron", "resource_gold", "resource_stones"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { terraindir .. "forested_dolomites3.png" },
   dither_layer = 68,
   temperature = 65,
   humidity = 700,
   fertility = 350
}

pop_textdomain()
