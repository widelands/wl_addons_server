push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "hardground4_dry",
   descname = _ "Hard Ground 4 (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 391,
   temperature = 90,
   humidity = 200,
   fertility = 800,
}

pop_textdomain()
