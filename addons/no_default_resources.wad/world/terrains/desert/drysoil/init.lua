push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "drysoil_dry",
   descname = _ "Dry Soil (dry)",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 301,
   temperature = 172,
   humidity = 200,
   fertility = 200,

   enhancement = { amazons = "highmountainmeadow" }
}

pop_textdomain()
