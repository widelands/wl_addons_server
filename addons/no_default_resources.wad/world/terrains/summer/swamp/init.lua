push_textdomain("no_default_resources.wad", true)

wl.Descriptions():new_terrain_type{
   name = "summer_swamp_dry",
   descname = _ "Swamp (dry)",
   is = "unwalkable",
   valid_resources = {"resource_water"},
   default_resource = "",
   default_resource_amount = 0,
   textures = path.list_files(path.dirname(__file__) .. "swamp_??.png"),
   dither_layer = 372,
   fps = 14,
   temperature = 105,
   humidity = 999,
   fertility = 100,
}

pop_textdomain()
