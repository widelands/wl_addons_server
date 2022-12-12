push_textdomain("simple_map_generator.wad", true)
local egbase = wl.Game and wl.Game() or wl.Editor()
local map = egbase.map
egbase:set_loading_message(_("Initializing map generator…"))

math.randomseed(kRandomNumber)

local terrains = {
	summer = {
		water = {{"summer_water"}},
		land = {{"summer_steppe_barren"}, {"summer_steppe"}, {"summer_mountain_meadow", "summer_meadow1"}, {"summer_meadow2", "summer_meadow3", "summer_meadow4"}},
		wasteland = {{"summer_snow"}, {"lava"}, {"summer_beach", "summer_swamp"}},
		mountain = {{"summer_mountain1", "summer_mountain2", "summer_mountain3", "summer_mountain4"}, {"summer_forested_mountain1", "summer_forested_mountain2"}},
	},
	winter = {
		water = {{"winter_water"}, {"ice_floes", "ice_floes2"}},
		land = {{"tundra_taiga", "snow", "winter_tundra"}, {"winter_taiga1", "winter_taiga2", "winter_taiga3"}},
		wasteland = {{"ice", "winter_beach"}},
		mountain = {{"winter_mountain1", "winter_mountain2"}, {"winter_mountain3", "winter_mountain4"}, {"winter_forested_mountain1", "winter_forested_mountain2"}},
	},
	wasteland = {
		water = {{"wasteland_water"}},
		land = {{"ashes1", "ashes2"}, {"hardground1", "hardground2", "hardground3", "hardground1"}, {"hardlava"}},
		wasteland = {{"wasteland_beach"}, {"lava-stone1", "lava-stone2"}},
		mountain = {{"wasteland_mountain1", "wasteland_mountain2", "wasteland_mountain3", "wasteland_mountain4"}, {"wasteland_forested_mountain1", "wasteland_forested_mountain2"}},
	},
	desert = {
		water = {{"desert_water"}},
		land = {{"highmountainmeadow", "mountainmeadow", "meadow", "desert_steppe"}, {"drysoil", "desert4"}},
		wasteland = {{"desert_beach", "desert1", "desert2", "desert3"}},
		mountain = {{"desert_forested_mountain1", "desert_forested_mountain2"}, {"mountain1", "mountain2"}, {"mountain3", "mountain4"}},
	},
}
terrains = terrains[kClimate]

local rocks = {
	summer = {
		"greenland_rocks1", "greenland_rocks2", "greenland_rocks3", "greenland_rocks4", "greenland_rocks5", "greenland_rocks6"
	},
	winter = {
		"winterland_rocks1", "winterland_rocks2", "winterland_rocks3", "winterland_rocks4", "winterland_rocks5", "winterland_rocks6"
	},
	wasteland = {
		"blackland_rocks1", "blackland_rocks2", "blackland_rocks3", "blackland_rocks4", "blackland_rocks5", "blackland_rocks6"
	},
	desert = {
		"desert_rocks1", "desert_rocks2", "desert_rocks3", "desert_rocks4", "desert_rocks5", "desert_rocks6"
	},
}
rocks = rocks[kClimate]

local trees_species = {
	summer = {
		"alder_summer", "aspen_summer", "beech_summer", "birch_summer", "maple_winter", "oak_summer", "rowan_summer"
	},
	winter = {
		"larch_summer", "spruce_summer"
	},
	wasteland = {
		"cirrus_wasteland", "liana_wasteland", "mushroom_dark_wasteland", "mushroom_green_wasteland", "mushroom_red_wasteland", "twine_wasteland", "umbrella_green_wasteland", "umbrella_red_wasteland"
	},
	desert = {
		"palm_borassus_desert", "palm_coconut_desert", "palm_date_desert", "palm_oil_desert", "palm_roystonea_desert"
	},
}
local trees = {}
for i,t in ipairs(trees_species[kClimate]) do
	table.insert(trees, t .. "_sapling")
	table.insert(trees, t .. "_pole")
	table.insert(trees, t .. "_mature")
	table.insert(trees, t .. "_old")
end


local misc_immos = {
	summer = {
		"standing_stone1_summer", "standing_stone2_summer", "standing_stone3_summer", "standing_stone4_summer", "standing_stone5_summer",
		"bush1", "bush2", "bush3", "bush4", "bush5", "grass1", "grass2", "grass3", "bar-ruin00", "bar-ruin01", "bar-ruin02", "bar-ruin03"
	},
	winter = {
		"standing_stone1_winter", "standing_stone2_winter", "standing_stone3_winter", "standing_stone4_winter", "standing_stone5_winter",
		"snowman", "track_winter", "pebble1", "pebble2", "pebble3", "pebble4", "pebble5", "pebble6", "standing_stone6"
	},
	wasteland = {
		"standing_stone1_wasteland", "standing_stone2_wasteland", "standing_stone3_wasteland", "standing_stone4_wasteland", "standing_stone5_wasteland",
		"skeleton1", "skeleton2", "skeleton3", "skeleton4", "ruin1", "ruin2", "ruin3", "ruin4", "ruin5", "mushroom1", "mushroom2"
	},
	desert = {
		"standing_stone1_desert", "standing_stone2_desert", "standing_stone3_desert", "standing_stone4_desert", "standing_stone5_desert",
		"cactus1", "cactus2", "cactus3", "cactus4", "debris00", "debris01", "debris02", "standing_stone7"
	},
}
misc_immos = misc_immos[kClimate]
table.insert(misc_immos, "artifact00")
table.insert(misc_immos, "artifact01")
table.insert(misc_immos, "artifact02")
table.insert(misc_immos, "artifact03")

local resources = {
	resource_coal = 40,
	resource_iron = 30,
	resource_gold = 10,
	resource_stones = 20,
}
local total_resources_proportions = 0
for _,p in pairs(resources) do total_resources_proportions = total_resources_proportions + p end

local heights = {
	water = {1, 1},
	land = {2, 5},
	wasteland = {2, 7},
	mountain = {5, 16},
}

local featuresize = 4
local xf = map.width  / featuresize
local yf = map.height / featuresize

local feature, f, r, immo_list, density, resource
for x = 1, xf do
	for y = 1, yf do
		egbase:set_loading_message(_("Generating map… (%1$d / %2$d)"):bformat((x - 1) * yf + y - 1, xf * yf))

		resource = nil
		if (kIslandMode and (x == 1 or x == xf or y == 1 or y == yf)) or math.random(100) < kWater then
			feature = "water"
			resource = "resource_fish"
		elseif math.random(100) < kWasteland then
			feature = "wasteland"
		elseif math.random(100) < kLand then
			feature = "land"
			resource = "resource_water"
		else
			feature = "mountain"
			r = math.random(total_resources_proportions)
			for res,p in pairs(resources) do
				if r <= p then
					resource = res
					break
				else
					r = r - p
				end
			end
		end

		if math.random(0, 2) > kResourceAmount then resource = nil end

		local height_range = heights[feature]
		local terrain_range = terrains[feature]
		terrain_range = terrain_range[math.random(#terrain_range)]

		immo_list = nil
		if feature ~= "water" then
			if math.random(0, 3) < kResourceAmount + 1 then
				r = math.random(3)
				if r == 1 then
					immo_list = rocks
					density = math.random(kResourceAmount + 1)
				elseif r == 2 then
					immo_list = trees
					density = math.random(kResourceAmount + 1)
				else
					immo_list = misc_immos
					density = math.random(5, 30)
				end
			else
				immo_list = misc_immos
				density = math.random(10, 50)
			end
		end

		for i = 1, featuresize do
			for j = 1, featuresize do
				f = map:get_field(x * featuresize - i, y * featuresize - j)

				f.terr = terrain_range[math.random(#terrain_range)]
				f.terd = terrain_range[math.random(#terrain_range)]
				f.raw_height = math.random(height_range[1], height_range[2])

				if immo_list ~= nil and math.random(density) == 1 then
					map:place_immovable(immo_list[math.random(#immo_list)], f)
				end

				if resource ~= nil then
					f.resource = resource
					f.initial_resource_amount = math.random(20 * (kResourceAmount + 1) // 3)
				end
			end
		end
	end
end

egbase:set_loading_message(_("Finalizing map…"))

map:recalculate()

map.waterway_max_length = math.random(20)
local nplayers = #map.player_slots
for p = 1, nplayers do
	map.player_slots[p].tribe_name = ""  -- random tribe
	map.player_slots[p].name = _("Random Player %u"):bformat(p)

	local section = xf * yf * (p - 1) // nplayers
	local y = section // xf
	local x = section % xf
	local f = map:get_field(x * featuresize, y * featuresize)

	local radius = 0
	repeat
		local fields = f:region(radius + featuresize, radius)
		for i,field in pairs(fields) do
			if field:has_caps("big") then
				map.player_slots[p].starting_field = field
				radius = nil
				break
			end
		end
		if radius ~= nil then radius = radius + featuresize end
	until radius == nil
end

pop_textdomain()
