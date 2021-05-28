push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "meadow_dry",
   descname = _ "Meadow (dry)",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 311,
   temperature = 160,
   humidity = 600,
   fertility = 600,
}

pop_textdomain()
