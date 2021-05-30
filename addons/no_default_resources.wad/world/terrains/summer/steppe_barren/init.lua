push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "summer_steppe_barren_dry",
   descname = _ "Barren Steppe (dry)",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 321,
   temperature = 100,
   humidity = 150,
   fertility = 150,

   enhancement = { amazons = "summer_steppe" }
}

pop_textdomain()
