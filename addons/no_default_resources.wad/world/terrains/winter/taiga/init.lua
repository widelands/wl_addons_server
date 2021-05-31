push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "taiga_dry",
   descname = _ "Taiga (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 252,
   temperature = 35,
   humidity = 750,
   fertility = 300,

   enhancement = { amazons = "tundra_taiga_dry" }
}

pop_textdomain()
