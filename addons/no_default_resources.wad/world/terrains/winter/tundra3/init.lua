push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "tundra3_dry",
   descname = _ "Tundra 3 (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 243,
   temperature = 50,
   humidity = 800,
   fertility = 400,
}

pop_textdomain()
