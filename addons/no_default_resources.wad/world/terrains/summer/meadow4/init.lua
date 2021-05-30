push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "summer_meadow4_dry",
   descname = _ "Meadow 4 (dry)",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 356,
   temperature = 110,
   humidity = 650,
   fertility = 750,
}

pop_textdomain()
