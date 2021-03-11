push_textdomain("impassable_water.wad", true)

local pics_dir = path.dirname(__file__)

wl.Descriptions():new_terrain_type{
   name = "water_lily",
   descname = _ "Water Lily",
   editor_category = "summer",
   is = "walkable",
   valid_resources = {"fish"},
   default_resource = "fish",
   default_resource_amount = 4,
   textures = path.list_files(pics_dir .. "water_lily_??.png"),
   dither_layer = 181,
   fps = 14,
   temperature = 100,
   humidity = 1,
   fertility = 1,
}

pop_textdomain()
