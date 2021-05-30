push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "hardground2_dry",
   descname = _ "Hard Ground 2 (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 373,
   temperature = 95,
   humidity = 150,
   fertility = 850,
}

pop_textdomain()
