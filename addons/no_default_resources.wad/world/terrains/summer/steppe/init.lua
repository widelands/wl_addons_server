push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "summer_steppe_dry",
   descname = _ "Steppe (dry)",
   is = "arable",
   valid_resources = { "resource_water" },
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 331,
   temperature = 100,
   humidity = 400,
   fertility = 400,

   enhancement = { amazons = "summer_mountain_meadow" }
}

pop_textdomain()
