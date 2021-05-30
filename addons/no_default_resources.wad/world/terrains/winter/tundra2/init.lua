push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "tundra2_dry",
   descname = _ "Tundra 2 (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 242,
   temperature = 55,
   humidity = 750,
   fertility = 450,
}

pop_textdomain()
