push_textdomain("impassable_water.wad", true)

local pics_dir = path.dirname(__file__)
wl.Descriptions():new_terrain_type{
   name = "reef",
   descname = _ "Reef",
   editor_category = "desert",
   is = "walkable",
   valid_resources = {"fish"},
   default_resource = "fish",
   default_resource_amount = 4,
   textures = path.list_files(pics_dir .. "reef_??.png"),
   dither_layer = 201,
   fps = 5,
   temperature = 150,
   humidity = 1,
   fertility = 1,
}

pop_textdomain()
