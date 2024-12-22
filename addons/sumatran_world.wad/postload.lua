addon_dirname = path.dirname(__file__)
push_textdomain("sumatran_world.wad", true)

--winter
wl.Descriptions():modify_unit("terrain", "winter_taiga1", "enhancement", "amazons", "meadow")
wl.Descriptions():modify_unit("terrain", "winter_taiga2", "enhancement", "amazons", "summer_meadow4")
wl.Descriptions():modify_unit("terrain", "winter_taiga3", "enhancement", "amazons", "summer_meadow2")
wl.Descriptions():modify_unit("terrain", "tundra_taiga", "enhancement", "amazons", "mountainmeadow")
wl.Descriptions():modify_unit("terrain", "winter_tundra", "enhancement", "amazons", "desert_steppe") -- change in 2.0.0
wl.Descriptions():modify_unit("terrain", "snow", "enhancement", "amazons", "summer_steppe")
wl.Descriptions():modify_unit("terrain", "winter_forested_mountain1", "enhancement", "amazons", "desert_forested_mountain1")
wl.Descriptions():modify_unit("terrain", "winter_forested_mountain2", "enhancement", "amazons", "desert_forested_mountain2")

--wasteland
--ashes2 -> hardground1  default
wl.Descriptions():modify_unit("terrain", "hardlava", "enhancement", "amazons", "ashes1")
wl.Descriptions():modify_unit("terrain", "wasteland_forested_mountain1", "enhancement", "amazons", "desert_forested_mountain1")
wl.Descriptions():modify_unit("terrain", "wasteland_forested_mountain2", "enhancement", "amazons", "desert_forested_mountain2")

--summer
--mountain meadow -> meadow1  default
wl.Descriptions():modify_unit("terrain", "summer_steppe", "enhancement", "amazons", "desert_steppe") -- new in 2.0.0
wl.Descriptions():modify_unit("terrain", "summer_steppe_barren", "enhancement", "amazons", "meadow") -- change in 2.0.0
wl.Descriptions():modify_unit("terrain", "summer_forested_mountain1", "enhancement", "amazons", "desert_forested_mountain1")
wl.Descriptions():modify_unit("terrain", "summer_forested_mountain2", "enhancement", "amazons", "desert_forested_mountain2")

--desert
--high mountain meadow -> mountain meadow  default
--desert4 -> dry soil  default
wl.Descriptions():modify_unit("terrain", "drysoil", "enhancement", "amazons", "meadow") -- change in 2.0.0

-- all mountains -> forested mountains  default

pop_textdomain()
