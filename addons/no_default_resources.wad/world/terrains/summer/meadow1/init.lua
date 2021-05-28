push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "summer_meadow1_dry",
   descname = _ "Meadow 1 (dry)",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,

   textures = { path.dirname(__file__) .. "idle.png" },

   dither_layer = 341,

   temperature = 100,
   humidity = 600,
   fertility = 700,
}

pop_textdomain()
