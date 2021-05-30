push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "hardground3_dry",
   descname = _ "Hard Ground 3 (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 381,
   temperature = 105,
   humidity = 200,
   fertility = 900,
}

pop_textdomain()
