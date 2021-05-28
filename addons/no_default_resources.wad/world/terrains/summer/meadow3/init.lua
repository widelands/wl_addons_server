push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "summer_meadow3_dry",
   descname = _ "Meadow 3 (dry)",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 355,
   temperature = 105,
   humidity = 550,
   fertility = 800,
}

pop_textdomain()
