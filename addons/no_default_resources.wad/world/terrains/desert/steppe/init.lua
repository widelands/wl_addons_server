push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "desert_steppe_dry",
   descname = _ "Steppe (dry)",
   is = "arable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = { path.dirname(__file__) .. "idle.png" },
   dither_layer = 362,
   temperature = 155,
   humidity = 500,
   fertility = 500,
}

pop_textdomain()
