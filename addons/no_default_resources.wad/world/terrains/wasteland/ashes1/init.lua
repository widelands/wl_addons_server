push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "ashes1_dry",
   descname = _ "Ashes 1 (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 401,
   temperature = 120,
   humidity = 150,
   fertility = 900,

   enhancement = { amazons = "hardground3" }
}

pop_textdomain()
