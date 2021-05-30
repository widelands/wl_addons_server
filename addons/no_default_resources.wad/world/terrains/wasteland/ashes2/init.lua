push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "ashes2_dry",
   descname = _ "Ashes 2 (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 411,
   temperature = 118,
   humidity = 130,
   fertility = 999,

   enhancement = { amazons = "hardground1_dry" }
}

pop_textdomain()
