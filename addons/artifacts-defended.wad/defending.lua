-- starting condition defending artifacts

-- some config
local DEFAULT_DIFFICULTY = 8 -- ~ maximum number of soldiers in an artifact
local NO_COUNTER_ATTACK = true -- is defending only if true
local DEBUG = false

if defending_artifacts then
    -- included an 2nd time
    return
end

local function check_if_artifact_wc_matching()
    do
        return false -- win condition artifacts (from widelands) does not work
    end
    -- old
    local build_id = get_build_id()
    local sep_pos = build_id:find("~git")
    if not sep_pos then -- official release
        return build_id >= "1.2"
    end
    local release_before = build_id:sub(1, sep_pos - 1)
    if release_before > "1.2" then
        return true
    end
    local sep_pos2 = build_id:find(" ")
    local commit_no = tonumber(build_id:sub(sep_pos+4, sep_pos2 - 1))
    return commit_no and commit_no > math.huge -- TODO set to a number if ever a patch is applied
end

local WIN_ARTIFACTS_ADAPTED = false
if check_if_artifact_wc_matching() then
    -- is adapted in widelands itself
    WIN_ARTIFACTS_ADAPTED = true
end

-- TODO what can we do to allow to get artifacts which are not reachable by any warrior?
--     (In a swamp, island) detect when #field.claimers > 1
--     (consider seafaring; maybe reduce capacity and follow one soldier to see if it can go somewhere)
--     if not conquerable: reduce capacity stepwise, tear down after some time?

-- get the interactive player
local function get_interactive_player()
    local gm = wl.Game()
    local plr = gm.players[gm.interactive_player] -- quick, might be wrong
    if not plr or plr.number ~= gm.interactive_player then
        plr = nil -- quick was wrong, not all players are enabled in the game
        for _idx, player in pairs(gm.players) do
            if player.number == gm.interactive_player then
                plr = player
                break
            end
        end
    end
    return plr
end

local function warn(msg, ...)
    -- text_domain is set when this is called
    local warning = _("WARNING")
    if debug_print then
        debug_print.err(warning .. " " .. tostring(msg), ...)
    else
        print(warning, msg, ...)
        local plr = get_interactive_player()
        if plr then
            local args = ""
            for _i, arg in pairs({...}) do
                args = args .. tostring(arg) .. " "
            end
            local opts = { icon = "images/wui/buildings/normal_priority_button.png", popup = false }
            plr:send_to_inbox(warning .. " " .. tostring(msg), args, opts)
        end
    end
end

local function dbg_null()
    -- just discards all arguments
end

local dbg = dbg_null
if DEBUG then -- debug
    include "addons/debug-print.wad/debug_print.lua" -- for debugging only
    dbg = debug_print
end

-- constant
local DEFENDER_TEAM = 81

-- Ideas: how to do that artifacts win condition is not automatically won by defending player?
--      local all_found is set if all artifacts have an owner. Difficult to avoid totally.
--      monkey-patch global check_player_defeated() and write win_conditions__initially_without_warehouse for defending_player
--      maybe only "arm" artifact if a player builds close (visible for him and ...) but then manage check_player_defeated()
--      if wl.Game().win_condition  == "artifacts"
--      plr:sees_field(art_field) and check_buildings(art_field.region(range)) -- with range big enough artifact does not get conquered
--      field:claimers() not helpful, as it will be owned then
--      PROBLEMS:
--      - if defending_player gets all artifacts in the beginning, he wins "artifacts" (not to avoid) (fine for other conditions)
--          - and artifacts get visible on the map
--      - if defending_player gets an artifact always before it can get claimed, ...
--          - he can win when several ones get close at the same time
--          - game ends when he gets the last building (with him getting at least one point)
--      => win condition artifacts needs adaptation => copy it in an extension
--      => putting soldiers in artifacts late is an advantage anyway

-- .. function prepare_tribe(tribe_descr)
--
--    prepares the tribe with the buildings to defend artifacts
local function prepare_tribe(tribe_descr)
    local tribe_name = tribe_descr.name
    local wl_descr = wl.Descriptions()

    push_textdomain("artifacts-defended.wad", true)
    local help_texts = { helptexts = { lore = " ", purpose = _("to conquer") } }
    pop_textdomain()
    for i = 0,3 do -- artifact00_defended ...
        local artifact_building_name = ("artifact%02d_defended"):format(i)
        if not tribe_descr:has_building(artifact_building_name) then
            -- could set helptext from original: artifact_type:helptexts(tribe_name)
            local no_err, err_msg = pcall(function()
                wl_descr:modify_unit("tribe", tribe_name, "add_building", artifact_building_name, help_texts)
            end)
            if not no_err then
                -- extend the error description
                push_textdomain("artifacts-defended.wad", true)
                local title = _("Could not adapt the tribe.")
                pop_textdomain()
                error(title .. " " .. err_msg)
            end
        end
    end
end

local function prepare_player(defending_player)
    defending_player.hidden_from_general_statistics = true
    if wc_artifacts_extendable and wc_artifacts_extendable.exclude_from_winning then
        -- is set by the addon from init script, so only when active
        wc_artifacts_extendable.exclude_from_winning(defending_player)
    end
    if defending_player.team > 0 then
        push_textdomain("artifacts-defended.wad", true)
        warn(_("Defending player can not be in a team, remove."))
        pop_textdomain()
    end
    defending_player.team = DEFENDER_TEAM -- mark as defending player
    -- defending_player:forbid_buildings("all")
    for _idx, player in pairs(wl.Game().players) do
        defending_player:set_attack_forbidden(player.number, NO_COUNTER_ATTACK) -- defending only?
        player:set_attack_forbidden(defending_player.number, false) -- attackable by all (in case of peaceful mode)
    end
end

-- TODO maybe make global to allow replacing the function by an other addon
local function get_soldiers_to_defend_artifacts(defending_player)
    local difficulty = DEFAULT_DIFFICULTY
    if defending_player.ai_type then
        -- could set difficulty if ai_type gets implemented
        if defending_player.ai_type == "empty" then
            difficulty = DEFAULT_DIFFICULTY
        elseif defending_player.ai_type == "very_weak" then
            difficulty = DEFAULT_DIFFICULTY // 2
        elseif defending_player.ai_type == "weak" then
            difficulty = DEFAULT_DIFFICULTY * 0.75 // 1
        elseif defending_player.ai_type == "normal" then
            difficulty = DEFAULT_DIFFICULTY * 1.8 // 1
        -- "random" should be resolved before
        end
        -- BUT actually it might be best to set the ai to empty to prevent him to send away the soldiers
    end
    local soldiers = {}
    local num_levels = {}
    local sld_descr = wl.Game():get_worker_description(defending_player.tribe.soldier)
     -- get levels from tribe:
    local max_levels = { sld_descr.max_health_level, sld_descr.max_attack_level,
        sld_descr.max_defense_level, sld_descr.max_evade_level }
    -- min_levels = { sld_descr.min_health_level, sld_descr.min_attack_level,
    --     sld_descr.min_defense_level, sld_descr.min_evade_level } -- all 0 always
    -- TODO maybe random strength depending on difficulty
    for _i = 1,math.random(math.max(1, difficulty//5), difficulty) do
        local new_soldier = "" -- with string, because tables as key get each a separate entry
        local key = {}
        for _j, max in ipairs(max_levels) do
            local level = math.random(0, max)
            new_soldier = new_soldier .. ("%d "):format(level)
            table.insert(key, level)
        end
        soldiers[new_soldier] = (soldiers[new_soldier] or 0) + 1
        num_levels[new_soldier] = key
    end
    local add_soldiers = {}
    for str_key, count in pairs(soldiers) do
        local num_key = num_levels[str_key]
        add_soldiers[num_key] = count
    end
    return add_soldiers
end

local defended_artifact_fields_by_p = {} -- stores the arifacts fields, to be able to replace them

-- adapts an artifact and puts soldiers within
local function soldiers_for_one_artifact(defending_player, field)
    local defended_artifact_fields = defended_artifact_fields_by_p[defending_player.number]
    if field.immovable and field.immovable:has_attribute("artifact") and not field.immovable.set_soldiers then
        -- is still a normal artifact
        local old_name = field.immovable.descr.name
        local new_name = old_name .. "_defended"
        if not defending_player.tribe:has_building(new_name) and wl.Game():get_building_description(new_name) then
            prepare_tribe(defending_player.tribe) -- repeat, seems to forget -- which raises a general error
            dbg(("prepared tribe %s again for defending"):bformat(defending_player.tribe.name), tostring(player))
        end
        if defending_player.tribe:has_building(new_name) then
            field.immovable:remove()
            local no_err, new_building = pcall(function()
                local FORCE_PLACE = true
                -- still failed hard if done while human player was selecting start position:
                return defending_player:place_building(new_name, field, false, FORCE_PLACE)
            end)
            if no_err and new_building then
                local to_set = get_soldiers_to_defend_artifacts(defending_player)
                new_building:set_soldiers(to_set)
                defended_artifact_fields[field].defending = true
            else
                if not no_err then
                    push_textdomain("artifacts-defended.wad", true)
                    warn(_("ERROR placing building"), new_building, field)
                    pop_textdomain()
                end
                wl.Game().map:place_immovable(old_name, field) -- put artifact back
            end
        else
            push_textdomain("artifacts-defended.wad", true)
            warn(_("No matching artifact building named %s"):bformat(new_name), defending_player, field.immovable)
            pop_textdomain()
            defended_artifact_fields[field] = nil -- do not try again
        end
    else
        push_textdomain("artifacts-defended.wad", true)
        warn(_("wrong field found"), field, field.immovable)
        pop_textdomain()
        defended_artifact_fields[field] = nil -- do not try again
    end
end

-- prepares all artifacts to be defended (later, when the player builds close)
local function register_artifacts(defending_player)
    local first_player = next(defended_artifact_fields_by_p) == nil
    local defended_artifact_fields = defended_artifact_fields_by_p[defending_player.number]
    if not defended_artifact_fields then
        defended_artifact_fields = {}
        defended_artifact_fields_by_p[defending_player.number] = defended_artifact_fields
    end
    local map = wl.Game().map
    for x = 0, map.width-1 do
        for y = 0, map.height-1 do -- for all fields
            local field = map:get_field(x,y)
            if field.immovable and field.immovable:has_attribute("artifact") and
                field.immovable.fields[1] == field
            then
                defended_artifact_fields[field] = {d_name = field.immovable.descr.name}
                -- happens later: soldiers_for_one_artifact()
            end
        end
    end
    if not next(defended_artifact_fields) then
        local plr = get_interactive_player()
        if plr then
            push_textdomain("artifacts-defended.wad", true)
            local msg = _("The player %s has no artifacts to defend."):bformat(tostring(defending_player))
            local opts = { icon = "images/wui/buildings/low_priority_button.png", popup = true }
            plr:send_to_inbox(_("No artifacts"), msg, opts)
            pop_textdomain()
        end
    elseif first_player then
        dbg("artifact fields", defended_artifact_fields, next(defended_artifact_fields))
    end
end

-- put normal artifact back in its place
local function place_normal_artifact(field, artifact_name, dbg_msg, defending_player)
    local map = wl.Game().map
    local was_immovable = field.immovable and field.immovable.descr.name

    if field.immovable and field.immovable.flag then
        -- artifact military building
        field.immovable.flag:remove()
    elseif field.immovable then
        -- destroyed building (probably)
        field.immovable:remove()
        -- a potential still existing flag does not hurt
    end
    local no_err, new = pcall(function()
        return map:place_immovable(artifact_name, field)
    end)
    if not no_err or not new then
        push_textdomain("artifacts-defended.wad", true)
        warn(_("could not place normal artifact (1x)"), artifact_name, new)
        pop_textdomain()
        -- tries again next time
    else
        local defended_artifact_fields = defended_artifact_fields_by_p[defending_player.number]
        defended_artifact_fields[field] = nil
        if dbg_msg then dbg(dbg_msg, field, was_immovable, tostring(defending_player)) end
    end
end

local function all_start_pos_selected()
    for _i, plr in pairs(wl.Game().players) do
        if plr.see_all then
            return false
        end
    end
    return true
end

local function add_soldiers_if_needed(defending_player, field)
    if field.owner and field.owner.team ~= DEFENDER_TEAM then
        -- a player owns an artifact which was never defended
        soldiers_for_one_artifact(defending_player, field)
        return -- quit, artefact is ready
    end
    -- checks:
    -- - if any field owned (in ring region(MAX_CONQUER, MAX_CONQUER - 1)
    --   - if any military site near (1x for all fields in region)
    local MAX_CONQUER = 12 -- of a castle
    local any_near = false
    -- check ring region for land owner
    for _i, near in pairs(field:region(MAX_CONQUER, MAX_CONQUER - 1)) do
        if near.owner and near.owner.team ~= DEFENDER_TEAM then
            any_near = true
            break
        end
    end
    if any_near then
        for dist = 3, MAX_CONQUER do
            -- check in concentric ranges to know distance
            for _i, near in pairs(field:region(dist, dist - 1)) do
                if near.immovable and near.immovable.set_soldiers and -- a military site
                    near.immovable.owner.team ~= DEFENDER_TEAM and -- but not of any defenders
                    near.immovable.descr.vision_range >= dist -- within its vision range
                then
                    -- a (non_defending) players military site is near (in its vision range)
                    soldiers_for_one_artifact(defending_player, field)
                    return -- quit, artefact is ready
                end
            end -- for _i, near
        end -- for dist
    end
end

local function defend_thread(defending_player)
    register_artifacts(defending_player)
    sleep(51 + defending_player.number) -- let win condition detect artifacts and other defenders register
    if next(defended_artifact_fields_by_p) == defending_player.number and -- first defender
        next(defended_artifact_fields_by_p, defending_player.number) -- and there are more
    then -- => report this once
        local defenders = ""
        local game = wl.Game()
        for _idx, player in pairs(wl.Game().players) do
            if defended_artifact_fields_by_p[player.number] then
                defenders = defenders .. tostring(player) .. " "
            end
        end
        push_textdomain("artifacts-defended.wad", true)
        warn(_("Several players configured for defending:"), defenders)
        pop_textdomain()
    end
    while not all_start_pos_selected() do
        sleep(432)
        -- because placing artifactXX_defended failed hard while selecting
    end
    sleep(319) -- some extra time after selecting
    local defended_artifact_fields = defended_artifact_fields_by_p[defending_player.number]
    while next(defended_artifact_fields) do
        defending_player.team = DEFENDER_TEAM -- in case player has reset its team
        -- check of team members unnecessary, joining him is not possible (because of hidden player)
        for field, a_info in pairs(defended_artifact_fields) do
            local orig_name = a_info.d_name
            if not field.immovable and a_info.defending then
                -- should not happen normally, only if retrying, which usually does not happen
                place_normal_artifact(field, orig_name, "defeated, retried", defending_player)
            elseif not field.immovable then
                -- artifact was removed because of another near artifact, defend later
            elseif not field.immovable.set_soldiers then
                if field.immovable.descr.name == "destroyed_building" and a_info.defending then
                    -- ashes after 30s, so sees this
                    place_normal_artifact(field, orig_name, "defeated, destroyed", defending_player)
                elseif field.immovable:has_attribute("artifact") then
                    add_soldiers_if_needed(defending_player, field)
                elseif field.immovable.descr.name == "flag" then
                    -- flag of defended artifact, ignore, defend later
                elseif field.immovable.descr.name:sub(1, 6) ~= "empty_" then
                    dbg("??defeated??, strange building, ignore", field.immovable.descr.name, field)
                end
            elseif field.owner.team ~= DEFENDER_TEAM and a_info.defending then
                -- defeated and taken over
                place_normal_artifact(field, orig_name, "defeated, other owner", defending_player)
            elseif not next(field.immovable:get_soldiers("all")) and a_info.defending then
                -- soldiers defeated
                place_normal_artifact(field, orig_name, "defeated, no soldier", defending_player)
            end
        end
        sleep(1346)
    end -- while
    defending_player.team = 0 -- because player will be shown in win list
    dbg("DONE, all defenders defeated", tostring(defending_player))
end

push_textdomain("artifacts-defended.wad", true)

local artifacts_adapt_instruction = ""
local artifacts_wc_incompatible = nil
if not WIN_ARTIFACTS_ADAPTED then
    artifacts_wc_incompatible = "scripting/win_conditions/artifacts.lua"
end

-- for the calling tribe script:
defending_artifacts = {
    ret = {
        -- TRANSLATORS: This is the name of a starting condition
        descname = _("This (ai) player will defend the artifacts."),
        -- TRANSLATORS: This is the tooltip for the starting condition
        tooltip = _("Set the tribe to random for finding out in game what it will be.") .. "<br>" ..
            _("Only for ai player as nothing can be done.") .. "\n" ..
            _("Recommended to set AI to \"empty\" to prevent soldiers being sent away.") .. "<br>" ..
            _("On maps with artifacts not reachable by a warrior, some artifacts will not be conquerable.") ..
            artifacts_adapt_instruction,
        -- above adds a short description about adapting artifacts wc if not done yet
        incompatible_wc = {artifacts_wc_incompatible},
        -- above makes win condition artifacts incompatible if it was not adapted
        uses_map_starting_position = false,

        func = function(player, shared_in_start)
            if shared_in_start then
                push_textdomain("artifacts-defended.wad", true)
                warn(_("Player %s defends artifacts and has aditionally another start position"))
                pop_textdomain()
            end
            prepare_tribe(player.tribe)
            prepare_player(player)
            run(defend_thread, player)
        end,
    },
}

pop_textdomain()
