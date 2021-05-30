push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "tundra_taiga_dry",
   descname = _ "Tundra Taiga (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 233,
   temperature = 40,
   humidity = 750,
   fertility = 400,

   enhancement = { amazons = "tundra2_dry" }
}

pop_textdomain()
