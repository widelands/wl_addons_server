-- buildings for defendable artifacts

local HEAL_RATE = 200 -- of an artefact, is like in a castle, but lower than in any headquarter


local indir_noslash = path.dirname(__file__):gsub("/$", "")
-- without / for path.basename() not returning ""

local function register_artifact_building(original_name)
    if not wl.Game then
        return -- on save in editor , why??
    end
    local original_descr = wl.Game():get_immovable_description(original_name)
    wl.Descriptions():new_militarysite_type({
        name = original_name .. "_defended",
        descname = original_descr.descname,
        size = original_descr.size,
        -- programs = {},
        animation_directory = path.dirname(original_descr.icon_name), -- works for basic cases
        icon = original_descr.icon_name, -- empty does not work, invalid path aborts help generating
        animations = {
            idle = {
                hotspot = { 14, 20 },
            },
        }, -- TODO copied, not available by api, this value matches for artifact00 to 03
        max_soldiers = 18, -- this is not filled completely by the start condition
        heal_per_second = HEAL_RATE,
        conquers = 2, -- with 0 and 1, it just gets defeated when a border gets close
        vision_range = 2,
        prefer_heroes = false,

        messages = { -- dummy texts, entries are necessary
            occupied = "occupied",
            aggressor = "aggressor",
            attack = "attack",
            defeated_enemy = "defeated_enemy",
            defeated_you = "defeated_you",
        },
        aihints = {},
    })
end

register_artifact_building(path.basename(indir_noslash))

-- The buildings are not added to any tribe. Would only clutter help. It would need each building for each tribe.
-- A depending addon does this when and where required.
